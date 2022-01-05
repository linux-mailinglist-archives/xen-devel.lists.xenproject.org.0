Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB14856A4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 17:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253653.434912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5992-0006Aa-9W; Wed, 05 Jan 2022 16:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253653.434912; Wed, 05 Jan 2022 16:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5992-00068w-62; Wed, 05 Jan 2022 16:28:12 +0000
Received: by outflank-mailman (input) for mailman id 253653;
 Wed, 05 Jan 2022 16:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgQ=RV=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n5990-0005iD-9l
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 16:28:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7518c4b4-6e44-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 17:28:08 +0100 (CET)
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
X-Inumbo-ID: 7518c4b4-6e44-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641400088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wos4K3N2PVVodYl3En9oL6XQ8hoxvEjkJHh4Begzc58=;
  b=M7IckGamLgG3H4RMjggwMnQfBEX6tPBln4NcefSzQtELiEn3j7aFJNwK
   CjJU7c0yWnUEYZK9KIuwubdU3mM5KYZo2YIe/LcK+FGMQ8MzWKYeC9xXP
   KuhZFYYH42O1Nh32Z+EzohJlMHsPYezoeF/kM5IZdh16gBHvd010fgRNK
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XHIPAuPwYyJwwg62wr6zuD4L/xiOk4kFZ7a9HZYqyISgkJAnXirC1s8wA8U/I/uGJmKXhQQ0oC
 KQlbEPFcTkyrWcb3bKmB9RENiZtNH33bKFcezxIacPPJvt/HG2ZtC8hYsUPJo3tbILU/cOsL5a
 nL+TnEu2BJeazfWXKXWoi1ML/od01h+KgFv2BwJ4xjbH/WiXcDB1h4qF9UEtf7W+2Q+sT5234A
 ClBtn4GEMzaaPEC9HRr3v5zaekFHDy6zgnWA4RkNwAlWhz1rajwvHRvPWWmSODb1OMcbxUvEm9
 8pKplmGoTpuIYnkSk+WCVVxg
X-SBRS: 5.1
X-MesageID: 63481991
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qjIxy6r5bl+/VrtALrtrMOzmZvxeBmLsYhIvgKrLsJaIsI4StFCzt
 garIBmOOfnfZmLwftogPI7i/EwA78LSytdkHlZqqy9jFXsUpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IDkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYyPcyYrGYjiovs2CQJXTHhjEqhn8YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZFFOWM+PU2ojxtnNQhNAp4kvM2R3GTtKG0Epgi2mqZo7D2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PLGl8PpjmFK722kSAx1QWFemydG9i1WiQPpZJ
 lYY8DsopLQv7kHtQtSVdw21pjuZpRMGQPJUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8vQyIGCoyCEE4egReVgRausTMpaA6t0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9HwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8Vxn9hO0yT6FWy13N2YDBw3WirjUWWzC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFbcpng+PBDKgz6FfK0QfUcXY
 snznSGEVy1yNEia5GDuG7d1PUEDm0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVBhUFlQGh3CKfcm1nqBlLMdvSYHq2llpjVQREALpi8yJLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:YjmmmqNm91zuJMBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.88,264,1635220800"; 
   d="scan'208";a="63481991"
Date: Wed, 5 Jan 2022 16:27:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Christian Kujau <lists@nerdbynature.de>
CC: xen-users <xen-users@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>
Subject: Re: qemu-xen is unavailable
Message-ID: <YdXHDCUqpqV+E2hO@perard>
References: <8b68322f-1da7-962d-8f64-dea1e11525@trent.utfs.org>
 <f0877063-56ff-1c72-ae51-fa6ffea453ab@trent.utfs.org>
 <CAFLBxZZsCuqNrc=1dBVL_6V3rBv_iaN5btmbkcDxK4Bq1faRhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFLBxZZsCuqNrc=1dBVL_6V3rBv_iaN5btmbkcDxK4Bq1faRhg@mail.gmail.com>

CC xen-devel

On Tue, Jan 04, 2022 at 11:52:21AM +0000, George Dunlap wrote:
> > On Sun, 19 Dec 2021, Christian Kujau wrote:
> > > # xl create -f /etc/xen/debian.cfg
> > > Parsing config from /etc/xen/debian.cfg
> > > libxl: info: libxl_create.c:121:libxl__domain_build_info_setdefault:
> > qemu-xen is unavailable, using qemu-xen-traditional instead: No such file
> > or directory

Looking at the original email, the domain config file has type="pvh", so
I don't think qemu is actually needed. And the domain is starting fine,
so this message isn't really needed and would be a bug I guess.

I think it comes from libxl trying to figure out which QEMU to use even
if it isn't going to be needed. And since there's no qemu to be found,
the message is printed, even when qemu isn't needed.

I guess you have this message because you didn't install a qemu package
(or qemu-xen), but you don't need the package as you are only starting a
PVH guest.

The bug here is that libxl shouldn't print this message for PVH guest
because it's confusing.

Thanks,

-- 
Anthony PERARD

