Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CA20B241
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jooBi-0001lE-5J; Fri, 26 Jun 2020 13:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jooBg-0001l6-HX
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:14:36 +0000
X-Inumbo-ID: fb163750-b7ae-11ea-82bb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb163750-b7ae-11ea-82bb-12813bfff9fa;
 Fri, 26 Jun 2020 13:14:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC611AC85;
 Fri, 26 Jun 2020 13:14:34 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af00d3ae-eba1-43dd-f8b7-d800e53c197b@suse.com>
Date: Fri, 26 Jun 2020 15:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626122408.19151-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 14:24, Andrew Cooper wrote:
> Just like the alternatives infrastructure, the livepatch infrastructure
> disables CR0.WP to perform patching, which is not permitted with CET active.
> 
> Modify arch_livepatch_{quiesce,revive}() to disable CET before disabling WP,
> and reset the dirty bits on all virtual regions before re-enabling CET.
> 
> One complication is that arch_livepatch_revive() has to fix up the top of the
> shadow stack.  This depends on the functions not being inlined, even under
> LTO.  Another limitation is that reset_virtual_region_perms() may shatter the
> final superpage of .text depending on alignment.
> 
> This logic, and its downsides, are temporary until the patching infrastructure
> can be adjusted to not use CR0.WP.

In particular on this basis ...

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

