Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62D195814
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:33:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHp4R-0004ep-4q; Fri, 27 Mar 2020 13:30:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHp4Q-0004ej-33
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:30:46 +0000
X-Inumbo-ID: 2988abbc-702f-11ea-bec1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2988abbc-702f-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585315845;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=ENhrdSTWOZAMHllASiSPeajus7nMU03vbTJ5+NOVTow=;
 b=RR//V+3eZBUwjhb4Ce3wmR6drmP3BRB3bmC5PctvLa0TDKZi1nkFlImm
 uYyW2d74ZiDkDxoXQj1HF1qNLyfnaflDotqEIjQ3u4JNkR5MNJUZYWZ35
 k9cVvVqQbMa9eqiKdo8gBk6CGBSLwwA0DoAQSVpf1CvCHtpKX4loENgT2 s=;
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
IronPort-SDR: xMEWIrkyB0xWu6TOIVctPWzB+Sxe4ZePTZ6pgo0fNaq0vpFeiZimD3vkuc/pPY70D3gzQNLWwF
 EskI6a8Tj/bBk6ZMGs+WXhUg2kyEyhuwRJMUrel38VWGzj8xjyOC9phseiT6aJeFjtFurYbUKj
 nsdqHLaojiPjme20YROWb70hayks31jkFqRCMI78uLZTXB83otFc9PH/xuXaK6ZGLW7CRMVniJ
 jkna1pk+mz/zzyfu+qT5yiFZ3xAcDg9csOWV2YsuTpuODdmoS72N5yirbZ/hzHBvT7Hwc7jG0J
 MzU=
X-SBRS: 2.7
X-MesageID: 15163864
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15163864"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6f39ca23-4d63-ca73-4916-de64efde1a11@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ca2b8cba-f615-8bfb-127b-f98b723d0f6c@citrix.com>
Date: Fri, 27 Mar 2020 13:30:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6f39ca23-4d63-ca73-4916-de64efde1a11@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] SVM: split _np_enable VMCB field
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 14:00, Jan Beulich wrote:
> The nest paging enable is actually just a single bit within the 64-bit
> VMCB field, which is particularly relevant for uses like the one in
> nsvm_vcpu_vmentry().

Lucky for us, these are configuration options, not returned data, so at
least the field won't change behind our back.  Also, it should be fixed
for the lifetime of the domain.

>  Split the field, adding definitions for a few other
> bits at the same time. To be able to generate accessors for bitfields,
> VMCB_ACCESSORS() needs the type part broken out, as typeof() can't be
> applied to bitfields. Unfortunately this means specification of the same
> type in two distinct places.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

