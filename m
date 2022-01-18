Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC20492F57
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 21:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258640.445685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9v5y-00062c-HU; Tue, 18 Jan 2022 20:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258640.445685; Tue, 18 Jan 2022 20:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9v5y-0005zm-Cw; Tue, 18 Jan 2022 20:28:46 +0000
Received: by outflank-mailman (input) for mailman id 258640;
 Tue, 18 Jan 2022 20:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9v5w-0005zg-Vl
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 20:28:44 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39ee75dd-789d-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 21:28:43 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48518)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9v5t-000Le4-8F (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 20:28:41 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4EDC21FA12;
 Tue, 18 Jan 2022 20:28:41 +0000 (GMT)
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
X-Inumbo-ID: 39ee75dd-789d-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e076f39f-7364-b9a2-ba0c-fd84e7f19ab0@srcf.net>
Date: Tue, 18 Jan 2022 20:28:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Intel: use CPUID bit to determine PPIN availability
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2022 15:30, Jan Beulich wrote:
> As of SDM revision 076 there is a CPUID bit for this functionality. Use
> it to amend the existing model-based logic.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

https://lore.kernel.org/lkml/20220107225442.1690165-1-tony.luck@intel.com/T/#u
suggests that Sapphire Rapids also needs the model specific treatment.

I agree with the "only-expose-on-error" observation, so perhaps we ought
to make these details available to the hardware domain in a suitable form.

~Andrew

