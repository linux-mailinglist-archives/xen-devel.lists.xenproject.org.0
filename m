Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD962C0805
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34217.65089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBVR-0004ja-7x; Mon, 23 Nov 2020 13:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34217.65089; Mon, 23 Nov 2020 13:03:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBVR-0004jB-4k; Mon, 23 Nov 2020 13:03:45 +0000
Received: by outflank-mailman (input) for mailman id 34217;
 Mon, 23 Nov 2020 13:03:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rez2=E5=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1khBVP-0004j1-Iu
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:03:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a195bb2-1734-4483-b0bb-6e01aa6f56c3;
 Mon, 23 Nov 2020 13:03:42 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 191D120758;
 Mon, 23 Nov 2020 13:03:35 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Rez2=E5=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1khBVP-0004j1-Iu
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:03:43 +0000
X-Inumbo-ID: 4a195bb2-1734-4483-b0bb-6e01aa6f56c3
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a195bb2-1734-4483-b0bb-6e01aa6f56c3;
	Mon, 23 Nov 2020 13:03:42 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 191D120758;
	Mon, 23 Nov 2020 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606136621;
	bh=J/TET3MqSRKQBkZDLmw3offBuTNq8xblR6VPj5c7KTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huMDpxd34lY8zl81VJt6WrkzA8VbZ3WZKfCc+01YUsnQkEm+dvBfrNL343ZTscxgS
	 4cn7RRAIuR/6lyK6TO0qxACy3TNrSBuTodAx+s4Q2YpvApK9inZpqsbsSdtJmbV9Zx
	 YwwBYqtSxUH9kHvWkiEz2t98c4vnYVnAJ6qqQTEg=
Date: Mon, 23 Nov 2020 07:03:48 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>,
	Jakub Kicinski <kuba@kernel.org>, alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	x86@kernel.org, linux-nfs@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
	target-devel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
Message-ID: <20201123130348.GA3119@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sun, Nov 22, 2020 at 11:53:55AM -0800, James Bottomley wrote:
> On Sun, 2020-11-22 at 11:22 -0800, Joe Perches wrote:
> > On Sun, 2020-11-22 at 11:12 -0800, James Bottomley wrote:
> > > On Sun, 2020-11-22 at 10:25 -0800, Joe Perches wrote:
> > > > On Sun, 2020-11-22 at 10:21 -0800, James Bottomley wrote:
> > > > > Please tell me our reward for all this effort isn't a single
> > > > > missing error print.
> > > > 
> > > > There were quite literally dozens of logical defects found
> > > > by the fallthrough additions.  Very few were logging only.
> > > 
> > > So can you give us the best examples (or indeed all of them if
> > > someone is keeping score)?  hopefully this isn't a US election
> > > situation ...
> > 
> > Gustavo?  Are you running for congress now?
> > 
> > https://lwn.net/Articles/794944/
> 
> That's 21 reported fixes of which about 50% seem to produce no change
> in code behaviour at all, a quarter seem to have no user visible effect
> with the remaining quarter producing unexpected errors on obscure
> configuration parameters, which is why no-one really noticed them
> before.

The really important point here is the number of bugs this has prevented
and will prevent in the future. See an example of this, below:

https://lore.kernel.org/linux-iio/20190813135802.GB27392@kroah.com/

This work is still relevant, even if the total number of issues/bugs
we find in the process is zero (which is not the case).

"The sucky thing about doing hard work to deploy hardening is that the
result is totally invisible by definition (things not happening) [..]"
- Dmitry Vyukov

Thanks
--
Gustavo






