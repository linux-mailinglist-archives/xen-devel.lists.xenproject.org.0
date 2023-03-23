Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45E6C662E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513783.795319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIps-0007ds-FV; Thu, 23 Mar 2023 11:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513783.795319; Thu, 23 Mar 2023 11:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIps-0007aP-C6; Thu, 23 Mar 2023 11:10:24 +0000
Received: by outflank-mailman (input) for mailman id 513783;
 Thu, 23 Mar 2023 11:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfIpr-0007a1-Pd
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:10:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b775d31-c96b-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 12:10:21 +0100 (CET)
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
X-Inumbo-ID: 4b775d31-c96b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679569821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ejf5okrfxPZWsZMqJGB9Xzxn20GadA9hGbz8Bcrlkpg=;
  b=SgpFys/NqHq+rHl7q4RR3h7Xy67QrPAhRoZuZEKpdi0VxaSisA+WtbKj
   15W3N3B1b79kHwOMsnDM71wlHI1HgfwXTu73nyDx5PAixj5d0XzUoahfC
   TUe2+zdRnNxbK8f0nR5pRRTlM1iTbo4YNF0lMV3u4+iYZgno6c/keifDw
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 102009417
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:RrsNBqCzTmOnaRVW/x7jw5YqxClBgxIJ4kV8jS/XYbTApDt00TBTy
 TBODz3Sa6rbYjHxed8gad+zoBhSucSGx9cxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw180vHlpH6
 KUhKT0TQCLaivm0g4O2Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TQHZ0Ewh/Hz
 o7A13/1CTM1c5+W8n3b8X+Th9DwmjzcXZ1HQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yxmdLngJSHhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqf67OVoDWaKSUTa2gYakcsRBMI+dD5rKkvjxjESZBoF6vdszHuMWium
 XbQ9nF43uhNy5dRjM1X4GwrnRqBjcDWdQcovzzWU3yL3Fp0f4zmVoGBvA2zAel7EGqJcrWQl
 CFaxJnFsr1eVMrleD+lG7tUQuzwjxqRGHiF2AM0QcF8n9i40yT7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgGfqqOBja2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo4nWfvH75Hi+90nUjSIF8/orilpylLLJLEPCLFIVv7GALmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChTqHXooBQlSdxATXMmuw+QOL77rH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcDlQei1SyXcl7VAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:pMkzD6zygzvF6ABo7HKJKrPwDb1zdoMgy1knxilNoEpuA6qlfq
 GV7Y4mPHrP4wr5N0tNpTntAsa9qBDnhPxICOsqXYtKBzOW31dARbsKheHfKlvbdREWndQttp
 uIHZIeNDVcZmIWsS58izPIaOrJFLK8gdiVbUi19QYVcenHAZsQijuQq2ygYylLeDU=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102009417"
Date: Thu, 23 Mar 2023 11:10:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v5 2/5] tools: add container_of() macro to
 xen-tools/common-macros.h
Message-ID: <d6025554-ffb8-4394-bfb7-8818fc3c60dd@perard>
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323090859.25240-3-jgross@suse.com>

On Thu, Mar 23, 2023 at 10:08:56AM +0100, Juergen Gross wrote:
> Instead of having 4 identical copies of the definition of a

Nit: 3 ;-), no more copies in removed vhpet tests.

> container_of() macro in different tools header files, add that macro
> to xen-tools/common-macros.h and use that instead.
> 
> Delete the other copies of that macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

