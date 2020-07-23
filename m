Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E789B22ABDF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 11:41:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyXiU-0002yM-Kw; Thu, 23 Jul 2020 09:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyXiS-0002yH-PD
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 09:40:40 +0000
X-Inumbo-ID: 91656860-ccc8-11ea-a271-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91656860-ccc8-11ea-a271-12813bfff9fa;
 Thu, 23 Jul 2020 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595497241;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sWR6v3YmxJDTEcYe4oLHOI434b0aPK1j5k3mIryJvY8=;
 b=fE8ivjykTIe8QEPKE4QHUUMGFLu8a4I9sXVeSHA8FpT/p7ZujgX/162K
 N8MVsiZclZ/szBckrrhaBN9WnvV2hoESLCABU45FxVLuurZ/qYwntLWDZ
 Jr6e7KZcjyHp8TwxylpOc4zWFt4lXDZ+PBSv+kn7AnH7yCNNLS3MYnySF U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: L9WZog4wf6i+XamkX28E32Tv+Ot8sBcUHjERZnc0jjB9ZvK2VHAMD4a/YMfSM1zrq4t8JscCDE
 mds309gp1QPlbiXfkVBeG1+QxuD9eMmYRV17iFBhEimKsPVi0KxSFbAtvoGivZ28bfpYXeaX9B
 iVqoo2tdWoqZU7hfZh3YdmNL/jP/aHURVk1BnTJco9ZASVxK8aLR7qbMIVG1L5JkKnR2K9u/9/
 rhxyYpGOA0XmNx8GxRL1n6rk0H0H2h4D+JRPOzAFnYILYqxY9a0XjnjuYppXULMiTtDnTRZlx5
 Qmc=
X-SBRS: 2.7
X-MesageID: 23019286
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23019286"
Subject: Re: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
To: Jan Beulich <jbeulich@suse.com>
References: <20200722151548.4000-1-andrew.cooper3@citrix.com>
 <07ecb7dd-c823-0c6a-2bcd-7fc22471af7a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <822f6c64-0e63-1199-63b0-f27449fd79c6@citrix.com>
Date: Thu, 23 Jul 2020 10:40:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07ecb7dd-c823-0c6a-2bcd-7fc22471af7a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/07/2020 17:13, Jan Beulich wrote:
> On 22.07.2020 17:15, Andrew Cooper wrote:
>>  * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
>>    lower levels.
>>  * Use DIV_ROUND_UP() rather than opencoding it in several different ways
>>  * The hypercall input is capped at uint32_t, so there is no need for
>>    nr_frames to be unsigned long in the lower levels.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I'd like to note though that ...
>
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -58,16 +58,16 @@
>>  
>>  int hap_track_dirty_vram(struct domain *d,
>>                           unsigned long begin_pfn,
>> -                         unsigned long nr,
>> +                         unsigned int nr_frames,
>>                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
>>  {
>>      long rc = 0;
>>      struct sh_dirty_vram *dirty_vram;
>>      uint8_t *dirty_bitmap = NULL;
>>  
>> -    if ( nr )
>> +    if ( nr_frames )
>>      {
>> -        int size = (nr + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
>> +        unsigned int size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
> ... with the change from long to int this construct will now no
> longer be correct for the (admittedly absurd) case of a hypercall
> input in the range of [0xfffffff9,0xffffffff]. We now fully
> depend on this getting properly rejected at the top level hypercall
> handler (which limits to 1Gb worth of tracked space).

I don't see how this makes any difference at all.

Exactly the same would be true in the old code for an input in the range
[0xfffffffffffffff9,0xffffffffffffffff], where the aspect which protects
you is the fact that the hypercall ABI truncates to 32 bits.

If you want a non-overflowing DIV_ROUND_UP(), the appropriate expression
in (x / a) + !!(x % a), but I don't think its reasonable to use the type
of this variable as a credible defence-in-depth argument against the
audit logic making a mistake, or that it is worth worrying about audit
mistakes in the first place.  If there are any audit mistakes, so much
more can potentially go wrong than this corner case.

~Andrew

