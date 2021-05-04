Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD85372BB2
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 16:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122475.231020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvjP-00088O-0O; Tue, 04 May 2021 14:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122475.231020; Tue, 04 May 2021 14:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvjO-000881-TW; Tue, 04 May 2021 14:08:58 +0000
Received: by outflank-mailman (input) for mailman id 122475;
 Tue, 04 May 2021 14:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldvjN-00087t-77
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:08:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4abb085-0306-432c-91c7-969a1a7edb80;
 Tue, 04 May 2021 14:08:56 +0000 (UTC)
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
X-Inumbo-ID: f4abb085-0306-432c-91c7-969a1a7edb80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620137336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NlUUtvPrySGI4Wn+g8O2ZK/jJcGmGAP2doqCMUNxoBs=;
  b=WCaZwlhZ9My+MwxmgrIFrmPyN0XUrn4XYklrYLQ2VF4/nTA1UdUGfpVw
   2p9q18Dso/jZYDzZzwGklzO9KG1zqxftyRZUlzmCbFHiw6zXTDo301/jq
   Vp9ptVddBt+98LTE6/Q1dYUinZDtuKT8TJ9urHOEBZDnPI8ib1DN0HkP+
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3a6uvkaCaYepdXZRr2xQWHzr8026Xrcda7gERbnf22cG8ya7Hm8M1lIyF8kqUGW+1Q1tL4M+/P
 J5rS9UegAzsSfV8F3OCoQNSto330MNgJoMPsPpoVEuQUvDLOuvgV6VTllMVdV2JYzWdAx19qkA
 htiPzJGX5iHBKVEkiWxFLxREAWUJmzj96y+M3Gs+OVM5gXnehr/DkKHz0sc1B+UlONWQ7qFpQh
 +NGi+1lhhTDKavRpfyy3oByl5b/kW//kz9LaWRUE+iqi4p8Qxzg5K1XsOt7jiL2GOb18OT4CNP
 ZsU=
X-SBRS: 5.1
X-MesageID: 43038264
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 ILuDfxhI5VvIErrgVYQeqqhCBTxQ4=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43038264"
Date: Tue, 4 May 2021 15:08:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 13/13] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Message-ID: <YJFVc97ZFYMhWdxg@perard>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-14-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210430155211.3709-14-roger.pau@citrix.com>

On Fri, Apr 30, 2021 at 05:52:11PM +0200, Roger Pau Monne wrote:
> Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
> xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
> parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
> will now implement it's own private type for storing CPUID
> information, which currently matches xc_xend_cpuid.
> 
> Note the function logic is moved as-is, but requires adapting to the
> libxl coding style.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Use LOG*D.
>  - Pass a gc to apply_policy.
>  - Use 'r' for libxc return values.
> ---

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

