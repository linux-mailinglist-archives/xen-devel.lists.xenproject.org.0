Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDD192AEB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:19:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6pB-00072Q-V6; Wed, 25 Mar 2020 14:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH6pA-00072L-OE
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:16:04 +0000
X-Inumbo-ID: 28fde209-6ea3-11ea-8625-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28fde209-6ea3-11ea-8625-12813bfff9fa;
 Wed, 25 Mar 2020 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585145764;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yctcd9Ebq6zYIGhbB9FqoTeqCQhc5UJ+BBFiqfcDEVk=;
 b=AD7QZDLPlcsMo1LI1vVAwWjWM/z++WeUaw2lyRqxRWPdYATMPaDxOsRL
 J7CVEdUIFk3firhGtiRrfngc0m6zYLlLTfDCkE+PKODruOsj3QvZPg3db
 1eYpZYfO5yVKyBbvvmjvQ87UR/SoCopDSiVsKzRrsZZyWb03d6Bxqt4C1 Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bmmy8m8PCFmHKJWxuBmuLbuG5qMvFV0bqBjcsXHQOSr0F6h7cFOrENBc8MKF37/fcZuc3+mKmA
 /Bj3qs66fq1tz6fd8onlmjdb8N+F7GBs6+axwXo3euWD3PTKxbSgy4fcrUZJFJgVlySD4vk06C
 CZNwsuuOdMMW4K75eYHiycpbT4BVMgpEMNDP8NL47UOFsIajGyM85L3DckPjBcB1D625/B4Sjp
 OROR4amV2Orhs9AU2ETCl+OZsnZXCycrQ9bepmt0v+7hYLFpm1o3Hh85Vn+AghXO498C7RYZrb
 8Wg=
X-SBRS: 2.7
X-MesageID: 14618636
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14618636"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <8cf000a6-a8ac-22b6-422d-c11dc8b6454a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91a633e1-ee5a-7903-b61f-e7905931d3b1@citrix.com>
Date: Wed, 25 Mar 2020 14:15:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8cf000a6-a8ac-22b6-422d-c11dc8b6454a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/7] x86emul: vendor specific
 SYSENTER/SYSEXIT behavior in long mode
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 16:28, Jan Beulich wrote:
> Intel CPUs permit both insns there while AMD ones don't.
>
> While at it also
> - drop the ring 0 check from SYSENTER handling - neither Intel's nor
>   AMD's insn pages have any indication of #GP(0) getting raised when
>   executed from ring 0, and trying it out in practice also confirms
>   the check shouldn't be there,
> - move SYSENTER segment register writing until after the (in principle
>   able to fail) MSR reads.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

