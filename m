Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CD761D83
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 17:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569794.890878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOK96-0003KC-Nx; Tue, 25 Jul 2023 15:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569794.890878; Tue, 25 Jul 2023 15:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOK96-0003Hf-Ks; Tue, 25 Jul 2023 15:40:20 +0000
Received: by outflank-mailman (input) for mailman id 569794;
 Tue, 25 Jul 2023 15:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Hqi=DL=citrix.com=prvs=563c090bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOK95-0003HZ-6O
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 15:40:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca8a316-2b01-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 17:40:16 +0200 (CEST)
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
X-Inumbo-ID: 8ca8a316-2b01-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690299616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Cvekg3BhRzyP7fDHWicLvsGca0I3Fn93MuBXtz7KW0=;
  b=A5GcSwKKbGLQKJ9NDEVH9sEbkEgFgkyjybeZm+LAlOkdJKwjAVQHi3O7
   WuEMyl09EqfoyXKxi2vUUKm/uP10fVkyUPLpTj4ZY4gcCCwlZh890csQs
   YUGnNp+K1zSdTH7XuNNIKQ1/13vLgIyp7NnIaTQmRINkgpJWw1PrF2mYI
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120006801
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Orpo76rJwLvfBVsE79u84HV9GIteBmLBZRIvgKrLsJaIsI4StFCzt
 garIBmOPKuINmbxe95/bIm28hwDvJLSz4RiS1Blqyg0Fy5GopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADUoNkGg3siU/KiAG+pK2JgAMcbCDKpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jucpzyhXEFCbbRzzxKqrkidwfHqxBrCc70WKaDl8dN1pxq6kzl75Bo+CgLg/KjRZlSFc8pSN
 0EOvCopvKUp3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceTzEwy
 kWAmd+vADV1qaCUUlqU7LLSpjS3UQAKIG5Ebi8JSyMM+dylq4Y25jrLU91qVqC8iNb4HTXt6
 zmQqW41gLB7pdEP/7W2+xbAmT3EjpHRQxQ8/An/QmOv5QQ/b4mgD7FE8nCCs6wGdtzACADc4
 j5dwZP2AP0y4Y+lkQnVEcZUNpOV/c3UMxuC3X1yELAR3mH4k5K8Rry88A2SNW8wbJdcI2CzO
 xKK0e9CzMQNZSX3NMebd6r0Up13lva4SLwJQ9iONrJzjo5NmBhrFc2ETWqZxCjTnUclisnT0
 r/LIJ/3XR725UmKpQdaptvxMpdxnEjSPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BZpPQkU4DALKiOXW/HWsvwbYidyNT6Xfe8pI/SwJ+ClA+RDFJ5wH5nNvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QikLVV8bZr4m9ShTFXV1bT6VN40LPd7HAFE3K8FmItHKNYVLkZZJc
 hXyU5zdWqsfEmqdplzwr/DV9eRfSfhivirWVwLNXdT1V8cIq9DhkjM8QjbSyQ==
IronPort-HdrOrdr: A9a23:JtnFVa77WrNq9eOIuAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3AJ5z/LmgFSlAZGzdos6P4Ff/DjzJud1iFnVSJCW2?=
 =?us-ascii?q?EE104S5vLFXyN94pUup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ADnhxsQ8XgBZnT5KJ0DTDDr2Qf+g02ZXpFmVUqKw?=
 =?us-ascii?q?thM25KHF3Fii6yx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="120006801"
Date: Tue, 25 Jul 2023 16:40:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 1/2] tools/console: Add escape argument to configure
 escape character
Message-ID: <1848b8d5-e6c4-4928-a340-603481d9f96a@perard>
References: <20230712102917.37763-1-peter.hoyes@arm.com>
 <20230712102917.37763-2-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230712102917.37763-2-peter.hoyes@arm.com>

On Wed, Jul 12, 2023 at 11:29:16AM +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases.
> 
> Add --escape argument to console tool for this purpose.
> 
> Add argument to getopt options, parse and validate the escape character
> and pass value to console_loop.
> 
> If --escape is not specified, it falls back to the existing behavior
> using DEFAULT_ESCAPE_SEQUENCE.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

