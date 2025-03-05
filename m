Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D4A4F7E4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 08:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901738.1309671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjBM-0007Ck-T0; Wed, 05 Mar 2025 07:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901738.1309671; Wed, 05 Mar 2025 07:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjBM-0007A4-O9; Wed, 05 Mar 2025 07:28:44 +0000
Received: by outflank-mailman (input) for mailman id 901738;
 Wed, 05 Mar 2025 07:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkOH=VY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tpjBM-00079y-3W
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 07:28:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75379184-f993-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 08:28:40 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 07:28:37 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 07:28:37 +0000
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
X-Inumbo-ID: 75379184-f993-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbiDwNlRycUXV/0FT+6ZNvRuCL2f7hHdItbFTUsnISQguh1wQkRkZdzKL0JWVKpQgHlMOWnl1re10mNSufVWfFiXPMG5Nx3o5B2E8n8B+KLaBTItHTRJTbVwoFF5tbZAZrcqzodrRThsK3aOlrzHnsttWRc0ODdoup/2QSz4PeUZC9IcHL72kok0QzA13NdHqL2mrsYHJgUBGzh65bLly6tkxX+KwGbFTVt4iByXPE73goEPZwPmeGNbVHYEmeb4jQH/rV4Dus8rA5V4dhQnz4MQuSVAiZxi0gtUZKAKcyZinMEYbesGPrrxUKF/MnhT+qzxxkShd5K2o8nDtjlo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3457F+MW3r7QjCJiKQr3uIlDmk7f9iOxZennSCBpvY=;
 b=lVWWTnmhBW5RS7al6KC/3S326dvkC1kflmP59wxrj8D+BgLjpunoz2KwF6kNCuwvW37CePXfJXPu+IZUZKqVpY5U86qaZNK/cZwaCOGsXcRtFx5F7GcMhTnZVx7Ajo7KrPu2LCLSVrPrNTkdhdmLcKZnhJcpdc4WGRSHiyxsE/VZY+0+DmLext+TOd0JsrX7jS315i5W3jtzAliXgWPcSOoLV18OulbJLF+OZm463+ZaW4jhnRZrRWX/Iy9tQ8Fivl+a7UaDCbKgkXZT8jYFD75tsc2kYbPs16GY0aqs3s8sQnqRp08dVXhBZz5q47BDJtLIeXubR4QzXuST4ScapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3457F+MW3r7QjCJiKQr3uIlDmk7f9iOxZennSCBpvY=;
 b=l+L8Px8mPqf1Qgk3pbBEDIZCg3EFEAYSWizuK8cXVC9fSzAtfN6MDCNXWrMi7nsW3cSJD8/5Clmigf1bFAZlZ4ouIqxdBk/tPcOFgP5RcNt8Epc5/mIKu61yqQPQTVVt1txGN7KShupnJvTstqClikDNPCXEvNW7h3A4dQN+QF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <860cfb26-37f6-4007-a66e-5f9075efe87e@amd.com>
Date: Wed, 5 Mar 2025 08:28:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: mpu: Move some of the definitions to
 common file
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
 <20250304175708.2434519-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250304175708.2434519-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f8a7aa-887e-4507-d985-08dd5bb757b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHRsQXNuQi93b1pNR2Q0OWpzM2NHNnRubUVxS245L3VuRXFxQmppN25wSnFs?=
 =?utf-8?B?NU9YdjdUSnlWM3ZSVWwvWk9SZnhjSjFDMlE3K0lnaXdUTXltd25zc3FOWU1E?=
 =?utf-8?B?MEEyWkVXL1RuT0lKeG1GYkk1RitMa3Q5bUhjMDFVdVNmakVIR1pZQWtTT05w?=
 =?utf-8?B?bnN2VzVXNlN0L280cXRTRnNOZjF0dUFCWk0wbWlndDN1Um1pcytKV1N6QVFJ?=
 =?utf-8?B?TnhkeXYwWVVpdUN1dHpyK1FnWDc3NmxCcHByN0xoMVNKaHBmaVJKYTdTWjky?=
 =?utf-8?B?b01nRWdCUnkxTlpiYXlwVzFKall0SGRqZGh4M2Zxb2hVVEVtTnRZeTVUbnFL?=
 =?utf-8?B?ZzlVeGdST1BHY2xQeDhtNURMamlSa0VHYkJtcHNWVjU3bXEyTTFKTE9SNDBX?=
 =?utf-8?B?NHRWWmIwa2tHdEUxUlhLWnFTb1JuOXdSMjh0NmtBQWhQSVc5VHZ2aFpaVjlo?=
 =?utf-8?B?ak9HZ2xvb25VTHd2c0xzZitoOXEyWGpqRUwvYkJtU09iT3RDS1RvOW1pTHZ5?=
 =?utf-8?B?SDYvZWw0Y1Y3aWZNR0NEMUZWT1NXRzl6UlV6eVd6UzcxYVpna05ZZ2RwdXZr?=
 =?utf-8?B?SjA4ME1FNTZocy9BT3RXTG5FOUluSHhTbDVJajRUb2U3UTdaQzM3ak1qN1pY?=
 =?utf-8?B?TXN6cDBmS0ZKanZGRnJzeWJnK0tqc2l6NDM3NkNvdGZwbTQzc2VCUWNBMVZq?=
 =?utf-8?B?ZVg4MllkU0pYcGFUZWs3WmxIUzZLVFNwRVBWL1BHWTVXeWNlY3QyTGY1RnNj?=
 =?utf-8?B?MU51bGpCVWhRVU1DeGlTY3dwVkNpaHRDbGJqTzhySEpDcnY2dk9IMm96dWNv?=
 =?utf-8?B?cWpORFBNaklJeXprUmlYSUVlM1l1RmZwRUJoa1FJdVFuTGNyQXEwb3JYSEx0?=
 =?utf-8?B?bHFTNXVWV2ZhZzNSZXhXclV6Q2FvaEZOZFhSM0hWTDdnSE0zTWl1Tkw2aDcx?=
 =?utf-8?B?cGRkb2UyMGgxRHlXQjNzQTNDaXBncmU0ZEVZMVcvMjFKQ25tMytIRWF4K3pI?=
 =?utf-8?B?dFArNXE4TFZ5UGtIR2RINEYzaGN2UkpNZjNONmcyODZzZkVYeEdNbDJtL25H?=
 =?utf-8?B?cWpHOThONWRzMmxVMmpWSmI3T3BhaE5LTmRMckZHWTljN1NxY3lsLzhjdFRy?=
 =?utf-8?B?M0pickU0QmwzUTNGOXVwQzRRdjhqRXQ5aWxiOFFGSkFyRmZNU2NVcHYySjJU?=
 =?utf-8?B?T2txalIyNDhBOGlJNUk4eU5BamRXUWZFbGdIK1p6REplQ0NNdDRxZE5OUU13?=
 =?utf-8?B?NzZmcXc3ZjZLd1haaGZBNm5nMlhrYXM0REFXUWRtUWVObVZyeldGT0ZHT3h4?=
 =?utf-8?B?VkZoT0E3cXA1ZStkWlo3V3dnenU1U216andES29USWRPc3YzRTZ3RTEwcU84?=
 =?utf-8?B?UURBVzJBR2RaUGlneEJ0aTB3cmxuYnN1M1VwNjdyZTd6SHhPWEpNc0JEU2lM?=
 =?utf-8?B?b0x2dEt3S0E0VU0yRFpONFBqRkdTeUJKRDgzSXlMdDEyNkVOOTNZSkJKUkNG?=
 =?utf-8?B?UmtRQllWVUhaN1dlcUlkMlcraDVXUkNFbEkwWWNtTlVwcWE0eFpGLzVPRlZS?=
 =?utf-8?B?YUNjNlJ6MVY5c0VmRUlaMUpEVE9tek1hNkN0OTJrSXVyVDV1YzFiQktJYmdD?=
 =?utf-8?B?akhYZGM0YmZRYTU5bTlBemJTSytXKzhrN0hrbG10MzF1WEFCQkRPNjVxam01?=
 =?utf-8?B?VnVDVEZXR04rVHdQS21RbG1tNkRzQzZLcVQ0bml6R21ndnlIU1djdDNjSkVu?=
 =?utf-8?B?cGRKUi96QnVBOWtYOFFOMTJqR0VIV1E1aVhsY1RUcE9nNjRIdTZaZ1hLUmhn?=
 =?utf-8?B?amFNaURTZ2hPbE53aWtZMU11YTNBUi8rc0RRTmMzbzdkM0ZMbGpIVlFpUkpD?=
 =?utf-8?Q?1jLuUHfhkOOwF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmQzU3dTUS9Ebnpud2JYdFNnTWxOejZMNTRnUjJwMG5jdkduRm1EVENtMmM3?=
 =?utf-8?B?bmhNT0JXU2hGSFdTVWNwSXhERFNaSmg0QWVyVFlYSGhHSTNGNk9HMkF5SkU0?=
 =?utf-8?B?OWRVbVludkdqZVJkbWRTbFJWMldFdEp2a2VTVTFMRXVNQWU0ZlBGYlAyb1Zh?=
 =?utf-8?B?cmlzNXdiM0U2Mm5UU0d5aFpJdGNlWkVmWmdibWpvNXd4TSt3SE9CV09Eb2Zq?=
 =?utf-8?B?enI2amYrcWN0bUN5N3FudVJ5d0ZlTjIraDVBTjB0TjVOWTQ0U1M4V3JUK1I0?=
 =?utf-8?B?ZVJUb2swbDl6d3VDOS9FeGVQVjgyWW5NamFma2d0SnlxSmVCeTFtVitxSUNU?=
 =?utf-8?B?T0tuV0cxNDNZZFFZdm04b1dMaXF0Rm5aL040d1FqdE14OG1uQXNzK2sxNlBq?=
 =?utf-8?B?aVQ4SDRFTzdENFVXamt0V3grWm1lNjhIYm5SU3ZuUENTVGpYZ3BsalRCTGp1?=
 =?utf-8?B?MTBRM1JMK1pWSU51NXdTa2lGRUdlUzdVUEI3L3RTOG5KV1JYQk9SdXRRY0hh?=
 =?utf-8?B?VTRSS3o0cENrdU81QmJRaTV3ZjdZZWlGTll1YkdDZGlqbTdEMzFYNDNabVNj?=
 =?utf-8?B?N0l0cjRNSEZYcEJ0TGVZbE5KdkFMWmtyYkljbnorb0kxWlhXUmY1emFZdnJB?=
 =?utf-8?B?ZnpsMkY1c1ZYMTY4TS9tMGlzRjV5cTdpNnZkL3l5MGFVSGRDUHBYNmxMYTEr?=
 =?utf-8?B?blgxN1JFRzZ6M0xxWFdSZmpsUDFIaFZaTXdvVi9LVHY5aFljb3hIM2JBTGN6?=
 =?utf-8?B?V3hCa0ROSkRxUnQ4eGZubXhxRUF4WWp5bnNnR2t6WUM1RWordEVPT2NLdys5?=
 =?utf-8?B?b0xua1g0bjh5Y2FqYjFyM3MvWVRzai9qZUVYRHNudUZLUkFrMjNnL24vL0Vs?=
 =?utf-8?B?SDIrT3RjN0IybDVQamFsdkYzOUNRdlRNTkJ1YmlXVmJLY2tVK3R5enBiTjcx?=
 =?utf-8?B?KzNycEZnOGY3S2k1ckdzeWxha05kMDc0aVNZbmVVTS9LaUM1dTd1aHR4OERG?=
 =?utf-8?B?WDI1SGtOTFo1aGpTQW5vc0JhZDBxVDRSRnJ5RjlFYU5MNkxSRXBmS3VLbHBS?=
 =?utf-8?B?MXpiS3JPM3ZTVWtPZWNKbFhTUlF3WS9BUmVQM0FUOUFaazBsWGVVd1RsOHl3?=
 =?utf-8?B?SVNKSkRmeUIxenU3ZGZHT1V2S2VLRjc0cmJrTzBRNGZlZTA2L2I5NVlLWEds?=
 =?utf-8?B?OGNJN3cxbUtrZExlVStwaVpncElicDFDLzUwcW1BWnc0cElScWUwOEJpSlNi?=
 =?utf-8?B?RmFRUWl4c2hXOUk0TWtka3pVOHB5MlRKRDRscytFb1o1TDY2Qi80OXg3RW5y?=
 =?utf-8?B?TTFxMWpFWHM3U0tNWE9LZDhwc29wVjJ0K1AyVXZJa3VJMXNhVWVuWDU3akVy?=
 =?utf-8?B?WHgzekxXekFiQ0RzM0lZTUx6NnJmWlNIYUd4c0hNSXdhb0Rob2d5TEd6b2M4?=
 =?utf-8?B?RG1PQjluWS9iYVllY29TSVVtem9qMDh5ZURiVEE1b3JzUEFSeU04VHZBRWx4?=
 =?utf-8?B?cm1HODJIT1l1MXQ3Nmx0WXN6UmgvYkVGaXhtVDZmNnRFU0F6L3lEbCtGUW9l?=
 =?utf-8?B?NGRYS00rNFJEYi9HdUoxY2lERktCV3laM01aNzhWWnRXOWptb0JRL1UzaitJ?=
 =?utf-8?B?Uk9lWCtZMUFQUmRNNlRyb0lESE5JTEFoR0FQWVVjQzZoN1NhZjFma1pYLytx?=
 =?utf-8?B?Zm5uQW12dkExcGdSeTVZc1dBdW05VXJ2amdWUG5RZExCZGVBOXY2NlFnMERa?=
 =?utf-8?B?eExzUXF1cC9BU1hmaUZSZW9yNzY3dlJodnZ3UW9ycy9wSVRPTEczK2dpc1Z3?=
 =?utf-8?B?ZGNMeDNFN2ZMVzh3MThCbzR2V2VxWndYVnBzQnFGQjZGdERkMlI4Ym9SYkJB?=
 =?utf-8?B?RzRleTlmMGpFeC9KZHJJbmwwSmVjekc4S1JTL21DWU1hNHpwTFJCMVo4ZFQ4?=
 =?utf-8?B?UzF2ZmhlUXcxUFRXNVpZalhQaWVrS2NtSFMwMisvSkRBYldyeUJYZm1iMjkr?=
 =?utf-8?B?bms1ZHNzaVVDWGttZXRDc2lNc3dFRElQUUVVcmo3d3dQRUJTZGNaYkI4Q1l5?=
 =?utf-8?B?WUd6djcxdlZSQ0lYbzhRcm9qVlZpM2FTb2d0M0V4Y3N6Mk51Y1VmN25jOHJJ?=
 =?utf-8?Q?1i+E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f8a7aa-887e-4507-d985-08dd5bb757b5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 07:28:37.4247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH+EUrYG3Z2/lJFn0nQEo4I237Lq2JjG/oO5FjOHHvF3adcCWY/B7nS/uqJS2hzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885



On 04/03/2025 18:57, Ayan Kumar Halder wrote:
> For AArch32, refer to ARM DDI 0568A.c ID110520.
> MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
> Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
> (HMPUIR).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from 
> 
> v1 - 1. Add the R-b.
> 
>  xen/arch/arm/arm64/mpu/head.S              | 2 +-
>  xen/arch/arm/include/asm/early_printk.h    | 2 +-
>  xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>  rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index e4f2021f45..7b659aa42b 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,7 +3,7 @@
>   * Start-of-day code for an Armv8-R MPU system.
>   */
>  
> -#include <asm/arm64/mpu.h>
> +#include <asm/mpu.h>
>  #include <asm/early_printk.h>
These should be sorted alphabetically

>  
>  /* Backgroud region enable/disable */
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index 219705a8b6..644fd0fcfb 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -11,7 +11,7 @@
>  #define __ARM_EARLY_PRINTK_H__
>  
>  #include <xen/page-size.h>
> -#include <asm/arm64/mpu.h>
> +#include <asm/mpu.h>
>  #include <asm/fixmap.h>
These should be sorted alphabetically

>  
>  #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
> similarity index 87%
> rename from xen/arch/arm/include/asm/arm64/mpu.h
> rename to xen/arch/arm/include/asm/mpu.h
> index f8a029f1a1..40fa6eaaca 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -3,8 +3,8 @@
>   * mpu.h: Arm Memory Protection Unit definitions.
>   */
>  
> -#ifndef __ARM64_MPU_H__
> -#define __ARM64_MPU_H__
> +#ifndef __ARM_MPU_H__
> +#define __ARM_MPU_H__
>  
>  #define MPU_REGION_SHIFT  6
>  #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
> @@ -13,7 +13,7 @@
>  #define NUM_MPU_REGIONS_SHIFT   8
>  #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
> -#endif /* __ARM64_MPU_H__ */
> +#endif /* __ARM_MPU_H__ */
Would you mind adding extra line between last definition and #endif?

With that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


