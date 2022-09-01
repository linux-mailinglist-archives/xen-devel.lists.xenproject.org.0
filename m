Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133E5A9779
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396596.636792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjjf-0007yM-2d; Thu, 01 Sep 2022 12:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396596.636792; Thu, 01 Sep 2022 12:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTjje-0007vE-Vq; Thu, 01 Sep 2022 12:55:54 +0000
Received: by outflank-mailman (input) for mailman id 396596;
 Thu, 01 Sep 2022 12:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICnC=ZE=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oTjje-0007Ob-7J
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:55:54 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69a2eda1-29f5-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 14:55:53 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id y64so10633569ede.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 05:55:53 -0700 (PDT)
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
X-Inumbo-ID: 69a2eda1-29f5-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=jhfzIaUon51fYQp0F1k+dFqo+kZvbfWBW8TIyHPfH9o=;
        b=jMSC0YquDnvD/wKHI7Bl6kt3HP8PI5qhhb7sTMXUL+2sSZjhkC4vH4MxakkmvLKGjk
         QPxjuyey7HagF+AKEaAsGWlUWccERGb/0c3siHGQcJRHzMwkTFAm8yI38icYY1dnI/ZR
         aJcp7GhNNHp+/NeWvUyqk16WaRrTwzCxLwMXc/YmVsxcBaTyarMh4CYu0gU1Afya2nQt
         Y97YDdJE3S2oo7RCBbDVSvod461mGchoBGCr7dPjHgA/TAl8PQAqmeFnn+NUzkyI6D68
         xImxBql/4xfUNMzoJes4HdZqS7VmJqHI1VM19eEqRUgI6esl0d1vJLnCn1eSCqjldWcB
         bbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=jhfzIaUon51fYQp0F1k+dFqo+kZvbfWBW8TIyHPfH9o=;
        b=HqniuDbKLt7IkGj5iYuUOThYyMwbpNqdS/s6YwHWOmpZbNUlMkPWhSfTOh9ATGX236
         QYbVAm6lY4CcFHHQAzPTw8IXJzXGQychXke6rs+A9ArxGz6nLSk+neUWNRp3BgWQlymI
         m4qK2MEd/04VUU5cbEDSJvbciwyE9bTTvOkCAoid1o6AeDCjpd3oNoEo+cKduiiqVfay
         UoYyk1F1gyZ4UipKbth4oOGHvORxucirzKTa4OsG9KfWYJH3jMxokpGWlF4bv3BvBXif
         rlqFVHxwYxIhuHaaFy7Hfdrb69ZW1S5K2SexdHKkfXc4Y3uP7toVUBH2YyAPBi3wd3CR
         uEKg==
X-Gm-Message-State: ACgBeo2at5GkeJPL6/kQm5SBcMazszeviH3oaKLo29jnh0ebLA5zKQEs
	njvXF6CQbRbzkBhwPOI0S9NsyicvqCdzTkCO7eKJZLcd
X-Google-Smtp-Source: AA6agR67InrKUxArKpIRlcyj7cVISplMIgyuL+xsXdnE6v/afHMiKYTX1RTDY2PSTc+Hfk6DW1c51JwwhoW8mNZLH7w=
X-Received: by 2002:aa7:c956:0:b0:43b:206d:c283 with SMTP id
 h22-20020aa7c956000000b0043b206dc283mr28605542edt.381.1662036953082; Thu, 01
 Sep 2022 05:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220829151536.8578-1-jandryuk@gmail.com> <31F127F6-A096-4991-9D4C-1B2E032689A1@gmail.com>
In-Reply-To: <31F127F6-A096-4991-9D4C-1B2E032689A1@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 1 Sep 2022 08:55:41 -0400
Message-ID: <CAKf6xpvZNHQyQq9zqNpD0kXFK+pryAKKbRDxoiMkB=PrhvSGKQ@mail.gmail.com>
Subject: Re: [PATCH] xen-pcifront: Handle missed Connected state
To: Rich Persaud <persaur@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, linux-pci@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 10:35 PM Rich Persaud <persaur@gmail.com> wrote:
>
> On Aug 29, 2022, at 11:16 AM, Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > =EF=BB=BFAn HVM guest with linux stubdom and 2 PCI devices failed to st=
art as
> > libxl timed out waiting for the PCI devices to be added.  It happens
> > intermittently but with some regularity.  libxl wrote the two xenstore
> > entries for the devices, but then timed out waiting for backend state 4
> > (Connected) - the state stayed at 7 (Reconfiguring).  (PCI passthrough
> > to an HVM with stubdomain is PV passthrough to the stubdomain and then
> > HVM passthrough with the QEMU inside the stubdomain.)
> >
> > The stubdom kernel never printed "pcifront pci-0: Installing PCI
> > frontend", so it seems to have missed state 4 which would have
> > called pcifront_try_connect -> pcifront_connect_and_init_dma
>
> Is there a state machine doc/flowchart for LibXL and Xen PCI device passt=
hrough to Linux? This would be a valuable addition to Xen's developer docs,=
 even as a whiteboard photo in this thread.

I am not aware of one.

-Jason

