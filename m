Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5991F2B979F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31107.61348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmf6-0000rA-Ht; Thu, 19 Nov 2020 16:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31107.61348; Thu, 19 Nov 2020 16:19:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmf6-0000ql-Er; Thu, 19 Nov 2020 16:19:56 +0000
Received: by outflank-mailman (input) for mailman id 31107;
 Thu, 19 Nov 2020 16:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kfmf4-0000o3-KK
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:19:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9da1d026-0909-4c55-8516-8124d7df20ba;
 Thu, 19 Nov 2020 16:19:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2P/M=EZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kfmf4-0000o3-KK
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:19:54 +0000
X-Inumbo-ID: 9da1d026-0909-4c55-8516-8124d7df20ba
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9da1d026-0909-4c55-8516-8124d7df20ba;
	Thu, 19 Nov 2020 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605802792;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GU3Q/PWBkJSPaUkOtoAnL2oe9HsQ1Z4B7C6u3QJgIpA=;
  b=JKpg5B62SP9ZJqDhV1ggaZLdv79F+R/aB6zdYAbsoZVXfuU/NmzvZBZ3
   INp+lxb7J0/pigwVsQG65MlqVBJ+84m3BJqCaKFrIWRz6oZvU/IpHgFy+
   Cz0ADtKNjwocQGrQwaTGe4gXwSxsNhub2wLz57CvWoTmmsyj79urcH56f
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3rYK65YTP0NsSE5KBh3xUx7YIq/BgJ0nNvC2qpmKuCSp/AcSivp9lSmK7f+HSzHZ7b3lpgChHM
 6Qpb4DQOWPbqKEHO+nJppyS8gn7z5Ab/iF+J3bXRInaViOLNiI9l8wGgTeDySj5j9faa5Xvbzi
 bWjEDzqtf/TYV47jxtdr70Bdlh2hCm0bqq4FxaWK6F2FqtymZS65CT80ZGH3NYF0+ygxXgf//n
 ewMMSzqcfNa/e9/LJtF1HhX0MsVI8mmnYKdDzxTkIr6igVvRJ8koDUJqoXY6zDJgr69rMeNdQ7
 9hs=
X-SBRS: None
X-MesageID: 31773387
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,353,1599537600"; 
   d="scan'208";a="31773387"
Subject: Re: [PATCH] AMD/IOMMU: avoid UB in guest CR3 retrieval
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <1a5bca28-b37c-eaa7-3a64-51428d24915f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <913bdd04-29d6-77c4-3c20-1e200c92e0ce@citrix.com>
Date: Thu, 19 Nov 2020 16:12:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1a5bca28-b37c-eaa7-3a64-51428d24915f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 19/11/2020 15:58, Jan Beulich wrote:
> Found by looking for patterns similar to the one Julien did spot in
> pci_vtd_quirks(). (Not that it matters much here, considering the code
> is dead right now.)
>
> Fixes: 3a7947b69011 ("amd-iommu: use a bitfield for DTE")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

There is *still* an outstanding regression (modulo dead code) in one of
these bitfield-ifications which is off by 12, but I can't remember if it
is this one or not.

>
> --- a/xen/drivers/passthrough/amd/iommu_guest.c
> +++ b/xen/drivers/passthrough/amd/iommu_guest.c
> @@ -70,7 +70,8 @@ static void guest_iommu_disable(struct g
>  
>  static uint64_t get_guest_cr3_from_dte(struct amd_iommu_dte *dte)
>  {
> -    return ((dte->gcr3_trp_51_31 << 31) | (dte->gcr3_trp_30_15 << 15) |
> +    return (((uint64_t)dte->gcr3_trp_51_31 << 31) |
> +            (dte->gcr3_trp_30_15 << 15) |
>              (dte->gcr3_trp_14_12 << 12)) >> PAGE_SHIFT;
>  }
>  


