Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E4868EBE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686021.1067579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revap-0000GN-M8; Tue, 27 Feb 2024 11:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686021.1067579; Tue, 27 Feb 2024 11:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revap-0000DJ-IN; Tue, 27 Feb 2024 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 686021;
 Tue, 27 Feb 2024 11:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revao-0007l8-Ag
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:50 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f9fad6-d562-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:25:48 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so5392930e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:48 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 w25-20020ae9e519000000b00787a7e9c3e8sm3458446qkf.56.2024.02.27.03.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:47 -0800 (PST)
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
X-Inumbo-ID: f4f9fad6-d562-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033148; x=1709637948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfnDRWSsRLdZRck0ImeXNurgPdtQnzpZXT2sgnYgWu4=;
        b=uM1hH/OJnt121jcozicLyDoip+o+9jCeI9n6TkYjqbT+Xdqotq6z5nfHAfpa83iEvn
         o2SG3u9zI5cPlzxuY7PcFyERPZZLJDt2A81P8maKG6RHAhKxIEuItn3Yxf+oJl0QdBvl
         3ILjgD3tKiErlSe58n1dRTIJ8UowV3DGpVe/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033148; x=1709637948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfnDRWSsRLdZRck0ImeXNurgPdtQnzpZXT2sgnYgWu4=;
        b=oPmEf4634BNmUaRj8S/9xcZ9C4OnfSgzAzH7HETiBWsVfg8J8PAMAGA+0Ji1ANClVY
         muiqdNTI3xU16rqynxwzKZlxJGKEebCnJOYi6h3dCO9Fyy9dUtHggO4SqwEqlrVGGvTz
         lrnjvpQgCzmSf8xJfszFtzN4CJRwFsPQcGgyM8D0k39DLyhFrljwmH88Oa5t9dhAkO3u
         9Gd1wKlZ6Np8x40d2hXBlpGqqgHmhjTCl/y0FRKD+hGIfauDQ4pt+Ka/RR63btUkbjOg
         yQ58HqvrrpPHmKyJh+691FhZDjnElSg876LoUSZsbQOKZ1oSdQ5b78J3rSby8s5jGngC
         yUuw==
X-Gm-Message-State: AOJu0YzdfccXPmRDkURVR0p4Lq23HTZ8HyoIVJIG2PdFfHlnh+e7scjP
	VF+OXHPFDUZQhIaZRrCMzcNZTl8BH0dEHI2mtNZLdZGqsp/n+uPupAXnqZ07VOIE6T1Nnhf5YWu
	o
X-Google-Smtp-Source: AGHT+IFeyZ15xptCBWdoSu4rws/k7G4zdbWzKZJdYq04/EcuMOsIn9zH2PJQuPkeumcjTGJS1tHSOg==
X-Received: by 2002:a05:6512:3da9:b0:511:5f38:76e with SMTP id k41-20020a0565123da900b005115f38076emr7669601lfv.1.1709033147736;
        Tue, 27 Feb 2024 03:25:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 4/5] xen/livepatch: properly build the noapply and norevert tests
Date: Tue, 27 Feb 2024 12:25:27 +0100
Message-ID: <20240227112528.4540-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227112528.4540-1-roger.pau@citrix.com>
References: <20240227112528.4540-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems the build variables for those tests where copy-pasted from
xen_action_hooks_marker-objs and not adjusted to use the correct source files.

Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state tracking marker')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/test/livepatch/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index c258ab0b5940..d987a8367f15 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -118,12 +118,12 @@ xen_action_hooks_marker-objs := xen_action_hooks_marker.o xen_hello_world_func.o
 $(obj)/xen_action_hooks_noapply.o: $(obj)/config.h
 
 extra-y += xen_action_hooks_noapply.livepatch
-xen_action_hooks_noapply-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
+xen_action_hooks_noapply-objs := xen_action_hooks_noapply.o xen_hello_world_func.o note.o xen_note.o
 
 $(obj)/xen_action_hooks_norevert.o: $(obj)/config.h
 
 extra-y += xen_action_hooks_norevert.livepatch
-xen_action_hooks_norevert-objs := xen_action_hooks_marker.o xen_hello_world_func.o note.o xen_note.o
+xen_action_hooks_norevert-objs := xen_action_hooks_norevert.o xen_hello_world_func.o note.o xen_note.o
 
 EXPECT_BYTES_COUNT := 8
 CODE_GET_EXPECT=$(shell $(OBJDUMP) -d --insn-width=1 $(1) | sed -n -e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | awk '{$$0=$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' | sed 's/^/{/;s/,$$/}/g')
-- 
2.44.0


