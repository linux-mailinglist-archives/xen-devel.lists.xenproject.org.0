Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCED37C181
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126279.237704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqJn-00048D-RY; Wed, 12 May 2021 14:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126279.237704; Wed, 12 May 2021 14:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqJn-00045l-OR; Wed, 12 May 2021 14:58:35 +0000
Received: by outflank-mailman (input) for mailman id 126279;
 Wed, 12 May 2021 14:58:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgqJm-00045f-Av
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 14:58:34 +0000
Received: from mail-ot1-x335.google.com (unknown [2607:f8b0:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db43408e-1a35-4c5d-985f-bf5bff516cc5;
 Wed, 12 May 2021 14:58:33 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso20831972ote.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 May 2021 07:58:33 -0700 (PDT)
Received: from ceres ([2603:300b:7b5:c800:1cf6:4c9f:4e7:d116])
 by smtp.gmail.com with ESMTPSA id w25sm153167otq.40.2021.05.12.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 07:58:33 -0700 (PDT)
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
X-Inumbo-ID: db43408e-1a35-4c5d-985f-bf5bff516cc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iykaG1QuO5qEZs1ETSCytVqlMltBctwV3CQakGdsnxQ=;
        b=cNIQOnhGYgXqV/It6z0ALitchnraAAKPlsvAVjx5dDPpiUrnTH6sOwlVipGF5i4mo8
         lvLBghLlGAzTAvaGt/TIjH3vXJaIuDVjqdazab7KWfxvLdcbfuBlxWC7vFecEgGvN9fW
         fCT75y1/IQR7i0C/iUl7UZKFrCybCZQR0wdlZXkKTqILRQgurYrItOZx1W77HvgwyHRo
         DHj33LxMInsbH+/LUui8Mib60JifOPPmoBAdkr3o4xqOFXCpuAMUfPIbs4UffwSuP2OL
         fOkGiH1J4wWKbmSK0qmzj0pOp2iI8pJPUD10BSNwGqsLRebR+MuJGs2bLcscvyjbN7WH
         ihBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iykaG1QuO5qEZs1ETSCytVqlMltBctwV3CQakGdsnxQ=;
        b=XShxjweBn+E7dESiiRqTKRxw4Z7eIsr7FkYXbVLnxHw8hJqfyeKfjou7hV2auMeSpE
         uoFePEHUrjH5Lp0lYqSoWDYsKCaraPjorCW0h/MAI/452Q0Q2SY+X71geKOK5x3lxk3P
         J9pQRedPCOEgL5ttw/aOku5dn76UcgnSMmGdsXi86ZvO6/5EOSm+xVPrY/tuvbyHHLDp
         +/v/nfOxJGaHlZHznTdTJAlkGhBqd6mT/w1KI0TAECkLsgPYvTSNQYr65oY9ESBB+5HH
         iLn6FnPl3fqa3z4bAGkq+ZEKdoF/DHbSimGREZBXNrHGhQTRyI5wqg2qQrjVPWQ0LKSp
         trXA==
X-Gm-Message-State: AOAM530OeYsKoOBZ9//EMlWCBNcLCAnm/RPiMROhViv3KGiVc0PR2T+c
	81tGUT6lb7yo2YRZZZ8F1J4=
X-Google-Smtp-Source: ABdhPJzZN5zhpCNe0QJ+Wt1+7aBQEqm+/EdV3TLqdFy7QVNXxftTOD53gkuuLeTIynk2FFtFgfhZpA==
X-Received: by 2002:a9d:7a56:: with SMTP id z22mr28260086otm.47.1620831513268;
        Wed, 12 May 2021 07:58:33 -0700 (PDT)
Date: Wed, 12 May 2021 08:58:31 -0600
From: Connor Davis <connojdavis@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] xen: Export dbgp functions when CONFIG_XEN_DOM0 is
 enabled
Message-ID: <20210512145831.gxmmlimkmnnb6zyc@ceres>
References: <cover.1620776161.git.connojdavis@gmail.com>
 <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
 <0c1d6722-138f-62e7-03b3-a644e36d20a5@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c1d6722-138f-62e7-03b3-a644e36d20a5@oracle.com>

On May 12, 21, Boris Ostrovsky wrote:
>
> On 5/11/21 8:18 PM, Connor Davis wrote:
> > Export xen_dbgp_reset_prep and xen_dbgp_external_startup
> > when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
> > even if CONFIG_EARLY_PRINK_DBGP is defined.
> >
> > Signed-off-by: Connor Davis <connojdavis@gmail.com>
> > ---
> >  drivers/xen/dbgp.c | 2 +-
>
>
> Unrelated to your patch but since you are fixing things around that file --- should we return -EPERM in xen_dbgp_op() when !xen_initial_domain()?

Yeah looks like it. That would make patch 3 simpler too.
Do you want me to add a patch that fixes that up?

>
> -boris
>

Thanks,
Connor

