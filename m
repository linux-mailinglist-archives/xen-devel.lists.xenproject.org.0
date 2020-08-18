Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1324875C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:25:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82Xe-0004OS-H5; Tue, 18 Aug 2020 14:24:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k82Xd-0004ON-3c
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:24:45 +0000
X-Inumbo-ID: cc08ef6a-bcfb-456b-a513-4d02d47c85a0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc08ef6a-bcfb-456b-a513-4d02d47c85a0;
 Tue, 18 Aug 2020 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597760684;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gORKphZS09l6q7+K3txQbnrwJK4+MGgjO5u6IjOwGlc=;
 b=A21TBI2x8kLKzjgRBB3N3TkLNob6wPEtlf5ofqxIDVA1V54D/yHo9awf
 qzVf6sIlJ2i8ifGmjo3nzfvEaNcKEKPI4jnasnHZmkJ243fGduMqCWLRs
 30wdmrobaPe1IWIsJz2cD3TU/t3hioiSQ+N/PmrsOOoSoIeTDhNgKmH9t g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xKl7bN3koNabuc2rmeZJezsFn8ixqtqhXLwf1zP9VTngeHSzhVimB0qWwlr2rJh/2j1cSR5zGQ
 bTuZK1JtZ4vZDgCozM0blCHO+3IfnWUi0PQQW/DrVfJxtMHN7+YTM0MkrJ89UAvAjcolD1LiV0
 S+A6bBfhU6OnPZMKTIokcWP0oP5vWh3y28n/Sjj9xu4EJYJ0Ne/5lqbKugSUxxDoKgBTUxpcvS
 MT6Mt3eC1auX4OC5MH9GxR3qBPMTik4QVmnAdX5ZeUBKryS6SKT5BN19GPeH+ybeHoInRaItBA
 mmI=
X-SBRS: 2.7
X-MesageID: 25701055
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25701055"
Subject: Re: [PATCH 7/8] x86/pv: disallow access to unknown MSRs
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-8-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <62992949-2f0a-cd05-3b8a-0df22d317139@citrix.com>
Date: Tue, 18 Aug 2020 15:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-8-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> Change the catch-all behavior for MSR not explicitly handled. Instead
> of allow full read-access to the MSR space and silently dropping
> writes return an exception when the MSR is not explicitly handled.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

