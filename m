Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CC28EE05
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 09:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7124.18683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSy9K-0006tu-D1; Thu, 15 Oct 2020 07:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7124.18683; Thu, 15 Oct 2020 07:58:10 +0000
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
	id 1kSy9K-0006tV-9P; Thu, 15 Oct 2020 07:58:10 +0000
Received: by outflank-mailman (input) for mailman id 7124;
 Thu, 15 Oct 2020 07:58:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSy9I-0006tP-FJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:58:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9824c79e-ac98-4216-9ceb-b705fe76e8d2;
 Thu, 15 Oct 2020 07:58:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C1D0AC19;
 Thu, 15 Oct 2020 07:58:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSy9I-0006tP-FJ
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:58:08 +0000
X-Inumbo-ID: 9824c79e-ac98-4216-9ceb-b705fe76e8d2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9824c79e-ac98-4216-9ceb-b705fe76e8d2;
	Thu, 15 Oct 2020 07:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602748686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GIavv+C3ClerGiLM1iPKE2R/dfHndET1wtp3fGCaptQ=;
	b=ouqSd2WeDAINZH7A7PXauGYc+KvKaD1FcIph5lHhF1+bZFeZcwmmRPyX9xW7bMpKsEmJZC
	XwtqfmUJs12YrFoHAhIRAQzr6OD3JgBvqnFIFev9NXHwmbSXI3/BJvLJQhjUzfcTi5mFyM
	3pK5DJVTdoBjehpuOZrUjfaUuEbebqM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1C1D0AC19;
	Thu, 15 Oct 2020 07:58:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Getting rid of (many) dynamic link creations in the xen build
Message-ID: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
Date: Thu, 15 Oct 2020 09:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

After a short discussion on IRC yesterday I promised to send a mail
how I think we could get rid of creating dynamic links especially
for header files in the Xen build process.

This will require some restructuring, the amount will depend on the
selected way to proceed:

- avoid links completely, requires more restructuring
- avoid only dynamically created links, i.e. allowing some static
   links which are committed to git

The difference between both variants is affecting the public headers
in xen/include/public/: avoiding even static links would require to
add another directory or to move those headers to another place in the
tree (either use xen/include/public/xen/, or some other path */xen),
leading to the need to change all #include statements in the hypervisor
using <public/...> today.

The need for the path to have "xen/" is due to the Xen library headers
(which are installed on user's machines) are including the public
hypervisor headers via "#include <xen/...>" and we can't change that
scheme. A static link can avoid this problem via a different path, but
without any link we can't do that.

Apart from that decision, lets look which links are created today for
accessing the header files (I'll assume my series putting the library
headers to tools/include will be taken, so those links being created
in staging today are not mentioned) and what can be done to avoid them:

- xen/include/asm -> xen/include/asm-<arch>:
   Move all headers from xen/include/asm-<arch> to
   xen/arch/<arch>/include/asm and add that path via "-I" flag to CFLAGS.
   This has the other nice advantages that most architecture specific
   files are now in xen/arch (apart from the public headers) and that we
   can even add generic fallback headers in xen/include/asm in case an
   arch doesn't need a specific header file.

- xen/arch/<arch>/efi/*.[ch] -> xen/common/efi/*.[ch]:
   Use vpath for the *.c files and the "-I" flag for adding common/efi to
   the include path in the xen/arch/<arch>/efi/Makefile.

- tools/include/xen/asm -> xen/include/asm-<arch>:
   Add "-Ixen/arch/<arch>/include" to the CFLAGS. It might be a nice idea
   to move the headers needed by the tools to xen/arch/include/tools/asm
   and use "-Ixen/arch/<arch>/include/tools" instead, but this would
   require either the same path added to the hypervisor's CFLAGS or a
   modification of the related #include statements.

- tools/include/xen/foreign -> tools/include/xen-foreign:
   Get rid of tools/include/xen-foreign and generate the headers directly
   in xen/include/public/foreign instead.

- tools/include/xen/sys -> tools/include/xen-sys/<OS>:
   Move the headers from tools/include/xen-sys/<OS> to
   tools/include/<OS>/xen/sys/ and add the appropriate path to CFLAGS.

- tools/include/xen/lib/<arch>/* -> xen/include/xen/lib/<arch>/*:
   Move xen/include/xen/lib/<arch> to xen/include/tools/lib/<arch> and
   add "-Ixen/include/tools" to the CFLAGS of tools.

- tools/include/xen/libelf/* -> xen/include/xen/*:
   Move the affected headers from xen/include/xen to
   xen/include/tools/libelf and reuse the above set CFLAGS.

- tools/include/xen/xsm -> xen/include/public/xsm:
   No longer needed (see next item in the list).

- tools/include/xen/* -> xen/include/public/*:
   See above discussion of the two possible variants. Either add a static
   link in git from tools/include/xen -> xen/include/public (now possible
   with all links below tools/include/xen gone), or add
   "-Ixen/include/public" to the tools' CFLAGS.

- stubdom/include/* -> tools/include/*:
   Set "-Itools/include -Itools/include/MiniOS" for the CFLAGS.

I hope I have covered everything.

Thoughts (especially about the two possible variants)?


Juergen

