Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3411ABDEA0
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990917.1374847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOiJ-0001W2-K0; Tue, 20 May 2025 15:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990917.1374847; Tue, 20 May 2025 15:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOiJ-0001U5-H4; Tue, 20 May 2025 15:17:07 +0000
Received: by outflank-mailman (input) for mailman id 990917;
 Tue, 20 May 2025 15:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v48c=YE=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1uHOiI-00012G-EA
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:17:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2614::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0a9acf-358d-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 17:17:04 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by PAXPR03MB7700.eurprd03.prod.outlook.com (2603:10a6:102:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:17:02 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:17:01 +0000
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
X-Inumbo-ID: 7c0a9acf-358d-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hspkuzk0zkiF4rLgDCwpp9Di90oHBxD7B0T2wKgAUQRgyHEiA3kado8YCrSwEbgvTOxGjo7Lz3V1lPeXTbhakT1xHLwzCKMYqy9DEZzKzjRt8YW27UkE8X59POwz3odAJv08trERk5KSiFkT3o++/P9oI57l40gWRLdvvCk+zj0NLoGHKa+EhoGSara5estQ7ycuS3gslEsvwZS5Z4s71Dsaym3pUrUdRQieubIyMAOsKWGCysKnfqO8rtqKZETTFioAghbvbhmA71rfiX6RLxEMQoft4tX8nJOhr0qY3G5FCue20FDJQk5z5O5SzjlHgOVF/OYvC0yHxFdnMIGEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/dAQhVDkTasaRwPrHbblfY4HhPB4oXdRyzNzs1H/Pc=;
 b=EaAAAQp+qZgZDFZ1le21qkzkNfkkDZrEoSKzh6ixQ65F2+nlFSi94YwlIVNophODn11nhdlW3ydjlQJWGUjslDwXCbOxCg8tpiM8WRr4yknbwzLPFk3WY4jd4aTMxkDu0FDKnOECvPkWE1zpEeacUCQR/guq3hsu7LYbUon1HBkfJJd54EOW1gemPTMcwRKlWtT1RquaPu8nu3eXud40hqfx+zGtpzDNWf6BVjsZrjttWWqtsehlxrZOw9gk2C2JPhhWDlGAspuQNliSDVcVScnZKIbMEH2IyTjrrHOvfWpJ90zsdBUhUrNlq4zQCDAWPFRylQXvQK2qvQ7xbh8Rsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/dAQhVDkTasaRwPrHbblfY4HhPB4oXdRyzNzs1H/Pc=;
 b=b0+gXlIBvAQ8m7uUllgIwlx7WNP1p/kOKzXhE8ufucvtfDMZhS4jJbTBT0PvTJjUOb+4UEbEf6SnwPBvqhpzVzbmCub88uf/0EdZSm1mBjmu36jhOqEksNqFJwu+c61kxHfyZr2+vLnCjjB5s80jY3DHrjwEGY/ieGLdg5fksPfZHQ9yySGcRPmy9/hsxval7C2rV9yRVcRa3QFrby6/lJ/oUqAhtECv9nGyCfiZsmql46HBCHv/FeyDIaS+46eFge0mMPBfUUaB4wY/mZauzqiePSMxiY3BPfbgH+nzd/W4kFtnlMtKc0umY69tUdfFyv4ekl3FbkjMi9W2LijDtg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Topic: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Index: AQHbyY3It6QrN0GxI0mChLdwI1GDxLPbksCAgAAOmIA=
Date: Tue, 20 May 2025 15:17:01 +0000
Message-ID: <be219beb-be84-4ae9-bcde-4877a9ec9b07@epam.com>
References: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
 <26756272-790a-4418-b75e-5052f10319d1@citrix.com>
In-Reply-To: <26756272-790a-4418-b75e-5052f10319d1@citrix.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|PAXPR03MB7700:EE_
x-ms-office365-filtering-correlation-id: 5c6f0dac-acf5-49dc-2166-08dd97b15f3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MC9aMFhJM3d6ZUlkM1A0NmE0RlZoYVJFdFNJQXVZYWxXcGNRdEVQb25MeVBy?=
 =?utf-8?B?clRmSXpKMzl6QnhOS005L1ZxazRGVzFBSHRSNmcwYTFGUHE3VGwwbWMyOFJZ?=
 =?utf-8?B?NWw0RGtpaWhROGtXNjRCUk0vQXNoazhUMjdhSllCc2VZY0JLTDFleG5mN25L?=
 =?utf-8?B?MmVuUDdXT1dORFl1UXFrYTdIeUE0RG80YkNJUDhjVkdTTWJyWTA2SVFOMVF2?=
 =?utf-8?B?RitmN0hIS2YzcFpWRDJ0NTVmQjlXSHFjRkNLbE9sZHdLallrRXNEbXA1V3Bu?=
 =?utf-8?B?MnIyK2dRM2JkazFvVUpkTnduU1VXUWF4SEhWbFk3M2p3REluQ3Ixamp0VDNF?=
 =?utf-8?B?UmF0TUI2ZTQ0MXhmRWQ4REtIOTc1eWN5eVRGSUswdFpPM1htZUkrK0JxdSs3?=
 =?utf-8?B?Wk1kZzB0MkxSRXAxRGswNFJRQ29oYXFTKzRTbFRtaGF4U2JMZWlSTEhoTWp0?=
 =?utf-8?B?VDR3VmlEaCt0VG9KaXhXak5zR3kxL1R6NmNORGRrb1lNa0pCdjhuS0lOWU1v?=
 =?utf-8?B?YTkvOU10cklDM3RUMjkwazQvVU92bFlpN3VXUHY1TXI2b1JLemxRNW9kS1ZL?=
 =?utf-8?B?a1JrM2I0anZ0dkthWlFCZzB5b01ld2U4L25FMHlWVGZySUM4U1h2eWxoeTR1?=
 =?utf-8?B?eVFBRWltQjZWQUR2aTFUZUhlTkNDWG1lb0lzMmhodmx4aHBpNHVuQUpmSEtF?=
 =?utf-8?B?VU84dkNueDZnK01FWjNsTHVXWlJhSzlibTllYUt6Zm01WjR3b1BIT2tPRFBE?=
 =?utf-8?B?ZkEzZ1ZRQWRsQ3VTeWhSZUFzNS94VFBpVEViYkp1SUxYSkJydVBmaTB1TUho?=
 =?utf-8?B?Z2pSckx1OWxMSlg0UVMwTUVRait1MU1MSDR2RFpRWno1NjIrVnF3ZlNTcnhj?=
 =?utf-8?B?blNScHdVaHBpZHNuRTllQTIvUUUzWkV6NzJ2b2JSdFNJMjFPVks1YVVVNUp1?=
 =?utf-8?B?ZU9uWkE3dWJnTEFvMmRNSVdmSFRqZ21oWm5jWElsY1BzNjFNN3dMbkJzMDFP?=
 =?utf-8?B?RjZDby9PbGJ0amh2SXE5SzJ5cWlzWEwwSEpqT21paTdPYXNoeXFveFljeW4w?=
 =?utf-8?B?dWE0ZjkzZkpWdExqaEhQSGtZZVRaL05HTlJacnB2b1RtMTZJRjJab2tNRWdD?=
 =?utf-8?B?U2ZEd09BYWVjUkgvekJKYTF4TWRKcHBFbkJpWkJnL3FOZlFsMGJjM282Vm9C?=
 =?utf-8?B?K3dnRUxRVXArUW9hR291NUdJMmdVdERpUkpQUkxIWjUyY1U2NEc4R1ZEcktD?=
 =?utf-8?B?alBXNFFxNEtGY09kVUdmaGRLcElnYXNRZk03QzQ0Y0x0QjBkQ2grNGFFL1Nn?=
 =?utf-8?B?MW9KSlF5SVQ3V1MydzZ4cld3ZGYxUnRJengwTTh2akZHc29wVFpsNDdLNEJO?=
 =?utf-8?B?V0o0SnA4SmhFcVBxQUNLdldQZm8wUkRuNjloRU94RktUb0V5cVNsWDQ2bmdS?=
 =?utf-8?B?RHNkYTBTTjZUUEZzYmlNczVlcVYrMVRxUWpVUnkvOTZtSkNSNXY3SHRpYlc2?=
 =?utf-8?B?aUx6Zm5QYXF5ZDh6UEdPaGdHQ3ByVGtJVlhoTVhrZWtMQ2JkaHVlcG4wcVR5?=
 =?utf-8?B?MHhsbFNBVjJ1bzNYTmpPUmo4aGVNbHZUREhwN01Ldjd4SG5qRUFESkFZaTFN?=
 =?utf-8?B?N0NZQXFvTlRSRlJacWFjR1luYWpoYXhodEo5S1JMcVAwQnhwTzNmait4QjJo?=
 =?utf-8?B?TC9VK1Fra1RaZUxNTk5pSHRoaFpRRnhXN01VeURhdTg4OHI2dU0rVlhPRHVa?=
 =?utf-8?B?NVRNeXU4eWRkUFlHeEUzeG1ER1BNK2lQY2xueVBjUzlTNUlXRndVbVNqbHlp?=
 =?utf-8?B?d2ZFRXN5a0dCYk9rSGo2MWxFc0Y2REtLY2J3VnI4MTA0L28vQ2NHbmFsSStC?=
 =?utf-8?B?ZnNhWTJ6N1hicXhsNUVaRkFZZGordzQ5bHJId3AyOXVzSWFwQUR4cGQxcTRh?=
 =?utf-8?B?T2dOckprVkhIRnZxWGI4cFdzbWFxQVBEVGVmTjBhOUkvRHRhb3lVdmZ4ekhS?=
 =?utf-8?Q?5+82oQy+xLQbGhj/hLBL90okLkGuoQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjFiQkF4b2gyb1pMTkZCcUxJYzZCZ3E3NzI2YnRKclptQlJlcFUzdjRSOG1R?=
 =?utf-8?B?OE1OVlQxSDdxSVorcXllYXNEeVVFaWdPZ1BndkRrTUxNdExDZ0VDNlBTUEtV?=
 =?utf-8?B?RHJadk11N2szeHBIUEhCaU9QalB2bTYxOWJwL2U2WXNMSnhTZEdXY0ZaTXoy?=
 =?utf-8?B?andPR2xuNkFlcWNDV09KSEVWQjR4R1dZVHdSZXhMRzdiZ054dU1WV0hOZzlW?=
 =?utf-8?B?ZEUyRzRYVDNjOHdKaVhpTmZQTkJucWNXY3pUR2tCZStJNVBWaGFocERrcDF6?=
 =?utf-8?B?Ukp5NFZKVmU3RDZSTHg2MGFNdnoyTkM2SjlvbXYzVThST25jMENud0ZJV1k1?=
 =?utf-8?B?M2czVkVpK0NxblBrZXFhZm9YeHVyU0VDOUJUVjhXamNOZDliV3pNamhhbnYx?=
 =?utf-8?B?bTFubFZ6WWllTHJhMitKSStzNks5WUM2TG00RWQ5WVBoMEgwV1d2aVpSQkZX?=
 =?utf-8?B?VEl3V1FBZCtCeDRVQlhTNHV6M1VpUkNWSVhwWHhrY01MejZoelZPMng0TkRU?=
 =?utf-8?B?UzRMSE41Qlh5YUpzSlJQZmxMTVl6V3YvWnY0d0czWUZ4N1hzZjlUcXVId2tn?=
 =?utf-8?B?R28xdGsySGxzS2VIb2VtdGFuZy9HcWlnVyt3bUtQUEVCZGZaQllGSTdGcmtm?=
 =?utf-8?B?S04rOG9oMldRNFB0MW1DYmxMMkxRZjArRENFQkorUkhzRW5SbGNrdHhqN0NW?=
 =?utf-8?B?R1dSS3Z2T2F3Nm9DNTM2bDhRbFdpenBiRWkwcjZLbE43NUNvUXB6cXl5N0NG?=
 =?utf-8?B?aWRhZ09vVnhIL2Y2dTloMTAwY2VPb1h4TS9qSmRkUE9IVHArYkJzait0czNu?=
 =?utf-8?B?VFEzSi9na2xtdXZKSllCNUQwV0hzS1lLVWVtMVo4T1Qrb21PRUNUamNHNnZh?=
 =?utf-8?B?Q1NKUkpEV1ZPSzZkWEFDR2o3aEJKSm1Pa1A2Q3oxUkJzcEZqc2xFdXVKUzNv?=
 =?utf-8?B?VWhWVTBIMDlEZjBoU0hwLzMzbE5BT0VrVFY3dWtzbkRROG1mTzJkNHBFOFJV?=
 =?utf-8?B?anBSaFNzdjRIRWhiSWVTREIvMkFubGpYUWQyb1dxMHZZZ0ZsQm9FZEVEbmRk?=
 =?utf-8?B?SFJqaFF5TFlNeVlDZmNLaDduZk8xZ2dXK3ZSMnNIZXNNMk5QVVAveHdGSDFi?=
 =?utf-8?B?Y28rTmhucURYc0ZVdmtKWjNhaWl0UlpWRFA1amZlUkJleS95TXdtWk1FdUYy?=
 =?utf-8?B?bWdHOTQybkU4OStMWVlOaWMrWTIwUU0vV1pMOHl3RVFQSk1icjRvTmd1aVNO?=
 =?utf-8?B?eFJCdnRqbEU2dkhHZTRRMWd4Ty9CbGU1dmFocHh6bDc3R0tLUjBvaG5HTURN?=
 =?utf-8?B?ZUVMQXpIMHdQOXQzWVpaeUZCekNzTzVHK0Noc3pGQUdKRCt4dUk0azdScnRq?=
 =?utf-8?B?U0NJVUpsaFFhMEM0ajVWTUUzZFZjU0pHK2p4YVpHQjN2STYxVWlrdU95Nlo2?=
 =?utf-8?B?UEZzNHc5MUJjdzR2MDZRTnNISkt5V3BBOHh4STFiYWNQWFdseEY5OVdvblJ0?=
 =?utf-8?B?TXVsQ1hGQllVQlcvSnNEblpyWkg1QlAwVFNVdDRtbllFazR2YnBZU3V1WUZw?=
 =?utf-8?B?NUwwK2FONXRkdElwMVZVeHBOSlp0MXVhVXdvdjdqcnhkUjR0MytPazc3amM2?=
 =?utf-8?B?MjhwTy94YW1UUk9LUnV5Vk1Ob1dsZW1aUjNrRHRoMGtSMHFnVHk3SjlIRDc5?=
 =?utf-8?B?TE9oeUZVNTBUMFh4NnBza3dFaFVWZDVpWEFiOGh4cjNmS3hKckhPWC9saFlK?=
 =?utf-8?B?OXZxbDVNRTdBc1Q5THBtTGFlN3U1SDAvRDBoRk5JenNSZ2tDZDhZMWpLMjBO?=
 =?utf-8?B?QzJ1OFhRRE4yRSt0R0EwT3EzdFREOG1pdUY3eHpPS0dUSVpzMEhSd2I3WnpP?=
 =?utf-8?B?VlYrb3d3WUJSbXdXaHNKdmVZNkFsT091TXl0WFRvVEN3ckM2bllLdTRPUk1j?=
 =?utf-8?B?c1BhbVhJUElxSzdpV2k5RGp6L2pvS2VDSC85SzNQYUJVYnBudFM5alhvMFJI?=
 =?utf-8?B?Rjh5ZC9aMUYyTlEwZG9rUlJMajduRjRWUm9VOUZOQ0JoR2lHMnJBN2NBcXJs?=
 =?utf-8?B?enQ2KzU2ODlaYjVOSFlxK01ydmRTMll5eFFqczE3L2QvM3JtbWVGdEJBWWxl?=
 =?utf-8?B?ZnV0RHdBZ1l0T2FxdzZSS0dtZUoydEkxMi9ubXVvSlg4bGVtTXBSOGZkRlpk?=
 =?utf-8?Q?BB7Vclsj3QGqM0JIcCJc700=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234B2BDB731A5F45A47772ADBFBC3FCC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6f0dac-acf5-49dc-2166-08dd97b15f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 15:17:01.8859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhpaE39n+9ywCS1+zNaowTmDKvX8Hr/4aBUBp03CaauKCoVQLCDTiTOqSQiv4HGz7E2Fp2RkvyPCOGeAL5TgVh0rNuFqIgroe3avMwCdJiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7700

DQoNCk9uIDIwLjA1LjI1IDE3OjI0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KDQpIZWxsbyBBbmRy
ZXcNCg0KPiBPbiAyMC8wNS8yMDI1IDI6NDcgcG0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3Rl
Og0KPj4gQW4gYXR0ZW1wdCB0byB3cml0ZSBhY2Nlc3MgdGhlIHJlZ2lzdGVyIChpLmUuIEdJQ1Jf
UFJPUEJBU0VSLCBHSUNSX1BFTkRCQVNFUikNCj4+IHdoaWNoIHNob3VsZCBiZSBpZ25vcmVkIChp
LmUuIG5vIHZpcnR1YWwgSVRTIHByZXNlbnQpIGNhdXNlcyB0aGUgZGF0YSBhYm91dA0KPiANCj4g
RG8geW91IG1lYW4gImRhdGEgYWJvcnQiIGhlcmU/DQoNCnllcw0KDQogwqAgSWYgbm90LCBJIGNh
bid0IHBhcnNlIHRoZSBzZW50ZW5jZS4NCj4gDQo+PiBkdWUgdG8gaW5jb3JyZWN0IGNoZWNrIGF0
IHRoZSB3cml0ZV9pZ25vcmVfNjQgbGFiZWwuIFRoZSBjaGVjayBzaG91bGQgYmUNCj4+IGludmVy
dGVkLg0KPj4NCj4+IEZpeGVzOiBjNGQ2YmJkYzEyZTUgKCJ4ZW4vYXJtOiB2Z2ljLXYzOiBTdXBw
b3J0IDMyLWJpdCBhY2Nlc3MgZm9yIDY0LWJpdCByZWdpc3RlcnMiKQ0KPj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0K
Pj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgfCAyICstDQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYw0KPj4gaW5k
ZXggMmVhYTQ4ZmFkYi4uYjM2NmIwNDZhMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS92
Z2ljLXYzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4+IEBAIC02NDksNyAr
NjQ5LDcgQEAgYmFkX3dpZHRoOg0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIA0KPj4gICB3cml0
ZV9pZ25vcmVfNjQ6DQo+PiAtICAgIGlmICggdmdpY19yZWc2NF9jaGVja19hY2Nlc3MoZGFidCkg
KSBnb3RvIGJhZF93aWR0aDsNCj4+ICsgICAgaWYgKCAhdmdpY19yZWc2NF9jaGVja19hY2Nlc3Mo
ZGFidCkgKSBnb3RvIGJhZF93aWR0aDsNCj4gDQo+IEFzIHlvdSdyZSBtb2RpZnlpbmcgYW55d2F5
LCB0aGUgZ290byBzaG91bGQgYmUgb24gdGhlIG5leHQgbGluZS4NCg0Kb2ssIHdpbGwgbW92ZQ0K
DQo+IA0KPiB+QW5kcmV3

