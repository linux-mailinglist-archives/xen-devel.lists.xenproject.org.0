Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD11B2340C4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 10:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Q2R-0002hQ-3j; Fri, 31 Jul 2020 08:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Q2P-0002hL-I6
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 08:05:09 +0000
X-Inumbo-ID: 8c1f8cba-d304-11ea-8e14-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c1f8cba-d304-11ea-8e14-bc764e2007e4;
 Fri, 31 Jul 2020 08:05:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5A91AD2C;
 Fri, 31 Jul 2020 08:05:20 +0000 (UTC)
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
 <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
 <20200728090618.GZ7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32c79b37-a93c-7a72-7c0f-753cf603adfb@suse.com>
Date: Fri, 31 Jul 2020 10:05:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728090618.GZ7191@Air-de-Roger>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 11:06, Roger Pau Monné wrote:
> On Mon, Jul 27, 2020 at 09:47:52PM +0200, Jan Beulich wrote:
>> On 27.07.2020 16:55, Roger Pau Monné wrote:
>>> On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/asm-x86/asm-defns.h
>>>
>>> Maybe this could be asm-insn.h or a different name? I find it
>>> confusing to have asm-defns.h and an asm_defs.h.
>>
>> While indeed I anticipated a reply to this effect, I don't consider
>> asm-insn.h or asm-macros.h suitable: We don't want to limit this
>> header to a more narrow purpose than "all sorts of definition", I
>> don't think. Hence I chose that name despite its similarity to the
>> C header's one.
> 
> I think it's confusing, but I also think the whole magic we do with
> asm includes is already confusing (me), so if you and Andrew agree
> this is the best name I'm certainly fine with it. FWIW:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Please quote the clac/stac instructions in order to match the other
> usages of ALTERNATIVE.

We're not consistently quoting when there's just a single word, see
in particular spec_ctrl_asm.h. And thinking about it again I also
don't see why we would want or need to enforce quotation when none
is needed. Therefore both here and in patch 2 I'll keep (or make,
when I touch a line anyway) things consistently unquoted where no
quotes are needed. Please let me know if your R-b holds without the
requested adjustment.

Jan

