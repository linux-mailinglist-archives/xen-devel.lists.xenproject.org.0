Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23E49071D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258122.444165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Q7f-0000sA-LG; Mon, 17 Jan 2022 11:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258122.444165; Mon, 17 Jan 2022 11:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Q7f-0000og-HW; Mon, 17 Jan 2022 11:24:27 +0000
Received: by outflank-mailman (input) for mailman id 258122;
 Mon, 17 Jan 2022 11:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SaLw=SB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9Q7e-0000oY-Hy
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:24:26 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b466d4-7788-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:24:24 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51790)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9Q7b-000DUK-ng (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 17 Jan 2022 11:24:23 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1FA5D1FC70;
 Mon, 17 Jan 2022 11:24:23 +0000 (GMT)
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
X-Inumbo-ID: 05b466d4-7788-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <63a36178-7ccf-c682-bbc1-5a9f812a47b9@srcf.net>
Date: Mon, 17 Jan 2022 11:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-2-andrew.cooper3@citrix.com>
 <c060f55e-7b18-b559-f703-b3aace50f438@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/msr: Split MSR_SPEC_CTRL handling
In-Reply-To: <c060f55e-7b18-b559-f703-b3aace50f438@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 11:07, Jan Beulich wrote:
> On 13.01.2022 17:38, Andrew Cooper wrote:
>> In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, there will need
>> to be three different access methods for where the guest's value lives.
>> However, it would be better not to duplicate the #GP checking logic.
>>
>> guest_{rd,wr}msr() are always called first in the PV and HVM MSR paths, so we
>> can repurpose X86EMUL_UNHANDLEABLE slightly for this.  This is going to be a
>> common pattern for other MSRs too in the future.
> I consider this repurposing risky. Did you consider using e.g.
> X86EMUL_DONE or X86EMUL_RETRY instead? Neither of the two is
> presently used by the MSR machinery afaics.

RETRY is used for the MSRs which can cause a p2m allocation and hit the
paging path.  DONE is not remotely appropriate for this purpose.

I also don't want to introduce a new PARTIAL because that is a recipe
for backport bugs.

> What's worse, aren't you making it possible to hit the
> ASSERT_UNREACHABLE() in hvm_save_cpu_msrs() as well as in
> XEN_DOMCTL_get_vcpu_msrs handling? And have hvm_load_cpu_msrs()
> produce -ENXIO and XEN_DOMCTL_set_vcpu_msrs return -EINVAL?

I found this bug after backporting the patches and getting them some
wider testing.  I'm doing a pre-req patch to rework the migration
machinery to call into the pv/hvm paths rather than into
guest_{rd,wr}msr() directly.

~Andrew

