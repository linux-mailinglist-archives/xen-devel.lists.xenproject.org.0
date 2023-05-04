Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651346F6DFE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529825.824663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaHE-00022T-Qx; Thu, 04 May 2023 14:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529825.824663; Thu, 04 May 2023 14:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaHE-00020m-Nm; Thu, 04 May 2023 14:49:48 +0000
Received: by outflank-mailman (input) for mailman id 529825;
 Thu, 04 May 2023 14:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYMk=AZ=citrix.com=prvs=481980579=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puaHD-00020b-10
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:49:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d01f25-ea8a-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:49:45 +0200 (CEST)
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
X-Inumbo-ID: e7d01f25-ea8a-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683211785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xqxetoyMuTWWLtSRIRr5hMNplwRXRxZMX6BsncNBeUw=;
  b=OgdmOvzSRIni0ODwPXnPyeHgGGIEiSeQG95HrhkRN6ulyxOlRzT4Ya9l
   KRTx6CHZqPZokC88Ac58Gev+Rf0uYyGE3zSVa58EC5Vqee8vjvIjWBMlD
   pmwnLdgcjaMQB3rOTgHpaRPRFloeOyEXtPnGl/5JOuuvnmygjzN+qZNJb
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106636820
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:06/cj6i7XSutAaAX/mgEg2MKX161SxAKZh0ujC45NGQN5FlHY01je
 htvCGCFP6uDMDf8Kt4ibd7joRkG7MSBmNFnGQI4pCo0EHgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQnNQkfUCKZl96oxeO7E9Ruut45K+XkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 jyYpDqpWEly2Nq3z2Tf6020hd70uhj9Aa4vMufmr9pbnwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmE0qfO6hyVLnQFRDVGLtchsaceRyEu1
 1KPt8PkA3poqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LEqS4k9n0EjHY2
 C2RoW41gLB7sCIQ//zlpxad2Wvq/8WXCFdvvW07Q15J8CtGebe3Wb6y+WTF6KdAdbubckObu
 1QLzp32AP81MX2dqMCcaLxTTOrxvqzVb2K0bU1HRMd4qWn0k5K3VcUJuWwleh80WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2NTRTKt4wVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2DHsmnl03/ieXPORZ5rIs43KamNLhlvMtoXi2Mm
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAGOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSebcV/SNCo4N9sCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:Y6K8Fq5ZXzBy4PPilQPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-Talos-CUID: 9a23:NGFFx24OkvYl+VFD6tssy1MtCP4XaG3h0nKBIxaFC1pzUrq5RgrF
X-Talos-MUID: 9a23:UhBTyAp6WsQ39osmVTIezzc8bt5X+6efM2c2l8wqhu/ea3VUCijI2Q==
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="106636820"
Date: Thu, 4 May 2023 15:49:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] build: don't export building_out_of_srctree
Message-ID: <30ef6706-5c01-441c-9c5e-08e578019166@perard>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
 <9e63c6e5-11cb-9f0e-b33e-0247b17e3785@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e63c6e5-11cb-9f0e-b33e-0247b17e3785@suse.com>

On Wed, Mar 29, 2023 at 12:22:16PM +0200, Jan Beulich wrote:
> I don't view a variable of this name as suitable for exporting, the more

We could rename it.

> that it carries entirely redundant information. The reasons for its

The patch replace building_out_of_srctree with abs_objtree and
abs_srctree which also carries redundant informations. abs_objtree can
probably be replaced by $(CURDIR), abs_srctree can be
recalculated from $(srctree).

> introduction in Linux commit 051f278e9d81 ("kbuild: replace
> KBUILD_SRCTREE with boolean building_out_of_srctree") also don't apply
> to us. Ditch exporting of the variable, replacing uses suitably.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This patch feels like obfuscation of the intended test. Instead of
reading a test for "out_of_tree", we now have to guess why the two paths
are been compared.

Anyway, there isn't that many use outside of the main Makefile, so I
guess the patch is kind of ok:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>


> For further reasons (besides the similar redundancy aspect) exporting
> VPATH looks also suspicious: Its name being all uppercase makes it a
> "non application private" variable, i.e. it or its (pre-existing) value
> may have a purpose/use elsewhere. And exporting it looks to be easily

This sounds like you don't know what VPATH is for, but I'm pretty sure
you do. If there's an pre-existing value, we just ignore it. If VPATH is
used by a program that our Makefile used and that program is intended to
be used by build system then that a bug in that program for not knowing
about makes' VPATH. So I don't think we need to worried about it been
exported.

> avoidable: Instead of setting it in xen/Makefile, it looks like it could
> be set in xen/scripts/Kbuild.include. Thoughts?

I'd rather not make that change unless there's a real issue with
exporting VPATH. We are more likely to introduce a bug than to avoid
one.

Thanks,

-- 
Anthony PERARD

