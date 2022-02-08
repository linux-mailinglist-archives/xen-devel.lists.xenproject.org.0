Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D24AD5BD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268076.461855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO1D-00016b-Oh; Tue, 08 Feb 2022 10:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268076.461855; Tue, 08 Feb 2022 10:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO1D-00013Z-LD; Tue, 08 Feb 2022 10:46:43 +0000
Received: by outflank-mailman (input) for mailman id 268076;
 Tue, 08 Feb 2022 10:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHO1B-00013T-GJ
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:46:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c08d19-88cc-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:46:40 +0100 (CET)
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
X-Inumbo-ID: 64c08d19-88cc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UYtfxWoyRCUFFiNdmulv1uEuQNX6ueRjc0X4WY+zIbc=;
  b=GOQkgs1l7pJsfJ9Zi/QrqaTXhqn2LNe/by3MHnTffTc/Q8l7F6aYXIkQ
   7fqBdk33Evdrif5HGjHtP8sdbfIrIjFAJHLL3rcLg61UdEcwmpviUTlW1
   tUFn3zaa2rb2gy8mdSkMngyG1U33+tvuFFcLFHwD1/wVpmkqDRSFDwpWW
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XPRFmlf+0Q5GCVCUoNhSI4vGp2umYEJhy7jhePmiNX71uKrHSc7/DVELObAMRz2qVR3yY1Evdj
 n3XW9+KFtXH6jF5gaXBM1THQNCTrp+fYJZW3lcFd3E7NuRzHbywcTdG04z6d4LbMBuBKdpUgDR
 txvWlJFMqQMdr7/YzsCymLDY3ViBtZTubCnUhPvkorCwSXFe1BX1lux1CmAk0o61IzsNzTsvQ1
 9spsJMj6zDVJ7y7TgYyTw2Kf1JPdEIpOILYxXvFydehpPWNh9inMs8Mtc3soX6ELlVvgoadS8b
 IfrCuW7k8eGSd2nMNPu+OeNY
X-SBRS: 5.1
X-MesageID: 63720280
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fk1Tga4o7wzR0EW/6lPZvgxRtP7AchMFZxGqfqrLsTDasY5as4F+v
 mtNXG/TP62PYzTxfNl1Poqxp0NV6MOAy4QwTwZurS80Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 dBAkpupVAwTE5bmv90bUzBFQiF7BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRqmEP
 5BJMVKDajzbaTdKagkZVqkHhb6QiSTTcjFghlaK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGMJDwYNfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDY5Xtd3FPQn4zug8YDz2gCZL3VVTjt4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp+ZgPQ1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyL6LNkJvmAkfRwB3iM4ldjBO
 h67hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrUuNHsqT50r8jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9408HD7SlP3KHqNV7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:8IW4PKFXYoQSF6oqpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63720280"
Date: Tue, 8 Feb 2022 10:46:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/5] tools/libs/light: replace _libxl_list.h with
 _xen_list.h
Message-ID: <YgJKC79dDFY6gz2V@perard.uk.xensource.com>
References: <20220208070638.5909-1-jgross@suse.com>
 <20220208070638.5909-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208070638.5909-3-jgross@suse.com>

On Tue, Feb 08, 2022 at 08:06:35AM +0100, Juergen Gross wrote:
> Remove generating _libxl_list.h and use the common _xen_list.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

