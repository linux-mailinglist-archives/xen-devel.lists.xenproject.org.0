Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90294A50B25
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 20:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902677.1310713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpu9U-0006bK-Om; Wed, 05 Mar 2025 19:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902677.1310713; Wed, 05 Mar 2025 19:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpu9U-0006Yp-Kt; Wed, 05 Mar 2025 19:11:32 +0000
Received: by outflank-mailman (input) for mailman id 902677;
 Wed, 05 Mar 2025 19:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpu9S-0006AR-85
 for xen-devel@lists.xen.org; Wed, 05 Mar 2025 19:11:30 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c5ae67-f9f5-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 20:11:28 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1113514266b.3
 for <xen-devel@lists.xen.org>; Wed, 05 Mar 2025 11:11:26 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1ecafa17fsm368668266b.162.2025.03.05.11.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 11:11:24 -0800 (PST)
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
X-Inumbo-ID: a2c5ae67-f9f5-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741201886; x=1741806686; darn=lists.xen.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZaame9Ci028tUxlPLSZYIhVkogn4h4VCrJpnOsb3QI=;
        b=WmyGD0RaYXSCLECeQ5nkN6CqoVkEauRgRGSoNCsH4dMmYa5MlzA2mDiE9uBXT5cm2m
         4+OdGDHOoLThONEPGkwE9JiflPmorJq+sF6Q208dRJZXFuPQslidAJIWzKGfkpnQ4pNY
         JlEESiPpO363AFnmo0gZ2IHgh+S1cQBVJqlhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201886; x=1741806686;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZaame9Ci028tUxlPLSZYIhVkogn4h4VCrJpnOsb3QI=;
        b=dW2Uux1/v8176h8bdcn7lv5cKHyAzD/NT70w0f7LeY1Fpj2AFRSSoJZyMTcUgz+v5w
         XiDZlEp8oUI3ifK+NQ3aGtFPI3aZIZlSC7qQZye+Y3/U4+TdZDJpYyFhZd/C3gxJAHXq
         yipY7RBrFpBDB1+nVyRZDMELT4E3LZcjjEyPCCsWzBcCQA9/+qEuvwjnUSqaf8uqWtqV
         /Qmz9/sFI47oz/eKl9LeV/XXBaUSDXwqvxFgKAuUyAWwp7J8jHRfKHYN7faphcL/06hY
         Ql15pvVUMOIJfb3wZ6oF64eYShY4fNtx5ZKIV/0X/UBqbiA9corQVuRwVeXAse+V1tA+
         mQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsSTnL37mYbg/5xDDaAmfzEqXETqhFMWqFGTsYnzEpnb4ClYjno6p4alZ5KBQfLFw7n7F1VFntPNg=@lists.xen.org
X-Gm-Message-State: AOJu0Yw63RvED/aBZFAI2b26aC9f66ykFZoE7c6sImbEc/R+Nq/LUMC5
	Mc9wJLyjKHrGlQMm0XFk0Rt75NMFqSx7WwORm0AcTFN5Yy5wtjC8zgR2y+v0Km4=
X-Gm-Gg: ASbGncsEcg96iif7+Uh9lQ2d8dtOz6qEdSxjSjJlA7eY3hj/YAeX3b/mX1mDXaqVeuK
	2YIZVoc7qUt7slLjrCZYQCYRQvGGk2ZnJMaXjuwxDO+v/Qhs74zHqdIpPjlXiJdgbvVp2CU4/aA
	HPr7vfkweiHf4kDj3L5+2Dh7Bcph7NQI5r9a628gmoxZ4lvXCtJ+ILw/4J0O+h1C7SWTXFuLedK
	Pt0gUhTj4h4PEW1j7YfEWHdoUNuX0Y8Bx2cM+18mIE414gHPOXrLZjnGZoRYknJg+ZWBbJuB9jh
	s1ygtVvrrnuHicqV+vO6e+qSTcZ3kEVJ/LP/8KborxnP2VIlHTzmepWuOUfj2UapWVng0xzGfnh
	I9sj4hMTU
X-Google-Smtp-Source: AGHT+IE4Oj0YBaW1g1qsSSQnSSCOaSMQmxLzlg0vhrLzGeXWTn120/RwT20dUywm3p5AOlyDXi21Kw==
X-Received: by 2002:a17:907:3f25:b0:ac1:fcda:78c1 with SMTP id a640c23a62f3a-ac20d97e6b7mr466336266b.34.1741201885183;
        Wed, 05 Mar 2025 11:11:25 -0800 (PST)
Message-ID: <b3afc964-2840-4583-bb39-e05d390d3e55@citrix.com>
Date: Wed, 5 Mar 2025 19:11:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "xen-announce@lists.xen.org" <xen-announce@lists.xen.org>,
 Xen-devel <xen-devel@lists.xen.org>,
 "xen-users@lists.xen.org" <xen-users@lists.xen.org>,
 "oss-security@lists.openwall.com" <oss-security@lists.openwall.com>
Cc: "Xen.org security team" <security-team-members@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Xen Security Notice 2 (CVE-2024-35347) AMD CPU Microcode Signature
 Verification Vulnerability
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See:

https://bughunters.google.com/blog/5424842357473280/zen-and-the-art-of-microcode-hacking
https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7033.html

Right now there are four known but (reasonably) benign microcodes from a
non-AMD source.  However, there is a tool to sign arbitrary microcode.

In Xen, we've provided a stopgap mitigation to perform extra checks on
microcode load on affected CPU families.  This is a SHA2 digest check
against hashes with believed-good provenance.  This is staging only for
now, in case it is overly disruptive.

This will not protect against an already-compromised platform, but it
will prevent an uncompromised system becoming compromised via Xen's
microcode loading capabilities.

On affected systems, the only complete fix is a firmware update.  This
is a very firmly recommended course of action.

Sincerely,

~Andrew, on behalf of the Xen Security Team.


