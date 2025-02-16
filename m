Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3AA37634
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 18:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889613.1298677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjiBC-0005sZ-Sl; Sun, 16 Feb 2025 17:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889613.1298677; Sun, 16 Feb 2025 17:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjiBC-0005pX-PU; Sun, 16 Feb 2025 17:11:42 +0000
Received: by outflank-mailman (input) for mailman id 889613;
 Sun, 16 Feb 2025 17:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtIa=VH=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tjiBB-0005pR-ST
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 17:11:41 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 156406f0-ec89-11ef-9aa5-95dc52dad729;
 Sun, 16 Feb 2025 18:11:38 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5439e331cceso4325918e87.1
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 09:11:38 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461cfdd5a2sm295605e87.39.2025.02.16.09.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 09:11:37 -0800 (PST)
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
X-Inumbo-ID: 156406f0-ec89-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739725898; x=1740330698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5bPpUhIsfcQ4o6q8G649M7V+gaMZ3fueq0GYvyu/so=;
        b=WEOebzUnh/RROG7C/I7qdGBu3wnBEuYqeudZiym+ROoaUBopbCIj11Fyohg4Z5sjYk
         q5fbErfWmJ1GKuQu1s4lVfZ1Hdbx2070VVYR9rPwcAj994SS0BuZ7uMqOnSn61g2qrUN
         mpIj4ezsr53MOEEYkyaK9lAGColVLRn9CyCQZjQ0oGold9x3RqIwTlbfsrmWZsnY4Iqm
         1qeFMcPZ46xbalhiYk0rbe8eY8g1hfhumxgckSHeYQ3hjmxuV2Hv5knaGKQnKnK04dYs
         Co1U7XPAwXSGAlzRBcfaMFWMAZmsGnTxDSC+oxSw9MiIXMm01zTiDuvbqfy24G3wUNri
         o2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739725898; x=1740330698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5bPpUhIsfcQ4o6q8G649M7V+gaMZ3fueq0GYvyu/so=;
        b=FZufWRGD++c2GTKTDsE/B6aUYEtnwvXP1Hvg8qOTzX0jkbKzrzXKCEMaMjDdCHVw5v
         ZqY7yNoeI1sY4JkW7MN5tO7oHbQAxh7Gqr50hDHjbJfkQpCAPnlBN/XYs7YCKpYC5+47
         TIvtvGywAfGXEgt/xyrlhaRfiQayYWubkHvK3I9HJDGugSo+qn142EEAUtCylRzMcNrS
         r2aLhFBK7jfZ/2sDPK7M9uX0LIiIvB8XDtOHlTI1LyXRB0kz8a1lFObe9qSnpdtCooRC
         IkkSVqMQ253nZoOyxa0ymEZdIGyAQEPbaV+wqCXVXxphkCP1xxtixPLsyWooU6V1TH1v
         qFEg==
X-Forwarded-Encrypted: i=1; AJvYcCVGGS8MwHgmJq1ESFGY3KYVD8F4nQfA6nG6tr2i5CpxV873xDCDDRUTVllSa2ejN4S1nxeqeeMlbj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIHXiEhnCzk0Oh8ZnRJ+3wgdz19ZlLDp41+K8t3uA8r9w30FFA
	SpBwM7XrdWFw1jSfRRyn6tP7lPa6kl5g2EBBGJke9PyZ6lzwDZhv
X-Gm-Gg: ASbGncsSkrwZaX7eGIypJMkUGLg4dB883eAMZv84aOwVBQ41YPgOwBUJbAw4qoY9ScI
	clyvuMQIhCEFCwl15BMwr+qChKjI73f0918Tvo39aLgv6NMl+1kCKtzqrun5eZegK2PcLtN0t4u
	xRa3krInnasvV3isammWZyvHlwSpqFqormzuvx8Udi/4IA9UfBZHDtAcQIXHZa9DRvdV28FoXp+
	gz7M01MUhN5rsz2IXYR+cuW3jn0dcK0NL9/vEZ6+SQfjxn+36XhAm4582gGa3IFsx+tPmAhoJqx
	CcuL7uRizGGFHyWn
X-Google-Smtp-Source: AGHT+IGprJ5562UJxsxoiz3h8kFieWTusPEmkwT4SGUbH0NfOo4fE2VQdziignHfAwVSBCecLGSpTA==
X-Received: by 2002:a05:6512:1194:b0:545:a89:4dc7 with SMTP id 2adb3069b0e04-5452feab102mr1794228e87.52.1739725897756;
        Sun, 16 Feb 2025 09:11:37 -0800 (PST)
Message-ID: <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
Date: Sun, 16 Feb 2025 19:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Roger!

Please find the branch with all the conversions [1].
Unfortunately I cannot provide a branch as seen with
diff --ignore-all-space as such a patch will not simply apply.

Stay safe,
Oleksandr Andrushchenko

On 16.02.25 13:58, Andrew Cooper wrote:
> On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
>> There are two diff files which show what happens in case the same is
>> applied to the whole xen/drivers directory:
>> - first one is the result of the "git diff" command, 1.2M [3]
>> - the second one is for "git diff --ignire-all-space", 600K [4]
> Please can you format everything, and put it on a branch somewhere, so
> people can browse.
>
> ~Andrew
[1] https://github.com/andr2000/xen/tree/clang_ml_drivers_v002_diff

