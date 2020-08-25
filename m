Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1525137A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 09:40:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kATYt-0004ii-Be; Tue, 25 Aug 2020 07:40:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kATYs-0004g7-7J
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 07:40:06 +0000
X-Inumbo-ID: fa0c7f9f-6e1e-4234-b5c0-656f538d8034
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa0c7f9f-6e1e-4234-b5c0-656f538d8034;
 Tue, 25 Aug 2020 07:40:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E92DAE96;
 Tue, 25 Aug 2020 07:40:34 +0000 (UTC)
Subject: Re: [PATCH] xen/mm: Introduce CONFIG_M2P and provide common fallback
 logic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200824181524.1111-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01c0aa01-513b-05ac-e44d-8deaf11e2b95@suse.com>
Date: Tue, 25 Aug 2020 09:40:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824181524.1111-1-andrew.cooper3@citrix.com>
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

On 24.08.2020 20:15, Andrew Cooper wrote:
> I'm pretty sure the mfn_to_gmfn() stub is bogus before and after this change.
> The two uses in common code are getdomaininfo and in memory_exchange(), which
> result in junk.

It's been a long time back that I think I did suggest to restrict
memory_exchange() to non-translated guests. I don't recall what
the arguments against this were, but I'm quite sure it wasn't
merely "it alters the ABI for such guests".

Jan

