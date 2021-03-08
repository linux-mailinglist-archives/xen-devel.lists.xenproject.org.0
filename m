Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DAB330D20
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94838.178648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEkA-0003UK-1F; Mon, 08 Mar 2021 12:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94838.178648; Mon, 08 Mar 2021 12:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEk9-0003Tv-TV; Mon, 08 Mar 2021 12:12:13 +0000
Received: by outflank-mailman (input) for mailman id 94838;
 Mon, 08 Mar 2021 12:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJEk8-0003Tp-Ie
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:12:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25250e7b-3514-4cb6-8619-a87456815ccb;
 Mon, 08 Mar 2021 12:12:10 +0000 (UTC)
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
X-Inumbo-ID: 25250e7b-3514-4cb6-8619-a87456815ccb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615205530;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1+r3NmFRnUOvPx32orQN6Tr7MX0SJLnUpeTJ2bXhDyU=;
  b=bH68tlOlmkHWZWWtfs4GlQeYXgV5koQFTJY3Fm0vzVbHP1DhiqeC1uVO
   tijiTpE0KF/1c5hU9rzostd32vMBdF4nnJT6NAi242xEA81lq9y6wLpsc
   9j0yw7RH52dhcOm2e8oCas8GJxdhJmuJqkJ4L6JN00Yd001LgG2wLRG/6
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YGsrTk6/ewiDiJ9DFKPlh3Sg1xST+M/ZGGXi8yu5SUTBaRGvHZk4yA/vxWifWN7t49IitxP42n
 mt5+JcXyCiOxTKu1lChIlx+pG/UBKtyXQaJH/RPnVvqR8o8qilCVTCAO9hsg5QPgceX1Jpz9ob
 KqcORo0dWngMUmi4RJRkUC7VnHul/y67ozpRgK5nvGefO7XUKXs51bY5xhCPDhmBADgPy/OO6K
 RcqwBDnN5IPUp8l3ZVs+cyKSaaSkNLg/YNNuTyY/d8P4RpeIbmRJemY/xr8pwkhpNJ5tHMooAi
 XeY=
X-SBRS: 5.2
X-MesageID: 38943348
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38943348"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK5ZANy62KuvDIHOVQ8azEL051IBIekthbu4pmuGSmYe1x/Rn6nm5ckxpkLz+Bt8gKp5lV73Y1WBi9t+A7/nHDL5inXUzzjUAYDWOe7oYr8mPmgGjSOEY+KDnwbxinM5/wM5sKjBNzvmNZOvt8AXctOzNr8HLYq2atERjaSN7fenOITT34Z18kf0uM3PXyNZ8XfCZNPZg13BIyw02aym4ZJwMumlILm2HX8JVYRXt/m9sRPBFux+U2TIeER51hiuSfRu7Itp225/Lqrm/3s8Otl56SvmjlarkZw+DWKke77gjd8urRson+/kdh9N2/nB0R+925BkFY6AidGujXOnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez0HUnktigCDQNibsVl6hn7fBtBNUbK8UenV0QrkbLU=;
 b=Bh6b3U7AtAjWCoRyNcxpUcopYSnGFdDE0hW10eqLrBh8Yg7HtRBJAyBESk80D8EO95bbqwONQv8gJ+5cwB9RVc5k8X2c3KJDs//V8iw67JnDsiq37aYw9BliJu5q1TmhN6aPD4669cmc9P84zaCs2/DvYAdu5pjhWSN2Woo3jnWMkpk3MfJVtX95fJNyeGXh4VT5GyRbgRrPSXT+NIBzE/eyRwUBozUyrc3l16NDYj2P3OY/O0fwoGMTS/6GyYNYzJwT1S/7kZWAe+XezPISEaojxwqdSiKfXEoW/4JKlDdCSH+cZLF+dzZmX3E2aYVeajcD7dR9mAUk7WkflAwWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez0HUnktigCDQNibsVl6hn7fBtBNUbK8UenV0QrkbLU=;
 b=cJgsxNxq9przXYA29yF77s333r/y7TMWxe5mg8X8cg3uSkHnESa10xbf/IjKI7bV+hj1GKkXeS5Ro2vOEDJdxgqgJl1sIDb46s6yoQ1w4Yn9aTsVMzVoinX22YcbL9ILdCj1J31QkGrdYz8oWMKCOjZADVdkF+78JVcApgsrK/k=
Date: Mon, 8 Mar 2021 13:11:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <YEYUbGw5J1VMnuxd@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdf81596-a278-47b6-75dc-08d8e22b4ed3
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB517834F7CC35C02A798685B28F939@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQn0Eor/e/SMiPlMJFZyAwmoyMWMpCOpAvFuX3wsLmrOoNZyyH+pztbIgGLqskXp5ItO7Aw9ty3lBv5hpdtoFjxBHJTURVR8qF8FyL+wIA/XtCcR9P42txPMY82sHjm0B19noBRLl0yXMiMa5jhWW7rC0X3PtMFasdIKi22IFywN4PhzDqabEXoxEvp6iEuj/RwfKAFlQ+G1BeHPuPc/U+LtGvLOcTaTK62N/qNV9GNfH/b/mqK/OoE9bbpp3YTY7I0+UrxSr2SI2PMfLnRhr2s5CUlQV6BtG18Jf68/BBvdOIkmH4hB9Lg/A2gHp0AQFHDaLEc4n7sQ6pJWcEe07fR1ncP1BPTDuNrOL24Cca2cFsgJfWrCC3YsHYi/ZphiG6m9G8CsV/ZOIVK9DsCB6MaXNbzAoJyQgw4w/Ru4RxU2daz+Dy+HXW09mD+fo4r2S6NqHxAG7NmI2XPOz6qROHLtrUkqa5fEBTzcjEAWa/MNKyilfjTCv0Yvzs++LReQb+qB/uscLr7Vxu13kUdJFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(366004)(346002)(376002)(6916009)(6496006)(4326008)(8936002)(8676002)(53546011)(66946007)(478600001)(66556008)(33716001)(83380400001)(9686003)(186003)(16526019)(85182001)(956004)(6666004)(86362001)(26005)(2906002)(316002)(54906003)(5660300002)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YkxIM3paNU5JVHlBU1BrTXExZklUMk4wUGswbWFUazMxNEZXcXRkWFNrNVNF?=
 =?utf-8?B?Mm04dWplckU3OFpURldHbEk0czFCcm5rWGc4bUp5TFY2bXQ5MkRJTEdVM004?=
 =?utf-8?B?SUZqU1VMR0UyK0xESlg5dUpMWS9LcW5tZE56VEtvU01HUHZmS2tkVlZrWCtW?=
 =?utf-8?B?bGR2VU1pT2tpOHZZMTR1UzgvU0paaW9jd0srOEh6R2I5ZTVaZHVvUnNwanJp?=
 =?utf-8?B?b3hqUXlhU3RwcXZhTEhVc05YVFBZc1BXZHFOeXlzYlcxb2RKOGF6V05tcEpa?=
 =?utf-8?B?REJFOXczcXgyc0ZjZER6R1JHbEVONDlFS2d1TWNWSkVTNk9FeTVVNi95RThy?=
 =?utf-8?B?ZHJxSTNVd3FsRFVkZmVhQ3lJOTkvL0F2VDBIck1zUEZ4aUlMa29zQUxqOVBu?=
 =?utf-8?B?OVZVSGRKanM2OUFzR1FKREZsSjREekNadzUrcVoyTjkxR3NWZmtRNXdEdDZp?=
 =?utf-8?B?dG10L1pkNHl0dzRzQ3NEeGxnOGVpNDc4TEdJdCsyUmQyWWVtalAvb0ppdWgw?=
 =?utf-8?B?dHRGL1M5ZTZXRERZREs1dWJVMzY3eWhBN1JJM2JMaFJVVnBZUFgydHArSU1v?=
 =?utf-8?B?NTk0SWsreGhUNFh0UWlNZ3JsWkFHUC9NNlJFckdnOE1SUzFaczk0d0hkZlpB?=
 =?utf-8?B?QmZWWnNDV2RwOGQydndJQVBsSGFURlVqUytidkRlOWtGTjRzd3gwVkhrOFQz?=
 =?utf-8?B?QTlvQXNUNHphMFJDR0J2Y0ZXSHovcHJTb0s3WDJudkNzZW9MUkNvMnZpaTRy?=
 =?utf-8?B?QzRCWW1YNFdKMXNIQWljQ3dBMG0rbXJiemdhR3pHY05DU1c0Mno4OEVpZWts?=
 =?utf-8?B?L0E0aTgwYjZ3S3lheGFRdnc0ZGVRdi9IZ0txNFZVMitmSkxuTjBMYnkxTG5Y?=
 =?utf-8?B?aFpvY0tKb0lDRVRpVzZFcm9BZURZeDdWVjJZcDlHOTBkRUNoVS83aUxMcHpL?=
 =?utf-8?B?SjhDcWI4TlAzZnVZekxKV1cybHlSQkhGeGg2OHFGL01kVTljeXZOUEdQVVlt?=
 =?utf-8?B?aWlEYmJ5Tzhwbll2a1J3YUJGc3IzV2JhckNmM1FURGUrWWZzSUIvSlBaTlYw?=
 =?utf-8?B?TVltRTRaalYxenp0MURLVnp0QzlMK2Rzc2pna3ZibUs5WGZtRXFOTmtDL1Nx?=
 =?utf-8?B?STZJaFNacUxoZ3l1dVpaRmtKMHphdWc1VjBzYkhNM09sWlZrdUg0YUZZN3hK?=
 =?utf-8?B?dzJBT1hlTE1OVDh0LzJNY0UxY1Fhcy9jc2Y5eEI4YmU5YjNkYkRiNldhd2pj?=
 =?utf-8?B?L1FkMDlLTGlNUDhwZzA5NVZZeUs3YmhtSU0xY3BDR09vZlh0R2dpUDNiS1BJ?=
 =?utf-8?B?RjliT29nYVhsczFpMFFFR1gvM0Q5N0JRc3YvTUk3aEJCMWM4K0h1Sm5CakNW?=
 =?utf-8?B?TFMrM1Y2a3hPRFlwZ3JtSkcra1NtTEtmeDB6VVM1aGFzVmF1cnRQOHIzUlA5?=
 =?utf-8?B?ZzhNOEc4SVluNHpOd0M5TGxla0Zrc2JiaDk5VVNlaThEaXU3ejJaQzZUQzdG?=
 =?utf-8?B?MFYxOFdrUnlaejlmbDhqTFQ4UEF3Y29TYXpOSXlLY1p0TGFPOFhKLzhGWG8v?=
 =?utf-8?B?QmhVekpSWER2WUFLTHlva1ZYL2JnMXZ0VzFyYUh5SlpDanhGS2xoSWMwN2RH?=
 =?utf-8?B?ZUZtRW5zRlFFWk10OFVKSUZjYmZ6K3RTbXZYZ1g3WEJtay9zWWtPN0ZES2hw?=
 =?utf-8?B?Y0FDU3RTNENaVmdIWUJORjVlRHhVeFJrUWZPcS9YQjFCVWlPSFpJRlFUYzFp?=
 =?utf-8?Q?bJnFA4Fu7NfWs6q/uMIU9l31pxqtsHvdnFQeLIU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf81596-a278-47b6-75dc-08d8e22b4ed3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 12:11:30.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/KwNKHdQde/0iXNTjFeOBSFAxtFqyM3achorTmSq+B3wHHuRO7tick95SS91XItDLlCR0n1Oxs6dwa+ynzzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
> On 08.03.2021 09:56, Roger Pau Monné wrote:
> > On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
> >> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> >> handler early enough to cover for example the rdmsrl_safe() of
> >> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
> >> of MSR_K7_HWCR later in the same function). The respective change
> >> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
> >> backported to 4.14, but no further - presumably since it wasn't really
> >> easy because of other dependencies.
> >>
> >> Therefore, to prevent our change in the handling of guest MSR accesses
> >> to render PV Linux 4.13 and older unusable on at least AMD systems, make
> >> the raising of #GP on this paths conditional upon the guest having
> >> installed a handler, provided of course the MSR can be read in the first
> >> place (we would have raised #GP in that case even before). Producing
> >> zero for reads isn't necessarily correct and may trip code trying to
> >> detect presence of MSRs early, but since such detection logic won't work
> >> without a #GP handler anyway, this ought to be a fair workaround.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
> >>     messages (in debug builds). Don't alter WRMSR behavior.
> >> ---
> >> I'm not convinced we can get away without also making the WRMSR path
> >> somewhat more permissive again, e.g. tolerating attempts to set bits
> >> which are already set. But of course this would require keeping in sync
> >> for which MSRs we "fake" reads, as then a kernel attempt to set a bit
> >> may also appear as an attempt to clear others (because of the zero value
> >> that we gave it for the read).
> > 
> > The above approach seems dangerous, as it could allow a guest to
> > figure out the value of the underlying MSR by probing whether values
> > trigger a #GP?
> 
> Perhaps, yes. But what do you do? There's potentially a huge value
> range to probe ...
> 
> > I think we want to do something similar to what we do on HVM in 4.14
> > and previous versions: ignore writes as long as the rdmsr to the
> > target MSR succeeds, regardless of the value.
> 
> Which, as said elsewhere, has its own downsides - writable MSRs don't
> need to also be readable. See e.g. AMD's proposed PARTIAL_{FS,GS}_LOAD
> MSRs.

Yes, but it's IMO the lesser of two evils, I think we should avoid any
kind of behavior that depends on the underlying MSR value, just to be
on the safe side.

> >> --- a/xen/arch/x86/pv/emul-priv-op.c
> >> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
> >>      struct vcpu *curr = current;
> >>      const struct domain *currd = curr->domain;
> >>      const struct cpuid_policy *cp = currd->arch.cpuid;
> >> -    bool vpmu_msr = false;
> >> +    bool vpmu_msr = false, warn = false;
> >>      int ret;
> >>  
> >>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> >> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
> >>          if ( ret == X86EMUL_EXCEPTION )
> >>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
> >>  
> >> -        return ret;
> >> +        goto done;
> >>      }
> >>  
> >>      switch ( reg )
> >> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
> >>          }
> >>          /* fall through */
> >>      default:
> >> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
> >> +        warn = true;
> >>          break;
> >>  
> >>      normal:
> >> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
> >>          return X86EMUL_OKAY;
> >>      }
> >>  
> >> -    return X86EMUL_UNHANDLEABLE;
> >> + done:
> > 
> > Won't this handling be better placed in the 'default' switch case
> > above?
> 
> No - see the "goto done" added near the top of the function.

Yes, I'm not sure of that. If guest_rdmsr returns anything different
than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
and hence we shouldn't check whether the #GP handler is set or not.

This is not the behavior of older Xen versions, so I'm unsure whether
we should introduce a policy that's even less strict than the previous
one in regard to whether a #GP is injected or not.

I know injecting a #GP when the handler is not set is not helpful for
the guest, but we should limit the workaround to kind of restoring the
previous behavior for making buggy guests happy, not expanding it
anymore.

> >> +    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
> >> +         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, *val) )
> > 
> > We didn't used to care about explicitly blocking the reserved MSR
> > range, do we really wan to do it now?
> > 
> > I'm not sure I see an issue with that, but given that we are trying to
> > bring back something similar to the previous behavior, I would avoid
> > adding new conditions.
> 
> What I'm particularly trying to avoid here is to allow
> information from an underlying hypervisor to "shine through",
> even if it's only information as to whether a certain MSR is
> readable. It should be solely our own selection which MSRs in
> this range a guest is able to (appear to) read.
> 
> Plus of course by avoiding the rdmsr_safe() in this case we
> also avoid the unnecessary (debug only) log message associated
> with such attempted reads.

OK, I think that's fine.

Thanks, Roger.

