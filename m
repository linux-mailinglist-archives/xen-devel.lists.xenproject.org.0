Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BBA71B8E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928091.1330871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTLL-0005sS-TR; Wed, 26 Mar 2025 16:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928091.1330871; Wed, 26 Mar 2025 16:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTLL-0005p9-Pk; Wed, 26 Mar 2025 16:11:03 +0000
Received: by outflank-mailman (input) for mailman id 928091;
 Wed, 26 Mar 2025 16:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txTLK-0005p2-V2
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:11:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ab7954-0a5c-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 17:11:00 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab771575040so220807466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 09:11:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef86e529sm1056919966b.21.2025.03.26.09.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 09:10:59 -0700 (PDT)
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
X-Inumbo-ID: e8ab7954-0a5c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743005460; x=1743610260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vjq//Ay9AvSr5A0VMtoD3ipuHAoPhIoZbeOLTowXPA=;
        b=s5yIgFGAQmhFONUHa6jiErMHljm3eVc9fvdmYhYzlHxeHC/wEGP87j15gxJOuekaPk
         ENaFClEe8OPT3q1PnineQIFIXOBoNwDEfpi2rxB8s4fBPkWRwDaZ7WiKiLagyixjWDz0
         c4Z3qp09WLVwY7ST5KLm2Xm3CQd7rz5GYsDWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743005460; x=1743610260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vjq//Ay9AvSr5A0VMtoD3ipuHAoPhIoZbeOLTowXPA=;
        b=VvTVZtFkHe1MOYzL93p8BcbHmUEiepQ9eJMYajQUJh+Fx9OjMNn+7QZBjbPgebt6Qm
         3o/Tf5EAW+cAvrpGPBNsdF4yYLzVKEeEoH0dtnzOXiVBe2OTGw+ft4Fk9W4lTGo5+aT5
         lEFjf1Oo+AfKonGwZKiHMUku6jTmcm1idRHY3hP4OEuAZEYcTpBKyAzgLovr98BiklXP
         2DGD8hRv2OUSz2dSVx44PjTOHiP+zLKs17+cKn1yGMq5zxTwjwHbYvVTSMoo8FkSqsOV
         W5NgHLcizNMgRQq3Z9yclRtzqlP2iv7QwI1ZkmNU2FpOzTVCbfMrpaHIoHpPdRazKwlL
         w0nA==
X-Forwarded-Encrypted: i=1; AJvYcCV+72HvrtVrQTh/S3LiIW0Rn0jb1QBojCUB3gihXs8FUkMDdh8jKOt1FymZZ0FRCTTO27/ATfsJDHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy71cYE8DCwto7GfRV2ShUYr8wocukRRN7kW1QMgnltxe7pGS/h
	SfsVuxRiv2w9uS6seXwP3EmweZq4kkp+Inn0kgrWMReM9ueNXMtuxFabriQdfHg=
X-Gm-Gg: ASbGncu0Ut0b1d8RK7Eic9zSUqeIxacbdtmB5SwLPMMinJZGYL0DLzSSCcqJPX4nYNd
	bRuE2ok1vwK9W0nJvukW+JWpqyP+V5MYGdKfQ33PYN+C1jttXAljlcIO4ObL06Q2VPu1M90/oHN
	ZZ4zJXh4xPbu3O0tBGGAacmmP8K/z7YYUOxVT4f2gck7ZfkoNNf4ysHf5+9iIPRT6XxPSNC4PNg
	r6ZB5X1IeMXauwo45+jxagcve7yaCs7PAzUxlFjorztJO6Ag4W4h7tmNhf++6ZwlMcvxddB55K1
	WMljkz8waqDm0ftDrxvWaOEcK56/EZO3IxMjJJ+TWohJB1uS3Q2nd03vMVCTJzGJz2tp1Dwfw0z
	87gIgX8cLrw==
X-Google-Smtp-Source: AGHT+IHrbUDmpQ4d+X0qbNuncwvsqoK6JHWS4D5t7xznyETaIM1ctNbRzFbHV55UUGVd2fwwmnkoUQ==
X-Received: by 2002:a17:907:6eac:b0:abf:6bba:9626 with SMTP id a640c23a62f3a-ac6e0a0fc82mr396975266b.12.1743005460031;
        Wed, 26 Mar 2025 09:11:00 -0700 (PDT)
Message-ID: <2f59957f-743a-4c29-912a-3fdaf137cbd6@citrix.com>
Date: Wed, 26 Mar 2025 16:10:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] remove qemu-traditional
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250326160442.19706-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250326160442.19706-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 4:04 pm, Juergen Gross wrote:
> Remove the qemu-traditional support. This includes the Mini-OS
> based ioemu-stubdom.
>
> I _think_ rombios support could be removed, too, but this can be
> done in a second step.

XenServer is still using RomBIOS, because qemu-trad and qemu-xen were
not inter-operable and we needed Windows not to go a shade of blue. 
Therefore I'd prefer if this could stay in it's off-by-default form,
rather than carrying a revert.

~Andrew

