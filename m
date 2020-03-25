Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D14651929A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 14:30:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH63l-0002Fy-NG; Wed, 25 Mar 2020 13:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH63k-0002Ft-WE
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 13:27:05 +0000
X-Inumbo-ID: 50d44724-6e9c-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50d44724-6e9c-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585142824;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9uSi+oEIuj4iTeOZKhQ7/h/Iwn5v2czXysjVuFql9Jw=;
 b=LUQd/J21UIy02tz1Iloy4zuWCXV39zLKCFO9b3yyaGPn5IGA/Kl7bffz
 TvkfcoRHVbc+IVchqSoUAkr02KQ1e0dpC+EQbyxb2OGZAfn6Z85mM9uMm
 KhP1A1ySwB7s8AuU3motNJwmThmLKyftloyV6clca9BLYg8FuLedWI7Ik U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZqRIvO21N8ua5IgxM7ywcpYV+FzjzF5l2HP8qiZBnuFqslXAw65A+wyVzpYf6IJMOIwFNFcxBC
 k4LyTpJhKQnQbdKjYx9o0KiAskj+UqiJLXuOcTZ7+GjUpK1UHTagxe7ZYI5czAqeqAbveCb7vD
 XmgnifUXi5WD3RA1QLozH6BzGni1e1I3Pm54Diumauv8VTq+lYuy1eBPyXyFkszk0Yb0l1LM4M
 nirJb3PfEKaqqg+3kSo+vQEvdjG+Das1h9RJvikWAMBBzCpCuiJxkI+BsIJOhtWQR66XfnkIhr
 NBQ=
X-SBRS: 2.7
X-MesageID: 15261378
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15261378"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <553aaf64-1171-2354-95a9-d5e54d3b21c4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5278f26f-27fa-733d-af28-8a889d0913b6@citrix.com>
Date: Wed, 25 Mar 2020 13:26:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <553aaf64-1171-2354-95a9-d5e54d3b21c4@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/7] x86emul: add wrappers to check for
 AMD-like behavior
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

On 24/03/2020 16:26, Jan Beulich wrote:
> @@ -1995,7 +2007,7 @@ protmode_load_seg(
>          case x86_seg_tr:
>              goto raise_exn;
>          }
> -        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> +        if ( !_amd_like(cp) ||
>               !ops->read_segment ||

Fold these two lines?

Either way, but preferably with, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

