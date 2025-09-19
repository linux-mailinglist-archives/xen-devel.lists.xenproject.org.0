Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC4B8B3D5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 22:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127040.1468205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzi2V-0002oc-HW; Fri, 19 Sep 2025 20:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127040.1468205; Fri, 19 Sep 2025 20:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzi2V-0002nD-Dz; Fri, 19 Sep 2025 20:49:07 +0000
Received: by outflank-mailman (input) for mailman id 1127040;
 Fri, 19 Sep 2025 20:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzi2U-0002n7-Fq
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 20:49:06 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14527bfc-959a-11f0-9d14-b5c5bf9af7f9;
 Fri, 19 Sep 2025 22:49:05 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so1485323f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 13:49:04 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f0401bdfcsm2057392b3a.76.2025.09.19.13.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 13:49:03 -0700 (PDT)
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
X-Inumbo-ID: 14527bfc-959a-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758314944; x=1758919744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOwVNfUrJ+HsIf4zA/oPRdt1s5UoW/dvVzG5cIRIAHM=;
        b=bYhC8PKHuuciCDidJvAz8u0KmbEe7wnrHq9420rU5UYF9zMGOksyVrRx9FExl/xlxw
         vThqP6ZWES9YBVOEteqzxBNvr4fMONtrsGN3hX43IYIgmwcPk57j1SYi+NJLXWA40Lof
         Ag2j63LLzhbMqA/HLf9YuJ2Js680BSHiTGuJkLsFqASXxYKgxP2BwvLgoBQGnLCKWJc2
         XbxYTfsrXE3pgqLLUe21giwfia0nJxbjesw+ouRvNEKnq0l6gaZBXa2ogBtp/lj+XMmb
         hy7SaQdri1wXDqpalG60ANDbOPch93ypk4EvoPnZBpM03dFnU+QkJZ4mFw47dYUartmE
         p0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758314944; x=1758919744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOwVNfUrJ+HsIf4zA/oPRdt1s5UoW/dvVzG5cIRIAHM=;
        b=CwVQF9Dv9EnpgAQwqL84GQ8anV38RaDOsVY1ejv1XaJMVY6xAoikoKYaoZzl4AssLl
         bJTtS6wM9/e8ddz30HwAdpyq7TA1nBnLqUE6nM9imQoCzb+fA6gHBDdG2bSEyNHsCfjX
         4McqXj24/XXNxbH6FINSc/1DbMlk4eUESy0/H+jhrLhVPsk0BokK3zfV5W04Cf0hrDKx
         1vlGMcse2C34/yBkIbvCPX/TXBtEfP8YqcKK25c5IWfgsKmVsFQhgMlZZn+4Bc/tKCA6
         OTOw8dZgmhkzHvFVcJpwX58s+viWdesN76NDSE8hLenSD2UdHgybWs0mE8JiNbkmrteD
         0NJg==
X-Forwarded-Encrypted: i=1; AJvYcCUgQGeE51+3pSySmnEwdE2SEbMuY6Q4XWJ64/9AbSFdIlir6dXUmfdB374PdvuROfm8U0gXEc983K8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZSQy1v48FI4WQQ3zcU2+E+5o40DyOEc2e/3U02IoD0ZNVXkxD
	HgVr55v2Dy35jeKbk+XDD/Y7UFjiwqT4IuwnGgehKBFbW3Fku8zkpX/VGSGkxfWnVQ==
X-Gm-Gg: ASbGncsguK+dK69VcD7Ck7YiJbFS15pXXEnDiSmM/fsy4Shv/Id3AHFg3tOS93LOMSZ
	m4EH/mDFshq2RZp4W4N+AfNzinapd86ZgUVzWRQkY7B89N4hz+GXWLpoUKmHzAPXbRLqtHe7Pxn
	kofl5cENPIpLF13ba2e0MpUjaBbCtWSH9yV1+my9F9w09/xWcU/7Cy23NI1ZXmSPEegyPrdBL6K
	7mK9xHwk5ZxuL289iHc4E4b1P72tjrsFVICl50gVL/3wyRmnojKRoIyKMmRB8WpX6xaROq8hjSs
	W7tOWThRmfstiZHeFAKB6jjRaM2ChA9vQ5nHAI8FGtLQa8KCc2Nv5FSSwppXD8uwMXG1c2T+dwp
	XgPy7SByrNOYAvfkfuIeqOap+kO3hPgu+Ayqy/pja+Ec=
X-Google-Smtp-Source: AGHT+IG6DURXyjN39csO7ek/9oxUvovLqGCNJ5+sbNMxo1t1w2WR8utDdV/kVM53BL8D62+Okp0p2w==
X-Received: by 2002:a5d:5846:0:b0:3e7:4835:8eeb with SMTP id ffacd0b85a97d-3ee86d6cfbfmr4265889f8f.53.1758314944246;
        Fri, 19 Sep 2025 13:49:04 -0700 (PDT)
Message-ID: <5c495ffc-40c9-4c55-bfba-3e1c0d9955c6@suse.com>
Date: Fri, 19 Sep 2025 22:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250919163139.2821531-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250919163139.2821531-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2025 18:31, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -62,6 +62,17 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config VIRIDIAN
> +	bool "Hyper-V enlightenments for guests" if EXPERT
> +	depends on AMD_SVM || INTEL_VMX

Looks like either there was a misunderstanding, or I wasn't clear enough.
Here the dependency should strictly be HVM. If anything, the dependency
above could appear for HVM (but as said, as of now it's deliberately not
there).

> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>      struct viridian_domain *vd = d->arch.hvm.viridian;
>      struct hvm_viridian_domain_context ctxt;
>  
> +    if ( !is_viridian_domain(d) )
> +        return 0;
> +
>      if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>          return -EINVAL;
>  
> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>      struct vcpu *v;
>      struct hvm_viridian_vcpu_context ctxt;
>  
> +    if ( !is_viridian_domain(d) )
> +        return 0;

I don't think we should let these go through, but rather flag an error.
And perhaps an intentionally exotic one (e.g. EILSEQ or something yet
more "odd").

Jan

