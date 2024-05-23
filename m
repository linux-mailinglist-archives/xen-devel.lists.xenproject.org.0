Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857D8CCD75
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728160.1132983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3Iu-0001nc-MA; Thu, 23 May 2024 07:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728160.1132983; Thu, 23 May 2024 07:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3Iu-0001l8-J7; Thu, 23 May 2024 07:56:00 +0000
Received: by outflank-mailman (input) for mailman id 728160;
 Thu, 23 May 2024 07:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA3It-0001l2-SH
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:55:59 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40aef12-18d9-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:55:58 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-354de3c5d00so737834f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 00:55:58 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b89573csm35903138f8f.29.2024.05.23.00.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:55:57 -0700 (PDT)
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
X-Inumbo-ID: e40aef12-18d9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716450958; x=1717055758; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utFsS4D+cK7bzRiCAbwpZ2XGU8VFrSx5GfBbC/QBMxs=;
        b=bIHt4B0+8z9GH/t3FY+G9NLTvV5hjr3bvKeZ5131fcd0UJ0+k/2dXH7YHqPvbYNIWb
         rjMkv3DZGE4nRwrxa7TE47j3J3ird0d9mB3WibOyqoCBjEqUm2xwe9bMgDlnLNjdk4iN
         +YGK9PcHaDqxy2SUEoEfORBuGXFFenHSPrh7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450958; x=1717055758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utFsS4D+cK7bzRiCAbwpZ2XGU8VFrSx5GfBbC/QBMxs=;
        b=bP2dq+uEKutKBJDHsg4pnCAj7t9+ORdnaWfSUQrFsHlPe3ewQj3q+fxUR9p/StXw+x
         Mt6XG/cagHC8Lvo6SdyLkHP21X9krmRuURrJXLhoLfQDP2PTYz1AdwHvAbJatsbxsVwa
         4otwtx1eU1RbteN7Mh6l4a+lP0BzRuEUqHb1k2e3+stH0EceY90kmxwTHq9x9gp58V2N
         YfSlxtPBKTLdh2tyNWV+hbrDK6APKJwdbCOOgXal+DrqFZc8yAQ+3Gm58OkUeRrFOpin
         QzWkgHS6fcdQNDIbYL//ghbMbgHrm4dVrXhSkJaD/98bNGwFR8faahWEDO2TXaVzHOBD
         /8VA==
X-Gm-Message-State: AOJu0YwuII5BpRhN205oRz2zsCKqtXfK6QyzLefBcg0uiimcxON7kVrz
	IS+hd1YWLQJR6o9LAckF/eudtCJ2zL2nFFA8M2WMiCv8k6WkhTbwyfTLwOAqReY=
X-Google-Smtp-Source: AGHT+IE4WSsAWvuTC4CXl2m8B4VSvv2BRdgFxuFm3fBD5BHb0pQ/XLqZGSgtvW+t+mWdURmLJ6YTMQ==
X-Received: by 2002:adf:fd4b:0:b0:34c:fd92:3359 with SMTP id ffacd0b85a97d-354f7521b58mr1291595f8f.21.1716450957943;
        Thu, 23 May 2024 00:55:57 -0700 (PDT)
Date: Thu, 23 May 2024 09:55:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v16 1/5] arm/vpci: honor access size when returning an
 error
Message-ID: <Zk72jPtd9iXhChbc@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240522225927.77398-2-stewart.hildebrand@amd.com>

On Wed, May 22, 2024 at 06:59:20PM -0400, Stewart Hildebrand wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Guest can try to read config space using different access sizes: 8,
> 16, 32, 64 bits. We need to take this into account when we are
> returning an error back to MMIO handler, otherwise it is possible to
> provide more data than requested: i.e. guest issues LDRB instruction
> to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
> register.

Shouldn't this be taken care of in the trap handler subsystem, rather
than forcing each handler to ensure the returned data matches the
access size?

IOW, something like:

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d5636c..b7e12df85f87 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -37,6 +37,7 @@ static enum io_state handle_read(const struct mmio_handler *handler,
         return IO_ABORT;

     r = sign_extend(dabt, r);
+    r = r & GENMASK_ULL((1U << dabt.size) * 8 - 1, 0);

     set_user_reg(regs, dabt.reg, r);

(not even build tested)

Thanks, Roger.

