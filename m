Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F851BA687
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 16:36:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4qj-0000iQ-Au; Mon, 27 Apr 2020 14:35:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jT4qh-0000iL-Ue
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 14:35:07 +0000
X-Inumbo-ID: 4a0c3d0e-8894-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0c3d0e-8894-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587998106;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qfPwzTU8z22Y826YRtb7uFhL6caY9cIuJp0bLZ1nSDk=;
 b=D9HhxJQqrkPoDC2jqd7X0FjScfG2t9T0fkptYMb5douH4/9j1voUQPl0
 LyP3Os/caXwCi4gf1qODLTXN643wgfaB4T0gmUU19VjMhzpZQ7I6nmIFq
 PqV75m/veBZIocO26Xwnqs8fgNVADMIBT+rq3bKyUxN3RJhk9S4SXlZCx U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ssJjDd9S96dLAJP/8qOACJCYo+nL+EhG9ojo3Ow4+UPHwSA+wl+aAQ2PxlkBWLhx5bGrNjz7aG
 Yp94yMgLkt68CHfcHNhSGuTf6D/oDh+J4EPDQWrA56YiY6Ib5Bw25yPriuemIYTjj6xAHRpYVv
 0G1hD5j6CiDnW+yvyuzj8mWC/LUfkmpyPJNrzGOqqd5AtiPcvqJi7jmK+rpgMPA/7z4ymPTPvn
 MJW8F6nLDpnBaZNNOTz0Fpk+0sNCUVNHv3ld0FN1h8sE4EG2hihgbAZVBOJRhNldavAiYfh/xs
 Xtc=
X-SBRS: 2.7
X-MesageID: 16707710
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16707710"
Subject: Re: [PATCH] x86: refine guest_mode()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
Date: Mon, 27 Apr 2020 15:35:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/04/2020 09:03, Jan Beulich wrote:
> The 2nd of the assertions as well as the macro's return value have been
> assuming we're on the primary stack. While for most IST exceptions we
> eventually switch back to the main one,

"we switch to the main one when interrupting user mode".

"eventually" isn't accurate as it is before we enter C.

>  for #DF we intentionally never
> do, and hence a #DF actually triggering on a user mode insn (which then
> is still a Xen bug) would in turn trigger this assertion, rather than
> cleanly logging state.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While we could go further and also assert we're on the correct IST
> stack in an "else" ti the "if()" added, I'm not fully convinced this
> would be generally helpful. I'll be happy to adjust accordingly if
> others think differently; at such a point though I think this should
> then no longer be a macro.
>
> --- a/xen/include/asm-x86/regs.h
> +++ b/xen/include/asm-x86/regs.h
> @@ -10,9 +10,10 @@
>      /* Frame pointer must point into current CPU stack. */                    \
>      ASSERT(diff < STACK_SIZE);                                                \
>      /* If not a guest frame, it must be a hypervisor frame. */                \
> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
>      /* Return TRUE if it's a guest frame. */                                  \
> -    (diff == 0);                                                              \
> +    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \

The (diff == 0) already worried me before because it doesn't fail safe,
but this makes things more problematic.  Consider the case back when we
had __HYPERVISOR_CS32.

Guest mode is strictly "(r)->cs & 3".

Everything else is expectations about how things ought to be laid out,
but for safety in release builds, the final judgement should not depend
on the expectations evaluating true.

~Andrew

