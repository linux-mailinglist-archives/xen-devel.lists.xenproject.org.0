Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CB1CB736
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 20:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX7l5-0001zC-Pt; Fri, 08 May 2020 18:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX7l4-0001r3-JU
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 18:30:02 +0000
X-Inumbo-ID: eda15cf6-9159-11ea-a04f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eda15cf6-9159-11ea-a04f-12813bfff9fa;
 Fri, 08 May 2020 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588962602;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2KpXGx6X5lyc4nxPmX/ONwbZuGOzOBl4nWLEcsbxJzI=;
 b=bvL3cNr6ZeUNJ5bekBwlxUrEvZ5rIbgAFVSxFEXbI6xvEiR5fCV/MDNF
 QwVK/3znIrHKZdGzZxY8EtysZAYwLiNzUp4o7CuFgK8A6vbJQGVwKw+t/
 /FyxpVt7KZUm+DsUK9C1etcun2NL5gvkIiV4GPxNqZtyN82IRg8nNW0yq g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: cUc48mnZP7MFZVEFWyAexv07RfZf63yd213EVwqW1xp8Xn0lOSTiXAu7MRXRhpbeiE6YUEzPfo
 dkAPxso0TLj/pdf0u50CNvNufwujt8LlELgCS5QoYCzvtmTzAXIXpAsJ+fwRF3KCQ4p+4qyIRh
 py3MPrmc39ftGN+GQwaLn+5jmGJpnYXQOZlkGmsr1Y0IMxLiTAc7cK4KQEG7d2S0fMmmh4GhD5
 2xypPovxHggb0t3/E8MIyGBYBOIKD/HsbIhZy9R8jUiDu3Fs9Hy9OaCp0dHYQanpX4zkykGzoR
 eVk=
X-SBRS: 2.7
X-MesageID: 17114416
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17114416"
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
 <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a8342bf8-d866-b507-9420-0384545e9a4f@citrix.com>
Date: Fri, 8 May 2020 19:29:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/05/2020 16:04, Jan Beulich wrote:
>>> +            }
>>> +
>>> +            if ( bytes == sizeof(fpstate.env) )
>>> +                ptr = NULL;
>>> +            else
>>> +                ptr += sizeof(fpstate.env);
>>> +            break;
>>> +
>>> +        case sizeof(struct x87_env16):
>>> +        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
>>> +        {
>>> +            const struct x87_env16 *env = ptr;
>>> +
>>> +            fpstate.env.fcw = env->fcw;
>>> +            fpstate.env.fsw = env->fsw;
>>> +            fpstate.env.ftw = env->ftw;
>>> +
>>> +            if ( state->rex_prefix )
>>> +            {
>>> +                fpstate.env.mode.prot.fip = env->mode.prot.fip;
>>> +                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
>>> +                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
>>> +                fpstate.env.mode.prot.fds = env->mode.prot.fds;
>>> +                fpstate.env.mode.prot.fop = 0; /* unknown */
>>> +            }
>>> +            else
>>> +            {
>>> +                unsigned int fip = env->mode.real.fip_lo +
>>> +                                   (env->mode.real.fip_hi << 16);
>>> +                unsigned int fdp = env->mode.real.fdp_lo +
>>> +                                   (env->mode.real.fdp_hi << 16);
>>> +                unsigned int fop = env->mode.real.fop;
>>> +
>>> +                fpstate.env.mode.prot.fip = fip & 0xf;
>>> +                fpstate.env.mode.prot.fcs = fip >> 4;
>>> +                fpstate.env.mode.prot.fop = fop;
>>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
>>> +                fpstate.env.mode.prot.fds = fdp >> 4;
>> This looks mostly the same as the translation done above, so maybe
>> could be abstracted anyway in a macro to avoid the code repetition?
>> (ie: fpstate_real_to_prot(src, dst) or some such).
> Just the 5 assignments could be put in an inline function, but
> if we also wanted to abstract away the declarations with their
> initializers, it would need to be a macro because of the
> different types of fpstate.env and *env. While I'd generally
> prefer inline functions, the macro would have the benefit that
> it could be #define-d / #undef-d right inside this case block.
> Thoughts?

Code like this is large in terms of volume, but it is completely crystal
clear (with the requested comments in place) and easy to follow.

I don't see how attempting to abstract out two small portions is going
to be an improvement.

~Andrew

