Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJlRD7VVi2k1UAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:58:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5882811CDC6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226571.1533082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq8G-0006Dj-Jd; Tue, 10 Feb 2026 15:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226571.1533082; Tue, 10 Feb 2026 15:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq8G-0006Ae-GP; Tue, 10 Feb 2026 15:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1226571;
 Tue, 10 Feb 2026 15:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpq8F-0006AY-5D
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:58:31 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 552579c7-0699-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:58:25 +0100 (CET)
Received: from DU2PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:10:232::27)
 by AM7PR08MB5479.eurprd08.prod.outlook.com (2603:10a6:20b:104::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:58:20 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::68) by DU2PR04CA0082.outlook.office365.com
 (2603:10a6:10:232::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 15:58:20 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 15:58:20 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB6302.eurprd08.prod.outlook.com (2603:10a6:102:ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 15:57:17 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:57:17 +0000
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
X-Inumbo-ID: 552579c7-0699-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W1hcuvwzwuS1wybMpXpyUP/68mBZU8cXvrpGzizZUC7CWmdhWgQZJzVP4DyqZUrwmk50ruVars27MsoKpSIM1tnlOsiijkaKZZO9Jbt+7bMtA3oU0VlaRczyMcMA7vt/w7vYbc8catfru/3PBNPY0P+41YHWMXgMahODqVUgxdRQfAxMJw/vDvuyP0IShbL7XNZoztbLFOiVGM8yW0yt1NBXu7px+UZW7v0n32msJFzGZgfUliwV9pHMLfxenikRgHe2mVRGWX4o6WNnVwplcUwgW0lSc/ntX9dJvMn5uQOvSCp6KeYPoNPvAIfPSPcid4kSIRrksnn7xqQCFwqEdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi4lepyvIgrMq0Tphww7nydOu/MHL4NuBQXKbDmxgaw=;
 b=mxGMXLcBUEjudVrCFT3JmWZBn/RKdKJmcWGGNwVH6iLMv4zdpAc/AQuIdgYGKiTJ6pz8oihDN9tIguuGg+duXzKVH9EJszoU8XvrJKAGbHWqbT6cbyj6ue1wCTz8grB+kg8VwC27RQiiHy/1KyCQGYzIdkR9y03fRqCQjg5+kLsiJh4l0M8X9Prs68/q2NAZYPTfuT5xh2YdNc0CaTv6D0dda5mUUFYwjtz/tlOnVM42Qqbz2yspFdFD312iVF5NWxQFBOzMEg/PcyOic1XOBxI97t+VzirjZjkEcNkHyVnXUjAhWxjdsP5Ic8O9qzwP0x6ar4ICk5sREcPTTlR2LA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi4lepyvIgrMq0Tphww7nydOu/MHL4NuBQXKbDmxgaw=;
 b=jaXglsB4eZ3toGGRcgJM9ZmfrsONcGuL7EYtfAY/9VnDWEO90+J4mgodaVDFGc//FNcAJsrLRXL4OEjopwC7IyVk2IKewEpsUa8ly7hscolZh8BfHLAp+/3Dh70wSJilT8y3k2iuJ3HfBtXRFdQpWkQYuxeAAKsIKIwvXhGhpLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRLxC3QnHBEmECcH///L/T3z605F03wUJi6xNo04b6OOu9IkPvfCRM7h8qiA2gWO63bHDTR9nNvbDcp79U9X9K1m5u8anDUp3UywAu3NLrSV7Mf1xaZ58rC5bB/ZaEhOWSEkKWQbji2cF/zm/j9yY0CFFnTadx0taO3betL6xwXIrWZCMrrrmJHc+mRr/IkLNfds+zWQKSeNOwDbsh4fAj2wJB4fMLGrgEbVFDr4ntHCHE0XuqM0wJP96FmURJlfDkyF7MtkNU201caLP6F6bN/SVQuIDSqBWRlTAdvvTFRUgzTkMz68qSMYKQ+KsIK31cBEbuYqHZz35Si9l2ruHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi4lepyvIgrMq0Tphww7nydOu/MHL4NuBQXKbDmxgaw=;
 b=mSYkyGf477hE8sPGJzlPeafthZMwUr2CO2dzvlmJvmU0+vSpi/Ds7zmv5CgopkTkR3r3ui9EARTjbFw9md4Wjm9q7RfVs2dL1uGKg9agWF/poPPdZAHhCbBYnH++0F56Vx/819a46O2uoa1GHRKcjpB96AH3HOMXp+nrZXLseiKU9raKtFEGo0nXvRHCWPI80wc/5utnjx20tnUKGc3eLsKIit7BRQRpdOzjPSxOdZ9s7zvtwf/wDcWU7zDFExohQx5JdseGvKonoMRjUmHYk2pLmlLrdTaNP+AaG+JKTW1jTCqY80arYOmZKHMfvmooOxv/+yxg5ozphnpZzZO42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi4lepyvIgrMq0Tphww7nydOu/MHL4NuBQXKbDmxgaw=;
 b=jaXglsB4eZ3toGGRcgJM9ZmfrsONcGuL7EYtfAY/9VnDWEO90+J4mgodaVDFGc//FNcAJsrLRXL4OEjopwC7IyVk2IKewEpsUa8ly7hscolZh8BfHLAp+/3Dh70wSJilT8y3k2iuJ3HfBtXRFdQpWkQYuxeAAKsIKIwvXhGhpLc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Thread-Topic: [PATCH] xen: always consider '/' as a division in assembly
Thread-Index: AQHcmp+J15vvFrxtUEGxE7lRiZXN1rV8EwEAgAADNACAAABcgA==
Date: Tue, 10 Feb 2026 15:57:17 +0000
Message-ID: <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com> <aYtVBuHVcfZE-L-a@Mac.lan>
In-Reply-To: <aYtVBuHVcfZE-L-a@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB6302:EE_|DB5PEPF00014B93:EE_|AM7PR08MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f15304-e2e8-4138-d7aa-08de68bd3659
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T1hqdlVUV1BES25Ld2c0WThhWE5TblhiUXZmQUVSWHBJNDBPMEZnL01ZcWw5?=
 =?utf-8?B?MFZwVkoxbDVuMG1pRkpDYXNVWU00L1VKRHAybnFRNEZBM1cxdGNvVTVhTUwy?=
 =?utf-8?B?NFNuOGQ4QXlmSENib3h6ajZzcTNHK0FSZ0UxWFZQY1VKQVVzVGlHMVNVejV1?=
 =?utf-8?B?SndOWWR4YXdEbjZjZ0gyWGlQczRueUJoWmNmTjJaRDdTYTJEamVpOGJnZ3lx?=
 =?utf-8?B?bk1URHdEZDlkbkFLMWNwTUNGYkFQUFFVTGdxVkdSQlNJaVMyM0tLS1g5Sm5o?=
 =?utf-8?B?Ym9wUTVMNVp2V003NFgyL1Bkbm9MZU5KSEN0Z0JhV2t2bDdtQnN3cVk4emRB?=
 =?utf-8?B?dVBWcU5BZlRCOFFydHJsQkxsWWhSSjkraGorbm41OElDNUNEYnh5QTRVYkxK?=
 =?utf-8?B?V25wUU44QnkyT2VWK2k5Yks0dGROc2FPNXY1V2Z3WCtJVUZQK1kwd1BFU0hp?=
 =?utf-8?B?alkzeXl1c1lNbmFFOURYY08zdXJ3QnFOcElVQjhwTWpxa1dML202cnZTZkZZ?=
 =?utf-8?B?MXJuVFNKVG90Z3VOSms0c1d1ZVJxSzV0MHI4b2lINFlDZ3N2YmpWNTZYT2E4?=
 =?utf-8?B?dXBSVlp0T05icjdDK29oL0NrM251aHlvY3BoQ3k0Q0N6UHNhakdUK0sybk5t?=
 =?utf-8?B?V3ZHUExXeU5FZjM5czY0Tnh5YTlYRUhmbEc1YTh1aEJqVkJDNG1WMHlSVHR0?=
 =?utf-8?B?dmxrdWJyck5rMVZrQXd3dmtyTERmUE9CS09LSExXTWJMeDNySVhYakp0YWFk?=
 =?utf-8?B?RFBwVURpdCs4UkczYy9hUDQ1WXMvaHBadjBBSkZuOGJDTVJJUzJOejlseTkv?=
 =?utf-8?B?Y0VZbDZ5a0JpNE5zYUVLL2RZR3VMV2FYdEx4MHJ1ZDlacTczdTdwMFNWaHJj?=
 =?utf-8?B?c2lQZHdIWkhNTDc0SjNVZ3I3Q3hDcTAweUlrUjJnK2wzLzRzMXhoR3RmeGJ5?=
 =?utf-8?B?OXpzZG1nMU13bVk1WVBScjJuUGRDcjlKcWdKUmlxNDdnYm5JNjVKRnd1OHRa?=
 =?utf-8?B?bWZnTGorTTVVRG9YbFJjemZtNi9OZkdXWDZYSjB2ZFo0eEx3Rm1FNWlDWDBl?=
 =?utf-8?B?aDJSdjNDU05sQkdtT2RDUHBlSE9BK0xmK2ZmaXFFMXNUZU03cHhzRzM1a292?=
 =?utf-8?B?aWhEbHZXZFVIQ1RrTXV3bVBjVlBUdml1NWt6QlBQMjNxQXkzM0dQSFVEQzAz?=
 =?utf-8?B?dWZYc21adUd5alp4cGdLS09QZUN5WEd1ZkgyTWhsOWJWUWFjMVNBSHVFcjZ6?=
 =?utf-8?B?cVpXZVhJUE1LQTl3M0RVOUhiYnc3RjNhc2xkbHN6MXVhdVIzNHFBOEtsNlNj?=
 =?utf-8?B?azhHWG9qMXlRQ0NITTlLV0hFV21BTi9VRTJLN2V3UFcxQ3dzdVNzMGlrOXNQ?=
 =?utf-8?B?UDhaVnFOMmJ2S0JHYzBsY3c0WU9BK1BudlE1NUduRTBCR00zV2FqWGx1aUpC?=
 =?utf-8?B?UkduUHlteTMwcVN1WUFQTWowNXR1K0NwZ1NMaXdpVWpORzVrU1lVTjFCdXNm?=
 =?utf-8?B?bzBKTmJGVDdjaFUycUpzanZzZ2szUEliZTIvZzBiakVrcTRNWFJlOFFUQ2pp?=
 =?utf-8?B?SkNPTmtiVUJuRGFlY0xUNUh2WC9TOFRvWkZtQStNcFFJUUVwUlZkd0YxU0JW?=
 =?utf-8?B?dlU0VXpza3YwL2ROVkQ0eUl1OFNWdHo0N3ZxQlNHNVpZUVkyWmphN1ZRZ1pZ?=
 =?utf-8?B?NHp3bnRLTWFTc1p4QjI0MGpmbkZTNStld0ppLzE1cW9EWDNvWXk3SU5pbEpw?=
 =?utf-8?B?R2FqM2pmNUVINE9SUnhMVXVDZ3lzTlVWbC9tWkdNMGhIR0t4ZnEyMEppMktL?=
 =?utf-8?B?aUo2ZkxvQlBLWTA4aVdDWks0a1RnWkhlcDBXd0V3bzFDMTdKOUQ1emtoTU4x?=
 =?utf-8?B?VmdaR2dvL3pkQ25YZldkM1hyRzEyQ1NxS0NDVVRXVmd0dTYrWTVLQkFIN2gz?=
 =?utf-8?B?ZFVwQnhzMjBPNE5SSHpuY1BUT2tWY054b1NXKzFtWjcwcVJSdEc4L0tiUlB0?=
 =?utf-8?B?elJUcW5TNW40aDNxb3pFOTdEajR0eFZiQWxOcjZYUXcyQ05uQmhxZ1V0MENT?=
 =?utf-8?B?RXFwbTloUHMxcjJ0ZU9MRm96VEM2elNKQzBxWHZZNnZqTnNhRUI4Q2w2aWpz?=
 =?utf-8?B?SWFrNGQ3STloUVQveGZCQ2ZFdUh0UHUvTFRCSGVZUTJObjF6M2FyVUdCNHQ4?=
 =?utf-8?Q?taH61OKNUW9lD8HOKlkvdm4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <401CEA7BB284FD4291B44107571DB7FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6302
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54a25e25-051e-4fb3-7f6d-08de68bd10c1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?US9FdkNpdEROOGhLalJmMm80SVpRYlF6M0FlcE90bmVoTlhBOW9saUpXcjJS?=
 =?utf-8?B?YjNzZ0drU1BBWXExVU9xeFQ0SDAvY2FSWWFnR1pzLzc3YUdNRnNReGlwV0Nv?=
 =?utf-8?B?ZWRXUFpHbFgwWnlaRGdOWHNDWEYrMnNoVzM4LzJFSDJpaTdLZktwZXdYbmpC?=
 =?utf-8?B?dGNBVWJaRTVkUUV0TDBMQUR1OWkwV3NHbWpvVGxrVGR4Ri9BN1U0OWw1azNx?=
 =?utf-8?B?bHhiNXpPSEdJRklweHFWYU9Lc05qSWxRelhUR1ljc2Vrd3ZhMkU4c2xsM3Er?=
 =?utf-8?B?UjBIaVYrQmFJblZoZEZEZGhvOWlaV25hVi8yaUVOL1I5eHJyZ3dQc2JNT0hN?=
 =?utf-8?B?VDZ1NncvTUpMeUw4ZEJvTFpOSjhkTjhwRU5pb2NuTVFWWUNDZndiRGFwUHFB?=
 =?utf-8?B?MzV5QmxMY0pyL280a1NOOWlSTlhYN1YvMkMyanpXc1FnZjMyV0dLbVEzRDV0?=
 =?utf-8?B?dWVjdm1aWnFXZW9YckdvQjZOb2FCSllqVFRLbXhBT1BMVlp0Q3FDZVFocDNl?=
 =?utf-8?B?WCtCN2x3dWtKcVZaNGZDeHBERHFJSGswU1piNTNYOTFsY0l4MjMzTTV6Q0di?=
 =?utf-8?B?UnF2V3VnNGYvK21wa3grMjUvU2VuR1ZxNHlVc3pUNlVBbHo3TFJuWlBwWmsx?=
 =?utf-8?B?RTlyTW5oNUdROVVrbzhsOFVzSmFtdWIxa2xodHQwK1ZHZC9BSmRadi8zWkFX?=
 =?utf-8?B?b1VWcStyaDhLZ3dDVkRKa0FoWFNOVmFlS2MvRXNHaUdrdXRPM0hxWndlcEJi?=
 =?utf-8?B?UjFWaGQyMnRIMWhtQm4reDk2Qms5bVBzZjdsRUJFOTI1TmZvcVpseWtZeCtH?=
 =?utf-8?B?ZHdrcVR5VGlTYmZxYWhVMTVUSU5iQjUzR3ZSVWNzK2RoaHo4WDJTMVptemdu?=
 =?utf-8?B?bkkyMVRsYjhaWTI1SUJHZWM4SzJ2VFA0d2JhazVYclVIRUxXcjRrZjZPRDlV?=
 =?utf-8?B?a3RlVGZHenFzY2tTampXVEhpUWdhc0MxRkFkTmdqWnROWnRLdU1iUTN5UXhH?=
 =?utf-8?B?ZTB4MHhtRGJva3hObXdRKytJaENaTGFyMUR3Q3dyWUZZY2x4bVdHSUxUOXND?=
 =?utf-8?B?Mi9QaDB5WmVqNUVSTjlvOEltZndRRnFiNDRzTWU4dHplaDlYZ2ZRb1J6V2hQ?=
 =?utf-8?B?c21oY0VaWFRJbTZ0alR3bXQwVzJiVStWRHpWZVFjUkhnUTFWY3I3ay9aTUUw?=
 =?utf-8?B?NWQ1UjBBNVMvZVBuaVdSMW5HU1grUkhWYXFoMWRIRE1NckJneE5mNGVVYTV0?=
 =?utf-8?B?WVFuazAwOTluUFBmbzY1cEk4aXBhWlpOcVBmRTh2TVZobFd2dityU05Wcldr?=
 =?utf-8?B?VFBSM09TVVdBcVlYdjhoVEhlYjZtU2hVUG90V0dRaFJBR1dremtJTi94bmJZ?=
 =?utf-8?B?VEVuSjNOZVBNcjY5Y1EvM1RkMTY3RFBKaU9QdlFzMi84T0E1SHlzRXh3Nmh4?=
 =?utf-8?B?MUFwUEU0a2FLbjZBUjh2RGFrTlg2SmJhUTcwY0NObFg1MEoxOXM4WnZvN0xt?=
 =?utf-8?B?b1h1WXFQZGFhYTNhaUdqSW1ocjZhdWVIOHE2bGtMQWRDMFhsYzUwSEZhK2w0?=
 =?utf-8?B?UHpwN0p1QWIvcDEyMWxZVlM3NjgzSk00QlN5THp2c3hrclpGOVpoRzV1QWIy?=
 =?utf-8?B?YmxzbjU4ZG9YU3Q4aTA2c0h1SWxWN3Z5UWd5R3ljSVEvWm5nNVJmZmo4azRq?=
 =?utf-8?B?VUZUNldMNGVzUHZJK050UDFUMFlUMnQvZ1B1M0xDbFBYUjlMWk5HdGdVL3hM?=
 =?utf-8?B?ek5CVE5ORUVselZRSXZRL1hQWnB1eEtyYUlaT3duUTJNWHB0UTdEemIyL3BP?=
 =?utf-8?B?d2pBVzFqa0x1YnN4SFp4clBCdEEvUjRJM0hXUUV3VGdOYUtEclFMb3IvNDhI?=
 =?utf-8?B?dnh6ZnpDUWRiQmNOU2QrbTFrMzB0TEUvUjFmczFyUVd2WkRkc3NlZGdzQ3BC?=
 =?utf-8?B?ZlErSHdyWEZPQThDTStrU1dnKy83RkljalBieHdvWEwzMmZwejhvM3VhYnlW?=
 =?utf-8?B?dTljbEx0K0NKQUtNRExzT1RaVjd1VGc2VHJyN1RCa21YQmhRSzArUUIvT3NU?=
 =?utf-8?B?YW1Pck96bmFDeUdmMjBlYkYxL0kxT2xJQ0pYTlhVRFJuRWRyRElZaHVmODJr?=
 =?utf-8?B?TG5ZRnR0N0FhTTMrMThFNmo0YVR1S2hBd0FjUFVaTnUxSUltSlZsTFNnL1lw?=
 =?utf-8?B?UGR1TiszYU40NktGWTBSSURXdktFR3BNeEVGdDdER2lPMGpKMHl3V0RITFJN?=
 =?utf-8?B?QjFmcWkwVjVBV0tqQjRNRHQrWVRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	crWePFs9r2BTgkeeYpwPbCXD3nD6LOyQPOC7B1MiXRQZF4SSnx4Nt1ECq2z9iY1LNKEUdzZ32YphDSSKFj70J9/KMORadp8UznFTJKz2jzu8jVKCFQGRfQyeHj9Vbz3NnKKYPqpssgAcyjcXIPpt9XPlvgTH4PbmFWFRT2Ub+AiAdDjfl5/TABlaUqysRCgvhxBMGMGnTa/ayosa/SWQM0q4PPt1uvLF0TOtNq2T53WQeo4rh/zT6zgxNVuKsQ9ryc1oGZVS6oEK8ODUE+J4qjeRQZE1MerWIemAEUB/X04RoWl+vID/T+MHwxQknY2fP09OBEKVpue90zC8Ob88S8RXFEmekwBCmgNChDl3qsmgJCTRJUY/2jVA+nudfE6aZI5R9Y79a4mgr3QFgkRZw2VSESAVDbUMvgJ6qP7AL8ftk6PrjUpg6akzeWmrm0cm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:58:20.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f15304-e2e8-4138-d7aa-08de68bd3659
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5479
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 5882811CDC6
X-Rspamd-Action: no action

SGkgUm9nZXINCg0KPiBPbiAxMCBGZWIgMjAyNiwgYXQgMTY6NTUsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgRmViIDEwLCAyMDI2
IGF0IDAzOjQ0OjMzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBSb2dl
ciwNCj4+IA0KPj4+IE9uIDEwIEZlYiAyMDI2LCBhdCAxNjoxMSwgUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gR05VIGFzc2VtYmxlciB3aWxs
IGNvbnNpZGVyICcvJyBhcyB0aGUgc3RhcnQgb2YgY29tbWVudCBtYXJrZXIgb24gc29tZQ0KPj4+
IHBsYXRmb3Jtcy4gIFRoaXMgaXMgaW5jb3JyZWN0IHdpdGggWGVuJ3MgdXNhZ2UsIHdoaWNoIGRv
ZXMgdXNlICcvJyBpbg0KPj4+IGFzc2VtYmx5IGZpbGVzIGFzIGEgbWF0aGVtYXRpY2FsIG9wZXJh
dG9yLg0KPj4+IA0KPj4+IFRoZSBiZWhhdmlvciBvZiB0aGUgYXNzZW1ibGVyIGNhbiBiZSBhbHRl
cmVkIGJ5IHBhc3NpbmcgdGhlIC0tZGl2aWRlDQo+Pj4gb3B0aW9uOyB1bmNvbmRpdGlvbmFsbHkg
cGFzcyB0aGlzIG9wdGlvbiB3aGVuIGF2YWlsYWJsZSB0byBmb3JjZSB0aGUNCj4+PiBleHBlY3Rl
ZCBiZWhhdmlvci4NCj4+IA0KPj4gVGhpcyBpcyBzb2x2aW5nIHRoZSBpc3N1ZSBhbmQgSSBjYW4g
YnVpbGQgZm9yIGFybSB3aXRoIHdoYXQgYW5kIGZ1cnRoZXINCj4+IGZvciB4ODYgb24gbWFjIG9z
IGJ1dCBpdCBmYWlscyBvbiBjaGVjay1lbmRici5zaDoNCj4+IA0KPj4gL2Jpbi9zaCAuLi90b29s
cy9jaGVjay1lbmRici5zaCB4ZW4tc3ltcw0KPj4gc3RhdDogaWxsZWdhbCBvcHRpb24gLS0gYw0K
PiANCj4gWWVhaCwgSSBrbm93LiAgSSd2ZSBmaXhlZCB0aGUgc3RhdCBpc3N1ZSwgYnV0IHRoZXJl
J3MgYSBmdXJ0aGVyIG9uZQ0KPiBhYm91dCBhbiBpbGxlZ2FsIGJpdCBzZXF1ZW5jZSBpbiBncmVw
LiAgSSdtIGxvb2tpbmcgaW50byB0aGF0Lg0KDQpMQ19BTEw9QyBncmVwIGlzIGZpeGluZyB0aGF0
IG9uZSBvbiBteSBzaWRlDQoNCndpdGggdGhhdCBhbmQgc3RhdCAtYyByZXBsYWNlZCB3aXRoIHdj
IC1jIDwgeHggSSBjYW4gZnVsbHkgY29tcGlsZSB4ODYgb24gTWFjIG9zLg0KDQpDaGVlcnMNCkJl
cnRyYW5kDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg0K

