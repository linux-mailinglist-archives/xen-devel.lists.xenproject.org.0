Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275BAE77C2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024370.1400261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKEn-0001nM-72; Wed, 25 Jun 2025 07:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024370.1400261; Wed, 25 Jun 2025 07:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKEn-0001lf-3C; Wed, 25 Jun 2025 07:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1024370;
 Wed, 25 Jun 2025 07:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uUKEl-0001lZ-ES
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:08:03 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e88318c-5193-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 09:07:57 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 07:07:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:07:53 +0000
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
X-Inumbo-ID: 1e88318c-5193-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWOGEGWyDB8tzCuEduuS0zUk7kyl5DV5kBSNhj31JGdB6mdZCOrgTZ9LHiuw58SXuQ/yazbvozCQxYUNjjtVVOd4spmDqj6b8e+OVcFFw4pFNriX1WtlUP1mamqjvyPXCJA2q3Hqr2FijUygGCIPDzLsEKtUsh+njk8DE4lG3vTRX3F0YRbDct1IKTjGQRS5UwePPzYg0I5kQ8xLoaw4/vHpW1sVj0Um1+Oh0ptDydJTKRMobGvzY9eonGyvnGGFGwwJghv5VRO03Lto7THocqUW5VqNxcEnjk07FfZByilZGuexsGHXnlaOOyvOvIZUXs7YTx7lDEVPLPCw37Gt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtjlSkJ20liyj4cXzJrperPcGHouu4Jxydc/MkCdwVE=;
 b=H3gU7dIRwebrrZDmHdSlwFc1Ofu8PvjYTNJVOAL8ttlbfzyGHZPQvvLFAiqrDrwJLGbrUqort14OP9Co5I57BoZ7+IEJ4e9bftQPzbKgdyktSjvDNE7CDZ2cJcnzkn4yiUjYSKNe1upsUK7qvTzNgH0oElikVFCiSX7YDlSbHObmzXCvZCVxiDqtLdDY382MYlsg0Nud4c7L+Sxu3kYrGSpw2oqdv/V73K9o58WIebDivc+vsuwJqUbeg04cqECCJ3EQiD+eI/hDHBQii3oKSOP2HGpeYEHAJo1I4vT0ejEH7U1MaR9Rtdfvt1XwfRpY74lzmRfqI9G7CVhDo58wTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtjlSkJ20liyj4cXzJrperPcGHouu4Jxydc/MkCdwVE=;
 b=2gYtkqFFGWJ5dQnf+5LrschSHw5zuUt+HUseWT6hv6CsBL957DCt++wJAAHNT2zXafDBo09dg41SqKjOXO6jD+adeSJ05V21eev8NP/wOu7ye9isD8vrm3wNy8wzD1dBA+iSxr9FgOh1EifNsVcJRFrhP5j0odTX8m5zePxtHKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3daf1254-0acb-426b-b28b-57665f406c3b@amd.com>
Date: Wed, 25 Jun 2025 09:07:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/16] arm/vuart: rename 'virtual UART' Kconfig option
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-8-dmukhin@ford.com>
 <070f16b8-c397-487c-bcb8-0ba13bad919b@amd.com> <aFpQOXAZkDbj2VhN@kraken>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aFpQOXAZkDbj2VhN@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: e07ea026-feec-433a-a0ac-08ddb3b70134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDV3V1ZuZDM1MDBla0xXSHRyK2lYTzRmQmt0V2pXeURJQVNNYlc0REtvTVc4?=
 =?utf-8?B?eXlKRXBwZUpwa3lJWk8wd1dCUnM2UWJPOU9KYWNwZUZyTEJmZE5McnhRcE0x?=
 =?utf-8?B?eXlJUDBrQUgwVm9DZVRCSTl3eng5dDZic3BPNFdzMVdhWER1MWZ5QXJ0bURL?=
 =?utf-8?B?YWNXZUdkdjRGSWI2RFNTTm85U2Zrc1VYV2JVcmVjV3c4ajh4SDBwdmZ5enVX?=
 =?utf-8?B?S3FiTTFJV1NWYUs5d3R0SVN6YVJkNmU3SU5lV2tmbitYL3cySU4yK0dhVTcw?=
 =?utf-8?B?UkU5MnNvU3ZRbkFoTnlwZTEvemRHWnd0Rk5OeW54RUdDUmtUVWRzanlnenRH?=
 =?utf-8?B?WW1meWpDS3FpNDlaclQ3VWxDdnVRR0Yzd0NzQVhqNjhIVzQ1blgzendpUWhK?=
 =?utf-8?B?UHlTMVF2cjMrWDZEcXIvZjlqV1ljc1hOVGV4T0ZnQnROUDl3a1d0aGxlT3R2?=
 =?utf-8?B?YnNFZmgwQjVNK29RdDkyTERhbE9rUHcwV0h3b3NsM0NsZlAySVRmQStSTGhs?=
 =?utf-8?B?YVJhakwwYUh5S3kvdGkyWUMvZTNyYzUzYklDSmlHMVYwMkdUMnZ3c2s4ZlNS?=
 =?utf-8?B?ZmpaMTgyZHFEU1pDRXBDMUlGMG5mdkRCcC9JSzIyRzNPdWQ5ZGxZNVdsNmh5?=
 =?utf-8?B?a0RReExBK1RmZ2NlOTZBdTlncm0xcHl0TnNUcWNmWXkyR1c0K0ZVZStBTW1t?=
 =?utf-8?B?bmRmUS9kTUdQMkJrTmNaaVpqRGw0SHVpK1FIT0NxaWQ5TmpaMGlrWFcwaWRp?=
 =?utf-8?B?YnptZVArZDJZZldNZHE5UDRZaFVMQzkwU0cvMXJ1SXBGVkdHdzN0S3E1QVp1?=
 =?utf-8?B?eGdUVlU4aVRVV1Z4MGFhY01RdmZRTGlNdEl6Sjh3ZXJScTB4RFlMd2c5LzBG?=
 =?utf-8?B?SFBzeUhuTUc5SUpXV1Zmc0xKRmo1cVl4cnd6Ym1Rb1p6UGtaSEN6c0c2SmtH?=
 =?utf-8?B?ZFBiUmE5c2NvQVc0blZiN055WVhRMnF1OGJIZ210dmNFTG1jaFJnZXF5UGlT?=
 =?utf-8?B?RC9VcnVyRXJ4QkhTRmgxWW1YNWhPemJRbFN6NDdxKzFtcmlDUDQrejhYc2dq?=
 =?utf-8?B?U3RYSnNnL2V6V1g3dXJJVlEzbzlNK2NOcDFhbjU4NzZ2Y2c0MmRMM1VpLzBm?=
 =?utf-8?B?UjdjaDIzandQdTliZkhYUkpCOUxFNHUxQWdvZC9yQWQ5SkcrK0ZYZzBOYXdQ?=
 =?utf-8?B?Wmk1OEpiNjRLVEtJa1NMdy9FZGlaYjNiTEYzVEhMaUFaeGJVenM2WFhQdjVE?=
 =?utf-8?B?Tk1pTUVkYk9HTzg1S1JmTTZQMUhqaW9GdE5GeWszT21tL2N1dG1PT01Jb2hK?=
 =?utf-8?B?eXh0MGF5eDJ0MjRoRFhtdlNMZlQrdVpBTWtCbHAwYmh3Qkdvc2t3aGxJUDhR?=
 =?utf-8?B?T3dJMkRQNzdwTUNYYlhWQVc3TEZmS1ErSWlkWWFISjUySThLbTFsb0ZRYzh1?=
 =?utf-8?B?eHlXSDU0V1dyeEhMQm9BQXFOSnh2Y04wQzdZMll5eHNPM3MyMXBhS3ZuN0Uz?=
 =?utf-8?B?cEJSbHhkNUhmOVlOUCtJUGZpN1F0Y3dONzFDMms2aFo5QTRjMHJmTi9tdFBW?=
 =?utf-8?B?ckNPSzFCeElqbkxrZDFXbVBubEJCcW5XTGRjd2xjU2YyR0pTQUpVQ3VTa1Fq?=
 =?utf-8?B?b3lObzJSOHgyWVhtU2pUV2NQK1ZvTWFibXU3Ky9xbmUxUjdHcFpacjk3VUVv?=
 =?utf-8?B?R2lwREtIQ0NaVS9OYklyNWJxejBXYmhhOXVyMUw2ZGJ5ZXMzelVmdUs0L2o0?=
 =?utf-8?B?anV2OXpEckp4SXBGVXYvK2FSTGNlOFFZZUoweE9oR0hpU2NKRFFQd0I1bERj?=
 =?utf-8?B?MkZHZ09QOUdUQ3oxL08wVGFVOFBYUmE1amY2blRjanZZcmhXRms1L0pnbGp3?=
 =?utf-8?B?alM4aE5qRU4yY3NpN0RaT2JZR0tmUDBnOHd5Z0xTYjAwQVM1TU5FdzR3bW1s?=
 =?utf-8?Q?FbccWiuW7mo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnpRcGQyREF6VVlhQWlkVlkraFFsMzBuT0R4UndBclEzOWxCd1BLU1BldUxw?=
 =?utf-8?B?YXBJQ1ZITE4rM3dESUJhb2l0b091RDE3bi83Z05OK1FyWTMxVy9NTCtpMml4?=
 =?utf-8?B?eVlCMm1qQ0lzeHorQyt5ZmZvbld0VnorUm53eFBoZWkyclBvQVhmUS9pdEVq?=
 =?utf-8?B?SmVOc0FTdjk5dzd5bXR3YjdoM0RIeTdSUDNBckNzZ1F2RTFubWVLWGlabWtv?=
 =?utf-8?B?NGRJMWxzbVpUT2gxY3ZXSDE0VXR6d25kQUorbkNLWUVUZWI4TnlwZWd1R3JI?=
 =?utf-8?B?V2p5dWFRcUtaMklqanJhcVE4SFRKbnFVMytOMU1LUUdNYnFPZEdlSmVoUi90?=
 =?utf-8?B?cDg4MSsxa1FzVks1ODBrR3FsNU5nQVNYcWhsQ1VZKzY0UVdIQ3pRTlA0WnBX?=
 =?utf-8?B?MHhISmU0ODQ0dXoxTUN6OEJnYjM0ZjEvcVNPbElOVTdKT1VGZjNwMFRYVkpu?=
 =?utf-8?B?SFlURkp5emM5STlMOEJWaWVsdEsvNzRzUW9oRzVOZkJYa2hFRVUvNW56S3Rv?=
 =?utf-8?B?NzQ3dVB3WlhmSk5zMGxhMFpyK1Q3NENyZnhmL3FCT0hLb29uV0NtR0RhOUF6?=
 =?utf-8?B?eFRpNjJoZitlRVNnLzNhTitDU0hsVEhZWE5kUnpqOThBUVdZaVpBbG5xOWNR?=
 =?utf-8?B?R1RHK3MwTmZ4djR0OUloSlZwdElEdGgwbGZCcWFLaXNBOU10c2VPUFE2NW15?=
 =?utf-8?B?QzRaVmJ3Yy9kVTFoTkY5Ynd5K294Vmw2dkRFOW96WjBJcnFYOFlER3ltRXJM?=
 =?utf-8?B?YWVDSXAzSzdueDluYzA1UEJTRnY3dldIdXJiTmk0U05SYVBGSWdacGJhd29Z?=
 =?utf-8?B?cnBYVkJCMTkyME9wdGVtRm03ZG1Kc080cUJUZ3pQaE50SmRRUTRRMGV2N3Fz?=
 =?utf-8?B?K1NPT3JLSmxTcktNOTcrcFY5RFByMjQ0Um1WaHdLZ0JZM2hpSTZ5Q3p6UDl3?=
 =?utf-8?B?THBJaE1za3lYTDRnZWUvK1Z1SjdiODlGR1RVSFVTMWVmY3BYcEIvbFVRSVAw?=
 =?utf-8?B?N2hHSkU1VGN0S09JUXlPOW9Rd0dsWmgwQ0RsL3ZLNXJuUFYyc3dwUkQ1eGNo?=
 =?utf-8?B?dG1LRXZJOWU2ZW5WSGRpL3BwSlpHNEVCZ0FXYVlRME8zb0tQUXZOOG5FLzRk?=
 =?utf-8?B?QTZPRjA1WlNIZTZLTFJrY3RpRmZmZ0tXUlVYelN0cncrdWRsWmhsYXkyOVBy?=
 =?utf-8?B?TWhxeXdZMThvQ3BSKzNkMjFSbWNRbVJoallpc1F5NWpTUkdNcW1OVzlackE4?=
 =?utf-8?B?WkVvTCsvOUU3N0dpMlNTcmhlMmNkSXZZMEY2Njd4WGg4ZlhUb2o3TFBpM0dt?=
 =?utf-8?B?QmN3UEJMMW9ha0l6Uk5HWjFjOEIxTWNWd3M0cUhsVXBiMEpPSXAveVZWSlVl?=
 =?utf-8?B?ZVRncDQ0UlVUT3llRkg1Y3RMYTNUcmlST1QvZHRXOEovUkt2cUJpWHh1WmNj?=
 =?utf-8?B?SW9hZnhJZ2J2TzNTSFBheVdobmlUV0lEUDVWdVJGRVlEcWhlc1hyak91WUpC?=
 =?utf-8?B?R1ZHSkVkN1FxZFZsbDNWSFMydWdnZ1F6M3VSSmFOeHNJMDVDcnlHd1gvdXh6?=
 =?utf-8?B?Z2RRUHp1TUFiUGY3dTFXS1I5TGpURm5ORFhJdHoxS3g5U3lacmVuREw2b0xG?=
 =?utf-8?B?ZG1KcTY1SlJlSTJMcGFzMDdOZWcwMC9FVDlHSHpXMElRSW15enJaZ0x0NU1D?=
 =?utf-8?B?K2ptU3VzeWJ4bEhFZEJBTWF0NTdLekhEQVEvby9TWEpZMXFQc0hTL2Z6N1Zp?=
 =?utf-8?B?S2RoRzZSR1hLcENzT08vNC9NSWU2ei9kZUp6cUVpSWhEWFNlZUU1MTE3ZkRn?=
 =?utf-8?B?ZWVyYmZ0NCtlNFlBaEJUY01rL1VCM2hCZzFKaTZJK2tFVnJGZkNvb29wWXhq?=
 =?utf-8?B?SFdUWk96OFFURVpkbzlIeEdkL1VHR0VuRWdWNzR5SjdYSVdPQ042M2ZtZWhi?=
 =?utf-8?B?eEJFTXh0Z055V1BZemM4N0JrNjNtejR4bEliRFJ5TkdkYUdpWm0rSVhIRjJk?=
 =?utf-8?B?YUc3Ri85Wkl2MEY5ZVZjZ1hmM25NQU5ZQmxLaHZ6eXByRDNkTnRzRWRFekI4?=
 =?utf-8?B?ZzZQdG1jQjdlUUhNZjZHV3ZnYk9BUGM3ZUlTOHJBVHpWQmorRzcvNVZ2SENn?=
 =?utf-8?Q?fZ9ru5PMMwjenv+koJwD6JSHy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07ea026-feec-433a-a0ac-08ddb3b70134
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:07:53.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvK3uNug0RCgcQHhiDos0l1eP+E6DCY9hDJMNNjl4JGrw08oQMLWnKPorpGI5wx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552



On 24/06/2025 09:14, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 08:37:22AM +0200, Orzel, Michal wrote:
>>
>>
>> On 24/06/2025 05:55, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Rename HWDOM_VUART to HAS_VUART_MMIO.
>>>
>>> This emulator emulates only one register and the use of the emulator is
>>> limited to early boot console in the guest OS.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>>  xen/arch/arm/Kconfig              | 2 +-
>>>  xen/arch/arm/Makefile             | 2 +-
>>>  xen/arch/arm/include/asm/domain.h | 2 +-
>>>  xen/arch/arm/vuart.h              | 4 ++--
>>>  4 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 03888569f38c..b11cb583a763 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -177,7 +177,7 @@ config HAS_VUART_PL011
>>>  	  Allows a guest to use SBSA Generic UART as a console. The
>>>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>
>>> -config HWDOM_VUART
>>> +config HAS_VUART_MMIO
>> I personally don't like this change. The current config option name reads much
>> better and clearly denotes the purpose.
> 
> In my opinion, the MMIO-based UART is a useful debugging tool for early guest
> boot, even when the guest doesn't run in hwdom or on Arm system.
The reason why this vUART is for hwdom is that is uses information from dtuart
(physical UART used by Xen probed from DT). This is to enable kernels used as
dom0 that had early printk/earlycon set for this serial device (as if they run
baremetal). Regular domUs have vPL011 and don't need hwdom vUART.

~Michal


