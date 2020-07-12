Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86721C710
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2020 05:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juSiC-0001nL-1E; Sun, 12 Jul 2020 03:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQ2C=AX=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1juSiA-0001nG-9D
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 03:31:30 +0000
X-Inumbo-ID: 2c6f78dc-c3f0-11ea-bb8b-bc764e2007e4
Received: from mail-pj1-x1043.google.com (unknown [2607:f8b0:4864:20::1043])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c6f78dc-c3f0-11ea-bb8b-bc764e2007e4;
 Sun, 12 Jul 2020 03:31:29 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id o22so4549344pjw.2
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 20:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SNT1YRB7yGxFXAfJITtoOOG8C2EkzXWjMU3CGAepd0k=;
 b=k+ZQrb716nrHemLK6iqV7smPv77pw/GKXxXxuVENsQJXTAuf3uFvj6HLP5Quch18uy
 2ZsN4C/E23HahZ6bww+zVyRTrm+hKZ6ZNucZLA/dlPSfZ2SADETxSGM6oC3nuTKG7/rA
 MPuJMVXIEMOpAartu7zdD9dWKLGtHyr0Rif/zDUJjMQ0CSFmJgbgIA6Sf4Tpr+iIAk4g
 9w8rfln7yKkZedfZwbJo4pyRdAlTAOZ245dMl7LOJP3oLxse0hgi4Y+Edkabn2FFoQkx
 E33hXyDjxtFVKVPik4ao3wtz5nj9wKv0i5lEYAkCFT7nviQmF3KpJGm9EnrZJTbPPxgu
 gr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SNT1YRB7yGxFXAfJITtoOOG8C2EkzXWjMU3CGAepd0k=;
 b=Cbll2OKLl1Y6sOljuMsRkwS4mfG82oaRmYkt+WJsH5+HIqJRf2uVDbYsWmeUsIWTML
 ZReQnIoS1gXeyH5K0XWnKLBdkg+3Od4r/hRw7/q6Y4xHONuKdYZBP0IRRMgEo8HRQ+DH
 cgoBt7CdbwttveDnetBA+uxWGoJ64S8gPqv/oLKjYRQyOZrIlOZeAyxYOVfBT9N2+oEZ
 5WpmD6ZdkK2r1l6JMleNOYkGpoK5rVzjNc5UN0oWttrodK8a0LfqPAiO5PhnPaTif90h
 4jCyflgo/78KoZv+ZL6m+fAMaBak5OcSlC9H+eQGSBikrGBtV3D5Crr3fOgaTQEAMvQb
 0yRw==
X-Gm-Message-State: AOAM531HnVO9vW+F6NCwtZ75xfs2Lv3WXbblO738eykbC3wf+AyVJk8q
 uBH/J2kJNdFCOnZwQPKNuSE=
X-Google-Smtp-Source: ABdhPJx3aQQO00Kcd3gxYPg+782A3wemaoqS7dDv8UmKUj3KOWgupYZB5ltmp2SDc0bqfCs5Nc4XNQ==
X-Received: by 2002:a17:902:8348:: with SMTP id
 z8mr47938844pln.113.1594524688860; 
 Sat, 11 Jul 2020 20:31:28 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.224.89])
 by smtp.gmail.com with ESMTPSA id s89sm9750271pjj.28.2020.07.11.20.31.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Jul 2020 20:31:27 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v3 0/3] Few bug fixes and Convert to pin_user_pages*()
Date: Sun, 12 Jul 2020 09:09:52 +0530
Message-Id: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <xadimgnik@gmail.com>,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series contains few clean up, minor bug fixes and
Convert get_user_pages() to pin_user_pages().

I'm compile tested this, but unable to run-time test,
so any testing help is much appriciated.

v2:
        Addressed few review comments and compile issue.
        Patch[1/2] from v1 split into 2 in v2.
v3:
	Address review comment. Add review tag.

Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>

Souptick Joarder (3):
  xen/privcmd: Corrected error handling path
  xen/privcmd: Mark pages as dirty
  xen/privcmd: Convert get_user_pages*() to pin_user_pages*()

 drivers/xen/privcmd.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

-- 
1.9.1


