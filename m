Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416242CECFB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44490.79717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Ay-0001Si-Av; Fri, 04 Dec 2020 11:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44490.79717; Fri, 04 Dec 2020 11:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Ay-0001SI-7c; Fri, 04 Dec 2020 11:23:00 +0000
Received: by outflank-mailman (input) for mailman id 44490;
 Fri, 04 Dec 2020 11:22:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Aw-0001S8-Ex
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:22:58 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d57d0a01-2d98-4f5e-87a5-cc8549f81204;
 Fri, 04 Dec 2020 11:22:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p8so4962017wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:22:57 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w15sm3149831wrp.52.2020.12.04.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:22:56 -0800 (PST)
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
X-Inumbo-ID: d57d0a01-2d98-4f5e-87a5-cc8549f81204
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/C1k3MYuUx3p+eH57DxvaQx/eTuPkAfziW3cYF7b8P8=;
        b=EuYPVdfcZVHQ4gdsDd2SuNBWPRqxnboAmlBmanvUnutyMQOVtaD9ybL/APmZCHyt/M
         rcQNQ4nXMrUoMeV2SG2E/l9DzkXutovsFaPI6+tYNmDebtLRa8/2gLT39dI9wxU0Wu4q
         FeFrE1kJhPzfCbj3akfaEEJdknJ9hWuwAm21oAvegiAerdDOG8KzEDjZYoCAmpj4KUpl
         KksbmSebJgibQePThWwjlhV7ATbAb4MWx9wXjyRBz2s/+AYyxYUx0ng8bo7X0p6r2OTN
         PPw6D8lDVr7v92bmi2mpIZiuQyh9gYHQt813FCK3YPZKwyTTxszMm3Kep0vgFYicUqGf
         yv/g==
X-Gm-Message-State: AOAM533X1/LJ+uFQZYk1DHhPNUvnrTqP3GSX0aHLThOJvutIEnxjuul9
	pHvgTJ1mMkNXKF9gUQAcipE=
X-Google-Smtp-Source: ABdhPJxqmdNPve4AUlGSPQ1ru0WCIQrbGe051mC2cxWGHbTxd9ipy5194eamfvBhsV+O6C7MXzZb1w==
X-Received: by 2002:a5d:570d:: with SMTP id a13mr4442508wrv.193.1607080976614;
        Fri, 04 Dec 2020 03:22:56 -0800 (PST)
Date: Fri, 4 Dec 2020 11:22:54 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 09/23] libxl: remove unnecessary check from
 libxl__device_pci_add()
Message-ID: <20201204112254.fjdfb4esxrb3wiil@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-10-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-10-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:20PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The code currently checks explicitly whether the device is already assigned,
> but this is actually unnecessary as assigned devices do not form part of
> the list returned by libxl_device_pci_assignable_list() and hence the
> libxl_pci_assignable() test would have already failed.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

