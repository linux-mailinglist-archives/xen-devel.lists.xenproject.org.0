Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F51E1C13
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 09:20:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdTsM-0007TB-Ju; Tue, 26 May 2020 07:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3u5=7I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jdTsL-0007T6-GE
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 07:19:49 +0000
X-Inumbo-ID: 4850f394-9f21-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4850f394-9f21-11ea-b07b-bc764e2007e4;
 Tue, 26 May 2020 07:19:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r7so2634579wro.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QZiLmao3gEJI1hwzYf53wNQ+KzKbFm639/BxHvqaqGk=;
 b=LF0ElGei7SmJcxO1AXrpGkJtiEgJQs3rqYTtYqmhVBNUiSj1kxwNZ/oSPVW2q7jIE5
 SLJYY/o8/G65+OEj2a64rRhsscV+ewpYWMsGZ+RI0VpXUI8wuYPYA6Dk9ywBSPhMnzXg
 aKvB2M7ZQc5u7qleiBE5MXaOC/2OlR9ddBJVZdhICIEUGt3R/NPDLsXuvaYsjKPPYqSv
 fs/GUKKjAMmD49Zl19tnai39UbdXFKL9hk20mGsUUcSkiUPWM+lh4EcrDbDAtk13mQvO
 fVIGt4rSTBC28GKH/o+UNDeGp3MZ0N9eEBYuqr2qAXcPsc8haTinLNbTguVqLXxoiCzN
 e7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QZiLmao3gEJI1hwzYf53wNQ+KzKbFm639/BxHvqaqGk=;
 b=Sn+p9uslJz/KQcRo4Ura3aJy1qaYhmOe0OjQfXdYNX296eTE+5JXI99sCSrdGsCmXI
 NeR09T6papntsSUlHklWzW/U4QFJSPujLAo1fYW1RcJBJQIc0DKtdAWrmpwBzbOsCjt7
 ObCkTgApoYVMTtk8aqlG4BpmYMmSfrAqmcJB8PLVfeMC5eoKDZpaGk+5vZsNW/8GQkgX
 3ZfyHaOrGxbprFCKsVTiEHh2zFhQ52rYCjkp4WXOZxvgFuOAxCAMUc0LgV2ZTiMLhuC/
 EBLvj4AzxKnbZLrFUz9a1rc01mNfPfuX5gilzmMHbg2hsw8r9AFiR/GCP9o07X2oAY9e
 U8HQ==
X-Gm-Message-State: AOAM533CiKU9abMzEXo2h8sje/mg8yWNz/Ob2zv9+uGZfv7//tnaMZNO
 VSHU4tHQsErVZi6trNDLIC8=
X-Google-Smtp-Source: ABdhPJyqoteEteCUp3DuT8thxXXsrN5VAEpRq5eC7Pr4nllI3Wp1xZ+/V9kM3t/LEIZrnxQDQIYcxA==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr20085772wri.41.1590477588030; 
 Tue, 26 May 2020 00:19:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d13sm20117509wmb.39.2020.05.26.00.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 00:19:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jason Andryuk'" <jandryuk@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20200525025402.225884-1-jandryuk@gmail.com>
In-Reply-To: <20200525025402.225884-1-jandryuk@gmail.com>
Subject: RE: [PATCH] CHANGELOG: Add qemu-xen linux device model stubdomains
Date: Tue, 26 May 2020 08:19:46 +0100
Message-ID: <003b01d6332e$09854750$1c8fd5f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQDPrtn+Cl1qhDPYYjFnlqkGO6V2XKrG/eXA
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Community Manager' <community.manager@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Sent: 25 May 2020 03:54
> To: xen-devel@lists.xenproject.org
> Cc: Jason Andryuk <jandryuk@gmail.com>; Paul Durrant <paul@xen.org>; Community Manager
> <community.manager@xenproject.org>
> Subject: [PATCH] CHANGELOG: Add qemu-xen linux device model stubdomains
> 
> Add qemu-xen linux device model stubdomain.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ccb5055c87..52ed470903 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     fixes.
>   - Hypervisor framework to ease porting Xen to run on hypervisors.
>   - Initial support to run on Hyper-V.
> + - libxl support for running qemu-xen device model in a linux stubdomain.
> 
>  ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> 
> --
> 2.25.1



