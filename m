Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76923230C23
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 16:12:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0QKf-0003k6-Vo; Tue, 28 Jul 2020 14:11:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0QKe-0003k1-MB
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 14:11:52 +0000
X-Inumbo-ID: 471bd2f6-d0dc-11ea-a8f3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 471bd2f6-d0dc-11ea-a8f3-12813bfff9fa;
 Tue, 28 Jul 2020 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595945511;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OuE3A6MRBokKKxndisn6x3i03m4uvfO/NGVkQ2H3vfQ=;
 b=bRXACsoSsHzX1CpOYQFb1ktdQ4MKi7BXJFRcxEsX5ALZdPCSI/J2ksGw
 SqBnX2PG9SzwklqZRhyi+5byw2WNBjP6o7j9nH5naDHYlN5uySc/WhM80
 IQDCWF2P/VlNmTucYuer+0lbMU189duo/lO+RflPPqkB0NLOH0I0e+Crp I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +hG5mCBM1DMxBIpktzqQNzNiw+hwmS4q2Geb/9+dpT9L5KGCEc0MHMF4is4iSgH08uHAa2wq3l
 yKki94fH2rcrBhzrMUdwJfqDXJTCZNclEllFdUIqkGdlsUCFyMyZmYIIC0yKb7zzZYNK03YC3k
 n7huPsPxnBO0B8ZbKtRbAqj+gKpQHMu4Zk/Y451mUu+D4qdA91mg8nSloWj9BLl37qzO/13srY
 S+Vr1ZKGVArYfyTPdUzullG+ehyUSYAMIVidewPG6K6jOzUy3Eh1kUXFLzOgwZm96J9iemX+AX
 6Ek=
X-SBRS: 2.7
X-MesageID: 23345124
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23345124"
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c95fdb03-c5d7-ac97-1b6f-eb280979968f@citrix.com>
Date: Tue, 28 Jul 2020 15:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 12:37, Andrew Cooper wrote:
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 9f0cae52c0..122d1e7596 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>      return 0;
>  }
>  
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;
> +    void **vaddrs;

I've folded an "= NULL" here to fix the CentOS 6 build.

~Andrew

