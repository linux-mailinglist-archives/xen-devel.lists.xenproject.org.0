Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681D79A813
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 14:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599396.934792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfgRp-0006vN-BM; Mon, 11 Sep 2023 12:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599396.934792; Mon, 11 Sep 2023 12:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfgRp-0006sm-8J; Mon, 11 Sep 2023 12:55:25 +0000
Received: by outflank-mailman (input) for mailman id 599396;
 Mon, 11 Sep 2023 12:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfgRo-0006sg-91
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 12:55:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77db6d4c-50a2-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 14:55:22 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so46540645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 05:55:22 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003fd2e898aa3sm4614638wmi.0.2023.09.11.05.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 05:55:20 -0700 (PDT)
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
X-Inumbo-ID: 77db6d4c-50a2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694436921; x=1695041721; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MJDHOHn3p19312k3bvPqCqjvzBN1CUNqtX4tOn1Hge0=;
        b=B2uKbcGVUI2F/h0UjASZca/J3YlWW4bXFre7Ai3RZv98278GZ6N+pr0R0OFujzWn5k
         j6EKOA/i4vd+VCdU1zJXSoxJHbLhBqdsvdsH4N3zufQkG+CtDQe9cu0APL78VpoP/Qf2
         8DC0Zm+7cpPmE4ZcoEz4kNN0HWskTauh5+tUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694436921; x=1695041721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJDHOHn3p19312k3bvPqCqjvzBN1CUNqtX4tOn1Hge0=;
        b=WZlGNx18xGIE3KgdAw0EqC7g6lJXPmISXCUc2CIm0G/jQyXLtGQ/TyisIZHO5Nnb4d
         HQgvzpfOdCfTQcnxFqBVjmfElVuBC7ld1tXaRX9t8xW7VU5oDCKAn4Mb4WiDYRzCegSV
         WwYlLe2h6dgWdIWubFOlOMJqXlbhx8ZYXcJYa93MBkXCNoQTRZHI+ZJ2f+fS5rxPKiGc
         dCuk/x/5d+uAdiKoqstrvdlhEFTxrx8pWBwP5kWPkSIvhm8VzMvmNiqojEQkCPbMMCET
         +ZaWuAMmvsvCsHqTG+tQAXCPKlYN+mCKJXJXjVgv4q0EOZoMuIAImhYnytoOEHIx7/y+
         mUkA==
X-Gm-Message-State: AOJu0YwFLDjIXrlwcL/S4sBbdd4ScSaPCkXrMpD9eaq0YuJv2QFXRzRR
	IorRPV/ooINoG+S/K8exvKPkcA==
X-Google-Smtp-Source: AGHT+IGXF0kToSvTlvtlGhMXW/AxR4qkmH8wRxUNBQ3odqh+RdhaStB4BW5cKw75fvTiGI2/6520BA==
X-Received: by 2002:a05:600c:21ca:b0:3f7:f2d0:b904 with SMTP id x10-20020a05600c21ca00b003f7f2d0b904mr8284128wmj.8.1694436921704;
        Mon, 11 Sep 2023 05:55:21 -0700 (PDT)
Date: Mon, 11 Sep 2023 13:55:20 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
Message-ID: <6kqxsmihukmyzqte5isatmcyisrhpxujwzca6o5zmgvmjkutfr@ynr7cj2dxxvc>
References: <20230902162246.15672-1-javi.merino@cloud.com>
 <4489a5ce-ecd0-49e2-9e47-e621b098c96e@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4489a5ce-ecd0-49e2-9e47-e621b098c96e@perard>

On Mon, Sep 11, 2023 at 11:40:59AM +0100, Anthony PERARD wrote:
> On Sat, Sep 02, 2023 at 05:21:08PM +0100, Javi Merino wrote:
> > diff --git a/tools/misc/xencov_split b/tools/misc/xencov_split
> > index e4f68ebb6e..8f1271bfe7 100755
> > --- a/tools/misc/xencov_split
> > +++ b/tools/misc/xencov_split
> > @@ -1,5 +1,7 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> 
> Beside this shebang change, the patch looks good.
> With the shebang change reverted: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

In v2 I did not change the shebang:
https://lore.kernel.org/xen-devel/20230905201653.98425-1-javi.merino@cloud.com/

Cheers,
Javi

