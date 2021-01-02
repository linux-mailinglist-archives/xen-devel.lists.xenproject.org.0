Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298392E8843
	for <lists+xen-devel@lfdr.de>; Sat,  2 Jan 2021 20:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60848.106714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvmEV-0003SD-Ir; Sat, 02 Jan 2021 19:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60848.106714; Sat, 02 Jan 2021 19:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvmEV-0003Ro-F9; Sat, 02 Jan 2021 19:06:35 +0000
Received: by outflank-mailman (input) for mailman id 60848;
 Sat, 02 Jan 2021 19:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiRR=GF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kvmET-0003Rj-QG
 for xen-devel@lists.xen.org; Sat, 02 Jan 2021 19:06:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e20ceb-12a4-43a0-ab85-cf68087286d7;
 Sat, 02 Jan 2021 19:06:32 +0000 (UTC)
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
X-Inumbo-ID: d4e20ceb-12a4-43a0-ab85-cf68087286d7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609614391;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=vM1FRwZ3KXZW830HdABffrsiKe6pNAURENR+Oh/4f7E=;
  b=Yo9J4UpUQEcRAFidNPG5simtKyXnytD4wv/JGAGiiv5M9Nkbgnc3oYFb
   YbohBmpi5U7FuZx2ZL12Aj5pifDxsd/BZajIz/X3pUeSSzAwXnKdPAaQ5
   s0as7mXA5qWqW+dAUUEOEPBN4FWYhA9vzh0vXUMy/2njH6xSxuN0cJZLy
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6d9mq3KGRVhQnl4y4lZnTabxhr4pg6NzY53irym2lt3c8G1a/NNU2U52jgxrzTv6+EeT3m8d73
 Cq+AwT9atn3POr2o+r8X2fxBSNexOiEjBmB1kbxNWUlHffDOiAlz55q85GTNLCenezjUTjKKl+
 6bUr9zBGd91UzABlcYbOAee/kpxf0Hm6seb06lSShzx8Cy/5k/5cF7L/kQ4v79aP/HbwV/uOFj
 9/uBrh4otGv1QOLo9RbZdXJdiTYCXEZJrSdewLxZjDP6vbrQp0ypDhuhL3R9ZbomYEg/+iW+4w
 UQE=
X-SBRS: 5.2
X-MesageID: 34321916
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,470,1599537600"; 
   d="scan'208";a="34321916"
Subject: Re: Identify an specific DomU inpecting all pages in memory
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>,
	<xen-devel@lists.xen.org>
References: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21be2d74-a1d9-176f-70fb-7f86724a965b@citrix.com>
Date: Sat, 2 Jan 2021 19:06:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 02/01/2021 17:02, Charles Gonçalves wrote:
> Hi, 
> 
> I'm building some attack loads targeting  Xen to my PhD and need to
> identify the pages for a specific guest. 
> Assuming that I'm able to traverse the pages in memory, how do I
> identify a guest (by ID or Name)? 
> 
> The dom0 is easy since I can inspect the start_info looking
> for SIF_INITDOMAIN but I have no idea to identify a specific domU.

Hello,

Could you provide rather more details about what exactly you're trying
to do?

In particular, what context are you in when trying to identify the pages?

~Andrew

