Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99B492593
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 13:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258469.445149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nRP-0004z1-4D; Tue, 18 Jan 2022 12:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258469.445149; Tue, 18 Jan 2022 12:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nRP-0004x6-0p; Tue, 18 Jan 2022 12:18:23 +0000
Received: by outflank-mailman (input) for mailman id 258469;
 Tue, 18 Jan 2022 12:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9nRN-0004wz-CF
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 12:18:21 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89e0756-7858-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 13:18:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49474)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9nRJ-000Ntf-2d (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 12:18:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 75D981FCF5;
 Tue, 18 Jan 2022 12:18:17 +0000 (GMT)
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
X-Inumbo-ID: b89e0756-7858-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Content-Type: multipart/alternative;
 boundary="------------H50j0bhPslycXtbAYE7C9vgd"
Message-ID: <5fa523ca-0a14-862b-94f4-3e7a78319496@srcf.net>
Date: Tue, 18 Jan 2022 12:18:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/Intel: use CPUID bit to determine PPIN availability
In-Reply-To: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>

This is a multi-part message in MIME format.
--------------H50j0bhPslycXtbAYE7C9vgd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 15:30, Jan Beulich wrote:
> As of SDM revision 076 there is a CPUID bit for this functionality. Use
> it to amend the existing model-based logic.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In xen-cpuid.c I wasn't sure whether it's better to put the 7b1 table
> next to the 7a1 one, or whether tables should continue to be placed by
> feature set ABI identifier.

They're in FEATURESET_* order, which is also chronological order. 
str_7b1 wants to be after str_e21a.

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -156,7 +156,7 @@ static const char *const str_e8b[32] =
>      [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
>  
>      [20] = "no-lmsl",
> -    /* [22] */                 [23] = "ppin",
> +    /* [22] */                 [23] = "amd-ppin",

We don't retrofit names like this.  If we did, loads of the speculation
bits would need to change.

The Intel vs AMD split is clear from the leaf index, and the only reason
we have the distinction is to fit the two bits into the same namespace.

Please leave this as was, to match its name in the source code.

> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -865,6 +865,13 @@ static void intel_init_ppin(const struct
>      {
>          uint64_t val;
>  
> +    default:

Considering the comment above this switch statement, which you haven't
edited at all, this wants a note saying that a CPUID bit was added in
Sapphire Rapids, but older CPUs still require model-specific enumeration.

~Andrew
--------------H50j0bhPslycXtbAYE7C9vgd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17/01/2022 15:30, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com">
      <pre class="moz-quote-pre" wrap="">As of SDM revision 076 there is a CPUID bit for this functionality. Use
it to amend the existing model-based logic.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
In xen-cpuid.c I wasn't sure whether it's better to put the 7b1 table
next to the 7a1 one, or whether tables should continue to be placed by
feature set ABI identifier.</pre>
    </blockquote>
    <br>
    They're in FEATURESET_* order, which is also chronological order. 
    str_7b1 wants to be after str_e21a.<br>
    <br>
    <blockquote type="cite"
      cite="mid:239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com">
      <pre class="moz-quote-pre" wrap="">--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -156,7 +156,7 @@ static const char *const str_e8b[32] =
     [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
 
     [20] = "no-lmsl",
-    /* [22] */                 [23] = "ppin",
+    /* [22] */                 [23] = "amd-ppin",</pre>
    </blockquote>
    <br>
    We don't retrofit names like this.  If we did, loads of the
    speculation bits would need to change.<br>
    <br>
    The Intel vs AMD split is clear from the leaf index, and the only
    reason we have the distinction is to fit the two bits into the same
    namespace.<br>
    <br>
    Please leave this as was, to match its name in the source code<font
      size="4">.</font><br>
    <br>
    <blockquote type="cite"
      cite="mid:239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com">
      <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -865,6 +865,13 @@ static void intel_init_ppin(const struct
     {
         uint64_t val;
 
+    default:</pre>
    </blockquote>
    <br>
    Considering the comment above this switch statement, which you
    haven't edited at all, this wants a note saying that a CPUID bit was
    added in Sapphire Rapids, but older CPUs still require
    model-specific enumeration.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------H50j0bhPslycXtbAYE7C9vgd--

