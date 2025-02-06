Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC0A2A81F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882787.1292872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg0gF-0007Gl-Nl; Thu, 06 Feb 2025 12:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882787.1292872; Thu, 06 Feb 2025 12:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg0gF-0007Eb-K4; Thu, 06 Feb 2025 12:08:27 +0000
Received: by outflank-mailman (input) for mailman id 882787;
 Thu, 06 Feb 2025 12:08:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaX0=U5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tg0gE-0007EV-Qo
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:08:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 102b2d62-e483-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 13:08:25 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 12:08:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 12:08:20 +0000
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
X-Inumbo-ID: 102b2d62-e483-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVdFVXpzmFDeX0/QQR/FBYMZtpC0Kn3JhQnApPtzenJiPbxu+W9TuHUyzojVIyO96GIzpzSRa8Ec7feHlq/4w4cbN/QotoXCCb+900bNGcXXGkoWEQ1cB0VOMRh1ii3sQ60GyyiG4xdYl7BSTRum8yvGtrML69Tfzaoo9EGJOCqhqMuOrNc8yY3tnZOawACgbKE6Wt9hg/kJ8A/6sarDIRSFuRCGJsfmd/ieMTbFWDmamg62rzAZQ0N43cg9JrNAy70wIuNZIsu2G3uxeSRuU1WzTE3bPQnFuFpJYL6BXhpfIg434xGA+VpwpqWrFuqKnCqEGoQe1BCYyH8OATuRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqGROAZ9/KnJDlwnuw9FL87U90fZXGlq5Ybgk+pDw14=;
 b=eS72HxT2KCB93dR0AeWRJ5RFivZvzcIZdPktq19+2VzSUqN0z+ELy4/y4vkrdVTTtT7/Eh7j2osD5cJ5vTOXgYR4jaIRM4cnHRqL9TpyP4krvcsL/z2WSmUya4B39SFQadzFrvrKoO7q0qd1ph/aYaFGhJhyIkpNbHMQmupD5KW+XQnOKbcuxZp5+gfsNzcsBChnvhuSkJDiqCp69RK+sPcMZMQs8Ouavvww9wwkgXaWO+T28OiNSL+jdctlIg+KWa4omPcWwAFBPDH+ydXneT3lVAef0aWeS8jwYgJdMU5LvObkRh7rT56FjW1k3frmmgBC4qCl4Mo6flTy7r53KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqGROAZ9/KnJDlwnuw9FL87U90fZXGlq5Ybgk+pDw14=;
 b=kcKtthmTeVeE+nkK5Uhcv9g8i4b0yJaWoFeT5sn2aXHFCuiheEP4Vv8ev+H6mWtA4ntTLSc/60xye/DOhX7l+RFn0LP+QXr7aYzafzw1DK16xwsvm5HeJv3yadIH3U9hYAvT5nBrN36biAmGgVTgZT8cz5vbh0nL0tsUtbhEiOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e7058754-d595-4444-9cd6-da20fcee03aa@amd.com>
Date: Thu, 6 Feb 2025 13:08:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] xen/arm: introduce legacy dom0less option for
 xenstore allocation
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
 <20250206010843.618280-8-stefano.stabellini@amd.com>
Content-Language: en-US
From: "Orzel, Michal" <michal.orzel@amd.com>
In-Reply-To: <20250206010843.618280-8-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e3fc64-fc7b-47a6-d2bf-08dd46a6f29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFEyVDFya2dZRTAzRFlXOHV1SEQxbkZrYlV3Mm1FcDdkY2Q4djBJb0dHbmJS?=
 =?utf-8?B?K3kvVW9VRDQ5MUVaZE1zeCtWZGpxeDczVHUwU3c5OHFEYnZWTEJSdUQrL1NH?=
 =?utf-8?B?YlpGdEQwcGJlMmppakEzVG0zRjZlblJlTzFhTHhQd1huY0x0bnM3dkN3QzU4?=
 =?utf-8?B?R2VXaFF5RC95bXNGYngzSEE5RWFQOXEwcWRLQTdKSlZzWWplN0w5OGtSQkVO?=
 =?utf-8?B?eTFuYUIvTDI0WmtqSXRXSVJtWnBTaWhMeVg2RytZU2lseHV1NUlIeHZBNmth?=
 =?utf-8?B?cjVxZGExck44TW9hZFVKRlJ4SjZBRlRoVC9EM3VpS1VxMlRPdVp6Uzdkbm1M?=
 =?utf-8?B?WlRDNDNtdDdkWUlKK1FnZGRmWFhHell1UXEwWE43TXZ4RThjcUdtbzB2L0pt?=
 =?utf-8?B?OG8ySksrYlRlVGtmQ3AzVXNmdmRGdnFoTkorUTdrUEc3NWNhQnRHS09OMzho?=
 =?utf-8?B?VHErai9CTlAwY2JvenFrVmgvcWFrL0Y5SnMxNXozcXhLN1o4ejNNU1JQOWF0?=
 =?utf-8?B?NnhmczkxWjFwS0UvaDFjR1I1N3V5Uk1tNUNkdnplTFFDUURQUmZQV2NmRlJF?=
 =?utf-8?B?YlQ1amxtZHNqYXJUWER2U3ZxUW0xdVpOYmJkM3ljcUx6YmE2QTRWcnIyMjdM?=
 =?utf-8?B?RkFYN2txeEptM3Z0TnVaTHBTd1lacVl6ZEVNZ0V5WDArODdId1B4RG1oam9y?=
 =?utf-8?B?UEtvS2pVODZXUGpMWTM3RFJpSTA3ejF2MmllTFdUajJOd1h4VSsrdUV6bmJP?=
 =?utf-8?B?ZnNXdEFQYkpCY2NpWWdjNjYzMU5BUkFvS1VaYW1Tc1k4cXZwS2FUUSs2b2RB?=
 =?utf-8?B?cUhXZTB5eTUxTE9UT3JNYTEwVG9pTktXS2NNa0ticGVZY1hjaWFicm9CNFpJ?=
 =?utf-8?B?eENtdGlPSGR1aGdaNGxnMWdiR0VFTDFDOVk0QWYxOUlDRmRaRm9UYm1nMGZ3?=
 =?utf-8?B?VFZHeTUzOGFSYUVPcnN3RFVLWlVxOUE4SE9FTlQ1Nk1CT2RGQkJpbExCVFIx?=
 =?utf-8?B?STlueXlnbTJhVGpNZFY3K1A1anJlU2NOanVKenBjRGM3NDY2K0IrSGEwa1dE?=
 =?utf-8?B?d1lLekhXRkpDbTlSUHZJNDQ4dFhZdllsTy95S0dyR0IvNGg5Q2ZYUFlyOFBs?=
 =?utf-8?B?L2EwNlJaK0JyaG56dEFQcU1oWTlma2JaMTAwTHpkQUdYSVVoRGozVU5JOVN4?=
 =?utf-8?B?dUlubWR4V21Wb1FTNTBYeU11eG9NSmJPbGFmdmJYeWIzM3dIMVM5NzdUVDk1?=
 =?utf-8?B?Sld6c1djTnBIWWJMdWhzTFk5VzVtNEMrVVV0ZmVZdWNpblQzZWlON3Byd1BN?=
 =?utf-8?B?Z0I4VDdDYjNxOG1WVTJ1VmtZMVBHRGtDekZUZnIwamM5a3I4U2tIL0hSZEs5?=
 =?utf-8?B?UVc0VGFkY2hyZXhSdFdETjc0eHJyZjRPa2EvUmkzU3FDak1QaitIWmhUSThJ?=
 =?utf-8?B?LzF6YjBkYXNnNnpxTUZsQ2EvNFNtSFdWUU5qQ2d6UkJKR0wveGpBeXA5Vnoy?=
 =?utf-8?B?bFNNUzVBYktXd1hhaVhHTGx4VVZscGRFdG9GaGhsUzA2UVpNMVRKdGdOUi9w?=
 =?utf-8?B?VXFVZzIyYkZTa05zYXI1V2tSOEFBUWY2Mml6OFJsNWU2V1RsMUYwREUxaWpB?=
 =?utf-8?B?R0I1RHlwejR2YzYyay83cGszTE45VlJ6YWlSMWhNdkduMzRXQ2VvV1V5Wndw?=
 =?utf-8?B?aGVwaHduWlppU3JkeTVVdjdZaTM4WHVsNms3RGVWNlZNYmQwMFdsZW9VUkY5?=
 =?utf-8?B?N2Q0emFOU0l6Yk5tdFVRMEZLK1ROd3pWUyt1Y3d1d0tmVXJDZGZkY1ZiWE8y?=
 =?utf-8?B?aE84RnpVM2xNQThpSTg1dGpuVHVTS0pPeXdqYmQ2NUVDeTNMaDZyaTEwd2Zs?=
 =?utf-8?Q?cOdQwPMCEDI+b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNXMnQyYkY5SGY0MHNRSmN2bUloWld0bWtEeEc2elhzTnJwRWZxblFGRTZm?=
 =?utf-8?B?ZjdxK0hRaTVtZ2tFMVpRdFBiMWd0NTczM0dORUNablZ1Y01uVnVQMWkyTjdw?=
 =?utf-8?B?WGd0REVYc21mdi9nek5nbFBKY2pVMUZjSExJYkZmbGRPK2Q3ZFp1R3NpdUNy?=
 =?utf-8?B?Yzh6bjNHMHdvOENBbVVNTE1DVWFhNkhzeHYzQnc2WDNKT2oyaWVuWGp1Z1Q2?=
 =?utf-8?B?ZnhaSER2eXVhY1B3S2xGQ2hCN3o0UElhcmVLcFErTkhhQklIM05lVnFkTll3?=
 =?utf-8?B?ZlNCQ0pYZC95Tk1BRWcxdkkzWlM3NHdWYVoxTFA3Z29VZmJMRDZ3V3JSK1ZF?=
 =?utf-8?B?dmNmR21tWHRWMnRWSXJwdXM1YlJBM2ViVHN4MmhMQkV4bkQySEJjNWNqcXY2?=
 =?utf-8?B?ajczRHFuRjA4allVdjNzZEdheGdRWFBMY3NDZ3ZncGhuZi80UG1ucE85dlpJ?=
 =?utf-8?B?V1dFODNBd3AzQkNYeTAzR0hrcW5STmIyeXpKRmxoU1JhdDJmTUwrdFRMelF2?=
 =?utf-8?B?UHZuNmJXb1FGekZLSm42N25ROFE5YWNKNWhJZUFocUd2dVV4RWhmUVJ0REds?=
 =?utf-8?B?eXFjQU1SNGY5SFl3OUVSNERub0pQOWIyNUE5bDNicm9ybFJQdGkwUXV4V2Vw?=
 =?utf-8?B?dUZJU04vdzdGTGdOMjhBZ1ppZXR0cWEvd3dzZXVUbnhMYTNQb3lCbm1leEVl?=
 =?utf-8?B?Z3RkTFovUml4eWg2Mi9Cb05IbkNjNFNES09aaEZCR2d1blRWVWFQT0JYazBN?=
 =?utf-8?B?ejZXVjhTelkwU3Y0anI0SlRaaW1aYUNFQ1BVOG0walNVeHpCSjk1ME8rMDFs?=
 =?utf-8?B?OXZkdGFlRXk0NURXUThXVUdCQzl1Zi9PZmhlY1pDQWlONndGRm9XcmtZNjZ4?=
 =?utf-8?B?K3FDV293S1V3eENkcXhqUjhwQnNIWTh5ek5xcWwzVWhaQnJmMDlZNkpWVnZa?=
 =?utf-8?B?eHpCbXByRkJoSVJ1dkthdHJ5MjYxVGFYclBhZ1J1RldpZ3NKSnRFSE83SUJa?=
 =?utf-8?B?blp2ME9NUU1SVSt6anA3WmhXWjJkMWp4MUg4Ykp6cHU3T1R5S2ZDdmZpVmNY?=
 =?utf-8?B?aktwZnBpY2p5N2FraEc5VEtjSGowcG9yMmEzbUtnWC95eFRmazZ0aTZHc2c3?=
 =?utf-8?B?U0JBY0JqZW9UNkY0bmNRb21rNUJXclVvK0RlZFZ6d09iSDlUMjFUVmdyekRk?=
 =?utf-8?B?U3hSWmtaMko1N051MnczU2FQQ0ZKRk9Cd0NEbTE1eWprODlEVUJyclExTjNO?=
 =?utf-8?B?K3JpaHNvOTR3N3NsdjE3aE1lckxDVU5sL203YW5IbVo4OFl2MHYralpuaUZw?=
 =?utf-8?B?OG1VWGVtcmx0cFAvVEgrWkx4RzVBRWFmTTFtSEcvUkplRGVDaDVicmRtY3dt?=
 =?utf-8?B?eUczNkxjMHlSdkdQQ1lBQ0xZVzQ0U1BaTXBuTHVqTkowelIzWG11R3pQMlFH?=
 =?utf-8?B?RWM1MmJ2VGxFcjdzaVE4V3NZc2JiQ3g2citiM1JwZ0dsWG1zUWZaTjdMZTJh?=
 =?utf-8?B?S3QrekVHRFVyczIxZS9QTWVtVDVjcGNlV010b2oxUDArZmFXMEw0ZGI2U09T?=
 =?utf-8?B?OEVkb3B3Z0E2ODhackdCTlUyRVJ3NXFSbUtaUmljeW14Uk9JRVRCbkVCUHhh?=
 =?utf-8?B?V2JwR1NVT0UxbytXVkZWYTJQS0MxYWpCaE5nU1krTTdMcTF3eUxBM0R1a2Ns?=
 =?utf-8?B?MXVoZTN1em40akdPTERNeitHN0xKNmtNTy8vd284czN2cCtqZXZpcS9aUDI2?=
 =?utf-8?B?ZHJiWi9lZUZOWGQrYUlsc0ZCL2FYQXZFVHpVc1EvWkFhNWhHTTZYME9rSHRi?=
 =?utf-8?B?QmhIczM3NFJkNUJNOEswa25kT090UGRkV20wdVpBcmZhbVFNS2hIWGhpQk5D?=
 =?utf-8?B?c2ZYV21tS2lPK2U0MFAxbnBMSjJtR2VEeStHMVZZUHhmOVo2bFNuUXF4RFg2?=
 =?utf-8?B?ZS9BeHZpNnFsUi9yN1BrenVMTjdiTC9RRVZNd21rSlJVNzdDN3AyUGFGR1ZM?=
 =?utf-8?B?Vm54S0dlWk9qRForR21CbFVYSGZRK2Vob0xTYjFRWFhwcXZmczhlcHplcVJT?=
 =?utf-8?B?cTBTaThKRFRQdVhqY1Arb2tTTE5ZY2hPOHdISmJSeDhzR2I1SFhnUFROTVZV?=
 =?utf-8?Q?Dwqs0qEgDAldIak8xpcLX8US/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e3fc64-fc7b-47a6-d2bf-08dd46a6f29c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 12:08:20.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxO6EAgfuAVVWxFbuV8vMWZD2WVSgqYU3a1+i0c+DH+CGGUFzujjHzAEgcbSwurz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816



On 06/02/2025 02:08, Stefano Stabellini wrote:
> The new xenstore page allocation scheme might break older unpatches
> Linux kernels that do not check for the Xenstore connection status
> before proceeding with Xenstore initialization.
> 
> Introduce a dom0less configuration option to retain the older behavior,
> which is not compatible with 1:1 mapped guests, but it will work with
The issue is for static domains in general - not only for 1:1 guests.
Static domains without direct map will simply fail on acquire_reserved_page().

> older legacy kernel versions.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misc/arm/device-tree/booting.txt |  5 +++++
>  xen/arch/arm/dom0less-build.c         | 13 ++++++++++++-
>  xen/arch/arm/include/asm/kernel.h     | 14 +++++++++++---
>  3 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index ff70d44462..8fa3da95be 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -222,6 +222,11 @@ with the following properties:
>      Xen PV interfaces, including grant-table and xenstore, will be
>      enabled for the VM.
>  
> +    - "legacy"
> +    Same as above, but the way the xenstore page is allocated is not
> +    compatible with 1:1 mapped guests. On the other hand, it works with
Same remark about 1:1

> +    older Linux kernels.
> +
>      - "disabled"
>      Xen PV interfaces are disabled.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 046439eb87..9afdbca8b8 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -799,6 +799,13 @@ static int __init construct_domU(struct domain *d,
>          else
>              panic("At the moment, Xenstore support requires dom0 to be present\n");
>      }
> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
> +    {
> +        if ( hardware_domain )
> +            kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
> +        else
> +            panic("At the moment, Xenstore support requires dom0 to be present\n");
> +    }
>      else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>          kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>  
> @@ -848,13 +855,17 @@ static int __init construct_domU(struct domain *d,
>      if ( rc < 0 )
>          return rc;
>  
> -    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
> +    if ( kinfo.dom0less_feature & (DOM0LESS_XENSTORE|DOM0LESS_XS_LEGACY) )
Spaces around | operator.

>      {
>          ASSERT(hardware_domain);
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              return rc;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> +    }
>  
> +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
> +    {
Can I talk you into moving all of these into separate function e.g. alloc_xenstore_params(struct kernel_info *kinfo)?
It would simplify construct_domU() in which we tend to just call functions responsible for a given functionality.

>          rc = alloc_xenstore_page(d);
>          if ( rc < 0 )
>              return rc;
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index de3f945ae5..4c2ae0b32b 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -17,16 +17,24 @@
>   *                          default features (excluding Xenstore) will be
>   *                          available. Note that an OS *must* not rely on the
>   *                          availability of Xen features if this is not set.
> - * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
> - *                          can't be enabled without the
> - *                          DOM0LESS_ENHANCED_NO_XS.
> + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. The
> + *                          xenstore page allocation is done by Xen at
> + *                          domain creation. This feature can't be
> + *                          enabled without the DOM0LESS_ENHANCED_NO_XS.
> + * DOM0LESS_XS_LEGACY       Xenstore will be enabled for the VM, the
> + *                          xenstore page allocation will happen in
> + *                          init-dom0less. This feature can't be enabled
> + *                          without the DOM0LESS_ENHANCED_NO_XS.
>   * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
>   *                          default features (including Xenstore) will be
>   *                          available. Note that an OS *must* not rely on the
>   *                          availability of Xen features if this is not set.
> + * DOM0LESS_ENHANCED_LEGACY:Same as before, but using DOM0LESS_XS_LEGACY.
NIT: I would just >> all text by one to have a space after :

>   */
>  #define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
>  #define DOM0LESS_XENSTORE        BIT(1, U)
> +#define DOM0LESS_XS_LEGACY       BIT(2, U)
> +#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
>  #define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
>  
>  struct kernel_info {

Otherwise, patch is ok.

~Michal


