Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E01965E0
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 12:55:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIA0d-0001yr-9N; Sat, 28 Mar 2020 11:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIA0b-0001ym-1L
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 11:52:13 +0000
X-Inumbo-ID: 8fa99d78-70ea-11ea-8b40-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fa99d78-70ea-11ea-8b40-12813bfff9fa;
 Sat, 28 Mar 2020 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K08aoDWg5L5qOHLWXn6xH6n8ij+da7tSV8HrfFikc48=; b=355yL13WtEIznfutA8CW1BTGbS
 Ha1PNl2ZD/8zjTDKcpTKKxvOazk8ZfPBsMxbvRQ0EabJ9jHb6VqTsxlWKPx7ITryOHywHFIlavRPj
 aOj46SgKs3DlOOrIcrSaQ2fp6IpHw0OZipAQzdiA4/DrBO12i675GGy0Ypifhiomu994=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIA0V-0000bW-J0; Sat, 28 Mar 2020 11:52:07 +0000
Received: from cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net
 ([81.100.41.95] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIA0V-0000xA-CI; Sat, 28 Mar 2020 11:52:07 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
Date: Sat, 28 Mar 2020 11:52:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327023451.20271-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER
 reads
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

qHi Stefano,

On 27/03/2020 02:34, Stefano Stabellini wrote:
> This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
> reads. It doesn't take into account the latest state of interrupts on
> other vCPUs. Only the current vCPU is up-to-date. A full solution is
> not possible because it would require synchronization among all vCPUs,
> which would be very expensive in terms or latency.

Your sentence suggests you have number showing that correctly emulating 
the registers would be too slow. Mind sharing them?

Cheers,

-- 
Julien Grall

