Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641783545C2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 19:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105489.201923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTSbI-0001wn-Qx; Mon, 05 Apr 2021 17:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105489.201923; Mon, 05 Apr 2021 17:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTSbI-0001w6-NE; Mon, 05 Apr 2021 17:01:20 +0000
Received: by outflank-mailman (input) for mailman id 105489;
 Mon, 05 Apr 2021 17:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0X+=JC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lTSbH-0001w1-6L
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 17:01:19 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efbfb9b8-6b8b-4728-bcf3-c18cd5d75080;
 Mon, 05 Apr 2021 17:01:18 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 135H12mh072531
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 5 Apr 2021 13:01:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 135H11Rr072530;
 Mon, 5 Apr 2021 10:01:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: efbfb9b8-6b8b-4728-bcf3-c18cd5d75080
Date: Mon, 5 Apr 2021 10:01:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Dario Faggioli <dfaggioli@suse.com>, Tim Deegan <tim@xen.org>,
        Roger Pau Monn?? <roger.pau@citrix.com>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 00/14] Use const whether we point to literal strings
 (take 1)
Message-ID: <YGtCTfw7WmOJPaa/@mattapan.m5p.com>
References: <20210405155713.29754-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Apr 05, 2021 at 04:56:59PM +0100, Julien Grall wrote:
> I am not aware of code trying to modify literal strings in Xen.
> However, there is a frequent use of non-const char * to point to
> literal strings. Given the size of the codebase, there is a risk
> to involuntarily introduce code that will modify literal strings.
> 
> Therefore it would be better to enforce using const when pointing
> to such strings. Both GCC and Clang provide an option to warn
> for such case (see -Wwrite-strings) and therefore could be used
> by Xen.
> 
> This series doesn't yet make use of -Wwrite-strings because
> the tree is not fully converted. Instead, it contains some easy
> and likely non-controversial use const in the code.
> 
> The major blockers to enable -Wwrite-strings are the following:
>     - xen/common/efi: union string is used in both const and
>     non-const situation. It doesn't feel right to specific one member
>     const and the other non-const.
>     - libxl: the major block is the flexarray framework as we would use
>     it with string (now const char*). I thought it would be possible to
>     make the interface const, but it looks like there are a couple of
>     places where we need to modify the content (such as in
>     libxl_json.c).
> 
> Ideally, I would like to have -Wwrite-strings unconditionally used
> tree-wide. But, some of the area may required some heavy refactoring.
> 
> One solution would be to enable it tree-wide but turned it off at a
> directroy/file level.
> 
> Any opinions?

I think doing such is a Good Idea(tm).  Adding consts adds opportunities
for greater optimization.  Both by compilers which can avoid extra
copies, and developers who then know they don't need to generate extra
copies to sacrific them to an API.  In particular the consts also
function as documentation.

So you're certainly not the only person who thinks additional consts
would be a good thing:

https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00132.html


Alas merely getting the two const patches into the latest release
apparently wasn't even worthy of response:

https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01040.html


I agree this should be done, though I'm aware many developers hate
bothering with constants.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



