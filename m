Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F26B3050
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 23:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508368.782996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paObL-0002Sj-9O; Thu, 09 Mar 2023 22:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508368.782996; Thu, 09 Mar 2023 22:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paObL-0002Q7-6f; Thu, 09 Mar 2023 22:19:07 +0000
Received: by outflank-mailman (input) for mailman id 508368;
 Thu, 09 Mar 2023 22:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uE8O=7B=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1paObJ-0002NV-2A
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 22:19:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d9f75e-bec8-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 23:19:01 +0100 (CET)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paOao-00C8rx-Vc; Thu, 09 Mar 2023 22:18:34 +0000
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
X-Inumbo-ID: 63d9f75e-bec8-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jK36Zpm8T2on+df54b6OGLN8ramQR+T+L8HPs8R5yHE=; b=MQBnApNDuji9teSFgOuyjM3C/p
	Lgjgf584li4FUT3/bLPnV5yqTuo2UTXDrn/714v2Ip8g3XpbRRwZD7nJgpfEz6h2qyYzLRoVFAzS5
	tMd/9xsj+xvHf9pg1aj6/tfQOstrhGZ+G1zt8z2KHggdwT/JzAOm9MQzVoQv6izhooEbpCzv0yw5r
	tM+8qfELGYvw7DcEBgzyGxOP+nBEwfiCipPOReirB45OyXkLojYq6dLPJAZ2LdHzds1OUB+inU0LV
	2hzU4mCm7TVY5QLhVwYJxgZVITHlU54t7YIlOR63U6xiYpBenGFdRnv1EDD5XMZzQjyOtadrDKozg
	W7Wm31lw==;
Date: Thu, 9 Mar 2023 14:18:34 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
	steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org
Cc: j.granados@samsung.com, zhangpeng362@huawei.com, tangmeng@uniontech.com,
	willy@infradead.org, nixiaoming@huawei.com, sujiaxun@uniontech.com,
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] sysctl: slowly deprecate register_sysctl_table()
Message-ID: <ZApbOilWsw9Sk/k4@bombadil.infradead.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Thu, Mar 02, 2023 at 12:46:05PM -0800, Luis Chamberlain wrote:
> I'm happy to take these via sysctl-next [0] but since
> I don' think register_sysctl_table() will be nuked on v6.4 I think
> it's fine for each of these to go into each respective tree. I can
> pick up last stragglers on sysctl-next. If you want me to take this
> via sysctl-next too, just let me know and I'm happy to do that. Either
> way works.

As I noted I've dropped the following already-picked-up patches from
my queue:

ipmi: simplify sysctl registration
sgi-xp: simplify sysctl registration
tty: simplify sysctl registration

I've taken the rest now through sysctl-next:

scsi: simplify sysctl registration with register_sysctl()
hv: simplify sysctl registration
md: simplify sysctl registration
xen: simplify sysctl registration for balloon

If a maintainer would prefer to take one on through their
tree fine by me too, just let me know and I'll drop the patch.

  Luis

