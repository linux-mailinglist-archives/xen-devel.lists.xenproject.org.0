Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA704504A5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225898.390221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbKk-0004jp-JM; Mon, 15 Nov 2021 12:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225898.390221; Mon, 15 Nov 2021 12:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbKk-0004hC-GF; Mon, 15 Nov 2021 12:43:38 +0000
Received: by outflank-mailman (input) for mailman id 225898;
 Mon, 15 Nov 2021 12:43:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmbKj-0004h6-54
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:43:37 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a64e05ec-4611-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:43:36 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59206)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmbKh-000qDw-8t (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 12:43:35 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2A2B91FC18;
 Mon, 15 Nov 2021 12:43:35 +0000 (GMT)
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
X-Inumbo-ID: a64e05ec-4611-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-4-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16 3/4] test/tsx: set grant version for created
 domains
Message-ID: <f544fcaf-be7b-6c2c-7e9f-7847477739a9@srcf.net>
Date: Mon, 15 Nov 2021 12:43:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115121741.3719-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 15/11/2021 12:17, Roger Pau Monne wrote:
> Set the grant table version for the created domains to use version 1,
> as such tests domains don't require the usage of the grant table at
> all. A TODO note is added to switch those dummy domains to not have a
> grant table at all when possible. Without setting the grant version
> the domains for the tests cannot be created.
>
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
>
> This patch only modifies a test, so it should be safe to commit as
> it's not going to cause any changes to the hypervisor or the tools.
> Worse that could happen is it makes the test even more broken, but
> it's already unusable.

What do you mean unusable?=C2=A0 Other than this, the test works.

> ---
>  tools/tests/tsx/test-tsx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
> index fab99c135e..f1dcff4c30 100644
> --- a/tools/tests/tsx/test-tsx.c
> +++ b/tools/tests/tsx/test-tsx.c
> @@ -444,6 +444,8 @@ static void test_guests(void)
>          struct xen_domctl_createdomain c =3D {
>              .max_vcpus =3D 1,
>              .max_grant_frames =3D 1,
> +            /* TODO: switch to 0 once support for no grant table is ad=
ded. */

I'd avoid these TODOs.=C2=A0 It's test code, so really doesn't matter too=
 much.

However, there is a further task for this test to actually boot enough
of a guest to dump CPUID as visible inside the guest, and cross-check
with the toolstack's view of the data.

How exactly to get that data out of the VM is an open question, but it
might involve xenconsoled.

~Andrew


