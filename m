Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FE45176E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 23:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226040.390500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmkPX-0003CA-HR; Mon, 15 Nov 2021 22:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226040.390500; Mon, 15 Nov 2021 22:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmkPX-000397-E3; Mon, 15 Nov 2021 22:25:11 +0000
Received: by outflank-mailman (input) for mailman id 226040;
 Mon, 15 Nov 2021 22:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmkPW-000391-Rn
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 22:25:10 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3dfbe53-4662-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 23:25:09 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7A9661B5E;
 Mon, 15 Nov 2021 22:25:07 +0000 (UTC)
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
X-Inumbo-ID: e3dfbe53-4662-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637015108;
	bh=vJSsxRlroSa+Wf1PfSlk5Zcswft53H0QxDAKhSabyYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BmWjiqc3dkXXeSpniJ6dzODtEuEJtDZJf1qW9i1Q5p2kyyOHXLaJn0rzSjli3lMUB
	 eXGwsX2Bjd0ZfgH5ZDJhCi9ZLTWo5zlr3AVgbjrJN92qY1dwwF++LJJ//g0ugs0Tri
	 WILh8gR3RXxVviHiDaTgOmbYjIpCdmtVhW34SPkG9OjdRj5t1u3OqmnV/EczLUcU1T
	 BktqC0+BvkXPC56RsyKujUDfmYijhLIBaTr2j62PZCWG3aOvNVY9aU+kIn1Oe3xljW
	 CcT+Pa4JMh59X4eQxVu26jrismAF1mULzxs4gPL3gFFD5LTphRR7LQ2wIHB7c1XqoR
	 Pz4icykEWV/3w==
Date: Mon, 15 Nov 2021 14:25:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Stable@vger.kernel.org, 
    jgross@suse.com
Subject: Re: [PATCH] xen: don't continue xenstore initialization in case of
 errors
In-Reply-To: <6be8285f-6cbe-c115-a826-585664c91022@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111151424510.1412361@ubuntu-linux-20-04-desktop>
References: <20211112214709.1763928-1-sstabellini@kernel.org> <6be8285f-6cbe-c115-a826-585664c91022@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Nov 2021, Jan Beulich wrote:
> On 12.11.2021 22:47, Stefano Stabellini wrote:
> > --- a/drivers/xen/xenbus/xenbus_probe.c
> > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > @@ -983,8 +983,10 @@ static int __init xenbus_init(void)
> >  	 */
> >  	proc_create_mount_point("xen");
> >  #endif
> > +	return err;
> 
> Personally I think such cases would better be "return 0". With
> that done here, err's initializer could (imo should) then also
> be dropped.

I'll make both changes in the next version


> >  out_error:
> > +	xen_store_domain_type = XS_UNKNOWN;
> >  	return err;
> >  }
> >  
> > 
> 

