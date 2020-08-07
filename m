Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5E23EB71
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 12:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3zYU-0000zg-Lj; Fri, 07 Aug 2020 10:24:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3zYT-0000zb-O3
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 10:24:53 +0000
X-Inumbo-ID: 1ee3a185-a805-43b6-b43b-bdb466294d55
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ee3a185-a805-43b6-b43b-bdb466294d55;
 Fri, 07 Aug 2020 10:24:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12E2FAB89;
 Fri,  7 Aug 2020 10:25:10 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86: don't maintain compat M2P when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
 <52b4f80f-9967-fae9-ce85-c69bf3b6e22d@citrix.com>
 <9cf5d060-3fee-db3c-8455-e09da998594b@suse.com>
Message-ID: <50650e99-e8c9-d442-79ba-a37130a7a3bf@suse.com>
Date: Fri, 7 Aug 2020 12:24:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9cf5d060-3fee-db3c-8455-e09da998594b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 12:12, Jan Beulich wrote:
> On 06.08.2020 21:16, Andrew Cooper wrote:
>> On 06/08/2020 10:28, Jan Beulich wrote:
>>> An alternative place for opt_pv32.h would seem to be asm-x86/config.h.
>>
>> Oh - yes please.  I think that would be better overall.
> 
> Done.

Now that I'm trying to build the result: There's an immediate
downside - we can't use int8_t in config.h, so I'll have to
switch to using signed char instead.

Jan

