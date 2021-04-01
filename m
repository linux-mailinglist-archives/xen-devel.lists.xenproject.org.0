Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3C3513EE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:51:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104368.199589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuuM-0006pz-Ct; Thu, 01 Apr 2021 10:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104368.199589; Thu, 01 Apr 2021 10:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuuM-0006pa-9R; Thu, 01 Apr 2021 10:50:38 +0000
Received: by outflank-mailman (input) for mailman id 104368;
 Thu, 01 Apr 2021 10:50:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SiKL=I6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lRuuK-0006pU-Sb
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:50:36 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a00ff4ec-30ad-4c64-abcc-476bd3997a1d;
 Thu, 01 Apr 2021 10:50:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j7so1365592wrd.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Apr 2021 03:50:35 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ac48:6475:41e4:208d?
 ([2a00:23c5:5785:9a01:ac48:6475:41e4:208d])
 by smtp.gmail.com with ESMTPSA id m15sm8657504wrp.96.2021.04.01.03.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 03:50:34 -0700 (PDT)
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
X-Inumbo-ID: a00ff4ec-30ad-4c64-abcc-476bd3997a1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eeBlpa+LPXFDtgiKt0qcvo3MEbkWu2S5Fp2G4dTK3bE=;
        b=M1fvt9nISqei9ClE+PVnLbB1A3UW3N+v56I1RKzh0fgFdwhqjVuWJK3ZJ7yaFuDSkV
         lMtKg3/ojc9nUKwAauLZ0ahGUjWn2VPmwSfUR27NDQjLHghvMq4DYjHOm0uTw5Y8lwtD
         c1lmahjAhWQV8ImclMeuhsTvN2R/XqMrd7Bz/5u74nDkDagAWMUuZ5StcSAFdQ0gaYd9
         R4aWrL35UjXHmady3jIa20q2cSD7qdzaVwrWcVJWOZp78v4mPIIgIMGVuT7SeCYuVOyf
         GRZBjgKBOPTVnFwZx7wJgwPGUJAIQY4jo94h8OyuNVrxGRMb06yJtT96H26CRkCEexe4
         eLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eeBlpa+LPXFDtgiKt0qcvo3MEbkWu2S5Fp2G4dTK3bE=;
        b=ja1AAooFriorlzkhnyM20IKG4oEU7cQOXPsrrC/e2BoMnt6nKdVTRvZzUi+m/21oEF
         uaWsnMnXm68dNaLXwTfL/xahPi6VgOpPFmiIiD/RgEH0+Eghx1Nt8jYYb8maU0sChqsD
         9eGB4EsDFtg+/alFBVf9mXEpop0k19YDLjjypUHsswMa+Yr/ocPSRe3lxRd4TdKrD6XQ
         AnB1BJPDAn1PD4FHFMmG1Mu5C6TJpUD81fS0ulMtXRMYh3OL9KrXZORIWDSP+IqG8i3V
         EHNEyyHrDRjDVPs3llURD3sAPVV/EjxMPaD5uPIHvyLZAqqtjcf53bcfS6MSHxBas5gY
         Hnlg==
X-Gm-Message-State: AOAM530fe3boThEUJNcwcsTL2oo4ytH3MWpKF6Leum0sAbjel0/tBe5S
	ujWixP3dpMsXo2V1yd76Qqs=
X-Google-Smtp-Source: ABdhPJxKjBpsWIoE8kgY6W/qb93RgeBkNXANnBUQIcKVN3959hT1QD7XJx/JlM8K0ctLox3n2LLqtw==
X-Received: by 2002:adf:f010:: with SMTP id j16mr9177774wro.251.1617274235115;
        Thu, 01 Apr 2021 03:50:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210401102252.95196-1-roger.pau@citrix.com>
Message-ID: <5b4ec824-8cfa-8795-3a96-fb18527d3c18@xen.org>
Date: Thu, 1 Apr 2021 11:50:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401102252.95196-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/04/2021 11:22, Roger Pau Monne wrote:
> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
> as current, as there's no support for EOI'ing interrupts on a remote
> vCPU.
> 
> While there also turn the unconditional assert at the top of the
> function into an error on non-debug builds.
> 
> No functional change intended.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   xen/arch/x86/hvm/viridian/synic.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index 22e2df27e5d..e18538c60a6 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>       struct viridian_vcpu *vv = v->arch.hvm.viridian;
>       struct domain *d = v->domain;
>   
> -    ASSERT(v == current || !v->is_running);
> +    if ( v != current && v->is_running )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return X86EMUL_EXCEPTION;
> +    }
>   
>       switch ( idx )
>       {
>       case HV_X64_MSR_EOI:
> +        if ( v != current )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return X86EMUL_EXCEPTION;
> +        }
>           vlapic_EOI_set(vcpu_vlapic(v));
>           break;
>   
> 


