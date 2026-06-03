Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2mO6AgL4H2qptQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:46:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1663649B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=PhQsFJoz;
	dkim=pass header.d=arm.com header.s=selector1 header.b=PhQsFJoz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=2")
Received: from list by lists.xenproject.org with outflank-mailman.1325985.1591370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiBA-0008A2-Sm; Wed, 03 Jun 2026 09:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325985.1591370; Wed, 03 Jun 2026 09:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiBA-00087K-PR; Wed, 03 Jun 2026 09:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1325985;
 Wed, 03 Jun 2026 09:46:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wUiB9-00087C-6T
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:46:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUiB8-00FJOM-JA
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:46:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1ff7e2-2eae-0a2a0a5409dd-0a2a4503de9c-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:46:26 +0200
Received: from [40.107.159.67]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1ff7f2-672d-0a2a45030019-286b9f435a67-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:46:26 +0200
Received: from DU2PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:10:232::12)
 by DU0PR08MB9371.eurprd08.prod.outlook.com (2603:10a6:10:421::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:46:19 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::5a) by DU2PR04CA0067.outlook.office365.com
 (2603:10a6:10:232::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 09:46:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 09:46:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB5PR08MB10286.eurprd08.prod.outlook.com (2603:10a6:10:4a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:45:12 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 09:45:12 +0000
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
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IkjDPULBruaBfWkJIWnVpUmDiKyqB9w12YNxfaJpZujhRaL4VtNE8IQXkEQBfKSelntLMSbn7B6aItGqISR7TdlJCZRwWcotBRAtMkprjwR1TwVoR2mkpEXyCCo//WSShJhbTR/jpf+8xpFAeFMtATvbO0FdVGN5+w51NI4RinwkECy0uK5bnmqLLmQO2YFfQwJpzIUDzv9xKmdvBYbFuNLJhzjpcrxZJ4J8hGtjyTftuRrvpRRKJQEZ9n9BFOgBQMtGZY1ftQ7SFpQh7bbYQWYmjGoHoNGW776NHKzsBVuw/k1B00H0uHj+5WMx251WXgaPIEjEOhDMDe+LCBT3fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K04SnNvmuoqXDdseWyzW0mo5KOoIZOSJ89VXARP0bo=;
 b=m4ytC1cEjeeSbZoMy4x/DJDghY0G/5Gq5rdF5jb5yHMOk5rQr2aS7bAyq1FZ5EmUawqTsz4CPUPx9enFfOLF9vLTgiECyHawOue4B4sJY4MsN2I4Pk9tSnPoZmycGWwQDodkmHwY7ZqY1hEI4RgXntGwlT2K9iTxE4+ZJ4/pp1u01POsaQ+sF0wBqJcXwX+gzuhsSgWSOjoEb9+k3fa1kIukP1DkKNhUMaRONwCWgcgfQAO8xmwh9Mu79N4XMak2MitcwRpekRim5LhEE1vJMXnyARpjXl0lDeLK84WGOj26isOR9fRfaN7J3ZSPMslPEQYEwvus8Ev7NVk24I2DZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K04SnNvmuoqXDdseWyzW0mo5KOoIZOSJ89VXARP0bo=;
 b=PhQsFJozataDK2zCXzKn1ubVJUBXEeAnSvdnpnDfN/L8PXA8eK1lFUwCmt0uGzSEOupP9xrxFYT/ALlB1s85w5eafnjg2gmZ8jaZK2iFqmJctY9mB70AW4ZdLceepBTxqAbzcIzPZgW86hcTrdDu5NwPCkC1NYD9jQr7oYz6Mwg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGhDdIlozrCzt70HvWHSjEoHDDjfobjGVQgqAaWgUulWULepHmTk8/9f5fbOnELeWI8EXLQMvgsYGx9Z7qNM71sAWHMumzdF9uzG1dx0bLYOSZib0+BKQ5M+Dk4pN1p8FGEfwcCfe2tMWS0GDPOcViuq7ZminWpjB/5F/HvVX/Rq+j85tQeNk8dpCqaESq6Gngq6Wnkou52N3aKhnKoPUqd1Bl72Rr4Gx+pdvWKSvBPy/OPgKDsbHCMJLMN8hn+TwOpE7aynjRkYybgenYiLdJmRmnaI1qRE/JpUoU2bam3dny+OBhJeYCKuYxa5oYK+7bUydiObiyhn9iDkkaicPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K04SnNvmuoqXDdseWyzW0mo5KOoIZOSJ89VXARP0bo=;
 b=VnFsz7Tj7wFAYLomoL/nAMJM40TlcXY24imC2KohW6fA5nMEiORTyWbmgng9LOMQSdLUsb3181XQWoa7ixvc46s3HeTHqInXEckwTKWWmcAdfIrgYeEN1/Acc/T9+FpgFUkBq/funw8u/mfQKqJR172+CxLG89HJlLq3hJuIj0neapILd4ghoGau52TUVA1iTuvT4NPjBg0UDLp8CDDU7/DaRIACZ0hHqk2FRa2CEVZIssC4L1rqe3Wv/3LnxeluXyhwjyJniNSEyAU2cH67I3yv5g5AgiHc4TMjXrHcFe7ficgMlb3iVTDxj00n27Affk1+g8dgpMn0l5mT6vR5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K04SnNvmuoqXDdseWyzW0mo5KOoIZOSJ89VXARP0bo=;
 b=PhQsFJozataDK2zCXzKn1ubVJUBXEeAnSvdnpnDfN/L8PXA8eK1lFUwCmt0uGzSEOupP9xrxFYT/ALlB1s85w5eafnjg2gmZ8jaZK2iFqmJctY9mB70AW4ZdLceepBTxqAbzcIzPZgW86hcTrdDu5NwPCkC1NYD9jQr7oYz6Mwg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v10 05/13] xen/arm: gic-v3: add ITS suspend/resume
 support
Thread-Index: AQHc6UoGT/kfd1Pv6US/NK5RLp1zNLYjx+kAgAig8gCAAD/FAA==
Date: Wed, 3 Jun 2026 09:45:12 +0000
Message-ID: <0A9E84AD-4F23-4016-BEF2-03A308427CFD@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <95930674d4639727b9cdf4f52b4a23b6df60c3c4.1779385072.git.mykola_kvach@epam.com>
 <E775FD70-C4FB-41BD-AE73-BA6383148546@arm.com>
 <CAGeoDV8FFtayxYsNAhf_NeG6234-uU7dTPg+je91NrWJ+JCHbA@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8FFtayxYsNAhf_NeG6234-uU7dTPg+je91NrWJ+JCHbA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB5PR08MB10286:EE_|DB1PEPF000509F3:EE_|DU0PR08MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f473551-8405-4b15-d161-08dec154f689
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 G8S/1RrXIhyOeNeasHANZm6rXiKzBo9/FK5AHSUIFnH22vEgjtW0iW6QbZQ/Q0vG1RmC6dciPanFcOGljpg+oKQMQhE8hg7xH9IZaJLz23DKMdjf1OSaH/hhGv6DzqcX+y7YApuIHsq+m95E0nK7SWLep+jFSB4+cXJV94Ig3BCuBr/Jdh4UzOcsCL35rD5cur4KMDbYNB08V2QgmYq0/1QXwuE2GYoQj3NKbftDcJV8z3gy7wrIN2f8RzEtOyNyKq6WrFD3Gq28iA9c9MerLEnDVvn1FxGdbGCccBwa/+UleJIdOU4Hl7GqMV+dICkHUErzoLSyodcMKC5flUsiez0KteQWP6zJMuoQxWlKugX7Ab0yu7DvyKDHANb69wZSBSrNd+qRksQFiB8ffGYX9MjKvanbMi98aUjCo98ASdcWrrqCVYQOaFHULh19ebEtZstb/3ZTuKeNCoDgHHHw0RO6afaeFEdvlQYXme9yu9IEuusaYNIXtmKc/M9TZY1DLlAr0ADbZBWYirfZxABzpY6oZyzXm159zCugHyT2XDQvGGFo2O7eKodw6arnuGu36Lolyef7y4zb5SIS1Xq06HOHGqJlspcrwTvPj66wdgAw6PwPCbm8CPoW2eP9ORP7Hi78OlzWYUzPf9429jj/w1R3u3W2UBqfw4tXRROQUSotqsRV2CKZUGZXiUWUkYsRXcRJK3WVgE+++1oDgiIE2dpqYrYV0wyAmZFBYq8FfmCryJhwZjXxMa3QHi368OUB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DF52E5A28C722439F1A8404CE1131A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 aCppl53QxDptS9vPW/BvCtDpyZX7PCJFgX3jt2J3yD7/gy9BlyGcW3gyV6dBzvQ7nxl4OXCXmHiEOVIUo1F70h21Of1HqjuDOOyShidg/yRLkZMhGiGIPdn0NGkhXXX+Z8+qOnBuZ4zf/Ofa3Lqhnd3N8kG3hJBsPhFlf+H7KavKAYggCHHsVbyUxkARor2kYzfP0pHHVKgzqm8Ke/lBxhsDxPvU95Rnw85OCGotyR9HPoRGMmpjvR5MmLinGzJzaAUjn77azyj0ifFSahYhFcNa8RyK/Rav1o4PboF8joTpDvtlEmbLaCXhrTYufblAqaOsUyxTO5YZdYCYWF8Amw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e7a378b-4c92-45da-33a1-08dec154cef2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|1800799024|376014|7416014|82310400026|14060799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XfGM0feYc66C6qfKDz/ArNVBBVE0ldJncxNwgo2xrgzU3T9nUM9hExTPUb2iB0Gl5vWaVWyrC54+dZPEAd9JYjvstzVs3T7mxhIq7cZQcY3yWMpRSplOEdz+Htb3kGv3p3VYqR55zIdwkpXXYndrIM/0GyMR1B+Lp39jMSkKCCPqjhOYNEPGQumb8Fu2QSl9EHO23g5hWmpQxttVSokjjZm7YxKb5FaEoQzUYDhnvWh6Mw+80b3AAQrTW+aWrVIAFp9VtzJ6aDS95hwLjwMc7sIDF4iQ+PUKJFd+eVv3G03wbICCcDIsSiNiqlT4O+Ba1qF6mUVsaSmvClz2Hs3ggIMSrGoxY/31Xrhd26eA7ENzP2F9iAejdh1XQ7lsyfMckvHKl/gcYkfKujFDQ2bENzGRNJIxbYS6vXB00KffuPAfNBL7gXeYvCGbEpdMu7vGrGsD/oDY1UF8QAHAL/pput+1KOE3d6by6oWWx0CWwcsWEdORJ4HQ+t9AouZw+x16edwYEfva61kjopB9HU1kcj7Ug0cp+70eNeOVrPA6pU6NlmGoX/fp4elh0/cMHeBs6uxG7WJ/UcTFWrNcbfZmi4SXU1uQ2BwErmol+o8bWYtbz68VpVwmsoGfJB1yPgxOhm6iI9UYO6PgnHfAfg4oOYQWOHVfW1RYxnTxhW/Jl93hFP769bQ3aCOmb1S1uswSjciWh609C+V2l9wTYRczX3h7NsWjmIT/7VzsksdVe/o=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(1800799024)(376014)(7416014)(82310400026)(14060799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gz7TROrR9U5QqISG6CZvl9xHSQlJYkAI/B8El6YPlSTKsjNG3MJUKKb387UQOMLvQzHxix06oX+n1NumQP0Kynm1fgoero8VOCSgZRB4T23AeSSv4rf2h2owmdw/6sBW7mX6qTl4cYeJIHDkEQ+17oWY24WRh8HTftbakUt0aGoWFAzMc0gyYZPklVhbjFSpCUQ+ATFGKJxImpd0r6YPQwY9ha9nBg2XEbYl37rM9gaScM/2a669BgmynHkT5jHL781Pjy18GXiZCtU0SVd6BUvjfCeTWmR8L7uaeam5f6SApb7n72/C+AlAMEOjTPnHl4IdyzPhyDAmN8d5MjDxWlW9uoF4fU7wbbvLYnJv4/STzcH7XucwPJ/Ugj3xfNX9xaJLZcZD7js9R07y4cb42WMzqmDPlj0RfWCkiRnCFfb7Udy+WqB02hAC+x2QBmep
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:46:18.9852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f473551-8405-4b15-d161-08dec154f689
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9371
X-purgate-ID: tlsNG-33051d/1780479986-36945938-DF5FE722/0/0
X-purgate-type: clean
X-purgate-size: 2940
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,arm.com:mid,arm.com:dkim,arm.com:from_mime,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49B1663649B

SGkgTXlrb2xhLA0KDQo+IE9uIDMgSnVuIDIwMjYsIGF0IDA2OjU2LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIFRodSwgTWF5IDI4LCAyMDI2IGF0IDk6MTLi
gK9QTSBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPj4gDQo+
PiBIaSBNeWtvbGEsDQo+PiANCj4+PiANCj4+PiArI2lmZGVmIENPTkZJR19TWVNURU1fU1VTUEVO
RA0KPj4+ICtpbnQgZ2ljdjNfaXRzX3N1c3BlbmQodm9pZCkNCj4+PiArew0KPj4+ICsgICAgc3Ry
dWN0IGhvc3RfaXRzICppdHM7DQo+Pj4gKyAgICBpbnQgcmV0Ow0KPj4+ICsNCj4+PiArICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkoIGl0cywgJmhvc3RfaXRzX2xpc3QsIGVudHJ5ICkNCj4+PiArICAg
IHsNCj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4+PiArICAgICAgICB2b2lkIF9faW9t
ZW0gKmJhc2UgPSBpdHMtPml0c19iYXNlOw0KPj4+ICsNCj4+PiArICAgICAgICAvKg0KPj4+ICsg
ICAgICAgICAqIEJ5IHRoZSB0aW1lIFhlbiByZWFjaGVzIGdpY19zdXNwZW5kKCksIGV2ZXJ5IGRv
bWFpbiBpcyBhbHJlYWR5IGluDQo+Pj4gKyAgICAgICAgICogU0hVVERPV05fc3VzcGVuZCwgc28g
SVRTLXRhcmdldGluZyBpbnRlcnJ1cHQgc291cmNlcyBhcmUgZXhwZWN0ZWQNCj4+PiArICAgICAg
ICAgKiB0byBoYXZlIGJlZW4gcXVpZXNjZWQgYnkgdGhlIG93bmluZyBPUyBiZWZvcmUgU1lTVEVN
X1NVU1BFTkQuDQo+Pj4gKyAgICAgICAgICovDQo+Pj4gKyAgICAgICAgLyogUHJlc2VydmUgc2F2
ZWQgR0lUU19DVExSIHN0YXRlLCBleGNsdWRpbmcgcmVhZC1vbmx5IFFVSUVTQ0VOVC4gKi8NCj4+
PiArICAgICAgICBpdHMtPnN1c3BlbmRfY3R4LmN0bHIgPSByZWFkbF9yZWxheGVkKGJhc2UgKyBH
SVRTX0NUTFIpICYNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+R0lUU19D
VExSX1FVSUVTQ0VOVDsNCj4+PiArICAgICAgICByZXQgPSBnaWN2M19kaXNhYmxlX2l0cyhpdHMp
Ow0KPj4+ICsgICAgICAgIGlmICggcmV0ICkNCj4+PiArICAgICAgICB7DQo+Pj4gKyAgICAgICAg
ICAgIHdyaXRlbF9yZWxheGVkKGl0cy0+c3VzcGVuZF9jdHguY3RsciwgYmFzZSArIEdJVFNfQ1RM
Uik7DQo+PiANCj4+IFRoaXMgaXMgd3JpdGluZyBlbmFibGUgZnJvbSAwIHRvIDEsIHdoaWxlIHF1
aWVzY2VudCBpcyBzdGlsbCAwLCB3aGljaCBpcyB1bnByZWRpY3RhYmxlLA0KPj4gaG93ZXZlciBp
dOKAmXMgdGhlIHNhbWUgaGFwcGVuaW5nIG9uIExpbnV4LCBzbyBJIHdvdWxkIGxlYXZlIGl0IHRv
IHRoZSBtYWludGFpbmVyIHByZWZlcmVuY2UuDQo+IA0KPiBJIHRoaW5rIHlvdSBhcmUgcmlnaHQs
IHRoYW5rcyBmb3Igc3BvdHRpbmcgdGhpcy4NCj4gDQo+IEFmdGVyIGdpY3YzX2Rpc2FibGVfaXRz
KCkgdGltZXMgb3V0LCB0aGUgSVRTIGhhcyBhbHJlYWR5IGhhZA0KPiBHSVRTX0NUTFIuRW5hYmxl
ZCBjbGVhcmVkLCBidXQgR0lUU19DVExSLlF1aWVzY2VudCBpcyBzdGlsbCAwLiBXcml0aW5nIGJh
Y2sNCj4gdGhlIHNhdmVkIENUTFIgbWF5IHNldCBFbmFibGVkIGZyb20gMCB0byAxIHdoaWxlIFF1
aWVzY2VudCBpcyAwLCB3aGljaCBpcw0KPiBVTlBSRURJQ1RBQkxFIGFjY29yZGluZyB0byB0aGUg
c3BlYy4NCj4gDQo+IFNvIHJlc3RvcmluZyBHSVRTX0NUTFIgaW4gdGhpcyBlcnJvciBwYXRoIGRv
ZXMgbm90IGxvb2sgc2FmZS4gV2UgY291bGQgZXh0ZW5kDQo+IHRoZSBxdWllc2NlIHRpbWVvdXQg
aWYgdGhlIGN1cnJlbnQgMTAwbXMgaXMgY29uc2lkZXJlZCB0b28gc2hvcnQsIGJ1dCBvbmNlIHRo
ZQ0KPiB3YWl0IGhhcyBmYWlsZWQgdGhlcmUgaXMgbm8gYXJjaGl0ZWN0dXJhbGx5IHNhZmUgd2F5
IHRvIHJlc3RvcmUgdGhlIElUUyBzdGF0ZS4NCj4gSW4gdGhhdCBjYXNlIEkgdGhpbmsgdGhlIHN1
c3BlbmQgcGF0aCBzaG91bGQgcGFuaWMuDQoNCnllcyBtaWdodCBiZSBhbiBvcHRpb24sIGJ1dCBi
ZWNhdXNlIHdlIHdvdWxkIGRpdmVyZ2UgZnJvbSBMaW51eCwgSSB3b3VsZCBsZWF2ZSBpdA0KdG8g
dGhlIG1haW50YWluZXJzLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

