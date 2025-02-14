Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E6CA3618D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 16:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888902.1298171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixYP-0002B9-S5; Fri, 14 Feb 2025 15:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888902.1298171; Fri, 14 Feb 2025 15:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixYP-000291-PF; Fri, 14 Feb 2025 15:24:33 +0000
Received: by outflank-mailman (input) for mailman id 888902;
 Fri, 14 Feb 2025 15:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCm0=VF=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tixYO-00028r-HL
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 15:24:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97f41b9-eae7-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 16:24:31 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dea50ee572so3194706a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 07:24:31 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287c7fsm3040608a12.70.2025.02.14.07.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:24:29 -0800 (PST)
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
X-Inumbo-ID: c97f41b9-eae7-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739546670; x=1740151470; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNwE+MXrbYnHX1M0UF/hDhWfaK5IdNPhf7en/DEkygU=;
        b=dWC9TaLWBWwPQM/SPmOWDOde8HvgggGXqHol/0E9oQX/4sQDRs9gaRK4B33gAvEEGM
         mFp36vsWPPN8OQppxABsxus1TFqmHmSnZW+LDB1cX3yGELB6i/JlNfgwry1uc76jxbE+
         NnymQimx4rJ6edzIbz4I+64Rq5CyIL3gz6n7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546670; x=1740151470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNwE+MXrbYnHX1M0UF/hDhWfaK5IdNPhf7en/DEkygU=;
        b=snC4uNeY6uPbqbGoJeWC1q6i/pgdPnieidWucFqiVxFuTKZfVsKebJ6Vwsk4McrULi
         ddb5v02Dv1BtwDfS2e8xEp/KfmhIFBIa9N5m7ZjQh5wBkeC7XEP7//DQEYXHVKNrfitL
         hFEss77te7Phe1+ZGVgP2znB1wqVwn1o/MS8wyMiIR3XAxrymYS84vy+e1KT/Q/FpeIh
         54dLrg8I5XiuogO3HPx1Fbue4DyWX5egsyKICgoEVL5z9nqSZRoxrqJmvBf2zKWFVzt+
         cF5Qc8VsAB7N7+94cKSKGCPBjEDNLnOkb2eDYu4ytMx6qT0qDDcOOBDScpNX/VtMjldp
         NrrQ==
X-Gm-Message-State: AOJu0Yy0UyUCHZrDiFFhKjgFsPoVacbwB7Isi15vSOgZ43WKhT6LTIlk
	GJO+yXqA9/9iZhkNBqZDgn9uHMGWG4NF/Z1B5JGCo0ysLq0tsx0v9hDfY5jlHRe00UOCh5Ag+H/
	1
X-Gm-Gg: ASbGncvXm1wjN3p496C7ma48lhWnvf0R/7gv5NooWbhaXQIrMRGX23Pys2LJba+DwWy
	76D+Y0bxJ+eIznSpvTPwxZ5pQ9qynY4cHzbDZzViu/4DVr9Gd3QJJIQZueoBVDY3Rbt7wTfao3Z
	iVPfgl6II5xEXlzpDd7M/orkMq2NoW9Qh+7KyLv5UknN+ye47Yzw8rV0ppe0VLo52g9yAVsKL2G
	B/uYnD7SumlTwecLzS9uL0x9765Sx7IM/Omcky1HeiPagEoS3Qcd6rezaMgfC2zV+UASa1nzmfi
	3A9HEoEoDpfRzgHG50YduzVDM25pyWWK6mLJ3ZUxmNxtsI9v3z0RgxzGCej3eGu/Oqaka7kd4qz
	XGEeMtoD0dt+WgvJ1n2Sk5A==
X-Google-Smtp-Source: AGHT+IHHPqCQaBc22OD/urr7J4OfBgcT2qQQe4NCt/a3AVCnwz34c9tAh2a/dkO/FV6l/66OC9KCdQ==
X-Received: by 2002:a05:6402:530d:b0:5de:cb8d:1c99 with SMTP id 4fb4d7f45d1cf-5decb8d1daemr5973813a12.20.1739546670337;
        Fri, 14 Feb 2025 07:24:30 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v2 0/1] Fix OCaml build warning
Date: Fri, 14 Feb 2025 15:24:26 +0000
Message-Id: <cover.1739546412.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Acked-by: Christian Lindig <christian.lindig@cloud.com>

Andrii Sultanov (1):
  tools/ocaml: Fix oxenstored build warning

 tools/ocaml/xenstored/Makefile     |  1 +
 tools/ocaml/xenstored/perms.ml     |  2 +-
 tools/ocaml/xenstored/poll.ml      |  2 +-
 tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
 tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
 tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
 6 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.39.5


