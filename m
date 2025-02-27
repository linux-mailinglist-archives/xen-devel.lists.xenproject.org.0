Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AEA48904
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 20:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898398.1306955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnjZN-000342-KB; Thu, 27 Feb 2025 19:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898398.1306955; Thu, 27 Feb 2025 19:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnjZN-00031v-HV; Thu, 27 Feb 2025 19:29:17 +0000
Received: by outflank-mailman (input) for mailman id 898398;
 Thu, 27 Feb 2025 19:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X082=VS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnjZL-00031p-8c
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 19:29:15 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f573a78-f541-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 20:29:13 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 19:29:09 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 19:29:09 +0000
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
X-Inumbo-ID: 1f573a78-f541-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL7D3WsI3bTPLpJs80ADwFrWIpqpqgYiPImvfqnUgRYY1q6bgMlq/eCPwfo7/yX/bUYv5IZq/Nf6p4rmNaLgidD7prwkgpVSyBOvJbDgq/r8D/QBGMIvD7y12H8SejDN441LZXp17avi+DwJxH97sMXix8vBp3SpWsWJMlCz1RIqiYS7HxjUwJgAk5sG0687Z5PMMmFmTgG41oPcQY3Du1eqPkIoqJSgjZWOnqhCBNuPlfthcN5lN/lbgGPqpjAcb1LONnSFIzzAES1Vnh0IsbwYuxPa6+iDx+A8WHkTlF1aoB2Qg2JfqNS4/GJNWfOA0TlH+5fFeZ3I5WP/Zt9rBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtosuVwo5xgM4c4dAkmPFC4UI37C2r9gbbOSF+ayW9Y=;
 b=JelOiBuEemg18gO+7kffo+zagwNUMLhnlDZCOnGoPZt32A+bSTybxbul9T1SKyxFLGRxSt566CNPfynCufH2TGlymsBPzxEnFe5HKofKwpyj0rFeIvDFMhifS1dw0b/xulwD3jF+HfwG2qKB9JH4a88fx/M7E47gjymNX9juIyO/syfVTu/+xurDUOWcYAo4cyp80yFV1tvOJdntNdtUuYxdKGqsMZmelk18K71i0xG8oyjSG1lopAhkK9kB75jF4M8V7C2S8G/VsuJUJ2f7bJARyryYdVXEle4uZLoHv9ZRGrK2R0GvhoCmGkREc3aIKS2ElLByo5SzxYyMW3CclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtosuVwo5xgM4c4dAkmPFC4UI37C2r9gbbOSF+ayW9Y=;
 b=oUU991tAnhimrCA6L2fL3ocIg3NrygNeWAcvoduh+K+UBdSYciHABJsJ0c45yqCHTgkxOZPReDllK8JoRwtBZhnqb8/GW8bGuYlrmNiDy9L+YpRmjwzq9zFK6/Qbpde7/HWRjMeFIBwCdfaYT6AWGE6kRByaAJ3Kkt1djdTVyFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3ec73f8f-0a91-46eb-9ea8-461fc6bac373@amd.com>
Date: Thu, 27 Feb 2025 19:29:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0230.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::26) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: e60f10e9-16a9-418d-f3c7-08dd576501e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTRuWEhER1NkU3MzS0o3RDZxbzVLRG5hcWk0eUg2K2JybEcxbW9xeGRlbDd0?=
 =?utf-8?B?anRqZ2NHQWR3SUlMSzNWMG1CZkZPTUdqYnFCdHVmalhTMTdyVjVCczJRRCt3?=
 =?utf-8?B?QTNnc0FLaklJb2FDQS93MVZPY1NhUW44TG9yQkdFc3BOVkdXSmFydThGQXZO?=
 =?utf-8?B?RDNkWVErZVd4VEt3M3ZGMnJlVkRaUUJyWjNXNW9PYmVaRVU3OVlPVTNXRFZr?=
 =?utf-8?B?RisvNkM1SEZuMmNVbFovM3FJTWlydWJsdE5QWFdGTFkrZmw0azF3dzRwM200?=
 =?utf-8?B?NUpWNXBlTFUwbENZK0NTMGdiTUV6aFlZRHhVeHc1c2t4OXgvT1lVUmN5Rktt?=
 =?utf-8?B?ZzliV2M4RG5hcHlNcEp5U21GZXFYTTdsVmZ2b2ZWNU9VMVFRd2swMlRPTWt1?=
 =?utf-8?B?ZHdGU1ZCakIxQmtaNnJneU5qWEJMZ0FyT3Z2a1diR29KdTRsSm9JQkh0aTdt?=
 =?utf-8?B?dWVBdGlJdUNBeTY3dGlCZGp6ZGpWZmF3K0hMTkhVdVBMd1hwUEVRNkRUdzha?=
 =?utf-8?B?V3JrMlFxSThlNkdvUnp4dlBMaGtvWDE4ZWl3OGVxR0FjQTdUaXFFUGJRb1pM?=
 =?utf-8?B?aHZaNVpGVkFoRGlvMWlONUQzNEJJV2dFY1BVcUE5UnVQTEoveVU3eEdLZnhy?=
 =?utf-8?B?UlBrSlVEWGlkdUZsaWlndjlwSTV6VlFVYTZPVGlTd3FScVBicGZDRGg5YmUx?=
 =?utf-8?B?ZkUvYnMyWmRNTDRQeFBCeEdHYUZWSUZWOXdCWndsaTc5b2RXR2YrUEFNMEpW?=
 =?utf-8?B?aDFmeC9rZ05yL2lsU0JFN01XVkVXWEJsRUNmUG9vRWhyQmNySzd5a2VSeTY1?=
 =?utf-8?B?ZlV5RUk1S2xrL3ZzRWxaL0RYdkNocktpT0FZeHh4OXo4WUZwdmNUa2dWUG1x?=
 =?utf-8?B?NGFTenBjQ1dtdVBocGVha05TNXpBNTBFWGp6bzhRak1OY2JFK0NqN2ZvZHpJ?=
 =?utf-8?B?OUVrVk9BRXRUMnVZRUtndGdZY1hKMzR2OG1Tc2I4a2orODJCZnM1WEhSQkRh?=
 =?utf-8?B?SlZmaFJvbE9xTEJCeDB1WE40dnJjUUlBSmxOaHYvZ1FkdXpVdDRacjRtc0Ix?=
 =?utf-8?B?dDYwTGFVcFFPenZyK05OMzVldGNscjdZMmJqVk1lMWFuSWJQemhTUm1qdTk5?=
 =?utf-8?B?d1hpQmNSQkk4KzBjZEtNanlsQllLY05qSXcySVdPUUQvZktaK0RQU3pKeGJa?=
 =?utf-8?B?SUt5b0hGcXY5bUNXenJNNkRpQkNiYmJuR3ZRZjBNeFVxcWRPWk83KzlqblN3?=
 =?utf-8?B?VTQ2TlZKQUVzWWFvMFJGV0hibjAxNm1LcVBOY1RrZVZzSXFOV09RRkxscHQx?=
 =?utf-8?B?aGNSaFZDSTFpNFU0VTJNNnFaVXJtM09DQjVBZ3BPdkxDNmJCOTlsWEcyTHBE?=
 =?utf-8?B?SkNwS29HTG1oRk95V3lXV0lvVnN4TnM1bmU0aHVwak5KemQvSGw5YkM0TEUw?=
 =?utf-8?B?dkJWTzR2SklKQll6NW1tYnJ0aURvTmxoUHlpaDE4b2p2Ti9YUGJTYklVY0Fx?=
 =?utf-8?B?UlRGQkNpMytES2dRK3crQXpGTVpEVWxvdDBsNFBPOEpMVGFsL0VPUVRUSTQy?=
 =?utf-8?B?K0JWam9rK2JUUGlPSTUvbm0vbzQ2cmltMVVSZGk2SnNvWW1ja2pWRFRyaG51?=
 =?utf-8?B?dzNLdzhzL3RkN1lPSE4wVWpZSTgyMjJmZlJwQTBKQWpTSkVGeGpVWjlJZkRa?=
 =?utf-8?B?dUw3QUY4dFNyWGJGOW9WRjNPemhWc1FMNXBGQmRvZWtHUEhNdlA4TTlWY2lF?=
 =?utf-8?B?TmRYc2JQaWxTaVNtREFjQ2JKaGM3VHBaZGV3NFV1Q050WHUrWGgzZU1pTDRR?=
 =?utf-8?B?a0UwYXdLTzQvdFNuRForQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExiK1FGMG02SnRjVTZlUUlRaVcrWXppRUk1bm56QUJ1R3hiUUZ5U09XcE5U?=
 =?utf-8?B?eWlrQkVCQmZpcm80Qzg0VHV2SitEYWVoRVFUNnJJMmZkeS85RzVEYjNVMmZG?=
 =?utf-8?B?QXNGd0U1YWFwR2N5OThMY082bFNtZS84S1BibUViOHpHZkw1NUlMM01HSXJl?=
 =?utf-8?B?NGd4cmMwU2tGejRzelVUd0NWYURNclhFMTRzajl3QitPaW1wVHRCV1dWN1JG?=
 =?utf-8?B?UWFmeVdpZ0hwNWV5akwwcEJJenZYY2ZNdGtLVi9YcjdwUmYxTCsza3FwL3B1?=
 =?utf-8?B?UU84L2RXV0lTVnVMSTFVemQ1UzVicWtCLzNNNElpSnM0SlNUaXM0UDdTTERQ?=
 =?utf-8?B?YnpYL0JpK3lRRVk5MGdEdUlzS3RRSXY0a0JxQjlCalZDRDREK2N0WG5KNWth?=
 =?utf-8?B?Q0lTU1RwcDVtc1VDWlVNcGgvOWM5QjV0N1ozeTErenBBdkR4U1drM3dtVkhR?=
 =?utf-8?B?S2hpZGNuNnRTOS9TN3MwaVFXTVNIeUpreUJYVm4xM25kN1QwUnRlb1VPa0NR?=
 =?utf-8?B?Wlgzd0oxVTNKcndVQjdnV09GTjFhSzVMeTRIOFphV0VoYmpscVlwNE02WVRF?=
 =?utf-8?B?UUo0cmc3OVAwY3NJbk15NkF6RDJFbkp2V0NHOVdpOXpqM0pHWldtSmgrQWlv?=
 =?utf-8?B?a25GNHNrblpDdy8xRVNjUUxDc2xBSFpMRDU3Y3gxSlA4bWJza1FvNjlvUjUx?=
 =?utf-8?B?djJ3bTNyYXA1d3ZyQmZzTktadGFEaGpwWXNuQnJUVnFweENxZlRlUTNGN29R?=
 =?utf-8?B?WWl2WENiZ0xOdGJESWcrams5ZFZVcFQvekdBc1dIYjZVTW5QanZTdUU0QlEr?=
 =?utf-8?B?SW44Vkkxa1pxQ3hQczVHK2twRUxQdGJialhrNGU2TGswZ29MRjhIYVJMaVE4?=
 =?utf-8?B?MSs1Vjh4UzhhTVEyMWh6ejN1TnNwVmlpbzZoSk5DN0RTRjBnNjNlRjA0Ukph?=
 =?utf-8?B?cXlkQUJWYmNPMGYzNkhqVm5qRkxQdEV1S3lXcGFOeUtMbnlheFJzUFFuU2do?=
 =?utf-8?B?MmZhR0ZUYlQyRXpjaWVRMUY4Y081ZTdiY2dRcGVJYmkxSXhtaUpwODZFdWxF?=
 =?utf-8?B?V2JqQzJ6dFdXNTlnMEVaZ0VBSDBvTnQyNmRvYks3MnBRSGRJUDAyZlVOWnow?=
 =?utf-8?B?ZGxmdEpKQm5wYy96SURvcjRJMTkyU1QrTnNEaCsyR2tRd09kM215SmJQRWFJ?=
 =?utf-8?B?NE1WN2VSTWZ2M2VaT25vdi9LaEh1RFg1blAyYWNRNmdYbjhxM0pjaDNiTDJk?=
 =?utf-8?B?VHBoemJaQ1A5TzhwRzVmSWJXdmJreWhUVk5ueGIvYTgrNHpFbDJESXFnUUpi?=
 =?utf-8?B?bHp5blIyWXBZMFJSSHZ3dEZEelVkV0IwWGE0cGNGUmczcEVtTGJPOFc5VTRM?=
 =?utf-8?B?bHZuRlZ1TDR2TldieVh0YndWbXgzZnNQbW8wbWN5Ukl3YzNsRndCaUoya3Ft?=
 =?utf-8?B?SFpHcjIrbURHdW5xTERCQ0RrekVrUHRlRkJvUkc3U25NaWlzaTZNamR5c1py?=
 =?utf-8?B?YkZPQjFmVXU5NXlrZEt6RmtoOFVNc2EzUDcrTlFMMjViNWgweTMzYmtKUWRJ?=
 =?utf-8?B?eUUzY0xoTDhmTmZ3TlRoWnB4T2NUOEhDcmYyV00vbXRqaC9OVUVFZDB0Tm1S?=
 =?utf-8?B?dFJHb0FmR2N0UDFSdkhZVWlnTzlXa0R0MU9lU255ekhwU21oWHhrQm05M3J2?=
 =?utf-8?B?c0lTQmtTR1RXelFBVTY1RjFRdVBpK09JMkt3MHRTRlBQUTlsMTNucXJXWjBW?=
 =?utf-8?B?RllMNWwvQ3M1dXlCQ1JxSWZDa3pEdE41V3dVejlxcGIzZWsxR2kySEZ0T1BD?=
 =?utf-8?B?UXYzM3QySUtkdEZzQytLKzJaMWFHbXVVVllsbk84aHE1bDRiRlBURmxHZjlD?=
 =?utf-8?B?UTF4WDVVazgyRDFyWWsxZEd0Q09oU25mcDI2SHJxOW4rcVV4eGcrWEtST280?=
 =?utf-8?B?KzhHSWJ5cVVXQkwzQ3EwMFlZVXExeElhcUlyOTUxVi8wYTRvclRyQjgyUkE0?=
 =?utf-8?B?WEFjUElLSDcxQ3lPbG9JcXBvblZMNHpDZDV3UThVV3dFMk9CYkNCMmQ3by9j?=
 =?utf-8?B?T0xGOTdyb3VDbkZVT2M2SmR3MkhCMURxNWlLdWlqZjVTR0IycVcweWtLL01O?=
 =?utf-8?Q?5kXtUHD/RRtqWqlt+y+lX2CA8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f10e9-16a9-418d-f3c7-08dd576501e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:29:09.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibayp/0DjyvYkMGwOGAVFWgWosKjuwiBS0gfATReY3VKUqwVO/cTvp20YYYWdQvUXT/8Nc9L64e5cAhwU0GaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745


On 27/02/2025 17:15, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

I have just some clarifications.

>
>> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> In the current patch, we have defined the requirements which are common for
>> all the commands.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
>> 0 for success in all the cases.
>> 2. Reworded the requirements so as to write them from Xen's perspective (not
>> domain's perspective).
>>
>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>> docs/fusa/reqs/index.rst                      |  2 +
>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>> 4 files changed, 134 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> new file mode 100644
>> index 0000000000..ffd883260c
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>> @@ -0,0 +1,55 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Hypercall
>> +=========
>> +
>> +Instruction
>> +-----------
>> +
>> +`XenSwdgn~arm64_hyp_instr~1`
>> +
>> +Description:
>> +Xen shall treat domain hypercall exception as hypercall requests.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Hypercall is one of the communication mechanism between Xen and domains.
>> +Domains use hypercalls for various requests to Xen.
>> +Domains use 'hvc' instruction to invoke hypercalls.
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Parameters
>> +----------
>> +
>> +`XenSwdgn~arm64_hyp_param~1`
>> +
>> +Description:
>> +Xen shall use x0 to read the first parameter, x1 for second parameter and so
>> +on, for domain hypercall requests.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_first_param~1`
>> + - `XenProd~version_hyp_second_param~1`
>> +
>> +Return value
>> +------------
>> +
>> +`XenSwdgn~arm64_ret_val~1`
>> +
>> +Description:
>> +Xen shall store the return value in x0 register.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_ret_val~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index 1088a51d52..d8683edce7 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -10,5 +10,7 @@ Requirements documentation
>>     market-reqs/reqs
>>     product-reqs/reqs
>>     product-reqs/arm64/reqs
>> +   product-reqs/version_hypercall
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>> +   design-reqs/arm64/hypercall
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 2d297ecc13..0e29fe5362 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -79,3 +79,19 @@ Comments:
>>
>> Needs:
>>   - XenProd
>> +
>> +Version hypercall
>> +-----------------
>> +
>> +`XenMkt~version_hypercall~1`
>> +
>> +Description:
>> +Xen shall provide an interface for the domains to retrieve Xen's version, type
>> +and compilation information.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..03221f70c3
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -0,0 +1,61 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version hypercall
>> +=================
>> +
>> +First Parameter
>> +---------------
>> +
>> +`XenProd~version_hyp_first_param~1`
>> +
>> +Description:
>> +Xen shall treat the first argument (as an integer) to denote the command number
>> +for the hypercall.
> You speak of argument here and parameter earlier.
> I would rephrase to: the first argument of an hypercall exception as the command number for the hypercall.

Ack

Should I do this everywhere ?

s/parameter/argument

That would make it consistent.

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Second Parameter
>> +----------------
>> +
>> +`XenProd~version_hyp_second_param~1`
>> +
>> +Description:
>> +Xen shall treat the second argument as a virtual address to buffer in domain's
>> +memory.
>> +
> Same here on argument vs parameter.
>
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Return Value
>> +------------
>> +
>> +`XenProd~version_hyp_ret_val~1`
>> +
>> +Description:
>> +In case the hypercall fails, Xen shall return one of the error codes defined
>> +in http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
> This is a very imprecise req as it does not states what can fail and what should be returned exactly.
> Do we want to be that generic ? if yes then this might be a requirement valid for any hypercall.

Yes, you are correct.

I am thinking of pushing this further up ie have this requirement at 
market level and leave it **unlinked** to any product requirement.

IOW, we don't need to validate each and every error code returned by the 
hypercall.

Or should we just drop this requirement ?

- Ayan

>
> Cheers
> Bertrand
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> \ No newline at end of file
>> -- 
>> 2.25.1
>>

