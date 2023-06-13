Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A317E72EA31
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548363.856289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q985I-0002fZ-54; Tue, 13 Jun 2023 17:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548363.856289; Tue, 13 Jun 2023 17:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q985I-0002du-0r; Tue, 13 Jun 2023 17:45:36 +0000
Received: by outflank-mailman (input) for mailman id 548363;
 Tue, 13 Jun 2023 17:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W4la=CB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1q985G-0002do-Qb
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:45:34 +0000
Received: from ppsw-30.srv.uis.cam.ac.uk (ppsw-30.srv.uis.cam.ac.uk
 [131.111.8.130]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b57f8e-0a12-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 19:45:30 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40314)
 by ppsw-30.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1q9850-00BTgd-Ga (Exim 4.96) (return-path <amc96@srcf.net>);
 Tue, 13 Jun 2023 18:45:18 +0100
Received: from [10.80.67.26] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C3AEF1FC91;
 Tue, 13 Jun 2023 18:45:17 +0100 (BST)
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
X-Inumbo-ID: 16b57f8e-0a12-11ee-8611-37d641c3527e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
Date: Tue, 13 Jun 2023 18:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/06/2023 6:39 pm, Julien Grall wrote:
> Hi,
>
> On 13/06/2023 17:22, Andrew Cooper wrote:
>> These are disliked specifically by MISRA, but they also interfere
>> with code
>
> Please explicitly name the rule.

I can't remember it off the top of my head.

Stefano/Bertrand?

>
>> legibility by hiding control flow.  Expand and drop them.
>>
>>   * Rearrange the order of actions to write into rc, then render rc
>> in the
>>     gdprintk().
>>   * Drop redundant "rc = rc" assignments
>>   * Switch to using %pd for rendering domains
>>
>> No functional change.  Resulting binary is identical.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

>
>> base-commit: f29363922c1b41310c3d87fd9a861ffa9db9204a
>
> I notice you have a few e-mail contain this tag. This is a pretty
> useful when reviewing patches. Do you know which tool is creating it?

Plain git, and the capability has been around for years and years but
nigh on impossible to search for or find in the manual.  Searching for
"base-commit" gets you a tonne of intros of how to rebase.

You want

[format]
        useAutoBase = "whenAble"

or pass --base=auto to git-format-patch

~Andrew

