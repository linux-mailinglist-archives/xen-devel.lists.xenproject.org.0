Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D512F19B0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64986.114982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzAE-0005R5-8H; Mon, 11 Jan 2021 15:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64986.114982; Mon, 11 Jan 2021 15:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzAE-0005Qg-4s; Mon, 11 Jan 2021 15:31:26 +0000
Received: by outflank-mailman (input) for mailman id 64986;
 Mon, 11 Jan 2021 15:31:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyzAC-0005QT-4W
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:31:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09121355-a799-43c6-a368-ef941e7e8088;
 Mon, 11 Jan 2021 15:31:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CF95AE2D;
 Mon, 11 Jan 2021 15:31:22 +0000 (UTC)
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
X-Inumbo-ID: 09121355-a799-43c6-a368-ef941e7e8088
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610379082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxPk6Krxj1gHeaGu8YFs3l9DxpZNzGZhVt/rwvNokXc=;
	b=XHUXq143fH/WkrymshWZddIKqdp7HgFwyfOKhsw4eQsyKiJHNwmyYGkn5Gw6xo0KWTcvoL
	aS53nTGqh3jU3x616Zpc31uU9Ye8dytsWAcqJb5iI2djZwHfKiE0Nv/RvFOFok8jTid5Ar
	B/1YP/X2PkX+U1ERZWw40ZJrLbFsB8w=
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Laszlo Ersek <lersek@redhat.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
 <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
 <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1dfeafe-0de4-abd3-0a3e-0bf68e20512c@suse.com>
Date: Mon, 11 Jan 2021 16:31:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 16:26, Igor Druzhinin wrote:
> Another problem that I faced while experimenting is that creating page
> tables for 46-bits (that CPUID returned in my case) of address space takes
> about a minute on a modern CPU.

Which probably isn't fundamentally different from bare metal?

Jan

