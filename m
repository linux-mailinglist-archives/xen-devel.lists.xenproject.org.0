Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC956CAA7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 18:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363911.594540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oADKd-0002N7-02; Sat, 09 Jul 2022 16:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363911.594540; Sat, 09 Jul 2022 16:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oADKc-0002LB-T9; Sat, 09 Jul 2022 16:29:22 +0000
Received: by outflank-mailman (input) for mailman id 363911;
 Sat, 09 Jul 2022 16:29:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEs+=XO=molgen.mpg.de=pmenzel@srs-se1.protection.inumbo.net>)
 id 1oADKb-0002L5-Ih
 for xen-devel@lists.xenproject.org; Sat, 09 Jul 2022 16:29:21 +0000
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462135e8-ffa4-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 18:29:19 +0200 (CEST)
Received: from [192.168.0.2] (ip5f5aedfa.dynamic.kabel-deutschland.de
 [95.90.237.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4B3EE61EA1923;
 Sat,  9 Jul 2022 18:29:15 +0200 (CEST)
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
X-Inumbo-ID: 462135e8-ffa4-11ec-bd2d-47488cf2e6aa
Message-ID: <9d547826-d4f8-1547-c842-6eded10a7584@molgen.mpg.de>
Date: Sat, 9 Jul 2022 18:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Lots of XEN init functions called in non-XEN environment
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Booting Debian’s Linux kernel with `initcall_debug` on a laptop with no 
XEN being used, I see a lot of Xen related init functions to be called.

```
$ sudo dmesg | grep -e balloon -e xen
[    0.066207] calling  xen_cons_init+0x0/0x50 @ 0
[    0.066210] initcall xen_cons_init+0x0/0x50 returned 0 after 0 usecs
[    0.096491] calling  xen_pvh_gnttab_setup+0x0/0x34 @ 1
[    0.096491] initcall xen_pvh_gnttab_setup+0x0/0x34 returned -19 after 
0 usecs
[    0.100353] calling  xenbus_init+0x0/0x322 @ 1
[    0.100353] initcall xenbus_init+0x0/0x322 returned -19 after 0 usecs
[    0.100353] calling  register_xen_pci_notifier+0x0/0x2d @ 1
[    0.100353] initcall register_xen_pci_notifier+0x0/0x2d returned 0 
after 0 usecs
[    0.100353] calling  xen_pcpu_init+0x0/0xb5 @ 1
[    0.100353] initcall xen_pcpu_init+0x0/0xb5 returned -19 after 0 usecs
[    0.169465] calling  balloon_init+0x0/0x1e0 @ 1
[    0.169467] initcall balloon_init+0x0/0x1e0 returned -19 after 0 usecs
[    0.169470] calling  xen_setup_shutdown_event+0x0/0x30 @ 1
[    0.169473] initcall xen_setup_shutdown_event+0x0/0x30 returned -19 
after 0 usecs
[    0.169476] calling  xenbus_probe_backend_init+0x0/0x6b @ 1
[    0.169482] initcall xenbus_probe_backend_init+0x0/0x6b returned 0 
after 0 usecs
[    0.169485] calling  xenbus_probe_frontend_init+0x0/0x4f @ 1
[    0.169489] initcall xenbus_probe_frontend_init+0x0/0x4f returned 0 
after 0 usecs
[    0.169491] calling  xen_acpi_pad_init+0x0/0x3c @ 1
[    0.169493] initcall xen_acpi_pad_init+0x0/0x3c returned -19 after 0 
usecs
[    0.257640] calling  xenfb_init+0x0/0x3b @ 1
[    0.257642] initcall xenfb_init+0x0/0x3b returned -19 after 0 usecs
[    0.259498] calling  xenbus_probe_initcall+0x0/0x6f @ 1
[    0.259599] initcall xenbus_probe_initcall+0x0/0x6f returned 0 after 
98 usecs
[    0.259615] calling  xenbus_init+0x0/0x3b @ 1
[    0.259617] initcall xenbus_init+0x0/0x3b returned -19 after 0 usecs
[    0.259620] calling  xenbus_backend_init+0x0/0x44 @ 1
[    0.259622] initcall xenbus_backend_init+0x0/0x44 returned -19 after 
0 usecs
[    0.259666] calling  xen_late_init_mcelog+0x0/0x5e @ 1
[    0.259668] initcall xen_late_init_mcelog+0x0/0x5e returned -19 after 
0 usecs
[    0.259811] calling  xen_hvc_init+0x0/0x1de @ 1
[    0.259813] initcall xen_hvc_init+0x0/0x1de returned -19 after 0 usecs
[    0.263794] calling  xenkbd_init+0x0/0x3b @ 1
[    0.263796] initcall xenkbd_init+0x0/0x3b returned -19 after 0 usecs
[    0.285181] calling  balloon_wait_finish+0x0/0xda @ 1
[    0.285183] initcall balloon_wait_finish+0x0/0xda returned -19 after 
0 usecs
```

All these drivers(?) are enabled in Debian’s Linux configuration to also 
support XEN setups, but I wonder, if the system can’t detect once if 
it’s running in a XEN environment, and if it’s not then to skip all the 
XEN related init functions.


Kind regards,

Paul

