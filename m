Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDEA2AC26
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882971.1293072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Uy-0006Yc-JB; Thu, 06 Feb 2025 15:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882971.1293072; Thu, 06 Feb 2025 15:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Uy-0006W2-GD; Thu, 06 Feb 2025 15:09:00 +0000
Received: by outflank-mailman (input) for mailman id 882971;
 Thu, 06 Feb 2025 15:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3Ux-0006Vw-I9
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:08:59 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a3b0cc7-e49c-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:08:58 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7800d3939so57691766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:08:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab773339e6bsm111714766b.152.2025.02.06.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:08:57 -0800 (PST)
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
X-Inumbo-ID: 4a3b0cc7-e49c-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854538; x=1739459338; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qN9MyrO3vWYmbTU96ZVoZKQiVe7pYPrUj3GKsHh3ADc=;
        b=F7AEIBrdcRAvE1GjHU9r+qRcGlmdVYy4sYO9Rml5AHXdFX+mJGVgQbckqjBABt5wqk
         axEEvZcrusZcHsilfSmSTpfAJwQ0x5oOg/j3L27bGPDKIq2ZLgVTI9MIpMTBgRcBwB/L
         AxWUlqeDbk0hkj9fwjNco8O4rkdHAxYR/zs68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854538; x=1739459338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN9MyrO3vWYmbTU96ZVoZKQiVe7pYPrUj3GKsHh3ADc=;
        b=p7kS5RtzQX44UPLWOGn39xzggcO994qYfn0VDwBYC81swJ9Qr/rEk5JUHCFk2ArQ0p
         7aD/C/buHlo6bkuNttM8ovVSBUgowketprbtP9+gAkAHZsMxYMrMj8WtJ+JDCVyX27u9
         QbYKe85pBrClVS6sosUOM62wSCddNq4RwULVP383hmHnuPO51D8rZayG+XnI2eKc6LEz
         WpvvT8fWONGle2SgkvlsFX+TW3Vml0pRKIiDHBTcxTEz13oaEnXNKQw2foTwzU9618Xz
         e7K0X+vvYfEbTr4iobKAosZFo5oBwU+AfvQduvYxhaqo178D+waq1k7blMDhF6wZTTfC
         //bg==
X-Gm-Message-State: AOJu0Yy4ZR33suYQPIkMUsP6cFmEd83WTrhhFhBpfryzrIOEdZrfX0j6
	JUaGCMVnxOuidjmt0AOzJFM3N13LK1ZHj2NmtsJ0hrWFBXR8wzWx14DZnw7dZ7M=
X-Gm-Gg: ASbGncu6g7IVGMXtEGacKz4xzDY9gxTlvnQmQsW4W+3AX5WNbqnhYMjXrCvwgxasUSi
	jbPWeeo6a4BbR068OQ7M4NsNTWz/G5Ozi9jfTWltLqGE48sMbq6m5M6ZKyTBnGH45z6sWJHvwJY
	zCzCuEzPDwe6pAxnCL7yYOGfVsBZMzl10wTsLNi3tcYzmyfvih4TWMWM1RFrPZpPFaGlZqxAwYC
	IXRZ6+2i9oeS+iqbQhILm5Qeshp6GuliCA/sCuoaXeGUCkgiDtCFn9AubMAh+ZzeayCeYa3FlS0
	oA3rUnVxzAU7KlLrtiOJbxSHAA==
X-Google-Smtp-Source: AGHT+IHb5fAWgVA2kjAMAr7K6ckf1B0CBMQH2c5wWY5F8n3xnv0cHsdRYFUB6LNqkt//J5XfypIOnA==
X-Received: by 2002:a17:907:3d8e:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab75e214248mr890807266b.4.1738854538152;
        Thu, 06 Feb 2025 07:08:58 -0800 (PST)
Date: Thu, 6 Feb 2025 16:08:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 for-4.21 4/4] PCI: drop pci_segments_init()
Message-ID: <Z6TQiP7142UON90W@macbook.local>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <b7b148fc-ee74-4f02-9dab-f80b1707e44e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7b148fc-ee74-4f02-9dab-f80b1707e44e@suse.com>

On Tue, Feb 04, 2025 at 02:04:35PM +0100, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead: With radix tree
> initialization moved out of the function, its name isn't quite
> describing anymore what it actually does.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

IMO I would rather not add the segment here, and just make sure that
all callers that add segments have proper error reporting when it
fails.  Maybe alloc_pseg() should gain a printk on failure?

Thanks, Roger.

