Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E022F866C0A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685301.1065780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWGi-00017o-Ni; Mon, 26 Feb 2024 08:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685301.1065780; Mon, 26 Feb 2024 08:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWGi-00015i-KM; Mon, 26 Feb 2024 08:23:24 +0000
Received: by outflank-mailman (input) for mailman id 685301;
 Mon, 26 Feb 2024 08:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4NSY=KD=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1reWGg-00015c-SG
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:23:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf8fc38-d480-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:23:20 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e4765c86eso322359366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:23:20 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 fj8-20020a1709069c8800b00a42ec98b9afsm2127370ejc.158.2024.02.26.00.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:23:20 -0800 (PST)
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
X-Inumbo-ID: 4cf8fc38-d480-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708935800; x=1709540600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHkkhH3shB94Aa6njH/RF4O9pI/05EhqdX+P2NTRny8=;
        b=AfFyQewjQASx5azdB3zGaM7h0qgTHfvtQ2F/0gw7UlMsp3Pz+qYfY8Pwrb+5CHBgQq
         O8m1k41Eykei1b/qBj1TKqdxEc/LCoJOGniRzSv7ISaLZD/D2mixQ4We0Yk+HpqOc+Lc
         eJIYF4ciS6x4EXFIWM6glRTP5chuiEclzn2BGbYsgjV1GfcyPZgO3ByXAIecLTwd5oTn
         fy4sDv8Q+Ni9IfWNgJWgRECwxPQA9aydGA2dsoDh5adDWsXkbHQlenX/EtY7JP9FBUwm
         FeXSh3LOma6GvyK9C36uOpGDvriDutqVXvZCYSQd/sxtDDT4ZAzLrRXpMQ1giggTtuoO
         SwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935800; x=1709540600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHkkhH3shB94Aa6njH/RF4O9pI/05EhqdX+P2NTRny8=;
        b=UKvvAzM9nVuLlis3dJO46qUyoOG7gSzC79r7BWL8U4jASswEN494jBMb/7b8lAjSIY
         2W67XScVG5QDqxQ9ulz8WgSPD95BloXEYlMk9OuuE6TwVmztMTL5506GQLspeVYMANjh
         JjHYLXztBF3+m4syIyNnW23iI6xpI9z51WbT0fk8T0ZPjtXwJ+2TJsQ5SZnErJwLuzfA
         uSTFiGo++7Tm1t1RCRFRYerP+wo3yxGfcopWnmS/n/aKf5NmPwiraqJLPwP5XfyWJfXO
         iH3iOwbCo65ud819rJE+52DTdmMH/BYfxY6V1/r6AiEgZnFlBl+naBpKUFjjTGRHeCN6
         6Gyw==
X-Forwarded-Encrypted: i=1; AJvYcCXgT5I8/bPGVc2H0MDe7M+Y8+YmYnb9z+0ScdSBBlBFgAyMGJGM0rySLozaCpGGBqbi1kKqHEzdmOkw2xe1aWMf0jJI8JQayQoLGJ+YD34=
X-Gm-Message-State: AOJu0YyyVTYNWL0JNiIpARPSfs8VXx82Nbm5gCxXjEFFaKTt5+CHwq2p
	PXDnXt+c15nBNzSxutCEdCUJH6OAvYQYHidfy+7iL+p7DA5QAnd7ih9DTeGm3jk=
X-Google-Smtp-Source: AGHT+IHOnMGtNqT1/asAZtr5MYy0RSUUVEKYMToG1GqpcICWSSVYwVWbEB7USOctPs4WSxY3+ruo5g==
X-Received: by 2002:a17:906:40d1:b0:a3e:93d0:3443 with SMTP id a17-20020a17090640d100b00a3e93d03443mr3955053ejk.34.1708935800385;
        Mon, 26 Feb 2024 00:23:20 -0800 (PST)
Message-ID: <601bae2e-4e42-4e88-aa97-e94bb4696ab8@linaro.org>
Date: Mon, 26 Feb 2024 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/xen: detect when running inside stubdomain
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/2/24 19:16, Marek Marczykowski-Górecki wrote:
> Introduce global xen_is_stubdomain variable when qemu is running inside
> a stubdomain instead of dom0. This will be relevant for subsequent
> patches, as few things like accessing PCI config space need to be done
> differently.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>   hw/xen/xen-legacy-backend.c | 15 +++++++++++++++
>   include/hw/xen/xen.h        |  1 +
>   system/globals.c            |  1 +
>   3 files changed, 17 insertions(+)


> +static bool xen_check_stubdomain(void)
> +{
> +    char *dm_path = g_strdup_printf("/local/domain/%d/image", xen_domid);
> +    uint32_t dm_domid;
> +    bool is_stubdom = false;
> +
> +    if (!xenstore_read_int(dm_path, "device-model-domid", &dm_domid))

BTW missing braces for QEMU coding style: {

> +        is_stubdom = dm_domid != 0;

}

> +
> +    g_free(dm_path);
> +    return is_stubdom;
> +}


