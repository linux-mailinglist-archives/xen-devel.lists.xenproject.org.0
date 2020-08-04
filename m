Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0423BB01
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 15:20:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2wrM-0006IG-Re; Tue, 04 Aug 2020 13:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exko=BO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2wrK-0005yN-SX
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 13:20:02 +0000
X-Inumbo-ID: 3fcca171-1d6e-4621-ac50-7669bde0fb1b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fcca171-1d6e-4621-ac50-7669bde0fb1b;
 Tue, 04 Aug 2020 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596547201;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PJGeRv+JQkIXau8HxNCjCmynwmnMY5Ci9xTKGvS7QLU=;
 b=KgSFay+6mgwona/OW3FeuhDBxrT5Ks0U6Je4HPaSKuRbzj08nZ2vhdDP
 Zc8rVF8NaKTGLpA5Zy7Al8TZHZq/yAYTpGuQH8Rldtb8ZUcGLKvqeDYqI
 4+DPUhBEPRKlIWR/g6S2DSWB040EKapbP9FaPI/efMLtURotBdhNT7DBK c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mmZ1w8wGMdgcbwsEJkHf78wDVmy4D8SLLB/y6+di9wLsIPRbS3X+ekvsHWPS4bRYuIlCzjiev7
 RwGcZ2aCv2Luv9sEH5PkFv0FA1fGZlAEuS1lkpGBHSNJ8gtp3Ynxa6yYHfVr5r6MmMmmq3ellt
 xTap3NlACrHUwTGA4kFa5eC8eG2WgcwyACqDPbgf6BhdvFkW3hb+OeLoUD4PS3zspXm0cWrnnw
 4HW8CjwualxsnSiErEB9dfEC/LtAHzYJujmN9XsnZq2OwF7qbudI/wwCCG9Kkr7yQBLaRudOH9
 6Yw=
X-SBRS: 3.7
X-MesageID: 24147975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,434,1589256000"; d="scan'208";a="24147975"
Subject: Re: [PATCH] x86emul: replace further UB shifts
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <0ae25858-f981-1552-0a3c-58a9733a758a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c97d8e25-b518-9363-4a58-6b4ace7e1ad8@citrix.com>
Date: Tue, 4 Aug 2020 14:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ae25858-f981-1552-0a3c-58a9733a758a@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/08/2020 11:13, Jan Beulich wrote:
> I have no explanation how I managed to overlook these while putting
> together what is now b6a907f8c83d ("x86emul: replace UB shifts").
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've just checked, and GCC 9.3.0 does convert this pattern back to a
single shift instruction, so at least we're not left with real mul
instructions.

~Andrew

