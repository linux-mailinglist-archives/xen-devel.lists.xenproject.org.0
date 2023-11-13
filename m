Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231027EA306
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631972.985764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bvf-0002D1-NQ; Mon, 13 Nov 2023 18:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631972.985764; Mon, 13 Nov 2023 18:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bvf-0002AN-Ko; Mon, 13 Nov 2023 18:44:59 +0000
Received: by outflank-mailman (input) for mailman id 631972;
 Mon, 13 Nov 2023 18:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHgb=G2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1r2bve-00024C-O9
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:44:58 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd300e57-8254-11ee-98db-6d05b1d4d9a1;
 Mon, 13 Nov 2023 19:44:57 +0100 (CET)
Received: from [127.0.0.1] ([12.186.190.2]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 3ADIiKRh2900126
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 13 Nov 2023 10:44:22 -0800
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
X-Inumbo-ID: bd300e57-8254-11ee-98db-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3ADIiKRh2900126
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023111101; t=1699901063;
	bh=FZE+FvSi6u4aQFLQvHgrOHd7TQi6rWLbKXOmD09TF6A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XP5HoQ/rQHS15agijE/mnW3jN8y4uCAoW8X5d8XFs0CUk179eFq5XfZchanqbWRMg
	 1dNreqvOo1zuUZh/Cisg3yiuyTFfDyfBKKXsNav4XBFDxISWs69itzLxvtfzynAgae
	 BIsY/BMBIQ14ziU737No8xPdvsyWFsjL14tgY92zW0s4Wz6Srwvvu4wNamTPrso+9C
	 PxJJLl6T/qmtDmITfvCS64AxrftdWcfgnLw7rNI4DtyANy9HkrzafVXeYLot/P+CKr
	 KfZcEJo+JA0pZ07T9SHlxFivjRwRjb5n4V3Q1F6FpHsAfrRWUU9HShUuJ3vJdE6KBp
	 4WHDAyICARajw==
Date: Mon, 13 Nov 2023 13:44:11 -0500
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>
CC: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, luto@kernel.org,
        pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
        jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
        nik.borisov@suse.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v12_19/37=5D_x86/fred=3A_Update?= =?US-ASCII?Q?_MSR=5FIA32=5FFRED=5FRSP0_during_task_switch?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231113182947.GEZVJrGyMS4KzQafIK@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com> <20231003062458.23552-20-xin3.li@intel.com> <20231113093742.GAZVHuZk9CGTRIfAWb@fat_crate.local> <3BFEBDE8-6F90-43A5-AE34-07B0ED0CAAAE@zytor.com> <20231113182947.GEZVJrGyMS4KzQafIK@fat_crate.local>
Message-ID: <78A17F3A-B373-4277-8D72-A47CA84E29D8@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 13, 2023 1:29:47 PM EST, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Mon, Nov 13, 2023 at 12:36:04PM -0500, H=2E Peter Anvin wrote:
>> A resource cannot be consumed after the value has been written; this
>> is the only necessary level of serialization, equivalent to, say, RAX=
=2E
>
>Lemme see if I understand this correctly using this context as an
>example: after this MSR_IA32_FRED_RSP0 write, any FRED events determined
>to be delivered to level 0 will use this new task stack ptr?
>
>And since the new task is not running yet and the old one isn't running
>either, we're fine here=2E So the "serialization point" I was talking
>about above is bollocks=2E
>
>Close? :)
>
>> A serializing instruction stops the entire pipeline until everything
>> has retired and any stores have become globally visible=2E
>
>Right, we don't need that here=2E
>
>Thx=2E
>

Yep!

