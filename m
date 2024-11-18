Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571199D1991
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 21:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839515.1255309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8En-0000H2-CZ; Mon, 18 Nov 2024 20:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839515.1255309; Mon, 18 Nov 2024 20:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8En-0000EP-A1; Mon, 18 Nov 2024 20:20:45 +0000
Received: by outflank-mailman (input) for mailman id 839515;
 Mon, 18 Nov 2024 20:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EsGE=SN=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1tD8El-00008i-LR
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 20:20:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92630f73-a5ea-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 21:20:38 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 4AIKKQ0x075326
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 18 Nov 2024 15:20:32 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 4AIKKQo8075325;
 Mon, 18 Nov 2024 12:20:26 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 92630f73-a5ea-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijc0LjEwNC4xODguNCIsImhlbG8iOiJtYWlsaG9zdC5tNXAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkyNjMwZjczLWE1ZWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTYxMjM4LjU0NDI4Niwic2VuZGVyIjoiZWhlbUBtNXAuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
Date: Mon, 18 Nov 2024 12:20:26 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <ZzuhioHYhwercO04@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
 <467e46ad-d0d0-4217-9b70-b48e3c7a1fb5@suse.com>
 <ZzaRnFLMq9OY3jj6@mattapan.m5p.com>
 <0f6fb528-7432-42b9-8605-58d95621509d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f6fb528-7432-42b9-8605-58d95621509d@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Fri, Nov 15, 2024 at 07:46:07AM +0100, Jürgen Groß wrote:
> On 15.11.24 01:11, Elliott Mitchell wrote:
> > On Wed, Nov 13, 2024 at 08:20:02PM +0100, Jürgen Groß wrote:
> > > On 13.11.24 18:25, Elliott Mitchell wrote:
> > > > 
> > > > Hopefully I'm not making knave speculation here.  Might this be the
> > > > simplest of issues, just it was missed due to being too obvious?
> > > 
> > > I don't agree with your analysis, see above.
> > 
> > Okay.  I was asking since it looked a bit odd and there has been no news
> > on this issue (unless I missed some patch flying by).
> > 
> > I don't know how large the impact of this is.  I wouldn't be surprised if
> > this turned out to overwhelm all my other efforts at performance
> > improvement.
> > 
> > Any news on your efforts to track this down?
> 
> ENOTIME up to now.
> 
> Did you try to set the spurious threshold to e.g. 2 instead of the default
> of 1? In case that helps it might be a good idea to either change the default
> or to at least add a boot parameter for setting the default.

Appears it may somewhat, but not fully alleviate the situation.

Just to make sure this is stated.  The spurious events are being
observed on the back-ends of block and network devices.  The
corresponding front-ends aren't recording any spurious events.

I now wonder whether the network back-end I'm attempting to place in a
DomU will observe spurious events.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



