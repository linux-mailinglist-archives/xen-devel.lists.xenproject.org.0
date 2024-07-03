Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503219263A9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753145.1161427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Cb-0003ZM-0R; Wed, 03 Jul 2024 14:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753145.1161427; Wed, 03 Jul 2024 14:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Ca-0003Wu-TM; Wed, 03 Jul 2024 14:43:20 +0000
Received: by outflank-mailman (input) for mailman id 753145;
 Wed, 03 Jul 2024 14:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sP1CZ-0003Wo-S6
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:43:19 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964e046d-394a-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:43:19 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-79d5d1a54fcso46140585a.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:43:19 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69297ef3sm573156485a.61.2024.07.03.07.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:43:17 -0700 (PDT)
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
X-Inumbo-ID: 964e046d-394a-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720017798; x=1720622598; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pr98WiVlZuUOlJExOJXizhXm2cJTOhNY040aB8qgXR0=;
        b=RHRkeNShXsPIpbuysiq1kQ13wIvmnr89GiUzod0IQQxXFhOGcOOGtBh6/cyg+m3g1p
         bBjfOCWkR70wCagxVSag55cr2pBWXOkkQMdIolOzbOaOJ+sXqLTO58K+2BEFRfa54R7V
         LXrLjr7MIy9ITlDcWNUhnvMqrmdW1FhVMa/fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017798; x=1720622598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr98WiVlZuUOlJExOJXizhXm2cJTOhNY040aB8qgXR0=;
        b=uHDiOFN472VW1xfRGELIMfo1tXwUuWp0bPaStbLH9VPSwC1qdSvT82t0eKYauzNpFk
         cw1vGsMbFhr20x8Wbjm6s1a61syCvd8TBiPj67Zc2IPb0vywmAW1yWeN6e3ejq2cgiuR
         45+ZiU31PbnwkuLyLL33bUNxO+xFWn2aqOxvky3odVNa7CX9WJ8++AzfTDspCBOaX3lD
         7YwEBtlb0UuSRfKHIpGQPBPUPneDUkDpkBKyZgYygKbaZpU9BB+0THj/0P+8VRceDt4Q
         M7g07TV9q5IYIlKiC1KhlKPtCotj3NIaR37S/30LjaslblCE0b82iUmClPzzHVZNOju8
         4Xlg==
X-Gm-Message-State: AOJu0YxSigMtE82FZL+DCiUXGlz6fzt05ITbnmdPxcIgj68QHsJaCzrH
	ozradz0j1Weyc/V86hc19mpipi3GXG4bhNf8D5ZgD2Y2+baLOIGUhoJHgEkCk7EEaCDlDGHZCn6
	t
X-Google-Smtp-Source: AGHT+IFfOkvUh5iK0wQHsfANbDdMPkD+KyC4vCi5oGG+6PBXmG7fOLMHoS6itK5JEcuQrkLhmA6u3A==
X-Received: by 2002:a05:620a:57a:b0:795:5de4:6625 with SMTP id af79cd13be357-79ee314a6c5mr284597885a.5.1720017797797;
        Wed, 03 Jul 2024 07:43:17 -0700 (PDT)
Date: Wed, 3 Jul 2024 16:43:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 3/4] CI: Drop bin86/dev86 from archlinux
 container
Message-ID: <ZoVjg-HBZdoa-B5A@macbook.local>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703142002.1662874-4-andrew.cooper3@citrix.com>

On Wed, Jul 03, 2024 at 03:20:01PM +0100, Andrew Cooper wrote:
> These packages have moved out of main to AUR, and are not easily accessable
                                                                   ^ accessible?
> any more.  Drop them, because they're only needed for RomBIOS which is very
> legacy these days.

Is there no need to modify any build script in order to prevent
building QEMU trad (and thus rombios), or it has never been built on
Arch in the first place?

(or maybe all releases that we support no longer build QEMU trad by
default?)

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

