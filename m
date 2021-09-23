Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AA41625A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194487.346471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQxr-0005tE-Ht; Thu, 23 Sep 2021 15:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194487.346471; Thu, 23 Sep 2021 15:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQxr-0005rR-F0; Thu, 23 Sep 2021 15:48:47 +0000
Received: by outflank-mailman (input) for mailman id 194487;
 Thu, 23 Sep 2021 15:48:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTQxq-0005rL-N4
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:48:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbd06948-1c85-11ec-ba58-12813bfff9fa;
 Thu, 23 Sep 2021 15:48:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4853B6008E;
 Thu, 23 Sep 2021 15:48:44 +0000 (UTC)
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
X-Inumbo-ID: bbd06948-1c85-11ec-ba58-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632412124;
	bh=FI+LxKsIIc2jqDmoLIF3HH4uGPkcIv4DllCKMTlM1lA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YrAL3rtByebZdH0B+5sxM2xIMXgYEkp8WRfTrIyZBbIHYt5FSnhvbEO5vzNCj6Mwl
	 0gmUX6PfilnDPVtJnbcWIZxGM6q3PMhNXWwH2IfHsVK9QozPiQO/AajcR90nH8jkwu
	 1lRoy1MX3bs6mLq0z83hDSbsYifaXNgGJwQB1QbOaGDaRUbVXZ7fYMmQHLhkiUuZBo
	 12Z5+daWlV/5E+9WLmdoxXbGELDQBoRnsnfExXr97G1XXVqoLxxK7e/L/vPyPY5iAk
	 5GiFytYxShi2LlFWOaxkpWZ3RnBD/W4aEZpg0S8uKcyIRGmLoaZMxOYTSj+nJOplY/
	 QzmjIsrPlOvjQ==
Date: Thu, 23 Sep 2021 08:48:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
In-Reply-To: <98e432f0-6be1-6394-1c06-ac5e726c708d@epam.com>
Message-ID: <alpine.DEB.2.21.2109230848290.17979@sstabellini-ThinkPad-T480s>
References: <20210922101422.2319240-1-andr2000@gmail.com> <20210922101422.2319240-2-andr2000@gmail.com> <alpine.DEB.2.21.2109221407350.17979@sstabellini-ThinkPad-T480s> <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com> <7880dee9-7372-5a25-db55-018f21e8b08c@suse.com>
 <98e432f0-6be1-6394-1c06-ac5e726c708d@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1873022447-1632412124=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1873022447-1632412124=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> On 23.09.21 12:05, Juergen Gross wrote:
> > On 23.09.21 11:02, Oleksandr Andrushchenko wrote:
> >>
> >> On 23.09.21 00:10, Stefano Stabellini wrote:
> >>> On Wed, 22 Sep 2021, Oleksandr Andrushchenko wrote:
> >>>> --- a/drivers/xen/xen-pciback/xenbus.c
> >>>> +++ b/drivers/xen/xen-pciback/xenbus.c
> >>>> @@ -743,6 +743,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
> >>>>       int __init xen_pcibk_xenbus_register(void)
> >>>>    {
> >>>> +    if (!xen_pcibk_pv_support())
> >>>> +        return 0;
> >>> Is this truly enough to stop the PV backend from initializing? Have you
> >>> actually tested it to make sure? If it works, amazing! I am quite happy
> >>> about this approach :-)
> >>
> >> Well, I put some logs into the driver and saw nothing obvious pointing
> >>
> >> to any backend activities (probably this is also because I don't have any
> >>
> >> frontend). I see that the xenbus driver is not registered. In XenStore I see:
> >>
> >> root@dom0:~# xenstore-ls -f | grep pci
> >> /local/domain/0/backend/pci = ""
> >> /local/domain/0/backend/pci/2 = ""
> >> /local/domain/0/backend/pci/2/0 = ""
> >> /local/domain/0/backend/pci/2/0/frontend = "/local/domain/2/device/pci/0"
> >> /local/domain/0/backend/pci/2/0/frontend-id = "2"
> >> /local/domain/0/backend/pci/2/0/online = "1"
> >> /local/domain/0/backend/pci/2/0/state = "1"
> >> /local/domain/0/backend/pci/2/0/domain = "DomU"
> >> /local/domain/0/backend/pci/2/0/key-0 = "0000:03:00.0"
> >> /local/domain/0/backend/pci/2/0/dev-0 = "0000:03:00.0"
> >> /local/domain/0/backend/pci/2/0/opts-0 = "msitranslate=0,power_mgmt=0,permissive=0,rdm_policy=strict"
> >> /local/domain/0/backend/pci/2/0/state-0 = "1"
> >> /local/domain/0/backend/pci/2/0/num_devs = "1"
> >> /local/domain/2/device/pci = ""
> >> /local/domain/2/device/pci/0 = ""
> >> /local/domain/2/device/pci/0/backend = "/local/domain/0/backend/pci/2/0"
> >> /local/domain/2/device/pci/0/backend-id = "0"
> >> /local/domain/2/device/pci/0/state = "1"
> >> /libxl/pci = ""
> >> /libxl/pci/0000-03-00-0 = ""
> >> /libxl/pci/0000-03-00-0/domid = "2"
> >>
> >> But IIUIC these come from the toolstack
> >>
> >> @Juergen, do you know how to check if the backend is indeed not running
> >>
> >> or the above should be enough to prove?
> >
> > I don't see how the backend could be running without being registered
> > with xenbus. It won't receive any watches, so there is no way a
> > connection with a frontend could be established.
> 
> This is my understanding too, so the only change I've put in patch I removed
> 
> register/unregister. It seems this is just enough and the patch should be ok as is

Fantastic! Thanks for checking.
--8323329-1873022447-1632412124=:17979--

