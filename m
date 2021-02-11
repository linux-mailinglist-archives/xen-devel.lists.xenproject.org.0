Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AB318E41
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 16:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83965.157253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lADpH-0000Gy-IH; Thu, 11 Feb 2021 15:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83965.157253; Thu, 11 Feb 2021 15:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lADpH-0000GT-Ep; Thu, 11 Feb 2021 15:24:15 +0000
Received: by outflank-mailman (input) for mailman id 83965;
 Thu, 11 Feb 2021 15:24:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8IX=HN=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1lADpF-0000GO-HT
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 15:24:13 +0000
Received: from mail-wr1-f44.google.com (unknown [209.85.221.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 149d9afe-3c24-4bd4-a212-38dcc32cf45d;
 Thu, 11 Feb 2021 15:24:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v1so968168wrd.6
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 07:24:12 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c5sm5469871wrn.77.2021.02.11.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 07:24:11 -0800 (PST)
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
X-Inumbo-ID: 149d9afe-3c24-4bd4-a212-38dcc32cf45d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r73cmlC1j2cHDWraNmDzLtHimsKfOTe23uRKBUQvTXY=;
        b=D/wfeZbJ1f4TyBFbC5qhFm7zoRGJZ25ZPqQom9TpHc1chJsB2ypqYimLcuiADXX3dq
         N+v4PFVLe3oMAwJVFyb+JLxl5cD33QhoqjQcR/+nce8yVhIkdR2pzf4NNpTO8o3c0xQc
         XPYK7uxWjNPJidc8vxgJtL3M5/t2BCVyxrUYS0j813oicV3lBjkZt1nJg/O7jLy+AATg
         fE0tskh3k6x1sxC3JJ/y4d3X7+lI5pZhhH6XBZlOIPD6W939yco2e/3sd08Yq9J6TA/+
         +8lwijbQrU/W7dv2mOInNIsiKBGvOBrTMZajONc55fMtdT66USouiUWHKNg9zt+FqsRA
         XveA==
X-Gm-Message-State: AOAM530pYzYg6J7AGl8p8y6lXPfgzFFKHM6UZ+88ylyTIG0gXwyhcpht
	ZapQCsVD4lVQtUDuDzw75/Q=
X-Google-Smtp-Source: ABdhPJw0ZNLx6cIm1oi5TPu/ZBGpav6tW7wPmN3XoUi4E90WuF9Eo8rynhy/JWMbDVpCiMzyDv1snA==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr6042718wrc.276.1613057051742;
        Thu, 11 Feb 2021 07:24:11 -0800 (PST)
Date: Thu, 11 Feb 2021 15:24:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 4/8] xen/netback: fix spurious event detection for
 common event case
Message-ID: <20210211152409.knullq66jv3bkis2@liuwe-devbox-debian-v2>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211101616.13788-5-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Thu, Feb 11, 2021 at 11:16:12AM +0100, Juergen Gross wrote:
> In case of a common event for rx and tx queue the event should be
> regarded to be spurious if no rx and no tx requests are pending.
> 
> Unfortunately the condition for testing that is wrong causing to
> decide a event being spurious if no rx OR no tx requests are
> pending.
> 
> Fix that plus using local variables for rx/tx pending indicators in
> order to split function calls and if condition.
> 
> Fixes: 23025393dbeb3b ("xen/netback: use lateeoi irq binding")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

