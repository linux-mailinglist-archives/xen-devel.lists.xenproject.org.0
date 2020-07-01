Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BB210B01
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqbpC-0006GD-He; Wed, 01 Jul 2020 12:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqbpB-0006G7-FI
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 12:26:49 +0000
X-Inumbo-ID: 226b6db2-bb96-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 226b6db2-bb96-11ea-bca7-bc764e2007e4;
 Wed, 01 Jul 2020 12:26:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B361ADE2;
 Wed,  1 Jul 2020 12:26:48 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/spec-ctrl: Protect against CALL/JMP
 straight-line speculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200701115842.18583-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41b49d79-e0fa-161a-bb27-a9a2ccf361f5@suse.com>
Date: Wed, 1 Jul 2020 14:26:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701115842.18583-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.07.2020 13:58, Andrew Cooper wrote:
> Some x86 CPUs speculatively execute beyond indirect CALL/JMP instructions.
> 
> With CONFIG_INDIRECT_THUNK / Retpolines, indirect CALL/JMP instructions are
> converted to direct CALL/JMP's to __x86_indirect_thunk_REG(), leaving just a
> handful of indirect JMPs implementing those stubs.
> 
> There is no architectrual execution beyond an indirect JMP, so use INT3 as
> recommended by vendors to halt speculative execution.  This is shorter than
> LFENCE (which would also work fine), but also shows up in logs if we do
> unexpected execute them.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

