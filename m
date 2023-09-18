Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75307A4D02
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 17:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604123.941349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiGQg-00078r-6q; Mon, 18 Sep 2023 15:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604123.941349; Mon, 18 Sep 2023 15:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiGQg-00077A-3v; Mon, 18 Sep 2023 15:44:54 +0000
Received: by outflank-mailman (input) for mailman id 604123;
 Mon, 18 Sep 2023 15:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiGQf-000774-8O
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 15:44:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e21a9ad-563a-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 17:44:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7224.eurprd04.prod.outlook.com (2603:10a6:10:1a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 15:44:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 15:44:49 +0000
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
X-Inumbo-ID: 4e21a9ad-563a-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPmbylSIAxW4KicHTBrvlCmNkzWSlrGOpRcMC4oTu7bgAZguA0S2KsoJ0s3XxpO4w5F9ueC69dhVKOf0DVJNzfbKyHWMBvl5foPVL8DXIx3nU4eceolZV4yAWVeeXexwTqqt+vAeMORUFhFRuGavKc0vVLYYO7h25NMD19AfCCfYiS094NPf5PNSx6Zw3JSNi6JTjukB8Vo5j0rqq7Hx+2+HZOArvk4CiOfJjnKdGTZdyexMqFkIkZzD1GQQ3eEP5IqyDyXOsKfTHUh/uJ4ONJbreG58BCQqIp/jWWsQsgAFYyEY5owY1m8mJvpu88zkYAN4xzMxLNLTErSRlfzdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwQWdkpy7cNM015vpddtJN7XF1HvDUm2RuF2Y4NOvko=;
 b=CVcEP4+fatC6vTA5ksjARuwraP4Isintkrc+WLYizTtUX2xNgiy5Om/VvFAFp9TP3y/FrFHpsir7PitD6OqSNDpko9xfo8je/ZF66psArRa0ayT6ghEJN+tSXAVb5QkbovJhC5RsxGAIM068YCWEHyZ7lzK5LVLw7lZmTCOlR6aTnE9eaHO/MDffeAZ8zcSVtfPfPqQ8rWgEbOZG0uUHADk62FtVTytIoYC933qpX2N2STl/2jwvD2OORXjcdWLIPFI1GCBMqp5lI3tpOQOaYRNJ2uNU9zX1yhOy8pxy1Z64hGG8qSBy8yNzi09YK/CymLOeizd12lHebuomYbDZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwQWdkpy7cNM015vpddtJN7XF1HvDUm2RuF2Y4NOvko=;
 b=gSKfthuW/0+WiILKfNiqSn7Qol2A59stt6I+kE3JJ2E7cGURYSyt32UKFFWVBedvwrAJ6gVnho+o3fpT8w/RDLO7NFnDb0IXvp0LGmPalnHEwO0IJPx8LTKeBvvVJnC0rC+9zgWNRDzMRyqBG5b82CwsdQlAzuyF7iVjzrh/yVJOI+IyUiR4kjjTnZYiEJa93Phb1YGU5sSDRY0NE9gpD654WqKV9mMPwFoTK7Rb771L9NBf3lRvu3R1mpjSeon99lRXicQ5qCMa2DL1f+R9KLVeRJHExK235dLLvWy0jHrYCHS4mBWMp030yE6FUAVOi2jmXDQNzYigUCrQZ1Dm1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b92b994c-a9cd-10c3-033b-3c1aa752fa8e@suse.com>
Date: Mon, 18 Sep 2023 17:44:47 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQhoHZvk7tXfGI2g@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cbf5f9-3341-4317-bb13-08dbb85e310e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NvBz3Os1ZvWnWUe2BQJE4KPip/dCh/AfUMjpq7TNp5JCPvBUHx2QsVIydPz80NlJSGgO2rjj3Wo96Kl349Oq2aMCbjuKwHu5iUv8ZyosxPxaD7YcjeM96z4zIBuYJNjvART/+HdnuWPZPTlTeQ3kXbtM8u8oGO8ZnY6Rl9nz42CIkvhSWvRZaKfifIPzwN8goVEQOJJU95Zuj7YhZjKsptiYV9wyAq+POwfN+y+EjxyuhIx7X4/JdJ5ADtI44Q8weuyB3oM2i1qiuaP5XK7BMKArpwcwTBGPs+LMBo1Zaa1Dg4LMF/c+Z5WrrPJPH2ovUi6uD78UmEogmvykMuqsnQXLr4uH/NyRoeZ6353WQpMSN9/D1pzs2O+n1YwHd30veHBvszDptkHQ4GotpGlfu9J3wy8WI5q5H7nD94/tntQi/mTsK8K1Cudf12DUO5Tl9/yNtP6LNXH52Kle2j1ftvgktD9bGo5D3h68af/+8csnK7Bf9vYyQa0Oiq7EelqnO0GgrJRw8xFCjKcrHKSscNj+oMfeyL4agn+hrbnmFMrt83S6CVdkArVLuyjMKEhRFGj+F3YrEyAAUlOJoFm/nRRvNkE8yr8O8OOhQbyzyzt+8+cDJjcsQlSi3kSaPMbW2pMsOETrV8qpqEBY5zO1Dw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(1800799009)(451199024)(186009)(6512007)(53546011)(6486002)(6506007)(83380400001)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(66556008)(66946007)(54906003)(6916009)(66476007)(41300700001)(316002)(2906002)(5660300002)(4326008)(8676002)(8936002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHVvbVZ6eStRelJyOU1lTlo2eHJ5NVpINnN0aVMzQ0pycGtwY1VSUFEyVDVU?=
 =?utf-8?B?eUpwTnNKL1RoN1ZNMXh6MnExeXdNeVVLdDhJWS91SGlmRVVva3doTzJCTngv?=
 =?utf-8?B?dDZaQ2REdk83S2ViQm0zU2VCMW03d2RqQzlUVTRQTGRDYTRwTXZ4Qmc0T2JV?=
 =?utf-8?B?UDJKRmRDTHBRRUttdzd6ZWNQQkNEVFExV2pQN1ltVFU1eEFJOEo1TEl3STZM?=
 =?utf-8?B?bGpqMnhadVQrRm9sTlZSUmNmV3dlNmN5R05yTUxsdUdmNFBLZUJZa2FKczha?=
 =?utf-8?B?R0g2Z0hRMmRLTWdGV3NRZmJvS0hHYVdBcG8yUFZSRTJkdjd2WkJFa0xwRDBp?=
 =?utf-8?B?bk9kdVkzTmtBdjQwZ2F6UHVXQjg3OC93cmhndUlGUkJuNnVZbktFeHZzU1Bo?=
 =?utf-8?B?QVdDMHRYY3ZWYUM0eWFHc09Hb2l3aGlLZXBPQVprTWNkWjZhenRFU3A1Tld4?=
 =?utf-8?B?a3RWazY3MCtCS3lSRFViTmpIdEVIYmlDTWwwaG16aEJTZE1MTE14TmxvcHNw?=
 =?utf-8?B?ZDFUSzlFR3I5SCsxdDViS1J3SzkyWkdqdXRpRURRK0hocmhnYUpCbU9TaDB2?=
 =?utf-8?B?NDk5OWljZldQRVNNakI3Ync4UHRQbVZFYXBVMUtrekhDVUo5WUgvRkdTN1ZF?=
 =?utf-8?B?VGI1RFZYQ2JHNzVFaHQyZTFYY3dydHVLRmdvTFAvV0xMeUpneUZPcVMyNW1v?=
 =?utf-8?B?U0xza0RJVGl4YUdRWUFab2UxU3oyWDFnN0tneGJia1YzYmpZSHZmdHBMY3R3?=
 =?utf-8?B?TVZ0djVhTi80MUtueFRpS1pJc1loM3VFWmVvOXUyTzdTZDJLSWlnVUNsR3Yv?=
 =?utf-8?B?dFZrWWlEbi9UWksyNU91MUNFOGxVSDAweGtJWFZIRDhSU3o4OWhIWU5hT2lr?=
 =?utf-8?B?T2t5eUhrOFFSMU1Jc1JOOUlOSGtXN3oveTI5OXJFUnFOU1R4d1VRZkdUbGdD?=
 =?utf-8?B?dzVtYjVrR3o5d2F4RkN6NWgzdVQ3VjZxc0Q3d2owbWFsQlBqVkVZbVI1bHpi?=
 =?utf-8?B?T2NqTng4QUowRG00SXUxVnc3VFdXbnd4RUo5ZnBvaUhKQmhzNXRwQjdTb2FJ?=
 =?utf-8?B?cTdicFZmZTl6ZGJGVFVjcksxclRTdmdRaTB5STlKeGVCeEYxVE5HR21kTEdv?=
 =?utf-8?B?MG9ORjZRWGZKWDZhTVpVT014ajFmMk54WTlkeSsrQXk3SHFickk3dkd1UHNT?=
 =?utf-8?B?Mk5XQWtpckZCTjBtNVN2QlA1MndWRTg2RENLYVZpZGJvUUlxekJycjJqTEgx?=
 =?utf-8?B?eE91d1FwYU5NNUl6eUNwSFFCV0ZTYmY0Qlg4MGV1UmdpVDBUcENZaWs1ZG5a?=
 =?utf-8?B?RzczTVk5SHpzVkZFTHN6Qk10WVN1THdhdUY5VGl5N1phWHc4dCtDVDczQmM5?=
 =?utf-8?B?eG45VkNkbHEvSncyZzhJM21HV2hzcER5QlF2ZDAwZy9GS1dLZFhBdHlhVFhM?=
 =?utf-8?B?T2o3QzA5NUNyMTVwSGQrUVgvdHZXanZlVWRDMEJDT3V4cy9rZEJiTUp4QXQ5?=
 =?utf-8?B?VW5TL3hFMk9mZjhGNVlwVWpBbXZqZ3M5NW9kUlppclhEV29RSUU0NWVqTEJH?=
 =?utf-8?B?RHdzaDFIc2NKMWdmUlhTaHJVSlo1eG5rWGJIUldrWnBXMUZkcXdwOUlsL2pl?=
 =?utf-8?B?OFgxUXUwUGN1NTNCZ2psSUFKalo5NFg4VjU2bzBIczQ1azZEVWN4bi9YbGpa?=
 =?utf-8?B?bzUzWGdpdnRFeWJraHU1b3lkWGJRSlRXNmh3Q0JnazhocmhGaEpnb2ltM3FV?=
 =?utf-8?B?UE9lbVdiR2VGWG9rL1RCZForNE1id1VIR0dYdUsyS0lrQlFxUVZ0K1NsSGhu?=
 =?utf-8?B?eVVjd3B6Y1I4Vm91dVNvNEVVWmlSL1lMSHJxcWp3M2JWRnNjSXFya24rYjNG?=
 =?utf-8?B?N1RlWnFOQUJnSDhmNi9tVDZ2T2lGQUJ3bE9NQjZpbmtLcE1HUWg5dC9LbkxK?=
 =?utf-8?B?QmF4WDJoSGV5VVdvNlRNQW9YVFYwQ0F4SVE2WHkrak9rbHlBeWtlUFhsMG51?=
 =?utf-8?B?YjJkUndXcENwZ2lzbjNpNVk2bUhZajFUa0hZejZONW1wS0VqL0x6QmtvQ05T?=
 =?utf-8?B?ZGZKeU1YOEJLbFcxUk4xYk9ndlFaS1hBb2tRdDhGemVBZjNmS2dSajdZbUxC?=
 =?utf-8?Q?F/yeYdy0lX2CdSksjfbrKbO72?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cbf5f9-3341-4317-bb13-08dbb85e310e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:44:49.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7QU4TpyHfqpLrlxDF5AaasZEicqWLn5vQ2jFBiZhmHwqml6b7ovKHmP3nG19h9HDSP7T0QjVGLUzEdhHIv3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7224

On 18.09.2023 17:09, Roger Pau Monné wrote:
> On Mon, Sep 18, 2023 at 02:26:51PM +0200, Jan Beulich wrote:
>> On 15.09.2023 09:43, Roger Pau Monne wrote:
>>> The current logic to chose the preferred reboot method is based on the mode Xen
>>> has been booted into, so if the box is booted from UEFI, the preferred reboot
>>> method will be to use the ResetSystem() run time service call.
>>>
>>> However, that method seems to be widely untested, and quite often leads to a
>>> result similar to:
>>>
>>> Hardware Dom0 shutdown: rebooting machine
>>> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
>>> CPU:    0
>>> RIP:    e008:[<0000000000000017>] 0000000000000017
>>> RFLAGS: 0000000000010202   CONTEXT: hypervisor
>>> [...]
>>> Xen call trace:
>>>    [<0000000000000017>] R 0000000000000017
>>>    [<ffff83207eff7b50>] S ffff83207eff7b50
>>>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>>>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>>>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>>>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>>>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>>>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>>>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
>>>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
>>>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>>>
>>> ****************************************
>>> Panic on CPU 0:
>>> FATAL TRAP: vector = 6 (invalid opcode)
>>> ****************************************
>>>
>>> Which in most cases does lead to a reboot, however that's unreliable.
>>>
>>> Change the default reboot preference to prefer ACPI over UEFI if available and
>>> not in reduced hardware mode.
>>>
>>> This is in line to what Linux does, so it's unlikely to cause issues on current
>>> and future hardware, since there's a much higher chance of vendors testing
>>> hardware with Linux rather than Xen.
>>
>> I certainly appreciate this as a goal. However, ...
>>
>>> Add a special case for one Acer model that does require being rebooted using
>>> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
>>
>> ... this is precisely what I'd like to avoid: Needing workarounds on spec-
>> conforming systems.
> 
> I wouldn't call that platform spec-conforming when ACPI reboot doesn't
> work reliably on it either.  I haven't been able to find a wording on
> the UEFI specification that mandates using ResetSystem() in order to
> reset the platform.  I've only found this wording:
> 
> "... then the UEFI OS Loader has taken control of the platform, and
> EFI will not regain control of the system until the platform is reset.
> One method of resetting the platform is through the EFI Runtime
> Service ResetSystem()."
> 
> And this reads to me as a mere indication that one option is to use
> ResetSystem(), but that there are likely other platform specific reset
> methods that are suitable to be used for OSes and still be compliant
> with the UEFI spec.

See my reference to ia64. With ACPI_FADT_RESET_REGISTER not set, I don't
think there would have been any other non-custom reboot method there. So
while perhaps not mandated, it's still the designated abstraction layer.

>>> --- a/xen/arch/x86/shutdown.c
>>> +++ b/xen/arch/x86/shutdown.c
>>> @@ -150,19 +150,20 @@ static void default_reboot_type(void)
>>>  
>>>      if ( xen_guest )
>>>          reboot_type = BOOT_XEN;
>>> +    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
>>> +        reboot_type = BOOT_ACPI;
>>>      else if ( efi_enabled(EFI_RS) )
>>>          reboot_type = BOOT_EFI;
>>> -    else if ( acpi_disabled )
>>> -        reboot_type = BOOT_KBD;
>>>      else
>>> -        reboot_type = BOOT_ACPI;
>>> +        reboot_type = BOOT_KBD;
>>>  }
>>>  
>>>  static int __init cf_check override_reboot(const struct dmi_system_id *d)
>>>  {
>>>      enum reboot_type type = (long)d->driver_data;
>>>  
>>> -    if ( type == BOOT_ACPI && acpi_disabled )
>>> +    if ( (type == BOOT_ACPI && acpi_disabled) ||
>>> +         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
>>>          type = BOOT_KBD;
>>
>> I guess I don't follow this adjustment: Why would we fall back to KBD
>> first thing? Wouldn't it make sense to try ACPI first if EFI cannot
>> be used?
> 
> This is IMO a weird corner case, we have a explicit request to use one
> reboot method, but we cannot do so because the component is disabled.
> I've assumed that falling back to KBD was the safest option.
> 
> For example if we have to explicitly reboot using UEFI it's likely
> because ACPI (the proposed default method) is not suitable, and hence
> falling back to ACPI here won't help.

Perhaps, but falling back to KBD isn't necessarily going to work either.
And it might well be that on said Acer no reboot method would actually
yield consistent behavior, except for ResetSystem(). The fallback logic
here as well as that in machine_restart() is all based on guesswork
anyway.

Jan

