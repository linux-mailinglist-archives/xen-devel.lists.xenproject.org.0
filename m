Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B54E2693
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 13:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292977.497593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHCa-0004WX-VS; Mon, 21 Mar 2022 12:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292977.497593; Mon, 21 Mar 2022 12:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHCa-0004S9-Qb; Mon, 21 Mar 2022 12:32:00 +0000
Received: by outflank-mailman (input) for mailman id 292977;
 Mon, 21 Mar 2022 12:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBI2=UA=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1nWHCZ-0004PD-GJ
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 12:31:59 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63b9d2f-a912-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 13:31:58 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id p5so9175446pfo.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Mar 2022 05:31:58 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm5277920pfw.144.2022.03.21.05.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 05:31:56 -0700 (PDT)
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
X-Inumbo-ID: e63b9d2f-a912-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=Lux+Oce5954ZCR4SaazZ6s8iSwpkGBWeDb8gTfwBZqM=;
        b=VrY4yTDBoUuWUPRu7aAjBfZBak2f/Vf5gOla5mUSXo8iqCal7uXrULn3rX5d+D2eqK
         MFMAh1iO1clvFctmNChOz7kBBggbO0xgsjYcS59nhB7OG210nPjHe+FZ9BYkN8lfwvuQ
         q4T162hV9jUxUzkjRdxKZ9orkKEC+J/BinC4wuDSjMApJarYj96Vg9omJdBG/2ptTgMk
         mX5YH2Fa3yF5ePKcqiS9uD2wFF+OhdfbXWGoTp04bTy8GUHOqq1QFtfFPYVJOgRDsELa
         utUXMG1apjvDJU7Z9Vlhkp0fsM4L83eAiC3r2/Hg88DU7cXjuRZbOJVhMvCN+8vRONfn
         9qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=Lux+Oce5954ZCR4SaazZ6s8iSwpkGBWeDb8gTfwBZqM=;
        b=l929rtpo7XPtVL5uBpTEBNYH5KhgACPFWPkW8JSwAzLr0xsmHAVe72SXx1+jqJrCut
         bNcmgHQVjNGDqh1NicABE9aoBVGybLIUNl1vCbkI76zQ9Ux1ZubEC+7+W+pL9hwls586
         OqqAyXIc9321vs7WN/wm/Oe7o7YU6TnhPkuYeS5TjLtUlgGlr0yh9BDrs7dD0Nkp2BdG
         XDAIKhLvxhsTgkWZf/WhQKwqWg5e0EdRzCTH5KxM1ydyOV/NY7f9IWXeaqf+AY8Pp3in
         mSFYOAne9LzE6cw3LqO+e05NFkpZhDf0+zDcIieDwLa47ViKSn5rliu8C7XWqk0shKnn
         S8Yw==
X-Gm-Message-State: AOAM532qWd0TC/UZi8hTPTwzKSiAhGmJKZbJvpgHivSxp3tmabrLYwUq
	jfifTFOWmVGGGm8+YnhfivTueA==
X-Google-Smtp-Source: ABdhPJyHp8/6kKFBxi4tI0DjZuF7CfbyQs3okZ47Jb114AtRRldFRxb2PaEGX7OOzdRY5sldVEnNuA==
X-Received: by 2002:aa7:8896:0:b0:4f7:b8f7:772e with SMTP id z22-20020aa78896000000b004f7b8f7772emr23053440pfe.62.1647865917359;
        Mon, 21 Mar 2022 05:31:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, roger.pau@citrix.com, linux-kernel@vger.kernel.org, jgross@suse.com, sstabellini@kernel.org
In-Reply-To: <20220317220930.5698-1-dongli.zhang@oracle.com>
References: <20220317220930.5698-1-dongli.zhang@oracle.com>
Subject: Re: [PATCH 1/1] xen/blkfront: fix comment for need_copy
Message-Id: <164786591631.5804.10829961862244970151.b4-ty@kernel.dk>
Date: Mon, 21 Mar 2022 06:31:56 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Mar 2022 15:09:30 -0700, Dongli Zhang wrote:
> The 'need_copy' is set when rq_data_dir(req) returns WRITE, in order to
> copy the written data to persistent page.
> 
> ".need_copy = rq_data_dir(req) && info->feature_persistent,"
> 
> 

Applied, thanks!

[1/1] xen/blkfront: fix comment for need_copy
      commit: 08719dd9176b4c55f547bd11812fd6cc35907d37

Best regards,
-- 
Jens Axboe



