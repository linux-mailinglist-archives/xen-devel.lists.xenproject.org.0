Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNeHHv6zb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C948191
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208714.1520867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9bQ-00059K-Gq; Tue, 20 Jan 2026 11:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208714.1520867; Tue, 20 Jan 2026 11:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9bQ-00056T-Dx; Tue, 20 Jan 2026 11:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1208714;
 Tue, 20 Jan 2026 11:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj+H=7Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vi9bP-00056N-H0
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:08:51 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65a3d72e-f5f0-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 12:08:49 +0100 (CET)
Received: from DU2PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:10:28d::10)
 by PAWPR08MB11509.eurprd08.prod.outlook.com (2603:10a6:102:511::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:08:46 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::e1) by DU2PR04CA0185.outlook.office365.com
 (2603:10a6:10:28d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:08:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Tue, 20 Jan 2026 11:08:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5640.eurprd08.prod.outlook.com (2603:10a6:10:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:07:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9520.010; Tue, 20 Jan 2026
 11:07:43 +0000
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
X-Inumbo-ID: 65a3d72e-f5f0-11f0-b15e-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LdVVr5o0RYrpa1lU6vjtfqGnXpQHUN8gFTfav7myc9+AUVs9L0eBg6rn6pcXQ67w5sk5SaWIUD1P/DqbOjY1+gesg7/HyL0VeMsxEYWusvSEzs/7nIB6kj5/JSa09gLriJ0fYRgZNkKaRd5yOrR4o9tLdo7k8oeNLnlezUcdcaMLoHV6W9DMKX5cicwMttwr1mcbPuJO48kGpKHZdsIB4o+8X6R92A2YMqdTvzuaQzjO13CuxldOA32Yjvc11GfNsUxmGcSzGN4WB8RothotR8MV/VH/8UMx1Fd1eTS6eb/qyrhcKVO/sIR0GhL0aP1no4zJJguABpTwTSr2yVJ3oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnlXrm8hi2MTYFnU7Ey6jascFlzfZIWdJJd8IOCTS3I=;
 b=M8Chs73Oz8C66ypfP8PrQ163lgFA+QznVYWgtNo5ft8jYnEh3j/o5xIl/+oPIE2r3QToUz/ARKzRLdK3KPtx9RfO4Bt+TMm+ewmMFH/07nfAfljn5Po5W1uFdOoLLg/WEr0Bcz8ajD6ZNgAfO04gPBQ/VAVJbYFnltblguArtNap7V3um3i+EsdRMT3MYN6wFIqpLav7aZV/CblpppuClfObkDclLlwNKkE70qShO/fUSIVMKSFQVl+QlkaNsQcR+lbbI+Qtn/9eQ8CLvJJhDKxrtMigsD5wM99fkyosW9udL4n/7DsjsNqpag8rELH9YCkeePpCjDZqd6iijU3bFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnlXrm8hi2MTYFnU7Ey6jascFlzfZIWdJJd8IOCTS3I=;
 b=ZJbQdwEuZFbgEj5aLTiYFI6wKKtJzTKoTHWxxjllrSgyMazwwnq633sGKCPT+tuDitTpPSIl4UtAdGLJWTRSwjqO7YL/0piT38mc/TIKGDsVG6bFv254Ovt1v33WvsM4/zRHHqiFVVrfwczfHUrFwzr9ow7Dc/+aohYJQm+IcNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYAihqnErt1IIg3D+WysR4oidZaX+6RB4ekB8uZ9M8B5zbnaVYfSuYUZNG7heGcdIijr9aGIqSJmAy1hOwNsphnArTAu6zGJN6JIBXYutpnluQ07bcYbR8SZ8gW6lYwuiN+2+HlBYnVv7SHBChYdHqhzVzO6+HT0+KcxQhxNaICNhBLEawCZ044V2ZQbSonVWtsi2LEqXQAxKepkvRZw+991sL9wnigd890fl9YAlJ8DQC4bSHy/zu1jjlqvkUbSPhbv387XUhWcM+7mO4fhAyUM4xaQ3txECrCzBR2e/W/9lYdByJ1sN+TQzVZsR6VX7/h8z8+mqfcVFyGMBmkUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnlXrm8hi2MTYFnU7Ey6jascFlzfZIWdJJd8IOCTS3I=;
 b=UpxNyc+mIltCHSq7vYAGiwJ4DHZvBcUfzGW1r37FxoeXZ7yCsrDD73FJl87RSI1HCTTeQ1NfWzKGPIqkgGRHZZFaB6VQE8j0ae9NBomS8FWTJRtLYzNwOMMh9hYt5dDqMrARyITW9Q0JdkkvchZmXX+p3LiHUxrGCUZxwO+BnQ2UtpZr3m7pO3S8eCITOgiFNeBAxDCX16a+qlo/wnwBcVv8tfk8ycz0ZFQaJAOhpN9pHNET9JfrAlsdXrgNQyWikMYsnAxLL+zCAzjVq30GAFwQlPWwriFxmJy2TU8KUTZcNTWNxesxBYJbBZ5Iucqy6qGFpprc6YoHd+WCfTC3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnlXrm8hi2MTYFnU7Ey6jascFlzfZIWdJJd8IOCTS3I=;
 b=ZJbQdwEuZFbgEj5aLTiYFI6wKKtJzTKoTHWxxjllrSgyMazwwnq633sGKCPT+tuDitTpPSIl4UtAdGLJWTRSwjqO7YL/0piT38mc/TIKGDsVG6bFv254Ovt1v33WvsM4/zRHHqiFVVrfwczfHUrFwzr9ow7Dc/+aohYJQm+IcNA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Enable GICv3 by default for AArch32 MPU
Thread-Topic: [PATCH] xen/arm: Enable GICv3 by default for AArch32 MPU
Thread-Index: AQHcifrM+5nrExe0Qka6ts4AH9yua7Va5fwA
Date: Tue, 20 Jan 2026 11:07:43 +0000
Message-ID: <02BB90FA-2B62-49EC-B131-11C17252D442@arm.com>
References: <20260120105141.92578-1-michal.orzel@amd.com>
In-Reply-To: <20260120105141.92578-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5640:EE_|DB1PEPF000509EA:EE_|PAWPR08MB11509:EE_
X-MS-Office365-Filtering-Correlation-Id: b0395804-9884-4f25-ffc0-08de58144831
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7UY0Kbj551d6koMdMSOGTObrYi/wcjqV9raLTpcbkU/VM2Ke6BZZAS/SZORU?=
 =?us-ascii?Q?8EcxTnfb5Ik8QPQloH0XHq8wPWqQvfa4RuhxqNXdCQuUtibzp3IlC741E8Rr?=
 =?us-ascii?Q?jPJ8NnZO3VOndfDdaSXikU2NdgVUH2Vi1jxi4yBl7NGqDSiGR81udi9QZcMy?=
 =?us-ascii?Q?o5wrpvPnpd/r+JYKoGWVkCg4ldxk3QBHw39fNkBgEg7BIeSphGEHmUYoQM2o?=
 =?us-ascii?Q?tDN6Ux5mMKE3ybR2MRLAw/Vr/FJaOH5gY/q21Y3rMmxHv5H9rJfZIhEUOZXI?=
 =?us-ascii?Q?+nYqST/gQKGrKxf60vu9riUYQnJ8yYNqcugtUHkoaE7eqkUXBjxz0zyxELHb?=
 =?us-ascii?Q?Dwkl0VSykhIx3OhodqYAiC7IbfZp7xaN9VD6+DIcjRO55mzFyYRgsFeZUGHl?=
 =?us-ascii?Q?8fwXvf2sUbpz6Q+nyWt1RntZ2/marZYml7gI0LJkQg9AIjEfS9106s6kSs+V?=
 =?us-ascii?Q?lwhZWRpKYLhsrq5zGYNGaaECVp4Brw4wZamUXYqvIC9BjTsQwGuJa7j27Shg?=
 =?us-ascii?Q?lCoTjcijP0x9/D1fij/0tN1Sw79pz2SW5dqsN1fS5zF09NykGaoEMGYxr/vt?=
 =?us-ascii?Q?asWlRW1YTv+nyctT1k3SoTyZn/7PUwCY4joTKsFEZLND3VbYO+5E0BVNeEOW?=
 =?us-ascii?Q?U4V35j9xJErqaGWpKNr5WV779st91MyHDWLOrLiyCYASmJvSZOsUo3BlvhIZ?=
 =?us-ascii?Q?6F4fpz+20tqm39O+6mlbMPLx+tDuUEkRw7zeEyWz9S1EKoJyMrvnfpfTq9IM?=
 =?us-ascii?Q?NKIWlKINWByB24OkXkV5I7S89WkGDUQMZBHQ3MyTjxpPu4IGeS+1z/hgvPfT?=
 =?us-ascii?Q?iDISx1wb1oXYd0NebT7VukxNDEOMggErZImkBHOQh2Rx2LzZelL938tEvNEK?=
 =?us-ascii?Q?nG1bS/eeMPCT1xjgDmKRlXjzeRQYqPfz/dPSJTaMwTobU21uJ/CdfnNYUwK5?=
 =?us-ascii?Q?eblUirJeRifINxtgVzTEk3ASQGcgUyR0CXBnY5MZuh5Aw/4U+umHnAba1qP1?=
 =?us-ascii?Q?4MINtCYpk20jE2fTavzn9vR7EchgSmd9k4PhUcmZF+ULZZYqDeJARdaX7ujF?=
 =?us-ascii?Q?uyJXWgKpex7Mp8NErV2l9by2Lt0xI/OdYcY9u3hQ5EpFBQxaQ7qKK/O9hIcb?=
 =?us-ascii?Q?asPxip8hYoNRO0iSl/z6gTqKutw0Sn0TXdQTKv0pFk+zVHTQ2OAwvOf4m6zh?=
 =?us-ascii?Q?is9slXUS2O/+2xEbubhabv3bGq0SoH52HX7r5KSMW+Rdj1AwOLCaD61nRXuh?=
 =?us-ascii?Q?hsiZc6HSyQ8Sh6aifzlSWlegJuI+zB3C0GaUnJxKe0rt/7gWnZh6+n2/V0Iv?=
 =?us-ascii?Q?MpAd/RdEOkandNJIjhewcl33yZ2ydD7dnSzJFol9hRHaOmjCFOnwGuVm8VfH?=
 =?us-ascii?Q?dEiWxFNopQ1mKIe3GmaPQ0Uj8iOFmoGr9sb85oJf071uMS/8FZY3u7UFBtqP?=
 =?us-ascii?Q?aM+J6mcC6QqM5pYf82xZ1okGY9lLNmqZGoUfCJXKcWswwjmRcbn/kmJAOVvq?=
 =?us-ascii?Q?Q8F83hD+TZ3xjS61UP4qhPEor9d7ZC1NBTJvUg1Jz79jj9/eyx5NA/Ci6Mvl?=
 =?us-ascii?Q?b9ukyvRDbcFBwUBxco59CCIzUrzJPtXF7QVEAJd90hyvlpWJj3+pRTR2my24?=
 =?us-ascii?Q?GfrB0CKzIwNh4YEnJkGTnuQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB440A3CD293D3449C383C4D8839FB8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc71b0c9-02cf-40ed-a166-08de58142269
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|82310400026|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sjxknPM0NthELJ5SfklzfFQ+sqUF6uv9oINcna1QcWLoRaINUKNC3d28zPIu?=
 =?us-ascii?Q?VWK3uO2giF16xRRtqL5OaPf3vf97v/OjWpjP4uld1ygrlNomi8tB929aKs/2?=
 =?us-ascii?Q?wNj+rq9JxJMuzMWjrFJELHFwtTl2ns6JpDE70pUoMZNuvo6VqVp4CeJqK9l7?=
 =?us-ascii?Q?J7pFimSV9xo1BpiDrZgmxzlUHuORsRMdvqrX//Hmw7xx2tuBXoCnROVl4+aj?=
 =?us-ascii?Q?hNJ1kBa8/dPgMiTW18KLibaYRLbak8CdqdEzwGqTyyH/fhjz9p+Pekv9Cvo7?=
 =?us-ascii?Q?drdp3Wcoso2djR/QaknraACUvQk4izf9acw0z7HJwlm0Kz6XdQxOiiwtkgVI?=
 =?us-ascii?Q?KhZrdkhkf/fNKUxDR3GULew0kNk4h8drXr8VqoR+KCEu0bV42JMllr3wNDJj?=
 =?us-ascii?Q?0qNxjHF/fisKgI3ZFUsTsp6RMfaJAoBdcGRGI4/P1GQW7nHsiesSmusQhZqd?=
 =?us-ascii?Q?U7yPnksdG2WD5Do0mSb2IC0xXt2zCnQ4WVb8kUT1faa02WktFu9A8qHP4cmy?=
 =?us-ascii?Q?RpL9zbskJlFnL3t1ZgtDq9hyGpYCv1kvVZ8ObhCiUH6LVxu1Qvk8tzFl3nug?=
 =?us-ascii?Q?HwrRRRJC5dpEyQwGPNM7Lmtdia7PM3SUj5L6+HknW/yx7GUKMlRmk9hL4JjG?=
 =?us-ascii?Q?KN9x1mGTWh+xWoXvjC+zIjTlLjXxP9Fq6+rgckvpxtwM80OxLkponSb/Xus6?=
 =?us-ascii?Q?KCLZg5RjkBBze/VnolpQqlS3ih9Rj8loYxEieItkeeCxI3IUYcv2FXNEh2zq?=
 =?us-ascii?Q?6k60FB86JVelbwRnJXqk7moa79esMIPSrQ3Ajuni1szR7wJwfFSZDzEdO97Q?=
 =?us-ascii?Q?qNa1YMK7aMOrBL+YPFdRELgTORHJVs4GRiunyYbOuADTVA8By9rV8b+Gf09S?=
 =?us-ascii?Q?+IXk9j1QvPGMf6EGMHP0Mh5MEQxJvC0mw4Bfy8l4vm54rGrDw4d88avbudGP?=
 =?us-ascii?Q?JEYLzYF9zuT140ReAIj84JGK8O4IB23TJbWhE3CJgsJTWw4tYENESHGG/r7F?=
 =?us-ascii?Q?g92W16pQn8NqxQpJ1cztdtIyeN5n78tIP25yvxHrzDdQDEv6KD5XMPK/RIsb?=
 =?us-ascii?Q?BzjUlipjRqrsb12+lFcn9FMjO6kdPPtvs3JdqquxbedG6W1fWlPHNfYCXbes?=
 =?us-ascii?Q?dm1LkWLOHTGM+Wko+urAVseXrymJv9Y7FGgxr4GjiUFJb3oGBKsIvLLnMhKc?=
 =?us-ascii?Q?N/wv3icqaffnwyeetwb2gUn58PjuzPPdVYOWvx+Uq5u46rfIBsJPXOW8auV3?=
 =?us-ascii?Q?hjOFcjoF+tvwERyePNreAj+h/WPrUYZwr4olb0Cug7U55uNp7JvAVNTK/s4R?=
 =?us-ascii?Q?K+lEJkf7/U+A7GpAIqFO/jrc7B+bS++VWwFkBNgDbs2zAxOW8ty4MoFOegP0?=
 =?us-ascii?Q?LD8nUTgUFqPQmVzgukN0ZdhdP71XAMQsqSY46Vi9PyETyLRY1Qe8bMqte3dT?=
 =?us-ascii?Q?hnZGKL/nifVFe1zUEYrzIPlyZ4PHLuo5dSsWukBaQtrMuHvEnkKFrCXKr29L?=
 =?us-ascii?Q?yrujQ54oqr9Q0QWiK/PG8ng43LQuUO1cK7xzGWqcTCpEN7SSsCazGzc+ManP?=
 =?us-ascii?Q?TM5lwypLA/rjb+KYwM61eYSWdmvsNbB3JCdf7d7Zju/6xL0bHbpmfx5L34Ab?=
 =?us-ascii?Q?jD9AbjWlFMcwMkLuCxqXUa9k7ZcEkeKcw5c0UuC17N3jVMn3gIYXoabbT6de?=
 =?us-ascii?Q?EltJew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(82310400026)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:08:46.5982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0395804-9884-4f25-ffc0-08de58144831
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11509
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,arm.com:dkim,arm.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E31C948191
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 20 Jan 2026, at 11:51, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> All the platforms where ARMv8R AArch32 is being tested use GICv3.
>=20

Make sense i think.

> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Kconfig | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 0d81a4d8b437..442d353b4343 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -128,8 +128,7 @@ config GICV2
> config GICV3
> bool "GICv3 driver"
> depends on !NEW_VGIC
> - default n if ARM_32
> - default y if ARM_64
> + default y if ARM_64 || MPU
> help
>=20
>  Driver for the ARM Generic Interrupt Controller v3.
> --=20
> 2.43.0
>=20


