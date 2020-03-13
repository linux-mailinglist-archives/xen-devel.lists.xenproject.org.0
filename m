Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C2184DAB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 18:31:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCo7G-0007yv-N3; Fri, 13 Mar 2020 17:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72WQ=46=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jCo7F-0007yl-Fa
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 17:28:57 +0000
X-Inumbo-ID: 1e5abfd0-6550-11ea-a6c1-bc764e2007e4
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e5abfd0-6550-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 17:28:56 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id ca9so4999350qvb.9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=6vS0Lf7SFRw24mYq5N+yzP2+RhNl0bAwMh/6GHSwQPw=;
 b=LO0prd0ZuzjS8hFM2MRMjTK1Ln3EWwpiXrvd/YXZVCavSjjdTpXc8xyOeImyunUg09
 1lTAMfh4IVziVvXu+x93w+6CjDYI2n1zR42v9iSI3QHq7WwBf189on7CLFsaUslRLbIY
 yy9IVEOB1a/GTfWaAosau7UE+/j9I8EsJQntjJa5vL8V1r+hoozlfRlt+qSPPDf/wBEc
 FIacx5KE20PJ0LTSwlywCOyqajakLUDWWjGl+gzYhgnmi0CfXiYsy1wUw0IKnOk7LaeV
 aggz+sBVHAyw41Acd2bHk19LfjfpJ5v5eD9nb4Mxs7fJLiKZm5wLOwaQqozHWgUtkdV1
 +oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=6vS0Lf7SFRw24mYq5N+yzP2+RhNl0bAwMh/6GHSwQPw=;
 b=HG7Y+fDs3PI7/B4I87tG+LcufY/3mYv8mgEbbzS08sivNQ1BsDIBB1T0+IUfsh0Jcy
 RmmtM+c2oj1sc3Qrv21xqvq1X920i6CF440Ge5vuniQqx2nVWSnogTa4JgCi6z+gCl2E
 V2e5pffASKJq4rSQFV1wSTXcYHJAG8rY/3gJr90N2R1W2TikCRcyDl4Co9atTESvekgp
 Vbx3gEmKTeeblvb0zAlnpXGUeDMD1M+amjUGXkgVK4ZZaFnjUiA6zS2s/eEdt7yWY7Wc
 LJGk7qht5YATz8q4QL9bOWMcs+G6cufQMbZs9LzdJPgRMrXsk1khT0Udg5vrhpkpXa8O
 KKdg==
X-Gm-Message-State: ANhLgQ3kd5Jr6EQ9ViZ6hQFvTD1qiG2th/U3f/cHxP1tkKn6DgjUTzCo
 tgBBXaQ8zcUVl/5l49+wUmJbv2c5mNc=
X-Google-Smtp-Source: ADFU+vsjuYBeU3O/dH5McdEA4opiAoIB4397AkRPLUDM+nefh9kRym3hlOWBZFw8ujM5hplm739saw==
X-Received: by 2002:a05:6214:427:: with SMTP id
 a7mr7527708qvy.10.1584120536205; 
 Fri, 13 Mar 2020 10:28:56 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id t55sm31137723qte.24.2020.03.13.10.28.55
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 10:28:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 17:28:53 -0000
Message-ID: <000001d5f95c$df50ce60$9df26b20$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdX5XFaqWOYGCC5sR7uOuU8VgNQ/GA==
Subject: [Xen-devel] xenoprof
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
Reply-To: paul@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgogIEknbSB0cnlpbmcgdG8gZGV0ZXJtaW5lIHRoZSBzdGF0dXMgb2YgSFlQRVJWSVNPUl94
ZW5vcHJvZl9vcC4gVGhlIGNvZGUgYmVoaW5kIGl0IGFwcGVhcnMgdG8gYmUgdW5tYWludGFpbmVk
IGFuZCBJIGNhbm5vdCBmaW5kIGFueQpzdXBwb3J0IHN0YXRlbWVudCBmb3IgaXQuIEdvb2dsaW5n
IGFyb3VuZCBmaW5kcyBzb21lIG1lbnRpb25zIG9mIFhlbiBhbmQgb3Byb2ZpbGUgYnV0IGl0J3Mg
bm90IGNsZWFyIHdoZXRoZXIgaXQgd29ya3MgYW5kIG1vc3QKcmVmZXJlbmNlcyBJIGZpbmQgYXJl
IHF1aXRlIG9sZC4gSXMgaXQgdGltZSB0byByZW1vdmUgaXQ/CgogIFBhdWwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
