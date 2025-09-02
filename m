Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BBB40A7D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 18:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107066.1457619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utToG-0004eh-D5; Tue, 02 Sep 2025 16:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107066.1457619; Tue, 02 Sep 2025 16:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utToG-0004ce-A5; Tue, 02 Sep 2025 16:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1107066;
 Tue, 02 Sep 2025 16:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqmK=3N=bounce.vates.tech=bounce-md_30504962.68b71a43.v1-5e1a612a322445909a6d6fba84a1902f@srs-se1.protection.inumbo.net>)
 id 1utToE-0004cY-AX
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 16:24:38 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b193d1-8819-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 18:24:36 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cGWKb0WjMz2K26vj
 for <xen-devel@lists.xenproject.org>; Tue,  2 Sep 2025 16:24:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5e1a612a322445909a6d6fba84a1902f; Tue, 02 Sep 2025 16:24:35 +0000
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
X-Inumbo-ID: 50b193d1-8819-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756830275; x=1757100275;
	bh=n5RkPVqtiuLNefJ34qS3+Xaj6pVCICTdq8QdOKNDxko=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nGmV4vFkkPBfnKvfKG8LEa1C8lBK4P3wQf1a58J/t646s2N404RQiEwUZ0iQzTodj
	 myAeMvU9YV9jmdZ2fWRjlAsqdEB0gRuav3svHn0rNp07mQLBiHeFDAZq+ptDpZZ01L
	 hnwbW+Juy8iMmz9FtGaA4/v3cazfrfwyv4WH9uYL52kwVDIyms0PoLngz8/NgZ3Dyd
	 EciyApEPTvt4WB+o7cao9/IDI1hWhIBy31/8doTv4a+8wtwzeMv6jwyZT9e1q+kYk1
	 9DOjkua0X3rCp+5hxNbdhX2bO8fWnMcQ28Pe6fL/zO6MaFlpqcF2eeOSNQtzjnHr+V
	 BGy+SlC0RHGcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756830275; x=1757090775; i=teddy.astie@vates.tech;
	bh=n5RkPVqtiuLNefJ34qS3+Xaj6pVCICTdq8QdOKNDxko=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WkiL5MNzWk7UeBBXh7/qF4HNn9cUYM0YiqTDzUYpZcljyPl/81v3xZ5ApGtkGAaez
	 8c/5lctQXG+HM0/GxrTDkNvGcGxLBpfWluvFf/xhxUS7rlgWAM5ViH3oPs7HtdkeEh
	 aRQMTK9lWupL0Xd0wOgaxNB9fxYSaoaTfCHqF4ms4YsYsvVYD4tKxpqjrYVULbNqMz
	 m0nLGj/gktVXKvNsgug6IbvSUibZ0UeAl3o+YaGawbmniqmyWb4+ZzDCg5uXg2daL6
	 FrmaiDsdr5NHBh9v9cUb9EV6gXav6DPaizvZKq6U7dO6A/MVNP7ckFKCGNSWBe6StN
	 c3YdY3Haca5iQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5.10.y]=20xen:=20replace=20xen=5Fremap()=20with=20memremap()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756830272879
Message-Id: <d4d5ce1f-8bcf-46c3-a1a5-f509375e80e9@vates.tech>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: xen-devel@lists.xenproject.org, stable@vger.kernel.org, "Juergen Gross" <jgross@suse.com>, "kernel test robot" <lkp@intel.com>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>, "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Jiri Slaby" <jirislaby@kernel.org>
References: <4cc9c1f583fb4bfca02ff7050b9b01cb9abb7e7f.1756803599.git.teddy.astie@vates.tech> <2025090203-clothes-bullish-a21f@gregkh>
In-Reply-To: <2025090203-clothes-bullish-a21f@gregkh>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5e1a612a322445909a6d6fba84a1902f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250902:md
Date: Tue, 02 Sep 2025 16:24:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 02/09/2025 =C3=A0 13:18, Greg Kroah-Hartman a =C3=A9crit=C2=A0:
> On Tue, Sep 02, 2025 at 09:28:32AM +0000, Teddy Astie wrote:
>> From: Juergen Gross <jgross@suse.com>
>>
>> From: Juergen Gross <jgross@suse.com>
>>
>> [ upstream commit 41925b105e345ebc84cedb64f59d20cb14a62613 ]
>>
>> xen_remap() is used to establish mappings for frames not under direct
>> control of the kernel: for Xenstore and console ring pages, and for
>> grant pages of non-PV guests.
>>
>> Today xen_remap() is defined to use ioremap() on x86 (doing uncached
>> mappings), and ioremap_cache() on Arm (doing cached mappings).
>>
>> Uncached mappings for those use cases are bad for performance, so they
>> should be avoided if possible. As all use cases of xen_remap() don't
>> require uncached mappings (the mapped area is always physical RAM),
>> a mapping using the standard WB cache mode is fine.
>>
>> As sparse is flagging some of the xen_remap() use cases to be not
>> appropriate for iomem(), as the result is not annotated with the
>> __iomem modifier, eliminate xen_remap() completely and replace all
>> use cases with memremap() specifying the MEMREMAP_WB caching mode.
>>
>> xen_unmap() can be replaced with memunmap().
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> Link: https://lore.kernel.org/r/20220530082634.6339-1-jgross@suse.com
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech> [backport to 5.10.y]
>> ---
> 
> Why is this needed for 5.10.y at all?  What bug does it fix?  And why
> are you still using Xen on a 5.10.y kernel?  What prevents you from
> moving to a newer one?
> 

This patch is only useful for virtual machines (DomU) that runs this 
Linux version (a notable Linux distribution with this kernel branch is 
Debian 11); it's not useful for Dom0 kernels.

On AMD platforms (and future Intel ones with TME); this patch along with 
[1] makes the caching attribute for access as WB instead of falling back 
to UC due to ioremap (within xen_remap) being used improving the 
performance as explained in the commit.

[1] x86/hvmloader: select xen platform pci MMIO BAR UC or WB MTRR cache 
attribute
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D22650d6054625be1=
0172fe0c78b9cadd1a39bd63

> thanks,
> 
> greg k-h
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



