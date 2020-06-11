Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3631F6737
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLkg-0000Cu-1g; Thu, 11 Jun 2020 11:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSbG=7Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjLkd-0000CB-S6
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:52:07 +0000
X-Inumbo-ID: f9261914-abd9-11ea-b509-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9261914-abd9-11ea-b509-12813bfff9fa;
 Thu, 11 Jun 2020 11:52:07 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dDEC1pmsvKf7uyrBf7jK0HYgkq9fr62btkvQ1EKAdtjvXO20kvRD4/wEfjqGoECBjHg11vLwem
 v7te6OCNgczEwj6F/4TSbaEKgeebUlRpzIxUguWD2Np5o6J4pNe63CTyyIZNqGyWMSS7OyTWt4
 egysWBFwbs9/dVJKi+yIHcr426rL+fZ3HycKMkItWO1DaLOeaXjjvTV+CAcAm6xh4FF7PORiUg
 6oKWt0eTfa23Z4dlISJeHZxg6slMD+eHUaiortTdgyWyOShnD4TZvs8/i04mv5tZaU7SB4o7qU
 RdE=
X-SBRS: 2.7
X-MesageID: 20124596
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,499,1583211600"; d="scan'208";a="20124596"
Subject: Re: [PATCH] libacpi: Widen TPM detection
To: Jason Andryuk <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20200611035518.379297-1-jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e43dbb75-5e37-ee2f-b856-7e86baa1810c@citrix.com>
Date: Thu, 11 Jun 2020 12:52:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611035518.379297-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/06/2020 04:55, Jason Andryuk wrote:
> The hardcoded tpm_signature is too restrictive to detect many TPMs.  For
> instance, it doesn't accept a QEMU emulated TPM (VID 0x1014 DID 0x0001).
> Make the TPM detection match that in rombios which accepts a wider
> range.
>
> With this change, the TPM's TCPA ACPI table is generated and the guest
> OS can automatically load the tpm_tis driver.  It also allows seabios to
> detect and use the TPM.  However, seabios skips some TPM initialization
> when running under Xen, so it will not populate any PCRs unless modified
> to run the initialization under Xen.
>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This looks like it wants backporting, so CC'ing Paul for a 4.14 release ack.

