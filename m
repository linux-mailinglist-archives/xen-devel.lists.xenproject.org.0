Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87421833EC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:58:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPFg-0001lz-T0; Thu, 12 Mar 2020 14:56:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9DE=45=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jCPFg-0001lk-2a
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:56:00 +0000
X-Inumbo-ID: 94b5b976-6471-11ea-bec1-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94b5b976-6471-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 14:55:57 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id du17so2725429qvb.12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2020 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tiMMbdlplWbQkqKBrkqBCfz0n+qZkFIQLjvGcjRlus0=;
 b=kVDNXjPf7KOui5qsaux0T5RiwyA/hueF/+XMUrc2aQRs7XW6lOmFsmP7doHyyiIml6
 bqdPpdAeEhOibjgyrL5AGllXZZ2zI6wbKLcsundujYDotmHHF5JY4H4vKRLBJjYzPvcX
 U1QGVcQIdTIXLmT4Ov7btcFD/k65KSCeteeSuN8uDHkCmSBa0UcgrQwRSJ5S20eOQlLe
 TuVQgUifbr6vvrAkB5tXDs2eyZ+tMV7I4B0I8dpWeE5cq/+UYODLDiF/MwMKhoamSQye
 pjEKHa+KjMo8+Znq+NWk9LuMoHEnqo/Xoz+SDY8hOV+OfovlA2uX7y1h93LxtGXUqEZN
 2hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tiMMbdlplWbQkqKBrkqBCfz0n+qZkFIQLjvGcjRlus0=;
 b=EM+rA4qnrpvNEtZs8aEUYn6Pamt1uBCikkanXHMelzmS8AhePOSu1tu93pgVgn3o+8
 sFZA8yLYGU4C3cfi+isxYUARBlAQLPerYaedru4GkqI0FI1zH+Hkh3yq6IVp7iOzDDVj
 veIYrUzY+/EjunE5+OoIs4MDcSiR4i2oFTxbHkX3bPR+CI57ZZq3WVRlXtPNRxdRbUMv
 gzTXawciXk//mPrAxFmNen6x1WdKERUNOX92z/0RDHcx46D6QNeQKY+6dBxcxnwbefZY
 ycF/HHYtrVkpx+WndBgU3NUkC5dC+5MDHABQoQA07ADjSilRkzjuYP/S1sAaS/RaPkEK
 HYaQ==
X-Gm-Message-State: ANhLgQ3TzLGshQx4Ian77G3tyQ+N9iRECh4sGnV6zt5frLPAp7kbYgax
 oRv2TY66ikBK8xvT+t/E7ZEjBYlJ
X-Google-Smtp-Source: ADFU+vtFQtHbmq/6X7Z3fr6MmHwbkRdXuL6OzKGLC7jG8n+bZb9ddH7qGn3h23QsMR6W3MB8RDzaog==
X-Received: by 2002:a05:6214:1703:: with SMTP id
 db3mr1686198qvb.28.1584024957023; 
 Thu, 12 Mar 2020 07:55:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q1sm19756442qtp.81.2020.03.12.07.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 07:55:56 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 10:54:17 -0400
Message-Id: <20200312145417.106812-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312145417.106812-1-jandryuk@gmail.com>
References: <20200312145417.106812-1-jandryuk@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] scripts: Use stat to check lock claim
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwbGFjZSB0aGUgcGVybCBsb2NraW5nIGNoZWNrIHdpdGggc3RhdCgxKS4gIFN0YXQgaXMgYWJs
ZSB0byBmc3RhdApzdGRpbiAoZmlsZSBkZXNjcmlwdG9yIDApIHdoZW4gcGFzc2VkICctJyBhcyBh
biBhcmd1bWVudC4gIFRoaXMgaXMgbm93CnVzZWQgdG8gY2hlY2sgJF9sb2NrZmQuICBzdGF0KDEp
IHN1cHBvcnQgZm9yICctJyB3YXMgaW50cm9kdWNlZCB0bwpjb3JldXRpbHMgaW4gMjAwOS4KCkFm
dGVyIEEgcmVsZWFzZXMgaXRzIGxvY2ssIHNjcmlwdCBCIHdpbGwgcmV0dXJuIGZyb20gZmxvY2sg
YW5kIGV4ZWN1dGUKc3RhdC4gIFNpbmNlIHRoZSBsb2NrZmlsZSBoYXMgYmVlbiByZW1vdmVkIGJ5
IEEsIHN0YXQgcHJpbnRzIGFuIGVycm9yIHRvCnN0ZGVyciBhbmQgZXhpdHMgbm9uLXplcm8uICBS
ZWRpcmVjdCBzdGRlcnIgdG8gL2Rldi9udWxsIHRvIGF2b2lkCmZpbGxpbmcgL3Zhci9sb2cveGVu
L3hlbi1ob3RwbHVnLmxvZyB3aXRoICJObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5IgptZXNzYWdl
cy4KClBsYWNpbmcgdGhlIHN0YXQgY2FsbCBpbnNpZGUgdGhlICJpZiIgY29uZGl0aW9uIGVuc3Vy
ZXMgd2Ugb25seSBjaGVjawp0aGUgc3RhdCBvdXRwdXQgd2hlbiB0aGUgY29tbWFuZCBjb21wbGV0
ZWQgc3VjY2Vzc2Z1bGx5LgoKVGhpcyBjaGFuZ2UgcmVtb3ZlcyB0aGUgb25seSBydW50aW1lIGRl
cGVuZGVuY3kgb2YgdGhlIHhlbiB0b29sc3RhY2sgb24KcGVybC4KClN1Z2dlc3RlZC1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEFu
ZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KCi0tLQp2MjoKICBSZXBsYWNlIHNlZCB3aXRoIGJh
c2ggc3RyaW5nIG1hbmlwdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGph
bmRyeXVrQGdtYWlsLmNvbT4KLS0tCiB0b29scy9ob3RwbHVnL0xpbnV4L2xvY2tpbmcuc2ggfCAy
OCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9ob3RwbHVnL0xpbnV4
L2xvY2tpbmcuc2ggYi90b29scy9ob3RwbHVnL0xpbnV4L2xvY2tpbmcuc2gKaW5kZXggYmFhYWY3
MzUwOC4uNjlhZWZhZTZmNiAxMDA2NDQKLS0tIGEvdG9vbHMvaG90cGx1Zy9MaW51eC9sb2NraW5n
LnNoCisrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgvbG9ja2luZy5zaApAQCAtNDEsNyArNDEsNyBA
QCBjbGFpbV9sb2NrKCkKICAgICAjIGZyb20gY2hpYXJrLXV0aWxzLCBleGNlcHQgdXNpbmcgZmxv
Y2suICBJdCBoYXMgdGhlIGJlbmVmaXQgb2YKICAgICAjIGl0IGJlaW5nIHBvc3NpYmxlIHRvIHNh
ZmVseSByZW1vdmUgdGhlIGxvY2tmaWxlIHdoZW4gZG9uZS4KICAgICAjIFNlZSBiZWxvdyBmb3Ig
YSBjb3JyZWN0bmVzcyBwcm9vZi4KLSAgICBsb2NhbCByaWdodGZpbGUKKyAgICBsb2NhbCBzdGF0
CiAgICAgd2hpbGUgdHJ1ZTsgZG8KICAgICAgICAgZXZhbCAiZXhlYyAkX2xvY2tmZDw+JF9sb2Nr
ZmlsZSIKICAgICAgICAgZmxvY2sgLXggJF9sb2NrZmQgfHwgcmV0dXJuICQ/CkBAIC01MCwxNCAr
NTAsMjQgQEAgY2xhaW1fbG9jaygpCiAgICAgICAgICMgYWN0dWFsbHkgYSBzeW50aGV0aWMgc3lt
bGluayBpbiAvcHJvYyBhbmQgd2UgYXJlbid0CiAgICAgICAgICMgZ3VhcmFudGVlZCB0aGF0IG91
ciBzdGF0KDIpIHdvbid0IGxvc2UgdGhlIHJhY2Ugd2l0aCBhbgogICAgICAgICAjIHJtKDEpIGJl
dHdlZW4gcmVhZGluZyB0aGUgc3ludGhldGljIGxpbmsgYW5kIHRyYXZlcnNpbmcgdGhlCi0gICAg
ICAgICMgZmlsZSBzeXN0ZW0gdG8gZmluZCB0aGUgaW51bS4gIFBlcmwgaXMgdmVyeSBmYXN0IHNv
IHVzZSB0aGF0LgotICAgICAgICByaWdodGZpbGU9JCggcGVybCAtZSAnCi0gICAgICAgICAgICBv
cGVuIFNURElOLCAiPCYnJF9sb2NrZmQnIiBvciBkaWUgJCE7Ci0gICAgICAgICAgICBteSAkZmRf
aW51bSA9IChzdGF0IFNURElOKVsxXTsgZGllICQhIHVubGVzcyBkZWZpbmVkICRmZF9pbnVtOwot
ICAgICAgICAgICAgbXkgJGZpbGVfaW51bSA9IChzdGF0ICRBUkdWWzBdKVsxXTsKLSAgICAgICAg
ICAgIHByaW50ICJ5XG4iIGlmICRmZF9pbnVtIGVxICRmaWxlX2ludW07Ci0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICcgIiRfbG9ja2ZpbGUiICkKLSAgICAgICAgaWYgWyB4JHJpZ2h0Zmls
ZSA9IHh5IF07IHRoZW4gYnJlYWs7IGZpCisgICAgICAgICMgZmlsZSBzeXN0ZW0gdG8gZmluZCB0
aGUgaW51bS4gIHN0YXQoMSkgdHJhbnNsYXRlcyAnLScgaW50byBhbgorICAgICAgICAjIGZzdGF0
KDIpIG9mIEZEIDAuICBTbyB3ZSBqdXN0IG5lZWQgdG8gYXJyYW5nZSB0aGUgRkRzIHByb3Blcmx5
CisgICAgICAgICMgdG8gZ2V0IHRoZSBmc3RhdCgyKSB3ZSBuZWVkLiAgc3RhdCB3aWxsIG91dHB1
dCB0d28gbGluZXMgbGlrZToKKyAgICAgICAgIyBXVy5YWFgKKyAgICAgICAgIyBZWS5aWloKKyAg
ICAgICAgIyB3aGljaCBuZWVkIHRvIGJlIHNlcGFyYXRlZCBhbmQgY29tcGFyZWQuCisgICAgICAg
IGlmIHN0YXQ9JCggc3RhdCAtTCAtYyAnJUQuJWknIC0gJF9sb2NrZmlsZSAwPCYkX2xvY2tmZCAy
Pi9kZXYvbnVsbCApCisgICAgICAgIHRoZW4KKyAgICAgICAgICAgIGxvY2FsIGZpbGVfc3RhdAor
ICAgICAgICAgICAgbG9jYWwgZmRfc3RhdAorCisgICAgICAgICAgICAjIG1hdGNoIG9uIGxpdGVy
YWwgbmV3bGluZQorICAgICAgICAgICAgZmRfc3RhdD0ke3N0YXQlCisqfQorICAgICAgICAgICAg
ZmlsZV9zdGF0PSR7c3RhdCMqCit9CisgICAgICAgICAgICBpZiBbICIkZmRfc3RhdCIgPSAiJGZp
bGVfc3RhdCIgXSA7IHRoZW4gYnJlYWs7IGZpCisgICAgICAgIGZpCiAgICAgICAgICMgU29tZSB2
ZXJzaW9ucyBvZiBiYXNoIGFwcGVhciB0byBiZSBidWdneSBpZiB0aGUgc2FtZQogICAgICAgICAj
ICRfbG9ja2ZpbGUgaXMgb3BlbmVkIHJlcGVhdGVkbHkuIENsb3NlIHRoZSBjdXJyZW50IGZkIGhl
cmUuCiAgICAgICAgIGV2YWwgImV4ZWMgJF9sb2NrZmQ8Ji0iCi0tIAoyLjI0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
