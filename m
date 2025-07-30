Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB7B164FE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 18:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064248.1429975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9yV-0006hA-AK; Wed, 30 Jul 2025 16:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064248.1429975; Wed, 30 Jul 2025 16:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9yV-0006eN-6w; Wed, 30 Jul 2025 16:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1064248;
 Wed, 30 Jul 2025 16:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoeR=2L=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uh9yT-0006e5-Ob
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 16:48:17 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb138eb7-6d64-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 18:48:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so5318f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 09:48:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78b26a43asm9088514f8f.34.2025.07.30.09.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 09:48:11 -0700 (PDT)
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
X-Inumbo-ID: fb138eb7-6d64-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753894092; x=1754498892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp6NJonQ1lihr+a/wZepx4WPor9VA55YBBc8TStKgXU=;
        b=X+hBxZ31KaBtnx2AJ73feFxpi56D1ltCLS5lGfKGAi1Pvbbk71TbNPVmt9WtawadgS
         KCGMHRWk0DjmthbN/G8YJP7+JZ/mtrAam5J8p9KD4UKdmQwuxwFKOdC9DqGLoA5WzmZL
         5ucltJvpOHSaFs3L97iOgYqcB2zhOGrwgHnD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753894092; x=1754498892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp6NJonQ1lihr+a/wZepx4WPor9VA55YBBc8TStKgXU=;
        b=JJDNFQ8TjmvivSFZLqgbWN0ClBhEJEzc6Rt2bhmOOWG0ADzRKJRmzYWtS44Ol0XaVj
         mz6CAd0okhUJDfFZMtP38v2YkVR27PA1f9I5Diu7n8v68gXoY88z//+y6zs5uMFF0CqU
         ThHL1S1MPwuFQ5UA7qNuNPcDT4zmZ4XpIDu9qgqolqiMb0tVtHWGswjI75/WdCpsFuXO
         m34SwvcIxQhBIW9WlnZx8lHSKhuawjNVHinc8K/Lvphy/D/b4SSs7ClKL/rEwZSOk66F
         kKBYaoGCIbi8thrbtRhV9xy2AvO7Ed8srk40JaYkegl+71EsGyoxNy8Evf6Pwajv4P3W
         5rbA==
X-Forwarded-Encrypted: i=1; AJvYcCXPmZBRQGYUyoqEsR+Y+aoY21lRpDXSUId4K1VzueclJoAiE+CccIr6sEa/xW2W0ST8TVIeuAmvaoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn8wlhAqLrB4HKu4WACQz5GjzzmFdHeHhezyfiIVMUvo/hcl8u
	UkeejukNlI70eoKPy/B305A0uVxl3+q0Hx8/vCERo98BL2E3xhL7wzI0CZrUqdPJ13A=
X-Gm-Gg: ASbGnctjy+LYY9mAi8r6CLET3kqjEnMD5j+RWhz50aQSzeZP3scUAPA/qgDgaCnSM+7
	vjPDp9htnnoQfvipJFLTt5QTV8mrgbzbk0HnCD3jm+oZCdGvuS/7xJwq8VwAF1F8nmPeUXqyDFu
	jo8SoA6S0U+mgQiYKtfuxMtlu5IqR+p+vmLVCl4o0swjPiXIBXDPKJvMaWoPmUMST0C/tt3Gz0G
	MXImooae8gmmfW5H/9e9FdQe5nMTf+4Hq8GdSq5YYCkcIO1ntabwNt40gJX28YbnmBcDi2fjXhI
	iFne8O5xSe3I2H2HxNPhLDf3QIMdcytzmrkz0pOGgzpU/IVj+3/oksYCbnUL8oJjNQYhswaWlZi
	I2dmQOG9KrTuWodWqNf8Zdm24vA2mHCP3MSEnc9aMyELjc4ERhLnrBfYTj3/r2XoGzA+M7LpfNV
	X+l5w=
X-Google-Smtp-Source: AGHT+IEcyallYDYDL7HPB/wrEw3zF0LUMoZkl1yrado9LZY66uZAQ5y/EXmao7thMaTXTKgkudfK5w==
X-Received: by 2002:adf:a384:0:b0:3b7:9551:2b16 with SMTP id ffacd0b85a97d-3b795512dddmr2007764f8f.40.1753894092016;
        Wed, 30 Jul 2025 09:48:12 -0700 (PDT)
Message-ID: <4db51672-4abd-45bc-b6fa-20495e4c0314@citrix.com>
Date: Wed, 30 Jul 2025 17:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2025 5:40 pm, Teddy Astie wrote:
> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
> - there is no vcpu
> - unrestricted guest capability is used
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/hvm/hvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index e2720daf1e..39ff1bdbe1 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4286,11 +4286,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              rc = -EINVAL;
>          break;
>      case HVM_PARAM_IDENT_PT:
> +        v = domain_vcpu(d, 0);
> +
>          /*
>           * Only actually required for VT-x lacking unrestricted_guest
>           * capabilities.  Short circuit the pause if possible.
>           */
> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
> +        if ( !paging_mode_hap(d) || !cpu_has_vmx || !v || vmx_unrestricted_guest(v) )
>          {
>              d->arch.hvm.params[index] = value;
>              break;

You cannot safely skip these.  Otherwise you break a sequence of
migrates which passes through a machine that needs the IDENT_PT.

Although that said, it looks like it will break when passing through a
machine running Shadow too, even though that in principle ought to work.

HVM guests don't reasonably work cross vendor, and we probably should
finally stop pretending it's an option.

~Andrew

