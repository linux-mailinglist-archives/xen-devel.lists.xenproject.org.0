Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795CBCF7FAF
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 12:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196025.1513892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4xw-0001FO-Cv; Tue, 06 Jan 2026 11:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196025.1513892; Tue, 06 Jan 2026 11:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4xw-0001Cy-AC; Tue, 06 Jan 2026 11:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1196025;
 Tue, 06 Jan 2026 11:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vd4xu-0001CO-OR
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 11:11:06 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62262446-eaf0-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 12:11:02 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV2PR03MB989132.namprd03.prod.outlook.com (2603:10b6:408:37c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:10:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 11:10:59 +0000
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
X-Inumbo-ID: 62262446-eaf0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag2UvleQpeZc4fWnkm45SO9iJifmfW/XcTioLPbLwEF+o2KE9fYVK9Z/qZix2zDy+ou672VZpDNI3mVst064/LNKKrFMHK0W6na2GD2urnFnAr5ppwA+DncjQm8XnJLodLGeKZkCtwcZ5bu+WSCzrorg2FpBgys79AQkgRbbqwfCC4+w2d2GcLMaDKl5/JqmFh/qUHBqS1m5xkXYaLJyc5VfE7QYPm4Gcf3bCe+8Y/o2xh+SR3XZHsEJkx5h1DydXmjPQlcHglo+yKQYgGzvFFPywZ644yTLgjW99CJ+R4QdNtnOnJ2Ys6wu124evdC/EPX70/Wx+OX5KmOe9d0a4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+ukKtl/227861n5z68DDhFGF3b9FABE9HyFN+KtKNE=;
 b=ATsJArxq1NpyzWFSdzWtagKqHWEGyVbGJak9HTp+ARRIJySNXh+egKMnbj1GD6s5LOgDCN5sFYR64gHbiCItkGhPB5b21dFYn6koycB3o8VEJyMKXk2/adTB7WHlgVdDKjyzFN9svENDSpZvXdGON4BKUD+EUuU3jitwRh6bVd+TSuxQ4O28SuQieu5YAgqRY/EnrnlrsM6xoBg6gSvuqVWGSZWXSTTP5QpO9EMGlJYjrrAplZbZcUc551QqZcuAbwEDia20BEW9hmoVmF5ZTzaAFx/ZYJtTfIpGX3vrmTLEm36ixgsKtXl8l8sbKca8Rth/j+X8WcCte6U805WeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+ukKtl/227861n5z68DDhFGF3b9FABE9HyFN+KtKNE=;
 b=dSrgzB8n7kWLWcyWrO8dktCgsAu84MoRULgklPFHE336ozDDEfkGozbvpAfb2X7ikEawGbBKDadKGF6virBPwO+lp5gZdsrYoZCJuCi0Kyi1Fos6a6m9G4sQoTRwJcm5vR1wv/UcGMgWK494y9aakRgSy+Crb/KCpzFdqtLxlY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <296a2932-1e6c-4c6f-81cb-a76975fdb423@citrix.com>
Date: Tue, 6 Jan 2026 11:10:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
 <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
 <FBDD1B8D-F686-47C5-8117-BFEF8C8FD3FB@arm.com>
 <541EF107-3536-4525-ACC2-065A9A13481B@arm.com>
 <543958adfed3e5547141d56341c2788d@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <543958adfed3e5547141d56341c2788d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV2PR03MB989132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a033585-2f9e-4657-8dd9-08de4d14452a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJCNWFjcXpGOEtoTjZ0VkxoN3JseDJGTVZkNVRLQUIzVnMwa0lwMXVMSEh3?=
 =?utf-8?B?aTVISG5wUEl4dkJBVC9PbzR6Z0xadlRuaGplMitQNmxJUzZudXQrdTNuT3dx?=
 =?utf-8?B?MHh2UDdGTkMyNmpoclFMalhaYTJNRmhzT09VUFlFN0NPSThZMmVYdTNmV1pu?=
 =?utf-8?B?TTJDT2s0S0d3REQrT0hjWWVVQU9DN2NONDVVQ2FqWkVBMlJ2VDE3YzhLYndS?=
 =?utf-8?B?U3lEandydnF1QTBIOVBpODFLWkx4N3ZDbWFrcE0xaUNMVDNiTXM4T3ZFYS9T?=
 =?utf-8?B?bzV5dTlCMnB5VU4wRkN4eEE5TS8yakFidVgrOEgybjk2L2ZvekYvUzdVUEhW?=
 =?utf-8?B?R3Vwb0xWQXFUM0kvT05qckFSdnA4KzRYS0FmRXdLUkRWbUNmZlFHY1puU0Fx?=
 =?utf-8?B?VU9Venh2bllTdFVuTVcyZTNuVmdXTzZua2ptYVBMRkw0UkJDYVI3WUoxWnZp?=
 =?utf-8?B?ay94bFl4MFFDck03RzQ0TG9rYlV3R0ExVFZHY2dJcm0xdFBEanUxWTZLT3Fs?=
 =?utf-8?B?YXBWVzhHVnlmbVhWOUFWMy9hUW03OTM0UnI2QTVLVFk5QUZoVzdhK2JBN3hr?=
 =?utf-8?B?QXU1d1dMQUUxSUU4MzBpU1kycmljOEoyZUtPWlA4ZWJWOE9va2NjUlFiRXVw?=
 =?utf-8?B?MEw3UUdtM3RwdTVZUFVuKzR6MGtzNXllQi9zYjhJaGpYSVNNUU1wY0YwQ0Fm?=
 =?utf-8?B?TXk5aHhya1c3WjFFc0REM3JGbFBaNm53N241ZHNOaVRHVE5pQkFVTndUZ1VO?=
 =?utf-8?B?cFBOekNsd29OSlVyYmkwNWZXMHlaaDhMWmFpS2dDcVF2c3BtckdKSUtDYnMv?=
 =?utf-8?B?VVF0YXFsUWh3ZXNVM0Voak9hdHZGWGpkRElWTERYTS81Z25HeEs3alVobXBE?=
 =?utf-8?B?M3c2dFp0VW9JbmcyZkdMdjBEV0Iwd2V6Q0pxckJpK0Z0YkNFcU1lTU0zUzZG?=
 =?utf-8?B?K3o2Um9SbnBhbkZyc3RhZHMyRTk4QmhxdWl3TlVSV20zVisxRGlQSXJpTnQ1?=
 =?utf-8?B?ZFpQSHJJYnlwenNUeEt2OVBDUm1ZOE9leEpPOUQrK0RZeHB4U3VGOXMxNFZ3?=
 =?utf-8?B?Qno2RWZkbFJmbmR3aC9rb2lhWHhvNVpydFgwYm5FOGpPQnBwazNuS0RVOEZo?=
 =?utf-8?B?Ny8ycndRMzJLRmVKcUdDa0lERmVuZ0haRkkya3R2Zll6cTFqUGV4TmNpa1ho?=
 =?utf-8?B?MUV0OFUrVHFpaTlUb2pjQ201VXh0cE1lUmpzMVYrSTlnbkx3T0FHY1VabkRw?=
 =?utf-8?B?aDBFVFdkSDVWZlVTak81Y2x1NlVwalAwTnBsb3c1bE54Y1UrWStmYmx0YkFr?=
 =?utf-8?B?Sm16THVEMitIb3NCVjRUWnpoZUpGci95emVzcFpTMStIeDdZR0hIQWN4cEZv?=
 =?utf-8?B?dXMzWURSd2hFU01SdnY5cVo5aFVUZ2tUeUFNY2QzR2Vtb2twcHhkS2tLWU8r?=
 =?utf-8?B?U05VWTFEcEx2M3ZsRkV6Z0kxSldOYkVVWFh6VDUySmcrNHhUS2FIeFh6Wkt1?=
 =?utf-8?B?RjdEYkVCY2diRnRJMncza0FiYzhtZ0NtVjE1a2p6amJ4VDh0OUFTVUNPa2hu?=
 =?utf-8?B?dkNjMkVLOGVoL3pvenMzTnZKNTBaa0tlMnlxS016ZVg0Z1F5WXc5RS9IMERw?=
 =?utf-8?B?ZUNaOWtBT3pXOUJML3NrKy95STdua3FvTzJyRWpBaGNZYUJETWUxUnA1aTB2?=
 =?utf-8?B?Y2Y5K3ZwYU0xRWxTWXk5NkFuRXdyb3ViY3hVT0U1b2lVWFlETnJJaHhwcFpP?=
 =?utf-8?B?NGI5ZWQxdjVJbWV1bzlRZk9GUzhzelVYNG1tUHZrM1Q0S093RWRzOFpMSmdl?=
 =?utf-8?B?emtxY1Q4Zk4vRTZGYmVtTFhZRktEaFZoZzhnaEpJZGRrSkpiSHIzK1hlc3VO?=
 =?utf-8?B?T3BXUGlrNGNHN0poUytnL05DZGNYbzBhNWJ2WllaT21rdHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdZSDlsODhHQmQ0b3B1NGMvYlZrNlp5cFRwRVMyTEx6M3pwd3BpeUltM0Q4?=
 =?utf-8?B?ZWVIV3lRTVlNUE4rWkhLWjI0K2l3aVVHY1RxamNEZk1WMGJReDFEM3RVNlFy?=
 =?utf-8?B?NUtmMVhnMnM4Z25FeWtlWmluZ05HSnhhbUo1Rk4wSG5LMTlIK1ErWjR3Ri9v?=
 =?utf-8?B?eFpZcWdYbWZrd0ZLalJ2YXUwWWpXdjNKWXlCWXlncGtuYmhwZE54ZGpGVUJP?=
 =?utf-8?B?RXlWY0ZxOE9FNU5QNlJPdCszb1AwYVo0amJycE9LS1FnSjFVSFhaYlVWaFlL?=
 =?utf-8?B?STZpT0lINUVWaUVBRXNpN1JzbmdPdlVOcXNqMGw2ZnU4VWwzRkR6N0VpRFNh?=
 =?utf-8?B?TDFvd0lucTlpbmFQQVRzL0RtMzVGZnVqOXJoaDFINHVDeFpoS3FUUGlCdGpZ?=
 =?utf-8?B?bzZORVUxWlNJRjdYS3kra25HTFRPUnFBSWlVVExzSnNhd2x4akgzb3BrUkxs?=
 =?utf-8?B?WTIwQnVxbDAxalVxbTNBZG9pNXd1Rit6czVtb3c5R2VQVVBXQkI1NkxTdStn?=
 =?utf-8?B?T2VTL2VxQ01ESysxM05aZTJqV0V4b3FGNnBBUFZrRzhsUlNTTUpaYTVncXdu?=
 =?utf-8?B?L1JKbHk4cy9JRE5pdldKZ000Sm1jQjV5eFE2VldES0R4emNQcXJDSG1qTDJl?=
 =?utf-8?B?ZGNUSGsxa1dyT010S1NIYWoxZys1K09pS1U2cll4aDhqdEtEeHhYU3FzbW80?=
 =?utf-8?B?aTVkK0ZqL214Z05yNDBUeUVTQTc3VFh0ZkEzSXdtUlVyWFh2WHMrWkZQSW52?=
 =?utf-8?B?dU5BcHh0aThlb1d6SnVHeEtTM1ptQWtIUnJkd2ZKa01zSm14ZExIM0VYUENG?=
 =?utf-8?B?T1VIN1JQRlk3RDZ5R1JVcFp6T0Fhdzk0L3NxcmU4VG54UkNRb3J5TmUrMlZ3?=
 =?utf-8?B?SHY2U2VlOE5vMWRYQlZ4ZjhJUWpkbGQ1S1d1YWFoUkJ1K2ViRmljdlNXVDZ5?=
 =?utf-8?B?VTh2dzF5YmhGcWtST3JpSTRZbTI4OW5FU2NGZk1wWTVOcG9PdmFBekJlWHFV?=
 =?utf-8?B?Q2xyME1BS0VmVUdaeDAxM2lXZm1EcjhhTkhrUnlzRm1EdDdxK0dFdVRpUGtL?=
 =?utf-8?B?aVNJT2FqMVYyZXczYk1VeGxySHI5ZkhaVUZjYTl1ZWVVekNKWU8zZjhKZ1ZY?=
 =?utf-8?B?cEphQ0NwSkZmc3UvMFh2cnMyZE9oR2NoVTYrY3lnOHl5SGJtd3NHR0VSNjl1?=
 =?utf-8?B?bE91aEQ4ZFZZNUN2dzlSV21odWtYTEF5YWpwRElseDJ5QnNETGVEeXpIcFdZ?=
 =?utf-8?B?SFgzQ0xmWU9zZXVWRVA0MU81WG8zMHdPQWMxVWhORkRkVTdkdW41Y252MFZE?=
 =?utf-8?B?aTNGWS9LdkJ3OGdySm44cHhTVkRmUlpVWkgydlNpRW9mc21jZWs1cDVzNXdX?=
 =?utf-8?B?L2lHcTBCb2EvbW9ZRUEzNEl4Sk83MEExT3pUaGdlamhzcXdvYUl5T1pjVWIv?=
 =?utf-8?B?VWYrQnR5bjBLRm9sb3F4SlJpM3c2VDUvblRTL253eFB2QVlMNUpyOFJhaXo3?=
 =?utf-8?B?N3JnOXBycVFaU0hNWjlwSmo4dWczMG1hOTd3bTZpaXl4L2dxSnI4QUx3MW51?=
 =?utf-8?B?SXg1cjRPaU9KaGJlcUFOQTlreDEvb2k4UC9UcG9vVksvOWlhR050SVBYUHp3?=
 =?utf-8?B?TDdIOGlERXdnTzFhRENHTCs5ZjZ1dGZzbnh6eENFMWtFQW1ETzd3M0Z0R0E2?=
 =?utf-8?B?SDd2MncrTVdvRHR4VUVLQzk1ZFQrZVcwMmFkN1dmQ0NZMXFYVDBlbTl5ejNu?=
 =?utf-8?B?bDhiZUJORWFQZXd4T1E3Qnhvd0psOW9MOHdpTDJqSE9WN2V2RzVLUzBhOUFD?=
 =?utf-8?B?aHo3aTFiUE5UY1RGak9GQ2ZmMTh1WkUyQTlMYjR0NlN1M1NWdlRSV3JBMzdR?=
 =?utf-8?B?enhmeUFMQlNXT3hWU2MyRGh1bU5FOWxLdzhtZmJJOExlMzJkUU1SOTl0Vm5J?=
 =?utf-8?B?SFpkMzZKVzhSTmovdGVWSi8yTFdkNzFWT2hBRS9EbjhXeFZNYkZoNGxyWDBl?=
 =?utf-8?B?SkR5RUhLSmt5U1lXNTNZUmFUL2l2ODI2ZHdycGQ5YXFIU1ZLeWRGaWlaQkUv?=
 =?utf-8?B?T3BGWkZIZ2pzaDY2ajk4d1BRMGhYRXFiSjRCanVQSEpyMmRpMWoyZ0JlWjQ2?=
 =?utf-8?B?eU1rWk1pcVpRQVlZeUZvT0NKaGVlbzJHZmx5YmlydXlqN3NkVkxJVFZTT2RS?=
 =?utf-8?B?WXRjTDB5WVhvT2x4U2VJbmIwUmJMRm9tTk83QmFoMjgzTGt2RHFUTHkrcmxI?=
 =?utf-8?B?VC9jd2NkQzBNRlBiTTFHOThqckphQTR3Qm9lT0p5VHlUWW1wdEY4eHhvdDlo?=
 =?utf-8?B?M0E3eC9NUXRMd1ZrNUkzaTQyVC82ditudHlsYlpZVnNZMHhxK1d1ZXZIZFVG?=
 =?utf-8?Q?7liyuD39Fj77W4Zg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a033585-2f9e-4657-8dd9-08de4d14452a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:10:58.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+EqU+TtrvShO3KZuuFonH0QhVhHN0aXyuLm6EVLV3A5HFm07M7QQMzKmHxfRf9DWQQlbqY1pKo7TLqRYZ5e3rvDuPtJdHfYgrFqDhvWzuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR03MB989132

On 06/01/2026 8:40 am, Nicola Vetrini wrote:
> On 2026-01-06 09:26, Bertrand Marquis wrote:
>> Hi Nicolas,
>>
>> On this subject, could you help me understand what the following
>> error mean and how I should fix that:
>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/eclair/ARM64/12604499722/PROJECT.ecd;/by_service/MC3A2.R20.12.html
>>
>>
>
> Hi Bertrand,
>
> the point here is that the macro parameter 'FFA_VERSION' is itself a
> macro. This means that inside 'FW_ABI' and similar macros one
> occurrence of the 'abi' macro parameter will be further expanded to
> the value of 'FFA_VERSION', while the one used for stringification
> will not. This is potentially confusing for some programmers that do
> not know well the semantics of the preprocessor, which is why MISRA
> discourages it, but in these cases I would say it's very much
> intentional. There are already a few deviations for special cases
> (e.g. BUILD_BUG_ON uses the same pattern to print the condition), so I
> would suggest adding the macro FW_ABI to the deviation.

We have a bunch of those on the x86 side too.

https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/eclair/X86_64/12611734537/PROJECT.ecd;/by_service/MC3A2.R20.12.html

Here, we're using the numeric value for making a hypercall, but
rendering the textural name for failure messages as it's more helpful
than just the param number.

~Andrew

