Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A492EEE69
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 09:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63217.112260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxmw1-0006CJ-D6; Fri, 08 Jan 2021 08:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63217.112260; Fri, 08 Jan 2021 08:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxmw1-0006Bu-A4; Fri, 08 Jan 2021 08:15:49 +0000
Received: by outflank-mailman (input) for mailman id 63217;
 Fri, 08 Jan 2021 08:15:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IAg+=GL=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1kxmvz-0006Bo-5E
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 08:15:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17f945e5-5c7e-4205-af65-3574647ce260;
 Fri, 08 Jan 2021 08:15:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0343EACAF;
 Fri,  8 Jan 2021 08:15:44 +0000 (UTC)
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
X-Inumbo-ID: 17f945e5-5c7e-4205-af65-3574647ce260
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Date: Fri, 8 Jan 2021 09:15:43 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Josh Poimboeuf <jpoimboe@redhat.com>
cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH 3/3] objtool: Support stack layout changes in
 alternatives
In-Reply-To: <20210107181835.rc7lutdqujf4mead@treble>
Message-ID: <alpine.LSU.2.21.2101080914230.6998@pobox.suse.cz>
References: <cover.1608700338.git.jpoimboe@redhat.com> <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com> <alpine.LSU.2.21.2101071417440.31250@pobox.suse.cz> <20210107181835.rc7lutdqujf4mead@treble>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> That comment is indeed now obsolete.  I can squash something like so:
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 81d56fdef1c3..ce67437aaf3f 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -958,21 +958,8 @@ static int add_call_destinations(struct objtool_file *file)
>  }
>  
>  /*
> - * The .alternatives section requires some extra special care, over and above
> - * what other special sections require:
> - *
> - * 1. Because alternatives are patched in-place, we need to insert a fake jump
> - *    instruction at the end so that validate_branch() skips all the original
> - *    replaced instructions when validating the new instruction path.
> - *
> - * 2. An added wrinkle is that the new instruction length might be zero.  In
> - *    that case the old instructions are replaced with noops.  We simulate that
> - *    by creating a fake jump as the only new instruction.
> - *
> - * 3. In some cases, the alternative section includes an instruction which
> - *    conditionally jumps to the _end_ of the entry.  We have to modify these
> - *    jumps' destinations to point back to .text rather than the end of the
> - *    entry in .altinstr_replacement.
> + * The .alternatives section requires some extra special care over and above
> + * other special sections because alternatives are patched in place.
>   */
>  static int handle_group_alt(struct objtool_file *file,
>  			    struct special_alt *special_alt,

Looks good to me.

Miroslav

