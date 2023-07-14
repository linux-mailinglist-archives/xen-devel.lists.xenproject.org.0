Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B7753021
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 05:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563484.880674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK9jw-00032x-Py; Fri, 14 Jul 2023 03:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563484.880674; Fri, 14 Jul 2023 03:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK9jw-0002zi-Ku; Fri, 14 Jul 2023 03:45:08 +0000
Received: by outflank-mailman (input) for mailman id 563484;
 Fri, 14 Jul 2023 03:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uaxh=DA=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qK9ju-0002za-UX
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 03:45:06 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d00a0794-21f8-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 05:45:03 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36E3ijv1000052
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 23:44:51 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36E3iiCm000051;
 Thu, 13 Jul 2023 20:44:44 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d00a0794-21f8-11ee-b239-6b7b168915f2
Date: Thu, 13 Jul 2023 20:44:44 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values
Message-ID: <ZLDErKk8ziBuh1ZJ@mattapan.m5p.com>
References: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
 <ZLCj62XMBbspMWbY@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLCj62XMBbspMWbY@mail-itl>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Jul 14, 2023 at 03:24:59AM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 13, 2023 at 05:16:40PM -0700, Elliott Mitchell wrote:
> > The better to encourage moving to setting via string mode names.
> 
> The numeric values needs to remain documented, otherwise interpreting
> pre-existing configs (that may use them) will be tricky.

Problem is the way it is documented tends to encourage continued use of
the numeric values (notice how reports irt Zen 4 mention "tsc_mode=1").

`parse_config_data()` suggests the appropriate string value, so nominally
that should take care of older configurations.  If "xen-tscmode" really
needs to continue mentioning the numeric value, it should be in
parentheses and with "old value" to suggest moving away from that.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



