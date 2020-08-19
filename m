Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733A24993A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 11:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8KIY-0003s8-Eh; Wed, 19 Aug 2020 09:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8KIW-0003s3-JD
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 09:22:20 +0000
X-Inumbo-ID: 595ac4ee-0e08-4ec5-93fc-12f16adf939b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 595ac4ee-0e08-4ec5-93fc-12f16adf939b;
 Wed, 19 Aug 2020 09:22:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A844FAE17;
 Wed, 19 Aug 2020 09:22:43 +0000 (UTC)
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
 <20200817114730.GB828@Air-de-Roger>
 <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fc30c51-9a7b-6421-ecdf-dbdbb76480f7@suse.com>
Date: Wed, 19 Aug 2020 11:22:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.08.2020 15:03, Julien Grall wrote:
> On 17/08/2020 12:50, Roger Pau Monné wrote:
>> On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
>>> The only way I could see to make it work would be to use the same trick as
>>> we do for {read, write}_atomic() (see asm-arm/atomic.h). We are using union
>>> and void pointer to prevent explicit cast.
>>
>> I'm mostly worried about common code having assumed that cmpxchg
>> does also handle 64bit sized parameters, and thus failing to use
>> cmpxchg64 when required. I assume this is not much of a deal as then
>> the Arm 32 build would fail, so it should be fairly easy to catch
>> those.
> FWIW, this is not very different to the existing approach. If one would 
> use cmpxchg() with 64-bit, then it would fail to compile.

A somewhat related question then: Do you really need both the
guest_* and the non-guest variants? Limiting things to plain
cmpxchg() would further reduce the risk of someone picking the
wrong one without right away noticing the build issue on Arm32.
For guest_cmpxchg{,64}() I think there's less of a risk.

Jan

