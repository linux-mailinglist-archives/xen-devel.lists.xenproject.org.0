Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2268BCCD0
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717573.1119924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wV3-0003bz-Cw; Mon, 06 May 2024 11:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717573.1119924; Mon, 06 May 2024 11:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wV3-0003aO-9C; Mon, 06 May 2024 11:27:17 +0000
Received: by outflank-mailman (input) for mailman id 717573;
 Mon, 06 May 2024 11:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3wV2-0003aI-Fo
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:27:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9672260b-0b9b-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:27:14 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41b79451153so14942065e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:27:14 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0041bb11ff5a7sm19561968wmq.8.2024.05.06.04.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 04:27:13 -0700 (PDT)
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
X-Inumbo-ID: 9672260b-0b9b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714994834; x=1715599634; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pP7CcC8wKLVjW69QigxatZDum9+U92H/3B9J1+uPzh0=;
        b=LtL+v5nqh8NiyWKth5ZbYsInoaimKa6g6GXdsMjItFCyMXJyIE5OmWqlwJIY4ksj2G
         TOaVdRFohsjwLsS53pwpt/pA0wTsNbPTX9docB0jwcRWoQr45FjBdyuOGdgdSWNtswza
         m+g2PqUcRiZJ/SQ5gMompisk33ONl5lIGSHPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994834; x=1715599634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP7CcC8wKLVjW69QigxatZDum9+U92H/3B9J1+uPzh0=;
        b=tpTL867paHxi0iPZVJUDwJV3dU/xrjDCO4MS0wjRqiTZRlnv6s2vm8uY4j4ox0ksa7
         UHdWR4qoip5uCRJo8pSxImmuoK6zQI9GOUhlK0qvTEoF0n2QpqPrp31DH5/Hb7X7WbR5
         T4Ryvi9LZXM8rbpDW3XpAZJRyIulm5ptQIlfdg61ZF0To3BEr5CKN309sFoChBWNuuC+
         TwyTK2xFohZ2gAl7OT5M+mRaZk8wCNgY21ZnInZXHdLlWRXZOodj09UBYRmrhRb8xHib
         SBqqA7qQAEH6kqXER7XdLgUmuuc4f1uoumEA/fVJ/R0VEMa6UFSK5Yc3fd9lRoXQ3yFQ
         040Q==
X-Gm-Message-State: AOJu0YwRL7fl6ucs8a/vugZiqQER5SQ48CVhZN/+pGkVbYgkUOXCTuMb
	5sT+WE4O7sYKxOPty9qv0OYRTbbkRU6ISHQigViU4Xh+oLSEJxJotb1ipPQlCbs=
X-Google-Smtp-Source: AGHT+IGuuZwQJSX82zAwuhnIT2ue8FPBPpi8Zlm7WQ2/i/fnr/l6arirfl6i4/Zd3pkbx5iZyOLABg==
X-Received: by 2002:a05:600c:46cc:b0:41a:fa9a:d86b with SMTP id q12-20020a05600c46cc00b0041afa9ad86bmr7438560wmo.11.1714994833854;
        Mon, 06 May 2024 04:27:13 -0700 (PDT)
Date: Mon, 6 May 2024 13:27:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/12] AMD/IOMMU: add helper to check whether ATS is
 to be used for a device
Message-ID: <Zji-kEKvpoGLhFxp@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <bd89275f-915a-4925-afbb-494133bb6e65@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd89275f-915a-4925-afbb-494133bb6e65@suse.com>

On Thu, Feb 15, 2024 at 11:15:12AM +0100, Jan Beulich wrote:
> The same set of conditions is used in three places, requiring to be kept
> in sync. Introduce a helper to centralize these checks.
> 
> To allow all parameters of the new helper be pointer-to-const,
> iommu_has_cap() also needs its 1st parameter to be constified. Beyond
> that further "modernize" that function.
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

