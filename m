Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7301A8077
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:54:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMwg-0000sq-Rz; Tue, 14 Apr 2020 14:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOMwf-0000sk-Q4
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:53:49 +0000
X-Inumbo-ID: bf561074-7e5f-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf561074-7e5f-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586876028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sTub6VTB/XEgX6VrGLxOBloLRI+lMtnGI+fi6SJXIrI=;
 b=MvCav3XpgvASm33vvLyQNk/+0oFa0JPb2tRMgjggTtH90lk34S1OJpVF
 cxBRSS4IEzAkWPUSnJr5nuoF/HeWqn4WMJrsmB1M/eqwEy/89vi8jkWGd
 I367S18vPLwaaU3nRB3lw8dUtLkGQws8mnUEinQBttBAJAWXW6dv0tCk6 Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zu4kdScKfphFiEH8DNIt0usNvQEQRCriKbL5NKKwrQfmv/X3XgugpdJnCNe8vH9v+tY6GiuxTW
 itkPoX+R5sX/w4RnkAGSqHxrY5nOwE9koGXexzZ6xwrcvoE4irPJYbFNsMj7toKSRCVuoqwWhX
 jG/XR6FC60jJRyuTkZcQ/MQ/DOMMcgD3ePDagHkh8cywzqat3aZuBrf+Fj0RcTrg8dFwJB8HG3
 fu+sY9q1CCJKeZ49jbhKDgZiy22208gL06my7Jif96AesnR0gXgsc9qRnyKCRrjrIjJqFPOCP1
 pb4=
X-SBRS: 2.7
X-MesageID: 15971574
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15971574"
Date: Tue, 14 Apr 2020 16:53:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200414145337.GJ28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
> On 14.04.2020 13:19, Roger Pau Monné wrote:
> > On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
> >> On 14.04.2020 12:02, Roger Pau Monné wrote:
> >>> That seems nice, we would have to be careful however as reducing the
> >>> number of ASID/VPID flushes could uncover issues in the existing code.
> >>> I guess you mean something like:
> >>>
> >>> static inline void guest_flush_tlb_mask(const struct domain *d,
> >>>                                         const cpumask_t *mask)
> >>> {
> >>>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
> >>>                                                                 : 0) |
> >>>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> >>> 		                                      : 0));
> >>> }
> >>
> >> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
> >> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
> >> Or am I overlooking a need to do ASID flushes also in shadow mode?
> > 
> > I think so, I've used is_hvm_domain in order to cover for HVM domains
> > running in shadow mode on AMD hardware, I think those also need the
> > ASID flushes.
> 
> I'm unconvinced: The entire section "TLB Management" in the PM gives
> the impression that "ordinary" TLB flushing covers all ASIDs anyway.
> It's not stated anywhere (I could find) explicitly though.

Hm, I don't think so. XenRT found a myriad of issues with NPT when p2m
code wasn't modified to do ASID flushes instead of plain TLB flushes.
Even if it's just to stay on the safe side I would perform ASID
flushes for HVM guests with shadow running on AMD.

> >> Also I'd suggest to calculate the flags up front, to avoid calling
> >> flush_mask() in the first place in case (EPT) neither bit is set.
> >>
> >>> I think this should work, but I would rather do it in a separate
> >>> patch.
> >>
> >> Yes, just like the originally (wrongly, as you validly say) suggested
> >> full removal of them, putting this in a separate patch would indeed
> >> seem better.
> > 
> > Would you like me to resend with the requested fix to
> > paging_log_dirty_range (ie: drop the FLUSH_TLB and only call
> > flush_mask for HAP guests running on AMD) then?
> 
> Well, ideally I'd see that function also make use of the intended
> new helper function, if at all possible (and suitable).

Oh, OK. Just to make sure I understand what you are asking for, you
would like me to resend introducing the new guest_flush_tlb_mask
helper and use it in the flush_tlb_mask callers modified by this
patch?

Thanks, Roger.

