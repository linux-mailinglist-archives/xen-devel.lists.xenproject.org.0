Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6468B5C37
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714128.1115184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUs-00077z-1R; Mon, 29 Apr 2024 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714128.1115184; Mon, 29 Apr 2024 15:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUr-00075D-TM; Mon, 29 Apr 2024 15:00:49 +0000
Received: by outflank-mailman (input) for mailman id 714128;
 Mon, 29 Apr 2024 15:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUp-0006Ve-OF
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:47 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41a33aa5-0639-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:00:46 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-79100a90868so29299685a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:46 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 sq18-20020a05620a4ad200b0078d5f7b9a2dsm10320819qkn.15.2024.04.29.08.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:44 -0700 (PDT)
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
X-Inumbo-ID: 41a33aa5-0639-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402845; x=1715007645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeOl9O7LDZ2iZGM+JQTgtPA8a4JFNTC4N89WNpXHObE=;
        b=AbX4Z1ySumGuZa8+qCmNrsXjCpHAlnA1/CDpcPoOjauCw+5v7kyIV52gXIfPHGfw9O
         ojMIAyZasCHDzKf/QwjlXILlRgXSONSlf6g9EmmmUUpj00qiwcpWRFLUAkHjzzE2w5j+
         PS5ACDHCoyZ04aD5Lkcuyg432mosTkTwkLgKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402845; x=1715007645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeOl9O7LDZ2iZGM+JQTgtPA8a4JFNTC4N89WNpXHObE=;
        b=UUYHOcYT6SR2J4mAazNsJW0z9IN8OYt3fD5ZUn/v7Ei1dpDNZp+TtkbwdO+bqlkdeY
         +CfHkYNVnFAAk0l0dQrXoyOirJ/F/69LSkUaP38HuYclhi2cm8WRdv7Y5LkgItOmA651
         f0imXalOvMXWw4FX92Chv43/RMAnE8YeLXGSD50M/zxlAFzDI7YcdGPBVMpNnevmDU/k
         S6ldTgB8sxOCqUDAtFJAUZDnawRpL7Q1j2NyYU4Dw9BMnIxbRcC1nNEEzyK16tx10xUX
         MDQSEZyn22hj91QJbDWb9enjPOUVMMITyq1qKIMoAOonOSCjOXksxC51lbuymuT4Vn0e
         awsQ==
X-Gm-Message-State: AOJu0YzTivCrEpapfnUZEjHszPX1y71lvFvrrQxGu3e1AWopAi85VaC+
	zlaSAZJzUF/wcMsGusOtCU1mmnlKdoftCz2fiuJZVNb6D0CCvm3Wni8CcRpsXqDjWgugU2ooBH8
	w
X-Google-Smtp-Source: AGHT+IEQTaracmximP7j2sbFjK4X6UAk8BGjawiXJbZvQU35r2lCSidN0qLlCOK94Lpv7HSFuOQ2FA==
X-Received: by 2002:a05:620a:414b:b0:790:c677:545d with SMTP id k11-20020a05620a414b00b00790c677545dmr8130046qko.68.1714402844493;
        Mon, 29 Apr 2024 08:00:44 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 4/9] create-diff-object: document kpatch_regenerate_special_section() behavior
Date: Mon, 29 Apr 2024 16:56:49 +0200
Message-ID: <20240429145654.71669-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The purpose of kpatch_regenerate_special_section() is fairly opaque without
spending a good amount of time and having quite a lot of knowledge about what
the special sections contains.

Introduce some comments in order to give context and describe the expected
functionality.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index d8a2afbf2774..6a751bf3b789 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1210,6 +1210,12 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 
 	src_offset = 0;
 	dest_offset = 0;
+
+	/*
+	 * Special sections processed here are array objects, hence in order to
+	 * detect whether a special section needs processing attempt to get the
+	 * element size.  Returning a size of 0 means no processing required.
+	 */
 	group_size = special->group_size(kelf, src_offset);
 	if (group_size == 0) {
 		log_normal("Skipping regeneration of a special section: %s\n",
@@ -1246,6 +1252,33 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 		if (src_offset + group_size > sec->base->sh.sh_size)
 			group_size = sec->base->sh.sh_size - src_offset;
 
+		/*
+		 * Special sections handled perform a bunch of different tasks,
+		 * but they all have something in common: they are array like
+		 * sections that reference functions in the object file being
+		 * processed.
+		 *
+		 * .bug_frames.* relocations reference the symbol (plus offset)
+		 * where the exception is triggered from.
+		 *
+		 * .altinstructions relocations contain references to
+		 * coordinates where the alternatives are to be applied, plus
+		 * coordinates that point to the replacement code in
+		 * .altinstr_replacement.
+		 *
+		 * .ex_table relocations contain references to the coordinates
+		 * where the fixup code should be executed, plus relocation
+		 * coordinates that point to the text code to execte living in
+		 * the .fixup section.
+		 *
+		 * .livepatch.hooks.* relocations point to the hook
+		 * functions.
+		 *
+		 * Such dependencies allow to make a decision on whether an
+		 * element in the array needs including in the livepatch: if
+		 * the symbol pointed by the relocation is new or has changed
+		 * the array element needs including.
+		 */
 		include = should_keep_rela_group(sec, src_offset, group_size);
 
 		if (!include)
-- 
2.44.0


