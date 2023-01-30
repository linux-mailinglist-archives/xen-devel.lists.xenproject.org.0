Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE335681862
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487142.754650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYcD-00024Z-AQ; Mon, 30 Jan 2023 18:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487142.754650; Mon, 30 Jan 2023 18:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYcD-00022W-79; Mon, 30 Jan 2023 18:10:49 +0000
Received: by outflank-mailman (input) for mailman id 487142;
 Mon, 30 Jan 2023 18:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYcB-00022F-Eo
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:10:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68a2551d-a0c9-11ed-93eb-7b0ecb3c1525;
 Mon, 30 Jan 2023 19:10:45 +0100 (CET)
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
X-Inumbo-ID: 68a2551d-a0c9-11ed-93eb-7b0ecb3c1525
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675102246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b0f6lavD++iE+TA/+evuMB1/iYP5KiQ/PTS8XIwKCt4=;
  b=UhniO0SvN56Mfcqlenvhzkje4Ro0Cfz9xE8xckWezBWjZn/ShVL55m5L
   B9bR+qyRRdJyjxujr8VvzKfrcDqWG0/q9WG6IZs0m9S0EKDJnGB/a75QD
   0Ygky+8GpjicR2dmRr6x8myXt6YhljJPPL5VXyqpacZWcUW/qmeJxO0qj
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93750567
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:WLePWKmjZDQvLqn2Qa1NtGvo5gy3JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUGmOaPiIMGqmLd9wYdy/8U5VvJ7dyIBiSVFrrX88FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5weGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aZfcDtXMA++vP+n3J7kSPFhh504J9a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfD+
 T+eojqmav0cHPiu8DGP8TWJvf7OwSfLdJMURbuzp8c/1TV/wURMUUZLBDNXu8KRhkegVvpFJ
 kcT+y5oqrI9nGSiVtTnVge0iGKFtBUbHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtv6eSUmm17aqPoHW5Pi19BXAGTT8JS00C+daLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ1JypYAjfukwGvaki6A+ZrRQw9s/Q7ICzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/OI+TfNDKq8gj9yjn9ZKWe6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+B2nnlhnDOPHcGkp/hC7VZ5TCfFIYrpzXPUNrxphE96iFq9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3RMys7Mei+AM8XQLBSFXVEAGtEEkMLOe6HhJrzvbNrFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:ClzYQK5kuajZjXsqBAPXwMbXdLJyesId70hD6qkRc3xom6mj/f
 xG88536faZslkssQgb6LK90cq7IE80i6Qf3WB5B97LYOCMggeVBbxPxa+n/hulIhbZ29J26M
 5bAstD4bPLY2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="93750567"
Date: Mon, 30 Jan 2023 18:10:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Message-ID: <Y9gIEpQ5G1inUDX7@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:30PM +0000, Andrew Cooper wrote:
> This is the tools side of the Xen series posted previously.

There's also python bindings using xc_version(), is it something we want
to update?

Cheers,

-- 
Anthony PERARD

