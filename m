Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E16AA4335
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973357.1361493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA14Z-000085-2o; Wed, 30 Apr 2025 06:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973357.1361493; Wed, 30 Apr 2025 06:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA14Y-00006V-Vh; Wed, 30 Apr 2025 06:37:34 +0000
Received: by outflank-mailman (input) for mailman id 973357;
 Wed, 30 Apr 2025 06:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5DpC=XQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uA14X-00006P-Fg
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:37:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97204636-258d-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 08:37:31 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 30 Apr 2025 06:37:28 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 06:37:28 +0000
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
X-Inumbo-ID: 97204636-258d-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ7bu0SwWIDOZA0V5T+U8gP9uhA8PZ5uqW3itf+//u6S04MS3ilcMj+BENWhJMp1QfBxuJA1InOj8XsIdOEguP9L5XLLthWINtttm119m/QNCwTX5r6SaqGIsW3y75KKTpdrXBYEdk0E+sUjA55YNqQE6eVga9NdI73glEGPj4QuulhwntAFkmSycE1lhkIepIdq8YwuWWP+gPT+dR+4INTL/bfZGOLntc2v6t7bxUZ4aQfk0cKcRR8Im8zmQrCa/JS/zNn4ZGixx5bpPdyEMsltjT7SpF2XOv4ZRd1P7C1eFTGP9DAQa7vLmsy87BL2c3hrhF7ouo+1MOPKd3JMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N06sIWGoehFMse7vCDApdR4nXa+Gq8fEGZy6VY3ngcY=;
 b=Qd7EqCLD8u4GupS3QeMPf2BQrQS7L35QOIDWQXARPf67cqlyKzdKJMfq5+CT0vwhY0Oul58JSdgBaJvz75UxdnbZBZTK+e5G6gPk30bp62t1YNVT8YhD4NobEBbLcnoGAE+juJDwrZw520LKo3aDS8w8fvgOiszBpGXWN0eu/gjweb0+Hl0NoB2kAZBvKtq71onOYmIk1hNGrNXzIOaCtANpje2QLILoRSvwOpx7ZzhHTBEXAjvTvOzEktXgLkaZIOWtrfWl1KCShUb0DrMzqKG2shT8CcO4oAV7LjJKM0LAWslSlAz5xaVgmUP1o0sxyhKbrsPLJlWXbUGrlmhmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N06sIWGoehFMse7vCDApdR4nXa+Gq8fEGZy6VY3ngcY=;
 b=3Suw8znX04Gp80BKuQOvltLzTT4tFv10AIbeMQ02kkh4kHIV9iQQ52pgkqyJ/T7kxydVNKZKluoT2YQTCw8YClmgdgxAiekdwEwygF7vy1ShBsQO0eBoG8pYPN4utOvAlFP0lQ6OgtEQOZPGEccmbqrE/gVE16iHc+p1UK7PpcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a78219d3-4872-42ff-9588-53a65a6bba74@amd.com>
Date: Wed, 30 Apr 2025 08:37:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0307a2-6d24-4cb4-d19a-08dd87b179e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTh3TEVnVWxVa3p3VklCL20vWUJ3c0xicnVPbEV2V0h6TktYOWZXNDN5bEhR?=
 =?utf-8?B?Z1l5RkJNNDZSZCtTQVBHbVdsQ3REZ1hPOUhhVGxwY3BzWm83Vmg0UFZuTDZL?=
 =?utf-8?B?cDQ5TVhQSzBRa0FZRDYzRHo0aEszMWppTlJ3bnFIa0pxQ1hwSWIxYWVqejFz?=
 =?utf-8?B?b3Zjb1I5anRweWdGMkNWelpqQzlsWC9FQ0pKWU14dXBkSm42eXJoRlZUNzBs?=
 =?utf-8?B?NFNRQzMyUEt2WHIzbzBKNG5FMC9FZkp6NjBTei9ROHNhWVQrV2hlaVRNWVpZ?=
 =?utf-8?B?eXFPSTAxY3JFRXFqblNJcGR0NkVSTmJlUHkxcG1ML0tjNVR0dUJCUzcxaWdW?=
 =?utf-8?B?REFCY001M29WL29IRndOSXlja0N4TG1RMXNwRjhlZjI5d0ZBQW5QVnlkV3hZ?=
 =?utf-8?B?bWhJK2xBa2h3aTFBazgxRm9ldWNFMEl5aWphNytPdTZ5ZjdDZ1YxSVJBWGEv?=
 =?utf-8?B?MnUxbGZ5bDRqYUdLMXkxcGtrcXVQTkdhUTlIU1J2d3Axc1lVN2x0WlNNVzdo?=
 =?utf-8?B?NFY2NUFsTjQrMkhYNkNrcFRxd1V3QUVXcFBQTFg2RXl4QW5VZ3hoektRQ1hn?=
 =?utf-8?B?T29pVVBSUUxNVWhwNzdKMHRGc05Oem4xaW4wamdUemZHUnQ5bFJjdHJhanFZ?=
 =?utf-8?B?SXpNWEpYcytNcGx0VGRuczNWUzZtOGpTVUI0dDRjeFU0UFVxQVlQekQrRk1u?=
 =?utf-8?B?ais5eHdCeCt1RTZkZjVHd0lEWEFQUzQyUjNaRnFldWVLYk1ld3llSDJVTi9E?=
 =?utf-8?B?emRRWTNwRGdjUzRFM0FoNEVwT0FOVEttQ0lPWGpENElNa1NwMlVQakpHR3cr?=
 =?utf-8?B?Sm0rd3hXM0tFTlc3cFFNOStEVlRmRThEYWRDM1ptQ0FJbGFPcHlreW1WSER4?=
 =?utf-8?B?amQ0S2hCL0N0QVE4SGdEQkhYY3BoYWI0MGJ4MldhM0J1RjRJMzQydzAzck1R?=
 =?utf-8?B?SVhCUzU5TFNLVFJQdHpRQTZ4R1NqSDFsa3JCcURFNXZLWFg4WDcvbjMwanJt?=
 =?utf-8?B?VVBrZlVsRERpQmNQNVJQQTl3b25RcG84T292S0gzRzFGT3VHdGNlbTNOTERI?=
 =?utf-8?B?WkI2WWV6dmttaXhwL1RROUFwUkJCdUJ4T3JuakpaNDFxSndROERpMUdMeUtX?=
 =?utf-8?B?TVlsSG90c0FCSk5ZN3BpekNMMEZrRFVKZlJKak13cU4wYW10eEhGQVRuVmRo?=
 =?utf-8?B?WnI4YTB6UVYyVEM0VjZlcGtDUERUdWJhenRRSk1BLzc4YTMweGYwUGNBYXQw?=
 =?utf-8?B?ZXd5L0lvb0cwd1k3dXZlbEFQRFpUd05NVWV0QytjNUtqdmRFZ0VTNFBXM2pv?=
 =?utf-8?B?bU5ra2FpeDZsaU82YzZrcGtpN2dpT1NxYVVYd1lSWmx1N05keFl3V01EVU9B?=
 =?utf-8?B?bTY0ZXFtSGhkK0tmY0xKa1pNaEp5eWNqR1hENkJCWmF5dW9yZ2lHTWxJdmxU?=
 =?utf-8?B?OUFXSjJBVFNQd1ZyMXhqK0FOcTFkdk5mVjh6ZEwrUHFZY1N5cWcvMEMvK1Ux?=
 =?utf-8?B?M09mMDBGZG5rbWpBWFV6WUVZbWJ5L0lLVWx2RGVVdkNrbWZKZzN3K3Iwand6?=
 =?utf-8?B?TGtEdk5zcUZsWGZKdCtzTVRZYU5jN2NuZ1NJUndhZTAwV1ZFdnpyeWdrNUdu?=
 =?utf-8?B?T3NDZE1PY2RLMGNhVFB5OE1hcURrTGVuRG56R2pWdUJBRUorWmUrRzZJTkxv?=
 =?utf-8?B?Y3VNUmdvTWxiRFNjN1FXaWtXNE1FemNPL0NrQ0dpTjdSOUZ3S1QxWlBvNERH?=
 =?utf-8?B?Y2NTQ0J6WFIzN2svYlhFRUdhWW5zNHJOdEVPUHFtZ3F2Zm12UW9BaXN4WW9N?=
 =?utf-8?B?RXByRS9WbWVuUlZSbU5HbEFuT2NLUXNhK1VtczVXUCsxMWpOdUF0SytacjYr?=
 =?utf-8?B?bUJELzF0ME9ZQkZUNW40YzRGUk1VOWhGc3hKTGFEcExjcHR4VnJTcGxUSmcv?=
 =?utf-8?Q?50N+AJLl+JM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHVsREJJM215eDNOdG5lQ0dYdXVIOEhNa2c3VTVGUlVPS0NhWjdNTDFzUWxl?=
 =?utf-8?B?ODVzYkZyaHlXRDJadkZ0cUUrY3lsNUpxNXFJdTN6clpxelAzM2FTOFVsMnEy?=
 =?utf-8?B?RUNMaml0VWNXZG5KL0Q2L1lyRU51VlNoZTBibEZZSVZCbjdxdEw0WFBhTjZS?=
 =?utf-8?B?UTRGMkVZUUsxaVUwRWdDOEc1NVJKMExCbFpydTJ2bXFSbkt2ZmN5b0YyVXRP?=
 =?utf-8?B?SHdObEJFLzVycWI4MWxFQU04SmJOTkxieEhYTmNFVXE5LzJRN1BTUk9iOHVo?=
 =?utf-8?B?TzBBbnJyZEZETFgzUVFCL3EyeTRVdzY1ZWZTUFJhVVZ1Z2NWaFYxMVBjTHJx?=
 =?utf-8?B?Z0gxa3VUTWl5b0lGOGlnTWV4QmhXbVlBbWJkcDdMRFd6bkI4bHpFRFBFaTBp?=
 =?utf-8?B?cDYxdHdCd1NjR3VBMTVsbE1adThrT1Q2TDJLSStyU3ZLbU56V1ExMFhUT09U?=
 =?utf-8?B?cWFRSGFYMmhkdW5RVVpBRlJOd1VKdkZpRnR4bkFSWUR5RE8xVVpVYWFNL2Rr?=
 =?utf-8?B?bFpoQ3BjVUI3ak5LeVRFZGtaZEh1allPRTBxRENIVHovYTY1S0V0Rm45M0hL?=
 =?utf-8?B?VDk3SitPNFhFQkNQUUFJODhCdmdjNkhCa2hDQlpKWEpIZkk0ZnB3R1RDcm52?=
 =?utf-8?B?ODRCQlFyK001dUIySXVZcVRadjJUQW12dXIxeUlTVWozMEwvazIwTlhQRW92?=
 =?utf-8?B?Y2VnREIyZ2pRcEgxRzQ4OHVVWUVLYkYxVXE2cG5va3g3ZWFtWDBhazdrOHNj?=
 =?utf-8?B?QzNyZ2xWMmdQelNsSldxSksvSGtmd1RJblk0Zm1jWGMzenNrNTZZdERuZWcr?=
 =?utf-8?B?MllsZkYvK3N4RVNYcEpSVGxxWFl6NUE4WEppZzdSZW51K3dqOFVnL1JHTExN?=
 =?utf-8?B?SGwwbjVIcGYveXhoRmlKczFDZGlDRkEyUGtQTkI0b3c4RzBsZUNpMlUxL3gw?=
 =?utf-8?B?RGZpM3U1bUlXUzJkbVRhb2xCMVErTnRrZW16YVFTSUtPYk15UG9XcUdVNTg4?=
 =?utf-8?B?ZGJKMTBiNU9KQ0kvaFdzN3JMc3FiYnJGNk9mam1RWGszWUhtM0JNamh2bHpO?=
 =?utf-8?B?YXh5VHR0UjhXWk1pdTM1R2xGc1pqbnJiNitJdWo1Z1gxUmxsTnZRNkRkRTd3?=
 =?utf-8?B?SU1JdGwyTjFzbFdGYW9XYW15ZEJxRlJVNjhPWElXVlRBczZOajc1dEhkT1BP?=
 =?utf-8?B?YnZLWHdvdEdvWDEyMUhSOGhNSlNJblhrUGp1THdWcDlNN1I3a3pLVHpZV01W?=
 =?utf-8?B?TGpWRWJpTGZCdERFT1dva0hwSXVDbytmZW1jdEdCeEZWdWd1QmFiNmpBc29i?=
 =?utf-8?B?RzVQdStYaXhpbzdidkcyb2hBZzM4QnpXdjVoY3gyRXEveHRzM0Q5NFVERzdv?=
 =?utf-8?B?aDZieUNOZDRESEFDMjl2S2VEY3ZGYmU4WWtZUVF2bUErell4MkYzWlpTemlZ?=
 =?utf-8?B?WGhKK2xDVWJvRjViZUhSU2doTEFPRjYwcDc1SlVIVGlvdmtqRXcrTC9HVXVx?=
 =?utf-8?B?TTUwSEZHdDRPM3Z6K3ZJbUp1NzZIZXh2L0trVlNLOXI5VmpMdHd3cktlczZz?=
 =?utf-8?B?azlPanR5d3Y5cTBNQkQxdzMrL2Y2TzkwQjhzNHE2R2YxK1ZUZUxjVjNyMXZW?=
 =?utf-8?B?TXhDbFIrUDRiWXRlUkN5TU01Y0Fmb21jeTNCM0FEQ0hnSE1kYWk3bmNjRDFD?=
 =?utf-8?B?czVXczBnd3hDUXZza2ZHOVRxeW9EK3FXSzJWbTQ5Yi9zaTJ3RXQrT0pjaTBn?=
 =?utf-8?B?TmdYN29pRjNDQUFQelZsOC9Md2JQR3BhK3hrT1VNeDg2Q1FZcjk3SW9iemNX?=
 =?utf-8?B?YTA1elE3cFpraGg4YW43aHYzUi9QSEJoUEdaWDR0UUdNSnk3S0ljZHR5WUZj?=
 =?utf-8?B?Y1I5UklKVmxpT2N3R2FLUHdBZVY4c2x3NEVrRkRCYUFuNzA2dDdSS0dMUS9N?=
 =?utf-8?B?aGtOaWtzTWtBSzd6QzAwNWpiaWNSNVJ3UE0vT09kakpzVkh3QVFmRFlDa2to?=
 =?utf-8?B?Y1lPRkc0dkZoQUw5TDZyMU5ISVlLY1JBVnd2QVRnc0hnRmFTVFZQK1RqdE5k?=
 =?utf-8?B?NUhBN1pUWFo3cWJ4d3NFT1NDeGRidktyeHNBVmlicmdlRDQrZEJsaW1hbVpU?=
 =?utf-8?Q?O9b6vUaVq08irS64cicowBr+b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0307a2-6d24-4cb4-d19a-08dd87b179e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:37:28.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKKCdqutgiei2Wxn5U80HiUI3Hat6npVgdJPiJhYOtEwDZlaVVQkzhlhA8V+p5Mz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454



On 29/04/2025 17:20, Luca Fancellu wrote:
> Document the requirement needed to boot Xen on Armv8-R platforms.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - New patch
> ---
>  docs/misc/arm/booting.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..719af74f1e69 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>  
>  * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>  
> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
> +above requirements need to be adjusted to this case:
> +
> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm32.
> +
> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
> +  SCTLR_EL2.C set to 0).
>  
>  [1] linux/Documentation/arm/booting.rst
>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst

Is the goal of this patch to only write firmware/bootloader requirements or
accommodate booting protocol in general? Asking because in this file there is a
requirement that Xen should be loaded below 10TB which afaict does not fit Armv8-R.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


