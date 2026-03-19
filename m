Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MX+Jm6qu2ngmQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:49:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE32C77BA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256754.1551255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w387K-0008Ca-Pm; Thu, 19 Mar 2026 07:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256754.1551255; Thu, 19 Mar 2026 07:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w387K-00089y-Mw; Thu, 19 Mar 2026 07:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1256754;
 Thu, 19 Mar 2026 07:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JyL5=BT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w387J-00089s-5S
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 07:48:29 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 013bcc00-2368-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 08:48:23 +0100 (CET)
Received: from CWLP265CA0461.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::9)
 by DU0PR08MB8495.eurprd08.prod.outlook.com (2603:10a6:10:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 07:48:17 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::4) by CWLP265CA0461.outlook.office365.com
 (2603:10a6:400:1d4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 07:47:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Thu, 19 Mar 2026 07:48:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB7861.eurprd08.prod.outlook.com (2603:10a6:20b:52c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 07:47:11 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 07:47:11 +0000
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
X-Inumbo-ID: 013bcc00-2368-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xBoInOU5IkjT2gMhShto+sjmUXXeuPhlFkKMqstGkh2Fr19Pk3NJ7/BeHF7XpUUbhTQtzaM2GQ6UTvwKsYegfxiXetqCqhXGAFizIk9WOl07XId0qLZBfjaqwF6+GzxGpb27y4pL18Lnd+q6GHdRwAKNctz31n01FKBACM6X+z1IwHth/1y/mrf3xZ6TlFSBxi9nvvPh7pocXIOzHCYGfrw1+jEsZVtsT5CeKDWiKznH3mh6aDiC1Rp04lqva1GoQHQWpYGkZs8ItTWqM4O7VMbbQ80pwM9nRZ1XJbdS8GLAQBJzfALG0GOFWF42huxS5lluTEtgJYpF4Ga9YHN6zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQPdJtxXB9V0+Yj4MQEHKzhovQFu4weOJ15tMIijuvM=;
 b=R3UtOKcS2/jrvf6L4TFQj0WAujXKxWBDD4KOsrxgLZ0nknuXoLTknLI0OiPuXRHg6dFZlwNRlKKMwHyxD8kay95eej8xk2+EndgWgGrB03ObgyAo6vC9ALAwPbDXMnrB3DmPWg49bnb51LKFb81+wNEDs+N8F1h5U9XDh8B0i5IikcaSA6zEfwfHLXvSV3b00GHt9YuQPG8Pm8Ra2J2FjiION2hOiQO0OfiOLgaVapd25xg4ipBuG2edRTokVnOHEDBr8GnIHPu54MiE0KMUJ/TG4b4s2Md4fBQIW7y/+9t8B4/LN1N4LZIa6PAcxYj03BxrAOPZ5+OZoB7B40YkpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQPdJtxXB9V0+Yj4MQEHKzhovQFu4weOJ15tMIijuvM=;
 b=Q74dw2MGvSxPtPJ9eXR35NhKwTWggRkj11PWTxORp8Z8udCzP6P6r/YgiyBBznA6ApfmZcZzEeGmUL4deB6htqHesw8QJXV+Emguc9Y+8piTnnkyhhNhlBY+mqDlAST0/j8LeYKqwiHy3s2XimBYjtShIncA1OVM37+6Rc7kdVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyfNBRNECpiu3RUxS5sMTMrByba2BKroTb9DLOvzcF3/FrP7GDHgmnU3lj+mucWxy0Ed1zuXRYLSgp/ltzeKDteZ10DBIV6G/7a61WXglrSwY8tTXpjmHNSV5yuHZFZcj1G4Wt+YySN9Ca1Bmc1fb4pfm37cV0dAPXnMtTULgflSZ5sXOI8gic+veVUexyyDVbpJTcFmudidr76i5qviIEgT9YZ5W/52jk3lZIB+P3bG3mkBTcwOLOZXz6I6EQrxyissO/DCYgioVmvp1IHJApatgcgF+A2lyEmuiC3Xwbg2ihS9lhm43rd/Bh2jJYklNrF3ruUpcYZjrEjmlcSIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQPdJtxXB9V0+Yj4MQEHKzhovQFu4weOJ15tMIijuvM=;
 b=EvF1+qLjxosPoRbsxeJGU5fCI1m2jUunlGNLPPomiKqdVnBDS+tTSCRcP66/4ZP/6DQNVX8KEXtzXgqDUVpPtM152hO5L5uVNFq6sK0NP8YW2GxhXvmfDvirNYg2iQCH9gQ6WfzNkkEQfAfZI45z06ZCi098JbrkHtHNZCu9aL8rpG+CQDr6tghjSR4Kjc1kcuZ0WyA8ho9dwa/X4hz4XLvc71gBlBw9RVTbWfOPN/ZKOFGk/Q1+LqvAvJh50CddJ0aNLo1FZ84iXdACgWCzz2jnwlfGYHu7E8WCmUE12u0ChJyfHnvv31a9R9Yyjzg9O72+kmaoPqrdlWPjfL4UzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQPdJtxXB9V0+Yj4MQEHKzhovQFu4weOJ15tMIijuvM=;
 b=Q74dw2MGvSxPtPJ9eXR35NhKwTWggRkj11PWTxORp8Z8udCzP6P6r/YgiyBBznA6ApfmZcZzEeGmUL4deB6htqHesw8QJXV+Emguc9Y+8piTnnkyhhNhlBY+mqDlAST0/j8LeYKqwiHy3s2XimBYjtShIncA1OVM37+6Rc7kdVM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Topic: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Index: AQHctwleCTTA2E8kAkG0JnS9VhefnrW1exAA
Date: Thu, 19 Mar 2026 07:47:11 +0000
Message-ID: <F2AB3928-C65E-43DC-80F0-1F2F4DDC8037@arm.com>
References:
 <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
In-Reply-To:
 <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB7861:EE_|AM3PEPF0000A79A:EE_|DU0PR08MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 0978a6a3-08ef-4ba0-d585-08de858be1bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 9uEU7lJjw3CzbzR8Cv/kkKttygoN3QwMEqhXwTAuhzyhLbiUkmdlDDkdkmATiUHX2OsbSPtn7NY/mcFKi1M6glaS/mtcjABCnr/v6BwBcy5CgQkqiwwtKMm/+lhtSFaDGH5Zxa1yDqMKtzFyA7yTD/psnMEYTmwKKM2JqWq9Vz/q5cukH6p1Q9URMkHTZOgV0ktLpxCl5LGPMSqMZH/h//oeEzz+TBnP9shmVgX9+OHu89JYD3aZ8BURMbuyPmpS4n1xi6pXFVdnRLgBKvaQvcCOdHMs2xeqNYHeY8TvgjhX4UXnXVWTa4Ki40xn+sCVyQLbFos/PL4QIsYZO2WBnt49uklgTg0QfwPzq0dHm1RELLYAcBt64w5d6Z4MyT3EIIA9HMO3pf/abUYqpRXtJE00HucDTkI8ahRzB1ycGopn8TXVDY4dweKZa89xrf9oZjTkEUqIUkkwTZ/v2nXrGTDekNVsH+1XmCGXzBKhV1+cWo3X8qwMgurYUdnP5tGAPM8R/WI6rmOk7+LAHz8QcIbmc1EjCLP9udh6JnCDHnBy9lmlcXU4rZWDUDICHue4WT3qZhhQ6eqaQpge2arLQ8nNaeoCUZzKSZAqULcsphxzVfKBu2ZCDtx2jXkJNZ9K1p8n4CeQViJ12a1MxOi6gs2w7aep85Ki7cZz78+1+Bb3+4xKmvk3jIQzhhwDX0MWXgKVX3BUKDJW1jAkBCdK4ZjCCiA9X6UcTNv5DjS7i+Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D99F25B0C1A414CB5B1FAC968571810@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 QCEoY9+OZ4L3erSPOqBdQVYQkEATCpVb43gukCNwYhAe4oXl/UVBviTMhQTvEEwO2OJc7eB589syrz9hoppUkRtCTRBNu8ZYskZ1aI+eF2uFq6XRCkjnnxkcUXn8KKzJzfIUT24lS3e6+kJeyFySOsAc7SqPgTJk5r6Rwo7nR53UNjExyUr3Ek2qcifyQb+/tddTZsjLs6LJIsD18lSKNMEvP7qQrLjE8BiWDx4LiEE2DNgbiQCf+mHMTA3bh7c5JcwH5XVkOzkxEeR2vu/d1RzbXx+dCaxg5HSPrqgjOEshsXLyCNjprsF313OYOrLHn57/pwxg6fxKosiCl2/Q8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7861
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7526ea5b-14a8-4a59-0d85-08de858bbada
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|82310400026|376014|35042699022|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PPcNOsWIYrRWE/tHOvEura/XW4SCoPu4foDuuHobaBmKM3SzRZ4nZ8Gz5/CU8qg9HQM6/6IdZpaL3+UrkwYUl5RfKkHGAz9Eo6iwOfh0XLlsBJhBL4p8hHpdgVBvnDE5mIDYAzLyNnFDtm6CXViRY1EdZPdO+wZI2lWSvG+r75Ypou7+FgZwCfNYRk2RWKr2sUBvlpRpqlvjKYSYI+q8zarAyuPp9/8XS4sM0GZC6Qm3Jx5zZckrilLOSV6c5Fw9a51I1pkDvYPs+BVbMkwYF0i/pMfS6Xo8MvZElSZk2D7r8JyBTt2mqYdEqYDTj05KOZcKVjBycBu+IrPo8h4ju2zEF/oG8eUvWz6SuaBjSy2G/e1B/vsJlwluMcI6m6qmidZ7P0b/2Ke4QP5vRJ8CZO0fHWAVfoRF5DdqTau9A9r1Cpkrx7aV661NImNdqa6pJf68+z1K1oZM/fa2ppIuxwD7eYQbDxnZX7Vu2Cm8Npz/Ok8uH/KlCgTQLVrnp/pJ9U+Cs7FpdCpzyal+etbdPicM4TdLaG2Y6U2w3Dj+CNCsAhhxP+dQhYsnsWyGRd+f46rq4RKyjnIYRaB5f38SVeol5QzGK2rKN4Ssj6WzrqDxkyAc1ftgQwXuNQ8pHWA1xkJ7IuGxvHShDu1yJE6V6x+ihLDbw+1heE8Ipc3AdRBSqBUS1zZ8XF6X9MyD9Cw30pKxRp9z1QATjF6lHXq3HeCQj6p8anJU578csGaFo3c=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(82310400026)(376014)(35042699022)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7q0KRBYnwjDJ2VkqnPCKS2Lp5bPaKwgHb6vBHGKU+krGYvdOhA4jTjwoTAnu8lQLx80gUf2ek5liTrVqoaNQrr1PbbzoqSb5RNDCe8w5ALTNB9TcEm3cXy56/sKJL5Dj0ol7hGohBGhZMszkZ0QSbu73ac7rYwD0YXqyPZjLnGrowHLJ0zcS6Hit19GXYlQ1syBspbKw4ZKBIQYYJgefxCx6VkK0hZXZxTrbiTBubGaF5YG7YnK5cJQ9PEGBrZilPfGxb97b6faw7m+BSzb7yk1PaPB/kf8Dn6Uz1pXTRlY3+SbCkxQt3J1pftAAhZHrNRMlfBp+RovTaWh8TaQXb2S/CKh3FoY/0UZ61G+8/896dQhv3e2flLCna2dJMqofw/PvVuARaZgtPVkr0v9M7KJaWezj3sBgvA8cR4xRul6TNoyvyxg+qR5i9p6Pgki6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 07:48:16.6435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0978a6a3-08ef-4ba0-d585-08de858be1bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8495
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,patchew.org:url,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D4FE32C77BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 18 Mar 2026, at 19:56, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> using Wn, only the least significant 32 bits are significant and the
> upper 32 bits must be ignored by the implementation.
>=20
> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
> argument registers as an error. Instead, they should be discarded when
> decoding the arguments.
>=20
> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
> implementation defined when entering from AArch32. Xen zeros them on
> entry, but that guarantee is only relevant for 32-bit domains.
>=20
> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
> arguments via PSCI_ARG32(), while keeping the SMC64 handling unchanged.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._=
5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.my=
kola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
> ---
> xen/arch/arm/vpsci.c | 15 +++++++++------
> 1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..1e844ed571 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -303,9 +303,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>     case PSCI_0_2_FN32_CPU_ON:
>     case PSCI_0_2_FN64_CPU_ON:
>     {
> -        register_t vcpuid =3D PSCI_ARG(regs, 1);
> -        register_t epoint =3D PSCI_ARG(regs, 2);
> -        register_t cid =3D PSCI_ARG(regs, 3);
> +        bool smc32 =3D (fid =3D=3D PSCI_0_2_FN32_CPU_ON);
> +        register_t vcpuid =3D smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(reg=
s, 1);
> +        register_t epoint =3D smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(reg=
s, 2);
> +        register_t cid =3D smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs, =
3);

It might be nicer to modify PSCI_ARG to take a convention argument instead =
of
redoing the same test everywhere, this would make the code nicer and ensure=
 no PSCI_ARG
would have been forgotten.

At the end all those conventions are coming from smccc so we could:
- use smccc_is_conv_64(fid) from smccc.h to get 32 vs 64
- use smccc_get_fn to get the function id without the convention and reduce=
 the number of entries
in the switch

That would allow to get the convention and fn before the switch and simplif=
y a bit the code.

The smccc part is definitely not something i would enforce in this patch bu=
t could still be nice to do
it if you are willing to.

Cheers
Bertrand

>=20
>         perfc_incr(vpsci_cpu_on);
>         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_on(vcpuid, epoint, cid));
> @@ -315,9 +316,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>     case PSCI_0_2_FN32_CPU_SUSPEND:
>     case PSCI_0_2_FN64_CPU_SUSPEND:
>     {
> +        bool smc32 =3D (fid =3D=3D PSCI_0_2_FN32_CPU_SUSPEND);
>         uint32_t pstate =3D PSCI_ARG32(regs, 1);
> -        register_t epoint =3D PSCI_ARG(regs, 2);
> -        register_t cid =3D PSCI_ARG(regs, 3);
> +        register_t epoint =3D smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(reg=
s, 2);
> +        register_t cid =3D smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs, =
3);
>=20
>         perfc_incr(vpsci_cpu_suspend);
>         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_suspend(pstate, epoint, cid=
));
> @@ -327,7 +329,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, ui=
nt32_t fid)
>     case PSCI_0_2_FN32_AFFINITY_INFO:
>     case PSCI_0_2_FN64_AFFINITY_INFO:
>     {
> -        register_t taff =3D PSCI_ARG(regs, 1);
> +        bool smc32 =3D (fid =3D=3D PSCI_0_2_FN32_AFFINITY_INFO);
> +        register_t taff =3D smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(regs,=
 1);
>         uint32_t laff =3D PSCI_ARG32(regs, 2);
>=20
>         perfc_incr(vpsci_cpu_affinity_info);
> --=20
> 2.43.0
>=20


