Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456ABAC0D70
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994023.1377061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6SB-0003Ia-Is; Thu, 22 May 2025 13:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994023.1377061; Thu, 22 May 2025 13:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6SB-0003H8-F5; Thu, 22 May 2025 13:59:23 +0000
Received: by outflank-mailman (input) for mailman id 994023;
 Thu, 22 May 2025 13:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isH4=YG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uI6S9-0003H2-Pl
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:59:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f403:2613::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f46ed1bf-3714-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 15:59:19 +0200 (CEST)
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 13:59:16 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::1a) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 13:59:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 13:59:14 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 by GV1PR08MB8331.eurprd08.prod.outlook.com (2603:10a6:150:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 13:58:41 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5]) by AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 13:58:41 +0000
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
X-Inumbo-ID: f46ed1bf-3714-11f0-a2fb-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qOpWW4US4b/qXM2hcFYpRmO7HQ77vM+i19M/h0aSnLp7zLZRaP3tNbZyYbYT48vPxjRAce+0iJgirTVIBdgo+B3U5W+ZWDIijnUSDzEcyPknSMFA9C2o5PT39PRElV3IODPb+hTEfBxfkCXQ0WmKS45uVSfmuzkUEy9gtPxPZgICVnXA9hsAwoLIpdRQm9iP+MHeFQ+6sp2wrkaRa7VXymzMFVIDSDoPfyWyEtoKlNgnGd5YIenPD22cSTw0QW3LS3wA5LsWZAzhXSGREe9Vb9xp3apZJpC3f/2ASB2lnt1MtNqfuJxUudKNkLKo/UUODrM3TZekPVlfAaFvYqXkhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1mILizijNvBHuu2LUFDZabhTpAs+Wfc8l4lB3Q9dnk=;
 b=HmSDyrj94PuiUa0iYaXYw2nQHhzfjupptbdrFRS7KSrZLbD7UgUrPbOO7tbjfA2qX1ADwR2k8ui55epywi3VYhvV9DHm0I7J9Ub2/1aa/AOst/ppiGlB9lzmW0Bt0DMJfrba2+X16rIzUmz5SjGW2ZyDFSbH4A3Cpk8OFwdevdkggKAIQDQB4Tdiy4LUFeBzV+VJ6CPBMf5P8K3Z74Jfj3c2JeDvEBcVXV9OoFKIdjN0dHC7O3x9hRQldV9dHyx5uGiTKH6cVOVOsbaykNAcOYpk4WJ+HMLXF+hPdfiBNOI6QRZ3oLsGbnVzeVMEqNZ/Cob4Ycb0n0QnKnp8dTwOgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1mILizijNvBHuu2LUFDZabhTpAs+Wfc8l4lB3Q9dnk=;
 b=oqbFOuaxwgjxdjRxNwpID9YMZzoU3Pa8zk1vFgQ40qv8flGsC+3H6gTW+/YVSK0CNHj7XwpfqBJqx3afT1vheSsogTYYbXoMgu1qRdP9hdcnOHmJmAPV2XxoyJAQLSKNEKBzrKI5fmkGT2DIf/PkdBrHIOayGrj1hsP4bVSztcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6C2B02cIi3coKL6f9WGI0QhJLWfZ+XWqhI9MnJXhyQcCIT+rU0O16lH8oHpeK5dU2RcIc/z93mhQNzxJ4Nmwu5QNvA1l+vsOwd0+6yCuKVXxYVftQoluUeKX+3JXf2X3n24s1rU4gKYWcnpZ9X2hVL1+JWqSZpTqybN7pnC+WrDtWI0+DuUXFOHIf5uEU0a7lBjO/y5F3b1Hh54bzF55Pato+gIZgCoQzciWEJxZ6Qhqd+sbaTt8stc/qbWKMRhRtkgKyqQI5KyLoZi9RbpIg/saFddNBsIJjHXCAV9IAJaTM5yWHWmWqUNm3myU9dy9alPFZjD9j+JlXGw1HOLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1mILizijNvBHuu2LUFDZabhTpAs+Wfc8l4lB3Q9dnk=;
 b=pECCeQD/A4qbacfF7n+fbVjfsy4w8Pe2rEaK0rNHFIBvyfaCmcUXD3XhDaCAWhMAbwoMZU2ms4xbgMsG54xxKklEZBwqMWR8GqmmUOTCSRKZN8prukM/gqAxBm/r5Q8zU+bkY7mbPPE23ffvKIj72KtVt6gNNN7AhzuOTZlaZHQ1DV4SUt7XCrdXe/RnhrDuiWufMlq7DcGfqEnMm234sj/fWsHesYQPXUtPvBObQSq10E3mlDKqymZ/pRdsLglzeyYsQz7hD31LxxrS7VRJqOgd/NiQd9hMlTUjCa8Bt9OfSZnAKzfYZ9JSWf1l++FAXHRkSK+zO01AO0zkSHyKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1mILizijNvBHuu2LUFDZabhTpAs+Wfc8l4lB3Q9dnk=;
 b=oqbFOuaxwgjxdjRxNwpID9YMZzoU3Pa8zk1vFgQ40qv8flGsC+3H6gTW+/YVSK0CNHj7XwpfqBJqx3afT1vheSsogTYYbXoMgu1qRdP9hdcnOHmJmAPV2XxoyJAQLSKNEKBzrKI5fmkGT2DIf/PkdBrHIOayGrj1hsP4bVSztcY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index:
 AQHbrqLcLBT6scPDY02nTshBGWfMDLPegcqAgAAE8ICAAAOdgIAACw0AgAAvnACAACDtgA==
Date: Thu, 22 May 2025 13:58:41 +0000
Message-ID: <0448FE4F-68B3-4320-B3CC-DA8C87FF6181@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44H5K+=eX_OhPMTCsNAeBb-XWMNout0UeLvSyJzYrnXRcg@mail.gmail.com>
 <D2791D4F-C357-43D3-A5ED-6719E5650F02@arm.com>
 <CAHUa44Gu2axg0UhXXt8U-W5kh=GejYJvCmcFOL0oiOa=iYKkfg@mail.gmail.com>
 <54AE155E-5D83-4C45-B21C-7BB264ADB7E9@arm.com>
 <CAHUa44ER4Mqe2DMFhajH5BM15oH+4-BOn6xtzQ4o+P7He8E_pQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44ER4Mqe2DMFhajH5BM15oH+4-BOn6xtzQ4o+P7He8E_pQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM8PR08MB6578:EE_|GV1PR08MB8331:EE_|AMS0EPF000001B7:EE_|VI1PR08MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5702aa7a-7744-43a7-3084-08dd9938d62c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z0pFazUzOHJNM1drRkRxa0VUNTlMUjFWM1kwRlphbWdjbUlZVkpDU0NYTm5H?=
 =?utf-8?B?VUlUWW5EaTNXdUhIb0RkZ3FCL1NoZ1h6MkY0WDI5bXNxelc2Tld2NlFtc2l5?=
 =?utf-8?B?ejBWOExrTmtzQTZVb25wNFpNdlZZZFRXWVJoMnFxZjdBZGU4Y0RSSmZqUUdq?=
 =?utf-8?B?cCt6b1lyZnNWVklKRjVSWnJPTTJ6QXprS2FEeFU1cS9lSGNxejlqRmZLbUVq?=
 =?utf-8?B?VGtBZ2drWmVHTEhteTN5bE1XNEJocjRiajhORmUzTU9icjdrM2dqKzBOTVl1?=
 =?utf-8?B?cytReVFNQnB2NDBXOGszNGZBK3Z1QzJtUzlSY0xaemw4K0pTbU1rb08yWEk1?=
 =?utf-8?B?RmkxbGluNVhqYUdIZFNibm1vWUFsV0FxbDBSdGFFeU1xUEI5Y20wYmxBSnNM?=
 =?utf-8?B?cnhqb3VjK3lxNnI4KzF0V3NHYVlYeEthbG5VNjlZeVJyQldNcGdwRFlGcW41?=
 =?utf-8?B?eEVudzkzWkxjelFaSFUyWVc1bXpKT1VzVmNkQkNIUGhYWDQrdlpRRkUyWHFV?=
 =?utf-8?B?QVdmKzBCTjJZcHpDU2RQZ2pWOVVHUTQ4YlZKcStLMEFKSDZBSGdQU3ZHQ2F0?=
 =?utf-8?B?WXUrc2ZrMWlicklRQ0pnOCtqaXBRcUxIaW40eHlldVk3YUhrb1QvWC84UXB1?=
 =?utf-8?B?TjdvQTFKdTd4aW5hVUZOVnAyUEdkdVBDZGJFVWIyZDhEdk9INDRVVklRNmFD?=
 =?utf-8?B?UTV2K2d6clc1dFBNalQ0UjZRYWZlbzZBRWNrNXluNmFnYVFDZnIwbGxFQXM4?=
 =?utf-8?B?S2lBc0xyTzZsWFI4ejEzTlFtdVZVQlpnMWFyamdUMFJ6dmxndDdWMS9PY0t1?=
 =?utf-8?B?dGZSS0toQUs4N25iTmpaU2FBSm5YWlByWGgzS3NQL0dtREh3SGRCMEk0ME81?=
 =?utf-8?B?WHpXY3cvVkYzZWdxSUloeENvOE0vTTJVNGJTa04xT0NtU0RyS3pDbkhKYnRX?=
 =?utf-8?B?Nm5jaGluUEx2K3ZFUTk1T0oxZHo1eU5sQlY1MlpYRE5YQ1lQMXJodUZ5U2N2?=
 =?utf-8?B?WkpocEJGRGVTcVFmd3hLZnArOE90VU52R0NNaDNYcmFxbzV5UUZJQXB0QWhY?=
 =?utf-8?B?VzJjeW5KajFIN0tmUjhobVVuRHpyaWhYVWRJM1ZWb1krQVhWNU15WFBtdTh5?=
 =?utf-8?B?S0thL2JjL2FURjBzVWJudUkzRnp1Rms2Y2pnNlVCKy9JdWprOEkwN0R5MFFV?=
 =?utf-8?B?WFM0SDlNWERoR2ZTS09jM3Voaml0UitUWStsek5IOUpQeFVEZ1BKaldLcWF5?=
 =?utf-8?B?dzB5NEJFTHRXckV6OGZXOHNQTVpuZDdJVHEvSy9CKy96NUNIc0Z1bC9iR0cv?=
 =?utf-8?B?UnhHSlM2aDBkMFBZeUZYMkNYL2dzd00yMS9qSE9YQ2tYNFJ3Sm45OGptWjFO?=
 =?utf-8?B?QnEvcGxNT1M3WU9DeHd0dFFtbFFWR29UNjJHVTVxMFFjWm13ZUhEc2RLSVln?=
 =?utf-8?B?Ukt6L21WUld5a0F2MmJzNklHUFlsTEdKSkQ1RjQrc25JNUlTTDNaaUNPNnhT?=
 =?utf-8?B?VERkei9zbTBnT0l3dU5hbFNQb3ByNU5tSnUyckdrUCtoUlNWRWZ2Qjh0MGxG?=
 =?utf-8?B?OXZ0bG5PbWlBVkZTSFZoTFpsNjdKdGExQUpkTEg3LzdQZS94cFg4cEVMakhG?=
 =?utf-8?B?clA1MlM2YUxmcmduNHNpTGVkb1pPUUxsS0paNHMzZU5zd0NTbW5SS1VjUytG?=
 =?utf-8?B?djgrS0srVVJKTm0rUnVsNGI3Ty9Ja29MaXNKWE9xTUlwL3Q2aUZSaFZ2MDZj?=
 =?utf-8?B?SEJ4RW5aa0UwakZNN3ZKMmhjL0tsVjV5NDFJRkkzYUlLRzlaVnVvbmNXNzlo?=
 =?utf-8?B?eFNMcTJmSTVWZk1NcEYyYWhibzdISUNlRzZoRmpkZk92OEdlYVRlNmpwT0dl?=
 =?utf-8?B?RVpIaFZ5d3c0eXhiQkVrYTd0MjdPcDBCMnU0RUVicUsyVmJpczdyN0FjMGtR?=
 =?utf-8?B?SDVDMjBodDBsZUZ0NXhEa0tQcU03c2M5bjRrYlRWZU5LRXppeGc5RGxMcXhD?=
 =?utf-8?B?MHp3aEM2QkRRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <631BA1A74C4A454DAA0849C2004BFD4D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8331
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b749c7a-d2b4-4412-3292-08dd9938c251
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|35042699022|1800799024|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVl2ZElPT09mc3JjUnJLRHNYdFR3aXBOSGlEa2xFQVNkZlU0NUJCZnd3RmFz?=
 =?utf-8?B?bzJEMTVZU0dyYXNOeEhzZDBSeE4rWjZXVURhRDdoaDhoc0VucjloMVdyRjNV?=
 =?utf-8?B?U1lla2ZOc1kxRGdIak00SDJlSThPVU5wcDJrU1dCdkNmb1hHTUFhcTdweDc5?=
 =?utf-8?B?b3o3VjZvZ09jalRxZTIvY3pzUHNsS0M3RTN1ME1pOVhIQ0VaU2tad0l4bFZz?=
 =?utf-8?B?TEt3b3RGRnZjbUR2U3RSUldPSDZmSkd4dUlsSVRCK0Y2eUVDeGVhSW9wbmh5?=
 =?utf-8?B?ZGpRT1JNUmtRS01hNVN5M2dGTEFmZjAybGpreVJNci8zbnhod2ZKWnNaSkJ4?=
 =?utf-8?B?aklSNmZnQ3I2SUJ6RUJlUVRjRk1PL2ZsUW9ieU5ha1FYUEhPR2JsdzVJdzFW?=
 =?utf-8?B?Y2laSGIrdUt2TmU0aE9VdDJvckFSU0lkTVJkUFErT3VqcDl1NlYxbjVIOXkw?=
 =?utf-8?B?TnZ5cjNxTi9tdDZWUVZUWHpyd3N2S2dWaStPb1hRYkoyUXV6Rm96Y1BEVXNw?=
 =?utf-8?B?VEpGU203MDg0UVhZcjVRM3h6bzlwaU5jLzYwbTBNOVE1aVAweXZkNDQ4M2NP?=
 =?utf-8?B?aGdxdGJOL1VIUFNpdy9CaGRhbFJKN2g4eWVHckZEelpwbWFnSjcxV2w4Qm1r?=
 =?utf-8?B?T2pENWNHZEpzdlZhZlByQ1AxYXB6Y1I0Z3NFUVVrNkFVWGNIUVpZcmp4UFlI?=
 =?utf-8?B?bzk1L3JsZ2FhNGpDMDZhbFhOcTR6WnZOMW54dXpYSDYrQUN4QUJZQ3NuK0I2?=
 =?utf-8?B?VEs0VFNGalIySWlaVUVOaGZCSWk3cFUwNEd0bHJENklKcEdzTlphazVOcWNE?=
 =?utf-8?B?OW5jS2YvbG9lVGMvOFNzRWMrTHlwT1F2dVI1RkMvNlNQUjBVN1h3ZmkzRkFr?=
 =?utf-8?B?ZWoyVCtZOVB4aCt2ZVU1Mzdha05LMUc2anYyNUxIWmVCaENObTU3UmZoRXJS?=
 =?utf-8?B?VC9GSFpoNEEvbU42NDh3cXVob2E4ZjV0Q2E5VURYcXZJQlJrUmxzODdzWi9U?=
 =?utf-8?B?STVZVWsyUkVwSFh1cmZMTEYzc25qWjhwRHQ5YjRHKzcwdUpWclAzcnYwTytN?=
 =?utf-8?B?WU9GTEpnSzI2a0lVallORXNQeXNjd2Y3UGQvbi9EMGRncnFFMG1WOHZaVHla?=
 =?utf-8?B?OEdWZGVzVFZMOC9ycXNjdUN4UEJhVTFkVWlObVBGa1NhTG5rZ3hVaVd0cm1r?=
 =?utf-8?B?MysrcllsbENyY0VvenRnODRIVnlibjlZQjUvR2N3ZEZpZnpVMERFZFpJRm5L?=
 =?utf-8?B?aHBza2hqNW55bkNhN3NuRDNwejRRL0hMR1dzKzhraVR3QUpRMDZ0QVYrL3Ns?=
 =?utf-8?B?UmMyUGphc2lheTU1N1dUTWRtOVJsYm0rWXNSZVNGMWxKUnhlejl6eDd1ekg1?=
 =?utf-8?B?b3NrMERNcUxIM1ptaGU2dCtOb2VnTlhsVWhXWWVsZ202K3VpVFFZb2dMbWln?=
 =?utf-8?B?eDh5NzM1M0hBZ2w4RSsrdU13WDd0UHc5MjRHZnVoNlNGMzVPVWxiODhVUjlk?=
 =?utf-8?B?bFRra1E5bHdLQWUwMkpyL1BNUW5XVGxvZkxrZE5URTNKSmQzWlB4U0hYUEdj?=
 =?utf-8?B?cnlLWUlaQjlzSUVuQVNWcjc1dlhPbm1iQmk3NlYwTWZERE9ndHAzWEVjU1ZE?=
 =?utf-8?B?bnFzZ21FdnpWK2NSYmJCcU92bnpqNXVpK2dGWkhDQWJrNEQ5RmNnWk9BcWhu?=
 =?utf-8?B?dGsvTFJnbjRzT1piRmxkNi9iQTc1U1piRmIvTUE3V3NXczJBdTBYQ0Vld0dZ?=
 =?utf-8?B?RXVLaUpIVU5PZkpxcityczFnOW5lRUZGSFlWL2xzMHJXOXEwY0VMQTQwUUY2?=
 =?utf-8?B?SlhtNUxxL1VFcTBNTER4T2xhVTNaVmdUcUVHa00xZ2h6YW5aZ0I1a1IrcTFY?=
 =?utf-8?B?clNZTlJicWN5d3ZDSk9hd2F0VlJ0czc2M1BvRGFwdGllaVhOWG9NVzZhY3N0?=
 =?utf-8?B?NEkrRjlYZzErUFBKVHE1SGYzM1hCMkZIdVpheVpVQVZIdzBZWHdTRmRPODhz?=
 =?utf-8?B?cmNBMC96OEhSbmZmS1daTWlhOHBNRVZuL0sxMUZpc0poWkVtdi9QNDhmSUdE?=
 =?utf-8?Q?qJdgGN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:59:14.5982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5702aa7a-7744-43a7-3084-08dd9938d62c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517

SGkgSmVucywNCg0KPiBPbiAyMiBNYXkgMjAyNSwgYXQgMTQ6MDAsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgMTE6MTHigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4g
DQo+Pj4gT24gMjIgTWF5IDIwMjUsIGF0IDEwOjMwLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGksDQo+Pj4gDQo+Pj4gT24gVGh1
LCBNYXkgMjIsIDIwMjUgYXQgMTA6MTjigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+Pj4gPEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBIaSBKZW5zLA0KPj4+PiAN
Cj4+Pj4+IE9uIDIyIE1heSAyMDI1LCBhdCAxMDowMCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lr
bGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSBCZXJ0cmFuZCwNCj4+
Pj4+IA0KPj4+Pj4gT24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgOTo0MOKAr0FNIEJlcnRyYW5kIE1h
cnF1aXMNCj4+Pj4+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+Pj4+IA0K
Pj4+Pj4+IFdoZW4gVk0gdG8gVk0gc3VwcG9ydCBpcyBhY3RpdmF0ZWQgYW5kIHRoZXJlIGlzIG5v
IHN1aXRhYmxlIEZGLUEgc3VwcG9ydA0KPj4+Pj4+IGluIHRoZSBmaXJtd2FyZSwgZW5hYmxlIEZG
LUEgc3VwcG9ydCBmb3IgVk1zIHRvIGFsbG93IHVzaW5nIGl0IGZvciBWTSB0bw0KPj4+Pj4+IFZN
IGNvbW11bmljYXRpb25zLg0KPj4+Pj4+IElmIHRoZXJlIGlzIE9QLVRFRSBydW5uaW5nIGluIHRo
ZSBzZWN1cmUgd29ybGQgYW5kIHVzaW5nIHRoZSBub24gRkYtQQ0KPj4+Pj4+IGNvbW11bmljYXRp
b24gc3lzdGVtLCBoYXZpbmcgQ09ORklHX0ZGQV9WTV9UT19WTSBjb3VsZCBiZSBub24gZnVuY3Rp
b25hbA0KPj4+Pj4+IChpZiBvcHRlZSBpcyBwcm9iZWQgZmlyc3QpIG9yIE9QLVRFRSBjb3VsZCBi
ZSBub24gZnVuY3Rpb25hbCAoaWYgRkYtQSBpcw0KPj4+Pj4+IHByb2JlZCBmaXJzdCkgc28gaXQg
aXMgbm90IHJlY29tbWVuZGVkIHRvIGFjdGl2YXRlIHRoZSBjb25maWd1cmF0aW9uDQo+Pj4+Pj4g
b3B0aW9uIGZvciBzdWNoIHN5c3RlbXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVG8gbWFrZSBidWZmZXIg
ZnVsbCBub3RpZmljYXRpb24gd29yayBiZXR3ZWVuIFZNcyB3aGVuIHRoZXJlIGlzIG5vDQo+Pj4+
Pj4gZmlybXdhcmUsIHJld29yayB0aGUgbm90aWZpY2F0aW9uIGhhbmRsaW5nIGFuZCBtb2RpZnkg
dGhlIGdsb2JhbCBmbGFnIHRvDQo+Pj4+Pj4gb25seSBiZSB1c2VkIGFzIGNoZWNrIGZvciBmaXJt
d2FyZSBub3RpZmljYXRpb24gc3VwcG9ydCBpbnN0ZWFkLg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+
Pj4+PiAtLS0NCj4+Pj4+PiBDaGFuZ2VzIGluIHY1Og0KPj4+Pj4+IC0gaW5pdCBjdHggbGlzdCB3
aGVuIHRoZXJlIGlzIG5vIGZpcm13YXJlDQo+Pj4+Pj4gLSByZXdvcmsgaW5pdCBhIGJpdCB0byBw
cmV2ZW50IGR1cGxpY2F0ZXMNCj4+Pj4+PiAtIFJlbW92ZSBKZW5zIFItYiBkdWUgdG8gY2hhbmdl
cyBkb25lDQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2NDoNCj4+Pj4+PiAtIEZpeCBPcHRlZSB0byBPUC1U
RUUgaW4gY29tbWl0IG1lc3NhZ2UNCj4+Pj4+PiAtIEFkZCBKZW5zIFItYg0KPj4+Pj4+IENoYW5n
ZXMgaW4gdjM6DQo+Pj4+Pj4gLSBmaXggdHlwb3MgaW4gY29tbWl0IG1lc3NhZ2UNCj4+Pj4+PiAt
IGFkZCBzcGFjZXMgYXJvdW5kIDw8DQo+Pj4+Pj4gLSBtb3ZlIG5vdGlmaWNhdGlvbiBpZCBmaXgg
YmFjayBpbnRvIGJ1ZmZlciBmdWxsIHBhdGNoDQo+Pj4+Pj4gLSBmaXggfCBwb3NpdGlvbiBpbiBp
Zg0KPj4+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+Pj4gLSByZXBsYWNlIGlmZGVmIHdpdGggSVNf
RU5BQkxFRCB3aGVuIHBvc3NpYmxlDQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4geGVuL2FyY2gvYXJtL3Rl
ZS9mZmEuYyAgICAgICB8ICAyNCArKysrKystLQ0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZh
X25vdGlmLmMgfCAxMDQgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4+
PiAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQ0KPj4+
Pj4+IA0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmEuYw0KPj4+Pj4+IGluZGV4IGMxYzRjMDk1NzA5MS4uYjg2Yzg4Y2VmYThj
IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+Pj4+Pj4gQEAgLTM0Miw4ICszNDIsOSBAQCBzdGF0
aWMgaW50IGZmYV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+Pj4+ICAgc3RydWN0
IGZmYV9jdHggKmN0eDsNCj4+Pj4+PiAgIGludCByZXQ7DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSAgICBp
ZiAoICFmZmFfZndfdmVyc2lvbiApDQo+Pj4+Pj4gKyAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJ
R19GRkFfVk1fVE9fVk0pICYmICFmZmFfZndfdmVyc2lvbiApDQo+Pj4+Pj4gICAgICAgcmV0dXJu
IC1FTk9ERVY7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgLyoNCj4+Pj4+PiAgICAqIFdlIGFyZSB1c2lu
ZyB0aGUgZG9tYWluX2lkICsgMSBhcyB0aGUgRkYtQSBJRCBmb3IgVk1zIGFzIEZGLUEgSUQgMCBp
cw0KPj4+Pj4+ICAgICogcmVzZXJ2ZWQgZm9yIHRoZSBoeXBlcnZpc29yIGFuZCB3ZSBvbmx5IHN1
cHBvcnQgc2VjdXJlIGVuZHBvaW50cyB1c2luZw0KPj4+Pj4+IEBAIC01NzksMTEgKzU4MCw4IEBA
IHN0YXRpYyBib29sIGZmYV9wcm9iZSh2b2lkKQ0KPj4+Pj4+ICAgICAgIGdvdG8gZXJyX3J4dHhf
ZGVzdHJveTsNCj4+Pj4+PiANCj4+Pj4+PiAgIGZmYV9ub3RpZl9pbml0KCk7DQo+Pj4+Pj4gLSAg
ICBJTklUX0xJU1RfSEVBRCgmZmZhX3RlYXJkb3duX2hlYWQpOw0KPj4+Pj4+IC0gICAgSU5JVF9M
SVNUX0hFQUQoJmZmYV9jdHhfaGVhZCk7DQo+Pj4+Pj4gLSAgICBpbml0X3RpbWVyKCZmZmFfdGVh
cmRvd25fdGltZXIsIGZmYV90ZWFyZG93bl90aW1lcl9jYWxsYmFjaywgTlVMTCwgMCk7DQo+Pj4+
Pj4gDQo+Pj4+Pj4gLSAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4+PiArICAgIGdvdG8gZXhpdDsNCj4+
Pj4+PiANCj4+Pj4+PiBlcnJfcnh0eF9kZXN0cm95Og0KPj4+Pj4+ICAgZmZhX3J4dHhfZGVzdHJv
eSgpOw0KPj4+Pj4+IEBAIC01OTIsNiArNTkwLDIyIEBAIGVycl9ub19mdzoNCj4+Pj4+PiAgIGJp
dG1hcF96ZXJvKGZmYV9md19hYmlfc3VwcG9ydGVkLCBGRkFfQUJJX0JJVE1BUF9TSVpFKTsNCj4+
Pj4+PiAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiQVJNIEZGLUEgTm8gZmlybXdhcmUgc3VwcG9y
dFxuIik7DQo+Pj4+Pj4gDQo+Pj4+Pj4gK2V4aXQ6DQo+Pj4+Pj4gKyAgICBpZiAoIElTX0VOQUJM
RUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgfHwgZmZhX2Z3X3ZlcnNpb24gKQ0KPj4+Pj4+ICsgICAg
ew0KPj4+Pj4+ICsgICAgICAgIElOSVRfTElTVF9IRUFEKCZmZmFfdGVhcmRvd25faGVhZCk7DQo+
Pj4+Pj4gKyAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmZmYV9jdHhfaGVhZCk7DQo+Pj4+Pj4gKyAg
ICAgICAgaW5pdF90aW1lcigmZmZhX3RlYXJkb3duX3RpbWVyLCBmZmFfdGVhcmRvd25fdGltZXJf
Y2FsbGJhY2ssIE5VTEwsIDApOw0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAg
IGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQo+Pj4+Pj4gKyAgICB7DQo+
Pj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJBUk0gRkYtQSBvbmx5IGF2YWlsYWJs
ZSBiZXR3ZWVuIFZNc1xuIik7DQo+Pj4+PiANCj4+Pj4+IFRoaXMgc2hvdWxkIG9ubHkgYmUgcHJp
bnRlZCBpZiBmZmFfZndfdmVyc2lvbiA9PSAwDQo+Pj4+IA0KPj4+PiBSaWdodCBpIHdpbGwgZml4
IGJ1dCAuLi4NCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+
Pj4+PiArICAgIH0NCj4+Pj4+PiArICAgIGVsc2UgaWYgKCBmZmFfZndfdmVyc2lvbiApDQo+Pj4+
PiANCj4+Pj4+IFRoZSBlbHNlIGlzbid0IG5lZWRlZC4NCj4+Pj4gDQo+Pj4+IHRoZSBlbHNlIGlz
IG5lZWRlZCBzbyB0aGF0IHdlIHJldHVybiB0cnVlIGFuZCBub3QgZmFsc2UuDQo+Pj4gDQo+Pj4g
SSBtZWFudCB0aGUgImVsc2UiIGlzbid0IG5lZWRlZCwgdGhlICJpZiIgaXMgc3RpbGwgbmVlZGVk
LCBhcyB5b3UgZXhwbGFpbi4NCj4+PiANCj4+Pj4gDQo+Pj4+IFdlIGhhdmUgMyBjYXNlczoNCj4+
Pj4gLSBmaXJtd2FyZSBpcyB0aGVyZTogcmV0dXJuIHRydWUNCj4+Pj4gLSBmaXJtd2FyZSBub3Qg
dGhlcmUgYnV0IHZtIHRvIHZtIGVuYWJsZTogcmV0dXJuIHRydWUNCj4+Pj4gLSBvdGhlcndpc2U6
IHJldHVybiBmYWxzZQ0KPj4+PiANCj4+Pj4gSSB3aWxsIG1vZGlmeSBpdCBsaWtlIHRoaXMgdG8g
bWFrZSBpdCBjbGVhcmVyOg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmEu
YyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4gaW5kZXggNTdiNjQ4YTIyODQwLi43Njhi
NGU5ZWM5NjggMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4+PiBAQCAtNjAxLDEzICs2MDEsMTMgQEAg
ZXhpdDoNCj4+Pj4gICAgICAgIGluaXRfdGltZXIoJmZmYV90ZWFyZG93bl90aW1lciwgZmZhX3Rl
YXJkb3duX3RpbWVyX2NhbGxiYWNrLCBOVUxMLCAwKTsNCj4+Pj4gICAgfQ0KPj4+PiANCj4+Pj4g
LSAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0KPj4+PiArICAgIGlm
ICggZmZhX2Z3X3ZlcnNpb24gKQ0KPj4+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+Pj4gKyAg
ICBlbHNlIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQo+Pj4+ICAgIHsN
Cj4+Pj4gICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQVJNIEZGLUEgb25seSBhdmFpbGFibGUg
YmV0d2VlbiBWTXNcbiIpOw0KPj4+PiAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4+ICAgIH0NCj4+
Pj4gLSAgICBlbHNlIGlmICggZmZhX2Z3X3ZlcnNpb24gKQ0KPj4+PiAtICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4+Pj4gDQo+Pj4+ICAgIHJldHVybiBmYWxzZTsNCj4+Pj4gfQ0KPj4+PiANCj4+Pj4g
VGVsbCBtZSBpZiB5b3UgYWdyZWUuDQo+Pj4gDQo+Pj4gWWVzLCB0aGlzIGlzIGFuIGltcHJvdmVt
ZW50LiBBIHJldHVybiBhdCB0aGUgZW5kIG9mIGFuIGlmIGJsb2NrIG1ha2VzDQo+Pj4gdGhlIGV2
ZW50dWFsIGZvbGxvd2luZyAiZWxzZSIgcmVkdW5kYW50LiBJIHN1cHBvc2UgdGhlcmUgYXJlIGNv
ZGluZw0KPj4+IHN0eWxlcyB3aGVyZSBpdCdzIHN0aWxsIHByZWZlcnJlZC4gSSdtIG5vdCBzdXJl
IGlmIHRoYXQgYXBwbGllcyBpbg0KPj4+IFhlbiwgdGhvdWdoLg0KPj4gDQo+PiBJIG5vdyBnZXQg
d2hhdCB5b3UgbWVhbiBhbmQgeW91IHdvdWxkIGxpa2UgdGhlIHJldHVybiBmYWxzZSB0byBiZSBp
biBhIGVsc2UuDQo+PiANCj4+IFJlbG9va2luZyBhdCB0aGUgY29kZSwgaSBhY3R1YWxseSBkbyBu
b3QgbGlrZSB0aGUgZmFjdCB0aGF0IHdlIGRvIHNvIG11Y2ggaW4NCj4+IGV4aXQgYW5kIGkgdGhp
bmsgaSBjYW4gbW92ZSBhIGJpdCB0aGUgY29kZSB0byBiZSBjbGVhcmVyOg0KPj4gLSBwdXQgdGhl
IGZ3IGluaXQgaW4gYSBzdWIgZnVuY3Rpb24NCj4+IC0gY3JlYXRlIGEgdm1fdG9fdm0gaW5pdCBm
dW5jdGlvbg0KPj4gLSBpbiBwcm9iZSBjYWxsIGJvdGggZnVuY3Rpb25zIGFuZCBkbyB0aGUgY29t
bW9uIGluaXQgcGFydCBpZiBhdCBsZWFzdCBvbmUgc3VjY2VkZWQNCj4gDQo+IEkgd2FzIHN0YXJ0
aW5nIHRvIHRoaW5rIGFsb25nIHRob3NlIGxpbmVzLCB0b28uIDotKQ0KPiANCj4+IA0KPj4gU29t
ZXRoaW5nIGxpa2UgdGhpczoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5j
IGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gaW5kZXggNTdiNjQ4YTIyODQwLi40MmRmYzcx
YTEyZDcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBAQCAtNDc4LDM4ICs0NzgsMTIgQEAgc3RhdGljIHZv
aWQgZmZhX2luaXRfc2Vjb25kYXJ5KHZvaWQpDQo+PiAgICAgZmZhX25vdGlmX2luaXRfaW50ZXJy
dXB0KCk7DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgYm9vbCBmZmFfcHJvYmUodm9pZCkNCj4+ICtz
dGF0aWMgYm9vbCBmZmFfcHJvYmVfZncodm9pZCkNCj4+IHsNCj4+ICAgICB1aW50MzJfdCB2ZXJz
Ow0KPj4gICAgIHVuc2lnbmVkIGludCBtYWpvcl92ZXJzOw0KPj4gICAgIHVuc2lnbmVkIGludCBt
aW5vcl92ZXJzOw0KPj4gDQo+PiAtICAgIC8qDQo+PiAtICAgICAqIEZGLUEgb2Z0ZW4gd29ya3Mg
aW4gdW5pdHMgb2YgNEsgcGFnZXMgYW5kIGN1cnJlbnRseSBpdCdzIGFzc3VtZWQNCj4+IC0gICAg
ICogdGhhdCB3ZSBjYW4gbWFwIG1lbW9yeSB1c2luZyB0aGF0IGdyYW51bGFyaXR5LiBTZWUgYWxz
byB0aGUgY29tbWVudA0KPj4gLSAgICAgKiBhYm92ZSB0aGUgRkZBX1BBR0VfU0laRSBkZWZpbmUu
DQo+PiAtICAgICAqDQo+PiAtICAgICAqIEl0IGlzIHBvc3NpYmxlIHRvIHN1cHBvcnQgYSBQQUdF
X1NJWkUgbGFyZ2VyIHRoYW4gNEsgaW4gWGVuLCBidXQNCj4+IC0gICAgICogdW50aWwgdGhhdCBp
cyBmdWxseSBoYW5kbGVkIGluIHRoaXMgY29kZSBtYWtlIHN1cmUgdGhhdCB3ZSBvbmx5IHVzZQ0K
Pj4gLSAgICAgKiA0SyBwYWdlIHNpemVzLg0KPj4gLSAgICAgKi8NCj4+IC0gICAgQlVJTERfQlVH
X09OKFBBR0VfU0laRSAhPSBGRkFfUEFHRV9TSVpFKTsNCj4+IC0NCj4+IC0gICAgcHJpbnRrKFhF
TkxPR19JTkZPICJBUk0gRkYtQSBNZWRpYXRvciB2ZXJzaW9uICV1LiV1XG4iLA0KPj4gLSAgICAg
ICAgICAgRkZBX01ZX1ZFUlNJT05fTUFKT1IsIEZGQV9NWV9WRVJTSU9OX01JTk9SKTsNCj4+IC0N
Cj4+IC0gICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+IC0gICAg
ew0KPj4gLSAgICAgICAgLyoNCj4+IC0gICAgICAgICAqIFdoZW4gRkZBIFZNIHRvIFZNIGlzIGVu
YWJsZWQsIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMgbm90DQo+PiAtICAgICAgICAg
KiBvZmZlciBhbnkgd2F5IHRvIGxpbWl0IHdoaWNoIFZNIGNhbiBjb21tdW5pY2F0ZSB3aXRoIHdo
aWNoIFZNIHVzaW5nDQo+PiAtICAgICAgICAgKiBGRi1BLg0KPj4gLSAgICAgICAgICogU2lnbmFs
IHRoaXMgaW4gdGhlIHhlbiBjb25zb2xlIGFuZCB0YWludCB0aGUgc3lzdGVtIGFzIGluc2VjdXJl
Lg0KPj4gLSAgICAgICAgICogVE9ETzogSW50cm9kdWNlIGEgc29sdXRpb24gdG8gbGltaXQgd2hh
dCBhIFZNIGNhbiBkbyB0aHJvdWdoIEZGQS4NCj4+IC0gICAgICAgICAqLw0KPj4gLSAgICAgICAg
cHJpbnRrKFhFTkxPR19FUlIgImZmYTogVk0gdG8gVk0gaXMgZW5hYmxlZCwgc3lzdGVtIGlzIGlu
c2VjdXJlICEhXG4iKTsNCj4+IC0gICAgICAgIGFkZF90YWludChUQUlOVF9NQUNISU5FX0lOU0VD
VVJFKTsNCj4+IC0gICAgfQ0KPj4gICAgIC8qDQo+PiAgICAgICogcHNjaV9pbml0X3NtY2NjKCkg
dXBkYXRlcyB0aGlzIHZhbHVlIHdpdGggd2hhdCdzIHJlcG9ydGVkIGJ5IEVMLTMNCj4+ICAgICAg
KiBvciBzZWN1cmUgd29ybGQuDQo+PiBAQCAtNTI4LDExICs1MDIsNiBAQCBzdGF0aWMgYm9vbCBm
ZmFfcHJvYmUodm9pZCkNCj4+ICAgICAgICAgZ290byBlcnJfbm9fZnc7DQo+PiAgICAgfQ0KPj4g
DQo+PiAtICAgIC8qIFNvbWUgc2FuaXR5IGNoZWNrIGluIGNhc2Ugd2UgdXBkYXRlIHRoZSB2ZXJz
aW9uIHdlIHN1cHBvcnQgKi8NCj4+IC0gICAgQlVJTERfQlVHX09OKEZGQV9NSU5fU1BNQ19WRVJT
SU9OID4gRkZBX01ZX1ZFUlNJT04pOw0KPj4gLSAgICBCVUlMRF9CVUdfT04oRkZBX1ZFUlNJT05f
TUFKT1IoRkZBX01JTl9TUE1DX1ZFUlNJT04pICE9DQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBGRkFfTVlfVkVSU0lPTl9NQUpPUik7DQo+PiAtDQo+PiAgICAgbWFqb3Jf
dmVycyA9IEZGQV9WRVJTSU9OX01BSk9SKHZlcnMpOw0KPj4gICAgIG1pbm9yX3ZlcnMgPSBGRkFf
VkVSU0lPTl9NSU5PUih2ZXJzKTsNCj4+IA0KPj4gQEAgLTU4NCw3ICs1NTMsNyBAQCBzdGF0aWMg
Ym9vbCBmZmFfcHJvYmUodm9pZCkNCj4+IA0KPj4gICAgIGZmYV9ub3RpZl9pbml0KCk7DQo+PiAN
Cj4+IC0gICAgZ290byBleGl0Ow0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+IA0KPj4gZXJyX3J4
dHhfZGVzdHJveToNCj4+ICAgICBmZmFfcnh0eF9kZXN0cm95KCk7DQo+PiBAQCAtNTkzLDIzICs1
NjIsNTkgQEAgZXJyX25vX2Z3Og0KPj4gICAgIGJpdG1hcF96ZXJvKGZmYV9md19hYmlfc3VwcG9y
dGVkLCBGRkFfQUJJX0JJVE1BUF9TSVpFKTsNCj4+ICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcg
IkFSTSBGRi1BIE5vIGZpcm13YXJlIHN1cHBvcnRcbiIpOw0KPj4gDQo+PiAtZXhpdDoNCj4+IC0g
ICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pIHx8IGZmYV9md192ZXJzaW9u
ICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmZmYV90ZWFyZG93bl9o
ZWFkKTsNCj4+IC0gICAgICAgIElOSVRfTElTVF9IRUFEKCZmZmFfY3R4X2hlYWQpOw0KPj4gLSAg
ICAgICAgaW5pdF90aW1lcigmZmZhX3RlYXJkb3duX3RpbWVyLCBmZmFfdGVhcmRvd25fdGltZXJf
Y2FsbGJhY2ssIE5VTEwsIDApOw0KPj4gLSAgICB9DQo+PiArICAgIHJldHVybiBmYWxzZTsNCj4+
ICt9DQo+PiANCj4+IC0gICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkN
Cj4+IC0gICAgew0KPj4gK3N0YXRpYyBib29sIGZmYV9wcm9iZV92bV90b192bSh2b2lkKQ0KPj4g
K3sNCj4+ICsgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQo+PiAr
ICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFdoZW4g
RkZBIFZNIHRvIFZNIGlzIGVuYWJsZWQsIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMg
bm90DQo+PiArICAgICAqIG9mZmVyIGFueSB3YXkgdG8gbGltaXQgd2hpY2ggVk0gY2FuIGNvbW11
bmljYXRlIHdpdGggd2hpY2ggVk0gdXNpbmcNCj4+ICsgICAgICogRkYtQS4NCj4+ICsgICAgICog
U2lnbmFsIHRoaXMgaW4gdGhlIHhlbiBjb25zb2xlIGFuZCB0YWludCB0aGUgc3lzdGVtIGFzIGlu
c2VjdXJlLg0KPj4gKyAgICAgKiBUT0RPOiBJbnRyb2R1Y2UgYSBzb2x1dGlvbiB0byBsaW1pdCB3
aGF0IGEgVk0gY2FuIGRvIHRocm91Z2ggRkZBLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgcHJpbnRr
KFhFTkxPR19FUlIgImZmYTogVk0gdG8gVk0gaXMgZW5hYmxlZCwgc3lzdGVtIGlzIGluc2VjdXJl
ICEhXG4iKTsNCj4+ICsgICAgYWRkX3RhaW50KFRBSU5UX01BQ0hJTkVfSU5TRUNVUkUpOw0KPj4g
Kw0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGJvb2wgZmZh
X3Byb2JlKHZvaWQpDQo+PiArew0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBGRi1BIG9mdGVuIHdv
cmtzIGluIHVuaXRzIG9mIDRLIHBhZ2VzIGFuZCBjdXJyZW50bHkgaXQncyBhc3N1bWVkDQo+PiAr
ICAgICAqIHRoYXQgd2UgY2FuIG1hcCBtZW1vcnkgdXNpbmcgdGhhdCBncmFudWxhcml0eS4gU2Vl
IGFsc28gdGhlIGNvbW1lbnQNCj4+ICsgICAgICogYWJvdmUgdGhlIEZGQV9QQUdFX1NJWkUgZGVm
aW5lLg0KPj4gKyAgICAgKg0KPj4gKyAgICAgKiBJdCBpcyBwb3NzaWJsZSB0byBzdXBwb3J0IGEg
UEFHRV9TSVpFIGxhcmdlciB0aGFuIDRLIGluIFhlbiwgYnV0DQo+PiArICAgICAqIHVudGlsIHRo
YXQgaXMgZnVsbHkgaGFuZGxlZCBpbiB0aGlzIGNvZGUgbWFrZSBzdXJlIHRoYXQgd2Ugb25seSB1
c2UNCj4+ICsgICAgICogNEsgcGFnZSBzaXplcy4NCj4+ICsgICAgICovDQo+PiArICAgIEJVSUxE
X0JVR19PTihQQUdFX1NJWkUgIT0gRkZBX1BBR0VfU0laRSk7DQo+PiArDQo+PiArICAgIC8qIFNv
bWUgc2FuaXR5IGNoZWNrIGluIGNhc2Ugd2UgdXBkYXRlIHRoZSB2ZXJzaW9uIHdlIHN1cHBvcnQg
Ki8NCj4+ICsgICAgQlVJTERfQlVHX09OKEZGQV9NSU5fU1BNQ19WRVJTSU9OID4gRkZBX01ZX1ZF
UlNJT04pOw0KPj4gKyAgICBCVUlMRF9CVUdfT04oRkZBX1ZFUlNJT05fTUFKT1IoRkZBX01JTl9T
UE1DX1ZFUlNJT04pICE9DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBG
RkFfTVlfVkVSU0lPTl9NQUpPUik7DQo+PiArDQo+PiArICAgIHByaW50ayhYRU5MT0dfSU5GTyAi
QVJNIEZGLUEgTWVkaWF0b3IgdmVyc2lvbiAldS4ldVxuIiwNCj4+ICsgICAgICAgICAgIEZGQV9N
WV9WRVJTSU9OX01BSk9SLCBGRkFfTVlfVkVSU0lPTl9NSU5PUik7DQo+PiArDQo+PiArICAgIGlm
ICggIWZmYV9wcm9iZV9mdygpICYmICFmZmFfcHJvYmVfdm1fdG9fdm0oKSApDQo+PiArICAgICAg
ICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAgIGlmICggIWZmYV9md192ZXJzaW9uICkNCj4+
ICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJBUk0gRkYtQSBvbmx5IGF2YWlsYWJsZSBiZXR3
ZWVuIFZNc1xuIik7DQo+PiAtICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+IC0gICAgfQ0KPj4gLSAg
ICBlbHNlIGlmICggZmZhX2Z3X3ZlcnNpb24gKQ0KPj4gLSAgICAgICAgcmV0dXJuIHRydWU7DQo+
PiANCj4+IC0gICAgcmV0dXJuIGZhbHNlOw0KPj4gKyAgICBJTklUX0xJU1RfSEVBRCgmZmZhX3Rl
YXJkb3duX2hlYWQpOw0KPj4gKyAgICBJTklUX0xJU1RfSEVBRCgmZmZhX2N0eF9oZWFkKTsNCj4+
ICsgICAgaW5pdF90aW1lcigmZmZhX3RlYXJkb3duX3RpbWVyLCBmZmFfdGVhcmRvd25fdGltZXJf
Y2FsbGJhY2ssIE5VTEwsIDApOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+IH0NCj4+
IA0KPj4gc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWVfbWVkaWF0b3Jfb3BzIGZmYV9vcHMgPQ0KPj4g
DQo+PiBJIHRoaW5rIHRoaXMgbWFrZXMgdGhlIGNvZGUgY2xlYW5lciBhcyB3ZSBhbHNvIGdldCB0
aGUgcHJvcGVyIGVycm9yIGhhbmRsaW5nIHdpdGggZ290bw0KPj4gaW5zaWRlIHRoZSBmdyBwcm9i
ZSBpbnN0ZWFkIG9mIHRoZSBwcmV2aW91cyBvbmUgd2hpY2ggd2FzIHRyeWluZyB0byBoYW5kbGUg
Ym90aCBjYXNlcy4NCj4+IA0KPj4gV2hhdCBkbyB5b3UgdGhpbmsgPw0KPiANCj4gVGhpcyBpcyBn
b29kLiBJdCdzIG11Y2ggZWFzaWVyIHRvIGZvbGxvdy4NCg0KR3JlYXQsIEkgd2lsbCBwdXQgdGhh
dCBpbiB2Ni4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCg0K
DQo=

