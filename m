Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042826478D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGN3e-0000cV-RK; Thu, 10 Sep 2020 13:56:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGN3d-0000cQ-CX
 for xen-devel@lists.xen.org; Thu, 10 Sep 2020 13:56:13 +0000
X-Inumbo-ID: 6c4f83a3-262e-4b70-b192-6e11c7c1fe09
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c4f83a3-262e-4b70-b192-6e11c7c1fe09;
 Thu, 10 Sep 2020 13:56:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 297A0B153;
 Thu, 10 Sep 2020 13:56:27 +0000 (UTC)
Subject: Re: Runstate hypercall and Linux KPTI issues
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <stefanos@xilinx.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
Date: Thu, 10 Sep 2020 15:56:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 10.09.2020 15:46, Bertrand Marquis wrote:
> Some open questions:
> - should we allow to register an area using both hypercalls or should it be exclusive ?

I thought it was already clarified that to a certain degree both need
to remain usable at least in sequence, to allow transitioning control
between entirely independent entities (bootloader -> kernel -> dump-
kernel, for example).

> - should we backport the support for this hypercall in older kernel releases ?

It's a bug fix to KPTI, and as such ought to be at least eligible for
considering doing so?

Jan

