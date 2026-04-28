Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBFhLHm48GkyXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:39:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466648605B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296233.1572649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHieM-0000X0-Ks; Tue, 28 Apr 2026 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296233.1572649; Tue, 28 Apr 2026 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHieM-0000Tz-HT; Tue, 28 Apr 2026 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1296233;
 Tue, 28 Apr 2026 13:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHieL-0000TR-6t
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHieK-00GG3n-IK
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:38:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0b860-bab6-0a2a0a5309dd-0a2a4508cec8-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:38:52 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0b86c-63b5-0a2a45080019-d155802dc1dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:38:52 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso106228905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 06:38:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a773a870asm63552835e9.1.2026.04.28.06.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 06:38:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777383532; x=1777988332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8dKdNA/CLCCRiw4cljqr0vqvHhydgAGJmNl5YJwm8c=;
        b=kfCxn6urVc56wHiladkbKbn57QqJ2JDaEMHtCPL8Uq8tfD1O5eMBANhwtfL8fRvFfd
         7FUl2l8v87ff9JMrRUj03aCLW3rieRVkTR+QhSBG3c2feA8uyRjYbar2Ccb9n3ltiyzE
         MwSBcVZundeEmGDd58c7PP9v2ip2fu/Lm7wgkhkj86IefGswxzl9Aw0NFC5H1PBjZLt9
         7dwJwcllBplLli9hq2A89+FY6BY/ftTW+AJRw2eibQCLA06orIfqn4+t860+7oSlnChr
         qJIbLuFvaGEu+vPaN7IP05z1AYuG/VfkJc9aUD2Axy6aYQbLsPEaLxBDtgat4XFwDSfC
         8sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383532; x=1777988332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8dKdNA/CLCCRiw4cljqr0vqvHhydgAGJmNl5YJwm8c=;
        b=qmG2pdgBagegM7WzEUXhC9ZqM+lhv6CIPKUIJIOBlXhsrixLhCoDLqsCMQQXYW21gK
         26mDbpu+0mPrI/xhs43gdhfUTAQPP+E/YRj1UrDmZH5nx+YWN8qJVpEI30fnsQHCQlLL
         yvl1sURCtoBQtRfVn9fI0SpfNKLVqfYU2CZvyFEYq2221KwIJmSi8f85iYWCSGSDyuKc
         dcwHQJ5istKKgIZcheNXHL8qizLszMht+kU8/DM/PS3/+nlSTPfDsdfLbFGpJBOIzuNS
         A/X3i6ZXaAuho+FHW8Sah6AMDv01p+nz74wbscCNehnKC8ZiZlt7i5oj9WFLJjHMR93g
         dw9w==
X-Forwarded-Encrypted: i=1; AFNElJ9ouFDAubzbjG9cTu3LEPfuCZ3AAhgHOLZZ6bilHXfjLIKAwS41yCh3/BNjs8uQYCcscb9gTsJL/GY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0bm1GPEtTL5nTzpyCuIzcIZS6oMgrGdL4gxw/qEMAzvC9fhW4
	sAhpA/qoecgeXEutWTI/jeiQb3ftCLkAWyL7p8CY1jGhKb/YxdeHQFy1
X-Gm-Gg: AeBDietvRHBjT/CZWYguWoBLm9bNdxUnQb2QfXJJW442sZWmt8HZb01LFoCp1/1HHEo
	8lNj6SMBu3B3cJa7Hlu5C4xZ0k1vXdTu8Ou3JRZLs/PSRVsM+gOVOeWt9G/w/r2dnZZdz1ElIeJ
	GfRFZGKjpj7zIeYgEGwyJzleqAZGP34bX8c7TR3pIvUHq/CZ7UvbslX8z7t8rHsNDpC+JRAzyyS
	D3rN0M8EgPeAHHT7BCm+ExUI6N87rMlb9jQxLhyMg5gRvc4BrnrTo2le7wXN2LyalT8U0hjJxVz
	Xvo/s7Gzn2HJfVPaYON3ag4/oNaxNbJSP+6oTMiql4q3Y1RfWcmrDaFBZVP/Lk4hVm1Tnw1u+4C
	BR3VW3Cvm3AJTiszcwM+XOfFA3LWqeP2QT1KA0xXrgvce+KZdEr9Ip7dsbLUcirWW/Kh9mZ8ZX3
	KPXPI2btUgPHmSlVCiX0/bKjfHkIo3CdaNc2suHB+zaEA/N5Z/zJi1qRXlhG5dfXyPkEt1MS1dW
	pJtEkpMZMoMUQ==
X-Received: by 2002:a05:600c:3386:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48a77e64f29mr26163925e9.16.1777383531550;
        Tue, 28 Apr 2026 06:38:51 -0700 (PDT)
Message-ID: <a7b3a65d-8fa6-4dbf-881d-d2bee2a834ff@gmail.com>
Date: Tue, 28 Apr 2026 15:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Armv8-R AArch64 MPU support (single core)
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1777383532-C377EDB1-8B656CFA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1030
X-Rspamd-Queue-Id: 5466648605B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello everyone,

On 4/20/26 4:25 PM, Luca Fancellu wrote:
> Hi,
> 
> this serie complete the support for Armv8-R AArch64 MPU support for dom0less
> DomU boot on single core, it also build for Armv8-R AArch32 but the support is
> not complete.
> 
> The serie is based on another serie in the mailing list: "Fifth MPU Series".
> 
> I've spoken with Oleksii and the Arm maintainer to have the possibilty to have
> this on the Xen release, of course provided that maintainers have enough
> bandwidth and depending on the priority of the series to be in.
> 
> Asking for Oleksii Ack for the release, the changes in this serie are mostly
> related to MPU apart from few patches that touches common Arm code.

Despite the fact that this series was submitted just one day after the 
deadline, it appears to provide useful functionality. If maintainers 
have time to review it, it would be great to include it in this release.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

