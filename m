Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3459DB12
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 14:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391944.629995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSb4-0007rU-0p; Tue, 23 Aug 2022 12:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391944.629995; Tue, 23 Aug 2022 12:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSb3-0007og-Tz; Tue, 23 Aug 2022 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 391944;
 Tue, 23 Aug 2022 12:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQSb2-0007oa-JZ
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 12:01:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5100f8d4-22db-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 14:01:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4883.eurprd04.prod.outlook.com (2603:10a6:208:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 12:01:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 12:01:19 +0000
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
X-Inumbo-ID: 5100f8d4-22db-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV9c1pnI1lUQPCSDtHR8h5c0+1oxgr/GPWKaWRB7hFRfVB0t2rDZR2zcKrb2FgtwacE9NUCcWCyvoowVOccCmxvSJBzkLa7/B8PW3/87Jew7mtYlc/aMDKVKzqK9pjsGFxpCOBTUJlCCcbj5HafwD+D9n16xD7e0W3Di51FCMcEuyzpYmB78yJQBENKj2e2+OIbMR1jzxw1r84Z+ba27HOR+8u25cYto2NbAf/iJQ1kV4Wj6z/RtHk5c0ZhPhYcCAoGTW9LGIuyWyoVCLz1bdJkdZgctU3MZ2ni3Msl0tv/fHXZ9WR9W/H5vRTTS50X7QX9Y5bQZOit3SXzInJadCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=917xEOW/jGptWxGBU+dV3BfQdpbg9XQh5tb4yZWsCUQ=;
 b=mZICr+7lnf09eSmlviyBKUkA16nbFJssdVyBQiGd0ZRxkFqmaI8l5t5cR87VV8PDoaSaXN+6V/2OOL/EqBe3L43BWa/Vo3g41gONuDs0WY7ZsdmCFHky7q9yvP+7m+xU9BswNHKA0Kyk18oOBwNRHBMJ36G1SbG9eOXdiKcngiyyF4spbO2ScqvCrqIAuqnwfmZ4RYHZ2X80MzQLIRxr6AWO7UhJjjfbVFQGK2LKMy5NlfjfVaSe2bk+9gLpKxjISHlbCKwtSXfIhOtYLEKGypij3q2Gcr/T+m1mQGDB/7fBSjeg7Ey8d6haJCUZ7U8UjE2lK9Kx8xjL6EjnETV/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=917xEOW/jGptWxGBU+dV3BfQdpbg9XQh5tb4yZWsCUQ=;
 b=Ru86wBKO596yA/amYfANS8ZeNy2m4SqRY2gKTsnlpvTXwNXpmjCtwgW7QrRE8evhetssKn0//cEATxvnsZrrTCVI5AV9d4+kCUSTkM3e+oMN1WqfW+HYZZUAoVF+dnUs71YnRUUfJI0F7SqMnW2eU+2Fw4RhNgs3VPLDDFHXS1G2hx0JwMACb5z15p31Dus0gF8jjsAT+RUgB9bobszZr/c1MMpBwMM9W/+0X7PjrDPdARPMgKMRswzNOlYFe4aCwEc8xhi3TxloJ7+uNbswTSEJxv5bxFS4NxrRht5KYiwlVrgM/R4VKuroH5Q6BPnljnMADf5Px02ne2zptSoFjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9de03a3-77cf-bc90-be48-ef6b1f133661@suse.com>
Date: Tue, 23 Aug 2022 14:01:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251d0e97-3d19-41ba-3900-08da84ff30db
X-MS-TrafficTypeDiagnostic: AM0PR04MB4883:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nfIQUXcW3HuoQHUXo0fI89EIzQp1MORN0Li61AMif/bMYdBy/iE+Uj9qZzjVDExuMfilF3Ks4oHo3EQLDUsXDwfTVM5Uru4+RdTwUkWdtK9A5ZqX+cTPxcpEGMJTJ9khTDThpxl7XlPJ28LYzfj2aOb2++wfc/oiCReEqVNs7rX4Og/fFTfK8J8wVu/4kE4R/sCNTUB7tahH+waFzEaETbneqRLJ6sqWnGVFo2eeKWUoW4eTa2l96y7O0fkA8AV0S+zMT/rNsoEnm74ZnpS9hyo2946KIdDJqbZun/SgIOL2sagaDzSFD/1Dy9a3W/gnrVgnGNtttdXEPdKd4s2uAUcwjG42qg1ZaIuVx7lhVXUGFnbKyqrkWF4+evYij2Qd8vj7CeWYNT6VQcHYUPp9DBTRLeTkN4UggHCupnO7AJhfm4WzVMcoO58GTr6UxviP6evmXdvvIvvl7Kfe4jTOzhDe0tPH4Ib7SvnVQhoAz+W6HDHG0MubUlScWj9aHgOfbNsHHcFkd9tjZKXrK1wTkOeBLe4ZAZz/KH3Gvz4NKjLtnU3xVOzE006VBVKQVhDHFFkp48P2z2ctf1FZThhKtjOpMl1z1LHEj2JmSVw19ehUBmF6JMlbDXgHKSGMq9v4MebojC+CCnelPgIicbUreMZg8HOLpZ25uBhdiL4Nv99STxqZF1nB1uRK5kNJcTOEkrVAUpapNw3IsiLEAygdCv2INI89YTOuRS2twz8kqaEC0kVwNsqEYQMTWPOaKG7AAX3RccSBR9f4ImBkmPdKiBS6X+xP4hOBK25rjyRZaB73nzsverZ8j5L6JHx4hkKRRN5cjykOVhJKwQzdI+Augg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(366004)(346002)(39860400002)(54906003)(2616005)(36756003)(186003)(38100700002)(86362001)(83380400001)(966005)(316002)(6486002)(6916009)(8676002)(66556008)(66476007)(66946007)(4326008)(41300700001)(31686004)(478600001)(31696002)(2906002)(53546011)(8936002)(26005)(6506007)(5660300002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGxucWUwQWg3YkpPMlBwcmsrV2hHSlEyYzhmNHZMbm5KN2wwV29jL3k1YlRM?=
 =?utf-8?B?elUzaUh5L2xGOFR0ZWVzN2MrV081QXZGWnBIMG5mdU9mTUNlYXRJaS9RM0Fh?=
 =?utf-8?B?dVVld0d0blVDaXR1aENMUHZhQlp5TGl6YmFjWkx5NkEvZ2twWXJLQXYyWXRa?=
 =?utf-8?B?WVNqdVQzcTd0OXhnMko0MGF4MjNhU0lXK2h5cHJodHRUVTNhckU3R3NZdUtO?=
 =?utf-8?B?ckV0eUZUQ0ROOGswaWhjdWhHZVFYTXZSc3E1T2xTNm5RWTJhc1YrWEVwYTRN?=
 =?utf-8?B?YUx4RFZwSWNDM2haTjVqV0VSOEg2MHZZcXY2MlpZQ0hycmR5cnlEQ3p1QWZE?=
 =?utf-8?B?TjJ2NjJSL1ZMaGZJUTVVaDNSTitBRWNwNDB5bENIVHd4K2QwdUs5LzI2eldN?=
 =?utf-8?B?eXAyQ0pCOVl0NVVra3FwSnNLaEhabzYwRXd5OUU1WDJXK3dKNHVxZ0t4ZHV6?=
 =?utf-8?B?eXVVODhRcyt6Mm00MEljOUVaajRWNDlGSW5WcHVFRXNFOTVDQmRPVTAva2ZV?=
 =?utf-8?B?R1lqc3dpTEIwVUhpc2RlTHhybHFVZWxEdlljencwTDluWDV5RThWM0FTY29h?=
 =?utf-8?B?T1JMc0ZIcGllUDBlaElGSGRjeWRLNzhndnRwWlNzcGJiZXN3Q2xkYjhEQ0Ro?=
 =?utf-8?B?ZnVFMUdOOThQdWVybGhOTnk3dXVXSkhsMHJsdWFwUGpJOGFubzFxWjcvZmtQ?=
 =?utf-8?B?b01xZjFUZVZuLzI3dDBWaHBGVHM2V0lFMjVRZUZzQUdCMG95dk1aSjV5SUFt?=
 =?utf-8?B?Yk5BZERWL2lWVGRNWTJsSGhMMWJaYnNySmh6WXQzOGN0WGwzQzc1NE42UTJR?=
 =?utf-8?B?STlKQ0F4dDR3R3Z5S2JUazN4ck8zMG9WWEt3eXNJbkp1ekpCaXQwOVM1RERt?=
 =?utf-8?B?bGtDZlVHek5wVlVZMWQzaEZibzVZcjFuZW5TN3M3UXl3cWpsNklaMXVQaEpk?=
 =?utf-8?B?TVJpbjhiVzdyWHFtbDJPbjVDUHR1NndJM2NBLzRLRDZiQnpqSWRwK0s0OEo4?=
 =?utf-8?B?WG1OTkNzU2krd1lWcy90cGRpUThDdHN4Y0ZRblZUeTkzYWhEcDg2RXQvZlE1?=
 =?utf-8?B?TG9sb0ZFcW1sREdFdy8yOEtWenpsZ0liang4K1FsbTVHb2VMNEZWT0laeG4y?=
 =?utf-8?B?UEJKWC9xSVJSc2pZNFJCbXFScmpTODByOGU5ZExiVVNtNUhEWEhYS0RsOXk2?=
 =?utf-8?B?aVlXem03cmpUY1cycTFxM1ZVdWVKMkI1b3M5TzRXMGZPZmErekFCZTBRZCs5?=
 =?utf-8?B?L3dEckVuQmUvR2V4TDN0bHVhMHlVY3puZUxsL3ZyT09ZMXNJM0hEWTBvWTFY?=
 =?utf-8?B?OFFibnVtdWlmZk43ZFhEVFVNUWllamJRb2V4RVczSnpsZmROalM2c2hodTd6?=
 =?utf-8?B?NklGUTBCSEpzWUN4bmNuayttZHR3bFpkQUFhc2NuZWRnSFA3NnhEL2l3K2p6?=
 =?utf-8?B?NjVqanY3ejE3MWtLKzBxNW55Y0Eyb1FibTZuMjloOXBRc1BuZmZXQ3Q3MUZL?=
 =?utf-8?B?N2FiYlpUZ1I4eEh5NXV0b2Q1ZkdFc1VWL1ZXSnVsYmh3SGVKMTFBN3I0Vyt4?=
 =?utf-8?B?RDhrZEJndVNHbnpVWUh2TENPQ0F1NE9oMUY0MzJDV0IvNERsNk9VL0dNQkFR?=
 =?utf-8?B?RTAwRXpOZlRPRTd6VFh1MTVxcHFhYlV1YUJOTndrMnM3b0FtdnJ5bWtrQ1dT?=
 =?utf-8?B?NThKNGpKem1kKzNYSUhxRTBhU2lTemZyYWtCeGI1T3creUhhbkRVNmdabUFU?=
 =?utf-8?B?RmpWbnhGZm55cDhVS1RxRlRYQWJhMFh6SkI3b0RuOFRISTBtK09vd3ltTWgw?=
 =?utf-8?B?Nm15eXg1Tk9NYUFTTVFER2JsY2gvdjE5TFUxS2xNbk15aGdRNzZLQ3ZySGxF?=
 =?utf-8?B?ckl3UlpwTkJWUElWZlZ4ZnNGeVFtOFlNT1A0WmlXdjJXWkNHVTdpUm91aTgz?=
 =?utf-8?B?NzI1K0pyTjA3TDdVdHdKeG1XNWk4ZXVWMVFrVjhIcHF5ZytOZld2TjRoa1kr?=
 =?utf-8?B?a2dXWFVMREcxaTZrZFBldmYyM25PaFBIcm85V1VIYTZKbnFiWHFvWWpTZ2sx?=
 =?utf-8?B?aXE2dG5MenltcGFtSUFwMldmTGNnNnNDYVduQWp4aFh3Z3BRM1YrOVBET2tE?=
 =?utf-8?Q?H5Oq/X7C5wXoJ5rf7pnpkQ53Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251d0e97-3d19-41ba-3900-08da84ff30db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 12:01:19.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIN2BkAKH2fhO1rRWiIJ5IlgNb3nCx+0j+NBCWMt+rUXFhhPQQpMJYMrN4nmax4D0UPTxD4X2YW/rWZpy0MBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4883

On 23.08.2022 12:48, Andrew Cooper wrote:
> On 23/08/2022 10:27, Jan Beulich wrote:
>> On 23.08.2022 10:59, Andrew Cooper wrote:
>>> On 23/08/2022 07:42, Jan Beulich wrote:
>>>> exposed to PV domains.
>>>>
>>>> Considering that the size reported is that of the compacted save area,
>>>> I view Linux'es assumption as appropriate (short of the SDM properly
>>>> considering the case). Therefore we need to populate the field also when
>>>> only XSAVEC is supported for a guest.
>>> This is a mess.  The SDM is fairly clear (but only in Vol1) that this
>>> leaf is specific to XSAVES.
>> The way it's written my assumption is that they simply didn't care about
>> XSAVEC when writing this, or they were assuming that both features would
>> always be supported together (yet even if they are in Intel's hardware,
>> the architecture should spell out things as if both were entirely
>> independent, or it should specify that one takes the other as a prereq).
> 
> Real hardware has XSAVEC == XSAVES on Intel (Skylake) and AMD (Zen1). 
> Despite an attempt to separate the parts of the ISA, they are
> inextricably linked.
> 
> It is only under virt that we get XSAVEC without XSAVES.
> 
>>>> Fixes: 460b9a4b3630 ("x86/xsaves: enable xsaves/xrstors for hvm guest")
>>>> Fixes: 8d050ed1097c ("x86: don't expose XSAVES capability to PV guests")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> CC Marek.  Looks like Jan has found the issue you reported on IRC.
>>>
>>> Jan: Be aware that I submitted
>>> https://lore.kernel.org/lkml/20220810221909.12768-1-andrew.cooper3@citrix.com/
>>> to Linux to correct some of the diagnostics.
>>>> --- a/xen/arch/x86/cpuid.c
>>>> +++ b/xen/arch/x86/cpuid.c
>>>> @@ -1142,7 +1142,7 @@ void guest_cpuid(const struct vcpu *v, u
>>>>          switch ( subleaf )
>>>>          {
>>>>          case 1:
>>>> -            if ( p->xstate.xsaves )
>>>> +            if ( p->xstate.xsavec || p->xstate.xsaves )
>>> If we're doing this, then it wants to be xsavec only, with the comment
>>> being extended to explain why.
>> Why would that be? Both insns use compacted format, and neither is
>> dependent upon the other in terms of being supported. IOW XSAVES alone
>> and XSAVEC alone enabled for a domain should still lead through this
>> path.
> 
> Hmm.  Because my fixes to compaction handling haven't been committed
> yet, and in particular one the one which makes XSAVES strictly depend on
> XSAVEC.
> 
> In which case this hunk is correct for Xen as it currently is, and will
> be need to be adjusted when I rebase the compaction series.

May I translate this to an Ack then? Iirc there were no other change
requests.

>>> But this is going to further complicate my several-year-old series
>>> trying to get Xen's XSTATE handling into a position where we can start
>>> to offer supervisor states.
>> Where do you see further complication? The necessary fiddling with XSS
>> here would of course be dependent upon p->xstate.xsaves alone (or,
>> maybe better, on the set of enabled features in XSS being non-empty),
>> but that's simply another (inner) if().
>>
>> As an aside, I actually wonder what use the supplied size is to user
>> mode code when any XSS-controlled feature is enabled: They'd allocate
>> a needlessly large block of memory, as they would only be able to use
>> XSAVEC.
> 
> This field is an already known kernel=>user infoleak.  There are threads
> about it on LKML.
> 
> But it does highlight another problem.  This change does not fix Linux
> on AMD Zen3 hardware, where the kernel will find the CPUID value larger
> than it can calculate the size to be, because Xen's use of CET-SS will
> show up in the CPUID value.
> 
> Linux needs an adjustment from != to <= for this check.

I was wondering about that too, but if I'm not mistaken the change you
suggest is the opposite of what would be apparently safe there (against
overrunning buffers). Hence it may take more than just the comparison
type to be modified.

Jan

