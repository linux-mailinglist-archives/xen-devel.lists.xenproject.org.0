Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123A9907AF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 17:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810492.1223183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkMp-0000Za-KZ; Fri, 04 Oct 2024 15:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810492.1223183; Fri, 04 Oct 2024 15:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swkMp-0000Xg-GJ; Fri, 04 Oct 2024 15:37:19 +0000
Received: by outflank-mailman (input) for mailman id 810492;
 Fri, 04 Oct 2024 15:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqrg=RA=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1swkMn-0000Xa-Kn
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 15:37:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f403:2613::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87f2b869-8266-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 17:37:15 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 15:37:12 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Fri, 4 Oct 2024
 15:37:12 +0000
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
X-Inumbo-ID: 87f2b869-8266-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+E1RDeG89bT91MyIoWSp7DMeqkMUdd9QfBA5MF1bowlo2zG2jxjVPumcv7duU2zak+ApUDaHxgPI7PPFkksGtVDFoNfUdtB5zY+QKrJJg5dL5x2qwHaccnFpG4eU7vNDDpcHCBbCV2rXlsTxG4rFRqCkJWXiysrqYB2gpa4arniOqcR+XMpiJdSJfCyr7A//R12RauN06QlGAAEb9CkRW6IS87NsY8dMCVhCJN1lupYVOksMlDWYq7vMMaFH4q+yjz+g+CR/jYgDZlSlvbpQxA+FI4ObAIHiPnIY0FgA9+6u6n3erjS4c2rT84kkq6iC7FBBSLfXjlNP25xMuh/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBdiDZCzBYnZfdkUmyKsBTthADAhMvLqKF+bNxro32w=;
 b=ZFPM/YXBiIibm4UTDPiiGQuU0zKp2OpkINmHvF8kFvOwP0DdiRJPoEbE4K87nwX4nN+2twcU9d5k6cJA7q8Mxsb7JetGRre1wvWkAC94KAXN35ftKUKD7A067NuTGzBEgu2kLI4ttW34MmPds/J5+AQfN+jd6e7dgixpOMlTr8hzoFlMpiFyT5gb5XQmG3xMPUynsEZYdrhQJgoEkGUsbdDhObw9ZYdaAjCK7W2c9r9PH593fp201gdLnKV8Y5ewEUBLVfdHl/oAcLjSlK0OL8I0RPHD11pYmrP4UsBLQN6pnR+YbWNt3ymLWaTLRLK0nCpAfsixmnJ+y0YkpMC5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBdiDZCzBYnZfdkUmyKsBTthADAhMvLqKF+bNxro32w=;
 b=mofQwhLfLZ6jbYN66xuyFSGTnk9ldWDu+F+XzsHt525dLVYevXsZOrM9GJwpCc4k/mlu0ss5bBHToRzeE+XpWBwUyqaS0W6mGNqP6JefIbQ25miu3xFmNd2UfWl0xkIXatcFQafYjR9yZEKQmDk1+fpyDJsX522qW2xHyw62hRy7hehFbAruHcoVIANDFPRTLVRdWP8qo2fbVdEdF9vs8fJkXVxGovIUAf40HTbrOpgRVeIocla2OvxhrAsImUxH9/Gt6lb4lFo187Zpic5PnlVdBYjz+wxxdDhMo+rS2oO84amCzwiR1IWkdDEpOn2jH7HTl3x3bwyCBGeqPqlvCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
Date: Fri, 4 Oct 2024 18:37:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
 <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:208:55::38) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 3438ef90-b6fa-404a-77e0-08dce48a6a3e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bklOSmVYYnBXbTJRM0xwaGN6bkEwNzJCRFNDYzBtVW8rdVBKMnZFdCt6aFNj?=
 =?utf-8?B?R1gvT243eVZ3MDJuRmhHSzU0ak95RHphT0ZWejJ0eGZqcnludjJ4d3g3TU1j?=
 =?utf-8?B?K0lQcG0vTkxMZjVSaXIyV0hGSitwOTlxUkxjTk5rUEFwMXZUYXd4ODFKeHVq?=
 =?utf-8?B?TThyc0IzMExyN0FhT1FqZmdvaHVXQ2pTK1BUdlg2N3lrQmlUWlozWEJZdDIz?=
 =?utf-8?B?aU90VFNmcGtoS2RmOGp6Y2VXQzFZMjZsd2VsaU50dHQ1MDB4S3ViUVlTWEhr?=
 =?utf-8?B?ek5US3o1N1ZGWTdSMUNiTHpsM3ZOSndIdW1CalI0T2hqVmVwZXBGdlU5bnpU?=
 =?utf-8?B?dEdRSUl0Ukthc29nM0YvRlpEK0tuN3NNYjg3Wmp5S1BwWVJIWFg3K2lDV1JP?=
 =?utf-8?B?bW5tUTZRRTdCY1Npam9KSnlVL1dNbGZ2dHpPMmk3LzlkOGVQNHdiY3RGckhl?=
 =?utf-8?B?Ymd6ZXNaRE1UQjRTemxGaEZuOGduTVJaTHZMTWVHaHBBb3RGQ2hSeXVIOVcr?=
 =?utf-8?B?WjRwOGwzdzFSZDdNUys2VE1XdUQ1Mm53SEd5Njg5ZTV4T2hKL1NXWXgvSG5R?=
 =?utf-8?B?b2d6ZkpwYVhLd2FuRmFSbmFmcVF6WXhJMjZMM1cxTkxvSFYvYUJaQkg3RzdC?=
 =?utf-8?B?K1dsb3hxME5iVk9waWp4REk0b1hHZGlTOFpzc012R2VkQS9LWGtRZXhJRFNn?=
 =?utf-8?B?L1JDeE1BT2NuVmRjWndWMTBLUW1tQURiL0xvUmt6cDgzazVQdUlFWGZZcWdH?=
 =?utf-8?B?Y0hGVjUyVUFGY3l3UTkvZ3lkNWk0RjdENEM0MXhvNUFnd2VWMndLOHJENGIx?=
 =?utf-8?B?ZXhCK2ZhT29YeHdlLzJsbU5JRUVWTE1KaXAxQkpqVW13Rnk2UGlEK1EwUGtj?=
 =?utf-8?B?MGhEbytTa3ZXK2k0SzlJYVNpczNYd2tZbURzTkhTVFZqVitPMjczSzVhWGY0?=
 =?utf-8?B?ZXZRZXNVRzRHRm5pMFU4Uk9CNEYvdm9JTXhvdk9URHVQQ3F5RHZodFdRbDE3?=
 =?utf-8?B?clVKaWZCa2hUUnpSUE5LSHRqVXEvY0ZHZUxNUG9ZUXdTOGVGNm9aa0kwdmtP?=
 =?utf-8?B?OFVkRVZkWmZ2T3ZGQWQ4dlQyQ2tiMUUzVTlLeFhrU1ZCbEo3V2xVME04Vk56?=
 =?utf-8?B?QVhWQnp1R0dDemN0Ly9kK3RnK3lMamVXN3BKMm9OcHhrWWY1Q05DQStXeUs1?=
 =?utf-8?B?L21zV0dxWkpieDZiaVhYQnR6SnRXTVVNdGZaVEJwQllMN05OcG9HeWRNYzI4?=
 =?utf-8?B?b2VESldtdTF3aDJmdWUrOEg4aVhNbXlINUZ4aXkwVktYaVQrWVA4eGF0SDZv?=
 =?utf-8?B?bmhsRHdEeHQrOFZtOWNZN1VMZml4U3ZKRllNMWRRTnpKYWpyZnJCZ2VpMHRF?=
 =?utf-8?B?ODZMeVVZcXhzOEd1YXE1SnRnOHNIZktLUHNueFpKL1NyYk84bmZDYVQ5Ui93?=
 =?utf-8?B?Q3ZQaVRUaS9OMUpoMXIxMm1ZbXNFNktMVlp0S20rTFV3TDh3OGRMa2FzU0Vp?=
 =?utf-8?B?UTcyT1lobUM0K3dCcG9mbTN5amlaNDZPMk5RUnpIc2xBMlRIcWxOQUM0bG9M?=
 =?utf-8?B?cldOQ1U2cS85Nlo3V05RaVVGbVdzQVRqa0IrVzFBZ1Y1aUtMUmVBVmUyZTZx?=
 =?utf-8?B?TXpYcGV0UjBFY2JCVlRqODVnNHRpaFdtVklYQ0ZMRHdJZ0M0RElUTzQ0eG1r?=
 =?utf-8?B?aGR0Wm9HaUFrMDkrbDFnZ2d2ejNSVWloelBkc2tVcEZKZGZGb0RZVDRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHNXYmxQakppcXVhTzNRNzF3SGFVVnNNRzJuQURYZEM3VnQxdlhXbk8rT1RE?=
 =?utf-8?B?R0ZyZEZLaEZ3RWxxblY0a25Vd1VvZjc3Tkx5eS9vVWp5MVhOZGM3YjRCS2Jm?=
 =?utf-8?B?VzBaMEFwbm12SWQ3QmZEdDRBN0xEd2JHdkZvOHpQMDFOSHRjdzlXVnpOVnRC?=
 =?utf-8?B?UTRCL1FxRjRhTytGdTJueEcrVjd0VENieHRQdmZHOGp3WERaVWMrNHIrbC9P?=
 =?utf-8?B?Wk9mUGM1MTMzcitXOWxrYm1SdW1TNHBieUNsYUIzNkVRTHBPOFNnVlpGdkFP?=
 =?utf-8?B?dkFMdXltUFBSM2NDblhhV280ejN1N2x5cjJpd091b3pacVFoYTQ0dU5KU2xp?=
 =?utf-8?B?ckJQcVppVytnMjNmY2s2Vzk1R2xoU0xpdmVWQ3hYdlhBNkY5ckpWS3hOWGVh?=
 =?utf-8?B?TW9EOEdweUMrbTlHM2twNUZiQXdubzFZSzZkVWZXRms1NytDODVaNEFPVGFm?=
 =?utf-8?B?OGJ1YzhSdFhWV21NUjdGdFcwZTRHWEE4VWREaDVyRVB2WXpLemFHVWFleFZi?=
 =?utf-8?B?RkwyUFFaMTNtQkg3Umw1V3B3ZXMyRkVpWWx5ZW1HVUVrY2NrVFF3QlVqR2pS?=
 =?utf-8?B?b0FtNnp1NnhudFdqcmZ2bDIzOVBJeU1CQ1FsMWtIejJDWnhjYnVqTlI2aU9D?=
 =?utf-8?B?Zm5Vc1NTMlJnMDVMZlBGdzR4eVZkaW9FRWJPSUZDNDVqTVM0c1pxY0hmNzVK?=
 =?utf-8?B?dEdlbEZWZ1ZRa0NabzlqNDdmcEE0NDk5Z1VRRDF2OGJqVDcycVhHb1Q5b3hK?=
 =?utf-8?B?THFiODVOVWEzalBpaXNObThXZmhYNlh6WEQrSGRQZVkvbW5kVUpxNklYaWlz?=
 =?utf-8?B?RUFYTHpTbEhQdG12NzkrcHd1WnV3djVvY1l2K0NuNTJHRmtTOExDTHpOdy91?=
 =?utf-8?B?ZWFzODMxaUF1ejR0c255RE9Nbm12VjFtMXBNakVnNDAyejZsREkxUitQZzJL?=
 =?utf-8?B?elZBWlJqYzlOSXRLTVh3WnJNeGZZQ1B4Ylg5dit4NDJXZUhGNUsraGM4cWpK?=
 =?utf-8?B?NFF0cUYzRDczbkR0ampsR0lSVlIvY3RWSDQzcGxlOG94VDhXa0VSL21WZkFT?=
 =?utf-8?B?UFVIVWZsRzQ4SVZVR3hDeksyRmlIWGNWVExzUnJvYkxWa0FRY1hYYWFWMVU4?=
 =?utf-8?B?MUp4akZieEtkWGtUODE1dXlzVkxYQk9OQWJETEplaklhZEhSd1FuQUJ6QW5B?=
 =?utf-8?B?elpQVGh5YlBOSEluZ0VvSkRLK3A1UEtRODlZajBYc3lPVzFiVFNrbC9kMUlZ?=
 =?utf-8?B?VW9UaEo3bGJ4ZG9ZS0Q1QkhraHRmb1ZXK1NJUS8rTjBKN21DNFN3d3FWY05Z?=
 =?utf-8?B?Wk9tTktQS1VmM0hkb1RjbTd0OWg4QkRDZFRNbTJEcGI5MjZrR1ZtUEpZa2Jj?=
 =?utf-8?B?ZlVtVkUxVkg3ODFBNjd5SmZXTDRZUytBWTQyMjh3RDBYR1ZIK0NIUFV2SVJs?=
 =?utf-8?B?TE5SY09UbmNkZ3diM1QzT1RqZHc5MEtTUVF6Skp0cTFTRTZCZjhQRVlyUUhu?=
 =?utf-8?B?d2lFWFg2eXFzbW5FNG9WdG5JN0N2alV4SmpGaHU0TTJCSC80WmtOUVRMYjc2?=
 =?utf-8?B?ZElFem1mZENBanErSU0wc0JSeGZIcndrTW9XSVhMZ3dUdkxpVjl0VXpUMWZz?=
 =?utf-8?B?Q01NUit0T0VReGgzazhLVEFQUDVoUlcrUExFWVZ6OGpuQWhReklubmJodlc1?=
 =?utf-8?B?dFVlNXc0S0FKNVJJTjhtaVNsdzA0RnhQRDZySkQ5TzdDNlhIVCt6UmhGNWtR?=
 =?utf-8?B?d2xrUUdnY0pCbjRXNWRKL1F3QmN2UHFNdVdycjdYQ0o5K3lVMmJtdVNWYVBi?=
 =?utf-8?B?QzJyL1NlcE16RVBMVndSWHM1Q2NGRGg4bFlReDNObDlRNzUvRmdBbDFHK0tJ?=
 =?utf-8?B?TlhIQWN4a2dPMCtlQmVtUEZMMGdncnFHdkpuTTJMMC9kWXJMdG1WZWRwY1BF?=
 =?utf-8?B?WTRoVHQzdE16U01VTHd4Ymh6ZEd5OHFybEFVM2JCL2RYVWhVaXVIQ2xhWjlC?=
 =?utf-8?B?Yy9VTXlWSzI1Y1p3UjJCaVkxZEhpckpTRk1nQWdYV2o5NHliZ3N0YzBkUGpZ?=
 =?utf-8?B?d0lSQ0ZKZkt6MWs4MWI0MTI4QWVDS2djcnVHV3ViUEtXQnpSRnlFY3NKMlE0?=
 =?utf-8?B?a1pPVkhEWjkrb24yNnBsYnJUTzRmYVdwUk02WXN3RzVQOVZ0YkJaVTNKN0Rm?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3438ef90-b6fa-404a-77e0-08dce48a6a3e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 15:37:12.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8bK7tcWryqbWkrSkclYSMoStboYRkQaE6WjJgMg3kx+GkJYD+k2qTKNZ+KDeYX+tTJchahYLNK23w75jQcJ/lZfrPcUidzYBDqxQ2+zz/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

Hi Julien, Stefano,

On 01/10/2024 13:01, Julien Grall wrote:
> Hi Andrei,
>
> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
>>
>> S32CC platforms use the NXP LINFlexD UART driver for
>> console by default, and rely on Dom0 having access to
>> SCMI services for system-level resources from firmware
>> at EL3.
>>
>> Platform-related quirks will be addressed in following
>> commits.
>
> I don't see any specific quirks in the series. Are you intended to send follow-up?
>
> [...]

Well, we could use an opinion on some SoC erratum implementation
and if it would be acceptable for you or not, from any of
the ARM maintainers.

The erratum is about some TLB Invalidate (tlbi) instruction
variants (by Virtual Address) which are handled incorrectly
in some cases (for some VAs), and that need to be replaced
with broader versions.

It doesn't apply for all S32CC platforms, but we can use the
Host DT compatible to identify this. My idea is that we define
a platform quirk for this and check for it using
platform_has_quirk().
Then, we either:
    - modify the definition for the affected 'tlbi' variant
    in arm64/flushtlb.h to actually execute the broader one
    if needed
or:
    - define a new wrapper for the tlbi variant we want to
    replace the affected one with
    - check for this quirk before its usage and call the
    more potent version if needed (there's only one
    occurrence of usage for the affected version).

Number 2 seems better to me, it's more customizable and
it's similar to the existing handling for
PLATFORM_QUIRK_GIC_64K_STRIDE for some other Arm platform.

Do you have any suggestion/preference regarding how this
should be implemented?


>
>
>> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
>> index bec6e55d1f..2c304b964d 100644
>> --- a/xen/arch/arm/platforms/Makefile
>> +++ b/xen/arch/arm/platforms/Makefile
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>>   obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>> +obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
>>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
>> diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
>> new file mode 100644
>> index 0000000000..f99a2d56f6
>> --- /dev/null
>> +++ b/xen/arch/arm/platforms/s32cc.c
>
> We only add a new platform if there are platform specific hook to implement. AFAICT, you don't implement any, so it should not be necessary.

Like I mentioned above, there's some erratum workaround which
could make use of the platform_quirk() callback, that we want
to send in the near future.

>
> Cheers,
>

Thank you for the review and support once again,

Regards,
Andrei C




