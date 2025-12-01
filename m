Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF06C95AEC
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 04:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175492.1500138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPv1Q-0002dN-WE; Mon, 01 Dec 2025 03:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175492.1500138; Mon, 01 Dec 2025 03:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPv1Q-0002bv-TT; Mon, 01 Dec 2025 03:56:20 +0000
Received: by outflank-mailman (input) for mailman id 1175492;
 Mon, 01 Dec 2025 03:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPv1P-0002bp-L0
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 03:56:19 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af6cf2bf-ce69-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 04:56:17 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY8PR12MB7363.namprd12.prod.outlook.com (2603:10b6:930:51::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 03:56:13 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:56:13 +0000
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
X-Inumbo-ID: af6cf2bf-ce69-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNYn5NSCGZnsHueW6eVi4Ls/vf+oSXwqvylRu1nXYWeQM8GJeLSTfUZOOMfW3yRHQUmkjfqvs3x7XoqyHbS3DnLedpx9uOpQuIA6L5WsUkKCITeRdIAUoBblF7T5qhXnpTYy+iVKgQEjVaYYFcW+6ErxcIhIFUQVyqQJhjRUKviHgRJ1c8XpgaxOSRkc1dpKilvc37JEyfTfJX1QRuSj62/pKt8xkEufHIIH4Z6MJ4s31ohHG23s+rXJ0Fh/QVnwIEQHON+cNTs6KSy85kCzhbyaIb5UzFi20daqYb3aJtnp6TmtGtgs8Vn63CRGvr/7zYRYsbhRfK9PjMapTxj2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFlNIrgKAk3A5Ta9l1UYobBJjq79wtHYQWjdYWgv3+0=;
 b=YQz519TeHeAN4VhHz9+lCRw7E7rF9CJby4GeBCDl6q02aPdl4h5b0vuiaoUdyJa1LxWm4B/WRDF6Gi6/qi5RUsr+DarC4kJPZrBh0TMZTa0W8UAKtTxfMUwbBP+Tm0T78MKGiyU17stoBtcUO3+OP0DhzxG4iKZ5xgJzZDrYPWsoahIWcpBMXDHQmjCAniqgfNPUOCQEnl2neDCLYymEA6NnLeDHustmNg9kvlIYC/1iPpvH6Q2HZOJEp2fDeApsvB6sXHtb5x8E/tgCpRPzES6Eymj9knZsDX/zDXL71FnvKPk6haltYTenQpVukhJfXxdiaAo8Rtzr8sLXoktyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFlNIrgKAk3A5Ta9l1UYobBJjq79wtHYQWjdYWgv3+0=;
 b=DpZATcuigKYnBxSTNgN/0Z3l6je/LX/FboYJG+JaZTCk5Ykf44JKRpJcWUf/xCcvsdQtuS+kK/IbVG3zxP1hn1CyjzWjJ+wlY0jXNQNlVnOwi/PHVWAl5ha55RSkwptjxKd3TBs6QnjidhrOAOJr6hRnRsGFNBHdGVr8xVtGShQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 22/24] xen/domctl: domctl_lock synchronization only
 when MGMT_HYPERCALLS=y
Thread-Topic: [PATCH v4 22/24] xen/domctl: domctl_lock synchronization only
 when MGMT_HYPERCALLS=y
Thread-Index: AQHcWtXpTPLVc9pgnEaS2HNYGgIlV7UEtj0AgAeAyGA=
Date: Mon, 1 Dec 2025 03:56:12 +0000
Message-ID:
 <DM4PR12MB84514DC6BBD2930ABF2DDD82E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-23-Penny.Zheng@amd.com>
 <6f9d00c7-8304-4d80-92c8-f134cceb01c1@suse.com>
In-Reply-To: <6f9d00c7-8304-4d80-92c8-f134cceb01c1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T03:56:05.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY8PR12MB7363:EE_
x-ms-office365-filtering-correlation-id: b6ba6bcb-2547-45ff-6414-08de308d91f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UmJZSFFuL04yR1dLb2UvMDZGbjI4TENZTHpMY2FUaUlNQk9iL0JNNnVhWGdX?=
 =?utf-8?B?QjhtbnZNRlRPTXF4T3ByTjRqQS9sVFNXQzNadnVJVjlsajBOeE9LZkhCdnZl?=
 =?utf-8?B?WTJxSXFvOWYyK3ZlbzVHazAvandlL0plamJaT2ptQTZqWHpqMlBSYTU2NCtH?=
 =?utf-8?B?WWw1dFJ3bm1qNDlySmMvV3JhbiswTmxzTUF1aWVQTWVUMnNJK2J5ZThqZ3Iy?=
 =?utf-8?B?a2E4K0s1MkN0dDdBdnFrQXV3emFsSDJLNENpdlY2VmU5SXlEYnYxREZYMkV2?=
 =?utf-8?B?d09QQnc5bG0yUVZJWDVacnhSRUlVaGhEaGZNaFRQRmlqWGVpRnJmZkt0SnJw?=
 =?utf-8?B?UWxnc3hsdzNySGRxY09kWDB4Q1RxekxmeUpvZ3lta1k2YjZHSTdHNWNTTXM0?=
 =?utf-8?B?Ylh6MGlDeE1vOTZlanpiYUthMUpUZFBqSER6Q1ZBTDlaNlgvZXpWZjh5L1pO?=
 =?utf-8?B?Uk0yNDErdGUybEhHaGVjQUZVYjNBQVlWT0pBQVdUWEoxK1ZRd3ZoT3BNMzZK?=
 =?utf-8?B?aXBTc1lNQVZPR1JmVjRBUjJwVFUzWnp1RGpWTnFtYTR4NlIxeTMydjRMSy9S?=
 =?utf-8?B?YU4zbEJCK0RnNURkMHpOdXdlNDNOeFVtaXRqQUUxL01ZNGJPMUtKUjRQdXhD?=
 =?utf-8?B?eW1NOXdEL21xR2ZDa2JDWjAwUkJnVVI4MG44UXNKTlpGS2QwRm1lWmYxVDNq?=
 =?utf-8?B?aTl4NnE2N1QyLzV4Z2dPN25sSVZ2dktMSC84QlFYM3lLdWpnVHgyTThKWW96?=
 =?utf-8?B?M2V4aVc4M2N0b04va2I2R05FSFRPbmZPZTd2UmJIbVRmSGtoWm8zNE5XZnBa?=
 =?utf-8?B?SFBvaHhReDFrTFEvcEl1YUZheGxieGFGWXJ6NmVNY085VEdqd1hWQXBhNTkv?=
 =?utf-8?B?Z0EwOWZiUVpaNUFlOGQxLzg5aDhTRmszMjBaTWtrVnJ0bVJyVEh4blUvVmd5?=
 =?utf-8?B?Zmd5Zjg2TjlwTjIyMTVLeHFteHUrcVJmajBhbWkyQnN4UHIyczQwUnE0TUh5?=
 =?utf-8?B?d0VaV3lUQ3ZYSjhqZFpwc2Q5emcwWURlcjBkOFRIendsendaNEx6Z2dCSFht?=
 =?utf-8?B?WHIvV2NWMzArcXZwcGhoeDA0c0NnQVdRdWZHU3E4YTlidkM2cEFxNFFLemly?=
 =?utf-8?B?RGtWNFgxeENVcldsMUZxeGxJN0hkWm5ZWHVydGZVRFNMTk41VmlwcWJVdjRI?=
 =?utf-8?B?RkJvNDFsOXJwMU1EQmZpKy9sTHl6N2xXOGh6UlN2MTJKSllENS80T0l3dldX?=
 =?utf-8?B?bE5mb3E3bGl4MUZSL0N1UWJkLzN3TTJ5V0hwNE9zRlVsOGdxcUxRU1crL2oz?=
 =?utf-8?B?OTUxM1d0VCs2MWYwcFJxYjZQcG41SEM2VjNaK0tJRng3L1FjTjlCclJidzY5?=
 =?utf-8?B?L2JvekxuclM2WVdLVXdBNFp1ZmVPVjdFbnNGekl6d3NidXF1K01PeW8rSHJD?=
 =?utf-8?B?aVZFdE9qNm1GMThhalc5N3d4UEd0VCtoQ2pHc2J6RXVkb1JkWXE5enRmMmxp?=
 =?utf-8?B?Z0xvNWpLek9uWnpaeUw1MXBmYjByaTBjMFZNY1Q0bUY4SXEvTkkwcENhaWZY?=
 =?utf-8?B?dEZGclNvQ0hmN1pFK3FJQ1JHdlc5TXJJdnFXOFpBakxwdU42MkptUCswaUox?=
 =?utf-8?B?Wnp5dHBpb2R1bTRKTFBBY1ZSdzR1WndNcTUvRXBIaGwyblIrUmJvbjRWT0Fi?=
 =?utf-8?B?RVBSVXQzNktKRmNBNUxUZ25CdTFtUHVqaU1CWjk1dy92ZWlBQ2NXNUl3a1lK?=
 =?utf-8?B?b1NtSEVHZTR3cVF6MXA2VmpObXZpU0RHSzFhcm1qY1dEK2FaSjZuQjJyTFZI?=
 =?utf-8?B?cXFQZ2RxOTd1TEg1WFRxZ3J1eTB3ZnhJSlpuQTgzSldGdVl3YVVVbnU1VWNs?=
 =?utf-8?B?YWp4amhrbjRHNDl4bVQvK2gxYnQvR1B5MStERlV5QzZBemRBc3hJSzdaaHRB?=
 =?utf-8?B?KzBmSmR5SHBvdW5RbFF0US9RQ1VQZkYwM1ZvL0pyUFpMNWJhNXVEczh0Mito?=
 =?utf-8?B?RmJVdi9qWk84Um5wR3BoZVlmZUhmR1dSdy9vRlh0djZoL1kvdFV5M2J0andt?=
 =?utf-8?Q?al3li1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjZ1b2pQcDNTSVMwY3lRSGZjU3BGVExMS3dPdmE0SEJWZzJSMDlPZ2lUbEVl?=
 =?utf-8?B?M3gyckNaZ0h1MTJkUEY2MllBMGt0a3FINHA2Mm1aMlBwaCtPODdkcTVYdnlk?=
 =?utf-8?B?b3Bzd1VLVjc3d05XYjZKTnIweHdWUURJVHFiT1hMcHlPN0JXS3dLTHRORVpU?=
 =?utf-8?B?WmJ0K3QvcEd5UnQyWWZJbFNxRHJWS2I1WkFqNm9nMm5qVGJ1Qk1QdUNhZGNZ?=
 =?utf-8?B?cjlnUy9hQ2pndUt0S0dYUXZKNHBNYUZFa0plN1VHYVRmTzZFNjZyTG1aUUh1?=
 =?utf-8?B?OFgwK0ZCTTdQdUNVdWk2czNHVTVCNkMyTGxkc2IycjNKSTd0Q1Y5MnJTV2Ry?=
 =?utf-8?B?Rk9uUlpRSW1Pc0JQWUZ4R1lwY0hhTGhwTE1sQi9WYmxCa25sUzNTR2p4aXpp?=
 =?utf-8?B?VXhTZWJBWXpYdUdNNEtvcUJYY0Qrb1R2ZlBlL0RCSGlDcklOUjNCU3dVUVRa?=
 =?utf-8?B?TzJIdEZ6bmZ5Rm5oaW83aDczRThKUWhaQ2x2YUgzUmt3Z215V0I4dGFaOExI?=
 =?utf-8?B?a3BzTkVtSUJrRm9qMkpOSGVWbUkyaGd0bkV6OGpZREs1SlpRR2ZmUTNvOXFB?=
 =?utf-8?B?bGtIZHB5ak5XbTNYU2lpQ2NBZ21SbTc2Ym01TlplZEw3b2g4L3FncFREcVJi?=
 =?utf-8?B?T3p6b2p0Qmx2M1k4QytINUkveklOb2d1MjBNUlN4WlJHam11aWpyN3hnUGtS?=
 =?utf-8?B?L1BGZGhZU1V3SW1aYzRLTG10dG9JOUdFVDhRQjFlaStRSmZtQVVQMHIrQ1NU?=
 =?utf-8?B?UmQ3SW5FZVBaRUJJSjE4MWREUndEalEzUFVmdGRjTFR5WmNDZGRQc0RuTDRE?=
 =?utf-8?B?STRSdUEzZnQzYmRoWW96cVB2cHA3MFRVUVVnM0M4aWE5Y201UzAzY2tWVi9J?=
 =?utf-8?B?dVA5UU9WODB6TzdkT2w4MU9OdWlaNEpzR3BmRWtEUlVTOWpjTkJ5MEZkUW5Q?=
 =?utf-8?B?eGRqbmYvTHlLRDBENk0xZUFkVjZZcEFaeWtleittWSszNUtUMHNNQSsrck5y?=
 =?utf-8?B?YlJwTUFjeExObmloWUxzMGc0NzBraWNRQXZ6MkRscnFSZGxkYzdEaWd6MnM1?=
 =?utf-8?B?ODI5SDU2SXNPRHVYdmF5eDd2aVB6OVRWbTFTMit5WmU4bHdPdlpXeDVrS1Ir?=
 =?utf-8?B?S3FFcHZLbWdJRTIxZ1hLbnh5aDVDK0xwSFZJTzF1R2MvMXdkdWpYY2RWTk0z?=
 =?utf-8?B?eTd6Y0ljZnJFcVVlVFNENWgzOEZwamZVN280ZnhPNGtkYWNnWHZzb3J4U1pK?=
 =?utf-8?B?OG1tMUpWRTdWeDkyMUlKUmNYWjhoL2l1cGF2VkdVM3htQkw4T1VvOVRRTHBF?=
 =?utf-8?B?dzZKYmVqQ3Via1F1TFZnelEzOS9ETTM1d2ptVGJYa0NWMThGRkNHVllKcHJi?=
 =?utf-8?B?TmFUTm9HNXFvR1ZwNjM0d0hpa3BqVmI1WTRhOWdBT0U2NjZObGJXZG5TSEZQ?=
 =?utf-8?B?eENqcFErbThpd1NLMXZFdXBHd0J2cjBieUVyV3FBanExR2cvV1Mzb1BUV2Fl?=
 =?utf-8?B?ZG5sQ3h1cDNEZGlwWlkvZFhGV2pKSk5EZDBDWVN4WDV1cnl3RS9PMU5ZWHhk?=
 =?utf-8?B?WDZ1MjhJSzdJRld2MlA5UU9yQW85dU5QekNkTTRleGp6RXV4dWFTSDFjSVNa?=
 =?utf-8?B?QWJ4VWpOWmp5MFAyVXRlV3dna2EwMm8xUkxmZUZQaHYyeUlZU2ptYmtVdStM?=
 =?utf-8?B?QTIrSmpyaWdCSUxhWG5wVW5EU3huOE1UeTBrbHVtOUhDdUlKS3NSMlg5dEow?=
 =?utf-8?B?RDFEUVBSVHJRN2NqODhLTks2ZktZWFVWc0NZNGpwR1hYN1lqVTNWT2dQVmk3?=
 =?utf-8?B?bnVTSlZiNmFBWThSSUdlUnhQRWRzZkRkaHU1Zkp1YXVsYnZYQXA2OVBXbTlN?=
 =?utf-8?B?cXVSUTQwK0ZJb0dMQWxpRUsrNUxBTGlnRnZvUWN5ZU1OVnViVnQrdUo5NDc5?=
 =?utf-8?B?NDRKV09XUEUzSUxQVURGRWRVZWxhVEswckFtQW12My80VkJsMTBrbTFTekZk?=
 =?utf-8?B?UFpLc0V5eXVnYlVRTG8wMW84OGZnelB6dFNHTU9oWUtXd0tWeFl4MHpYTHNS?=
 =?utf-8?B?eEZlZXFXWFcrWGY5aWlIZklUSXV6TThkZHh5OHdGRFNYcEpWNEJhZ0lTM1Nx?=
 =?utf-8?Q?ZNhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba6bcb-2547-45ff-6414-08de308d91f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 03:56:12.9913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5SapAOkpUKGiSfEX4WMMdPoTh/GAZwmCIUnUvRNZBwDmBC8fwwxI2wKyT8zRTT+qVd1hf198BAv4GP58QJeXQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjYs
IDIwMjUgNToyMSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBncnlnb3JpaV9zdHJhc2hrb0Bl
cGFtLmNvbTsgQW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsNCj4geGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMjIvMjRdIHhlbi9kb21j
dGw6IGRvbWN0bF9sb2NrIHN5bmNocm9uaXphdGlvbiBvbmx5IHdoZW4NCj4gTUdNVF9IWVBFUkNB
TExTPXkNCj4NCj4gT24gMjEuMTEuMjAyNSAxMTo1NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
SGVscGVyIGRvbWN0bF9sb2NrX3thY3F1aXJlLHJlbGVhc2V9IGlzIGRvbWN0bF9sb2NrLCB3aGlj
aA0KPiA+IEhWTV9QQVJBTV9JREVOVF9QVCB1c2VzIHRvIGVuc3VyZSBzeW5jaHJvbml6YXRpb24g
b24gcG90ZW50aWFsIGRvbWN0bC1vcA0KPiBhbHRlcmluZyBndWVzdCBzdGF0ZS4NCj4gPiBTbyBp
dCBpcyBvbmx5IG5lZWRlZCB3aGVuIE1HTVRfSFlQRVJDQUxMUz15Lg0KPiA+DQo+ID4gU3VnZ2Vz
dGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+DQo+IEFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoeA0KDQo+DQo+IEknZCBsaWtlIHRvIG5v
dGUgdGhvdWdoIHRoYXQgLi4uDQo+DQo+ID4gLS0tDQo+ID4gdjMgLT4gdjQ6DQo+ID4gLSBuZXcg
Y29tbWl0DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgfCA1ICsrKy0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+
IC4uLiB3aXRoIHRoaXMgZGlmZnN0YXQgdGhlIHN1YmplY3QgcHJlZml4IGlzIHByZXR0eSBtaXNs
ZWFkaW5nIG9uY2UgYWdhaW4uIEkgbWF5IHRha2UNCj4gdGhlIGxpYmVydHkgYW5kIGNvbnZlcnQg
aXQgdG8geDg2L2h2bTogKGFuZCB0aGVuIGFsc28gYWRkIHBhcmVudGhlc2VzIHRvDQo+IGRvbWN0
bF9sb2NrKCkpLg0KPg0KDQpXaWxsIGZpeA0KDQo+IEphbg0K

