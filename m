Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AD52EA06
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333746.557649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzzo-000433-Kv; Fri, 20 May 2022 10:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333746.557649; Fri, 20 May 2022 10:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzzo-00040p-Hh; Fri, 20 May 2022 10:36:36 +0000
Received: by outflank-mailman (input) for mailman id 333746;
 Fri, 20 May 2022 10:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIPw=V4=citrix.com=prvs=132b3d1f7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrzzn-0003Ro-N5
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:36:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7816a59-d828-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 12:36:34 +0200 (CEST)
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
X-Inumbo-ID: b7816a59-d828-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653042994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S5xCJQcroAZaAJyun2qGjw1znnSHkWD/ElHptovrOko=;
  b=eaQFRCv06QN2RDhm0uBFSccju5wVsxjF2I79daIyrrOmW7ZzybpBZ8Qq
   fPlsVEXIrZFzLh4hixQy+RCt0Y+IRXZTaCuGR/rjjDHTHyRUj9picUPgn
   8ZL54OSu2UXIEa4qKh4YAmpssXgmFO2IY06Et1PWIgJpcUXjAlKDCiYgA
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71774822
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YRimT691dyNWz6CV3VVvDrUD236TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jQeWTyDafeDYDD2ftBxatzn9UtQsJTWx9Y3TFY4qH08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaHta1sME6vdpPk+YiF0LHBxHYNm85aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JNGNmY/Nk6ojxtnHxQpCMNmhOeTt3jBXSFzjAqfgPYmyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IBAWWF74sfS/okvjQ5RUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9Bnyl2o56zF3xu6N1AocW9OSPIGv+ZjEFTGy
 WS1c8PV6S1H6ePIEirErunI8lteKgBOczZcOHZsoR8tpoC6/dpt1k+nosNLSvbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuBRPtfNi3SAswSz0Bq5BN/xoqO9l
 HYFgdOCy+sFEIuAkieAKM1UQuzzt6fVYGOF2gA1d3XEy9hK0yf8Fb28HRkkfBs5Wir6UWKBj
 LDvVfN5u8YIYSrCgV5faIOtEcU6pZUM5vy8Ps04muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+eDAPyfEF+1abQPmgyJQxPrsnTg5O
 u13b6OioyizmsWkCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:Nn7fpKusPOqT7oMWtCq+qa1o7skDdtV00zEX/kB9WHVpmszxra
 6TddAgpHvJYVcqKRQdcL+7VZVoLUmxyXcx2/h3AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IObuEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="71774822"
Date: Fri, 20 May 2022 11:36:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] tools/xl: Sort create command options
Message-ID: <YodvLSxriFpSTuis@perard.uk.xensource.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
 <f9a50602c6bfdab31b9aad6849195d955bce144c.1651285313.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9a50602c6bfdab31b9aad6849195d955bce144c.1651285313.git.ehem+xen@m5p.com>

On Tue, Apr 19, 2022 at 06:56:03PM -0700, Elliott Mitchell wrote:
> Hopefully simplify future changes by sorting options lists for
> `xl create`.  While at it, declare the options list constant.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

