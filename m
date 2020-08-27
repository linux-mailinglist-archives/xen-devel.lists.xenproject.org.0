Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C525448B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGRY-00077k-H5; Thu, 27 Aug 2020 11:51:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGRX-00077e-U6
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:51:47 +0000
X-Inumbo-ID: 9404beca-e9dc-4e0d-9652-ca0b8b01ebb8
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9404beca-e9dc-4e0d-9652-ca0b8b01ebb8;
 Thu, 27 Aug 2020 11:51:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id k20so4836692wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J2UmE2XM+oK3ZanSEWyeDe1tpGo43nMAavuIMnD0pT8=;
 b=pL1kZ4wwon1D6b0XcXBVMh6mNgeHootyq2UNl9qlkjPRRbAl0l3wWcsggJLLywRYcm
 5j6hIwtv4Z5EaOm5EF6qAsK+z7JhTRbMleWMeigqrbhUJ1nfSatSaba028FHQY29g3nt
 UECb7FNOpTlX5QwXBniLSQ5wLyMGeX1iV+ccNGn8usS77/jcVtffZIaAjlxy5KzwQKKl
 stHJPD7LYrgkQgXVAG8PmKdU48pWJhyssjET3dVQf8mCDQsF1kEu46ZAiGEvI5Hj6a8U
 1ro5Ln7cwzWPrkxBVoZFIWU1YsC52AvPBQARLEDnQVAl0nJSebHJkUSZ7XWmN4Nqr2Gi
 3AkQ==
X-Gm-Message-State: AOAM533HxHBj7exrMdXkIKrxcsNL58Ht5zUNuU8ESAGykzssRT33UMv9
 8SfQBxlaWt41q4+VEQvGs9o=
X-Google-Smtp-Source: ABdhPJwYFuHQolYiZ9QeUUbiPq5groQt/4Z4oY/8bOeMx0LvyCwG5LirGb7dacAPvaCiw1sFUwQHeQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr11589493wml.16.1598529106308; 
 Thu, 27 Aug 2020 04:51:46 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 70sm5163774wme.15.2020.08.27.04.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:51:45 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:51:44 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Subject: Re: [PATCH v3 36/38] tools/libxl: move libxenlight to tools/libs/light
Message-ID: <20200827115144.g6oxcpjyvx4qkdxi@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-37-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-37-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:17AM +0200, Juergen Gross wrote:
> Carve out all libxenlight related sources and move them to
> tools/libs/light in order to use the generic library build environment.
> 
> The closely related sources for libxl-save-helper and the libxl test
> environment are being moved, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

