Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B51CD37F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 10:03:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY3P1-0007wE-LU; Mon, 11 May 2020 08:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY3Oz-0007w9-UG
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 08:03:05 +0000
X-Inumbo-ID: d76dcf04-935d-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d76dcf04-935d-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589184184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQPhma5Pn61HAy8fBts1O06trrH60bgL+l04thBt9K4=;
 b=I2VySybojpQUBxYcZB++hqI2OHtbLV8LN9UgLEzEkJi567k1Z9ezra2a
 7vbpPCTO7RVgSqwM8vHiZO9Dq+Gcf1xEpSniH8gL8RAYyUn54wTy2y2Fi
 yN4V9D6WACqV03Q5Y7/mlkJ+yAcDPOfO697BniFbrdfknU1S5mUjNZrgY k=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 3N7rWcvWOgLIvGrCxE5yX0bJ/l6TnC7oAbnPLslfmYA7iVwQdmt96OuP9/4maF+eGNlmTWdhiO
 zGxvwpbhbnPVRxlnb5RPnqcpzJ6U9jnwsTLQJOtpZvIQhSeyeOH1DykpKGhErW3F7fLHDueAGQ
 Hmr/giycBIIItjpYyKXYyusB5MqqqHdQSWX3aCBuIEGuJMGCga2vcvUQsO/78OATsivr0Uv1hF
 yAZL8f24dZ6ff6AyQhoM/bRTFwVn4ckYHPH/vASRrhBZ/GON1P9k7hSLzuWftxjdqBxz46sY7F
 XA8=
X-SBRS: 2.7
X-MesageID: 17879859
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17879859"
Date: Mon, 11 May 2020 10:02:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
Message-ID: <20200511080255.GN1353@Air-de-Roger>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
 <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
 <a8342bf8-d866-b507-9420-0384545e9a4f@citrix.com>
 <dece70e0-3140-eb4a-b6c7-0bf904cb6f2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <dece70e0-3140-eb4a-b6c7-0bf904cb6f2a@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 09:25:54AM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 08.05.2020 20:29, Andrew Cooper wrote:
> > On 08/05/2020 16:04, Jan Beulich wrote:
> >>>> +            }
> >>>> +
> >>>> +            if ( bytes == sizeof(fpstate.env) )
> >>>> +                ptr = NULL;
> >>>> +            else
> >>>> +                ptr += sizeof(fpstate.env);
> >>>> +            break;
> >>>> +
> >>>> +        case sizeof(struct x87_env16):
> >>>> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
> >>>> +        {
> >>>> +            const struct x87_env16 *env = ptr;
> >>>> +
> >>>> +            fpstate.env.fcw = env->fcw;
> >>>> +            fpstate.env.fsw = env->fsw;
> >>>> +            fpstate.env.ftw = env->ftw;
> >>>> +
> >>>> +            if ( state->rex_prefix )
> >>>> +            {
> >>>> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
> >>>> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
> >>>> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
> >>>> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
> >>>> +                fpstate.env.mode.prot.fop = 0; /* unknown */
> >>>> +            }
> >>>> +            else
> >>>> +            {
> >>>> +                unsigned int fip = env->mode.real.fip_lo +
> >>>> +                                   (env->mode.real.fip_hi << 16);
> >>>> +                unsigned int fdp = env->mode.real.fdp_lo +
> >>>> +                                   (env->mode.real.fdp_hi << 16);
> >>>> +                unsigned int fop = env->mode.real.fop;
> >>>> +
> >>>> +                fpstate.env.mode.prot.fip = fip & 0xf;
> >>>> +                fpstate.env.mode.prot.fcs = fip >> 4;
> >>>> +                fpstate.env.mode.prot.fop = fop;
> >>>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
> >>>> +                fpstate.env.mode.prot.fds = fdp >> 4;
> >>> This looks mostly the same as the translation done above, so maybe
> >>> could be abstracted anyway in a macro to avoid the code repetition?
> >>> (ie: fpstate_real_to_prot(src, dst) or some such).
> >> Just the 5 assignments could be put in an inline function, but
> >> if we also wanted to abstract away the declarations with their
> >> initializers, it would need to be a macro because of the
> >> different types of fpstate.env and *env. While I'd generally
> >> prefer inline functions, the macro would have the benefit that
> >> it could be #define-d / #undef-d right inside this case block.
> >> Thoughts?
> > 
> > Code like this is large in terms of volume, but it is completely crystal
> > clear (with the requested comments in place) and easy to follow.
> > 
> > I don't see how attempting to abstract out two small portions is going
> > to be an improvement.
> 
> Okay, easier for me if I don't need to touch it. Roger, can you
> live with that?

Yes, that's fine.

Thanks.

