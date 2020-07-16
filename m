Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63CC222046
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:07:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw0mN-00043P-PO; Thu, 16 Jul 2020 10:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jw0mM-00043K-Gh
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:06:14 +0000
X-Inumbo-ID: fa918f08-c74b-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa918f08-c74b-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 10:06:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D9B3B69F;
 Thu, 16 Jul 2020 10:06:16 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
Date: Thu, 16 Jul 2020 12:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715145144.GA7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 16:51, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 03:51:17PM +0200, Jan Beulich wrote:
>> On 15.07.2020 15:32, Roger Pau Monné wrote:
>>> Feel free to change to ACCESS_ONCE or barrier if you think it's
>>> clearer.
>>
>> I did so (also on the writer side), not the least based on guessing
>> what Andrew would presumably have preferred.
> 
> Thanks! Sorry I might be pedantic, but is the ACCESS_ONCE on the write
> side actually required? I'm not sure I see what ACCESS_ONCE protects
> against in handle_rtc_once.

Well, this is all sort of a mess, I think. We have this mixture of
ACCESS_ONCE() and read_atomic() / write_atomic(), but I don't think
we use them consistently, and I'm not sure either is suitable to
deal with all (theoretical) corner cases.

read_atomic() / write_atomic() guarantee a single insn to be used
to access a piece of data. I'm uncertain whether they also guarantee
single access (i.e. that the compiler won't replicate the asm()-s).
The wording in gcc doc is pretty precise, but not quite enough imo
to be entirely certain.

ACCESS_ONCE() guarantees single access, but doesn't guarantee that
the compiler wouldn't split this single access into multiple insns.
(It's just, like elsewhere, that it would be pretty silly of it if
it did.)

Yesterday, as said, I tried to in particular do what I expect/guess
Andrew would have wanted done. This is despite me not being entirely
convinced this is the right thing to do here, i.e. personally I
would have preferred read_atomic() / write_atomic(), as I think the
intention of what the gcc doc is saying is what we want (taking
into consideration both uses of "volatile" in these helpers).

Jan

