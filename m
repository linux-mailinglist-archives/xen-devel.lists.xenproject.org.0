Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4B2FD5F8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71611.128366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GHp-0004aU-BZ; Wed, 20 Jan 2021 16:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71611.128366; Wed, 20 Jan 2021 16:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2GHp-0004a5-7N; Wed, 20 Jan 2021 16:24:49 +0000
Received: by outflank-mailman (input) for mailman id 71611;
 Wed, 20 Jan 2021 16:24:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2GHn-0004Zy-Gm
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:24:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8a4280a-9dfc-4ffb-9091-423a54649d90;
 Wed, 20 Jan 2021 16:24:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7608AC7B;
 Wed, 20 Jan 2021 16:24:45 +0000 (UTC)
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
X-Inumbo-ID: f8a4280a-9dfc-4ffb-9091-423a54649d90
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611159885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0CAf3KXClyT+eprzcaZU37dvWypgpdYZrse+zqTfOg=;
	b=Hq3KnsaRN4PGaZPjRoP13uKEEBiYLH7omZk8EUELcK7OjrP4B4IYQLtK9hZL/8pn1/cDNA
	zTRYNkqvupq5xrNwOAnkkJIMkHSqZr9MJTNJKyuOPC/2lxO5ceDjNsJ2qRw0z4i0+2r/mu
	E29nlo3uS8VddYx1vdkLM+fxapJFlus=
Subject: Re: [PATCH V4 10/24] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-11-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c2cbbbe-080c-6fc6-94cf-d79e511e9aa6@suse.com>
Date: Wed, 20 Jan 2021 17:24:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The IOREQ is a common feature now and these fields will be used
> on Arm as is. Move them to common struct vcpu as a part of new
> struct vcpu_io and drop duplicating "io" prefixes. Also move
> enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.
> 
> This patch completely removes layering violation in the common code.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

