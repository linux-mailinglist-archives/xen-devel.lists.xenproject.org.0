Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E447A5DF6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604508.941921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiX4i-0001Cx-B0; Tue, 19 Sep 2023 09:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604508.941921; Tue, 19 Sep 2023 09:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiX4i-0001AK-86; Tue, 19 Sep 2023 09:31:20 +0000
Received: by outflank-mailman (input) for mailman id 604508;
 Tue, 19 Sep 2023 09:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiX4g-0001AB-DS
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:31:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c6154a-56cf-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 11:31:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 09:31:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 09:31:09 +0000
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
X-Inumbo-ID: 47c6154a-56cf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IenSkWzqWzgMs+sBNfQfzcKCw8PpxefwoJDSzSslH680ZaAVjI0U3yjtvgGiroPfhX801hZK6IdH05QG9kdJTmeaULxDwpFsF0zJU+Y08p7Bk7cAG5Tu1Sbzx7+O02pp3Vm+6GAVCjVuYn5pw8LbrxH7isUHj1fxYmz0sSHayLecGOuFLD/wht97+/Vutb+LeZ2wJaNCSlbtMonCWlJaUg87i/AW7CJu/SL8dHcAdMbDqjoxYmGJG1zZHc47p7UpVMGG0gRPZfGmhdFJpbZi6+lKP+mxd3gN33Q1uP0xI/5umQWrVRRZBFWYTjPsrA6EBi1ITUDxNUtxAKpXwiDrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6uBuk5YmbYUeu6Hlb5QPRFXW+1ftJIHeQHKCtKfk7o=;
 b=VEMLWTHen8A5QH1CGZch+zxG/MWVGZNnSTUNb/ICdIplce+ysRagYr8p44CIuqFUSLgAAlREYfeeddcXbzFLgTMNnLrrPPO0WkHe/Ul+EadCE9RJsAHfZljjQsh1BMz++qqhU9kWbnwvlrw+8HUrMsDav65WvT1BZUAMBp1yzdheY+fEwHeaihrYN8phoodQWTY7RQWVf870Z/67FDJJImkDvepGqAgxwedLd5rZI4Obc60eMoM/ul/5sPVNob9qOyJqhERyjmdA3alcifgJGni2M7BHpu9geQpnCQO4cOrxOF6QEIKu7S2yHlegt1FBkFVZ9nt8K0AFEaiMh6tUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6uBuk5YmbYUeu6Hlb5QPRFXW+1ftJIHeQHKCtKfk7o=;
 b=eym6lO1hIZubA0bxMOseFkE0YhrlkhvOAuhPZuuMJVs1LA29nQzKSPAHhwsccMG759efJ+7MfWHbjsyHx3XDnnB043w4MgeAnxh7wH7Pf/3WWJOPHS3VXckx+YwgKo8olEcj9hSpCPKJAmhJ0VcgQWqMmEPTxtl+1iZi0cx4clmyzuJ1HZM3drPa0qBN+ImsVwuWb1KtYlqbHtiGYahMhFib3BdTC7hynK2JjCqo2yY0o7Oa7XafiSfio210AQ9iv8XHZC9NTc2eR06VoyRqyH9YvhrucKWorgFloknNOuLcY+jOi/4QtCSp0xhl3IjcsKcu/o0zHjHvdWmdeShY0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d1e6916-b501-e133-1463-fc55e3eaf2c6@suse.com>
Date: Tue, 19 Sep 2023 11:31:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
 <ZQhoHZvk7tXfGI2g@MacBookPdeRoger>
 <b92b994c-a9cd-10c3-033b-3c1aa752fa8e@suse.com>
 <ZQh0KXX2yLewO3uV@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQh0KXX2yLewO3uV@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f17dd32-90a3-42a5-7531-08dbb8f3281a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndrQuWZPUotE09CBvLKpa0CLfc7ANRMICPxPXpHt5dkxemdMsvX7oBkvXK6PcfU5a/kJ6tjqma2p29vAc5bBiXeNIOxvibFEL4EHBlc1sxCphOmbpSuMrKX/hUjnZdAbC/fv+edmKjXhmEswY3pay+N5WYLgEcPh0uSTPS6P3XIcd+pWZDB9t6dw/xNOXuK36Vgeb683eLp2hQKB6ZPn1pBCTKQLnWWZ0hur95SiMpr4BAc4uknSIdztRigdYf5XljTJvTJl7sny7tRigZgtXEj4ccLAaNbQg7qiGWZUZ3pd7aiW8Cm63Dn4Gzy0aY2fc5re2EZ86/h6TP8g5WdIxcqowwp5vBK3kqdMXBE5z3wGEnE4di+nVXgWc4qtm8WhkEYb5IJoSKI/aK7PxOoDjei2rU/FdePvjahijJQNBT8CqsZDzJIHdxVlBatLR8V57RXwzUEVpH9aPSALbsljY4dJ+VkJv0NHje9K/kNYrSJN+TMquLuXmU7oYew25uROQ4ACopBRY0uNSGXnZW71KbD1bEDg24jfJi6iSKwt5uaUFJpLJWwZX4TC4NoJ2tqm3zQeesABdwz5Umkz7BX4wULcCFf3CioikhSL6vEgeZbHmVs4N3BdXwEYrvkUkrRbDAPd7SZCMBK3IClwXe+7LQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199024)(186009)(1800799009)(31686004)(36756003)(86362001)(31696002)(6916009)(66476007)(66556008)(66946007)(478600001)(41300700001)(8936002)(8676002)(316002)(54906003)(38100700002)(6512007)(6486002)(6506007)(2616005)(83380400001)(26005)(2906002)(4326008)(53546011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWhzVEVjSFY5SjJ5amUvNkNvN1I5THYyZXBJSkRMdzU4Mm5LelBjWWppRDRZ?=
 =?utf-8?B?R0cxNGNVMGtaeUNmZEJYYk5wOUdMdi9VQ2loQXBLQzl1L0pxZ1dYZ1BpUGFP?=
 =?utf-8?B?QnRLeHQzZHY2QnhFblBIRS9BRFR1dEdoTUZhZU50a2JNYVN2bnBoQWhjSk9r?=
 =?utf-8?B?ckQ5dDZ5ejFJMVNyaGRzN2xucFZTbGc2R09FV2crVC8yTDBEcVgrZlRrdGdu?=
 =?utf-8?B?WFI2bVBJdmJoa0NRNkM1cjhqMStvUUJEbHF5bEFZZHdCK0FLYVFEZlpuYlg0?=
 =?utf-8?B?cjBIUnNQZ3MxM2hSSE5teFpkdmNkd1JLSnNzK0VyY0g4blJQZkJJNFRzVG5x?=
 =?utf-8?B?czdsN2xOSTBBVHNZWmdPWUkwTk85OEFscDlBTEJsUVRTYkNvdUZCUXVzejRj?=
 =?utf-8?B?QnM0d3NnYjFFL1J3ZG9TQ2h5ZkQ0TUs0b0VmMHN1MG96RFVRcUxVOWVHUjY5?=
 =?utf-8?B?Tmpia2YzTk11TXdkVEdHZDZhWWpJZURBcXFuVHQxNGxIdUdFRDh6UUR6SitD?=
 =?utf-8?B?YXg1M2NOalB5aDh6a1JjODRqQmlzaW9tUHEwdVI1YVRJZ3YwdUNNcmNCK2dy?=
 =?utf-8?B?VFcyb2l5ME1DckR0eU5uQVhWNWRpT1pnbk5GWjBnd2dYTDZlalZNRVloS0pv?=
 =?utf-8?B?b2lrRVJwVmN1dUJJb3dPRmpPM0h6RUs0d2h2em1jZjdZN3NYdlFDYkYwQWtN?=
 =?utf-8?B?R3ZneUFlbFRkQTN3Q3VUc2ZJQnc0STdVcWhFUHhySFU0azBXcHZwdHh4OEY1?=
 =?utf-8?B?YWc3QUFYWXZBUE10Y1BZNVZHVVA4Q3BWSkRSakVhV0xjWUUwRzdaNGxEWXM5?=
 =?utf-8?B?NW9LVmlFaE1BN0JRQ2c0SFg5YUxqL3RHYmxodHNxRFRFVE12aS8xUkxMNVZa?=
 =?utf-8?B?YVZWcWNKeGhBT3RjSDNNM2pKOXY1VWQxNG10Ny9GMm9sWmRjSDJTMnErK1pi?=
 =?utf-8?B?VDZ4Y2lSZjl5VWZoMFVPM3liNWRpNTJ2d0dIT28zTW1IRzdQalYvVXpUK0l6?=
 =?utf-8?B?aGx5Zk53dm5xcnpKTVlSMzUwM0RHajBpOFN4TytKTzdNUyswRisrNnpoMVh3?=
 =?utf-8?B?OTN2eEZqeTF4WEQ5R2ZBMGN4ZzRqZFdQYkVYTTNzMFpCdnVKRC9XTzdsd3BW?=
 =?utf-8?B?cWFuYzNETWFiMjcwT3I4OVR0enFPaHRSZEN6Tk05ZU1pSDdBZHlFclQwOFVT?=
 =?utf-8?B?MDJLZmVGcmxMRWJzdmV1azdsdkp4OEE3RFNiMHFQaHJReE9ZZW9iRERZWVU5?=
 =?utf-8?B?elFPOUx0ejVHY0xRNkl5OXRCc0x0ZDc0ZS8vdXdEd2VMbG9NTzVZbnMzb3NW?=
 =?utf-8?B?S1hEamhYYm5uekFaMDNNWE9KcWVibmtZbms1VFBhWHc5U1N2SktsQ1htK2FE?=
 =?utf-8?B?bWg2aXMvaGUxUVJkYzR6c3N4MWcxRU5EZU5vcjRsTGYxTnVqeUhMTEhKdUxy?=
 =?utf-8?B?Z2FFbTV2Vk1ia0grN0RLa0Q1OCt1ZmZJTVFidGQwYWFCY2dlLzZ5cFBpRTRW?=
 =?utf-8?B?RmNwZWx2SHo3OHhHa3dqWFQ0TDZWc3crMDVmNHlSQWUwQ0c0UTY4RjNtSmhv?=
 =?utf-8?B?L01sZFhrWiszQ0RrWHl3ZmF1Ti9ySEtSTjRhek92bFNud0xFSGEyWktkM1hz?=
 =?utf-8?B?eXo0ejVVMkV5aGhnOEpyOWlyVE5OSW1wWTdxMjEydVBDc2JLMG5GNEpLVGl6?=
 =?utf-8?B?Z2RxaG9HZkl6NEl3ZmM3YjhBMGpUUU5VclpDZHg1Y1NvRlg3U1ovU2d3Yk96?=
 =?utf-8?B?Mm5INVZRUUlRTlRER3BjcDV3Zkx0VFhPMjg5ekdlZEwzK2dKMjhLazdKcXlw?=
 =?utf-8?B?b1VMb3VUcDV1d0ZDMGk4K2d2bXRJUWIrMzN0bUM2ZU5ic2FLYTdzamZ6TVNz?=
 =?utf-8?B?b2gyLzlteHFaL0QrdlNmZktwbnIxamJYeWY3UmlodHhvT0dmY0xRTjQwd0FJ?=
 =?utf-8?B?UE04emV6blc1bUpDSGRHNnRZaUZxNEluU2VOWkZZcGk0L1czb1Z4S0QxOVAy?=
 =?utf-8?B?TjF1dnBZUGZnSUtDSkV5cHBzM0cxSEk4ejU1ekt6eExzMHRWMzhXeml4dm42?=
 =?utf-8?B?bjVQcDQrUTArRkhSOUYwMjJEU0ZkcnNWYU45NkRBNzVQcVpxQlhRM2ZRejRB?=
 =?utf-8?Q?j5D5jZGo4Jee4zx4FvEQaGlLG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17dd32-90a3-42a5-7531-08dbb8f3281a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:31:09.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfLCaUKTV1rUaQppWRKvmWwYy9oCg85pIdj/4HFmaMKwzL8NXqbAle6RBxFRR9qmtHYqSycY58ZoOG8LDaMnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903

On 18.09.2023 18:00, Roger Pau Monné wrote:
> On Mon, Sep 18, 2023 at 05:44:47PM +0200, Jan Beulich wrote:
>> On 18.09.2023 17:09, Roger Pau Monné wrote:
>>> On Mon, Sep 18, 2023 at 02:26:51PM +0200, Jan Beulich wrote:
>>>> On 15.09.2023 09:43, Roger Pau Monne wrote:
>>>>> The current logic to chose the preferred reboot method is based on the mode Xen
>>>>> has been booted into, so if the box is booted from UEFI, the preferred reboot
>>>>> method will be to use the ResetSystem() run time service call.
>>>>>
>>>>> However, that method seems to be widely untested, and quite often leads to a
>>>>> result similar to:
>>>>>
>>>>> Hardware Dom0 shutdown: rebooting machine
>>>>> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
>>>>> CPU:    0
>>>>> RIP:    e008:[<0000000000000017>] 0000000000000017
>>>>> RFLAGS: 0000000000010202   CONTEXT: hypervisor
>>>>> [...]
>>>>> Xen call trace:
>>>>>    [<0000000000000017>] R 0000000000000017
>>>>>    [<ffff83207eff7b50>] S ffff83207eff7b50
>>>>>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>>>>>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>>>>>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>>>>>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>>>>>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>>>>>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>>>>>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
>>>>>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
>>>>>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>>>>>
>>>>> ****************************************
>>>>> Panic on CPU 0:
>>>>> FATAL TRAP: vector = 6 (invalid opcode)
>>>>> ****************************************
>>>>>
>>>>> Which in most cases does lead to a reboot, however that's unreliable.
>>>>>
>>>>> Change the default reboot preference to prefer ACPI over UEFI if available and
>>>>> not in reduced hardware mode.
>>>>>
>>>>> This is in line to what Linux does, so it's unlikely to cause issues on current
>>>>> and future hardware, since there's a much higher chance of vendors testing
>>>>> hardware with Linux rather than Xen.
>>>>
>>>> I certainly appreciate this as a goal. However, ...
>>>>
>>>>> Add a special case for one Acer model that does require being rebooted using
>>>>> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
>>>>
>>>> ... this is precisely what I'd like to avoid: Needing workarounds on spec-
>>>> conforming systems.
>>>
>>> I wouldn't call that platform spec-conforming when ACPI reboot doesn't
>>> work reliably on it either.  I haven't been able to find a wording on
>>> the UEFI specification that mandates using ResetSystem() in order to
>>> reset the platform.  I've only found this wording:
>>>
>>> "... then the UEFI OS Loader has taken control of the platform, and
>>> EFI will not regain control of the system until the platform is reset.
>>> One method of resetting the platform is through the EFI Runtime
>>> Service ResetSystem()."
>>>
>>> And this reads to me as a mere indication that one option is to use
>>> ResetSystem(), but that there are likely other platform specific reset
>>> methods that are suitable to be used for OSes and still be compliant
>>> with the UEFI spec.
>>
>> See my reference to ia64.
> 
> Right, I understand that on ia64 things might have been different, due
> to the platform lacking any other reboot method, but I don't see how
> this applies to x86 where there are other reboot methods.
> 
>> With ACPI_FADT_RESET_REGISTER not set, I don't
>> think there would have been any other non-custom reboot method there. So
>> while perhaps not mandated, it's still the designated abstraction layer.
> 
> Again the spec doesn't mention that ResetSystem() must be used, so
> while it would make sense if it was reliable, it clearly isn't.  In
> which case resorting to the more reliable method should always be
> preferred, specially if the spec is so lax as to call ResetSystem()
> "One method of resetting the platform".

That wording wasn't there in 1.02, but I can see it all the way back to
at least 2.1. So yes, you have a point. Yet - adding onto an earlier
remark of mine - EFI_RESET_NOTIFICATION_PROTOCOL is pretty useless if
use of ResetSystem() was optional.

Jan

