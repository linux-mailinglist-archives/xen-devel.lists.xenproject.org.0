Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9B26DB2D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 14:10:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIsiw-0008DF-LS; Thu, 17 Sep 2020 12:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJEn=C2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIsiv-0008DA-Ar
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 12:09:13 +0000
X-Inumbo-ID: aed76a38-0375-4956-a587-064ec4ceffd4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aed76a38-0375-4956-a587-064ec4ceffd4;
 Thu, 17 Sep 2020 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600344551;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TZgjVmsLCg+PxpnY+fgYYgpnxh/CHnGF/MeCksnCXmM=;
 b=gZz3tjncDn3xcY0D2zm8gQqHmox7U7EXGcUWqBcrNQuN1wLeiZBU4RYX
 0x8DSjL8isoZF0JcOIovFlBbm4YfB6+o+0v7U4hMvtKLuiSVOpZM6L5je
 s0oVrIucbPYnGTCR0X4s0JxyiwRFD8Oi61UYS3FV6/LcVWN7FgVGr6A73 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FS86lXY3eRPWY0R/tJSuJ+Juus/zU33fKmhgKo+BT9moBkcZNQ2QBtKJ8Sd8BbY4PewsRJKhm0
 r+tE5oIc1zPCir17Eg18zE/5AKUqbRc2jRnCTK5jcu4CRD76DRMh7XzzMf2EVI75elvz53JYIP
 NiVMCfwo/wyy8fi556ALIopjhD+FEfLjycjI3v1Jq86iIxnlTBd3O2RiXF+jqamDKY/Lxl0Yir
 zJP2G7NB3GpaK90cNgqwLFlzFebJGH/uT4SfodYSFJosB/jyFylPDnmjtCGDBvwJzSilAqFbH+
 JLU=
X-SBRS: 2.7
X-MesageID: 27034315
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,436,1592884800"; d="scan'208";a="27034315"
Subject: Re: [PATCH 2/5] sched/arinc653: Rename scheduler private structs
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 <xen-devel@lists.xenproject.org>
CC: <xen-devel@dornerworks.com>, Josh Whitehead
 <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-3-jeff.kubascik@dornerworks.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fc0b043d-1fe5-8281-fc18-1e1ba26cb127@citrix.com>
Date: Thu, 17 Sep 2020 13:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-3-jeff.kubascik@dornerworks.com>
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

On 16/09/2020 19:18, Jeff Kubascik wrote:
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 7bb75ffe2b..d8a23730c3 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -50,38 +50,38 @@
>   * Return a pointer to the ARINC 653-specific scheduler data information
>   * associated with the given UNIT
>   */
> -#define AUNIT(unit) ((arinc653_unit_t *)(unit)->priv)
> +#define AUNIT(unit) ((struct a653sched_unit *)(unit)->priv)
>  
>  /*
>   * Return the global scheduler private data given the scheduler ops pointer
>   */
> -#define SCHED_PRIV(s) ((a653sched_priv_t *)((s)->sched_data))
> +#define SCHED_PRIV(s) ((struct a653sched_private *)((s)->sched_data))

While you're cleaning things up, please delete these macros (possibly in
this patch, as you touch every almost every user).  They strictly
introduce type safety issues, and are in the process of being taken out
of the other schedulers.

Some logic already has a local variable.  These areas can be expanded in
place and everything will work.

Any logic which doesn't have a local variable need to gain one.

~Andrew

