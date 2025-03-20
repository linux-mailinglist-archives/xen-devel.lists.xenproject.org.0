Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64DEA6A36C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921596.1325407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCyx-0003Rh-AR; Thu, 20 Mar 2025 10:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921596.1325407; Thu, 20 Mar 2025 10:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCyx-0003Qk-73; Thu, 20 Mar 2025 10:18:35 +0000
Received: by outflank-mailman (input) for mailman id 921596;
 Thu, 20 Mar 2025 10:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/K6=WH=bounce.vates.tech=bounce-md_30504962.67dbeb75.v1-7c79666ec1d94cdea0bd35ff8a418d46@srs-se1.protection.inumbo.net>)
 id 1tvCyu-00038c-Vs
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:18:33 +0000
Received: from mail136-29.atl41.mandrillapp.com
 (mail136-29.atl41.mandrillapp.com [198.2.136.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7fe32c-0574-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:18:30 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-29.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZJM3n2fzXz6CQD4Z
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 10:18:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7c79666ec1d94cdea0bd35ff8a418d46; Thu, 20 Mar 2025 10:18:29 +0000
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
X-Inumbo-ID: ab7fe32c-0574-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742465909; x=1742735909;
	bh=eI4D45vQZuWmZU8GQf8PMhwDZd7pZ9rPpw8Hu3sisv8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tZY/VGgYjY6E7xSpsbNdyKy/Wl5aQMtOwuBYnfjCl3Geb3/dWtxuP8MmeOu9Wlpk0
	 +24f5QgJq0Y+D0Y/BGxmt9tZu8j38SnHCPI95bf+KK7qhRyurGLoQJhRW+qvd7GeLw
	 UAKZxZjPs97iTjhcAdskLfdbeUd9wkJu9Na8aAoozzWwNJRey8rGdvRUIgWaOzuiVH
	 ZyjuO78RN1y67BdyOq24JqP8hlLQGYbCRcinY+1vfgyNin7dO7KT0SUzveUVELKpro
	 Q7EgKZN4qNt2hsceHwfzKefA5TUJgz5CSyuqEXE/G2a9ifJGEpBvf/e0fn0LJJEfjE
	 PJfS57DhzJIeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742465909; x=1742726409; i=anthony.perard@vates.tech;
	bh=eI4D45vQZuWmZU8GQf8PMhwDZd7pZ9rPpw8Hu3sisv8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wBAI9Q54jU5fVTRvJFmS9w1YaJJHifCubhpMw6I10BpHfCo/ithy4/syc7lxhNbLT
	 Z6Rq6OfWlTtz0Y+3hO7+qfnm5jMQ+Fkx3lyCoSjuhTY8WHNFDpcgqgJkeOL5dV/6qT
	 E0gNEBOEyUCVIpIKAjOE7WGXrydKzjeC8YMkvObfhIMKBULYhXDcPfJ+tUT2ylSYTU
	 AHDVaJ0uYq1ltEH4Ican0ZADn74883xjj2LaYmew0f0WBls695I6PqVH1FirNt4vzP
	 abfSLQ2NlKDL6LEya8VJEUT/f+f9qfD4CG/CuADHNDZRpQD8slnHGgBEc7H56sUmWV
	 5oVjCczKMGZ1g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/2]=20Strip=20build=20path=20directories=20in=20tools,=20xen=20and=20xen/arch/x86?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742465907702
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Fr=C3=A9d=C3=A9ric=20Pierret=20(fepitre)?=" <frederic.pierret@qubes-os.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Z9vrc1Xvm5OEy8rM@l14>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com> <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com> <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com> <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl> <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com> <Z9rJUWCARMQYqNXr@mail-itl>
In-Reply-To: <Z9rJUWCARMQYqNXr@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7c79666ec1d94cdea0bd35ff8a418d46?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250320:md
Date: Thu, 20 Mar 2025 10:18:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> There are clearly some build path embedding left. And
> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly with
> XEN_ROOT having xen/.. at the end.
> BTW, would it be acceptable to have this?
> 
>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath $(XEN_=
ROOT))=3D.)

Hi,

Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fine
in "tools/"). In "xen/", there's a few variables you can use if they are
needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctree)
$(objtree) for relative path. That also should avoid the need to use
$(realpath ).

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


