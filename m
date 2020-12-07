Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37902D0FAE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46367.82294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEzt-0001Dn-6t; Mon, 07 Dec 2020 11:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46367.82294; Mon, 07 Dec 2020 11:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEzt-0001DO-3e; Mon, 07 Dec 2020 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 46367;
 Mon, 07 Dec 2020 11:48:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEzr-0001DH-Do
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:48:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53f29c0c-75bc-44b6-b5ca-23d7d9cb859b;
 Mon, 07 Dec 2020 11:48:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06764AC90;
 Mon,  7 Dec 2020 11:48:02 +0000 (UTC)
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
X-Inumbo-ID: 53f29c0c-75bc-44b6-b5ca-23d7d9cb859b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607341682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0q/IP+BAA2HuYyl/GmCCSGXKldok9mJFemNRzg99R4=;
	b=a2j0CFx9af7GLJhLT6inG/1tAUYPD4ZHz/njxIfUR9+BFLO0E8BHkmKFy94WP/yBS9p9xp
	VH0r1nkjP1NvZPEy5kIIIUpkw2GvOq5GlfS3G7U5ufWab27gXbSsOL+3xzrRXgDtHYhSKm
	TNlPN3jiWuUDq6nEwgx1FESlt6Qrvh8=
Subject: Re: [PATCH V3 06/23] xen/ioreq: Make x86's
 hvm_mmio_first(last)_byte() common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-7-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dde59170-d298-1581-c161-4ad5ff156dd1@suse.com>
Date: Mon, 7 Dec 2020 12:48:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-7-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The IOREQ is a common feature now and these helpers will be used
> on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
> with "ioreq".
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

