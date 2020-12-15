Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EC2DB0D1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54361.94398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCn2-0008Cl-PA; Tue, 15 Dec 2020 16:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54361.94398; Tue, 15 Dec 2020 16:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCn2-0008CM-Lp; Tue, 15 Dec 2020 16:03:04 +0000
Received: by outflank-mailman (input) for mailman id 54361;
 Tue, 15 Dec 2020 16:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCn1-0008CH-9c
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:03:03 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32c9e6d0-c5df-44d7-ac73-9696292c3384;
 Tue, 15 Dec 2020 16:03:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d13so2133581wrc.13
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:03:02 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h5sm40769128wrp.56.2020.12.15.08.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:03:01 -0800 (PST)
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
X-Inumbo-ID: 32c9e6d0-c5df-44d7-ac73-9696292c3384
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wSFx3Z50lGO0G6CS6ngFrAe0zqu2JkGjbDZ3jJk9+mw=;
        b=Bod24dKRtf7wzeGh54P7szpTRKAGKerFfl20lwlURxTElWSDZNKD1sGi6uK1a6RwA1
         bFpTck1Oa2jsxvm9TMS4wJFwtpvyTFvhFHo45tf3CF325RSnsK8bRC00x79OhSUrJ6Rt
         J7ENZZ0olWrHdjwyWqZ0rzh+7g7De3HaSeJ+kFsIMOMSl0T+t/vT8jThRkySiKaCEMrP
         wdkIokvNMaeOkEuTpBGu8KrKYYE3Ttxs6P4yQt4RVDAFPB8L9I2K73bSEVfUDPhTxbKN
         YRj/Ua7UOB2e/x6gDouXkPMHSXCn3KkYtCfxP7S6A3pam2RdsNDN7XBxEpwy7wwph3e2
         J0YA==
X-Gm-Message-State: AOAM5335jpR70Fl1OkS03sVkAx5Nb+ToZerPvHOSmV6Cze40RKQx7FQG
	7PDlHLIOsOqaAGQHZAEHIUE=
X-Google-Smtp-Source: ABdhPJwfLovFBdxbBGDN8r5bRurBcx3AA2Aax3zEXztJ3ofSGWhx1ivcgLCAjEhIYnJPiaWVCIkLHQ==
X-Received: by 2002:adf:8342:: with SMTP id 60mr35193993wrd.140.1608048181683;
        Tue, 15 Dec 2020 08:03:01 -0800 (PST)
Date: Tue, 15 Dec 2020 16:02:59 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 21/25] libxl: convert internal functions in
 libxl_pci.c...
Message-ID: <20201215160259.mb74mbmhjg2ioamg@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-22-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-22-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:29PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to use 'libx_pci_bdf' where appropriate.
> 
> No API change.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

