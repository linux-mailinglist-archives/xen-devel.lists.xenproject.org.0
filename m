Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C489A1F9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 17:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701332.1095708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsltm-0007vG-86; Fri, 05 Apr 2024 15:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701332.1095708; Fri, 05 Apr 2024 15:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsltm-0007sN-5L; Fri, 05 Apr 2024 15:54:38 +0000
Received: by outflank-mailman (input) for mailman id 701332;
 Fri, 05 Apr 2024 15:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXRt=LK=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rsltk-0007sF-Op
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 15:54:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4643fa-f364-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 17:54:33 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4156c4fe401so15507885e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 08:54:32 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r4-20020a5d6944000000b00343b09729easm2309259wrw.69.2024.04.05.08.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:54:31 -0700 (PDT)
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
X-Inumbo-ID: cb4643fa-f364-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712332472; x=1712937272; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpbtyZ+7DGPU2Qc8kYQPXDHoqI1Bzdp8ZNyLz3uUGXE=;
        b=LrVXEOGNP0HsA4AzVjyNrfRTk3CU5JvEjUFxE5EMBwOHY59jWsBl55VDqCHaDH+mCR
         NIY8DhD5TXUGk49wtmjhLU4mXr+BRDJ/shm3jbi+hmJCmH3RfbLBshQePXQZIlXssH2H
         DAkuQo7styKXsDHrj1TZDVRXF8YPkhiro9qck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712332472; x=1712937272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpbtyZ+7DGPU2Qc8kYQPXDHoqI1Bzdp8ZNyLz3uUGXE=;
        b=WA/g1yttf10nxPyjqLHXCH+P//7eqNI+zD3bQmrFGX8TCimTJqWKdqjnK6XT4G6fUR
         YOF2DN4ra97+n6N7TmTJ5Yrr7/TcwXekOyyPXmLYVdZAIdvhsartB+Ar4YQHEvjSyKCo
         ZNV9YaZMLmRxa1n64AN82rf7IQppj0qJidFqS2BIX1O4K7Qw34SQKf5aVIZlzSUB8Tx+
         lQYp7ZskUMT33G7t7tiDuBwoWeBCzJ/5OQkYf21eMNx7vc1lP/xqVBvoLwYdpOLvhMa3
         4RuplTjh19hOpimVEjxRcL/dAq1xzTEsycqC+opQSnIS+FtEi9k+QHonQRN2py4wa/nx
         H5rg==
X-Gm-Message-State: AOJu0YxdWVckGRzkBgsKZZ0vlz3XEThiLe1+w280o8UwwI0vuChAXQss
	pf6LXaSqroX22RWV0SIFo+9HXm8izL4Fkl7tLBACPgCDK/fgqi9/KeRWAIwD2FVMbrBgktLR+kF
	u
X-Google-Smtp-Source: AGHT+IE1c6E6Z8bkk00XC7x/dP1GBqlA0I5Wy77jRoGdbcDAXY2XaYKU5uYMWrVXHdV1aESGaVTeyw==
X-Received: by 2002:adf:fe0a:0:b0:341:d6c3:5c4f with SMTP id n10-20020adffe0a000000b00341d6c35c4fmr1703486wrr.21.1712332472023;
        Fri, 05 Apr 2024 08:54:32 -0700 (PDT)
Date: Fri, 5 Apr 2024 16:54:30 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <f178e1fb-0b6f-4312-a483-b85f413db025@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>

On Thu, Mar 28, 2024 at 05:54:04PM +0000, Anthony PERARD wrote:
> On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:

I've now pushed
"production-config: Set Bookworm's debian-installer version"

and these two:

> >   Switch to Debian Bookworm as default suite
> >   make-hosts-flight: default to bookworm

osstest should start to use Debian Bookworm soon.

Cheers,

-- 
Anthony PERARD

