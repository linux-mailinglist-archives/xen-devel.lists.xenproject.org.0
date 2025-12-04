Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763CCA2DCB
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 09:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177393.1501691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR55x-0004zq-L3; Thu, 04 Dec 2025 08:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177393.1501691; Thu, 04 Dec 2025 08:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR55x-0004xh-HN; Thu, 04 Dec 2025 08:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1177393;
 Thu, 04 Dec 2025 08:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VGT=6K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vR55w-0004xb-Pb
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 08:53:48 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf269d5a-d0ee-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 09:53:47 +0100 (CET)
Received: from DU2PR04CA0340.eurprd04.prod.outlook.com (2603:10a6:10:2b4::12)
 by AS1PR08MB7425.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 08:53:41 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::c9) by DU2PR04CA0340.outlook.office365.com
 (2603:10a6:10:2b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 08:53:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 08:53:41 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI1PR08MB10007.eurprd08.prod.outlook.com (2603:10a6:800:1cc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 08:52:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 08:52:35 +0000
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
X-Inumbo-ID: bf269d5a-d0ee-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ynvbXKl0wBoFpHplPTSL71m0MLNirOzeZ1molteLLN7S1TPAJqeEiQWUaBbTDd7fgBzH6LRfg20mj+rxKpfdps8lq4CczwS0O9juTME4JXEZ26Mb5MgzyZDM8V7978SeeiGkSjE2wBTd51F9wQY9xkR9EYlk6MJKmj2yq838pRWWKJsv1/PJvshqBmM6OvVW8PvUxy5FAdjLoA4uy02Zk+xwmRYWKxrufwStPu3hTjrsfl53Vi8cRfPR1jbujEaEgpkg8nQmUMiq44lsT6IWql+Ynq9Fx15l4+0lYRZEFUCMtLYfVaVm+lydnMRpXOdPkVGylES+KfSeKCyrUVx9oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDWqyrcgjfAa0KpmzmBNpTdkuFH5QEA9lwuQvK+KgGc=;
 b=th6jJWRpuQ2yDMMjUaN/OUlN3GqTUEprS/PzwoyfYZ5rHPu8Bnm6HHwat7Pdk3CiHy73vYqbiYi4FybwI5sHuu6rW49PEu08L6/qPlYMDoT+CsHvDDzdH2wHD0/UUUjQhBRRRtVbNXi8Mf5CB56athfeWjJ6wB/6dGIrv2iVgVblRcyr7AyjkCbGVSl3WoFM+og9+7C3Tzk6uDeGlL/fsIGQgFhiVun2E1lpG1Te2H717Wllx9tlrTE+Usjpzf2s5NXEZ4z2WD3S6cZHn/jFsaNHtjQpv1jX7B24ZRyNS0EWC/slZ6zitW6i5CS5sNs5yT4lbRQJvDVoqUPpNqeowg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDWqyrcgjfAa0KpmzmBNpTdkuFH5QEA9lwuQvK+KgGc=;
 b=mfay2wRWyiI0Ps5+2hV0O+EkpO8Uj2yzhobczC1E7R41KWmEvXzVK+h6enrM+2bzfy0tW9gtPTLcIDkuGFQe8vE9Jz8d4UAgj9W+0qMk2sJbtsaYiwJ8Kuv9v+aMN0jDwFZ6PaUYF17vNMFVQT++ZBR7klojzL0Q7LsoFnsrA4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypi5RdjWeaWFNKjX+KxX7eAcpbghMSxxTvXdoymdGeBP8k1Nd32Zbi30z21ck/Ao+z4PEfc7YHCGIW/SJW0OfPd1/pJydP8DsGk5hGvjqpyMbmPl3svpqO/2VjWruuIO7PO0QjuEN8i3TvH+kgW7baAlhVAH37KpfuPU3xXCk9fV65CwVAHpYHkFX1DuhwUdrpbMCVfqjhpfapBh1CtwCWtzbaE17/avHzY3ctev3QviQtlYSN4HDSbHccMuYXv/RP8Wxzm6P+9vQ5EAaAxYOFfykKvfU3eKBTPnG5H8l7Fctb6WlMDKcgEIt10cLgWGtw5Oq3kmVL5+Bh6xoEdW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDWqyrcgjfAa0KpmzmBNpTdkuFH5QEA9lwuQvK+KgGc=;
 b=gyg1r9U9Kmvt7MscChKVq3BOn46w8m/iVDG9SW6MQZOKMRg93u1fudY/f62SVO2cII+rkWkk10S/vjSBYvyVhnJAkVoRF+TmFhW/VhRgqMDZTLmcnXFRHFVJtAWr52K6VuMAZbLb9n7SJwtaa9OUNcnmQJqU1cBzTNshXFLbJxzfb0n3RS6TPoIWarsw2EtsHPfr6aRsrTgtM35/tgoGNftv1tk8GYoclmVMLONWiJaDHSvEbdiQXdqadwuhuWCi6ed3rEwRYsnkJxYU5qcq9mHFjhf/bZynO4gjAujkXiM3n6L+gn34yqcmq4ftmW/Qb3fiXh3VKKuSZ+R/yBpXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDWqyrcgjfAa0KpmzmBNpTdkuFH5QEA9lwuQvK+KgGc=;
 b=mfay2wRWyiI0Ps5+2hV0O+EkpO8Uj2yzhobczC1E7R41KWmEvXzVK+h6enrM+2bzfy0tW9gtPTLcIDkuGFQe8vE9Jz8d4UAgj9W+0qMk2sJbtsaYiwJ8Kuv9v+aMN0jDwFZ6PaUYF17vNMFVQT++ZBR7klojzL0Q7LsoFnsrA4g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 10/10] xen/arm: ffa: advertise FF-A v1.2
Thread-Topic: [PATCH 10/10] xen/arm: ffa: advertise FF-A v1.2
Thread-Index: AQHcX7X0Biqt31cxnESztYOGDz/aZLURKIIAgAAOsAA=
Date: Thu, 4 Dec 2025 08:52:35 +0000
Message-ID: <F2593494-070C-41FD-A52B-5121CB03FD42@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <8ae9b12641301ecfafa7ddee3e60544d3fa45c40.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44ERxthL+pfXnLVZqfOmqvK747owroouv6uqHfTw+=QCkw@mail.gmail.com>
In-Reply-To:
 <CAHUa44ERxthL+pfXnLVZqfOmqvK747owroouv6uqHfTw+=QCkw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI1PR08MB10007:EE_|DB1PEPF000509F2:EE_|AS1PR08MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 538dcf30-2add-4933-d13d-08de33129f98
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TzBBWVpDUXlmaDY1MHdqVnMweXM4YWlBSnNPZEtCN0oxQW14dEN0ZHlDQzMz?=
 =?utf-8?B?eFk0K3g4eHhsZGU0ZHpybHRHMktzcEhKak94d1BCOVFsYVNZcTJPZXJBWXgy?=
 =?utf-8?B?NTBjZE01OGwyOFZoMU1UWm95bzYraHp4dENQU0xWSGhQcG9FbjJmendxVkFz?=
 =?utf-8?B?bHlDMU5mejM1ZVFCQXhJZklXUFowOXIweVorTXZpVmZ5NERlL3E3WkR3SzFn?=
 =?utf-8?B?c3psSVlDNlMzOTU5Uy9HdUtFNkx0ZzBqMTd4Q0cxUkt0N0F0T1lvYkJ5ZTBD?=
 =?utf-8?B?Y29Za2d3Z0NHYm1aQWhRRmdtaHNBWmV0UVlnSEovbmhBeU95SmVDcHhxbVhr?=
 =?utf-8?B?ZEMvSE42TVlKN3ZDZUFQNVdoVktQQ2Q2U2xqbThQS0R5eThFZlppcEFJWFpi?=
 =?utf-8?B?dHN6RU9INzhBVnlvei9iVzJQSkNFNCsxZVFCYlFNM3M0U0FLTVg4RTVFSzEx?=
 =?utf-8?B?cStxUlpzUFRuZHNlbmFCaTN3UFNXdHh3aU4rQWpwZ2tiWnB1MDdWalFndS9K?=
 =?utf-8?B?NW1reUhKL2crb29pSlBaakpjUitKTlp4Y09xU3VJQ3dSWWttTjVIMHRPQmdN?=
 =?utf-8?B?UFVyOEU2ZHcyUDk1YzFIQXFMaVJXLzBPWXhLUUovZUM0bk9NMEZDUy8zRmZy?=
 =?utf-8?B?ZWJLSXljYjlNQktPaGFUeGJoem5UMk1BS3lSWjVLV1BGaDJRVFBWdnpLT0lI?=
 =?utf-8?B?dFhkWGcxWG5ZT05IQlRXbVFnQVNFOEtIV3FoQklWM0pJSVZKdnBBUkFBR3ow?=
 =?utf-8?B?eTRGUkdSU1NDbTdRc2x4OElZak9JaGRmYXZWVlkyS3NXZGl0S0M3YXFDRUly?=
 =?utf-8?B?bDBBbncwamdvWFRGRTdFdnJqNmEzNGtuVFF3YVFadGc4T1RrNWx1azlyZkN1?=
 =?utf-8?B?eGl3d2NUdVBDU2cxSUdNTVFpeVhNd08wTlcxeHR3WHBXUFpaYXVDSWF2UVpO?=
 =?utf-8?B?MmZnOTNvUmxzT3gySWJHRDhZNGZnWEVUTC9NUGlqSldYUDUxODJObGJxSGVm?=
 =?utf-8?B?QkovV1psWFBuZHYwNmpOWEZzUmNjQlJnT2NhNUtQVXRIbWIvaHMxSzBSelhj?=
 =?utf-8?B?czQ4OSs3ZDc1elM2amtFa2FqMm5tb3FLWkVkelhwaFVKMmJFSXIwUGFReGVo?=
 =?utf-8?B?ODBFajFjSmVCS3lldlRJVXVwSlkweVByZzF6aEEwQ0ZOaEo0YURlbWM2QlJk?=
 =?utf-8?B?WTYyWmtuTzdhNWpHNWJkOXBNNGdZTFM1L210MFlEYTBjaDZlZXBtUjBwUi83?=
 =?utf-8?B?YTM5WklKUDRzV3A0cG5UakhPb0lVb1FmOUJoN3ptbEhRazFFZ2dTM25OOGVx?=
 =?utf-8?B?aVNkcHVZNFdCVVk5Y0lWWENkOEU1ZGxvcVlqbjFYVnNoRmNxQlU0L3ZXWXRx?=
 =?utf-8?B?U1RkcmVkVjk4Lzc4dVhUUXN3L3I4MjU2ZUk0QjV5bHlRMTBYYlFOMUloZTZx?=
 =?utf-8?B?OVhVcUh5S1NtREFhb1dNWXhvdTdOT3R0aThVOVBBZDlMK3krVE1uaGwyMm5R?=
 =?utf-8?B?S2JvVUtRdnVGUjB6ejRScC9GMzhVZEFRdGtPTE55UFZJU0RRRjFZT0ZmMmxs?=
 =?utf-8?B?UTlsKzBWTS9wUmhOcStDcUsxKzdrS2FQRFhnS2RwSzFUVlJpNVpoRzRnTXhv?=
 =?utf-8?B?MjJUUmN1UUdUMFd4NEMwcjNuRXg4a01aWE02Z21mL0UxVVI3OE1hL2Y3ZHEy?=
 =?utf-8?B?Y1lzWit0Z1NtVEJVTW1PWE1sL0d3eXh0NVg5SVBaWXFBMHhnWUVwd1h4U242?=
 =?utf-8?B?ZEpCWCtyWHV4VnNTL2FWZyt5S2w4b2JuKzhsZm9pZ3dnSGRGc3Vpb3QwL2p5?=
 =?utf-8?B?RWdIYUM5VStja2FIdHlSYjF1MDlYVllpYXNKSVUrdGk4NG13UXBHMkdPaTlK?=
 =?utf-8?B?RXJwNnFVeDJrNHNtUE84NktlTVBGVkZpRWZlY0NzeENadmc5aFRuN2VTQ2lu?=
 =?utf-8?B?WEtLZkNXSnEwTlZWaDd1cDRRZzJpYm8wSENMTERNS3BRR1JTVyszR0ZkbVAv?=
 =?utf-8?B?ZCtubURBVS8wUnF4cGRRNzFUNVZ6MEx2N2FpMSt1bHl4ZUtIYXdpRXBlckR3?=
 =?utf-8?Q?NuFAGW?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2208D63307BB1F40A2BFA193D460D080@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10007
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47bfbb25-98a0-4d68-0432-08de3312782a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUtrdDlLUi9QWm5mWWpsSTZnZDNkSEsvblNIcFo3bDdzNDc3ZmtQWS9aQjFq?=
 =?utf-8?B?Z2ZxWjE2dFl0ZFVMaVdDRm1COElkUWM2V0NNM3dMWnorOGowRXFWWE5qVFFQ?=
 =?utf-8?B?anM1RzlCdlBRY1dYK09xMjBzcVBCaXQyQjhmN3ZnK0NLWTBtaXdRMTZseUsz?=
 =?utf-8?B?TFQxOXBqQUdRVDU1NFltZ2sxUXVIMnVGTmRXUEZQQmsvOWRZV2ZOYmlLMi9O?=
 =?utf-8?B?V1RHSGk2aGZFSitHNUZvNnRteWpQbkZKQXJiUDY4MHorV24rMFdsVnhhUGZ3?=
 =?utf-8?B?SlFPM2x5OVJmU2hVWVVOWEQyaks0SllYSWhEajlxWEZTTzg5NkpTVnhvbGo1?=
 =?utf-8?B?cjExazVLL1QxdS9rVVhneDg4a1BDWDJQbmVXT0xxallCa0NZdFV1Qm9FYkJC?=
 =?utf-8?B?bkhod3hzdjgwYXQrMjYxSlluWTBaU2Rac1o3WkpNbUhab21pYk0vUEdrdStu?=
 =?utf-8?B?b0VYaE9XQXREVGV1MjNkYUh1UXVPbkplcDNacVA3WTZaaEJ0cnR4enV1Nmsx?=
 =?utf-8?B?MFI5YU4xbXpMNXFKUjA2WU5ldGNBU0RpOTVqK04ra01PRjg0V1ZCN1dORFBz?=
 =?utf-8?B?dkltMHNiV003a1ZsOFI0OHprQTdlOFZxd0twNTB0dmdPaWN6bytabTJQajBm?=
 =?utf-8?B?RHRpRXArTlRNRk9CVTFJMVNHdTc3dUdzaG9hcW5JRkFQRDhhNW9DUEhrc2Ez?=
 =?utf-8?B?cGpxZGhCWklLYlNQaG5MMXBvSzBEelVpb0MzaTdoNnRCMGkwQU55YkJoeVJH?=
 =?utf-8?B?SUpldzJyZllNWkExUnJSVnd0YmFkRUZUNjg5NFI1QUJJUGxBd0ZKelNRVmI1?=
 =?utf-8?B?RnZ1ZDVpZ3p1NzFnOGJ5MFJXVTkwSWJaVnBtNTFOVlFEVlJUbXFMM0Y5TGd6?=
 =?utf-8?B?TmN6YkRMdGlVcnJuZ2sxQ2U3WkZ0V1BFaHF5L2JmajNiN3h6aUdZV3cyNldD?=
 =?utf-8?B?NVBoU04yOFJyQi9SVDJ1bDNObUF6QVZlN0hLNFQ2UjNxcjJVVWJJZHlURkJS?=
 =?utf-8?B?cDBJMTdLeVNRbmhoaCtWT0hzeWRLRzh6Z0hpRU90ZUxHWStRdXdGUGViM216?=
 =?utf-8?B?enF6SzhYeCtLS2MreFlMckU5OFRhUTlDVDhJaVh1OG5tRlo5dFpBY0lXQi9G?=
 =?utf-8?B?TTdJbXRidWY5NGE0YkRVSTlCbGJodjVPVnlLVTJTTEMrMTgyeXlaTDVwTkJv?=
 =?utf-8?B?ZVlLMndDQXc0Z0dxYm5DYThpbW9nNG9URTRpV3hMLzVwa01XRHFYMGs2eG9Y?=
 =?utf-8?B?cWszUStvd3QvdGM3VHN5TVpVR2E0a3dPSEhkZGN4QkhJMUNXT0wrNW1zMm9y?=
 =?utf-8?B?TjBvRTNDNEh4bS9SbkdwSU9KTmJGU0VEb1lRSmNyL0IxWllrSUdLc3JEN3FO?=
 =?utf-8?B?djZvQWZleUtEWnZlR01WSmhXdWZZdUdWMkZ5VCtVKzIxb1Vrdk55VVpjc1NQ?=
 =?utf-8?B?TTVBbmJsVVRnKzRJOTlLOTZManZmMTNVTi9MQVpwYjAxR2FhNnE0R2dsN24z?=
 =?utf-8?B?K2g2Q3RQd1dRd21vTUxqaVNvZGV0Q2NMd1huWnNZOFhhaXVaN241WFJTdDRi?=
 =?utf-8?B?TjZPM0h4cWQwV1VSK2xaNzRETFpubWRuRk40Qm8zT3VQZHpOUy9GVU1VbVQy?=
 =?utf-8?B?MXJiOVRUcGRkNjBiZ0Nhd2VpMHJFRnozaUJKMUtaTXhlaXNPSEQ3TFJSWmtU?=
 =?utf-8?B?UlVkcWpNQ1pmQWtmczh3MDR6Q3ZLbXVseVI1TXRYV0pPZW5mQUltUjQzb0ph?=
 =?utf-8?B?Wjh2NkZYZUw2SHUzTXBwaUYrM3puUUx3ZEk1bkM3NlZmajdkUUR1UWpEbjc4?=
 =?utf-8?B?U1gzSVBzZFZBSWY5NUNBdFoyRFVWZXVEWUJRVG8wUXBxbXlwS1cvRUErYVcw?=
 =?utf-8?B?cHZJNVhGU1hlNW9ZMXZXZy9hMXZ6QUl3Zk8wdkdINDdxdkZlOFJDNENkYWhp?=
 =?utf-8?B?VVdJK2hnYXJoamg2NDI2SEZVWDVoSTBKS1hISVByRE5KUWF3blpBU0V5Zmh3?=
 =?utf-8?B?VlhtRE5VN2xVSjUzMVFTUGIzTUtsNFNmeE5BTjl4N2dJRjBaMXBBVENVWHRz?=
 =?utf-8?B?cTlQcll6ck5wdVNUc0JkakVVM0Vqdm53NkJDbm96ZTI3SDk5bmpndHpycHlU?=
 =?utf-8?Q?AXOY=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 08:53:41.2092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 538dcf30-2add-4933-d13d-08de33129f98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7425

SGkgSmVucywNCg0KPiBPbiA0IERlYyAyMDI1LCBhdCAwODo1OSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCA0OjUz4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gQWR2ZXJ0aXNlIFJVTi9Z
SUVMRC9JTlRFUlJVUFQgdmlhIEZGQV9GRUFUVVJFUyBub3cgdGhhdCB0aGUgcnVudGltZQ0KPj4g
aGVscGVycyBhcmUgaW4gcGxhY2UsIGFuZCBleHBvc2UgdGhlIFJYL1RYIE1BUCBjYXBhY2l0eSBm
aWVsZCBvbmx5IG9uY2UNCj4+IGEgZ3Vlc3QgaGFzIG5lZ290aWF0ZWQgRkYtQSB2MS4yLg0KPj4g
DQo+PiBXaGlsZSB0aGVyZSwgZHJvcCB0aGUgc3RhbGUgPGFzbS90ZWUvZmZhLmg+IGluY2x1ZGUu
DQo+PiANCj4+IFRvIGNvbXBseSB3aXRoIHRoZSB3aWRlciB2MS4yIHJlZ2lzdGVyIEFCSSwgemVy
byByZWdpc3RlcnMgeDjigJN4MTcgd2hlbg0KPj4gcmVzcG9uZGluZyB0byBhIHYxLjIgVk0uIFRo
ZSBkaXNwYXRjaGVyIGFsc28gcmVqZWN0cyBTTUNDQzY0IGNhbGxzIGZyb20NCj4+IEFBcmNoMzIg
Z3Vlc3RzLg0KPj4gDQo+PiBGaW5hbGx5LCBidW1wIFhlbidzIEZGLUEgdmVyc2lvbiB0byAxLjIu
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmEuYyAgICAgICAgIHwg
MjUgKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJp
dmF0ZS5oIHwgMjggKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4gMiBmaWxlcyBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBp
bmRleCA4YjJmMDQyMjg3ZmMuLmM4ZmU5Nzg1NmQwNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IEBAIC0y
NCw5ICsyNCw2IEBADQo+PiAgKiBvIEZGQV9NRU1fRE9OQVRFXyogYW5kIEZGQV9NRU1fTEVORF8q
IC0gVXNlZCB3aGVuIHRyYW5mZXJyaW5nIG93bmVyc2hpcA0KPj4gICogICBvciBhY2Nlc3Mgb2Yg
YSBtZW1vcnkgcmVnaW9uDQo+PiAgKiBvIEZGQV9NU0dfU0VORDIgYW5kIEZGQV9NU0dfV0FJVCAt
IFVzZWQgZm9yIGluZGlyZWN0IG1lc3NhZ2luZw0KPj4gLSAqIG8gRkZBX01TR19ZSUVMRA0KPj4g
LSAqIG8gRkZBX0lOVEVSUlVQVCAtIFVzZWQgdG8gcmVwb3J0IHByZWVtcHRpb24NCj4+IC0gKiBv
IEZGQV9SVU4NCj4+ICAqDQo+PiAgKiBMaW1pdGF0aW9ucyBpbiB0aGUgaW1wbGVtZW50ZWQgRkYt
QSBpbnRlcmZhY2VzOg0KPj4gICogbyBGRkFfUlhUWF9NQVBfKjoNCj4+IEBAIC02OCw3ICs2NSw2
IEBADQo+PiAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+DQo+PiAjaW5jbHVkZSA8YXNtL3JlZ3MuaD4N
Cj4+ICNpbmNsdWRlIDxhc20vc21jY2MuaD4NCj4+IC0jaW5jbHVkZSA8YXNtL3RlZS9mZmEuaD4N
Cj4+ICNpbmNsdWRlIDxhc20vdGVlL3RlZS5oPg0KPj4gDQo+PiAjaW5jbHVkZSAiZmZhX3ByaXZh
dGUuaCINCj4+IEBAIC0yNjIsNiArMjU4LDkgQEAgc3RhdGljIHZvaWQgaGFuZGxlX2ZlYXR1cmVz
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgIGNhc2UgRkZBX01TR19TRU5EX0RJ
UkVDVF9SRVFfMzI6DQo+PiAgICAgY2FzZSBGRkFfTVNHX1NFTkRfRElSRUNUX1JFUV82NDoNCj4+
ICAgICBjYXNlIEZGQV9NU0dfU0VORDI6DQo+PiArICAgIGNhc2UgRkZBX1JVTjoNCj4+ICsgICAg
Y2FzZSBGRkFfSU5URVJSVVBUOg0KPj4gKyAgICBjYXNlIEZGQV9NU0dfWUlFTEQ6DQo+PiAgICAg
ICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIDAsIDApOw0KPj4gICAgICAgICBicmVhazsN
Cj4+ICAgICBjYXNlIEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRMjoNCj4+IEBAIC0yOTAsNyArMjg5
LDE2IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9mZWF0dXJlcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykNCj4+ICAgICAgICAgICogZGlmZmVycyBmcm9tIEZGQV9QQUdFX1NJWkUgKFNaXzRLKS4N
Cj4+ICAgICAgICAgICovDQo+PiAgICAgICAgIEJVSUxEX0JVR19PTihQQUdFX1NJWkUgIT0gRkZB
X1BBR0VfU0laRSk7DQo+PiAtICAgICAgICBmZmFfc2V0X3JlZ3Nfc3VjY2VzcyhyZWdzLCAwLCAw
KTsNCj4+ICsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBGcm9tIEZGQSB2MS4yLCB3
ZSBjYW4gZ2l2ZSB0aGUgbWF4aW11bSBudW1iZXIgb2YgcGFnZXMgd2Ugc3VwcG9ydA0KPj4gKyAg
ICAgICAgICogZm9yIHRoZSBSWC9UWCBidWZmZXJzLg0KPj4gKyAgICAgICAgICovDQo+PiArICAg
ICAgICBpZiAoIGN0eC0+Z3Vlc3RfdmVycyA8IEZGQV9WRVJTSU9OXzFfMiApDQo+PiArICAgICAg
ICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgMCwgMCk7DQo+PiArICAgICAgICBlbHNl
DQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgRkZBX01BWF9SWFRY
X1BBR0VfQ09VTlQgPDwgMTYsIDApOw0KPj4gKw0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBj
YXNlIEZGQV9GRUFUVVJFX05PVElGX1BFTkRfSU5UUjoNCj4+ICAgICAgICAgZmZhX3NldF9yZWdz
X3N1Y2Nlc3MocmVncywgR1VFU1RfRkZBX05PVElGX1BFTkRfSU5UUl9JRCwgMCk7DQo+PiBAQCAt
MzIzLDYgKzMzMSwxMyBAQCBzdGF0aWMgYm9vbCBmZmFfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgaWYgKCAhY3R4ICkNCj4+ICAgICAgICAgcmV0dXJuIGZh
bHNlOw0KPj4gDQo+PiArICAgIGlmICggIWlzXzY0Yml0X2RvbWFpbihkKSAmJiBzbWNjY19pc19j
b252XzY0KGZpZCkgKQ0KPiANCj4gWW91IHVzZSBjdHgtPmlzXzY0Yml0IGluIGZmYV9zZXRfcmVn
cygpIGJlbG93LCBidXQgaGVyZQ0KPiBpc182NGJpdF9kb21haW4oZCkuIFdoaWNoIG9uZSBkbyB3
ZSBwcmVmZXI/DQoNCkl0IHdvdWxkIGRlZmluaXRlbHkgYmUgbW9yZSBjb2hlcmVudCB0byB1c2Ug
Y3R4LT5pc182NGJpdC4NCg0KSSB3aWxsIGZpeCB0aGF0IGluIG5leHQgdmVyc2lvbi4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo=

