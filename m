Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3124631C29
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446452.702038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2bQ-0006tW-G2; Mon, 21 Nov 2022 08:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446452.702038; Mon, 21 Nov 2022 08:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox2bQ-0006qb-Cc; Mon, 21 Nov 2022 08:56:32 +0000
Received: by outflank-mailman (input) for mailman id 446452;
 Mon, 21 Nov 2022 08:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox2bP-0006qV-4v
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 08:56:31 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6359e3ae-697a-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 09:56:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8773.eurprd04.prod.outlook.com (2603:10a6:10:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 21 Nov
 2022 08:56:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 08:56:26 +0000
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
X-Inumbo-ID: 6359e3ae-697a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAYtz5GmFPeJX8NfmmqNjVbI1bSAZiQqPpvwnx4E2C6VXtMALcjce2M0lhg1U3kqS9hqufXe/4jLXOFl/zOZyBhRNvbiuQSJc+chArgGUdgIc7pOGJ9VVa1X3aOnyEK7rD20RePyfTj9icJVnLVuQRuUccf/FJQYywWZgIQq6OTiKg6wsuyALHCEUxe4NJmFYeHjtt73ekD7d086CdQMMnCtYjWFUbftaxP6gQ0n5pk7o/83PTIxvuVEj/rwPQUAxzkxMV79r4lUDTrNKKTRRE+qSoI8S0byaXMvtuG/uRfUSTSjBE2XB6VRxzqA8KeTCnDtHep4/MXY+EFUOzgExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SUCM6cVplr9ffzTzczI0ukj1ZqakVMnRlVhKFc90rY=;
 b=iqi4IyuRrW/PhOu+asOZD6NYv2jH6RF/3ohrrX9u7ifEXqYWDg2me1exyDDgsJT+WvGHicplP8+bRXE23njIHfzSeTN2MeaqBDDNvoyaGItatPKCmc83kTGkB5zakXiPm2oAhxVlCpffeyK2A0XjGL8nxZwb2Owx4ZPwAECjU3udiS4phBwt+wrXnWP0DSW+EL7rGVzGEvf7eIsGDdsMLDVlYi+bHFHbNur/wAbMpfZMZlYgpy5d2Rrno0gAPhPzsGVVJng4Wusf3j+NwBOkPAyYwjvuybybWEmkuaC+7jfY14kwv4dJAQR928KxG9rj4XQweyXKzCthocvY9MZudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SUCM6cVplr9ffzTzczI0ukj1ZqakVMnRlVhKFc90rY=;
 b=S5x02++1BxXa7PF0oDOKs0HpR4Y53MNEMUafwLZfTjJY5Q6aN3a9lWDPDBCwv9rhZ9sBIjnAqjf+VviMbltFBitPwV3pgUJ6HnQcOnYt+HrFAqRh7AG+GkNcofZKc+NapFb+G/k/QVIhLV6GHhz501ANUtv5w8ZwVNgWF6kGJL68UtPFlJ7IP4x6bu4zPO7acq91SDdL7/oK/IgwZby088o/1TmjtQarUYtSvchJbwQ1GxhcnT6XSBfUC6Ntmi1d2yjkJ/g1+vtlQfv9/nGLJdTqAzyO6AHwzUP6TxNk7hVHowbZL6w/cIEst/JRXyP2Qo8QHaeOthin7ype/SV5Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
Date: Mon, 21 Nov 2022 09:56:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 73141bf2-b115-49c4-49d0-08dacb9e4611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/M+BAIVc7cd2GjN2ZRCHI44mqgOUISRsdeXUT1DBhoHzIOSgrFoesqGqu28epKIKSHsaTDJKriiGa44mkMydCio0+aZDf2C/vsGYTiW0YSHDN1Gjmy+6OwnNM1R2MR4zoNpzecgh18LPiEPj2ytUIlYtkRwTDgmuxh+8//2+r0haRHGurQ86E80XDqi3k4oeys4rIvZMqP3T0yJzPUa4YSVmKe9SpZIusGHMm18KkxBlS8ATHYqnJOtajHCHqybr14kuxqCSmpu13wjEC8LXuE31Cd51RRr5V82v35p17RHjAnqhAq/o6RYE0+FASxPBcu/8yFfbnfQ/TJU92dtMb3SnimwS1lkfnFGVryKTPT0xG3S9656CiULvKLgxbgmFrWfoOHyS7k7NH+2QX4lk8cRyWz5/M0dOwoV1LaXPSqp3GfOfY0+fFHQjK4hPZIaWNkROkOnXvnCBX4AlMpqIVxKE2iNpd4Klar9tooOImJmCl85R1Y4pnSijGAh3qi2+DY95FVCzHrcc1e8V0C3F8kXRIFsGmMxT4CDf/Ic4w2/V4MTgw2ZTWcq7Modlv40mu0qAw8MjALwEWK6S814OGUEbhsClkmxBHd7UegefRh/xU2A4RvhkANoTAlU0mxwmVf+WUVFDGa8Yiy7ae7UvJY1/YuuKE+/WqawFCTHx8B2AYaIo9kK1fZnt5Ev9c7i4b9KIgS7FAxyqzjsWOl/Vw706rP/rzMlM06qY2K0oy9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(83380400001)(36756003)(8936002)(186003)(41300700001)(38100700002)(2616005)(5660300002)(2906002)(31696002)(86362001)(53546011)(6916009)(31686004)(6506007)(54906003)(6486002)(316002)(478600001)(6512007)(26005)(4326008)(66556008)(8676002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3E0NXo4WnBMTUQrczJuQk8xRzZDL0VTV0Zsb2s5VnU0TUNXYk13N2RndkE1?=
 =?utf-8?B?Y1JlMUJndDhaWmYrU1pNN3lRZElnKzAxMkVNMzAyUFduNzU3Q2xHdXQwMjM4?=
 =?utf-8?B?SEdVb0p1YmFiNjZ2VkRua2tRWjlNcTBVTXdLdEk1ODhZaDJJRE9VRlNvR2pY?=
 =?utf-8?B?OTkwTllzRW5XY3hXT01FZmNRaHJ6Qlp4RXlaWVo0YTJpNWduY2JkdFNoZmMr?=
 =?utf-8?B?RDBqZlk3Vmtaa3VsSldDN3pXVWlsMWVvU3hvTEZoNE10a3BwczZxWDdERkJE?=
 =?utf-8?B?QVQzSUo3Q1lNZWQ0dndIRjgwQk1VOTZrZnhBczUwL01JYy9aVkRJSjV6bWhz?=
 =?utf-8?B?TWl2YnRFa2QrK0dZWThvQnRlT2huT29Hblk5a2dYWHFad0dNY2Q3UmdDVlNN?=
 =?utf-8?B?YjZxYUxKWHI3VWoraXQ5TllVcGRFMmFwNU9sNFB0eGluR1JreUd1WWJpQUZl?=
 =?utf-8?B?MmZWZnY2bi9OVndWbXJxZ2JOUlNubFAzTkRVZDVDZ29pN2EzMmplRVZ1QWg5?=
 =?utf-8?B?Vm03eXhmc2IzT0FEK1VZOEFSUm9FYWg4UW1US2tJRnBYTE0xSlkwckNEQmRr?=
 =?utf-8?B?N1B0U0pNY2dYYmVnak4xZ0NkNDN4dThFcHZ1d0kwVGpadENYQ2pxSzUrcTlv?=
 =?utf-8?B?TGROdlh0VWhNeU1lNTB1Q2QxNVRPaDJ1RnhOUzd1SVdmc3VNdkJRYU1rT3Nh?=
 =?utf-8?B?aExzTm4zTDRmQ3Y5dUpsdXdHZnlEL29aMy9CSS85bE5pK1c1bm01dkE0ZDA4?=
 =?utf-8?B?dXQzdEdQeHRCcUNMYjhGQ2JpdFZOYmdrdk8ra1pkcmdtYXJTYmFQaVJqNHdO?=
 =?utf-8?B?UXlCbkhhdEhyZytsOFliSEo3L2NVSXJSWWJLcUlSZlJ1U1lJTHArMEhyN3FL?=
 =?utf-8?B?aUVmRmVGQzBTNStvZzlnS3IwVkRqaTFJUVVSSmdZdExKV1J1UU4ybTlBeU1L?=
 =?utf-8?B?TUM3b1RnYWpBOUdTMDkzNVVBR1dIU1kwanB0OGdkM0duNnJqRFNZNXZEOVMr?=
 =?utf-8?B?UmJ1ZjRodzVadUFnMUlPQm1tQVc2L0ozMDRaVzAzTDl6VW9aYTV6Snh1cDhZ?=
 =?utf-8?B?bnRvdGI4M0ZJN2hiWVpCN3YzQ3VYWXlCS3oydXM0Sitnc2R0THQ2REZEam0y?=
 =?utf-8?B?MWhZUHBjYkFxcm9zYktZRkk2alY0L2tmTmQvSkI5S3ZXbldIaHpIcFluRVli?=
 =?utf-8?B?dTBPbkQ2MXUxdWxnS2dSNXRyNzh4dWwzZDFHRjZzTjl1SVRKS21sSXFzZFE5?=
 =?utf-8?B?SFFvaFl4NGUwV3F5Yi9BZ2FjcVpyZ2dPMFNBTy9QTW9NUnBuejFDanA4cjlO?=
 =?utf-8?B?KzVoMzJFYm9qZEx0cjZVdjFTZWw1ajhyNGgwN2k3UE44UGl0Tlk2azBIUFZl?=
 =?utf-8?B?UVVQRGFaYWJVTHp0WDU1b2pMTkdTRDRISEhkRU9hVW4rbFJ0eFRvdHozR0Vq?=
 =?utf-8?B?ekN0S2FBMHJUSmpCWDlIczhHcy83REg2czV2VWcyVUY4bS8rQnRTcXcyVUYv?=
 =?utf-8?B?Q1pzV05WYUQ3TGlKUXNYaHdVbjkzZ0NFQTQ3WVJYeW5vTWhtY2Y2eDFENkFO?=
 =?utf-8?B?RitqMWRVM3oyRUJ6VnJEWm02KzVlVzZ0VU5XTHBWV1hqbXFMUG1WdjJFMUlM?=
 =?utf-8?B?VjVsdXdZZ0owYmMrMExUNldkSmJqOUFmMU9RekkrQWtvamNDSWcrbmtja1FR?=
 =?utf-8?B?MTY4RUdEWk9pL3Vpdm9VMFNtV3g1YWxQR0MxLzd0WTdJUjlXTnFucTl3V0ht?=
 =?utf-8?B?VnFhdlVqQ0NsQmx1VFF4NXQ5TXlCRitMS0NrZ3FlbzZIMjJ5bVIvUFVjZ3Ir?=
 =?utf-8?B?NnUrWmtJalBXdlJMYlZMUjkxczVENXhNRmpTYkRtOEpqeDJpUStWMDFEd1Rm?=
 =?utf-8?B?ZFhVR1pybnFLSHVKNVJGbUVjaDk0SDZJL1pSR1JsKzRUWC96Rkd2MklINTMv?=
 =?utf-8?B?OVE3TjFZQUFsVTdaZFBRRXdLckJDNlhVVkwvNkZRaEEvWkxCOGRET1hWL0FP?=
 =?utf-8?B?WkhJdGRNczRUcU5MTnoyTXBkUy9kT05LZmJWcnVXRXVWSXRSK2hoTDlCTVlp?=
 =?utf-8?B?VjJYR3QvWjYvNXVBTC90MEhwU0VOSzRINmRWdkM3ZjFnKzRkUnVVYW45a1p6?=
 =?utf-8?Q?aYlK9yl6T7ni4ScUkdje55NhR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73141bf2-b115-49c4-49d0-08dacb9e4611
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 08:56:26.8249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m4MkU6n7EV9s/5c6gTSxYs14umem1Ej5ulLIIc1QMV0QU0TtETvgKfpWtzs8ZD9sku244jPn66mQU7rLQJcfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8773

On 18.11.2022 15:27, Andrew Cooper wrote:
> On 18/11/2022 12:54, Jan Beulich wrote:
>> On 18.11.2022 13:33, Andrew Cooper wrote:
>>> On 18/11/2022 10:31, Jan Beulich wrote:
>>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>>>> exposed a problem with the marking of the respective vector as
>>>> pending: For quite some time Linux has been checking whether any stale
>>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>>>> This check is now triggering on the upcall vector, as the registration,
>>>> at least for APs, happens before the LAPIC is actually enabled.
>>>>
>>>> In software-disabled state an LAPIC would not accept any interrupt
>>>> requests and hence no IRR bit would newly become set while in this
>>>> state. As a result it is also wrong for us to mark the upcall vector as
>>>> having a pending request when the vLAPIC is in this state.
>>> I agree with this.
>>>
>>>> To compensate for the "enabled" check added to the assertion logic, add
>>>> logic to (conditionally) mark the upcall vector as having a request
>>>> pending at the time the LAPIC is being software-enabled by the guest.
>>> But this, I don't think is appropriate.
>>>
>>> The point of raising on enable is allegedly to work around setup race
>>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
>>> and the stated behaviour is to raise there and then.
>>>
>>> If a guest enables evtchn while the LAPIC is disabled, then the
>>> interrupt is lost.  Like every other interrupt in an x86 system.
>> Edge triggered ones you mean, I suppose, but yes.
> 
> For IO-APIC systems, you mostly lose line interrupts too, don't you?
> 
> The line will remain pending at the IO-APIC, but nothing in the system
> will unwedge until someone polls the IO-APIC.
> 
> Either way...
> 
>>
>>> I don't think there is any credible way a guest kernel author can expect
>>> the weird evtchn edgecase to wait for an arbitrary point in the future,
>>> and it's a corner case that I think is worth not keeping.
>> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
>> after setting upcall vector"), referenced by the Fixes: tag? The issue is
>> that with evtchn_upcall_pending once set, there would never again be a
>> notification.
> 
> Ok, so we do need to do something.
> 
>>  So if what you say is to be the model we follow, then that
>> earlier change was perhaps wrong as well. Instead it should then have
>> been a guest change (as also implicit from your reply) to clear
>> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
>> enabling (here), perhaps by way of "manually" invoking the handling of
>> that pending event, or by issuing a self-IPI with that vector.
>> Especially the LAPIC enabling case would then be yet another Xen-specific
>> on a guest code path which better wouldn't have to be aware of Xen. 
> 
> Without trying to prescribe how to fix this specific issue, wherever
> possible we should be trying to limit the Xen-isms from non-Xen areas. 
> There's a whole lot of poorly described and surprising behaviours which
> have not stood the test of time.
> 
> In this case, it seems that we have yet another x86 PV-ism which hasn't
> translated well x86 HVM.  Specifically, we're trying to overlay an
> entirely shared-memory (and delayed return-to-guest) interrupt
> controller onto one which is properly constructed to handle events in
> realtime.
> 
> 
> I even got as far as writing that maybe leaving it as-is was the best
> option (principle of least surprise for Xen developers), but our
> "friend" apic acceleration strikes again.
> 
> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
> because microcode may have accelerated it.

But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
VM exit. If we didn't, how would our internal accounting of APIC enabled
state (VLAPIC_SW_DISABLED) work? And the neighboring (to where I'm adding
the new code) pt_may_unmask_irq() call then also wouldn't occur.

I'm actually pretty sure we do too much in this case - in particular none
of the vlapic_set_reg() should be necessary. But we certainly can't get
away with doing nothing, and hence we depend on that VM exit to actually
occur. Plus simply making the vlapic_set_reg() conditional also likely
wouldn't do any good, so if anything we may want to split
vlapic_reg_write() and invoke only the "2nd half" from
vlapic_apicv_write().

Jan

> A consequence of this observation is that Xen cannot have
> non-LAPIC-archtiectural behaviour in the vlapic emulation.  So I think
> we need to find a solution to this problem that doesn't hook APIC_SPIV.
> 
> ~Andrew


