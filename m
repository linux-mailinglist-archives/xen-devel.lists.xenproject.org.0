Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E722ADB8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZO9-0004on-UM; Thu, 23 Jul 2020 11:27:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyZO8-0004od-Kd
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:27:48 +0000
X-Inumbo-ID: 8875288a-ccd7-11ea-a280-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8875288a-ccd7-11ea-a280-12813bfff9fa;
 Thu, 23 Jul 2020 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595503668;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FoW/AC5n1ITQNf8Twa9bU5uOV7JIe+/XBRQgH5QqNHk=;
 b=TXbDXVvkTks9fFDSACWU3b9vWKTIdWd1jGvSoy7gJ8pX6k2xmVfNWYbP
 6oSz2+GlG5l0jEVlIpHHy2jm7o7HZx3iMoPjssCKgg1MKrJGA5VbsbEZM
 IuU8P7nODtIhMMXmd2UkOojqWeaZ1jkfIcpN7sohVMudmOGgER0fQjHy+ g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: c5Un9MxD484NGlctdOuM/ZAQpvHLUdTWiWsVwLGZBfbRlLMc8gdy1G5Zn3CuS8/HhJP3FFADGW
 I+QAUARchKPdYdCRWsuxIN/ahj5AVNG6PAaFX/h3zC3xSkPP8wlkE2L2ZkvSaCpIMPd0wRQxwv
 xeSbJklwQ2/yLwvrvrZq/Ay3Gd1dS/apvP4kZR+Le+RxYWO/oJ9QOu9SDD9hmNY6zXNlB14D5T
 nj8UxQeducYJPUklHb7Fmi+tcBIh6GjytkaIP1C78NNrlmal5KhhL2IVfvfH8i6WSqd152uiVb
 eME=
X-SBRS: 2.7
X-MesageID: 23025143
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23025143"
Subject: Re: [PATCH 2/2] lockprof: don't pass name into registration function
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
 <d8eab983-9377-a519-3be8-6ef83fa96516@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <34904795-b1da-15d9-4525-aa1210b45d1f@citrix.com>
Date: Thu, 23 Jul 2020 12:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8eab983-9377-a519-3be8-6ef83fa96516@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 11:52, Jan Beulich wrote:
> The type uniquely identifies the associated name, hence the name fields
> can be statically initialized.
>
> Also constify not just the involved struct field, but also struct
> lock_profile's. Rather than specifying lock_profile_ancs[]' dimension at
> definition time, add a suitable build time check, such that at least
> missing tail additions to the initializer can be spotted easily.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

