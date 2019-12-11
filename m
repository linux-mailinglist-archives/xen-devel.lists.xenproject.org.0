Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FEB11A36C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 05:28:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ietYW-0004pJ-DB; Wed, 11 Dec 2019 04:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qa45=2B=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ietYU-0004pA-LA
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 04:24:54 +0000
X-Inumbo-ID: 2dc4b528-1bce-11ea-b6f1-bc764e2007e4
Received: from mail-pj1-x1043.google.com (unknown [2607:f8b0:4864:20::1043])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dc4b528-1bce-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 04:24:53 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id ca19so8393406pjb.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 20:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCFfqgYBUHORRZAXz0u1t9CrHuOIZanYgjOuQc5MI40=;
 b=C44Wii177/uMXj8Mmpff75pIIpPmcFQwgaPEBWdhU7hQoVs+n+MJmNVNXMIXxLKrDW
 9edlLaBI8+4/iTI92+z4856xb/GnEtBWETNGkQoETSY1ukQfDLyf1VBC8KJYkxgqNnsy
 RToZcu66XFgKlic4ml2Myo0UmaR0d9p7fz0H3FFXyqx6cIbs6ak8F+6PaafLfnHpEndi
 VE2qIisgz8HptNV+CctKjKEmv1VgmuSPN/AzM+ZHKdr6OYdzt8J8iHX9wmiYNQ8Kd8eT
 9wBkfOh2n0qOb//QX1kgNqn6infiNH2mbzaHgYI6sAU7u1sGZ6T/ncUH97nJASNvkNMn
 +jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCFfqgYBUHORRZAXz0u1t9CrHuOIZanYgjOuQc5MI40=;
 b=Ij4pHvk6fL0ngNeDG3LW9WZjyJuEDwT6uh4rNua4XKq7yOhvnidBokx/Bbld4IrbIP
 gwcVoNYQSJWiHoynSGQsozhlIzWrfWIHFID19XsCtk6paitXJ7dUVqCmsTiKnu7EuypH
 KmIWuXu5NbEMntAh7oVMdnRMSqHUZje+tza1Zmj8BQtk9f7uHr5lP+lL0b3iPgtPoha5
 oBbm9EqmRzI9RBfior0Vo2bmNLF1dEFBo+fW4I57ZYCIcTbdBi41+H7/FyXPT9fpsKl/
 sEuI4AIwJ83Dukn2dwHO2W405VyP11wBPoq/2Gt0q9AX0t1lORjErYCkiheHdn/a/D4F
 UT8A==
X-Gm-Message-State: APjAAAVNe/9ONgtBpbgB3mbb1lNvN4RHztrEMXPEiYXhAqdR6LDCytqL
 1LnHBcAHXrRwH6NaTH/vir8=
X-Google-Smtp-Source: APXvYqwuDHvHi0kuhv5k7XhTYVm0P1tUAaFRdqch3kOwlNDt+3YGwFscAsMaal2g+E/WWOX862OunA==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20mr1095998plp.54.1576038292830; 
 Tue, 10 Dec 2019 20:24:52 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id z23sm586738pgj.43.2019.12.10.20.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 20:24:51 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Wed, 11 Dec 2019 04:24:25 +0000
Message-Id: <20191211042428.5961-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/2] xenbus/backend: Add a memory pressure
 handler callback
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
Cc: sjpark@amazon.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sK
ZmxleGliaWxpdHkuCgpUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIHBhdGNoc2V0IGFk
ZHMgYSBtZW1vcnkgcmVjbGFpbSBjYWxsYmFjawp0byAneGVuYnVzX2RyaXZlcicgKHBhdGNoIDEp
IGFuZCB1c2UgaXQgdG8gbWl0aWdhdGUgdGhlIHByb2JsZW0gaW4KJ3hlbi1ibGtiYWNrJyAocGF0
Y2ggMikuICBUaGUgdGhpcmQgcGF0Y2ggaXMgYSB0cml2aWFsIGNsZWFudXAgb2YKdmFyaWFibGUg
bmFtZXMuCgpCYXNlIFZlcnNpb24KLS0tLS0tLS0tLS0tCgpUaGlzIHBhdGNoIGlzIGJhc2VkIG9u
IHY1LjQuICBBIGNvbXBsZXRlIHRyZWUgaXMgYWxzbyBhdmFpbGFibGUgYXQgbXkKcHVibGljIGdp
dCByZXBvOgpodHRwczovL2dpdGh1Yi5jb20vc2pwMzgvbGludXgvdHJlZS9ibGtiYWNrX3NxdWVl
emluZ192NgoKClBhdGNoIEhpc3RvcnkKLS0tLS0tLS0tLS0tLQoKQ2hhbmdlcyBmcm9tIHY1Ciho
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1ibG9jay8yMDE5MTIxMDA4MDYyOC41MjY0LTEt
c2pwYXJrQGFtYXpvbi5kZS8pCiAtIFdvcmRzbWl0aCB0aGUgY29tbWl0IG1lc3NhZ2VzIChzdWdn
ZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7DqSkKIC0gQ2hhbmdlIHRoZSByZWNsYWltIGNhbGxiYWNr
IHJldHVybiB0eXBlIChzdWdnZXN0ZWQgYnkgUm9nZXIgUGF1IE1vbm7DqSkKIC0gQ2hhbmdlIHRo
ZSB0eXBlIG9mIHRoZSBibGtiYWNrIHNxdWVlemUgZHVyYXRpb24gdmFyaWFibGUKICAgKHN1Z2dl
c3RlZCBieSBSb2dlciBQYXUgTW9ubsOpKQogLSBBZGQgYSBwYXRjaCBmb3IgcmVtb3ZhbCBvZiB1
bm5lY2Vzc2FyeSBzdGF0aWMgdmFyaWFibGUgbmFtZSBwcmVmaXhlcwogICAoc3VnZ2VzdGVkIGJ5
IFJvZ2VyIFBhdSBNb25uw6kpCiAtIEZpeCBjaGVja3BhdGNoLnBsIHdhcm5pbmdzCgpDaGFuZ2Vz
IGZyb20gdjQKKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MTIwOTE5NDMw
NS4yMDgyOC0xLXNqcGFya0BhbWF6b24uY29tLykKIC0gUmVtb3ZlIGRvbWFpbiBpZCBwYXJhbWV0
ZXIgZnJvbSB0aGUgY2FsbGJhY2sgKHN1Z2dlc3RlZCBieSBKdWVyZ2VuIEdyb3NzKQogLSBSZW5h
bWUgeGVuLWJsa2JhY2sgbW9kdWxlIHBhcmFtZXRlciAoc3VnZ2VzdGVkIGJ5IFN0ZWZhbiBOdWVy
bmJ1cmdlcikKCkNoYW5nZXMgZnJvbSB2MwooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRl
dmVsLzIwMTkxMjA5MDg1ODM5LjIxMjE1LTEtc2pwYXJrQGFtYXpvbi5jb20vKQogLSBBZGQgZ2Vu
ZXJhbCBjYWxsYmFjayBpbiB4ZW5fZHJpdmVyIGFuZCB1c2UgaXQgKHN1Z2dlc3RlZCBieSBKdWVy
Z2VuIEdyb3NzKQoKQ2hhbmdlcyBmcm9tIHYyCihodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1ibG9jay9hZjE5NTAzMy0yM2Q1LTM4ZWQtYjczYi1mNmUyZTNiMzQ1NDFAYW1hem9uLmNvbSkK
IC0gUmVuYW1lIHRoZSBtb2R1bGUgcGFyYW1ldGVyIGFuZCB2YXJpYWJsZXMgZm9yIGJyZXZpdHkK
ICAgKGFnZ3Jlc3NpdmUgc2hyaW5raW5nIC0+IHNxdWVlemluZykKCkNoYW5nZXMgZnJvbSB2MQoo
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMTkxMjA0MTEzNDE5LjIyOTgtMS1z
anBhcmtAYW1hem9uLmNvbS8pCiAtIEFkanVzdCB0aGUgZGVzY3JpcHRpb24gdG8gbm90IHVzZSB0
aGUgdGVybSwgYGFyYml0cmFyaWx5YAogICAoc3VnZ2VzdGVkIGJ5IFBhdWwgRHVycmFudCkKIC0g
U3BlY2lmeSB0aW1lIHVuaXQgb2YgdGhlIGR1cmF0aW9uIGluIHRoZSBwYXJhbWV0ZXIgZGVzY3Jp
cHRpb24sCiAgIChzdWdnZXN0ZWQgYnkgTWF4aW1pbGlhbiBIZXluZSkKIC0gQ2hhbmdlIGRlZmF1
bHQgYWdncmVzc2l2ZSBzaHJpbmtpbmcgZHVyYXRpb24gZnJvbSAxbXMgdG8gMTBtcwogLSBNZXJn
ZSB0d28gcGF0Y2hlcyBpbnRvIG9uZSBzaW5nbGUgcGF0Y2gKClNlb25nSmFlIFBhcmsgKDIpOgog
IHhlbmJ1cy9iYWNrZW5kOiBBZGQgbWVtb3J5IHByZXNzdXJlIGhhbmRsZXIgY2FsbGJhY2sKICB4
ZW4vYmxrYmFjazogU3F1ZWV6ZSBwYWdlIHBvb2xzIGlmIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRl
dGVjdGVkCgogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgICAgICAgfCAyMyAr
KysrKysrKysrKysrKystLQogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jICAgICAgICB8ICAz
ICsrLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAzMSArKysr
KysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
