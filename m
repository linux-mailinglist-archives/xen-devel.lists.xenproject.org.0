Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F3B18069
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067123.1432076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnJJ-0004lr-Uy; Fri, 01 Aug 2025 10:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067123.1432076; Fri, 01 Aug 2025 10:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnJJ-0004jg-S5; Fri, 01 Aug 2025 10:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1067123;
 Fri, 01 Aug 2025 10:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wfco=2N=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhnJI-0004ja-Gm
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:48:24 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc861da-6ec5-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:48:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 10:48:21 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 10:48:20 +0000
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
X-Inumbo-ID: 0bc861da-6ec5-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsmMG+kkxp3RaEUQla0+TIyeUCggUgwKpqY3Rni8O8vucmVmNtjT4NtRVnnywGDkrnj22iB2x69Um/XIhkn4Chj3TXuHplAaT2tXrxfNqGdtEaowIPVnROcLkE5IYQ5irkRH7e0I30M0u740vOkEJj1CP0+WqYnf0/bIgUSBgXXuLUictywwCbEAubmJNc5c9YGaVOSAIVOpmoMPz5IZXn0epiFuKucgOHb7ExFXI4A4oBGhhSmulKwIM8Hf8B8qXyi8zITJOYZu4YXkE78HSav2vncHsbyRPBOBdsIxRqXQJ3tXvG26ZV6CuH+H7awvOxphm959EE/mJw0j57TnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4obgRldKztBeedY3Mhnyl9hDQzwLPM0SxQl0RNo53Iw=;
 b=ierXCsV2YNi954oVLtSeth+1NnVVy7K5ccn8RipB5aGEm115f2GnrQ1MBfpoROqoHpiyIcr9OPz4NW4nEIoFobiVy5zZTP88sATt3FNaJgthEii1sdeWa766vtmitZ8i5Md1UgW7iDJXFeaM2DcODJUGYHsRarVxTOnA2vs1IDh9v5XVZvetfI+VeZPp0L56mEI7W2kzbyeHTCENbfqgaw1IiRLe4p2p7imrcOfxfANvrzZzbMiY6JqCE/Z/1nuXj3bg7r7sPVYOgX4+2Zom2GiwReA2fvMg8ylsYTnV56zYNjZFjPfW+Oeq1K16VUGyhrgIjeDzaX3Bad+RIg608A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4obgRldKztBeedY3Mhnyl9hDQzwLPM0SxQl0RNo53Iw=;
 b=H8wLvQCVvY6wB3JNSXbrcJN4J2oiSalqtvdygX8/olA5NxgYRByUjokYEjaTNampPWI/1taCqZOn5M/k32EUEI0CQ/5OJRGucY0oQO24lG8Nho/AlsHHk3tEXKtdiwz+KW/UWUURNs3AK+xzK2s+nffYtzdeUSdoekTjpKDom5RbYVWzCqTLakfYIhMMv2S6DfWFRFHmEYVGj+hYQBklfOXqIzy+BAixSeWQnmYWlfPhN/Xan1nhq65QtvH3HCzYPiG4j5vTtcYo0slzNnbzjIR9BAI89wuB94KxJXqzOCaI39+IG64/Z67j/DBIixkWdVUzu1XwbOJF+0TfDxuZRw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v4] misra: allow discarding 'noreturn' during conversions
Thread-Topic: [PATCH v4] misra: allow discarding 'noreturn' during conversions
Thread-Index: AQHcAtHLnxwOVXCUr02VFN3cMhRppA==
Date: Fri, 1 Aug 2025 10:48:20 +0000
Message-ID:
 <c68de6862ee6d3d6f33eee4db278096c833c17e0.1754043159.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB6916:EE_
x-ms-office365-filtering-correlation-id: 5f687e44-4b66-4295-36f4-08ddd0e8ee82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5HeFsIoqTa+Z8VklrJoeApo74smVI+mllO5sgkOoJuttvq4AzqZd0uPDVy?=
 =?iso-8859-1?Q?KniqRLkHMzXtyR5tSUcNWXe/p+n2kydkRgTXqlMQRi6LxgYH5JrCJhDN7J?=
 =?iso-8859-1?Q?7CJc+I6/gpeK4gGvSTpqMKVK6zu6dMTHyH7pXMxrGGYLYOUqLbVKD3WLQV?=
 =?iso-8859-1?Q?nPam+eOeIFf5+1nZdRKWh+3DUMTEoOKO0DxL7m2yLEYgvF+oXEup6qw9ty?=
 =?iso-8859-1?Q?TJXVvHDE6DCoeSS5lPmvPVjXIFSisEJL+dOxw8GsKVy6xrcu2HF4N5ZK/J?=
 =?iso-8859-1?Q?gZbazer4qi7FiNfazYupLGkgXJS5OgjCNoVjV7WmTu1PwY+YgcLu2lup+e?=
 =?iso-8859-1?Q?QZdn9QQU02GMyXmm4TVlFeVEqbeKX1UK1fYTsENkjAnVYSlZtsPYofqezK?=
 =?iso-8859-1?Q?1Am8yCf3sarnsLpO2ooKWrJuieE3jmfCW1QJzjcF9q+Mnwim82s6P1zbl/?=
 =?iso-8859-1?Q?5ROkUId8o8djzq2XlkcJmjt8RuaDjf8m6e2CETS4K9Y+VKD3OIDL+mwDPZ?=
 =?iso-8859-1?Q?zXDTygElTpHl0Vkrwd1LFZJ3A6cR/fQ0dLTT3t+MK7dAm1a6oKEsWmrPAL?=
 =?iso-8859-1?Q?9zOnALV+0EWy7BAIuyXoVtIBhg3qld48jKZv6597SGhu3t64y3rdWbmN8q?=
 =?iso-8859-1?Q?32Hmd81hQfdFigtOzsffrjuX24vKSJfPMoEvyPmJ5dDjcFNCnG9qq6FOwu?=
 =?iso-8859-1?Q?bzDmfRBkjoUpYSi+qohAm03Y7b1NceRXulfq5GUBZgQWikt5AXAfZtvBvR?=
 =?iso-8859-1?Q?9BiCuMJGexQmIbkgcmUKKjmfedNxEye7hyk1+kUWgUH4lxaAndIy6TeKXF?=
 =?iso-8859-1?Q?QFHJJAhD3jXCCaC2yDsGwzVXikw9P1QtDuh7tLEpB8CbGEBQ0+ViGwIMbO?=
 =?iso-8859-1?Q?KxD2UyH0m47YSj+/AR861Dvr7foJp5bKetla6SuNLRdcgjNK117DKBXHZW?=
 =?iso-8859-1?Q?4Ll1u9zbs0u6wGFuci16dPLgYAQ9ZO4cT+MoXWvLq4SPmNWEDckmH/rRWX?=
 =?iso-8859-1?Q?F0K8DRba/Fvw33/MaeYO4jEJGbvdWHOMIgqYIm8G9vZrvVoOYcU8Y2wZI8?=
 =?iso-8859-1?Q?yljL55x7F6B4PHZSJ4IJ/lsVeasr0ia7m1SWRRuHXLk16OTr40ykdHnAwS?=
 =?iso-8859-1?Q?7PD+VV1cvxfIKNVuzZlxWJzJ3wm6UbmOz+0AUV3IlEFHMNCtQXkoYXCfmT?=
 =?iso-8859-1?Q?uaKW4IwUconNIwWBR1lYa5tYoQrPKkmp0J8BLwa69i7u4vjlCqhS/A3Hzq?=
 =?iso-8859-1?Q?gDzmj1JYUOwpFwUcYUOBHC9m+2yV3AhncYgTkdf9sm5rpQHtNV6mqyNV0w?=
 =?iso-8859-1?Q?zhZQVElHS0N51C7XhLjAEAAPI7SoJ1HBxW2sOCQ8uc+uWG9781Fk4AEJce?=
 =?iso-8859-1?Q?ax1R8jHw1AHrr4ZgO4zxjyyNwo0PrXUwqGMKxZl4cFT4vIFlyybhH/yi1I?=
 =?iso-8859-1?Q?PCKk6Higxg197AAHt8qTMdA8nZbiwCLmCQauGglva0SFqO4fHGmKcB+Pjk?=
 =?iso-8859-1?Q?w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WPR85SObvGvn16I1Rzz53tJARFAm45WDANxNXHmZghyUq/bybE56+Bqi3W?=
 =?iso-8859-1?Q?Jk1dvVdZiuNBC0mWbCNI8SlEQigCt+YTwAOX1pWqfaX8ulIjbixbGhiFhI?=
 =?iso-8859-1?Q?1dN1xz7A+BCtWkCJg2kU3GOG8XTP763Md88V+TjjArT6oRvBvRheLLYuVW?=
 =?iso-8859-1?Q?TE2+3SkGktSvrwbjNwsUsjRcwha6oSeDf6XpK1R3K8TSqVFeDpD7uiWq8M?=
 =?iso-8859-1?Q?pT3a/ZhcDgkeq6Di7qs+dpunZGoKp8F2b1zotFz2dD9xvhZXZ5yDAiPfQw?=
 =?iso-8859-1?Q?atMn3t7CQPdAyYiYDEMZjTfLH06hQmz/C+Jwuk3k528I3Y/AeOsDujcdsm?=
 =?iso-8859-1?Q?4lSxm+Sn+mEDsALpmpQ4CQqkntIaNqO302M8lFI2nHZGYWO4UGuo2LDqx4?=
 =?iso-8859-1?Q?GPfbSUHgf2bQ/L8JEjcvtlSonGOl8vIpzVj/xEL9j9Kz7C9kvZBd1ZnoTW?=
 =?iso-8859-1?Q?GZDJw0bxAA94jKJecTa4s82UQya4MZOXWYcLoswTQvF97+L+eURk3EJnA5?=
 =?iso-8859-1?Q?YL6TMbbW/Y+WRAIwlA7j8IM3ao3WJuatYjZe62wszOqYh+BCJnzNKs/dss?=
 =?iso-8859-1?Q?bATVG2/DYchBFqrh2OP3rAsioL5ZKNhdKaJyKwXKcmDD/6ZS9Rc6IDlDvP?=
 =?iso-8859-1?Q?oum//aqg1EoonBCR2falijY6Aa7URp9IsbR8vbrHLdKHGxh4n/EyLJA6Vu?=
 =?iso-8859-1?Q?H00qFglYMlvCIHnptCw+x/Kw86mJAjuq7BspAMiDeFmF4snm+5QFkbGiJQ?=
 =?iso-8859-1?Q?3N7gdh/XrMB6b2fW47Lr+NmLA1jeSAThfkdJ6ahYcyzcWHIwh9QV2OEYXq?=
 =?iso-8859-1?Q?ICtSNTWDsCP01hMBjICVoZlxhJ5i/jkFQVP/yrWwiluUF2ncXu9MthZuGj?=
 =?iso-8859-1?Q?exiVv26ys7yaZfxQcCTcSK7sLaN2EFs3GTszNJD4rSV2VuToJTqstT+Z33?=
 =?iso-8859-1?Q?LR4hP21/H/mb+ffwe8TQx20UV37ksVvM1ys/CuuTvJg93HP6c8pQIkgbdq?=
 =?iso-8859-1?Q?bQEiYgyjL4JY0We6a5FrX4KyiDFNIvqKU0yegMYgjlAr4A8VZ5SjAls4Oh?=
 =?iso-8859-1?Q?CKe4CTU12WD59QEnUmf1EKeXuWFDgLj689bGI10LUqx+8nkh04gpVy2vpG?=
 =?iso-8859-1?Q?V0YrNzXL+x4jbjFFjFqYLZiIGh2POxUCeHo2MKi93pC8gQhvG1vtyGdWUH?=
 =?iso-8859-1?Q?wqCqivDeaeVcnrHKksRN6UKdu9E0bvIyvIsmOmaF0qiS2U4mC0SfP9fg/3?=
 =?iso-8859-1?Q?B/dc5d9oiqMcKDRqVeOj2znpXaL5EpqV1VXTghCzceOEJHGX9hHcY+vOxK?=
 =?iso-8859-1?Q?Qh3PteHFMmS7qHGWRmlFT7YCqSY+AiABJ4iLaM3AVaf70LLwGN00MCPcbr?=
 =?iso-8859-1?Q?JHmleZmy8beQmxJb/cAKyxlkXiysh2kY6J7IwIkJZaXH7P1PpfWRerBn1M?=
 =?iso-8859-1?Q?n/v3z2C6RkNbgHfGnmfstAic7ZMSm11irJnXHc/DQ/wB8IDMyu2WGfajpY?=
 =?iso-8859-1?Q?YTQE6M01hVXQCJBOS4O7vAVDIUYrPxwU5o/gkVobFKbCMh39CbjojUyaUA?=
 =?iso-8859-1?Q?p7rTC5rC/SxH3svcguivHo12ZdIFCnTGxGN9Th+ZGQSGJrm2p4YZsrujiw?=
 =?iso-8859-1?Q?6kJutUBDi6SqbsO+uvr8+M4TD9R6iyGrcPo0M3POhatcBxIssJQyWJrw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f687e44-4b66-4295-36f4-08ddd0e8ee82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:48:20.8648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iT/QshlyVvj2kjFILc8mTohm+oxMIVkjdrgKx4qp4ZjKlR+WDryfHohhPrbKke0wucrh9kPGrM512BqhdTiiYrbTb0MTxHQ1zSyElzHDC4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6916

The conversion from a function pointer with the 'noreturn' attribute
('void noreturn (*)(...)') to a function pointer type ('void (*)(...)'
causes type incompatibility according to MISRA C Rule 11.1, which
forbids conversions between incompatible function pointer types.

The violation occurs at the call site:
    smp_call_function(halt_this_cpu, NULL, 0);
where 'halt_this_cpu' with type 'void noreturn (*)(void *)' is passed to
'smp_call_function' expecting function pointer of type 'void (*)(void *)'.

The 'noreturn' attribute does not change the function calling convention
or parameter handling at runtime, making the conversion safe.

Configure ECLAIR to treat implicit conversions that lose the "noreturn"
attribute on a function 'void (*)(void*)' as safe.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v4:
- removed words "function pointer" in subject (to fit in 50 chars)
- wrote deviation description more generic
- adjusted commit message
- adjusted of line capacity

Link to v3:
https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00009.html
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/rules.rst                             | 9 +++++----
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..0e04681c4c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -367,6 +367,13 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
+because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
+   ref(property(noreturn)))))"}=20
+-doc_end
+
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
 -config=3DMC3A2.R11.2,casts+=3D{safe,
   "from(type(any()))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..38b536dfe4 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -342,6 +342,13 @@ Deviations related to MISRA C:2012 Rules:
        semantics that do not lead to unexpected behaviour.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is =
safe
+       because the semantics of the 'noreturn' attribute do not alter the =
calling
+       convention or behavior of the resulting code, parameters handling r=
emain
+       consistent.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.2
      - The conversion from a pointer to an incomplete type to unsigned lon=
g
        does not lose any information, provided that the target type has en=
ough
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..2b6f30e56d 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -400,11 +400,12 @@ maintainers if you want to suggest a change.
=20
    * - `Rule 11.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_01.c>`_
      - Required
-     - Conversions shall not be performed between a pointer to a
-       function and any other type
+     - Conversions shall not be performed between a pointer to a function
+       and any other type
      - All conversions to integer types are permitted if the destination
-       type has enough bits to hold the entire value. Conversions to
-       bool and void* are permitted.
+       type has enough bits to hold the entire value. Conversions to bool
+       and void* are permitted. Conversions from 'void noreturn (*)(...)'
+       to 'void (*)(...)' are permitted.
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
--=20
2.43.0

