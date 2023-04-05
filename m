Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C698D6D75E6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518289.804671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxw1-0006ob-T2; Wed, 05 Apr 2023 07:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518289.804671; Wed, 05 Apr 2023 07:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxw1-0006mJ-OW; Wed, 05 Apr 2023 07:52:01 +0000
Received: by outflank-mailman (input) for mailman id 518289;
 Wed, 05 Apr 2023 07:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjxw0-0006mB-9h
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:52:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd524ea5-d386-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 09:51:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 07:51:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 07:51:53 +0000
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
X-Inumbo-ID: bd524ea5-d386-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS2k3VFRwdUd2gf441Igmw/8E+ASuzlKPyItbkr+TJlI1jGNKyDZMxEff6JJM6sB8XqAkJnDeWcWaCgEIhY39ZSZXNrQ7VIv6BmZz5dqvjIqpmue986YH7JpZIal7qCmSubv0AN/6txgXYovuqCwUJcLziBVHFZ483Ykyhd8A7kQCH1bKkI1pYCNUEsN/rjc9rXD4ZZTg0f5eWsgRhI+u6I0Y8tbjGMCS6SSkm8GPFfxPfsw8tJ2RHIbrrKbycgMeq4MQd9W5hsbsWxotabbntqVO6olMI8I00xMHUFCSzEccElRIwzLwZJScu2yJ+qPo9je/Tc4RFLNY9re6HrQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x0+0wJ8Q4w/H40y6THXQJcjdg6Sf3VzaqPj3AYPlHU=;
 b=Qp7eM7wHo+9fF0GNesJqiFirLpsjArm97y8NYt9nzab5V0QS1oIyMRFwLz3QdkCEWSEGD63jL4IyHefgEJenNn95d7WeCoEUjNQm39NxIgPdGichGazBhfvHL0MT+PRmc5/CTbZk7c6bItcera0HVpPZwBa2YEzMyINrYcSkWOGv8/RKOFOeZ+UvaLEr8HvNdeQQcUdgckRz9g/m8u4jlg6apYaNsSRNcIFtAFF79WVeNxPaw8lx3s4RElP4ngKmQ2mh+S8rwkNG8dPB7KxNXVTlMtusa0jdcfEUaVh4MOyR5dAR8EIwW36ZnVXxlz0a4uTz8HYCHzO4rtY9ekmgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0x0+0wJ8Q4w/H40y6THXQJcjdg6Sf3VzaqPj3AYPlHU=;
 b=sZVXquaSgZ4fiEqIa9EvfqM3WADdNiCNYjprrgujvV4Gt2xWZ5QVGiphbz6zzIluzNDw9afpzfuJCGQZ22xegW0vQsRBuOpARrtxr/2Yc/3S/X3irhbY/J4J1e9ULgf9TPVUB0E6DLjLueYtgkZSJutMEH3hH+itdKIxDMKYIcs4zHPEDyTTj6UkFiZO53bWKMiXy0XbRhU9TYfvWe0E1Q7Qz/S18X6ktv3kFKoV9tqk/qQc8uGhu7Te5AvVfZ1j0hIS3K1CpXo2wQDBahFN9dfJXG7C2xRMumUScOS4Fs5EFWE6511R+vsic8tJQ6Y1v2a+LWdoTLOzBjv1fFDDfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <400b70cd-d2a9-60ce-0acc-a429f3f5a958@suse.com>
Date: Wed, 5 Apr 2023 09:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/9] x86emul: support LKGS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <1eb21ece-9d33-d8e1-1c2b-c682dbb1cda1@suse.com>
 <d8d72cc8-f477-abb1-f6fb-5aa1909b36aa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8d72cc8-f477-abb1-f6fb-5aa1909b36aa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: fc273405-6910-4852-3995-08db35aa9f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SIqlHaJ7CCYZnxiN14QlocvY7yqtXYEURDaMX5MnXnup6NTmoZbjtHAukxX12gyi7lpGFWLVV/bGDtRLDj65PotAfLJovJ9w6CSNrl+y6rWs0PPjXdAjVUgLH0hsB6JnsSyzYXeOALYJ/f11ks8QmSni8Js5hmRiux84xO7srlxPU0mClyvfp8G4Juug87I1MtYWk+75HAyFzLbyZz/1D33VBnWqHtW6NAFcvdl6B2ET9XaL+tWuYxWwyTrDzZw/T/UYVCIPwFcrflaREi3jw/0iB49s7gT1gFujqJaGTGiVO27uYkqevhI3/jx1UgGBLJnCGIoeO6H/exVOCB/Ek+M+PpsgGOzCMxZXConIvejOrh3p+kHx+mccohEsOVvNNimfyUXgnBnuYOW2xWBBdW5qYXfRVbnumCoaGE3o5jPRa8kyVAj3fanjTOfjuVmiZmFbEpuLhGfyJaV+QTt3ymvtnB8VQvBktgMJk94oATCGuyezLSeZ6jviM4IFB+WKZmXlpA3GbEEoNBkDKriJuDPRzNqwR6aAubxvByhk8xrRlruaF8yYTGnbfTNtNtj244nUvHjRWFAnNq48WCqBSibyWgeoMIEEYbj7LGqn8e6pavOM1cl/rFtWdBdngxMUEvLZgHRDgo6rI0Qq7Cw/vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(6486002)(5660300002)(478600001)(36756003)(38100700002)(31696002)(66556008)(66476007)(4326008)(6916009)(8676002)(66946007)(86362001)(41300700001)(316002)(54906003)(8936002)(2616005)(186003)(31686004)(26005)(6512007)(6506007)(2906002)(53546011)(66899021)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tsNis3MGlubE1GcDZDdCtXK05adHN3MjlhcWFhTmR0ZWVMQnNrS0hqQ0Jw?=
 =?utf-8?B?bUFmeE5ZWUxIRGJHRzY5VmRBelpvS0lNMWdYTjFqUW1zdVgxWkNIVzV5OVRa?=
 =?utf-8?B?d3RWYjhVcFRiN0RWc2hLcU5Ham1QS3ZtTFYrZ25YenlJMmM2TXFBSXl6QU0z?=
 =?utf-8?B?eTR1azNxZThwVlBzSEpZU1FudTZsSzJybjh4TXBSSkIrc2xIUWZRR1JLTXBu?=
 =?utf-8?B?bEprRjVGNUJxM0FTY2pYZzFYM3VNRXMvREVOTzBKZG0vamROYldJNGw5N3Vz?=
 =?utf-8?B?bi8vd0JoWVV0c1BZUVpuanVjRkRJR0N2STBtN25UcTNJcGpJQ0lWVDZPRGlv?=
 =?utf-8?B?ZEp3a0JhMFVveVdsbDhQRld2cElCL29YdTcyRjNyRWxYNEtjS3ExajVWSVFs?=
 =?utf-8?B?UnE1djJNVWc5dlJWeU1ibXVsTTM1K05VMVRiYzR6RlAycVhPeERtOW9DSXJO?=
 =?utf-8?B?SnVESnNWa1VUWGNCK2UyaU5OWS9pMUFhK3JVdXNNa3M3dmVtMk5JZUNWQzhm?=
 =?utf-8?B?Q0pJdEpHS2ZNNERzZTYrQkxjUXJyV1g2TUVQYlF3cG52U01hQWg0eHhjVDAr?=
 =?utf-8?B?UFV3Rmp6TnhSMFJsQ25GaVJqRlpYcldUcEFIWVBTVG9tSnI5MytsejBCOUlD?=
 =?utf-8?B?V1R6OWc5NEVXeVVsN1VqcXBob21DYzU4WEpKbkpGaDc1cHkvRnY3T0FvNHo3?=
 =?utf-8?B?dFpNQm1rTXRxZFdwOGtyOWJWdml0QW5nYnFhSENSMXhHMlc3RHBKcUUxLytl?=
 =?utf-8?B?NS9OcEE1KzU5Y2pnREd3RHNwYnFvaUNlejJYNXA4LzdNWWpZUm4wbytnQUl3?=
 =?utf-8?B?QjhkcEltRDZyZEZ5VkVaNWR1NnRpSEdlMWJEOXpIQkcrc2NMQmlxbFBWUGNp?=
 =?utf-8?B?a1FUN3VHVTQ0aVpYSVE2T25zMWIzVFBLdnZaRjNTVEppY3hOTG5ESC9uZVJm?=
 =?utf-8?B?VmZVRWgwY2NHRU1Bem9ldm9qcTJjN1dqcSsyL0tjbGZvNDhaQkttNWdXUFd2?=
 =?utf-8?B?NElUaXNXbXJROUJkcEJvak5GNFVQcjlaWnBOOHg2cnp3SUNibFhjY3o1UUtV?=
 =?utf-8?B?Y3hIa25JVTFuMWI0bk9EUjFWckpoZVJzd2pEeHdmcXYvMkZRUWdrQzBrUkdk?=
 =?utf-8?B?Y01rNWlia2xPVzh1cThQbHQyS0Y3RDdXbEIxa3pPRitkT0FObExLL2tuUU9K?=
 =?utf-8?B?RUdqTk53R3lzVk1OL2FJT0k5dTQ5RDdmeWdNYldrYXcrcFVaQTNCOUptNVBn?=
 =?utf-8?B?V1ZTaWNHd2FwTkFyWEJWQ3Z5YlNsN0xoL25yc0xlczF6WDJqSE0rcndDcUZk?=
 =?utf-8?B?VUozNDIyUHlXUDZaODZmR1Azc1BtREIyRm96SHhPa3l1czdpRHgyRWJVam9w?=
 =?utf-8?B?UTBFVXN5bTVXUUp5ellQaTczNEFVVTNqNVVmanVtN2owd2RmbUhZTzNEcDVY?=
 =?utf-8?B?QlhMVGdBSm1UZEN2RTlVa05wWERJMXFtbll4Wllvdy9HNmhuR0hHSXI3VzYw?=
 =?utf-8?B?Rmk5SndLNk5OQWZUZG1hYlhCemhiZXd0ZnVLM2p5UmxnVXdCOFZQdTYwRjg2?=
 =?utf-8?B?cXVVclI4Wk16cHd5c1FDM1JnVXZENEw2WExXSlhiL1p2SHV2aFZVb0FyVkUy?=
 =?utf-8?B?OTBLSjlSYmpBeFRUdVVTOUhrMlN3ZzlwUFdHS2JNM0EzT0pYV29FWlIzamZX?=
 =?utf-8?B?WXR2dURIenpDNXFwWkE0Qkh2SHE2eStrQlRodW5hVnRmWHd5bmN3SHAyaGhN?=
 =?utf-8?B?MVBSMFJQVUdDbzI1bTE3Q09sZ1I0bmxKcW5PaThSd0IwVlFVVTVCWmxnUzhZ?=
 =?utf-8?B?T0JzNWZSdWE4VkdKblVUSkxrSjdPeE1ERCtieFNDOTNNWDN3M29QWjdPZnln?=
 =?utf-8?B?MTgzdDdzQ3hoWWVjZ0RkRVZjTmwrNUF3N3J0Tk0rVDNub3crb3lrdTJCUGtP?=
 =?utf-8?B?NHprNjY5SlpaZllqaU1mS1RtNjNkNTFpZVRsRmZYUlgwZWpZQXRuSHNoRHB2?=
 =?utf-8?B?RnlrZVRKbnlqSlQrcXd5Mk05WEFrdTZhZ1M0ZkxQa0JKWVRnYTExdzA1UGpP?=
 =?utf-8?B?T0ZBVzFUTER1SlFodm9TOFg1aGt6d09rMlU0MFJTOGtzamVEbXB0RGFyR1Fm?=
 =?utf-8?Q?pjxhO3jw48EUhwNDAVEX0BGpy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc273405-6910-4852-3995-08db35aa9f23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 07:51:53.5830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+3YYYCOWQuonUCVN25+m4p0YeBxlD/vtv9Nf6wleOUKspmXxu3S+0mymrqAIIxuJQAWCxwX16NvvCaJzLx5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 04.04.2023 23:54, Andrew Cooper wrote:
> On 04/04/2023 3:49 pm, Jan Beulich wrote:
>> Provide support for this insn, which is a prereq to FRED. CPUID-wise
>> introduce both its and FRED's bit at this occasion, thus allowing to
>> also express the dependency right away.
>>
>> While adding a testcase, also add a SWAPGS one. In order to not affect
>> the behavior of pre-existing tests, install write_{segment,msr} hooks
>> only transiently.
> 
> IMO, the emulator is already complicated enough without us having
> fallback logic to cope with callers that don't set up all the hooks.
> 
> Nor do I think making these hooks transient in the test harness is a
> clever idea.

Are you suggesting we start to _require_ all hooks to be set? That'll
mean many useless stubs in particular in PV emulation. Furthermore
absent hooks sometimes cause default behavior to apply rather than
outright failure, so altering what hooks are present can affect
overall behavior. Hence the transient establishing of the two hooks
here.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Instead of ->read_segment() we could of course also use ->read_msr() to
>> fetch the original GS base. I don't think I can see a clear advantage of
>> either approach; the way it's done it matches how we handle SWAPGS.
> 
> read_segment() is a much shorter logic chain under the hood, so will be
> marginally faster, but it will be a couple of unnecessary VMREADs (on
> Intel at least).

And this is precisely why I think it's not entirely clear. Anyway,
the remark is here just in case you (or Roger) thought doing it the
other way might be better.

> We could expose the get/set reg paths for cases where we know we're not
> going to need sanity checks, but I'm not sure it's worth it in this case.

Probably not.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -2886,8 +2886,31 @@ x86_emulate(
>>                  break;
>>              }
>>              break;
>> -        default:
>> -            generate_exception_if(true, EXC_UD);
>> +        case 6: /* lkgs */
>> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2, EXC_UD);
>> +            generate_exception_if(!mode_64bit() || !mode_ring0(), EXC_UD);
> 
> Can we switch to X86_* please.  Alternatively, I've got such a patch
> which I've just rebased over all your emulator changes anyway, if we're
> happy to fix this in one fell swoop.

Of course, and I've applied this transformation to all the emulator
patches I have pending (i.e. no need to re-request this elsewhere).

> (Sadly, you did move some TRAP_* names into util-xen.c which I fixed up
> in my other tree-wide exception constant patch.)

Hmm, yes, I changed EXC_* -> X86_EXC_* but failed to pay attention to
TRAP_* (because there no build issue arose).

>> +            vcpu_must_have(lkgs);
>> +            fail_if(!ops->read_segment || !ops->read_msr ||
>> +                    !ops->write_segment || !ops->write_msr);
>> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
>> +                                     ctxt)) != X86EMUL_OKAY ||
>> +                 (rc = ops->read_segment(x86_seg_gs, &sreg,
>> +                                         ctxt)) != X86EMUL_OKAY )
>> +                goto done;
>> +            dst.orig_val = sreg.base;
>> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
>> +                                         ctxt, ops)) != X86EMUL_OKAY ||
>> +                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
>> +                                      ctxt)) != X86EMUL_OKAY )
>> +                goto done;
>> +            sreg.base = dst.orig_val;
> 
> Honestly, I think a comment is needed here, because I'm struggling to
> work out if this is correct or not.
> 
> There is a 64->32 bit truncation of base with LGKS, just as there is
> with MOV GS.
> 
> Which I think does happen as a side effect of protmode_load_seg() only
> filling in the lower half of sreg.base,

I thought that's obvious, as protmode_load_seg() can't possibly have
any other behavior. But ...

> but I think it would be nicer to
> have:
> 
> +            dst.orig_val = sreg.base; /* Preserve full GS Base */
> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
> +                                         ctxt, ops)) != X86EMUL_OKAY ||
> +                 /* Write truncated base into GS_SHADOW */
> +                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                      ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            sreg.base = dst.orig_val; /* Reinstate full GS Base */
> 
> Or so, because it's weird not to see a (uint32_t) somewhere in this logic.

... sure, I've added comments. I don't think "truncated" is correct,
as there's no truncation - there's no more than 32 bits we can read
out of the GDT/LDT. I've used "32-bit" instead.

>> +            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
>> +                                          ctxt)) != X86EMUL_OKAY )
>> +            {
>> +                /* Best effort unwind (i.e. no error checking). */
>> +                ops->write_msr(MSR_SHADOW_GS_BASE, msr_val, ctxt);
> 
> write_segment() can't fail.  (The sanity checks are actually deferred
> until after emulation is complete, and I'm not sure if that's behaviour
> we want...)

Irrespective we shouldn't start omitting error checks. If we truly
mean write_segment() to always be successful, we should make it
return "void". Yet I wouldn't view such as a good move.

> However, more importantly, if we actually take this error path (for some
> future reason) then we've created a security vulnerability in the guest.

You mean in case additionally the write_msr() also fails? In any
event, ...

> It will be strictly better to crash the domain in this case, than to try
> and let it continue in this state.

... we don't return OKAY in this case, so in most cases the guest
will already be crashed, won't it? Otherwise it's not really clear
to me what action you propose to take to "crash the domain": Right
here we better wouldn't call domain_crash() (or else we'd need yet
another #ifdef __XEN__ around it).

Furthermore - what does what you say here mean for the (existing)
similar code path in SWAPGS handling?

>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -295,6 +295,9 @@ def crunch_numbers(state):
>>  
>>          # In principle the TSXLDTRK insns could also be considered independent.
>>          RTM: [TSXLDTRK],
>> +
>> +        # FRED builds on the LKGS instruction.
>> +        LKGS: [FRED],
> 
> Hmm...  This is the first case (I think) we've got where a dependency
> that goes back numerically in terms of feature number.
> 
> Obviously we need to support it, but I'm not sure if the deep_deps loop
> will cope in its current form.

As you know my Python isn't overly good, but looking at the loop
makes me think it deals with this fine; I can't see an ordering
dependency. Looking at the generated INIT_DEEP_DEPS appears to
confirm this - there is an entry for LKGS, and while I haven't
counted elements, the set bit there looks to be in a plausible
position. The only thing I'm not entirely certain about is whether
a further (hypothetical) transitive dependency would also be dealt
with correctly.

If there was an issue here, I'd really like to leave addressing it
to you, as your Python is surely much better than mine.

Jan

