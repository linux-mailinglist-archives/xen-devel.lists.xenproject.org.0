Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62B5783CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369789.601294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQtP-00073r-4b; Mon, 18 Jul 2022 13:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369789.601294; Mon, 18 Jul 2022 13:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQtP-00071A-1k; Mon, 18 Jul 2022 13:34:35 +0000
Received: by outflank-mailman (input) for mailman id 369789;
 Mon, 18 Jul 2022 13:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ih7=XX=citrix.com=prvs=1911958e4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oDQtN-000714-JH
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:34:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a0b7c99-069e-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 15:34:31 +0200 (CEST)
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
X-Inumbo-ID: 5a0b7c99-069e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658151272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Id3O7hwS0P4KWg2ZgtR1vm+6s0Z3YjEYBjQ34jtLqKw=;
  b=A2TkDqiDMVH8r2Hxt5FLgNN+WmpIymDuDfqVVXQ20lVyCMU7XYpOpgi0
   DfITTsfrcHOXQYtzceF9w6xyBiAIIiEVdkrdxYAcd+vYh4JPGvyxZR0o4
   s7CJwgmZCebIZBBQaTehqxTNsqWBIrvzvcqO90Blu+qm7PeRULlyKxeHL
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75335267
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+11ChKhTrn7tDQzLNm/lVJqeX161cRAKZh0ujC45NGQN5FlHY01je
 htvXW6Ab6veZWTxKd8laYnn/U4Fu5PQy94yGwJlq3wzQX8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur6GtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eBqtFvfx0I3p1q
 OEyDXMjV0mAlruPz+fuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCybYGOJ4bUGq25mG6Go
 j379FrrOi0wC8Wy7Wqa8COjrbf2yHaTtIU6S+Tjq68CbEeo7ncIFBQcWF+/oP+4ok2zQdRSL
 woT4CVGhbc23FymSJ/6RRLQiHyZuh8RXfJAHut87xuCooLW6QuEAmkPThZadccr8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PG6/tt11EiWCI8+Tujl1bUZBA0c3
 RixinV5nbYxlvVWyo+evn7+2jG9/6HGG1tdChrsYo610u9oTNf7OtP5sQmKsawowJWxFQfY4
 iVd8ySKxKVXVMzWynTQKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOwFCHzBUOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6wwBB8y/BgY
 c7KLa5A6Er27ow+llKLqxo1i+d3lkjSO0uJLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5nekhy
 P4GbpPi40gOD4XDjtz/q9F7waYicSdmXvgbaqV/Koa+H+aRMDh/UqSPn+J/K90NcmY8vr6gw
 0xRk3RwkDLX7UAr4y3RApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:7v8AKqosmq21GIgYQo3FbQkaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="75335267"
Date: Mon, 18 Jul 2022 14:34:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] EFI: strip xen.efi when putting it on the EFI
 partition
Message-ID: <YtVhUqm4cjPhgNwO@perard.uk.xensource.com>
References: <0a2da2ea-bc8e-05be-2c4a-5f9b0841f0d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a2da2ea-bc8e-05be-2c4a-5f9b0841f0d3@suse.com>

On Mon, Jul 11, 2022 at 06:05:37PM +0200, Jan Beulich wrote:
> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
> there's no intermediate step (mkelf32 there) involved which would strip
> debug info kind of as a side effect. While the installing of xen.efi on
> the EFI partition is an optional step (intended to be a courtesy to the
> developer), adjust it also for the purpose of documenting what distros
> would be expected to do during boot loader configuration (which is what
> would normally put xen.efi into the EFI partition).
> 
> Model the control over stripping after Linux'es module installation,
> except that the stripped executable is constructed in the build area
> instead of in the destination location. This is to conserve on space
> used there - EFI partitions tend to be only a few hundred Mb in size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Tested-by: Wei Chen <Wei.Chen@arm.com> # arm

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

