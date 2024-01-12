Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742EA82C2E2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 16:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666924.1037872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJbG-0001mb-4c; Fri, 12 Jan 2024 15:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666924.1037872; Fri, 12 Jan 2024 15:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJbG-0001k7-1I; Fri, 12 Jan 2024 15:37:38 +0000
Received: by outflank-mailman (input) for mailman id 666924;
 Fri, 12 Jan 2024 15:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XUEQ=IW=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1rOJbE-0001k1-4q
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 15:37:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 808a430b-b160-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 16:37:34 +0100 (CET)
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
X-Inumbo-ID: 808a430b-b160-11ee-98f0-6d05b1d4d9a1
Date: Fri, 12 Jan 2024 16:37:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705073851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbMbE7TF8i1sZXppGrqoHHjUY3M11JhDxCtzDdAUuRw=;
	b=1GGf1DU68xr+ui1Avv/QWcHvqsdOuManS53L5hKHadiHJXCRP3Y8kk99lV9FjsQNjSF1nO
	nd7IXO8qvMHZcOmpIelxtpx32TDUeBOVEp1/kXueuR1rPRQ9XvlgQfZmn+Z/I2dC8JsgIr
	1MUL3nBT/t6g/FU0b9WPzkss5hz5wQCruZHqnZTUs/o0V4Z6GIj4lDVJnisVRC8l0qgGx7
	mXi0mJ00yAkRAG26UCcMiCcBNLXf6PaujYD6CNKC13FNEltl/MWVGqXp5sUx8NZqswynxn
	KMFIocRjpwH0NGzuCJnFJe/y5AAxWHlKqVgIFlQDtBRw4v0YNjcU6DEFx27kKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705073851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbMbE7TF8i1sZXppGrqoHHjUY3M11JhDxCtzDdAUuRw=;
	b=fvlnJbYLOwIgdowsO9OyVTF9juUCvJAx60fsmA5ZO/FIGj8AXSun0fRnqtBhGeFwd4GU/P
	FS9aiBohTk/VYFAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Boqun Feng <boqun.feng@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Hao Luo <haoluo@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Juergen Gross <jgross@suse.com>, KP Singh <kpsingh@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wei.liu@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH net-next 16/24] net: netkit, veth, tun, virt*: Use
 nested-BH locking for XDP redirect.
Message-ID: <20240112153729.A68q4xsA@linutronix.de>
References: <20231215171020.687342-1-bigeasy@linutronix.de>
 <20231215171020.687342-17-bigeasy@linutronix.de>
 <74feb818-7109-cb1e-8eec-a037c17a2871@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74feb818-7109-cb1e-8eec-a037c17a2871@iogearbox.net>

On 2023-12-18 09:52:05 [+0100], Daniel Borkmann wrote:
> Hi Sebastian,
Hi Daniel,

> Please exclude netkit from this set given it does not support XDP, but
> instead only accepts tc BPF typed programs.

okay, thank you.

> Thanks,
> Daniel

Sebastian

