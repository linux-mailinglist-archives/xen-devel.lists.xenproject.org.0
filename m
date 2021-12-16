Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDA477A89
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248156.428022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuWu-0007oq-G2; Thu, 16 Dec 2021 17:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248156.428022; Thu, 16 Dec 2021 17:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuWu-0007m1-D3; Thu, 16 Dec 2021 17:26:56 +0000
Received: by outflank-mailman (input) for mailman id 248156;
 Thu, 16 Dec 2021 17:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxuWs-0007l9-E8
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:26:54 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4de27d-5e95-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 18:26:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44498)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxuWo-000Y8o-1h (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 17:26:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 384EA1FA9B;
 Thu, 16 Dec 2021 17:26:50 +0000 (GMT)
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
X-Inumbo-ID: 5c4de27d-5e95-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <edcb690b-c21c-137f-0bda-79eda64a0164@srcf.net>
Date: Thu, 16 Dec 2021 17:26:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-23-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH 22/57] tools/console: have one Makefile per
 program/directory
In-Reply-To: <20211206170241.13165-23-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:02, Anthony PERARD wrote:
> Sources of both xenconsoled and xenconsole are already separated into
> different directory and don't share anything in common. Having two
> different Makefile means it's easier to deal with *FLAGS.
>
> Some common changes:
> Rename $(BIN) to $(TARGETS), this will be useful later.
> Stop removing *.so *.rpm *.a as they aren't created here.
> Use $(OBJS-y) to list objects.
> Update $(CFLAGS) for the directory rather than a single object.
>
> daemon:
>     Remove the need for $(LDLIBS_xenconsoled), use $(LDLIBS) instead.
>     Remove the need for $(CONSOLE_CFLAGS-y) and use $(CFLAGS-y)
> 	instead.
>
> client:
>     Remove the unused $(LDLIBS_xenconsole)
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  .gitignore                    |  4 +--
>  tools/console/Makefile        | 49 +++-------------------------------
>  tools/console/client/Makefile | 39 +++++++++++++++++++++++++++
>  tools/console/daemon/Makefile | 50 +++++++++++++++++++++++++++++++++++
>  4 files changed, 94 insertions(+), 48 deletions(-)
>  create mode 100644 tools/console/client/Makefile
>  create mode 100644 tools/console/daemon/Makefile
>
> diff --git a/.gitignore b/.gitignore
> index b39b996718..c31fa9b841 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -159,8 +159,8 @@ tools/libs/util/libxenutil.map
>  tools/libs/vchan/headers.chk
>  tools/libs/vchan/libxenvchan.map
>  tools/libs/vchan/xenvchan.pc
> -tools/console/xenconsole
> -tools/console/xenconsoled
> +tools/console/client/xenconsole
> +tools/console/daemon/xenconsoled

$ git ls-files -- :/ | grep gitignore
../.gitignore
../tools/fuzz/cpu-policy/.gitignore
../tools/libs/.gitignore
../tools/misc/.gitignore
../tools/tests/cpu-policy/.gitignore
../tools/tests/resource/.gitignore
../tools/tests/tsx/.gitignore
../tools/tests/vhpet/.gitignore
../tools/tests/xenstore/.gitignore
tools/kconfig/.gitignore
xsm/flask/.gitignore


We're starting to use per-dir gitignores, because it has far less
problematic behaviour for code movement.

I think we ought to take this opportunity to clean things up for the better.

> diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
> new file mode 100644
> index 0000000000..44176c6d93
> --- /dev/null
> +++ b/tools/console/client/Makefile
> @@ -0,0 +1,39 @@
> +XEN_ROOT=$(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +CFLAGS += -Werror

-Werror really ought to come from somewhere common, seeing as we expect
it to be unilaterally set.

~Andrew

