Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F419225E034
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 18:50:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEEvA-0001VS-G7; Fri, 04 Sep 2020 16:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/IBy=CN=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kEEv9-0001VN-DA
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:50:39 +0000
X-Inumbo-ID: 5e7d01b4-df01-4476-aa1f-bd63b3b47b47
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e7d01b4-df01-4476-aa1f-bd63b3b47b47;
 Fri, 04 Sep 2020 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=0ofkIAetg1Cm7nJhZripBc1gt5kuT2PChh7xCZHxHQk=; b=iONvr+4iYiBnMF0Ms3r8Sapfhs
 ootJ56LSJ/R0JDttRjlb7wv7sRBGC+4qxqh80/Ald3AB5MUejNf3SaymclKzKgRpeVEfW2WWlT2QC
 eSaFz1fgTaJScGqNM8XyuWi+11lSi5VZeqmz0/NeLIHXaSreXepgia+nMg6rdfKyElDg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kEEv8-0001jy-Fd
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:50:38 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kEEv8-0005mN-Ee
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:50:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kEEuy-0008TR-KM; Fri, 04 Sep 2020 17:50:28 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24402.28756.378598.517505@mariner.uk.xensource.com>
Date: Fri, 4 Sep 2020 17:50:28 +0100
To: Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 153602: regressions - FAIL [and 1 more
 messages]
In-Reply-To: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>,
 <20200904160034.11456-1-iwj@xenproject.org>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
 <osstest-153602-mainreport@xen.org>
 <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
 <24401.5895.115731.487189@mariner.uk.xensource.com>
 <52d2bdeb-ccde-9d9d-9f62-24571e9e4c15@suse.com>
 <565646cc-2833-d34e-2bc3-eb920ac7f140@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

Jan Beulich writes ("Re: [xen-unstable test] 153602: regressions - FAIL"):
> Actually, with also reverting 8d990807ec2c in the main tree (along with
> effectively reverting e013e8514389, which comes down to the same as Ian
> suggested for 165f3afbfc3d), and with its future re-installment at the
> same time bumping the mini-os commit to use, things ought to work I
> would think. That would then be the same model again as used for
> qemu-trad.

I implemented this here:

Ian Jackson writes ("[PATCH] minios: Revert recent change and revert to working minios"):
> Currently, xen.git#staging does not build in many environments because
> of issues with minios master.  This regression was introduced in an
> uncontrolled manner by an update to mini-os.git#master.

I don't have any formal acks for this but, having build-tested it, I
am going to push it now, because the build is broken.

Ian.

