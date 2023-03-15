Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE06BB87D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510127.787272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTPa-0006ER-8d; Wed, 15 Mar 2023 15:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510127.787272; Wed, 15 Mar 2023 15:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcTPa-0006CQ-5i; Wed, 15 Mar 2023 15:51:34 +0000
Received: by outflank-mailman (input) for mailman id 510127;
 Wed, 15 Mar 2023 15:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hb+5=7H=citrix.com=prvs=431796acb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pcTPZ-0006CK-3y
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 15:51:33 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e97d4cc-c349-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 16:51:29 +0100 (CET)
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
X-Inumbo-ID: 3e97d4cc-c349-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678895489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7mf745Mt5OE/+4LEaU0+9ckHaAfF/JS31BvnD2y0Xc=;
  b=TZOaQ1z+FOyJCCPfgrNnbooz8ggrucLv/O1DDutvgtazRGYk8gibZTbS
   VqaplkufDdKL4fPILqEFO17vGjrWLVMzi0ptnGkRwh52hbGLYYyiWPDUn
   IJy2eNi4mOxEnIZ+xYDfE4CZ3ZdqEAfrMAO5dRR4Zz8TN4n8UvDSI20Ii
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100345358
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0Y97HaD8iHMXhhVW/+vjw5YqxClBgxIJ4kV8jS/XYbTApDIjhDIAx
 zdMUDjSb/eCYmOmctogaoS39UpT6MXWyIRhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3ftcCmBV+
 78kFBtRbiin2vOIzJSbVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TSHpkIxRvIz
 o7A12+mWzMBK+Sg9TOM/S7w3+7jnDzccqtHQdVU8dY12QbOlwT/EiY+V1K9reOol02WVNdWK
 khS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebSYtz
 VWTmNTqAxRgtbSUTTSW8bL8hTG9Iy8ONkcZeDQJCwAC5rHLqZk+lBvVQv5/EaS+iZv+HjSY/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCYS+y7cX3mrrT9FT9KlX6j1+GbXy9ZfedPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3wcxQsBJGyCFvif6INsOuG0WyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2vpn0Gia24hTqFfK0QfUYXa
 P+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiHFGe5UaQLWNr9jhE9hnOky2
 4c3Cid3408HDL2Wjtf/qOb/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNsI9NYgJItQ/94wMz7egw
 51IchMAoLYJrSGdeFrih7EKQO+HYKuTWlpiZ319ZAn4hyJ/CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtJa1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:/kU/MK+pi9OY7076YzVuk+ABI+orL9Y04lQ7vn2ZKCYlD/Bw8v
 rEoB11737JYUkqKRcdcLy7VJVoAkmsjKKdmLNhRotKBTOWwldAT7sSkbcKoQeBJ8SWzIc0v5
 uIFZIQNDSaNzVHZKjBjjVRbr4bsaG6GXST9IXjJwsEd3AMV0gZ1XYbNu9tKDwTeODuP+tdKK
 ah
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100345358"
Date: Wed, 15 Mar 2023 15:51:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v4 2/3] xl/libxl: Add ability to specify SMBIOS strings
Message-ID: <0b4790f8-4275-424c-bba9-e2a1fe82eeda@perard>
References: <20230306204024.124882-1-jandryuk@gmail.com>
 <20230306204024.124882-3-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306204024.124882-3-jandryuk@gmail.com>

On Mon, Mar 06, 2023 at 03:40:23PM -0500, Jason Andryuk wrote:
> hvm_xs_strings.h specifies xenstore entries which can be used to set or
> override smbios strings.  hvmloader has support for reading them, but
> xl/libxl support is not wired up.
> 
> Allow specifying the strings with the new xl.cfg option:
> smbios=["bios_vendor=Xen Project","system_version=1.0"]
> 
> In terms of strings, the SMBIOS specification 3.5 says:
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf
> """
> Strings must be encoded as UTF-8 with no byte order mark (BOM). For
> compatibility with older SMBIOS parsers, US-ASCII characters should be
> used.  NOTE There is no limit on the length of each individual text
> string. However, the length of the entire structure table (including all
> strings) must be reported in the Structure Table Length field of the
> 32-bit Structure Table Entry Point (see 5.2.1) and/or the Structure
> Table Maximum Size field of the 64-bit Structure Table Entry Point (see
> 5.2.2).
> """
> 
> The strings aren't checked for utf-8 or length.  hvmloader has a sanity
> check on the overall length.
> 
> The libxl_smbios_type enum starts at 1 since otherwise the 0th key is
> not printed in the json output.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

