Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7B3668D1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114269.217722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9k0-0005AM-OD; Wed, 21 Apr 2021 10:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114269.217722; Wed, 21 Apr 2021 10:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9k0-00059x-K8; Wed, 21 Apr 2021 10:05:52 +0000
Received: by outflank-mailman (input) for mailman id 114269;
 Wed, 21 Apr 2021 10:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9jz-00059s-Jp
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:05:51 +0000
Received: from mail-wr1-f51.google.com (unknown [209.85.221.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19250ae9-0812-40c8-bb96-d6b1a573a772;
 Wed, 21 Apr 2021 10:05:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r7so28719267wrm.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:05:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s64sm1898831wmf.2.2021.04.21.03.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:05:49 -0700 (PDT)
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
X-Inumbo-ID: 19250ae9-0812-40c8-bb96-d6b1a573a772
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LeASHJrVyRgtft0qvxTzHttrnm2bXQ6nQuYymKtjlq4=;
        b=qTSd34L1UlQbp9IsNT73haQbqUV7pMed9uc11QlQGzbnoqUKWdEe10nRov4HuAw3QX
         ZXRYFaUtyRayjCbNeSA+Kho3HRBHgAr51VRme7kfz56ZQK3rLrgvl8UZTZdyP30QgRzM
         CaqOt0TR7Jh/OpAyjlmfhx0FsNiVVvj7KgFN/x6hjwAsjams1K1ak7LhC/au2H2hT7cL
         t0Y4CKfMLgTygu9om8nwdxLeNFGicmml/JdYXP1C2mFXi2imfBnP5VAh5OT5TzQ0O7fO
         SXMISb7BbSa6BGZMi2AyZSxocxjYBlPvo5ZSLWoT+fReZaVW2ZN076P+/O4g/03TPvzQ
         30bQ==
X-Gm-Message-State: AOAM531S0OfctEnd2C8TQitzH15LvZLlt1PuGvJOBjlZTtcbokHU/fw4
	WK3uYrARoSWTAmw/GrnXxDE=
X-Google-Smtp-Source: ABdhPJy4+oKNeSAadFmCvYoVCpoVGGK3MRYqkmizcpXRaYs2N+2UyyHf+XPNxGh/iQYavx6uOZOy9g==
X-Received: by 2002:a05:6000:1789:: with SMTP id e9mr25118159wrg.110.1618999549872;
        Wed, 21 Apr 2021 03:05:49 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:05:48 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: Drop XGETTEXT from Tools.mk.in
Message-ID: <20210421100548.jwom5dh6ow7fl5v6@liuwe-devbox-debian-v2>
References: <20210416155941.15454-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210416155941.15454-1-andrew.cooper3@citrix.com>

On Fri, Apr 16, 2021 at 04:59:41PM +0100, Andrew Cooper wrote:
> This hunk was missing from the work to drop gettext as a build dependency.
> 
> Fixes: e21a6a4f96 ("tools: Drop gettext as a build dependency")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Julien Grall <julien@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  config/Tools.mk.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index d47936686b..934d899967 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -12,7 +12,6 @@ PYTHON              := @PYTHON@
>  PYTHON_PATH         := @PYTHONPATH@
>  PY_NOOPT_CFLAGS     := @PY_NOOPT_CFLAGS@
>  PERL                := @PERL@
> -XGETTTEXT           := @XGETTEXT@
>  AS86                := @AS86@
>  LD86                := @LD86@
>  BCC                 := @BCC@
> -- 
> 2.11.0
> 

