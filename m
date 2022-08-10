Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D030A58F310
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383883.619157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPS-0008Cw-G3; Wed, 10 Aug 2022 19:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383883.619157; Wed, 10 Aug 2022 19:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPS-00086e-9S; Wed, 10 Aug 2022 19:30:30 +0000
Received: by outflank-mailman (input) for mailman id 383883;
 Wed, 10 Aug 2022 19:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPQ-00067E-92
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:28 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3184711-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:27 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id c28so2850004qko.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:27 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:25 -0700 (PDT)
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
X-Inumbo-ID: e3184711-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NQrN8k420cCh2Whj4lm6iBK+XOd3RM9/GZQ5kCWEzI8=;
        b=HLdIwGXHmwGnGDAJ3JX6fFs+egLvXpMNZxno9hqkr3M9GrcC6pDbmkbvmuqhXJdUvp
         OKAr4LmY9KMODQZwk83Ru7V7yJz0GqBdl9m8us6RPwhEYhBFM1UkBhxrH5PuTW9VVZeA
         hj8ZOkfHn8IW5ij8or1eoAAmnER25KcIBzxG0/3KuVgR2akhp9Tr1iEN5bznvhsVPfEP
         wGDFdpAT/0v4JPjz1eh/JW3A5fSwqnaVNg+cEW8dhoPyGREYv8rjcTrBBFWcgHr0xeBF
         eWE3XyMqBj0u6SoJC2+rCIeaK+LeE3Lc30OznZ62v96BWRmQvcsUnh9upvUJQqQLM/tR
         5xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NQrN8k420cCh2Whj4lm6iBK+XOd3RM9/GZQ5kCWEzI8=;
        b=GtgZ1t6xvy+ZG7U8A0gGYPM4cMtuDarmj6BjUHSwIrwpEYOShOXvWbOx3agvOYIfEX
         lgVFL96g2dLgWidM0X3fwmjeeQYHvm9NlEWgz3I5JVymRQH1DtrjOEZEuVyqn1dVKyv9
         j+1HWw/nm8y3+50qwdmBz/pzuUQzjyImotilF88pcdDE5kAQNcNHKtoh1gtPD6sQUG6K
         M+DwHLD5Z/AHr8CxZVOzjcFqB9xEgoJzE3iSAMWP2NRdCaQFuZsWgqXPcYNc0vn6eskq
         wJB7klE/gj6M2GS6LXRCUJeb3AmvXu81nK3AW1KtF0NBM2nCaVwxLbxpahzkia7qRGe7
         0DUg==
X-Gm-Message-State: ACgBeo0Nz8HSQ4rqeOvYbonDNbNRRSK7S1Ja0b9KP7VArI2OG93vlINT
	ed0UFU3Z1xO177yPk1qasedS5/yee6I=
X-Google-Smtp-Source: AA6agR4/b6vChHirTVxjRR7Za7Z/b8B31vpq4Bd4hDp1FXSpeyAGg/EYyp8Url+AwzrsWgXO8lIzTA==
X-Received: by 2002:a05:620a:2451:b0:6b9:ab33:64c3 with SMTP id h17-20020a05620a245100b006b9ab3364c3mr2581738qkn.565.1660159826228;
        Wed, 10 Aug 2022 12:30:26 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 07/13] libxc: Include hwp_para in definitions
Date: Wed, 10 Aug 2022 15:29:38 -0400
Message-Id: <20220810192944.102135-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the hwp_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0c8b4c3aa7..9586eca4c0 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1900,6 +1900,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_hwp_para xc_hwp_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1927,6 +1928,7 @@ struct xc_get_cpufreq_para {
     union {
         xc_userspace_t userspace;
         xc_ondemand_t ondemand;
+        xc_hwp_para_t hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.37.1


