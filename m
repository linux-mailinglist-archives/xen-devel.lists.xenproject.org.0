Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E198ABD2ED
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990549.1374487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ2V-0005R1-66; Tue, 20 May 2025 09:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990549.1374487; Tue, 20 May 2025 09:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ2V-0005Oy-3Q; Tue, 20 May 2025 09:13:35 +0000
Received: by outflank-mailman (input) for mailman id 990549;
 Tue, 20 May 2025 09:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eI0=YE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHJ2T-0005Os-LH
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:13:33 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29fe18a-355a-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 11:13:31 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so3568400a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:13:31 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-30f364fff31sm1199694a91.31.2025.05.20.02.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 02:13:29 -0700 (PDT)
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
X-Inumbo-ID: b29fe18a-355a-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747732410; x=1748337210; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9PHVzgPS7ZzD2SjFwqVUoXkCFf5jtJJqOuSx3+CF+c=;
        b=bXEG4YsblZ2Vy8Y1aglCLgHAwDCzbZ9NFvzbGhQsLblX6WxPPEluFKdcGyqr+XC7pT
         cAavBooQRrt7jPvRiCBlQ8WvI25YW5+ob4HuSWFQg24JOrkxZJu7qk55MKQ8eCLXRnCI
         Va/HLu6ap5dZTIBzyIXbxm/Uu5REDVKEoaEFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732410; x=1748337210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9PHVzgPS7ZzD2SjFwqVUoXkCFf5jtJJqOuSx3+CF+c=;
        b=AK8kwJnTzN2Ukfc1hkYbQUWdn/2vwmExj8c7gmR/JkIoUuVgD4IuuNfBmNeWVevG9r
         uhENVc3VA+5aUeKgYdiDGP8+MgIU2IpUxQ9zknDD+JJLorIcDn11GwhygYbRJC7wIdNd
         eVtwzSW2mUQzsHjlR9pgCmjyef6mH5EeyzFAnawWSV/UJ8HrZZcFa2BRF+UU+Hb4uMP3
         YuOy9cP08nq712H1YZwsENDCfiGg49bbsJuzPST8OKMsP5AieR/yYluS2XgV74Lbrtz2
         RFLp9mGuEUXnzZ/P3i/tzMkid1B8qXc7yDbjozn4S+yfJFdMyf8teGbDgzPO/qMlbRQQ
         FRqA==
X-Gm-Message-State: AOJu0YxbBt5MB62P4UZkFtCgC1RPqJc5kcK5P/R/rH4aE/urQPC87/hm
	28vcIIjTQxKPoyopmAiGxv6C8d8ooLZeLV3lwqZe0b2q5fRvhchUUrW0woOiIN1KNB7mltnR270
	mgTtZ
X-Gm-Gg: ASbGnctvXoPHDa7LZFK1SRpgogeudxZkriXdX8QtXtAzOw4JeYOMDwrYiqucuG4e7fp
	JRFZghIguiID8Gnu40ZisQ7vdgbg1kolyPha3CtLaa1Utvu/mHfsU1ySn3ijvTIqWUKchQQ8bN6
	HgWxcYTKO7uBsLtUT3SUu3xbF0fYO8MB2eivGA1mxIalUUXuJfbIUVEi0w2w+KT7btDWzdS9Sf+
	mctpEnDLBZmvvtLkERJDP28NdApsUasDqG8LWcTBwOCqF/lE7/ayODboZaczF0Q2cuJPyGPyNMK
	ThieSftJyZ0XzuL/fNft4bq2FVoIUbaPL5YuSTkCdohvtrxx8GM4fWCZgZynKuALNHOK6t226Y7
	dC2MMd2BJCChmBsE4QTs=
X-Google-Smtp-Source: AGHT+IFhy5+G0/sqPVxplEwmBPR9sU8sssx2evzygv/28QMSwaMAkoSJfrugGNOt1BOM4EVHcsy0hA==
X-Received: by 2002:a17:90a:e70f:b0:30a:2173:9f0b with SMTP id 98e67ed59e1d1-30e8322596bmr23102343a91.28.1747732410169;
        Tue, 20 May 2025 02:13:30 -0700 (PDT)
Date: Tue, 20 May 2025 11:13:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
Message-ID: <aCxHtD_zPbLQYns6@Mac.lan>
References: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>

On Sat, May 03, 2025 at 02:02:32PM +0000, Ngamia Djabiri Julie wrote:
> Dear Xen developers,
> 
> I would like to ask if the following fix can also be included in Xen 4.17.6 (and eventually in the Xen versions after 4.17.6 that don't have the fix) :

Hello,

4.17.6 is planned for the end of the year (so more than 6 months from
now).  It would be faster if you request the backport to be added to
the Alpine Xen 4.17 package.

Andrew provided a link for the backport to 4.17 that we use in
XenServer, it will most likely apply cleanly to the Alpine package.

Regards, Roger.

