Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE45333F2
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 01:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336768.561173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte30-0001Kp-5t; Tue, 24 May 2022 23:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336768.561173; Tue, 24 May 2022 23:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nte30-0001Hi-2y; Tue, 24 May 2022 23:34:42 +0000
Received: by outflank-mailman (input) for mailman id 336768;
 Tue, 24 May 2022 23:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nte2y-0001HM-E5
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 23:34:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1266aa72-dbba-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 01:34:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EC4B9CE1BC1;
 Tue, 24 May 2022 23:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1359C34100;
 Tue, 24 May 2022 23:34:32 +0000 (UTC)
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
X-Inumbo-ID: 1266aa72-dbba-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653435273;
	bh=7x77m0lmq569NxhePN9/OdYwzLfoyhfSqs84CUo+gK8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BCGM9EIIabsiIOMMg+/Vdmxi1v+XFf9nRKNcCZkGmP2rPb7SRzw/mbMI0O/WuOiH7
	 heZPzdAaozpT7vHj38sFKd2Fh6J5n/oDUrOABUB+kWn1JcpZFryqIblmwGGbyMUqMd
	 wfOIc+idIma/WHXKKjy/qYTNDAZ4bZYpWB/RGkWkf56JtdH54Lb8d9qyNPIqyVeQeH
	 mpkDyHOmDG/CPtSbLeHgPNtKYyw/jxz08sMUCd4C0oeoqWcBEMEnKh1s1y+vrZgosZ
	 8qXbIr51v2XI+9ngL5Im0rNsiW0OrGBsmpxaUsi1b/mOF3LsPd79wzkPkWGbzkyCS8
	 ZlZffdS4uFlAg==
Date: Tue, 24 May 2022 16:34:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 6/7] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <6ef42026-8b14-c16f-175c-5b3d9ca55f99@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205241622050.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop> <20220513210730.679871-6-sstabellini@kernel.org> <6ef42026-8b14-c16f-175c-5b3d9ca55f99@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 May 2022, Julien Grall wrote:
> On 13/05/2022 22:07, Stefano Stabellini wrote:
> > diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> > new file mode 100644
> > index 0000000000..3e7ad54da7
> > --- /dev/null
> > +++ b/tools/helpers/init-dom0less.c
> > @@ -0,0 +1,345 @@
> > +#include <stdbool.h>
> > +#include <syslog.h>
> > +#include <stdio.h>
> > +#include <err.h>
> > +#include <stdlib.h>
> > +#include <sys/mman.h>
> > +#include <sys/time.h>
> > +#include <xenstore.h>
> > +#include <xenctrl.h>
> > +#include <xenguest.h>
> > +#include <libxl.h>
> > +#include <xenevtchn.h>
> > +#include <xenforeignmemory.h>
> > +#include <xen/io/xs_wire.h>
> > +
> > +#include "init-dom-json.h"
> > +
> > +#define XENSTORE_PFN_OFFSET 1
> > +#define STR_MAX_LENGTH 64
> 
> Sorry, I should have spotted this earlier. Looking at the nodes below, the
> node control/platform-feature-multiprocessor-suspend would result to 63
> characters without even the domid:
> 
> 42sh> echo -n '/local/domain//control/platform-feature-multiprocessor-suspend'
> | wc -c
> 62
> 
> So I think it would be wiser to bump the value to 128 here.
> 
> > +static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> > +                            domid_t domid, char *path, char *val)
> > +{
> > +    char full_path[STR_MAX_LENGTH];
> > +    struct xs_permissions perms[2];
> > +
> > +    perms[0].id = domid;
> > +    perms[0].perms = XS_PERM_NONE;
> > +    perms[1].id = 0;
> > +    perms[1].perms = XS_PERM_READ;
> > +
> > +    if (snprintf(full_path, STR_MAX_LENGTH,
> > +                 "/local/domain/%u/%s", domid, path) < 0)
> 
> The issue I mentionned above would not have been spotted because you only
> check the value is negative. From glibc version 2.1,
> snprintf() returns the number of character (excluding the NUL bytes) it would
> have written if the buffer is big enough.
> 
> So to avoid writing a truncated node, you will want to check the return value
> is > 0 && < (STR_MAX_LENGTH - 1).
> 
> Looking at the code below, there are a few wrong use of snprintf(). To avoid
> another round (we are at v7 already), I would be OK if they are dealt after so
> long we bump the size of the buffer.
> 
> The rest of the code looks ok:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thank you that is very reasonable. I committed the series with
STR_MAX_LENGTH set to 128. I'll send a separate patch to improve the
snprintf checks.

