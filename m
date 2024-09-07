Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724D9701BB
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 12:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792182.1202168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smsqH-0005Ye-32; Sat, 07 Sep 2024 10:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792182.1202168; Sat, 07 Sep 2024 10:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smsqG-0005Vw-W4; Sat, 07 Sep 2024 10:38:56 +0000
Received: by outflank-mailman (input) for mailman id 792182;
 Sat, 07 Sep 2024 10:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrAp=QF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smsqF-0005Vq-Q8
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2024 10:38:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60962426-6d05-11ef-99a1-01e77a169b0f;
 Sat, 07 Sep 2024 12:38:53 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so2742583a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2024 03:38:53 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm522094a12.78.2024.09.07.03.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Sep 2024 03:38:51 -0700 (PDT)
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
X-Inumbo-ID: 60962426-6d05-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725705533; x=1726310333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2CwdNcIB9tXV/LLx26cXgF2y6u1PTSNCri52GY6FU6s=;
        b=FkoC9S25JI7GqCB/cH9CyCjrzOkmY0SHZzncoWEHPeqI53ZDI7qMbkbq9/FcAHcbAz
         VFbdEw9Wpbn9hXo1LOkh1FPzBIXRc7Jh4LnJTViNMq4XGnPaYeUdzZ6BV8fNNVwABLV7
         zYXZh4GkoFHIdgfVyA171rvtofVq7ue3EgSdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725705533; x=1726310333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CwdNcIB9tXV/LLx26cXgF2y6u1PTSNCri52GY6FU6s=;
        b=rNEuw/CAARbAZwc7/R6xG7umDakUxcnL8Kxa/Df+Hr+CHqgLw6oLkpzKVqvOmEKBFD
         ncY4FaGTuIWzOSd02uyNzzao8bruKZ/iRCZSKuhK3s/mLfQI6dek9mc8PC92ThX2wMk3
         5sIoaLAsRWSGO8zgmvITIX2I9L9/QHcdQXW8mqmQpuwquIdwSuv2dgRP2jqR7ECqbyyu
         4L5J9SphEEAi4S6merQc4WCnF5l0zr+SmAxYlsOvxHcmCFrfDWKcVrVDRZHbER8IVbra
         M2Bo40N4MjDO8LzT5oVDF/hGxskN5FlrvM9H1wl87b1M40Fb7a9xh5+WzRh025UkCUrH
         OVlQ==
X-Gm-Message-State: AOJu0YxxnUJX6142+zjSy2CxVSTltYU7pEevTaYNmM/YRDU8ZPDW+i+J
	Sgibfebtl93wIHUiie4x0Y+dvtCNMHCW861fxmp47Z0cjAXnR1wXASa7czdjdyU=
X-Google-Smtp-Source: AGHT+IFDe69CkyHE4Nq97ZTYjKfNF5v2aG9NzuqS3isvoJdEiUzylAQ02iPjot71qkSyE9nmFP7jHg==
X-Received: by 2002:a05:6402:5419:b0:5c2:54a3:6b3e with SMTP id 4fb4d7f45d1cf-5c3eac064a2mr855308a12.16.1725705532223;
        Sat, 07 Sep 2024 03:38:52 -0700 (PDT)
Message-ID: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
Date: Sat, 7 Sep 2024 11:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
To: Takashi Iwai <tiwai@suse.de>, Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
 stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <877cbnewib.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/09/2024 8:46 am, Takashi Iwai wrote:
> On Fri, 06 Sep 2024 20:42:09 +0200,
> Ariadne Conill wrote:
>> This patch attempted to work around a DMA issue involving Xen, but
>> causes subtle kernel memory corruption.
>>
>> When I brought up this patch in the XenDevel matrix channel, I was
>> told that it had been requested by the Qubes OS developers because
>> they were trying to fix an issue where the sound stack would fail
>> after a few hours of uptime.  They wound up disabling SG buffering
>> entirely instead as a workaround.
>>
>> Accordingly, I propose that we should revert this workaround patch,
>> since it causes kernel memory corruption and that the ALSA and Xen
>> communities should collaborate on fixing the underlying problem in
>> such a way that SG buffering works correctly under Xen.
>>
>> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
>>
>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>> Cc: stable@vger.kernel.org
>> Cc: xen-devel@lists.xenproject.org
>> Cc: alsa-devel@alsa-project.org
>> Cc: Takashi Iwai <tiwai@suse.de>
> The relevant code has been largely rewritten for 6.12, so please check
> the behavior with sound.git tree for-next branch.  I guess the same
> issue should happen as the Xen workaround was kept and applied there,
> too, but it has to be checked at first.
>
> If the issue is persistent with there, the fix for 6.12 code would be
> rather much simpler like the blow.
>
>
> thanks,
>
> Takashi
>
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
>  	int type = dmab->dev.type;
>  	void *p;
>  
> -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> -		return snd_dma_sg_fallback_alloc(dmab, size);
> -
>  	/* try the standard DMA API allocation at first */
>  	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
>  		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;
>
>

Individual subsystems ought not to know or care about XENPV; it's a
layering violation.

If the main APIs don't behave properly, then it probably means we've got
a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
which is probably affecting other subsystems too.

I think we need to re-analyse the original bug.  Right now, the
behaviour resulting from 53466ebde is worse than what it was trying to fix.

~Andrew

