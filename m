Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0806C1C6CD4
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGJ4-0006Wr-Tj; Wed, 06 May 2020 09:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raAm=6U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jWGJ3-0006Wm-3e
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:25:33 +0000
X-Inumbo-ID: 8845a496-8f7b-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8845a496-8f7b-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588757132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dQyVmYvJunWuhXAX5BimlQbMM137IBIQu09YRvhqy58=;
 b=gcGmcEGmxl5XnmHymUv6kVB07MmLboP+1X9aEsKRBK0Dd86w1V8KL9v9
 6zn+UqWOUVzmuhBEehooQcNCv2mhEYk9jffWj51mVHuO3dZxK4qOFP3uT
 D2CGyTLA+YXuQ5JxXy7GEyx68m2NcO8iW5RaII1HYmhJTHKaDh+AgxBDg 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: mvkOgejXicwkBN7nAPfD0KYWN0poT2pIUaQng7/ayDN1kKVP+e7EEQqReumjReQpDFJBxPfBph
 8+FCNgF/qtN9kod04ziIswIL2Ee+HAvVsn66n0/EMgn5PmF9hjdRyLmU0MmBniO/irJGilbrrq
 9i7oLYKeNAPi3vfb4CwaIEXvn4xFIkWR6tiKVB2bq/nD+meQc1yfvsQULoeKeBRxlB7gQWkcac
 k7wExiY0TzfMtD24qQCpOAo3phzz6BnKgoUQM8Z+FMpDgQ7qeER82eN4827EcnEmas8DW6pDAI
 cpo=
X-SBRS: 2.7
X-MesageID: 17235407
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,358,1583211600"; d="scan'208";a="17235407"
Date: Wed, 6 May 2020 11:25:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Clean up vmcbcleanbits_t handling
Message-ID: <20200506092521.GF1353@Air-de-Roger>
References: <20200505173250.5916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505173250.5916-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 06:32:50PM +0100, Andrew Cooper wrote:
> Rework the vmcbcleanbits_t definitons to use bool, drop 'fields' from the
> namespace, position the comments in an unambiguous position, and include the
> bit position.
> 
> In svm_vmexit_handler(), don't bother conditionally writing ~0 or 0 based on
> hardware support.  The field was entirely unused and ignored on older
> hardware (and we're already setting reserved cleanbits anyway).
> 
> In nsvm_vmcb_prepare4vmrun(), simplify the logic massivly by dropping the
                                                        ^e
> vcleanbit_set() macro using a vmcbcleanbits_t local variable which only gets
> filled in the case that clean bits were valid previously.  Fix up the style on
> impacted lines.
> 
> No practical change in behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 5950e4d52b..aeebeaf873 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -345,7 +345,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>      else
>          vmcb->event_inj.raw = 0;
>  
> -    vmcb->cleanbits.bytes = 0;
> +    vmcb->cleanbits.raw = 0;
>      paging_update_paging_modes(v);
>  
>      return 0;
> @@ -693,12 +693,12 @@ static void svm_set_segment_register(struct vcpu *v, enum x86_segment seg,
>      case x86_seg_ds:
>      case x86_seg_es:
>      case x86_seg_ss: /* cpl */
> -        vmcb->cleanbits.fields.seg = 0;
> +        vmcb->cleanbits.seg = 0;
>          break;
>  
>      case x86_seg_gdtr:
>      case x86_seg_idtr:
> -        vmcb->cleanbits.fields.dt = 0;
> +        vmcb->cleanbits.dt = 0;

Nit: using false here (and above) would be better, since the fields
are now booleans.

Thanks, Roger.

