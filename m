Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18A265F15
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 13:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGher-0001l9-O1; Fri, 11 Sep 2020 11:56:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGheq-0001l3-SH
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 11:56:00 +0000
X-Inumbo-ID: b7651257-cf97-4412-a118-fcd441b99a49
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7651257-cf97-4412-a118-fcd441b99a49;
 Fri, 11 Sep 2020 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599825359;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ddJSaeXvV8HHijui8S3vmZPwvxFvseGTCx6ZahYtTOk=;
 b=ej08xkoXN2MaI+qpL9ZejjsnTf32tw5HQ1Z7yyw3FtF+ysrNUnCJnXno
 uvPrmE7FJJcImawmDn2Fl7pNk4oIqhHn5u31Yq8rreY2W1PKER7jmNtxt
 bgEnvhGqCYbHijwO/rzhhP+9/xJVZkiOkPNXQg1bQJaMSEMVlilj4qyuX Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zGttxFN85QYmhvx0oKv9pmNbXPpyW5Os7A42972woer+pXXByQr1XUTrB3eddolxMPp8fKfZT3
 bmsSycJGvMmT8cWE/pMagmd+vQMyNAilvxe6dLqHnJaHnGVsE65vjBmUn8lnMt0qcCU9T5WfhK
 SDpJfqyePsoQbZJYPnIyaU8ntpD9m4NU8pMQBaWCPtHZd93RP97gd4KEL0Xa6WtDEL1YVgYB3/
 6xPTDsjpFolouN9YM7icm9tUdEAzs0JisKRiYMn7PpHRxOWkoFUYqt01ePcowbCIT7p/taFT6g
 sj8=
X-SBRS: 2.7
X-MesageID: 26786440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26786440"
Subject: Re: [PATCH] x86/PV: make post-migration page state consistent
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2e715145-e0b5-07b9-0090-6e1e9a849f33@citrix.com>
Date: Fri, 11 Sep 2020 12:55:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 11/09/2020 11:34, Jan Beulich wrote:
> When a page table page gets de-validated, its type reference count drops
> to zero (and PGT_validated gets cleared), but its type remains intact.
> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
> such pages. An intermediate write to such a page via e.g.
> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
> return. In libxc the decision which pages to normalize / localize
> depends solely on the type returned from the domctl. As a result without
> further precautions the guest won't be able to tell whether such a page
> has had its (apparent) PTE entries transitioned to the new MFNs.

I'm afraid I don't follow what the problem is.

Yes - unvalidated pages probably ought to be consistently NOTAB, so this
is probably a good change, but I don't see how it impacts the migration
logic.

We already have to cope with a page really changing types in parallel
with the normalise/localise logic (that was a "fun" one to debug), which
is why errors in that logic are specifically not fatal while the guest
is live - the frame gets re-marked as dirty, and deferred until the next
round.

Errors encountered after the VM has been paused are fatal.

However, at no point, even with an unvalidated pagetable type, can the
contents of the page be anything other than legal PTEs.  (I think)

~Andrew

