Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BD315228
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 15:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83272.154522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UQi-0003oH-Br; Tue, 09 Feb 2021 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83272.154522; Tue, 09 Feb 2021 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UQi-0003ns-86; Tue, 09 Feb 2021 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 83272;
 Tue, 09 Feb 2021 14:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2YR=HL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l9UQg-0003nn-UK
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 14:55:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34175c16-f3a9-4fed-a6a7-7f78a64a2842;
 Tue, 09 Feb 2021 14:55:49 +0000 (UTC)
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
X-Inumbo-ID: 34175c16-f3a9-4fed-a6a7-7f78a64a2842
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612882549;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uHKlxmGDmcHVXNMhGVVfjDokHAmUUsD2nu9sDHYd6B0=;
  b=TFCwuoO5pcavyt4nXK76pCiJTCrDijr5hMqWOY+CFLwc1fwG78KGT+k9
   kCa95IwBmoPIS86iaH8nkv9iEGZfXxakUgTomRi0W8QBUlxVEcume5/0m
   oiYtyqe1L+s7heAXhDWgi5pAmDZRF96jdrU8XFW8uWwFS6jvScR9I9ktO
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R35jWxZ3i64F3E1SwsZwRvpI9PkwesI5DS9p8we1HHFjzyxUAp5iODXIdz7twSOL/UUrF4o99/
 e57+LDGH1vdrGpl7n3FjU1nxEM/9+G4XP25vZDIJtkQwUcxb0k7l8xIXAVnOtCrQfHW7Kjq9DA
 YPrrjJHsb2AtJ5dQIsexJ33y0zvUswa0k1g01JhcEzzdy0a86A1cmViD/bH3Zqlbu5EAFjVixY
 hkxa7/vYKsI9ZhumhVW3OdlXTMtGgyPp77FjfHYHw50bmZ1peZQtDLskbmmeYOTt+d36Z5Mz9u
 +UQ=
X-SBRS: 5.2
X-MesageID: 36810456
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,165,1610427600"; 
   d="scan'208";a="36810456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqa4njf+W9vW9rM+j/6PUyqLXJBUEwEesY5Ls2vnaT+f+XN/R2poYDBw2XiosLTiWUY55P2W7dC8IumREh9ITE3ZXvHpNM+WTmcQa4eb+Y8EqIkNnvcwzCzr6Lq+wedeePnMZ+ucZhGL5/X5f4z4f6iWm0jmBaAkBaeahzPZwO00/5IRe5OhP19+XE/VnoD0jjXHocLysK6SRfmCYHVNAyo9ukmuaoLW9vbDgtXCDsJUhd4YFda6eSABmrNWEmfWy+QlDfdvVxNa/wvUuUCgi9tNymbPFxCnQoxKx6A7xbmbPnrUtPUpNufGZBQOA+/dCWwJG6YP/zsP5axHFeOGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPRC+A+QhgxlTfMwM00h5x2y0xe4I6v/fBLyo6DRhrQ=;
 b=HxoObebu0f/NNWiTp9DTapgmJNJ6aPtEKOwOWNTj5ASPN1qRwD1rluYsPy6HvAIw+XgLEF2ju1rXoZiR7p/OJN17NkwCZIVqVbzF17paTiexDIZBhRu1fwAxxnGY64DP7svzHbUAhYeFH6zyEJdtt9ns5by8Al9afRjcF6gPAIPBdLpyLgz1LZq5jfQ+2RgUCoQH0fzeCviJfzoIGQz4oA3ht+3EJOC5MFMclBv9kt2LF0hCVBKr0/qFnUvNsGjcPJdsheME/jSH7XQ5wDpt4fTy3PU01uu1Z6Aa8AfcbuvPsx+Z6flS8fsk/GLEIB23LuDMMxYK3UcbzwKj2zrY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPRC+A+QhgxlTfMwM00h5x2y0xe4I6v/fBLyo6DRhrQ=;
 b=NXkSNfV5vo5MAcFidelxgks/DiqJLeNs3EPWv6TEWgdiqQk06EyZkTC38PnV002TFYNCC2DJa0qvcnSJB76lMVVfhsCC02bInSKafrqGJzhTONajQj/xfFksq6Uj1r+26SJ9pDrb8GDSmk5ZW2qmqzP0Ak5S48PetwHmI2DEUL8=
Date: Tue, 9 Feb 2021 15:55:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
Message-ID: <YCKibN0mjROss4M4@Air-de-Roger>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
X-ClientProxiedBy: MR2P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::16)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95239af7-2a32-45e7-3992-08d8cd0ac742
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4602E295077716F208BC77868F8E9@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXHPQfSbBOhVNjPctpj3YvObk1D1WIJN2kewkMGKG7oe8r3GHybqzZHqCDSscSg7yEc2n9wsaxT4oVou0XEej3hwDupjFASs2cHsVHTsh5BrzUnuf/F/8D7u+JOPIK9qi0d5SyG5Rh0hIV61D1cZ2qMxx0QND8yJEfAABQyiQcBK1yxVakeRL42/3ec9YipoLOxSy9t95phnJR8OCUcR+5+VcUMLBFNShfH0fpGoVCjBcNpC4C5Q47Z0dsLIO8pPkNuB/MWb+Zipc2c7THKueKSBFUI9usZ+kOUtuTk7R+ga6kyH1aM1jibN6Y3aQDUDfTikU1IJwoafZuRItyY35JMiyk3NJgzF8mlbYUpL3IK2KFJj0HxUcVaBKCPHtQoTrC7c9K0mLtx/SFX7Sl+gq9J6zeVH62fjQiPJ9+0V5OS/OYjxRRH16VZi7YWM+KQMYu9b2SK8O31AhUbUe97kL+3RxMWKoXeYnlDgNXU5JhqwJgy2cU1pnblicytRecQuSwCZ529Gz/h55dBfWL5sYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(376002)(136003)(39860400002)(346002)(5660300002)(6496006)(2906002)(54906003)(478600001)(33716001)(66476007)(66556008)(66946007)(85182001)(8936002)(26005)(6666004)(6916009)(86362001)(956004)(16526019)(186003)(4326008)(107886003)(9686003)(6486002)(316002)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VE5zTmlub2srcFBIWHdzcnZ5aGNFb0NTMWpXc1U5WDFRMDJvdUpWTGtjSDU3?=
 =?utf-8?B?QkVJMFg0NitvN3o0MW0yWlZZMFFIakdFTEFzM2JQa1g3Y1BkVDZuSEQvMmtn?=
 =?utf-8?B?RTFMT0hrVFdYNEs3d1VCUTJ6TmNoeDltUmpYdTZnR0tEMytTN1dtcHRMcUhL?=
 =?utf-8?B?OXVlMlcreHhBdThVVjZJREo3a0JqSHNzdmxRRTRHYnIvTk05UzZjeVp5RkEw?=
 =?utf-8?B?TlVISVBIODR5SnJ0V01NQ21pWU5LeW1JbTl1TlBZZHlmblR5c0FLWnF5dUE5?=
 =?utf-8?B?SUp4NmRnbDJiUUNCK3c0WE00U1RMNGd2R1NVdlZxMVg0RmNaUDcxcS91eVpu?=
 =?utf-8?B?NzRMKzE1TzFmeEVubXRSYndaQmErM0I4Q09oUUcrUFFyVSs1NWV5ejdzc2p6?=
 =?utf-8?B?NnJXQWhxQ2l4c2hVNVpHTFQ5WlRGYzNyWTJuTW9CQjZwUmN6Wjh3bFVwVWZj?=
 =?utf-8?B?QnNHM1lRczQvR1Zmb2t4WSt5YUVVTDV4WlRxdEwvcTNSTVpaa1hHVjd6VDR4?=
 =?utf-8?B?bzdzbGcxQlZabjhPWXpyR0czaXcwQXB4MFVEdjBLQzNTLzFSdUhLd1MwZUor?=
 =?utf-8?B?bm9OUCtmQWtsOWI2bHl6cXlEMVZmQlB5OStvTlZIRWprbHJmajNxZDJscVdX?=
 =?utf-8?B?Nmlsek1BU1hPNGoyTWZBVGJCNmpRN1NVVG5sSzdhN3A1Y09MSFBESkwzVEM5?=
 =?utf-8?B?U0xVM1JHbEVZem8reTgxOGMxQjZETE5DaG96YlhxbW9ZZHFnUy9CYTlHNGdv?=
 =?utf-8?B?bVZaSkR2Y2Fxb1RkbjNGN2QvRlFpYWZSb3FBWGVBbUtObU9veGJmd2VZa1F4?=
 =?utf-8?B?dHlKdjkxemxHTzVQQXoxaE5sSFhPSXJmUlVobWN2a2VTUzY4eE1uVzhBT1d1?=
 =?utf-8?B?NTRQTU0yU3AvWnk1OEpuOWJWK0I4V1g3Vm1yRWkyaC9nYVEwMkJCU25hR2Js?=
 =?utf-8?B?N1daRmsrN2QxSFFXQUQxZGFuRk1hRk1rTUZUaStRZ3RNZ1JQK2RWVEt5Yi9h?=
 =?utf-8?B?WjlQZEVzdjliVEdENFVpdWg4akhyMUsvVGpPZFhpNlBDMTNwOUdyRzIrSjVr?=
 =?utf-8?B?ZTMzTnN1N2poWEtuOG9aa0RrTS9LV2JuK2xlZ3l6Vm85N01GTlU1ZHVkWklo?=
 =?utf-8?B?cmszQ1FQTXJ3OUdEQk9TQ1kydE5CSHRZWmxPQzRIT3gvYnRvRG9SUzFEaGJJ?=
 =?utf-8?B?S0JXUmNZYXFheFpDU3NrYlQ1MzlVY2M3eTk5czJqY3VoVFlXM0lLQnNib1Jp?=
 =?utf-8?B?K3ZKbHlBSkppamFEV2dJMmFvYTErOVZRWjV6QlQvYTc5Q0ZKLytTell3ay81?=
 =?utf-8?B?alk4Yy9KMWxRN2o4TzBXNlNtS1BiYllWRHVEb3BUWGtZNi9rbXBiMm1VREtD?=
 =?utf-8?B?N3VOQVFWU28yMDUvVkV5OU9nRHc0eDVQaCtMZE1vdCsvK0VTT2M1NmFoa2Jz?=
 =?utf-8?B?QTE1NUVLbzk5ZlpqVXY5ZG0xdU90WGFkdWZYeTFwSFNLR0lwWHdaQ3ZsSW9R?=
 =?utf-8?B?M3A5NFJkcXRJTmw1dGoyMFUwT2VoWWdPcnlTLy9GTVRZTUdNY2VoOGRRcXZl?=
 =?utf-8?B?Smw4anVRWmw4N0dJWWJSY1gycS9UTEEvSEJSRm9LUUx2bU1TYjExenFwZkVh?=
 =?utf-8?B?aVJNMXZIZEc2S3lCdXF6bTlUb1Q2L2p0K3JLTHJ3YkhwN0JZVFpPUHhjVjk3?=
 =?utf-8?B?Vmg3QTNPa1NLMkFTd0JZRDRXQjFSY1VoYVlnREpvdFFBV2lmNUZqdnczaFpm?=
 =?utf-8?Q?TYSJsX9PrQkWmXnjhCkr7fSINRq0LlY80uzzsC0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95239af7-2a32-45e7-3992-08d8cd0ac742
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:55:45.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsHy6RoV2pnpIZldE+x7V6tpjDcZiUzfOOdaCYZ7ZAAuABHrdw2vmbFiodVQDGmmH7h660Qf5m2+jFqh92JawQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
> The "guest" variants are intended to work with (potentially) fully guest
> controlled addresses, while the "unsafe" variants are not. (For
> descriptor table accesses the low bits of the addresses may still be
> guest controlled, but this still won't allow speculation to "escape"
> into unwanted areas.)

Descriptor table is also in guest address space, and hence would be
fine using the _guest accessors? (even if not in guest control and
thus unsuitable as an speculation vector)

> Subsequently we will want them to have different
> behavior, so as first step identify which one is which. For now, both
> groups of constructs alias one another.
> 
> Double underscore prefixes are retained only on __{get,put}_guest(), to
> allow still distinguishing them from their "checking" counterparts once
> they also get renamed (to {get,put}_guest()).
> 
> Since for them it's almost a full re-write, move what becomes
> {get,put}_unsafe_size() into the "common" uaccess.h (x86_64/*.h should
> disappear at some point anyway).
> 
> In __copy_to_user() one of the two casts in each put_guest_size()
> invocation gets dropped. They're not needed and did break symmetry with
> __copy_from_user().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -776,9 +776,9 @@ shadow_write_entries(void *d, void *s, i
>      /* Because we mirror access rights at all levels in the shadow, an
>       * l2 (or higher) entry with the RW bit cleared will leave us with
>       * no write access through the linear map.
> -     * We detect that by writing to the shadow with __put_user() and
> +     * We detect that by writing to the shadow with put_unsafe() and
>       * using map_domain_page() to get a writeable mapping if we need to. */
> -    if ( __put_user(*dst, dst) )
> +    if ( put_unsafe(*dst, dst) )
>      {
>          perfc_incr(shadow_linear_map_failed);
>          map = map_domain_page(mfn);
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -40,7 +40,7 @@ static int read_gate_descriptor(unsigned
>           ((gate_sel >> 3) + !is_pv_32bit_vcpu(v) >=
>            (gate_sel & 4 ? v->arch.pv.ldt_ents
>                          : v->arch.pv.gdt_ents)) ||
> -         __get_user(desc, pdesc) )
> +         get_unsafe(desc, pdesc) )
>          return 0;
>  
>      *sel = (desc.a >> 16) & 0x0000fffc;
> @@ -59,7 +59,7 @@ static int read_gate_descriptor(unsigned
>      {
>          if ( (*ar & 0x1f00) != 0x0c00 ||
>               /* Limit check done above already. */
> -             __get_user(desc, pdesc + 1) ||
> +             get_unsafe(desc, pdesc + 1) ||
>               (desc.b & 0x1f00) )
>              return 0;
>  
> @@ -294,7 +294,7 @@ void pv_emulate_gate_op(struct cpu_user_
>          { \
>              --stkp; \
>              esp -= 4; \
> -            rc = __put_user(item, stkp); \
> +            rc = __put_guest(item, stkp); \
>              if ( rc ) \
>              { \
>                  pv_inject_page_fault(PFEC_write_access, \
> @@ -362,7 +362,7 @@ void pv_emulate_gate_op(struct cpu_user_
>                      unsigned int parm;
>  
>                      --ustkp;
> -                    rc = __get_user(parm, ustkp);
> +                    rc = __get_guest(parm, ustkp);
>                      if ( rc )
>                      {
>                          pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -34,13 +34,13 @@ int pv_emul_read_descriptor(unsigned int
>      if ( sel < 4 ||
>           /*
>            * Don't apply the GDT limit here, as the selector may be a Xen
> -          * provided one. __get_user() will fail (without taking further
> +          * provided one. get_unsafe() will fail (without taking further
>            * action) for ones falling in the gap between guest populated
>            * and Xen ones.
>            */
>           ((sel & 4) && (sel >> 3) >= v->arch.pv.ldt_ents) )
>          desc.b = desc.a = 0;
> -    else if ( __get_user(desc, gdt_ldt_desc_ptr(sel)) )
> +    else if ( get_unsafe(desc, gdt_ldt_desc_ptr(sel)) )
>          return 0;
>      if ( !insn_fetch )
>          desc.b &= ~_SEGMENT_L;
> --- a/xen/arch/x86/pv/iret.c
> +++ b/xen/arch/x86/pv/iret.c
> @@ -114,15 +114,15 @@ unsigned int compat_iret(void)
>      regs->rsp = (u32)regs->rsp;
>  
>      /* Restore EAX (clobbered by hypercall). */
> -    if ( unlikely(__get_user(regs->eax, (u32 *)regs->rsp)) )
> +    if ( unlikely(__get_guest(regs->eax, (u32 *)regs->rsp)) )
>      {
>          domain_crash(v->domain);
>          return 0;
>      }
>  
>      /* Restore CS and EIP. */
> -    if ( unlikely(__get_user(regs->eip, (u32 *)regs->rsp + 1)) ||
> -        unlikely(__get_user(regs->cs, (u32 *)regs->rsp + 2)) )
> +    if ( unlikely(__get_guest(regs->eip, (u32 *)regs->rsp + 1)) ||
> +        unlikely(__get_guest(regs->cs, (u32 *)regs->rsp + 2)) )
>      {
>          domain_crash(v->domain);
>          return 0;
> @@ -132,7 +132,7 @@ unsigned int compat_iret(void)
>       * Fix up and restore EFLAGS. We fix up in a local staging area
>       * to avoid firing the BUG_ON(IOPL) check in arch_get_info_guest.
>       */
> -    if ( unlikely(__get_user(eflags, (u32 *)regs->rsp + 3)) )
> +    if ( unlikely(__get_guest(eflags, (u32 *)regs->rsp + 3)) )
>      {
>          domain_crash(v->domain);
>          return 0;
> @@ -164,16 +164,16 @@ unsigned int compat_iret(void)
>          {
>              for (i = 1; i < 10; ++i)
>              {
> -                rc |= __get_user(x, (u32 *)regs->rsp + i);
> -                rc |= __put_user(x, (u32 *)(unsigned long)ksp + i);
> +                rc |= __get_guest(x, (u32 *)regs->rsp + i);
> +                rc |= __put_guest(x, (u32 *)(unsigned long)ksp + i);
>              }
>          }
>          else if ( ksp > regs->esp )
>          {
>              for ( i = 9; i > 0; --i )
>              {
> -                rc |= __get_user(x, (u32 *)regs->rsp + i);
> -                rc |= __put_user(x, (u32 *)(unsigned long)ksp + i);
> +                rc |= __get_guest(x, (u32 *)regs->rsp + i);
> +                rc |= __put_guest(x, (u32 *)(unsigned long)ksp + i);
>              }
>          }
>          if ( rc )
> @@ -189,7 +189,7 @@ unsigned int compat_iret(void)
>              eflags &= ~X86_EFLAGS_IF;
>          regs->eflags &= ~(X86_EFLAGS_VM|X86_EFLAGS_RF|
>                            X86_EFLAGS_NT|X86_EFLAGS_TF);
> -        if ( unlikely(__put_user(0, (u32 *)regs->rsp)) )
> +        if ( unlikely(__put_guest(0, (u32 *)regs->rsp)) )
>          {
>              domain_crash(v->domain);
>              return 0;
> @@ -205,8 +205,8 @@ unsigned int compat_iret(void)
>      else if ( ring_1(regs) )
>          regs->esp += 16;
>      /* Return to ring 2/3: restore ESP and SS. */
> -    else if ( __get_user(regs->ss, (u32 *)regs->rsp + 5) ||
> -              __get_user(regs->esp, (u32 *)regs->rsp + 4) )
> +    else if ( __get_guest(regs->ss, (u32 *)regs->rsp + 5) ||
> +              __get_guest(regs->esp, (u32 *)regs->rsp + 4) )
>      {
>          domain_crash(v->domain);
>          return 0;
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -274,7 +274,7 @@ static void compat_show_guest_stack(stru
>      {
>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>              break;
> -        if ( __get_user(addr, stack) )
> +        if ( get_unsafe(addr, stack) )
>          {
>              if ( i != 0 )
>                  printk("\n    ");
> @@ -343,7 +343,7 @@ static void show_guest_stack(struct vcpu
>      {
>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>              break;
> -        if ( __get_user(addr, stack) )
> +        if ( get_unsafe(addr, stack) )

Shouldn't accessing the guest stack use the _guest accessors?

Or has this address been verified by Xen and not in idrect control of
the guest, and thus can't be used for speculation purposes?

I feel like this should be using the _guest accessors anyway, as the
guest stack is an address in guest space?

Thanks, Roger.

