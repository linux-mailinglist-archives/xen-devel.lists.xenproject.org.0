Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLTVIzRoDWquwgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:52:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439895892F4
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313639.1583756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbie-0007HV-P0; Wed, 20 May 2026 07:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313639.1583756; Wed, 20 May 2026 07:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbie-0007FM-M9; Wed, 20 May 2026 07:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1313639;
 Wed, 20 May 2026 07:51:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPbid-0007Eu-9R
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 07:51:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPbic-00BwW4-I5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 09:51:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d681a-2eae-0a2a0a5409dd-0a2a450cce12-2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:51:54 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d681a-62f1-0a2a450c0019-d1558033e99f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:51:54 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso25231775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 00:51:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe5821fsm124538085e9.14.2026.05.20.00.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 00:51:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779263514; x=1779868314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5M2MIxiyY2Qlw+vztBjaaQeX4qsekWqJLMuyhBvHXVQ=;
        b=PQdvF1MS7nXx1UtTDbVJYgrrpZEYFuae4VCy1+azeOClZO93WOeeaULE1ZT11pjyJz
         pGLd0ZaTzSbEAwf3+RhOOzURqHCqjpaymTe3m02nF86H9O+Kc+mQVTyD9IDPKRq8h21d
         F3iHn+xrNeFVUy7EDxA9Hy6iPcKzVPwsQqqgDAsN8Vl6iy4zbHH8u8Q+AcYHR9VCulMm
         nNkUnBILWHhR+QWU3SxggL2oQHNPNhDiqyZgrjMDb/Is4tyLdWTByk5p8PRi57/UQmKV
         Rc3kbmvqO4ukabZ3mBMjjK9dASXu9jCzVHwWPnihYXEEkt8Y04DUsvEgqVe8y3U01fQk
         35hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263514; x=1779868314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5M2MIxiyY2Qlw+vztBjaaQeX4qsekWqJLMuyhBvHXVQ=;
        b=pUL/UMkGB7R4iSWO3d3c8YwxhMzNCCHelJqLw/+KP7IhJY8aKVDw7Y3jhx9Xp4WBBD
         7lhVe1rgEC8fFI/VMtwoNwEA8n09xMw0ZHSeTA1mcNpWcTY7evC/Rf2t0SJ4z7xrlTfx
         QzNVU8N+6j4lY/vv2Z9bO4YUfA9ow/2Q817lyqAjPuA6Ffmyx/RPwmTPqHEjSlQ4ruTM
         FZKxYFGx3DlW41RAFPbUWy0ARTNEXRsYtvLdoATs8EJtZ8FOdUOkBYPN4SSeSprk8I4T
         im5lOR9eJiJlk3o8XC7i7w3GKKVW5OQFDM9MV5E+x7G5dqPuS0ADGS1KCZb2Sr1SBS3H
         4YeA==
X-Forwarded-Encrypted: i=1; AFNElJ+yQdQnrhpz9SB1o9kNX7ysSVviojgKAsGB2AMt00YRTLx9V00Oucc2Rwa8zHvnMeeDU4gXhQGwZVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDPbjGcifTGYWBEDnn/NGZgZoZAWJzWdF3FwjmS07hLuthoFDt
	GQKAGUVWly3GRmGazSzmcScemEo62ud4zgq6lVr7ZYstmuCan4pUfqg3
X-Gm-Gg: Acq92OFs+0P6ZICCBKq8S+QgmNuUcMaAfUZI4S5XhuONyivkc4H0aA9ej5P/knPT04F
	ZBwgNLIkXDQK77UBGPDWbp5tlqsn2dNeo6kHyt3Ut+qYh8Q3LUysj7r5buMVkVcXAR+hqwdG8dQ
	GMOxGhz/u6mgBY9ZuxyLAtuRUFgpkIU5qcFOv7XT3hl4FurgloBgKwYLiJC2xSsZHyw21H7H8fz
	QlqbOEivCH9SSK1dey1rBBdPFiM4KUT+yMLxVFWNGnAb6CSezx4dx0HhxzCI4ZXvYVn7o0Vxt9X
	c+Emf4DK+YPfDaiWUhYlZEp+wyMRkIBg1yRlY0ovu2aNlVVP8xnBr4v+Tdy6tyLA0tLzx/EGlaD
	aXbkNxfyFloLh6rqjB99iAvP11kaDBdt9ib6ARQeRYaa8NeAlUzha7AJf0nybcglp/r6vqFmysl
	rm15ddkBSu3Tq7GmNgzs0+0epf9h9aiIag5/3cEt3ClXtTzZg9L11cN+ELOvIns4NqG4EXRy+v4
	GlVGhYtJpjtjw==
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr324899015e9.31.1779263513574;
        Wed, 20 May 2026 00:51:53 -0700 (PDT)
Message-ID: <bf22c29e-3388-4531-b14d-dc32198500c1@gmail.com>
Date: Wed, 20 May 2026 09:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in
 fdt_property()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
 <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
 <e943765c-45f6-4802-bef6-e2fffd49149e@gmail.com>
 <8ade5ff1-a702-4a91-b596-a98833716c20@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8ade5ff1-a702-4a91-b596-a98833716c20@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779263514-E1F6ACF5-A2DC0F79/10/73395122804
X-purgate-type: spam
X-purgate-size: 1354
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 439895892F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Michal,

On 5/19/26 11:37 AM, Orzel, Michal wrote:
>>> We treat libfdt as external library and we don't accept any edits here prior to
>>> first sending a fix to libfdt and then cherry-picking a patch (in fact, afacit
>>> we then do the libfdt version update).
>>
>> Thanks for clarifying that.
>>
>> Just to be sure I don't confuse something.
>> According to the commit ...:
>>
>> commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
>> Author: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Date:   Thu Nov 11 23:27:20 2021 -0800
>>
>>       Update libfdt to v1.6.1
>>
>>       Update libfdt to v1.6.1 of libfdt taken from
>> git://github.com/dgibson/dtc.
>>       This update is done to support device tree overlays.
>>
>> ... I have to send this patch to git://github.com/dgibson/dtc, right?
> Yes, that's the main DTC/libfdt repository.

The patch to dtc repo was accepted and merged:
https://github.com/dgibson/dtc/commit/f57e7df35df4a301961cbbf9433ba4e85c2ee5ed

But current version of dtc is:
   $ cat https://github.com/dgibson/dtc/blob/main/VERSION.txt
     1.7.2

Does it make sense to backport just one patch to Xen instead of updating 
update libfdt to 1.7.2 as it would be necessary to apply 61 patch on top 
of Xen's libfdt 1.6.1:
   $ git format-patch v1.6.1..main -- libfdt/ | wc -l
     61

~ Oleksii

