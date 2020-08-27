Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AE2543B3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBF8s-00053C-KO; Thu, 27 Aug 2020 10:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBF8r-000530-HD
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:28:25 +0000
X-Inumbo-ID: 6ea8aff6-f515-4992-a5ad-57174c6c59cb
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ea8aff6-f515-4992-a5ad-57174c6c59cb;
 Thu, 27 Aug 2020 10:28:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w2so4445971wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KfnlxyiDgZUhe8YDQ8pW0jmY7Wu00dkHyYDKf73kpcQ=;
 b=L/lPIWphRkOqbVaYD72XIwLUPhRpaRRYsam81LCJDxN3UBaagipDONAGA0OGJ1Wpv4
 rrpwu4u7qzJVg2Bii/w97ETGX5e+OKe0FgMB6wMfRB/ilZ6HMDKp6LZKlS5HJa9HzHB2
 ggl9rdIgd7SGiZ5fL7N2Ly/BEhiFKftNuPjQLdU7l3kfmaDj/2AA9WSGEIHMMmiAOvAY
 mo8p/KHTYBgJPCfDjBlyePWqeSmJqP8AUcic98+wH4yVcK13cZc60l+ePHjj4tHYKoGP
 rZuKWJqJyIIF6jODRGDC8qbfDZZtGMqzXueO6lCtNUzsqhOxmvFalOGF7rt2VCE3aGv8
 kpVw==
X-Gm-Message-State: AOAM531osobylAbt3YF9MhNp0JVK4Xnh+Jru3UxqyK3XV5PnFmH2mxAZ
 jgeWm+bKxm9MhhRt8peNxr0=
X-Google-Smtp-Source: ABdhPJx4dBH6n0/u1bTcwXchzLDvUJGOfC1SvU0TnTvO3VsZOnvnxSRF4p9As6oUWM4MCLEstt0ieQ==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr11696618wmh.21.1598524104002; 
 Thu, 27 Aug 2020 03:28:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w1sm4237765wmc.18.2020.08.27.03.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:28:23 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:28:22 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 04/38] tools: don't call make recursively from libs.mk
Message-ID: <20200827102822.a7ziau4o26wtalfb@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-5-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:34:45AM +0200, Juergen Gross wrote:
> During build of a xen library make is called again via libs.mk. This is
> not necessary as the same can be achieved by a simple dependency.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Wei Liu <wl@xen.org>

