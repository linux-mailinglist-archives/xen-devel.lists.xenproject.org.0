Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0400402CB0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 18:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181193.328235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdir-0000oY-3a; Tue, 07 Sep 2021 16:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181193.328235; Tue, 07 Sep 2021 16:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdir-0000ls-0N; Tue, 07 Sep 2021 16:13:21 +0000
Received: by outflank-mailman (input) for mailman id 181193;
 Tue, 07 Sep 2021 16:13:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNdip-0000lm-JN
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 16:13:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831eba64-0ff6-11ec-b110-12813bfff9fa;
 Tue, 07 Sep 2021 16:13:18 +0000 (UTC)
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
X-Inumbo-ID: 831eba64-0ff6-11ec-b110-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631031198;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZjBGaPM2bSvNwBtVv/unW1+T+h+jUN3bJ5+Rg602PtM=;
  b=Suq7z8Hhrh6HmFyY+pCiQOvazipPLEjieCpI7alDsemkrVcLTnSWD9DP
   +EseKAm2DOvWRsHf94RJsktjFQfgeQTTGwoc6H2M17vyQyQ8g/SjueQgI
   ft42fCAjvTF6VXHdh5qD2oQGwNyPDGOqLfHeQ+sZQjc9HHJPsjwFN31HG
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WeDhx3aZTsNwSrUt37wthJ203zdY78m4pOa6SDNNYr5t0GRjpqseDuASX5YpLqgC4jl2ewWWch
 d8f2CBraCCkGMPkrasv8pOtI/JaxV6DduaNkzHVV6oVwNft8VKpC/Ht70MEAjdtT64c5D5yTql
 PTKx/gi37ftDkVUPh4VeAG/tRPFJYv8duy8Vc0QrV//oEz/uoPhTEicKk/lzO0XMRpJqdmwdkl
 Lsm2QNq4NFP9Ib7ku743FRepIPgknZWsy2uZZ4L1KPi+dceRzV7vHQvYlQiEQB8FcnBuia80Fc
 lR5UXWG7Em49TbEUJ+6tgPbK
X-SBRS: 5.1
X-MesageID: 52577414
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Diz7g6NVyot3dcBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="52577414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7SlWlGwaXyjVtbqpkeq/EzSChgvLRV7UjG0eOT04HZDkCqujU+wBlpWeVuRjFpwMtyBVsxB5ODz944gHYHp2JP24QJ3aKw2k3+HYr/19u/2XX0bkzDE85mvTZFbXEWGNbWViqr3OCX/1H4QIfyIoLgP4sH3lyAJhk4ZuEnfU7EwB8Ypf55URoleztL2ds+BeeVZaBdKJ3yFrzP+uYMCjIjSgjN6twb/pfPGB9NETYyageS2+5j5niPIqtQNA3r6ZprJeJVGkqVasWhfvesrdZlmYqkEcIgduWVJcMy2xjhwpATwZFQlsLFpb9+g/GbyEX+dDRuktKtOoSoM9N1czA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8OsbXCrpG5uZi/MCeMp64W912DDWz+WDnlhKCE3efRQ=;
 b=H0cSJ4A8CTdxL5zQNVo07fwWmN5V+yy5yAT3R/DCY86JaE78upTgbLcAMGhDHvMMppiKcYbVCETyiblKgaJ98CGLqOubYcIgVtPPMqMf+dXz1Xp5f7RDFOnjm2LsZdo4v834Dj0IqhtrPB7HqO3cgzFRBYry/7l512fPZWJchpEVINbz0PdyLpzEjtdnQBs5g+vyoeb+xg3t6cecPA6ya2vRAQC6dgrk9rj7jQwJ6VfTl+YfiyHOLjWnd/8lAX775cwWbsYUQcHlOOdzvgk/am8CJLXS5fEdVMpioN/xM7U4Lc1vf8cibOCLV3PKOJEJDadwbdouKvWsmWUnXJ2yWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OsbXCrpG5uZi/MCeMp64W912DDWz+WDnlhKCE3efRQ=;
 b=lob7k9njJbxxKgxlsS8UXQYaDZfWtmybmGy7fmIrpXBSVycyLd8Qr1tW7U1pz5XM0GrakzPrLJOozaU8ihMg5lCjCIv83q9bLldb5Omq4/n88ZiZG5akNwkiD0+if++A3bEY7nL46FtZ8FaOfsB3M/5TNT3XltVnhTCRtpmTocI=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-3-andrew.cooper3@citrix.com>
 <606ce242-65d9-2180-8330-525fe5ec5562@suse.com>
 <351b2066-d01f-16d2-f1a0-bd7e2fe0965a@citrix.com>
 <968441f7-cf76-c98d-b256-18416ceca3bc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/amd: Enumeration for speculative features/hints
Message-ID: <dbcf485a-657c-6b27-8e69-31a998eec81e@citrix.com>
Date: Tue, 7 Sep 2021 17:12:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <968441f7-cf76-c98d-b256-18416ceca3bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbbcd21-5fbb-4d72-079c-08d9721a5c03
X-MS-TrafficTypeDiagnostic: BYAPR03MB3991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3991CE002CB9C309C2DC0740BAD39@BYAPR03MB3991.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiMMn9rSfPUqZ3BZ1FYuZoG/04MkPPSORo24oa2zUKk1hCGcA9I459LTu4HbMMLRaFFT8fuyqV73wVvrrBEYf5unGDlbYAo5cJo3th/xz48G7g2IIyD5cO76KRg/I+iKtQ/ZVgoic00p4GlOs5K3mHyFEEYELV0h1EgiGDlZBhrUSv5Dn528we3bIbyi6Y7kq0T75TIVVhao7iomumjNbH2qWepka5loYMOb6xz4FwjyAIPD12PVk9J4yki+tLL7lnkiixwC41IZGOTSwOQhQMOVL16GahQiJqEyF5zUtQctwofFqGjH7bkvrdANxywHoEwTO8wmSYiiqAU0ItfR+WYS9ED4YCnRHu/XaYhw9131a11YjnU6BstVSuoakwFwSnRfKRfELmKYwi64QXAtJpJadnPFZMpwEAdIxX0vKSan6mJ0Mjy/VYnjQYpzRMEaKPo7klLO3Z1Ov2LSX8khH4/OYg7Y1hJk7iTpMrHnzjd2tA6FpsOfiW6hmlU1hJqqwnw5Dt0/rHUe7wKm9kW5kM4WecHzHVQYZY6iVClP+wYYzlTWBcxRnVHqvyzk5aLkqDrCT9aLrmOK6AN4jP9lYPPLhUgrKY5JGTYslBleQuFFM4xwkY8IcnlMxmbSCa3+eghykdbjUXL5ImsbSSKSSLQt/vwataEVykIKqEsC1kVbn2cFX5A88vf1rBG2nPXd52E6mGsLQinKteUANXhttsI8r+woK+sueCTjEoHgA/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(4326008)(86362001)(31696002)(66476007)(66556008)(66946007)(38100700002)(6916009)(16576012)(316002)(54906003)(2616005)(2906002)(5660300002)(31686004)(36756003)(478600001)(6666004)(6486002)(26005)(8936002)(8676002)(186003)(83380400001)(55236004)(956004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRVYVE2QkZTSThzV1FpYkROK0VVMnFodmVzV0xSQ1NxOGFoWGxBM2dLOVBx?=
 =?utf-8?B?cEhqRlBveXVXMHVhaXZiVmhvTmEvalNtS1AvR1pwTG1Lck40Y0w3eE5oVHE5?=
 =?utf-8?B?QnNrakNkeGhsNUhLa0FkeXZudGR4NDJWTzQvR1psanZPcksvMnFzT3QzWVFk?=
 =?utf-8?B?dldKSW80TUNzMkFTZGt5K0MxWktrNlFlTjNXTGpvZzFTTG5ZNjNCanF3ZDdO?=
 =?utf-8?B?R2I0aWtyZW9xakJCa05nMEIyaXJyRFNudW5GTE9kS1FVRGxFN3ByS2U0SE1M?=
 =?utf-8?B?NVhhL3BFUXRvZ1ZIQUs5NVVCUC9PRFM5eXpUWS9oQUNkMnlJM2RvSVhhaFky?=
 =?utf-8?B?R3hwZ2NrWWMyaXQ3aDBZWkpqYWN4ZFRLeGlSN1MxZVpDcGY0dTVxS1RDSXJa?=
 =?utf-8?B?bnZqaGt3Zlo1K3g0SDhkWTBrWmhEdnFKa3lSWEtnS2NINWxUZlNVcW9nN3dy?=
 =?utf-8?B?dGhocU45bXEwZHR5cWxtMFFCYmRGTHBjaVltMnI1WGRmVWZzNXo5dUMxekNT?=
 =?utf-8?B?R0F6UDdtaWZqY2ZCRjFTeHo3MDJRNUFQMkg0ZUpIT0lnMnlmM2ZWVGlsREZD?=
 =?utf-8?B?aDhGNVBIMnBoM0ZFVnlNNjlYNmwwWlR0ZEtqRng3UU5BYk5SRzBRVUVZQTZR?=
 =?utf-8?B?M2hJZ0NUL0RYM3ExYjN6R1hYcDU4bWgxU0tYWmJpVHlRK0tqc2wwNHVxZzJJ?=
 =?utf-8?B?YnVXT1ZSdDlLTzE2UTAyc0EzSU1zRDd1SEVxekN2dVJGU1lDVlJCdGNKRm5l?=
 =?utf-8?B?V1lYejAzT1N2dC9zT2Z6b0s5endhTHMvYTBtdDAxcFJKMVA5OVFOWWRKZ0tO?=
 =?utf-8?B?MjFtS2t2SG1zNHNxY09BT3FjUkZyNFpEdXFOQTRkNlVKdFBqNUZidC9vZlk4?=
 =?utf-8?B?YnVTZW5zdXExbG90UGVNTE1mWmRVOEI2eWJZYXBlM3UxdmdISWZCaFdaVmNa?=
 =?utf-8?B?aVFwSk5uQ29DaFhJdTlqNVY2alpjVExSQ3VVVjF0SUlUTVViOFBKMG5DZncw?=
 =?utf-8?B?M0ZiQlZveEgrT1ZjSkwyTFFxRytlZ3psZXF1K0VxTCt6MFBmaFJndVNyVDZ6?=
 =?utf-8?B?QTI4NkdCeTQ5RVdwTkZNN3V0KzJ2blpZdEJJeVo2MzFFM1ZWOU5RSVVSdHpq?=
 =?utf-8?B?SmtkYThiY3BKcDEweTY5aU1RN0VucTg4bDZzdkhMZ0tXRXVVWEZxYVgrb2Yx?=
 =?utf-8?B?UFRpa1pVZXdSdk5UN3VkeCsvSFBSYW14TmZsbWM0OWIrbXVneDdLM3FvRytS?=
 =?utf-8?B?WWg3Z0RpYWhBZkc0Y1JRVmNvNVRNdC8rczNQcFpaRTBZN1l3Sjc1ai9UUzRq?=
 =?utf-8?B?dFphZkNySkxndXNaYTNlNjRqVTJqd3oyeUc0K0h5cURjSUdERDNYN0IyOVo0?=
 =?utf-8?B?ZFFmSXRDM2lTZXp0Z0RtYjFoMy9UVkdpS3BOZm1pejRqOXM5NTdEMzMrd1Fx?=
 =?utf-8?B?bStjVjlVMmc2U2xsTlkwcnRVNXBrUGtVRFF3YUdIWnVnblh1b1Rwd3VBcU1p?=
 =?utf-8?B?cmc2Q1ZLZWkrTEJiTG16NFA0MVZIZG5XQkQ2NjFPQ082TkdiYmJzZmFZNHk4?=
 =?utf-8?B?NVRyMVFjWE9lT0dxNEZqOVZpTlN2V0oya3RvMFYzdUpvdU9kUUdmdkRMNHpX?=
 =?utf-8?B?dmtaNEdNTHR1aVJrdHgrem9TSml1SEJSTjRXL2QwOGpDcjdMekUzb2MyMFVF?=
 =?utf-8?B?dytiQU9mdlpqbmh1ZExOdzZZckQ5enA5ZVB0Um11eTd4M1ZJK1RmOExTVllS?=
 =?utf-8?Q?Pc6AYEOC/nKIyXbEwTvnQW46ugiEZdQH2omQENJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbbcd21-5fbb-4d72-079c-08d9721a5c03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 16:12:58.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmBz/ID+jSTgP4p0zJ0TZdweuND9APX95qKzOphWDRv5jvEdK74LGcSzIt2KhIUbGJSczHWNbjNM85GWZGchk0I1K/CSMvvf+q1b3ahSHkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3991
X-OriginatorOrg: citrix.com

On 24/08/2021 16:15, Jan Beulich wrote:
> On 24.08.2021 15:26, Andrew Cooper wrote:
>> On 19/08/2021 15:47, Jan Beulich wrote:
>>> On 17.08.2021 16:30, Andrew Cooper wrote:
>>>> There is a step change in speculation protections between the Zen1 and=
 Zen2
>>>> microarchitectures.
>>>>
>>>> Zen1 and older have no special support.  Control bits in non-architect=
ural
>>>> MSRs are used to make lfence be dispatch-serialising (Spectre v1), and=
 to
>>>> disable Memory Disambiguation (Speculative Store Bypass).  IBPB was
>>>> retrofitted in a microcode update, and software methods are required f=
or
>>>> Spectre v2 protections.
>>>>
>>>> Because the bit controlling Memory Disambiguation is model specific,
>>>> hypervisors are expected to expose a MSR_VIRT_SPEC_CTRL interface whic=
h
>>>> abstracts the model specific details.
>>>>
>>>> Zen2 and later implement the MSR_SPEC_CTRL interface in hardware, and
>>>> virtualise the interface for HVM guests to use.  A number of hint bits=
 are
>>>> specified too to help guide OS software to the most efficient mitigati=
on
>>>> strategy.
>>>>
>>>> Zen3 introduced a new feature, Predictive Store Forwarding, along with=
 a
>>>> control to disable it in sensitive code.
>>>>
>>>> Add CPUID and VMCB details for all the new functionality.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> with one suggestion:
>>>
>>>> --- a/tools/libs/light/libxl_cpuid.c
>>>> +++ b/tools/libs/light/libxl_cpuid.c
>>>> @@ -274,8 +274,18 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_l=
ist *cpuid, const char* str)
>>>>          {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
>>>>          {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
>>>>          {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
>>>> +        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
>>>> +        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
>>>> +        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
>>>> +        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
>>>> +        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
>>>> +        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
>>> Here and below, how about dropping the "mode" part of the name?
>>> I can't seem to be able to think of any other "same" that could
>>> possibly apply here.
>> ibrs-same is very ambiguous.
> I'm curious as to why you think so.

Same what?=C2=A0 There are load of plausible options, e.g. "privilege".

"mode" is the second most important piece of info, behind ibrs.

>
>> =C2=A0 The only other reasonable reasonable
>> alternative I can think of is ibrs-psmp as an abbreviation for
>> ProvideSameModeProtection.=C2=A0 Obviously, the "Provides" bit of that c=
an't
>> be dropped.
> Then better stay with what you have I would say - for me "psmp"
> immediately raises the question "What strange kind of SMP?"
> While not tied to any formal naming, I could see "ibrs-sm" as
> an option ...

That's an initialisation of a shortening, and too far removed from the
original context IMO.

Given nothing better, I'll stick with ibrs-same-mode.

~Andrew


