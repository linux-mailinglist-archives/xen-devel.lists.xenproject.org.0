Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D95751A4F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562986.879837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJr4l-0004un-NG; Thu, 13 Jul 2023 07:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562986.879837; Thu, 13 Jul 2023 07:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJr4l-0004rW-Jz; Thu, 13 Jul 2023 07:49:23 +0000
Received: by outflank-mailman (input) for mailman id 562986;
 Thu, 13 Jul 2023 07:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJr4j-0004rM-Nd
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:49:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ef1ec5-2151-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:49:19 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:49:16 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 07:49:16 +0000
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
X-Inumbo-ID: c5ef1ec5-2151-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsmTe9e9CqaqAZcFBtgOTyh5dchxgcew9QBvkFa2x34+QxJfnaNMAXT+x8lD90KFXMXkhxmfRffYdZaEaW72FEIg6rrMa259VigcfEo+A+iB1nGGR7VaHgGx3AS5D53sX8MLKQfekErWvX8U2ojlw9pyv2kkL3P67StEKHykvFh+J2ORSV3uQeib0Amk1ewZMuUwYG5EUQM2G/3quSllfejZTpzfNciGb5/ysAPO4irV4O4AD7u4JFPQyftTLyyEtsw54k50HPNwhJRARL5+7h+wRCOvB1Izxx/vNY531709AFdzM98kQSbiyjfQZYi/5O89nwXX81c1bZKiWSmSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjO+xW2IuCqUIrUfCx5Fb7+6nhCjDXBnnfII4gE1vTE=;
 b=jOZhQBB00dv4eNZ3Hprh+/l1Q8hX3f44TW8OUqNxF08jZKvUg2vTy+J5fmqAJrb9lXtQEO8uyylIz7Br62spu9dgFPpd3YRyeomKSoleIGtV1oh4bOaHO+rui636iUtj9GMetCez21KlGNOv3P7NdS50iieD+z//dmH1RyMN38H2J8lba5Gg8shqPvSfoMDrhebo6dcFmKP07yLK4H+qWeOGl4heWuGVCOjRhWuW4eJZ8m00wmAiSgwA+6kRkMXDovOUr9eSj+wrK7L0is72UHqzprawmlbY8DtYcpKQpr+ZC3b7zEQkM1ajrgCsiNqpbRCVG/dkWUOdswZF/ZgxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjO+xW2IuCqUIrUfCx5Fb7+6nhCjDXBnnfII4gE1vTE=;
 b=qtMOb3p0XHAoHJf2TmUbJFyEcbb01Dyzl4NIUdGGCpUV2pXlnkZCra2I7DwYZMtWR9dZ8sVhCBBdcPwrlkgR/nKs+//nEG0RT1yfhZMA7fqv45jJsTn1jg8gs7yKkNBeC1VAW53mWBIvdX2Elz1KC3axOZz79BPB1YgRVOMNYEBa5due4c/ZNHdP9uZtg/Xu89fxYSItawI8P/FhITx5+YTNaKuwlZzwJOKSTD5GoLQgMjtKDtUoUfX7unzlfR7Syl9y52YoGT2Jcj77fVKVCLrlzgRSsgJA3QpTEISGB+NBzr3zfCpfDuYoM+P5JjMls/KA3XZ0836dvTWE6TuLgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
Date: Thu, 13 Jul 2023 09:49:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ac35c3-f73b-4398-fcc7-08db8375a81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Bq4dsf0wXYppoKh2X8wjnvSkmACw8r5sM9lGfHUqmatPakYs82acQVavsnWTmc/xWzw6PgdCIK0SxCdk6UBTCvJkRSVQhRza9j7+BXBgfZpAMJrCmj3jEIrS4KOMmdV8qJVpvRo2gQmbUG0Tg8wCIccvGxTsCNw2EEE3WeonRiAHFuIFWPVSRrYu+0OVIDDKyBUln78dVVDjwdtMsTfhq/ycx4wEGJ2aSHgaNml6WXdmhLTC/lbIpQy+nXpSTQt2YBxprwRU/WczebO4sw4ITaDyqnKc/Wjeo4QZiMr+0lE49IpD2o3C8mmZZYMtRg/4s9EMJ6aAO1/4mWHhtzcREsm38IxNvRkAW7u2T0aFLQD2bLYgWCfi5M4v/iTgtp6oe6Yff7Tblp+3Q2cIuCX0HbLmaTb08U30V+IDPm7Q1ZaX7cLKqKMjztjLOTiWCJDpOGN8GAQk1AbNB4UNCjn/L8TjHgzPBkhr/WTA4Pc/KWAc2vON4aL/kFbbJcJukEWouW67srDYkl0ixW4klJkvSvCXZA+/eArG/zCqgcKJGmTQ/fq7LSp6BBYDhj5V3hW7yTmiPMorPbGrqBDy7Riaq61KhSOjMbq36i98vTq2Dl5LQPMGt6mOvs7nMmVAT/GtiX7c5v8DTyb3PHAj/nYrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(54906003)(316002)(186003)(66946007)(6916009)(31686004)(4326008)(6486002)(66556008)(66476007)(478600001)(41300700001)(6512007)(8676002)(8936002)(53546011)(86362001)(31696002)(6506007)(26005)(5660300002)(83380400001)(2616005)(36756003)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czB4YXArb1FZQVhQaXZUUmR5dlVtNlZJOUJUcHZ2VUNieGorRHd2RUxzZU53?=
 =?utf-8?B?ZytVVEgzOThFd3FqSE53dTh6T3NZSjJiVGFGN3p2QmNQemlISVF1S2J1WXRr?=
 =?utf-8?B?UHp4cUVORjlpcmZhYUpPNzBGVXN2SnlRYVZNUWJqOFMyejJJSHFjMDJGd2dn?=
 =?utf-8?B?emo5T2o1eG1ST2c3V042RXNEK2o4MUM0YVVvZ0oyWktKczlEeVRUM25UV1R1?=
 =?utf-8?B?M2g4WVhwMHdPUXg2NXlhNmFJc1hKaTdtamRvbUZHV3dxckl3ZVl3YlRJUUpi?=
 =?utf-8?B?Mi9oLzIvUHJHZjFhWXI4T0pPT3lmL0w0SWJlZVdpS2ZmMVF3Z0xRWGp6bDlG?=
 =?utf-8?B?VjQvNGpxU3B0NkIvT0x6QWxqem4veDZoeTA0eWVqMStxU3N4cVNibDlGekFi?=
 =?utf-8?B?c25qSlJKWUMzS0lWWXlvWUk5dlg5dTZYaklPTzZRUzJZVFh0dGJrRys1UnFO?=
 =?utf-8?B?M0ErV3Bla2pZOS9ZMUdaMXZ4a1JKV09rNU93OGM3REpXenI5QjU1ZzhuYUdw?=
 =?utf-8?B?WkVzQ2VXTFJiT0RLcFhESjdDb0NTWVhYQzB2MWJ5SkdzN1lBZ1FGdXNXTDhU?=
 =?utf-8?B?VWp6SVNsUTFUY3c5c1pMelA0Q2N4WE5hcjdrRUMzSXVGY3VTcWJNTFZFdyt5?=
 =?utf-8?B?OGRSUUpGWkM2a0RubjhtRmRSKzBQOXZIcjFxQXhCZDBBaDdrMWJackxiVlYy?=
 =?utf-8?B?dW9aL0hVV0VLcUlPbHFPdGM5TjF2R1JROTEvd0J4STk4TFZMTDRWWUJzc211?=
 =?utf-8?B?ZlhlS05CM1hEOVN4OXdqZ1o3RHRFNGZXb21LSnQvQlRzRXdWQzJxVHBFNUVh?=
 =?utf-8?B?UEx2R0UxaXZCdkIwYWJSQXFvTzZ6UE83V1F3ZjFlTm5YNmt5UThFZi84ZlpT?=
 =?utf-8?B?VFJsOUwrNkUyUUlNb2tidVBzcGNqR0xXQTZRQnRwYmpXbzVRSXpZbGNzSlFN?=
 =?utf-8?B?L1dneWRpR01FSDRscTF5UVlkdFBIUVJVZE1GbG5jd3BDQUpjN3BBUHA4Y21v?=
 =?utf-8?B?WUk3cVNOVEplUHJqRjhnOUNjVUF2aUhlZERFeVlLMkJmK1lBcUVNYzk0dWRu?=
 =?utf-8?B?a3g2d05RbzdXK2lBNTU1akVJblhIcXpTemNVTStZclQrTmJxSWlyMWZ4OXpv?=
 =?utf-8?B?aXo3eTZzZ0xUNWN1d2phQndSUlZZbHpMM1psbkZEQ0R1UURJeHNYcEhvZ2Nq?=
 =?utf-8?B?MjBQVmI5NHJuNGlxUzBmaDNVRlF2aHBCUkVtVWM3a0FOSkhCOTVYTGdyRXIz?=
 =?utf-8?B?aWxhaWNNdHVJQWE4U1haTUYxMDVmSng4T1YvSWZDZW9XU0djZ1FOTndGb2NE?=
 =?utf-8?B?N1Y5SnJEZjdzbTJVWDFtb0dWc3hrcEpPLytRWUpuR3BZUGswa0kwRE8wV2Jo?=
 =?utf-8?B?bkdmSklZY0M2SnhBMG9weUtZYm9hQk8yaUpiYlR0eWZuOGc5Y0N1WGwwQ0l3?=
 =?utf-8?B?SWswODVwUUk3bk0reSsvUHl1ZDVEdVR1ZE5yZlY1U0c2ME9uYkZEVG1PSjM2?=
 =?utf-8?B?a3MxVWg1S0NibVpzUXdNUXR2aklDa2htY2ZibUdDVVdRUXhHUWQrb0lHT3JH?=
 =?utf-8?B?QVd2bU1JR29oN3hmRWRmTHh6eEtIdCtxcmpCcHQ5ejFBZVY5ZVZqL0o5NWU2?=
 =?utf-8?B?ckdwUmhRbGgvNjBTdnZlTE9pLy9VYnkwT1BHbWRSS1BvbUhtS0pBOUFodmcw?=
 =?utf-8?B?ZHIrUzE5dmVZdmJVb1Z3d3ArK0tSWlpHckFoNGNoRkNNRGx1dEFZZ0NzbXJa?=
 =?utf-8?B?SWpNQ1l1aFc2QVRHUzc4VmF0V1VXaGgzS1NCaW1sSFc3bG44UmkwRks4djRI?=
 =?utf-8?B?VjVsRWFxeGIvcEN4Y3EzRWVLNW1KaWN0b1hQalp2SjM3K01Xb2JDRm9keUt4?=
 =?utf-8?B?V1VSc1JQZk5GcUZMWlFYdHIwSWh2VHdReVdBSm9uVTRNVUVBUEVTQi9rZEJJ?=
 =?utf-8?B?c3dpcUZOLzJCY2Zmd0FCWDBuWi9kS2h2WHRDVEdXd0h5Nk5oRkNkV0piYTZC?=
 =?utf-8?B?YnRHdGRHVCtYTU81aVRISEV0aml6amFUaGpMTndPZ0hZUWZESjRPbDhjTlls?=
 =?utf-8?B?b2Fyc0t4VGh3TXI2K1ZFRllrK0YwYU5yV212OUJGNlJDM0pXYWpyR1UrbVRL?=
 =?utf-8?Q?bRJLn9EppLxdkVuut3QemhbIW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ac35c3-f73b-4398-fcc7-08db8375a81e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:49:15.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFyZqcINRhCUgdgY/buE9ezHpqZQbsLaX4C+sJ0GRDl3G5eN5/RWlDk2OXmAEc7okhC4S7TB8umV94W/rxZNtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432

On 12.07.2023 17:41, Roger Pau Monné wrote:
> On Wed, Jul 12, 2023 at 04:50:34PM +0200, Jan Beulich wrote:
>> Hmm. The question really is which of the changes we want to backport.
>> That one should be first. While it's largely guesswork, I'd be more
>> inclined to take the change that has less of an effect overall.
> 
> My views would be the other way around I think.  Current code already
> has a comment to notice that IO-APIC pins might be wrongly unmasked,
> and there's also logic for masking them when the IO-APICs are
> initialized.  The fact that such logic is placed after the local APIC
> has been initialized is IMO a bug, as having unmasked unconfigured
> IO-APIC pins when the local APIC is enabled should be avoided.

Hmm, if you really meant this (and not setting up / unmasking of
LVTERR), then your change would still be insufficient. We may enable
the APIC for the BSP in init_bsp_APIC() (which is called quite a bit
earlier), and the APIC may also have been enabled by firmware already,
so I don't view this argument as fully convincing. (That said,
init_bsp_APIC() calls clear_local_APIC(), so while the LAPIC may be
enabled, errors would be reported only in ESR, not by delivering
interrupts.)

Which gets me back to another aspect of your scenario that I haven't
fully understood: In the description you say that booting fails.
Since we handle the errors, the implication is that the pin remains
constantly active (thus triggering errors over and over again). Yet
how would this not already cause problems ahead of smp_prepare_cpus()
if the LAPIC was already enabled? Wouldn't we need to do part of
clear_local_APIC() from init_bsp_APIC() before bailing from there
when smp_found_config is set? ("Part of" because as per the comment
at the top of init_bsp_APIC() we apparently would need to leave LVT0
[and then perhaps also LVT1] unmasked.)

>> That said I can see that Linux have their enable_IO_APIC() calls
>> also ahead of setup_IO_APIC() (but after connect_bsp_APIC() and
>> setup_local_APIC()). IOW with your change we'd do the masking yet
>> earlier than them. This may of course even be advantageous, but
>> there may also be good reasons for the sequence they're using.
> 
> Linux calls enable_IO_APIC() before setting up the local
> APIC LVT Error vector (that's done in end_local_APIC_setup()).  That
> logic seems to be introduced by commit:
> 
> 1c69524c2e5b x86: clear IO_APIC before enabing apic error vector.
> 
> Might it be less controversial to do like Linux does and call
> enable_IO_APIC() before the local APIC ESR is setup?

You already do so, just that you do it yet earlier. I'm not
convinced it needs doing from the middle of setup_local_APIC() (or,
like nowaday's Linux has it, with ESR / LVTERR setup split to a
separate function, and enable_IO_APIC() called between those two
LAPIC related calls). You also disliked putting the call at the
beginning of setup_local_APIC(), so putting it in the middle of it
might be yet worse when taking that perspective. (Another downside
of calling it from anywhere in setup_local_APIC() is that this
would be another __init function called from a non-__init one. We
have examples of such, and keying the call to "bsp" would leave it
safe, but avoiding such calls when we easily can is probably a
worthwhile secondary goal.)

Question is whether it can sensibly be moved at least a little
later: verify_local_APIC() isn't of much use anyway, first and
foremost because we ignore its return value. And connect_bsp_APIC()
largely is concerned about leaving PIC mode. So maybe put the call
immediately ahead of the setup_local_APIC(true) ones?

A further question is whether, considering that Linux continues to
use that name, we wouldn't be better off not renaming the function.

One other thing I finally figured was confusing me in the
description of the patch; re-quoting that paragraph here:

"Fix this by moving the masking of IO-APIC pins ahead of the enabling
 of the local APIC.  Note that before doing such masking Xen attempts
 to detect the pin where the legacy i8259 is connected, and that logic
 relies on the pin being unmasked, hence the logic is also moved ahead
 of enabling the local APIC."

The last sentence saying "also" is kind of odd with the first one
already stating this very movement. To me it's therefore unclear what
exactly the second sentence is intended to be telling me. I guess you
want to express that together with the making the detection logic is
also moved (i.e. the entire function is called earlier), but I'm
afraid this isn't the only way to read that second sentence.

Jan

