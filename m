Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241424BD01
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 14:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8k7T-0000jQ-7e; Thu, 20 Aug 2020 12:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJFq=B6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k8k7S-0000if-9i
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 12:56:38 +0000
X-Inumbo-ID: 2a52663c-2a58-4216-a972-b9996e4537aa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a52663c-2a58-4216-a972-b9996e4537aa;
 Thu, 20 Aug 2020 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597928197;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=q9QBcpFKAvuaIrFtdVNduOw0BKJJ3hsF2fUSg/+Bdjk=;
 b=Jy9rcD3KKwxf/Yd5i+qbxrLjp28y0j3uB8OlzhQOe5JcvnIr4rRvbFR/
 FP6JQBXLjkknRG/B2wXkBdEI2uzFsyLE1LYotXB0lWv8DtgAfJxlFAzVG
 Zd0McqLKsATkip6eckGoytR5M0XxQ5oytwVrzN0N5k2pYjYcprAwW3L8r o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fSYv7f3hvDZ29m+1gtP9kxs0naNJvbUzUmqP89bDI2osL1P/SgXFdmy/shMAsQuzw62Jg0/R5O
 x2KblKuXtal3wUmtvAVnJcZrvGDAS6IDmk34xCZLi7DyYOFIUlFEsUN99N0YVxMDOc0YDdUEz+
 oNfRDl4wp8bs95HFtoK+fnYv7chEGXfGo9Z8kF4pVG2RR8hWuDeJyh7kLEDtTolqDEaywsTe30
 aAPSiiJ8Wl2rq1bpaoNmRS/gzG5RLFTGc1Tqp6y//+xiZq22SN4FRh5663NszYpp4gRpt2zF6h
 19E=
X-SBRS: 2.7
X-MesageID: 25092890
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,332,1592884800"; d="scan'208";a="25092890"
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a439f9c6-2773-5f49-367b-fe3f3ff21ae9@citrix.com>
Date: Thu, 20 Aug 2020 13:56:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/08/2020 23:50, Roman Shaposhnik wrote:
>  Hi!
>
> below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
> without efi=no-rs. Please let me know if I can provide any additional
> information.

Just to be able to get all datapoints, could you build Xen with
CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP and see if the failure mode changes?

Thanks,

~Andrew

