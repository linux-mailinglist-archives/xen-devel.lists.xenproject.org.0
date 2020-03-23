Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5EE18F95A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 17:10:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGPac-0006Zc-9A; Mon, 23 Mar 2020 16:06:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGPaa-0006Z5-Li
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 16:06:08 +0000
X-Inumbo-ID: 32ba6c78-6d20-11ea-b34e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32ba6c78-6d20-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584979564;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ybp8tKExU5iEdy5UKKSKygJ5qWuFM/JIrdm/RqJKQkM=;
 b=DZmvd/ZIM9SfAKm3it8el5I2WEyyktOFsUEQOQVOYt50nBbylx9a9nfk
 0fCfx0nUs+NbGkxGBGI5eLoLT57QEca0srGrkSMz2p5Ai3dPE1b6IN82Y
 UxGWFuhhUaDFfxD2kXxYrBXQJ272D3D+db6ZjpJuSLqAiMMi5UXPWFz5b g=;
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
IronPort-SDR: /MOpNty/dXNB/xETs+bf5eYE7aYPU+qj0ATfji2wrsMh/gHmRydqPNZkP6W6UjrVjDHCBT/5xy
 jW32Ttq7cwIhbXBihtn9+iRIdUPyl61AjnQ34Pau9TD3FfuhP79Akey+MZRPINeo2gYmYbpI3O
 nqkN0RQGGjZjl1veKcCFDQ0YI+qCX4Ic0HdjEkRzyanNq6eXPE4VfFvV2BVGyM245O0AoHHC3o
 IX8DVZ2eXY6HwZIyMMFfsbJ/9GnE0Zwhva038PQjzWkLGwQqmIGLtjM/6BBIKRehQtl9rPO2Xk
 4KU=
X-SBRS: 2.7
X-MesageID: 14813064
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,297,1580792400"; d="scan'208";a="14813064"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200323142900.22255-1-jgross@suse.com>
 <70f2493d-69b5-2765-137a-1ad63a5c2b96@citrix.com>
Message-ID: <74b58f25-feed-d664-aab5-363ea72807de@citrix.com>
Date: Mon, 23 Mar 2020 16:06:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <70f2493d-69b5-2765-137a-1ad63a5c2b96@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On 23/03/2020 15:44, Andrew Cooper wrote:
> On 23/03/2020 14:29, Juergen Gross wrote:
>> In case of some errors xs_talkv() will close the connection to
>> Xenstore. This is annoying as it is not clear to the caller in which
>> error case the connection is still available.
>>
>> Drop that implicit closing to make the interface behave in a sane and
>> predictable way.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> This definitely does improve the cascade failure cases.
>

Actually, I spoke too soon.  The EBADF goes, but the next read_message()
ends up pulling junk out of the ring.

I think something else in the middle needs teaching about hard errors,
and not to pull more data out of the ring.

~Andrew

