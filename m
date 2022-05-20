Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33552EDE5
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334275.558288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3NU-0008Ca-1g; Fri, 20 May 2022 14:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334275.558288; Fri, 20 May 2022 14:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3NT-00089g-US; Fri, 20 May 2022 14:13:15 +0000
Received: by outflank-mailman (input) for mailman id 334275;
 Fri, 20 May 2022 14:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIPw=V4=citrix.com=prvs=132b3d1f7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ns3NS-00089Y-T5
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:13:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34d52f0-d846-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 16:12:59 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f34d52f0-d846-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653055993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBNRIut3D0N2Tk9UPM11O0ntkDoGKca/eaaKq37A9lQ=;
  b=Mhks0musTcaAuN/YDuwbMRkBhrLCuEnP94OFIOyryq4lmddjzasyGd4m
   p1s/X3hePK4TNCNcBBafcTChNJw+2nViZpP4shuBoupB+t5meNOR+WW5U
   G4YEILL9foDcI6s8/Qotu9f5qJqr6lQYoWjrWLkYAzHGI6Pu2DTSRmfHl
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71801745
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GrEaFav2lQoccW1FqbkKOCa7QefnVA1eMUV32f8akzHdYApBsoF/q
 tZmKT3TPv2CNjemftl0a9yz804OvJOBm9RmSVNsqXgyHytA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X4
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8lMpWcx94MUiVlAmJEeoF99eKEEFag5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU2PEyZPEESUrsRILUckN6u1ybBSG1BrlPF4po632381TUkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO2ofS8yV6zXfpad
 lRS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imBxpKEvDyIB1Q5X317L/AduZJ1dBI1g
 wrhc8zSOdB/jFGEYSvDq+zM9GvsZXd9wXwqPnFdE1ZcizX3iMRq10+UEI4+eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJGT9bxgbQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjYam2N0Q4xRsJ/rVxBHkJPmqgJv1lDyLpBaJ5YKVcFn
 meO0e+u2HOjFCTzNvImC25AI88r0bLhBbzYugP8N7JzjmxKXFbfpklGPBfIt0i0yRREufxva
 P+zLJf3ZV5HWPsP8dZDb7pEuVPd7ntlnj27qFGS50nP7Idyk1bOEudZYAXUP79lhE5GyS2Mm
 +ti2wKx4003eIXDjuP/q+b/8XhiwaAHOK3L
IronPort-HdrOrdr: A9a23:1sbquaqp6qOC4Tgnt/6jPlsaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71801745"
Date: Fri, 20 May 2022 15:12:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] tools/xl: Allow specifying JSON for domain
 configuration file format
Message-ID: <Yoeh3nMNW0AfcHr/@perard.uk.xensource.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
 <9aa6160b2664a52ff778fad67c366d67d3a0f8ab.1651285313.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9aa6160b2664a52ff778fad67c366d67d3a0f8ab.1651285313.git.ehem+xen@m5p.com>

On Tue, Apr 19, 2022 at 06:23:41PM -0700, Elliott Mitchell wrote:
> JSON is currently used when saving domains to mass storage.  Being able
> to use JSON as the normal input to `xl create` has potential to be
> valuable.  Add the functionality.
> 
> Move the memset() earlier so to allow use of the structure sooner.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

So, I gave this a try and creating a guest from a json config, and that
fails very early with "Unknown guest type".

Have you actually tried to create a guest from config file written in
json?

Also, this would need documentation about the new option, about the
format. The man page need to be edited.

An example of a config file written in json would be nice as well.

Thanks,

-- 
Anthony PERARD

