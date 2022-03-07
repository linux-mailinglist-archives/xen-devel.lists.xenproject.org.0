Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD64D03F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286277.485738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG7e-0004Cu-M8; Mon, 07 Mar 2022 16:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286277.485738; Mon, 07 Mar 2022 16:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG7e-0004AE-JC; Mon, 07 Mar 2022 16:22:10 +0000
Received: by outflank-mailman (input) for mailman id 286277;
 Mon, 07 Mar 2022 16:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e/ad=TS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nRG7d-0004A8-73
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:22:09 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbfce285-9e32-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:22:08 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id e8so21233512ljj.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Mar 2022 08:22:08 -0800 (PST)
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
X-Inumbo-ID: bbfce285-9e32-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9C5DBCbsfu8SZHqZQ6PXI5sSarw5G3jk2qwOBmV/P2o=;
        b=oHOY+WEfbRDqKQP6yA+Eg3+DiHtJAGHh2tkMkmcA/nY0XMnNmJ8YW5L1R1/E7h2D+w
         dvxvTcQ5qWb64dPN+nI2B43uAqcgdeIiLEVybEtKa5eOC1/M7Ozb2SlOcPs9BgLYYAwM
         uEiBNkKBASHDjI+gAL9gIDYeJFZPfoMPwbogVMLgPjOfBVBHjMWwO7NbTImxkC/CMi2X
         uMGEQoyWQTtWMyw39OiopCbn31admljGGV18cwMiYGZXptOQQPUyr5Th/o3XxpPURBXH
         dS+rwH5bbZXGTzJnAxcKGd/eBy9ZNI86bTJ72Q0qeX/JxR73RF1rVo0P83kiPylZ6bh2
         EsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9C5DBCbsfu8SZHqZQ6PXI5sSarw5G3jk2qwOBmV/P2o=;
        b=iIlFWKTjIXSlLjWvxOyOE4bjmzHKh/wyT9E9X70da/4ijJiy7HSEuok+5MpZn7RVT1
         BXLIPbfBDGEJn58HCI7uAOEjnJDWbIL3yK23tFwLzKbmaGVpA3XMW70X9jYaqhFLcfZG
         xIdbSmunQ0BkxpIyYdNVUVgpZYB2oeq2myWJXvQQ3MKM+hx390sXoBHDJhRQId8ouj3w
         M1FPmU9SQ4XmtGfDodFEMPBYm8OWFckBBIA1Y1erQKqSIBLargQv/Ayx+qKenq+DEtZI
         IxnjtGuH7NZCm4RS/VjkWmU0G/HdeRm8uYKFvdX9l+lmz9LKhZGSbyh4O/Enoj2xOwwa
         fuzg==
X-Gm-Message-State: AOAM532C6WDwBuKCXTn+hoiuZ+BlkF4Q0PUGXTGCN16ulx7PYJ1GzV/2
	QwoGaPLTW4JqDnZjbPs5Mj5jw0ZNrEhhsAcRzEc=
X-Google-Smtp-Source: ABdhPJyk7vUD/oWWY9RBWCKb7tQ4GcdsFRNK+oeWU9f9TwAXmWlkdBfvMvg0BM5zlOD7ii0tQoyKdw0cwbWHS1jaMuA=
X-Received: by 2002:a2e:7c19:0:b0:247:e9a7:5b76 with SMTP id
 x25-20020a2e7c19000000b00247e9a75b76mr2435683ljc.135.1646670127721; Mon, 07
 Mar 2022 08:22:07 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it> <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger> <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger> <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger> <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger> <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com> <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
 <04e4ecfb-0235-db0d-d5fd-3274879003fa@citrix.com> <9b38e9b4-b2e9-b790-397c-38d7b62443d4@santannapisa.it>
 <CAKf6xpt7ygY_+zAHR6pHSRdtbgyjnSpB2Phz8qNCrdptU9H=Cg@mail.gmail.com> <f3ea9089-92db-d868-c7b5-6fb76124623f@santannapisa.it>
In-Reply-To: <f3ea9089-92db-d868-c7b5-6fb76124623f@santannapisa.it>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Mar 2022 11:21:56 -0500
Message-ID: <CAKf6xpt0TJegOQrBh17aAGTA-7pQcPxLYmR5BAj+RQrNXm8oOw@mail.gmail.com>
Subject: Re: Network driver domain broken
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 7, 2022 at 11:10 AM Andrea Stevanato
<andrea.stevanato@santannapisa.it> wrote:
>
> On 3/7/2022 5:07 PM, Jason Andryuk wrote:
> > On Mon, Mar 7, 2022 at 10:00 AM Andrea Stevanato
> > <andrea.stevanato@santannapisa.it> wrote:
> >> (XEN) XSM Framework v1.0.0 initialized
> >> (XEN) Initialising XSM SILO mode
> >
> > Yes, SILO mode is running.
> >
> >> # cat /boot/xen-4.14.3-pre.config | grep XSM
> >> CONFIG_XSM=y
> >> CONFIG_XSM_FLASK=y
> >> CONFIG_XSM_FLASK_AVC_STATS=y
> >> # CONFIG_XSM_FLASK_POLICY is not set
> >> CONFIG_XSM_SILO=y
> >> # CONFIG_XSM_DUMMY_DEFAULT is not set
> >> # CONFIG_XSM_FLASK_DEFAULT is not set
> >> CONFIG_XSM_SILO_DEFAULT=y
> >>
> >> This is the default configuration shipped with petalinux. From the
> >> help menuconfig, it seems that this XSM SILO deny communication
> >> between unprivileged VMs.
> >
> > You could try adding xsm=dummy to your hypervisor command line to turn
> > off SILO and allow the guests to communicate.
>
> I changed it to FLASK adding flask=late to hypervisor the command line.
> Which one should I choose? SILO + xsm=dummy or FLASK + flask=late/disabled?
> What are the differences?

xsm=dummy is the "default" policy.  Basically, it's allowing dom0 to
make privileged hypercalls and guests to make non-privileged
hypercalls.

flask without a policy may be allowing everything, which means guests
can make privileged hypercalls.  flask with a policy lets you define
what is or isn't allowed.

xsm=dummy is probably better for you than flask without a policy
(assuming it works :).

Regards,
Jason

