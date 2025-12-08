Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC30CADE9A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 18:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181057.1504148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSf2X-0001om-0t; Mon, 08 Dec 2025 17:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181057.1504148; Mon, 08 Dec 2025 17:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSf2W-0001mL-UM; Mon, 08 Dec 2025 17:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1181057;
 Mon, 08 Dec 2025 17:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3Ie=6O=bounce.vates.tech=bounce-md_30504962.69370acb.v1-7e7890742db94fc4aa7e377a8804a689@srs-se1.protection.inumbo.net>)
 id 1vSf2W-0001mF-7V
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 17:28:48 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5920d3f4-d45b-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 18:28:45 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dQ88r00dSzFCWfCb
 for <xen-devel@lists.xenproject.org>; Mon,  8 Dec 2025 17:28:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7e7890742db94fc4aa7e377a8804a689; Mon, 08 Dec 2025 17:28:43 +0000
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
X-Inumbo-ID: 5920d3f4-d45b-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765214924; x=1765484924;
	bh=QY17EXRyxEuJNASCYm1LCaEabyJfLQz57lw8TKdiVFg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hB/m+SF0dfapydP8qKr5qz/zp32LYMDPXvrX9ROidu2x1GDH54Fd7jEyFoZsyAplr
	 bYrnKCAdJkK3gN9EQd4ybLZV01XBbJJMg2kNBoYGY0EG/5UIdl+wRUBW9BiZ2AEGdM
	 yDsG8kFaI8Kc68Vwv6AhHXbew0FliiAEUYMrGv/88vLWApStgDgpduTYZ23PQ0+CMC
	 W4UbCbhaXQw+nGgwcjn22TkNjUp1aZT7eRUMnOKdSNckzNz7gBrphiTn0hfAUjtKcF
	 nKeskspa9CHCPUIZN26CzXQjyDnKzTz2/R8Q7mRsujYwtoORGR7tpARF/XCq2lEq5h
	 uuIVc6RAcGQvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765214924; x=1765475424; i=teddy.astie@vates.tech;
	bh=QY17EXRyxEuJNASCYm1LCaEabyJfLQz57lw8TKdiVFg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yMPopVIKupCY2cSyAaxDYGKvc8Fjpm+tc34kXXLPuE8DrPB88c3rSr08OoBptKvzi
	 8eb9N/Ov6/y7YnynIMbzq/hXHz8grFWJz66Hsq5SFhRHIur/DLpEUhsESZsxZm1m+w
	 LMtJj4vXGqABJ6U3WkviaWL0ZTntcflAXZMdA50QSHErLU5P28bnVizKj4mQ+9erwW
	 l4iP1o2aIWHqHjf5LgjvCGYx2nPWx69b19ae1eImPtm+cdEnk9FIiJfnJWf3erQlo5
	 XtvqdZfvfVOwX52UpwHE4LA9e4p619xBry6GN6VaeoOu79c92T0WIS7ZGXwpvxDRWl
	 av1LPXeHoTo2w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=2003/19]=20xen/riscv:=20introduce=20VMID=20allocation=20and=20manegement?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765214921864
Message-Id: <debd3ec1-2836-4481-aea9-833f04601a7a@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman" <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com> <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
In-Reply-To: <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7e7890742db94fc4aa7e377a8804a689?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251208:md
Date: Mon, 08 Dec 2025 17:28:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 24/11/2025 =C3=A0 13:36, Oleksii Kurochko a =C3=A9crit=C2=A0:
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 34004ce282..6c4bfa3603 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enab=
led.
>   * `silo`: this will deny any unmediated communication channels between
>     unprivileged VMs.  To choose this, the separated option in kconfig mu=
st also
>     be enabled.
> +
> +### vmid (RISC-V)
> +> `=3D <boolean>`
> +
> +> Default: `true`
> +
> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation w=
hich
> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flus=
hes
> +to be performed without the overhead of a complete TLB flush.

Should we regroup all asid/vpid/vmid (which are pretty much the same 
thing with different names and for different arch) under a single 
command-line option ?

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



