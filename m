Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C134897B2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 12:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255305.437464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6t3k-0001f2-HM; Mon, 10 Jan 2022 11:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255305.437464; Mon, 10 Jan 2022 11:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6t3k-0001cE-Dx; Mon, 10 Jan 2022 11:41:56 +0000
Received: by outflank-mailman (input) for mailman id 255305;
 Mon, 10 Jan 2022 11:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HJuU=R2=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6t3i-0001Zs-Su
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 11:41:54 +0000
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f34282e-720a-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 12:41:29 +0100 (CET)
Received: from nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr (HELO begin)
 ([194.199.1.52])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 12:41:27 +0100
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6t3G-00BIjn-Eo;
 Mon, 10 Jan 2022 12:41:26 +0100
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
X-Inumbo-ID: 3f34282e-720a-11ec-9ce5-af14b9085ebd
IronPort-Data: =?us-ascii?q?A9a23=3A2uCFRqvZWTTDfXocWzxRkc6OQefnVMFcMUV32f8?=
 =?us-ascii?q?akzHdYEJGY0x3mGRLCGCPMv+JN2Kgc9FyPN7l8k0CuZHXzNZgG1ds+HtgHilAw?=
 =?us-ascii?q?SbnLYTAfx2oZ0t+DeWaERk5t51GAjX4wXFdokb0/n9BCZC86yksvU20buCkUrS?=
 =?us-ascii?q?cY3kpHVYMpBoJ0nqPpcZo2+aEvvDpW2thifuqyyHuEAfNNwxcagr42IrfwP9bh?=
 =?us-ascii?q?8kejRtD1rAIiV+ni3eF/5UdJMp3yahctBIUSKEMdgKxb76rIL1UYgrkExkR5tO?=
 =?us-ascii?q?Nyt4Xc2UAT7HTO2BiiFIPCvTk20kT4HV0j/xT2Pk0MC+7jx2SltVsxdELqZyxQ?=
 =?us-ascii?q?w40OrHkleIGFh1JFCc4OrdJkFPCCSLl7JTLkBOun3zEhq8G4FsNFYQd8bcpKXp?=
 =?us-ascii?q?U/vJeLj0RBjiBiPix26mTUfR3i4IoK8yDFIYevHBn1nTVAOgrRbjHQr7W/plI0?=
 =?us-ascii?q?TEonMdMEP3CIc0DZlJHfBnGJhFCJFoTIJY/h/uzwGnydSVCr1CYrrZx5HLcpCR?=
 =?us-ascii?q?u1JD9PdyTfcaFLfi5NG7wSnnu+W3lRxAcLt2WjDuD7n+2gOKKwHm+V51XTOT9/?=
 =?us-ascii?q?OVtxleU3GAeAQAGE1q9u/iwzECkM++z4nc8okIGxZXePmTyJjUlYyCFnQ=3D?=
 =?us-ascii?q?=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AMYSUza3Vzqv+SOCQX0oOawqjBKMkLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SKGlfq+V8sjzuSWftN9VYgBCpTn/AtjjfZqsz/JICOAqVN/IYOClgg?=
 =?us-ascii?q?qVxepZgrcKrQeBJ8SHzJ856Ztd?=
X-IronPort-AV: E=Sophos;i="5.88,276,1635199200"; 
   d="scan'208";a="2250076"
Date: Mon, 10 Jan 2022 12:41:26 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Andrew Cooper <amc96@srcf.net>
Cc: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH 0/2] mini-os: remove device specific struct file members
Message-ID: <20220110114126.liis6f2pv5vfajqj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Cooper <amc96@srcf.net>, Juergen Gross <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20220107104706.9859-1-jgross@suse.com>
 <20220109011603.bymferaebanvvmud@begin>
 <25899482-4b0c-5fb4-5b02-226f75d1e5a6@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25899482-4b0c-5fb4-5b02-226f75d1e5a6@srcf.net>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Andrew Cooper, le lun. 10 janv. 2022 11:35:14 +0000, a ecrit:
> On 09/01/2022 01:16, Samuel Thibault wrote:
> > Juergen Gross, le ven. 07 janv. 2022 11:47:04 +0100, a ecrit:
> >> can only be applied after the Xen libraries have stopped using the
> >> related union members.
> > Ah, ok :) Was that submitted somewhere?
> 
> https://lore.kernel.org/xen-devel/20220107103544.9271-1-jgross@suse.com/T/#u

Ok!

Samuel

