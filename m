Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CF48D5E5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257062.441501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xW5-00067A-4Q; Thu, 13 Jan 2022 10:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257062.441501; Thu, 13 Jan 2022 10:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xW5-00064c-0k; Thu, 13 Jan 2022 10:39:37 +0000
Received: by outflank-mailman (input) for mailman id 257062;
 Thu, 13 Jan 2022 10:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUHC=R5=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7xW2-00064W-OP
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:39:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170f588e-745d-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 11:39:32 +0100 (CET)
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
X-Inumbo-ID: 170f588e-745d-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642070372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1LoWS6DZcu6EjIrJ27bDUc6dlFGcFKo+jBWFWb8oVs=;
  b=V1dn3T8pdTJNYzB7nRWFx+kl+xulbqWebNga0NJGw38fZoCDLKpRhH2Z
   HFjSfbBo8MfbKUieicXeTYR5KYNHC3HLqbWCW+P4aZ20SFEpVIUg1NJVv
   rz9PaeYDk+Ws8a4ulKnlQOoj3dQ0YswveP+lO9pmHxa+NJW2hy7RsXJeY
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SYFDaHAMp5F3HvorWxSuXmE4WstW4dfzR3JQAq5jsZyZYr7nfkdjbfaqZN4XEuojna+V2zHzvk
 bJCJtny0WODoZfvjMlFWnfZ8Hps2j8kf+OG8v4ouOBRLZIbs8sxwxeklkkuqkjS/5GBwXMQtO3
 OEvpgNUb4WhtLh3mXK8jynUz8L/h90kX0S/F6KU21ZnJLXINmsgldqP1B+ReLPWcMzsw5iWNbc
 IwhbGOQFqhsDv5byhiDrJcuxRplIbsWaWluiTMdHCcw/45U7EshHHeAkYRaWeOdEoVqL837gGX
 s+O956ocPr8GifWWtFOTivC9
X-SBRS: 5.2
X-MesageID: 61909621
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WsClR6mwsS4JGNLW+S2mE9Xo5gwAIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWzqAOqzYYDShc9kkPYy0pEpSuZPTzIdgTABsqXo2HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PRP5KHgQxwCBZ/3u8ESCzVkD3BbL6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6+PP
 5tHM2MHgBLoRz9NH147B5sFru6st0fHWnpHkmqQqv9ii4TU5FMoi+W8WDbPQfSSTNhRtlaVo
 CTB5WuRKg4eHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW7xGUVBAcHSFiTrvywi0r4UNVaQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qje7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwA0Lz4/NSUfZjA32PrGr9kfsg6ea8RsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yLyFWyzyGsnTKuMDiriUWW5C
 KM0kVkAjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwORTIhju1zhR8yvtX1
 XKnnSCEVyZy5UNPlmveegvg+eVzmnBWKZ37GPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmW8yeg5EJJ4arf1o3cEl8WqS56e5wJORYc1F9y72gE
 oeVABEIkTISRBTvdG23V5yUQOi+AsYk8yNqZHxE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:Hzk5Eq6JbxelA5DjeQPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61909621"
Date: Thu, 13 Jan 2022 10:39:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v4] libxl/PCI: Fix PV hotplug & stubdom coldplug
Message-ID: <YeABXp55XWTVd7rL@perard>
References: <20220113040142.20503-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220113040142.20503-1-jandryuk@gmail.com>

On Wed, Jan 12, 2022 at 11:01:42PM -0500, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken PCI hotplug (xl pci-attach) for PV
> domains when it moved libxl__create_pci_backend() later in the function.
> 
> This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
> PCI devices are hotplugged to a running PV stubdom, and then the QEMU
> QMP device_add commands are made to QEMU inside the stubdom.
> 
> A running PV domain calls libxl__wait_for_backend().  With the current
> placement of libxl__create_pci_backend(), the path does not exist and
> the call immediately fails:
> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> 
> The wait is only relevant when:
> 1) The domain is PV
> 3) The domain is running
> 2) The backend is already present
> 
> 1) xen-pcifront is only used for PV.  It does not load for HVM domains
>    where QEMU is used.
> 
> 2) If the domain is not running (starting), then the frontend state will
>    be Initialising.  xen-pciback waits for the frontend to transition to
>    at Initialised before attempting to connect.  So a wait for a
>    non-running domain is not applicable as the backend will not
>    transition to Connected.
> 
> 3) For presence, num_devs is already used to determine if the backend
>    needs to be created.  Re-use num_devs to determine if the backend
>    wait is necessary.  The wait is necessary to avoid racing with
>    another PCI attachment reconfiguring the front/back or changing to
>    some other state like closing.  If we are creating the backend, then
>    we don't have to worry about the state since it is being created.
> 
> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config")
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

That patch is probably good enough for now, even if there is probably need to
rework the function with regards to issue raised in
https://lore.kernel.org/xen-devel/24859.43747.87671.739214@mariner.uk.xensource.com/
in the thread.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

