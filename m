Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07D3D7A2B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 17:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161255.296098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8PJX-0007yV-LI; Tue, 27 Jul 2021 15:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161255.296098; Tue, 27 Jul 2021 15:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8PJX-0007wZ-Hz; Tue, 27 Jul 2021 15:48:15 +0000
Received: by outflank-mailman (input) for mailman id 161255;
 Tue, 27 Jul 2021 15:48:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8PJV-0007wT-KR
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 15:48:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c0831aa-eef2-11eb-9716-12813bfff9fa;
 Tue, 27 Jul 2021 15:48:12 +0000 (UTC)
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
X-Inumbo-ID: 0c0831aa-eef2-11eb-9716-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627400892;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9AhnYcJcNq6FdM8YaKiNtgmPSs06JTGgeEDhDychnDM=;
  b=NlwzErRhtoCrb5r2PRkmNyD3G74czqsw4Mupauo2Zug3+e55K4kRBWg9
   D52WPawNycCL9V0QvYUzx0dTTmFQIap667hKVuDnkTD1repEmop+4prY0
   sZRWAuHqlTtPFV8cZgXWhJ6bxcERry4jT7mZVgvWWUsf0fWbcIml4QKXu
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XMP+0AnV5lAxh8h+sgpp10kZCQx9u+kStd066bprAU3yeVS2cMrlk04AYW43arBaJiJAsD6Ubp
 OABO/EQtpC3RgiclMIy9TQov7UoFEsaBxxd+n1vmSwZQM3FOj3Q8THjft2pkIOWUGhw/mc+dHq
 ThjCfhORvYOOtxUyt7xzsX7MxW2I/9xeGOhT08mYu21oyP/XE+pypx+ukCWD/EkBhwgdt6op+b
 arl3o/MOb1Szg8eA6HueZeAQyKotWqiKDnHf7AHl6w+gTTQYRbKNlX8iVJEWWjncMgB4KngD8u
 /BpoUGNjNOUmpm5cT8lHsSTL
X-SBRS: 5.1
X-MesageID: 49202137
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eFLuqK2X6MGxhTv+xppFaAqjBTtyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AeV0gj1XYfNu/yKDwHeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1LtQr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MhkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS09I7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/VWH+ObcGkjbIy32BXTr4qeuon5rdTFCvgslLfUk7zI9HMlXcegc2w
 ysWZ4Y5o2nTactHOlA7ak6MJOK41f2MGXx2VSpUBza/ZE8SgbwQqHMkcMIDcGRCdE1JcgJ6d
 j8uG0xjx96R6upM7zU4KF2
X-IronPort-AV: E=Sophos;i="5.84,274,1620705600"; 
   d="scan'208";a="49202137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kh3Ygx/iydf5b2LoGAY1Fh8OzrvN+B7p3oOsX7NOpVO4vNzRh5EDkWM8gp2ujxC4ZqussBfYhwzZSgmPf5FfDvoTgPoaZBssiMK+uPi6tCbTiL1ZbSTRIjFPNER7D6502ic5bbXWCW1PqM5N3QZN5930ybIJUie6PU0Pn9J1pPFeVthWMxtyvkLhnRO9GZpdLrB3mg6wXOnDtkVHPBd3WJaIR+beMD/WowqTo07V86aJ1D8Jrjadfj9mNt3d6GCDA1NtEDrgTQCmehb29zJHOyoXAyoh40sOcuIUY9g+X0cLoup4ftbVWMj5q9H4+dVMXqc3aw1HcenulbFQuIja3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AhnYcJcNq6FdM8YaKiNtgmPSs06JTGgeEDhDychnDM=;
 b=oFiwWIH86Zp7onHpE9d09VYrIlzjoFyrCs4/riqr/5sQpBbFtxQjbBG/WtldH2IEKy0lQO6AA0Uj13LsyckeZG6uCtvX7KUKBTvt8qpnlMhrXaEXQqmApf6RcNajj/MSlPLdonLPFMKsv3d3n/lDS1JWZ3/cAS1LEuXrTlo/+xvs6VluFuyjYTt0qSsZWeKCII9YEt3bsC2lircrGlA1BjCuus12AyhxBxJoLQooExp5U1sgRAssWPFMP05YNc7dp5uf0Jwn8hn0AGUfHKDwBh1MBcCy2SjzPTlcJfMPIXUflhMohflx29ryVKykgXDX2BARFRzMdtSS0ItoNqtaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AhnYcJcNq6FdM8YaKiNtgmPSs06JTGgeEDhDychnDM=;
 b=Lo0YwsRD3hM3gH/vaMEZQjuJasP3io1L9vrrkXgtnF7z/0REZTUP7FbOs3mxMHRUgKEC2umgwLKrQOExZvGNJsncVBuB0vyTL2/G3U3XerXgxU6d8awT+aOx30ZeKlX3mYH1bC8If2rJUCjqVlh+rWDWJLnHAirvjrGymz2YefA=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20210602033206.720860-1-marmarek@invisiblethingslab.com>
 <24832.4209.469293.942341@mariner.uk.xensource.com>
 <YQAmVs+hOSr22M69@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] autoconf: fix handling absolute $PYTHON path
Message-ID: <1fa02ecc-b873-1ad2-9f3f-9da881ac97ba@citrix.com>
Date: Tue, 27 Jul 2021 16:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQAmVs+hOSr22M69@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd681c86-671e-4667-e4d1-08d95115ed69
X-MS-TrafficTypeDiagnostic: BY5PR03MB5078:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50781A2370F46E3599357563BAE99@BY5PR03MB5078.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGAkvOCLpE11KUZ2eqFCPe/pRPhs076DurnQH2SP2iv7SYABxoAG86i0R4EZ9WlHwrTYp/qiMLCba5DsoP9XfkZrwLzzcsKdhBHwPvPuZddJ0K6i0rpSkivqnW3/QiLz4k7MOWOS1Vjjq60U8/KocUzCBbVkIzXCGxpwKHsEdWwChA5n/IywH2SqQ+8+7USvLH2qPDKq4RanYQGDpMOAQ0MPQJlV5TA4e8vedx4rkcEfFqZyXStlyNlJAGhEA467Z69s4f6S17fyrZ55H1rj/597UL4qn8EDBWrbfyUMiBaI0xktP5Ib4EaRS2hNAxOaxFKpm4gwRiEBmS2co4NxeajNF+dbLJwUDa5UHN6CMScqeX33aH/EBwCfgbaV2QRClr1cvihZqctmdzRjk4ioNbrlaPdtg/OStmMos8nVlRXz6ouvIexP+oWVZuqFxgJ0zoolQBhWwQ1AK8QU02P973x3Djirj+XihH7UuS6KQenQKDUy2vV+ykwI9kX+XLrtPlB1jGA/55LdvXGnaE28+ZGjXZXcdUC1W+PmLv1qvOtM9FLTyGtTfTqKr6erLrvnQh02aC3dSE54oaPe1YApQ6o0ir6zvQgnhAiRib6OV9UIbM3loiMlbpRDQgRY6B1cOEKeY/AdP35J/J6x3GzRxqpZpPeC6NOI5sQHFUBa1pUqDWVM/mPWDCf3jiJOF1c15eV9LlnBYJcWccvLAMpwUYqM4JCroV4slrozwKDMBDh+3k6uUkRUIqMITOOVXPFFWuQQ+Futpb9mpm3TNcLfzTIXiopGiSb6C7gquftRTZTaESlX9Nzx/xrT5h4Q4lA2mdmcYv7Pvjr/SiI5RPsF8QIFBE+L6kj+xSySXlVbG9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(66946007)(66556008)(186003)(2616005)(966005)(66476007)(8936002)(53546011)(31686004)(6666004)(5660300002)(38100700002)(8676002)(86362001)(4326008)(16576012)(31696002)(478600001)(4744005)(956004)(316002)(36756003)(110136005)(6486002)(2906002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWlCOVBVejNjb2t2ZmNPUFEzZWlXZUpEYUU1ZFNtSldTb1k5UzhFdkMrZC9C?=
 =?utf-8?B?eXB1Z0R3ZS9Uc2VDcXoxcld1Wnpid0VXM05leFBkSW8zWFlPQTZpUE90MWNM?=
 =?utf-8?B?N0lpQVhOMmExTG5mVDJ2K1BxcHIzYVF6S3JiNEpkRGlJRkdaZGw3dGlKNUQ4?=
 =?utf-8?B?YmJURnN4aUNtcFdIaWtIQTkrZTNVcG8vYTQ3SFZybVlUd3JHekh5U1JTTmFQ?=
 =?utf-8?B?elJaSVdMemorWEVaZmwyMjViaFh0NW9zdU51YWJaOTgyL2RuK0VrU2Q2RzN6?=
 =?utf-8?B?RjU1VFZGT0FabjhzdDhQY004UitQN0tQNU83OC9ySzJPc003cFFvcllpdkFL?=
 =?utf-8?B?cGtxOEJ5TnhBditHd1ZnRDZsbUVBUGFkTmZ6eFR6WTV1TDdTUkJNREIxUVdE?=
 =?utf-8?B?eXh1S2VhTTlEbkRIc3V0NTRRVnc0ZTRoem5RNkxLeitUOWZvTW1SVWFnaFQv?=
 =?utf-8?B?K1hva1RZdGl4alMyQ3ZLdDZPQWRndE9udHBwWGdLZXpvSXZGM29nd2ZmYUI1?=
 =?utf-8?B?K2xJZi9KOFJUaHpZVGZuK2lVSS9xQVBNQzN5ZjZ4UUQzajZ4aTV2VXBnamJP?=
 =?utf-8?B?aWRkdXlCVEN3cmladUozSWdjRmkxSENWOFp2SWdxeXY3WlExR09SeEZLSlh5?=
 =?utf-8?B?eXB5SEIvWHljS1VEVm4xSEI5dk1wdVYydHVNd1BpQ2xOcE5iSVhhTDdZblFC?=
 =?utf-8?B?SmpJLzlnT2QxUzVNamxXNjBVcTBLV0RuRHhJbVNJaStUV3dZS3R2MlQ1TENQ?=
 =?utf-8?B?a1h6Myt3SkNTTS91NkVBczVscld1RnczK2RWa1h4MkdTQnZhY2NETVJxQjIr?=
 =?utf-8?B?ZkNYd1l0NWlLaTYwNmlGVEJSbTh5UFRSTVlBUXROdkhDU2tlQXd2WkxnVWFy?=
 =?utf-8?B?YXNOQis3WUlvV29HMTZVUjJJQjJKQWkvMWZTbTdXcFVwb0JUWWtFREVBeXdU?=
 =?utf-8?B?MHAwRlRMK0xwSW9CNG94S0N1N2JlTzU5Z1NxVFlVeHVCc1RoWU1tM3JseHFr?=
 =?utf-8?B?Vm9zb2V1N3ZjVUZnaWRtUzJzL0V6QVRvOWJKcFhGQnVZei9uREcvUDN4UE5x?=
 =?utf-8?B?WHpHcEhncW9HYVZtWTN4cmFsbFpSVW96UTJ2WEd6T21MZVpDb1Nhd0ZOZjZ1?=
 =?utf-8?B?VVBueTJxTnM3dEVDNnpWQUp2Umlaa3o0a2o3MkY3TmREdXNsSldFUkh0SjN5?=
 =?utf-8?B?RldITXp5dGdvb3cyZDRvQklmeWVwTzBnaURFNEROWlF6WlMrY3F5d1dFbXBu?=
 =?utf-8?B?WHF5RWREb1ZNWHROWUl4K2x5ejdOVHFVTmJhQXpxSldUaThxOUxibVZxZlpL?=
 =?utf-8?B?blVKeWlHNEFIVFFsMjdIZ3JKM3oxSlBYbGliang4aCs3aVErbUxVcU84dUxi?=
 =?utf-8?B?U1BTRWlLV3B3amxCNE54akZMTGlqbWtzQ3dxUzJQZjJLdHBtYjZIdXFpTXpK?=
 =?utf-8?B?ZmZZRDdScE5Gbit6VHVwZnFRenN5L1RsOWI0R2xDNm5rWTZOcTVidndSWVRJ?=
 =?utf-8?B?bmtVT3UzZ0lEM1kzekFGOTRwTW00d2tpQUxSNWN4N0dtVHZoZlNRZG1KNGVv?=
 =?utf-8?B?dUVRbnBsT05iYVFCbmt2WSs0eEs1TWUwSm9UbE03a2Jzd25KVHNyVmJ0eE1W?=
 =?utf-8?B?T0pzRnBObXdMR01mTTJKODg2dGZPQnpVNWZwWGxHQWFYTjBzK1cwSXJnS0Vw?=
 =?utf-8?B?OHQ0QnhDRDYwcFozZkF5Q3VLMklFSkxWWEpjUmt5R1A1NVFvUUkwK29VR3V1?=
 =?utf-8?Q?J85rdgHWlWvSQ2VOvV+VpdEGvPpp4rdQKplRSHh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd681c86-671e-4667-e4d1-08d95115ed69
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 15:48:07.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMqkPChlAEZ/qpDLV1+zyL/soXCRg45e/JRrtFMaXy2+RWKh8j8vm6gXKGOWyl2BQHHCOfCqXm7GpJCGRMvLoc0eaGM9YA0h1nNHd0XWq2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
X-OriginatorOrg: citrix.com

On 27/07/2021 16:29, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Jul 27, 2021 at 02:56:01PM +0100, Ian Jackson wrote:
>> Marek Marczykowski-G=C3=B3recki writes ("[PATCH] autoconf: fix handling =
absolute $PYTHON path"):
> BTW, are patches sent to xen-devel automatically built on gitlab-ci now?
> How can I find such test build results?

Emails still aren't being sent automatically yet.=C2=A0 CI is *still*
deterministically broken from the PV32 breakage, and intermittently from
an arm32 randconfig issue.

Everything:
https://gitlab.com/xen-project/patchew/xen/-/pipelines

Specific run for this patch:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/313320712

Looks like it got hit by some of the networking errors which happened
around that time.

~Andrew


