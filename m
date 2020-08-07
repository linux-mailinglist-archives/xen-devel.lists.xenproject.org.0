Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978223F14C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 18:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k45JY-0002AG-BA; Fri, 07 Aug 2020 16:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k45JW-0002AB-6z
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 16:33:50 +0000
X-Inumbo-ID: f38a59c4-e603-4c6a-a3ff-7116ba1103e3
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f38a59c4-e603-4c6a-a3ff-7116ba1103e3;
 Fri, 07 Aug 2020 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596818029;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nnO5aTOZjX5ID+ZoNXOeOZbxKmrfJzqt5vu6mexE4SI=;
 b=hsRWI1QoDqyDAB+fm3DdlZnvx12QVjMxI4ReF97HGwhYd3yM5Qwqpdun
 MJgoffL3Xe4FnRskUe0W1AmSi2zI8N80HTMlb2DzbxQW/YafOzWf/mJtq
 nFjKeupX6p1DDnyXvwIcbeI8bkMQB1I8YMdwEzr5uazh6JjhC4EvYVpD2 c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wtMOLiNMujuNa+yCG+2xE1d/W+TgArODTJtev51V8xVAEFbrnK9wjmjtGzN4kHLohU84aubPDB
 9D8oVSruLAtBSi35/aGYVHE+T2DkMn2mjQO7B5uTG0kEV3VIzbWhNf4gwgKkmzKMlZwZaf9BjV
 R0rXwzh6jodNfCMt1ZM4C62NSp6zb/ZGsDadNCh0mVqqaAGJm/XnY9NH6dLIIA6puLH719dAhS
 jdptwiRU7yuvlt7hcrv02XcNsHsc1iYEAJSAGqpLQaccifWdYKOtodw00irCh/NLLNkATv5YO7
 hVQ=
X-SBRS: 2.7
X-MesageID: 24253274
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24253274"
Subject: Re: [PATCH v2 1/7] x86/EFI: sanitize build logic
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <07e622b4-bb61-08e8-d96c-e770ec7abc53@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a544a9d-edc8-cb71-05a2-77c860050836@citrix.com>
Date: Fri, 7 Aug 2020 17:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07e622b4-bb61-08e8-d96c-e770ec7abc53@suse.com>
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

On 07/08/2020 12:32, Jan Beulich wrote:
> With changes done over time and as far as linking goes, the only special
> thing about building with EFI support enabled is the need for the dummy
> relocations object for xen.gz uniformly in all build stages. All other
> efi/*.o can be consumed from the built_in*.o files.
>
> In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
> split between obj-y and obj-bin-y.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'd prefer to see this all in Kconfig, but this is a clear improvement
in its own right.

