Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1283D5ACA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jul 2021 15:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160966.295562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m814q-0005Au-1a; Mon, 26 Jul 2021 13:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160966.295562; Mon, 26 Jul 2021 13:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m814p-00058L-Tv; Mon, 26 Jul 2021 13:55:27 +0000
Received: by outflank-mailman (input) for mailman id 160966;
 Mon, 26 Jul 2021 13:55:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UIK7=MS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m814n-00058F-DT
 for xen-devel@lists.xenproject.org; Mon, 26 Jul 2021 13:55:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 126ec0ea-e914-41d0-a72d-06f91855f4eb;
 Mon, 26 Jul 2021 13:55:23 +0000 (UTC)
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
X-Inumbo-ID: 126ec0ea-e914-41d0-a72d-06f91855f4eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627307723;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o8HcMuq9VLuT8c95W9rZ92srnw7KM6NzsEK6CCvUPbo=;
  b=F/Kwas4jqUWAdfd1nQuOTna1ekNduxQXOa+WLibsaA45L+7H+7dExUxi
   PyOp8rxUBI3aQcgsPCHH5VpPoSv5mEvPzlc5ZiHSd1LIhEorydmRqeh+w
   YBByA3scDJ8GuRBmm5UdKEHRJCgAbRz0B2zVwU2z4Hz8Uu3uu/tjEspWL
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m4W1CVQvQCUKk3u7h3Wf1l11wyBcJn/Ixg7hLXgsieQhpcQI2iRNjIGWTsbzvYY5hgR/DB5J4u
 Y+wpUk9FckOP0Hkw6dZZfUtNfI0JnjQLCQzm0hhsfbjG5X22I6cPtRDV3sqeyKEG3vn1QjPxUP
 jOAe1qI+fzWgiDEybSqztToBVYMCN5WSa2ES1PRPRxmLiB0RzDMhtS+LF/bxY8lwqL5y/DJJaZ
 2KxgM+/YyNkB1+zExRkwJpWEGVh2FoSohme+KfFtrLs0PYNodGKv7l4vgExxKtvv7VcZQNIyVV
 St6osZ373G2dWCe5Fbp86o4x
X-SBRS: 5.1
X-MesageID: 48759023
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EHE5DK82awY+GmAZuXluk+FKdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3I6urwR5VoJkmsiaKdgLNhQItKOTOGhILGFvAb0WKP+UyGJ8S6zJ8m6U
 4CSdkPNDSTNykCsS+S2mDReLxMsbr3ktHbuQ6d9QYIcegDUdAQ0+4TMHf8LqQZfngiOXN0Lu
 vm2iIRzADQB0j/I/7LSkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IfEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4FC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspMq+SWnqKkwxg1MfhOBFBh8Ib1C7qwk5y42oOgFt7TJEJxBy/r1Yop9on6hNOKWt5I
 z/Q+xVff91P5YrhJlGdZM8qP2MeyXwqCL3QRevyGvcZdY60lL22tTKCeYOlayXkKJh9upFpH
 2GaiIBiVIP
X-IronPort-AV: E=Sophos;i="5.84,270,1620705600"; 
   d="scan'208";a="48759023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVaxjROAzUkCCZmgIzsItZeLKUFf7WqPOKsuDggSaywENgd0Z5ZhGJUcMltyZgtkRhAlw3H0Kqc3ezCtIIYlMfp+w8gsaz4Qro7X6wTUxNJoHPqkfj8lzvZ8rjKgVqNxwiGp6XyMQFEERKVSOD0o+hua0W8Z6l78nj8HYK4b7NaVxqhBoyzdkahLBrH9V7JxFhnBV63g2Pd7C7P0jZ9FaMMwAcizWPl0XOEM+pWMTv82bQpO+78MMygnvCkuiRl6mj9NU00uFzqHUcYXOYfWPqjAIJrHZ1IfjJZdUSUvX9KadA6rMbwfpJdq4li5a65ktfkTXAiWB+KJJbfUsrzfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPLanxlGLrFNWn3Yf8ofV/qFHuk2lJWJ9gIzpdPb7Uo=;
 b=OmyouAJ9C7ailBQhxh8ypddi+oDIWIgUskz6LiiYUJoJxhXMqul7MAPbdSIQfh4NgLq2jUAMXVl7Tc5AvIR6MW93oJt3ewSqsdcHU3KJRjVMJJ/NfJgVy9i6Vf+5JqZ7j9l+I5XP5H6vPfDHdouFbRoczj0mFFAho8kYIwEYaOW8bxWjfvrMO2VBFe4ytwjUvHv3oLfJH2ZLYXWDQ1pAy0jCnREVkHMh2t4GMkS54eOYrYekSbBUVS9IaqWwqNc63fpyLof2c+cNarb2+8QZCZRrFtjGdzWgN50KO12UkSPV2rY4XBuAnaHnqLO15L9+sOchIB2fg9Jvwp4NcMvzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPLanxlGLrFNWn3Yf8ofV/qFHuk2lJWJ9gIzpdPb7Uo=;
 b=vXOT3CIrEG9NYluiJSW8Uuq2NGpTuMW/fzPUsrEieveqQMfkygkBAisQcuVryVS5eZz5EBT1cSXJOtaAstvYRxnl8MtJjuzoxYc1/JFY2tlxEWHfBn9UUYbSAgxE//p0w0fVrxR6VfmWwvyqfC182GYlO6oN6x7zBM0PTm/quZw=
To: Xentrigued <xentrigued@comcast.net>, <xen-devel@lists.xenproject.org>
References: <001401d77de6$34ff5de0$9efe19a0$@comcast.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Nested Virtualization of Hyper-V on Xen Not Working
Message-ID: <4c46f245-abeb-c6d7-9651-60eaf36adc1b@citrix.com>
Date: Mon, 26 Jul 2021 14:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <001401d77de6$34ff5de0$9efe19a0$@comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0397.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27cb7050-3b0b-4761-5106-08d9503d0168
X-MS-TrafficTypeDiagnostic: BYAPR03MB4551:
X-Microsoft-Antispam-PRVS: <BYAPR03MB455181131303F6E4B23AB243BAE89@BYAPR03MB4551.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iYXrrZS2aeYVOim/GEBQjPpU7IUshVGEVP0PHeeoaAX7Z7qeS6fJHAB99MU/815hg1rzrNnRqyUi/DknLHxGFyzFVW2jo3DRz5zROARvKYEBrkQ8iYDy+VnpxDl8WyAeCPY7Y5ygCZLgTNYipYB8v43Uc/bpcfgpTFg3fdsRTmxIl2VfZiWVoGQIuHiTmfcEvhT4+Cq/seCLF8oAaZ3HZPWLaTaFbpdvZG2t9WnnvqMQmSCSxwEUAu7DBpoaw9FTjq8dr/qiuRWAQUjXPC1A0O7Cu7wbT2D+u8kNkx3kcRH0mRBLEC0vfmFG1RZ+mpwyVpkH+cvmcFHMxEeXmrIaP1jm8Jx1/U07f86nomyTuHBj1+WaRa2EtCojWh5T26qCH1MHVWJSWQDumPiGMFFu2h1w1Bd+hV/FUWl6z7uWtNLyYaIdsX5pV60+uhFE4pykZjxP5r8XwpNUNEsELleB1YMzRoLbnOvxLU7kT8dtUVStIgB6bHNDunF238CWv87vM279AD/vsgVJ+ujrEFKxLOmmaZE4juCzisendejhrK7j+1SIzWszSi92a5YqXn9JKT7FPg+MR+UIOk6vJl8H+j/N4/rc6VNln2hRjAcKrNs83dcDT9KJ6q08W04nE9nYz6iiUX6REdxDY/an88CJ6R2x9AcnrLvJE6g/i8br2qkPoBp6+XJ8c8CkxWMt4CMmqLiujYsuuO8YHS0jIewNbFhBRMrtEfthlUVYK/zFRG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(86362001)(38100700002)(6666004)(83380400001)(31686004)(26005)(53546011)(5660300002)(186003)(2906002)(31696002)(8676002)(66946007)(36756003)(66476007)(478600001)(6486002)(66556008)(2616005)(8936002)(16576012)(316002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBlUGN2N2h5cFE2OG5XT2xlSHBqMEV1QnBrTlgxc0NjRFBDNkJzWis4K3FT?=
 =?utf-8?B?YzY1N3JsTWpyS2pOMlNNc24vZXFNZkQzTTAyakdLQm4xRDA5dGUxZlJVMWFT?=
 =?utf-8?B?a3FBTkRZa1ovNlBHVCtTbUZqajlhYTQzaTZMOXpYTk9XKzk1NHhtcFYxTWh4?=
 =?utf-8?B?bUtlZlNQZ0NRWHN3cFBsbmhQNWpBdFlWbjlibThKeGR5SVIxdXhDUjR0Yis1?=
 =?utf-8?B?TWNMdzNIeUdCdmFGSEhXNDZ1OVNCN2wwcVdzbWhyZDh6UGpTTkVleHY1cktM?=
 =?utf-8?B?bWhoZDNqYXExUFF6L2FIdXByUlhCYlJja0dTY2hlaGZRQ2M5WVBZQ2lsSXhk?=
 =?utf-8?B?RHlCREQzd0ZlWWFDa0p3SytUbDJXWkthdUFpek1iY002WnMyQ2EzMkp3M1Jy?=
 =?utf-8?B?dGxUMkxPZHdnZWlCTDM2TWhwOFNPdlJuR25rQ24rbmdEaW5VSE5PdVgxd2hF?=
 =?utf-8?B?Tm1oTEFrOTVFY05IQUVMQkZ2eGlHR25iaVZtWWhEY2JiQnFSVUI2RGV5amdu?=
 =?utf-8?B?Wllucno0TTd3OVZTNGU5SFJoelRLZkpGa2VDZkEyN01ELzkxRTBDcDNrNWlQ?=
 =?utf-8?B?a0tXaDZ0dk1EbmIrd240QWZVaTlhRWdUdTFMY3BidlRhcTY4SjVOWWhUT3Rm?=
 =?utf-8?B?R0lzZ000SW0zTkxQWGZrRWd6Y2NIUk5LYjBVbUprUUJjaU5OU0REM0piNU1Y?=
 =?utf-8?B?NVVqWHR3VHlPOE9kbThBSmJzUGtwcElmN2R4dnlndlZxVGRpcjYzUXYyaGZI?=
 =?utf-8?B?YXhrU2lMOExUL1MvbWZsdXVKWmVvb2psQnJTWG9BaTM5ZVZqckJyQ2JGUVh1?=
 =?utf-8?B?WVEwdVJ5V0hoaW1rdU1WUktOSzdJZEtWbEowRHdYVDh5MmNWTGpaeDI3WmFT?=
 =?utf-8?B?UXVMTXFMeSt3aXE4bmwwNzAxeDN6emJNRXJ5QXo4a21tRThvVnpOOWpqOVRG?=
 =?utf-8?B?bldkdmUyaURTbnM1OERobTRnOEJzRXAxR2swZE5NSDBvRmE0N2dtTWIvNndv?=
 =?utf-8?B?VjdGUG4wY003UUJqN3VuL2FIWVphR2tTakJERFJEd1NBVmxSeVN3bUdVV3kw?=
 =?utf-8?B?VUZPZE1wVERuV09ZTFF2N29BOFgvbGZFZEVvbDdhcENoUVh1ZnpyZHpKV1lz?=
 =?utf-8?B?VFRBRmZwekEvcFE2WEZKazZETDVIOXBzRXNrV0ZtVGt1dW5hNHRQd0tOV0VH?=
 =?utf-8?B?RTVjNUNYZURVYnA1ckJZWXB0QWNqVjJXNUNsSGI0ZWZyYnhrYjJZa2FULzZL?=
 =?utf-8?B?WVdkZ0NVWkNOUUtITHlxRmRFQStkUGhZQUFTVmVETkVmRk5EZ0ZuRUkrQ3A4?=
 =?utf-8?B?Y1lBNUlmSlRYS1NuRHZTTDl6NWRjNERtMmZ0cDV2M2VuNHJKK1ZoN3VQdG1F?=
 =?utf-8?B?aFowZ0x0b0E4ZERYWUhrczN6Sm15UGFTRHgvTlUwWVNOV3d5bXlreXRsZ2No?=
 =?utf-8?B?UXpaV3NzVWx0aGlhVWtBU09NVFlKMlVMd2VPOGZ6SzZVKzdSelgySTh6ektv?=
 =?utf-8?B?TWdydWhvQ3l4K3oxaVpJVmZaeEFKcE5sZk51cm5senNyT2dFdUtPa3R6K2N6?=
 =?utf-8?B?UEh6dkFJWGZ4TnNLSHlBMTkxQVYvYWl1eVlFbWJiN216SUpKbGZxRjVvTzNy?=
 =?utf-8?B?R2lwMGw5UUNPcFp3UVhQK0hYRG03YThNenJScnhRRzRqUzFYbnhjNXNmOEF5?=
 =?utf-8?B?d2hMaHJaRVFnblpQODNDWGxzdzVOS0hjZDhjcUxwenhQbk5TVVgxUHRkdTEw?=
 =?utf-8?Q?EqR5Dlwc0LC8CAeUsMPChhetUajfqOTzM8+iFBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cb7050-3b0b-4761-5106-08d9503d0168
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 13:55:19.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr4nwVpN84Q40Pt1OOy7Ak+TjC6XxBIkiL49JZ2D6I40DgkiVDgC1hLi3HwnqsfrnDFABhKfSCRjQVVxcNmr9xy8ckodeg3eKSueaIR9oXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4551
X-OriginatorOrg: citrix.com

On 21/07/2021 05:09, Xentrigued wrote:
> SUMMATION:
> Clearly, much effort has already been expended to support the Viridian
> enlightenments that optimize running Windows on Xen.  It also looks like =
a
> significant amount of effort has been put forth to advance nested
> virtualization in general.
>
> Therefore, if it would be helpful, I am willing to perform testing and
> provide feedback and logs as appropriate in order to help get this workin=
g.
>
> While my day job is managing a heterogeneous collection of systems runnin=
g
> on various hypervisors, I have learned the rudiments of integrating patch=
es
> and rebuilding Xen from source so could no doubt be useful in assisting y=
ou
> with this worthwhile endeavor.

Hello,

Thankyou for your interest and volunteering.

Nested virt under Xen is a disaster.=C2=A0 It has been bitrotting for 5
years, and was introduced in an ill-advised way to begin with.

With my Citrix Hypervisor hat on, getting Windows VBS working is a high
priority, but other security work keeps on taking priority.=C2=A0 The
non-security work I am managing to do is all about CPUID and MSR
handling at the toolstack level (rectifying some 15 years of accumulated
technical debt), which is a prerequisite to being able to support nested
virtualisation on Intel in a sustainable way.

There are two things which I know definitely don't work.
1) NMI Virtualisation isn't advertised (but is available if you ignore
the signs of its absence).=C2=A0 Most hypervisors refuse to function withou=
t it.
2) VMCS-based EFER loading/saving doesn't work on virtual vmentry/exit.

Fixing 1) is a online patch.

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e9f94daf6493..4c80912368d5 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2237,6 +2237,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64
*msr_content)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 1-settings */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data =3D PIN_BASED_EXT_INT=
R_MASK |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PIN_BASED_NMI_EXITING |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 PIN_BASED_VIRTUAL_NMIS |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PIN_BASED_PREEMPT_TIMER;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data =3D gen_vmx_msr(data,=
 VMX_PINBASED_CTLS_DEFAULT1, host_data);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;


Fixing 2) is more tricky.=C2=A0 I "broke" it when I fixed a more serious bu=
g
in Xen by making use of EFER-loading in the first place.=C2=A0 This patch
ought to revert to the old behaviour.

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index f9f9bc18cdbc..e4c353202e2a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -418,7 +418,7 @@ static int vmx_init_vmcs_config(bool bsp)
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 min =3D VM_EXIT_ACK_INTR_ON_EXIT;
=C2=A0=C2=A0=C2=A0=C2=A0 opt =3D (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOS=
T_PAT |
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VM_EXIT_LOAD_=
HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VM_EXIT_CLEAR=
_BNDCFGS);
=C2=A0=C2=A0=C2=A0=C2=A0 min |=3D VM_EXIT_IA32E_MODE;
=C2=A0=C2=A0=C2=A0=C2=A0 _vmx_vmexit_control =3D adjust_vmx_controls(
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VMExit Control", min, opt=
, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
@@ -458,7 +458,7 @@ static int vmx_init_vmcs_config(bool bsp)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _vmx_secondary_exec_contro=
l &=3D
~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 min =3D 0;
-=C2=A0=C2=A0=C2=A0 opt =3D (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_=
EFER |
+=C2=A0=C2=A0=C2=A0 opt =3D (VM_ENTRY_LOAD_GUEST_PAT |
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VM_ENTRY=
_LOAD_BNDCFGS);
=C2=A0=C2=A0=C2=A0=C2=A0 _vmx_vmentry_control =3D adjust_vmx_controls(
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VMEntry Control", min, op=
t, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);


For how, the most important thing is to get one other "modern"
hypervisor working under Xen.=C2=A0 Nested-virt is "just an emulation" of
VT-x (Intel) / SVM (AMD), so it doesn't matter very much what hypervisor
you use in the VM if you're trying to debug why Xen's nested virt is broken=
.

Furthermore, you stand a far better chance of getting something working
by picking an old version of Windows/HyperV first, as it will use fewer
"new" features in hardware.=C2=A0 The only way we're going to fix things is
incrementally.

~Andrew


