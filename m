Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65C404E9F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183091.331029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJ0Q-0004Yr-W5; Thu, 09 Sep 2021 12:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183091.331029; Thu, 09 Sep 2021 12:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJ0Q-0004Ve-T4; Thu, 09 Sep 2021 12:18:14 +0000
Received: by outflank-mailman (input) for mailman id 183091;
 Thu, 09 Sep 2021 12:18:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYjb=N7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mOJ0P-0004VY-QT
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:18:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 238194ec-479c-43fd-bb6d-1362f3983df9;
 Thu, 09 Sep 2021 12:18:12 +0000 (UTC)
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
X-Inumbo-ID: 238194ec-479c-43fd-bb6d-1362f3983df9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631189891;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pimxR8QoeSvNAouB9tomCBO+RN+Z128zQ7MLxIyRVgk=;
  b=Z1pEZVR5oI7oxsASyALyg3/Hbz3jgrvdvIKf5iMv1joHfEetjM/4kVVk
   166ykYyhFupm+5wrsydzohV6yRjlwVSQmmgMUbp5gQ6CtuGRRLLFIPK2T
   lLW+OTBluJ/I8GPAUTaBaL/GFRnQbzr+p4fRiw3qHp8kYZz9/Ht3EuHGN
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bJwOn1BB4zuZ6WI59OkbbUH3a7CYukbRZaK7hSck0QADhJmJ/ayfh7EWOlfAgJ3A4034esyLtp
 SpH5RcdOBifyxIPa322DJ6ICJAiVNYZZUvaIWmFDe+MQckbI0DiPgBglmouwvrxBrPiVEg86Hl
 mVDfzgsCNZQ6N0m6oJXVVYN0bBkmD+rwdcQ53BTKTLCG81IJzz+GK2UJxzUruKbbaXhnLA0GoT
 WaEBhI8Oi/M81AKZOh3LPhTJ82Hi0uCUvyk7r3CgnKd1cWsmEjOWpS12IRo9Sd/rc3wkzyY5Ca
 jSayMxh8ZfOyAP5smWP4sexa
X-SBRS: 5.1
X-MesageID: 51944700
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1bBKzKNhwgl1gsBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,280,1624334400"; 
   d="scan'208";a="51944700"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+COnPC3ouNh6HR1/Nah3xQcW/2HtI1re7DxDuhNnsJuirJy95N8Nj2EPTA8yDAa4v/jBWGNECCYMCgTYjGyS/35QzUh8s/kAKg/qBiANqsMRGOfin4pr39lbFrf5c5E3oB4ZAaK7Q0T0a6S98Y7EgBSU1M++gk5wU6weKcsiQzME4o6P42Aen1m2xvNhhzUDY7Q41axuViAxJt8mcvKXC0TqKAvGyLcp2wscXLw5CuT6Za0ZPbjbl4Iw5KnbjkZ2Az9NqEi23Kfi3T2fVsAx9yOCIkaowI6dBWE9XpjzOtna9i+HZ7GZ7J7KLu2+gE/Np4eKqraxTg+Vj8mklZ+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HrrZx/U9kE3EnNeaVe7vUWQx6h2cb3clHB489Nw06hY=;
 b=hNlcZgztMDKfU7dgICqhmaXG9HnKegmY1ECDo7xAwNN+sOqTLclNevA7amGKI2jPglhNVzA+9kpFgrF9wjVjp3IMAlWqG1yyCFCV0qUrJ23v1IgWk5DRH0Uzyr6sAfXGVJQwhGot63t/WoQebhd3uYI5CV2P47RV+GcGkmzjo3buJXcLxyCqO6Vj6pHGFrNWmkL3xnd8s8CPCY2K+jgeSbf9isZuTejPlNLL8wnUie6TlPHMrJ4I2CNOqXHrJLE0pV+okEQF5xjf1VQKix+KejmayT2PfKZgUM3V6eDwni8igaQx5A9t4Q00Bdz3eUNgeTVe5SBPoFjvKkSXiNsnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrrZx/U9kE3EnNeaVe7vUWQx6h2cb3clHB489Nw06hY=;
 b=PNhcIRe8NEd1U95CadS/AqnMxKxkSgNRlvFkT3ylfKq7Bpp2XFPDb6VKtHLLwx/x9C/31Do8VvFyyBqx7KyxHpMUI2if09+s8mR2GQQxAe1AbSxiQzIxy4R7tEPIVJHXDiL1OjNYxQ4JcpAB/RKd+pdMVTGabscC1Wi7Enfz+XI=
Subject: Re: [PATCH] x86/svm: Intercept and terminate RDPRU with #UD
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908161918.25911-1-andrew.cooper3@citrix.com>
 <3f272ea6-02ab-8f70-19cf-28a92421531e@suse.com>
 <9a4392f1-dc8b-76aa-f5c0-1db70dce3b42@citrix.com>
 <b4603360-c105-8f69-2c1a-081ea2605e05@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <038269c5-2b81-b6cb-892a-41bbe272a138@citrix.com>
Date: Thu, 9 Sep 2021 13:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b4603360-c105-8f69-2c1a-081ea2605e05@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 894d4c8c-2292-4e65-9f8c-08d9738be0dd
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4967D95B537EDCE5C82988E8BAD59@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfIcuS9pyDLqBdM6/rrYPQROMfeHCDaFgCposPMZw+F+cxVX9/79AtN0S6F/enkbnGIa1pQjAFcNjZvhh1kbVaUGiOc9TjSoCRzAQR9nH/eYtpO6A/F+NP1lrHEiV23TA4wGjF6XnclyRy3MGRivN/Hy3js1DGq91iwQlTkRYEJDKk/pKNWiGBC6L6ffcJwbtP17kYbCWu7+htbrNq1sw01bU+KwIPv6Kp52WaL7kMFhWhugqgYFk3W/wC2jL+QbIY+wsg4YHJQUqMB0cUHQlrVS372e6y+7PXhzCxvCuAmK83cq2o1n3RIt7ICI+9ICLpUwbyjPitdkKb5RkJPRe3wV5DPUOO00KSB0dlphhLw5AT2aGUwZoInvCxbj70tfTQGaUv9jhHLghQ/Gb2wFS0AClqDNrmfLS4/VhYTEMPnbsM/malKJ8+wwRv809GEOG5ii2StTQf6qdLVDjkPiDIja9U3uEbYl0Hmt5pJwAENpW77dbyD0JZ1u/P8zT9bG03ONdCqTiZbb08CsMjqE66H8I/XUON75VtE9a4XX0ZlXFxCkPvpx7XCWsdELn+zC6b7Fpdf229gW4u42ZaSu1SSc4qc42vNCJAQsMcTCBAGC4ShJYwU+m5uYa0kiOsotBPiW0TLdh/7wpHIB+GJBN7wt6+Nwoz4Fmjkh0sYC3aZ4vbyDk5TgPzaatW0SsSwr2v6+zJqS3elk5nrXXAITayNOh0YyfykZWKxauMuBIh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(66556008)(6486002)(86362001)(66476007)(38100700002)(5660300002)(6916009)(83380400001)(6666004)(54906003)(31696002)(53546011)(55236004)(8676002)(478600001)(316002)(2616005)(186003)(66946007)(36756003)(956004)(8936002)(2906002)(16576012)(31686004)(4326008)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2NpdStLQWpIeXBjZVp5cVc3TXZicnF6eUdQdjVKd1RpWEQwTjZoMW1JNHBs?=
 =?utf-8?B?cUdwWjcybnJWS0xGRU1hc05EV3loeThNelozVzk1WFRBSWxVQVVaSmNmSlBY?=
 =?utf-8?B?V0dkY2hHQXRZZTNUV0hzc1BlQ1RON3hLK2dqSnB6dTFkS0Y4QjZsa3E0bXA1?=
 =?utf-8?B?eWlHbkFCWi9JQzlMUkRWem1oNkRtRFFQa25nV3BaNi8wL0pjU2RHdGlNaEd1?=
 =?utf-8?B?OXQ0Wlk2enF3YmVjczE3aFBISFhZUWQ1aGhZalRzN0ZqaUY1a1cvZkdEelpE?=
 =?utf-8?B?cUNiRFlDSi92S0p5Nyt4ZFg1VjA5b2VSSDR4RjMrY0RSNTlPaGtBbkFZMTV2?=
 =?utf-8?B?VmgyT2RUeVNBWnc2TkQxb3VRbDNuM21xZXo5UUQ5MkVmcjEvczVwL3JUbUdY?=
 =?utf-8?B?Mmtralp3ckhMc2RmclJpV3FOSGxGL0hKdHptdlhQVjljWnFuL0tndDVicWJO?=
 =?utf-8?B?emFvTm5RajdqTzlsYjU3VFBNcmRONVdpMHlMMFBOKy9mVlNEdkU0bXRZd01H?=
 =?utf-8?B?UmFIbHQ0U2dJSFRRS0RZdXpiTzVYaHZTSjZTVTc5RENGdHEyWXBsSzdzS3NM?=
 =?utf-8?B?ZENsTkZwTnZJN3BZWlpjNzJXVEN4QWRtRUlDdHhBNm5CVGs3QmdvY0JOMUhR?=
 =?utf-8?B?OXp4a0dWTDlxR1YrUy9XeXlicU9OUXlsOSs5anBVKzJNUzNRMCsxUnlra2ZT?=
 =?utf-8?B?Z0ZzaFlWd0JVNVluSjRFd1B6cFJHMVR0K3hQRHlsQWlBRHhJejRRR2RIeXRo?=
 =?utf-8?B?eCtjdUNEUFlNWWpWeWJaRzNvTTBjSENsbmcyRGhpdGpWaVlkb1RERjl6MGlX?=
 =?utf-8?B?Rjc4U3J1b0pabGpqcG5RRitJNHMrUU9RKzcxYmJMUkhGYmVwUCtHVE9wZTV4?=
 =?utf-8?B?RTQxWXFRWkNNRFk4OTFmeUZZYThucWpQamxWZi81N0ZNRlhBbUJjLzkvT281?=
 =?utf-8?B?ZUo2SCtuK1ZMc21mVHFjTThOUy9xenF4bU1VT3R1ZDFKb0l5TWhVRFpZMFd4?=
 =?utf-8?B?Wk5CRXpaaC9TbU1Ub2c1djlSZTBCVWdMOXJzMTZUQW9MZnFHSU1NWmZwS3Np?=
 =?utf-8?B?YWZ2bUU2NVNGYkxtdklpNEVzWkVWNTI1RTVBUjhOeXJMa01Gdm4wTkZ3MUZv?=
 =?utf-8?B?TUpMc0kvRDdKT3I4NTR1WEk1NEVQWGtReEorbERmOEJSU0ozRjZxUkxFTm13?=
 =?utf-8?B?ZUNPeTJYWlNFNGU5UDV6NlorRkVDTlZPdGtTNktBTVo0UnVlN0w5aENObUsz?=
 =?utf-8?B?azZYMDdGQzV2ekRJZHVqRW5xZmI5UmswZGMxTzIraE5kTkR2dXFRVUxDdW9D?=
 =?utf-8?B?eGp4YzlLdXBRbllnY1ljMXd1NEpLRWpibkx2Z0FUbzFWZFM2aFo5eUdPaGw2?=
 =?utf-8?B?eXFDMFE0SE1qWFZVdEQ3VEowdEthSFNBV3FpYVNmMlNoM1dTWHlFL3VXZkZH?=
 =?utf-8?B?M2o3bTJTTkFCeHhONTg0WVNCTEQxMnQ2eHZaOWtqbEVkdTB5MFM5YXFTWGxZ?=
 =?utf-8?B?d0h2SEpmYkZ1SCtwTEphbXN5bldGZEFuTTRZM0lyMzVwb0MxZjltOTZCdDhi?=
 =?utf-8?B?ODRXelpTdXhKak5kYWxoMjg2OHlObGJ6bzZlTUowZGhSTVNBaVZGbVJWc0JJ?=
 =?utf-8?B?QkJDTVkxTVMrWm51VlF4dTdETGhJUDJsNUJCbmtBQ2JwU29abktOMWJwcmtu?=
 =?utf-8?B?c3BXYWpmdDFEUU9Ka3J3L3pHRHg3cFhIVU1zMmhLMzcvbnIwRHJEb3I5bDk1?=
 =?utf-8?Q?SBwzOtBFoFV7+WPkUCGwkVaAP+Icm06NoNSJcS/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 894d4c8c-2292-4e65-9f8c-08d9738be0dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 12:18:06.1034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAbyv5pIMr6Li7qE7ywBHVIQSXanKe227xrZKG6/NcxhWerTPNicA08NlTyVhgHFz/kvXnDDF8cybpEtwjn2YdsJZ+i9WCD9d2qWQdbFHqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On 09/09/2021 12:47, Jan Beulich wrote:
> On 09.09.2021 13:34, Andrew Cooper wrote:
>> On 09/09/2021 10:57, Jan Beulich wrote:
>>> On 08.09.2021 18:19, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>> @@ -70,7 +70,8 @@ static int construct_vmcb(struct vcpu *v)
>>>>          GENERAL2_INTERCEPT_STGI        | GENERAL2_INTERCEPT_CLGI        |
>>>>          GENERAL2_INTERCEPT_SKINIT      | GENERAL2_INTERCEPT_MWAIT       |
>>>>          GENERAL2_INTERCEPT_WBINVD      | GENERAL2_INTERCEPT_MONITOR     |
>>>> -        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP;
>>>> +        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>> +        GENERAL2_INTERCEPT_RDPRU;
>>> Some of the other intercepts here suggest it is okay to enable ones
>>> in the absence of support in the underlying hardware, but I thought
>>> I'd double check. I couldn't find any statement either way in the PM.
>>> Assuming this is fine
>> They're just bits in memory.  Older CPUs will ignore them, and indeed -
>> pre-RDPRU hardware is fine running with this intercept bit set.
>>
>> Honestly, I've got half a mind to default the intercepts to ~0 rather
>> than 0.  For running older Xen on new hardware, it will lead to fewer
>> unexpected surprises.
> I, too, was considering this, but then we have
>
>     default:
>     unexpected_exit_type:
>         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>                 "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
>                 exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
>     crash_or_fault:
>         svm_crash_or_fault(v);
>         break;
>     }
>
> at the bottom of the switch() statement handling the exit codes.
> Getting crashed (or crashing because of an unexpected fault) is
> surely a surprise as well (to a guest).

It is less bad than the alternative, which was failing to intercept e.g.
XSETBV.

Something's going to crash or malfunction either way.  Intercepting
everything makes it far more obvious, and limits the damage to only the
offending guest.

And yes - this is once again why we really need a credible support
statement for CPUs.

~Andrew

