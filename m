Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DF3668F8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114296.217797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9sV-0006br-12; Wed, 21 Apr 2021 10:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114296.217797; Wed, 21 Apr 2021 10:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9sU-0006bT-Tb; Wed, 21 Apr 2021 10:14:38 +0000
Received: by outflank-mailman (input) for mailman id 114296;
 Wed, 21 Apr 2021 10:14:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9sT-0006bM-6n
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:14:37 +0000
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a044513a-dd75-4b3d-883f-34306be35ed6;
 Wed, 21 Apr 2021 10:14:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so994484wmg.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:14:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s21sm1831585wmc.10.2021.04.21.03.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:14:35 -0700 (PDT)
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
X-Inumbo-ID: a044513a-dd75-4b3d-883f-34306be35ed6
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EFyFuIW5mFWds7jsQfDx7mK6bXEkZdlVbqZeLPlGWV4=;
        b=IluyRi1abiv2hBUNYotMb3NvRJ58sdX+qYwWnKt1fBK3Bvqam27+Agfcr8qrETPT/U
         z0cCu7zIqfmaZ0GMLWtaRjSMsjITOGfepSTYP/zt9PMVPQ0YMvz8rBhBafeZVVHy5Y3M
         Rc23Npitnz6avgr+YRkdJ4eCx1Nay0JDQetqoVUN+s8lGZcsZP8f+xpjglhx8wGftUby
         rbzf9zKpvayy7ayrIYR17aX003Td0FiTVMuaYShsTKd4iWkjZ9yaTvxtls8xpfn0fpJw
         yBjElEhzY9eeOErT719a9mksZSalcfjhyFNOywjyyejzjw4wPpJMn1bY56fkGtSQr/Fu
         Jl9A==
X-Gm-Message-State: AOAM530/E+87rQR193kUwhHqQ+qUgnNITPaZ6lrr7c0WGzoLLA5eK3r2
	lTHumOaVdogAbsxZq9BWZ5U=
X-Google-Smtp-Source: ABdhPJy43zvpQlKrXQWuoDTQAdxBqzQszlhiOF44hJadvNTzAB16md3CKQL3dosDZWCdG9sQCGv2CQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr9365494wmj.84.1619000075781;
        Wed, 21 Apr 2021 03:14:35 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:14:34 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH v2 3/6] tools/libs/ctrl: use common p2m mapping code in
 xc_domain_resume_any()
Message-ID: <20210421101434.otdbqxpoodwpe4n6@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-4-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:33PM +0200, Juergen Gross wrote:
> Instead of open coding the mapping of the p2m list use the already
> existing xc_core_arch_map_p2m() call, especially as the current code
> does not support guests with the linear p2m map. It should be noted
> that this code is needed for colo/remus only.
> 
> Switching to xc_core_arch_map_p2m() drops the need to bail out for
> bitness of tool stack and guest differing.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

