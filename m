Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020004D615F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 13:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289002.490259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeBo-0005mw-IY; Fri, 11 Mar 2022 12:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289002.490259; Fri, 11 Mar 2022 12:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeBo-0005kO-E5; Fri, 11 Mar 2022 12:16:12 +0000
Received: by outflank-mailman (input) for mailman id 289002;
 Fri, 11 Mar 2022 12:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eaTR=TW=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1nSeBm-0005kI-Ox
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 12:16:10 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 03a6c47a-a135-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 13:16:01 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id q13so7508545plk.12
 for <xen-devel@lists.xenproject.org>; Fri, 11 Mar 2022 04:16:01 -0800 (PST)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 oc3-20020a17090b1c0300b001bf8c88a8c4sm13322797pjb.35.2022.03.11.04.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 04:15:59 -0800 (PST)
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
X-Inumbo-ID: 03a6c47a-a135-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=8lgnycCyEA7OE7uRgpUg805RrcH5QY6fpQNIJm8bcKE=;
        b=p7dP/Bwcd8UH3YDqkYYYIAgwNyj9EfrcebjoF/yIrwWUByv8XfkmURMrk/WXYDJkWk
         Pu74We98LlV85ri8Auq24Zn7pgyxdBbgrogPWu281/71BuLPXcp+Z4ILMtHlvq7/Io+u
         41E4F7gtFeJi+ndakPTDFAqHBZOybi1Y8JwAobYmHTQ1KHaBxiqc/mUUrvSRSWWxblAD
         nZQ1cv95vvu/Sfa2Xiq7xodBpRxPAh2uF134wqRsJ9Kg3U/bVkup5bR6lGyjMrMbgGsh
         N6ui+ubJsCAYJ1zs950g4VRSpf4nXUWCBIJcpIRPavKaN3nOSvEwGAiu5ctbSEhaL+0M
         1X6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=8lgnycCyEA7OE7uRgpUg805RrcH5QY6fpQNIJm8bcKE=;
        b=I5a1w1gpcPg2i+lYITSQgQ3GIM96O5G8g6JaqxSGi6B1qtqt4FPgIquoj/mrkZ2a+v
         3eZ1A2sckpKthLFAmJWk8Keupcz0mnCo02Rz1QN8iX2zIwg4qY6/F2zjEaE3+W3DxYHS
         WOBkLkuEfdnu4FsGGmi7x+YmiDXGdqBuDluKMINDdk5hmcpjDgnO4jHXjY8XuA7YXvp7
         WB3M/xgZ7ye8y6epJDLdphgsZAhIzlLZY1DtRmJdXBulh/oa5PEcVVZgP2elQ4BFei00
         IaZrtEI4ScroageqmB1lB3Rs3Mj3WuMotrr//0Esx4ExNZmj+zD4/wrwyeHNTyejHNWf
         9LqA==
X-Gm-Message-State: AOAM530yYwrT6CKKDzAQmB6kNGb+AvV5bIkMdJuSSeN8Z7Mqv5v65ykx
	+KT8YIyZDULfJoCQjb5+CTPnfQ==
X-Google-Smtp-Source: ABdhPJwwolMs/D5abOMe+Vfv4rMCTXspDIr98osvzAsU/ODnym2pEqUZ8N0fVBx/9zqrpRkzL504VQ==
X-Received: by 2002:a17:90b:1b4f:b0:1c5:4dc9:61c with SMTP id nv15-20020a17090b1b4f00b001c54dc9061cmr520951pjb.161.1647000960096;
        Fri, 11 Mar 2022 04:16:00 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Roger Pau Monné <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20220311103527.12931-1-jgross@suse.com>
References: <20220311103527.12931-1-jgross@suse.com>
Subject: Re: [PATCH] xen/blkfront: speed up purge_persistent_grants()
Message-Id: <164700095873.9652.11436979852565493829.b4-ty@kernel.dk>
Date: Fri, 11 Mar 2022 05:15:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 11 Mar 2022 11:35:27 +0100, Juergen Gross wrote:
> purge_persistent_grants() is scanning the grants list for persistent
> grants being no longer in use by the backend. When having found such a
> grant, it will be set to "invalid" and pushed to the tail of the list.
> 
> Instead of pushing it directly to the end of the list, add it first to
> a temporary list, avoiding to scan those entries again in the main
> list traversal. After having finished the scan, append the temporary
> list to the grant list.
> 
> [...]

Applied, thanks!

[1/1] xen/blkfront: speed up purge_persistent_grants()
      commit: 85d9abcd7331566781b93ff46e4bccd4806ef2b2

Best regards,
-- 
Jens Axboe



