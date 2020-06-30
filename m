Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0020EF56
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 09:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqAij-0006eN-0m; Tue, 30 Jun 2020 07:30:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dy0E=AL=tttech.com=prvs=443e4b87a=jan.ruh@srs-us1.protection.inumbo.net>)
 id 1jqAih-0006eI-O8
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 07:30:19 +0000
X-Inumbo-ID: 8ab6ddaa-baa3-11ea-85ce-12813bfff9fa
Received: from mail.tttech.com (unknown [217.19.35.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ab6ddaa-baa3-11ea-85ce-12813bfff9fa;
 Tue, 30 Jun 2020 07:30:16 +0000 (UTC)
IronPort-SDR: rM+8U2QEUf+c0nXTPJGgmcvVX800eNEt5ydJmBRrXbahfXebUNal0tCo2tSrzT58RCFFky6m+2
 anxDNrDLUtcbHS8VxAWEiigRnMSGgNuTCkiu/ph+XtWwnD4WBZ53AZk0DybHUVYpVywIXhrnBQ
 oVoxFZGfC5wVOE73a39qe4HxFbFCTKRYbNw9wrJXedg4yRmKxS6sMZH/zVKJJv1g1aySHN18gD
 hzfijrJEVgUQx4s/aiBDaRtocBkt6O8eQlnpeLxy/9mbA4PTdY2DtEhQ2lkKsd+uMRoDg2EBmS
 HXU=
X-IronPort-AV: E=Sophos;i="5.75,296,1589234400"; 
   d="scan'208";a="9465337"
Received: from unknown (HELO mail.tttech.com) ([10.108.0.226])
 by mail-int.tttech.com with ESMTP; 30 Jun 2020 09:30:15 +0200
Received: from EXVIE02.ds1.internal (10.108.0.226) by EXVIE02.ds1.internal
 (10.108.0.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 09:30:15 +0200
Received: from EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054]) by
 EXVIE02.ds1.internal ([fe80::4ccf:d313:b2a8:c054%6]) with mapi id
 15.01.1913.007; Tue, 30 Jun 2020 09:30:15 +0200
From: Jan Ruh <jan.ruh@tttech.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: AW: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Thread-Topic: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Thread-Index: AQHWTehUS5L/6eMJQEyE2773H88H5KjvLyGAgAAjyHb//+y6AIABg+n8
Date: Tue, 30 Jun 2020 07:30:14 +0000
Message-ID: <f28eeb9141a74dde97b9fb84080a99a2@tttech.com>
References: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>
 <20200629091823.GF735@Air-de-Roger>
 <af1c2ea2298a4115baf50b580caa0017@tttech.com>,
 <20200629101728.GH735@Air-de-Roger>
In-Reply-To: <20200629101728.GH735@Air-de-Roger>
Accept-Language: de-DE, en-GB, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.102.6.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

thanks for your time, your remark that you cannot see how it has to do with=
 the shared_info got me to step-by-step revert all changes I have done. Tur=
ns out a few weeks ago when implementing a sysctl I must have accidentally =
deleted the architecture specific syctl in the default case of the common s=
ysctl. This leads to Xen quietly defaulting to a x86_32 CPU.

Jan.
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@tttech.com =
immediately.

