Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71085BBA5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683462.1062991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP2j-0000Ad-9Y; Tue, 20 Feb 2024 12:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683462.1062991; Tue, 20 Feb 2024 12:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP2j-00007k-6c; Tue, 20 Feb 2024 12:16:13 +0000
Received: by outflank-mailman (input) for mailman id 683462;
 Tue, 20 Feb 2024 12:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAG8=J5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcP2h-00007e-Nk
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:16:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3d976e2-cfe9-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:16:08 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50eac018059so7937125e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 04:16:08 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 mf18-20020a0562145d9200b0068d05b81fb2sm476529qvb.15.2024.02.20.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 04:16:07 -0800 (PST)
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
X-Inumbo-ID: d3d976e2-cfe9-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708431368; x=1709036168; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knwiP9OAWZECA9KKubxtxSMpv+I26MM185zuFGNZSsA=;
        b=Lab359Edx5L/CRxynNw//tA/0dS5KmbZAYgSsojymFQ1/2GYZXOEjhv3etSMCujyFi
         9ReUYvo5NkGl7sv5gHJ+2T/adKXjtd84zTMTDgsBuMJ7U5p6YOLHeGPLZ20xnReMYkOV
         xAmM1XrVa2yBLlwpLaKHsSl/jHIWWbczIGFV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431368; x=1709036168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knwiP9OAWZECA9KKubxtxSMpv+I26MM185zuFGNZSsA=;
        b=JaPNZlIrc58luI0UMbNSig/Sd4a36IgJjWF6FBKr82innb5l8mxEJRepxcrxtBGcQf
         UMST1iV/TpyUaMW9/554BzYSLDj2FXnXTk75y+sTdwIkxskXTLhEyv3kRcASdH0KLt0s
         T0TOTFCJ+QR+HvtVKPH9ui/GBQ1qlOSsbKRfyfWmFXk3j31N4suAe4AdtlymGqi504v9
         M2pjB1tr3ibsVnN5OCHsAli/wzJevByTTY2ULKIjyQXUIHAxPw9oqfBOm07Vsg4UrECx
         OnXiWJm2Rb73mwzcJTXhjpnzMFyYkBiWeywB/kx8LEsPifc5jnxZoIQYJgo6l2YgB8J2
         mBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe1Q4srKzUq0qlJeDUGJHmdLBdZ1sZgPHoQPzMuxDyqUgTSx5GNybH7RuVPbdX0t+rXhFCzmV14YCtXUB2Vm06M9hwyPVhfbpz4mUxBmI=
X-Gm-Message-State: AOJu0Yyc/w/O4/wMl1XtwHX4lnmSOhpin4R14lH05z7tFJqWNopQ9kp2
	4M/EAIaP+ESdmBv1S5EWN91+Xdb5iGgNJGaBZCd+pdI1Tq79nk+gey7ujVb5Edk=
X-Google-Smtp-Source: AGHT+IFpY0vxmPHLW+oy/ASL3Cytglfrlsy0I7GgUOvlkTMsZmHHJteUe3+LWEIK13qALwuImAYeVA==
X-Received: by 2002:a05:6512:12c7:b0:512:bae7:30f0 with SMTP id p7-20020a05651212c700b00512bae730f0mr3484188lfg.51.1708431367923;
        Tue, 20 Feb 2024 04:16:07 -0800 (PST)
Date: Tue, 20 Feb 2024 13:16:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 3/4] xen-blkfront: don't redundantly set max_sements in
 blkif_recover
Message-ID: <ZdSYBQB-F1CwjoHN@macbook>
References: <20240220084935.3282351-1-hch@lst.de>
 <20240220084935.3282351-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220084935.3282351-4-hch@lst.de>

On Tue, Feb 20, 2024 at 09:49:34AM +0100, Christoph Hellwig wrote:
> blkif_set_queue_limits already sets the max_sements limits, so don't do
> it a second time.  Also remove a comment about a long fixe bug in
> blk_mq_update_nr_hw_queues.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

