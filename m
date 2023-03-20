Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146C6C0CB8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 10:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511782.791019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBRK-0000Y7-L0; Mon, 20 Mar 2023 09:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511782.791019; Mon, 20 Mar 2023 09:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBRK-0000W4-IJ; Mon, 20 Mar 2023 09:04:26 +0000
Received: by outflank-mailman (input) for mailman id 511782;
 Mon, 20 Mar 2023 09:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkKL=7M=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1peBRJ-0000Vy-MM
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 09:04:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b5468d-c6fe-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 10:04:24 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id w9so43797954edc.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 02:04:24 -0700 (PDT)
Received: from [172.24.0.25] ([86.189.51.246])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a50ce4f000000b004bef1187754sm4507582edj.95.2023.03.20.02.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 02:04:23 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 35b5468d-c6fe-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679303064;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35DJsDfCUQwOkSef36+qC/zHigPEGaR4T7HvjDudWQE=;
        b=ZFCWyLFpy3EWYKR4DF4urrAiG6Kl0IJRIHWURX73f/tFETbho+F1XoxE9jVdg3JD2q
         SeHKT8Va+p7dx8ACF5pP4QEfXipJRkCCEzNHLSxLOGGWguRApWPq577/IFg2t7BCOQKn
         s80/RG1FvnPZ7x25UxKJwURP5dMSzbUV34sscg18IPLNaAuJp6ZGzxV3+7+K4plmmegw
         bvaPiJYfwACLsToQRYzXxcdDrGGkF/aB1m+vMtcos92ossQdF3y16PFHzV/3Jr62ikA/
         nJAK1H1Lat/09vwy0kYns+ezC2898DRviSLU6RYHTJw5SnS18UBeQSYBZR1CG/+2oMKO
         KhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679303064;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35DJsDfCUQwOkSef36+qC/zHigPEGaR4T7HvjDudWQE=;
        b=srOAB7UWBTTZKkb2CS4UX6Kb99chUuqlaQRDQRYvp/wgbNLTT2h3uFghHI4GKZpqBN
         GP4fxgUPhY1luvmE3iKyq/qHz/sJ1WKwsKL2TDt8nC8r/OIvDKbRD/vAnmfHwkU709ED
         IkCScYFOLJDEQk0cFq5iGQGWqujFPfuCqNFRqTlTogSGS0Z6WPB9CPKtCCmgg6ueUUaI
         WUM9CItazFQfnMTNiPoGx+nPksFG1rJdQc/67nNy8G0YDmQsNscpgQfMEL1XESwmPj5w
         XsIVNm8kdCW5VSjtl86xpYBUtXhmbIeuO3OFbbdeNgZd+BptdvZzkgKL7wO6EH7Bbwe8
         GT1g==
X-Gm-Message-State: AO0yUKWCDulB3HWWi36KG31xsoSOGl1uyup8FXlYrPw1oeBpJzQMvBIg
	1vSs/H2mdpkPlbvjnmcPwtkOCYamtlg=
X-Google-Smtp-Source: AK7set9sYr+MnbPGCxElSwftpTqMtwarRuClwsp6RnJh8Rc0wNc1AU4395oterxtwJc3lLMerVRMNg==
X-Received: by 2002:a17:906:bcf4:b0:920:7a99:dcd4 with SMTP id op20-20020a170906bcf400b009207a99dcd4mr8542454ejb.62.1679303063952;
        Mon, 20 Mar 2023 02:04:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2f1c2da9-ad21-cf4d-230e-b3e01658f25f@xen.org>
Date: Mon, 20 Mar 2023 09:04:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] Fix PCI hotplug AML
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
References: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2023 10:32, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The emulated PIIX3 uses a nybble for the status of each PCI function,
> so the status for e.g. slot 0 functions 0 and 1 respectively can be
> read as (\_GPE.PH00 & 0x0F), and (\_GPE.PH00 >> 0x04).
> 
> The AML that Xen gives to a guest gets the operand order for the odd-
> numbered functions the wrong way round, returning (0x04 >> \_GPE.PH00)
> instead.
> 
> As far as I can tell, this was the wrong way round in Xen from the
> moment that PCI hotplug was first introduced in commit 83d82e6f35a8:
> 
> +                    ShiftRight (0x4, \_GPE.PH00, Local1)
> +                    Return (Local1) /* IN status as the _STA */
> 
> Or maybe there's bizarre AML operand ordering going on there, like
> Intel's wrong-way-round assembler, and it only broke later when it was
> changed to being generated?
> 
> Either way, it's definitely wrong now, and instrumenting a Linux guest
> shows that it correctly sees _STA being 0x00 in function 0 of an empty
> slot, but then the loop in acpiphp_glue.c::get_slot_status() goes on to
> look at function 1 and sees that _STA evaluates to 0x04. Thus reporting
> an adapter is present in every slot in /sys/bus/pci/slots/*
> 
> Quite why Linux wants to look for function 1 being physically present
> when function 0 isn't... I don't want to think about right now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 83d82e6f35a8 ("hvmloader: pass-through: multi-function PCI hot-plug")
> ---
> Utterly untested in Xen. Tested the same change in a different
> environment which is using precisely the *same* AML for guest
> compatibility.
> 

This AML only relates to the hotplug controller for qemu-trad so it's 
unlikely anyone particularly cares any more. In fact I'm kind of 
surprised the generation code still exists.

   Paul

> diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
> index 1176da80ef..1d27809116 100644
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -431,7 +431,7 @@ int main(int argc, char **argv)
>                   stmt("Store", "0x89, \\_GPE.DPT2");
>               }
>               if ( slot & 1 )
> -                stmt("ShiftRight", "0x4, \\_GPE.PH%02X, Local1", slot & ~1);
> +                stmt("ShiftRight", "\\_GPE.PH%02X, 0x04, Local1", slot & ~1);
>               else
>                   stmt("And", "\\_GPE.PH%02X, 0x0f, Local1", slot & ~1);
>               stmt("Return", "Local1"); /* IN status as the _STA */
> 


