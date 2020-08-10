Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CC2407B3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 16:39:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k58we-0008Jd-Ct; Mon, 10 Aug 2020 14:38:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwXP=BU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k58wc-0008JV-I6
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 14:38:34 +0000
X-Inumbo-ID: b032379c-6dd9-473a-8e01-0e058991cac3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b032379c-6dd9-473a-8e01-0e058991cac3;
 Mon, 10 Aug 2020 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597070314;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vJ8dmo/QwxWAU3avpF0Dyh7p54QkxZbboNwEPvKU0bY=;
 b=Y4lhEhdAAKh+jQYzNJnj9XNDthCkIaeiwHM9VFXnRKr0UsX3JD0kiDk+
 klwIWQMFwzXSJlfC9+quESrhMlZT5YBnMZY2Y1cpAkEzetj97kTN6cS4D
 geK8NJUytGwRtnZf+nYiHjrPm3pXyiKPKmrp9i1z0v627UXCSdvJzaqxY 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yVArj69cwGdbAc4XJMplrUGOO5p8oFN0LYe3fIvfu5trejZ/7t3u0AkmIrBo42c1bDwzodo8jG
 6iRfa82htnOV74g/teD02lpdANupbD07AK6gWIUvXaj72SRckfbJZkn23SSCXaC3zNHhFcstPT
 4lHCeOOBZ3NirmPQIGcXfXzHqGQmtqwnJUCGyo4vlGfvJfsBAaiDrQd6aOGqnT6Bf3ZP4iEyrF
 6XO3x4cQYPLID9lTCmrTgzMNPvipD94yy8dQvlpnJHbuxHIwpfRoLSlT7lfDjGHQI3B49GgWGc
 y2E=
X-SBRS: 2.7
X-MesageID: 24197825
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,457,1589256000"; d="scan'208";a="24197825"
Subject: Re: [PATCH v2 1/7] x86/EFI: sanitize build logic
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <07e622b4-bb61-08e8-d96c-e770ec7abc53@suse.com>
 <0a544a9d-edc8-cb71-05a2-77c860050836@citrix.com>
Message-ID: <6eab1af6-1845-c4b6-5fbb-76d9974404f1@citrix.com>
Date: Mon, 10 Aug 2020 15:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a544a9d-edc8-cb71-05a2-77c860050836@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On 07/08/2020 17:33, Andrew Cooper wrote:
> On 07/08/2020 12:32, Jan Beulich wrote:
>> With changes done over time and as far as linking goes, the only special
>> thing about building with EFI support enabled is the need for the dummy
>> relocations object for xen.gz uniformly in all build stages. All other
>> efi/*.o can be consumed from the built_in*.o files.
>>
>> In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
>> split between obj-y and obj-bin-y.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I'd prefer to see this all in Kconfig, but this is a clear improvement
> in its own right.

Actually, it breaks the build with LIVEPATCH enabled.

make[2]: *** No rule to make target 'efi/buildid.o', needed by
'/local/security/xen.git/xen/xen.efi'.  Stop.
make[2]: *** Waiting for unfinished jobs....
Makefile:355: recipe for target '/local/security/xen.git/xen/xen' failed


