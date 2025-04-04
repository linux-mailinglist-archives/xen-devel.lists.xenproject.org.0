Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6194A7BE5C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 15:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938252.1339169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hSm-0000GA-7N; Fri, 04 Apr 2025 13:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938252.1339169; Fri, 04 Apr 2025 13:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hSm-0000Dx-3e; Fri, 04 Apr 2025 13:52:04 +0000
Received: by outflank-mailman (input) for mailman id 938252;
 Fri, 04 Apr 2025 13:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDNZ=WW=bounce.vates.tech=bounce-md_30504962.67efe3ff.v1-c4977fde58834b4ea8bf96ffc874577c@srs-se1.protection.inumbo.net>)
 id 1u0hSk-0000Dr-MW
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 13:52:02 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb23e694-115b-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 15:52:01 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZTg5C3W5Tz705lr0
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 13:51:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c4977fde58834b4ea8bf96ffc874577c; Fri, 04 Apr 2025 13:51:59 +0000
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
X-Inumbo-ID: fb23e694-115b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743774719; x=1744044719;
	bh=rJ3WicANQ0WPezWD+WXFF9t4wnT8sFZBUMBsnaJAbQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SnfxkGa2ApAzjcqu3InhGa57mO7SmUSwU+wSgnrnhv0peqTgM0201649q931XMC+l
	 I2sjNfAm+xrFIYOq19HEJe6BCWVb4xrE/bteIeybsxW6MFKWE06uut8jDXUOLVeISn
	 Ddfi4vrQANTFyejv2cxc7mK6m/bEkNIKPCc9S2O9wEvUnogQzA0NsnzCqrt6vi7gXD
	 ORfkTuRPmvnzWf8du6bpRcf0MshR7rwKZ0aXRwj65RO19JXcjIiFba4h9t2eRlObRw
	 bcec3SzxYV/tAKk3C20VuumruNkf/w1S++JhHwsFZVfxqnvMfAyiUu+6MTFX+/6hHI
	 1aYgunB+/BPWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743774719; x=1744035219; i=anthony.perard@vates.tech;
	bh=rJ3WicANQ0WPezWD+WXFF9t4wnT8sFZBUMBsnaJAbQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ij97m7xbc4eCiaJK7Bn//eXsfnfIvDYwF792U/xMJo82D1P6062bwwhtK780zvdVt
	 eqCJVsVwY4Sity2EIbDyTPRirH7mC9Vw4q50rlqwR7vZG3JzHp7572yF1gkZcWCB5w
	 v5KEALJWoUaDykMwseyDdWZun5+tGJUd7Hkquw543CIoJ6xDf7Fv0bPLZDrHAMOp5S
	 GnlykJd0LmljNUby3qT6DKV/HpPRFzRB4ED7H2h0O1gvwUt/plRL/A9yNV6b3huYNU
	 G1ikuFcg0Y4JYZDpbOZCtguCsq+lYLrtCbqW/Swv2EW5gbgjBpfmUpakCFGxjbT0bJ
	 tB4Ib64uPHqFg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=201/1]=20tools/libxl:=20search=20PATH=20for=20QEMU=20if=20`QEMU=5FXEN=5FPATH`=20is=20not=20absolute?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743774718896
To: Hongbo <hehongbo@mail.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z-_j_vNCclvbvaFS@l14>
References: <20241223031753.13709-1-hehongbo@mail.com> <20250330160304.20899-1-hehongbo@mail.com>
In-Reply-To: <20250330160304.20899-1-hehongbo@mail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c4977fde58834b4ea8bf96ffc874577c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 13:51:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Mar 31, 2025 at 12:03:04AM +0800, Hongbo wrote:
> `QEMU_XEN_PATH` will be configured as `qemu-system-i386` with no clue where, if
> `--with-system-qemu` is set without giving a path (as matched in the case `yes`
> but not `*`). However, the existence of the executable is checked by `access()`,
> that will not look for anywhere in $PATH but the current directory. And since it
> is possible for `qemu-system-i386` (or any other configured values) to be
> executed from PATH later, we'd better find that in PATH and return the full path
> for the caller to check against.
> 
> Signed-off-by: Hongbo <hehongbo@mail.com>
> ---
> v2:
>  - Identify absolute/relative paths with their first char (being `/` or not).
>  - Put the case inside a block `{}` to address `clang` warnings about the new
>    variable.
>  - Avoid unnecessary string duplications.
>  - Parity of using `{}` block on both sides of `if` statements.
>  - Use `libxl__abs_path()` to get absolute paths.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



