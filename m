Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C7503460
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 08:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306117.521291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbYy-0001m8-GQ; Sat, 16 Apr 2022 06:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306117.521291; Sat, 16 Apr 2022 06:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfbYy-0001k6-DS; Sat, 16 Apr 2022 06:05:40 +0000
Received: by outflank-mailman (input) for mailman id 306117;
 Sat, 16 Apr 2022 06:05:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x34X=U2=bombadil.srs.infradead.org=BATV+8011bb1914c3be3034d5+6810+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfbYx-0001k0-0b
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 06:05:39 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a7df21b-bd4b-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 08:05:37 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nfbYm-00CJyx-V4; Sat, 16 Apr 2022 06:05:28 +0000
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
X-Inumbo-ID: 3a7df21b-bd4b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+t0Bu8KSg3jBujgghxzlFf0uKoDQfWljvnbuJuxey94=; b=NADL9qThPsf2tQw9wSHR9J87h6
	TY536TR9jkne0wei9WY4j7IwwHfhpH1iteQfDtfp4OZtWhkNUzwPVqifBfszMOendhZl2f4xZ2u+y
	TYC00bS1du/ddF5g5gu8CKTOXCDS5Guevew6Pjc26q9dR7Z9M0Tzye5DzR1ltSKBqF7cgb7+GOLnS
	ZH9JNk7WKDNl5rub16At6nBeAgYi3wqX2ljSIa64BwQEYdkcsrW4z1OpISFIXlqvsgSU2MCZUI/+1
	dK+0Mrtad1Cvt7l6kF+NqECSoae/PgeDBD+5SorOBUGeEhESw974b1TzM4gfXqvz3hnfnTZbcEEfi
	YwNHI30A==;
Date: Fri, 15 Apr 2022 23:05:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 4/6] virtio: Various updates to xen-virtio DMA ops
 layer
Message-ID: <YlpcqOUK59yExXlq@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-5-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649963973-22879-5-git-send-email-olekstysh@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 14, 2022 at 10:19:31PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Various updates is a big indicator that the patch should be split
further.  Please do one change at a time, and fold updates to the
previous patches in the series into those patches instead of fixing
them up later.

