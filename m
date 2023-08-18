Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E4780FC8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 18:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586473.917725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1wv-0004a8-6b; Fri, 18 Aug 2023 16:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586473.917725; Fri, 18 Aug 2023 16:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1wv-0004Y7-41; Fri, 18 Aug 2023 16:03:45 +0000
Received: by outflank-mailman (input) for mailman id 586473;
 Fri, 18 Aug 2023 16:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1wt-0004Y1-Dv
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 16:03:43 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccdb6eff-3de0-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 18:03:42 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso8400015ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 09:03:42 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 i3-20020a170902c94300b001b890009634sm1933033pla.139.2023.08.18.09.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 09:03:39 -0700 (PDT)
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
X-Inumbo-ID: ccdb6eff-3de0-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692374621; x=1692979421;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDhmjj6vLTH24gqPSxJCz6A9Usv6xbM4AM10uUoY3mI=;
        b=B8FlgJoxjatT14f+eHFH5ulCz62v5Zw2+xIZaoCHcQPFVOA2AF4w4XJ7/B5Vh9x0fJ
         BC8VL9PXyrcfu7pFzZQp9nQxJZpexIKZiVsox+j25tl+Wo6h/X/PJ+kooN+t4DQSNjbv
         AEETM9Tb0ND4xn5QaIQR+lnyMS7eyA+Bsae7S9qFqTpyaPQir+11rBWYPSUfI0CJJIfD
         jIuw9qGtfaBYg5DQ0z+TJHMbTeMX+mYweSgLgNabOENW3R3k8Wl98ZWPnW4YYoZZcPPs
         zrzNal/3fpAhEzYBz42BDn+GOiwnHsik361LWXpj0kg2fZ2Q2IdrwZnggP5PDox0rTpa
         lJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692374621; x=1692979421;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KDhmjj6vLTH24gqPSxJCz6A9Usv6xbM4AM10uUoY3mI=;
        b=MR4l7TfSLxAVwgiu3uBk3E6JIVHJO5cmFDMyrT8BmCZwvax1NNL9+kPe8DlEzRkkPq
         KLBKqlRj14GXb9PrZ9VCQ4Kq8dzmxedWjHURju7W57aKA3uqS0fX19UTevPXwqLXFFqu
         XaG64rybNMYtOVL4LGm7tLSnFOa2kZK2xwXqfIa+vRp9Wf1zQAABfxJAopVeJPrjroZG
         LrLIqJTQeXOQE9X+EixriFLb+tYVt0xer/V5330mzjby8GNK4s+IyGvhTwZSTzWhdGil
         uSmyraw/HlbJMwgYRLxeMrTChtbdxNkXXTWztpYyQSUiTHiDGA3ITDzkMyOGVfoJ+FdR
         VbBw==
X-Gm-Message-State: AOJu0YxyZ9B9CJBM5+QpAXYWTGhr1UpuySj0/CMIbbJK1ikku36VTozl
	CbHmzoSh8w7w59JdQjR/xzCfzwgLRw7IXQ==
X-Google-Smtp-Source: AGHT+IGf5A/E4bJPfaEURTWVVz57YwNwlL+9GV+I/QJoYH31tU9b00unPIfsyJJinTC4CfI1mmYKrQ==
X-Received: by 2002:a17:903:2792:b0:1b6:7f96:42ca with SMTP id jw18-20020a170903279200b001b67f9642camr2462271plb.66.1692374620612;
        Fri, 18 Aug 2023 09:03:40 -0700 (PDT)
Message-ID: <0a8fabe0-3741-ebc2-d89e-cb3a849a2683@gmail.com>
Date: Sat, 19 Aug 2023 01:03:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH] x86/svm: invert valid condition in svm_get_pending_event()
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fixes: 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/hvm/svm/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 01dd592d9b83..beb076ea8d62 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2415,7 +2415,7 @@ static bool cf_check svm_get_pending_event(
 {
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->event_inj.v )
+    if ( !vmcb->event_inj.v )
         return false;
 
     info->vector = vmcb->event_inj.vector;
-- 
2.41.0


