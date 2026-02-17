Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGAmLkR6lGkfFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:25:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E0814D201
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 15:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235089.1538135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsM0a-00042B-AH; Tue, 17 Feb 2026 14:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235089.1538135; Tue, 17 Feb 2026 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsM0a-00040e-6m; Tue, 17 Feb 2026 14:25:00 +0000
Received: by outflank-mailman (input) for mailman id 1235089;
 Tue, 17 Feb 2026 14:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsM0Y-00040W-Sy
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 14:24:58 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f6aacf9-0c0c-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 15:24:57 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43591b55727so4840335f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 06:24:57 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm33017272f8f.14.2026.02.17.06.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 06:24:56 -0800 (PST)
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
X-Inumbo-ID: 6f6aacf9-0c0c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338297; x=1771943097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESAYbCeAFiBtqBsvgDD9QRieKLFu19ZNqlmy1HgcOag=;
        b=T2DFuLc8sBhRpBdXq30rSWgYNIIG58CmxId5baFlVUwgIIPlrfK7DtEi5HvUCXSeGP
         HA3WWbFFyjv13O7SDrJ3hsw7ffunoRdMulKQde2pdzFnUhqYlGshYTlupddhy6zGekUa
         Ohiqco4GjRmsHhVZGsabsMLkSPsSWdsh4bhOZj5QwPLCp011Pq6ZAHZDhCG4OAyT/+x6
         oZMuC/yKXVnluFMGoUXRyxiECAw8hvc/1Gy9Bi2iRT+TYlY7RimMzTMgvYLi9rNBi2Xh
         CnhHwi2MWNaHK1tsCRX/6Ag+X/DOh7y1rCGKGe9uNYSeUMHsWgn8ep0Iq5sXdol+mujO
         OM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338297; x=1771943097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESAYbCeAFiBtqBsvgDD9QRieKLFu19ZNqlmy1HgcOag=;
        b=tBPAQ5DkrQRzkWgx30JWLgDx3K7pl1P5zYBzKtrpN35STu1tVm+/tY5WJBzLUVc/yP
         sXv6epVx4is7dUT2Xvkxol4FbOU7DAl046Bq5UIcUZspVdozdsR7h5XLWWDGXAdhMiS3
         2hb7FSaPAf3Mo4EoAgqLmk7GtwiyJ9GrFfZaVA5yj8tR9RTrDbExEW7ZxIp3UdNrf3Ev
         bPT5y7aYOpa5PJSIEWqMrRNIl3IYWg+Hc7hum8pfgoIGbjitzTQ2DWrX3BlweCTNcgmi
         PxjJTUYQewIBsg5vjdRTZ7jXoNxjH4FGZopE0Py43rFERpiUVP8Ez2VlkzAh2PRLa79m
         ePig==
X-Forwarded-Encrypted: i=1; AJvYcCUcClFNweh9VcrK2GbmgyMXQXzjhAYK2qgZYCppZ+dCTGZ9+NGzs5Pip5pxCD2CmG979Z9vDYTwfGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPVRyaEq6hytRbxEUNN5a4307JrwBZsWcMbmBJUv/bZ8fcMvnv
	XIkn88/v/XECfHfAzGd6/uj4XbpYU26kZy9xNWI7ksxMcdyAY5HjNsZ6
X-Gm-Gg: AZuq6aL0yOddb5Rv8WzlPTIkCZfrSjVgRGXttZcrhQoVUB61vca1n/+GgIjfVAaSZH8
	9yVkqvNpJfYTFEwi7yzeE/t9CD09K9jad69nrvrT6z4Ne9/HxVp8632ynxz54B8juIsFJ6KvgVm
	5q3MHmMuRMDHQ6UoMDAYnB99kq5MDtgMdZbcJ9nCzJTXRP+79RYTS8F0jotlZOCg5nNzKw9wffD
	ngFVgBituYI8TuLXAaOSffvcEheXXJ2kQaGvvh9d72M9nD1ulMTEHmks2FF/pu1GwqT7s1VTgiG
	GE9C9CC2/kQBF/HiVqiztQddAOfCDBbNmaXUcWiae4rt//zsV/4q/zmgwaJuRR6fAb4E504pLmW
	RjAJWpE7VBzTuGHK3WU7SDQonSN11HU3hkgJVedOYvPBPdVVbX2Ay4gD8LP3vXuHjSvFOEVLiR3
	wglAnOS3Xpj0pvtJwjVSftBLbFHfZlW8q4KC6wzSVGWUFyWIM+aKt91ESYvgRF3RU5fuCP6XYQo
	U4=
X-Received: by 2002:a05:6000:1844:b0:434:32cc:6c86 with SMTP id ffacd0b85a97d-4379db61567mr18639084f8f.14.1771338296798;
        Tue, 17 Feb 2026 06:24:56 -0800 (PST)
Message-ID: <4f92f3b5-05ec-4629-82f0-5ae492f22d37@gmail.com>
Date: Tue, 17 Feb 2026 15:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] xen/riscv: build setup code as .init
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <d2fcbb9248ea1659aa953e9c8a8bde1c4a2282c0.1770999383.git.oleksii.kurochko@gmail.com>
 <f2aa9384-dab9-40a8-9c21-2c746cf2f780@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f2aa9384-dab9-40a8-9c21-2c746cf2f780@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 56E0814D201
X-Rspamd-Action: no action


On 2/17/26 3:03 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
>> At the moment, all code and data in setup.c are marked with
>> __init or __init_data,
> "... which is intended to remain this way."
>
> Nit: It's __initdata.
>
> so leverage this by using setup.init.o
>> instead of setup.o in Makefile.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (once again happy to make adjustments while committing)

I'm happy with suggested adjustments. Thanks a lot for doing that!

~ Oleksii


