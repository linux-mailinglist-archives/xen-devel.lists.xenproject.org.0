Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5518F8EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 16:48:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGPFx-0004ML-A5; Mon, 23 Mar 2020 15:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGPFv-0004MG-2p
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 15:44:47 +0000
X-Inumbo-ID: 385910b0-6d1d-11ea-82f4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 385910b0-6d1d-11ea-82f4-12813bfff9fa;
 Mon, 23 Mar 2020 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584978287;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=O8GWdTEUJY0stm+mF1C4KqJd1TR/Xr6KS+f4gheZ0EU=;
 b=MYRgsOY9E1k/QveZqNmBXPB3yFRYUvH4THdkDQAfPKzmngjfYDMoHrn+
 dHrwEomjyr/g5rZm/tkqt2+cqBIiTM5V8D/cGv3B6wRHEjL/uRsdtsd53
 DW+4CjC9Rj3ZhoPKsIrYu/u1xHkzU5YUWWvBnvQSnfLekcHM82idGVCK2 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Nv/lIPj0mzlgdevzJy0LR01cHhbyB1HqKQvxWAAAe4A2Th974dIQi2KIyzSQbohnOc0S6qtYpA
 vKpuGuP0/sXxGYmyZ4uALB2aoz4f4UvqQM3C1ILRP+cN4XW0zjrvrMES/Arz/zECplozFWduU8
 QEARDJwn+WfokmH0QxcTIi/miZ1ICU99ydStgiVlRmaasxoUQ0Ni/cwY6HxGLlDTpo1zhvIgHf
 CrHhZr3PjS+9IthBwC8u8D2HbxcyFFkPX7IyJplZhKiNw+ptxAJnNS3dwIvVFFGOuKFntoohVj
 nEk=
X-SBRS: 2.7
X-MesageID: 14684327
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14684327"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200323142900.22255-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <70f2493d-69b5-2765-137a-1ad63a5c2b96@citrix.com>
Date: Mon, 23 Mar 2020 15:44:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323142900.22255-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: don't close connection in
 xs_talkv()
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/03/2020 14:29, Juergen Gross wrote:
> In case of some errors xs_talkv() will close the connection to
> Xenstore. This is annoying as it is not clear to the caller in which
> error case the connection is still available.
>
> Drop that implicit closing to make the interface behave in a sane and
> predictable way.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This definitely does improve the cascade failure cases.

