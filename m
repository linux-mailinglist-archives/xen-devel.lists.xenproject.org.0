Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6003CBA7F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 18:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157647.290336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Qcn-0006H6-FS; Fri, 16 Jul 2021 16:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157647.290336; Fri, 16 Jul 2021 16:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Qcn-0006F7-Bp; Fri, 16 Jul 2021 16:23:41 +0000
Received: by outflank-mailman (input) for mailman id 157647;
 Fri, 16 Jul 2021 16:23:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJG=MI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m4Qcl-0006F1-A5
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 16:23:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43c67b32-4551-4bce-a007-7dd082171dd8;
 Fri, 16 Jul 2021 16:23:38 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 43c67b32-4551-4bce-a007-7dd082171dd8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626452618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=B3tE4f57NelE1LohuNJ9hG9uHNWiBTNxUFDOpF+Jmms=;
  b=XQ6mez6m58dau3goYbFiHILUqu8O6mcmruDgErEkSL5bY95fM0X4DQsp
   2JuZzWKTSGP6UHhUkT9oo5l53DMug26ovnhr32BnTfvv2IYuhLoqmD35H
   BETbqVMgswQceUdGosrdfgn4aPfXdURoCfyCHJlEWeeD4QQ94B7Xmbx+y
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zq2UcFMgoXyXVKIlxFtAFNbALSi2BQIXdlWQ+t6wicQdwSIJMEuigrGPi8fpXC5ZDfWkLaKPeL
 mjt2RGR267CXG7F4zE8kZHrIBIYnMmNGq0bbptxn69UZSMwsOom2ixpO9eJQbN0+d+n/6rSOVa
 elyM6HOVWJWqLyrrt+5qMFy/rH04YHk5WZjKxmQI68IyW4EOMLn4zmMMLlK0tLerJJrUKoL671
 EwebFX6++BTNdgg4OV8GshR7cYZ2WCL5Qga/efsU4O7O43nE+4wLY5WSMdan00egPp+a19Tg4z
 k1I=
X-SBRS: 5.1
X-MesageID: 48145624
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:z1oXmK0j/hYXLB0JHdLMSQqjBIokLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faSskd2ZJhAo6HlBEDuex/hHPJOjrX5eI3SJTUO21HYSb2Kj7GSoAEIcheWnoU2uJ
 uIMZIOauEYZWIK9foSizPZLz9P+re6zJw=
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48145624"
Date: Fri, 16 Jul 2021 17:23:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <YPGyhXE7DjeEGgxT@perard>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
 <17a250d3-1c1b-f079-c950-5590975e56ae@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17a250d3-1c1b-f079-c950-5590975e56ae@citrix.com>

On Fri, Jul 16, 2021 at 02:15:28PM +0100, Andrew Cooper wrote:
> On 15/07/2021 07:25, Jan Beulich wrote:
> > On 14.07.2021 18:17, Anthony PERARD wrote:
> >> --- a/xen/common/Kconfig
> >> +++ b/xen/common/Kconfig
> >> @@ -25,6 +25,9 @@ config GRANT_TABLE
> >>  config HAS_ALTERNATIVE
> >>  	bool
> >>  
> >> +config HAS_CHECKPOLICY
> >> +	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
> >> +
> > This is no different from other aspects of "Kconfig vs tool chain
> > capabilities" sent out last August to start a discussion about
> > whether we really want such. Besides Jürgen no-one cared to reply
> > iirc, which to me means no-one really cares one way or the other.
> 
> You know full well that upgrading Kconfig was specifically to be able to
> use this functionality, and you know full well that I firmly support

To be honest, I've upgraded Kconfig mostly because I needed to start
somewhere with upgrading our build system to look more like Kbuild. I
may have adding `CC --version` and some other CONFIG_* running shells,
but I don't think anymore that is a necessary things to do, it just look
cleaner.

> using this mechanism, because we've had both of these arguments several
> times before.

I'd like to read about your (or someone else's) arguments in favor of
doing more in Kconfig only, do you have links (or maybe subject,
keyword) to look at?

I think I understand Jan's arguments.

Cheers,

-- 
Anthony PERARD

