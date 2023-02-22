Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55569F40D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499443.770612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnvn-0005dN-Mq; Wed, 22 Feb 2023 12:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499443.770612; Wed, 22 Feb 2023 12:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnvn-0005az-K0; Wed, 22 Feb 2023 12:09:07 +0000
Received: by outflank-mailman (input) for mailman id 499443;
 Wed, 22 Feb 2023 12:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnl-0000FF-Nx
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:49 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2bd9db-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:47 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id f13so28811679edz.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:47 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:44 -0800 (PST)
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
X-Inumbo-ID: 8b2bd9db-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT+Ksue1+E+w99TtdgjOaQagRH8S4XRZ2zbUy1hdUfQ=;
        b=f7sBEFlAiFt8BwckZZSAdepoiq4oPj8xdQ25kOFg8ZFxw4Rq+BOXv9OJkt4tUbntr1
         QtzNdDALpmqPGQpYMCymeEg5BhzqbQ3QRrXUd2sRXeXJNPyCTemMQHe9z8KAqmkYnHbs
         hyhjweiZ1laGMgfRcSU4ugBtrGN6eH09NaL6w8G4fitImlR15Ap/e5Z7pzboDe0fCum8
         HmY+J8Q2zTTxCDhDU4rYUZD40uHFtnDg+YX6LKIEF8OkgYXV+NDaS3rpvf+dmLYGAbq6
         DijIzH8G9aARQpZXompCj1KQS5pLJJVABd1sAFSGabcTi0hUziSJqkzzwjFHwj3Q1f2U
         eEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT+Ksue1+E+w99TtdgjOaQagRH8S4XRZ2zbUy1hdUfQ=;
        b=W6oAqxKHmB9DiAWUu+SPzHEKe/rQUI1Ka8H79Yfg/MF8pbF2jSKOGaStuEVX3tUSvH
         +0MdswclU2ZzHZ8RN/ZjlJcL3BXqMXjZtoMVBQY1j7QaeE9BUBBf6DnKtqqrzFZSHtlC
         5w2nw3UanSxjf7Z1QxAKKoD3GDqa/aJmKXLbS/wSaYdeXvd3fVwpDdKzymtL3jwdGMqg
         1OK7pCEagZRkM3qMrm68ueyoBys3pjMuWVCJj7FCvZMWKQ8uihyyO+jUgz/qbCg3EHuS
         Ry/cZTUaHRbEvSzRp2OmkOm+52oF6L+GHSDmjt8n+tFSOAenN3xeGn5S53W8VpOwBJe3
         0lww==
X-Gm-Message-State: AO0yUKViKX1LYldRYWSeRCJTKknJk4urIvYAIPaSyda1c53SrXvWgYTl
	2zQH96ENoJf4e1RZArV9dtwO0Yewfvk=
X-Google-Smtp-Source: AK7set95xEBEhwxinuF+Ewg4dWtI1668L/9cwbJv7N/Z2epvwFWWYJuaPofhaYeDX2KLOElA8zTF2Q==
X-Received: by 2002:a17:906:248c:b0:878:5f35:b8d6 with SMTP id e12-20020a170906248c00b008785f35b8d6mr16771158ejb.51.1677067244443;
        Wed, 22 Feb 2023 04:00:44 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 8/9] x86/vmx: declare nvmx_enqueue_n2_exceptions() static
Date: Wed, 22 Feb 2023 14:00:22 +0200
Message-Id: <20230222120023.3004624-9-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the scope of nvmx_enqueue_n2_exceptions() to static because it is used
only in this file.

Take the opportunity to remove a trailing space.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - none

 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a6ec0a11fb..5b210e0db4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1908,7 +1908,7 @@ static void cf_check vmx_update_guest_efer(struct vcpu *v)
         vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
 }
 
-void nvmx_enqueue_n2_exceptions(struct vcpu *v, 
+static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
             unsigned long intr_fields, int error_code, uint8_t source)
 {
     struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-- 
2.37.2


