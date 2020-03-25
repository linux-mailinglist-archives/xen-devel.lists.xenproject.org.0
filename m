Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF51926C3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:08:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3qx-0006tq-Av; Wed, 25 Mar 2020 11:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH3qv-0006tl-Tr
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:05:41 +0000
X-Inumbo-ID: 906b0c7e-6e88-11ea-85d1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 906b0c7e-6e88-11ea-85d1-12813bfff9fa;
 Wed, 25 Mar 2020 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585134342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8RfMYazrL5swtJQ9KxQTcbkWbeZ1P5G3PQ5QZlloH8I=;
 b=DSGXQW2H15aCCXkJmbetF2cYiA8MVLUOBkgtVRHU4AfnIFICDXzDnR1Y
 VZcfuctJBVIWM8V4+PXL0ci+T6PeKJSd5YfA/7/kZSucQ4RJEbWgCGW/P
 SetfPurm3eXwieHsFRnV98coc/zIpu0PiP96kMhtSxPgMZK9ycOZqk332 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WJesthM4TTBHY2SphfmiKRRLA77+qyDv3Ab0BzPvxdrd8zTXuAWbrWJyobO0ZYZK1TyQT4HFQR
 SDI5eJmfAULhJQRbKfuP22OxlPcsIqm7L1USJ+VmP4kTkKuZQ+lqldICbSjgcdkiKrfC4PGv0e
 Dn7XxK34OMcyJkIn6Sl1Bi4BNfvoIbcQ96yaOI67ZmqGYtDp0iyI3rX70umciuP2UU5W27s2KP
 0wKvV2wbiD0x5eBgU5XjWzDD3EVgED4Axcc2dCYjTLMy7dU98VONGDPcR7hnPZwKftxlxWxqam
 knk=
X-SBRS: 2.7
X-MesageID: 14582634
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14582634"
Date: Wed, 25 Mar 2020 12:05:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20200325110533.GC28601@Air-de-Roger>
References: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] PCIe IOMMU ACS support
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding the PCI and IOMMU maintainers.

On Mon, Mar 23, 2020 at 01:55:01PM -0700, Roman Shaposhnik wrote:
> Hi!
> 
> I was going through how Xen support PCIe IOMMU ACS and
> all I could find is this:
>     https://github.com/xen-project/xen/blob/master/xen/drivers/passthrough/pci.c#L608
> which looks to me as an attempt of enabling ACS opportunistically,
> but still proceeding forward even if it fails.

That's correct AFAICT. Xen will try to enable some features, but will
proceed normally if ACS is not available, or if some of the features
are not implemented.

Are you looking to ensure that all devices on the system have a
certain feature enabled?

Can you provide some more details about what you expect of ACS
handling?

Thanks, Roger.

