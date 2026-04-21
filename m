Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM7WOhNW52nz6gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:48:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDB439BCB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288865.1569097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8e9-0004wk-Jq; Tue, 21 Apr 2026 10:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288865.1569097; Tue, 21 Apr 2026 10:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8e9-0004u8-Gm; Tue, 21 Apr 2026 10:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1288865;
 Tue, 21 Apr 2026 10:48:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8e8-0004u2-4L
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:48:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8e7-00ECQx-5s
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:47:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e755da-5cb7-0a2a0a5109dd-0a2a4504d46c-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:47:59 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e755de-1dec-0a2a45040019-d155a736e1cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:47:58 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-59dcdf60427so3665870e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:47:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185ad0fdsm3633203e87.13.2026.04.21.03.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:47:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776768478; x=1777373278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5YmlL2hT0KtsZVaCj5CBsqfzKc6l01c1MMkDFyMd+5g=;
        b=avVGPwbGW+AWOIdNmQ46Nwq6r692NizuuP9MBzezOWuVP5SycO1waluuUrhc3yDxiP
         jPa6NxfB8mzEhnQ4UDGDtX+bJSgiI8iUDwcrFBDWxk6bRV66UpoGBsLsqehmZnobLcf1
         TsWY/bfDdC6v5iW6Bd+ccs0E5BcwrhMVwKu0yGnyLuJBxY/wCZSM8xlpqFfAWu7ZY58R
         GXZ9eY2iRsr++OSpt4g7El/pYraIHLoeffOPxTk70UBoJNIjyTTSRBDH/5aNHiVeSU8d
         3oBgaoQA2nZGPZreKksuWIXWuSFF/9bP/ITez35aT/WxFie2oFSpsp8PA1hv1enVlCTK
         65Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768478; x=1777373278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YmlL2hT0KtsZVaCj5CBsqfzKc6l01c1MMkDFyMd+5g=;
        b=JflUfacqPAa/PPoHTHIBF7+nRAHRU1/+exY+BO4TWDHJKDcuHIDEdCFtyMtNHM3R2U
         i98xFOWB4J/EtbDvEXEWU6IWzRzOxS8dh7xtM1jYzftdfukZ04+f0U2nLF2bRJTgvLoY
         khAwkKbCDMCQDJAtw+hKVmz4WsZJe0f4IMsvqbi9JQVKP24Tw5xWf7w3oC0ZBHF9kA6w
         FI12btTc737KiTgVW8PgjZqAZm1rSFtxEF4LtbhSn8yM5i5ZLB90QG+fxpG6KoA/LHSe
         X8kjDYgDxXW/yslke6uPoI5rH37fsM5AgRUJuGsmNhhitvFhOMcO11EltHZbYSOAVvqO
         WSYA==
X-Forwarded-Encrypted: i=1; AFNElJ+1BT3W5C3w5S4u7b+H3IB4OnoePZb0zNzGs1a+QyOjco4BHGIJcI4di7gew+4p4OvemXqvlNHzbA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVYYdOM0BcISuFzJPjJE9SvAcY8jArgkqvC/uDKkNocPEH+4AP
	WtSvcB7A3M4D5ukyqYOsY2qIJrZHhX7ceiWrE8E5fn47runCppsZnVKO
X-Gm-Gg: AeBDievGY65ETJNxXQB47b6H/gkviJmx/XsGlq/GWEfzbxSHlE1BxOV1F2syJUu05LA
	ZHiswf58jTKIonbsfsksF1xFo74iD0kfiS5cAtCww82qMSiL5Mb0O1BS5cqDyBdmal31s2ofiDv
	y3DUfEZjcDJD5uSvOYsBpEVUD8QFoHJnU0BgjZUQ2TQd62dGOBg26YuYVauwwj95dnCHPf5hqNi
	7Tzf3uiEfWb7H+MZt7HTIvkY2XThHS9bVdC4tlPxf7VS9RrmRmNROkACRnvWFMNoEHf1eRTHgoK
	S6AalZtwV4nJWMKT/As6jZcrg2D2jHwPSmdMr8Xi4sVrb0dBsVKpjRo6UTKStBfkB2pyfgCRpM9
	bG6vR3TY9fDtezJw02dHgsu8190zRqvRj9N3lyDbqJcx55TKboVzaVtuY8ahVkEMwZAR+K0NQyY
	SgRGmo3yVfdHJb/4BK316VnSc33D+Uae1oMMhZeGDfrxONWA2fFRLSekbG6+MT8pt16NYSTYpud
	a0gugUglj1T6lT49xDgdL6X
X-Received: by 2002:a05:6512:1287:b0:5a2:bef4:5e8a with SMTP id 2adb3069b0e04-5a4172d368bmr5752769e87.18.1776768477811;
        Tue, 21 Apr 2026 03:47:57 -0700 (PDT)
Message-ID: <120bdb84-4f1d-4e26-aff7-2832fde245a1@gmail.com>
Date: Tue, 21 Apr 2026 12:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/dom0less: introduce free_phandle in struct
 kernel_info
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <58f59a071f6329acac610688a6c25b67b30e5b92.1776340422.git.oleksii.kurochko@gmail.com>
 <6188df37-47f1-4b46-8b4a-56316221b86c@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6188df37-47f1-4b46-8b4a-56316221b86c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776768479-291763FF-B9E29561/10/73395122804
X-purgate-type: spam
X-purgate-size: 1621
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 65EDB439BCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 9:26 AM, Orzel, Michal wrote:
> On 16/04/2026 16:20, Oleksii Kurochko wrote:
>> There are cases where it is necessary to know the next available phandle
>> number in order to generate phandles for guest device nodes.
>>
>> When a partial FDT (pfdt) is provided, special care is needed during
>> initialization of free_phandle, as the pfdt may already contain a dummy
>> interrupt controller node with a phandle assigned to it.  free_phandle
>> must therefore be initialized to one past the highest phandle already
>> present in the pfdt, to avoid collisions.
>>
>> Since free_phandle may be needed for the very first guest node generated,
> I would prefer next_phandle rather than free_phandle given that it always holds
> the *next* phandle to be allocated. Free is implied.

I am okay with such naming as I had it before and decided to change at 
last minute.

> 
>> domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
>> The new call site also aligns better with the existing comment stating
>> that domain_handle_dtb_boot_module() must be called before the rest of
>> the device tree is generated.
>>
>> Introduce get_next_free_phandle() to ensure that phandles allocated for
> The name is a bit confusing. It reads as "get the next one after the current
> free phandle" but it actually returns the current value of free_phandle and post
> increments it. Let's call it alloc_phandle(). This will also make it clear to
> use the return value of this function instead of directly kinfo value.

alloc_phandle() sounds good to me.

Thanks.

~ Oleksii

