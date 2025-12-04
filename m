Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BECCA2E74
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177411.1501701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5HO-0006pn-RV; Thu, 04 Dec 2025 09:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177411.1501701; Thu, 04 Dec 2025 09:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5HO-0006oM-OX; Thu, 04 Dec 2025 09:05:38 +0000
Received: by outflank-mailman (input) for mailman id 1177411;
 Thu, 04 Dec 2025 09:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VGT=6K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vR5HN-0006oG-0z
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:05:37 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64726840-d0f0-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 10:05:34 +0100 (CET)
Received: from AS4P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::19)
 by DB9PR08MB6635.eurprd08.prod.outlook.com (2603:10a6:10:254::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 09:05:31 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::8e) by AS4P191CA0023.outlook.office365.com
 (2603:10a6:20b:5d9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 09:05:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 09:05:30 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI0PR08MB10828.eurprd08.prod.outlook.com (2603:10a6:800:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 09:04:26 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:04:26 +0000
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
X-Inumbo-ID: 64726840-d0f0-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CaOyQzN7kqsRnHjNqqniBBHifUT+6Oz8Bu3jCU1IlEsNzEff5AW8K9i6k17arqKoh7cg+wL3s5VR7xhWlKVSkLnV1BDsWOAS23kyEEwofhb1P0YDKPRqGJByhiSLRV+ecuctP93HGoA8ReytXDRf983NQQNKRx/COpRmZmgBgkqxCXPhwHDK/Xl8MTbYTvPMNyS00yc4MTJrQqFnigxcr534hZKTgyhw+zG5d9sbZdGutUb43Gcx7lmdKOgShZwwXxwbaNiuOsQf/S2sZMP4YgSxET9DdIs/sQf4Mrpjo5rS8MZZFmbx5h2MV8SWYAQ3V4Qg/SVh4LD3RjRWUhOtvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHWEXAD6RCbnQoRj9KlX2IrqkoFJrOxOWkpVO8W/bVE=;
 b=Ap4j60IQ6wta9FAtYw+uaphUXQKP5H7lrWqFyZs20ZnwDUW6EoY8Lqq16mQbTHs+Oe+Yi9T4P4+Uzvx1JksJMFmD5XuFPAldv6BpgeE8UJZBLVtUVNuV5g3s42sLJQc/1GQb0+rReFUsS26sd0AbbdVCKiPldPxcTdh1+V9CePkfhy31qxjtbG7julyq1IPlGLgKTl1KcjjTdUUm1rOlaAykpab+pbm7LvKF5h0Prgqqj0oRGqvu9wjqwCowB02XEnIEFqyjpqPPg0MuEg4/fPffkrkxVxL8ae+WqgL69M74ZRSf4udZhH7+f9FZdKdFzf09pAPoDDTdruxyA3j6BA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHWEXAD6RCbnQoRj9KlX2IrqkoFJrOxOWkpVO8W/bVE=;
 b=S4tKnGKCFvh9CzAMx9RWirjSOHwWJhW3uFXx9RlWEQQ8B02nIVF2LF+iQBLvKtfcJqCJJr4LfFi/dBZ6FMQz5dIomkpkfQ1tK4wGrUQg9dU2Sm2dqqHWfQEzKl+OSJkjvxifpygnrjNbXCi83HF2PWRe9bY9iGaYEWr13PnJyjY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxMG7l8mW+dtGouuiIxQJVzAFKqfEwBy9wu7cX9mqAuBY8uvv+JhR4T6JtDEltiguPV1Wy+4a6SRtOfYzIFeykNuTc6edjyZu/JkPSCeEqilNkkKfr59mlkIPq69L1BphFvgE6nDu9fSnDAUgSDfmoljYVHXP/EmYyetyU98OFhD9WOKQvlga7TidSEJdA88f/P0WlVPsLsk9Lxf0f6FRFfYA5+Ig20EjLQEPZdETcaEtEtnKgPJNNzQoALASVyaazwhyUU0axWiVZLaz3CBgpajoQoQdOEV7ArFF3/cSXMzr6X/r7QEJKXyNkDVhDhTOI1yMTZtqsEZaqnouUoxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHWEXAD6RCbnQoRj9KlX2IrqkoFJrOxOWkpVO8W/bVE=;
 b=tolRNWOiuDLhNIm/tCQcbE8IzMvVVaYOMsrN+E0HkL4y4EkakM0/CoPY9G8oB3iDmn5KM+Hpp9ViixdlanYueL59h67hhiybFFGitp/k0r1f3Zt3osZrGc+/ru6+2+rPYzRlIJrhq4JIEX/q5/HQ2knqlYnz2NSIKBUjYoKjzHwoWvr+DFRchtdndPJYA8EVCop5/8wXPUIauS46qATvjKeitz+MgKNYetdB3UdQ8z+dxGHt1ih9HhqgTbc2I31pX4HM262yomRLpvmP41UUO1QAKFhfpH7iWbCEUXi2b95bkUIPhzhX+NnfawHccYL8mfJSWxdAaYp4fRE1I4aQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHWEXAD6RCbnQoRj9KlX2IrqkoFJrOxOWkpVO8W/bVE=;
 b=S4tKnGKCFvh9CzAMx9RWirjSOHwWJhW3uFXx9RlWEQQ8B02nIVF2LF+iQBLvKtfcJqCJJr4LfFi/dBZ6FMQz5dIomkpkfQ1tK4wGrUQg9dU2Sm2dqqHWfQEzKl+OSJkjvxifpygnrjNbXCi83HF2PWRe9bY9iGaYEWr13PnJyjY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 08/10] xen/arm: ffa: add v1.2 SEND2 header layout
Thread-Topic: [PATCH 08/10] xen/arm: ffa: add v1.2 SEND2 header layout
Thread-Index: AQHcX7chemRTAZm0AECGA5ix0BasKrUQJx4AgAETYYA=
Date: Thu, 4 Dec 2025 09:04:25 +0000
Message-ID: <CBF5B9E0-2EEA-4CD1-ADAF-3EB05DEF850A@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <769c7ad291abe47d7991b878b131f9b31d4f0954.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44EBeb+9+_JfwX4iLyEbnEE1dxuRvV5_reUtHM0XejG_SQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44EBeb+9+_JfwX4iLyEbnEE1dxuRvV5_reUtHM0XejG_SQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI0PR08MB10828:EE_|AMS0EPF00000193:EE_|DB9PR08MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: ae49f26b-f760-4dc1-c2c3-08de3314465e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z3N2VGgvZW52K3ZVZDNmdUR5UjB4Q0o4bzFuNDFibC9OMkl4d3JUQ1lpaTVx?=
 =?utf-8?B?WGl6VFRlZ25VdCtieHZPeFp0dCtIRUJRbjRzZVBKbDRLYjFGNWRZbytDMStF?=
 =?utf-8?B?NEp5bGNRVnpaeWx4K205RmdtanpDSmZiK3YxcVEvUktRbnBQTEt3d0JYVGxm?=
 =?utf-8?B?eTlIRGZCOFA1REl0MVFLZ1IxNGs1bjBwR0RpZWhEV1J6RDZNNjNYTjBxRCt6?=
 =?utf-8?B?T1BFbnZuOU4ydzFBQVg4NWxUN0NzUEpFYVhueklqR09tNEoxWGZ1UHdCRmRL?=
 =?utf-8?B?dU5JQkdlNjlDSkJNVC8wUk55Y3ZrdnZnbmNBWlkva2tESk91REVKaWFOVXN3?=
 =?utf-8?B?d0tBaVNKWlhvYXpVb2FxT05IbS9ESGlvcmorRHZBQ0NMN3R3ZEh5bnRldWJj?=
 =?utf-8?B?K2R6T0RheWVoRnJCd0tLeVlSYkg2bEhZVUJ6WHg2cGI2YXd5M1ZlVGcxL3NT?=
 =?utf-8?B?ZEp6bUFkZVZtbDYzQkRWcW5qMGl1Ri9GTFp0aVB1cktaM0JyNGtQNVRPcGNu?=
 =?utf-8?B?Y3JyRWQyUmYrOFJINi9iZ05pSTFsVlArQlZDOG9zejRQOWtGVGlnQU1hamVD?=
 =?utf-8?B?TGVTVnlzMjl3TXR5ZHdaU1hUcXpJdTM5dG9MeUQ3UExETVdLYUpid1YxOStK?=
 =?utf-8?B?WEdVeEtVc0E5LzVmOHFHUXJtSGpGNzBtZHc2ZHF1UE1qTjFkUmZXUU1EL0lG?=
 =?utf-8?B?eWNSU1Q1dHRmTFgzWkRPMFN6aFMvellOaWEvcXpnY2x0VnlwdGRVL3Arb2d0?=
 =?utf-8?B?dVE1a1FSaVllb3pSbDBtd3E4VXM0QmNlbDBlTStuQ1QwUGx0VkJ0UmMyay9w?=
 =?utf-8?B?YWV1MDFOVm82aWFUQzUrbHNjUklaR1lFL0F3Rk5GZlZGZEgvVUhEcDJYQzlX?=
 =?utf-8?B?SEdTODBrakk3bWVocXJDOEc5clJOOE5sUlFpemw2ZHJKdW5KYlVZc2FwZXRk?=
 =?utf-8?B?WDdiSm9nM1N2NlNLSnFiQ1pZWUE4Sm1HQUtyQ3hNMUxURW5SYmFUejUyRVNZ?=
 =?utf-8?B?QmI2MFZDMnNVb3lMcEtUTlVKNHFCMTRGTzB1RDhGckZaOVZCQXdRWWJpa01j?=
 =?utf-8?B?Wlk1anFWL1RaaEJoT2hTd21KVU5wY1Y0Y3dzM1ZTcDdJaWVER0YwTS9UNGJ0?=
 =?utf-8?B?ZlhIREJLLzNkcDFuNDJ4VHF3Sm5SODdkRDEySkRsOVNHbjFoUzB3cXNEUVdw?=
 =?utf-8?B?ME1mS1VYMXFLamFKMzEwV1JHVUQ2VkZnczhyZDJNbmJWajB6VndCUDY2VXF4?=
 =?utf-8?B?WjF2cVVMT05Bam8yUDNtdUgzaXpNN09hMFlsdTZxS2RjUVpkZXRQZlk3bEU0?=
 =?utf-8?B?bWl6TkV4WFpuUTFOUmRaaHBzLzM5RkErZ1hWcHd2dFV3YkVrTUsvMmJuYXpp?=
 =?utf-8?B?OFdQZ2krdHF1YmQveUpKNU5PVXVxczFNUjJERTBVTHVGa0xQWGIrSTFQdXBT?=
 =?utf-8?B?YXRldTB2eWdOU0VLUzV6SUd0SG1mbzZHS1A0aGVPRlo1Z2RVdStGKzFYbUp4?=
 =?utf-8?B?cmQ0OVE4TVdFbW9Wdkt2TWh1dyt4YWdhMGg5cXNNTGpUMDJ4V3pKMzdsY2Ri?=
 =?utf-8?B?VUtoVXZRQnRsYWtMWnBUL0JMYmJTZkFaRXk0S3RURlo1dVphY2xwZlNWMVlU?=
 =?utf-8?B?cVYvc2NDYXJBbEVvSHBjVUlCMjgwSHA4dHhCcy81VVVNQXFHVzB3YmxreFdV?=
 =?utf-8?B?SElaNTNLd1FGbVJFWFVab1l2Z2ZaM0J0NmdPdjRIYVZxdHo3bHFGWmJaeW00?=
 =?utf-8?B?Wk5iaDVHNzNxd2lvbFZUVnFXV2RxZXlVZjBYWjJneWdSd2tRRXRnTks2N05X?=
 =?utf-8?B?MXlSKzV4R1c1M1N3RWQ4R25wSDBROHhPTTRKa2dFOEFTODNoMjJIWjVWNGhy?=
 =?utf-8?B?ODE4VVpJRjNRcUZvSC81eVRja2F4NnhwdUhMRm9tOXN4S0QyTHRBL01uYm9m?=
 =?utf-8?B?VzRhQzdDRU9BcWF1Y1BTdm9zOG9HbWxxbVloU1ZPUnFMZVpvd0JYRDZGcGFv?=
 =?utf-8?B?V1hWSGkraUxhSjNzSkJ4NW9NVXJlTlkwMzkxeWNFSS95ejUxNnpXUmZFaG1X?=
 =?utf-8?Q?PXwTam?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B5A9F2F49C1B547B59BE3213ED5692C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dc22417-49de-451e-764e-08de33141fd5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yi8rQU5QN0dlRkl5YVJ6KytCVHErVmRqb1ZqaEJqNnp6RTBrVjlzRjNVT0k2?=
 =?utf-8?B?US9PR0ZEYXZzSjVzaXpFTmQ5Q1krM25mRkpHbVlPdndHZmsrTHludmhXZGZM?=
 =?utf-8?B?UE9vaHplK0l2R0lwYUNxN0tKM1ZlVW5IK1o5M21TZy9XR2hsRFc3TTFyZHBU?=
 =?utf-8?B?NEN4N2F2OUdjOGR4MmtUa1BPU0NqbUNLaG9iRTBRTTZNdGxEeStic0JNYVlu?=
 =?utf-8?B?QnNaNFdIbW9SU1VGL0RQMkdaM1pueHBnaGVIa0RiOEhzUGUxSVI0bTk2VFU3?=
 =?utf-8?B?c256c1Z3VTRXZHpnM3FodVNROFFLSHJjYndqRkI5QitHNnptUVRuOXhBSk8w?=
 =?utf-8?B?dEN5MGlkWE9yWjFlbmlYaHNaMHRxQU5ONFpUZ0JNWlF3d0llUVhKNHp4amdH?=
 =?utf-8?B?azYraTgvMzM3cEJTaWpVSERqdTFZRjRSTHJoWEJRaW5lbHhYRG05YmlvWTJX?=
 =?utf-8?B?NGRaRldEQlUxQXVNMkNzL25Qd3RBZ1FLR1ErM0dNWXgyZm51YkpjNGZtY1Fa?=
 =?utf-8?B?Q2M4Y0xqN09lRUZSQ2RHMGNaSVNyN3NzenFsT0dwcFgyR1BjcEZDQlI2cnJW?=
 =?utf-8?B?S254Mk9TOW9OVmN0NytpQjZMNkNUdmNlY3J4b1U1SFZxSGhlNmxJNm44NVVi?=
 =?utf-8?B?WVRjY0sydEo1aG5zQWp6VFRHelMwd0JjdjNlelY4WDdnS2t5ellKeVo5NHJ0?=
 =?utf-8?B?a0J1Y2xCLzJhb3BHbXRNaGkzcFR4T3U3Z0piOXYzSyt3ZnBtRVg2MUNHZDhG?=
 =?utf-8?B?ZWNqZXNpeGFlaTVtNlhhMTdaWWh4UndGQmVvdHdrajVXQncySEJDdTJBMTB0?=
 =?utf-8?B?N3hXMFZWQXMwZUJDZ1ZvRkpEZThDWkFJMmh2QkNEVC85dDRTMTJ4RVRJMFlV?=
 =?utf-8?B?SVZ1K0pKQmZ0UU90TFphYXZJNzJweXpOZ1lJNjlMSkVvWEsxN3hjYmlzN3ll?=
 =?utf-8?B?OHNsTWk2UWJ4NEZld1lEdSsrQjJHbkxuanBFa2gwZm9VV21OSHRjNi8xa01k?=
 =?utf-8?B?czdJZXh3QUYrQ2xna1YzYmRYV1gwZXJLR1pMODExOTJ0OXViNjdxakUwL25h?=
 =?utf-8?B?RjNiMVpMdWhjbjZTb3JkWlV2K1VCNHBkcmJhalg1VDNIbHJLWnpmK2RmMUhG?=
 =?utf-8?B?NjZxMDNhNy8reHV5cmdtUWJDL3BFNW5tUlJhUW9oUjZsWlJzUVpMREcyOXpO?=
 =?utf-8?B?NFV4N0ZmWGYxdHBGSnROUkZGV2MwUi94dzN3d3B0cENFNlU3S2NhejlsbmZY?=
 =?utf-8?B?VUMyV1pVZFBlb09pMWlweHN5TG9ZK3c1RnpTWmN1Q1FJbGZOMUpoWWg3Ym9D?=
 =?utf-8?B?YTh2RTZJSHhYVjBDY00yK21FUWVpVldoazRLV3BuL2Y4aVdDMlRzemRaVFlx?=
 =?utf-8?B?elBydDF3eW1ZR1pxZWxHZjI1OVhZVmhhQnZ0cjgwTENZK1ptUEhsRXBHS1VY?=
 =?utf-8?B?WkRxZ1pYZzVFOHdISy9pTWNEU0d5TXdtdEVtbzlsZStMQnFZclRTNzczbE9E?=
 =?utf-8?B?MVl2NEErWk5sVXc0RmdpWFBST3ZZQVFqdVg0ZDBWN3A3OEZtTUdzQ2VpVlBn?=
 =?utf-8?B?QVpqb2NKRStZamRHK0E3SjJqUkFma2lHNmRVNVRQQjZZZmhXd2xsUTAwOW9p?=
 =?utf-8?B?aFdDeHNXa1o0aDg0TmxuTFN2VUZ3Mmw2TEx6dkVQUFZEYWhOSExyVmUva2Jj?=
 =?utf-8?B?NDJKODc2U1REM2UveUpMT1U4bVR2ZElreVRPdTJZOWJsVWl5bFV3Q3pncUZQ?=
 =?utf-8?B?bHFBQWl4MU9ES2ZsVXZDeHJFbWtudnBScVRsZ3RYMEI3ZzBSSDJWSGFQREkx?=
 =?utf-8?B?RGNNS2FGckErbS80UXRPQnoxRkVNTkVNSW9QQURvSHd0Nm9EblZPOEVFOEhp?=
 =?utf-8?B?WDhHSS9wbDRMNFA3V0gvdVkwc0trU1VtVWlaNEVqMkhVeEdYSDNER3ZxTFhO?=
 =?utf-8?B?Uy8yZ0JTODlvd2N4V20wbjZaNjJ2bnpaVFFGbm16M29JaFFLTHo4RXNwaVlM?=
 =?utf-8?B?akFRMnpTQzdFMlJoSjJtWFVLUXZPbjdObW00OGRDRUlPWDViS0JZditlMCtB?=
 =?utf-8?B?NEFsdjkyZ0VORE1PQmExQjdHVU4vaEptWmV5NGRFcUFVMVlnL29JYUFLUHla?=
 =?utf-8?Q?7lio=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:05:30.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae49f26b-f760-4dc1-c2c3-08de3314465e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6635

SEkgSmVucywNCg0KPiBPbiAzIERlYyAyMDI1LCBhdCAxNzozOCwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCA0OjUz4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gVGVhY2ggdGhlIFNFTkQy
IHBhdGggYWJvdXQgdGhlIGRpc3RpbmN0IEZGLUEgdjEuMSBhbmQgdjEuMiBSWC9UWCBoZWFkZXIN
Cj4+IGxheW91dHMgc28gd2UgY2FuIHByb3BhZ2F0ZSB0aGUgMTI4LWJpdCBVVUlEcyBpbnRyb2R1
Y2VkIGluIHYxLjIuDQo+PiANCj4+IFZNLXRvLVZNIFNFTkQyIGNhbGxzIG5vdyBidWlsZCB0aGUg
bGFyZ2VyIHYxLjIgaGVhZGVyLCB6ZXJvaW5nIHRoZSBVVUlEDQo+PiBmaWVsZHMgZm9yIHYxLjEg
c2VuZGVycywgYW5kIHRoZSBkaXNwYXRjaGVyIHZhbGlkYXRlcyBtZXNzYWdlcyB1c2luZw0KPj4g
dGhlIHYxLjEgaGVhZGVyIGxheW91dCB0byBrZWVwIGxlZ2FjeSBndWVzdHMgd29ya2luZy4NCj4+
IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bh
cm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyB8IDU1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX21zZy5jDQo+PiBp
bmRleCA4YmI0YmQ5M2Y3MjQuLjQ3MmJmYWQ3OWRkMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS90ZWUvZmZhX21zZy5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0K
Pj4gQEAgLTEzLDcgKzEzLDcgQEANCj4+ICNpbmNsdWRlICJmZmFfcHJpdmF0ZS5oIg0KPj4gDQo+
PiAvKiBFbmNvZGluZyBvZiBwYXJ0aXRpb24gbWVzc2FnZSBpbiBSWC9UWCBidWZmZXIgKi8NCj4+
IC1zdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHggew0KPj4gK3N0cnVjdCBmZmFfcGFydF9tc2dfcnh0
eF8xXzEgew0KPj4gICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gICAgIHVpbnQzMl90IHJlc2VydmVk
Ow0KPj4gICAgIHVpbnQzMl90IG1zZ19vZmZzZXQ7DQo+PiBAQCAtMjEsNiArMjEsMTYgQEAgc3Ry
dWN0IGZmYV9wYXJ0X21zZ19yeHR4IHsNCj4+ICAgICB1aW50MzJfdCBtc2dfc2l6ZTsNCj4+IH07
DQo+PiANCj4+ICtzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8yIHsNCj4+ICsgICAgdWludDMy
X3QgZmxhZ3M7DQo+PiArICAgIHVpbnQzMl90IHJlc2VydmVkOw0KPj4gKyAgICB1aW50MzJfdCBt
c2dfb2Zmc2V0Ow0KPj4gKyAgICB1aW50MzJfdCBzZW5kX3JlY3ZfaWQ7DQo+PiArICAgIHVpbnQz
Ml90IG1zZ19zaXplOw0KPj4gKyAgICB1aW50MzJfdCByZXNlcnZlZDI7DQo+PiArICAgIHVpbnQ2
NF90IHV1aWRbMl07DQo+PiArfTsNCj4+ICsNCj4+IHN0YXRpYyB2b2lkIGZmYV9maW5pc2hfZGly
ZWN0X3JlcV9ydW4oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhcm1fc21jY2NfMV8yX3JlZ3MgKnJlcSkN
Cj4+IHsNCj4+IEBAIC0xMDQsMTIgKzExNCwxMiBAQCBvdXQ6DQo+PiAgICAgZmZhX3NldF9yZWdz
X2Vycm9yKHJlZ3MsIHJldCk7DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgaW50MzJfdCBmZmFfbXNn
X3NlbmQyX3ZtKHVpbnQxNl90IGRzdF9pZCwgY29uc3Qgdm9pZCAqc3JjX2J1ZiwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0eCAqc3Jj
X21zZykNCj4+ICtzdGF0aWMgaW50MzJfdCBmZmFfbXNnX3NlbmQyX3ZtKHN0cnVjdCBmZmFfY3R4
ICpzcmNfY3R4LCB1aW50MTZfdCBkc3RfaWQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8yICpzcmNfbXNnKQ0KPj4gew0KPj4g
ICAgIHN0cnVjdCBkb21haW4gKmRzdF9kOw0KPj4gICAgIHN0cnVjdCBmZmFfY3R4ICpkc3RfY3R4
Ow0KPj4gLSAgICBzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHggKmRzdF9tc2c7DQo+PiArICAgIHN0
cnVjdCBmZmFfcGFydF9tc2dfcnh0eF8xXzIgKmRzdF9tc2c7DQo+PiAgICAgaW50IGVycjsNCj4+
ICAgICBpbnQzMl90IHJldDsNCj4+IA0KPj4gQEAgLTE0Miw3ICsxNTIsNyBAQCBzdGF0aWMgaW50
MzJfdCBmZmFfbXNnX3NlbmQyX3ZtKHVpbnQxNl90IGRzdF9pZCwgY29uc3Qgdm9pZCAqc3JjX2J1
ZiwNCj4+IA0KPj4gICAgIC8qIHdlIG5lZWQgdG8gaGF2ZSBlbm91Z2ggc3BhY2UgaW4gdGhlIGRl
c3RpbmF0aW9uIGJ1ZmZlciAqLw0KPj4gICAgIGlmICggKGRzdF9jdHgtPnBhZ2VfY291bnQgKiBG
RkFfUEFHRV9TSVpFIC0NCj4+IC0gICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9tc2df
cnh0eCkpIDwgc3JjX21zZy0+bXNnX3NpemUgKQ0KPj4gKyAgICAgICAgICBzaXplb2Yoc3RydWN0
IGZmYV9wYXJ0X21zZ19yeHR4XzFfMikpIDwgc3JjX21zZy0+bXNnX3NpemUgKQ0KPj4gICAgIHsN
Cj4+ICAgICAgICAgcmV0ID0gRkZBX1JFVF9OT19NRU1PUlk7DQo+PiAgICAgICAgIGZmYV9yeF9y
ZWxlYXNlKGRzdF9kKTsNCj4+IEBAIC0xNTQsMTIgKzE2NCwyNCBAQCBzdGF0aWMgaW50MzJfdCBm
ZmFfbXNnX3NlbmQyX3ZtKHVpbnQxNl90IGRzdF9pZCwgY29uc3Qgdm9pZCAqc3JjX2J1ZiwNCj4+
ICAgICAvKiBwcmVwYXJlIGRlc3RpbmF0aW9uIGhlYWRlciAqLw0KPj4gICAgIGRzdF9tc2ctPmZs
YWdzID0gMDsNCj4+ICAgICBkc3RfbXNnLT5yZXNlcnZlZCA9IDA7DQo+PiAtICAgIGRzdF9tc2ct
Pm1zZ19vZmZzZXQgPSBzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KTsNCj4+ICsgICAg
ZHN0X21zZy0+bXNnX29mZnNldCA9IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8y
KTsNCj4+ICAgICBkc3RfbXNnLT5zZW5kX3JlY3ZfaWQgPSBzcmNfbXNnLT5zZW5kX3JlY3ZfaWQ7
DQo+PiAgICAgZHN0X21zZy0+bXNnX3NpemUgPSBzcmNfbXNnLT5tc2dfc2l6ZTsNCj4+ICsgICAg
ZHN0X21zZy0+cmVzZXJ2ZWQyID0gMDsNCj4+IA0KPj4gLSAgICBtZW1jcHkoZHN0X2N0eC0+cngg
KyBzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSwNCj4+IC0gICAgICAgICAgIHNyY19i
dWYgKyBzcmNfbXNnLT5tc2dfb2Zmc2V0LCBzcmNfbXNnLT5tc2dfc2l6ZSk7DQo+PiArICAgIGlm
ICggc3JjX2N0eC0+Z3Vlc3RfdmVycyA8IEZGQV9WRVJTSU9OXzFfMiApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIGRzdF9tc2ctPnV1aWRbMF0gPSAwOw0KPj4gKyAgICAgICAgZHN0X21zZy0+dXVp
ZFsxXSA9IDA7DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICBkc3RfbXNnLT51dWlkWzBdID0gc3JjX21zZy0+dXVpZFswXTsNCj4+ICsgICAgICAgIGRzdF9t
c2ctPnV1aWRbMV0gPSBzcmNfbXNnLT51dWlkWzFdOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAg
IG1lbWNweShkc3RfY3R4LT5yeCArIHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8y
KSwNCj4+ICsgICAgICAgICAgIHNyY19jdHgtPnR4ICsgc3JjX21zZy0+bXNnX29mZnNldCwgc3Jj
X21zZy0+bXNnX3NpemUpOw0KPj4gDQo+PiAgICAgLyogcmVjZWl2ZXIgcnggYnVmZmVyIHdpbGwg
YmUgcmVsZWFzZWQgYnkgdGhlIHJlY2VpdmVyKi8NCj4+IA0KPj4gQEAgLTE3NSwxMSArMTk3LDE3
IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpDQo+PiB7DQo+PiAgICAgc3RydWN0IGRvbWFpbiAqc3JjX2QgPSBjdXJyZW50LT5kb21haW47
DQo+PiAgICAgc3RydWN0IGZmYV9jdHggKnNyY19jdHggPSBzcmNfZC0+YXJjaC50ZWU7DQo+PiAt
ICAgIHN0cnVjdCBmZmFfcGFydF9tc2dfcnh0eCBzcmNfbXNnOw0KPj4gKyAgICAvKg0KPj4gKyAg
ICAgKiBzcmNfbXNnIGlzIGludGVycHJldGVkIGFzIHYxLjIgaGVhZGVyLCBidXQ6DQo+PiArICAg
ICAqIC0gZm9yIHYxLjEgZ3Vlc3RzLCB1dWlkW10gaXMgaWdub3JlZCBhbmQgbWF5IGNvbnRhaW4g
cGF5bG9hZCBieXRlcw0KPj4gKyAgICAgKiAtIGZvciB2MS4yIGd1ZXN0cywgdXVpZFtdIGNhcnJp
ZXMgdGhlIEZGLUEgdjEuMiBVVUlEIGZpZWxkcw0KPj4gKyAgICAgKi8NCj4+ICsgICAgc3RydWN0
IGZmYV9wYXJ0X21zZ19yeHR4XzFfMiBzcmNfbXNnOw0KPj4gICAgIHVpbnQxNl90IGRzdF9pZCwg
c3JjX2lkOw0KPj4gICAgIGludDMyX3QgcmV0Ow0KPj4gDQo+PiAtICAgIEJVSUxEX0JVR19PTihz
aXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSA+PSBGRkFfUEFHRV9TSVpFKTsNCj4+ICsg
ICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8xKSA+PSBG
RkFfUEFHRV9TSVpFKTsNCj4+ICsgICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgZmZhX3Bh
cnRfbXNnX3J4dHhfMV8yKSA+PSBGRkFfUEFHRV9TSVpFKTsNCj4+IA0KPj4gICAgIGlmICggIXNw
aW5fdHJ5bG9jaygmc3JjX2N0eC0+dHhfbG9jaykgKQ0KPj4gICAgICAgICByZXR1cm4gRkZBX1JF
VF9CVVNZOw0KPj4gQEAgLTE5MCwxNCArMjE4LDE1IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2df
c2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgc3JjX2lkID0gc3JjX21z
Zy5zZW5kX3JlY3ZfaWQgPj4gMTY7DQo+PiAgICAgZHN0X2lkID0gc3JjX21zZy5zZW5kX3JlY3Zf
aWQgJiBHRU5NQVNLKDE1LDApOw0KPj4gDQo+PiAtICAgIGlmICggc3JjX2lkICE9IGZmYV9nZXRf
dm1faWQoc3JjX2QpICkNCj4+ICsgICAgaWYgKCBzcmNfaWQgIT0gZmZhX2dldF92bV9pZChzcmNf
ZCkgfHwNCj4+ICsgICAgICAgICBkc3RfaWQgPT0gZmZhX2dldF92bV9pZChzcmNfZCkgKQ0KPiAN
Cj4gSXQgbWlnaHQgYmUgd29ydGggbWVudGlvbmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhh
dCB3ZSdyZSBtYWtpbmcNCj4gaXQgYSBiaXQgbW9yZSByb2J1c3QuDQoNCkFjayBpIHdpbGwgYWRk
IHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQo+IA0KPj4gICAgIHsNCj4+ICAgICAgICAg
cmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiAgICAgICAgIGdvdG8gb3V0Ow0K
Pj4gICAgIH0NCj4+IA0KPj4gICAgIC8qIGNoZWNrIHNvdXJjZSBtZXNzYWdlIGZpdHMgaW4gYnVm
ZmVyICovDQo+PiAtICAgIGlmICggc3JjX21zZy5tc2dfb2Zmc2V0IDwgc2l6ZW9mKHN0cnVjdCBm
ZmFfcGFydF9tc2dfcnh0eCkgfHwNCj4+ICsgICAgaWYgKCBzcmNfbXNnLm1zZ19vZmZzZXQgPCBz
aXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4XzFfMSkgfHwNCj4gDQo+IFRoaXMgaXMgZm9y
IEZGLUEgdmVyc2lvbiAxLjE7IGZvciB2ZXJzaW9uIDEuMiwgdGhlIG1pbmltYWwgb2Zmc2V0IG11
c3QNCj4gYmUgbGFyZ2VyLg0KDQpZZXMgeW91IGFyZSByaWdodC4NCg0KSSB3aWxsIHVwZGF0ZSB0
aGUgY2hlY2sgYW5kIG9wdGltaXplIHRoaW5ncyBhIGxpdHRsZSBiaXQgc2V0dGluZyBoZXJlIHRo
ZQ0KdXVpZCB0byAwIGluIHNyY19tc2cgaWYgc2VuZGVyIGlzIDwgMS4xLiBUaGlzIHdpbGwgcmVt
b3ZlIHRoZSBuZWVkIHRvIA0KdHJhbnNmZXIgdGhlIGNvbnRleHQgdG8gdGVzdCB0aGUgdmVyc2lv
biB0byBmZmFfbXNnX3NlbmQyX3ZtLg0KDQpUaGFua3MgZm9yIHRoZSBmaW5kaW5nIDotKQ0KDQpD
aGVlcnMNCkJlcnRyYW5kDQoNCg==

