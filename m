Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D533E1BCDBF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 22:56:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTXFX-00043v-Hy; Tue, 28 Apr 2020 20:54:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NU6p=6M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTXFW-00043q-E9
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 20:54:38 +0000
X-Inumbo-ID: 782ed33c-8992-11ea-98c8-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 782ed33c-8992-11ea-98c8-12813bfff9fa;
 Tue, 28 Apr 2020 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588107276;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vtgMfbKlG7tTO0fahEHKsiKahuUO8TfrKT+QDlOVgps=;
 b=EbpVeAgFuWIbio9deIK+mLbAXWV7TTPMGYcYzu9TiEU0JPRRTY+hb3Pu
 HKmElkzcGsi2YrKxLRwhJrNLP+D5Me1PYjEMEY/aVcM90Uw6gmErXeDTX
 2G0vg6plGspaj3chSGSp3I4Pdjwis7p1Fxm+lGjyEqJWRR59xrv5z374n g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jSqHBU5uG/lWXYn6GIU52x7haex7qbb861udEKyjJOJNlOkil53pFu3+Hx9r+bpZfz0LBUNkbm
 pZznoZrIJRAY+hS3F8nl63l6w2vh3kbG3t3LtbC29YTZF4LaJ21HvTnKSuEnUOQRI2/BHeJzAm
 9Cb2jlJe0f1OjRtdJh99WdbK9fO2gxT8BNaLgCq0pAcE7GRju8kGdRi9RxQJqoQfteUZAz6A8x
 OEC6dMPNoIJKwBHSzrGVdUCqZGLQ6ZAZXPefuMgKW5fGE2cKoZLoyOrJGe3JqeacKCpjdoRerd
 Tx4=
X-SBRS: 2.7
X-MesageID: 16713410
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,328,1583211600"; d="scan'208";a="16713410"
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200428155144.8253-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <130909f7-e9e2-93b4-5b54-aa55178d1bd3@citrix.com>
Date: Tue, 28 Apr 2020 21:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428155144.8253-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/04/2020 16:51, Juergen Gross wrote:
> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
> of the domain's xenstore ring page and the event channel of the
> domain for communicating with Xenstore.
>
> The gfn is not really needed. It is stored in the per-domain struct
> in xenstored and in case of another XS_INTRODUCE for the domain it
> is tested to match the original value. If it doesn't match the
> command is aborted via EINVAL.
>
> Today there shouldn't be multiple XS_INTRODUCE requests for the same
> domain issued, so the mfn/gfn can just be ignored and multiple
> XS_INTRODUCE commands can be rejected without testing the mfn/gfn.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

In hindsight, this is cleanup following c/s 38eeb3864d "tools/xenstored:
Drop mapping of the ring via foreign map".

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

