Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B423AAA7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2dVn-0007fY-7D; Mon, 03 Aug 2020 16:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFGv=BN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k2dVl-0007fT-Rk
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:40:29 +0000
X-Inumbo-ID: 09134c1e-d5a8-11ea-af5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09134c1e-d5a8-11ea-af5f-12813bfff9fa;
 Mon, 03 Aug 2020 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596472827;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WtYEFrjMgAoCEzoP+2m8fHJ340xJe620QI3eIGmhKU4=;
 b=ZhRSuaNWlwRZmnA31VmEtlLmhOwhhwCijcy1ppyZj8VjB/X1OCZln+qo
 QNSmay204T0w0/tJgoz09TRfijocbpmeS28Mi4oxwwD9SCPirUR4xUnNa
 cAtf9wPUN6+giL1+URnyzbuOFfBQTMwI1K1B+xus7HO1XclgfWEXct/5a Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 87DYH+HFcE2+lYQ08n4aMaamonkw4A1zUan8EpeMDz5Fb6xtpFpDiP5QafBJnLV11SoVH404DC
 tY/yU99VPihLDrypOVruRfCROxSAieqt9G0kHVxl0qAFFSnagVaQgW2smu3xdbkrnq/w/ExSRD
 DjUX4UnE+jMrbwUM8zp4ISxnZcFtREy9pyba11gurvJXbFcGEu+cPBcttIdGAk/pRmsQXfbZcz
 Odbm7IY37kwxi898GYnyIwvy50BPceCXwEj/62sQSJg6gmDn4dGsGBrSrElb6xa0Yt1HzjLR1s
 nA8=
X-SBRS: 3.7
X-MesageID: 24083753
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,430,1589256000"; d="scan'208";a="24083753"
Subject: Re: [PATCH 00/10] x86emul: full coverage mem access / write testing
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <60a128e9-0480-a753-4aa8-177c270d09f4@citrix.com>
Date: Mon, 3 Aug 2020 17:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/08/2020 15:47, Jan Beulich wrote:
> ... and a few fixes resulting from this work. This completes what
> was started for legacy encoded GPR insns in a rush before 4.14.
>
> There's one thing I'm still planning on top of both this and the
> EVEX-disp8 checking: For all encodings we produce via general
> logic (and in particular without involvement of any assembler) I'd
> like to add a kind of logging mechanism, the output of which could
> be fed to gas and then some disassembler, to allow verification
> that the produced encodings are actually valid ones. See e.g. the
> first patch here or commit 5f55389d6960 - the problems addressed
> there could have been caught earlier if the generated encodings
> could be easily disassembled. What's not clear to me here is
> whether this is deemed generally useful, or whether I should make
> this a private addition of mine.

Seems fine to me.

I have encountered a failure on AMD Naples which I doubt is related to
this series, but is blocking testing on some of the content here.

Testing fnstenv 4(%ecx)...              failed!

AMD Fam17 does have the fcs/fds save-as-zero logic which is still not
wired up anywhere in Xen, which seems like the most likely candidate
here (without having investigated the issue at all yet).

~Andrew

