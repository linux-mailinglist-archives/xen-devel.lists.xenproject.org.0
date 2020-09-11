Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96E265F5A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:15:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGhx4-0003d0-Jb; Fri, 11 Sep 2020 12:14:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGhx2-0003cv-Dn
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:14:48 +0000
X-Inumbo-ID: 60612009-661e-4c3f-b4ad-adc8210a656d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60612009-661e-4c3f-b4ad-adc8210a656d;
 Fri, 11 Sep 2020 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599826487;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DqbJ2O5t5Ob0cV3AAy5ALNktw0n1SCTt6Y7u0hAmqVQ=;
 b=ImBiaTd2gcpPbn99Zm03OZDEB/lU0566SV+UD4yyNmUCFBVCWBv0tE7g
 C0LHgG7zbE0NCYcsnVScFxt7uhlbrBiJUi84cBzy1QmBBXn+2VzmoiL8C
 tz2k0l38I7pFSbsXtnAQz8BfguGSvsunhJDWpIa6aYj2th1en8oUuiCqs o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ok2D6rDvz3Wps+J4358GBLFbWa/XXEJh2GXnfX2oUIlQNMF1fNy0hwQBY+3EA7sKsBf8ULM6U9
 r1vwzye4c1sXcn2z4XxdQK7PdPmzZoO6o9bHQp0EdX0YJzqlUs9A3gukb+ndI8Q/dlspSX6/V7
 S+zRcrrDNe5UUlOmYIcjk5iz+/MQBqWbhaDsLjA7gPBx82aGiFX2R3X/Y0gzDoeb871aHSkJ1x
 JFmdEKepbdmgIP6HfgLrCkHVRg6rgtcbEmJsG2gqBc5j1DThPOF5iwJvjJg23b2ZWbMxb0Gq3I
 aYU=
X-SBRS: 2.7
X-MesageID: 26830296
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26830296"
Subject: Re: [PATCH] xen/hypfs: fix writing of custom parameter
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
References: <20200911053043.29445-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <77ebc474-966e-885c-a08d-9da538671cb0@citrix.com>
Date: Fri, 11 Sep 2020 13:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911053043.29445-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On 11/09/2020 06:30, Juergen Gross wrote:
> Today the maximum allowed data length for writing a hypfs node is
> tested in the generic hypfs_write() function. For custom runtime
> parameters this might be wrong, as the maximum allowed size is derived
> from the buffer holding the current setting, while there might be ways
> to set the parameter needing more characters than the minimal
> representation of that value.
>
> One example for this is the "ept" parameter. Its value buffer is sized
> to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
> allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.

If you're looking for silly examples, exec-sp=disabled is also legal
boolean notation for Xen.

>
> Fix that by moving the length check one level down to the type
> specific write function.
>
> In order to avoid allocation of arbitrary sized buffers use a new
> MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
> of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
> single parameter.
>
> Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

This does fix my bug, so Tested-by: Andrew Cooper
<andrew.cooper3@citrix.com>

This does need backporting to 4.14, so maybe is best to take in this
form for now.

However, I'm rather uneasy about the approach.

Everything here derives from command line semantics, and it's probably
not going to be long until we get runtime modification of two sub
parameters.

In a theoretical world where all the EPT suboptions were runtime
modifiable, it would be legal to try and pass

ept=exec-sp,pml,no-pml,no-ad,ad,no-ad

While being fairly nonsensical, it is well formed on the command line. 
We go left to right, and latest takes precedence.

Given that we do have buffer containing everything provided by
userspace, and all internal logic organised with const char *, why do we
need an intermediate allocation at all?

Can't we just pass that all the way down, rather than leaving the same
bug to hit at some point when we do have a parameter which legitimately
takes 128 characters of configuration?

~Andrew

