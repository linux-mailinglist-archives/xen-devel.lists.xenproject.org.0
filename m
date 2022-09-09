Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87C5B3B6C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 17:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404450.646929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfZP-000833-6f; Fri, 09 Sep 2022 15:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404450.646929; Fri, 09 Sep 2022 15:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfZP-0007zt-2z; Fri, 09 Sep 2022 15:05:27 +0000
Received: by outflank-mailman (input) for mailman id 404450;
 Fri, 09 Sep 2022 15:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWfZN-0007zn-64
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 15:05:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ad3a17-3050-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 17:05:24 +0200 (CEST)
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
X-Inumbo-ID: d3ad3a17-3050-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662735923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhfBdqORxj/x2MSS1JBm7eiGHx08sX5kzAbfRsv99gM=;
  b=KbbqY2aScl0aizkMSfEJeL9jNCTNzGjuidWZHN0aZECNJ2oqlXGS9Z54
   Ewyu/KiKhqVWB08xDM94qvQkgt013bwGhxOkj1nRI46F1eJ5tjdbGfWDV
   dB8Bd2UqDP2vadUofQfGhdVpYnFncuFTHGWcA4FP2QGWg/m1G0f2XTyv+
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79851336
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rS5LsKvWHZeLVI903OSymfEu6+fnVF1eMUV32f8akzHdYApBsoF/q
 tZmKWjQOf2IMzbxf9Anad62pxhT7MWBxtAyGQtp+S9kRH8V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4GJA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYpA4N5uMWQQz
 90ROhwrMhSIguyc+JvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4uFJ4XRHps9ckCwj
 zrvwUbAJAAjaue54iap/iuCvNaVgnauMG4VPOLhraM76LGJ/UQJDwYcT1y8ov+RhUu3WtYZI
 EsRkgIsorI171eDVcTmUluzp3vslgEYc8pdFas98g7l4qjd5QqDF3UHZjFEYd0i8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RiN9DIGnoUW0/Qq3reX2wzDiDeijKDgG1tdChrsYo610u9oTNf7Odb2sgGAsakowJWxFQfY4
 iVd8ySKxKVXVMzWynTQKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOwFCHwBUOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6zyhZyy/hgY
 87GLq5A6Er27ow+lFKLqxo1i+d3lkjSO0uILXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5nekhy
 P4GbpPi9vmqeLehCsUh2dJMcAtiwLlSLcyelvG7gcbYelM6RDl4UaaLqV7jEqQ895loei7z1
 inVcidlJJDX2BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:d8IPOKDluQRM19jlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="79851336"
Date: Fri, 9 Sep 2022 16:05:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v2 2/3] xl/libxl: Add ability to specify SMBIOS strings
Message-ID: <YxtWKWSUoJ8yo9tE@perard.uk.xensource.com>
References: <20220908195113.218201-1-jandryuk@gmail.com>
 <20220908195113.218201-3-jandryuk@gmail.com>
 <YxsTO9Ds2RNJo/3W@perard.uk.xensource.com>
 <CAKf6xpugO14yY+3XxKiRwFoks5-iVfoMzjVK-D=PYQBPvjdCSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKf6xpugO14yY+3XxKiRwFoks5-iVfoMzjVK-D=PYQBPvjdCSw@mail.gmail.com>

On Fri, Sep 09, 2022 at 08:59:09AM -0400, Jason Andryuk wrote:
> On Fri, Sep 9, 2022 at 6:19 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
> >
> > On Thu, Sep 08, 2022 at 03:51:12PM -0400, Jason Andryuk wrote:
> > > hvm_xs_strings.h specifies xenstore entries which can be used to set or
> > > override smbios strings.  hvmloader has support for reading them, but
> > > xl/libxl support is not wired up.
> > >
> > > Allow specifying the strings with the new xl.cfg option:
> > > smbios=["bios_vendor=Xen Project","system_version=1.0"]
> >
> > I've tried something like:
> >     smbios=['oem=foo=bar']
> > And only "foo" is added to the smbios string. Shouldn't we allow users
> > to have '=' in their smbios strings?
> 
> Yes, you are correct.  split_string_into_pair() isn't suitable since
> it terminates at the second '='.  Also, we probably don't want to trim
> the strings to keep them unchanged, especially for any values.  If a
> space-padded option name is provided, it'll show up in "xl: unknown
> smbios type '%s'" and the whitespace would be evident.
> 
> hvmloader iterates through HVM_XS_OEM_STRINGS entries and stops
> processing when an entry is not found, or it is zero-length.  So I
> think we should disallow zero-length values like "oem=" to avoid
> surprises.  For example, smbios=["oem=A","oem=","oem=B"] would result
> in only oem-1 "A" making its way through to the guest.

Both suggestion sounds good.

Cheers,

-- 
Anthony PERARD

