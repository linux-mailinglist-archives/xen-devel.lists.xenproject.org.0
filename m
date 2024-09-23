Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A350A97E86B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801749.1211743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfDi-0002T9-Eh; Mon, 23 Sep 2024 09:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801749.1211743; Mon, 23 Sep 2024 09:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfDi-0002R3-Bn; Mon, 23 Sep 2024 09:19:02 +0000
Received: by outflank-mailman (input) for mailman id 801749;
 Mon, 23 Sep 2024 09:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=449k=QV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ssfDg-0002Qx-DL
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:19:00 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:200a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca03976-798c-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 11:18:59 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 09:18:53 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 09:18:53 +0000
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
X-Inumbo-ID: dca03976-798c-11ef-a0b9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irkrviZXF+1C+NQnxItbMB0EHDLlC4FpvnaGfipq0hxTx6uoq/k5cL3lHIg2GyKSL3rK3pM689uDZCiQWK3J4Df+kXFxIRbTaifgR+9Y0ki9zUtvP0MqGLbDW6AyjJAPOBTFlgj6WKZnEG/pOqoMB1fag/jUvHzx5s938WfvMoyYEvxH5MozFwUJrV8D399JEdMJWw12fUx+CJ0eB2nnQta0VA2UKezts7m3WwOqUTjDI1JB7w3DG/o2UB+brfllUKpfsYiUUc/6qk1GXxudU2eI4cJTXi7f28qWlB8cctllFu/TspOFeCIjxqEJLZn0akw4xX90LpfCFKuu2H+a1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COfEIfJopv5CcWYxqHp1ZXSJa7PzztiBgmATqHX/k0o=;
 b=HTRIZhDW9tPdm30nGP5yEJ0J6qcyfCtYV8GWa0uMxyiz3BcVNRy4onbCmUfxHVrnVjPNO6Z+9Rz/Vs7tTNuVmui5ejpEY9NLDeg3M2ztGnliEZVL0suvIGp281CVox4/d4DzTdf0C96qwPEIZTGrUiFw36XzH6dPFQn+DyzrF3Grv+8vZx5qtrAo5oxZ0lDh0eZi/53xj14LZ+8CxCid3E61iAHrfjG3I/kIQp8rnl0/syXiaJ/17oFHkMMq7OIPNWVtfZpbLRJDrknkmgTanNRVQKWZk++GAdV5T+AVKFICJKfL+HauOKpFuDMCjZWlMpBqn9o8ybwy+Qskq8Qi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COfEIfJopv5CcWYxqHp1ZXSJa7PzztiBgmATqHX/k0o=;
 b=zEThI8uSfW8/u1Sm2UkNbwh6JCgs3fr1k9xoZkMZJIsec9fKyjP6hiq7Hqa91yFCzPiJ3cMk4kFDLd0/sDMakjlEdBuxdix8gSBcclw+FSSYcQhIRnJ36UBCWmBGy4nsN7fC5U2VuSGAxuxZHjRFt6HdiblGswnS4LznEeyzAJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8bdaf581-800f-4d00-b11f-ce051ba18f09@amd.com>
Date: Mon, 23 Sep 2024 10:18:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-2-ayan.kumar.halder@amd.com>
 <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 7943d40d-2ed4-454f-4212-08dcdbb0be09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RCthL3I3T2VFbm9LdythVFpQTTdSdnhhVzc3bDcxVENzWkFvU1RyaVhWdGpz?=
 =?utf-8?B?UlZMU2lVNVRHTFZRNm1RNjEyNG0zQnVuRWtzUDJaZkVMKzVhN1Z1STJDWjBO?=
 =?utf-8?B?RVdJeWplN1A3bWNzbGRUSnUzZjN4NTdHQmFkdGI4amZ1ZkFBaXVINnZiVHVt?=
 =?utf-8?B?cHhqeUJJb2xlaWdscmtLYXFlc2NjZ0dESCtEaVNZK2ZKSDdJbEtQUFF6OTUz?=
 =?utf-8?B?aldMMVlTUlBsNE1pVm9QNGVvYnlYVElVM0RlTGNYdVJYUHFPVGRTTklhYjhj?=
 =?utf-8?B?UXoyQVpwbXcydGNGSjZlNktHR0xvRm1hVzFvZEZWRmczczlEdWZpNG1JZnRz?=
 =?utf-8?B?ZVMrQ2M3eGJiSzV4UHFJVC9Yc1gydVVmQUZkMnJGS2VBQW84NTJtcmZwMVp1?=
 =?utf-8?B?ZjVzdjdXM3JVQ0dJZk45YktXQlhFTlk2WHJnZUZkcnJKODUrcFBBbHNQMGhP?=
 =?utf-8?B?NFAyV2Zqb2RuT21SdFRFQnpMc2VkbnVFT1dyU3hNWE13Q3l4TktUSGN4RWlO?=
 =?utf-8?B?OHdCS3JxR0hTNGNqUE54cUJGaDJXOGYxZ2FmOXQycDNIazcxcEhTWFZKcmUw?=
 =?utf-8?B?OE81MVF5R3lJakNnT3I4VFJ0RG55U1NyK1ZyWDQ5STVpN1FHN0R1bzF4TjhU?=
 =?utf-8?B?K1BoN2dkYzJVYkFQZHduNngyVVU3bjlDalo1Zm14Q2dJcVdtemRRMUs4cTJM?=
 =?utf-8?B?bjkwS0RBQWFqNWtWSDVEU3ZxZ25mVm8xYmVYK3krTjFDeVJwRzBnSXNCZnBL?=
 =?utf-8?B?NjkveGdKT1BLdmdoM3lhOEtzK2pvYXQwQTZWN1hXMVJOMVRXdVdtOGhpeWp2?=
 =?utf-8?B?d0duNXBkMHQvVzR1bmJsUElhN0VQdzVQLzBaZWtpSDlFTnpjTjNIWm82WFJm?=
 =?utf-8?B?Qy9TRWc1Yk8vT3pBZGtrQ3lCcDFIMVpPOVR2NjhuaWxRVnl5NDdlUmdJR1BJ?=
 =?utf-8?B?UW1ENzkwaDFUWHB0cUYwR0xvMi94ZjRzZ2RxNmhxcmJxOVFRUEFIUzkxZ2FI?=
 =?utf-8?B?RXRWM1VuSzlzbVVNT1FpRzFCU2gxcktVc1Fzbi8xeFBuM2g1STgvN0tyaG1E?=
 =?utf-8?B?YzhrQmF1bmRYMlZrTWlnQS9hR2FkeVpTbklKUWhLM0sycllXbVVieDh2VXVL?=
 =?utf-8?B?NC8yb0dJenNoK3dUZHVZWTR0bkpSc1piMlErdkZTVXNYMk5NVzltWmRFNkNR?=
 =?utf-8?B?d2FWcDFyb2ZlS2RhSFhGN3p3WUdsODlqWTJmNnB0ck8wM1piZGljY09xbVZG?=
 =?utf-8?B?MXF5NndBWXZ4eXdJYjY1RlQ2dWJseHpQbWxObWYwekxyZ3NJVno5Vkh0cDZO?=
 =?utf-8?B?UUJtOHlsRm5YY0xqcUVhamx2R2xFNzB4eUViYmMyS1YvNDZkTUwrRHpkbjdR?=
 =?utf-8?B?U0JaWkhkK09mbWtwT01tTVRRNnVPNWlpbnBXMXRieFI1VGh0ZU5KVUtadXBm?=
 =?utf-8?B?cHBoK1dmRDlVd0o1eDFWSFRiSWg1THlEWVorUXJLeVp2ZGRJdEdLOTlKRWZa?=
 =?utf-8?B?dHB3OXBNeDBTZHhzSENjM3dtWkViVlFPczdHSzNoc2tPS1hJZkY0WjRIZXRP?=
 =?utf-8?B?NktYRWg0RkZQUUlVRTY0ZzRlVU5Hb1ZiNk14a08rZldjbzZUWUtuaG5kZyth?=
 =?utf-8?B?VjB4NVNaNnB1RFA5R0pkaXdITytjY0ZpcXU4MS91b1VlUk1WYnRSUDFDcjZt?=
 =?utf-8?B?NUY3b2E5ZzB6K09PTzVxQi9Bd3plczV5Z2w2VDdnemFrcWZ3ODMvekN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTlFTG5YV05jZTJDWktsenJsZnlSdVpuemR3MWlzTkd4RURXMUt1QWNhUXUz?=
 =?utf-8?B?bHRjL2JIc0pOOEZicFZpUjJJdCtSZU1wWlAzanBZcjFmNzZwUzBYbHB6UzdF?=
 =?utf-8?B?YldMV3NJUW4vYjRUVk12WW1Na1VXa05sVU16b3cvQlkxU2dhM2tZcXFqWHpS?=
 =?utf-8?B?b1hRd1FZMEp5WlZ3ZXd2Z281a2ZvMEhHUkhFZ0I2ekd1ODNMcER2RnVTSHV1?=
 =?utf-8?B?elpyTWFkRWYvdjIzbFVMTUNaRWY1b3pEVTFOamxZOVpvaUc0aU5wS1lsNGlX?=
 =?utf-8?B?ZG5ZbXIrdWJNK1Y4NmhieUhkNml5VlpSYUs2UHhUeVozZWF0ak56RUNTS3I1?=
 =?utf-8?B?QUxhRWo5eHFtWHJZRmJPSXhINzVTbXMrcW00eFRJS3Y4MEJZaUtlWVVPc3JN?=
 =?utf-8?B?ZitzaXZlTWhSa2psckVOS0YrcW1lRzR4ZHlkWjZFazYyT2hpMlowUG9JS1VD?=
 =?utf-8?B?dlBtTlRyVWpSYWNEbndBbVl1Z2pHRDJlM2QwMVdncC84MTFkbVhtVFI0a2Iv?=
 =?utf-8?B?OWpoaFdNb1krVkVxTFRyV29aOHVDSjBQdnBkOVQwUndOZEpobk5IamQ2RFBp?=
 =?utf-8?B?VlkvK21RZ3NrSDBJbEFCRFRxRTRIa3p5MjJYTG1BWkE0NGwweGcyZWgydGhq?=
 =?utf-8?B?MjBsZGhscGVTRXFVdVBRV29IUVpNblEyMEZHeWZ4U2NqYmtPTGNxSXhJdjNz?=
 =?utf-8?B?NGNVQ1ptelBlZUhmS1BlMjJqSVRmWjhYNjBibjY4OHFVeXMyNkNjamkvMlU2?=
 =?utf-8?B?TjRCc090L09zN3QvVDg4TjhweTlxVlVMUzFJMVhKbWlJMTNTbW1vQ2xnWWc4?=
 =?utf-8?B?Q0pSL0FzbTc2Ui95bkxhR2w4MUNtOGw3R2J2YTJ0QWZOUzV5c1ZmTnF1aGsx?=
 =?utf-8?B?R3BhNjZacUh3aTgzNDltUUtkVzU0ak5oek1IMzc2MzVpWi9GUklvdU5IWlFP?=
 =?utf-8?B?cmR5UW9kbml0dTM2bEQwSGdkQUU2Wkd0dHpYeWZUcXBRNTdMdi9qQXd6K21Y?=
 =?utf-8?B?RXV4MFdUNTZDblV1QVlIYTFYNUpPS2M4WEJNSU9pVVl1VGEzUUQrc2w3VlRF?=
 =?utf-8?B?aEJaS201TUIwbHlCcmhxTDRrT3V3V25Ga050R2pndGxpZmJVaXg2SlFjbjcv?=
 =?utf-8?B?RC9uV09lRlhaTnQ5a2tZa1J3Mm5PVDcxWmIxQXR5MG5XU0RiQWV0VjZxdlBC?=
 =?utf-8?B?dUxBVk9iQ2cvRDFPemtnM1NwU3BSbHBqMVRMOExuWjVoQXArRExFZTV0K21p?=
 =?utf-8?B?WFpMVW5xRjJTbGFuSUZac0VxanBLWEZSQTU1OEdUcUR1TGpxeHVOQnRkc3Jz?=
 =?utf-8?B?Y3YxK3dEOFQwMS9xdDlyZlJySlJDTklSbGJGNlpIZHdZYmptN1dZTFRYWTNi?=
 =?utf-8?B?MTRtRGtsZHVIRTBwclk1b2ZIMG9wS1h4bHRwSGNlZ05UaU50L3FEaUZrNFFl?=
 =?utf-8?B?b2pvejViS1k5MVhnTVFFRGs2c2s2NGI3OHJzS05CNjgzRXdkQnhBZFljZ1pt?=
 =?utf-8?B?OGt5djJoeVAzNllFejk5MXp2ZDNnSjhmMWczWmFLQVJLNHpiWFdHYzdDaGFh?=
 =?utf-8?B?eExoQS9Fd3BQMmNmQ2dXWWlmeXhKckphQU9LMVZWbmhMSkFQRktlT1JYSXIw?=
 =?utf-8?B?OEtzanFrSU9aQ2tyZ2hNN0JiMkdWeDhJcEtzRjR0NUUrcm85RkhKUWlNTSty?=
 =?utf-8?B?OGwzZ1pVY1MvVnlNdW8yT213dVozQ0NGQS93NlVsMEhpdlFhV1BkSVQva0JG?=
 =?utf-8?B?TTdZdWxFdlhiNGladDNScEg3R0lrRGsrMWdkOUk0aXlFVkN2aDl1M05wMSti?=
 =?utf-8?B?VjNnMVBLRFdpc29zUjNJUno5Q200ekZrU3JFSDljOVZmY3lJTkV5OGNIdExV?=
 =?utf-8?B?WU9wckt5NThHOURMVzRIQzNFbDE5K2Mzb1ZNMjNkZThHR2VuUndidGM3VnRo?=
 =?utf-8?B?MDFjMmx6b05rcXZwOHZtVUs2QjBhWHg3bzNzc3hyRE1YUHRObGpIbHFNN2pO?=
 =?utf-8?B?b0FmQW9TTFJBNXR6VEJidkNYUnNmYlFsZUlFY1dIYmZ5WFJDQ3ZaZldpdzU0?=
 =?utf-8?B?Rit6MHZYc3N4Q1J1bU0yNzJJdlJpNE44SUV0eUM0bGtPN3d5eU9oY3c3dXhJ?=
 =?utf-8?Q?hrAvI5RgDFhK4SVvMdIEYvTny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7943d40d-2ed4-454f-4212-08dcdbb0be09
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 09:18:52.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orLxBp8/OBWY7rvBdLcpNh8mPuAVfi3azF6A+pls7V82fBWC/AjkpM1RzGUemV8liVXrvNRaM9hpCfEdb1d0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962


On 19/09/2024 13:33, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 18/09/2024 19:50, Ayan Kumar Halder wrote:
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>>
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> MPU is now gated by UNSUPPORTED.
>>
>> Updated SUPPORT.md to state that the support for MPU is experimental.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Reworded the help messages.
>> 2. Updated Support.md.
>>
>>   SUPPORT.md                     |  1 +
>>   xen/arch/arm/Kconfig           | 16 +++++++++++++++-
>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>   3 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 23dd7e6424..3f6d788a43 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -40,6 +40,7 @@ supported in this document.
>>         Status, Xen in AArch64 mode: Supported
>>       Status, Xen in AArch32 mode: Tech Preview
>> +    Status, Xen with MPU: Experimental
>>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>>   diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 323c967361..e881f5ba57 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -58,10 +58,24 @@ config PADDR_BITS
>>       default 40 if ARM_PA_BITS_40
>>       default 48 if ARM_64
>>   +choice
>> +    prompt "Memory management system"
>> +    default MMU if ARM
>> +    help
>> +      User can choose between the different forms of memory 
>> management system.
>> +
>>   config MMU
>> -    def_bool y
>> +    bool "MMU"
>>       select HAS_PMAP
>>       select HAS_VMAP
>> +    help
>> +      Select it if you plan to run Xen on A-profile Armv7+
>> +
>> +config MPU
>> +    bool "MPU" if UNSUPPORTED
>> +    help
>> +      Memory protection unit is supported on some Armv8-R systems 
>> (UNSUPPORTED).
>
> I am a bit confused with this statement. Does this mean that not all 
> Armv8-R supports MPU? Or are you trying to say that not all of them 
> support EL2?

My bad. All Armv8-R system supports MPU at EL2 (as Bertrand correctly 
pointed out). Some of them (eg R82) supports both MMU and MPU at EL1. 
While others (eg R52) supports only MPU at EL1.

I should rewrite it as

"Memory protection unit is supported on Armv8-R systems (UNSUPPORTED)."

- Ayan

>
> If the former, we probably want to check pretty early during boot that 
> the an MPU is present *and* we have enough regions.
>
>> +endchoice
>>     source "arch/Kconfig"
>>   diff --git a/xen/arch/arm/platforms/Kconfig 
>> b/xen/arch/arm/platforms/Kconfig
>> index 76f7e76b1b..02322c259c 100644
>> --- a/xen/arch/arm/platforms/Kconfig
>> +++ b/xen/arch/arm/platforms/Kconfig
>> @@ -1,5 +1,5 @@
>>   choice
>> -    prompt "Platform Support"
>> +    prompt "Platform Support" if MMU
>>       default ALL_PLAT
>>       help
>>       Choose which hardware platform to enable in Xen.
>
> Cheers,
>

