Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B028E0B2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 14:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6743.17741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSg96-0000NP-Ui; Wed, 14 Oct 2020 12:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6743.17741; Wed, 14 Oct 2020 12:44:44 +0000
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
	id 1kSg96-0000Mm-RL; Wed, 14 Oct 2020 12:44:44 +0000
Received: by outflank-mailman (input) for mailman id 6743;
 Wed, 14 Oct 2020 12:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSg94-0000Me-Kh
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:44:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a1fff51-42f0-48cd-a768-9bc445c83ded;
 Wed, 14 Oct 2020 12:44:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDC75ABBD;
 Wed, 14 Oct 2020 12:44:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSg94-0000Me-Kh
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 12:44:42 +0000
X-Inumbo-ID: 1a1fff51-42f0-48cd-a768-9bc445c83ded
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a1fff51-42f0-48cd-a768-9bc445c83ded;
	Wed, 14 Oct 2020 12:44:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602679480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Frn5JJNcjXrcLoxE8yQAHpNjUmsAd7Zt/Oc17SaPxXU=;
	b=Amh5CiTVXhnSBzDFhPIuicFSYtdAmbQzov7I8ZOMdqmDqVGkkgjW5gikOgyUjgEMZkc8vA
	7f1/OaVtbac+SjFBOl79K/uqQ9gAm5rbgVtndlpIGt0H2M7EZzfxNpT32UPYUwDQ372omS
	y23hEz5fZIgHwSY0sXaTcZ/CsN1/mkI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BDC75ABBD;
	Wed, 14 Oct 2020 12:44:40 +0000 (UTC)
Subject: Re: [PATCH 0/3] tools: avoid creating symbolic links during make
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20201002142214.3438-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3ce2be80-f4e8-9c33-f14d-26c021db6fba@suse.com>
Date: Wed, 14 Oct 2020 14:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping?

On 02.10.20 16:22, Juergen Gross wrote:
> The rework of the Xen library build introduced creating some additional
> symbolic links during the build process.
> 
> This series is undoing that by moving all official Xen library headers
> to tools/include and by using include paths and the vpath directive
> when access to some private headers of another directory is needed.
> 
> Juergen Gross (3):
>    tools/libs: move official headers to common directory
>    tools/libs/guest: don't use symbolic links for xenctrl headers
>    tools/libs/store: don't use symbolic links for external files
> 
>   .gitignore                                    |  5 ++--
>   stubdom/mini-os.mk                            |  2 +-
>   tools/Rules.mk                                |  5 ++--
>   tools/{libs/vchan => }/include/libxenvchan.h  |  0
>   tools/{libs/light => }/include/libxl.h        |  0
>   tools/{libs/light => }/include/libxl_event.h  |  0
>   tools/{libs/light => }/include/libxl_json.h   |  0
>   tools/{libs/light => }/include/libxl_utils.h  |  0
>   tools/{libs/light => }/include/libxl_uuid.h   |  0
>   tools/{libs/util => }/include/libxlutil.h     |  0
>   tools/{libs/call => }/include/xencall.h       |  0
>   tools/{libs/ctrl => }/include/xenctrl.h       |  0
>   .../{libs/ctrl => }/include/xenctrl_compat.h  |  0
>   .../devicemodel => }/include/xendevicemodel.h |  0
>   tools/{libs/evtchn => }/include/xenevtchn.h   |  0
>   .../include/xenforeignmemory.h                |  0
>   tools/{libs/gnttab => }/include/xengnttab.h   |  0
>   tools/{libs/guest => }/include/xenguest.h     |  0
>   tools/{libs/hypfs => }/include/xenhypfs.h     |  0
>   tools/{libs/stat => }/include/xenstat.h       |  0
>   .../compat => include/xenstore-compat}/xs.h   |  0
>   .../xenstore-compat}/xs_lib.h                 |  0
>   tools/{libs/store => }/include/xenstore.h     |  0
>   tools/{xenstore => include}/xenstore_lib.h    |  0
>   .../{libs/toolcore => }/include/xentoolcore.h |  0
>   .../include/xentoolcore_internal.h            |  0
>   tools/{libs/toollog => }/include/xentoollog.h |  0
>   tools/libs/call/Makefile                      |  3 ---
>   tools/libs/ctrl/Makefile                      |  3 ---
>   tools/libs/devicemodel/Makefile               |  3 ---
>   tools/libs/evtchn/Makefile                    |  2 --
>   tools/libs/foreignmemory/Makefile             |  3 ---
>   tools/libs/gnttab/Makefile                    |  3 ---
>   tools/libs/guest/Makefile                     | 12 ++-------
>   tools/libs/hypfs/Makefile                     |  3 ---
>   tools/libs/libs.mk                            | 10 +++----
>   tools/libs/light/Makefile                     | 27 +++++++++----------
>   tools/libs/stat/Makefile                      |  2 --
>   tools/libs/store/Makefile                     | 15 +++--------
>   tools/libs/toolcore/Makefile                  |  9 +++----
>   tools/libs/toollog/Makefile                   |  2 --
>   tools/libs/util/Makefile                      |  3 ---
>   tools/libs/vchan/Makefile                     |  3 ---
>   tools/ocaml/libs/xentoollog/Makefile          |  2 +-
>   tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
>   45 files changed, 32 insertions(+), 87 deletions(-)
>   rename tools/{libs/vchan => }/include/libxenvchan.h (100%)
>   rename tools/{libs/light => }/include/libxl.h (100%)
>   rename tools/{libs/light => }/include/libxl_event.h (100%)
>   rename tools/{libs/light => }/include/libxl_json.h (100%)
>   rename tools/{libs/light => }/include/libxl_utils.h (100%)
>   rename tools/{libs/light => }/include/libxl_uuid.h (100%)
>   rename tools/{libs/util => }/include/libxlutil.h (100%)
>   rename tools/{libs/call => }/include/xencall.h (100%)
>   rename tools/{libs/ctrl => }/include/xenctrl.h (100%)
>   rename tools/{libs/ctrl => }/include/xenctrl_compat.h (100%)
>   rename tools/{libs/devicemodel => }/include/xendevicemodel.h (100%)
>   rename tools/{libs/evtchn => }/include/xenevtchn.h (100%)
>   rename tools/{libs/foreignmemory => }/include/xenforeignmemory.h (100%)
>   rename tools/{libs/gnttab => }/include/xengnttab.h (100%)
>   rename tools/{libs/guest => }/include/xenguest.h (100%)
>   rename tools/{libs/hypfs => }/include/xenhypfs.h (100%)
>   rename tools/{libs/stat => }/include/xenstat.h (100%)
>   rename tools/{libs/store/include/compat => include/xenstore-compat}/xs.h (100%)
>   rename tools/{libs/store/include/compat => include/xenstore-compat}/xs_lib.h (100%)
>   rename tools/{libs/store => }/include/xenstore.h (100%)
>   rename tools/{xenstore => include}/xenstore_lib.h (100%)
>   rename tools/{libs/toolcore => }/include/xentoolcore.h (100%)
>   rename tools/{libs/toolcore => }/include/xentoolcore_internal.h (100%)
>   rename tools/{libs/toollog => }/include/xentoollog.h (100%)
> 


