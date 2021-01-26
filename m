Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E897A304196
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75178.135301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PxP-0003gz-2k; Tue, 26 Jan 2021 15:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75178.135301; Tue, 26 Jan 2021 15:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PxO-0003ga-V5; Tue, 26 Jan 2021 15:08:38 +0000
Received: by outflank-mailman (input) for mailman id 75178;
 Tue, 26 Jan 2021 15:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4PxN-0003gV-Fr
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:08:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b18a17e3-dc76-4179-848f-ebda5a84d839;
 Tue, 26 Jan 2021 15:08:36 +0000 (UTC)
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
X-Inumbo-ID: b18a17e3-dc76-4179-848f-ebda5a84d839
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611673716;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Cbxby+22JJT5s6G17TJE+MQec+wLAwDsqEjXe/an9QM=;
  b=e1ry4XZWFv+wMbSKHim/uGNpnec7hmeITVoofnbpWBOq6hNQha4JPqB+
   1mWtdh2a5Fk+hAekwXluLsA/ri1iySPTyOWqkIp5g723Dmi2mudaNbrOh
   jxc2mDV1OXJW/Gd5Puw78PAmhj5aVAuNdcctyqwnYyps9LfO6dBp2u3KC
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IupRIaFd48dOdW09HPPKe/Ym7oGk5qg5cfppVQf6f8tdmHdqTCTbMjkUHBbOH5qFWktrgIrq6F
 MR68KCooJOxJdiXkRGTBMfKhSlXwAuRLYpJSe4T5vxOPY8YA6VWUWLn7gEYz3FiHrZNTnDw+2k
 m5TUgl4eAa6NC8FNFC8aWUuYFVbWDRpz8NQ/PsWiwMk05Yp++fmnxAr1QjFaCLmF0X1r4i5k1v
 W38xRZc1rEfQ7/LULyk5iT2vQKxKQSv8EYzPMX8IZvUXfsHnDDHwJa1Cyd1aRW7oo+CMTj8Upw
 q7o=
X-SBRS: 5.2
X-MesageID: 35841573
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35841573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmZTiPije0jFxVeO6DeIJt2YfNulOVrjTimJ2+tVj2X2AAGxccRh7BKPIhFbdlgLgjtHl0kwgSDNcBAEWs76aF9tJ+nQs/E7lWWYxqhedOqR+u7QrSv5SNr7tMsd/87r/OzZO2SiWiO4AbRgNiMaNEag3N1TsLtevqG2fqxvzx3RAS1rpeZIvleedoR+Adg2ondWrB/RTO6J5Tvtz+DPqFm+qf//VaA23yKyTnzHZjW9GGF71P2pAx2Raqofi3Zg/Lr39OyceQSwudK3RT0E2+epoCTQXA7Sj1hM21NFO59PIn+kcStGMPnfDXmpch4zj1E0uN7vMb0GjzeYYWZAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wJ78wqJlU9I2j3LJfY52PA93FFnLin07FAcEzouDOY=;
 b=Eq/Fb6ZrC/6LU0cBZY1hxxhE0cDq036Nsx2c6S0Hpcx+tK8IIBPwrK6jxCv52qiThb4qsDH8MrJeVkmQpsbkydRifqjDk69QjY4PJfv/R5P6RSSDgK96SeL5De/nEMxZhJX2jPj+3UvYRStjRlJSv210qjzpW2Aqk1WSiGc5XScCnlWGon+b5ByHXo0Y0Yrf8640tBV4usrmTJXEDIKQmRjp9UVKGODup+TxlvL1ONlfROW8w0a//3WR61Myz0iBjXON0RvgREq8BqT1e6nyVErzdxmKO1zL0Jvjil5yTOVl+37LtusFALfnf17oNqy0EGknrPd1cvoBrNSuKLMsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wJ78wqJlU9I2j3LJfY52PA93FFnLin07FAcEzouDOY=;
 b=fGN9pR+x0mb4bVe5Z2dpGq+I3N3ZzPO4UlhZBCZTEmwXi8tia8AigjJtFdMMGETUM/0nUJur3wzoVeKJjjsjc2L+vmapGf66s6PyB/ED/VLGBhixOp5KkS0r9OKsJbZPs5lMyeF68/WxrWk41ilBW0JFxgj2EUQXtujbR1owMkg=
Date: Tue, 26 Jan 2021 16:08:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Norbert
 =?utf-8?B?S2FtacWEc2tp?= <norbert.kaminski@3mdeb.com>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, Jan Beulich <JBeulich@suse.com>, Wei Liu
	<wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>, Piotr Krol
	<piotr.krol@3mdeb.com>, Krystian Hebel <krystian.hebel@3mdeb.com>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
Message-ID: <20210126150811.vidpwx7cxpy5vngo@Air-de-Roger>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
 <20210119154856.hghgw3ob4evxgl7h@Air-de-Roger>
 <3cb5c943-d61b-2ed1-235b-e87f6d6922e3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cb5c943-d61b-2ed1-235b-e87f6d6922e3@citrix.com>
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cef1027d-31a8-4d9b-a7e2-08d8c20c3638
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB45401FD90A58A82075B7D6088FBC9@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RH1hTw0GQyKrmLWqPaNjsCMg2k0L/GFQc8GgjoVUqihFOoT7bejbcvGSyglWx7M6VHCAl0F8E8Npnofxx0SERffByD12HSeuU7B/+4RJ4anLVCE97D1YVWT7dV6Q2t5KHMMJ3RlSIAC1ypfQC2GjZ7oq8L5R6xE9A+G3nLj342YQb/oP4P5fDYznyCm8bmPx9c18xxTpjiPcc20uWZL8GdpbJmr/RvBmgPjQG8fbEikpYDjt7LPhxbDSpUFceHQH/0u7B8uAek466Rk1gWPIadZBRjwRRTS6tcoo6Yy1WBXMH9/QDmSdizM8ZEDHGpv0sJXK1h8RxJt6/1NiwxbQEUmu5N6j1bIZELIgb+4C8tOWJE6ztrBvnXEBdcYrbixkDkbOj9UQxXEhiFa+OjUgMHEDUQM7OQ9P9a4mDsZN0KCtcnk0ogQTZIADMP1Ott8Ih3NxxuTkJT2vIWxR9CTh8VVmqiZfJPI2szMuMtZOz4KSuuOlMRaTw4WqvQMnwBc02Zpig15U3WLA2GXgL2n1Fk1HvQgUsmYemm+Ehv7KWIi0+4CcemT13mxCYiW6qmjNL42BZPuB75CRqSqN+4czZ1zios94sNboalWowc73gfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(7416002)(16526019)(9686003)(956004)(53546011)(26005)(966005)(83380400001)(66946007)(6862004)(6666004)(186003)(2906002)(6486002)(85182001)(33716001)(66476007)(66556008)(478600001)(86362001)(54906003)(8676002)(6636002)(8936002)(6496006)(316002)(1076003)(5660300002)(4326008)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elh2dkVEUWhsMUN5N1YyZlc3WjJFZUllUnRrQ052T2puODd1S0ZrTU04WDIx?=
 =?utf-8?B?bHptNGF4K2IwcGEvVm16K2R4YmM4ZUNXMzBxNS9ONi90N1dDRy9ZSldCallU?=
 =?utf-8?B?UmNRQUNFSUowMDgyRlhwUStCd0xvTnprL0JFYTVaeEdRTWQ4SHdNU0FpTFFp?=
 =?utf-8?B?eTJId2U3ODJEVGdYUzFWYlZzN0N4K2hURWY5cTE5cngzdDZNNWNTWmZrVkMx?=
 =?utf-8?B?dEUxU0JJSVdybS9DYUY2aDlUODhwSEZLRWdneFgrcGh5RXdZR2FRaWVXbEZy?=
 =?utf-8?B?ODl1bDFVRjAvMWM0REd6Qkg1ajUrR3hrU1VVTGljR05ZTTVCZXNxMEY1d0wz?=
 =?utf-8?B?bkwyYXRlaEZzT0dBeGRqbWZ4WnVOdjV6RFFGWDlod01FeTlHdG52bWZVem5o?=
 =?utf-8?B?K243YlB4S1hnUGd1SnpudkIvajkwMUpBTk5FaUlkZm90Rm0vcTFhMUlIVmtM?=
 =?utf-8?B?dDZBdWdtSTZJZlZFR0x3d2VycE9MMmszNEVuZTl2OEVkcGRXSStpeWFPUWNV?=
 =?utf-8?B?cjBjaDU0YVliTWNRbzdJSWVFZSs3TTQzNkJoM2lRZHRJY3NrS29WNWZ2TGw1?=
 =?utf-8?B?a2JKbVpmdFo5NDJHZERpa0FBYStjZDI1NGtmZHRZNzNDLzU5YzB0NElvd0k0?=
 =?utf-8?B?MlI3Rk8xdXlldFd6aDVOZzV2ajluVHpEMGVUVEU3OXhWVE1FdDc1UG1GUURJ?=
 =?utf-8?B?YjRic05VSDB3ZHduZjUvdy9QbWdnOStaL1NaQ0ozYWg4d0NnUXJkb0dlRnR1?=
 =?utf-8?B?THpZZ0Y2V1BxNUhZbkU0aDdhcDY5alZrT3lFS0lEQUJqb0ZnandDQkhSaU5B?=
 =?utf-8?B?VTVYZjFkeDhtMGorMEd5a2lSMFFTb3hMQ2xKUkx5TXJBYk5vSEhMSW5SaFBY?=
 =?utf-8?B?dTQ4SjR1Wktad0RKZVJ3RjEvaWVsVU1zeFQvNW5oNzdBM08rWS8vaUhDNEpv?=
 =?utf-8?B?WU5DL2NlK0lzRTJZT1pkTlNNNUg3cnJhYVNCdTd3bGJ1NnMyNktyc3FFSWJ3?=
 =?utf-8?B?a3ExdzgxbENNZmNjUitTbTVHMnRUWmFTcVlnSEp4REJvRmVrVXNSaGRISnF6?=
 =?utf-8?B?K0FnTTlkYTlNWmYzZmM1YUwwNjFCdG5nNkhHcTAzSGVBUmF6dHlRcUhQVkJS?=
 =?utf-8?B?QUNtZzBnVVhuVjNkdExUZS9jQnplUDhIVkVCVFU0OHp3aGhZQ2JveXR4dzN1?=
 =?utf-8?B?bFhobUxPV1MvL3k1bGNXVDhjalg1WHdXYnY2Q2FMMHpCUWF1V2V1UXpWdk0x?=
 =?utf-8?B?OEtjb3RtT1VyQlJ2amdnMlExZnhkdlpNWE9nYnc0eXFFcnJIK0tSeU9qanVX?=
 =?utf-8?B?eWpqamsyV3dRQzlEdEYzRWRmVkVlbytYbys2RHJNN21UR2NqOE8zWS9MSnpR?=
 =?utf-8?B?S3o0ZVF1dFBIWXhGMFFOQWw2MFJkNVNhYVB5eVpyV2VpSkhzVWoyR1NZTXF3?=
 =?utf-8?B?VVdPOEFpYVNZOVM1bGVsRUljVmFya3pKRldNenpnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cef1027d-31a8-4d9b-a7e2-08d8c20c3638
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 15:08:17.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKy6jcVGb9VgpYA2dmS8fTkDZLE8EJ0KLZkY6wuGd6DJGHEJ4kpd0V5tPL72jkCTo9AX+/XbpknqfZTzOI/dCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Tue, Jan 19, 2021 at 05:23:25PM +0000, Andrew Cooper wrote:
> On 19/01/2021 15:48, Roger Pau Monné wrote:
> > On Fri, Jan 15, 2021 at 11:10:46PM +0000, Andrew Cooper wrote:
> >> From: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> >>
> >> For now, this is simply enough logic to let Xen come up after the bootloader
> >> has executed an SKINIT instruction to begin a Secure Startup.
> > Since I know very little about this, I might as well ask. Reading the
> > PM, SKINIT requires a payload, which is an image to boot. That image
> > must be <= 64KB and needs a special header.
> >
> > In case of booting Xen using SKINIT, what would be that payload?
> > (called SLB in the PM).
> 
> The SK/SLB is implemented by https://github.com/TrenchBoot/landing-zone/
> which does all the low level platform stuff.  It is the logical
> equivalent of the Intel-provided TXT ACM which is a blob as far as the
> world is concerned.
> 
> From a "system boot" perspective, the plan is something like this:
> 
> * Grub puts xen/kernel/initrd in memory
> * A final stanza line of "secure_launch" changes the exit of grub to be
> a DRTM DLE (Dynamic Launch Event).
> ** For Intel TXT, this is the SENTER instruction, provided that the
> firmware loaded the TXT ACM properly
> ** For AMD/Hygon, this is additionally loading landing-zone into memory,
> and using the SKINIT instruction.
> * TXT blob, or Landing Zone, do low level things.
> * They enter xen/Linux/other via a common protocol.
> 
> With this patch series in place, Xen's Multiboot2 entrypoint works just
> fine as far as "invoke the next thing" goes.  Linux has a
> work-in-progress extension to their zero-page protocol.
> 
> >> During a Secure Startup, the BSP operates with the GIF clear (blocks all
> >> external interrupts, even SMI/NMI), and INIT_REDIRECTION active (converts INIT
> >> IPIs to #SX exceptions, if e.g. the platform needs to scrub secrets before
> >> resetting).  To afford APs the same Secure Startup protections as the BSP, the
> >> INIT IPI must be skipped, and SIPI must be the first interrupt seen.
> >>
> >> Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"
> >>
> >> Introduce skinit_enable_intr() and call it from cpu_init(), next to the
> >> enable_nmis() which performs a related function for tboot startups.
> >>
> >> Also introduce ap_boot_method to control the sequence of actions for AP boot.
> >>
> >> Signed-off-by: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> >> Signed-off-by: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> >> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> >> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
> >> CC: Piotr Krol <piotr.krol@3mdeb.co>
> >> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
> >> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> CC: Rich Persaud <persaur@gmail.com>
> >> CC: Christopher Clark <christopher.w.clark@gmail.com>
> >> ---
> >>  xen/arch/x86/cpu/common.c        | 32 ++++++++++++++++++++++++++++++++
> >>  xen/arch/x86/smpboot.c           | 12 +++++++++++-
> >>  xen/include/asm-x86/cpufeature.h |  1 +
> >>  xen/include/asm-x86/msr-index.h  |  1 +
> >>  xen/include/asm-x86/processor.h  |  6 ++++++
> >>  5 files changed, 51 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> >> index a684519a20..d9a103e721 100644
> >> --- a/xen/arch/x86/cpu/common.c
> >> +++ b/xen/arch/x86/cpu/common.c
> >> @@ -834,6 +834,29 @@ void load_system_tables(void)
> >>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
> >>  }
> >>  
> >> +static void skinit_enable_intr(void)
> > Since this is AFAICT AMD specific code, shouldn't it better be in
> > cpu/amd.c instead of cpu/common.c?
> 
> Hygon will get sad...
> 
> It's deliberately not in AMD-specific code.

Hygon already calls into AMD specific functions in amd.c
(early_init_amd, amd_log_freq), so it wouldn't seem that weird to
place it in amd.c and share with other AMD derivatives. Likely not
worth arguing about.

> >> +{
> >> +	uint64_t val;
> >> +
> >> +	/*
> >> +	 * If the platform is performing a Secure Launch via SKINIT
> >> +	 * INIT_REDIRECTION flag will be active.
> >> +	 */
> >> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
> >> +	     !(val & VM_CR_INIT_REDIRECTION) )
> > I would add some kind of check here to assert that APs are started in
> > the correct state, ie:
> >
> > BUG_ON(ap_boot_method == AP_BOOT_SKINIT);
> 
> At the moment, it really doesn't matter.  This change is to simply let
> Xen boot.
> 
> Later changes which do the TPM and attestation work is going to need to
> know details like this, but it will be elsewhere on boot, and one
> recovery option is going to be "please just boot and let be get back
> into the system", in which case a crosscheck is not wanted.

I still think printing a message might be helpful to know the AP has
been started in an unexpected state.

> >> +
> >> +	/*
> >> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
> >> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
> >> +	 * panic due to an unknown exception.
> >> +	 */
> >> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
> >> +	asm volatile ( ".byte 0x0f,0x01,0xdc" /* STGI */ ::: "memory" );
> > We already have one of those in smv/entry.S, so I would rather not
> > open-code the opcodes here again, but I'm not unsure whether there's a
> > suitable place for those.
> 
> I deliberately didn't.  SGTI is not something we should have a helper
> for - it's not safe for general use.

Oh, I wasn't thinking of a helper, but rather a define for the
open-coded .byte directive (ie: like the one in svm/entry.S) that's
shared between both users. No big deal anyway.

Thanks, Roger.

