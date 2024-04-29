Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B178B5A5A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714082.1115086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHR-0006rH-AF; Mon, 29 Apr 2024 13:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714082.1115086; Mon, 29 Apr 2024 13:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHR-0006lO-4i; Mon, 29 Apr 2024 13:42:53 +0000
Received: by outflank-mailman (input) for mailman id 714082;
 Mon, 29 Apr 2024 13:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNw/=MC=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1s1RHP-0006Ul-SN
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:42:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e912b64-062e-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 15:42:49 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so2402924f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:42:49 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b0034c5b28c264sm8530404wrt.16.2024.04.29.06.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 06:42:48 -0700 (PDT)
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
X-Inumbo-ID: 5e912b64-062e-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714398169; x=1715002969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7z726VbGboV43t8nEqdtfREavwTzKooElDgc93ukhU=;
        b=LOIp7wc24ZptYFYz8QWEwv8+pqSViQ9xykuPbnWdqG0hNMiaEjUZoVBzPLpA9+8Ur2
         wcwJkkPpf4q9dq6pY+VTeDcExjcxaj8FfJsgJMP/mXAXZR5digeaFQnA+WYdJhH2jaEX
         /iRIE3PtiE5bcrADsDNXVDSRTV+7tfczS0X1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398169; x=1715002969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7z726VbGboV43t8nEqdtfREavwTzKooElDgc93ukhU=;
        b=YzBOpWsO0blFt+E/zKkwiLMj8rWbsPwCo4eO4dUQueeUaRBbMveXRmqubqBlymzrqr
         F/cKeDACnqMY8RW3Tda3YmJulgIiEEr3+fbyrxAfJn37zk3qhS4ExOu7b/sMZ/FzVhSL
         haXQHb5wpEbG57HgSlrJjDNUoYSvOJ7GrFEQNs7djO6l76vRWeqwGLL2MGxSKCHKQpwh
         m4Q3MbQWIsEWdUM3cQ3cWVGPfuc4maNbEtGP7kLJJ471ym4MWJSl7BNt19WO6CHFfhm3
         hXNb+OGibBb98LmC65NJdM+tsNQkwnQla9NarNTWyn2i1imHv+SDZAD/f53J+dspwX/Z
         35NA==
X-Gm-Message-State: AOJu0YwJHqd8DwJTou1Im1FhzIWigqoI596Pov5isP3mUKyskiKfLuU9
	eqHQzRwidUMp8/pe2uO/1Yr2tlvgyNWV/6NKw+cQE2sXvzAd76V9LqNICUr6VNDlzcVZol3A2Hi
	+
X-Google-Smtp-Source: AGHT+IHlUjjSE7LEnN3jRtwdG59ObMZHUaWo4/aiHbW6pTFes1yk3qYVLIAc0KTyx+Kra3j2j0Zj7g==
X-Received: by 2002:adf:e912:0:b0:34c:e1c2:6281 with SMTP id f18-20020adfe912000000b0034ce1c26281mr3688500wrm.2.1714398169099;
        Mon, 29 Apr 2024 06:42:49 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/2] tools/lsevtchn: Use new status identifiers in loop
Date: Mon, 29 Apr 2024 14:42:42 +0100
Message-Id: <83f66a419e0df15d23f0dd8e1e5680658d0c136d.1714148012.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714148012.git.matthew.barnes@cloud.com>
References: <cover.1714148012.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lsevtchn terminates the loop when the hypercall returns an error, even
if there are still event channels with higher port numbers to be
enumerated over.

Continue the loop even on hypercall errors, and use the new status
identifiers for the evtchn_status hypercall, namely "port invalid" and
"domain invalid", to determine when to break the loop.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/xcutils/lsevtchn.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..4a48620cd72a 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -24,11 +24,20 @@ int main(int argc, char **argv)
         status.port = port;
         rc = xc_evtchn_status(xch, &status);
         if ( rc < 0 )
-            break;
+            continue;
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
 
+        if ( status.status == EVTCHNSTAT_dom_invalid )
+        {
+            printf("Domain ID '%d' does not correspond to valid domain.\n", domid);
+            break;
+        }
+
+        if ( status.status == EVTCHNSTAT_port_invalid )
+            break;
+
         printf("%4d: VCPU %u: ", port, status.vcpu);
 
         switch ( status.status )
-- 
2.34.1


