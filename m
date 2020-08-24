Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B824FE57
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAC2s-0007Ys-5l; Mon, 24 Aug 2020 12:57:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAC2q-0007Yl-Dp
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:57:52 +0000
X-Inumbo-ID: e6245241-34ee-4130-8b92-751521bde20a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6245241-34ee-4130-8b92-751521bde20a;
 Mon, 24 Aug 2020 12:57:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9079DAD7F;
 Mon, 24 Aug 2020 12:58:20 +0000 (UTC)
Subject: Re: [PATCH v2 5/5] x86: simplify is_guest_l2_slot()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
 <08de75ba-36e3-5860-bbd2-d95bc48bff74@suse.com>
 <f1df42f2-2761-7858-6257-28f3e047aba5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49cc6680-8eaa-69f0-e389-e42856a7829a@suse.com>
Date: Mon, 24 Aug 2020 14:57:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f1df42f2-2761-7858-6257-28f3e047aba5@citrix.com>
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

On 24.08.2020 14:50, Andrew Cooper wrote:
> On 24/08/2020 13:35, Jan Beulich wrote:
>> is_pv_32bit_domain() has become expensive, and its use here is
>> redundant: Only 32-bit guests would ever get PGT_pae_xen_l2 set on
>> their L2 page table pages anyway.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Possibly "if some other error does lead to PGT_pae_xen_l2 ending up
> anywhere else, we still don't want to allow a guest to control the
> entries" ?

I've added this, but I'm not fully convinced it's a meaningful
statement: We only ever invoke the macro for L2 pages, so
"anywhere else" to me meaning more than just L2 pages of 64-bit
guests looks to render the whole thing not very precise.

> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

