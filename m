Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75018505CCE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 18:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307308.522634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngUam-0003eC-2r; Mon, 18 Apr 2022 16:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307308.522634; Mon, 18 Apr 2022 16:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngUal-0003bP-Vi; Mon, 18 Apr 2022 16:51:11 +0000
Received: by outflank-mailman (input) for mailman id 307308;
 Mon, 18 Apr 2022 16:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1+Oo=U4=redhat.com=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1ngUak-0003bJ-RP
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 16:51:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd02f26e-bf37-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 18:51:06 +0200 (CEST)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-IgKty319Nm2wMqn5SMYLQw-1; Mon, 18 Apr 2022 12:51:02 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 dd5-20020ad45805000000b004461b16d4caso11286982qvb.16
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 09:51:02 -0700 (PDT)
Received: from treble.redhat.com ([2600:1700:6e32:6c00::35])
 by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm7277059qtp.30.2022.04.18.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:51:00 -0700 (PDT)
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
X-Inumbo-ID: bd02f26e-bf37-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650300665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKtm4nbSU3FWhhvlPNHt662yt7zgfxklNVpsEjzLR6E=;
	b=jJv1fhUJRuWhH5UqA5skXagwnF6IbzWxhH4gUYAJRVJCle4I4H1sOCB4tGSQybfmg9zhD1
	MAXm4yBrgVWI1V9vpD0MpQKH8ejU8d40bRkcOtkwr8zyrR1X2pRJ/UWn0BEjVfgIZcG4qK
	trtF9Ic8om1wCorcJFf08Mks95ctCOM=
X-MC-Unique: IgKty319Nm2wMqn5SMYLQw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sKtm4nbSU3FWhhvlPNHt662yt7zgfxklNVpsEjzLR6E=;
        b=jHoDmafRTgEDH/Ru7RDYo41z5XEDkXGgs7+AFx0x7MqDyz5TIksSb9N90p58i8d+0j
         DPqmfpdNd6oNyuxaH3nPoLYEeaLclEEgaxxpFNi1zH4sLltuthcR2DEfkyKj9XzF1Ur2
         YmuHXV3HtRs7pFudaaG9gEIdX+twDm/cbW8dMRDbb0TFmbvWcCKLv9jpD6sg2V1udvRS
         AhSVaJras9qtEIHJ0f8TwwEaTD4pefI1a1l2p7Y274WH9+A7VjwBX/X+//wvv+EFj//7
         QvZzRs2eFegU7GUxZiQvngT8gkZ5OusDHO9hRnbEjN7PbpW8lmEglm9Mn99YXO8goOIf
         tJow==
X-Gm-Message-State: AOAM532It8Xw5m/m+1jLKjysvRYKtbK0f3pRtzju4RolZcQLe8LysqvC
	rKW0BDTJDucxhwlaqWe9y+eLznNc4+SRhLpAvLN08G5X12NfOrCD0AS/p8tA7e2ppuxOL4AYEvn
	EHPWQaJP1SRLPncHBsId0Loqf+hQ=
X-Received: by 2002:a05:620a:269a:b0:680:a5c5:954e with SMTP id c26-20020a05620a269a00b00680a5c5954emr7178497qkp.468.1650300661655;
        Mon, 18 Apr 2022 09:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5s03dJEz37yFRd0bt8VJZXKfEi+tgI60K56wnTALH0l5S//HMzNqbEJEbGM7GALoZ4yLkjw==
X-Received: by 2002:a05:620a:269a:b0:680:a5c5:954e with SMTP id c26-20020a05620a269a00b00680a5c5954emr7178482qkp.468.1650300661440;
        Mon, 18 Apr 2022 09:51:01 -0700 (PDT)
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: x86@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 06/25] x86/xen: Add ANNOTATE_ENDBR to startup_xen()
Date: Mon, 18 Apr 2022 09:50:25 -0700
Message-Id: <a87bd48b06d11ec4b98122a429e71e489b4e48c3.1650300597.git.jpoimboe@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1650300597.git.jpoimboe@redhat.com>
References: <cover.1650300597.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The startup_xen() kernel entry point is referenced by the ".note.Xen"
section, but is presumably not indirect-branched to.  Add ANNOTATE_ENDBR
to silence future objtool warnings.

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 arch/x86/xen/xen-head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index ac17196e2518..3a2cd93bf059 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -45,6 +45,7 @@ SYM_CODE_END(hypercall_page)
 	__INIT
 SYM_CODE_START(startup_xen)
 	UNWIND_HINT_EMPTY
+	ANNOTATE_NOENDBR
 	cld
 
 	/* Clear .bss */
-- 
2.34.1


