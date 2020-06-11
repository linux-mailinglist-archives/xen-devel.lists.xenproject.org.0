Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8E1F6CBE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 19:29:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjQzx-0005cV-0D; Thu, 11 Jun 2020 17:28:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSbG=7Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjQzv-0005cO-Fz
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 17:28:15 +0000
X-Inumbo-ID: edb3b788-ac08-11ea-b54e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edb3b788-ac08-11ea-b54e-12813bfff9fa;
 Thu, 11 Jun 2020 17:28:14 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /ad5LL+eBFp6H+kNJxSE/Y4SNNLPRCeR2jm+rwjQP467+S5e/XFL3mY5Oo+fY9LHkBVK+W15an
 uuHjAmsLkEvvifUH8UZKTVZFxRpkUlB6PecUyWIPWj0MKjsO1j2fdMRKyJuuy1IFnvo24xbpwT
 kVSNiu9XQRiE+qOj8gge8gKktpq/WKxFZpdw6P0PQQVCCgjCxUFFQ22whHDYUDd9pr00hkkl0Q
 a3JYvWewOLKffoCnoZWuDudFmY2Xz2fCtj5r/laZ0SuXbdWIV16r8d4luXlkxJcKcdu3iCQgcX
 shs=
X-SBRS: 2.7
X-MesageID: 20111936
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,500,1583211600"; d="scan'208";a="20111936"
Subject: Re: [PATCH] x86/boot: use BASEDIR for include path
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
 <5cf46b52-6a57-3e11-67a0-28f841865c1e@citrix.com>
 <7DA75B75-725F-40CC-9DDE-5727452309A0@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f8f3b858-6fd3-4766-b2c1-30010b664f01@citrix.com>
Date: Thu, 11 Jun 2020 18:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7DA75B75-725F-40CC-9DDE-5727452309A0@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/06/2020 17:50, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 11 Jun 2020, at 17:24, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 11/06/2020 12:54, Bertrand Marquis wrote:
>>> Use $(BASEDIR)/include instead of $(XEN_ROOT)/xen/include for the
>>> include path to be coherent with the rest of the Makefiles.
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Does something subtle break before this change?
> Without changing anything no.
> But if xen sub-directory is renamed yes.
>
> As there is no easy way to build xen hypervisor out of tree (I might be wrong here !) I found a solution using cp -rs from xen subdir in a xen-build1 xen-build2 etc this way I can check build for x86 and arm without cleaning.
>
> Without the patch, the sources are actually compiles with an include path containing xen/../xen as a result of using XEN_ROOT which does not allow to rename xen subdirectory.
> As it was the only place in which XEN_ROOT was used for include paths, this is normalising the paths.

Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Paul for 4.14.

~Andrew

