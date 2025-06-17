Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D834ADC721
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018040.1394948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRT06-0007Z0-9H; Tue, 17 Jun 2025 09:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018040.1394948; Tue, 17 Jun 2025 09:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRT06-0007XZ-5w; Tue, 17 Jun 2025 09:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1018040;
 Tue, 17 Jun 2025 09:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQMZ=ZA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uRT04-0007XT-Bz
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:53:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daab473e-4b60-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 11:53:01 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:52:58 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:52:58 +0000
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
X-Inumbo-ID: daab473e-4b60-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5CgG31FhWVc7l1L4AkbeCtxKdZe/23mqyTtOLjH5yMGKqsrJOdjAbkVZI/8z7ovVCiq6iHplk9WroVDLcqGAeVoBxpnw6WhJPpHaJtcGbE42aLH0Goo+sUMTlgkSgaLu5hzCXXOu2WPNaAS4nvz5sBe4avn1EfC2+9HX2FXZqhutxxKOveYHVSeTVNItXzWnTogT/xVTq8cmE+FfeLnc1NRkttLkD2cZO2mZfxjHxjWwHKgEKNV+U50oggTiydTBqTGYHo3DkZyb1rzF3vq/oFDjcUcGSL+xXcZ1/chT0w3fEoBCKpk3j9CmTe4OYACcl28loInqRdAPFoK3j+SKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX+USrUT6qkhyvuW01KYiizlOIB5ks+AR8MFu+veyhY=;
 b=SVSC4GOsRkq7PBn7b8LcNqOrFDLDgaSqbAYalODbxtdjDSYr7TpHuBgR8mm6qM/U2VUmN/W9Vucip1c33kH82yoa+QuflM5HqF/gIIxdXeV+ZLCcGHmi2ObBQHxDKaNxM+id6CE/gVl5KSfTdUTblRFawQI85Z+4EW4FCOC2balz9ahJxrOONzR5l6rUNdcT/TVc+BelWdzrkfT8XINgpZq7lDw1Ih1n672CCP/hMDC4hmVcRT4RF/9Qz2czLcuPnlM0CiCZuJ0HHM+hHdz08xcQ8C2EmKVKQZWPlsVEWFftfmSY3bzcTVai4u83vms2WLUx4PtFmnntYhgHKXNnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX+USrUT6qkhyvuW01KYiizlOIB5ks+AR8MFu+veyhY=;
 b=G6iUHyHe0DgpkKm2WFnaZWQCx1mCG0JMP/geMDdG8l0RCMCIjBg1i5mDzJx9jpoFQ8sVPHg8UhkZUiXz3r5/XZSIY9LmfL3yItdz5s/yx7fUbRwPic4hOlBDY5IYNEc2kV8QHNcPi/cuF1Li6r52XFsKe0udDylLBJ3wP7WZ3rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <903dbadc-e0e7-480c-9144-3446f7079d63@amd.com>
Date: Tue, 17 Jun 2025 11:52:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] console: Do not duplicate early printk messages on
 conring flush
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250617071940.10445-1-michal.orzel@amd.com>
 <d435e26f-74c3-4cec-a2a8-b128f299ec4c@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d435e26f-74c3-4cec-a2a8-b128f299ec4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JNAP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::14)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 385d7282-3aa7-4a03-9e09-08ddad84bd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkNVYXh1MDc4MzhzV1ZYT1o0ZFl5MHdJSkFSQklTbm9abTA2elNpV0JLdnpu?=
 =?utf-8?B?dENIOE1zZFZhUFRaOHU0cnZDVUFVVlVXaVRodlRRRldxNG5SUjB3ZktaalR6?=
 =?utf-8?B?TjVmS3ErN0dETWV2VENKdXVPQ1BjUG1GZjJ4M1ZSaHY5dDdoV29EK3VTaGNy?=
 =?utf-8?B?Nis0RmNtdm1ldTdMZTBsTU1xWjFZbms3M01yTE1mL01LMWVTbFIvRkRBeVNW?=
 =?utf-8?B?TDR5M0xTOTkzbDJpMldqYS9HTEJSVHBpNk9aYUZIb0wyMWZIcGQ3cGtpSldR?=
 =?utf-8?B?Z0x3NytsVFV2QkFpeVIwNGtmVmNPVjZzZCtxTmlTSUZzamFrdTRXV2VRektC?=
 =?utf-8?B?VU85KzRyekpPRlo3TmV5Y0lXYmpoK2xxM3pTb2lDbThwWXl4cmowTlNQMGNj?=
 =?utf-8?B?bkl0VTF0ekEzWG9Sd1Z3cSthQ1V4L2xDcHNEbHNvdUpvVVkrRzluVzFsOFk0?=
 =?utf-8?B?RmU2ZFZHQlgwZkpvRW92Z0hQeTYrRFNidDVxU25OVitLVFlVMGdWZGF6MS9I?=
 =?utf-8?B?dm91bjM2dHQrOG1vT1lmeUordTNZNmpUMFI1ZCt1Q2ozd3R6UVBMNVB0RElV?=
 =?utf-8?B?M2w4ZFJiVFNVMHRYN0pDWUYyeTNwdC85cmwvK1RxR21WZkZaYi9YVEsrYll0?=
 =?utf-8?B?TjJrSGlxRVR5SkJxNjh6R291TndNbTd2K2lSSHdyWnM3b1dSSUkrY2hqdlJY?=
 =?utf-8?B?OC9HSmRjSHVZek8rcWlSU1hNY2dacDQvVkZRYkNIMkdmU2RCbXo0NkVZeUE4?=
 =?utf-8?B?ZXB0VHN4N2JrUlFGYXF4cUpnZFVIRzZvc0N4V1VQZzRkV01nWWcvZ25iWkpL?=
 =?utf-8?B?TDZ2UE9COW4xaWxQeWQrdHBONU95a0J5Y1U2U2VkUkdUdDZqeU4wd1hkRWVr?=
 =?utf-8?B?ZGNiMytHRXAwd3dEZjRYVGtVWHhodUpoVVhDbWJIUm1paDhpYUZIYkQ3NlI5?=
 =?utf-8?B?RGxoUW56M0oxK1Nob3UzMTNrU1hOVXkzYWdZZ3hFa2dhU3RTQ3ZmMDRzbVI5?=
 =?utf-8?B?YUU1N3Vzb2NhbUwyNXJYNFJSbnRKU0FBV1NCUUVobmlQTm56K21jdHlXZW0z?=
 =?utf-8?B?R2pTT29hTkV6eE5kdSs3SGQ4aW1qcDhFLzBnTk80UEpIbTVWZTZzKzNrd01r?=
 =?utf-8?B?UzRSTXZZMjRzbUx3L29iOHEvUEFLV3MrN0lHWGpqR2FxNkFOZTVZemNNdkp6?=
 =?utf-8?B?TlczVmZpTVk3RkdFYUxmRXVZbS9CY1ZGaEN4aCt2NGFucllRMkJPY2VOd3NE?=
 =?utf-8?B?SjVkTVA0cWgrL2c5KzN6WW1zVzh6SkR4RXp4emw1cXQvYm1MR05QM1lWcmlV?=
 =?utf-8?B?Nmx5OXkvY2gxNjk3VWNFd0ZEWmxlTmtUQ29Wa0M0ODczcGVuajRmUHQwWE4w?=
 =?utf-8?B?OXhESW9LVno1YzBMNmJZSjB0c1lwd3p0UjZzWWxxVjVObjBzL09kS0ZnU3RI?=
 =?utf-8?B?MVVQM3U1RldHZnNzTWh3aEh6Zk9HOUd1NENxRHFxSDlpdmxKaFpPTHYwT0FF?=
 =?utf-8?B?NFVRaW1teTQxaHg0M1EweTI2Wjd4TW43WFNuQ20vTDdTbkFPT0dHT0wxUkF4?=
 =?utf-8?B?YkJLRUNOY0NHdTBOVDVPRjZOV1B1bnBOUngyOGxFZlNrV0txRHBlSTlFZENn?=
 =?utf-8?B?bVdnbjJqOFhjNERSMVhEOThPYnd3SUIrTHJ2YVRVTUdhVzBYOFk3d2JjNU9M?=
 =?utf-8?B?eDFSMUdPV3BoSEFMZzJwUnNhM2REbnEwMUFpSWtQN055dU5FZ3NYLzZRb3Bm?=
 =?utf-8?B?ZHpnMHB2V3lhY0NLTHlWREEvNnNCYWgxbk8yOGRBZFZvVUUzcTlldGhET25J?=
 =?utf-8?B?dVV5MVlXZkVheUxTVC8rdHhLdnQxckV2d1NZWmM0OS9ONmc1Z1l6aittbmJ5?=
 =?utf-8?B?SGxqTjljUG1rUHJHdW55MG9WNUFsYWFwUWlkZzRJaDBYdU03b3NraS82MHF5?=
 =?utf-8?Q?Hbag0bsFkH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTlRWVRWdTkvQURURDhwR1hSTkhZMEx1R3ZYVFJRRnJpY0pBeSt5TVExbVRF?=
 =?utf-8?B?cForRVphV0t3REJxTXpaemNoS09pTTdmTXpvUnUwRUExaHlBdlNxWVhGRC9V?=
 =?utf-8?B?MkJTN0V5dHNSYUFCeVkxSG9hM0tITWRKVEV4RkRiQ2w4Wk1rR1FJQ285SkNu?=
 =?utf-8?B?RjJZQ1Yvd3QxemFjQmV4YlFsNXVJZmp1anpNd2FTSEJ1UWZKYkNwUW1NajJT?=
 =?utf-8?B?Q042bnpBdW8wd3dlZWhNWUFjUWRSYXdJdkltVjdER1ZZM2tVOWw1dVRsZEo4?=
 =?utf-8?B?VU9xbUZaM1dEMlcvSXpDZEhMeGJYaUtRTExlaVJBQVA4QWxJbG5DaGFKWjQr?=
 =?utf-8?B?aG8wdiswSnRLK3QzdUFRaVdXTkR3UkFEREdONFBYb0JGZEpHYmJCREFodlpl?=
 =?utf-8?B?Ry9wVjlrcG5zN1ZLRUh3R1NGcGd1M2RJaGFmYWhETkd3RFFYaUtEZnVVemo1?=
 =?utf-8?B?ODh2c3N2WmU1WUl2ajcySXplb2ZYUi9BVzBXNEZiUWxRNVBwMlRpUjVUaVVZ?=
 =?utf-8?B?eGNybmVrS2l4QnpKUlJRYURvUDBZSTNVM3psaU1qUU9FUmxYVjI4QWs1K1d5?=
 =?utf-8?B?TmVRTnYxTzFmbENLNzFIandseTNnWXJSbWVaNmpFaG8xSFpBTkZtblZEb1pj?=
 =?utf-8?B?OGozT1drRVlodTd0emk3amI4SDNoYU93Zk5Ram5Va1NpUkp2K3pLWE9TWVRk?=
 =?utf-8?B?ZThLOElOelhWS1kyRGpjeWZGcDhwMkhMOEQ5YmJJZ2RKdHlSenBWcnhieHdP?=
 =?utf-8?B?dlZ1NVVsQUVaQVp4d3owM2F2UWdZR3FDQi8rMVBiTGRaUHRtYlFTdm44RHdX?=
 =?utf-8?B?N3JjczVYbVhEZkR0d2g2SmZkZEU4cXM4UCt0Qk9pYUo4enlXWGF4SEw1Umhl?=
 =?utf-8?B?L29nSFI2UkxIV0dYTEJyL2gvZEZDY0hJTFdNMnMweEZubEtZNEdCaityc1dX?=
 =?utf-8?B?VE03YVR3c2psL21USXNWbkp4a1g3aGFrOE1TMWVuR3FqemV6RUgzVEx6dnZS?=
 =?utf-8?B?WVZJdzdzOGEvcnNjTTJHSDYyQ0tiYUtkRXNEaWl1WGp0MWhRbzAxMjN6ejZP?=
 =?utf-8?B?TmFmU2plZ0xKVmQ2Lzh3ZDNaakpTTU5CREhtam0wUTdKaHgzdnAvM1JxREZK?=
 =?utf-8?B?akJHWE5GM2dBMEJoYld2VXNTeXlZN1RPOHNTZ0RVd2pLMEsvMFZKNjVGKzhE?=
 =?utf-8?B?ODVEc0FiYnV1bXo3M01CVzVYc05lWDRzMDcxaS95eGYxUCsyWmFlYzcydExt?=
 =?utf-8?B?S01GOFVid3JBck5tbnk2aDJDT1dCZ3JhbXRNeHEyQ21jYzlRc2hNNFJFczRH?=
 =?utf-8?B?cjlRLzVpbkJmeXU1cTQxS29keTNMWmlLaFIwZmcxTXhQRjBuZUdwSUpEUkY2?=
 =?utf-8?B?aVlOYjkxNWFLTGdORzI0dnkwWkE5SzdoeGlMRmlFQm41SVRsb2RpMHRxL0pV?=
 =?utf-8?B?Y1FDM0ttTXZmRXUvQjZxeWNCTzNlaDhGOCtNL082QUwyVUMzLytxVW1TVnc4?=
 =?utf-8?B?NmRlVG1QR1FyaTVlNG1IUUN4OXFwS21KVXZZWHZMU0NIZ2VVRXdOd0tFNzg0?=
 =?utf-8?B?TFhoYzNFTjR5Nng4MFhrVGJjWXFqWW9jSElsSXJDY0gvQ3Y4Rm85RnNnWUgx?=
 =?utf-8?B?ZTh4blZ0ZlBKSXFYd0MxVDRDZ1Z4T1U4Ny8vSjhLUkQzdHdFTlAwaXVLbDRm?=
 =?utf-8?B?ZWNSQ0ZrdUd4NURoeURVVXczNThpam1YYzRFWFJVVklqdGw4YnVuSkg3bkx3?=
 =?utf-8?B?Q0VhUzBNbnE2M3J3RGl3emgrZmxBZ3VkdzNMR09sZ2g4N05SVTE0UEZyNUJG?=
 =?utf-8?B?cGt1ck15c2trdzl4U1dGTTQwajdXTEZtL1B6QlVrU3plR3JhMUlZSTVqa3pV?=
 =?utf-8?B?Sy9jNEFIN3RPYS9zSTBqOWNUemRjelFQWVhXd3FvT3o3R3MzTE4wWGJuZ0J0?=
 =?utf-8?B?OXhjVWNHQUU1RzdldzhjTXMyeS9Edm1jRSs1YTVVV0FqZ05wbHpnYmZJbDE1?=
 =?utf-8?B?bU5HRlJzM29UUTlJWEhXMld2Umhab3JhT3p3N3ZUMG8rSkVJZWE4UHVHWXBx?=
 =?utf-8?B?amJmSjZIdzgwTTM1TFlqZXE4YVBVUlViVTNYRi9GVGF4WFdUazhUdFlFODd0?=
 =?utf-8?Q?At+An9SDsnvJ/YaLq+qCnPaJY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385d7282-3aa7-4a03-9e09-08ddad84bd20
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:52:58.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpusQpOOt5d8LgcyJ9nZzCQyb4JrEQ+1siChz3bAmLe559qfZi0f24HAiRFhNo7H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669



On 17/06/2025 11:26, Jan Beulich wrote:
> On 17.06.2025 09:19, Michal Orzel wrote:
>> @@ -1084,8 +1085,15 @@ void __init console_init_preirq(void)
>>      serial_set_rx_handler(sercon_handle, serial_rx);
>>      pv_console_set_rx_handler(serial_rx);
>>  
>> -    /* NB: send conring contents to all enabled physical consoles, if any */
>> -    conring_flush();
>> +    /*
>> +     * NB: send conring contents to all enabled physical consoles, if any.
>> +     * Skip serial if CONFIG_EARLY_PRINTK is enabled, which means the early
>> +     * messages have already been sent to serial.
>> +     */
>> +    if ( IS_ENABLED(CONFIG_EARLY_PRINTK) )
>> +        flags &= ~CONSOLE_SERIAL;
> 
> Does EARLY_PRINTK=y alone guarantee everything was output? That is, is there
> no chance that early-console init may have failed? (Sorry, I don't know much
> about early-console in Xen, as that's Arm-only.)
There is no init function for the early printk and no function related to early
printk returns something.

~Michal


