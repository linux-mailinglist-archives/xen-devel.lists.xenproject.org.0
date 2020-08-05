Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A352C23CBA3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:10:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3L3n-00088r-5J; Wed, 05 Aug 2020 15:10:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3L3l-00088m-KA
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:10:29 +0000
X-Inumbo-ID: b62ff4a0-1d21-46da-8135-dcc0228eaac0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b62ff4a0-1d21-46da-8135-dcc0228eaac0;
 Wed, 05 Aug 2020 15:10:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87E42AF9F;
 Wed,  5 Aug 2020 15:10:44 +0000 (UTC)
Subject: Re: [PATCH] x86/ioapic: Improve code generation for
 __io_apic_{read,write}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200805135418.31528-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d7d2f7a-b37a-4487-5626-4861953042eb@suse.com>
Date: Wed, 5 Aug 2020 17:10:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200805135418.31528-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 15:54, Andrew Cooper wrote:
> The write into REGSEL prevents the optimiser from reusing the address
> calculation, forcing it to be calcualted twice.
> 
> The calculation itself is quite expensive.  Pull it out into a local varaible.
> 
> Bloat-o-meter reports:
>   add/remove: 0/0 grow/shrink: 0/26 up/down: 0/-1527 (-1527)
> 
> Also correct the register type, which is uint32_t, not int.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

