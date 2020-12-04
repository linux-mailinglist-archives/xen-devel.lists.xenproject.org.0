Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD52CED10
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44529.79801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Hk-0002NO-Qj; Fri, 04 Dec 2020 11:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44529.79801; Fri, 04 Dec 2020 11:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Hk-0002Mz-MK; Fri, 04 Dec 2020 11:30:00 +0000
Received: by outflank-mailman (input) for mailman id 44529;
 Fri, 04 Dec 2020 11:29:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Hj-0002Mq-MQ
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:29:59 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b427e4ce-8a47-45c7-adb0-3af833753cf2;
 Fri, 04 Dec 2020 11:29:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g25so4518734wmh.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:29:59 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j8sm3287537wrx.11.2020.12.04.03.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:29:57 -0800 (PST)
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
X-Inumbo-ID: b427e4ce-8a47-45c7-adb0-3af833753cf2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6XWHWmXC3O+5iWU+9mVtXLFuukn/6544FOLIbMkQ6I=;
        b=I0eLKWm8YvJd89pKambqYkj6F9rmObbFpEDuhH2i/gn4tkhHknKZu0fSX3+0IgXJ30
         304GnmDohcHX9fcS66wK8OwFSTlTNuKUJTnbCDgvLqvrJfO97PSHnZK9dSXKtVWq3F25
         5wwq0OjUpO7JiDEeTJQhLWP3uv5uXMtxBL63rQpUgD0CnqMJ7v1iusxSctcHaF20Rxhy
         MS91uugvXui2jR6yJNElxaUtdveQVyXkOXOg4BJlyJYe//SkkIatWMzUP+XLLe/cxh+Q
         kQFzHB3M2RZ87YkBVUqHiTgZtqQeAGsCnVc1pi6nWgvMf4M4CCL0v5RM5UaOQ+wTQEr4
         KS9Q==
X-Gm-Message-State: AOAM530ax6jOh3Ln+iH0iArItWfVP314nkiMCotHuLa9KudZ+g7hf83K
	tQfQfb+dQVYXdCwmXlRa/ic=
X-Google-Smtp-Source: ABdhPJwtsebRUnAWlKDnzBYGGok755CbcMrC/o1NseYzldEqt8zsru7iGn6sY4Vh3X0xpKLmERel9g==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr3719496wme.188.1607081398474;
        Fri, 04 Dec 2020 03:29:58 -0800 (PST)
Date: Fri, 4 Dec 2020 11:29:56 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 14/23] docs/man: extract documentation of
 PCI_SPEC_STRING from the xl.cfg manpage...
Message-ID: <20201204112956.7t23kidmf3p2zhig@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-15-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-15-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:25PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and put it into a new xl-pci-configuration(5) manpage, akin to the
> xl-network-configration(5) and xl-disk-configuration(5) manpages.
> 
> This patch moves the content of the section verbatim. A subsequent patch
> will improve the documentation, once it is in its new location.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

