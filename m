Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABEA4FA26
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902023.1309989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl7l-0003gA-AI; Wed, 05 Mar 2025 09:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902023.1309989; Wed, 05 Mar 2025 09:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl7l-0003eh-6r; Wed, 05 Mar 2025 09:33:09 +0000
Received: by outflank-mailman (input) for mailman id 902023;
 Wed, 05 Mar 2025 09:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknY-0006ev-Tb
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:16 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeacb515-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:16 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so700294e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:16 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:14 -0800 (PST)
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
X-Inumbo-ID: eeacb515-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165935; x=1741770735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fom5vYEavsJUJ3+dko1FMXQbvv5VOQe0FeS8qUTVCQo=;
        b=Sh52NujH+4bjdTb63VZmE/JZDhbR/oRl/O2m8n+bQDsstB99BdEuw7xygxVWw+QIyT
         /Y7RnRWdCOsM5mOBhX03rCaLpaHUhUghBrMyzBwUZ+nrlVlV3Qkm5nNkEZa08iCO6WA8
         p42FhxDmgmf4HqrXq2EGwD2929S5U5umBnD1LCjhBvNtV9eMnsD62srSpgLYoIc1x51q
         oAOvGYOuHcHwiHp4PyqLUd690GngvnuNQ/iUAlHYwqg7nRca3r2BH7NPggc38IS2lTrd
         drIIw2P1Jc4kH6zgDZmq1gIqvyEbr0eDsDa9P3kWwOKUe6/WQoxMGEcRwfvrlxW2adC/
         zGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165935; x=1741770735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fom5vYEavsJUJ3+dko1FMXQbvv5VOQe0FeS8qUTVCQo=;
        b=IrahyQJ7zUDhgfYGDoKa87wiLGAiiO3UCkDzkRKTMQAehqeOr+Es7dRxwVWGA4hBeQ
         bZuunBL0MDWkgxvKmi1FFE/h4Yc8FPYX/WWPvITF70Z+nCuVYVMF3E0z9+1gtmgXa5UI
         bqaedsbPc/SN4ahhMqdVZNHJ9mwB9ShjD92YTeNvppIMu210QKQxEbeqOv11MQEzFTp3
         2W3Hy09gZOOYIYiVKBqhAqMLXxx3CQYUx/km1Nl1sbkNGPGFq9F806tVffsI1NJD+lVD
         CP4w45HFw265E9hlAgARe/BfK0gGWciM05BSMqW590ZtNxdx1KBEUmI8V+jpaXuim7W3
         QWtA==
X-Gm-Message-State: AOJu0YywYyskwB/39Ul/Ub3R39MB3ALxamgkY9xh1BR8KvGa7tdpzR1B
	WtR2myWDVoV6glG/q9ys7a8Ybffk0ZhaTzw9KtQ0ux/xuo8JvcuXpA5URwKG
X-Gm-Gg: ASbGncsVsikaq7BwB5SfpbgGH7DyF2PDXhSBk7m4FbOrPF4BVmfqjvId95Rebkfd1Ak
	qja9PywQEZYgUs3y+/d4QFUiUCmPHwunnvyvxP96YgVLlwyGU3zoG6wZqLY0Uxv5XeEebQsBHAd
	gnkuDvxEUHKoXwFOJbNm60TLkZasgALha1aTmI20UXC3mh4+AQJtLIENKpdMElTp82J03AjM7cD
	/wHeGpPsukvbdw7oP6j435p+W4CVwMoEOnkqBwZSh4LJLnkzHFG/NVKdmCJFnjezUf/xuudrqk6
	OlMwTM0odNTCjaCbKyLor9QJ9CRN9RJ4JF5U1POH9MEqz4Wr0Q==
X-Google-Smtp-Source: AGHT+IFAc1Ams7sn+LNQEkTshCCOTQ5utdGiE0jtEvDhHC+tA+0o0e0N8ab613j4dEdZ1eOz5OZaUQ==
X-Received: by 2002:a05:6512:31ca:b0:549:5769:6af6 with SMTP id 2adb3069b0e04-5497d36bb41mr847018e87.9.1741165934816;
        Wed, 05 Mar 2025 01:12:14 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 16/16] CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64
Date: Wed,  5 Mar 2025 11:11:24 +0200
Message-ID: <9706307f5349238240704c5edf2e708a5d93ddf5.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 04c21d5bce..489404fc8b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - On Arm:
+   - Support for suspend/resume to/from RAM on arm64
 
 ### Added
 
-- 
2.43.0


