Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBDEFE5E8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhX9-0001S0-Sx; Fri, 15 Nov 2019 19:45:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhX7-0001R7-H3
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:45:29 +0000
X-Inumbo-ID: 6c90e576-07e0-11ea-b678-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c90e576-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:06 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z23so9018171qkj.10
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+D3dXLMNwiMvNOw7Ex7Mwtiy4OdwQ8VSO0q/w4NLMs=;
 b=c27jSecjkQJFdWQ9qVPnLGwZFgnIfADW1fy6Z8DwOsiv8LIarDbVNAxDs2y0YpnVHT
 OovuzlqQLaTL15Q2ISYFnldHAKd+IM3gtFRdy6F3pIwAmD4l/6Gr3CRBw5Xm7SaLO/xF
 WqQMnlkE1voWiVXUrmM3atYq2wLSDGXZQ44LLbV+YhG2a+UFOMzjI4/vFqAfJd/xJNK5
 BioG/rON3/nVgPJvCNhDx8KFA+Kli9WuImUDZcdqSyZxestARn7Qt9mhkhZqxpur0lPr
 ZyiDuRp0anNO1zWYJsoLQug00nG+m7WgPfPZNR1GEA+CfviQDR0H+dtaxENxFDUKixmQ
 lJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+D3dXLMNwiMvNOw7Ex7Mwtiy4OdwQ8VSO0q/w4NLMs=;
 b=Khy3FI3tpm5TOe05tBgx3DhT51wjiLCZrc8Spz6pmCUOlwErbh7RSEAfbK8qsvFZQv
 Gz3ZJv7mgPDWs7xnpAmxOaw7FKlDaJvZpINiR1JbvfDJTia7nbU3jGaD8FM1g+f8bFso
 MtaCQFC3qocJGNTyfnpfe3FBZ7YWFof+9hiuKRGA6nxzfoZsKHXfuABI/u4fuwvNLhMR
 soqz2lWSDqwTwarQXgxvG79XaON+nlX59wgrVYgZu2UnX+9B4Yy9GMWMLN11l64pGTud
 NwtAFsXALAhGlFMaDW/vJmNAD58d1xy84fyIRMgR84zOfL3Du2hlLWzRbmiiPu8tMg7F
 9VFw==
X-Gm-Message-State: APjAAAUgbq7yQI1tDfRfyr1z1FSGpIdDVxazBjQQRTZhZar67YiRVrS7
 AwrHXfI28mDvL5ZVhaG4Jn/dcP2B
X-Google-Smtp-Source: APXvYqyJk+68pGRGEPVra5iaCU43gtDpdSScxnEQFrHu3gXnXaA1A1AjL0bzqNbE/O5EpsJjULJtaQ==
X-Received: by 2002:ae9:e8c5:: with SMTP id a188mr13988570qkg.17.1573847105681; 
 Fri, 15 Nov 2019 11:45:05 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:04 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:13 -0500
Message-Id: <10f1969a1431879c2f1f4bdbcb3f29a3dd81ea6d.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/22] golang/xenlight: define StringList
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBTdHJp
bmdMaXN0IGFzIFtdc3RyaW5nIGFuIGltcGxlbWVudCBmcm9tQyBhbmQgdG9DIGZ1bmN0aW9ucy4K
ClNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0t
LQpDaGFuZ2VzIGluIHYyOgotIERlZmluZSBmcm9tQyB3aXRoIGEgcG9pbnRlciByZWNlaXZlciBz
aW5jZSBhIG5ld2x5LWFsbG9jYXRlZCBzbGljZQogIGlzIGJlaW5nIGFzc2lnbmVkIHRvIHRoZSBT
dHJpbmdMaXN0LgoKIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDI5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwppbmRleCAxYzVlM2MwY2M3Li43MmFmYzNjZjE0
IDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCkBAIC0yMTIsNiArMjEyLDM1IEBAIHR5cGUg
S2V5VmFsdWVMaXN0IHN0cnVjdHt9CiBmdW5jIChrdmwgS2V5VmFsdWVMaXN0KSBmcm9tQyhja3Zs
ICpDLmxpYnhsX2tleV92YWx1ZV9saXN0KSBlcnJvciAgICAgIHsgcmV0dXJuIG5pbCB9CiBmdW5j
IChrdmwgS2V5VmFsdWVMaXN0KSB0b0MoKSAoY2t2bCBDLmxpYnhsX2tleV92YWx1ZV9saXN0LCBl
cnIgZXJyb3IpIHsgcmV0dXJuIH0KIAorLy8gU3RyaW5nTGlzdCByZXByZXNlbnRzIGEgbGlieGxf
c3RyaW5nX2xpc3QuCit0eXBlIFN0cmluZ0xpc3QgW11zdHJpbmcKKworZnVuYyAoc2wgKlN0cmlu
Z0xpc3QpIGZyb21DKGNzbCAqQy5saWJ4bF9zdHJpbmdfbGlzdCkgZXJyb3IgeworCXNpemUgOj0g
aW50KEMubGlieGxfc3RyaW5nX2xpc3RfbGVuZ3RoKGNzbCkpCisJbGlzdCA6PSAoKlsxIDw8IDMw
XSpDLmNoYXIpKHVuc2FmZS5Qb2ludGVyKGNzbCkpWzpzaXplOnNpemVdCisKKwkqc2wgPSBtYWtl
KFtdc3RyaW5nLCBzaXplKQorCisJZm9yIGksIHYgOj0gcmFuZ2UgbGlzdCB7CisJCSgqc2wpW2ld
ID0gQy5Hb1N0cmluZyh2KQorCX0KKworCXJldHVybiBuaWwKK30KKworZnVuYyAoc2wgU3RyaW5n
TGlzdCkgdG9DKCkgKEMubGlieGxfc3RyaW5nX2xpc3QsIGVycm9yKSB7CisJdmFyIGNoYXIgKkMu
Y2hhcgorCXNpemUgOj0gbGVuKHNsKQorCWNzbCA6PSAoQy5saWJ4bF9zdHJpbmdfbGlzdCkoQy5t
YWxsb2MoQy51bG9uZyhzaXplKSAqIEMudWxvbmcodW5zYWZlLlNpemVvZihjaGFyKSkpKQorCWNs
aXN0IDo9ICgqWzEgPDwgMzBdKkMuY2hhcikodW5zYWZlLlBvaW50ZXIoY3NsKSlbOnNpemU6c2l6
ZV0KKworCWZvciBpLCB2IDo9IHJhbmdlIHNsIHsKKwkJY2xpc3RbaV0gPSBDLkNTdHJpbmcodikK
Kwl9CisKKwlyZXR1cm4gY3NsLCBuaWwKK30KKwogLy8gQml0bWFwIHJlcHJlc2VudHMgYSBsaWJ4
bF9iaXRtYXAuCiAvLwogLy8gSW1wbGVtZW50IHRoZSBHbyBiaXRtYXAgdHlwZSBzdWNoIHRoYXQg
dGhlIHVuZGVybHlpbmcgZGF0YSBjYW4KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
