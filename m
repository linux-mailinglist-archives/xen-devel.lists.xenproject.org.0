Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DFC716442
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 16:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541206.843713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40Qs-0002aY-Cr; Tue, 30 May 2023 14:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541206.843713; Tue, 30 May 2023 14:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40Qs-0002YR-9g; Tue, 30 May 2023 14:34:42 +0000
Received: by outflank-mailman (input) for mailman id 541206;
 Tue, 30 May 2023 14:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q40Qr-0002YJ-Cb
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 14:34:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1adc86f1-fef7-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 16:34:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9849.eurprd04.prod.outlook.com (2603:10a6:150:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 14:34:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 14:34:34 +0000
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
X-Inumbo-ID: 1adc86f1-fef7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqlHOmkFwOq0MffOw6VxBtT+NatYoJ2uTWYscWjZbl3n7XqmP4NANWp9qIEKM5PFjmOe0OxuUk7jHgrGJ3NQ3y8oRFHe+n6yOk1IYSiyogodHLnW9B/6uRv0l+lsj4t1hPDYcAH0pkPgedGwvVV3COOHiW5gXvKe/Zh23V3zCXwnUAJCL+Pnvs36h8bPDz/GFnk7OqRzqyD7jLf/yk8VcmePOgoCa07c/ZFKQaIsJj49s42YWHVxhWvkdPt14MvJ6RlfaOPQu2EHuwx4I4n+o+qBJ8MRzbIKxXfnhYTX+S+1FVI1XUgCqZtyL/fPXFmKBSqSHW2DBBGInfPfKWkH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpRXDByoNE9WsjetOwuu1EtBBWEkCBfxMobchWVcKEU=;
 b=XMAymCj1pap7mEKwwjInHkub7tsQSF133uNLIhQoxM0+KNFotTkWde7sXggBU8MOUI912OR12VQ2GTwj3M3Wt+rtpWt3cHeLgaWc+rPWU+wszofexNVOOrTKJOCHa2PQ0b4/4H+tpmQip8pGAGRBjPrzJ7Fiwl37K70ayfSFgB4A7lM5UfTX/miGaPSi9KAB/53/C13kya1tv1MhNNIj/fdRUL58eWhPsGew2SVZP7cOk73a1DlU+lesSGs8NnyguZVE/E4RNg5N4ZN1S/6hARRhu/cPGZlsOqR83mWe7neT9VOK3uN/dyfxr7Xp6vIKRStnenhunUEalC9PHUJYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpRXDByoNE9WsjetOwuu1EtBBWEkCBfxMobchWVcKEU=;
 b=DkyTonzRn6hQdl58XM3JiTpFy2zzEqkjBo2Cq3XOKZCbUUxKgktV5slFXowJPT16DVORkj6twW0QdW74+ZWXwfir0vrFUJeVuldyPInXRww8TgMWc6ve92hVIUeC+yNdRcKx8V8xKbvlSZFYhHxxDOQN0LprTv0FJUwouC1UY7zvso9trwiI/BLoIkjgNP4tvsoS/BCqtL9R7tm1V2a1HpOkmblFL33o0PXoo72g/r2mV6Kvexn8n1lCZAxL44w/MuwzTTebBJSamIRFe03uZ2+1owF114nigU4ouSWdAlZnaEyMuLGDCAsHP8N4ZN7HJ8y9uuoKUipJsQ6A+fDFJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36eaea12-066a-c470-6a22-bc3c50db741e@suse.com>
Date: Tue, 30 May 2023 16:34:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] x86/cpu-policy: Derive {,R}RSBA for guest policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-6-andrew.cooper3@citrix.com>
 <8d31e4a3-3f3c-f7a2-8d7d-0b0febf17f65@suse.com>
 <db0a6132-4ee0-51d2-08b9-88a286bc4b14@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <db0a6132-4ee0-51d2-08b9-88a286bc4b14@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9849:EE_
X-MS-Office365-Filtering-Correlation-Id: d513cd20-5b7e-402c-27e4-08db611afcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUHwkhFgVT64SbJ8ZV3uDoTiqhNZG4rGcH7vDwUrmzn1ExPZNt6uh0MBXLTxkFGILaWv8FEqoxZUOnMmlTixfRLGvtBx3gMax10ruSP04cDGAvGb4u/R+Mfv1guc/BYugfMpHUDWGjbPwUuHg1Q5CeSwFfQ2Utyf0Sfkmjivpv7KvI8cGfQnpjBV2Bb8rzjYBj1MGpN3CRyZ/88Pgy7BAcv/x3i5hzEGKmed1Dn1jp+P0jLioBCoOSpsCDnVeqzXTjB4XTFK+qzmUJs/JGrjiSK2pfzAwrTP837wpJsS7c/lBHpJCzbt65lnZfie3jwNDKK40I79+ZLafgkPvOTq1WbgTFIGIgnVj5e3us8J77XVcimzuDaQxdyzp0cvxwq+84TYvoADAR1RE875QgdIE1zxcfkeaT7iQwFrPSbDfuiAosiDy3+E3rN91/j3HmQk9nj5hezIfpB4eE0SwW4uRIS8FpwA8Kvc2IwbV9HPH6tHfWenu0d2vQ5X2Jm4TVPK4O5enINKBs8vRXAqtW+DgASQaO6V5sp7N9DOG/pd7SWk3Fyf3NAL5QkQpTv11BWtm9mbaaNYDJwXCbrkY7F8zSBE6EL+V5kxp2mw4aYFcd2hoYBlFgHI0osGpAL5WgH7NIGsfn1SBaDguXO0qFN/kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(26005)(41300700001)(38100700002)(6486002)(186003)(6506007)(31686004)(2616005)(53546011)(6512007)(478600001)(54906003)(6916009)(66556008)(66946007)(4326008)(66476007)(316002)(5660300002)(8936002)(8676002)(31696002)(86362001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdHcHVqRG15ZVVnTGcyaEx2eFhUT1VNdkhHNnVtMjJoWSttWVBFRDRxdUZP?=
 =?utf-8?B?azEwWnowaEpWS3BGM08xMzlsUkVLNGVFd0pXUzg5REJ1VE9VRzd6NWRjR2cv?=
 =?utf-8?B?SWVhOHN4dHdNcVNQOHhIU2lKS2lxdUV2TEFTa1A2Uk1yQmxJbVRjSmQ0ODh0?=
 =?utf-8?B?c294U3FHNWtMWHFySjUyeEhCa2twRkU0eGQxeXhQSnQ5cFdJN0hNaS9PVWp6?=
 =?utf-8?B?ejk3cmFXSnFqQTJDR2E1QVVUSWdqbjIrV1dkc0dkd2RtNDEwV1lJMDJ4TEN0?=
 =?utf-8?B?WkI4SFErZ2pKem9KZG81aUpUazZad1VBazRuRDliWGlkNmEvZ2dKZUFocHlB?=
 =?utf-8?B?QW8rSXJpa0JVREdzUktzVEs5dHBFUGxlZURMaE1DRzhueVdSRFMyc1B1RStm?=
 =?utf-8?B?VThsN1FVeVNnK0FsSkk1SklYRzRhdWJvek5GdFBta1FaalYxbmpwTG9CZzZI?=
 =?utf-8?B?YmNSREJ2cWhoRzFuSnl3aFBhZkhuKzUvWHFHeEtQckdSNzJWWnQzUCtMKzhZ?=
 =?utf-8?B?NkY0RHNoS0FQUXNZYUI2U3Z5TWlEOEhBTHZxRGRUeGhIWnhvUzRvVEFiWkFE?=
 =?utf-8?B?NU9PVXpjLzNWY0FJUVQ3V3BsZXJxRUVHa2E5Sk13a2w1b0RyV0JXOWdYZU0y?=
 =?utf-8?B?MGk3K25LNlU0L0lzOFFjSHM0amxPTk1NL09EZEx5YmpoZGF1aElHWGZtaGc2?=
 =?utf-8?B?N2hnMmI0b2ZmWVd5RlQ3MTBvK3VHUWZnQWErZXQ5N3V0YlY0d2k5R01JeHgr?=
 =?utf-8?B?RTBqN1FFNlc4cFBWWEtJbDFvVWg1eDV2b2VzZVQvSktWSERpZHZHZk9mTVRh?=
 =?utf-8?B?QUM5SThGZytoRVlhaXBmN1Y1bFAwZ1dTRjZxTytnckM2WE0xS0doUUlJMVpH?=
 =?utf-8?B?VStyc0oxUzdXa3VKV0RKem5LakE0S2FNOTJic1AvQlFNVTY4Y1lRSU5lbUNU?=
 =?utf-8?B?R0hOL0czem15bEk0Zm9SdzRrK01WM2ZPaGV4bWs1N2xqRGh2NndqV0pCS0t1?=
 =?utf-8?B?ak1xMUZMaU1ETS9zaEsyai9kUGtVRFVZUlp4bWpDQUZVSHFFZzVEZkFZdWwv?=
 =?utf-8?B?K1dWVnpVT3Avem5qZ1Y3WFgyZnliV09ObnF3MFJRMmNNTEx5QysxemhaN0NW?=
 =?utf-8?B?czJya2YxTnVmeTNzZHFjZDNwUzBXWVd5MVdoUG9qd1RQekhhem85dXBTRmtC?=
 =?utf-8?B?OVZvQTBhYXEwTFFLZWNwNkF4T0VqVHlPZGMvSW9jb25DUWh3cGplMWhZZldP?=
 =?utf-8?B?Szk4T3ZBVWZ1STc1STZCbi9hQ2NrUkp2dDM2cGVGeFkyQUdvM1Z3NWFEM21k?=
 =?utf-8?B?TXNrWnV5RXdlRGR5NkMrTVZtMGMvb0sxRjBlZjZQOUpKUkJaaC83aWpOTWxK?=
 =?utf-8?B?NjFabkk0Z3QrcWdlemlGNTd4ckVjcXRYVUx6cS9mN2JHRzZ3cUtETGZHRjc3?=
 =?utf-8?B?V0IzVURHM2hqWEhMbC9hTktmOHFvR0tMVElQTDEvTUFLZ2FuNXBnN3UwcWNz?=
 =?utf-8?B?UGZjUXBoekJYbDVMa3RSSzluRXp6b01XWERNRzM1UkM0czNHcnpreEhGRzRV?=
 =?utf-8?B?Q0ZJK3IrRmdNbWpnZ2E5YjJwOTNrMmRYWldzdjY1RDMydExjMm54cHpDRTg1?=
 =?utf-8?B?TWJUaGZPRHNBSVNWZmp6aU1ndnVZQlBqc2l6M1NmQy94anZUc255eHBmNWVv?=
 =?utf-8?B?U3U0YS9RNTdpSU10cEJNSzUvSVpyRVRRVmtlWUwzUDZ4RjNhNXNEZDNtQzQv?=
 =?utf-8?B?ZnlDaWxFMkdpR1hlV25ESkhKb3I4UUZqQjN1TmlKWmllU1FKQzlieDlWQVVn?=
 =?utf-8?B?TjlGZk9jbGM4VjlITUFQWUVpZkFMSlNmb01OeG5acUVHeC9MTlJKaHp0NzFM?=
 =?utf-8?B?dUd0emNub1NBRnBja1M2VTNvKy9vOU1LR1FiNHpTTFUwcnR3RVQyNmJUQlc5?=
 =?utf-8?B?MFQ2blptRUx2Nm9Td2dIV2VDUW9NOEErSGNCUnFYWWJOS1VKSTUxczRiMitZ?=
 =?utf-8?B?djVHUmt2R2lOaTJNMkFpdGJ1TFFxcVduT0hhOEpIeGczUFVkcDlpdUoyM1ZW?=
 =?utf-8?B?VUNoSTNBV0taU0hCWGJZTVBSUDh4SUlBVmk5UXpZYTN4dTNhOUFrQWZYcUFK?=
 =?utf-8?Q?4po8CGs4GpH/+fdXdUJVdYmYW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d513cd20-5b7e-402c-27e4-08db611afcb5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 14:34:34.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRYihnEJh09KBRxBzkpD+xFgLdXoB7Xjh1vCo5eF91n4nFG8UhoCjpFwJMitAoeXb00j2vHHtlmeFf25ZBaZkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9849

On 30.05.2023 15:25, Andrew Cooper wrote:
> On 30/05/2023 10:40 am, Jan Beulich wrote:
>> On 26.05.2023 13:06, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu-policy.c
>>> +++ b/xen/arch/x86/cpu-policy.c
>>> @@ -423,8 +423,14 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>>           * Retpoline not safe)", so these need to be visible to a guest in all
>>>           * cases, even when it's only some other server in the pool which
>>>           * suffers the identified behaviour.
>>> +         *
>>> +         * We can always run any VM which has previously (or will
>>> +         * subsequently) run on hardware where Retpoline is not safe.  Note:
>>> +         * The dependency logic may hide RRSBA for other reasons.
>>>           */
>>>          __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>>> +        __set_bit(X86_FEATURE_RSBA, fs);
>>> +        __set_bit(X86_FEATURE_RRSBA, fs);
>>>      }
>>>  }
>> Similar question to what I raised before: Can't this lead to both bits being
>> set, which according to descriptions earlier in the series and elsewhere
>> ought to not be possible?
> 
> In this case, no, because the max values are fully discarded when
> establishing the default policy.
> 
> Remember this value is used to decide whether an incoming VM can be
> accepted.  It doesn't reflect a sensible configuration to run.

Right. I should have dropped the question when seeing the "default"
counterpart's behavior.

> Whether or not both values ought to be visible is the subject of the
> outstanding question.

Pending the answer there (and whichever easy adjustment)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>> --- a/xen/tools/gen-cpuid.py
>>> +++ b/xen/tools/gen-cpuid.py
>>> @@ -318,7 +318,7 @@ def crunch_numbers(state):
>>>          # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
>>>          # as dependent features simplifies Xen's logic, and prevents the guest
>>>          # from seeing implausible configurations.
>>> -        IBRSB: [STIBP, SSBD, INTEL_PSFD],
>>> +        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],
>> Is this really an architecturally established dependency? From an abstract
>> pov having just eIBRS ought to be enough of an indicator?
> 
> This is the same as asking "can we hide AVX512F but expose AVX512_*"...
> 
>> And hence it would
>> be wrong to hide it just because IBRSB isn't also set.
> 
> EIBRS means "you should set MSR_SPEC_CTRL.IBRS once at the start of day
> and leave it set", which to me firmly states a dependency.

Hmm, yes, now that you put it that way, I agree.

Jan

