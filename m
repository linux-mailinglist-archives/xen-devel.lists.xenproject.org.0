Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5419CD5E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 01:12:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK90X-0000VC-GF; Thu, 02 Apr 2020 23:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK90W-0000V7-OP
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 23:12:20 +0000
X-Inumbo-ID: 66367de8-7537-11ea-b4f4-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66367de8-7537-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 23:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585869139;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hl8Rx2B8raNOeE6heJ5022T5NWwKk/ZAVJM3cZm2ltQ=;
 b=P9piR1Kb3ZLzjCoD3Ocq8rh2nHIfxxhI49Q0t7lsY112bIsldrSIatFw
 Ke0pfa0e1qLBzOMjiIQ9bsNuPOxU6y4FT/T/NbBVyZMxmZTjCc3draqoT
 Tch8s/MdUOuG31qEohXQrErlASLk0Vfyw24t6XwXR1eRTjX9XS1xTDyaT w=;
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
IronPort-SDR: MSKd7JIyOPM4daPb7iM0jWDVUgGZiAuiCC+bzleoUIGMSsHqYKjH+Qohnl4ToaAR7XqxbMGlC9
 JQFZBgLGq7s/Wes5dhyp9zgGWO0ZXDgrDIyPnF2w45cK0DYRLpF+STA99/XYr3iscce1rjRImV
 htpUfpf0cm/hGAFPmsP7RsKrTX0+dn4xIusTNb2TtDiITiFggRUelXVmGZNRXW+wWBNxsvRPNA
 1LOwW3sYPFhkjbs8eAIC0bXlOt+aaNZzGRHnF5BKQ8vcBynRJ8tU7pMM36b9il1tVR0cuANZe/
 yOs=
X-SBRS: 2.7
X-MesageID: 15426289
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208";a="15426289"
Subject: Re: [PATCH v5 05/10] x86emul: support MOVDIR64B insn
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a02ed6b-d7a0-7152-185f-a5bbc5491c49@citrix.com>
Date: Fri, 3 Apr 2020 00:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 12:34, Jan Beulich wrote:
> Introduce a new blk() hook, paralleling the rmw() on in certain way, but
> being intended for larger data sizes, and hence its HVM intermediate
> handling function doesn't fall back to splitting the operation if the
> requested virtual address can't be mapped.
>
> Note that SDM revision 071 doesn't specify exception behavior for
> ModRM.mod == 0b11; assuming #UD here.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> TBD: If we want to avoid depending on correct MTRR settings,
>      hvmemul_map_linear_addr() may need to gain a parameter to allow
>      controlling cachability of the produced mapping(s). Of course the
>      function will also need to be made capable of mapping at least
>      p2m_mmio_direct pages for this and the two ENQCMD insns to be
>      actually useful.

MOVDIR64B isn't the first instruction to demonstrate this corner case,
but we do need to organise something to solve this problem.  I'm
confident it will cause real memory corruption issue for encrypted
memory VMs under introspection.

