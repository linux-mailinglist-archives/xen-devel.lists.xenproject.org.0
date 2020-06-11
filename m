Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DD1F6A6D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 16:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjOeG-0000Cp-Ap; Thu, 11 Jun 2020 14:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYrn=7Y=amazon.co.uk=prvs=424ec279d=jgrall@srs-us1.protection.inumbo.net>)
 id 1jjOeE-0000Cf-Ua
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 14:57:42 +0000
X-Inumbo-ID: e6df4784-abf3-11ea-b7bb-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6df4784-abf3-11ea-b7bb-bc764e2007e4;
 Thu, 11 Jun 2020 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1591887462; x=1623423462;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=rGHndJ5TnBycZlshvSY/khuChftuh2/1N3IgO4PWHFg=;
 b=WLvIc9OFPRZvsvvZDb0P5ep9xbdcxm5d4gVxvjxJyKtQe2DUKD+1DAVV
 pTQ5zqJygncTOykflDdm3yRyaSEO+WXkBixjPXltndMuMNOa6U1+I+QnY
 KtHcYyLxm/BkW9U6GDgG3AgQ/ueKEplhvKLGqjdlhAJaMJjHY5gCYOerf 4=;
IronPort-SDR: GRmXaCttvJEdsG5nIvlyR1964aQbx3lr3upMB2EUSEUj7YyNGURpnaLsAJ8HjAMuuF88d5229f
 4TIkVYexEiow==
X-IronPort-AV: E=Sophos;i="5.73,499,1583193600"; d="scan'208";a="35758432"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 11 Jun 2020 14:57:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id E903224432A; Thu, 11 Jun 2020 14:57:39 +0000 (UTC)
Received: from EX13D21UEA004.ant.amazon.com (10.43.61.209) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 11 Jun 2020 14:57:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D21UEA004.ant.amazon.com (10.43.61.209) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 11 Jun 2020 14:57:39 +0000
Received: from a483e7b01a66.ant.amazon.com (10.1.213.18) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 11 Jun 2020 14:57:38 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Anthony Perard" <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 <daniel.kiper@oracle.com>
From: Julien Grall <jgrall@amazon.com>
Subject: Kexec and libxenctlr.so
Message-ID: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
Date: Thu, 11 Jun 2020 15:57:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

kexec-tools has an option to load dynamically libxenctlr.so (not 
.so.4.x) (see [1]).

Given that the library has never been considered stable, it is probably 
a disaster that is waiting to happen.

Looking at the tree kexec is using the follow libxc functions:
    - xc_kexec_get_range()
    - xc_kexec_load()
    - xc_kexec_unload()
    - xc_kexec_status()
    - xc_kexec_exec()
    - xc_version()
    - xc_interface_open()
    - xc_interface_close()
    - xc_get_max_cpus()
    - xc_get_machine_memory_map()

I think it is uncontroversial that we want a new stable library for all 
the xc_kexec_* functions (maybe libxenexec)?

However I am not entirely sure where to put the others.

I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is a 
XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() 
(despite it is a XENMEM_).

For xc_version(), I am thinking to extend libxentoolcore to also include 
"stable xen API".

Any opinion on the approach?

Cheers,


[1] 
https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=894bea9335f57b62cbded7b02ab7d58308b647d8

