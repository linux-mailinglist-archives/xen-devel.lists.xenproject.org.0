Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732799A10DD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 19:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820221.1233686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1834-0008IO-SA; Wed, 16 Oct 2024 17:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820221.1233686; Wed, 16 Oct 2024 17:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1834-0008GM-OM; Wed, 16 Oct 2024 17:43:02 +0000
Received: by outflank-mailman (input) for mailman id 820221;
 Wed, 16 Oct 2024 17:43:01 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXVN=RM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t1833-0008GG-7y
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 17:43:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eba9faf-8be6-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 19:42:48 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 17:42:44 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 17:42:44 +0000
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
X-Inumbo-ID: 0eba9faf-8be6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edWhj7MBKobnpwVagVB9RjFAfwlqPZ9dw9aBR5cTjuT373vIKE+mIDoUyJbwZSSh0h4DHrrQZPyjwMvWsQnF966UWpgwf1YXJEHWO53IAeqlmtUtSIivfAm2e1hO1iNnK7MIodKR7NYknIILnJ4umB+5JVnI1BHeQp4HwCjmtOUvYg84CZ5nVMcQmsX5PjdtBiyBVeH9fUBwwqQVtR8mMQFDIqXLmPR1djtD7NCTUH3jbl1LsgCXjmTS8uy1kHnM6956SzAT1hcFy7vD2XPT0pT8ToOYBGjQjrnt9+AZPSCgTLpu4cq4lEn1Jr4EJT4g/gqZIl5/9So3zC0aFcQXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tiU8HcXMw+ObXoFqp4xcwDh6lxWzDgGzNIFyAG6ECA=;
 b=QRRTtYCHB0SK0wGmK4WiJIf3Arblks87NiUd8q4LT2yz414cCq0rRLbJNjux1viMpXAllPJVmoY9s1YhFI4yzUvv7Z06NsMtKz8iYcSpLAc/r3D9BBn2OCgFS2O49p5xncCRRe4mDX144oAtmdB/tDXOXSRhYWqlQ6mysVUnB68LY98FPx5atpJYiqHUNxMySu8fKJJQI24WXO1UEBZIj/q/qKYkEfh0SCgGQ655bvDYUO54VzZmggfV3vArdnLGFUhEUL3bfLyYcp3fbd7MfE/ktY3LBnuA/8jOul0v6wEar/6XHh46LzeSOjGQNKOLz3t1lPB5bOWbtrwQsU7ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tiU8HcXMw+ObXoFqp4xcwDh6lxWzDgGzNIFyAG6ECA=;
 b=xgokbgL6TB5mNdBqZVNcpvId9D3so3uE2U9ALjLgIIilRKVUF85TPNvDtni9QROjzyLc64ULrzMdYtA21slG9kDmTxopayAbe6Pbr+0/eEScIrR0BSCkuwmAkwdmG54GKIvdm6sxkbSdTiZjlerHqjrrRHRBji+elJT7Dp+mvJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a7e653d7-f0e5-44ee-b860-28e4bf64c7fd@amd.com>
Date: Wed, 16 Oct 2024 18:42:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
 <4BFB5897-2C7A-4A44-B9E9-01BB7940BFF7@arm.com>
 <3d0327bf-3f1c-44e6-9782-5715365b2253@amd.com>
 <b35816e4-9915-482f-a2e7-b8abacce77d8@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b35816e4-9915-482f-a2e7-b8abacce77d8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 02525e69-4f00-4c87-2e48-08dcee09f08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzJqSWhsUGh4VFZ6TkJLdzYyaFc0VkZlbkpqSzV6YUptNVZjVUtCSExGVmYx?=
 =?utf-8?B?OW1sL0NBRmY1aytsVnB6YVV0SW1pbllyVkNLY2x1MU9uZDNCbTVrQzBEOE1o?=
 =?utf-8?B?RVZDSFR3S01Ga3hMK1M4MW1TNWRDVE9Gb0gzenVqTXFmRHpyYWQrMkJBNElr?=
 =?utf-8?B?djZEbW5vbmprdGg4RmdZdng4OWRGeTdMTis5NlBhRVZYR09XVlhTVkVPN2d6?=
 =?utf-8?B?bkRUV1ZHWE11NitRTUtuMnk1RmUya3BQdzlrU1BVb29BMHVNQWd2T3Q5c3Vu?=
 =?utf-8?B?d0RZbE5BTkR3WFpwdHdUTFhqenpVK0o0Y1lsMmhnUGdYOTdZWFNBamNISlV4?=
 =?utf-8?B?K051UTZ3RmxNd09haGM2QTBZNis2TWR4L01CMTRKcE5sVENaZFFkSTR1TnFI?=
 =?utf-8?B?RFozSlozTHhZVWpSUjdmZlpFWU9NN0k2YXpVY2U1dmVWc3lGRHRjZkpWeTBI?=
 =?utf-8?B?U1hnNVYraGxIVktPcVVFcTZtQWpDb2xEdy9LRzRRb0ZXV2lCN0xYcThDWEhp?=
 =?utf-8?B?TjV0TDRnUm9QVUFsOUZZdGdLb0U1cmRRWnNYUkQwaVJ3d1N4a3NqdEowSDd2?=
 =?utf-8?B?VC83akpVQkxaY25tUE9od01lOHEwK1hjbjBMclRhdVJzR2pKaXZCSk9NZXdu?=
 =?utf-8?B?QTVURkRaVStiTERqa0N6NHZIVktzK25jOVU0V29VZlFmdHJLaERXdllQOTlB?=
 =?utf-8?B?aVJtem84OTRPU1NMWXNFMFZOM3EzMVd2MWNxcmxxc2hxS3lWemhZaktlekNX?=
 =?utf-8?B?WWp1b2VHdGg2eEFRU0RJdll5cmF2RWQ1N2QvS0h2M2tZUzBPeXlWUllXbHFJ?=
 =?utf-8?B?alBGZ0FPOGg5UEZ2Q2xMaW9UazlmS2VRTE9oTkZKQ1pnQkJaZFFrcU05NHB1?=
 =?utf-8?B?RWliRnB6OEg4ZyttNEpNUnJWUVNrTjFsZnNiQWRsNUNZYTZycUg0SXhKSmdw?=
 =?utf-8?B?UkdYb05VZzlEZDljVnN0WmN3dVRJYkJHTVplRktwTFFpSG0rNmt6L3dheXo4?=
 =?utf-8?B?SFRMZ2ZuMHpLcFpTS0NuTkgxdHVRcmJtVmJ2QW56VXNaQ3FmWHMxY0VGNkQ4?=
 =?utf-8?B?NjFzQ2N0NXl3anpFdlNIaklvWG91Tm9tQmo4REZnOHBvODd5NURkVmRnUEcx?=
 =?utf-8?B?SEhWQjYvTWJKUy9ORlErc3pzRWRpRjNZTFJuVlZYVjRiS3YrN3lJd1ZCNEFu?=
 =?utf-8?B?QjdMeXlMc2VheE03NDFEd1hkTCtQWTNxMTJRdWJwcWFUWjZtaDNmSzUxWGNX?=
 =?utf-8?B?eDc3bTBJOUhqaHcyUmp2SjRyWXdPM2syWHpsaHlBTlVDUitnVUNsMmUyalNJ?=
 =?utf-8?B?S1hhVXVCOTgwejJsa1B0ZWYxdzYxOWVON2Y1RHFSY3JXb0Zyd1d1RHNERlJS?=
 =?utf-8?B?QjhvRWd5SnlUQlhQcStFbkZPNk1EWEtqWkdWcnAyTnBRa0RjWHlrcUJ2a0lN?=
 =?utf-8?B?ajk4cW52aENWUUR3WUw5QzZsblBqZDBsc20rSGtSaW9xRXFVQ1V1ZHU4a1Qr?=
 =?utf-8?B?YlhVUUVjbGtReTFZSkFsUUgrVlNzN0c0Z1ZPZ01qSXlDaWF2bGdwbVNNRCty?=
 =?utf-8?B?ekwzZnkzWm1hY2plREQ2Y1BiREdycUVLZkdYdlBzMGx4YUNBdWcwYnBKOExi?=
 =?utf-8?B?Qk15a1pWRWpNdWJndlVpY1NUQ1pVTlFhb2l4N3cxY0NSeTN0alIvRWpHVm9E?=
 =?utf-8?B?cnlkV0RwM01iK1lxaW1KdVQ3dmYzV3hGSlNxaTRUZFVWa0Z6Sk9kOHlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnVwaXdST1pXQ0c1Qnc0dUZyOUk2Q2VWeTNzcDhYZ3Q3MEV2Q1JUd2dDcmxz?=
 =?utf-8?B?bFh0aWpWWmxJQXFnZG1IZENDMkZ0ZTJ0b0N4U0FKaGordUN0bjBRRDM1endU?=
 =?utf-8?B?anJjM2tQUGorTDU2NkNwSkpyN3dzZENHQTJoL0dzNWRGaVg4OGxnMUE5UE42?=
 =?utf-8?B?TDRncjlTUUtMWUQ5TlY2MlFCdjZYMnBDQmtHWFdBMTBiTXk5aE1Kc0lzQ3NT?=
 =?utf-8?B?ZlVYa1pIa3lObFlHajFVUzI1a3JRWHBzSVg0YWxTQnlsMnNibUdMNkhEWEND?=
 =?utf-8?B?U0JOM0tGWHNqL2JRSWRNTU9xYkR2VXhQOTBMRnR5QW1SOTIwU0xxY0pyQWdn?=
 =?utf-8?B?V0xLVThnZGZWUEV0dHpOL0dvVUo0NmtSUWtlbUVhS3poVjdieGtwWFA3eHhn?=
 =?utf-8?B?Zmk4TnN0OFlGR3FpVzJmWkFVU3RoeDlsa0hEd3kxMm1uMHBmdVltU3BFNkc3?=
 =?utf-8?B?c2ZXVDM5Tkp2amtYV1VwWlQyK0hJK1VJUVhoRU4wUGltWi85L0UyQUhuMExZ?=
 =?utf-8?B?bmhGRHN6Vy92bTBQMEcyWkthUXBmWUUwWHdMaDIvUW5IQnNmV0Y4eFlSWlAw?=
 =?utf-8?B?Y2c5eGFXa0wvenFxcXJKcVljOHNjb08wSEpmbzlRdGJUaVhVakF4OVc3c01k?=
 =?utf-8?B?ZDk1SEhXWlUxY2thZDJDTitqSEVBZkhGQnZtbytsQjNXUTVGRkVWbzFucE0r?=
 =?utf-8?B?eTM0ZnB3ZStPUjNEb3QyUFllTnRoMENEc0FXYWlMSTlzeGxPS29QQ0REbXJN?=
 =?utf-8?B?MVhFUEswYlZDNVRNMkxhUmlUVlh1by9UYTNqQ0lmemEzbjBZNVFpMDlQTGM0?=
 =?utf-8?B?aUZYL1NMczhMZ0hrVGZKdDdQS29hdDVMVFd5dGtJVjBWYUljajlPMlVwMlFp?=
 =?utf-8?B?ZEFZUGFkZ1dKNSs0aWpxUmpJUHVpY2ZnNHlTMW5yL2JLYTF5UmRTN3RUWFRW?=
 =?utf-8?B?dlVpZzN4UysxaXRyd1VYcno0SmZhUHVDaW9iUmMvMTNiSHA5OGF6WnRVRnBx?=
 =?utf-8?B?dFlzK2Fic0hyd2xsMUZTVEVmbE5RWEpLcFFGTzJEejlHSkhMbTJZcEpKQ21X?=
 =?utf-8?B?VlpjcnprRnQvWWRCdTZXUXUxSEp6L1AyZXNldE82Y0VHQjRJRDNKL0FqZGdV?=
 =?utf-8?B?VzgvcjBpSnM1YlJHd0RhbENzWUxMcVcvYTNDbEszTjBHNzUvdUNQdnZTTDdY?=
 =?utf-8?B?TmIybUFNVUh3amNoUk1MRnVHMDdCU3JqVTFKRUl6WWQ3QW50Y0xwRU1SUUxx?=
 =?utf-8?B?TmVTN1ora1Nwc1Y2Y3RvbG51cU9lZlZXKzVDTEpCOU5tMkFOVStnbktDRzZF?=
 =?utf-8?B?bVlUckFMT1ducW1tYVBhYUIyZVlyMm9sakpHR0dqTHBFL2VkMHZBSWZsejRa?=
 =?utf-8?B?c29mdG1OMlNjZWo0NkV3d3N5VjdlM2diejFVZUxNb1dnUjBYZjlFN29EM0tI?=
 =?utf-8?B?TU01Q2hlL0Mzd3VFQUhWU2hERmR5N0JsQkRrTmpQVzMzL1E2S0lvbm9xZERH?=
 =?utf-8?B?QVJ1d3ZDNTN0Mkh0N0JIbS8vVXhHb0tKS3oxTExuTGdFYUh5blZwd01UTkt4?=
 =?utf-8?B?aENuR3J5cERVMHV6aUE3bjVMUXNPSjh5dlIwNnVjb3dwa1pUUjVWc1pCaHUx?=
 =?utf-8?B?a096RkVNQTdlKzFsR1ExQ3Q0cStyRitCcFhDRjA0OUlEMHQrcWkrZ3ZiSW8w?=
 =?utf-8?B?Nzg5Q3p5U3JPOU5GU1lmTjMvSUpTeERFelU5UEVWdUhEY01wTEFnbG9YS3Rz?=
 =?utf-8?B?VnZ1WWpocERZRm00WVRyd0pMUVFpdkpYb0doVk82eE4wWjFwTi9OR2xuanR1?=
 =?utf-8?B?ZmRxaWJFU0Rpc0tpUEp4MWxXcVh2QUVDY1l1UDllWnh1QkdEMDRpSW1qSXJa?=
 =?utf-8?B?UWV6cC8rR05yWmZVMk1VRFVzUDUyZHRoZjNYeHJYVTZqWkJEYmg2SVBmTzdO?=
 =?utf-8?B?eEpOUGd1cGtpTlFlM1dvWmY5b01td3owUWFRQjFCQ2FJZWpNbmVRYjVoWFQ3?=
 =?utf-8?B?NzRnejdvN3REb0NmbkZvOXNGRWV6ZVYrb2U5OVVrMWUxY3hjTkkxSDdMQXVa?=
 =?utf-8?B?OGsvSlBIVy9zZ2J3ZVNvbTZDSnVLQlJLSWtBZWhYUlBoeDJlM2xIRUFWQUp4?=
 =?utf-8?Q?ET5WsjcLCM+oKhz7vNMDar226?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02525e69-4f00-4c87-2e48-08dcee09f08e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 17:42:44.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AF4DXqXFY4hhFi2kqOgKry0D7wTRS7lAtCcGpDu9jV5C10F1N+xLUTJSvy3fTq0OxqY3zJxOWy3hYo+flN71YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716


On 15/10/2024 17:51, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 15/10/2024 16:56, Ayan Kumar Halder wrote:
>>
>> On 14/10/2024 20:03, Luca Fancellu wrote:
>>> Hi Ayan,
>> Hi Luca,
>>>
>>>
>>>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>>>> b/xen/arch/arm/arm64/mpu/ head.S
>>>> new file mode 100644
>>>> index 0000000000..4a21bc815c
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>>> @@ -0,0 +1,130 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Start-of-day code for an Armv8-R MPU system.
>>>> + */
>>>> +
>>>> +#include <asm/mm.h>
>>>> +#include <asm/arm64/mpu/sysregs.h>
>>>> +
>>>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>> NIT alignment
>> Ack
>>>
>>>> +#define REGION_DATA_PRBAR 0x32    /* SH=11 AP=00 XN=10 */
>>>> +
>>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>>> +
>>>> +/*
>>>> + * Macro to prepare and set a EL2 MPU memory region.
>>>> + * We will also create an according MPU memory region entry, which
>>>> + * is a structure of pr_t,  in table \prmap.
>>>> + *
>>>> + * Inputs:
>>>> + * sel:         region selector
>>>> + * base:        reg storing base address (should be page-aligned)
>>>> + * limit:       reg storing limit address
>>>> + * prbar:       store computed PRBAR_EL2 value
>>>> + * prlar:       store computed PRLAR_EL2 value
>>>> + * maxcount:    maximum number of EL2 regions supported
>>>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>>> specified it will be
>>>> + *              REGION_DATA_PRBAR
>>>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>>> specified it will be
>>>> + *              REGION_NORMAL_PRLAR
>>>> + */
>>>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, 
>>>> maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>>> +
>>>> +    /* Check if the number of regions exceeded the count specified 
>>>> in MPUIR_EL2 */
>>>> +    add   \sel, \sel, #1
>>> I think there is an issue adding 1 here, because the very first 
>>> region we are going to fill will be the 1st even if we intended the 
>>> 0th.
>>> Probably moving this one at the end will fix the issue
>>
>> We are also using 'sel' to compare against the maximum number of 
>> regions supported. So, for the first region it needs to be 1 
>> otherwise there is a risk of comparing 0 (ie first region) with 0 
>> (max supported regions).
>>
>> May be what I can do is ...
>>
>>>
>>>> +    cmp   \sel, \maxcount
>>>> +    bgt   fail
>>>> +
>>>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>>> +    and   \base, \base, #MPU_REGION_MASK
>>>> +    mov   \prbar, #\attr_prbar
>>>> +    orr   \prbar, \prbar, \base
>>>> +
>>>> +    /* Limit address should be inclusive */
>>>> +    sub   \limit, \limit, #1
>>>> +    and   \limit, \limit, #MPU_REGION_MASK
>>>> +    mov   \prlar, #\attr_prlar
>>>> +    orr   \prlar, \prlar, \limit
>>>> +
>>
>> /* Regions should start from 0 */
>>
>> sub     \sel, \sel, #1
>
> I didn't review the full patch yet. But couldn't we use ``bge``? This 
> would cover "maxcount == 0" and avoid to increment and then decrement 
> \sel.

Oh yes. My bad , I missed this.

- Ayan


