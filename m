Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37824B9F1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:58:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8jBv-0003ug-7d; Thu, 20 Aug 2020 11:57:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zrnf=B6=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1k8jBu-0003ub-AY
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:57:10 +0000
X-Inumbo-ID: 34847500-28db-4a29-9f06-92a814a5db0c
Received: from mx2.mailbox.org (unknown [80.241.60.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34847500-28db-4a29-9f06-92a814a5db0c;
 Thu, 20 Aug 2020 11:57:08 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 1A77EA11FD;
 Thu, 20 Aug 2020 13:57:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id BpXQqhYb1scQ; Thu, 20 Aug 2020 13:57:03 +0200 (CEST)
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
From: Simon Leiner <simon@leiner.me>
Message-ID: <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
Date: Thu, 20 Aug 2020 13:57:02 +0200
MIME-Version: 1.0
In-Reply-To: <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.87 / 15.00 / 15.00
X-Rspamd-Queue-Id: 9AA5E1738
X-Rspamd-UID: eff3f3
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Julien,

On 20.08.20 13:17, Julien Grall wrote:
> There is a lot of interest to get Virtio working on Xen at the moment.
> Is this going to be a new transport layer for Virtio?


It is designed that way, yes. The current implementation (based on
virtio_mmio.c) has a few limitations:
 - Only the host side is implemented for Linux (We are currently only
using bare metal domains for the device side - so the device
implementation is based on OpenAMP[1])

- It lacks some features, e.g. there is currently no device
configuration space

- It is tested only very narrowly (only for my use case which is RPMsg
via the rpmsg_char kernel driver)

As this was really just a byproduct of my main research topic, I'm
currently not in touch with the virtio standards committee. But I'm
happy to contribute my work if there is interest :-)

> Xen-devel is probably most suitable for this discussion, so I moved the
> discussion there. I have also CCed a couple of Linux maintainers that
> should be able to provide feedbacks on the approaches.

Thanks!

Greetings,
Simon


[1]: https://www.openampproject.org

