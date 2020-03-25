Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD91925AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:34:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3JY-0003At-Q5; Wed, 25 Mar 2020 10:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH3JX-0003Ao-Cl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:31:11 +0000
X-Inumbo-ID: be4a07da-6e83-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be4a07da-6e83-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585132270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UH+y3waYbvDUtNRL+6XOc4jN70wYy1fmfYi/WrWcpVU=;
 b=B2lYhQjBt4VoTHHqPqnBmrW01G7ZLGvkrIm3akUYTwgC+dNL8qONhnic
 +AAKmNv/Cgmv9eoNOiFQvPSZzl+lpWXkjnmAsyuRMlRisLYJBCWdmv+Qu
 DK9AgnfSd7IQtsYnyYf9zd/kxxc8qDLkt4CGRKDQoht8/4EFRchEag/l8 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 7/soXoTYCk9rhcK+TZRCIPC9Sty2p97chmGgKQRVfpH541QfcTFFFH2rC+3UBm79fBl3b+2HnP
 fVfEk154OFrYke8WOCncshK2tYYrLS25/nvQ7haYw9EBhbM356+RVBwaSnmDQ5sVANZP3SSKLV
 gTHUJL9WShHZyRG70s6LewnZ33hyPxkkeXmD8j9x2uB9yBU5lpM+knZ1OqHfQHR4Zj7GOmaoXq
 EavXURBHI/BUgflQr+JrrVyH5yDaJJPMBS3iMOJMVbPLbBWQMrKSin/6+KlH13N1OMRgE0vFyu
 Dbg=
X-SBRS: 2.7
X-MesageID: 15252772
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15252772"
Date: Wed, 25 Mar 2020 11:30:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Pu Wen <puwen@hygon.cn>
Message-ID: <20200325103054.GA28601@Air-de-Roger>
References: <20200324103726.3406-1-puwen@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200324103726.3406-1-puwen@hygon.cn>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
 in vmcb struct
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 06:37:26PM +0800, Pu Wen wrote:
> diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
> index b9e389d481..d8a3285752 100644
> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
> @@ -316,6 +316,17 @@ typedef union
>      uint64_t raw;
>  } intinfo_t;
>  
> +typedef union
> +{
> +    struct
> +    {
> +        u64 intr_shadow:    1;
> +        u64 guest_intr_mask:1;
> +        u64 resvd:          62;

Could you also use uint64_t for the fields, like you do below for
raw?

Thanks, Roger.

