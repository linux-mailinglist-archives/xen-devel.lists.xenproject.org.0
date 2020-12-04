Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7422CECEF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44449.79633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97N-0008CZ-1w; Fri, 04 Dec 2020 11:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44449.79633; Fri, 04 Dec 2020 11:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97M-0008C9-UZ; Fri, 04 Dec 2020 11:19:16 +0000
Received: by outflank-mailman (input) for mailman id 44449;
 Fri, 04 Dec 2020 11:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl97L-0008Bx-87
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:19:15 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4cda3a2-143b-4626-9843-fa6cef21ffcb;
 Fri, 04 Dec 2020 11:19:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t4so4922841wrr.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:19:14 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n10sm3154087wrv.77.2020.12.04.03.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:19:13 -0800 (PST)
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
X-Inumbo-ID: c4cda3a2-143b-4626-9843-fa6cef21ffcb
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oucn0iOy6mf97liPz6ggJApsZ+F/ZSW6CQPdImEkriM=;
        b=RxdJjPuLBg52UFMc8Y+4hlMe7N9l0SN1525uKDggfut7FS3XuxubbHXwztoMJzMgNf
         Ev6kJ+vCqtAq2nreMNBj0LcBPQ8Dn2fQnF1r23Sd5kfQaq04Ac4tKxDn7Ouf5vyl0ieb
         47P/FFhxRbziG2e/OjJb5MAe/UR1kuztPDWuqU7Ks1MXjqX0v4U+a3uTEVObVm0OA4kc
         oWx6hNNzJYj/jTeZVAvNyaKYK+ugGgdAmKlJ+V7ycLAFBdN2Ow/RBoW0XNaop9tS33TK
         lEl9Q5rN7V2MA3YVYOu7mPKpZk0JAnzA/wcuQFM9gAcFBPieTya1lNMJnEIu7FDhrfyb
         isxw==
X-Gm-Message-State: AOAM533q/2GTDoKmqIThCwSYr8U1L7W7b4SYqD+MU8QrgbZdHpeIoOeu
	DnVdcKLhRJ2KUgMur207F+g=
X-Google-Smtp-Source: ABdhPJwvujTiSE4oLfPS1NKiRh2I+DJNs0vYg3OFA5gS6B2kCVw0olwXcqPYneWMYvGbl+SU9nofJA==
X-Received: by 2002:adf:bd84:: with SMTP id l4mr4472549wrh.41.1607080753849;
        Fri, 04 Dec 2020 03:19:13 -0800 (PST)
Date: Fri, 4 Dec 2020 11:19:11 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 04/23] libxl: add/recover 'rdm_policy' to/from PCI
 backend in xenstore
Message-ID: <20201204111911.vps6sjyqtocykjzl@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-5-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-5-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:15PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Other parameters, such as 'msitranslate' and 'permissive' are dealt with
> but 'rdm_policy' appears to be have been completely missed.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

