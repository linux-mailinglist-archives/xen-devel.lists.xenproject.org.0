Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD99D387E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 11:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841003.1256518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDi4M-000848-A9; Wed, 20 Nov 2024 10:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841003.1256518; Wed, 20 Nov 2024 10:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDi4M-00081m-7C; Wed, 20 Nov 2024 10:36:22 +0000
Received: by outflank-mailman (input) for mailman id 841003;
 Wed, 20 Nov 2024 10:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uiNg=SP=bounce.vates.tech=bounce-md_30504962.673dbb9d.v1-5b22aaac3f6847c9ac33542cd5e1380b@srs-se1.protection.inumbo.net>)
 id 1tDi4K-00081g-LZ
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 10:36:20 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4434438a-a72b-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 11:36:15 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xtd7d1WX9z3sPRqZ
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 10:36:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5b22aaac3f6847c9ac33542cd5e1380b; Wed, 20 Nov 2024 10:36:13 +0000
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
X-Inumbo-ID: 4434438a-a72b-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjQ0MzQ0MzhhLWE3MmItMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDk4OTc1LjE0ODE1OCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2RiYjlkLnYxLTViMjJhYWFjM2Y2ODQ3YzlhYzMzNTQyY2Q1ZTEzODBiQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732098973; x=1732359473;
	bh=CTl+oQL607saCMY7it/Nb12fMfn5nfirlTEQZcHciXQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TffVtotLeaQQhLMAYGtSzmZjhFGs976s3bEhMOa3XgYXQpfMF00t1Hsn260Yh7c1z
	 QSLtK97L4YLzH/f/6ceNtW53R4++dIrI9CH3JGcToYxEM947qD+8TXlzLvkKO4OoyV
	 x4hDkApq6yK7kq4HMYf9cw5XBLWkdb1I/PEwSifEkQAjBj3arZljQfbpSbW15rGE3p
	 pwSRebJYmSNWPqsSfIFN8i0mK1+pSqBVPZrn+TxYEGesNvfjePrlHorsYFYdlEGt3V
	 LO/ojCILgAYQN7OCj5D8K3y/ob3SoPXeRGGLBfyDzBkq57gOveym8Gq+5hXDIjhWMF
	 jGAvkpIFgeQ/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732098973; x=1732359473; i=anthony.perard@vates.tech;
	bh=CTl+oQL607saCMY7it/Nb12fMfn5nfirlTEQZcHciXQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1LY4nGzwLbuFpUy1StucxD1NW4jUjJsfGn5yFfMIEaHAJw4y+P2Ta6AoB0iTZ9kIl
	 Qwqo8I6SA0KDBIldUJSE2dlPol78VAnkf2S/icaegdLdK4JxTTkXGAUQvNE1g9jniD
	 tQ7UjRyt4o/AhNOhK5hVMOua/BInMgv4Tph8qQHTR0dPlS1lhbglMvZ2kFw/X6xbS6
	 m+cpZvvyFakCmj9Tqu8bJOigrqnEXS//t5PJYH9PNQX5DtAvY88F5BYzKtnXyGULU0
	 fj2ZS0ipnYp3XRm6hJxOzQEUNC6a84/jnIMGi8DhUguSzEISKePOqbV1o79n+b6tA0
	 kcYP98YC/IjXw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=203/3]=20CI:=20New=20stage=20"containers"=20to=20rebuild=20some=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732098971823
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>, committers@xenproject.org
Message-Id: <Zz27m452NC9gDlWo@l14>
References: <20241119101449.49747-1-anthony.perard@vates.tech> <20241119101449.49747-4-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2411191347100.1160299@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2411191347100.1160299@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5b22aaac3f6847c9ac33542cd5e1380b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241120:md
Date: Wed, 20 Nov 2024 10:36:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Nov 19, 2024 at 01:47:16PM -0800, Stefano Stabellini wrote:
> On Tue, 19 Nov 2024, Anthony PERARD wrote:
> > Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
> > set. This is to be use with a scheduled pipeline.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

I've scheduled a pipeline to run once a month so the Arch Linux and
Tumbleweed containers we'll get rebuilt regularly. Both container are
already up-to-date because I failed to use a different registry during
one of my test, but the build-jobs still works.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

