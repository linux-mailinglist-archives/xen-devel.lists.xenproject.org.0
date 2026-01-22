Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP2/CKgxcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DD67CC2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211121.1522651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivVf-0003uW-5W; Thu, 22 Jan 2026 14:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211121.1522651; Thu, 22 Jan 2026 14:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivVf-0003rs-2I; Thu, 22 Jan 2026 14:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1211121;
 Thu, 22 Jan 2026 14:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wELS=73=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1vivVe-0003rk-2X
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:18:06 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a1614f5-f79d-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 15:18:03 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-435903c4040so701735f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 06:18:03 -0800 (PST)
Received: from fedora ([193.77.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596090493sm17670486f8f.25.2026.01.22.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 06:18:02 -0800 (PST)
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
X-Inumbo-ID: 2a1614f5-f79d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769091483; x=1769696283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+pquAPCPEsXczBKivIRW/RcYCaQ4i6RQW605EButWU=;
        b=ZtkhO0gb2nGuL5hV6Ps5HLxdEdnf/Zli1dzFPRImaXpXReJJnG4sMdDIuCXZ4N2UJC
         0IQPJQ2MVsjpfVV46WtRiJxnU6T1umV5QWkhZso40RcNfBRa+FgtMS+1zbfH/Z282ekP
         NB8qJWDNGoAUxa5L2MVWksZB51oSfszgYxKaCH4YOpz+Jk3VxNUgaP4Of6WG6XSoisw/
         2HJ7snN16qPzCXeBBfnbsCURLN4dXHdFhcEJG5AtUtnH5wrGi0BYEBF4LrwBmwpEO9Tm
         sou9sPd4DkCuSRwo6quFfKDcBk3Yq6g4KqS82PAb2JCokXDVlODnylNXIY06PFueYhVk
         3VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769091483; x=1769696283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+pquAPCPEsXczBKivIRW/RcYCaQ4i6RQW605EButWU=;
        b=c8EKVO2wpyZWbz4VJbuhFDc1sScxJGoITomrl4uEIlt4oUJfaWYVuVqsmyZ2NZ1E2E
         5AQA2h6wsOVJR/kgxg6EbkxpFGhH0pf/e+hq9dFPyC+BcZRViIOnK/qOKVHtoeXZ6ndj
         lHFACn/EswWxGKRglkc9uXtsuEpsBIkq47fmQwewxFr+vG5dv51uDc2cDXHrqacsEmH2
         BOp10xXNXpZroiRDaJMtBNWcjnIepI1fCI/J+oDTGd5KAXD8fd8To7b1EvJRtx9vx7yi
         LgY/T4Cv/DmMi4oil+rB5dJiRPtwtThSkivuHGnfo0dIdkcyndsMPhli9VlKCjhcn0/L
         h7GQ==
X-Gm-Message-State: AOJu0Yw26ZVnA9t7xawJ7iHc3b8Lr8CnR5j45j9KvxlPNZGnTKgPhtQB
	3y1wWLt4Fzh2bFV/glvnZ2lMwUffxyCaVdW46hoWEt9bkv7wP6BAB+0CMkMO09KR
X-Gm-Gg: AZuq6aI4+dG3BChu0nTe6gFYV+IRkyvY8kpNlOzgFy+pUAQduVSyVsb2OppIq/DP8dm
	XuqRu5aaT2SMYo4+4WPZodkeLh2fm0qYbIjIXpVwWMfT9ybNOjAttTYeqeEvHI72DTkWyMzoJii
	tOAPLHrYpE8tol1OVBZB8pOMC0LONSk00aFU3bpAOfGdpOX2uwM9Hux9ixcoVtnJV2LaCjYhiBv
	GO02Z0wRZ/X7JGXuS1udHTEwQGWWW0ZxGHFW0Oz/IKGRwM2xbr0p2BwJ/FxBxFf5CGX22GnXn/v
	YwaTdFy7MPzSjDYPMIM8EcHTcORLsrSN0DKpmbNNddbHEUmsKpunEqVo7c0JUFaxVVk/zAhdFTn
	OT+Ztx7wjOVu1lDGNRAC/EfjAaw6bjGIA4tyVMUgPFbbnpBdfsK1aDtMW50vcUH9IDiJaIOjbnv
	glk2AmnWlcK/HAJFp1JGE9trso7DIILubO86zLZ8epPceduL4ZQiCZ2g==
X-Received: by 2002:a05:6000:240c:b0:430:fd60:93fb with SMTP id ffacd0b85a97d-4356a053cbamr34015845f8f.32.1769091482500;
        Thu, 22 Jan 2026 06:18:02 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/mcelog: simplify MCE_GETCLEAR_FLAGS using xchg()
Date: Thu, 22 Jan 2026 15:17:07 +0100
Message-ID: <20260122141754.116129-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ubizjak@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:ubizjak@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ubizjak@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,kernel.org,epam.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A96DD67CC2
X-Rspamd-Action: no action

The MCE_GETCLEAR_FLAGS ioctl retrieves xen_mcelog.flags while
atomically clearing it. This was previously implemented using a
cmpxchg() loop.

Replace the cmpxchg() loop with a single xchg(), which provides the
same atomic get-and-clear semantics, avoids retry spinning under
contention, and simplifies the code.

The code on x86_64 improves from:

    186:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx
    18c:	89 d0                	mov    %edx,%eax
    18e:	f0 0f b1 0d 00 00 00 	lock cmpxchg %ecx,0x0(%rip)
    195:	00
    196:	39 c2                	cmp    %eax,%edx
    198:	75 ec                	jne    186 <...>

to just:

    186:	87 05 00 00 00 00    	xchg   %eax,0x0(%rip)

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/mcelog.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 4f65b641c054..abe658c73b7b 100644
--- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -165,9 +165,7 @@ static long xen_mce_chrdev_ioctl(struct file *f, unsigned int cmd,
 	case MCE_GETCLEAR_FLAGS: {
 		unsigned flags;
 
-		do {
-			flags = xen_mcelog.flags;
-		} while (cmpxchg(&xen_mcelog.flags, flags, 0) != flags);
+		flags = xchg(&xen_mcelog.flags, 0);
 
 		return put_user(flags, p);
 	}
-- 
2.52.0


