Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAFC1D5258
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 16:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZbbv-0005cL-Iq; Fri, 15 May 2020 14:46:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZbbu-0005cG-Ei
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 14:46:50 +0000
X-Inumbo-ID: e802582a-96ba-11ea-a580-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e802582a-96ba-11ea-a580-12813bfff9fa;
 Fri, 15 May 2020 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589554010;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=m+SBMttchB81UO7EH4e8Axt0cFZzlkx2BBcCefdUTpI=;
 b=R8tEMSaZqQBEd+6IsJizfHRdeE4a/YHiZVXxcWHs4GzFRRuYxFIP9B7U
 xtdFBq9Ien/CZfdKMwgCkT1DqKBTtanj/R4NUxDKrPPKU1bMyoT7kYvjO
 7NIuKMvWe0zpa6tCJR2KiH0IyvtA0Tutg2+1BY169QFw/CzKWWI5yh4if Q=;
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
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: /3DzRUHt8YFVmZw1JiDWUVItk4n9hSUX5gV7t6KxfapSMhQSBtjQURbki07kVy0+FVnReqs8TE
 qZNUTH5q0AIoOvk5Ko8Xzk0hOoHpNvfseCoqOdxyJ4aB3G7Jrg58whJXb9i9tY+5Zv/1jUZzdA
 Z+KLnq9MaCrMLipVYx9AGAXgyO7gLOMIGucCJrt07TjIA+ZrZSpdiIVIU7bNgyp8L0ehJe4SyV
 0wdBXbT/WvKRLKGPoLbSDku3RYpJKHecMrKA16lMDgll0ztsURbcg8FYLd1H1byYt0SH9+rQLR
 +L0=
X-SBRS: 2.7
X-MesageID: 17660730
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17660730"
Subject: Re: [PATCH v2 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <28cba02b-b1fd-8cbc-5e12-9ccbf25b305a@citrix.com>
Date: Fri, 15 May 2020 15:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/04/2020 09:38, Jan Beulich wrote:
> While it should have been this way from the beginning, not doing so will
> become an actual problem with PVH Dom0. The interface change is binary
> compatible, but requires tools side producers to be re-built.
>
> Drop the bogus/unnecessary page alignment restriction on the input
> buffer at the same time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use HANDLE_64() instead of HANDLE_PARAM() for function parameter.
> ---
> Is there really no way to avoid the buffer copying in libxc?

Not currently no.

Since we now have access to regular kernel memory via mmap() on
/dev/xen/hypercall, we are now in a position where someone could hook up
implement a small memory allocator backed exclusively by mmap()'d pages,
and this would remove all bounce buffering in userspace.

~Andrew

