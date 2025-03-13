Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C8A5F1C7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911906.1318286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgL4-0001P8-HK; Thu, 13 Mar 2025 11:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911906.1318286; Thu, 13 Mar 2025 11:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgL4-0001Nf-E3; Thu, 13 Mar 2025 11:02:58 +0000
Received: by outflank-mailman (input) for mailman id 911906;
 Thu, 13 Mar 2025 11:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsgL2-0001NV-Rv
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:02:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2405::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b605f0b2-fffa-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 12:02:54 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 11:02:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 11:02:50 +0000
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
X-Inumbo-ID: b605f0b2-fffa-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZB796/R2jlDE+dfy0AUggMWvW6B7SGrf5yYClUtCkZL4YZ7i8gHNAESgZJBHUdHzj6ZUlC5eQaEZhqjOe40y2dS2VK5c2dfv2djLqoGlDQPyr98SxzgRB38n9gQqKZy0lGN/7w5dsmzRolLQlM44MTlpIA0pZ/Utb4Pje8FgDIsvgO7oGdl+vRK3TPBqkx6YX6rSuVX6L7PpZir1SeCURvtxCjfWlfAPrqkQFkDm3P1kGy7j9Cq7c60BVa5ARAzNsPlobe+4i0j1GBp4lg53TkDcfF9beoPP/RX3c37ay/BTZPjcd+ruqvUP3kwjdQmxjhvk/W/owCCo5/RfMKb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSeo7nM9tWXQJOl4gBmo0CAM8K+7o2LjNLuFSwh05Fg=;
 b=xVjioABFOR5kONzE1Bg5kvCYElKI8LNEbwHEwpXrvvaKiaNOs4nsDYplD57rba4+YOTfX2nXV2sa9B+HxIIiy67/Tn7pvyF5TQsbi6I/xoJ1J2zLBz46vm8QAVgh0fuDdV38ssp6ZJGYp55mn0OFQX6hX3p3KHqx7OqsI0LbfpLTqoHBmD3hTeNs582J6io/WQn7Cx6HH+AYbd1mNZmOLLtESA99gGo8Z04Hml34bQzB7N/VVwN9xoCDVCABhgzBbdxyrQZPAoVHWbX+D1PQOPs75Cn4+h/aynwemYZ91dt/h27YlmJNZF7uPh1PecFTuzhooVWn2FXa+qhk00M6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSeo7nM9tWXQJOl4gBmo0CAM8K+7o2LjNLuFSwh05Fg=;
 b=JB5DAVFhRO9dK3lEagmShfBwWx4L+IZQa+VLyUjyK/LTIPV+mkniOiz0jjrBuu/BIbfted5rIW2fjbBxZVlPmOHKIjYHuy7ol4lstH7CuSqMb1odIK/oBrtVz1BQkJEG2/u+Tp2aZrpyJ41SxXM7oT2a9gDnGvMnN5JruiRBS+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <810b858c-b9cf-46f1-82ab-78ce2259d714@amd.com>
Date: Thu, 13 Mar 2025 12:02:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-9-luca.fancellu@arm.com>
 <ada28315-0cfc-4be0-a543-31b589729044@amd.com>
 <ACE7CE6B-ED78-4EB1-85EB-DA2A98CEB83A@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ACE7CE6B-ED78-4EB1-85EB-DA2A98CEB83A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd3cd64-8931-4bbc-8cf3-08dd621e9874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDJkdnRwazFlQThpRjlxSzhkZzZLUEllWmZBcmg0ZUdoV0R1QVUzbmxPNEln?=
 =?utf-8?B?OS9zQzdLeFdiZGdmT0VDOVU3NEdSTVpESkFxcGllL1RhQ0lqa2t5SElnSFY0?=
 =?utf-8?B?Q3dxb2NQOTVHNHJMQWt1NmFxQm04UlgrZVcyNW5rSW44Z29DUWs4KzVIa1Nx?=
 =?utf-8?B?UGxnZVJnaGFnMkl3VGJNd2IvZ0wxVkJEaFMwREFFZmpTdEx5bVV1RFp6Z1VN?=
 =?utf-8?B?NVRidDZsd29VME4rOGp6MTA0TGZaQmtzQVJCeHh6SGJDNGp5WVpCeFM5VWQ4?=
 =?utf-8?B?bXU0dDUvZTZ5bVE0OGVzR3Qvd3VUQXdYSEh1QmR3TmFVdjZHdmZxODVSWmlU?=
 =?utf-8?B?SGNINE4xRW1wcEJJOXBINnRBMjY5c3hhbHNSa29lZE40WjlGenVMdjB1bU5W?=
 =?utf-8?B?UE9uMjBudEd3b3p0akJKUjBHYkdoc2ZkK3BzOUtyeDNXNHNYbzJzTFBrNEZv?=
 =?utf-8?B?LzVPSGxlbDRTeVNQOHJ6V2N0OXdjNjdMOHVpYzZlQVpZMXJBVnkyMzR2VFZH?=
 =?utf-8?B?blVOR2w1UVMwYit3MEpyZERoUEl1TXVHWWpzemRtbGtiMEVZYmVtMzVHMTZq?=
 =?utf-8?B?NVVTOFgxQnllNytRbzRCZnFCT1MvUVNiMGlNVzIwRGswSjc2TENjcVZnT2hJ?=
 =?utf-8?B?SVRRbjc2YW9IYUZTc05OT0dGTm9VdUZIR2FydU05TXVMS2krMXFrZm1Ja0dB?=
 =?utf-8?B?QnhybE9YSElTV3JCTnk2eHF5RW9GbVFWeHpsTURsaDY5Tm9tdXhybmptUVVW?=
 =?utf-8?B?MndTbE9CV2NkdE1MWlJ6dVZyakdyTmEraFVXM1RmSTZhSTRHOXJYMjdGcjZm?=
 =?utf-8?B?c25zdFpIYVZoRmpIVWpoUHFTVHBRWkdCS2ltRU5hdmgxOW9oZnhYa3lRK0lY?=
 =?utf-8?B?M3hOUCtUL3pCWVEyZk5CN0k0V0swQjFrTkdFd0Iwb2w3T3VpQlArOE8zRG9C?=
 =?utf-8?B?dTFETFk5SXAwazdVS0FDdlNvNEUwbnk0b2RTWUFvTTFqZ1ZFZkRqd1hmMnhL?=
 =?utf-8?B?aytwb3psSEErY0JuV0pBWTZmeHM2aGJNZ1I3OVM3c1RCYnBOcGZUQnBwdXBp?=
 =?utf-8?B?S0l1bDlDNE9GUG1qdFI0R1YvR21sMzJlWlNGVCtNNkUrS1hMMHhheURwRm9N?=
 =?utf-8?B?V3JIdkZtWFE0M2dxczZyV0pUZFNjVkRqMlJWNldteEtvdzU0bUtxSWliNEZG?=
 =?utf-8?B?b0R1ZnN1SEJlenl1UE1NWDVETTJMVlBKN0oydlExUHFvRlhNYnNBNW03U3Az?=
 =?utf-8?B?YWhlVVlFUWJSd1R0b2gvL3VQV0NQMENmMkFsWnFwSEdvN014Q25rQ201UVM3?=
 =?utf-8?B?cjNRQTFzeGxQWm1VZkZGUFR2Y0M2aE5FN09ITGtnRzZYYy9uQlYxWkJicmhj?=
 =?utf-8?B?WlY0ZElyMjNSNFN4YzZiL2N0WnlubW1UMWxxYm5mTG5Zd1p5RWsrZE42MVZW?=
 =?utf-8?B?TXZzN0JmMDR0VGxYdzQ3R0gvNk9Pd01hTGdRV3MyTnBreE9EVDloT3BzWG1p?=
 =?utf-8?B?ZmwxSHpaK3VJRkkvR0hKQ01nK3o5R0pZRmwvWjN6Y0xUeDN3MVdaNTd0UTJz?=
 =?utf-8?B?TGIvdjdnUitrVmZYWFFQTHEwb1hrc0IxS0NuSDNoeWQ2cWFZc1BpRGY3dlor?=
 =?utf-8?B?azBPT29DQzFoYTdzbGRWekJVVnBNM29IZ3VnRzF3WjhrMDUyVStBQW5pZ1RD?=
 =?utf-8?B?LzRNNVFUaGE0TDRaMGdoUTFTVXJPZ0I4akExY1dGbWxaRkFMcDNyc2RIYlBO?=
 =?utf-8?B?Unl4R3ZYNnRzZHExUkx6WmlpcGxtTHpKeGppV2pUVEs2d3FyU0pKWU10TTg5?=
 =?utf-8?B?ajBTQ3RqbDRDOEtDWjBleDZwWURmR2VORHRtS0tjdkdVVldnbGc5ZHhZL0ts?=
 =?utf-8?Q?i9koFjuxPBe6G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDhLMDVkc1cxWkx2ZS9nUHBPamp6VGlVZmRETm9SVHMzcWZIU2YxNVpoV0FH?=
 =?utf-8?B?WjQzRDJHSExoSVIwL2NMd1R5UGtIdFlxSHY3QVZCR2NEa05pY3lhblB6YWJu?=
 =?utf-8?B?VmloRGpxTG45UTJkUHZDUkNXaWp6KzVRRjM1dE9rYlU0dDdlbE9KdzFVRHl3?=
 =?utf-8?B?dWU5L0wySEw1dTVuVnZ5VENBWFpFWE5XVythckpibkZaMk9OSlo0TXVZLzNs?=
 =?utf-8?B?aWdXM0txdm93WVVkYzNuMXJkN3F5VGswbkZPMFpSYStUTjlzeVVqWGhkelU5?=
 =?utf-8?B?S3V1SHVqZjhsQ0VRODA5bVZYeEszaElJN1pwdCtzbHBIcm9MekozeXBrUjlV?=
 =?utf-8?B?NjF6YW5FZkdOTmZVYnVkU1dqbFlpTklpejdsckk5M2pDUEt4U2llalZ2UTRL?=
 =?utf-8?B?U280Nkp5a2ZZTFMwa1U1a01MRWd5WnZjRXkvbndzSlVzVmFJbkVqYjE0R25B?=
 =?utf-8?B?NUpSQW9UZGtsRzdjS2NiRit4VHFyNlNUZnRMWGFuanlwMVVDMk5jWjNzOElz?=
 =?utf-8?B?N0hpNHRvSUtxS2VpRXpscGR4eGh1dmpQblpVVHpWWlA2U2tHMmRVZU9wREdR?=
 =?utf-8?B?VHRUTEcxM0JYMjR4Y2xOVXJJTWlyQ1VrMmxESEs0RTlhYjk4TW1MeFhjKyti?=
 =?utf-8?B?bUF6dWIyVTM4bVQ1LzBERFZhVFB3eXJaVHJraFJNcCtPZFd1V3N6am9FZExs?=
 =?utf-8?B?SHBQYytqUS9aVVF4U2gvOWdVNlBWWUJVWTVwM0lSM3lEbVJ4NE91WkZkUWZi?=
 =?utf-8?B?MElVSVhGUHl0enEwNHE5WmdmM2Q3NHFiMFp4b2Q3QXVwWisyeW1HWTA1b1JH?=
 =?utf-8?B?ZVpLcXFONkRQd2JCRENNWjVsVnZlQms0b3FnaVdqUFpZcEVkVVd1YU9TNHlr?=
 =?utf-8?B?RS95YllVMWszVkgwYnNLMXdrSUFrWUJ3cWhOYjJtNzJaVnI5Mnd1QXUycHRp?=
 =?utf-8?B?akY1Ni9mNzAwbGxJMktkandlNXd6VmZwYTE4Wkg5N0FFd09wcmxzejhpWE1S?=
 =?utf-8?B?ZTRkU3NFaXR2UDQyVnN6Y1Excm9GZ2hwbktyVUdEbVVRRHZPbTFQY05wNVdY?=
 =?utf-8?B?OU5zUDZqTUNOVmoxVTVyeGZLS3RqbWdqWjl0bFVpMVRMbUhIbUErb28vQjFD?=
 =?utf-8?B?VnhFcjd6WkkweC9STFQzZnh0NDVXTFExZW5GQUdkVk1JQUs2SnpiY0dUdURv?=
 =?utf-8?B?K0xod2dmOVJuY01mSzNVM1NlSzhjSWdoRE1FcHFXZWE3c000bkxjY3ZycklO?=
 =?utf-8?B?TXJIemJ1WXlCdytJMGFjZDNxeFNENFZVTzFWSTNUNUNBaDNmektPbDNJNU52?=
 =?utf-8?B?Z2NleGhhREhrVlU2YkxheVVlc2pUd2sybGwxeW03TTRGS3Q0Nk9EMmpOUHlN?=
 =?utf-8?B?bXRSZjJMUlRvWStzbTJValp4ZU5rRGdjdmovZ2J3Y2ViRE5HaHpnbzhCL1Nl?=
 =?utf-8?B?K0RneVNYemQ0UEZMZ1V3c3BQS2ZKWWcraWk0emJYTkpUZnZKd1V1TTk1R3Zl?=
 =?utf-8?B?OGEzOGJLYXFxODlneFd0YUx1bTE0NktLdVNrbjZ0K21zdFB6andLdjA1S3pP?=
 =?utf-8?B?MStvM3E5RTlBYnA4TkdEM2Fpc08vRm11clpUN3NvREUxNWcwaERzZGd4KzlY?=
 =?utf-8?B?U3RBQjZMeVBnUGpvRi9mQjBEdDYzcHA0eFMrZzNnRmM4MnJ6V0p3MGZLTVBP?=
 =?utf-8?B?NVB1OGZjcHZxeWhxTzFVMnhOTElHMEZheEppY3lOY2ZBejI5OWliSkl4ZUZM?=
 =?utf-8?B?enp5Z2Jwd0ZZY0I5cFUyZGxlWjNuUUtvTHlnWDF0eTRYaG5ZemM4ZUZiOXRn?=
 =?utf-8?B?eXBsWUN6dEE3Y1FoY05vTW81b1VLUjYzcFNoNDY5N1F0MFcrY0RJN2hnbXJG?=
 =?utf-8?B?NzFvZ1dwSDEwMld0V1RvK0puWldwUVM4ZEk3bWgwbHU2QU9TckxmSGJJYk1P?=
 =?utf-8?B?N2xVaDk0MlBaaGlCdFFrczY3NDdEdGtBWEFqNnMxNTZrZTFxZDJmLy80VGhr?=
 =?utf-8?B?elk3T1RMOEpvU2t4ZVQwaGoxamkxKzVQdkx1Ulo4RTR0UVE3SHN1Tlp0Nno1?=
 =?utf-8?B?YVJqM1pKU2VoWUNNOHVxLzJERm5LWGkyQkZ5bUQ0b3RYbDZQckprZkF6dE56?=
 =?utf-8?Q?aZyVoY8V3jbA95iisVEHrb9CK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd3cd64-8931-4bbc-8cf3-08dd621e9874
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:02:50.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRoK2d3YSxpZ/rexZXnx8GUBVYehStMv450WY9Pt2ghyH7MtdyAnotQPrOaiGfDr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915



On 13/03/2025 11:32, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 13 Mar 2025, at 10:19, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 12/03/2025 14:52, Luca Fancellu wrote:
>>>
>>>
>>> Rename the setup_pagetables function to setup_mappings in
>>> order to be implemented also for MPU system that does not
>>> have page tables.
>>
>> mappings is better than pagetables, so:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> but I'd like to understand what will be implementation of setup_mappings for
>> MPU. I suppose regions setup such that the following call to early_fdt_map can
>> succeed and doing this in setup_mm is already too late?
> 
> So on the MPU side, mappings are well defined in HW by registers, so we don’t need to
> allocate pagetables, so setup_mappings in reality will only prepare our logical data structure
> that tracks the MPU region state (few regions are already written by the asm early code and
> needs to be tracked).
> 
> early_fdt_map won’t use this logical view of the MPU (as it’s called early), it will use low level
> API to access the MPU registers, like the early asm code did, basically to map the DTB.
> 
> Doing that, we ensure that the current code flow in start_xen can be reused as it.
Then the question is: can the MPU part be moved to setup_mm if early_fdt_map
does not need setup_mappings? If so, we can avoid introducing a function with a
name that is at least odd in MPU context and leave setup_pagetables only for
MMU. Adding a function with not ideal name just for the sake of avoiding #ifdef
MMU does not sound like a good idea for me.

You can check with others on this one.

~Michal


