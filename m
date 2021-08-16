Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711B3ED860
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 16:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167365.305495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFdAV-0001Vy-2M; Mon, 16 Aug 2021 14:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167365.305495; Mon, 16 Aug 2021 14:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFdAU-0001Sk-U4; Mon, 16 Aug 2021 14:00:46 +0000
Received: by outflank-mailman (input) for mailman id 167365;
 Mon, 16 Aug 2021 14:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFdAT-0001Qa-Og
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 14:00:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86dfb6fb-c73f-4f1f-84ae-135c088db315;
 Mon, 16 Aug 2021 14:00:43 +0000 (UTC)
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
X-Inumbo-ID: 86dfb6fb-c73f-4f1f-84ae-135c088db315
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629122443;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=njHOorlnmlp3lNrLXmg2PT939lTFePqFHQlmOUv6LnY=;
  b=BtM/FEJJQo8h31UEozBlWyXmY5lOhHLiHAAiwnoS5L1IGp9ytqNPbdZ/
   pgPoDaFAy42LGixO/MNvuvLy8F1Oy413K1/8oFIaJnkjqPuT8JtkdJYJe
   Lmm7HiJ3g7b5J2JR0FEEoR6Seoq9Zz3QbcnBU3mFmveyMMjLTWbmfs8Lv
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aR6A5WTbr3pYN3kbULYJR1GRIQK3k8MrM4IWhrnKkt8wDXK/QrnCHEfYCBbJDB22eeJJpaDwO5
 +ZyND4Lw35nlTJwZVZBMm4MbglzKgL1SgBJKc9iFCoJvEngZvWAnuZL/4nAywDuV10p0AHYtNw
 HaMcpnxkwPOeL3A0O2rsxicQzVSWMLGOUoHBntf8nwSbgmNs0IpSaJ4WQldyIR4coHMcQ+Ur8E
 3K4r7NcmdIxOAocuspwsmkttW52Q19t3IpB4YnHemNoMY/4TB/aJgmjw6XLygaeL+hlclk3Ybj
 l7jn/FUy5z+zS0NEe3QyMUYo
X-SBRS: 5.1
X-MesageID: 50934956
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dbZT/60gfJ6WcyurYewMEAqjBR9yeYIsimQD101hICG9Kvbo8P
 xG785rsyMc6QxhHE3I9urwXZVoLUmzyXcX2/hXAV7BZniDhILAFugLh+aPrAEIcBefygcp79
 YDT0EIMqySMbEVt6fHCFbSKb0dKZK8gdmVbK/lvg9QpKtRGuddBk5Ce3ym+pAffngFOXLofK
 DspfZvtn6uf28aYd+8AWRAV+/fp8fTnJajehIeAQU7gTP++A9AR4SKbSRw8y1uIA+n+41Sg1
 Ttgkj8/OGuovu7whjT2yva6IlXgsLozp9GCNaXgsYYJz3wgkLwDb4RLIGqrXQwuqWi+VwqmN
 7Dr1MpONly8WrYeiWwrQH20wft3T4y4zvpyEOeg3HkvcvlLQhKf/aoyeliA2rkwltluMs53L
 NA3mqfuZYSBxvEkCPx78ONTR1wlkav5Xoki/MaiHZSFYsSAYUh0LA37QdQCtMNDSj64IcoHK
 1lF8fH/utbdluccjTQonRvyMbEZAV7Ij6WBkwZ/sCF2Tlfm350i0ECwtYEg3sG/JUhD5FZ+u
 XfNLhynr0mdL5fUUo1bN1xDPdefAT2MF7x2Ez4GyWpKElHU0i94KIel90OlauXkLxi9up9pH
 yzOGko9FLaXnief/Fm8Kc7jiwlcV/NLQgFkPsunKSRkoeMO4YC5kW4ORATe8nJmYRbPvHm
X-IronPort-AV: E=Sophos;i="5.84,326,1620705600"; 
   d="scan'208";a="50934956"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb/7Yth9DDW7X0J9MJMY5nfIQicLq+BV2rHBiMZEVulpGRE2gTtrZ+6GiQwB7Y4mHDI5a6H1G2VoqayIyTyT4NEz1bMk1rqs9Hr9JcctClRY7DhfxQpJCF79Z7NOP8CXQXebdIw+A8Sl4dm++8cEggWSpuuN2IZoBs8J8X/6qxm8zO8hTTTN9hF+/vAOyCgo1ixRfKBks74OVw/5g2mHhdpyke4JwLUBenoIpMFuuYJAylmSUIwxYbRAVuTB5fdps9ai6wR+j5wF2gKw715pZa154+6QIhRgnzNvWrNGaR62TdmWZstiiIFZpH4tGYS5/+J8bpW03PTLBpAdb5NYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wUf89sJM5UOBMZUN7iSg3veu8b/JGT0Qra9r6kMJ58=;
 b=MGaW8NPy+BCq74xDoHiaKHs5mQBoJ8mXEt2lnHQIah0TfW8Lqm1FwhnM+hZQQdfnBpbLKmKSrkJ2eqcXACLYzFt4ldiR2+8iitKBz6xH/5u9b6UABXwnYf4GAzlERiLT+iAvctzIWO9ujCjLFZy+Jc1EgVYj8wna8CvuhC2EAhOVbVHEM0BpKlwe1CVqyxSRdimmzXD1QgLR6fNA7QkqKzudEIGLQ32Znv8ZnnZ2IGXu9kFGRIVBL6guDWmOG6CZHa1e/vqy07EB2nr9ctrxsvPlFZdhlk64s4YHx8x/zWwb3ePAOxj60lJ78zUOQSkMJC2idGE26jIJZnLsu/VdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wUf89sJM5UOBMZUN7iSg3veu8b/JGT0Qra9r6kMJ58=;
 b=H9KygYAp5y8XZKzHLlWg+JwHUG8+5h8e9AMY9g09gvlWwedW6Lv+fpK+BJpsYmthan3YXxtWjOjSLNVu8ixUXJCdExFbXCTrUniBSV6BJLlDsFRo6mlq3IigSRSx9NzYBsuswrQi7lU24LRMS2vh5Z4C3KA5JORzMun+AvwYS4M=
Subject: Re: [PATCH] x86/ACPI: Insert missing newlines into FACS error
 messages
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210816133505.32484-1-andrew.cooper3@citrix.com>
 <72a41c5c-5d4e-ed4f-dd3a-e41d13447000@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bf683e6d-e044-3a6d-3f77-2cc7a478e76d@citrix.com>
Date: Mon, 16 Aug 2021 15:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <72a41c5c-5d4e-ed4f-dd3a-e41d13447000@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ab039c-8ad4-495a-55a2-08d960be3b25
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB575714411FA39FB7CC48EE02BAFD9@SJ0PR03MB5757.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00pLCAxaNVjukfoHm8ARiK1yIaZNFRZfDfyOtjeIGXndsiVCraRV2lGf1WJYC6HwZDzjAJRPxSSLnNtRkx6n6+DP7GZd1WIe4t3r2fZJt8BMdBsY48n6kKG0biyXgL9hoD+mTXuNK9xwFr5npzxPsxHa4q1MHnIcQx91freewbNlAP31a+/BqRClW+r3ZIG9CF85hrpLGDPz2/Ze/CBUK/JnS07mRQkBcXS03+shp9qBjRb9rwVP1d7wM+AlgaoXOjaXWSDgSVtaoIeoarUhC2A040cbmDczPGvqjG/PBJAkvW4QRI2mHJ42avQ6S4JJNWncPzc5NXZ3byTURCDWijyS/yUmkXz8Z1b7WTxpB4ukN6gAhA3zVae/IVQsuMvwB6h69OMcumBvIEbteTZXkL39Y1KVDw2ZuchfHvvZQtoxSmE/7SMwvOPqTN+oz3YrDozS+mL5DCOs63ery8d/qUnvM3gv1T/xiJztNKyaFvrQ8DPviehH5LA+cFRk8xih4uXIWN0skVHgzDB1Jg5ATAAuH2DrNM9moO6jS3CHDOVutiuEoEWDIF0ZMaqR2F9vwniMBaCW2yrOEspLpv1U2UPew21LX5uG80KBd4AD/AiAm0OqhMcE3vddQhE4Zhtth2IPd9sNxXalms+JHd4j8V2fRRs7Ozw9raKqOrJbfWRmm4cEb6wEj088aJ3xBtaVJA/EuRDpkqU+VsFnsIe1PXJqzSsbGxxcE/9Sw3um8rQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(66946007)(478600001)(53546011)(16576012)(66556008)(36756003)(83380400001)(31686004)(8676002)(6486002)(15650500001)(316002)(186003)(66476007)(6666004)(31696002)(6916009)(4744005)(26005)(5660300002)(2906002)(956004)(86362001)(8936002)(2616005)(54906003)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFvQkg5MGJnTVIzMUlzV3pEb2lsTk03NTVUZ3J0cDJoK1ErdTRiZ25Kc1Qv?=
 =?utf-8?B?alljOUk4dXcrOWxHRFlPQkVnQ2l5ZDNUKzdUTUtVdXFCc0ZFME9TTjdWd21y?=
 =?utf-8?B?L083dGJvUitvSG54L0dTaitSNC9xTU9BT0htd2NkSGsvQTV6QTdURHZvVEpq?=
 =?utf-8?B?S1Q0YXdxTmRzTFN1N1dLTll2SkVpeUp2UURsMHlzTUFJRFlUY2tKd2tmMjFC?=
 =?utf-8?B?Q3puczg0ck5qQk5oYlpIUm1xekpiU083ZzJGcXNFK0hKa2NGRjNsWnlWVjd2?=
 =?utf-8?B?eTI4UTdickpabWdTbm1DY01jYnBwKzMvT0Fja0tDemQ5RWR6L2t0TVV2dHRm?=
 =?utf-8?B?cUhvYk1MNXJYTlhyanBSbWh6TXhRa2c2L1pqYlpSTDdzbm81Q2J1V0psN1BC?=
 =?utf-8?B?dWZpWmR6NHREM0NLbHlTV25BQXlXK1NDV3ZFRFhFME0xQUVHbXRmTEkzemF5?=
 =?utf-8?B?MEYzVW9vNUoxWkYra0FzbCtBUEZKN2d6a0I4YlNlT3pXN3pQTmUwQ09qdXFm?=
 =?utf-8?B?MWpERWxsanBRWENHcjZQWlJUM0RoNG1IVzdid3JhZCsyRVRvNnBJelF0MmJY?=
 =?utf-8?B?TzcwOXpNM203ais3THBrTzYvbkQ0UmtEV2V4UmxoZUVva0x0OU9yQXlmalRO?=
 =?utf-8?B?UGhCSmF2T1lQMU45M3hicWVuR29rOUJzOHR0TDA0aTRvekpwQzBHZ0xRNzB0?=
 =?utf-8?B?TzBCalhzNkRiN3k0M0duZ0NqL3k1Zng2anMrcmwzVVVoOXZPTVFEK3Q4MFhW?=
 =?utf-8?B?VEZxNzVmNmxyUFFtZDBpZTJDczA4MjRBbmpwdXJjaGdrdjhRUDVUZXB0elFj?=
 =?utf-8?B?UVRucWlaODUyVHFGUk05blUwemw1MitZaXFTNXJ5dTRiVWpIOVAvdCtYemNP?=
 =?utf-8?B?cWlIc291VHZPcXhkZDZSOWlSUnMxWnBpaDlHcllYdEdobTd0Njd4SGdZOW8r?=
 =?utf-8?B?d2diNk9Ec3l0bE4xWWhpZmVVeFR5aE5ScFhuZ0hQTUFZV0R6bGhCUEJMaDl3?=
 =?utf-8?B?NEROKy94VzZWbU1xdUZGL3hpOG5yV2ZZUG5SREp4UGhLQ0s0TlRiZ3ExT0Za?=
 =?utf-8?B?dCs0RkxJM0N1VitWb2dhZTd5NjdIOGxjVXQvTG9CeVJWQUxPTm1GQ2piU1pF?=
 =?utf-8?B?VENCbGIyOU5lcWo3V281Q1Z3MjM2cCtnRURPaVp3a29xM3ZQbHpBQ1BPMHZj?=
 =?utf-8?B?TzVZL0hNVytOVVFMLzRUSXRzK243dEFmREdEb1RsRk04ZXNEQTRENHNUU0p6?=
 =?utf-8?B?cGxNK2lCWWU0MTlCa2tWUEozS1RYb1BFcFBrK216RVpPcFFGejJHWnFKWVp6?=
 =?utf-8?B?RVlmK0s5VGlzUGcrRlp0aGFOUmJCanVMaG5IOVZreFdWcFhnSHpPT1R1enpr?=
 =?utf-8?B?cnJLT1QvUGMxbjhUR3ovcmZKVi9mUXFmbW5aTFhBNTNNVXBwcE9TY0NCVEoz?=
 =?utf-8?B?Unl3bjdqWTVRaEVuWXRZSkZSS0FqRVJtOFNwdFF1QUNidE0vNlZBVXlaZnFX?=
 =?utf-8?B?dEh6NTl2WGVzUUhMTGVxNDVIb3h0M3ZabHQ4UUxxVENWR3VMSWJIWk9xU3pH?=
 =?utf-8?B?T3NpakVNZGdReVBGOEprWkhaSDV6bG95ck16ZC9Ha1JNOVJvTC9WRXdVbHRI?=
 =?utf-8?B?bmVMN2FCeHJ0TUs5bUt0S0RHTVM2Mjkza3E0R05aaFd6M2JOSTVha21FSXU0?=
 =?utf-8?B?aFVKMWtPemNiU1NCMnRBLzYwY3NnWC9EcjBPUm5VRXdzbDlxYkt0TlVFWElz?=
 =?utf-8?Q?/GJTRX3CjpUm9QVQdNAVHDO0bUVsHIn/a6D9VI5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ab039c-8ad4-495a-55a2-08d960be3b25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 14:00:40.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmXfaEU1x6W5XIv71Bb+W2qC43l3sMB4283TlkvzPRyUiqclUjO9ilD0iGUC3vafSawF3XToGmpgK8cxyotljxiaCR1HX8Dda0lVMxucWdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5757
X-OriginatorOrg: citrix.com

On 16/08/2021 14:58, Jan Beulich wrote:
> On 16.08.2021 15:35, Andrew Cooper wrote:
>> Booting Xen as a PVH guest currently yields:
>>
>>   (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
>>   (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
>>   (XEN) ACPI: Local APIC address 0xfee00000
>>
>> Insert newlines as appropriate.
>>
>> Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
>> Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I'm curious though how you came to notice: I hope there isn't any
> hardware/firmware actually triggering emission of these log messages?

I was demoing "boot Xen/XTF as virtual machine".  It will be the
dombuilder in libxenguest which is causing the error.

~Andrew

