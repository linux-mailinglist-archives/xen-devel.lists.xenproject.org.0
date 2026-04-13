Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBmXGpIU3WkOZQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 18:06:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC773EE511
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 18:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281278.1564269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCJn9-0004XM-QR; Mon, 13 Apr 2026 16:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281278.1564269; Mon, 13 Apr 2026 16:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCJn9-0004VD-NL; Mon, 13 Apr 2026 16:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1281278;
 Mon, 13 Apr 2026 16:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCJn8-0004V7-Ct
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCJn7-003mXt-KV
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 18:05:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dd1444-2eae-0a2a0a5409dd-0a2a450bc5c0-42
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 18:05:37 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dd1451-bca8-0a2a450b0019-d1558033f134-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 18:05:37 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso72093245e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 09:05:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5396293sm290575095e9.15.2026.04.13.09.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 09:05:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776096337; x=1776701137; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9kSlr7M/cd/U+HrSMaeGiAGAoMt2Lf/q/IlZijcvCc=;
        b=fB9K0qLMWas0PF+PPJVXRm70qwrbkEJgn600TzT7AOSrqf2T/BFsVJSwtg056huA9Y
         kfU/ECnSEqTHblvEq/hXysrZbSvhY80D0avyvHlrEC1DFLeabTM8DmQs4aTAL7ICOAhG
         mtStvVAvK7FaV9nuFOnJ+zrIAwmOgA/wReQNi40lWFCcN8i0l13IgC0CLovrKU2MTvMc
         +s6eaahEhJ1ra86qywxzwlc/xtAtZIoVEHhYN51T3l3Rbowytl+PF5mSWQjSZ1tk3bkZ
         Y7vWEyDyfFPNDiW3hAc3j5g9ggDDfFscRpVGdAAHurQCKG+OR6Is/0+oExlBf/3FXddC
         9+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776096337; x=1776701137;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9kSlr7M/cd/U+HrSMaeGiAGAoMt2Lf/q/IlZijcvCc=;
        b=OG1p3YFHu/45g8b8iFLujVqwTrKmmuN8cJ3RU19Ceqkkjml26ojyrP9lKuoc3Ngzii
         +/xYr1Iusi3849c58i6dLGL8Oq/yu2ZZFklcOeb2bPXpoAdWqtZBLtT6gk8qBmEYr0Ub
         vkYsfV7npSqplmZ46Rk+8DWi6S/Ayj94fmJ1XGMG0xzj3/3mIxvYfshs3GbBhet8ACvj
         5izvnID2n64OneEUo+hIFR/BW5Vx1SjeGINmpBtB6NhRQq4o9riQS/BlZxDRCWL7BRVs
         Ia/VoxZIax5qCr6TRTr537Uwo6317h3DjNpYvtXcpoxXokIY5QNdApEG9yLfcIIveBGz
         2FOw==
X-Gm-Message-State: AOJu0YzxVknl1wJXjy8Dz6tN2FIdAbBIF4R1e/g6SBWnKJh011QpyoYI
	e3IWQrgtK4oUxO98As8/d3PqXg7Z/TVP4P/B+hVJC+eSrfT8MK+t4B6PkVHc4w==
X-Gm-Gg: AeBDietzBQT2wpyK34/AewmYnsnpZ8aZj+ppRfRdVfsWPV+LJyC1JiMOQwmZ6HofFOn
	h2Ew0MTIRjK7Hlm6YXz6InludfHlcN4c3aSqquQBoNibM5qv1nX3pUpl0EYQZWp0Swkebqh0I6V
	cebORZBiRb4WaDkBfreyFxsUUf8lPPMeICmivbR6W7PM9bd8tZ62idHSaW/h4h41SJ0oYOcAY8a
	ucSpCSsYTgGWNeG5GRPEYkwImpDopQalbhc3RsudWtGkrzOQJw+Nl7GRHV6/HHeJL5JvnfEjfre
	4TZbZbUGKI8Q07CcfTqcoIFdXfwuc9looR6r9iVhBq697DCxiAbmyOQAWKtpZ39tXTgcc65f3Zb
	mY64kWqnGf0QEKy8Xbka5P4IO46p3o183EJLvH9442Mntl8JpDGOyF2JCyzzT3ehB0DknkkzcPY
	rCUrT5TPbULckeUM51HLMbwstoq/Zh30EkOviUAQNHYU3XD0OUxPtmBEV6r+cv3ePBxkuXiJHWJ
	l5B/w2MmNMqfw==
X-Received: by 2002:a05:600c:608e:b0:488:8185:e672 with SMTP id 5b1f17b1804b1-488d688d2fbmr191377585e9.30.1776096336458;
        Mon, 13 Apr 2026 09:05:36 -0700 (PDT)
Message-ID: <b6e4dde9-0a59-4bdc-951c-2dbdf284c7ed@gmail.com>
Date: Mon, 13 Apr 2026 18:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [REMINDER] Last posting date for Xen 4.22 is Fri Apr 17, 2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776096337-ED5532A1-57256222/10/73395122804
X-purgate-type: spam
X-purgate-size: 340
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:committers@xenproject.org,m:community.manager@xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0EC773EE511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

The last posting date for Xen 4.21 is Fri Apr 17, 2026. If you want your
features to be included for the release, please make sure they are 
posted for the first time before Fri Apr 17, 2026.

Full schedule can be found here:
    https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes

Best regards,
   Oleksii

