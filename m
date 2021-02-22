Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B929D321DF5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88290.165897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEtq-0004yZ-SB; Mon, 22 Feb 2021 17:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88290.165897; Mon, 22 Feb 2021 17:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEtq-0004yA-Ox; Mon, 22 Feb 2021 17:21:34 +0000
Received: by outflank-mailman (input) for mailman id 88290;
 Mon, 22 Feb 2021 17:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ease=HY=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lEEto-0004y5-Lq
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 17:21:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a67abc4-6e7d-4ed6-86a9-2d24e4fd4e74;
 Mon, 22 Feb 2021 17:21:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEEtm-00053X-UK
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 17:21:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEEtm-0006zj-TX
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 17:21:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEEtZ-0001Zq-Bp; Mon, 22 Feb 2021 17:21:17 +0000
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
X-Inumbo-ID: 1a67abc4-6e7d-4ed6-86a9-2d24e4fd4e74
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=a/9qX5moC3Rq8S3aUWOAoq37RgEc4xE6+ZRw7DRDZlQ=; b=6th44pN9krjVTBoZSv0zruvT1T
	wiu9rDTZKD4cNrY/XZTQTvSWP5vLB4lVM+UJ7w0MyrAz8KKuEVhdoYMs/2X05KMmkoKZkNHYbODwT
	XL/Qud00erH3YqsN/mtf1iZVBSLIKqbBL+4Kp59XADMDBAnAVypRQywAFYuzI3knTDx4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24627.59405.114762.685265@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 17:21:17 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Ian Jackson <iwj@xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Xen-devel <xen-devel@lists.xen.org>
Subject: Re: Stable ABI checking (take 2)
In-Reply-To: <a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
References: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
	<78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
	<a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: Stable ABI checking (take 2)"):
> On 22.02.2021 15:03, Andrew Cooper wrote:
> +1 for option 2, fwiw.

I'm in favour of option 2.

Andrew Cooper writes ("Re: Stable ABI checking (take 2)"):
> As far as RPM is concerned, splitting the two is important, as %build
> and %check are explicitly separate steps.  I have no idea what the deb
> policy/organisation is here.

The reason why distro build systems like to distinguish "build" from
"check" (run tests) is that often the tests are time-consuming (or
have intrusive dependencies or other practical problems).

IMO if the ABI check is very fast there is no reason not to run it by
default.  (We have configure to deal with the dependency issue.)

Ian.

