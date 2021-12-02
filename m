Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D44664E7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236598.410448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmkk-0000Sm-Ly; Thu, 02 Dec 2021 14:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236598.410448; Thu, 02 Dec 2021 14:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmkk-0000Qx-Ij; Thu, 02 Dec 2021 14:08:02 +0000
Received: by outflank-mailman (input) for mailman id 236598;
 Thu, 02 Dec 2021 14:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vx2B=QT=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msmki-0000DJ-Uk
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:08:00 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 414c4d56-5379-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 15:08:00 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44160)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msmkh-000vSf-0U (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 02 Dec 2021 14:07:59 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EE7B01FF79;
 Thu,  2 Dec 2021 14:07:58 +0000 (GMT)
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
X-Inumbo-ID: 414c4d56-5379-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5445b896-23fe-8231-bb8c-3c4ab005511d@srcf.net>
Date: Thu, 2 Dec 2021 14:07:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 5/8] x86/boot: Drop xen_virt_end
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-6-andrew.cooper3@citrix.com>
 <852a6903-02d3-c167-6cef-3079a6b1c64f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <852a6903-02d3-c167-6cef-3079a6b1c64f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2021 11:56, Jan Beulich wrote:
> On 30.11.2021 11:04, Andrew Cooper wrote:
>> The calculation in __start_xen() for xen_virt_end is an opencoding of
>> ROUNDUP(_end, 2M).  This is __2M_rwdata_end as provided by the linker script.
>>
>> This corrects the bound calculations in arch_livepatch_init() and
>> update_xen_mappings() to not enforce 2M alignment when Xen is not compiled
>> with CONFIG_XEN_ALIGN_2M
>>
>> Furthermore, since 52975142d154 ("x86/boot: Create the l2_xenmap[] mappings
>> dynamically"), there have not been extraneous mappings to delete, meaning that
>> the call to destroy_xen_mappings() has been a no-op.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While there's a contextual conflict with patch 4, my understanding is
> that this one is independent of that.

Correct.  I was in the middle of writing this patch when I discovered
the disaster which is the logic in patch 4.

>  On that basis
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

