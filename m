Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B415DA14146
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873683.1284723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU38-0000K6-F6; Thu, 16 Jan 2025 17:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873683.1284723; Thu, 16 Jan 2025 17:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU38-0000Et-AW; Thu, 16 Jan 2025 17:52:58 +0000
Received: by outflank-mailman (input) for mailman id 873683;
 Thu, 16 Jan 2025 17:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU36-0007CP-KW
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b74e02b7-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:56 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so2189107a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f224e0sm26235766b.112.2025.01.16.09.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:54 -0800 (PST)
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
X-Inumbo-ID: b74e02b7-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049975; x=1737654775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXVxPmSkdh6kTkitg7Sn1/R1oEUNu+Kk247t0METCbc=;
        b=Uc7Ti+F3lmBlCvE7EC2B6zQyMxGzLjfvlab3jVvOE1frB7JUn1kWhC6PxGkFDUKHDg
         0nbLYwRjEnJdtw12z2glQLYVy5vTVfvK+3g/WIfCGd6Ab87d7IYnz9RL2OBKBPVoCd7m
         H4xie7EIh7MnrVoQ03oLEJsb6TeFly8hoO57M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049975; x=1737654775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXVxPmSkdh6kTkitg7Sn1/R1oEUNu+Kk247t0METCbc=;
        b=Ndp855aArMaV0u/S0kdQntWR6mkDDoYGnhGWcBiUp8EgbZr5TB4ncYx5Je29Cxx9+B
         UGoM6ybifsKcO/q09FpG0XiIyQE+bGRPJHVhnVkV9qcYXxPJUpXPpNNGYcWH2PusYPGJ
         NqHVGJYv1d6O6QBtaQCVuFB9Vg5hGYcrYy8C30vO4Ub/xqF4WZoxNkH2ru18il8W+vhE
         5WmXkyFrPSfrOwEsQEu6QT0b4N4fsz2LfixQtyYcI/Ca00myvRpgs8lfrJp6gU+oApUZ
         yVX7xyi3EoLx7WDi4huNP6RyfQp5bzBv4mVPi83OwTidN49sdruA+0G1tcUwGMSnYcLG
         pF4Q==
X-Gm-Message-State: AOJu0Yz9EbwjAFcq1h7L/50/AQ8n5ZKD5H8DqM+8sHnu6BbzH1Rt1CSx
	Lk0J6JxCIlIPsBpD8qZ+EEk3L4pT4TQvaeEAkh2diLITHypiX7tGZky8yjELkWVGtCFmxbt6jXe
	O
X-Gm-Gg: ASbGnctyN06UcnGqHK8Oh0sMTPBZxbmsCOspNTDlcSGZheJUhnzDkMABGFISnazOc2v
	vP6ezJnXd99nL1AbFhGO/2JUR+SQIOBuc6Am4qkeJwa/asN+VdN25nkq8G9GvCUJyfaWMw5De1g
	0/ELNidHXxrBio027NzWXwh5W5FvtuItng4nq+cQ/kxZSYQgOzDswrgp5Ucz+TyUTjgGBkjRe8B
	VG56YnVifMW2cmIu7wzpywflinhYvSaqNJ0/1ANMIzC/Wtbpv/Ch0N8gOVRAw==
X-Google-Smtp-Source: AGHT+IFdZIe4URc/r5aMLDRcUwmFjsTbWtOQeBFa9lkuRgU01Wen7f7gO9nWpmnH3qTK+bjccegIkA==
X-Received: by 2002:a17:907:72d0:b0:aa6:5eae:7ed8 with SMTP id a640c23a62f3a-ab2ab66cea6mr3122115866b.6.1737049975319;
        Thu, 16 Jan 2025 09:52:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/7] create-diff-object: propagate ignore.functions to children
Date: Thu, 16 Jan 2025 18:52:13 +0100
Message-ID: <20250116175214.83742-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

Add child symbols to .kpatch.ignore.functions in case their parents are
added to the list.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index 3189d3e8451c..6060a73555ed 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -936,6 +936,10 @@ static void kpatch_mark_ignored_functions_same(struct kpatch_elf *kelf)
 			log_normal("NOTICE: no change detected in function %s, unnecessary KPATCH_IGNORE_FUNCTION()?\n", rela->sym->name);
 		rela->sym->status = SAME;
 		rela->sym->sec->status = SAME;
+
+		if (rela->sym->child)
+			rela->sym->child->status = SAME;
+
 		if (rela->sym->sec->secsym)
 			rela->sym->sec->secsym->status = SAME;
 		if (rela->sym->sec->rela)
-- 
2.46.0


