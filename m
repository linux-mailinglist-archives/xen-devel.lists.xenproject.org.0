Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f4WkEIH/PmpNOAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2026 00:38:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ED36D073A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2026 00:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="e/l4a7yA";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346554.1604945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBR-0000mO-CI; Fri, 26 Jun 2026 22:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346554.1604945; Fri, 26 Jun 2026 22:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBR-0000jY-5X; Fri, 26 Jun 2026 22:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1346554;
 Fri, 26 Jun 2026 22:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wdFBP-0000jS-2m
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 22:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdFBO-007ev4-7v
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2026 00:37:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff18-2eae-0a2a0a5409dd-0a2a450c9340-16
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:37:58 +0200
Received: from [209.85.128.176] (helo=mail-yw1-f176.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff45-f399-0a2a450c0019-d15580b0a587-3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:37:57 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7fffb090ddfso14597857b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 15:37:57 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-80d23e43a9asm118387b3.8.2026.06.26.15.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 15:37:56 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782513476; x=1783118276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ7J5OUQhuwtuJDScZp0+csOmtOM0uuBivsfSQrlrqk=;
        b=e/l4a7yAUe8BCreamsdsryHzZkTiEdmfihbXsqR6nBwCHyuHPWGddbZ3zqt2ZltJe/
         ELOZRXiR+4nGyWmDmfeEfZIgdr+va8XlGAdGRmaC3pp9cScK1V6Ehmgz4X/IMFbV9o9g
         C53BvBKO4eoROVSN26B6Z5rJPB4dzy5+v5gPDojfeTLyba94QGChk/xm5fjONC6r+QZq
         wIvLZnQZ8bVB+++q43dLWy/1dEirzEcWNZSdCzHxf810X+tZF4w5l3w/SoXPT9jhcEHx
         1GY7/3DJsrGB6GgJEK+YtFwvITWyiqsRKydAMVVhTtD5Oc8rc/40EJ8bDC5lBHImictn
         zGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782513476; x=1783118276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gJ7J5OUQhuwtuJDScZp0+csOmtOM0uuBivsfSQrlrqk=;
        b=b/xx6Ls9Enn9+kQeXXXzlQoTioluOIpgMAMG6GdVQZ0uXiPv5xnO9eCnJJ8VxakNQL
         jUPzWlZ+mWzzedjeKGCzkKaih3ssRJKdz2iyPTtQHmFqRGHzrSZ/JRFqhR3alkKfqJcD
         tnLchR5qWFMhlWyINByAEeC9FfLjYL8XgCo7WJJ/TyCiZ3oXrXCCmJGPrU41c3CwQBR3
         nBoxaWf+VNFPZVyk9+V8Pza3TX8CvELwFPmev+krITnoBeqWEOOuqc2iBn3VEwdqsP+u
         KhhdZr9vnE4hQZdhHuug2jA9BBpaGuJjpNk9I3ktUUUORh5gdxlpfvezg1qGHgrZvu0o
         LeMg==
X-Gm-Message-State: AOJu0YxRXRlyOTgIeAWAiLhLGQlYaUyboEp0FOVqFtgwIe6CaQyYIbsy
	KiwfUxqbS437SuHnNO4mthwiiHTNsxKK8re+ou9DFExp/TmUCwWEkrnJ
X-Gm-Gg: AfdE7clVqssuCUoP2jmBk4UhBmcu2vDICF8mVRzF92xwvYd+CzxGYT1ZKTmvgU64wUC
	iTYLr2m2FqyQOuSG8cHX5PGvNETjYm8ZQMNDrnRuWuJgfQFz1qU6NrO9kdwu0dUZMvJHemrjtGi
	Ds26M1JVZvYx+gY0m9SmEEk3NCNoV3dMTeT3ZhSxP2FY+Adpn/kx0I618rZdIABjEGrAQhdesB5
	A8ugymDLoxYYxJzko7HcJkDEPcWJqxxw/2lAlfGGYZD+z8N1HJVLwqxGZkDJ7FybmV4NdrIiLA9
	3qn3A3mXznU2c7ZLC4hdQZ1Jnq4neZQVsU/O7HJHRC4QAb0VnnIjfnBNqR4u5mhed6xCC9GpXdg
	oDc5PmtnBUe4l8e3lcFrSFBQrOVfF7hE9tl+Aq67oYrDOGjgk63natRGmMfd/1ncxWweDUDIS6X
	16We+bE0UplRbV420wj2kC3jfB8A==
X-Received: by 2002:a05:690c:660b:b0:7fd:decc:d26f with SMTP id 00721157ae682-80671737c68mr161028967b3.8.1782513476472;
        Fri, 26 Jun 2026 15:37:56 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2] xenbus: reject unterminated directory replies
Date: Sat, 27 Jun 2026 00:37:38 +0200
Message-ID: <20260626223738.43742-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624124242.9160-1-alhouseenyousef@gmail.com>
References: <20260624124242.9160-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782513478-9072FD51-B8003FBF/0/0
X-purgate-type: clean
X-purgate-size: 1188
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04ED36D073A

split_strings() walks each directory entry with strlen(). Although the
transport adds a terminator after the reply buffer, a malformed reply
without a final NUL inside its advertised length would let that walk
cross the protocol payload boundary.

Reject such replies before counting the strings. Report the protocol
violation once and return -EIO to the caller.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v2:
- Reject malformed replies instead of copying the transport-added
  terminator, as suggested by Juergen Gross.

 drivers/xen/xenbus/xenbus_xs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index c202e7c55..d1cca4acb 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -417,6 +417,12 @@ static char **split_strings(char *strings, unsigned int len, unsigned int *num)
 {
 	char *p, **ret;
 
+	if (len && strings[len - 1]) {
+		pr_err_once("malformed XS_DIRECTORY reply\n");
+		kfree(strings);
+		return ERR_PTR(-EIO);
+	}
+
 	/* Count the strings. */
 	*num = count_strings(strings, len);
 
-- 
2.54.0

