Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130089F830D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861432.1273391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL55-0007qX-9g; Thu, 19 Dec 2024 18:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861432.1273391; Thu, 19 Dec 2024 18:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL55-0007oL-67; Thu, 19 Dec 2024 18:17:03 +0000
Received: by outflank-mailman (input) for mailman id 861432;
 Thu, 19 Dec 2024 18:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om7t=TM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOL53-0007Z2-AM
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:17:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7091889a-be35-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:17:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862e2c9bb5so51056f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 10:17:00 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8ac93csm2089713f8f.95.2024.12.19.10.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 10:16:58 -0800 (PST)
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
X-Inumbo-ID: 7091889a-be35-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734632219; x=1735237019; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnMObdzqB9wbB+o0eN1Xm+k8F+r8zSvzJLNdA4kFbng=;
        b=Joj+NZ2Loyra5MlajJ/tabfepxD/t7zHIpe2vrlmw1UzJzZ4+/ZXa3jsXQCQN8zLYG
         GX8laOz158uMHZgHRdq917ZHxyG02/s/CQci3V8Z8yw+ht66tqqjWsG/lfnTCQgVgPoI
         Qh94Xnh8L5qMwthxcA275zvWM/W3+3P3VPpH/61cuH/JNOan2N2XfhlBbVYKzTblTT10
         FCMdSkAvVpbW/1lQDEOIKqyOuxNGTTJTFcjd/eh7qL60+G1RqUD/qeXjzQnpUB4nJrC0
         trse0I3BF2n0iU8tzxMeOOoIDYRPX5+A4tZWBGdw6Y8s69lVtlzTKOVECvKCa6Gg8181
         pw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632219; x=1735237019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnMObdzqB9wbB+o0eN1Xm+k8F+r8zSvzJLNdA4kFbng=;
        b=dc4XD9bP9lgtTGYQ6kyDC8RFnu++JFFoLzYMyqfUsaRovG2l5IcCFQ0OKOu0GgxZAE
         +geQ7SiekkXM+pWnWQFaWv1eOjAMApBd2ppj1pWZWdo+380/PSGUTnJu2HFPJxu9vmv9
         0mMtwhw7tl3Tz51skzdLhXkmM1hapovAM66GH6v1N6rJPVFtehD2/pXMXcK0d/7fnYbE
         QcPSBQzjO+zqeqL+Yqhp6buAMVPtXtr5Jwv6hPYlFSaXTSQEyo4Z48vP81r1ZvGiebU9
         B3CC3dcqXl7dBd0EWbc2+lRCVYi9BvjKzgD4MNQUyZNIzlrDqkPa+3RYKi9mFBNkqj9i
         ihuw==
X-Gm-Message-State: AOJu0YwMRnoDqf85uib2PHgwER57CkPAF9Ni2nZ8z7GpOzRspQnCFXz6
	igdSEMlc7mJZYZPzRWsR6YSF57faLdqh6fBIF+6EEL8aXr8KmanwKflcQQ==
X-Gm-Gg: ASbGncvt1sQ8BxN68p/NQVp1Nqqy99t3CtF37VCb0+rymGzV5zllZSXLoH/gtsYp79C
	zVZGN/Uy2IKgxWUGqfBvN/O021yxmMV5bDCzMZgyyFx6F/1Nf/NJ2H66AUqTAgJx6uHRGUG24SC
	eQc/JUsADK1/l3Ae/0TVP2Zz05CcrONZuua+Z36ei2UwNjLSYif4wny3ZVlaMmWmE4kNOqLAjMe
	6OyzjAeSBopo2kFyv+a9T5HAiRAjj5Wec+CvVFioTvfRGAFUNXmX9mOhCgUI8ivLjA4g+b43AgJ
	vWJqPdEqMa3Z4O8cuQ2foQC3vbZlH6mB/EeobkTB7i07aoi3Vs7JzutD
X-Google-Smtp-Source: AGHT+IGSVwMNND5G4399cEUQkcWaN/r5PHt6nJp3Jf80hKVdIkSXRxvQe1/Gt/0oJ347EtbZBmS18Q==
X-Received: by 2002:a5d:5f8f:0:b0:385:fd31:ca24 with SMTP id ffacd0b85a97d-38a223f5bdcmr27252f8f.12.1734632219246;
        Thu, 19 Dec 2024 10:16:59 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86: Rename _rsvd field to pw and move it to the bit 58
Date: Thu, 19 Dec 2024 18:16:51 +0000
Message-Id: <2cee46969dcad25ccc4b00c80742e21770375e08.1734631969.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734631969.git.w1benny@gmail.com>
References: <cover.1734631969.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

The EPT Paging-write feature (when enabled by the TERTIARY_EXEC_EPT_PAGING_WRITE bit) uses bit 58 of the EPT entry to indicate that guest paging may update the page, even if the W access is not set.

This patch is a preparation for the EPT Paging-write feature.
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f0ec459622..d920de96b7 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -34,8 +34,8 @@ typedef union {
                                EPT/VT-d usage */
         mfn         :   40, /* bits 51:12 - Machine physical frame number */
         sa_p2mt     :   6,  /* bits 57:52 - Software available 2 */
-        access      :   4,  /* bits 61:58 - p2m_access_t */
-        _rsvd       :   1,  /* bit 62 - reserved */
+        pw          :   1,  /* bit 58 - Paging-write access */
+        access      :   4,  /* bits 62:59 - p2m_access_t */
         suppress_ve :   1;  /* bit 63 - suppress #VE */
     };
     u64 epte;
-- 
2.34.1


