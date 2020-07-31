Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A135A234538
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Tmc-0003B9-C8; Fri, 31 Jul 2020 12:05:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1Tmb-0003Ax-2A
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:05:05 +0000
X-Inumbo-ID: 10176509-d326-11ea-8e2b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10176509-d326-11ea-8e2b-bc764e2007e4;
 Fri, 31 Jul 2020 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596197105;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=U8btkJG1pX5eVem4AvDe70lJNMz+0CIS6/m8SL4EwNI=;
 b=Ek7LFyg7/11pMLB58sXaZD97RTVDauZmz5Plh9A4G9odIys3MGwdbILx
 t3ZNeunXLZKNwDxKwUz42Nx0i4hr3jeeoHoy0PEjd8Eyd+vDcMVO5CVog
 knir/Y9Lk6JHhT6uKjDGm4WJj2at9lcKXPHkZM6AafbpzWIP3yXn9lUFn 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3qb8Cb4PLMZzWyLe90hE+yG4wiTFRR1BmmJvmN3ovKjye2sZBhP5kpK8CihGssZftir7aihwiS
 hC3fUTR4SLHZCVBrtmJgILZIhbC/Hq4YqUe3Z9TT1hIbgxfoyi38HqI2VGDRXxxcEIvOl7MZ1z
 Pp8fo9qKpojeLovlYwIALtbi+2pM7rtsfIElqPv+GeTDxlWhbTTmZmPgI2xrrOToHiXocI3BpL
 rv7e3tS/gDEQnFcbYKXiifE6BPAAnhL1fENmUSH/WYJS68SzqIpNrbk6bOQwD5yGfHQVhyGjRY
 y8U=
X-SBRS: 3.7
X-MesageID: 23636293
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23636293"
Subject: Re: [PATCH v1] tools/xen-cpuid: show enqcmd
To: Jan Beulich <jbeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
References: <20200730163406.31020-1-olaf@aepfle.de>
 <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
Date: Fri, 31 Jul 2020 13:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 13:03, Jan Beulich wrote:
> On 30.07.2020 18:34, Olaf Hering wrote:
>> Translate <29> into a feature string.
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Albeit I'm pretty sure there are more missing than just this lone one.

And in particular, probably missing from libxl_cpuid.c, which I was
meaning to check when I've got a free moment.

~Andrew

