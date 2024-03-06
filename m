Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F087425D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 23:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689537.1074625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzNp-0006vP-MY; Wed, 06 Mar 2024 22:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689537.1074625; Wed, 06 Mar 2024 22:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzNp-0006sN-JL; Wed, 06 Mar 2024 22:05:05 +0000
Received: by outflank-mailman (input) for mailman id 689537;
 Wed, 06 Mar 2024 22:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYTB=KM=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rhzNo-0006sH-SS
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 22:05:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93cea14b-dc05-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 23:05:02 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 22:04:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 22:04:57 +0000
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
X-Inumbo-ID: 93cea14b-dc05-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip1jrczsOLPsvsrj5u2d782eoljZdoFc80qAsc1hPCA3yP/TorirlmkbbNiFs1OSq/FWGVcaoEp1yJUi1ItD/2bu8LjId1yXdbu6OeH9AkcHUlE0GAwiy20XBuPz2fzuHuEw2jQlo/CKdqpGnWd8Rz5aHmLHgyjbOfvC9oo+4NZhX8KcYAA6ZC8VPDiokGyqp5qPGpu4VrlIoYESfzzoneb1BpitHeiocizAXOvd/YW4yW1E+i9eJOi+lTwe2NDFBsM5NXXFpjlTh8hEF+QTAEnXQGbx3o6JG7/Ez/nPYeMBKZlfEHZE43YjEnLOx9DJZYMO+/Un02aMax4z0m3k4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNKQ2BtUCgV7nAkl0lAO02dCSCRS3Cbf7EoQOeptuC8=;
 b=HxaPcL1FB+nKEI/WdREuBhamt4+z46e9QT1JEE5/7Iciv1qVx1b/SG6o7fMCtscDRYhRFede8YAAjVMnT/uNz4CjD+HuYm0qmx6eF/HFpFqm4Gw15CQctB4wZeDMVa5HAaXwDmdblhRu9x7fecpyBODuEdW/ZFl601gw36GPOXDp2/QNbK4jUVIaZmd8TGEhehRuHUThyefRmrwxxJ1E3LSQyISgiN1GuYDrcpJAdgrHVRqVa9QoBRWOXDrlHFWwdw8RI5kAMdkiEL1dPgT1rsKHaqHU41TizhxRSAOfngvIgXFg/wAHE/9V6JgHSKeLJccAffoH3KGQTbAVEQZRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNKQ2BtUCgV7nAkl0lAO02dCSCRS3Cbf7EoQOeptuC8=;
 b=04Xaath8yK5kGwIN18b1m0Ww6hZ0JOjPri4aKxNVbPUbKggUTEPWv6lZVEbjL/SvvmusFbehyfkNl7hU6K5bVmhIcTe753f2xkVnTcsXABKd2Sopx33cQea+StYa7Eo6CU5Dct/42xyNI1rBkk6AzBSydMqFCHxwu6Apj4HXTss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a5240965-2b66-4cfe-aa6f-b4f0b36c1e88@amd.com>
Date: Wed, 6 Mar 2024 16:04:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
 <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
 <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
 <CAKm-UmZm1d8Ehusoh5HNOST+0Dek7+vLQSKbVduz40BdHueiDA@mail.gmail.com>
 <7c2f9983-a0b5-41f7-81cb-f196787f3dfb@amd.com>
 <CAKm-UmaHA5Xgmneqv9zgEUN1eejqB_1aZ4Kd5MxWttoyVLThwA@mail.gmail.com>
 <2a609713-3eec-438e-80af-c1dfcfe598c4@amd.com> <ZejgsTDBmsnmKeiG@mail-itl>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZejgsTDBmsnmKeiG@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:806:d0::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc09eb4-8383-4ea3-240d-08dc3e29762c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPrbTWUtXCXTqo4z8x6ZyVhrlno1V7ts7GbAoQ61yHP1LN9+wRR9lk+yDtZ14mWjqONFaMR5vwTY/lJSuKO9XcL0Ykfr5Qmqy51sMfiQMo4dLM+QX6lOVd/KLEAZZCUyw5llu1UtN8ceKHOiMZUnbpHyT8ulbP+3cRlv9zdmwBxgVxQqc+DT98XZKmR1ksJcvAGlEgQVX4xxmLcaAAPv0ZXR7Li1QECycAAmV2se2q+zCh1hv35q9H0nKh16qb7ACfC+N78JjXoXbJogUpGe0Awy4uttJC+N09yGEKrt608VDNUQ6qYj5rcZEodCz51OwiBRwloxDBaE64hi+XfeYlznU54mGkHBOQTHJBx7C7C9/cdX9z4Yt9oqtRMHwuqkWT4Fa0C9lQ+/8Q/BUCnCpMqWymHEGKT3V1h4eL5KTUF/+CBhIi0HzFW8oNJ1OTllzcz3WmpwMoUA2GjmKbB79fA9dhnEkFeyj4JI8k3DHGoyB+oeyYYDJRU8j3BGXe/wVBfIhs2/LxFzfT408pLHGQr2+T7IAC7HkZBR3ABFx3dvDFFDBDxi54ijRRsrJ4+IyWLZz0WR1xfJYKZV+rCcOIgEKHdfn3ObwvAW7P3z8mo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHM5dy9CSnE4N1hTZHg4ZTA2VmJTcFltQUp5ZVArS2EzODJkOHg4elRxNTVv?=
 =?utf-8?B?VFIzRkxsM3Jzems2Ryt0bHNzajEzYUlaSzZ3OHQ4UmRVZDM0TzdIZVJ3bkZo?=
 =?utf-8?B?NGVHeFUzUXBZQVlCalhaTUkrQXF0YkJNY1o4OERpM0xHa25wb2lKaGdMY29s?=
 =?utf-8?B?aUR4UVBmQzZwaDE5OUM1V2pZM0FYRFVQdW5tdCtBV3JFeExTMHIzOXl6OUR3?=
 =?utf-8?B?NkwyWHBhTTBkeGtyMVU1dVpUQ0ZFWUtZOXh2VzNsRTVtOXRjZFExRWhoY0hm?=
 =?utf-8?B?cUVSYkVESTVDamVkaE1ZOXpZanpsVkNueThmUWhYbDIzTGFaR1BSTURzMWpZ?=
 =?utf-8?B?SmVBQWR3UVUwWEV0enJjYkN4OFB4VUlvRHF4VGRxNHkyV3E2WGs0b3RQbmxn?=
 =?utf-8?B?OGpwRmFXQW9pazFER2RDOEM0SlEraElaZUlNU1BXa0tjd2pTUHUzeCtKTmMv?=
 =?utf-8?B?L2s0cVZkektNd3VzY0lCK2NFZGxBSm9IdEViN0JPSWtGNlpZVS9GTGlwdFZS?=
 =?utf-8?B?S3N1NzN0MUQxUnV0RHJHOWFDaUx5Z0NxVXNNTXZQdWI4L3gxUU5pRWU5NEZW?=
 =?utf-8?B?SGxCZXFGRng1V09xcjZGWHFvMDRCMTZWelBmRnZhSGJvd1owdWFqOUZpYjJC?=
 =?utf-8?B?N09YbDduZkhxeDZ0WXc2NlRZRm95dFBVRHVWNXFGTFliMmpramZNazlmK2NE?=
 =?utf-8?B?ci9zUXA5YmhJbDB1bTUwVFFzK01RZEIrTDRHU2thNGlzREE5NmxvL0xpdThh?=
 =?utf-8?B?N3VmYmFmQ0xaRU1FVmt6T3lvQkVkS3k4dGNzSjhpTmNwSGlaakFoWTlOUElp?=
 =?utf-8?B?UlB0eXZlWndPS3dZQU5GcW5LTnhVYkJsMWpIMWlJQmY2Z0JnYzl1M0RKbndD?=
 =?utf-8?B?N0MyQ2l5a0dWaklxemVCTGJNQklvMkR3ZUxsdFdOeEVTOFZGcWFqRFo5QjQ0?=
 =?utf-8?B?a1hiMDNJeit6aHZvbmJpaEI5a24vU1RsdWZUZHRTL0hGV1RYR2N1Q2V4QlpU?=
 =?utf-8?B?VEJiRUhTR2ZRT1NjY1BsdzBXWUo1Wmgvamczak41dVdOait6QmkrUHdxMjNx?=
 =?utf-8?B?RkRFWVFPdzJIVEZSanVnUW5BU3pKZUVvUCtqQXRHdnU5VHhPNXNWdDFYYVFl?=
 =?utf-8?B?N1FLQXBRU0J2RWU0TEI4cWNQemlrK3JGR0ttNVFZMkt0cERaMHhGaWhqdHdC?=
 =?utf-8?B?SDVSd2VFQUhqbEVjaElYOEg2QVdoSVVBcE1IQU9nZ0NQcTgyZ2ZOdm8wamhx?=
 =?utf-8?B?UG9XRy9SRHQ2RDhmU2tYYWFIeXNDWGFlZ0lidnc5NnVYVG05Y3Q4UFE5RjRy?=
 =?utf-8?B?cEdGbDV2bnA1bFdWQngvUFRuUjM2amZsL2pDb00xdHlTaTlkRFhuaXF4cWMz?=
 =?utf-8?B?OUdudlhXaEpaL1lRWm9FeTVoWjJqNmpSVkpYM1ZuVkVLa1VWTVlzSmhPeVg4?=
 =?utf-8?B?cU4yak1QZnhzeVgrbXhHcHByVGdRQ1hLVjF2L1g5Ry9YOUNtYktIQlNSaUhZ?=
 =?utf-8?B?dWdLZkRtTjlrWFNxZmhSemhRTWhDOVROc2NkbHozRnA2cXQ2WUdERkQzbW13?=
 =?utf-8?B?WXNOT3hXTXM5OHVYWW1Vb3NrWWNJMEtoeGdGSTRSV05xYXVHOHRpRmgyMUMr?=
 =?utf-8?B?Z3B4RkM5WlF0ZU1tbUJlaittby9QbGN3c20xUHdZN3pPaHhnNzZ6WGY4VldK?=
 =?utf-8?B?c1IvUUM5MVd4U1MwRHlBaXlUZXhzdSt5dTg2OVZiQ2l0WDk4SS94S0x3aVho?=
 =?utf-8?B?czQvdkdEOFcwaG1ES2prWGdRUmpNODBYRDZzbUVJWDNIVmpneFN4cHdjT0Ft?=
 =?utf-8?B?WDNHMyt2ZFdtUmlsOWZnZVJLc1UrNXZNTEx6R0MxeW9pcWxGb3FxMmNhQUow?=
 =?utf-8?B?dlVqM3EwQS93S3NpMEpkRHcvZWpNVmFWT0VkbWNrTlpLMzZnVWRTYmJXOER0?=
 =?utf-8?B?RFVqcGIvTTYvSUlKNEFLQW1XRDVzUXV4NitsbVdlZFllV2JvZTlOMS9XalVO?=
 =?utf-8?B?Z0xsdVIzNVppSUV4bVRrUjZzWmtWZFE2cTEzV0g4ZFFSc3BVSlZIejFFbkE5?=
 =?utf-8?B?YlJKL1FzWnBkRjZzT1NiTHpIcmJEMUlqbkp3Uk9ZU09LaWNjUW5UN1FsN2pt?=
 =?utf-8?Q?S0Xhwerre4Zg2m4IgOYN5v5kt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc09eb4-8383-4ea3-240d-08dc3e29762c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 22:04:57.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZiJu7SgXKIa7C6clVuFjyJRzEEH+zCao+TNjRXcDcLl/njEwi7zn3wHSaMnzfSsgfJA3NB2bnzIJ2eZSIucGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278

On 3/6/2024 15:31, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 06, 2024 at 02:37:20PM -0600, Mario Limonciello wrote:
>> On 3/6/2024 14:34, Sébastien Chaumat wrote:
>>>
>>>
>>> Le mer. 6 mars 2024 à 19:51, Mario Limonciello
>>> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a écrit :
>>>
>>>      On 3/6/2024 12:49, Sébastien Chaumat wrote:
>>>       >
>>>       >
>>>       > Le mer. 6 mars 2024 à 19:08, Mario Limonciello
>>>       > <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>
>>>      <mailto:mario.limonciello@amd.com
>>>      <mailto:mario.limonciello@amd.com>>> a écrit :
>>>       >
>>>       >     On 3/6/2024 12:05, Sébastien Chaumat wrote:
>>>       >      >
>>>       >      >
>>>       >      > Le mer. 6 mars 2024 à 18:33, Mario Limonciello
>>>       >      > <mario.limonciello@amd.com
>>>       >      >     Also; I'd be really interested to hear what happens with
>>>       >     s2idle with
>>>       >      >     Xen
>>>       >      >     now (if it works).
>>>       >      >
>>>       >      >
>>>       >      > suspend to RAM now works :)
>>>       >
>>>       >     Do you see /sys/power/suspend_stats/last_hw_sleep increasing
>>>      with your
>>>       >     suspend cycle?
>>>       >
>>>       >
>>>       > No,  it does not increase (0).
>>>       >
>>>
>>>      OK, then in that case I suggest you run
>>>      https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py <https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py>
>>>      in the hypervisor to find out what's wrong.
>>>
>>>
>>> It fails with xen (not bare metal) during the prerequisite tests :
>>>
>>
>> The script might need some modifications for tests that don't make sense in
>> the context of Xen.
>>
>>> ✅ GPIO driver `pinctrl_amd` available
>>> Traceback (most recent call last):
>>>     File "/home/sch/Downloads/amd_s2idle.py", line 2447, in <module>
>>>       test = app.prerequisites()
>>>              ^^^^^^^^^^^^^^^^^^^
>>>     File "/home/sch/Downloads/amd_s2idle.py", line 1938, in prerequisites
>>>       if not check():
>>>              ^^^^^^^
>>>     File "/home/sch/Downloads/amd_s2idle.py", line 826, in check_msr
>>>       val = read_msr(reg, 0)
>>>             ^^^^^^^^^^^^^^^^
>>>     File "/home/sch/Downloads/amd_s2idle.py", line 813, in read_msr
>>>       val = struct.unpack("Q", os.read(f, 8))[0]
>>>                                ^^^^^^^^^^^^^
>>> OSError: [Errno 5] Input/output error
>>>
>>> Last line in the log is :
>>> 2024-03-06 21:29:33,146 DEBUG: Lockdown: [none] integrity confidentiality
>>>
>>
>> Do you have userspace MSR support compiled in?  If not; that could explain
>> that problem.  But it's very unlikely you changed the MSRs.
>> For the purpose of finding where the suspend problem is, I'd comment out
>> that specific check for now.
> 
> The s2idle isn't supported in Xen yet. Only S3 is. In fact, I have some
> work-in-progress patches for that, I may try testing them on this
> system.
> 

OK; the "most important parts" I want to point out that are on bare 
metal and might not be obvious:
  * Infra from drivers/acpi/x86/s2idle.c
  * amd-pmc driver
  * USB4 driver (thunderbolt.ko)
  * NVME needs to use "simple suspend"

FYI - I'm going to be MIA for a while on personal leave starting this 
weekend, please keep me on CC on your progress and if you need help when 
I get back from my leave I'll comment on it.

