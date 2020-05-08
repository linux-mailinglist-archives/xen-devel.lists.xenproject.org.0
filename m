Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80961CB4E3
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 18:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX5lL-0008Co-3n; Fri, 08 May 2020 16:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ij8=6W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jX5lJ-0008Cg-Kz
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 16:22:09 +0000
X-Inumbo-ID: 0ff317b6-9148-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ff317b6-9148-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588954928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NfoLnuPCoU1UJG0a6YeuDpHB4+57UytJprgA800ZQiQ=;
 b=JNh7fgwyYUPsppK95wExAuLxILt/zxZu5R3Bn4jQLbYzu281e977NRNC
 0C9K2YaX2Crt4FnBUoUASN1gTHBUr7k7zopS84pp3B6HHqFK3qqLA0f/h
 ivqjXHiPplSmKnNCrJieXKd92MwJKrB6O3Poo5DfjrG/8p/Jw9zNsZ5Ew E=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: q1dhdRVf6RUsqoOq+0ooojt/r6aPIoQ+fjH8EdTDiThnvpi2e9GQi4724QY5Cm+42FhADY1vzU
 qD+sX2GCynFYMb+Eg+c+NLQqNYTIuTo2hG2OyhbyKf1My0vqsVhC6Eg0cZGpba1noMJCNjF9gg
 PMB7FP9eqV5/2QXW+gyR5+h+k0ItEbaryyyk+GGaxnqOYnG37lLtfDaHZsgLmQQTQ/LTIw0x6W
 M1hBocE6v5Ecip6v51ewnbOTr6sCjrg695e5THdRybolGLRX28SMNDUUINNxJ+sdjnN5FIpYa+
 Ds4=
X-SBRS: 2.7
X-MesageID: 17458741
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17458741"
Date: Fri, 8 May 2020 18:21:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
Message-ID: <20200508162155.GL1353@Air-de-Roger>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
 <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 08, 2020 at 05:04:02PM +0200, Jan Beulich wrote:
> On 08.05.2020 15:37, Roger Pau Monné wrote:
> > On Tue, May 05, 2020 at 10:16:20AM +0200, Jan Beulich wrote:
> >> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> >> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> >> @@ -11648,6 +11651,89 @@ int x86_emul_blk(
> >>  
> >>  #ifndef X86EMUL_NO_FPU
> >>  
> >> +    case blk_fld:
> >> +        ASSERT(!data);
> >> +
> >> +        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
> >> +        switch ( bytes )
> >> +        {
> >> +        case sizeof(fpstate.env):
> >> +        case sizeof(fpstate):
> >> +            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
> >> +            if ( !state->rex_prefix )
> >> +            {
> >> +                unsigned int fip = fpstate.env.mode.real.fip_lo +
> >> +                                   (fpstate.env.mode.real.fip_hi << 16);
> >> +                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
> >> +                                   (fpstate.env.mode.real.fdp_hi << 16);
> >> +                unsigned int fop = fpstate.env.mode.real.fop;
> >> +
> >> +                fpstate.env.mode.prot.fip = fip & 0xf;
> >> +                fpstate.env.mode.prot.fcs = fip >> 4;
> >> +                fpstate.env.mode.prot.fop = fop;
> >> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
> >> +                fpstate.env.mode.prot.fds = fdp >> 4;
> > 
> > I've found the layouts in the SDM vol. 1, but I haven't been able to
> > found the translation mechanism from real to protected. Could you
> > maybe add a reference here?
> 
> A reference to some piece of documentation? I don't think this
> is spelled out anywhere. It's also only one of various possible
> ways of doing the translation, but among them the most flexible
> one for possible consumers of the data (because of using the
> smallest possible offsets into the segments).

Having this written down as a comment would help, but maybe that's
just because I'm not familiar at all with all this stuff.

Again, likely a very stupid question, but I would expect:

fpstate.env.mode.prot.fip = fip;

Without the mask.

> >> +            }
> >> +
> >> +            if ( bytes == sizeof(fpstate.env) )
> >> +                ptr = NULL;
> >> +            else
> >> +                ptr += sizeof(fpstate.env);
> >> +            break;
> >> +
> >> +        case sizeof(struct x87_env16):
> >> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
> >> +        {
> >> +            const struct x87_env16 *env = ptr;
> >> +
> >> +            fpstate.env.fcw = env->fcw;
> >> +            fpstate.env.fsw = env->fsw;
> >> +            fpstate.env.ftw = env->ftw;
> >> +
> >> +            if ( state->rex_prefix )
> >> +            {
> >> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
> >> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
> >> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
> >> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
> >> +                fpstate.env.mode.prot.fop = 0; /* unknown */
> >> +            }
> >> +            else
> >> +            {
> >> +                unsigned int fip = env->mode.real.fip_lo +
> >> +                                   (env->mode.real.fip_hi << 16);
> >> +                unsigned int fdp = env->mode.real.fdp_lo +
> >> +                                   (env->mode.real.fdp_hi << 16);
> >> +                unsigned int fop = env->mode.real.fop;
> >> +
> >> +                fpstate.env.mode.prot.fip = fip & 0xf;
> >> +                fpstate.env.mode.prot.fcs = fip >> 4;
> >> +                fpstate.env.mode.prot.fop = fop;
> >> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
> >> +                fpstate.env.mode.prot.fds = fdp >> 4;
> > 
> > This looks mostly the same as the translation done above, so maybe
> > could be abstracted anyway in a macro to avoid the code repetition?
> > (ie: fpstate_real_to_prot(src, dst) or some such).
> 
> Just the 5 assignments could be put in an inline function, but
> if we also wanted to abstract away the declarations with their
> initializers, it would need to be a macro because of the
> different types of fpstate.env and *env. While I'd generally
> prefer inline functions, the macro would have the benefit that
> it could be #define-d / #undef-d right inside this case block.
> Thoughts? 

I think a macro would be fine IMO.

Thanks, Roger.

