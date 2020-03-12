Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91F1833EB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:58:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPFX-0001jq-9O; Thu, 12 Mar 2020 14:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9DE=45=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jCPFW-0001jg-1z
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:55:50 +0000
X-Inumbo-ID: 8fe0ccd8-6471-11ea-a6c1-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fe0ccd8-6471-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 14:55:49 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p62so6666983qkb.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vib+jX/xNvsFQ5EyP9G96MMo7BJpiLtnnyBUTCTtE0=;
 b=X48+HoFoYTcegPMColnWa6u7lgKMQVaY9dy5btSkJUA+MSw8A0rTDjLBjHrroIoduF
 0OsBYTlj04GwAjslyLT7CwRUND1/zincQqsK/GHIG6K0ueeXOzGbkzuFvJigZ48ut+ju
 ffWYOMS+hrEdcg9sru8dXEKyrGfa0DObkSfSxoHm57JHvtXM4InfpH4mzXUejhliLyop
 orHqWOQFVmuy0y+9x5lkRGSC/kE3cGc8gMRLDU0uN6Jy6KSxcE7a/QDjir79rCnSOqp6
 nesO4m67XFhkUE0HZ+LVdfLeSUviUvY7mpf0PkLvzO0uRG7bEmTnlF7Sy1mx3d0u2OlA
 fLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vib+jX/xNvsFQ5EyP9G96MMo7BJpiLtnnyBUTCTtE0=;
 b=dpi3VEev6f9NWCmbYzbOiU4P0StoNiMx6BtqPlHP6G+kSG3qu424H1ya2woDvQsWIz
 +DzQJ4NRxxKcazXJsvMVa5YUIl7eTFLPdkntvkHMW7mk6qUD2XfYv44lGDgDA2gvyFaU
 /Leqby4owclwho0Jn+dwuwZcFGFC7nE3fBCI3BbrqCtHLsgf0NzRMBX8rYQpldmh4Udv
 A8Y8r3Nrm7H+SWmMUCvJChN2P9Mng5qpg5MOE71JPQU4LTfeEirYdxYgpIlHQH168gd7
 NgOHmO3BeOeuzmwfDTU5TjvrvS6UuEQSniYaQJC6S5hCV6sqOHzu8DWzvfKqoftMUI/Q
 pwZw==
X-Gm-Message-State: ANhLgQ0udYgJmMnFqRHCNqP5HyYBpN5vVN/slQVGXLf08eSFvvo/epz4
 DUmEGF+Y/lFJmVUeXQj6ObIjU45j
X-Google-Smtp-Source: ADFU+vvOXhTQW126JcGZH+SNHtHyNXValUuZ9/l58Zs78XFGJTilOJok2jYMU74Z6FO0/ik9+NFmxQ==
X-Received: by 2002:a37:9104:: with SMTP id t4mr8487703qkd.449.1584024949007; 
 Thu, 12 Mar 2020 07:55:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q1sm19756442qtp.81.2020.03.12.07.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 07:55:48 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 10:54:15 -0400
Message-Id: <20200312145417.106812-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] scripts: Use stat to check lock claim
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgcGVybCB3aXRoIHN0YXQgdG8gY2hlY2sgbG9jayBv
d25lcnNoaXAgaW4gdGhlCkxpbnV4IGhvdHBsdWcgc2NyaXB0cy4gIFRoaXMgcmVtb3ZlcyBYZW4n
cyBydW50aW1lIGRlcGVuZGVuY3kgb24gcGVybC4KCkFuIGFkZGl0aW9uYWwgcGF0Y2ggaXMgYSB0
YWJzIHRvIHNwYWNlIHdoaXRlc3BhY2UgY2xlYW51cC4KCkphc29uIEFuZHJ5dWsgKDIpOgogIHNj
cmlwdHM6IFJlcGxhY2UgdGFicyBpbiBsb2NraW5nLnNoCiAgc2NyaXB0czogVXNlIHN0YXQgdG8g
Y2hlY2sgbG9jayBjbGFpbQoKIHRvb2xzL2hvdHBsdWcvTGludXgvbG9ja2luZy5zaCB8IDMyICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
