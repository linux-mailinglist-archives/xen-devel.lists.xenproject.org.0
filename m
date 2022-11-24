Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC096637338
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 08:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447805.704441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy78x-0004cq-Eg; Thu, 24 Nov 2022 07:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447805.704441; Thu, 24 Nov 2022 07:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy78x-0004aC-Bu; Thu, 24 Nov 2022 07:59:35 +0000
Received: by outflank-mailman (input) for mailman id 447805;
 Thu, 24 Nov 2022 07:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fS9R=3Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oy78w-0004a6-KB
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 07:59:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4f672c-6bcd-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 08:59:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 07:59:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 07:59:02 +0000
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
X-Inumbo-ID: ee4f672c-6bcd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKfM5pDEUMfewupfXXoG7TWQKw6sf5jaPh3qr1NfIglQDLAGPOkSK2R+YmO4bFZoG/8JY/ICPMUAYV4WJp9HTe/l8tkgJyyY48a88c0AsWadKi+8+PDiaKUt1DtDvXkBG3SpPO6wHXj9FcI+CUCS343Ffm5pI05rPnXW51hBPHBNz6tUWMkw6t6UlQvlMION9/H2dAeK7C7VMabsKTbPJyV2hJeohR8e6EoaRZwWbXUgKcjAy4C2H8zpEVpkrKvwNopqbv8j4V6d/0YJ968zsk/4FiDM51Ess9iWPVXddiUym2Jb6AwjYUFvMpa0YWYJhyIsHbs5jnK/tq2AXaTolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g0mthTgwGBQHAZGnHS8c+Z1/zECCof3xKXkMQyy7Qk=;
 b=FktN/+BfS3KxXgltZRqJXWAk39ydZD9ihoFndkbEvzYt75/EkofJzEXf+GgNyvHAkAMi/GBYDqR0wMRHkjjZleyJucdd4l/sh+trrmqPNxLBxMw4ZoOOej3zLk71onygpxlpk87KNKcfzwsmEmzHs6nvAbj/u1tvHX5x2Xr3eQDEi9UBRguhBcO7LA4nhm7G2zgd7qokGDOTaaWkdN4L978Duo22ayB1X/5zZa9EaiFkwHFhUdVSmO1mYw3ccs2dBYJTuMhmXj2HwlkbXLcdVxJArOPAWbfY2C1Jd7kGQkhf4ySY2OMtZO8/OxxisdOQ9YLp4pdtshsz+ceaQNej0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g0mthTgwGBQHAZGnHS8c+Z1/zECCof3xKXkMQyy7Qk=;
 b=mvTohXiLr3nn/iOHTNA5+yd9U137psWo4p+4A3N1Mf12KIFO4YhOIykiCC7OltzyxgRiAuo6HIvIjrCaMSFH6j0sUy8xUsREoSG6DfNdMP+5GUYS4msbG9pZYBUOTck6oqaD006P9MBQhu2UIgDq7fv0cU1KfI+CX7yd+Ktodi4RXnPZyrqlP4MqVnYTTTYs/cApjAa/8ciM5dZ2teBpt2BUFs58WBN0JRWu1RRnvm6vEaLqePovkWjgZKP5Ybk3paqLiNVC2prh/m1KDdIczzTQ3/wyUZ/JWTrgrj2yVjmBMBx6ar//USPV2mmL6/7FSWOI7O1+jgOCndWNyzVrBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
Date: Thu, 24 Nov 2022 08:59:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y34L/MwSFGUsSe2I@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e07894c-5881-452c-d377-08dacdf1c030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fcwOr/f8xFXY9aVrbmPTZWQYb8Nw7/8qdPdsyB4aThrE9yFLQATw4wy+VThLpsAsqjjK6a0H58lr8/qxYg1vZfhQMFen07yXXMR/c+Brq5OruVXgjeh0W+XTBSSPkm5jA3wL08OWgdl4Hktbr4qP+SR78OIxce1cImbg1+/hq0t4BqHaCQdQt8OBrxTIsoanAceu/IEtM+tr5EnW/Kpn6Tlh1Y229XgQKcSaZAyUBsSj04qPQW1BvRTDJ+HFniOxyX9tInK+qNLqaEA3U/2r/c/FXaSb2BgofR3Ks8mAAgXcVY7qh1U/jA3DGXQPtUV2Yndme7RtD4OQXvwOOOt2XMCGw4s1X6IWxmE31zQ+E/twSntRWwPnd6iyryj6imbX1xUD2bO1qxZhrAzqFNgv4rEACkVKx3TYiWdNfcyACB+UsU1ZNXsIUrNo/18XZ0xT1qsool6lYppNmnY2ne0PqtrasPMf7qLkGb6hX+F3gUc2Q50e+hXYDpyPS73k1GrETozkzkEraMbmhfKLAGR3fAmG3A0JWKCCRMLj41KDw4EIPeNtB07TULir1oBW+jZy4rRMv324HyGqUVfF5A9lmxxJtOYqqJXnRFKFzel+PqPkhdP7H5i6kzT/9yyhjNaPqkonysGszhsddwTMBqpFs5v5B1oTs1R4cZg/ylDwECO376axrN5kkXaRTqxRmX90nb2axpJsdHktx6ADXtLvTvVg4ynOARs8E/g4BryPvAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(86362001)(31696002)(38100700002)(8676002)(4326008)(41300700001)(66946007)(66476007)(66556008)(54906003)(316002)(6916009)(5660300002)(8936002)(6486002)(83380400001)(2906002)(478600001)(6506007)(186003)(2616005)(53546011)(26005)(6512007)(66899015)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dndFNzg4U0NaOS9RQ3hoTVlCM0YzMjJpcW9wVUtwL1NJYlBjRnFMT0QyamQ2?=
 =?utf-8?B?T3ZmVDMvUklDRHVkZnFsVU9aTEpuVGtCT05RUmdPK2pnZnp1RitDQzMyTDM4?=
 =?utf-8?B?UFR1YUh3TmVCcmhrTXFReVFlZjNjQk9oMkEwaWtDVXpZWlo2a05pK0ExWWRl?=
 =?utf-8?B?Z29nMU9ydEhaQUNCTmJyb1JWUUNTaVIwaGN5YmRuNnEzbDBiOC91V2FnY0RR?=
 =?utf-8?B?eWlQMSszZEZ1VzEvMW9IL3lUVEJPY3ZsMzlLUjR4VVppRVozQVNzdHZJRXVy?=
 =?utf-8?B?ZEpLdjczV09MZGxVTU8rV21FUlBsRGxSdmEvdmpNMWdQblN4UGFkU29IbDJZ?=
 =?utf-8?B?TVFBOXRQL1hlK0phQk9QclhyaFJkUUNMOG9vMHdkR1hKZHdWbG9ZSEM5SktF?=
 =?utf-8?B?SGFnOEp3L3ZqZzVtYVVTSHRmR0hCamlZcGQyd2xjeDRyVE9sQnQ2Ti9Lb05H?=
 =?utf-8?B?L2FOK0dLdEJncXpEVG5qK3BUY29jc0czYUlmK3ZwRDZnZjI2SUttaTIxSUIv?=
 =?utf-8?B?QjI4cWFiUWRJcVJ3T2xXK1pjL1V1SjBlZWx5cEU2ejIzdEVqMTQ3MldCcU9l?=
 =?utf-8?B?SHdoNkhibXpPdDlTUTI4VUFFVnFuNlU5S1ZGazZQRUMyRlozdzc5Ly8zS2ZF?=
 =?utf-8?B?eHVqUStSSjZKSDN1ODNQRHFOSERLUDFNL3lnOGRCMTVpeEkxRjRNaTVmdCtI?=
 =?utf-8?B?V0xacGE5Vm5JeVMzTElHWS92QkNxcW1vL1Yvc3FnNCt5cjJWK3hZUWt6QmZm?=
 =?utf-8?B?WmNDVFNwU1dVME1ncCs0WnZQazNISnpCcy9lL294cktGRDNwNUhMZ2xUQm1Q?=
 =?utf-8?B?R2htL0crMEp1RFhlN2tVcktiL0RBY0hGZEpMYmNsSnFLL284SURST1BDczdS?=
 =?utf-8?B?SHowOWhMMEhzR3NyT0M5WUdGajhrdS9qR0c5U2xrNGZkRDZnU0pKSjA5ZE1L?=
 =?utf-8?B?d0pkT25hb21vdzdXdE5JVWxiUlZTdFhqVFhaWG1KQi92Y0JWZmFiOUtBeS9S?=
 =?utf-8?B?eXZSUW1XOTRzRGRLc0dFaWJFaTlROUVsSCsrMDlDdXhmc2lrUFhFZmxRM2Zk?=
 =?utf-8?B?OUNDREJUc0VZMkNIa2VyNlcyQmsrUFBjSWtrU0tDZU1Bd0RTUURuRnBuWmlj?=
 =?utf-8?B?b21ReHJZNW1PTUlzcHNVaW10eWFjZEdzMUt4NDMzRjJRWGVBdUkxYUxudFh2?=
 =?utf-8?B?MWoyQkNTakFXOGYrcmZITzJuMmlWNFl5ZFZyOE1MZXp3QmlZZzdFcVFPakdw?=
 =?utf-8?B?Tk9qQk5mbzUwSW5SOXQxNVZTcUY3RGt6UVNXcXI3eDVGdnRmSE45WUw4OTBl?=
 =?utf-8?B?SC9zcGZHVkc2NkRFOVdCalpZak9yMW43ME9SRzMxbU8xcndmKytaZFR0K29h?=
 =?utf-8?B?R1B3U2ZPRDRDRXBEViswd3owZG1ob0doL24yTUkwTm53d0xsTHRwdkZIZ3dw?=
 =?utf-8?B?bGM1dlU2VXcybTZGV1pmRHdyU1hMK2l4V3ZVVjRBWEtkQ0U3ZlVLWC94T1c3?=
 =?utf-8?B?RHJEejEwa2dPNWVNQmk5MHkzZFhwYTh4bHpuQkFSOVkwVW1DZjIwVHd4bHlx?=
 =?utf-8?B?R2FYNlBDc3p1aDk4NXprdlZUbjA0cE1makVDNE1uS3BNSkhtMkZGbWVNaUE5?=
 =?utf-8?B?aWRLaTRBVkJld2N0aGZqUVpwTzZDVjNKaHpnaHB4NndXRlZXUjJEU3V2OXZq?=
 =?utf-8?B?MWN0NEsyVDhVT0szVjlPMzNEM3pCQlRXLzZTNVJheG5semMzRWlFb3hFenZU?=
 =?utf-8?B?a1REOEZTS1RWV3dYbG1UMXZuaTZPM1pnWDc1ZnVGY2xEMjdsTXhnNm1RaUI2?=
 =?utf-8?B?UjVxRkZacmRsQmVDaHMrd0JBalJWcEk3N1JQV0xSVmZ1V0x2ckZkbTBWSTIw?=
 =?utf-8?B?MzVtSDlFMXlRMithalIzeGxGYSs4Q09IL3BoazREWkNCMi9JV0k1a0RiOUs4?=
 =?utf-8?B?c3h1aU0wSzhhZS82ay9RanZ5czFDRjd3eTErdHJKM0pnN2liVmhmL25DZ1Z5?=
 =?utf-8?B?dkY4MjR6RmIzTTBGME1XS2M4QUVaVlRMTm1ibnRHTExsMTZYYXFRc2VNZUw0?=
 =?utf-8?B?Smlick9GZzcveUZZdUhkbGJCU3pZQnpCdEpCY01nSXBzck9PZ0h1TkN2bTRR?=
 =?utf-8?Q?aXQ2A4bijQ9ZekqLyVB8PwDlg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e07894c-5881-452c-d377-08dacdf1c030
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 07:59:02.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYShplavFGFiphZLeISO5mjSMrea5buE2vtrM+0OIdhsqfUeFw8Kky3QQc340YMieEYnGQOUj+t2cNuMNm4LcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

On 23.11.2022 13:03, Roger Pau Monné wrote:
> On Mon, Nov 21, 2022 at 01:34:38PM +0100, Jan Beulich wrote:
>> On 21.11.2022 13:23, Andrew Cooper wrote:
>>> On 21/11/2022 08:56, Jan Beulich wrote:
>>>> On 18.11.2022 15:27, Andrew Cooper wrote:
>>>>> I even got as far as writing that maybe leaving it as-is was the best
>>>>> option (principle of least surprise for Xen developers), but our
>>>>> "friend" apic acceleration strikes again.
>>>>>
>>>>> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
>>>>> because microcode may have accelerated it.
>>>> But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
>>>> VM exit.
>>>
>>> Intel isn't the only accelerated implementation, and there future
>>> details not in the public docs.
>>>
>>> There will be an implementation we will want to support where Xen
>>> doesn't get a vmexit for a write to SPIV.
>>
>> I see.
>>
>>>> If we didn't, how would our internal accounting of APIC enabled
>>>> state (VLAPIC_SW_DISABLED) work?
>>>
>>> It doesn't.
>>>
>>> One of many problems on the "known errors" list from an incomplete
>>> original attempt to get acceleration working.
>>>
>>> There's no good reason to cache those disables in the first place (both
>>> are both trivially available from other positions in memory), and
>>> correctness reasons not to.
>>>
>>>>  And the neighboring (to where I'm adding
>>>> the new code) pt_may_unmask_irq() call then also wouldn't occur.
>>>>
>>>> I'm actually pretty sure we do too much in this case - in particular none
>>>> of the vlapic_set_reg() should be necessary. But we certainly can't get
>>>> away with doing nothing, and hence we depend on that VM exit to actually
>>>> occur.
>>>
>>> We must do exactly and only what real hardware does, so that the state
>>> changes emulated by Xen are identical to those accelerated by microcode.
>>>
>>> Other than that, I really wouldn't make any presumptions about the
>>> existing vLAPIC logic being correct.
>>>
>>> It is, at best, enough of an approximation to the spec for major OSes to
>>> function, with multiple known bugs and no coherent testing.
>>
>> But can we leave resolving of the wider issue then separate, and leave
>> the change here as it presently is? Yes, mimic-ing the same behavior
>> later may be "interesting", but if we can't achieve consistent behavior
>> with yet more advanced acceleration, maybe we simply can't use that
>> (perhaps until a complete overhaul of everything involved in LAPIC
>> handling, possibly including a guest side indicator that they're happy
>> without the extra signaling, at which point that yet-more-advanced
>> acceleration could then be enabled for that guest).
>>
>> Otherwise - do you have any suggestion as to alternative logic which I
>> might use in this patch?
> 
> Maybe the underlying issue is that we allow executing
> HVMOP_set_evtchn_upcall_vector against remote vCPU.  This could be
> solved by only allowing HVMOP_set_evtchn_upcall_vector against the
> current vCPU and with the LAPIC enabled, but I guess we are too late
> for that.

Allowing things like this ahead of bringing a vCPU online can be
helpful for the OS side implementation, I think.

> Actually, what about only injecting the spurious event if the vCPU is
> online, ie:
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ae4368ec4b..4b84706579 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4105,7 +4105,8 @@ static int hvmop_set_evtchn_upcall_vector(
>      printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
>  
>      v->arch.hvm.evtchn_upcall_vector = op.vector;
> -    hvm_assert_evtchn_irq(v);
> +    if ( is_vcpu_online(v) )
> +        hvm_assert_evtchn_irq(v);

While this would match what hvm_set_callback_via() does, see my post-
commit-message remark suggesting to key this to evtchn_upcall_pending.
Tying the call to the vCPU being online looks pretty arbitrary to me,
the more that this would continue to be
- racy with the vCPU coming online, and perhaps already being past
  VCPUOP_initialise - after all VCPUOP_up is little more than clearing
  VPF_down,
- problematic wrt evtchn_upcall_pending, once set, preventing event
  injection later on.
As you may have inferred already, I'm inclined to suggest to drop the
the is_vcpu_online() check from hvm_set_callback_via().

One related question here is whether vlapic_do_init() shouldn't have
the non-architectural side effect of clearing evtchn_upcall_pending.
While this again violates the principle of the hypervisor only ever
setting that bit, it would deal with the risk of no further event
injection once the flag is set, considering that vlapic_do_init()
clears IRR (and ISR).

Jan

> I think that should fix the issue seen on Linux.  We would
> additionally need to fix hvm_assert_evtchn_irq() to only set the
> vector if the vLAPIC is enabled.
> 
> Thanks, Roger.


