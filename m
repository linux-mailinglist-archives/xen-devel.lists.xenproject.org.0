Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BD2BAD25
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 16:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32310.63353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg84l-0007GD-Mq; Fri, 20 Nov 2020 15:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32310.63353; Fri, 20 Nov 2020 15:11:51 +0000
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
	id 1kg84l-0007Fo-JR; Fri, 20 Nov 2020 15:11:51 +0000
Received: by outflank-mailman (input) for mailman id 32310;
 Fri, 20 Nov 2020 15:11:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg84k-0007Fj-D3
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:11:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f905bef7-efb1-4a46-a069-504a61eb0382;
 Fri, 20 Nov 2020 15:11:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 150D4AB3D;
 Fri, 20 Nov 2020 15:11:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg84k-0007Fj-D3
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:11:50 +0000
X-Inumbo-ID: f905bef7-efb1-4a46-a069-504a61eb0382
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f905bef7-efb1-4a46-a069-504a61eb0382;
	Fri, 20 Nov 2020 15:11:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605885108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2q+0eVq72VvrhyYPm4CfCBl5ZsNx290iGgTWnTDA4E=;
	b=YjNq9S2eFzS0QsvuAcerqm01Qt/WrAqIjJaChJGKyz/ZSqckA30lQt6lWvruaxlvfGnq/Z
	nEk6ZjL+AulXVzrzpT/CCtQMsKdxcLRF80f24+TiX/4n/Er714+4bp0AZd/xLvVQNsvv44
	0ei7TmDxRwxr7VGLaR5YOZg73ZYxxI0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 150D4AB3D;
	Fri, 20 Nov 2020 15:11:48 +0000 (UTC)
Subject: Re: [PATCH v2 06/12] viridian: use softirq batching in hvcall_ipi()
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8dbcfe50-58a3-a519-03cb-1e7f11af567e@suse.com>
Date: Fri, 20 Nov 2020 16:11:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> vlapic_ipi() uses a softirq batching mechanism to improve the efficiency of
> sending a IPIs to large number of processors. This patch modifies send_ipi()
> (the worker function called by hvcall_ipi()) to also make use of the
> mechanism when there multiple bits set the hypercall_vpmask.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

