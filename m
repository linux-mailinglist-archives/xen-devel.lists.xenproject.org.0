Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67073ED204
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 12:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167258.305277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFZuV-0005yD-KS; Mon, 16 Aug 2021 10:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167258.305277; Mon, 16 Aug 2021 10:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFZuV-0005vw-H3; Mon, 16 Aug 2021 10:32:03 +0000
Received: by outflank-mailman (input) for mailman id 167258;
 Mon, 16 Aug 2021 10:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFZuT-0005vo-Sp
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 10:32:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb00ea9b-1f6c-4330-b265-d506aee2a75f;
 Mon, 16 Aug 2021 10:32:00 +0000 (UTC)
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
X-Inumbo-ID: bb00ea9b-1f6c-4330-b265-d506aee2a75f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629109920;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=orKZuIT7n/wKuPPsjaxRVAutlRfxC5UU9XrpFxFbks0=;
  b=Q2Pw/5LT81zGWlHd6OBP5bJyirYHcRq9JYLrsx8RZUdVnRKEG6cU+ncJ
   BIRdtKZpfc+WiP5M0UAklsmcu2gQjXQ86MmNejWyhyXyiDFPflMyH8lt/
   SFn4ZU3OwkIVvtg0+YeMvRF3354S8jA3FAUn/U6jd7gCatd5w8a3BrN/K
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wOnH8AmcZEloZjRx8aOQw4/v4dIXWNv5KJLd/W4Oyw8xMdLp9xnZsquuRNATv27iDGFgEKC1sI
 mNAyZyg4PQ0g9Z4zIUKV8GxO0KWHuuQpf+Ph+oJ2d26TzXyaJ+QdYf9gOSkGeNizO0bIX/DowV
 3us81Rau/Yw+VQGA1H5zfTJ74t37xfYp6SJbTixzC+bGBhjlrpSDUTqC6cYrUV7anK6pDAQWEr
 54gMIwsM4fAo1ZapqUstEpIANe27AvhywqAWsQMk1Ov7e4BXsWoNY/6ApvsogY/97P/s8W9+s8
 ASog3i5E3ZWeb09cOp7PBoym
X-SBRS: 5.1
X-MesageID: 50531046
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SQzKgqxaUpUYos1gFZuIKrPwG71zdoMgy1knxilNoHtuHvBw9v
 rAoB1/73TJYVkqNk3I9ergBEDjewK4yXcF2+ks1N6ZNWGN1VdASrsSjrcK7AeQfREWndQtsZ
 uIHZIOauHYPBxXitv7/Rn9M/tI+qj+zElwv5am85/mJzsaDJ1d0w==
X-IronPort-AV: E=Sophos;i="5.84,324,1620705600"; 
   d="scan'208";a="50531046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVwzTJnW4E6upXmNl79lb8qsWH/Zpv9DnaKFqdahbfapnHwsKtsUiAVVeJcASbJEzYxsG4Quj6wnvWOzHqtvvCFCSj7aYuxW/IrdesN7ndTRp42tqV08ZtZ+YmFVdQDI9NgBU50aYlj/NUcfUuMgLJ5TJDadj/8JGwdNP3YSRTLhSD9x9khCddoI5WNefxiun4wPx4NtXFCfFvrrOzebow9BbCNX7D2q7gSopbxND397T0G0SxrUW7egh8cLGap8g0RcRSbmEKJN0ReST4LxXj0aUFX2FDgIWEd0+o25hXNaGq/OZsEebBDmMleeBq6jI2IwBYNJAhyLBVSJxRENCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u94Ph1b3saNQ/nnS2pLXJOXiK8NtOEiZm3XUeuodqZA=;
 b=i/GiPBdlAN5GDrValfokV3okx6lC+HfQRoEpXygxfSbg1xb5FiyXl7Iv8adROm4LpQx2DE/HXnwR6n/jW8Wz+dKUXu+NZkUUpYOfFLHk+JJx1OYO9/cA8018ssgt8eN4xwR/d0cQFAdVyBNcUDBc35oKd99mSf8MKWXXgsFuo1bMy0CWViKc41rP89poIjsVYic2VezGl1kHeSmJ+GlPaSCnhVB/T7nfCbEnDMukCboAIrzCMobkZK9rVGYtfYleNVPfbG7lHCthu0dTU9oMQPFGUH4/ZuDwQU4xxZf7SgVRaIFI0Ox9eDR9CD8aXPaxxi85r3cUa2DzfCiNymNxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u94Ph1b3saNQ/nnS2pLXJOXiK8NtOEiZm3XUeuodqZA=;
 b=QeTTequfIXO8QtfISY/hGOeq3fCWQbyrlihBggLTWUuNyvl10bvw8AdhgAK00xec8Ee2rWyiKkliaIg+9YIu6Xp9kuYADOmum/N7MOMPT6TbZ0oyZn1iT6N06RYuB7jrjb4byYszr1ITPS8AgyDGH24dZTI4VDSehWA/Q27CGP4=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812170350.23543-1-andrew.cooper3@citrix.com>
 <94239a81-1d8a-e6ec-f572-9c8d5f3ec50f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}
Message-ID: <1c1f92bd-f8de-d21c-6dfa-2bb811f7b814@citrix.com>
Date: Mon, 16 Aug 2021 11:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <94239a81-1d8a-e6ec-f572-9c8d5f3ec50f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffba540d-8284-4067-10a5-08d960a11310
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5854E6236CDAE9075551E6ECBAFD9@SJ0PR03MB5854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uB3BHR0Id2rLMplaeKpv9HdqVHeZENUD+pV5A1FHGlAlKiMlu6Wbrn1z/CcXSOF2hQOuIbFYtTaXs3Ytqw/Prg/iYNCUmT40SHJSiDykowRQnauJzlunSRbesZcI3UlI3BuHIKkelHM7AYGpv3HW6dJdzwlo1zWzlXYdHRiElGppAWArKyJSBWSwcmiA548Lb7h1bm8g3zDPTTMZQdwqTgB+VCblqjptNQ7c8tl8QpW5/8PkE4T+0FAncC0J3a+O6+tB2wHNuKFtxBmcCW8y2Dw2nsQsLdl7qxcOhzijYq89fw+uBcnRk7XE8dvN4E6/xF7tbOWuOS10gNf9PwsrFmwoluwOvBabt9cokbaFi4PUpzH6a01c8BmEeipb46Mju507dYCja6ZvZIsCVvU5ZbGcPcDbm6zcQJTMF3ItwXiu+C0d/IIhRUSv4Us9r+LrIrp9Eb8zNhY8WbjDkRp2mjjveOYH/mU7k4QVMibznDyw7Z8irg1SYhrA1IleKvxcL/HGLlEjWKhp2KFt3lTFJ9xb8NE/99eYSa2QylkTGAcDWTENXNjALWeGWL/U0dB4c2RkHNFTKAxymJPeGFCOEjY1jOWbM8E+lSJ4Siem7VRNmPwDRpQQgd61FLRfm1nhNPg1UKAKFk6md8JKcBYFDgUe4PJtjgGGvcakakR1B0fJcLUCxpBSmpA8t5beP45mS7/Nf670opzS5DKHUFH4KPxi/o85VPLVuPvxC2eZ9Vs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(6666004)(31686004)(66946007)(66476007)(86362001)(316002)(54906003)(53546011)(66556008)(16576012)(31696002)(4326008)(83380400001)(956004)(186003)(2616005)(66574015)(478600001)(36756003)(8936002)(26005)(6486002)(38100700002)(6916009)(5660300002)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHU0SFAwSTVQYnFadHZ5WVE0NmNXL2VUdW1nVTZiUG5oeU9KdmNkMDJ6M2hS?=
 =?utf-8?B?dkZiVHN2cUNOM1kyZEJZNzZHNTZpTFJZWHYrTWhQem5pQytQUUV3V2w0WUl4?=
 =?utf-8?B?cmJJWjRYTm5LNndvY0krQ2xXRjVqcjNjSk1zZVZaREREQTdhbkNhZ3h0aERE?=
 =?utf-8?B?bGRPN21LREhoODV5ck55bGl1dk5ReEY0MnBlTTVObHJHYUFCZk5BZnpacmZC?=
 =?utf-8?B?RzlQSC9nbURNdmFsSjJsSjA2MUttdk5pZHBYNFVYdzlUUmJBSW5YOThDVVB1?=
 =?utf-8?B?RzY4Wk9nakRlYXcwR3BBaStaSUpvNlg1cXk4dk1MenREeER2Z3p5M0ZJRHcv?=
 =?utf-8?B?REZhSGMzbUNoTktSK3NGNkpqbXRmcnJFbFhwZ2hsQkhlZTAzRjdpTW5idVNF?=
 =?utf-8?B?MWE4UUdpcG9KT0MrejNuUkRpb0tSeFMwMTk2Y0M4dEI0U0RiQWZ1cHlWYmJ5?=
 =?utf-8?B?WEpqRXUyelg0dGRVV3N3dDBmOExYMFV5VjZPM1FnTk1PbjkzS2RHbkFGRVN1?=
 =?utf-8?B?SjlMVUlYaHBKekxxeUQrcWlyNDdEcEdsVldRSVBsdTlkYkNtYnNFVG9Wcndw?=
 =?utf-8?B?VldKYVYzU2V2S1JMbkdObExIMDV0U1lFbjh4QU5tWEQ1YU5GelZKM3pmbGU4?=
 =?utf-8?B?Smh6Sm9Nd0JGWnN2R1BiTFVxdDVHaEZSVS91OHdtYWU2aDZEQnNCNWpKYXVM?=
 =?utf-8?B?L0dhdXFlYnBoaHJnRUI1L3lPdGFXSXFmSUNYMDlucWdEaUtyUGVhOXdac2Jz?=
 =?utf-8?B?WXVLQTlXMU11ejdmcXB4eEdCbDJOemovTGVYUjV0S21VTkRhendtckdpNk1z?=
 =?utf-8?B?Nmxzcm03elhPbkp6MXB5U08yNy9TcmROcFFDRGNWZ2lNbWdHUFpDaU9qUVdr?=
 =?utf-8?B?eVZWcnlaMHhDQXlMeUZXeWFDbzlXTVNCYWZHQ2ZxSXlkbkVYRDQwN0VxRURH?=
 =?utf-8?B?am8rMTVSdkkwS0FnWjA2NDRKK3Q2ZVpXVkNnSUFoR3YvMzcraHBxcjVKRS80?=
 =?utf-8?B?d3NUTDhNb2xZdVZpczRiWnR0NWZRZ1YzOWRXQjBkUGFZb3UycGpBSkQyaW1r?=
 =?utf-8?B?NE1LZU43dTVBbUdRSFZmNXVPWVhPRUZCdVRYeC9HK3dDbjJxWThJVHAwQSs3?=
 =?utf-8?B?eC9XYnNzRjBISm11VTI3WVY3WElSZEJRMXFmeU5vOVdOdVZiaURFRDVkUXk4?=
 =?utf-8?B?MFZUbG1OT1VKR1lscmpnTVY4MWJqaHN3NkNnRG1pNHMxZ1BReUhxNFJERnUz?=
 =?utf-8?B?NEtpekpQTG5rRGZrWlUrSkFsdlBzak5YNmdNcU11Y29qUThTTDgwakJPRmxs?=
 =?utf-8?B?eC92bnk2QkhKaXRDQiswT3plb2k4ZkNWcGVPTUp6U2paaDhMbnltQ1ZHN0lO?=
 =?utf-8?B?V2lDMnB4b2FrNnlkVjhyYnZzNDlVdUdWd1pXUzM4aythUUxlRTI2WHVRa3F6?=
 =?utf-8?B?VFJHR1k3Q0wzVlZ1L1drbUlUS1Nsald2SVQvNDM1eWYwRDJRbmxKWUN3ZzQ5?=
 =?utf-8?B?K2pZWFE0endYR0V0K1RCOEU2Ujd2L2t2V1RrYmxEU2hIVTcySGVZU1VMV2do?=
 =?utf-8?B?Vi9rQkZzVUllSjZPMjd6ZXF3R1ZnZHpXdUJ3Z2loZGZEL3NSY2pPK2lBT09Y?=
 =?utf-8?B?M0Ezc1BhV2F1TWZLZzFvRTdISVE0NXFhbmJjWjRvOG1vRzMwWXVRQXZOSUhJ?=
 =?utf-8?B?Q1orVEFtUDJ6ZkFUQjJRaHQ5akFNTVBSMmxZeUV2aGhuRFNVZkE1dDYzcmhz?=
 =?utf-8?Q?eJ3e8aH+KKp7vk79WR4MZq37tMqJOQ3v3OUDEzJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffba540d-8284-4067-10a5-08d960a11310
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 10:31:57.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzPu5c5m61r0/qzZMy0A4bigaXfXJqZRPWQ9OYzSTgk5dmF1ObL3j4/5Ur7EHlESdehBO64mU/YSbW5z9MjXmrIXd/l46cj7/hu9lWzoOCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854
X-OriginatorOrg: citrix.com

On 13/08/2021 15:00, Jan Beulich wrote:
> On 12.08.2021 19:03, Andrew Cooper wrote:
>> This was a clear oversight in the original CET work.  The BUGFRAME_run_f=
n and
>> BUGFRAME_warn paths update regs->rip without an equivlenet adjustment to=
 the
>> shadow stack, causes IRET to suffer #CP due to the mismatch.
>>
>> One subtle, and therefore fragile, aspect of extable_shstk_fixup() was t=
hat it
>> required regs->rip to have its old value as a cross-check that the corre=
ct
>> word in the shadow stack was being adjusted.
>>
>> Rework extable_shstk_fixup() into fixup_exception_return() which takes
>> ownership of the update to both the regular and shadow stacks, ensuring =
that
>> the regs->rip update is ordered suitably.
>>
>> Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_wa=
rn to
>> ensure that the shadow stack is updated too.
>>
>> Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow =
stack compatible")
>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> I'm not a massive fan of the large ifdef area.  The logic could be rearr=
anged
>> to use IS_ENABLED(CONFIG_XEN_SHSTK) by indenting most of the function, b=
ut I
>> can't see any way to drop the goto's, and this is certainly the least-in=
vasive
>> diff.
> It's not really neat, but we've got worse code elsewhere.
>
> I wonder whether gdb_arch_resume() and gdb_arch_write_reg() also
> need some sort of similar adjustment.

Hmm.

So there's nothing we can do right now, because GDB has yet to gain an
understanding of shadow stacks (or rather, the prototype so far is still
under discussion on LKML, given that CET support has yet to be included
into Linux).

Beyond that, I haven't seen gdbstub modified in a decade, nor have I
found anyone who's used it.=C2=A0 I'd be astounded if it actually works.

I think its fine for people using GDB to know that they need to turn off
CET first, but I don't expect anyone to have a pleasant time trying to
use gdbstub to begin with in Xen.

~Andrew


