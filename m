Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF479C0591
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 13:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831767.1247151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vw-0003rK-9l; Thu, 07 Nov 2024 12:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831767.1247151; Thu, 07 Nov 2024 12:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vw-0003lK-2G; Thu, 07 Nov 2024 12:21:28 +0000
Received: by outflank-mailman (input) for mailman id 831767;
 Thu, 07 Nov 2024 12:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t91Vu-0003Uj-Im
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 12:21:26 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc3f5e0b-9d02-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 13:21:21 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso6771021fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 04:21:21 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5c91esm727688a12.4.2024.11.07.04.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 04:21:19 -0800 (PST)
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
X-Inumbo-ID: cc3f5e0b-9d02-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNjM2Y1ZTBiLTlkMDItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTgyMDgxLjUxMzQxNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730982080; x=1731586880; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6icg0MDABYZdPdC+khSj3SMrU2+HHDUysXP9VMvz7c=;
        b=B1tnZwxwSkrVNBXZ0/QT9vsav5YiFQynpJbZ+ce1jCAXIX5Mw0T7kLIYwNxz2hCk05
         QHEKhhSCzuVs1MHGaJ0JPGoyNeZidRNn85u+tVVEvaonFJziN39d4tCxUt/kXiXMf5Q4
         YaViCSkxYccDaWqYqcEhudorQNE56sOfS+HIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982080; x=1731586880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6icg0MDABYZdPdC+khSj3SMrU2+HHDUysXP9VMvz7c=;
        b=ka5uWmZQ9YiAcTKdpIu37npdfIXHzyFyrLXwymMngbTUULRtWEbSOFCoTHCsYqXNQ+
         aiZSyBRxNj7cnMhB7z3/pu7Ngf4LwrT93CXrkY96Asyt4Qy7ZkOzvqwN7LgZMnhUfgMC
         iYIZI1c9G5awqVLvzOl/0zHM8XvF+o234tXVfU4CONzRW+IvjvNFeZkX+j0OhEakLESX
         3NPDAZoObxkVM83mGs0h3gvcyvBnQAtAyEgQpJr2AL0q9NpbKqIIi9QYbdZ1CpKi3x5l
         rhcK6y+cqo2CbxQL4iRmAEYNw8greLByztvRIe2jvJLeuTKSQtzuVS08jiTmeGF5MSD1
         hyUA==
X-Gm-Message-State: AOJu0YxN8xZr4wpwGSKIhMSc7Th68IrS+v+BRIgvyJBV1WB/Rl281vrn
	B1JGcd2Y/NkRTTdZPbtjTvcjKy+zjcXpkErGQ5Hckbg5vQkm7AS95eQ4f4NQ8sXYzXQYz3IIFqz
	t
X-Google-Smtp-Source: AGHT+IHEOuxakUltTPR5M8DyWdGV5G+DRIwkS6sk9SZ7dvFKfp1UcxaXz7POtUpsjbZl7VacB+ixAA==
X-Received: by 2002:a05:651c:1515:b0:2fb:5035:a03 with SMTP id 38308e7fff4ca-2ff1a8ff558mr9122361fa.14.1730982080140;
        Thu, 07 Nov 2024 04:21:20 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/ucode: Simplify/fix loading paths further
Date: Thu,  7 Nov 2024 12:21:14 +0000
Message-Id: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

collect_cpu_info() is fairly expensive and called excessively.  Rationalise
this substantially.

Except I found yet another bug when testing this.  Notes in patch 3.

Andrew Cooper (3):
  x86/ucode: Don't use microcode_update_cpu() in early_microcode_load()
  x86/ucode: Fold microcode_update_cpu() and fix error handling
  x86/ucode: Remove the collect_cpu_info() call from parse_blob()

 xen/arch/x86/cpu/microcode/core.c | 53 +++++++++----------------------
 1 file changed, 15 insertions(+), 38 deletions(-)

-- 
2.39.5


