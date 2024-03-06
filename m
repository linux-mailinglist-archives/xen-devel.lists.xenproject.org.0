Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECE8735F3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689100.1074093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhptW-0007jW-4r; Wed, 06 Mar 2024 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689100.1074093; Wed, 06 Mar 2024 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhptV-0007h7-Vz; Wed, 06 Mar 2024 11:57:09 +0000
Received: by outflank-mailman (input) for mailman id 689100;
 Wed, 06 Mar 2024 11:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhptU-0007gz-NO
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:57:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a73f3ed5-dbb0-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 12:57:06 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412e6ba32easo21417335e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:57:06 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b00412ee7d65a6sm4500578wmq.6.2024.03.06.03.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 03:57:05 -0800 (PST)
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
X-Inumbo-ID: a73f3ed5-dbb0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709726226; x=1710331026; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DltjrE2zt2D3BwLB8iMrcHwv/uicyByZgF0Y2kIPa8=;
        b=cq0wTjkL9g/pLLgKc8BylMj2BnKH3kj0VLMiwklcBUA6vOuBYpXMqO7KKdZ0fb29DM
         258V3UgK82vu7cldswjkd+GvVD1fJZDTB9m12sib03O0nLyxYMoPg07daynXcsfDJFeF
         MEhU4jZ/2QmxM0Qzc1RbByG51n4v3wZERO78Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709726226; x=1710331026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DltjrE2zt2D3BwLB8iMrcHwv/uicyByZgF0Y2kIPa8=;
        b=GvYQPduq+1Y7n1vx58Unw63Y0dSKH2PLmKwTx3+jB15d6DYdUgJv+bm4iKf5Iboc6a
         0BcLxVl3enR4Sz0u8wsmbitR05yevAYh2lF8DRVhKuPL3ZcZRPee0y2nrolvew0Odh5V
         7bJ6VU1Own/l95hIbpdOWE3h2MoljeKJOTOEgFGcVWmIbAikD0Ldup06L7r9BaB6HILD
         2D06oYMwHuOGRgeDa8ueHXCdOgcxZofFaBmSH5mb+FI5307cgvhS+Oo+TaT8QU6Jw54T
         rDPDxqHK4fGQf9LPKkg31cM8cNQtemgdqXVOn+SnNBxTSEMwtoWi07wR5XdFcAlbfFC1
         hJiw==
X-Gm-Message-State: AOJu0YyR+TTW21Jv617jDPQ3r+U1VSSppsqIaw9TISJ7qIXV0Y5cgE0v
	FKhrnoe9fwLkElD7+tf9aEQHzS344eMauvf4tY43bw08/QpMbF2W0WDkh6tPAug=
X-Google-Smtp-Source: AGHT+IHECEfskrfgU4Ztwug6zpma2ubwATu/5OiVLFlOOeJlMS606X/qtr6eHDaeDVq2l1cCQ/JOJg==
X-Received: by 2002:a05:600c:4e8e:b0:412:e70a:ab8a with SMTP id f14-20020a05600c4e8e00b00412e70aab8amr5177495wmq.25.1709726225827;
        Wed, 06 Mar 2024 03:57:05 -0800 (PST)
Date: Wed, 6 Mar 2024 11:57:04 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] tools/xentop: Add VBD3 support to xentop
Message-ID: <6fd0533e-1f91-480b-8d88-50a73c3a8aec@perard>
References: <20240228113947.57053-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228113947.57053-1-fouad.hilly@cloud.com>

On Wed, Feb 28, 2024 at 11:39:47AM +0000, Fouad Hilly wrote:
> From: Pritha Srivastava <pritha.srivastava@citrix.com>
> 
> xl now knows how to drive tapdisk, so modify libxenstat to
> understand vbd3 statistics.
> 
> Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>
> Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

