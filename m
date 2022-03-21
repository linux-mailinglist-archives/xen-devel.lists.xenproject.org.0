Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480584E2694
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 13:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292976.497587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHCa-0004Ry-N4; Mon, 21 Mar 2022 12:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292976.497587; Mon, 21 Mar 2022 12:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWHCa-0004PO-Iy; Mon, 21 Mar 2022 12:32:00 +0000
Received: by outflank-mailman (input) for mailman id 292976;
 Mon, 21 Mar 2022 12:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBI2=UA=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1nWHCY-0004PD-Du
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 12:31:58 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id e4e238bc-a912-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 13:31:56 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id v4so12902615pjh.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Mar 2022 05:31:56 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bf861ef154sm21485472pjb.55.2022.03.21.05.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 05:31:54 -0700 (PDT)
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
X-Inumbo-ID: e4e238bc-a912-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=puzh/4zgw5qsrOsU7JEwzpl2qiVxo2BGWuYm1B1pvJc=;
        b=FOkQE8b15ofFRmlKdr6pjDgjDhJz4PC38Py9SSNAu0nnkM47LTPU8wiIAj/jZ4OKM7
         qh7E0Sn2BbEx2zoZw1/Ji/fpAJnOrxQqKX5aIm6XHCLFBWzF/Ld2G7WhPE6AV2au0Hpz
         GwCCUqr1xUsUnyWm/q2STFAefL61fCIptPeQNbVYXE3Z/7dAzjxe04cqvgDuAQzMSp1S
         opIRB4V2nroDDj+fogAtRn52dnJM56gyezVmeghr8U8l4eTFZdnL5UyQBeT1cXufm+FY
         oW0/NpLBpkEUpVc3ZKScnspxuMz+twZ9ZV/HvGJZmJ837fe7JhZm63EJEDtcIFNL1oql
         Hoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=puzh/4zgw5qsrOsU7JEwzpl2qiVxo2BGWuYm1B1pvJc=;
        b=g7HHlcjgTAitY4we5Kj0w1oPeK9SetOp8ZDRT3VAgutSYLc57jsjTm6pqHPUhVIzqr
         oHSNaBVrR1N/EU3tVkFSWYOCng261BxVF3Ef6J29iWb8mMHJvAfBMiZQ4h3QYcysSSuo
         1fj4D4UhyA0XB+uj94YBBQEK7k4ILibtGaI3y1fEuB8SCHCNKe5vFNhxC5LaPe5HGnum
         AaLLJzkGb9ib3V5LxW7c0YGReU4mcXID5TU+s36fVAJvmjPLhoWmluozSAqOA05XEtR1
         BBNFbosIHnYnFoqg3kK9kOvfsSmJljxPYxLbh6tuXhoZNAUwcXy4Zjx4b9HKtPvUzISI
         MKQg==
X-Gm-Message-State: AOAM530rE9E4ySBtUMLW9eSx0sZ868rLUum75SPA4V46OewnT3nlhUWT
	JN3gyZtu+cov3/zZ16aQ9zeJgQ==
X-Google-Smtp-Source: ABdhPJwf6l5qKXE4WAgPzo68qMtDZFuJ6rGv+5jCaoBU8zk9mNef60xf59zruIe/sIvbJXO9IoxxSg==
X-Received: by 2002:a17:902:f209:b0:154:3b94:e2f6 with SMTP id m9-20020a170902f20900b001543b94e2f6mr9225257plc.93.1647865914885;
        Mon, 21 Mar 2022 05:31:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, Roger Pau Monné <roger.pau@citrix.com>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20220317234646.78158-1-colin.i.king@gmail.com>
References: <20220317234646.78158-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] xen-blkback: remove redundant assignment to variable i
Message-Id: <164786591377.5770.820740111597207436.b4-ty@kernel.dk>
Date: Mon, 21 Mar 2022 06:31:53 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Mar 2022 23:46:46 +0000, Colin Ian King wrote:
> Variable i is being assigned a value that is never read, it is being
> re-assigned later in a for-loop. The assignment is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/block/xen-blkback/blkback.c:934:14: warning: Although the value
> stored to 'i' is used in the enclosing expression, the value is never
> actually read from 'i' [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] xen-blkback: remove redundant assignment to variable i
      commit: 93b4e74789dbdefcffc7baac107069e74d98513c

Best regards,
-- 
Jens Axboe



