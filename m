Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F82E92B5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61046.107115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMKC-0004B7-AS; Mon, 04 Jan 2021 09:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61046.107115; Mon, 04 Jan 2021 09:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMKC-0004Ai-78; Mon, 04 Jan 2021 09:38:52 +0000
Received: by outflank-mailman (input) for mailman id 61046;
 Mon, 04 Jan 2021 09:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwMKA-0004Ad-Rp
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:38:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2602fde-b77e-4f10-8c5d-ba83c17349d7;
 Mon, 04 Jan 2021 09:38:49 +0000 (UTC)
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
X-Inumbo-ID: f2602fde-b77e-4f10-8c5d-ba83c17349d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609753129;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0KeTAvttzmTh93gANbnJA/pbWUybWOWxZR38XUUpWKc=;
  b=bTq51vdLL0djb6srU2K2WmiVdepisKLFGkcZmvcytOY/T0in55oTpkma
   AP1hAmniVWc60UhPOhqWmHRCPr55HzsnQmKGxGw/MPKOubzlCdwEvA4Bp
   mp6PLoYH7U9rsTXG0BaYV9U21EFPUW8u/epb0lTpCaDII4tD008S//fPY
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eXzAcKcIBC+IxJu5mR4R7tIAl8gJHvHG+kn3AR+ilPUlj5Lq+cSDbpd+thp2m7th62OOqc0BYU
 mawlLWNXrbvcqhQ62XRIsoeiiUpzPHzkjsqfC7ppKeK0gIjXXrabe1Cij6ITTTsfFneJeQOlT0
 xrUB6Z8uvSlX1buz1+QRoPi8WLePqK3lyVFtxBhVeSCc/zhS18MBrr4YB94CSU1Xf5C02LamBl
 cud6/hL71xjSA7XD7fsiKCg3homjK1aYUrcsSVlGtZstWQ+cGaqm150Ag8oYqtDESdJ7hHB2/h
 48I=
X-SBRS: 5.2
X-MesageID: 34330222
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,473,1599537600"; 
   d="scan'208";a="34330222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8ScalJcRudwK5GFDB1Y/uA12UxI0yhWUWbdugl48S4WPn0YFZa2nvhBHzeAsHvvK7h15ePWq6ol98e5HNTFX5zo2qdFuhpP39wf/5xnvhrWXvffy1j/TpcRKAoy9G8mNtgr1kOzn8owmTGSV1SubBC/MqAxzXaLz8caNMlwSLJ8NjXXJoj70SJdQQDcG/txGztko8lY3o2td4EV/M9AjaRjLA1l+TE6lO5AOIf8CGNsmQn9JEhOTzcQU66rjCan5nuZpEO3YQ7pXM53W1r215U4BcE8mEnL2FjSkMe6XZnUrYYZpF06A2dF+ueiMVP9uzp3p1JhbIKtZ1//Rl4RtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OojvyPzSE7raV1tmXAYQA/+BWV7TRMr3kTh/jFQpTA=;
 b=k+zd5MtVTWuCwXS1w2iU96oQxjHe+4jnBReWk+vNN4gFoltQ/K1IyKIhizb5sDWksujblIaXIlyYUv+gpUvSUeF8mGA9+Hj2GiI/Y3urGb5IA0+2wwCTdItT+CG0/ih5qWhJ5gsibMlwny8YdEs28g5gcHIsjlu7CYW+M3nI1aop/F+5QWw4dGJ6Gc6Bh7+Udq7+ZdFWRxiQvuLJ6DaJhDRBzjuiuV4z5FcZsOQ9E8LtGlRhMWEwY1rP/Wdvkyk0D6M+4eFLGgIQD20Qg4+nOUkIuqib2S+t8s/ntgokQ8TjNoFEtrVdKqfRgbS1pqZUlGOMatSAV0yFVHnWuDHxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OojvyPzSE7raV1tmXAYQA/+BWV7TRMr3kTh/jFQpTA=;
 b=ltJNBnOUJyCHvp528tulDvYzWr4PfLpUJoxisfUmLCI4itq3ZOiIv1yQFLX1KNCx7DrXZEyMzGJEEXe3Aof50XUFbeNVlGJZVZz9nTePCMKXm1j2verf7rBXD76TP4cUNr3+ZzDX1shR0L0UjonUY9EFk7v1s/W/7MHY3L1QW6A=
Date: Mon, 4 Jan 2021 10:38:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <famzheng@amazon.com>, <cardoe@cardoe.com>,
	<wl@xen.org>, <Bertrand.Marquis@arm.com>, <julien@xen.org>
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
Message-ID: <20210104093839.2tjtxyjhu4e6okra@Air-de-Roger>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
 <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
 <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040e8ac8-4334-4040-b084-08d8b094876b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4139:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4139DB31F10F1C181CDCC1C98FD20@DM6PR03MB4139.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0+nB6la7PNEV0D3fVkOV4JaSGu5X9R92BlklOCj5H1f4PivhuV/k896NqMJdNojzsry9M/V4DJe2CWbqrDVcl3V3ZV1k6QI7hphehDxZ51Up5pugFPnPCtCfbZ0deR3K9YynT7r3i+hguggdfOTWbKrCpQfSkgDZ3i8ibV0TpoL2zYx7COaHjQJtkYSO9hy/iHxn4S0mwr6pIDxMPkGqW09wIs9knsYbnsB7qoLhmdBcRq7dnOPDqJc0j22lJya0J3A7RAbFJd7NH26oB2Imi0o5Ldftj1RRrK4EruyDvsPH6QkUS68ZdoenS9lnZemhZa3ITtwa5GlNgdjuR2P+zbK1nwYKMzbG9pDmok8J64h2Fyy0fZ3ocAjfBSJNdwPAY1LiET+9A9Ulz3oIz3xDjb/jei+q7w3BhgWeq6urAAmhksJuwaVytmgtlJW1HJPF8xVRNjc9sU+Vaap5+dGuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(136003)(376002)(366004)(39850400004)(6496006)(4001150100001)(316002)(1076003)(85182001)(956004)(6486002)(86362001)(53546011)(83380400001)(9686003)(8936002)(4326008)(26005)(186003)(66946007)(16526019)(2906002)(6916009)(66476007)(66556008)(8676002)(5660300002)(966005)(478600001)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZkhWQzFiZTlWeHBZOXFBdXF4Q0Q1Qzl4aEtQbXdKc1NiRWxycDR0WXh6R1Fj?=
 =?utf-8?B?dU9zcjlaR1Boem0rcEVTRWNLQmxXeXdzWHJ2Rzh4YXE5YWpNZDBFbGJWeFVG?=
 =?utf-8?B?dUwvNkRLckV1ZWNpeStzUFBpeGRzanRjL0FWdFJwMDNXb29rTkxtZ3FwREsy?=
 =?utf-8?B?c05xVDUwdjFUeVJ2UWRQWHRpeXozbnFIYUJ4cEhKMElKVTU4clJ2dFJYclRB?=
 =?utf-8?B?TUcyT3ZkaUtBZHpjNTZIUWpiT3hydmZRK1BlV2pJb2Rqb0x0NWxNZHk3b0pF?=
 =?utf-8?B?R1VBSHlQemlqbE1RaXloMFlaSHNJYkdGaGloa05qdUVVaGNkb0JJejhFYW1u?=
 =?utf-8?B?b3I5aTFBZ0VLaEVPNmFCZ3VOMVRYUlV2Z25zRFZkS0J6N0w4ekpXNWJCSS9R?=
 =?utf-8?B?V3BJbDlUa2gvWGpOV1Q4KzdNbmJHSGtPV3ZTSGJCN1BKQTgzTS9YQTY1ZjZU?=
 =?utf-8?B?Vlo5UVdJT3kvVnVac0pRNEVwL25DcUQrK3B0S0xxU0c0cmZ1RU5NQzRyaUNx?=
 =?utf-8?B?RnZtdlB5RGtKd3poWk1KL3J4UndoeDQ3ekg1TmUyMHZkcmFPenBtUG8wdEhO?=
 =?utf-8?B?STFJV0RwYm9uR0NhSXhjNGJ6b3FKbUtwbzZ2YmNKTWczciswNGozaFVjcE4y?=
 =?utf-8?B?bTgyNU0veTNMbEFuU1RrUGJRcFhMdE5FUWJTUXVuTlp1ZzZzcllhbmhhRGtD?=
 =?utf-8?B?QkNhemNHOHZVS3ozQ3ZWQjFYa0hkMVZHWGo4c1VoV3JndkYxUXk2RktxSUhJ?=
 =?utf-8?B?SjV3Zjc2QTczeGxzaHhpTGVlaHNWZHNPMGdiVFpNdWpzMUtRbUdoYnh2WWdO?=
 =?utf-8?B?bGlZZDMzV0NORmc5TEtEeFNSZkxvKzkxQlh6aVpaaUxxTXoxTktQMmhEVTZh?=
 =?utf-8?B?clE4MDVhNnJGYVNWc0p1RWtydC9CVllEeTdVOENCMlFrMm1XVHlGTjNiSUl5?=
 =?utf-8?B?Z0wrQkN1YVRRcVZGRXgzdEszVW9Eb2Q2KzRKOG1LckIxZVNWWkNISGpMOVlK?=
 =?utf-8?B?UE1ublJaRTA3QWo0Nk51Z3RyYjcrVU92aWV4eVdBbXkzaSt0clpGd1oxZHpv?=
 =?utf-8?B?NDcyVEMwYUZlZTlrb0E1ZDd1MEQrTDVGaG1peE9CR1VFZUJlR3hKY2Q5dnZ6?=
 =?utf-8?B?aGlJdy9LTTN0THBYK3QvOFdFdTdEWGltbHhmejBzRFphQVdxME5CdUhkNnl2?=
 =?utf-8?B?Z3BjWURJdVc4cUdqcWpNdnd6eGtJZWV1WW52NlFkVDV3UUY0Z011S1g5N0VV?=
 =?utf-8?B?UzVCTmF5L1NoTGVvZXlpbmh2Skp2YkZXbklLRHhTL0xoNDlIdEZzOVE2WWND?=
 =?utf-8?Q?w8KvvMB8KSirLasrFrRdwdCrvJ2iuecgAi?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 09:38:44.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 040e8ac8-4334-4040-b084-08d8b094876b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 686eLc6J0qMlx7BQnewdvGuLMkg1R6VpeOuEspV5IrM+VFOM7MS+CzuG3LumvVGPIMOQb0+Wy/7VCd6MMkByog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4139
X-OriginatorOrg: citrix.com

On Wed, Dec 23, 2020 at 12:10:43PM -0800, Stefano Stabellini wrote:
> On Wed, 23 Dec 2020, Andrew Cooper wrote:
> > On 23/12/2020 19:45, Stefano Stabellini wrote:
> > > On Wed, 23 Dec 2020, no-reply@patchew.org wrote:
> > >> Hi,
> > >>
> > >> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> > >>
> > >> You can find the link to the pipeline near the end of the report below:
> > >>
> > >> Type: series
> > >> Message-id: 20201223163442.8840-1-andrew.cooper3@citrix.com
> > >> Subject: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
> > >>
> > >> === TEST SCRIPT BEGIN ===
> > >> #!/bin/bash
> > >> sleep 10
> > >> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> > >> === TEST SCRIPT END ===
> > > [...]
> > >
> > >> === OUTPUT BEGIN ===
> > >> [2020-12-23 16:38:43] Looking up pipeline...
> > >> [2020-12-23 16:38:43] Found pipeline 233889763:
> > >>
> > >> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763
> > > This seems to be a genuine failure. Looking at the alpine-3.12-gcc-arm64
> > > build test, the build error is appended below. This is a link to the
> > > failed job: https://gitlab.com/xen-project/patchew/xen/-/jobs/929842628
> > >
> > >
> > >
> > > gcc  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .xen-diag.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include /builds/xen-project/patchew/xen/tools/misc/../../tools/config.h -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -D__XEN_TOOLS__ -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -Wno-declaration-after-statement  -c -o xen-diag.o xen-diag.c 
> > > xen-fault-ttl.c: In function 'main':
> > > xen-fault-ttl.c:25:14: error: 'struct xen_arch_domainconfig' has no member named 'emulation_flags'
> > >    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
> > >       |              ^~~~~~~~~~~~~~~
> > > xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared (first use in this function)
> > >    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
> > >       |                                ^~~~~~~~~~~~~~~~~
> > > xen-fault-ttl.c:25:32: note: each undeclared identifier is reported only once for each function it appears in
> > > make[4]: *** [/builds/xen-project/patchew/xen/tools/misc/../../tools/Rules.mk:144: xen-fault-ttl.o] Error 1
> > > make[4]: *** Waiting for unfinished jobs....
> > > make[4]: Leaving directory '/builds/xen-project/patchew/xen/tools/misc'
> > > make[3]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:160: subdir-install-misc] Error 2
> > > make[3]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > > make[2]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:155: subdirs-install] Error 2
> > > make[2]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > > make[1]: *** [Makefile:67: install] Error 2
> > > make[1]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > > make: *** [Makefile:134: install-tools] Error 2
> > 
> > Yeah - that is a real failure, which can be fixed with a little bit of
> > ifdef-ary.  I'm confused as to why I didn't get that email directly.
> 
> It looks like patchew doesn't yet CC the original author?

Where do patchew emails go? I haven't seen any of them, and they don't
seem to go to xen-devel.

Thanks, Roger.

