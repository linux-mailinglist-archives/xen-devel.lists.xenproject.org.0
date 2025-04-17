Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC75A92245
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958205.1351143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rn8-000673-6F; Thu, 17 Apr 2025 16:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958205.1351143; Thu, 17 Apr 2025 16:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rn8-00065D-3O; Thu, 17 Apr 2025 16:08:42 +0000
Received: by outflank-mailman (input) for mailman id 958205;
 Thu, 17 Apr 2025 16:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5Rn7-00064Y-8h
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:08:41 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a1f2f66-1ba6-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 18:08:40 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so1402989a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 09:08:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f527dcesm10079725a12.75.2025.04.17.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 09:08:39 -0700 (PDT)
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
X-Inumbo-ID: 3a1f2f66-1ba6-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744906120; x=1745510920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MhPJrqoIkfnTndXlNlsEiuPfcta9mSv635MGKENoHMg=;
        b=gpxXLVRMtduEIbuenb/2U64+YYvSL26ZsTDYDPDOoH+/kwhH3slNbzHE5EFfC6jeHz
         iFORVsLgmBAgo4NKT1YIS0AS59KWeodSTp1W8sxYyVHWIYEIfUdK/6pgpkhXlpGpPfxf
         35/b7LhZ1tp2JW5W/IkYBrJIb+PvM7rCJIDbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906120; x=1745510920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhPJrqoIkfnTndXlNlsEiuPfcta9mSv635MGKENoHMg=;
        b=qdZ7RburzyfpoWnDBP5NxlnLun5b4T5vh8zhm+odLwnSrnwrGcQIYOxs33lalsqBlu
         K0oCzPdWXUirJK43Wh4XIdSbHkTwLry1r17+ebpF/gPOiNlhSGS8twOW5Z57uW3rW/ot
         h273kJn4rnZKJU75plhrgxbb90bq+65ixvB7ekUEEMnKhNo0HXxJLTlmbLvkSfYWurqu
         tqV9MbE2kelikZPnPi1ixl7w76XglUM+eA6xkotKSgkXGw9pDJyw7JGNazYT3LOjmRqq
         9F56Ha7kW+xHVF1Ah8uMJ56PuXHsFLvMfEh0goGQPxJ4KsZ9pLhbH9JWycd7lRNTvTAI
         hI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIXICy7xwhytxFCRYiaU/UYp1hF53kFIQfglvUOSoXAjGVmodY6jVbAGjTk1LJVtGRL5ZPtaKBER8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4SNuwBWcZO6D8YWQEA5r4FzKC4snLVrBS8d4zMq/0eWyhLuwK
	FxkjOLmTToIwqcqlYRN2XcaYPd0LoTD14+X6k5s7cCqRAVIaNyJxsRLyE9Eg/xU=
X-Gm-Gg: ASbGncvB0QVu/KPNIiI92Bj9aCHnqyqpj5VpJbmuYjM+x5rt1+H0H132LwkUV6WXl9V
	Guhtigb9QXMlNiuAPGK7lXB04RTPxdB0dOFkbGp5tu7gfbO99TpKdLe2qm/EEyJrgleeWh4dIKb
	3RLMS03a4S75oUdqqe/0AN9intBjeBvmqGZosjcjKdxrPVRNOt2ZZ/5hovmiWHtYhQzJL9rP09w
	asNgYv4b4LjSD3uH7tGdwxUhbGBlQbO1NdaJGioBhGR43GoqNjnItAVstla2q3tGCfRywbMMxaw
	7TVmRR+h+RY2g6ipac8fqOhmFhquLwi1WZa5Bchv0ukBUGEnARzDLZiuOEs47RA6pfYisCBsj5E
	z3Dq00w==
X-Google-Smtp-Source: AGHT+IF7f3tCELoh6aYD3gSvaLYh+7lV/o03WF3oiY5dK/bLHKCYg4iEYs4TsZbSYKT1BSWnMAswQg==
X-Received: by 2002:a05:6402:51c7:b0:5e5:b388:29f9 with SMTP id 4fb4d7f45d1cf-5f4b71e2bf6mr5466895a12.5.1744906119540;
        Thu, 17 Apr 2025 09:08:39 -0700 (PDT)
Message-ID: <0d01646b-83e3-4a02-b365-d149d2664e73@citrix.com>
Date: Thu, 17 Apr 2025 17:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/vmx: Rework __vmread()/vmread_safe()/vmr()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250408011454.2274613-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250408011454.2274613-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/04/2025 2:15 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Use `asm goto()` in vmread_safe() to simplify the error handling logic.
>
> Update __vmread() to return `unsigned long` as per suggestion in [1].
> Rename __vmread() to vmread_unsafe() to match the behavior.
> Update all call sites everywhere. Drop `UNLIKELY_*()`.
>
> Group all vmread*() calls close to each other in vmx.h
>
> Rename internal vmr*() to vmread*().
>
> [1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com/
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1756781092
> ---
>  xen/arch/x86/cpu/vpmu_intel.c          |   3 +-
>  xen/arch/x86/hvm/vmx/intr.c            |  26 +--
>  xen/arch/x86/hvm/vmx/realmode.c        |   2 +-
>  xen/arch/x86/hvm/vmx/vmcs.c            | 160 ++++++++++---------
>  xen/arch/x86/hvm/vmx/vmx.c             | 209 +++++++++++--------------
>  xen/arch/x86/hvm/vmx/vvmx.c            |  43 +++--
>  xen/arch/x86/include/asm/domain.h      |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h |  69 ++++----
>  8 files changed, 235 insertions(+), 279 deletions(-)

This is why I suggested not to convert everything in one go.  It's now a
patch doing multiple complicated things, and is proportionally harder to
review.

For everyone in public, it is especially daft that we have __vmread()
which is void and (if it doesn't BUG()) will pass it's return value by
pointer.  It leads to very unergonomic logic.

Start by just implementing vmread(), and updating __vmread() and
vmwrite_safe() to use it.  You cannot use asm goto() for vmread()
because of the no-outputs constraint that we still need to follow.

Then, in a separate patch, you can do simple conversion such as ...

>
> diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> index 7ce98ee42e..9c93d1f28c 100644
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -796,8 +796,7 @@ static int cf_check core2_vpmu_do_interrupt(void)
>      else
>      {
>          /* No PMC overflow but perhaps a Trace Message interrupt. */
> -        __vmread(GUEST_IA32_DEBUGCTL, &msr_content);
> -        if ( !(msr_content & IA32_DEBUGCTLMSR_TR) )
> +        if ( !(vmread_unsafe(GUEST_IA32_DEBUGCTL) & IA32_DEBUGCTLMSR_TR) )
>              return 0;
>      }
>  

... this to vmread().  

Splitting the patch makes a substantial difference to review-ability,
because patch 1 is "is this new helper implemented correctly?", and
patch 2 is "is this boilerplate rearrangement no overall change?".

For vmr(), I'd start by just wrapping vmread().  It's debugging logic
where brevity is important.

> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 6b877e33a1..ffe9acd75d 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -595,7 +595,7 @@ struct arch_vcpu
>  
>      /* Debug registers. */
>      unsigned long dr[4];
> -    unsigned long dr7; /* Ideally int, but __vmread() needs long. */
> +    unsigned long dr7; /* Ideally int, but vmread_unsafe() needs unsigned long. */
>      unsigned int dr6;

This comment was left as a hint, and you've just addressed the problem
forcing it to stay unsigned long.

Changing dr7 should be in a separate patch too.

~Andrew

