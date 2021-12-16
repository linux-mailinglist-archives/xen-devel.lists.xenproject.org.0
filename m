Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BC47751A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248021.427756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsD5-0002Fz-D9; Thu, 16 Dec 2021 14:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248021.427756; Thu, 16 Dec 2021 14:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsD5-0002Dp-A0; Thu, 16 Dec 2021 14:58:19 +0000
Received: by outflank-mailman (input) for mailman id 248021;
 Thu, 16 Dec 2021 14:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxsD4-0002Di-Mm
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:58:18 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 996a2762-5e80-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 15:58:17 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43374)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxsCs-000OpR-8v (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 14:58:06 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7446F1FAC8;
 Thu, 16 Dec 2021 14:58:06 +0000 (GMT)
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
X-Inumbo-ID: 996a2762-5e80-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d8b5d939-0682-f8e1-9392-2ea9748282cf@srcf.net>
Date: Thu, 16 Dec 2021 14:58:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216092014.707-1-andrew.cooper3@citrix.com>
 <a6dab969-ce3e-a328-03bc-c27abbba0448@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/build: Fix `make cscope` rune
In-Reply-To: <a6dab969-ce3e-a328-03bc-c27abbba0448@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2021 14:00, Jan Beulich wrote:
> On 16.12.2021 10:20, Andrew Cooper wrote:
>> Second, and this way for a long time:
>>
>>   $ make cscope
>>   ( find arch/x86/include -name '*.h' -print; find include -name '*.h' -print;
>>   find xsm arch/x86 common drivers lib test -name '*.[chS]' -print ) >
>>   cscope.files
>>   cscope -k -b -q
>>   cscope: cannot find file arch/x86/efi/efi.h
>>   cscope: cannot find file arch/x86/efi/ebmalloc.c
>>   cscope: cannot find file arch/x86/efi/compat.c
>>   cscope: cannot find file arch/x86/efi/pe.c
>>   cscope: cannot find file arch/x86/efi/boot.c
>>   cscope: cannot find file arch/x86/efi/runtime.c
>>
>> This is caused by these being symlinks to common/efi.  Restrict all find runes
>> to `-type f` to skip symlinks, because common/efi/*.c are already listed.
> I have reservations here, albeit of theoretical nature as long as only
> the csope target is affected (simply because I don't use it): Make
> rules should really be independent of a dir entry being a real file or
> a symlink. I did run into problems with that already years ago when
> the shim was introduced. My arrangements heavily use symlinking, and
> any assumption on files being "real" ones will break this. At the very
> least symlink checks should be restricted to cover only relative ones;
> ideally one would distinguish ones staying within the tree vs ones
> reaching to the "outside".

all_sources is used exclusively for "tags" purposes; the
TAGS/tags/gtags/cscope targets.

Personally, I'd prefer there to not be symlinks in the first place.  The
EFI logic is unnecessarily complicated to navigate.

But the reality is that inter-xen/ symlinks for source files are also a
duplication as far as these `find` runes are concerned.

Apparently tags et al will follow symlinks, while there's no obviously
help online about cscope, other than "resolve your symlinks first".

In either case, you don't want to end up with both the regular path, and
the symlink, ending up in the file list.


I don't anticipate the usecase for all_source changing, nor the way we
symlink things, so I think sticking with `-type f` is the appropriate
action.

Furthermore, you really don't want a directory (e.g. include/foo.d )
getting into the file list either.

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -468,9 +468,8 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
>>  
>>  SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>  define all_sources
>> -    ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
>> -      find include -name '*.h' -print; \
>> -      find $(SUBDIRS) -name '*.[chS]' -print )
>> +    ( find include -type f -name '*.h' -print; \
>> +      find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>  endef
> I further wonder how use of $(TARGET_ARCH) can be correct here. Why
> would the enumeration of items here be limited to a particular arch?
> When you edit files in the source tree, everything should be covered.
> Restriction to a particular arch only makes sense in a build tree.

I'd say that's a matter of opinion.  There are times when I'd quite like
it to be all arch's, and there are other times when I'm very glad it's not.

Either way, I don't intend to address that rats nest in this patch.

~Andrew

