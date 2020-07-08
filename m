Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4A2185E5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 13:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt84S-0004n9-8Q; Wed, 08 Jul 2020 11:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65hh=AT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jt84Q-0004n4-P5
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 11:16:58 +0000
X-Inumbo-ID: 890ca024-c10c-11ea-8e29-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890ca024-c10c-11ea-8e29-12813bfff9fa;
 Wed, 08 Jul 2020 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594207017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bojDQ70VGgpEjsSAvhiVonk1IPlVtB8NqHG4JqvRoA8=;
 b=co+peH64vBQbk9Ne7UNpCl5I72Aq5xVIBswb/BoqCB0VhRtPl/U08WNF
 d+JcVzkwkY8JvJhpytcaDAWvkY2sZ4QcS6FmdWCt2k8tNhyL0eArkfcz3
 L4/VGws3sw1yvzlgDS+pJKe39J4F3TmN2TRLnIq692oyIAZwtxHss0Ket o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Y7LAl79xRXjtB7ODpVYEuFtpRq1EBz2Li8v/eqx7wuPkp9H/OOtOUb9ODvKCSfb56Rbbvjp1TI
 SYpncIND7tvjagbcxtS9kxWDNjkpocNgNptfJ1FQn2hHIp+XgQopyq6xZliXvCxgi5sVFC29LH
 T7BvnFerjdObrIAJPZpvGBHCgkJcHFt/RN1PzlFPjYdCRrpw8RrHlAr3447wrndc72Z5IwdkcQ
 1armTpImHl5yBv7+qL4sDzmPGzqd+etoFktYkt0R3XfXMOP7dCFj+SxM0dlYw3gjY73FH36yyl
 rmY=
X-SBRS: 2.7
X-MesageID: 22197937
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22197937"
Date: Wed, 8 Jul 2020 13:16:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mtrr: Drop workaround for old 32bit CPUs
Message-ID: <20200708111647.GC7191@Air-de-Roger>
References: <20200708101443.27321-1-andrew.cooper3@citrix.com>
 <20200708104826.GB7191@Air-de-Roger>
 <12874bc4-39e8-5ed4-3893-79154a206293@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12874bc4-39e8-5ed4-3893-79154a206293@citrix.com>
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

On Wed, Jul 08, 2020 at 11:52:57AM +0100, Andrew Cooper wrote:
> On 08/07/2020 11:48, Roger Pau Monné wrote:
> > On Wed, Jul 08, 2020 at 11:14:43AM +0100, Andrew Cooper wrote:
> >>  	/*  Check upper bits of base and last are equal and lower bits are 0
> >>  	    for base and 1 for last  */
> >>  	last = base + size - 1;
> > FWIW, you could also initialize last at definition time.
> 
> I've got some very different cleanup in mind for that code, seeing as it
> can be simplified to a single test expression.

Oh, I certainly didn't look at it that much :).

Thanks, Roger.

