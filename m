Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A039357B
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 20:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133630.249003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKos-0002be-As; Thu, 27 May 2021 18:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133630.249003; Thu, 27 May 2021 18:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKos-0002ZO-77; Thu, 27 May 2021 18:33:22 +0000
Received: by outflank-mailman (input) for mailman id 133630;
 Thu, 27 May 2021 18:33:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d2D=KW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lmKoq-0002ZI-3F
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 18:33:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af3feb38-e744-47c6-a3bf-bc5459fa4308;
 Thu, 27 May 2021 18:33:17 +0000 (UTC)
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
X-Inumbo-ID: af3feb38-e744-47c6-a3bf-bc5459fa4308
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622140397;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AkYpiD/AH03QGFAYAXF+d6oaRKX/Osg7RjDDbjC6rq4=;
  b=G6s6PLi7VNoFu0BrbGgSiAfsOVeaPKThcdc/6lPrFiU7OHKBickr3tRQ
   r3b5xqrE7G8/nMCshd3Qa4koz4kyZnDFRs/lDrWmwzNHQlEX+1/7E4ytC
   fEGvH30oqJv+sFiGWF+GC6ZRXjrtHQlaXGDdut7nEeiz/lbQsLp7x/VTL
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zqe7dMuXvp04NXhAim1ACvqh9JQTXOGKuhJSoLdsP83fHClRcQM2y+E+7TO0Lj1pBNDQSAbciS
 oHF2cHFO8MpybRxSZPCo8IdRHMI1nEtvuDBiWiHZWpmic4c9OKS6WlQWLLOvPR67Y2GokY47Vy
 lZg5qpIELD5Rd3ccj2v96wNIx1xGiNzuoNTmOJ9kSFWZJCG1uXbnQIN4xuy/Kh4BM0NO/0OfoJ
 SAmA5Mwkxq63PGtiB6lNArW4q1Du8QTvzdkBCxrH3wZS5fUQJDT9AE814UGJBbFxNIKlnF39kg
 8as=
X-SBRS: 5.1
X-MesageID: 44554905
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wg7wpKxkSUIUooPQYVG+KrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.83,228,1616472000"; 
   d="scan'208";a="44554905"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlOuFGECeNXXnodsAuPL0ck6u+yJ5A3ncLqLz49CzAtYCDhosO+8qCyfV9atjCZCyeTuLUbfB9X0gFpe3e0HjTvosIFRv5XOHEdzgSGLDdBHZ8v9D7/4HUpLN52hGsnEc/66ouJjCtxJJR1yRWoLaxIvSqTYRmpRLU3N/mjy08ryS0Swr7ETNVdD2tcCIk192T9AOTHEgxl67uYXdfpow1xAaw5QWzXsr5FYyJfwpdwyIS+3K+Y3SVYpq0+YaViEEmXNg5rkK+sOU56J/oDKZbH8VGIec+x/2H6ZFnPg5+OVZEgFM924xqhqRQ+1j+V8rr2PJkzcEInKSjBgN/fCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1teCrWfmmiQ8bQ1vlAiJ+AFkxAwdFFR4+rekFGhQ2E=;
 b=A/OHQrS3QVpuWxctGMiy+IJL8JO2m0X2L++VN4gp3q4g0vakSkvZedbsRxPajwtAR6iPKP9yzwBQuLoKsO+rEMhOaf4oyxaAWR+37ejWOcpx3AX6xVoipy4JUqKfWIsnoXKcTaGF522oPn/obaMTgNjIpgPeCtAKeVhzU4wZ6sZGTBCg5/GuRdFEgukE8vCkih1wUaur7OA1CbeKwfm60sIUD0J99PMbQNVbk6+8mvAg+O5wC3KizSmV4fFaVw2Wd6/SQIyGsVKmy36i5OyaEKFKj5V8WIdVN9WYC6LUOIDS6XSaU7AY9sdj+y4mRfUPu5VI34KBA3DXlNoeM3zvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1teCrWfmmiQ8bQ1vlAiJ+AFkxAwdFFR4+rekFGhQ2E=;
 b=BpxVlg6m/Pmq0pqWeF7FssJscsCF4JEeTTwQXzOb0lpRGSrEkY0CTYPeygKfmJqM4Cj+K7wpYkoBnJ9mKZtZy+7QzzJcJM0W99bIAjbjkvzwCvZfmLDUjojhzl6DOKACR8mKup16afR5q0qNSU7Xga+Kc/3Oa9Jn1HYU/korlGY=
Subject: Re: [PATCH 3/3] x86/tsx: Deprecate vpmu=rtm-abort and use tsx=<bool>
 instead
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-4-andrew.cooper3@citrix.com>
 <YK/VtuUatxX6lQuo@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <01c81aac-c349-1650-c147-140f77ad6f1a@citrix.com>
Date: Thu, 27 May 2021 19:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YK/VtuUatxX6lQuo@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6563b488-8b31-4de8-5dcc-08d9213de34d
X-MS-TrafficTypeDiagnostic: BN6PR03MB2865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2865CB134EED059DC33DA166BA239@BN6PR03MB2865.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+W1caXvKpen1+NY6MTW8pS2DO6D1+aW49Tp0q92mF3bdcYo6JpLNu4rFECm5kCK59Hu0ICZaiU9qnwfYGYSt5eTIlFqAqLcrBeo6Q4fEc45gTqDzSNwLm+c99wk7bRm83B8sbWV7Hwej61lwFfHlJcssYz69kzEmZxuHWR0DTDXZR4EvXpwjDUiLtUihM5gp+o0qJ6/DNkHlpTEzowFYgZR85395CPgAEqKPVGAaZBm53NwsQXIv59SwPYGM3a46NquMGmYFedMfS63dTTiHxTF8AJURwEy/DRy90lvI1BrO5k5kvw+Ij2+Pp/32gsZ8LqR0PCkIccWxqAhf034R7mratx2k6er0azAwMMfYr9TiSn6KmM7BJFaf0cwDEYRaDO4YhYV/lJIDW5sX4mW45KHvsCUDNfilWIDiRGjXyMLzIVbeiQVnTZBaKZ6loWFDNyni787WC7a1rZU5yJ4Ppvj8IQWE8qRm6DJSGzyuY/G3km2oCt6wLUVG+P/tbanbUKu2QQ9DQl+9GimjqIHrZQwOte7n4XIuZ6yRb7toQlZiYw7Bd1CH+n3rLuTZat/ibc6w/QO8hdlIk/bXDUzICwFPeQSKxEplWdwTFWJjfhvLZI7+SWRSUsGsZBqKJ1VrzMR0WQu6/syC8ZVueWKmXDpi7KiafHp9Wku5SmXdJURY5FNUougZOE0mesb9BLiibfsJ1GhpYbOJU1gNNms6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(31696002)(2616005)(6636002)(54906003)(66476007)(478600001)(6862004)(6486002)(53546011)(6666004)(36756003)(4326008)(31686004)(16576012)(8936002)(83380400001)(2906002)(316002)(16526019)(38100700002)(66556008)(37006003)(956004)(66946007)(26005)(5660300002)(186003)(8676002)(86362001)(10944003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlZSMVdDeHR0OTRvOTBxZUtGWFN1RTBvOTBWQXBTV1RCQTV0VGJIM3VaWEpC?=
 =?utf-8?B?U3N0cGV4U0pXZXRWZU5jYm1uWjBQZmEwbjdIMG1HVHpkN1V5bVh1MVg4bFpN?=
 =?utf-8?B?MGNmRUpKSHN6UXBGZWN5UllpNFlhNzdna2wxVkxjV1d3WjBpUjBaYTBzam5G?=
 =?utf-8?B?YzNMbTNtMXhvVnVTay9mcFZxOWdVSkY0SzNQakw0bzFXME9Qazc3b1ovbWZq?=
 =?utf-8?B?VUxqcE5EZjN5TWZSM3lZSHVxME4yQ1lPU0NZUmxtVnIvZDdXR1dwSmRBQTh4?=
 =?utf-8?B?TlFHeTFYNTNBQ0J1TDFwNXJOKzMwODdXeWhKOWxtcEhabHVsQnJpN0dWNGdn?=
 =?utf-8?B?MDZNb0l4bzZXQld5dlQ5V0lMaFJDazVpSFREc3N2dnBkNkRvemx5TkxDSEpD?=
 =?utf-8?B?NVBOOGp2ck5EK2dQcFEzRjhOVmVYWlY3Uk9nVnd3U3luVzhNU2E1dW45cHk1?=
 =?utf-8?B?aWE4Q2wzNVpwamFQMS8rMTN3N0FTTHRVajk3dFk3TUJhd3Iwa0p4b041Ni96?=
 =?utf-8?B?c1dvSEhzZEFmWVF2UUpOMEVpQXBPY1p5cUVjOTVuNXdvZ084aUtpYVpWdklD?=
 =?utf-8?B?NWFUay9UNDBxZzh2QVFoankzbnN5VkRsQXB1Y2hERU1EalVuYnMxNXF4SlhR?=
 =?utf-8?B?a09tSzJKemRzdjFsSyt2WkJlZlJadldlV3BvWTdXTWFIUVB4SC9wOXVJK2Ji?=
 =?utf-8?B?b1pkeHhYdGU5d21qVWE3aFNyT3Z0TVVEZm9hVnNOSDlqSUM4RGRMTVZNYUY4?=
 =?utf-8?B?UUxXaGFJbzgrZVFEUE9UdWs3MS9JdkRKZ1B6a3RRcVc5d2xkdFB1c1V1L2NB?=
 =?utf-8?B?c0k3TFRJMTNTSUNPNjYwTmRDS2Z2b2RNMmZ1UEVJQ0lXSVRWRFRKS28xWmI2?=
 =?utf-8?B?K1VOK1Z2WWtybktZWVB6a0FKeFdDM09SNHdKamFENVNFc0N0SHZwVERyNHcx?=
 =?utf-8?B?M2EvWEdHYis4ZFJDV0lFN0xEOVBxZDJIVGRtRHFXbXlGeHUzTWVjeTlma3py?=
 =?utf-8?B?cmRIeWttbi9hYy9pcy90TGdoNHRsTENLUHozeHM1ZXUzcFczajd5ZnU2R0t0?=
 =?utf-8?B?K0dQUHdsdEF3VXNWUHM1RnBLTFo1WG1nem1GTVlKYmEyT3V3ZU1oRlZERWFB?=
 =?utf-8?B?cFc2L2xZMFRpd3N3dWx2bDliVmRwOHE3V2FrRzcwbXBland4azRDdnpUNkR0?=
 =?utf-8?B?Wk92L21Bd3JDZk90blB3SmQvNkRsdXVKS3pnTGlQRFB3U005V1VZMHFRWDBx?=
 =?utf-8?B?YXY0T0ZzWW4wUUpHNnd0MFBXSXQ3SWIxMFB2SDgvMFlWeE13NVI5R0NRSEU5?=
 =?utf-8?B?SnFRdVJwNXBYRzNCeGp0dTBnSGpNbnZqa0FSOWVndVdsWkxhdnBNZWJmWWFz?=
 =?utf-8?B?aS81TlVMcnFFaXR0VFpvQW80Vi9GNEVFZmlxOFdOQzkxVzZrRjhVcDVsb2kx?=
 =?utf-8?B?Q0FKUWVaS1V0dHpIbDdvR240b2U3UTF1UDhIV3Y0YmVBREVaTmRMYmNUOStQ?=
 =?utf-8?B?elUzM01VRU05M0h6RVpqNlZkWHp0blhHVGJyekZDaHF6Q3U1b2JCbzEvM3Ey?=
 =?utf-8?B?dnNtOXMzbjJ6U1liTU5ySGM3amlEMTR6Qi9SRGc0VHUzNit3NC95dEp0N0VM?=
 =?utf-8?B?TFc5TngxRzd0enh5dWZLMUcrdm9kdnlwM2E5YnUrNUhtNUJaSC9kTmRmUXYr?=
 =?utf-8?B?akQ3UFZheWtPcTVIdGgxdkJvMDEwUEZQUjZ4cENacFRQdEVyMjF3dDcrTDdo?=
 =?utf-8?Q?z7yjB/rZ7mkGQJkL9lIbu01W9c0wo+XO8QjlR/d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6563b488-8b31-4de8-5dcc-08d9213de34d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 18:33:14.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DtOABnXdZWXBBDi7MQcEr7tZGIyEI9Mulj3dQIMaWXnLAnmk+7KAysainNU1KC3gI2OWarrdZY7U7xrA5NfoeBhnwJ2/Ofpa/rLvQt7o2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2865
X-OriginatorOrg: citrix.com

On 27/05/2021 18:24, Roger Pau Monné wrote:
> On Thu, May 27, 2021 at 02:25:19PM +0100, Andrew Cooper wrote:
>> This reuses the rtm_disable infrastructure, so CPUID derivation works properly
>> when TSX is disabled in favour of working PCR3.
>>
>> vpmu= is not a supported feature, and having this functionality under tsx=
>> centralises all TSX handling.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  docs/misc/xen-command-line.pandoc | 40 +++++++++++++++---------------
>>  xen/arch/x86/cpu/intel.c          |  3 ---
>>  xen/arch/x86/cpu/vpmu.c           |  4 +--
>>  xen/arch/x86/tsx.c                | 51 +++++++++++++++++++++++++++++++++++++--
>>  xen/include/asm-x86/vpmu.h        |  1 -
>>  5 files changed, 70 insertions(+), 29 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index c32a397a12..a6facc33ea 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2296,14 +2296,21 @@ pages) must also be specified via the tbuf_size parameter.
>>  
>>  Controls for the use of Transactional Synchronization eXtensions.
>>  
>> -On Intel parts released in Q3 2019 (with updated microcode), and future parts,
>> -a control has been introduced which allows TSX to be turned off.
>> +Several microcode updates are relevant:
>>  
>> -On systems with the ability to turn TSX off, this boolean offers system wide
>> -control of whether TSX is enabled or disabled.
>> + * March 2019, fixing the TSX memory ordering errata on all TSX-enabled CPUs
>> +   to date.  Introduced MSR_TSX_FORCE_ABORT on SKL/SKX/KBL/WHL/CFL parts.  The
>> +   errata workaround uses Performance Counter 3, so the user can select
>> +   between working TSX and working perfcounters.
>>  
>> -On parts vulnerable to CVE-2019-11135 / TSX Asynchronous Abort, the following
>> -logic applies:
>> + * November 2019, fixing the TSX Async Abort speculative vulnerability.
>> +   Introduced MSR_TSX_CTRL on all TSX-enabled MDS_NO parts to date,
>> +   CLX/WHL-R/CFL-R, with the controls becoming architectural moving forward
>> +   and formally retiring HLE from the architecture.  The user can disable TSX
>> +   to mitigate TAA, and elect to hide the HLE/RTM CPUID bits.
>> +
>> +On systems with the ability to disable TSX off, this boolean offers system
>> +wide control of whether TSX is enabled or disabled.
>>  
>>   * An explicit `tsx=` choice is honoured, even if it is `true` and would
>>     result in a vulnerable system.
>> @@ -2311,10 +2318,14 @@ logic applies:
>>   * When no explicit `tsx=` choice is given, parts vulnerable to TAA will be
>>     mitigated by disabling TSX, as this is the lowest overhead option.
>>  
>> - * If the use of TSX is important, the more expensive TAA mitigations can be
>> +   If the use of TSX is important, the more expensive TAA mitigations can be
>>     opted in to with `smt=0 spec-ctrl=md-clear`, at which point TSX will remain
>>     active by default.
>>  
>> + * When no explicit `tsx=` option is given, parts susceptible to the memory
>> +   ordering errata default to `true` to enable working TSX.  Alternatively,
>> +   selecting `tsx=0` will disable TSX and restore PCR3 to a working state.
>> +
>>  ### ucode
>>  > `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
>>  
>> @@ -2456,20 +2467,7 @@ provide access to a wealth of low level processor information.
>>  
>>  *   The `arch` option allows access to the pre-defined architectural events.
>>  
>> -*   The `rtm-abort` boolean controls a trade-off between working Restricted
>> -    Transactional Memory, and working performance counters.
>> -
>> -    All processors released to date (Q1 2019) supporting Transactional Memory
>> -    Extensions suffer an erratum which has been addressed in microcode.
>> -
>> -    Processors based on the Skylake microarchitecture with up-to-date
>> -    microcode internally use performance counter 3 to work around the erratum.
>> -    A consequence is that the counter gets reprogrammed whenever an `XBEGIN`
>> -    instruction is executed.
>> -
>> -    An alternative mode exists where PCR3 behaves as before, at the cost of
>> -    `XBEGIN` unconditionally aborting.  Enabling `rtm-abort` mode will
>> -    activate this alternative mode.
>> +*   The `rtm-abort` boolean has been superseded.  Use `tsx=0` instead.
>>  
>>  *Warning:*
>>  As the virtualisation is not 100% safe, don't use the vpmu flag on
>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
>> index 37439071d9..abf8e206d7 100644
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -356,9 +356,6 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>>  	    (c->x86_model == 29 || c->x86_model == 46 || c->x86_model == 47))
>>  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
>>  
>> -	if (cpu_has_tsx_force_abort && opt_rtm_abort)
>> -		wrmsrl(MSR_TSX_FORCE_ABORT, TSX_FORCE_ABORT_RTM);
>> -
>>  	probe_c3_errata(c);
>>  }
>>  
>> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
>> index d8659c63f8..16e91a3694 100644
>> --- a/xen/arch/x86/cpu/vpmu.c
>> +++ b/xen/arch/x86/cpu/vpmu.c
>> @@ -49,7 +49,6 @@ CHECK_pmu_params;
>>  static unsigned int __read_mostly opt_vpmu_enabled;
>>  unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
>>  unsigned int __read_mostly vpmu_features = 0;
>> -bool __read_mostly opt_rtm_abort;
>>  
>>  static DEFINE_SPINLOCK(vpmu_lock);
>>  static unsigned vpmu_count;
>> @@ -79,7 +78,8 @@ static int __init parse_vpmu_params(const char *s)
>>          else if ( !cmdline_strcmp(s, "arch") )
>>              vpmu_features |= XENPMU_FEATURE_ARCH_ONLY;
>>          else if ( (val = parse_boolean("rtm-abort", s, ss)) >= 0 )
>> -            opt_rtm_abort = val;
>> +            printk(XENLOG_WARNING
>> +                   "'rtm-abort=<bool>' superseded.  Use 'tsx=<bool>' instead\n");
>>          else
>>              rc = -EINVAL;
>>  
>> diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
>> index 98ecb71a4a..338191df7f 100644
>> --- a/xen/arch/x86/tsx.c
>> +++ b/xen/arch/x86/tsx.c
>> @@ -6,7 +6,9 @@
>>   * Valid values:
>>   *   1 => Explicit tsx=1
>>   *   0 => Explicit tsx=0
>> - *  -1 => Default, implicit tsx=1, may change to 0 to mitigate TAA
>> + *  -1 => Default, altered to 0/1 (if unspecified) by:
>> + *                 - TAA heuristics/settings for speculative safety
>> + *                 - "TSX vs PCR3" select for TSX memory ordering safety
>>   *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
>>   *
>>   * This is arranged such that the bottom bit encodes whether TSX is actually
>> @@ -50,6 +52,26 @@ void tsx_init(void)
>>  
>>          cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
>>  
>> +        if ( cpu_has_tsx_force_abort )
>> +        {
>> +            /*
>> +             * On an early TSX-enable Skylake part subject to the memory
>> +             * ordering erratum, with at least the March 2019 microcode.
>> +             */
>> +
>> +            /*
>> +             * If no explicit tsx= option is provided, pick a default.
>> +             *
>> +             * This deliberately overrides the implicit opt_tsx=-3 from
>> +             * `spec-ctrl=0` because:
>> +             * - parse_spec_ctrl() ran before any CPU details where know.
>> +             * - We now know we're running on a CPU not affected by TAA (as
>> +             *   TSX_FORCE_ABORT is enumerated).
>> +             */
>> +            if ( opt_tsx < 0 )
>> +                opt_tsx = 1;
>> +        }
>> +
>>          /*
>>           * The TSX features (HLE/RTM) are handled specially.  They both
>>           * enumerate features but, on certain parts, have mechanisms to be
>> @@ -75,6 +97,12 @@ void tsx_init(void)
>>          }
>>      }
>>  
>> +    /*
>> +     * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.
>> +     * MSR_TSX_FORCE_ABORT is enumerated on TSX-enabled pre-MDS_NO Skylake
>> +     * parts only.  The two features are on a disjoint set of CPUs, and not
>> +     * offered to guests by hypervisors.
>> +     */
>>      if ( cpu_has_tsx_ctrl )
>>      {
>>          uint32_t hi, lo;
>> @@ -90,9 +118,28 @@ void tsx_init(void)
>>  
>>          wrmsr(MSR_TSX_CTRL, lo, hi);
>>      }
>> +    else if ( cpu_has_tsx_force_abort )
>> +    {
>> +        /*
>> +         * On an early TSX-enable Skylake part subject to the memory ordering
>> +         * erratum, with at least the March 2019 microcode.
>> +         */
>> +        uint32_t hi, lo;
>> +
>> +        rdmsr(MSR_TSX_FORCE_ABORT, lo, hi);
>> +
>> +        /* Check bottom bit only.  Higher bits are various sentinels. */
>> +        rtm_disabled = !(opt_tsx & 1);
> I think you also calculate rtm_disabled in the previous if case
> (cpu_has_tsx_ctrl), maybe that could be pulled out?

rtm_disabled needs to not become true if !cpu_has_tsx_ctrl ||
!cpu_has_tsx_force_abort

Otherwise we'll default to disabling the CPUID bits even systems when we
can't we can't actually control TSX behaviour.

~Andrew

