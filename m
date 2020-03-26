Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DBB193F00
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 13:39:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHRkU-0007oE-Tn; Thu, 26 Mar 2020 12:36:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHRkT-0007o5-N2
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 12:36:37 +0000
X-Inumbo-ID: 6e962170-6f5e-11ea-87cd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e962170-6f5e-11ea-87cd-12813bfff9fa;
 Thu, 26 Mar 2020 12:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585226197;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9mHY/WBC5KhC9goXnbXiVFZeyvQJw9g28teiaN5q2uY=;
 b=GymtgL5g4nzqGsJxL8Ms0XXjT8xnqYOQh5wiSZo6szCz0VxGSZFSdzWo
 fOS0rhinXte9aMNUX7hZdXTOR+2xj6oAL4Q4azU0HLWvTEI9uiPJEhe0s
 b9e7wnXllh11geNJ714vOqY1gtF8FBJmjig5a+5QF7Ds2/TutouVLzGHf 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yXq0ASxqlwX51kDhkSrT2UXVZzAj+0nBSP8L5pznoKDIRuijSP5hcnQsOT8b0S7CuVMhoUG52t
 2TCr0bQNg+iyErQTrazlfL63FQ/sYpX8fgyVZ10r5iBzmd8jdqYDzHZoo90ucgWLqktp2pyHFb
 cIyGl5wqJWDYc7vzl2bLTtMcszTmy0RFvj5ieATI+T/hXI2UY2VbX95kOYLD1Wq/lymJrecahl
 npxaEH/2QffN0tx4cWoCulBw94fslO9RSNg5EP14cOZ5oLjtIOa19Kz/4h1nfd1azU0KwTP4Nm
 VyQ=
X-SBRS: 2.7
X-MesageID: 14660668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14660668"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200326094557.13822-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5a260627-c362-9fda-df42-8478df0e99e6@citrix.com>
Date: Thu, 26 Mar 2020 12:36:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326094557.13822-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tools/libxl: make default of max event
 channels dependant on vcpus
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 09:45, Juergen Gross wrote:
> Today the maximum number of event channels for a guest is defaulting
> to 1023. For large guests with lots of vcpus this is not enough, as
> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
> guest to about 140 vcpus.
>
> Instead of requiring to specify the allowed number of event channels
> via the "event_channels" domain config option, make the default
> depend on the maximum number of vcpus of the guest.
>
> In order not to regress current configs use 1023 as the minimum
> default setting.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

:(

I suspect I regressed this by making it not actually dead code.

1023 is the 32bit EVT 2L ABI limit, but until I moved max_evtchn into
the createdomain hypercall, I'm pretty sure a limit never used to get set.

If this is the case, then unlimited should be the default.

~Andrew

