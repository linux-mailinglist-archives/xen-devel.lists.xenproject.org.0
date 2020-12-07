Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807042D12A0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46606.82696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGzg-0000xu-B6; Mon, 07 Dec 2020 13:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46606.82696; Mon, 07 Dec 2020 13:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGzg-0000xV-7e; Mon, 07 Dec 2020 13:56:00 +0000
Received: by outflank-mailman (input) for mailman id 46606;
 Mon, 07 Dec 2020 13:55:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVE2=FL=bounce.vates.fr=bounce-md_30504962.5fce346c.v1-0be095ed234e41ce8e97c3944e01e4fc@srs-us1.protection.inumbo.net>)
 id 1kmGzd-0000xQ-Tp
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:55:58 +0000
Received: from mail145-20.atl61.mandrillapp.com (unknown [198.2.145.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e1be9b-d2c1-467e-9070-ee819e48cf14;
 Mon, 07 Dec 2020 13:55:56 +0000 (UTC)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4CqPwX4hsszCf9LfK
 for <xen-devel@lists.xenproject.org>; Mon,  7 Dec 2020 13:55:56 +0000 (GMT)
Received: from [185.78.159.90] by mandrillapp.com id
 0be095ed234e41ce8e97c3944e01e4fc; Mon, 07 Dec 2020 13:55:56 +0000
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
X-Inumbo-ID: 28e1be9b-d2c1-467e-9070-ee819e48cf14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1607349356; i=benjamin.reis@vates.fr;
	bh=4VZaVyg+b6MyJupqgbO2pHhU3e8r4QkiNoU+FOFm/CE=;
	h=From:Subject:To:References:Message-Id:In-Reply-To:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=H6I9S0GtrhuuMuN98hzxCRLpucdRHmiGVv/GgE1MIllC2+Becx6aeoYRpwbj1zdZP
	 ffhzHN4fdFqUyGpcG7cibhtZbsB/kYx/2BARhDuPYRwdom3ZxdlefnTLNCXWe4LD+j
	 pyArnBwijWoEBd0F0B//bMy59rTCo+yWnDnmGWBU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1607349356; h=From : 
 Subject : To : References : Message-Id : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=4VZaVyg+b6MyJupqgbO2pHhU3e8r4QkiNoU+FOFm/CE=; 
 b=n4gVD2ZmLcwz/HJkdI2IVYfXfU18PCNfU4oyC6F37lnp6qMqVCvsrgCp7+L+sOf4lqiNv0
 YAFQJJsM0r9wSzgCDvZt3MvOG6AEUHbiWNL8DGgJsblxuAFyAJSqp+ijn5k8yhdaiYyYgHne
 Pi92oR4CXlTYlNlwNrmba9LWybDb4=
From: Benjamin Reis <benjamin.reis@vates.fr>
Subject: Re: [Help Wanted] New toolstack Rust PoC
X-Virus-Scanned: amavisd-new at plam.fr
To: xen-devel@lists.xenproject.org
References: <1b86b418-71e1-3422-6531-00af746cf7a8@vates.fr>
Message-Id: <18094b9d-0e09-aed9-8fe0-f17070b55f39@vates.fr>
In-Reply-To: <1b86b418-71e1-3422-6531-00af746cf7a8@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.0be095ed234e41ce8e97c3944e01e4fc
X-Mandrill-User: md_30504962
Date: Mon, 07 Dec 2020 13:55:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Same mail as plain text, sorry for the incovenience and the none 
readability of my previous one.

Hi all,

As you may know: we are working on a rust PoC 
(https://github.com/xcp-ng/xenopsd-ng/rust/ 
<https://github.com/xcp-ng/xenopsd-ng/pull/13>) for the new Xen Toolstack.

We have partial bindings for Xenctrl and Xenstore and with that we're 
able to pause/unpause/shutdown a guest and we're close to booting a XTF 
guest (https://github.com/xcp-ng/xenopsd-ng/pull/13 
<https://github.com/xcp-ng/xenopsd-ng/pull/13>).

We are new to Xen so we're having a hard time finding what's wrong with 
our current code, so we're looking for some help/guidance to keep our 
PoC going forward.

We're suspecting that in hypercall fails silently when setting the 
guest's hvm context.

Would anyone be interested in helping us debugging/developping the PoC?

We're currently tracking this issue here: 
https://github.com/xcp-ng/xenopsd-ng/issues/17.

Hoping to hear from you soon.

Benjamin Reis

Vates SAS

