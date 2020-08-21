Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C658024D956
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 18:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k99W2-0005hG-RF; Fri, 21 Aug 2020 16:03:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k99W1-0005hB-KU
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 16:03:41 +0000
X-Inumbo-ID: e509de17-ee7a-439d-b8c6-a12cf2e71bfc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e509de17-ee7a-439d-b8c6-a12cf2e71bfc;
 Fri, 21 Aug 2020 16:03:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B506BB6E9;
 Fri, 21 Aug 2020 16:04:07 +0000 (UTC)
Subject: Re: [PATCH] Add additional symbols to xen-syms.map
To: Michael Kurth <mku@amazon.de>, xen-devel@lists.xenproject.org
Cc: Michael Kurth <mku@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, wipawel@xen.org,
 wipawel@amazon.de
References: <20200821151045.92022-1-mku@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08ef4d53-7b39-29cd-c62f-3d7074af7c66@suse.com>
Date: Fri, 21 Aug 2020 18:03:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821151045.92022-1-mku@amazon.de>
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

On 21.08.2020 17:10, Michael Kurth wrote:
> From: Michael Kurth <mku@amazon.com>
> 
> Add "all_symbols" to all /tools/symbols calls so that
> xen-syms.map lists all symbols and not only .text section
> symbols. This change enhances debugging and livepatch
> capabilities.

With

ifdef CONFIG_LIVEPATCH
all_symbols = --all-symbols
ifdef CONFIG_FAST_SYMBOL_LOOKUP
all_symbols = --all-symbols --sort-by-name
endif
else
all_symbols =
endif

I agree this helps the CONFIG_LIVEPATCH case, but I doubt
you really want --sort-by-name here, and to also cover debugging
(as you say) imo you want --all-symbols, not $(all_symbols) in
the places that you change.

Further, seeing that the places you change are exactly all the
ones using --xensyms, I wonder whether the tool shouldn't imply
--all-symbols from --xensyms.

Jan

