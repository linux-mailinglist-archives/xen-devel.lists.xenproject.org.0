Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF9379071
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 16:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125277.235798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg6ip-0007pP-Ra; Mon, 10 May 2021 14:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125277.235798; Mon, 10 May 2021 14:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg6ip-0007my-OJ; Mon, 10 May 2021 14:17:23 +0000
Received: by outflank-mailman (input) for mailman id 125277;
 Mon, 10 May 2021 14:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wdO=KF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lg6in-0007ms-SM
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 14:17:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ec6c5cd-b360-42e8-a366-1bf6a5877537;
 Mon, 10 May 2021 14:17:20 +0000 (UTC)
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
X-Inumbo-ID: 7ec6c5cd-b360-42e8-a366-1bf6a5877537
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620656240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ednk2M4FSrg/qGy5mYV394twVU1RJ0QEIra0t+rkiRU=;
  b=VKBUrmgnDeOFhk4M0LIy1f09S2HLoHLlc2KVpBbVNo4xBFbFWDgOO0Su
   1LK5kVds3bURUIRdOnzAbuFfzQw/5NpVwA/T/KD7upg/zu9cE6jrh/Tl2
   EK+HTTaA9y3RU4o6OQkZp/pcbVG2l1pRkBzLHOy9trLo3uXtLf/hdkKvb
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: A4+iveKZzaJ72gpg1MlWPiImrRg2Lb3PCPu8XSJtrSbxrr9AKZof439yPd9+PSuMtF0RAeGPuI
 UjMFi6rZCN+7aXlMJ9M4veSPrNKojYb2d5E+lV13yqw26eYdFFxMbJkHenrzk+z+VtswDkQ695
 Z7yR5YCd14mzeXXn1UmUuRNPaBhFDKTMrFr+Ht9vgzIEPUx2lfLq8nM7gxRzKs/scj6IykDVRR
 Zt95wQMkvyjuDpAzzDOZra6ojEI61uSMCsn2IvRtsbHiICOYC7AcX/SNn4kpVap/SGFDul9LEV
 vC8=
X-SBRS: 5.1
X-MesageID: 43555661
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fVos+KtseloimCN3Xpez0VG07skCl4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H4BEGBKUm8yXcH2/hoAV7CZniuhILMFu0StLcKrAeQfhEWmtQz6U
 4kSdkZNDSSNykzsS+Z2njdLz9I+rDuzEnrv5a4854Hd2FXgtRbnmVE43GgYy5LrWd9a6bQTf
 Gnl496jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKWCSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8wPT9aw+cxzpAVr4RFIFqjwpF7t1HL2xa0e
 Ukli1Qc/ibLUmhPl1d7yGdmDUImwxekEMKgWXo+0cL5/aJBg7SQvAx+L5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4nZcjEBS49L7tUYvJLf2qYUh3LD393klZ6vo3BiKm7zPNd
 Meev00yMwmDm9yXkqpzlWHmubcIkjbNi32PHQqq4iQySYTn3x8wg8dzMkAlmwNnahND6Vs9q
 DBKLotl71LQ4sQYbxmAesdXMetY1a9Bi7kISaXO0qiF60CNjbXp5H27dwOlaeXRKA=
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; 
   d="scan'208";a="43555661"
Date: Mon, 10 May 2021 15:17:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 0/8] Fix libxl with QEMU 6.0 + remove some more
 deprecated usages.
Message-ID: <YJlAa4fqcUCotlhM@perard>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
 <CAKf6xpt_xkpnNwcq2-WS3SN+Qj8gcz33MaGdfCW=30HzfqrWng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpt_xkpnNwcq2-WS3SN+Qj8gcz33MaGdfCW=30HzfqrWng@mail.gmail.com>

On Mon, May 03, 2021 at 10:13:57AM -0400, Jason Andryuk wrote:
> On Fri, Apr 23, 2021 at 12:16 PM Anthony PERARD
> <anthony.perard@citrix.com> wrote:
> >
> > Patch series available in this git branch:
> > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.deprecated-qemu-qmp-and-cmd-v1
> >
> > The Xen 4.15 release that went out just before QEMU 6.0 won't be compaptible
> > with the latter. This patch series fixes libxl to replace use of QMP commands
> > that have been removed from QEMU and to fix usage of deprecated command and
> > parameters that well be remove from QEMU in the future.
> >
> > All of the series should be backported to at least Xen 4.15 or it won't be
> > possible to migrate, hotplug cpu or change cdrom on HVM guest when QEMU 6.0 and
> > newer is used. QEMU 6.0 is about to be release, within a week.
> >
> > Backport: 4.15
> >
> > Anthony PERARD (8):
> >   libxl: Replace deprecated QMP command by "query-cpus-fast"
> >   libxl: Replace QEMU's command line short-form boolean option
> >   libxl: Replace deprecated "cpu-add" QMP command by "device_add"
> >   libxl: Use -device for cd-rom drives
> >   libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
> >   libxl: Export libxl__qmp_ev_qemu_compare_version
> >   libxl: Use `id` with the "eject" QMP command
> >   libxl: Replace QMP command "change" by "blockdev-change-media"
> 
> For the rest of the series besides
> libxl: Replace deprecated QMP command by "query-cpus-fast"
> and
> libxl: Replace deprecated "cpu-add" QMP command by "device_add"
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks for the review!

Cheers,

-- 
Anthony PERARD

