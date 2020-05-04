Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2601C3AEC
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 15:09:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVapb-0003X8-H4; Mon, 04 May 2020 13:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVapa-0003X3-Ai
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 13:08:22 +0000
X-Inumbo-ID: 5431174a-8e08-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5431174a-8e08-11ea-9887-bc764e2007e4;
 Mon, 04 May 2020 13:08:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D240ABD0;
 Mon,  4 May 2020 13:08:22 +0000 (UTC)
Subject: Re: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
Date: Mon, 4 May 2020 15:08:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-3-andrew.cooper3@citrix.com>
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

On 02.05.2020 00:58, Andrew Cooper wrote:
> For one, they render the vector in a different base.
> 
> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
> mnemonic, which starts bringing the code/diagnostics in line with the Intel
> and AMD manuals.

For this "bringing in line" purpose I'd like to see whether you could
live with some adjustments to how you're currently doing things:
- NMI is nowhere prefixed by #, hence I think we'd better not do so
  either; may require embedding the #-es in the names[] table, or not
  using N() for NMI
- neither Coprocessor Segment Overrun nor vector 0x0f have a mnemonic
  and hence I think we shouldn't invent one; just treat them like
  other reserved vectors (of which at least vector 0x09 indeed is one
  on x86-64)?

Jan

