Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508451B7202
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 12:30:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRvbN-00009f-DC; Fri, 24 Apr 2020 10:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jRvbL-00009a-Fp
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 10:30:31 +0000
X-Inumbo-ID: 9ce2aea8-8616-11ea-947a-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ce2aea8-8616-11ea-947a-12813bfff9fa;
 Fri, 24 Apr 2020 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587724228;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=djc70Far7NLTpiozvKY04taHcaiVkaHzWm20Nlsv0uA=;
 b=bKcUlDpTyg9lvcfAfRlzKFgI65zcn2EqxZR7mXzh2GtW6FYMisB68r8o
 FmzOHkiIxJLA5t0OsV9KFY84+J6hHUzX4ov3NC21TM6Q7dO9zunRVdKyY
 Ql4d1vcIOD539fbShxdKvr3nJ8Bu5EejTu3k6HnDsCHP+o1lYymar9GfW 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NCNyEJnJBXboIp/Kbkabc/tWl/B0HwtFzVApYARm94ixI8VOB1S1ZgCGcJgCRoxzk5b/cqmiBi
 Cn4pWyiLYnk1tHTQzdtaCg/CJMv8NBGLYEgES6JimN0kW0abCFeNiCiVmSq2JuZ3N8W31Kf4Oi
 Fi7gZMQRRCJGVp25oRiBr+wYJjy6nyFh/X3+VHWgz3iRaKSiKgzNQOOb+SYVcrjSwKW46omwyA
 yQp5fhB8JmaBch58QOnPDhZDj8Yat3NljZDKEpiR6+emGb8ls5tn7g9rsSL+BZFhO9S/h+KzAD
 jj0=
X-SBRS: 2.7
X-MesageID: 16176337
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16176337"
Subject: Re: [PATCH] x86: drop cpu_has_ffxsr
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <55bcfe11-251c-606e-6f0f-a03880efa390@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <866dfded-71ad-c6eb-e3e3-c4b1244efe79@citrix.com>
Date: Fri, 24 Apr 2020 11:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <55bcfe11-251c-606e-6f0f-a03880efa390@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/04/2020 11:24, Jan Beulich wrote:
> It's definition is bogus when it comes to Hygon CPUs, but since we don't
> use it anywhere drop it rather than correcting it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I had wondered about that too.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

