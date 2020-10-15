Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4028EF7F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 11:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7184.18831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSzlt-00014H-JA; Thu, 15 Oct 2020 09:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7184.18831; Thu, 15 Oct 2020 09:42:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSzlt-00013s-Fz; Thu, 15 Oct 2020 09:42:05 +0000
Received: by outflank-mailman (input) for mailman id 7184;
 Thu, 15 Oct 2020 09:42:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSzlr-00013n-Cw
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:42:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5564f6f1-62eb-496e-aae3-8baa81218f5b;
 Thu, 15 Oct 2020 09:42:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAFECAFFB;
 Thu, 15 Oct 2020 09:42:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSzlr-00013n-Cw
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 09:42:03 +0000
X-Inumbo-ID: 5564f6f1-62eb-496e-aae3-8baa81218f5b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5564f6f1-62eb-496e-aae3-8baa81218f5b;
	Thu, 15 Oct 2020 09:42:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602754920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGUEZhw5OsOWwTbxcg48LYkVTLy0xSGFFDqEYGHwsdY=;
	b=pCExSGjFkleCxW8TLXo0dw77TlP1sqwZmF77XE/mK0vyOkMZ4ghYySDaBHg+XIouJLZPml
	qVnmvJ8YbQRmhTKyWoxir7/tk01pEtSBAtrrTmsA4v7gJq2lLF+fezqqANGs+lSr7jYKuA
	2nYuV3f51cs55UHSonHP243h9bIZs94=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BAFECAFFB;
	Thu, 15 Oct 2020 09:42:00 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: Jason Andryuk <jandryuk@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20201014175342.152712-1-jandryuk@gmail.com>
 <20201014175342.152712-3-jandryuk@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d8a8ed95-ed55-4ccf-1b54-8d97db908742@suse.com>
Date: Thu, 15 Oct 2020 11:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014175342.152712-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.20 19:53, Jason Andryuk wrote:
> Moving XEN_512GB allows it to nest under XEN_PV.  That also allows
> XEN_PVH to nest under XEN as a sibling to XEN_PV and XEN_PVHVM giving:
> 
> [*]   Xen guest support
> [*]     Xen PV guest support
> [*]       Limit Xen pv-domain memory to 512GB
> [*]       Xen PV Dom0 support

This has currently a wrong text/semantics:

It should be split to CONFIG_XEN_DOM0 and CONFIG_XEN_PV_DOM0.

Otherwise the backends won't be enabled per default for a PVH-only
config meant to be Dom0-capable.

You don't have to do that in your patches if you don't want to, but
I wanted to mention it with you touching this area of Kconfig.

> [*]     Xen PVHVM guest support
> [*]     Xen PVH guest support
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

