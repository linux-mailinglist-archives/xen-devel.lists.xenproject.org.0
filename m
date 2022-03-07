Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF84D03B2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286229.485660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFtw-0006Wo-NG; Mon, 07 Mar 2022 16:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286229.485660; Mon, 07 Mar 2022 16:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFtw-0006Ux-K7; Mon, 07 Mar 2022 16:08:00 +0000
Received: by outflank-mailman (input) for mailman id 286229;
 Mon, 07 Mar 2022 16:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e/ad=TS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nRFtv-0005sw-6Q
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:07:59 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c155aec6-9e30-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:07:58 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id bn33so21162269ljb.6
 for <xen-devel@lists.xenproject.org>; Mon, 07 Mar 2022 08:07:58 -0800 (PST)
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
X-Inumbo-ID: c155aec6-9e30-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pion4CixDvZ8IvMRvvgjLSdT9j2vMW5ans9YMwXUKdw=;
        b=CCx2Pg1LBSORTbPKesDFWI4xw30qbPvZIeqkrNsGZ6h6mTXDz4R26AZlaWbqYXRr7B
         F96f1N7GekGCxrOBhVadCzWJOP6PgBW5PZzBz0wd3scT15Jyk1HrrBRNju3qU9+U7ANa
         0RlCf74lU+HXssFymhT/SBgTvTyFm/zm8touEC6XDcp9e+olMh7cGXjSbhqM9ETmH2Wp
         DSxW0F0eB2iohYUu5GhBATVm75DR2l5b1tUYpQNZkeMz19mq/45nBe5LEKnnAYYlNoY+
         pc/VoNIMqQGTTpymNpgat3aOoyoi3lATqVhauBJu84WSrIWtV4whFV7b8dS+ykbDknBm
         oq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pion4CixDvZ8IvMRvvgjLSdT9j2vMW5ans9YMwXUKdw=;
        b=FXZlUf1fG5CQOA5jRlAe1ouBXHfDlDcZIXbZZkovc37lpwF4W+D6GI92WsqE6TZxFq
         2P2yTyvgOT71sSichROfs757WMhPpApI0AkCuMHFdOEF6paXNEQEwEJKlL8t07NW7STb
         JrKEOvRp9IlBBa583S0GX7Tyh8l2225EUSBwA53cfbdD8nO96oDeEis+bSqqN7MwXgYO
         ZvUXhZT2yr7gGOw8SVkVAWz5YKbdBqPmdHr6d26Pw0pPz0j4oEcZcH+pCCFdUe473y/M
         5qO57hLVia0auGdXCZCUwW0sXvk1Y0ghN2PeswYm/S/bZX5jCHaiDhKWGyRMTqtRz6rg
         hslA==
X-Gm-Message-State: AOAM531FG3UI0ZiHdQED0qe4nNpJ+gYMjiF+ykQ6zN2BksElfNzfoAru
	PT5SUZfeJ8NWJCKQ7Xfw/8GTojlpAUXLXeVfTEE=
X-Google-Smtp-Source: ABdhPJzUPLtf/HRW6iJDJAyrYdzo/PQbnyDWNa5/wg3ayU5IQ9K4ww7ou6LjwyBWxhnEhGKtBh0apRiCrqFKmaj6Aew=
X-Received: by 2002:a2e:3c0d:0:b0:246:3c52:7ada with SMTP id
 j13-20020a2e3c0d000000b002463c527adamr8072176lja.459.1646669277675; Mon, 07
 Mar 2022 08:07:57 -0800 (PST)
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
In-Reply-To: <9b38e9b4-b2e9-b790-397c-38d7b62443d4@santannapisa.it>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Mar 2022 11:07:46 -0500
Message-ID: <CAKf6xpt7ygY_+zAHR6pHSRdtbgyjnSpB2Phz8qNCrdptU9H=Cg@mail.gmail.com>
Subject: Re: Network driver domain broken
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, 
	Anthony Perard <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 7, 2022 at 10:00 AM Andrea Stevanato
<andrea.stevanato@santannapisa.it> wrote:
> (XEN) XSM Framework v1.0.0 initialized
> (XEN) Initialising XSM SILO mode

Yes, SILO mode is running.

> # cat /boot/xen-4.14.3-pre.config | grep XSM
> CONFIG_XSM=y
> CONFIG_XSM_FLASK=y
> CONFIG_XSM_FLASK_AVC_STATS=y
> # CONFIG_XSM_FLASK_POLICY is not set
> CONFIG_XSM_SILO=y
> # CONFIG_XSM_DUMMY_DEFAULT is not set
> # CONFIG_XSM_FLASK_DEFAULT is not set
> CONFIG_XSM_SILO_DEFAULT=y
>
> This is the default configuration shipped with petalinux. From the
> help menuconfig, it seems that this XSM SILO deny communication
> between unprivileged VMs.

You could try adding xsm=dummy to your hypervisor command line to turn
off SILO and allow the guests to communicate.

Regards,
Jason

