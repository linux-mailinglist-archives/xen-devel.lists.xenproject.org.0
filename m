Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EC8A74FAF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 18:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931073.1333552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDnB-0007qZ-3S; Fri, 28 Mar 2025 17:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931073.1333552; Fri, 28 Mar 2025 17:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDnB-0007nR-01; Fri, 28 Mar 2025 17:46:53 +0000
Received: by outflank-mailman (input) for mailman id 931073;
 Fri, 28 Mar 2025 17:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6s0n=WP=bounce.vates.tech=bounce-md_30504962.67e6e084.v1-c1b077ff6187435ba77bcdf0d0da95b4@srs-se1.protection.inumbo.net>)
 id 1tyDn9-0007nL-V5
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 17:46:52 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da4b197-0bfc-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 18:46:46 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZPSdJ41LMzK5vjQQ
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 17:46:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c1b077ff6187435ba77bcdf0d0da95b4; Fri, 28 Mar 2025 17:46:44 +0000
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
X-Inumbo-ID: 9da4b197-0bfc-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743184004; x=1743454004;
	bh=m1WbUotnscR04/ZTJ9CfbRbGTSugA8wABybHup+Azp8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sfzF0juklIDTwuKpMoI/ACJLMJw4VAuo8sm64rITrXE3Aw0rqP4Mjl9IP1+ZRMtNJ
	 Io3gFWmAPbaLv5abswdZIy8Qw0rcLwICtMy0KhUISPLuEuHJx3OCuCaH18t9ZcfzjM
	 XXJgDn2yTwu92PlXpOhjlxlzn4DsIouZJ7FpZJ4k9IMF92hb3Wb+MzDS5vVROG1x8N
	 7iWiZmfCLFzDNzy4Caka0wEEU4B3ktjp8zKD3nMrA67XbqveuuVBsj1SUVPujnrET+
	 UK2mOXIJNipaDwnvmtRD5Q51LxRSghr9IDqY6t/KzIJU0XO2ft/mwb9t3Sh6WFngHM
	 m3cY1RJLVbYIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743184004; x=1743444504; i=teddy.astie@vates.tech;
	bh=m1WbUotnscR04/ZTJ9CfbRbGTSugA8wABybHup+Azp8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NzGJYV7bo49v/t//9+4ad2eCZY2rVWf3DFB6hmJN6qoko26YABA3HOCcUznMelZob
	 Ja26L7A2eCBIQIpOP7jb9iByaMQksku5grfY8eZhRhFhigv3qlHvq5jyZJfX49A2JZ
	 +0coVJiUGUUK8As/awgQXFjRAKAAwOo8lrKTRxsfRwz60aQdeI0v5CgmCrbHutRhMM
	 lYfb7o0YzQ3OOLNXj0PKxXZcSj7cVPb4dKHTDH0B7LsF4mT2vO0EnGUR58fw0wOR4A
	 Z3DMYWy9OLkVuxQ4AORN60xkDqi5R19ODvetkiPZqMs+3XmiSGLB90Q+eIMtBKWp8L
	 oYxezfl/WI8Jw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Allocating=20SEV=20C-bit-cleared=20pages=20(without=20relying=20on=20swiotlb)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743184003761
Message-Id: <00078e1c-e428-4ad9-8041-54b83f913f9e@vates.tech>
To: "Michael Kelley" <mhklinux@outlook.com>, linux-kernel@vger.kernel.org, linux-mm@vger.kernel.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <b16ec2d7-4a84-482f-b875-d7c152facab5@vates.tech> <SN6PR02MB4157AFE96ADCA3D504909FFAD4A02@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157AFE96ADCA3D504909FFAD4A02@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c1b077ff6187435ba77bcdf0d0da95b4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250328:md
Date: Fri, 28 Mar 2025 17:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/03/2025 =C3=A0 17:31, Michael Kelley a =C3=A9crit=C2=A0:
> From: Teddy Astie <teddy.astie@vates.tech> Sent: Thursday, March 27, 2025=
 7:12 AM
>> To: linux-kernel@vger.kernel.org; linux-mm@vger.kernel.org
>> Cc: Xen-devel <xen-devel@lists.xenproject.org>
>> Subject: Allocating SEV C-bit-cleared pages (without relying on swiotlb)
>>
>> Hello Linux mailing list !
>>
>> For porting Linux code to make it work on Xen with AMD-SEV, I need to
>> change the allocation of some pages to use "shared pages" (C-bit
>> cleared) instead of private pages (C-bit set, which is the default kind)
>> as these pages needs to be shared with the hypervisor/Dom0.
>>
>> Is there a facility to allocate pages with C-bit cleared (and if not
>> running under SEV, just allocate a plain page) ? Current Linux code for
>> SEV seems to only rely on swiotlb as access to shared page is mostly
>> made through DMA-kind devices (e.g virtio or emulated device), but I
>> don't think it is the best approach.
>>
> 
> For allocating memory that can be shared with the hypervisor,
> allocate memory as usual (with alloc_pages(), for example), then
> call set_memory_decrypted() on that memory. This approach
> works in general for Confidential Computing (CoCo) VMs,
> regardless of whether the underlying hardware is AMD SEV-SNP,
> Intel TDX, or ARM64 CCA.  If you are running in a non-CoCo
> VM, set_memory_decrypted() is a no-op, so you can call it
> without having to check whether you are in a CoCo VM.
> 
> When freeing the memory, do the reverse. Call
> set_memory_encrypted() first, then free the memory as
> usual. Note that if set_memory_encrypted() fails for any
> reason, just leak the memory instead of freeing it because
> the encrypted state is unknown after such a failure.
> 
> If you search for set_memory_decrypted() in kernel code,
> you'll find several examples.  See drivers/hv/hv_connection.c
> as one place where code for running on Hyper-V follows
> this paradigm. There are several other examples as well.
> 
> Michael

set_memory_decrypted does the job.

Thanks
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


