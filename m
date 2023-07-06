Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC574A401
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559984.875549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8q-0007Cp-Io; Thu, 06 Jul 2023 18:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559984.875549; Thu, 06 Jul 2023 18:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8q-00076s-6F; Thu, 06 Jul 2023 18:55:48 +0000
Received: by outflank-mailman (input) for mailman id 559984;
 Thu, 06 Jul 2023 18:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8o-0003x8-Ha
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:46 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b5a3cf-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:46 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-76754b9eac0so104080485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:46 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:43 -0700 (PDT)
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
X-Inumbo-ID: b6b5a3cf-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669744; x=1691261744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=T9B/rbXisqKcz3wjgtmoVu7LdeqFGH4UAy8BoQR86t/OyPsZbWT0r+K2WAUV02EDRR
         UyJM7tXdj9KkZ082Bhrp5eNr4HI5X38ndXHjXFIWmHyGPyAHC4N6TC3LFQIsIHTtv9wK
         uCz43pF7Ql6U9GskVfBfoOTikWovLgrvSiCllHIXfmd7XFrmrKx4MXv0lXnkcB3n2pBg
         Fu+eD955SYfdcdFIedmoaO2bHL8UYmQYfkCCYWXrwiimZgAmDsBxQ33jlM/jMVDADVjS
         o0WWBitcXgZObSAu2jREoAPbotfP/jlvOCq8z1iT61smB5S09H9FBAPq7EF8nO4eig10
         fLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669744; x=1691261744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=Jlc1kqN7WSWI94fQIi7lO2L+alTBmuo1hUEp8nDxqRfBwfoop0KxnHKhp17xy47NLE
         rfvym67xpLLNdEBX9fiivgJTj38bo3j1PYJ5F6TbzjDMSz6Z10xPCkIVADovpmgjg8sc
         Rz8DjRlE5GLTxuFeWrkXT83GyK9VGnPOf7saVTIX3/k6dZHH1bvHMKSeeUt4Z8QxtOVL
         5TyBhj8shDXdZ05tHQf1dQqB9REol+/Ni/r4lWhfa45G2hFkVrtrX2KN1G+SnCJhy6HF
         aWao+Db/wq8LsRILdyinXjiW+wTj5EKUUnppbsimUi0caB9QWgtNvCNAXM0xESS4r433
         Ym3Q==
X-Gm-Message-State: ABy/qLaFyVXTkqmXD6prfU/WHjHfH5L7rlG7ovTo9X/FsppyEFtFYJP5
	qONUSzMtvIUGmCLPU8pQ4oli7+6riC0=
X-Google-Smtp-Source: APBJJlFBbgTddzz4gkYjb55I0xVyztqRXSWUHbdU49ztUxKJdfHmghk89ZbnvnxzRzGJtEZKjkonew==
X-Received: by 2002:a05:620a:4441:b0:767:159f:eb62 with SMTP id w1-20020a05620a444100b00767159feb62mr3114315qkp.70.1688669744488;
        Thu, 06 Jul 2023 11:55:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 10/15] libxc: Include cppc_para in definitions
Date: Thu,  6 Jul 2023 14:54:35 -0400
Message-ID: <20230706185440.48333-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the cppc_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v4:
Rename hwp to cppc
Add Anthony's Ack
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 8aedb952a0..2092632296 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1892,6 +1892,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_cppc_para xc_cppc_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1923,6 +1924,7 @@ struct xc_get_cpufreq_para {
                 xc_ondemand_t ondemand;
             } u;
         } s;
+        xc_cppc_para_t cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.41.0


