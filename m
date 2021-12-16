Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436984779C4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248129.427967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxu1Y-0001b1-SC; Thu, 16 Dec 2021 16:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248129.427967; Thu, 16 Dec 2021 16:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxu1Y-0001YA-Oo; Thu, 16 Dec 2021 16:54:32 +0000
Received: by outflank-mailman (input) for mailman id 248129;
 Thu, 16 Dec 2021 16:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxu1X-0001Y4-If
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:54:31 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5632107-5e90-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 17:54:30 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47098)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxu1U-000vc3-pF (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 16:54:28 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B236A1FB36;
 Thu, 16 Dec 2021 16:54:28 +0000 (GMT)
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
X-Inumbo-ID: d5632107-5e90-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f10d4a12-c6fd-fa46-d00d-8c39ecddde7e@srcf.net>
Date: Thu, 16 Dec 2021 16:54:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/4] x86/cpuid: Split dom0 handling out of
 init_domain_cpuid_policy()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-2-andrew.cooper3@citrix.com>
 <b95bc243-c4ca-824f-1812-1f0a74e22193@suse.com>
 <8e648c7b-33a6-642c-e4ff-78f17a35dbe3@srcf.net>
 <df85e82a-1b9c-7d1b-1574-ae3ebd11a101@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <df85e82a-1b9c-7d1b-1574-ae3ebd11a101@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2021 16:51, Jan Beulich wrote:
> On 16.12.2021 17:41, Andrew Cooper wrote:
>> On 16/12/2021 16:38, Jan Beulich wrote:
>>> On 15.12.2021 23:21, Andrew Cooper wrote:
>>>> To implement dom0-cpuid= support, the special cases would need extending.
>>>> However there is already a problem with late hwdom where the special cases
>>>> override toolstack settings, which is unintended and poor behaviour.
>>>>
>>>> Introduce a new init_dom0_cpuid_policy() for the purpose, moving the ITSC and
>>>> ARCH_CAPS logic.  The is_hardware_domain() can be dropped, and for now there
>>>> is no need to rerun recalculate_cpuid_policy(); this is a relatively expensive
>>>> operation, and will become more-so over time.
>>> Would you mind leaving it there in a commented out form, hinting at when
>>> it may need re-enabling?
>> Leave what?  The recalculate_cpuid_policy()?  That comes back in later
>> in the series.
> I've meanwhile spotted it, yes. Let's hope its conditional invocation
> there makes clear enough that with certain other changes it may also
> be needed.

In reality, I expect ITSC never to need a recalc, and ARCH_CAPS is going
to turn into not-a-special-case just as soon as I can possibly make it
happen.

~Andrew

