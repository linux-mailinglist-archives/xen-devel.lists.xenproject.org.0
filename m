Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4BE1EA0A8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 11:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfgVH-0001KG-11; Mon, 01 Jun 2020 09:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfgVF-0001KB-9k
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 09:13:05 +0000
X-Inumbo-ID: 18c47eae-a3e8-11ea-ab03-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c47eae-a3e8-11ea-ab03-12813bfff9fa;
 Mon, 01 Jun 2020 09:13:03 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: viemTyYNZzVUTDSU1LA4Tvf48+n77yXbjI0CMcFyKg5TBDNA9LGYwIdZRKLCZN2TM6NUDhM3wP
 FTeQgmOXn7NxK2TVdwBOB1mzuCuS0DywKcIXE8DrWZTyXRN9iwBAqTtPhfYVvHY+1LCSX1tn4i
 39nT61HGHrp9rrXvXVFo8f6mQeIEDQLKjhKRi9Rs4KuvZwVQQn+JlZmbHLJDYc5sUQvsh5ugsn
 YFXP+OLx5nbw7ZWjBQr1qiUBTbODiqxKs9CSfZD6+Ff+TdiM5n2VUlmogBApYLy2k/yWcTCdyX
 iFE=
X-SBRS: 2.7
X-MesageID: 18896880
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,460,1583211600"; d="scan'208";a="18896880"
Date: Mon, 1 Jun 2020 11:12:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/3] build32: don't discard .shstrtab in linker script
Message-ID: <20200601091256.GR1195@Air-de-Roger>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-3-roger.pau@citrix.com>
 <41429ddc-a6c3-ddba-97d6-aeb413df1960@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41429ddc-a6c3-ddba-97d6-aeb413df1960@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Fri, May 29, 2020 at 05:45:44PM +0200, Jan Beulich wrote:
> On 28.05.2020 16:40, Roger Pau Monne wrote:
> > LLVM linker doesn't support discarding .shstrtab, and complains with:
> > 
> > ld -melf_i386_fbsd -N -T build32.lds -o reloc.lnk reloc.o
> > ld: error: discarding .shstrtab section is not allowed
> 
> Well, yes, GNU ld is more intelligent and doesn't extend the
> discarding to the control sections in the first place. All
> of .symtab, .strtab, and .shstrtab are still there.
> 
> > Add an explicit .shstrtab section to the linker script after the text
> > section in order to make LLVM LD happy.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Assuming the change was tested to not confuse GNU ld
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yes, it's been tested on the gitlab CI, no issues reported on any of
the builds:

https://gitlab.com/xen-project/people/royger/xen/pipelines/151009839

> I wouldn't mind extending this to the other two control
> sections named above. In case the binaries need picking
> apart, them being present is surely helpful.

I don't mind extending, it might make sense in case linkers start
complaining about trying to discard those too.

Thanks, Roger.

