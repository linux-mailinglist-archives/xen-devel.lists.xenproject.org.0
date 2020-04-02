Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3C19C6F6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 18:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK2Zr-0000Bi-Rs; Thu, 02 Apr 2020 16:20:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK2Zq-0000Bb-Jt
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 16:20:22 +0000
X-Inumbo-ID: d9897686-74fd-11ea-bc03-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9897686-74fd-11ea-bc03-12813bfff9fa;
 Thu, 02 Apr 2020 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585844422;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nDK9zgu5WCMqhvH9QXag8JSS2lIKvQEjK8bix6cbvmY=;
 b=EIaZ7uuQsRlUgzrenD1uBYnSlJCmViYbj8fOSvZzT99c1IBY6lwfK4z0
 LFNz9AD4ZFrOq46bKTThMAA5syhsOzqqAZfeuqKmS8pia4+ObstiFMbgD
 5hA1rw/zhgK0y1CllLF1rT+SGTRGthxqkuszb3oyLCQPIYH6AIiuEMa2J w=;
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
IronPort-SDR: 9WiWOQpCx0ek7t5GdOHLhXgGFJXbOWmFU5sHnM5Jfe+Emc/S9jfuDCamOOYveD6iZ7zHX9iAPk
 hvb2SKzYHsKqtWGDd3h6X6Ls9czuM4Z7iWWmG8y/XuXmDiMLW64ZhDQLBqum37SmmclqUdSDkF
 a3xnou4L63g3QMTYhALrCMvrUOO1dP6wW9Cbtweqcm6GcdzTJLhFHes/ao61PL/uEy0NvEonMh
 bidy+HEMcnUQxD1hjZAnR6fHPwjogd93GoMb17CeU6MR8vszx8hgK5Z5g/egFwAe+ef3szarap
 4pU=
X-SBRS: 2.7
X-MesageID: 15301825
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15301825"
Subject: Re: [PATCH] xen/x86: Use macro DIV_ROUND_UP
To: Simran Singhal <singhalsimran0@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20200402155322.GA16696@simran-Inspiron-5558>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0fd21c6d-d7d6-ca11-61ad-e96d48d0a8eb@citrix.com>
Date: Thu, 2 Apr 2020 17:20:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402155322.GA16696@simran-Inspiron-5558>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 16:53, Simran Singhal wrote:
> Use the DIV_ROUND_UP macro to replace open-coded divisor calculation
> (((n) + (d) - 1) /(d)) to improve readability.
>
> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

