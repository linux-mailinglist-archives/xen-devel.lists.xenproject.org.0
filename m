Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88F2486CE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82LG-0003A6-QY; Tue, 18 Aug 2020 14:11:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k82LF-00039y-Pr
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:11:57 +0000
X-Inumbo-ID: b693b1bd-dc68-407d-89fa-7763a048eaea
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b693b1bd-dc68-407d-89fa-7763a048eaea;
 Tue, 18 Aug 2020 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597759916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XjFFh43jOwM5Rzoopsx8W0Ju3mUyoUkOMqPRtyKRLrc=;
 b=H7KHVumh3ahOg2CSCt+RhYB/e48L/QpSLSGw7HMmZwGXqNUTvbai1T7q
 BAJvNnKHJB+35IowXXudc8wSiuMI7bwxDlFxnTnpvWkinISXnotC2awEs
 55Ogc2i3mmULF8QIaTUfT7IYnDj9uaCz/q9uSAMXM/tsQl1SZggkcs8NV I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QJwo+YKeBCb/M2HsxxLhjLKtT+G249eJwtMwvRUQt8lTdtpAjZ85xf/VkK7+oJPMIR8U3W77/M
 wIErd+966wLAuCj7CsHct4Nzwuvx6uLpgO00GiqmGTKbpTck3pksQ183zs+re/WIPlGwO5xj71
 aMH3Ma359F56lDL1d4vTkdKcLMm3ywhktu7B4g3DcyC/DODw52nGyBlY6Ly/4A5QoAoew+BPVi
 hnct1Wh5LT0TqPjYBQBDF15gQENTvTYwH4VChlwb0oADTbupr+tFECVkxTB4i8IEpTUw0ZQvBd
 /QE=
X-SBRS: 2.7
X-MesageID: 25699118
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25699118"
Date: Tue, 18 Aug 2020 16:11:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH 4/8] x86/pv: handle reads to the PAT MSR
Message-ID: <20200818141150.GN828@Air-de-Roger>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-5-roger.pau@citrix.com>
 <ce957bd1-a0b7-a68a-68ed-2b6756809779@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce957bd1-a0b7-a68a-68ed-2b6756809779@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 18, 2020 at 02:50:24PM +0100, Andrew Cooper wrote:
> On 17/08/2020 16:57, Roger Pau Monne wrote:
> > The value in the PAT MSR is part of the ABI between Xen and PV guests,
> > and there's no reason to not allow a PV guest to read it.
> 
> This is faster than using RDMSR to find the constant.
> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> (Can fix up on commit)

Sure, I didn't write it down because I assumed it would be obvious,
but worth writing down.

Thanks, Roger.

