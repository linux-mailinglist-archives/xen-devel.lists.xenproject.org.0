Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ROrHA29rMWqEiwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:27:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B26910BA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:27:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IMVc7p+J;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339414.1600627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVhJ-00032B-1I; Tue, 16 Jun 2026 15:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339414.1600627; Tue, 16 Jun 2026 15:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVhI-0002zQ-US; Tue, 16 Jun 2026 15:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1339414;
 Tue, 16 Jun 2026 15:27:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZVhI-0002zG-0Q
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:27:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVhH-00AbpW-6C
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:27:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316b4f-bab6-0a2a0a5309dd-0a2a450bdaac-40
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:27:27 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a316b5f-212f-0a2a450b0019-d155dd2fd875-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:27:27 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-460166910e6so2509204f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:27:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2d9becsm43439279f8f.34.2026.06.16.08.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:27:25 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623646; x=1782228446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwBCvfajTtuGZ9UDMr1bAvLJ5E6FOJewYiBfmqswzI8=;
        b=IMVc7p+JV9zHp9ahFaP726aZL4OBGyu0K8PNRfoA+0YFcXNXvFx7ZDmXDba1nvlcPZ
         N4hAQ7XYr4zdTvbOZDF7EMVMuwFbtDUYD3QGWhq9u/o4vTEy3yG3mn/QWElZC6jOokZZ
         W3URonRElBBnBV+DI6RMqnEmaKKokIjIsUG6KGuL/6YW72kpHuPgAq7OZ0yn6vVekD/x
         mixcKgfIE7kpTodaggr6l9cvTARVdZU5I63raZhNVktyhKtdwFAQZjisnbYFwR9gg74Z
         4YD+fW3SazE42iy8GISviDLNWIXCMq4rkaLzYByZCcRgUIqUuBwS8ICLVwoVcsv9EKuN
         6d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623646; x=1782228446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwBCvfajTtuGZ9UDMr1bAvLJ5E6FOJewYiBfmqswzI8=;
        b=FHgoSM+coQ2rBxFR6dxWkHA9va4WFAxLPaN+MAaYQBXO+WmYddkFbH7D3C8vmrFhjZ
         +9MwMhLuOn+CXTV8oyRAgeuyuBUfBlcM6kModMnysFY+Fq6zaFKsQs5mjcN9DGO+iRoe
         RFZcjJ0xpTXfwK0MMqhTGuPzUSkaSiZRj97NOcTZTDRmjVAr6pf/nNC4nerAWbWsqDoa
         P+8/WzSToXafVdkL3WHWPXMaW02fSpUKMjDbi3OkxSdOovSCvj3RH0GPzVREcHgvSRyo
         AqbfntyjrNApb/ydNJh5iAMWR53L6Q/vknZQg1/ypC3PS4Gc7tWF+X9MTXkg5TYTE6E0
         8JQg==
X-Forwarded-Encrypted: i=1; AFNElJ+36jgoNOPnt0k8SSNYT5Jv/HQgFac981l+ijcaRe+FpDpByZjwmIiiQBKgJwifsqP6+MMc20kfrC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAnfvgGWL9aEiZEM9s9UK/J7EOv6v3abcF512swAnLJA9ir6Yu
	egBqYmbzMsP2TbmDb9YbOWty8tIrX0hZQOXKrkABwFOMOL29BZKEHfgV
X-Gm-Gg: Acq92OF922ld+lperkrV82tJAUiVt+wBgCIt3NQTGAFG0X58opc9Si98nO2fkuKA/88
	rGvpc2QslGfr++gj5F/e6QscrQmrA2i9dEaU4fQ0wYMfPHAOggiLPMX+aMUH5HwwXT0E+xIo+wP
	gYHZivwRxj7uReIeq3ESpmH44BcskiExmnSxqGNLLTEHg0veckoiE1KIdXoat8tMJCcZTC21190
	hMlqm38265wtjLA8cun600Bu+aWN7kOw2s+QV2oHYw3d7fHBkvILBmBSdRLbEBgnf0QZuNOgwuo
	fN59O+BFcKUgUsyQnX63EjaT5eKj4yP0BXKW5isEWEK2ht/rDk/IuMYnqYayoElaTlmkJf+TJT7
	igEf4BgoDmQF2G+70y5IYcHA6jU2c0TWWAoNTDt4m+cXKxLpXWfZP5DWce0TPSEClHRIhBGcy9B
	b9QHms5y5owTcsMs7T1pxw+jqUn5Q7ijEYtsqo/b1twWRPkhIGmN1MeNKZDOZUdtWUGttaDFKzP
	vpWNmQ6hSR2CoKD
X-Received: by 2002:a05:6000:4602:b0:460:edd:ca89 with SMTP id ffacd0b85a97d-460769303demr20835340f8f.26.1781623646432;
        Tue, 16 Jun 2026 08:27:26 -0700 (PDT)
Message-ID: <895b6cdc-e0ee-40ff-af50-905f0bd134e0@gmail.com>
Date: Tue, 16 Jun 2026 17:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 5/9] domctl/XSM: avoid XSM_OTHER with
 xsm_domctl()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <0986c7e3-7a1f-4e1e-b132-78593c8b63e1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0986c7e3-7a1f-4e1e-b132-78593c8b63e1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781623647-19969F3B-436A8E56/10/73395122804
X-purgate-type: spam
X-purgate-size: 267
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A34B26910BA



On 6/15/26 4:13 PM, Jan Beulich wrote:
> Make explicit at the call sites what (default) permission is required.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

