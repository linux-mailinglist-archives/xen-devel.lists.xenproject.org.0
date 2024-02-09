Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF484F801
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 15:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678737.1056236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYSKr-0002Xn-Fs; Fri, 09 Feb 2024 14:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678737.1056236; Fri, 09 Feb 2024 14:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYSKr-0002Vc-Ck; Fri, 09 Feb 2024 14:58:37 +0000
Received: by outflank-mailman (input) for mailman id 678737;
 Fri, 09 Feb 2024 14:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZDb=JS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rYSKp-0002VW-Sa
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 14:58:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b13ebfda-c75b-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 15:58:32 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a370e7e1e02so116650566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 06:58:32 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b00a385dd961bbsm831640ejq.192.2024.02.09.06.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 06:58:31 -0800 (PST)
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
X-Inumbo-ID: b13ebfda-c75b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707490712; x=1708095512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFexxYaH8CObRk0trpAT4UEPECRJcHoYoTUKZ3cvh+s=;
        b=m50IsjLL4OI031eMPqhtkWLXeIgY8reWSdyhU2GJkNOUbkh6LoiyMkL48HD9JHuarN
         DNBLSKCf2KmPjey5U3FBz2Gu98VU8Kgh+u0vN/IUgXIdwSgA6iuqiCotASeR5oHQMumv
         2ZF6Q+R94OIxcuS4qTujwjXC69j1I320+fHyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707490712; x=1708095512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFexxYaH8CObRk0trpAT4UEPECRJcHoYoTUKZ3cvh+s=;
        b=hXU5kS8JMNv8RBpGCjxpQhiZhrVj/vX8s409KmDj60Slz0CkCqaN2o8CsHeSW10oiu
         357HqNcVEVGE+Kt8G8bba5M6nu/W1MhiptefzAvaX+g/vVrH3x4MGjBcyu6ByRouOSZ6
         b46k9aAVv5Hnr6iYzJkMs4dv/wUq55e9gbQ5m2JOE5yGD58wQDbxe7GoCgnCwO7y0Iu3
         Y2T3TMKVznkxtk61ceeV/TeQeOPkh9j1HsVDU5RpWs2Zw8eC0MxQfNSpjDhUozz6vA/E
         CEsbxirzxkBS/KpTGaD0vTP7rdRSXrkA5MLKa+I89+fCVKgpjNrDLLqgKfyEa3xLjiYn
         fDpQ==
X-Gm-Message-State: AOJu0YyVeWknGPBEmAYNHpoZPSaXTqv0sLsX/RMpsiCp/u1GlUKZJtKd
	FhH0dJNzu+klh2UAu6IjmlHzB5RmDB+BF1B0B45Os75O+3re3eyO/gb/Cbgns6I=
X-Google-Smtp-Source: AGHT+IHIP8N+GpuNf3670pKBXb1L718uMBLYyC3UyhckHJkTnohTtHbAUT34acr/EBw+9S8/zHwXmQ==
X-Received: by 2002:a17:906:af11:b0:a37:d286:8c98 with SMTP id lx17-20020a170906af1100b00a37d2868c98mr1497119ejb.14.1707490712084;
        Fri, 09 Feb 2024 06:58:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhNrBl2I5wtjF1L5dbxM92vLxJxEd1QirF68a5C7MG8466bTi0tcvKABpoAymnDFzwh62RJ9YQwWb77IE6muuHRqXwYaBT2y9aWkO2qfs9XTe+9ZFrEBhbcB49bF9fvJwcDO1LE65KBw+gD1bmm/oP15SEohVfFXahRXuOwJUJj2K69w==
Message-ID: <eba39016-7d7a-4d35-865c-bfa03674617a@citrix.com>
Date: Fri, 9 Feb 2024 14:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Fix fast singlestep state persistence
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/02/2024 9:20 pm, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
>
> This patch addresses an issue where the fast singlestep setting would persist
> despite xc_domain_debug_control being called with XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF.
> Specifically, if fast singlestep was enabled in a VMI session and that session
> stopped before the MTF trap occurred, the fast singlestep setting remained
> active even though MTF itself was disabled.  This led to a situation where, upon
> starting a new VMI session, the first event to trigger an EPT violation would
> cause the corresponding EPT event callback to be skipped due to the lingering
> fast singlestep setting.
>
> The fix ensures that the fast singlestep setting is properly reset when
> disabling single step debugging operations.
>
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> ---
>  xen/arch/x86/hvm/hvm.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index e8deeb0222..4f988de4c1 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5160,26 +5160,40 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>  int hvm_debug_op(struct vcpu *v, int32_t op)
>  {
> -    int rc;
> +    int rc = 0;
>  
>      switch ( op )
>      {
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> -            rc = -EOPNOTSUPP;
>              if ( !cpu_has_monitor_trap_flag )
> -                break;
> -            rc = 0;
> -            vcpu_pause(v);
> -            v->arch.hvm.single_step =
> -                (op == XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON);
> -            vcpu_unpause(v); /* guest will latch new state */
> +                return -EOPNOTSUPP;
>              break;
>          default:
> -            rc = -ENOSYS;
> +            return -ENOSYS;
> +    }
> +
> +    vcpu_pause(v);
> +
> +    switch ( op )
> +    {
> +        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
> +            v->arch.hvm.single_step = true;
> +            break;
> +
> +        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> +            v->arch.hvm.single_step = false;
> +            v->arch.hvm.fast_single_step.enabled = false;
> +            v->arch.hvm.fast_single_step.p2midx = 0;
>              break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();

Two things.

First, this reads as if it's reachable, and therefore wrong.  You
probably want an /* Excluded above */ comment to point out why it's safe
in this case.

Second, I know you're copying the existing switch(), but it wasn't
compliant with Xen's coding style.  The cases and their clauses should
have one fewer indentation level.

I'm happy to fix up both on commit.

~Andrew

