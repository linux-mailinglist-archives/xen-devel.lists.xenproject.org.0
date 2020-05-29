Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691341E8260
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehCd-0000lk-S7; Fri, 29 May 2020 15:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jehCc-0000la-Gr
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:45:46 +0000
X-Inumbo-ID: 75d9d516-a1c3-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75d9d516-a1c3-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 15:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F210ACB8;
 Fri, 29 May 2020 15:45:45 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] build32: don't discard .shstrtab in linker script
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41429ddc-a6c3-ddba-97d6-aeb413df1960@suse.com>
Date: Fri, 29 May 2020 17:45:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528144023.10814-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 16:40, Roger Pau Monne wrote:
> LLVM linker doesn't support discarding .shstrtab, and complains with:
> 
> ld -melf_i386_fbsd -N -T build32.lds -o reloc.lnk reloc.o
> ld: error: discarding .shstrtab section is not allowed

Well, yes, GNU ld is more intelligent and doesn't extend the
discarding to the control sections in the first place. All
of .symtab, .strtab, and .shstrtab are still there.

> Add an explicit .shstrtab section to the linker script after the text
> section in order to make LLVM LD happy.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Assuming the change was tested to not confuse GNU ld
Acked-by: Jan Beulich <jbeulich@suse.com>

I wouldn't mind extending this to the other two control
sections named above. In case the binaries need picking
apart, them being present is surely helpful.

Jan

