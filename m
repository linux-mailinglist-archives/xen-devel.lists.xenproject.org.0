Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89E92F79E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 11:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757838.1166974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSCGv-00007n-R2; Fri, 12 Jul 2024 09:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757838.1166974; Fri, 12 Jul 2024 09:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSCGv-00004v-NI; Fri, 12 Jul 2024 09:08:57 +0000
Received: by outflank-mailman (input) for mailman id 757838;
 Fri, 12 Jul 2024 09:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+Pa=OM=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1sSCGt-0008WV-Fd
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 09:08:55 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c14f237-402e-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 11:08:53 +0200 (CEST)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 12 Jul 2024 11:08:52 +0200
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
X-Inumbo-ID: 5c14f237-402e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:in-reply-to:references:
   subject:mime-version:content-transfer-encoding;
  bh=7g0fKjhpMlrZxBLWEzC4RRh2phln2fgoWmgNs0gjCms=;
  b=D3JpZo5PGLilS6flWl9hj9U5pFQmJ3vQ+09lq/urKkN4ABSVReyTH5bN
   a7EO3CsVw8hhl2If1khFbIUSFFCZ7P7XerOrhcF9UdTQdfRQ3hL1Vj+Uz
   ytXY2YmiaZkcK8/AXyIHunrhKjmo9q0ayFF2GYxrr96ejdL4hAqmRMdDE
   I=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=fonyuy-asheri.caleb@inria.fr; spf=None smtp.helo=postmaster@zcs2-store8.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  fonyuy-asheri.caleb@inria.fr designates 128.93.142.6 as
  permitted sender) identity=mailfrom; client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="fonyuy-asheri.caleb@inria.fr";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 include:mailout.safebrands.com
  a:basic-mail.safebrands.com a:basic-mail01.safebrands.com
  a:basic-mail02.safebrands.com ip4:128.93.142.0/24
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:89.107.174.7 mx
  ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.09,202,1716242400"; 
   d="scan'208";a="175197671"
X-MGA-submission: =?us-ascii?q?MDEKUBlWgdIxsP/gHZqI7XG3Lzc0H9+QR7ha1e?=
 =?us-ascii?q?HzWc+B0GNVOLvsKusa47+4ZyPHA5OqteOcaZCS9j3/Gxp5pZ/9u1xGY2?=
 =?us-ascii?q?gpQmwSWlanKGMPiLsVe2KIi4yTLi8QIsMBn4ickJoAYqCzy/4yg7m2fq?=
 =?us-ascii?q?NyWQ0VScp6TxJQ/lfa2kyP4g=3D=3D?=
Date: Fri, 12 Jul 2024 11:08:52 +0200 (CEST)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <987491818.2978050.1720775332531.JavaMail.zimbra@inria.fr>
In-Reply-To: <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr> <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [131.254.23.3]
X-Mailer: Zimbra 10.0.8_GA_4611 (ZimbraWebClient - GC126 (Linux)/10.0.8_GA_4611)
Thread-Topic: Help with Understanding vcpu xstate restore error during vm migration
Thread-Index: Mdo1HdJ6czOeuY10mb1m80kXFnpGYw==

Hi Andrew,


>> I was able to locate the failure point to the file
>> xen/arch/x86/domctl.c=A0 with the following check.
>>=20
>> if( evc->size<PV_XSAVE_HDR_SIZE||
>> evc->size>PV_XSAVE_SIZE(xfeature_mask) )
>> gotovcpuextstate_out;
>=20
> It is certainly more complicated than that.
>=20
> What that's saying is that Xen doesn't think that the size of the blob
> matches expectations.  That said - I'm in the middle of rewriting this
> logic because lots of it is subtly wrong.


Following from the check above, I have this other check in the same code bl=
ock.=20

if ( evc->size =3D=3D PV_XSAVE_HDR_SIZE )
    ; /* Nothing to restore. */
else if ( evc->size < PV_XSAVE_HDR_SIZE + XSTATE_AREA_MIN_SIZE )
    ret =3D -EINVAL; /* Can't be legitimate data. */
else if ( xsave_area_compressed(_xsave_area) )
    ret =3D -EOPNOTSUPP; /* Don't support compressed data. */
else if ( evc->size !=3D PV_XSAVE_SIZE(_xcr0_accum) )
    ret =3D -EINVAL; /* Not legitimate data. */


What do you consider here as legitimate / non-legitimate data ?=20


>=20
> ~Andrew

Caleb

