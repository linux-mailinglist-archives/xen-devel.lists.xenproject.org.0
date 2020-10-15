Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C628EFE0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 12:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7201.18843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0Ci-00034M-Tc; Thu, 15 Oct 2020 10:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7201.18843; Thu, 15 Oct 2020 10:09:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0Ci-00033x-Q9; Thu, 15 Oct 2020 10:09:48 +0000
Received: by outflank-mailman (input) for mailman id 7201;
 Thu, 15 Oct 2020 10:09:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kT0Ch-00033s-BT
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:09:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b77c1c09-6d7d-46ef-92aa-93881a7f9fdd;
 Thu, 15 Oct 2020 10:09:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59A3FB22C;
 Thu, 15 Oct 2020 10:09:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kT0Ch-00033s-BT
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:09:47 +0000
X-Inumbo-ID: b77c1c09-6d7d-46ef-92aa-93881a7f9fdd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b77c1c09-6d7d-46ef-92aa-93881a7f9fdd;
	Thu, 15 Oct 2020 10:09:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602756585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwWbQztlm/3z6DQKZjph3Kd9N835MB1UnRBKmLo9dQs=;
	b=uwGwia/R9kSihlxEsJSjC3o5dJL0ZisW8mWaqta6L1NcrwnW1FF5kDEoWCnogldhIOJK8t
	RfT7paiyaX+I81wfFBps+gSMoQvcOjslpI/d5AR1oQV5Cre91zAXTCBhlgWV2CzgAztewn
	mERGWXiPzB0VqNMF57Ve1QYb4W31poo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59A3FB22C;
	Thu, 15 Oct 2020 10:09:45 +0000 (UTC)
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
Date: Thu, 15 Oct 2020 12:09:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.2020 09:58, Jürgen Groß wrote:
> After a short discussion on IRC yesterday I promised to send a mail
> how I think we could get rid of creating dynamic links especially
> for header files in the Xen build process.
> 
> This will require some restructuring, the amount will depend on the
> selected way to proceed:
> 
> - avoid links completely, requires more restructuring
> - avoid only dynamically created links, i.e. allowing some static
>    links which are committed to git

While I like the latter better, I'd like to point out that not all
file systems support symlinks, and hence the repo then couldn't be
stored on (or the tarball expanded onto) such a file system. Note
that this may be just for viewing purposes - I do this typically at
home -, i.e. there's no resulting limitation from the build process
needing symlinks. Similarly, once we fully support out of tree
builds, there wouldn't be any restriction from this as long as just
the build tree is placed on a capable file system.

As a result I'd like to propose variant 2´: Reduce the number of
dynamically created symlinks to a minimum. This said, I have to
admit that I haven't really understood yet why symlinks are bad.
They exist for exactly such purposes, I would think.

> The difference between both variants is affecting the public headers
> in xen/include/public/: avoiding even static links would require to
> add another directory or to move those headers to another place in the
> tree (either use xen/include/public/xen/, or some other path */xen),
> leading to the need to change all #include statements in the hypervisor
> using <public/...> today.
> 
> The need for the path to have "xen/" is due to the Xen library headers
> (which are installed on user's machines) are including the public
> hypervisor headers via "#include <xen/...>" and we can't change that
> scheme. A static link can avoid this problem via a different path, but
> without any link we can't do that.
> 
> Apart from that decision, lets look which links are created today for
> accessing the header files (I'll assume my series putting the library
> headers to tools/include will be taken, so those links being created
> in staging today are not mentioned) and what can be done to avoid them:
> 
> - xen/include/asm -> xen/include/asm-<arch>:
>    Move all headers from xen/include/asm-<arch> to
>    xen/arch/<arch>/include/asm and add that path via "-I" flag to CFLAGS.
>    This has the other nice advantages that most architecture specific
>    files are now in xen/arch (apart from the public headers) and that we
>    can even add generic fallback headers in xen/include/asm in case an
>    arch doesn't need a specific header file.

Iirc Andrew suggested years ago that we follow Linux in this regard
(and XTF already does). My only concern here is the churn this will
cause for backports.

> - xen/arch/<arch>/efi/*.[ch] -> xen/common/efi/*.[ch]:
>    Use vpath for the *.c files and the "-I" flag for adding common/efi to
>    the include path in the xen/arch/<arch>/efi/Makefile.

Fine with me.

> - tools/include/xen/asm -> xen/include/asm-<arch>:
>    Add "-Ixen/arch/<arch>/include" to the CFLAGS. It might be a nice idea
>    to move the headers needed by the tools to xen/arch/include/tools/asm
>    and use "-Ixen/arch/<arch>/include/tools" instead, but this would
>    require either the same path added to the hypervisor's CFLAGS or a
>    modification of the related #include statements.

Separating headers intended for tools consumption is okay with me,
but I dislike the tools/ infix in the path you suggest. Since there
can't possibly be any shared prototypes, how about defs/ or some
such not specifically naming either of the consuming components
(and thus visually excluding the other)?

Of course, the further asm/ underneath is kind of ugly because of
being largely unnecessary. Perhaps we could have just
xen/arch/include/defs/ and use #include <defs/xyz.h>?

> - tools/include/xen/foreign -> tools/include/xen-foreign:
>    Get rid of tools/include/xen-foreign and generate the headers directly
>    in xen/include/public/foreign instead.

Except that conceptually building in tools/ would better not alter
the xen/ subtree in any way.

> - tools/include/xen/sys -> tools/include/xen-sys/<OS>:
>    Move the headers from tools/include/xen-sys/<OS> to
>    tools/include/<OS>/xen/sys/ and add the appropriate path to CFLAGS.

Not very nice imo because of the otherwise pointless intermediate
directories, but if we truly need to minimize symlink usage, then
so be it.

> - tools/include/xen/lib/<arch>/* -> xen/include/xen/lib/<arch>/*:
>    Move xen/include/xen/lib/<arch> to xen/include/tools/lib/<arch> and
>    add "-Ixen/include/tools" to the CFLAGS of tools.

Why not -Ixen/include/xen without any movement? Perhaps because
-Ixen/include/tools wouldn't work either, due to code using

#include <xen/lib/<arch>/xyz.h>

? I.e. you really mean Move xen/include/xen/lib/<arch> to
xen/include/tools/xen/lib/<arch>? Not very nice. I have to admit
I can't see why the header in xen/include/xen/lib/<arch>/ don't
use

#include "xyz.h"

But then this would leave the problem with xen/lib/<arch>/*.c
using similar #include-s. Would dropping xen/ from the paths
perhaps help, moving xen/include/xen/lib/* to xen/include/lib/*?
Istr suggesting this when the lib/ subtrees were introduced ...

> - tools/include/xen/libelf/* -> xen/include/xen/*:
>    Move the affected headers from xen/include/xen to
>    xen/include/tools/libelf and reuse the above set CFLAGS.

Why not xen/include/libelf/ or xen/include/lib/elf/?
libelf-private.h has distinct #include-s for Xen and the tools
anyway. All that's needed is that these headers don't sit in a
directory where headers also live which are not supposed to be
visible.

Jan

