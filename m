Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC135A91569
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956990.1350202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JpQ-0007I4-7F; Thu, 17 Apr 2025 07:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956990.1350202; Thu, 17 Apr 2025 07:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JpQ-0007FL-3l; Thu, 17 Apr 2025 07:38:32 +0000
Received: by outflank-mailman (input) for mailman id 956990;
 Thu, 17 Apr 2025 07:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8PF=XD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u5JpP-0007FF-14
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:38:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f01a87-1b5e-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 09:38:29 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 07:38:25 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 07:38:24 +0000
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
X-Inumbo-ID: f3f01a87-1b5e-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J93Qabmh6RW7O16jGUeovDcMXBPsjLJs7lE9rCpGPjMLHCW2qWKJpnrTTSGABMwNfIKOPyo3Ahzx0dG92Ql5OH+oUF1Mt1KqIK5v3TF3diBVQcbFp5AOED3O/0itsGHTkIottb93g+n9KNtxAoLaKkKsSoMqdHyAUHPWdVKBJfFcYqV59Vr9uJyz8Y24/8rij9Mr7Xj+nx8IFZAOxaP+VP/a+SgQfPq1nBq9grYnxCa0kvodK7CvJLtKjDLjyoPPWX/ufzLmaPkp+p0+gSPlE7dntepIZIpW/uy7RkW85noZo/uUZe7kps07bWMHN1bkYj8kmD/uCH1mjmJMndxPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iu9AZ/cCap4aPXXwSmp1Mmj4Z3yDfWkjYutn6Pimbv8=;
 b=JtxOM5I8ajtVXHjcqJnYRq6KTP4dL0//87qUGjctIwmrYawbn335Y+hbGdO4XwKnZeSuXUNGe01S0EGvrFoepFtouCk5ffhruH4Tw7YU1Edkfs19uLTGWezhzUDP6BdKulEZSBUWoSISDkb+wkq6xlHFpXVlR7aA1RVrWlT1WtdORdMUZjRFp3MvTWL7sLT9E0HExpXlJZOK9lrDnCXnJzwteSCu7/WgBf1TgRvzTH1NCjDNwzA+tWnL9ZPuSB2TJOQ5rADmmukV9ZW4eYdAes30oBng46ZHPJHNlMr/n3Rlx031uTgWI18ECzIbn9XYoGDf2NCtWB+1qELoz+ytEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu9AZ/cCap4aPXXwSmp1Mmj4Z3yDfWkjYutn6Pimbv8=;
 b=KccO3tm5op6BfcyuzIKg1DORKo8BwKYC/TJ4FsmQT4cRgpeF1eRiXQjnqGRu7K7JwugLKHQv8A923oj2R62hYvZ8V1jsPGCLpkL8Fp4GEDsH/hE68+EXcS+iupdcM/q8jXamvoDXawFqXq7CKFUViYUcDGzzZiaa2UxzK1huje0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com>
Date: Thu, 17 Apr 2025 09:38:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/arm: drop declaration of
 handle_device_interrupts()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <ec1bfe540b4588c749fcdc932bd93da96db1d8a2.1744626032.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ec1bfe540b4588c749fcdc932bd93da96db1d8a2.1744626032.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: c2591cfd-25e2-4082-4f0e-08dd7d82d5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YW0xTnNoeVNlUC9vSGR2UVpXUjcvUHBjcVA0VzJWMEF4cG1LaDlseHdLTVpK?=
 =?utf-8?B?MVhYamJHWWZYRXJJSXZCcml3ZTVPYmlRNDlYWk9kYzY0Y1hBNWlwajlWK01z?=
 =?utf-8?B?anVEWnNDbkhsdHpkK2hFemUvS25Vc1d3cWdVQStIZ3VaRzkzMTNNTWRtYWFU?=
 =?utf-8?B?cHU2T1BTRDlIRUZmdDBQZ2xlQnJ0NktYcmpsS3NVSU5sQUVWWXpMN0dxOFhM?=
 =?utf-8?B?amwzRlhjWGxzK216aVVZOFdRYnNNclVRRms5bUFZT1huNDFweCsycmltWnBZ?=
 =?utf-8?B?Q1EvUTU0RGpZd0VBeEJZNWF1RWpYNUp5RUd6UWR5ZG93UnFGamxPYURZYlVZ?=
 =?utf-8?B?U0lzb200aDlBZjU4b3VBZmxsZUxoY1NBbHh2VlVyMW12Y3pxYlppTXJuUllF?=
 =?utf-8?B?VXBnSy9wdTBPVEk3ZTZNem5OanhKMkNDUFZrV1I3NklLamh1b0NCd1RtSC9K?=
 =?utf-8?B?UVAyd3JXREVFTVVMRjV3enNDbFNCSXFrYnN0L2QwUXJYREJ3MkI1RzZFMzFq?=
 =?utf-8?B?ZXNMNE9XQWpIVUFVQjA2Um5DQmVRMDc4WDlRd01xMkRNaEwxMy9Dei8vVEhY?=
 =?utf-8?B?L1ljVU9BZEFLTzBTR0IxZzVyQjVMcklKeVA2LzM1akhVbTl2dDh5SFBnRUdo?=
 =?utf-8?B?NUUxN3hHU2NYSzdoNUZIMHNRS2tVNEM1RHJJTlQweC9rK0VlTkRVZzhURElQ?=
 =?utf-8?B?ZVFFcVR1a0hpWlR6QkQ4MCtPdUJtbDZYTEVYV01vdnd0dnhrZ0NVSTVnaVZU?=
 =?utf-8?B?N1FTOVpTZFFYOVhzWkVYQnA0dk5vc2pCWGI2dVMyRTduWFZxbVpyYzFld3Ex?=
 =?utf-8?B?ZlhOcW4xaVltcmNmTEJKMkEvZFZmWEJ5TExTSUh6cHZQU2EwZUxCazhYd1pK?=
 =?utf-8?B?WEtMYzUwZmJIdWZqSmttQ3JBeFJuV3lGN0c1akVmRVBoVkNkYjllbmZ3eThy?=
 =?utf-8?B?MEZNVXI5czVPU3krZ2k5NHNBMzhQcHRmcE1pTlNpTXAzZjJJKytIOUNaR0Vm?=
 =?utf-8?B?SWNZc3dnNlRNOGMwL2lucDl2VDlKMEZPYkdqRmJDRXh5Z2R2TEk4U0ZqL2gv?=
 =?utf-8?B?WWRrZXVHb0F3V3RXQ0crbXVTSlZEV1hpdTl6bWNnWGVqSUJ1OHArUlhrUUhu?=
 =?utf-8?B?cUw4TVE0TGExMy84dmluQlc4VTZCeEFxdU1RYXErb3N1VHZuaE84SEdWalg2?=
 =?utf-8?B?SmNmbXJybDZJMEhvbUU5UTJnc2JNeFZNbGNZb053M3VqL1BSNVAxZDdDQUV2?=
 =?utf-8?B?TEdJK2F5RkZQc2hYNGRIOHVpd01JV3V5SlJxTGxtc2g0WG9yajVQKzFlSmIx?=
 =?utf-8?B?UnJWK1o1dDRQYjhQdFF0K1daR3Z4cWo2bWYweWNGc3Irb2hxR0R4elhGc0VH?=
 =?utf-8?B?L1grYXFNNXpSRXZVMndodzF2T3Q2d1FrNUhkdS9pb013UDhYUnFhOVZFaG0w?=
 =?utf-8?B?TUo2cnJHby9XLzVJN0daZTdOOWhMd1R4UkNKTi9VeFBkMDJKRk5JRFFXNncw?=
 =?utf-8?B?U0xuOGNoejlGbzJ3NmxHSnpnWEFqM0lzNjl6Z01jYlpDQ3U0SXlURzkzS3li?=
 =?utf-8?B?emtrNXRQRm5YcXNxQ1Fmb1FlYXZqRzYrdE82Y1ArYXgvdHNaMzA5ODdmc1Mr?=
 =?utf-8?B?eUFpQkQ4eC9NZG5kWnlRZVlYUWl6TWZhanc3WEUxUE1Mc1VJcy83ZzBNT2Zp?=
 =?utf-8?B?eitDTnR1b2ZTYi9DS3QyK09OeHNRWGRHK0FKSEZ2WmRRRk5vNHlSeGl1bldy?=
 =?utf-8?B?WkpPU1BvYzRrQ21DWjBrWkFVTENvU1Z2SHhWcGtxWTZ0VW93Y1l1ZDBqTU9z?=
 =?utf-8?B?cEdNRGRoWUxYWTc3alNvOWJkTGhBeWRTdy9NR0VWbTk2NXJId0wzWkRpakha?=
 =?utf-8?B?QnRWT21HVlBRVjZXYXVTd3JNMzNYM01PQThsaElEY2dDN1JoZlNUa0g2TWdq?=
 =?utf-8?Q?pSpxY7nmtL0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFY2YjdoMWgzcGIzcTRucVlHb0o2eSt2QU9tNWJSZ0dPd2VtNEEyY1F6bGph?=
 =?utf-8?B?eWd0TkFUUmhvOEo0RjlrckZzV3lDbHlnZUsyR3hCVER6eUlKMERxUG5QVGVU?=
 =?utf-8?B?MjhYcWszV0FaWmVzbEJTbWNEV0lHYTdZTzBEL0NSbExkekJQeSt4ZU0xZWlD?=
 =?utf-8?B?WmEza0RIck5USk9adWhJaTZQQkkvR2NsVUUrREpZUU1DTDE4eTh4b2NrM3NC?=
 =?utf-8?B?cFQ3VGtqaTQvdDJtZFB4ejB1UktSbjY5V3VWOFRJRFJJeGRISjc5R0Qvd1hE?=
 =?utf-8?B?TDRTb2wxZU1IWjU1MDlucTkySkRFWFRVc0pWUFAyR2orU3B0Z2hhcVVNb0Nm?=
 =?utf-8?B?MXNwR085RUd6eHJpS0F4MGVRTCtCbkJEYnZuQUZydHVibGsxdGhCK0JJa1Ex?=
 =?utf-8?B?OUNVYndrRUYrdWk1d3B1NWRKWEZMOVA0VVVoeDhlUGxRWWlZVE53WkNtODEy?=
 =?utf-8?B?M1BNV25SdGpxcFlpZHhrSFAvZkNhdnFYQVE4dGhKK0tBQmMxSWpkWjJqNXN1?=
 =?utf-8?B?TmlFTnN1WktLQVo0Q05Vd2FqZTlQTEg3Y1JTS3RsTmNmK3N5ZXdGZlArODk3?=
 =?utf-8?B?RzIxR0poY2JXVWlCYmhXWWx4SEJsKzJoTkZUaVkycGZ5ZWxzSWxZV05ZTmJO?=
 =?utf-8?B?SFJVaVA1aHJzZTZ3Z05ZeUZ1SlloZUhMU1h3bStUR01KWFFiM1BwMm9nZGp3?=
 =?utf-8?B?SFRBZndVMXlzd2dQK01DYlZUUSsyZ2pmNUIzcnRoMTNBR1d1NDlpc3ZzcWVs?=
 =?utf-8?B?Sng2YU9VU25NK0FhK1ZYS3Z6R1JEcWtsaXl1VXMwczJHN09aL0t2ZXc2TTZ0?=
 =?utf-8?B?ZnM4aXA1WjNrRjdkSjdFb2c4SHZJWDF3RGRNWXJqODM2WHg5cTgvYUF6bi9i?=
 =?utf-8?B?K3dVNnNxc2x0N2gyNU1rQjJrd05YaHREbStsa2NnS0RvcHdETERLYWhVVDlF?=
 =?utf-8?B?TkRSVENYZmU3YTg2cnhCbkl4aUZpbW1ZYzR2MkZETUhDVUFoeUNtR2Zmb29H?=
 =?utf-8?B?N2R5S3p3Qjl3YTlSOTUvSkpmTUY2dmFKOUU2em5hQ0VkM1lsYzNadnkrTkE3?=
 =?utf-8?B?c1ZmQ2MyS2x6UDYrQXhaelorb1p5SkZqcW5RUVlOUjJaeXk3aUNheWhFK200?=
 =?utf-8?B?ank2RmhBcFVOcXUySHZXN2ZZTUg1K3hDR0JxMlB1VWY2RjhJbXg5aXBNcTlO?=
 =?utf-8?B?K3h5Nnp4VkRTRWRieWZVRGUxSUk2MEF3enFCQ21ObHYxSThNQk03RXJoYktZ?=
 =?utf-8?B?bTdCVkFlT3dXVjYwZmF3akNsUHNaamZkcnFFR2RhSEN1QXVEZ3pCOElxNzVs?=
 =?utf-8?B?SThseU1mQTVPQkw5ZXBGeVdIbGVKZmFUYjhOOUNmaHo0UHY0aHFHbElQaWFo?=
 =?utf-8?B?a2tmOWY1eVN4ZU1PNmxSMnplN01WY1plcW12RStMOU9GL2VNY29NaVZmUzNR?=
 =?utf-8?B?WTBiWW01Q3NwN2FkUzNMNGxMSndYNWw5UGgybTV0amw2TTZnTnZPSzE3endY?=
 =?utf-8?B?SklKSFFsSDlkK0V4V0ZDenF0N0FjbzdueGdEM29vMERsT3l0S2JudStZdWcr?=
 =?utf-8?B?NnkraGM3L0tNU0hweTVkcGZMYWF3OFphNnVwaEhRVU8xQXlWS3pQeVRoejQ3?=
 =?utf-8?B?Q1FGUys0RkVJSUNheDhuWW5hQi8rUGU5S043d0o5MEo4b24rUHdFWXJxVFN6?=
 =?utf-8?B?ZTA2NmNFT3E5YzAwMWhEYjdUaEhKNU5YTDhOUUJTbEk0QjlHd1ZobldPNEdL?=
 =?utf-8?B?STh1bjd5WU5lTER1dnQyQU5odS91OXJyUzdsM2J1MnlWdjRoRGV1RFU1N3Zl?=
 =?utf-8?B?SHJOSTBRRmE1UXFXdUpZUWIvYUJFV1ROZytNR20vcXplb3hYM1MvZGdRSndi?=
 =?utf-8?B?Qk5uT1ZhK1AzMjNzbCtYWjlXdGQxRHJKandmVmh3Zm9Pb280eU9nR0lPL1RT?=
 =?utf-8?B?RW9Bdy9hOXFtQmFUcXdnNjlaelNVaFBwT3h6RGlBMzhaejFBNDBjR0F0bXVM?=
 =?utf-8?B?ejdBSXJsWklRNHkxU1cvenFjR2xPbVQ4dVNIbFBYUWswY0tyWlJWZDdBVFNV?=
 =?utf-8?B?WGlvUEQ0d1FQWk5PcmdxcjdEYVFJclgvcWpCUzY1UVFHdm5vNmxuUFlsSmdw?=
 =?utf-8?Q?WQdo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2591cfd-25e2-4082-4f0e-08dd7d82d5d8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 07:38:24.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6DswqxnG3s0OMPOc1XklJxZivjapzWm6zbwcFE9d7+XPKjKOM9ONLRmQOI+kOZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898



On 14/04/2025 17:56, Oleksii Kurochko wrote:
> There is no any users of handle_device_interrupts() thereby it
> could be dropped.
It reads as if you were dropping a definition. There is no definition, therefore
no users. Prototype was added by accident in:
8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With the commit msg updated to be more meaningful:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


