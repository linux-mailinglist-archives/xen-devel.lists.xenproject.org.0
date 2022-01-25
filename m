Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73D49BC94
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 21:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260537.450203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCRyL-00054s-UZ; Tue, 25 Jan 2022 19:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260537.450203; Tue, 25 Jan 2022 19:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCRyL-00052z-QW; Tue, 25 Jan 2022 19:59:21 +0000
Received: by outflank-mailman (input) for mailman id 260537;
 Tue, 25 Jan 2022 19:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BISm=SJ=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1nCRyK-00052t-9q
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 19:59:20 +0000
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47810fb4-7e19-11ec-8eb8-a37418f5ba1a;
 Tue, 25 Jan 2022 20:59:18 +0100 (CET)
Received: by mail-wm1-f49.google.com with SMTP id
 r82-20020a1c4455000000b0034e043aaac7so1960355wma.5
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jan 2022 11:59:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v3sm10122822wru.15.2022.01.25.11.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:59:17 -0800 (PST)
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
X-Inumbo-ID: 47810fb4-7e19-11ec-8eb8-a37418f5ba1a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yw/RdWg67hPN+jsg223JzR9KLoHDhEwfDc5ApJlN6ow=;
        b=QZCHuvCCjNaZpnDRT9zLcwYvK8N2nLXWqM9ce6r7NhR6oMOLJ7ZIAk5Iq6HjH++P2G
         A76dQRVEoxz2ltaiVOFRDG/TR8acw0zOkYO0vPI0NJczruY+uQLV+kOdDmJG+gNyKyMZ
         dKfcsPLmCtLL2h9Pvad7g336et7nwfm5L8bVcOmn5lX4OSTuybPMkUsOgVm5grHY71AE
         IO7l4izxRn90tWcZUlnApUlNgpRGxKPDDLrmcA5gERwflGCPJcCX84hW1cUCDVIPKrzG
         ghhQVQbtvw492aD4D9mbBE/QO1w6JaIgW02qVuCrLov/98JLz+cw0SENMNtYoQ69dXdk
         Lbww==
X-Gm-Message-State: AOAM532djdu2yBPaW21HySL7JS8vpR+W8BT8YovjLbtBBAEYd96/d46M
	cxlvTpIHQmgf3IOJIOhgv0Y=
X-Google-Smtp-Source: ABdhPJwnqimcjjv6skwfOqCCN0Bma3tFxm4VBzZ5EGOZfxayXl/ksMkWwXdU7Nt+ZEYpsoZJrYMlLw==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr4219776wmc.123.1643140757761;
        Tue, 25 Jan 2022 11:59:17 -0800 (PST)
Date: Tue, 25 Jan 2022 19:59:15 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	James Dingwall <james-xen@dingwall.me.uk>,
	Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] libxl: force netback to wait for hotplug execution
 before connecting
Message-ID: <20220125195915.5hmkgmo6fl7ogvyg@liuwe-devbox-debian-v2>
References: <20220124160248.37861-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124160248.37861-1-roger.pau@citrix.com>

On Mon, Jan 24, 2022 at 05:02:48PM +0100, Roger Pau Monne wrote:
> By writing an empty "hotplug-status" xenstore node in the backend path
> libxl can force Linux netback to wait for hotplug script execution
> before proceeding to the 'connected' state.
> 
> This is required so that netback doesn't skip state 2 (InitWait) and
> thus blocks libxl waiting for such state in order to launch the
> hotplug script (see libxl__wait_device_connection).
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Tested-by: James Dingwall <james-xen@dingwall.me.uk>

Reviewed-by: Wei Liu <wei.liu@kernel.org>

