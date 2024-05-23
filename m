Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6938CD10E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728360.1133249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6PE-0005YP-22; Thu, 23 May 2024 11:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728360.1133249; Thu, 23 May 2024 11:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6PD-0005WD-VP; Thu, 23 May 2024 11:14:43 +0000
Received: by outflank-mailman (input) for mailman id 728360;
 Thu, 23 May 2024 11:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA6PC-0005W7-Pm
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:14:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6c82484-18f5-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 13:14:41 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so3425843a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:14:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57842fec9edsm1219709a12.43.2024.05.23.04.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 04:14:40 -0700 (PDT)
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
X-Inumbo-ID: a6c82484-18f5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716462881; x=1717067681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLJpqS0EFUKkRXVB1cT+nXd/u/klamMtJaCc9IVI1lI=;
        b=YCMqi0A/iWx41JrgOhlr73Oy0cgZwZpJHryjnNhbq9EcS7Keroww0pr3voQXSnmcUU
         yQ3F301xFTGzk0cDEWzK4VamaGz3T5O6nSl1EsuwdpQeyhX+eDFZuywbyxtJlEWRWdw/
         IgP3blbeXY7tNqac96WNFJ/BhiGRsTgDKf+lNCdqrrh0fFG/mPFKFxoZzLrmSTbj92sJ
         Pe0ovZRIMXUiYMj4DKuWx09kwf9rvXz9ucW5yHXSe7g+o0+9edF8RKONY5kTfAFlhHqw
         62v63Kp+N0+6rElHpkgZ7UMZs7ZDLzD0yCpd4OdZJR0yk7t2CSAwStVpkpcAweN642b3
         IDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462881; x=1717067681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLJpqS0EFUKkRXVB1cT+nXd/u/klamMtJaCc9IVI1lI=;
        b=JYZmqCGiwVfkjbWpbax5zr/0u2tmNvcrSzjy5f0un5RTc0ijGC3gI+OsGQzxkxUEcJ
         VD23ymdBlYFR8vsAFvC2f3OLDr+2+NftfN2ZUcpRTpozT+qEBhjaV3X+Mj0X0B3LT545
         Y2T31z09YSHYXhfkvyukv+Ez16SwViCCpzbaLU1MateuTV5G3vkQyRQQwNo3LQB1d1nO
         D/qgD6xjIgxEpCjqHBdPSHh4NKhCYZychRPWsCOlsWl+g2dOkSmx28IWRbQ1dfo803Wk
         HtblzVvAYa27AnSklKEqGx9iXzlmXFuuwu6JheUWIPsbTjmER1yqH2d1Nog1Ag2410OP
         wIpw==
X-Gm-Message-State: AOJu0YyB3Ry0n6QMDxPel0gWZJ0w1x23l73Sj+vCiJqOmcXj1WkdOxiw
	jbAqFL5q0HwRfOKJTSJVEx+OynahTFmWEb1RdUPcZwMVXNh5wicXfh3ohVUjmx8=
X-Google-Smtp-Source: AGHT+IHqN2XZTEwnKPApkGhAohBfim6j8tShT33YK8omVdaG/SeSliXh4y0qU68y1sT3JRzGAZohjQ==
X-Received: by 2002:a50:9e2e:0:b0:574:ebf4:f786 with SMTP id 4fb4d7f45d1cf-57843ef8e9dmr1459296a12.16.1716462881184;
        Thu, 23 May 2024 04:14:41 -0700 (PDT)
Message-ID: <9cddfb9d-0627-4f00-b027-4cb1bbdfad4f@suse.com>
Date: Thu, 23 May 2024 13:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/pvh: Set phys_base when calling xen_prepare_pvh()
To: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-4-jason.andryuk@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240410194850.39994-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.24 21:48, Jason Andryuk wrote:
> phys_base needs to be set for __pa() to work in xen_pvh_init() when
> finding the hypercall page.  Set it before calling into
> xen_prepare_pvh(), which calls xen_pvh_init().  Clear it afterward to
> avoid __startup_64() adding to it and creating an incorrect value.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Instead of setting and clearing phys_base, a dedicated variable could be
> used just for the hypercall page.  Having phys_base set properly may
> avoid further issues if the use of phys_base or __pa() grows.
> ---
>   arch/x86/platform/pvh/head.S | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index bb1e582e32b1..c08d08d8cc92 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S
> @@ -125,7 +125,17 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>   	xor %edx, %edx
>   	wrmsr
>   
> +	/* Calculate load offset from LOAD_PHYSICAL_ADDR and store in
> +	 * phys_base.  __pa() needs phys_base set to calculate the
> +	 * hypercall page in xen_pvh_init(). */

Please use the correct style for multi-line comments:

	/*
	 * comment lines
	 * comment lines
	 */

> +	movq %rbp, %rbx
> +	subq $LOAD_PHYSICAL_ADDR, %rbx
> +	movq %rbx, phys_base(%rip)
>   	call xen_prepare_pvh
> +	/* Clear phys_base.  __startup_64 will *add* to its value,
> +	 * so reset to 0. */

Comment style again.

> +	xor  %rbx, %rbx
> +	movq %rbx, phys_base(%rip)
>   
>   	/* startup_64 expects boot_params in %rsi. */
>   	lea rva(pvh_bootparams)(%ebp), %rsi

With above fixed:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

