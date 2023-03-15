Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08586BB87F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510128.787282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTPz-0006bo-Gw; Wed, 15 Mar 2023 15:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510128.787282; Wed, 15 Mar 2023 15:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTPz-0006Zv-Db; Wed, 15 Mar 2023 15:51:59 +0000
Received: by outflank-mailman (input) for mailman id 510128;
 Wed, 15 Mar 2023 15:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hb+5=7H=citrix.com=prvs=431796acb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pcTPy-0006ZZ-Jf
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 15:51:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f13c89e-c349-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 16:51:56 +0100 (CET)
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
X-Inumbo-ID: 4f13c89e-c349-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678895516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qE09X+ER0eftRYoGG/u9ru4iVCsqt7cR4sWgx61XyUM=;
  b=FMSXvtlssepEV0kriEnguL5tsXWJekSGxHTXjf50L/eQjN6wb/q61jQX
   cvsHYozJQtynxtmxj0835CejNh6B/2zkLFydTEdjUCIogmFGiy+fvAmik
   9dTERtdwSG/ndz4gzQBNtTthP+6FV37PS6MBDD7u1F216oGX8JTVj40GC
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100887343
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:OBSKK6DX58mhzBVW/+Tjw5YqxClBgxIJ4kV8jS/XYbTApDIi0TZWz
 TNJCmjXOP6CM2emLY11YIm+pkNTsZTWmoA3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4uRxK0NP6
 OIkKy0KbUmG3u+3+uOEVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TSFZUKxRrDz
 o7A117iBxQLJObc8yCuy1z0gcLIvgHCBp1HQdVU8dY12QbOlwT/EiY+V1K9reOol02WVNdWK
 khS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebSYtz
 VWTmNTqAxRgtbSUTTSW8bL8hTG9Iy8ONkcZeDQJCwAC5rHLqZk+lBvVQv5/EaS+iZv+HjSY/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCYt5AP9fGO48D96eYmmPonx5FnhvMlfedPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3wcxQsBJGyCFvif6INsOuG0WyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2vpn0Gia24hTqFfK0QfUYXa
 P+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiHFGe5UaQLWNr9jhE9hnOky2
 4c3Cid3408HDL2Wjtf/qOb/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNsI9NYgJItQ/94wMz7egw
 51IchMAoLYJrSGdeFrih7EKQO+HYKuTWlpiZ319ZAn4hyJ/CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIpTo7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:N/1VBaMrU+CTJ8BcThijsMiBIKoaSvp037BL7TENdfUxSKelfq
 +V/cjzqiWE7gr5NEtNpTnCAtj4fZqkz+8P3WBJB8bZYOCEghrVEGgB1+vfKlTbckWVygc678
 hdmsNFZeEYY2IVsS6GiDPIa+rIFOP3kpxB+Y/lvhBQpHlRGsJdBvBCe2Km++RNNWx7OaY=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100887343"
Date: Wed, 15 Mar 2023 15:51:42 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v4 3/3] xl/libxl: Add OEM string support to smbios
Message-ID: <a6ed3e3d-a826-4114-ba26-7e72133d70be@perard>
References: <20230306204024.124882-1-jandryuk@gmail.com>
 <20230306204024.124882-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306204024.124882-4-jandryuk@gmail.com>

On Mon, Mar 06, 2023 at 03:40:24PM -0500, Jason Andryuk wrote:
> Add support for OEM strings in the SMBIOS type 11.
> 
> hvmloader checks them sequentially, so hide the implementation detail.
> Allow multiple plain oem= items and assign the numeric values
> internally.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

