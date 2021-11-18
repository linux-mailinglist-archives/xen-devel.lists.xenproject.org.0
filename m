Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E041645591F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227311.393121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnel3-0002GN-Q6; Thu, 18 Nov 2021 10:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227311.393121; Thu, 18 Nov 2021 10:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnel3-0002Ea-Md; Thu, 18 Nov 2021 10:35:09 +0000
Received: by outflank-mailman (input) for mailman id 227311;
 Thu, 18 Nov 2021 10:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnel2-0002EU-1U
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:35:08 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 321a035f-485b-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 11:35:06 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60042)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnekz-000toT-8P (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 10:35:05 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4F9E11FC53;
 Thu, 18 Nov 2021 10:35:05 +0000 (GMT)
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
X-Inumbo-ID: 321a035f-485b-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9ce22608-a1ef-adbd-6455-8ae1af88b388@srcf.net>
Date: Thu, 18 Nov 2021 10:35:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
 <c1dc1fed-8f07-5074-592e-b240f2bbdd44@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
In-Reply-To: <c1dc1fed-8f07-5074-592e-b240f2bbdd44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2021 09:58, Jan Beulich wrote:
> On 17.11.2021 17:48, Andrew Cooper wrote:
>> There are several cases where the act of interrupting a remote processor has
>> the required side effect.  Explicitly allow NULL function pointers so the
>> calling code doesn't have to provide a stub implementation.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> The wait parameter is a little weird.  It serves double duty and will confirm
>> that the IPI has been taken.  All it does is let you control whether you also
>> wait for the handler to complete first.  As such, it is effectively useless
>> with a stub function.
>>
>> I don't particularly like folding into the .wait() path like that, but I
>> dislike it less than an if()/else if() and adding a 3rd cpumask_clear_cpu()
>> into the confusion which is this logic.
> I can accept this, albeit personally I would have preferred the extra if()
> over the goto.

Just so it's been posted.  This is what the if/else looks like:

diff --git a/xen/common/smp.c b/xen/common/smp.c
index 79f4ebd14502..ff569bbe9d53 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -87,7 +87,11 @@ void smp_call_function_interrupt(void)
 
     irq_enter();
 
-    if ( call_data.wait )
+    if ( unlikely(!func) )
+    {
+        cpumask_clear_cpu(cpu, &call_data.selected);
+    }
+    else if ( call_data.wait )
     {
         (*func)(info);
         smp_mb();


GCC does manage to fold this into the goto version presented originally.

If everyone else thinks this version is clearer to read then I'll go
with it.

~Andrew

