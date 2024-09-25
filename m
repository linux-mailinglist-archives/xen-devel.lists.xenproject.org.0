Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F9985723
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803818.1214636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPFY-000706-I9; Wed, 25 Sep 2024 10:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803818.1214636; Wed, 25 Sep 2024 10:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPFY-0006xc-FN; Wed, 25 Sep 2024 10:28:00 +0000
Received: by outflank-mailman (input) for mailman id 803818;
 Wed, 25 Sep 2024 10:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stPFX-0006xW-KB
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:27:59 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51eb886-7b28-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 12:27:57 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so6782914e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:27:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf495fdesm1711409a12.25.2024.09.25.03.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 03:27:56 -0700 (PDT)
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
X-Inumbo-ID: d51eb886-7b28-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727260077; x=1727864877; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2vgx5O4dNCBWc/PKLODoQHgWJ9fCbDM5mrne2sl771k=;
        b=LCsXvW0FPFNTSJx1fX4zMFnC3QAnQuWSwa75GPW6KKlRAJSP24gO/sdwpjS1TBffI4
         PB2PyOUvu5EQ24z57hFg0WnVxqCH7mbCeJuYRvGbFO5BYOsKOXCMef1YWgob8Z0YA+GR
         LGLReN4vxvR8Hjto3AWqNzekBI9JQ1lI9Xuak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727260077; x=1727864877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vgx5O4dNCBWc/PKLODoQHgWJ9fCbDM5mrne2sl771k=;
        b=E2js12/VNurLtE85dLFjgaoojX4MZGU4oZSo9vQ821KzoG6/BcrpakGIoqi77nwgrE
         mdkOzXkiDlsR/RntSBDAON13vw6vVBvsiAXxzE0gSQegtx2a6/sX6nZdT6aGRNSjTilK
         D/IuSFisssN4Jl9k/breEQWOXueF7ASRhYTqWXIcDjD59ZhRkzVrUu53/Fo7QcxfX2s8
         B5csMeMXW+OgjvNFISAFnIqBAOM1sMoKPsxpGoiowz4/9PMfiRwEsUmNcCuVqulCJT9S
         Fo1I7u5uOJGDOXqOwzKVN//FDFQEZZtH6BbVTMx9JDN5PUSHwDufuImGJ1CEgsxz4l6v
         A3kQ==
X-Gm-Message-State: AOJu0YyEPH97zYLk4MfX99uLd77v7eLkvEYrC6WUugRNkLFFSCERaiUc
	So6suonCGYIaFW35OI2UzP0I2oXTPByOSFTal3wThqSsn4s+tyzT1L29DqsRO7w=
X-Google-Smtp-Source: AGHT+IGmiq8hdYEnVgCg7YxwIws5gBXa/kay/IkTjZremATuZN6/3VdsV0JKD72TXo6V0P2EyijkmQ==
X-Received: by 2002:a05:6512:33d2:b0:52c:e1cd:39be with SMTP id 2adb3069b0e04-5387048a6f8mr1413552e87.8.1727260077056;
        Wed, 25 Sep 2024 03:27:57 -0700 (PDT)
Date: Wed, 25 Sep 2024 12:27:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
Message-ID: <ZvPlq0pb6QIGr6lj@macbook.local>
References: <20240912132347.28756-1-roger.pau@citrix.com>
 <ac1317a18ddc993a5fc926a8d25feb39c5349662.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac1317a18ddc993a5fc926a8d25feb39c5349662.camel@gmail.com>

On Fri, Sep 13, 2024 at 04:19:32PM +0200, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-09-12 at 15:23 +0200, Roger Pau Monne wrote:
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> LGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Hello Oleksii,

Could you formalize the tag into either a Reviewed-by or an Acked-by
so the patch can be committed?

Thanks, Roger.

