Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D238AA76632
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 14:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932461.1334570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzEPb-0008BG-1s; Mon, 31 Mar 2025 12:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932461.1334570; Mon, 31 Mar 2025 12:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzEPa-00089F-VF; Mon, 31 Mar 2025 12:38:42 +0000
Received: by outflank-mailman (input) for mailman id 932461;
 Mon, 31 Mar 2025 12:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41q6=WS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tzEPZ-000897-LN
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 12:38:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112e6096-0e2d-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 14:38:39 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:38:34 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 12:38:34 +0000
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
X-Inumbo-ID: 112e6096-0e2d-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcN2+71k+7BZIJs1QZNCwcT/6bx8WyHL9SqVen/471xGMTwjpTOBYsB8JlzZdozo/eRQGHooyoWJ+jlXZq67mk3goPYn5p0XHdLEiYjlBH2ofhoEr2FhJfdYCzn3jVmoDczp3TI26weWsZIyQlCRmfHvhTPz/6dAYPAfWaOT7AaFI1jFmL3dVPUiTpH74WPnMg3z1ESXw1RQ/Axt1+rPE5hqg5lwA07/v/+T4hsZ0wAEAagB/beMR6xrL5RkBnqajCGVvZGxA+HdUbcC9wkUCpkkX0uMT3L+sDhotM4Ml2iM0GV0LLucSieztrUoTAyQlfk9Tq6YlJ4pfa6qdaEpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3UGQACn5z4ZnDIPbPEYZTBhIi2Fl+pw5xtcqgngY14=;
 b=FDZpyt6o/Ex/s7GGmNWjWVRVSBRgtb0ihuC/TYKNMj7ROEPH8LGzepZi4bgDs3A3cacsRSq89q2L+n2hvcdXTbkZhYaPtlfirj+m3/6x5OhrZhO5ddKJ0KmqJp5ozcmulyJFAnERszhi0lkCxuvzKWrdtsXH9H3GSd7tzedj3aquC4QZIDSGsv2SXkc/4UBF3hWak52P5RHgQ9PVxgG5UABEuRsSthbuUx7T7Lj4Aw+HzrUFVEqzsO46Qx+tS6BH6NrOcrsHHa5vtVxMshO7FEfhy/01R56z9QSA+N1dp6WiWAm+kzCbJKXdgkWxhW+UplJrYDFXAR1/j0P76ERMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3UGQACn5z4ZnDIPbPEYZTBhIi2Fl+pw5xtcqgngY14=;
 b=n7+C0XAVfAHQH1i9yKEXVpMcONs5sSnMb1jYbZl5ve43u1cx4pSCJh/Wxkyb81PEC61i90tCNEBG4zBLK7ldfNkE36LjLXlD4eVJIrciiyXZ2/po6Ha5+A1KrKAYoOZyGETNbVnEOIw6DE8QRuU1nlh65+EA5EOXqDUkjJkxA7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b67f5e7a-f151-4831-b42e-6db5831728db@amd.com>
Date: Mon, 31 Mar 2025 13:38:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
 <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::35) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 947fa6be-1757-470f-0ed6-08dd7050f386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTJoc3VuTnl3cTN6V3crRXJsMmQvYTRXMENtMjlWL05LaVVadnh2QWE2VGgz?=
 =?utf-8?B?eFBFajllRDZWQzgvN2E2WndqTkVTOXIrQjZsK3NpR2U4OU9TN3E0T3NtOW1R?=
 =?utf-8?B?NWcrUUZJQ2xINW9oWXNvLzU3RFZOTFBZajdyWW9uZHRwSks0ZmtGd3gzQVRW?=
 =?utf-8?B?SEkyTzZNYXd1TjBPQTAwZlUrVHl5NXhIcHNhNlNpUVY4N3hDdE9mN3gwZHhS?=
 =?utf-8?B?MnpYdmRiQ01IdElnMXdzRGRmQjh0R3BaYVdhTmZIN2MwMEx0YkJLVHBDOUdw?=
 =?utf-8?B?VmJsbnJVdVJLdXljcHhyVUJyb1lsVHVqOXIvWnlDT1hhZ280VGd6QWQ1ZVNz?=
 =?utf-8?B?akVtV1hMeks2NHRiQlB2MER4bi9URDBBOVRYU2wvU2tOeUlGRzhnbzA2cFNk?=
 =?utf-8?B?Z2dRdnQ2Y2ZwTG1FdktPekpUVTR1ZlZ5RHhxL2ZlWE1mVEJmK2J4d3I1L0R0?=
 =?utf-8?B?UlJpZHNIRXVQUWpaREp0Y2lkTjJ3VWtSc0NzdzJzK0IxQmdyd3EvNUZnZ2xp?=
 =?utf-8?B?aWhRTzdDTzljZVZGckpjZlpkbDA3QitsYlh3aFJKTHM3MGRpZndrN2tIRERP?=
 =?utf-8?B?L2NIRjFvQVVLdGg2UEtGdGRuT3ZmZDUyWlFLbFpHOTFrOS9OaHdCQWxXNlV2?=
 =?utf-8?B?ejZRZmtHdDZRZGJFT24zYnpScmlrYjBoQ0ExN3FFdVJwWS80dlgvZGxPZXdu?=
 =?utf-8?B?TEVodnVCcmthN1ArTGRLWVdqOUg4UHFQR0VVY292NHE2aFkxS1hjM2RYZU1u?=
 =?utf-8?B?cXpmYW0ySGNuVytRWkVrOWZ0RlFDVy95VTBscGtQekNEaFNFbWRqNFlFdHBQ?=
 =?utf-8?B?Uy8yOG5ZZWxXMTlwVlV2OTVPTjZySEpWSmppQ3VFaVAzOUs5Q3hBSENYSmNU?=
 =?utf-8?B?a251eXJJeGl4QnJKUmRtWnR0WEZWL1pGV3hZbWlXZC9OdTFJeU1TeFV4a3dR?=
 =?utf-8?B?TkZlcVI3OEdVTml0b2p3aUV6R0RReUx2SXJjSm03eEc3WkN0SkVkVWFrcnhV?=
 =?utf-8?B?MU1HMFZIL0hMRFdkR2oxc2xoWm13REt3RTR1bW1ORGJaYjNaRG5NbUJqTVNT?=
 =?utf-8?B?dnJOL0V2K1NLWGJOM2RVQ05LOEtCZ3JaWW1tQXJKMGRUanBMd3Zla0VMYy9p?=
 =?utf-8?B?V3hlS204Zk1qZFB2Nkw3L2lYUE4yZnhCdDVOWnR2QXJVUGZTTFlCZThySHE0?=
 =?utf-8?B?cHF3MlplZHJacGFlbXpBWVJDemNrTXZjZ0hIdkIyVnBuenkvK3lBL0dzbi9i?=
 =?utf-8?B?NjZlZXYzRzZ3b2lIcUdaYmpJdnhQMFM1djhvYTcrUlVxc2hCc2ltS3FiOEZH?=
 =?utf-8?B?RnRiNC9oakZJS0ZEUmkxNlZEdjN1bXZUZ3NOTWJNZks4OUQ0VTdLc3ZEdnYz?=
 =?utf-8?B?bGgvd0pOMGpyMzQyRjgxT2RHaFJFcEl0UHVEU25SbzN5Y05KOXFMbmRQRnZu?=
 =?utf-8?B?RGMzb29oM0pDZDE4NjJ6TVJNWndzMVUrUWJ2NllMOEEzRlVaMERDWkdPWEFB?=
 =?utf-8?B?MFprSG13U1hIQ3oxUEthVDZab2U1MUZtakEzMjUrRUdKQzhUMGxaSkZtUnNP?=
 =?utf-8?B?dERQdzdHQkJXTm9xRnBPYUN0Y1MxMk1UMDR0QzRYMTNkbWlMei9QL1pBbGZX?=
 =?utf-8?B?Tzdid2ZXMlZYOEdjdjNQM3hwVXZrRUpRNFhhblRDSkcwUzlhclE1eS9TN1Qz?=
 =?utf-8?B?N1lMTDlNbFhSM3ZlMWxmdGo5WVRxb2d2V1FTV1pRQlE5VDY0MWVDc3lqY3o1?=
 =?utf-8?B?Y1Jjdi96YjJ6bU5jOGpyR2dsNHk4Qkd0ZEtOUEZoMWVNajJPU0pjdlpoVVVH?=
 =?utf-8?B?M1BuNS9tU1NnTkh0WjRnbm14aE1uRFlwRHNQemEvelN5SHA0SSt4R3lPUkhF?=
 =?utf-8?Q?msAeAlm0bHTSb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVBtZE8xR0ZrYXpUU2JDeUNqOE01d0ZpQ2JEcGVPQWVRc005T0UzYVk2clB2?=
 =?utf-8?B?c1VxYnJycERyNGI4NisyZCtXRFZKb1M5UnhLeHJobVZBQkRXMU1la1JFR0VS?=
 =?utf-8?B?YVJITGc0QU9nMjVIeVR3cVZ2dTVKQnV4V1hGT3kzbzZ6Mm9QcDJsSGFIbTU2?=
 =?utf-8?B?UzY5bjRrc2ZoamVtN3dwMWdqNC9CMkZlcVJEbUNJK1hQTzRVODdhRjhubUFy?=
 =?utf-8?B?V2NCdDN4ZXloOHVtUTY1SFB1U1E4dnYwUDd2ZTFBNXQvKzVqR3k1TWpYdi9G?=
 =?utf-8?B?WnNCZ2tpTnlmSGF1Nm4yYkd1QTlDOTVXYnRTTSsrdFptTGVuMm12bjJiYmJn?=
 =?utf-8?B?ei80d3NLMnQ0bzUva0l2OFMzMUhnbGlEMnVzYkNnWjg5YjhLeEJiaDcrN2ZR?=
 =?utf-8?B?dGlETmxhdFpSaXlyMmlYelhLTkhleHVZNitTQW0zUE5pc3R1M0xOcURNNHFs?=
 =?utf-8?B?ZkpJeHNydnJ1NDhhanh1UE9HOFNra2NQNERSKzd2Uk1vZlhGckNEYVgvYitF?=
 =?utf-8?B?dXh4UndPenRRdEdZY3VWOThsRFR4aDljRHg3eXBPNzRTWW5xV2kxTEFFQVRw?=
 =?utf-8?B?VzVYMVBNKzhFTkgwYVVuUnBhNmJhQVhzUEI3WVcrMENRQVJjNUZ2YjhmQW13?=
 =?utf-8?B?RlZMMmY0US9yZ2syZ3g4U2RLd01pNVFQU0xsaGlMNjF4M2o4NDhBbDdOb1ps?=
 =?utf-8?B?LzNRbldId2g2NXoySzYwaVZWOHI4aCs0dmFuWFYwcm5uNitXclJUU3JoN3pu?=
 =?utf-8?B?QlE2SC8venQ0RUhTcjQzMnd3OFZjYVZjZnJnb2lhZ0xCVTY1cmtFQ215L1Br?=
 =?utf-8?B?S1dOZkNYaUdIdVVEaXQrdDBvQU0yNy9FT3BVTXY0YVFsSlV1M1F4SHJpYnRW?=
 =?utf-8?B?djhYUDNkM0M5bGFVNUZzU05OdkFRMTU5L1p6bEVLZ21mL0ppd3BLUFRrZ003?=
 =?utf-8?B?MS8rMnhKS3JyeUg0VEh3RngvNkcvT0lXMlRLNVdMTWtjbk5VRzg2U1lSaGJ5?=
 =?utf-8?B?dU9sUzNZY0lSekNyQUZTMzU2cDMxRk5kNE8yUjVDbTBJVy9nbUpvS1BmNWNL?=
 =?utf-8?B?MWJEdnZCQ1k5bzZRZlJqcldoVElORkZ0MmtvbWJxSHpmcXlQRlp0WkZuT1JJ?=
 =?utf-8?B?aDB5ODhkTDVKckhQd09ydEFxN1ZVOVAzT051ZzlmR2ZTQjRpbzRHS0FHcWxR?=
 =?utf-8?B?N1paMzVPanlMTWl4eXlQay9CR0JGUkVZa2o0dm44bHM3UmhvRDJ4YXdtT3Zq?=
 =?utf-8?B?LzJPZGF3d05tMk92dzM1cFVBQlFRZmFCK1JJMkRmbjBpM3I3VjFQT2NPZVNW?=
 =?utf-8?B?aGZ3V3lkYU4yOXJKTGJaKzhUdERjSmQ5Zno0L1hWczU4c2JIZTNZSU02eUZm?=
 =?utf-8?B?SFNiWnMvcHdvNSt1RXRoMHRHeDM0S052M292eDhSc243WC95RzMvQU0wT1Jr?=
 =?utf-8?B?T1VGWHRmOFF5NzFQdGgwdnE3VklPa2RhMkZPSTNxc1Z5NllpZm5ieUJIZ1lB?=
 =?utf-8?B?Wm9nMHRtNmZoMktxdjB2eTJhaTFLZXdsRFMrTWRPeEVvVTUxMEMvdFg5Ry9i?=
 =?utf-8?B?UWtNY2N6TW8weXJITC9zYVdtMWl0Rm9YOXpCU2VTWHlNY1hnKy9sUTVRZ3dv?=
 =?utf-8?B?TC9JcEFjSk01SEl0cEFwUHBJSHZMSFY5alJwd3ZFSFZRSmdSSFdCczBNT3lj?=
 =?utf-8?B?SDRTNXVLWVdsS0JlaTN3eVRlRFp2cHZrSkRSOSsvTmRUVlpITVJ2K2ZZcFNK?=
 =?utf-8?B?SlFSdk1DZUF0QnNmaFRrL1VrN2s1eFUxLzF5M201aWRRcWRDNmtaVmFBeGVz?=
 =?utf-8?B?ZDQ4Z3ZhYTNqQ3pmOTJ6NVV0MWRiWFJ2UzVQb2RIK01wT2NsUzdYR2N2NzZQ?=
 =?utf-8?B?WXc0U1FOQ1k2VmhnQ1B2a2s5Qk9qZnhzTU9TWUt0NjNnNDFXc2p1eElRZXdX?=
 =?utf-8?B?NXlXYVF3eW0yWHJXUWVYa21WaDVMYU5VZ1VTeGczR2h6aHVNSHJTcHpnRmta?=
 =?utf-8?B?YjRRa3lWRlRjN2JYTjFINlhFZ3pkUngyUFhMN1lFN3oya1dXa3dSTVlMUTFh?=
 =?utf-8?B?UjlYZFlUdjQ4ZitSRUFuNGZDTVZPZ004UVNpaGRWV2c4dTdPRFhhbVZYcU5R?=
 =?utf-8?Q?WKhIXDnKQYlx9cjwrRSBMd/V0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947fa6be-1757-470f-0ed6-08dd7050f386
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:38:34.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vnP2Do0Aj0UzpRuMQnHr4BZcQgJrPe+j4SGkfcEEYwNInzy67l18nMKk9tT243jNUPXPQLmplJywBf0ApWHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420


On 30/03/2025 22:06, Julien Grall wrote:
> Hi Ayan,

Hi Julien/Michal,

Michal - I agree to use {READ/WRTIE}_SYSREG_ASM() instead of LOAD/STORE.

I need your thoughts on the following.

>
> On 30/03/2025 19:03, Ayan Kumar Halder wrote:
>> Added a new file prepare_xen_region.inc to hold the common earlyboot 
>> MPU regions
>> configurations across arm64 and arm32.
>
> While I understand the desire to consolidate the code, I am quite 
> unconvinced this should be done for assembly code. A few examples 
> below why.
>
> I would be interested to hear the view of the other Arm maintainers.
>
>>
>> prepare_xen_region, enable_boot_cpu, fail_insufficient_regions() will 
>> be used by
>> both arm32 and arm64. Thus, they have been moved to 
>> prepare_xen_region.inc.
>>
>> REGION_* are moved to arm64/sysregs.h. Introduced LOAD_SYSREG and 
>> STORE_SYSREG
>> to read/write to the system registers from the common asm file. One 
>> could not
>> reuse READ_SYSREG and WRITE_SYSREG as they have been defined to be 
>> invoked from
>> C files.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from
>>
>> v1 -
>>
>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to 
>> what is
>> being done in enable_mmu(). All the mm related configurations happen 
>> in this
>> function.
>>
>> 2. Fixed some typos.
>>
>> v2 -
>> 1. Extracted the arm64 head.S functions/macros in a common file.
>>
>>   xen/arch/arm/arm64/mpu/head.S                 | 132 +-----------------
>>   xen/arch/arm/include/asm/arm64/sysregs.h      |  15 ++
>>   .../include/asm/mpu/prepare_xen_region.inc    | 128 +++++++++++++++++
>>   3 files changed, 148 insertions(+), 127 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> index 4d00de4869..90b4c8c18f 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -3,83 +3,7 @@
>>    * Start-of-day code for an Armv8-R MPU system.
>>    */
>>   -#include <asm/early_printk.h>
>> -#include <asm/mpu.h>
>> -
>> -/* Backgroud region enable/disable */
>> -#define SCTLR_ELx_BR    BIT(17, UL)
>> -
>> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>> -
>> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>> -
>> -/*
>> - * Macro to prepare and set a EL2 MPU memory region.
>> - * We will also create an according MPU memory region entry, which
>> - * is a structure of pr_t,  in table \prmap.
>> - *
>> - * sel:         region selector
>> - * base:        reg storing base address
>> - * limit:       reg storing limit address
>> - * prbar:       store computed PRBAR_EL2 value
>> - * prlar:       store computed PRLAR_EL2 value
>> - * maxcount:    maximum number of EL2 regions supported
>> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> - *              REGION_DATA_PRBAR
>> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> - *              REGION_NORMAL_PRLAR
>> - *
>> - * Preserves \maxcount
>> - * Output:
>> - *  \sel: Next available region selector index.
>> - * Clobbers \base, \limit, \prbar, \prlar
>> - *
>> - * Note that all parameters using registers should be distinct.
>> - */
>> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> -    /* Check if the region is empty */
>> -    cmp   \base, \limit
>> -    beq   1f
>> -
>> -    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> -    cmp   \sel, \maxcount
>> -    bge   fail_insufficient_regions
>> -
>> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> -    and   \base, \base, #MPU_REGION_MASK
>> -    mov   \prbar, #\attr_prbar
>> -    orr   \prbar, \prbar, \base
>> -
>> -    /* Limit address should be inclusive */
>> -    sub   \limit, \limit, #1
>> -    and   \limit, \limit, #MPU_REGION_MASK
>> -    mov   \prlar, #\attr_prlar
>> -    orr   \prlar, \prlar, \limit
>> -
>> -    msr   PRSELR_EL2, \sel
>> -    isb
>> -    msr   PRBAR_EL2, \prbar
>> -    msr   PRLAR_EL2, \prlar
>> -    dsb   sy
>> -    isb
>> -
>> -    add   \sel, \sel, #1
>> -
>> -1:
>> -.endm
>> -
>> -/*
>> - * Failure caused due to insufficient MPU regions.
>> - */
>> -FUNC_LOCAL(fail_insufficient_regions)
>> -    PRINT("- Selected MPU region is above the implemented number in 
>> MPUIR_EL2 -\r\n")
>> -1:  wfe
>> -    b   1b
>> -END(fail_insufficient_regions)
>> +#include <asm/mpu/prepare_xen_region.inc>
>>     /*
>>    * Enable EL2 MPU and data cache
>> @@ -108,62 +32,16 @@ END(enable_mpu)
>>    * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>>    * regions.
>>    *
>> - * Clobbers x0 - x5
>> + * Clobbers x0 - x6
>>    *
>>    */
>>   FUNC(enable_boot_cpu_mm)
>> -    /* Get the number of regions specified in MPUIR_EL2 */
>> -    mrs   x5, MPUIR_EL2
>> -    and   x5, x5, #NUM_MPU_REGIONS_MASK
>> -
>> -    /* x0: region sel */
>> -    mov   x0, xzr
>> -    /* Xen text section. */
>> -    ldr   x1, =_stext
>> -    ldr   x2, =_etext
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> -
>> -    /* Xen read-only data section. */
>> -    ldr   x1, =_srodata
>> -    ldr   x2, =_erodata
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_RO_PRBAR
>> -
>> -    /* Xen read-only after init and data section. (RW data) */
>> -    ldr   x1, =__ro_after_init_start
>> -    ldr   x2, =__init_begin
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5
>> -
>> -    /* Xen code section. */
>> -    ldr   x1, =__init_begin
>> -    ldr   x2, =__init_data_begin
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> -
>> -    /* Xen data and BSS section. */
>> -    ldr   x1, =__init_data_begin
>> -    ldr   x2, =__bss_end
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5
>> -
>> -#ifdef CONFIG_EARLY_PRINTK
>> -    /* Xen early UART section. */
>> -    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
>> -    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + 
>> CONFIG_EARLY_UART_SIZE)
>> -    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>> -#endif
>> -
>> -    b    enable_mpu
>> +    mov   x6, lr
>
> Aside what I wrote above, why do we need to save/restore lr?

In the case of arm32, there is no 'ret' instruction.

When enable_boot_cpu_mm() ----(invokes)--> enable_mpu(), LR should be 
saved and restored. Otherwise, one cannot return to the caller of 
enable_boot_cpu_mm()

>
>> +    enable_boot_cpu x0, x1, x2, x3, x4, x5
>> +    mov   lr, x6
>>       ret
>>   END(enable_boot_cpu_mm)
>>   -/*
>> - * We don't yet support secondary CPUs bring-up. Implement a dummy 
>> helper to
>> - * please the common code.
>> - */
>> -ENTRY(enable_secondary_cpu_mm)
>> -    PRINT("- SMP not enabled yet -\r\n")
>> -1:  wfe
>> -    b 1b
>> -ENDPROC(enable_secondary_cpu_mm)
>> -
>>   /*
>>    * Local variables:
>>    * mode: ASM
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index b593e4028b..9b833fe73b 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -462,6 +462,19 @@
>>   #define ZCR_ELx_LEN_SIZE             9
>>   #define ZCR_ELx_LEN_MASK             0x1ff
>>   +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>
> While those makes sense in sysreg.h because they are definition based 
> on the Arm Arm. The definition for ...
>
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>
> for PRLAR are specific to Xen. So I think they should be moved under 
> mpu/. I would also consider *_PRBAR ones.
>
> Also, are those values truely arm64 specific? Asking because you are 
> using them in common code.

These definitions (like the _PRBAR) are based on Arm Arm as well. The 
only difference is that these two values are common for arm32 and arm64.

I preferred to duplicate these values in both the header files so that 
they stay together with _PRBAR. One needs to use both _PRBAR and _PRLAR 
to set a MPU region. Thus, I don't prefer to split them in separate 
header files.

>
>> +
>> +#define STORE_SYSREG(v, name) "msr " __stringify(name,) #v;
>> +#define LOAD_SYSREG(v, name) "mrs " #v __stringify(,) #name;
>> +
>> +#ifndef __ASSEMBLY__
>> +
>>   /* Access to system registers */
>>     #define WRITE_SYSREG64(v, name) do {                    \
>> @@ -481,6 +494,8 @@
>>   #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
>>   #define READ_SYSREG_LR(index) READ_SYSREG(ICH_LR_REG(index))
>>   +#endif /* __ASSEMBLY__ */
>> +
>>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>>     /*
>> diff --git a/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc 
>> b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>> new file mode 100644
>> index 0000000000..3402ed23da
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
>> @@ -0,0 +1,128 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <asm/sysregs.h>
>> +#include <asm/mpu.h>
>> +
>> +/* Backgroud region enable/disable */
>> +#define SCTLR_ELx_BR    BIT(17, UL)
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * sel:         region selector
>> + * base:        reg storing base address
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + *
>> + * Preserves maxcount
>> + * Output:
>> + *  sel: Next available region selector index.
>> + * Clobbers base, limit, prbar, prlar
>> + *
>> + * Note that all parameters using registers should be distinct.
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Check if the region is empty */
>> +    cmp   \base, \limit
>> +    beq   1f
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> +    cmp   \sel, \maxcount
>> +    bge   fail_insufficient_regions
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    STORE_SYSREG(\sel, PRSELR_EL2)
>> +    isb
>> +    STORE_SYSREG(\prbar, PRBAR_EL2)
>> +    STORE_SYSREG(\prlar, PRLAR_EL2)
>> +    dsb   sy
>> +    isb
>> +
>> +    add   \sel, \sel, #1
>> +
>> +1:
>> +.endm
>> +
> > +.macro enable_boot_cpu, reg0, reg1, reg2, reg3, reg4, reg5
>
> If we go this approach, this will need some documentation on top 
> (similar to the other macro in this file).
Ack. will do.
>
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    LOAD_SYSREG(\reg5, MPUIR_EL2)
>> +    and   \reg5, \reg5, #NUM_MPU_REGIONS_MASK
>> +
>> +    /* reg0: region sel */
>> +    mov   \reg0, #0
>> +    /* Xen text section. */
>> +    ldr   \reg1, =_stext
>
> For instance, on Arm32, this could be replaced with ``mov_w`` which is 
> doesn't involve memory load.

Yes, this is a minor difference. Remember that this code is executed 
only once during boot time. While there is a performance penalty with 
ldr, should we really use mov_w (and as a consequence have a different 
implementation for arm32) where 99% code is the same and we have lesser 
code to mantain.

(Julien/Michal :- need your comments here)

>
>> +    ldr   \reg2, =_etext
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    ldr   \reg1, =_srodata
>> +    ldr   \reg2, =_erodata
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>> attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    ldr   \reg1, =__ro_after_init_start
>> +    ldr   \reg2, =__init_begin
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
>> +
>> +    /* Xen code section. */
>> +    ldr   \reg1, =__init_begin
>> +    ldr   \reg2, =__init_data_begin
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    ldr   \reg1, =__init_data_begin
>> +    ldr   \reg2, =__bss_end
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
>> +
>> +#ifdef CONFIG_EARLY_PRINTK
>> +    /* Xen early UART section. */
>> +    ldr   \reg1, =CONFIG_EARLY_UART_BASE_ADDRESS
>> +    ldr   \reg2, =(CONFIG_EARLY_UART_BASE_ADDRESS + 
>> CONFIG_EARLY_UART_SIZE)
>> +    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, 
>> attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>> +#endif
>> +
>> +    bl    enable_mpu
>> +.endm
>> +
>> +/* Failure caused due to insufficient MPU regions. */
>> +FUNC_LOCAL(fail_insufficient_regions)
>> +    PRINT("- Selected MPU region is above the implemented number in 
>> MPUIR_EL2 -\r\n")
>> +1:  wfe
>> +    b   1b
>> +END(fail_insufficient_regions)
>> +
>> +/*
>> + * We don't yet support secondary CPUs bring-up. Implement a dummy 
>> helper to
>> + * please the common code.
>> + */
>> +ENTRY(enable_secondary_cpu_mm)
>
> I really doubt we will be able to keep this function common in the 
> future.

Are you ok if we keep it here for now ?


Looking a bit further ahead, the MPU registers are not core specific 
(unlike MMU). Thus, there is no MPU specific configuration that we 
should be doing for the secondary cores. We can investigate more on this 
when we enable SMP support.

- Ayan

>
>> +    PRINT("- SMP not enabled yet -\r\n")
>> +1:  wfe
>> +    b 1b
>> +ENDPROC(enable_secondary_cpu_mm)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>
> Cheers,
>

