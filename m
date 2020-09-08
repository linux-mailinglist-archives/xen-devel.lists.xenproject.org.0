Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5992611E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdRo-0005k1-IU; Tue, 08 Sep 2020 13:14:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Jy8=CR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFdRn-0005jw-04
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:14:07 +0000
X-Inumbo-ID: 80c3631d-e4f5-4cce-8f88-fe6bc32374a3
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c3631d-e4f5-4cce-8f88-fe6bc32374a3;
 Tue, 08 Sep 2020 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599570846;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MclQDtMFM2uYUOLIfrR1zcKEIUXm9dj96fEH2zEeQbs=;
 b=bmUba+OoIjGs4M8JDkZfvWrsI6X1y0nHGSV67upd5wn9ApNgzztQPMNz
 XT8K/lstotbf/N/W1u5VC8CNqSPsgErmh1wNQmVc3Xuvou/EgdjUIrmiT
 at/9nuq6wQGYCa83lFZ7SuBoGJ4a1Gc465Swz0IoLKzDfRnojBhcPcZRa Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sykayBM0pte1s1V9nKniBqcOAcJaRz0EwzGBGscFBwCvoMPuQ9e+BFeZ7XpDn05VUxZASt1Uyb
 +c8+wuMXf/MRzyYG283UJHtDc9EJtIvgiWp3VwAY7cqgOxXyLuAn45LzIp6fqKPHWSsdN9aDEO
 i20A396qS/h9SQkKwtoSlPuOYw972UXvmT4byHL2mmwe+A3tS8wWCqIkYxCKtEwzwZE0pNPjhu
 4x8vzcKEQIvecucXp56gNT26ISknOMo0AF4mi6Z/DdBMXW5aWx4YDeZ3bDlHS/c+nbGxMx/rce
 DSM=
X-SBRS: 2.7
X-MesageID: 27153139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,405,1592884800"; d="scan'208";a="27153139"
Subject: Re: [PATCH] lib: correct __moddi3() description
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <6c8ab543-67dd-62ed-2542-48fa7395e541@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a6205f64-8126-de19-db3e-62f3dce29a9c@citrix.com>
Date: Tue, 8 Sep 2020 14:13:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c8ab543-67dd-62ed-2542-48fa7395e541@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/09/2020 13:54, Jan Beulich wrote:
> The remainder of a division, when non-zero, is specified to always be of
> the same sign as the dividend. Bring a comment in line with the code it
> describes.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

