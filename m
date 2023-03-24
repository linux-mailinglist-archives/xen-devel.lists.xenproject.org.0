Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A276C7DAB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 13:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514292.796397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfg8i-0007kA-Aw; Fri, 24 Mar 2023 12:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514292.796397; Fri, 24 Mar 2023 12:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfg8i-0007hL-88; Fri, 24 Mar 2023 12:03:24 +0000
Received: by outflank-mailman (input) for mailman id 514292;
 Fri, 24 Mar 2023 12:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6lt=7Q=citrix.com=prvs=440da7b32=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfg8g-0007hD-KC
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 12:03:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbdf39ae-ca3b-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 13:03:19 +0100 (CET)
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
X-Inumbo-ID: dbdf39ae-ca3b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679659399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VxOkLmVioD22t6pX8LQA6dFCs3P7EfUD1NXxmvOb3/g=;
  b=eXt3E583AB4Y+SoDxMFnTqX1DuKK3FCbXpleQ+x/FGfALdhEiyP/Dw9S
   1KpHNENzUhDIo4g98XskAnp0ZPRo4IZF9lhnYhK1+PFwVDiwPIa4hWwsw
   Nt7aitkY0vVGy7mJjc0WgN2KKJjdmAa6dvj1BTadnuBGd7D+edVEVuuZ0
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100972956
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qPMKzKxsDbj1RKQfG9N6t+cYxirEfRIJ4+MujC+fZmUNrF6WrkVTz
 TEcX2GAP63fYWLxLtByaoW+9EsC6JPQyYJmTlZkrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVlc7
 cURDwIWUh2Gnfvp6fWeFLA9mNt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNxhfH/
 DOboQwVBDkrJOGukhCjw0mqpcLEl3rFAqYwRJ63o6sCbFq7mTVIVUx+uUGAifu2kEmlQPpEN
 lcZvCEpqMAa9kamU938VB2Qu2Ofs1gXXN84O+Qi5RuE0Kb88wufDGkYVXhRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQId7sPquo0bkhPFRdElG6mw5uAZAhmpn
 WrM9nJnwexO04hSjf7TEU37byyEnorRdwcS1B7rU2e/91xQI6v7Pt229g2OhRpfF7p1XmVtr
 VBdxZfPsrpTVcHU/MCeaL5TRe/0vp5pJBWZ2AcyRMd5qlxB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtdiONLKimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05k2vrFrlAieZ1mHxWKYbvqXfTkXyaPUe2PibJGd/pznPXBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqzGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 ijhBRUGmQan2iKvxMfjQikLVY4DlK1X9RoTVRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:Qlj0R6hgczlKHHZarTGGKv29CnBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.98,287,1673931600"; 
   d="scan'208";a="100972956"
Date: Fri, 24 Mar 2023 12:03:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, <aperard@xenbits.xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [adhoc test] 179901: regressions - trouble:
 blocked/broken/fail/pass
Message-ID: <0187b2ff-5328-417d-9efe-5ab8933b4ce1@perard>
References: <E1pfV8U-0006eX-2p@osstest.test-lab.xenproject.org>
 <0b1181a1-5a96-b3e8-ffd8-6f256ebbceae@suse.com>
 <145d84a7-b3dd-f578-3c8b-10a5aba53491@suse.com>
 <0593df9b-f8ad-0042-e024-354623f163e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0593df9b-f8ad-0042-e024-354623f163e6@suse.com>

On Fri, Mar 24, 2023 at 12:16:10PM +0100, Juergen Gross wrote:
> Next try.
> 
> Anthony, could you please use this patch instead of the previous one?

I've created flight 179924, with:
    https://xenbits.xen.org/gitweb/?p=people/aperard/linux.git;a=shortlog;h=refs/heads/0593df9b-f8ad-0042-e024-354623f163e6@suse.com

Cheers,

-- 
Anthony PERARD

