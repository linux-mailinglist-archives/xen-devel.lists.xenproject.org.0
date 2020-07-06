Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D980215590
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:31:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsOPV-0004t4-Ns; Mon, 06 Jul 2020 10:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7Mw=AR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jsOPV-0004sz-08
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:31:41 +0000
X-Inumbo-ID: e0433a78-bf73-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0433a78-bf73-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNSK5nHtqnhixwbSo0v/LSrDTmOW1CPhjVgRDdLP3Os=; b=Grkp3IkRtlmSIniusg+bzkEB59
 bTy8oqB15wstpCaNt5XAo7EdUUAUzQfdea2/0fowIt5kFeiZ1t5xy/0g+yNpIttx2XIX9OIw5jes8
 wN6nnaD6W77sj0nPftQxmCsRx+WdAXbOCTv5UT0DMzamsOoaSXNS8wp9uA9lcaToeLdg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOPO-0003kt-1f; Mon, 06 Jul 2020 10:31:34 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOPN-0002DU-Qe; Mon, 06 Jul 2020 10:31:33 +0000
Subject: Re: [PATCH v5 09/11] x86/domctl: add XEN_DOMCTL_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <f3ec05eb4908f774683e96553ec32d68fac0d0ac.1593974333.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <6763525a-dca6-dfe5-b417-96e69a22d927@xen.org>
Date: Mon, 6 Jul 2020 11:31:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3ec05eb4908f774683e96553ec32d68fac0d0ac.1593974333.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, luwei.kang@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Michal,

On 05/07/2020 19:55, Michał Leszczyński wrote:
> +/* XEN_DOMCTL_vmtrace_op: Perform VM tracing related operation */
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +struct xen_domctl_vmtrace_op {
> +    /* IN variable */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define XEN_DOMCTL_vmtrace_pt_enable      1
> +#define XEN_DOMCTL_vmtrace_pt_disable     2
> +#define XEN_DOMCTL_vmtrace_pt_get_offset  3
> +    domid_t domain;

AFAICT, there is a 16-bit implicit padding here and ...


> +    uint32_t vcpu;

... a 32-bit implicit padding here. I would suggest to make
the two explicit.

We possibly want to check they are also always zero.

Cheers,

-- 
Julien Grall

