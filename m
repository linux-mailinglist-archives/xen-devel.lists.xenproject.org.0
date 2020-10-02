Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3672281DF8
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 00:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2359.7004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOT6q-0000uK-HJ; Fri, 02 Oct 2020 22:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2359.7004; Fri, 02 Oct 2020 22:01:00 +0000
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
	id 1kOT6q-0000tu-Cq; Fri, 02 Oct 2020 22:01:00 +0000
Received: by outflank-mailman (input) for mailman id 2359;
 Fri, 02 Oct 2020 22:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOT6o-0000tp-Tc
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:00:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aa0ce90-fba4-4a3e-8869-0c2c5e87e189;
 Fri, 02 Oct 2020 22:00:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOT6o-0000tp-Tc
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:00:58 +0000
X-Inumbo-ID: 1aa0ce90-fba4-4a3e-8869-0c2c5e87e189
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1aa0ce90-fba4-4a3e-8869-0c2c5e87e189;
	Fri, 02 Oct 2020 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601676058;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Evz1SwkUqBuf45+wTDMpz48b1s9zX1y4O8zULGTKSOg=;
  b=C4ObpdQqE7tDAzxFC3Mul03PN3vjw9fadSGC31ErHWoBZZHmTJBMrQUB
   T8pOF9K2IPzOuU1Lz9IATL9cWax7tNa9ddtIjOOPJtvXk0lXv8lmzkmpU
   kUxEEW30mEBmisN3yXQqw6/KaukZ765YDHkdWOLS5lGfqrh894CHYbN/Z
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vOzgG2z4IciMTjfhhAm+83aZd8pYKg3psAOcPKsdMlw4nVxg5BLyexL2/+W+Q8SBi9ppFRahzX
 du7T24foJNZy1zhOz4wKqUNL0h79fVN8PACtFg46f+ByG03v5nY94t3ar4rR9B2QvQfdldXp1X
 mmcneeGyu1kRaTRCOmgzuTanr2qyO1uekHz3ZxAq0h8M76DPaDCzuRL+22aP3Q2AZWOVTsQMjX
 lfuJTXw/aYH/gX7ryI+xoM3f1m5BSr4qjuRhPu0wlXwadW4W4dQOb9/c0f54bhIPRgVdIuUBS2
 yFY=
X-SBRS: None
X-MesageID: 28172768
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="28172768"
Subject: Re: [PATCH v9 1/8] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Julien Grall <julien@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-2-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6e0caedd-ab81-bf91-a108-94b458961d72@citrix.com>
Date: Fri, 2 Oct 2020 23:00:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-2-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> +/*
> + * The 'dry_run' flag indicates that the caller of domain_save() (see below)
> + * is not trying to actually acquire the data, only the size of the data.
> + * The save handler can therefore limit work to only that which is necessary
> + * to call domain_save_data() the correct number of times with accurate values
> + * for 'len'.
> + */
> +typedef int (*domain_save_handler)(const struct domain *d,
> +                                   struct domain_context *c,
> +                                   bool dry_run);

Sorry - missed this the first time around.  This cannot take a const domain.

Doing so prevents putting (amongst other things), event channel details
into the stream, because you won't be able to take the domain's event
lock, and having the domain paused isn't good enough protection.

Removing this const will reduce the churn in subsequent patches somewhat.

~Andrew

