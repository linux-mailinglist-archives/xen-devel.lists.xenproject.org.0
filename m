Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2835EE07
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 09:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110297.210542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZjQ-0004PF-8L; Wed, 14 Apr 2021 07:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110297.210542; Wed, 14 Apr 2021 07:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZjQ-0004Oq-4k; Wed, 14 Apr 2021 07:14:36 +0000
Received: by outflank-mailman (input) for mailman id 110297;
 Wed, 14 Apr 2021 07:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWZjO-0004Ol-KI
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 07:14:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51ee62b7-55f4-4436-94db-68291943ca7b;
 Wed, 14 Apr 2021 07:14:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EB60AC87;
 Wed, 14 Apr 2021 07:14:32 +0000 (UTC)
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
X-Inumbo-ID: 51ee62b7-55f4-4436-94db-68291943ca7b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618384472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdWr5/U5TTPs0RLXGmwsFsCGeIhFI3JzXBqGgU9LIFU=;
	b=ali0RsZLwqKGWLkfzCwjtn794SgIaFKWK2MRzorIKkO3rh4YqNuNIjvDmurEAYjKiXjz5/
	yq0N9AdKq10IuntufVJpfndiSdNGU88QolgaDcHKuELNHAZJJdqKRZc99692Xx1NjfC6Vf
	th8T3RcxxBLIWRhV9cgFodC8zkyFGOM=
Subject: Re: [PATCH v3] tools: create libxensaverestore
To: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210413172028.29373-1-olaf@aepfle.de>
 <5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c342ee1-c275-5cd2-8129-e384e0bcd827@suse.com>
Date: Wed, 14 Apr 2021 09:14:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <5d483005-c6ca-88f1-0469-dd4a23c6752d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.04.2021 07:46, Juergen Gross wrote:
> On 13.04.21 19:20, Olaf Hering wrote:
>> Move all save/restore related code from libxenguest.so into a separate
>> library libxensaverestore.so. The only consumer is libxl-save-helper.
>> There is no need to have the moved code mapped all the time in binaries
>> where libxenguest.so is used.
>>
>> According to size(1) the change is:
>>     text	   data	    bss	    dec	    hex	filename
>>   187183	   4304	     48	 191535	  2ec2f	guest/libxenguest.so.4.15.0
>>
>>   124106	   3376	     48	 127530	  1f22a	guest/libxenguest.so.4.15.0
>>    67841	   1872	      8	  69721	  11059	saverestore/libxensaverestore.so.4.15.0
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>> v3:
>> - repost in time for 4.16
>> v2:
>> - copy also license header
>> - move xg_nomigrate.c
>> - add size(1) output to commit msg
>> - remove change from libxl_create.c
>>
>>   .gitignore                                    |   2 +
>>   tools/include/xenguest.h                      | 186 ----------------
>>   tools/include/xensaverestore.h                | 208 ++++++++++++++++++
>>   tools/libs/Makefile                           |   1 +
>>   tools/libs/guest/Makefile                     |  11 -
>>   tools/libs/guest/xg_offline_page.c            |   1 -
>>   tools/libs/light/Makefile                     |   4 +-
>>   tools/libs/light/libxl_internal.h             |   1 +
>>   tools/libs/light/libxl_save_helper.c          |   1 +
>>   tools/libs/light/libxl_save_msgs_gen.pl       |   2 +-
>>   tools/libs/saverestore/Makefile               |  38 ++++
>>   .../{guest => saverestore}/xg_nomigrate.c     |   0
>>   .../{guest => saverestore}/xg_save_restore.h  |   2 -
>>   .../{guest => saverestore}/xg_sr_common.c     |   0
>>   .../{guest => saverestore}/xg_sr_common.h     |  12 +
>>   .../{guest => saverestore}/xg_sr_common_x86.c |   0
>>   .../{guest => saverestore}/xg_sr_common_x86.h |   0
>>   .../xg_sr_common_x86_pv.c                     |   0
>>   .../xg_sr_common_x86_pv.h                     |   0
>>   .../{guest => saverestore}/xg_sr_restore.c    |   0
>>   .../xg_sr_restore_x86_hvm.c                   |   0
>>   .../xg_sr_restore_x86_pv.c                    |   0
>>   .../libs/{guest => saverestore}/xg_sr_save.c  |   0
>>   .../xg_sr_save_x86_hvm.c                      |   0
>>   .../xg_sr_save_x86_pv.c                       |   0
>>   .../xg_sr_stream_format.h                     |   0
>>   tools/libs/uselibs.mk                         |   4 +-
>>   27 files changed, 269 insertions(+), 204 deletions(-)
>>   create mode 100644 tools/include/xensaverestore.h
>>   create mode 100644 tools/libs/saverestore/Makefile
>>   rename tools/libs/{guest => saverestore}/xg_nomigrate.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_save_restore.h (98%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common.h (98%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common_x86.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common_x86.h (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common_x86_pv.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_common_x86_pv.h (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_restore.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_restore_x86_hvm.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_restore_x86_pv.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_save.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_save_x86_hvm.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_save_x86_pv.c (100%)
>>   rename tools/libs/{guest => saverestore}/xg_sr_stream_format.h (100%)
> 
> What about dropping the "xg_" prefix from the filenames?

To be honest, dropping xg_ here should not even be under question.
sr_ is what I would think should also be dropped, but which may
be controversial, seeing that some (but not all) of the libraries
under tools/libs/ use such redundant (with their directory's name)
prefixes. Besides being longer to read/write, these unnecessary
prefixes hamper name completion mechanisms.

Jan

