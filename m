Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCE7CA61C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617453.960037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLGN-0006QJ-RV; Mon, 16 Oct 2023 10:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617453.960037; Mon, 16 Oct 2023 10:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLGN-0006Nk-OY; Mon, 16 Oct 2023 10:55:55 +0000
Received: by outflank-mailman (input) for mailman id 617453;
 Mon, 16 Oct 2023 10:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGmD=F6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qsLGM-0005m8-6J
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:55:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938117dd-6c12-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:55:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so333589166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 03:55:53 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qw8-20020a170906fca800b0099bd7b26639sm3853640ejb.6.2023.10.16.03.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:55:53 -0700 (PDT)
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
X-Inumbo-ID: 938117dd-6c12-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697453753; x=1698058553; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiRFJnvO39NTv7Zx1+YzdUfp6A1YepZTinVyn72+X2A=;
        b=Ai1KsXg0waQD8hRGN4mAFgXUk9fveN9kY97w9RXQl38IFpL+aKIFIYvkwHZdOodytt
         hdDMBOKvBf5hlYB36eR1todFhjxHCUy6T5nlleSMd/GrOGvABifvzRB04j9dUinM69j0
         GpNa5UoMdYv0pHseT1Bxzv5jIkrwy4sA54yPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453753; x=1698058553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiRFJnvO39NTv7Zx1+YzdUfp6A1YepZTinVyn72+X2A=;
        b=a2LcAj4psNrb3Q1Ukj8r5uzuygzXca3Dy2Q76hstPlf70OWadJ9uHZ+rYh9wLAa5Lt
         nlM837t0dzi41f9k9mx6YxQm4N+qkbKCwqqVvNpPtem5zbSZbsiJxWijEdOXZ1o0cRzo
         HtMGZDubp+j5an7u4IAUIK8hU+4x7fcOIjUdHCdtvFoOprEfD2xuy05BOqsL0LHH2Cbp
         Uc3hEa+7KK0/ZXhjwWgR7DTq8hI8L5KPks0AOR9OMdplvreI4drKJX3G5OAzD+cNJ636
         YhoYDUKr35IvbeerVFLXPDH0nwOxIqSK/YFxl+Ps2kEuKgSp8SSM1iZstixryVjkPMoM
         n+sw==
X-Gm-Message-State: AOJu0YwT7IC3InC34K/jra0LKR6CeuM9DQmoWKjJxO9d/ViiqGn3zL+g
	6WkRhoiGaTKtfM1TtIRkCXmQUg==
X-Google-Smtp-Source: AGHT+IEpfQbZFhoP+4xF6oGbm9WLNXmDZt8//y70H4L2p6NSg6g0KfGLMOL4+jHV47yUNnkQH74gcA==
X-Received: by 2002:a17:907:989:b0:9be:9932:f6f7 with SMTP id bf9-20020a170907098900b009be9932f6f7mr5948604ejc.44.1697453753241;
        Mon, 16 Oct 2023 03:55:53 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:55:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH for-4.18 3/5] xenalyze: Don't expect an HVM_HANDLER trace
 for PAUSE vmexits
Message-ID: <5de90309-f90e-413c-9126-e631bc3db03e@perard>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
 <20231009125137.1329146-4-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009125137.1329146-4-george.dunlap@cloud.com>

On Mon, Oct 09, 2023 at 01:51:35PM +0100, George Dunlap wrote:
> Neither vmx nor svm trace anything, nor is there anything obvious
> worth tracing.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

