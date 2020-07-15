Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C9B220766
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvcsS-00059a-L5; Wed, 15 Jul 2020 08:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvcsQ-00059V-Vt
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:34:55 +0000
X-Inumbo-ID: 0d0e30c2-c676-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d0e30c2-c676-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594802093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m1zYlnWCGeigBRLopOjVVCPrIjQTIp4NpqO1z7cdwF4=;
 b=c3vSpRcrchH2MGhfiZvcH1S4LCkmxE+Qbx9C2m6wBm8O7tsHgSgwf0ND
 PqqL1rLTujN1lDWNTi7kn/k5gYbHd9PKjl6i7Pde6lbyxwwHClnrQbBAL
 FfdyEqCv5RXcQxplegZzobFLImJYHHk5QWhELHGK8/ZVN/Oaeh1VwOON6 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gpXS6aAanqMBJpS65vS253WVzDpztu8kXwN+gYoGnX3JitLB9lQLZIAmPz9YOoJl+lLComVGv+
 M3xnMFQ02IPwTh0t0mTFCQ1WyMTahyxo3RRaLc65CzY2oSxsA5Pua4Mk4yfqB4+HQgSm9Qx0Gx
 kZo6sK/nfXiEIo4bocXLeI0xhV5s2Yx5CcwJceYJVJ3PyvEDhwGNk62muZfiJ4v2qQvfbeOisG
 hYRFWZ1WKOHo+kA8OsJ0LbmMwEwomlsBUfu1TmG7roxGHND7eOH6Aocxz/JtsuVoMIbZe/dMiq
 6bE=
X-SBRS: 2.7
X-MesageID: 23256205
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="23256205"
Date: Wed, 15 Jul 2020 10:34:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 5/7] x86: generalize padding field handling
Message-ID: <20200715083441.GR7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <83274416-2812-53c9-f8cb-23ebdf73782e@suse.com>
 <20200714142948.GK7191@Air-de-Roger>
 <a319e308-9cf3-52dc-1883-fe749e3c5629@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a319e308-9cf3-52dc-1883-fe749e3c5629@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 08:36:10AM +0200, Jan Beulich wrote:
> On 14.07.2020 16:29, Roger Pau Monné wrote:
> > On Wed, Jul 01, 2020 at 12:27:37PM +0200, Jan Beulich wrote:
> >> The original intention was to ignore padding fields, but the pattern
> >> matched only ones whose names started with an underscore. Also match
> >> fields whose names are in line with the C spec by not having a leading
> >> underscore. (Note that the leading ^ in the sed regexps was pointless
> >> and hence get dropped.)
> >>
> >> This requires adjusting some vNUMA macros, to avoid triggering
> >> "enumeration value ... not handled in switch" warnings, which - due to
> >> -Werror - would cause the build to fail. (I have to admit that I find
> >> these padding fields odd, when translation of the containing structure
> >> is needed anyway.)
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> While for translation macros skipping padding fields pretty surely is a
> >> reasonable thing to do, we may want to consider not ignoring them when
> >> generating checking macros.
> 
> (note this remark, towards your question at the end)
> 
> >> --- a/xen/common/compat/memory.c
> >> +++ b/xen/common/compat/memory.c
> >> @@ -354,10 +354,13 @@ int compat_memory_op(unsigned int cmd, X
> >>                  return -EFAULT;
> >>  
> >>  #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
> >> +            case XLAT_vnuma_topology_info_vdistance_pad:                \
> >>              guest_from_compat_handle((_d_)->vdistance.h, (_s_)->vdistance.h)
> >>  #define XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_)		\
> >> +            case XLAT_vnuma_topology_info_vcpu_to_vnode_pad:            \
> >>              guest_from_compat_handle((_d_)->vcpu_to_vnode.h, (_s_)->vcpu_to_vnode.h)
> >>  #define XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_)		\
> >> +            case XLAT_vnuma_topology_info_vmemrange_pad:                \
> >>              guest_from_compat_handle((_d_)->vmemrange.h, (_s_)->vmemrange.h)
> > 
> > I find this quite ugly, would it be better to just handle them with a
> > default case in the XLAT_ macros?
> 
> Default cases explicitly do not get added to be able to spot missing
> case labels, as most compilers will warn about such when the controlling
> expression is of enum type.

As you say on the comment above, ignoring those for translation
macros would be better, and would avoid the ugliness of having to add
the _pad cases here.

> > AFAICT it will also set (_d_)->vmemrange.h twice?
> 
> I'm not seeing it (and if it was, I'd then also wonder why not for the
> other two handles above). This is the generated macro:
> 
> #define XLAT_vnuma_topology_info(_d_, _s_) do { \
>     (_d_)->domid = (_s_)->domid; \
>     (_d_)->nr_vnodes = (_s_)->nr_vnodes; \
>     (_d_)->nr_vcpus = (_s_)->nr_vcpus; \
>     (_d_)->nr_vmemranges = (_s_)->nr_vmemranges; \
>     switch (vdistance) { \
>     case XLAT_vnuma_topology_info_vdistance_h: \
>         XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_); \
>         break; \
>     } \
>     switch (vcpu_to_vnode) { \
>     case XLAT_vnuma_topology_info_vcpu_to_vnode_h: \
>         XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_); \
>         break; \
>     } \
>     switch (vmemrange) { \
>     case XLAT_vnuma_topology_info_vmemrange_h: \
>         XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_); \
>         break; \
>     } \
> } while (0)
> 
> Am I overlooking any further aspect?

No, vdistance, vcpu_to_vnode and vmemrange are set by the caller, so
the enums will never have the _pad value, and hence the assignation
will be done only once, you are right.

Thanks, Roger.

