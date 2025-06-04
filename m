Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B4ACE3D0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 19:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005785.1385155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs6c-0005Pi-4b; Wed, 04 Jun 2025 17:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005785.1385155; Wed, 04 Jun 2025 17:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs6c-0005Mg-0c; Wed, 04 Jun 2025 17:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1005785;
 Wed, 04 Jun 2025 17:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMs6Z-0005Ma-Vh
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 17:40:47 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b929c18-416b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 19:40:46 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so821001f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 10:40:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4f00a0146sm22614053f8f.93.2025.06.04.10.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:40:45 -0700 (PDT)
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
X-Inumbo-ID: 0b929c18-416b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749058845; x=1749663645; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+jg+denqzEfVkfGkQz8sgF5eavw0as2hMWRK9MVLj4=;
        b=qwF+Bu0GoP4M+dq4NN/4/IGSHQrv48JpwdxfHD/XHsXVjDU8JyGhNGc8GMErn31gpN
         IBnbrhayhNpd89GMtZ1iCsygtg8CpX1b/ssd2vMHCmtzs4pUuWsfEntBKdJl7dBc84aH
         +zcEth80Q3a32GrDj8nSaXwcja0zbMX2/Od4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058845; x=1749663645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+jg+denqzEfVkfGkQz8sgF5eavw0as2hMWRK9MVLj4=;
        b=ToJqxMHXBkzX2M33oplW2fZP+ws+FSSTUW9CiiVsN2IDqeg8LRcKvCN0vFJ9oIbK03
         l8RuxYXxtowTBLxORNeDfRSU7pKnyms1ksGrHaD+0lQuGwNPq2NDdsvidzrcjadTD66W
         GceMgwOfw3HEwA68Zcxnthtks/0kStYgvTB4pvV9tLRc5zSsYuepDCM5ftJnqjYYW5WJ
         Q5nWeqx48E/IVoMzeJUjY6Fbn6HAQwehAJsHdOmnzOf5vNGJ+gXbq82J/ndoQ6g4rdv1
         to+dUgRRJ4LIf9NwmyaNUwuX+upQbTO+ab+sA3or/gq+BWo/PNmsXgsFYPiOETZ1stQf
         FktQ==
X-Gm-Message-State: AOJu0Yw7HgSH/9EvVXP9yfk0EyW+dvBz5WKsmdDEJu1pVJCDA3VuAslf
	kUh0O6tMlqeTQK/WJNUi+CYszvvOobnTTqt6BI/qPWLNZU9Z/G35upmYLUm5Kvm4EUY=
X-Gm-Gg: ASbGnctELqUhpBMtOTmtOoGwvhpB8wqeXLFUvOrjqbwdUzaeRf0uklBun8zFaK+6NFF
	kdAmrD3VWPXc/d7iub35LvJRxuupRhQFlCyrGap07sRyrRn4JpEppcAxg63PSmx3YBTgkVA5LKK
	u1Ay3oZFB2W6gqwNTv9gsE5HzaT47dmoI2pNPsgbx50/JLYsQIBbPa3UYP6t44RgdFF2g0KPJCM
	j4VxzYSwIgb3O7f9EhycC9CLK3eIXTTlsp8vKHHBaoUMNUm8h3WU68Q5A4sUSYCiNmdFWIzd+D2
	4CB1eLxdTC7MteDEl4rJUBXnlxIGqS5rzSb1iZi1N5oWy/NCwzgYCggfaB0zd8VGpZd0WuwAsmF
	1OkrmDt1udPW5jL1n94qTfBthjxZnhx5u494=
X-Google-Smtp-Source: AGHT+IHIC34fFJ86M0nj6jj9jGVFs4Fc3FMQJG0lWKy1SYo19b/7TEGpJRNNgSFqpIxZagpErZA6JA==
X-Received: by 2002:a05:6000:240a:b0:3a5:1360:6b34 with SMTP id ffacd0b85a97d-3a526dc524cmr395659f8f.2.1749058845530;
        Wed, 04 Jun 2025 10:40:45 -0700 (PDT)
Date: Wed, 4 Jun 2025 19:40:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/3] MAINTAINERS: add link and keyword statements for
 Argo section
Message-ID: <aECFHDlun1IrE1Er@macbook.local>
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
 <20250528211040.10562-2-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528211040.10562-2-christopher.w.clark@gmail.com>

On Wed, May 28, 2025 at 10:10:39PM +0100, Christopher Clark wrote:
> Add link to Argo documentation and to ensure that Argo maintainers and
> reviewers are included in developments involving Argo, add keyword
> expressions for Argo.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..697f383505 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -223,9 +223,12 @@ F:	tools/libacpi/
>  ARGO
>  M:	Christopher Clark <christopher.w.clark@gmail.com>
>  S:	Maintained
> +W:	https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen

Could this be moved somewhere else?

The wiki is in a very bad state, with an increasing amount of stale
content.  It would be better if documentation linked here is in a more
controlled (ie: reviewed) place rather than a wiki that can be
modified by an unknown number of users.

Thanks, Roger.

