Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA819817D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 18:43:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIxTL-0001YY-7y; Mon, 30 Mar 2020 16:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IY4r=5P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jIxTJ-0001YT-Bi
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 16:41:09 +0000
X-Inumbo-ID: 417b16ba-72a5-11ea-b9e8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 417b16ba-72a5-11ea-b9e8-12813bfff9fa;
 Mon, 30 Mar 2020 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585586469;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=wJZz1axbeOijV0Qb220EZAkTUlWWQgsltCfX1P9v5e0=;
 b=MDNRnMtdjl6gGq3i6WWhkOqmZGWuZ/UE5djdw/9nvt0nu2etXTnqltIh
 rPorFkrfLfyAtRCCElBgAmRsOO8/Ayq/PSlrDuTG4Pt8/SeqL908tHubR
 W24uKrXLTHIp2uYtsezfPMCIUm2l6RtmOTwF0CoB+3cN7jM/5q37dEH3C k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PhJVQi3Ey7S+zzrOxfM5iDUTTjtpgg9E89SpB79SzY430vTxveyvFagrgn1l60JdbEiR0jJTOJ
 zn44Dm5DPZdCpI5Fqsz3FmEQrdrdO2nEobbZcjKoVUQcNNxmRBanqXZK8ikh7KQ+7B3TqHgyo2
 +3ASAglrpuyRxPoEn3Kd74FMT8M8X2rA+odUT7jY71+V5i0qhT1YDBl/V5cWJlxr3GeZSGRQjl
 UK9gSkFq/YpRAVDjHenH/TXGR6MjTHrvlzkZsKa+iY0VYayt4mutnLLjn/2oY0dZ8I2ibvnjoN
 3cs=
X-SBRS: 2.7
X-MesageID: 14859251
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,325,1580792400"; d="scan'208";a="14859251"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24194.8458.419698.4513@mariner.uk.xensource.com>
Date: Mon, 30 Mar 2020 17:40:42 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, David Woodhouse
 <dwmw2@infradead.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
In-Reply-To: <24194.8279.169315.476575@mariner.uk.xensource.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
 <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
 <24180.53085.835170.696701@mariner.uk.xensource.com>
 <8c5ccb8d5f3cb3426b5782cc80391c9f8bcb71b8.camel@infradead.org>
 <af5af47c-31ab-09bd-2f05-e5e2ce34780d@suse.com>
 <24194.8279.169315.476575@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort xenstore-ls if a node disappears while iterating"):
> And making a node visible by XS_DIRECTORY[_PART] doesn't count as
> reading it.  But it does count as reading the parent ?
> In principle adding or removing a node could be made to count as a
> change to the containing directory.  But I don't think doing this as a
> response to David's issue is sensible.

So, err, putting that together and reviewing the state of the world:

I still think David's 1/ patch is good.

I think my comments on 2/ are still applicable, apart from the
bits where I suggest using a transaction will fix all this.

David: do you now intend to revise 2/ according to our comments ?

Everyone else: is there some reason we shouldn't commit 1/
immediately ?

Ian.

