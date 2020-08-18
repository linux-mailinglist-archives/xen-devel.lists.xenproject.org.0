Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B739248336
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:39:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7z0h-0007Av-EF; Tue, 18 Aug 2020 10:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k7z0f-0007Aq-U3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:38:30 +0000
X-Inumbo-ID: 20ce45db-9e34-47c4-aa72-f7b93ea986f2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20ce45db-9e34-47c4-aa72-f7b93ea986f2;
 Tue, 18 Aug 2020 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597747108;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZU6J+UkPeiVl+DDf2fIcNxiAWh4LEqJbdb86sQKrVtI=;
 b=bNMAtGh/A7ajHB3JuMdW4MWhjmqUAJeUrasgZIC863+EM0/pFhL01oXJ
 E7jRcp1V64btw1yF2v6c64lv/Hv/uwIXaRsAWf4spTrINxuBFGFQvo3PQ
 VRVd6Scu4KHzYlE5YmeHbOKsv30iDihT9keRgS6ToAkeMMDeIutc/3c5X s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PF+uXZT1BUojkfx3/gJU8xqL5Xw19fdxNyXLvNW8txx4Vl2W8mFX2tbU3VDMeeMXG/o7wAxNaM
 4kv4QMvA4IT9pahVcvsOPfP53TEay7ZoUGwHaVyKM0Ip/8RUKnELgqfzTq/P7yiy3JsJqtTzhW
 MpvhcbP0g1RhSp4buv6mo4VwxTMn+unqjiwy8D/3HlvF0LYaHW5sB6NK2VRwAstjpHQFgjPi0M
 Pmju9HcsE6uqXfvlwfIqmSbOPDSrhGq+LCDSdk8VrrNSH/vto9VYHcJEe4QmNqXTnSb8bQy91w
 JFI=
X-SBRS: 2.7
X-MesageID: 25681100
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25681100"
Subject: Re: xen-cpuid prints only raw hex for policies
To: Olaf Hering <olaf@aepfle.de>, Sergey Dyasli <sergey.dyasli@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20200818113329.3fc667b9.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9176d3aa-1fb2-cc14-a9ee-83fd16a2fd5e@citrix.com>
Date: Tue, 18 Aug 2020 11:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818113329.3fc667b9.olaf@aepfle.de>
Content-Type: text/plain; charset="windows-1252"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/08/2020 10:34, Olaf Hering wrote:
> Since commit 6b85e427098cce1a6d386b3bae2f0c7ce86e47f7 'xen-cpuid -p' shows the cpuid policies. I think these policies define what a domU will get to see when cpuid() is invoked, or when MSRs are accessed.

Only a subset of the read-only MSRs - those which effectively behave
like further feature information.

0xce is Intel-only MSR which we actually advertise consistently, to
offer CPUID faulting capabilities to VMs.

Future MSRs are going to be MSR_ARCH_CAPS (when we've got the toostack
side of the work done), then MSR_FEATURE_CONTROL and all the VMX MSRs
for Intel nested virt.

> Unfortunately this commit shows only the raw hex values, which makes it difficult to compare output from different physical hosts. I think the actual policy values could be shown in expanded form, similar to what 'xen-cpuid -d' would show.
>
> Did you ever consider to show the expanded form for policies?

Using a bit of sed, you can transform the CPUID part into something
which `cpuid` can interpret and decode.  I'm not aware of anything for
the MSR side yet.

As always, xen-cpuid is a debug tool, and tends to only gain new
functionality on an as-time-permits basis.  I do have a few vague plans
to extend it, but they are definitely not higher priority than getting
MSR_ARCH_CAPS working.

~Andrew

