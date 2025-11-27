Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCBBC8F816
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174224.1499204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepE-0008DP-HC; Thu, 27 Nov 2025 16:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174224.1499204; Thu, 27 Nov 2025 16:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOepE-0008AG-Dm; Thu, 27 Nov 2025 16:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1174224;
 Thu, 27 Nov 2025 16:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOepC-0007N0-7M
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:26:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3538ed3-cbad-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 17:26:28 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7277324204so183424366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 08:26:28 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59e8936sm195126666b.48.2025.11.27.08.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:26:27 -0800 (PST)
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
X-Inumbo-ID: d3538ed3-cbad-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260788; x=1764865588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqtyeNwPXtVWZ/fMLA89rm72krJSKu8xZIn1Y/wA3U4=;
        b=BZx6ccXhaIQJ8LEeCsEFi2CvUU7k565AmjTTxKnCiGuzNS/TKJ2PUFLx9zSEnM8tAD
         6p47SxbFAwDbVqEAbUWn9hAn9jA64Pz+coE0rdE+GAHB7SyJ5dDdoOqYq9rwGyTVm7s3
         xbw3u6jfT7oiUwYNUcBTzF2kudmAsGOEcOKO//+doy7EIo0ykzZTMNARucHZBuxqLAqz
         27cCxB61njnFiTZGCx2PT9yFqFqfZntzJG6yKOESJw4EMaJBzJRpAItOXO001QsPL8Gx
         jnExtf1+lhG38L4PLaerJ63kPgr4GocP+hUo3O2FVsT+JvW82n2tY5E4W2kAQH3ZXxkx
         rU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260788; x=1764865588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqtyeNwPXtVWZ/fMLA89rm72krJSKu8xZIn1Y/wA3U4=;
        b=vrt4ihnKQXO0ztsTf0QhNPY3yISkLuMApUAGXH5gACc/qk1+Ao0B1H5WMcCXwEnBDb
         LfpbQuq17LarhOvNSlD9wOLnRL5/AVj8L1EYQ9lfRCTB5VjxSC91wnW+ZwoXewOvV55s
         djncy1KENZS2XkWYcxJ9MXJOAiOQcqGt+zZQ9taKKHzNAISIywlT+IoPwXzYQAslNyPL
         JB/iywM6e3Rb59OCgnuESaqfZ3zRmdeQE9dBx/bREgXUq0dbL4/T5U7fABlLEFiUhPDa
         yCQA7YCwJEi2MroXGFTXAHzsuEkWkKmj43nTQEQXJGQ/x+XEy8isDI7bEprxYawmUIPI
         LG8A==
X-Gm-Message-State: AOJu0Yx3TjThQ1qbQqOe+mHgXAcqOxziYvn26VjBRIQBAse+6MnmAiWc
	qxrgAz9QStXSbllm15d/WhBU/fm3sAlnrpBKcfV2HQ/rhCzWMPlBEceCi4yUdFHY
X-Gm-Gg: ASbGncvNqBq354YuVTyEdbhdNOmUreZCGrNMkeI2En2PlpB80LhnF0d01q0C3Arn+4w
	V5KhIrnHADaivlVxxztTx4E4TPoS0SfxyrZyvGcFcxSKfv4JqFPDlML0RbAw3p4yWuSNxg4/mfe
	gNqRFpRdmxbkkNljlhBu5E3hggDLPGIND15YGMUbXylV08VubRa4C9y0+/HKR0ygti+xMThamhg
	6Ve8whj9l+d5jq8WWwoJMnvyNfff14aBsF+DcW819ERZwafVn6z6feV6saFXRUNGuUT+llS+6Gh
	4AU9Zy2Q2KmACUWLEfmvrHs8dva4KGUZn8+fWhz67yVCsrAOqZyy5GqXisE3ASqLZdnJ5kzohwD
	3M9DvVpn4FS7W5Mq3M8idyQXtoBhFMpy+e7/QjxeawzG5pM4BvjjlSfnF6+9h6Gt5KMFxpdNeKI
	RvdXElyL/yoUGScxJA08KDj77LiIIFv/SBxtBIYxjF+uFh1eozAUNDQppf3ofD+ylTaA==
X-Google-Smtp-Source: AGHT+IHl2HS3hU/jMXRBFPOzDbfE46Q8VbR3usbdsb1H+Aem0uHFev25SU/M4zjdrEhLqM2SyjZO8g==
X-Received: by 2002:a17:907:78a:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b76c555dc15mr1337266366b.51.1764260787524;
        Thu, 27 Nov 2025 08:26:27 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] common dom0less updates
Date: Thu, 27 Nov 2025 17:26:14 +0100
Message-ID: <cover.1764260246.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move make_chosen_node() and make_memory_node() to common code.

---
Changes in V2:
 - Link to prev. patch series: https://lore.kernel.org/xen-devel/cover.1747145897.git.oleksii.kurochko@gmail.com/
 - Drop patches:
    - xen: restrict CONFIG_STATIC_MEMORY to ARM
    - xen/dom0less: refactor architecture-specific DomU construction 
   As CONFIG_STATIC_MEMORY stuff was moved to common code.
 - Add new patch which also moves make_memory_node() to common code.
 - All other changes please look at specific patch.
 - CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2183447857
---

Oleksii Kurochko (2):
  xen/dom0less: move make_chosen_node() to common code
  xen/dom0less: move make_memory_node() to common code

 xen/arch/arm/domain_build.c           | 120 -------------------------
 xen/common/device-tree/domain-build.c | 121 ++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 120 deletions(-)

-- 
2.52.0


