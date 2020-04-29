Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A81BDDCA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:37:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmtc-0001CO-N1; Wed, 29 Apr 2020 13:37:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTmta-0001CJ-QI
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:37:02 +0000
X-Inumbo-ID: 8152fcfe-8a1e-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8152fcfe-8a1e-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588167422;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bDfJHutl9EzSZTAYAL2zW90ecsr9qcqaCG9w1LCKlkQ=;
 b=YlIjnSTgWBF+mtNpzbctq3JftF/fQOFG/MrGlVil987G7xwPYYH+73T5
 8IG9KmifVw2H19qscuK/wrqXzUl1zxKmIpc/5TugvvNxiAnM9ONzpqbBV
 TH3VLRocZKfpMsuvtVRCVGaD2NXxBeZKf6cjDN7LXHYuZNdf82yXKNwHp s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2feEWLwWUHRi30tXrRzHurej/4D2KF04Cptc3lgFLQeKkd1qyiHmijGF+BkHK1HuIjPOzovalv
 7lu0WELBsIag/SOE6o3Z2K2Xw0Idkxy8ofrlVaUc1hMjpDFp0JT8ht5v1gYOP7tcKIEbt/TyLZ
 aHjW2pWkHt7Qq8GfV7Xwy/eseTXKCbCBu+cug8w0lgMw424a4qG1Q8a2wBeiNa+ZWXklx2+i1G
 Npy69wrFCN8YIYCyooAcD6s8jI1osLoUhCyx0Cw7k6JLAlAKsUtr6cEGuYuvFF9g1rN3ZzYsFq
 9y4=
X-SBRS: 2.7
X-MesageID: 16426266
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16426266"
Subject: Re: [PATCH] x86/S3: Drop {save,restore}_rest_processor_state()
 completely
To: Jan Beulich <jbeulich@suse.com>
References: <20200429110903.15418-1-andrew.cooper3@citrix.com>
 <42c1a2ec-51a1-7b03-aea5-f8ffe80d6928@suse.com>
 <52bdc00f-7778-bd06-14e1-d5c6086466d3@citrix.com>
 <8cfa1ae3-24ef-5885-d758-ccb188e4e4e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <afb3cf2d-5d8d-0f4a-b75f-069191871f87@citrix.com>
Date: Wed, 29 Apr 2020 14:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8cfa1ae3-24ef-5885-d758-ccb188e4e4e2@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 14:25, Jan Beulich wrote:
> On 29.04.2020 13:32, Andrew Cooper wrote:
>> On 29/04/2020 12:16, Jan Beulich wrote:
>>> On 29.04.2020 13:09, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/boot/trampoline.S
>>>> +++ b/xen/arch/x86/boot/trampoline.S
>>>> @@ -91,6 +91,11 @@ trampoline_protmode_entry:
>>>>          and     %edi,%edx
>>>>          wrmsr
>>>>  1:
>>>> +        /* Set up PAT before enabling paging. */
>>>> +        mov     $XEN_MSR_PAT & 0xffffffff, %eax
>>>> +        mov     $XEN_MSR_PAT >> 32, %edx
>>>> +        mov     $MSR_IA32_CR_PAT, %ecx
>>>> +        wrmsr
>>> Doesn't this also eliminate the need for cpu_init() doing this?
>>> If you agree with that one also dropped
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> That doesn't cover the BSP on either the legacy or EFI paths.
> The legacy path, afaict, uses it:
>
> .Lskip_realmode:
>         /* EBX == 0 indicates we are the BP (Boot Processor). */
>         xor     %ebx,%ebx
>
>         /* Jump to the common bootstrap entry point. */
>         jmp     trampoline_protmode_entry

Oh, of course.

> The xen.efi entry path really should have the change you make
> mirrored anyway.

Are you happy for it to go in efi_arch_post_exit_boot()?  We don't
disable paging, but that is the point where we switch from the EFI
pagetables to Xen's.

~Andrew

