Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8ljEiidMmpJ2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 15:12:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E05699FDA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 15:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ob87/hpU";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340429.1601457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZq2w-0005U1-Mr; Wed, 17 Jun 2026 13:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340429.1601457; Wed, 17 Jun 2026 13:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZq2w-0005RF-Ju; Wed, 17 Jun 2026 13:11:10 +0000
Received: by outflank-mailman (input) for mailman id 1340429;
 Wed, 17 Jun 2026 13:11:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZq2u-0005R7-A7
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZq2t-003nNe-9N
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 15:11:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a329cdf-bab6-0a2a0a5309dd-0a2a4501ccca-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 15:11:07 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a329ceb-e031-0a2a45010019-d155da29bd02-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 15:11:07 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bed19623d6eso731415666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 06:11:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb8e1db3esm792660766b.56.2026.06.17.06.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 06:11:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781701867; x=1782306667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/thlFyvvpZMv4zNsqFfmCdwNcGrqYu63wpFd1ScCqA=;
        b=Ob87/hpUO79bbfBxaa/UCk+lQ2qFgBviuCy0QEQTLHpc9DuD0QPQa0+M0NW3cEqC2e
         ZuUt20i3e+jrF1ggWPts/pWLqiTiyJx1NhRak4is1ZrUciLPfA1ZG+YhfPWqL7LKTzce
         TRs0iVLwVWoEkE2/rMc3BMz/ozvTdHnZBhD9Ukfvpv6LcAHPhWeCiqnCHlyF7wd1k/60
         D6KWLE5ZN2nOVZiIt5tm4NZessv7tOfG3Ph/uO7UNRFZaGg0rppMAVgV2268oYv9yhR3
         1x06dvfzz1OCS2MHWNCOdukxVaBKYj2kFACtkP1Cb/EwCBKdmOCCVcGDk/hyTJDvbJcr
         tf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701867; x=1782306667;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/thlFyvvpZMv4zNsqFfmCdwNcGrqYu63wpFd1ScCqA=;
        b=LxZiOXMI/MJzJwXDV+AuSBDNBQynj3YmN+oJIf/j8SiuPQOXidioYd651jSSLXuDfY
         cMBMxwfLnCRLjq3JxK15qeFoTmzwfT5LUIeN5Yrdrtv/fZB+NyA844mQUb2H0DZQGcB3
         Z3aDLCrkYp9V8f0TSADeQETjXf+9h2y5ihJTrI7UKuYKE58+FaMRBKG88BbNCWDYTdky
         v/zURYz7XFDMOGX+FI7gEw0pVRToF/TWYtJUD8eHZBA4HM8SbTmEj/EYG1bBT+Xl6+Ql
         X627zDUmSfj6L3Dsbbj2gGcSikHIuQXjr/I+XgCqtu9KcKXCVQbeEFVGKElXo5LIVvjd
         k6fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cVN/CvIDQQQjv4NdK7aIfEUDxJsvaMem1momO5Ivtujn1I6mx3Td61Xo4IjewbTE54H2z/beyBOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL2yiWykJCl5LRHHO45Gl1OEObgrcikUltHAcd3YRAgK+pOv6O
	T7UCAwe25eWqiwhEuHx6VzRlC2LnNPOfaaPrNnbmxL/qtGvKLD/gKBZQ
X-Gm-Gg: Acq92OEc1sUoZ1v5oyevt5a6Dlm53NzYMeZxMjfnheBSUVTrrwHvE+RkRzs+oM75zia
	EqI5+1kYex+vpGqgoMyJDLSCLNyxXcuQo96WK4q9CYx8YkY5ZRlbj0kcGPtg8eMrq6Q+CDuYDze
	01m06wkfCM6MNGMMmT9dfVsy3UiCBAY+TuSsCd5qFRzsnk4xsIKMltLtARmVG/IO+bk092u1k+I
	OU4Rr02FF00O5Ig7yK/3xq2tcrvZR1l/QwcPa57ufMe1msTuCd/TlTxcz5x/vzHAVBqjmHT6UvJ
	cZNZJsL6KILeqW7/ieFF2WqZnJ3GNEJZNqp43DQBkEQIs7ILdf+rjpf6a5/EBNqGaoRefxZw7rB
	KCXZhV1fzIzGXL8K3DG57BKojc1ppoGaIUlLLNQ/RGjJyaBSiTUYvJozSGIIz1umnqARinmsO7T
	MIFSFChg0jbdHabMsr4J+brqd/RvuEmooOTVsJabzkA9zCW4HYsE3L1FF60l29dlQA25dZyv3S3
	cr1yA==
X-Received: by 2002:a17:907:760a:b0:bd1:fe8f:59ab with SMTP id a640c23a62f3a-c05d23a109bmr162818666b.23.1781701866433;
        Wed, 17 Jun 2026 06:11:06 -0700 (PDT)
Message-ID: <af7b58e4-4dc8-4042-8f55-881fb817bff3@gmail.com>
Date: Wed, 17 Jun 2026 15:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.22? 3/7] domctl: move early special casing of
 XEN_DOMCTL_shadow_op
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <51050157-236a-44dc-93c5-8b52a31a3e62@suse.com>
Content-Language: en-US
In-Reply-To: <51050157-236a-44dc-93c5-8b52a31a3e62@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781701867-49DB3E30-E0B94F00/10/73395122804
X-purgate-type: spam
X-purgate-size: 382
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
X-Rspamd-Queue-Id: D9E05699FDA



On 6/17/26 11:27 AM, Jan Beulich wrote:
> This wants xsm_domctl() invoked, but the domctl lock not taken. Move the
> handling to the respective switch(), thus eliminating the need for a
> separate xsm_domctl() invocation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

thanks.

~ Oleksii

