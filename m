Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPzpEHjru2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7302CB240
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257013.1551479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRq-0008Cy-QS; Thu, 19 Mar 2026 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257013.1551479; Thu, 19 Mar 2026 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRq-00086P-JC; Thu, 19 Mar 2026 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1257013;
 Thu, 19 Mar 2026 12:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv1Q=BT=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w3CRp-0007qy-4g
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:25:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5a0426f-238e-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 13:25:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso19531495e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:25:53 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c350aesm60831395e9.4.2026.03.19.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:25:51 -0700 (PDT)
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
X-Inumbo-ID: c5a0426f-238e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773923152; x=1774527952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf11YSHnRxDOMSevtCdzvsJWQN4vjp+wOdoo6LaGDtg=;
        b=MZFVv5xZT7CvEY/2h26tHPlHiui4hnXAxrUWZPYERBlQC6RKxU1dsZyPZhbbFPEmAz
         lMzZKlCwfxeXojIXfVlaCjVM8R64rwNNr7BSY93cGAnpSiQQCd3yI6G++VGvM6wvOPtk
         G70Z67WEnl6ubdFTW5xIdvHAPrtmjQNkNGjXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923152; x=1774527952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf11YSHnRxDOMSevtCdzvsJWQN4vjp+wOdoo6LaGDtg=;
        b=dShER4IWE+yypL+/VFH393M50lbo7V/kuhKvIN6DQ4wTeuu3lqptFS2nfV8O/l3RHu
         otDLdqeYvDkuz5gU7EdTAzDfE56zAjmnKrXIA3kCi1GcKtRaHUTcmjUpyP69WtHAb+R/
         5BkdKE08huVynIUwB0BQFqII9rDrIhfihPE3xKW5QXwVOl9abzyJnj6QqhB8scztMFdu
         kAu19axiCCQQGpBxrL1TLIPUof9rufNJSPbY3IcyHYybvKBIKW7qEbwF51wLR7n03OlQ
         rd2oUvNDnfYtFwlQ4jit6GkKYLEmXBUA0HN2H8grUyoUauKHDy6uAQgwMBnUVac9AAwc
         927A==
X-Gm-Message-State: AOJu0YzTqZ2SqO1JhfhNpFRngRcYv0wgywYNTg8AMUiQqfID7C2HPTD6
	j3MS/Y+Dc7lrUfpwSTx1pdlddBqj9vgCnLgHc4VOvpbm5JujS9vu6hTp6whihtT4BEOuZAJ8kpM
	e0dvt
X-Gm-Gg: ATEYQzyVrhN+g9aqBvfK+/cnCF0sfsy3CXWUIQRN6dXpSrLhbI/PF7Ez72C4jnFJkE6
	GXcDbTr6z1rCoI36iGhICEvJTvemzwZXR+9TEfO2Rhy5gQwy2QhHdNWC7ppGx+7DvxiLy9GaIpH
	3BMlHi1noRxZP/BhWBEd6cC5teBrV37CUM62Cel45Db93OFlxSsc9pfbRXB3ZNzCNWXfkNMV7rq
	SJ3iPRukWzMIyTBcVy++J0+eT7MSPoaDNwLjkXZU71SrumQFWK0Hdle6wU/cXSZNk/vG4L917jT
	n9ZT5epxt+g3sGjCPNKYjHYIB8XhOMwyHk6ROdqV06if+usrarJPubx1HKV5L8Jtj7+Psb7ZZBy
	vrYneGn81QiJoYW/IkX9KhU3XxwHLQ8HsFRBTqxP/XE8l6H9sHugSOdDAqLLexRyTaSWvDRW65t
	Sf3AuzIy5ry+Aop3V2aCxtNAXY4kCeWfGGVXzTJSSKYoTN/FOpe09eo0+vcWdJkdN5v4gzalo=
X-Received: by 2002:a05:600c:3f10:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-486f8b0b482mr56466255e9.2.1773923151735;
        Thu, 19 Mar 2026 05:25:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] x86/kexec: Improvements for FRED
Date: Thu, 19 Mar 2026 12:25:45 +0000
Message-Id: <20260319122549.922724-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3C7302CB240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kexec with FRED happens to already function.

Looking at the logic, several unsafe actions are occuring.  Fix the worst of
them.

Andrew Cooper (4):
  x86/kexec: Stop hooking NMIs with trap_nop()
  x86/kexec: Fix and expands comments for kexec_reloc()
  x86/kexec: Invalidate the IDT earlier in kexec_reloc()
  x86/kexec: Disable FRED earlier in kexec_reloc()

 xen/arch/x86/crash.c              | 20 +++++-----
 xen/arch/x86/x86_64/kexec_reloc.S | 62 ++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 27 deletions(-)

-- 
2.39.5


