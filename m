Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8EB2E0037
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57531.100717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQBV-0003l7-2Q; Mon, 21 Dec 2020 18:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57531.100717; Mon, 21 Dec 2020 18:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQBU-0003kh-Uk; Mon, 21 Dec 2020 18:45:28 +0000
Received: by outflank-mailman (input) for mailman id 57531;
 Mon, 21 Dec 2020 18:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krQBT-0003kc-H7
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:45:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fafa69c9-e0a0-4ae6-a17c-a857e5867cc3;
 Mon, 21 Dec 2020 18:45:26 +0000 (UTC)
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
X-Inumbo-ID: fafa69c9-e0a0-4ae6-a17c-a857e5867cc3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608576326;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=R3oppFae7+zIg50d/avPh3Wy3ntwoBp5EFrfl5Izyyo=;
  b=gHTkuh0vEY9JmRl2d5GvVSGllymsnLQAcc368FbdFhmaRawMw89fBNDF
   CDXY/obLTzIoQyZRqQsmzC7FSxW0UVg6nunobnLdQ0dLpZy8rXfadiB4A
   G0R91w1z5D7bwsVyb7Alxva3qIRIiiiw3juKh9t/KUswKDP0kz83zT9Z1
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KmrKu6tyXI44dlyjth7EerEZMBcoOmchz5Fv/c06MGRdHEIjQe5FSakBUmK3TBQcWKu8p6evJl
 HhT6sZByUk9fBTlVcyXUEaRrt8/871XfWdzPQO+QPfBBVnUhdW1gVe2A6WBoPiEAKAh0g8TYCu
 V3P5Ocy0g9tiA2QHeVGMJYmfiXiw429V1Qqnb90dKHPkF6Ci4dEhYcqZv1rsruz1zkjBI+pLe6
 mvFKIuE5AsYkZ1AjpgYhXhBa67r/3AvWiCv2xVLmg82DvzS513mfBcTIDFCiQ+fjDN3lFqSic0
 XIo=
X-SBRS: 5.2
X-MesageID: 33709337
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33709337"
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
Date: Mon, 21 Dec 2020 18:45:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 21/12/2020 18:36, Julien Grall wrote:
>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>       if ( init_status & INIT_watchdog )
>>           watchdog_domain_destroy(d);
>>   +    /* Must not hit a continuation in this context. */
>> +    ASSERT(domain_teardown(d) == 0);
> The ASSERT() will become a NOP in production build, so
> domain_teardown_down() will not be called.

Urgh - its not really a nop, but it's evaluation isn't symmetric between
debug and release builds.  I'll need an extra local variable.

>
> However, I think it would be better if we pass an extra argument to
> indicated wheter the code is allowed to preempt. This would make the
> preemption check more obvious in evtchn_destroy() compare to the
> current d->is_dying != DOMDYING_dead.

We can have a predicate if you'd prefer, but plumbing an extra parameter
is wasteful, and can only cause confusion if it is out of sync with
d->is_dying.

~Andrew

