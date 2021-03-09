Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9E3330E4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 22:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95789.180803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJjtt-00018H-1n; Tue, 09 Mar 2021 21:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95789.180803; Tue, 09 Mar 2021 21:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJjts-00017s-UM; Tue, 09 Mar 2021 21:28:20 +0000
Received: by outflank-mailman (input) for mailman id 95789;
 Tue, 09 Mar 2021 21:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uN4=IH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJjtr-00017n-G8
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 21:28:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 891c1b58-7219-4156-b7cf-5f50b8510870;
 Tue, 09 Mar 2021 21:28:18 +0000 (UTC)
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
X-Inumbo-ID: 891c1b58-7219-4156-b7cf-5f50b8510870
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615325298;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MUEbdImqHtSsNbjyATBdV0L+7oRR93ty0OFvf8xU3SU=;
  b=Jxo/ZXaYMo+3LftIqp2X3nYK6uiEbR/RQWlRwv4Cnr7Bd3J8hSzuU3pz
   Ra2ffmsOZgToFZrfuIEtX1xRCa3pML/v3Pg0E9+8mH8xGeHDYV1Mya8xk
   IfWLeJRcNCMm13whgQcTaj0VW3/5eHxSS3MHyY7UvDOHij9I0M65eqvnr
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OzOu2NJ0T+GUbtZW4pNe+3ItqPiRQV8pwhTM+xe+FognLQZ3m9ApM/TutgouqFP50let+z0j2c
 JopbjPc0ihqZHSL8gDUG3drir4kzoyXznJK1xjb3L3ssYgY4jTXqbHWeaSjOQMzom6Bb7zS/Bs
 X8obeBVYsES6Bnl3B4rcOeHZggsQ1lC4jb91NyBHzE0aTBXsX6u28CBBq/s/rEGQSOFyPO7dMu
 mBqAzzTqAsXEok+sE0O1uJvCIlcbsZycV363HlRRFno+nbEm2nd/yQJda/KCgCF6lvpx8ygM4F
 gMM=
X-SBRS: 5.2
X-MesageID: 39271719
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,236,1610427600"; 
   d="scan'208";a="39271719"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7f1fAvR13JwzgkE1fLDKkFOzLW4Lhy5MC5cGyCeYSDxXtJDMyDE6tmoEa4lLF4aiqyaWD5PBQk5CZ5MU3yWcQHjFh6dO5l9DCmWtfDKm8jqDQUmgLUL3v6/+W+AoptLrU31e0cub3cNdY5IRSFfVTrk2olISANsGDPzB8P6t4zP5jxftradSfCEKTJdClTJ+dJXAADDfjaMrEqfd0tEX8LcfSzyIhz9gZudq12HT/JaLvHFsiYlL3wejv2287fJTfz+/mMWPwBI6HH2i/9hsNHfOkyfXM39ahIJqez8GzMkEweeVJA+RtOb/DsMm8XHkBSzVvuSdt+rt6zVidQgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHAWXWQeFMG1dZV+TkKBpIvZ2X4MziZTej5Jb9/tD8s=;
 b=UfhxqAeYVilgQXb5JMTDAyiTOczlVbQHiG+37nSR/OUZCvKFQhJYbn0IhyAR7XGFZL1lEdZEKe5A7xR0LoDyLR7f00gqkilw+Pk7Q06pQXDUhUbAoA8LwCX77Rfk3GKc56phzROox/TEJ+gY5tJuh5yP/SjolhiN7jwCKoEdbuQSCguDV9kW2hENkMxUVJctlszvWUu49+Qie0lhS5VcRhA/TUJo+ClBK5+xIIbYY7zi1n0j1gvrS5uCuNlDQbRpHkIEdVApiysKSJl1fLWdrUx9ZOSqcoMgHHlCZP5qA2Pq4Z4iRdeT4Mwg8w/aCHI1TSh30vao+ODgfk1phP3QiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHAWXWQeFMG1dZV+TkKBpIvZ2X4MziZTej5Jb9/tD8s=;
 b=JouFyZmGP0cvsoyTTCznByOoVm0TJAHgcDfj55wflCJZLFS9LOlTS8e7JJxjL14yKH4bdsOgUDRO7i5eJaeAU0YxAQ7SPrx8mQJOp43LJsIgMEwqdOiezx0l6UUXUNqY55zrlcJTQj3I1aZUdlDYJC2DVnkFgJVC1fOZeSpIwWs=
To: Elliott Mitchell <ehem+xen@m5p.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <202103092114.129LEgZp059925@m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] arm: replace typeof() with __typeof__()
Message-ID: <eaef1b6d-db89-945a-e8be-2b3f9145780c@citrix.com>
Date: Tue, 9 Mar 2021 21:27:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <202103092114.129LEgZp059925@m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bafee5e6-29ab-4f85-46c7-08d8e3422bd8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB416591E94672B44F7DF45EAABA929@BYAPR03MB4165.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iv52jJYqp4pMT1UlYdQ4FXc1BRuHDImey6yUpeCM7Qa6fAcOGLqTUUI2/k3JuFnZfD7BAjVwbV/ir+mgRdJXQNDObH7SoA7Gyrhw++8MQ5Pzl/wEc2qkLCiepdSrpOa2qguQrFb9qpPDI2109Kc1t1Q78tyo9aPzQ292SwE8bGsUXBtdFDdBw+R0isD6JX+brSYBEzK902/IXqs2zbliToXJ91luMN050By6heaQkVB/f4AyWuATyUzpBZZz3B4RuhokDNV0LcBmysQl4yNL08sb8PwzFO5+2SGmoYo2+xdLDLzr/lEsU/y0K7AIFl185FAApI8QqquPyzN8wK3ecX9t1uG62vwXWzsK7o63Rwacj00N5Af9/iiQdNEtt4PFnALXJ4Fe0tnz2fqETHNOP7NIKnVU+msR7AqppngFpnyysEhi36+t1Z9yu/G/ZoGctF036uebBPrBlh7BcCVwCzMrkJAJn0Sev2L875c5kysS/+SaQCDyJp5xiKoA4F5pqlY/WaRA043KVTEQ5LnJ6Z7I6twpDzdwrEGTks7hzagcS4hsILz71mO6+S+F3pxQnblZ1FxXfHW2rM6vEPxfJf/bb0k41aCExsqWRxTLhSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(16526019)(8936002)(4326008)(4744005)(31686004)(83380400001)(6666004)(5660300002)(53546011)(478600001)(8676002)(956004)(2616005)(26005)(36756003)(86362001)(54906003)(316002)(186003)(66556008)(66476007)(66946007)(6486002)(2906002)(16576012)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHBCZHJTRXduenpjRmhzR2pnOHErRVFTU1hlaVNzRHg3ZWZyNG9HK3V2WkRk?=
 =?utf-8?B?M3NWWDQyQ3daQ3dWMDk2SlNScmRZYmR4RzBpTExQVzEvWm5PZUtvY29SMnZJ?=
 =?utf-8?B?eVhXMHJ5NGJ1VUpoZnFaK09HQm9wRmlGckVnZDZRMFBvbzc4Z0o3UTVTKzA2?=
 =?utf-8?B?N1BuU2hEL3BXSDZXeWZwZDFDaFh4SFlMcG1lZ0R3NHBiaEc1dXFvbGk5TXYv?=
 =?utf-8?B?Z01IcWtWUDZHWTZGOFdwUkhrR3ZFdHZKbExOdW1CM0Jja01YUGN2c1hDQjBs?=
 =?utf-8?B?N2JWYUplV1hNLzIrSFFXWXJPeGFQWVJxdmZCdWRrSnkxaGZScjBKVnRCY293?=
 =?utf-8?B?VEl6SHJwNFZSWXJpTGF6dE5CUzdBSWxQZTJvbTJJV2txd1AwNEtUR204eHRj?=
 =?utf-8?B?dHkvbzNXRFkxdmtIa3libXZjeFFZNGp5OHcxaXZHaDNOUXI4NWtuOGVVL3ln?=
 =?utf-8?B?NXZKeHU0aHpoUGsvK0N2MS93bjZkalpJY1pPZS9ZZkZVYXA5SStWZjRoeHlq?=
 =?utf-8?B?aXFqS3ZlZlU4OHAzcjYzZFFSeVdiTnZ5N0t5MHpVZEI1ODJTTHM3dW5jMTdF?=
 =?utf-8?B?RktvSW9QYmRFQ2RIOWl5bno3OFhMMXZIdXZleUwxNE9FOEEwNVdoVzFaS0Mx?=
 =?utf-8?B?cERUWjVXOU16djU3cXozL2thREdjQjh5MmU2WUs3RlFJdzBXVFdmWlljejFS?=
 =?utf-8?B?UC9Dc3JpdmZ3YzF1L1hEN2tGQTBhUlFDVXNBK0dnR2dBeEhnT2tXK0pQSFFZ?=
 =?utf-8?B?V0lFSmxobGhsVTd3QmU0bCtqenB3Z1NFa0lOMnhjcm9CVDdKdC9aV0Mwb0Nu?=
 =?utf-8?B?eXhmQm9SUXM1aWw4dklFYzF4OEVmVjlSWm1PMlFEbnVxZ2VYTTZwaVVzYXlx?=
 =?utf-8?B?cVVwb1ZjSm1CckpuWW9PTGgybndNSllUc1NPRElsV0hsNTV4dm9HQ1c5TUk2?=
 =?utf-8?B?Vk52dE5CNmd4Q0UwVldBa0loS2dIK3dRU3dya09pSzdocjc2SU1YeS9ldFlw?=
 =?utf-8?B?V0g1L2p0TURYWGRqM0w2RlB2aEJLcVNmZGFMeXJncnI5UjE3bi8vcnhabHJo?=
 =?utf-8?B?amZlUW1wNW5SWERqbFhYWSs0dVpoU2pWU1FlMzhNVUt0K0JpSzIrNjlneWla?=
 =?utf-8?B?NjRGY1paZWlpYzN1QXhMVS9JSGtCK1JONmIxQk5veHUycUhQZ2VjSzNySndH?=
 =?utf-8?B?VWY5QnZxQ1lQbldLdjZpZSt1ZWsrL25Ld0NYY2lIVG5PWkhhUk1MaWF2RFE3?=
 =?utf-8?B?OExOSnFmSDZPQndBMGxSQllLaHkyYTVwTmFJVThZSERubFphTWQ1Y2tTcjdm?=
 =?utf-8?B?OWVBZHZOV1VKRFV0VWdobVA2eE95T3M3QzczY0VpaC9TeWgvU1NEYmdhZkRu?=
 =?utf-8?B?V0YwSVVkaThBalI5VVh1ZjhEdnZ0UU5NUFlzR3lsUnRtTWdsQ2hhM1JBT3NX?=
 =?utf-8?B?SFhQT21lbWNnWVh1ZndxWkRaaEJDTzdKcEp5b0QzWkY5UjNCMHI5SGM3NTZa?=
 =?utf-8?B?ME1tQ3ZiblRTVFBscEFEb201ZUNCMlJMRjk2Y3FteU1wVHR3OVFiOVBHZnlC?=
 =?utf-8?B?dFg1MythZ3VPTU1FQjg1YUdZblhHSW1XYXpobXExK2lCSzJwK3lOcXkrMitj?=
 =?utf-8?B?YTU1aEJTVXhJeFh2WU9MNkUyUVViMWhJL3ROeWxLYm96YjhiWWtlQnpiMHJQ?=
 =?utf-8?B?dkN0d040L0xRTCs0bWU3dzN1UlpkNFBFTm5pZVpUTFVaZVhHTnBXcXhOTFlC?=
 =?utf-8?Q?qQ+MfbUFXfjFdMwzajiXCgoAYNIyqMmOce3rVRu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bafee5e6-29ab-4f85-46c7-08d8e3422bd8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 21:27:41.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDdb1Sbpyrp8IJS1D9LjPaAM7f1uYHVgDV5/HZ16VnEKyTDOQHVjoHxf+FR3mARvzhDc95JLI5D86CxiVSPUC1FfOIuW6bn36SiBxsXzM68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4165
X-OriginatorOrg: citrix.com

On 08/03/2021 13:36, Elliott Mitchell wrote:
> typeof() is available in Xen's build environment, which uses Xen's
> compiler.  As these headers are public, they need strict standards
> conformance.  Only __typeof__() is officially standardized.
>
> A compiler in standards conformance mode should report:
>
> warning: implicit declaration of function 'typeof' is invalid in C99
> [-Wimplicit-function-declaration]
>
> (this has been observed with FreeBSD's kernel build environment)
>
> Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015=
 +0100
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

s!arm!xen/public! in the subject seeing as two thirds of the
modifications are in non-ARM headers.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This wants backporting as a build fix, so should be considered for 4.15
at this point.

I wonder why our header checks don't pick this up.=C2=A0 Do we need to thro=
w
a -pedantic around?


