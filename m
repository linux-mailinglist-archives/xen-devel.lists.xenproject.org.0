Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DA4B6F85
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273277.468400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzRO-0004xC-M3; Tue, 15 Feb 2022 15:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273277.468400; Tue, 15 Feb 2022 15:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzRO-0004ua-Iv; Tue, 15 Feb 2022 15:08:30 +0000
Received: by outflank-mailman (input) for mailman id 273277;
 Tue, 15 Feb 2022 15:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLD3=S6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nJzRN-0004uU-KY
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:08:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f7f1f6c-8e71-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:08:27 +0100 (CET)
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
X-Inumbo-ID: 1f7f1f6c-8e71-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644937706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6Cmc2UF9qAZ0HddVrLmRZ0QxBVtdYwX4C+ZrpISl+s=;
  b=Rd7PNZfmBESX0hc1fS+U2RmMNZs80Ak1gsqM8IM67to2jxmI75/VrdNF
   NJ13W9nz/xeFu/e0jiXOn4Y51z8wgJeG/k3nvpuD1PtLwHaDjz9pKiKwt
   Qo5kvW5sozVDAp7oVjTqVSaQxYnRKEupV/oKKuKtBqGBWqGOJRZUXrKA2
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VBcXdPfDXzfmj6yDhyMaQSNYkGdx2qWKM4NRlWJMXGpiQG1EzKV/DkCa4LQIAC+s7iwsEQB+b8
 PhhD4Wag5Gkg/cQKrEdJ0/7KwBvTTJSjNv7lnonUfibJrVHWUISLzqUS1YWMmd8opgsTKdt0kc
 aMo37LaaxwzlT1uR4QG4XUSiERfP309QMBgJhONHFcDvacQRpSIQoFrIBYJqbbrqtnWh5t1mZ2
 2PibI/0eaapXdfanefzJkyjSpvUILg/pCMvWhsXxzZsRJFIVjYTVoNhe4CLqugR3flWRrdu3nn
 BCD8v3xwgUTO5a092ejNQyQc
X-SBRS: 5.1
X-MesageID: 66481582
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zjOKJqPhYfu9QEDvrR1skMFynXyQoLVcMsEvi/4bfWQNrUp31GZSz
 WVNUWDVOfvYYGHyfdgkYY228ktSupXWzYM1HAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s+w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowiUxcJsx
 ZZQibmtYhU1IredgsE3UDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgmls1pkTTay2i
 8wxNWVDYUTqYRp2HhQNM8MZxOL3wV/ebGgNwL6SjfVuuDWCpOBr65DvP8DSYceiXthOkwCTo
 Weu12bzDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 1MQ0jojq+417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyzuEXHoZQ31cVPk7n90qWSZ7z
 HqjnPq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwPpU
 JsswZH2AAUy4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJWC5M
 BKO4VoKvve/2UdGioctPeqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WnOXeJqNZKdwhVRZX5bLivw/Fqmie4ClIOMAkc5zX5mtvNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:ZaIcKaoi/RjLZEbmgCS+N0IaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="66481582"
Date: Tue, 15 Feb 2022 15:08:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] tools/libxl: don't allow IOMMU usage with PoD
Message-ID: <YgvB5UtyC29m8zbo@perard.uk.xensource.com>
References: <20220203143211.18967-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220203143211.18967-1-roger.pau@citrix.com>

On Thu, Feb 03, 2022 at 03:32:11PM +0100, Roger Pau Monne wrote:
>      if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
> -        d_config->num_pcidevs && pod_enabled) {
> +        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
> +        pod_enabled) {
>          ret = ERROR_INVAL;
> -        LOGD(ERROR, domid,
> -             "PCI device assignment for HVM guest failed due to PoD enabled");
> +        LOGD(ERROR, domid, "IOMMU not supported together with PoD");

I'm not sure that this new error message is going to be good enough to
point out configuration issue for the guest.

One is going to set 'pci=["foo"]' or 'dtdev=["bar"]', which will enable
passthrough. Then they may get en error about IOMMU or PoD.
Should we maybe write something like this instead?

   "IOMMU or device passthrough not supported together with PoD"

Thanks,

-- 
Anthony PERARD

