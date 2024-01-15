Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4D82D842
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 12:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667321.1038473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPL18-0000Ga-An; Mon, 15 Jan 2024 11:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667321.1038473; Mon, 15 Jan 2024 11:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPL18-0000Eb-6i; Mon, 15 Jan 2024 11:20:34 +0000
Received: by outflank-mailman (input) for mailman id 667321;
 Mon, 15 Jan 2024 11:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPL17-0000EU-E3
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 11:20:33 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1898b23f-b398-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 12:20:32 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28fb463a28so914828666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 03:20:32 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 a1-20020a170906190100b00a2689e28445sm5171612eje.106.2024.01.15.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 03:20:31 -0800 (PST)
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
X-Inumbo-ID: 1898b23f-b398-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705317632; x=1705922432; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4pFSVQ2SxFWFJuYu58k/HcROajk7lIQmmQsbVXnyE/E=;
        b=e7EComIZWfo2VxWA+IP0j+HpzS592YDUCScXeZyFUzuMN8uzIoO8ZxVhJ4F+8IMFXE
         k06AQ3d1YYxBbLyYCBDdlhz0/pdLX6dUT5c2gHpPogCfFL1SOCcSk5zJUVbUzhT/deWH
         OEGLtS/TDS1hTMIB3s9nYGg+2xdYLkHY2y7ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705317632; x=1705922432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pFSVQ2SxFWFJuYu58k/HcROajk7lIQmmQsbVXnyE/E=;
        b=ncM+boB3sKkVRRXNlQM4BgM9ELJkYk36xaAigXjNt3/H4Y5Wzd8Ihiq40ip4xxG1Bv
         6YRXJJBkPvfin/feaT/YrbKytjJtEdzPLoyEZux5+L7t4dKcVun66v0ySgvwhdJ6GRmr
         j27QgSNJOdLGBHaFq1hKYM4ssHoxNm0tpNix6iJtLKMAsvxl6SraHNlSsXCiaathBzwR
         Za8LvctwvpHiZWuiHmyh07EQQaW79fYSuB76bVZIydB0+89aVyCd68pJN74e9CJhjX2Z
         SiybFKY37/yJwq1k1kDzOceOaGiA3EytjTR6BwiTS+qB45Kpm+vemuwq/WqmkIxn6DWH
         560w==
X-Gm-Message-State: AOJu0YwHvAFEfqNrU/lc55x5LX/9mlKtsJf5b5EEu56HiNuMoNbI8ZGX
	fgYTDnmvd7K3fMJHrK0KGtCSBrhnAI2W1A==
X-Google-Smtp-Source: AGHT+IG6cYcXpJuReSc/RN7rPhfb9/Qt58EGibcCWYXB9Ak0M48mMZplZm9+1Wx6PXy/8WsWO2EEdA==
X-Received: by 2002:a17:906:1d50:b0:a2c:2258:6605 with SMTP id o16-20020a1709061d5000b00a2c22586605mr2386497ejh.29.1705317632030;
        Mon, 15 Jan 2024 03:20:32 -0800 (PST)
Date: Mon, 15 Jan 2024 12:20:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] CirrusCI: drop FreeBSD 12
Message-ID: <ZaUU_qqqOs_F4qe0@macbook>
References: <20240115102718.81294-1-roger.pau@citrix.com>
 <854db64e-a3c1-4c2f-8a68-8557f7f5a5d1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <854db64e-a3c1-4c2f-8a68-8557f7f5a5d1@citrix.com>

On Mon, Jan 15, 2024 at 11:01:54AM +0000, Andrew Cooper wrote:
> On 15/01/2024 10:27 am, Roger Pau Monne wrote:
> > Went EOL by the end of December 2023, and the pkg repos have been shut down.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> We'll need to backport this, I guess ?

Yup, but it might not apply cleanly without the rest of the changes to
the file backported also.

Thanks, Roger.

