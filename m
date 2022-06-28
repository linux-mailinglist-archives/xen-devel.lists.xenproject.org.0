Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B724855E595
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357164.585637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckw-0000qc-Pp; Tue, 28 Jun 2022 15:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357164.585637; Tue, 28 Jun 2022 15:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Ckw-0000my-MO; Tue, 28 Jun 2022 15:03:58 +0000
Received: by outflank-mailman (input) for mailman id 357164;
 Tue, 28 Jun 2022 15:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Ckv-0000FN-82
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:03:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88320c78-f6f3-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:03:56 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id d2so14637188ejy.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:03:56 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:03:55 -0700 (PDT)
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
X-Inumbo-ID: 88320c78-f6f3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+7utVhDuej6MZ9OSVh+jkMKshxCgiL51GUsSj3Aeec=;
        b=L5ORSMiC91/FjooMk1FXAP4yFWISXTFt+a4ktt9OtGiEGdoYojrBDG3WEHZsmUgD5r
         Y8mb9aewBpupG1TOg1FDnboy75T6IPvVOv+6vR+ZJQ4juqNxZOiXB8Z9JgBl0mnTlwFv
         pI67qb8oF+5AbUhZj6oT/xJv3M+TSAtEMXpGNF1hZ1Txh4SfbOpbw845uQhc40Mdrl1n
         vwMhbmTWUrqwWCT39sQZd6+Y4VeL3WdTyNeJgarCmg4CkvPWEOGITr1AKEy4/YDTQLU6
         KBXoUeG2/b/bD+fe+e4iR4NqkFpO4lpP1LmyyGM6mgYjWOXLOLTq+EidFCLhBCHsqKg1
         FqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+7utVhDuej6MZ9OSVh+jkMKshxCgiL51GUsSj3Aeec=;
        b=fnvY+Neh7VN1C7PLNe2FeyL0/A1ILnML4fX4k3fPEPqExiYhALtQkXuIJy0CY5kUB1
         9Iwvd50Rtx9TaBGxwdmylqyva6D9tWPlYaWB7aD9OtlcZGeUw3LJnZLp8O3G+Us/8fCO
         RCvc0vC7MOQzbC9f9OTllVLB2eO9NY3IcLHnHFk+raX2SdLMyaKDy55O7vocZKFvARL1
         638jiikVwgmX3iJNmO10jgwSQDhxH7TLs8uDi+67tekujfce8zY6sC26AqqQl6gbtVwB
         iTLxViQ7mYnvdxMuUGepM1HRNDfO9k89HaPXqon+Y9HYDhujGjZ66tcFCWVO79Xdi2rZ
         kdZQ==
X-Gm-Message-State: AJIora/ySm3ae1cHNp27ClmRKbOTpbx3bbXWu1RLjUFGA/IrT1ce37yy
	uF4/2Z+847nWeOWkU2wPXq99QwOv1hU=
X-Google-Smtp-Source: AGRyM1tYernbfqXZi265QLoSri62mY8O22St/fnHlQL+O98CzrHwXWmHU7CCC666D0UkR0jzWLPNww==
X-Received: by 2002:a17:906:4482:b0:70a:19e3:d18a with SMTP id y2-20020a170906448200b0070a19e3d18amr18397947ejo.510.1656428635852;
        Tue, 28 Jun 2022 08:03:55 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7 violation
Date: Tue, 28 Jun 2022 18:03:34 +0300
Message-Id: <20220628150337.8520-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628150337.8520-1-burzalodowa@gmail.com>
References: <20220628150337.8520-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function vm_event_wake() is referenced only in vm_event.c.
Change the linkage of the function from external to internal by adding
the storage-class specifier static to the function definition.

Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- replace the phrase "This patch aims to resolve indirectly a MISRA C 2012
  Rule 8.4 violation warning." with "Also, this patch aims to resolve
  indirectly a MISRA C 2012 Rule 8.4 violation warning."

 xen/common/vm_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 0b99a6ea72..ecf49c38a9 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -173,7 +173,7 @@ static void vm_event_wake_queued(struct domain *d, struct vm_event_domain *ved)
  * call vm_event_wake() again, ensuring that any blocked vCPUs will get
  * unpaused once all the queued vCPUs have made it through.
  */
-void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
+static void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
 {
     if ( !list_empty(&ved->wq.list) )
         vm_event_wake_queued(d, ved);
-- 
2.34.1


