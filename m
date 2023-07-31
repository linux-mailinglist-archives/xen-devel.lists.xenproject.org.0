Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1894769145
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572839.896910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQP0R-0007qH-4H; Mon, 31 Jul 2023 09:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572839.896910; Mon, 31 Jul 2023 09:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQP0R-0007oD-1S; Mon, 31 Jul 2023 09:15:59 +0000
Received: by outflank-mailman (input) for mailman id 572839;
 Mon, 31 Jul 2023 09:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQP0P-0007o7-7a
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:15:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dafcc733-2f82-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 11:15:56 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C8F7B4EE0737;
 Mon, 31 Jul 2023 11:15:55 +0200 (CEST)
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
X-Inumbo-ID: dafcc733-2f82-11ee-b254-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 31 Jul 2023 11:15:55 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH 2/3] x86/entry: Rename the exception entrypoints
In-Reply-To: <20230728194320.3082120-3-andrew.cooper3@citrix.com>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
 <20230728194320.3082120-3-andrew.cooper3@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <49c6e1314578682cb1ddc6d7733b7c9b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 28/07/2023 21:43, Andrew Cooper wrote:
> This makes the names match the architectural short names that we use
> elsewhere.  This avoids 'debug' in particular from being a global 
> symbol
> shadowed by many local parameter names.
> 
> Remove the DECLARE_TRAP_HANDLER{,_CONST}() infrastructure.  Only 
> NMI/#MC are
> referenced externally (and NMI will cease to be soon, as part of adding 
> FRED
> support).  Move the entrypoint declarations into the respective traps.c 
> where
> they're used, rather than keeping them visible across ~all of Xen.
> 
> Drop the long-stale comment at the top of init_idt_traps().  It's 
> mostly
> discussing a 32bit Xen, and bogus otherwise as it's impossible to use 
> trap
> gates correctly for these purposes.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> This is half of a previous patch, cut down to just the rename and 
> header file
> cleanup.
> ---
>  xen/arch/x86/include/asm/processor.h | 34 +-------------
>  xen/arch/x86/pv/traps.c              |  2 +
>  xen/arch/x86/traps.c                 | 70 +++++++++++++++++-----------
>  xen/arch/x86/x86_64/entry.S          | 36 +++++++-------
>  4 files changed, 64 insertions(+), 78 deletions(-)
> 
With respect to Rule 5.3:
Tested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

