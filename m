Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152FACC626
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004276.1383939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQPM-0000TE-5f; Tue, 03 Jun 2025 12:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004276.1383939; Tue, 03 Jun 2025 12:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQPM-0000RZ-1v; Tue, 03 Jun 2025 12:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1004276;
 Tue, 03 Jun 2025 12:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMQPK-0000RT-BZ
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:06:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26995fb4-4073-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 14:06:16 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so21561715e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 05:06:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5005aa64esm10970384f8f.70.2025.06.03.05.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 05:06:14 -0700 (PDT)
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
X-Inumbo-ID: 26995fb4-4073-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748952376; x=1749557176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ged95j9C45XK7HEYC2aK6rKqhsVUuq6i2LaonLanmME=;
        b=Y/KRf5T5nK1f9WPLlosVd6L9naXXaRueHpRx8cEzbUoiHUqFLm3jYcvwBEaaXQtdZE
         OQ39AnflXDBeZ/Gs/j3QAIA44rf01D3aPavLwA0QPx1V9CNW+XAUSUaiNGHOxCXH/1ge
         Kvl5bpO7XdPLw1qaqEheWWD0npuZtUWlYE4T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952376; x=1749557176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ged95j9C45XK7HEYC2aK6rKqhsVUuq6i2LaonLanmME=;
        b=JnoO89TyaQxKX+jP+GUbqhXfe01PgGGTMH+3JgALgP1ZWLvYfjRP1EmNg3py30SFdg
         aeWrb9drJwpeorUzk3+iqtaxkS4f04ORn0JFKL2T/qKaHU0+BFH21hZVfXri425tKl7I
         Zj1jJG0KnvTofgSFPXtm51VyhPHRTNUTYsF1wgH39vabvqJa3au8YQ2SA/zAI9BUfOQJ
         u2gP+bmLJio20JJeTho+BDPsoBXRwZ1UdgIqeNdDz/zM7oTgNRl6/j4mxtKn5yxIaHGs
         54ucv3jQIAYkVmk4OZDU/kcvDcseZ23yGKkjghNk5FIlFfBJMAPTE51jZP6X5Iz/uEZl
         iBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9tNO5g/9/6cgD5So3WmlEemita8vUe/uR7DL6PFL1xf2450QHh+tmxPvFHeHbIDCOES7BX7vd5L4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysgxXjHijZiDTwitR5WOos9Dw1TcwuASFSFXoPKBc5t4jDAioc
	eV0fbSORwiQyNoUyO8fPTl5wBJ/pGQGsQan0b4xYZbBdUZtPYL5sPj0c4kF6pUebUdU=
X-Gm-Gg: ASbGncsPjdEga22UYMX7SWN6qT293SAKHe5vTPGIUp9dbxMMh+5KC2oU71dUfTFPw0h
	ugrX4fJZhrGFvjsKMMWWO+LAuvUEymw1Q3M+VBptfpmgi3dBmyC9mS2gqYt5VWIPqkFQk6OamYP
	UHYMMSiTygQAH/Ilo8FLorTMDawyX4F7xDLGg6ki7P7Psq9O2OBSa4gjC74qaP2AKFVQCtyjRsy
	xwbpDro46GZt+QaGD+/90vBdLtaDfpmVjESVBB1SPyQdeoQ/IIzyyKb0/iv2dqm4cKRqsVsyod9
	noPbAFdZsHWZeGnMWIX3rEoig8XBDd0mq0+4a2wzlD6TQ5zCAURO+eNKaPhyUure00bvMZeM4ua
	Agj9qDqYA0G4ZW5Hl
X-Google-Smtp-Source: AGHT+IFdlkleCcid0kp5qu918P6/S3TKTIo1gxVMh3q/KJaDRlcLAQxU124rnH63aaJWN+Unfyb5xg==
X-Received: by 2002:a05:6000:2313:b0:3a3:7638:d754 with SMTP id ffacd0b85a97d-3a4fe17ba86mr9629552f8f.21.1748952375569;
        Tue, 03 Jun 2025 05:06:15 -0700 (PDT)
Message-ID: <fab625d6-ba8c-4ff6-bb98-895af78151f9@citrix.com>
Date: Tue, 3 Jun 2025 13:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] efi: Add a function to check if Secure Boot mode
 is enabled
To: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-2-kevin.lampis@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250602134656.3836280-2-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 2:46 pm, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Also cache it to avoid needing to repeatedly ask the firmware.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>

You must CC the maintainers on patches.  If in doubt, use
./scripts/get_maintainer.pl.

> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 7e1fce291d..b63d21f16c 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -40,6 +40,9 @@ void efi_rs_leave(struct efi_rs_state *state);
>  unsigned int __read_mostly efi_num_ct;
>  const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
>  
> +#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
> +bool __ro_after_init efi_secure_boot;
> +#endif

This doesn't build on ARM

arch/arm/efi/boot.c: In function ‘init_secure_boot_mode’:
arch/arm/efi/boot.c:888:25: error: lvalue required as left operand of
assignment
  888 |         efi_secure_boot = false;
      |                         ^
arch/arm/efi/boot.c:891:25: error: lvalue required as left operand of
assignment
  891 |         efi_secure_boot = true;
      |                         ^
make[3]: *** [Rules.mk:249: arch/arm/efi/boot.o] Error 1

I also don't see an answer to why there's a CONFIG_PV_SHIM special
case.  Shim has nothing to do with this.

~Andrew

