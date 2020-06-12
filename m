Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DA1F7957
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 16:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjkPs-0005dx-Bd; Fri, 12 Jun 2020 14:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjkPq-0005ds-UE
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 14:12:18 +0000
X-Inumbo-ID: b90e57b4-acb6-11ea-b5d4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b90e57b4-acb6-11ea-b5d4-12813bfff9fa;
 Fri, 12 Jun 2020 14:12:18 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HuiODcQvIs84RzWq+XzbI4P0f9gcZjjP2aOhlN4/CUkS4m5l0uJvjxbB2WW6YMhFTlcrDltPMQ
 zwwmg7/PbAACcr1PvqzBdBynTmC68BdJIoeDsiMaw+kKlg3F1Uycsk31H0HxZKwqMGFaFOUXrq
 gCJX8poqBk94G0PA5oHi0SF6f0bTyCtIUz8OlY4PHxOJqQiX39TAAfvmKUF9301UTcMsfbaX/5
 MwBjgD/LnyOvOXiKeXIw9zW7gQ4+hhPdr8zcpLxoUBoMGsWDqzXKTIWytrCVZgUj3bYQs6XT5Q
 iAc=
X-SBRS: 2.7
X-MesageID: 20147663
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20147663"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24291.36156.961284.809662@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 15:12:12 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: libxl dirty in tree after libxl build
In-Reply-To: <439f3d92-2e18-1868-2b4b-2747973fbe3b@citrix.com>
References: <439f3d92-2e18-1868-2b4b-2747973fbe3b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("libxl dirty in tree after libxl build"):
> A build of libxl has just dirtied the tree with:
> 
> index 05f7ac74a0..94a4438666 100644
> --- a/tools/libxl/libxlu_disk_l.c
> +++ b/tools/libxl/libxlu_disk_l.c
> @@ -10,221 +10,11 @@
>  #define FLEX_SCANNER
>  #define YY_FLEX_MAJOR_VERSION 2
>  #define YY_FLEX_MINOR_VERSION 6
> -#define YY_FLEX_SUBMINOR_VERSION 4
> +#define YY_FLEX_SUBMINOR_VERSION 1
>  #if YY_FLEX_SUBMINOR_VERSION > 0
>  #define FLEX_BETA
>  #endif
> 
> and a whole slew of other changes in the generated code.  It looks like
> the version of Flex has just been updated in Jessie.
> 
> Given the flex and bison are strictly required for the libxl build, why
> is this temporary file checked in?

The point of the exercise is to *not* require them.  The reason is
that some of our developers have very old development systems which do
not support essential flex/bison features.

How about we update them to the version from buster ?

Ian.

