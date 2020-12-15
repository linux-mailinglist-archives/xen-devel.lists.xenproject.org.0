Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C092DB22D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 18:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54713.95226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDlt-0004R7-3P; Tue, 15 Dec 2020 17:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54713.95226; Tue, 15 Dec 2020 17:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDlt-0004Qi-0K; Tue, 15 Dec 2020 17:05:57 +0000
Received: by outflank-mailman (input) for mailman id 54713;
 Tue, 15 Dec 2020 17:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p51=FT=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kpDlr-0004Qd-Ol
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 17:05:55 +0000
Received: from MTA-08-4.privateemail.com (unknown [198.54.122.58])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06bd5574-c4e5-4f42-9cb1-aab31d8c4919;
 Tue, 15 Dec 2020 17:05:54 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 8CC20600A7
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 12:05:53 -0500 (EST)
Received: from mail-wm1-f45.google.com (unknown [10.20.151.235])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 55951600A4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 17:05:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c133so5528204wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 09:05:53 -0800 (PST)
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
X-Inumbo-ID: 06bd5574-c4e5-4f42-9cb1-aab31d8c4919
X-Gm-Message-State: AOAM531fpD8zpdqXIs8FbWErLkIArskG7S0QHYjTxTaPuY1JuvzTnXEB
	MYx/SImq8GiSH823HaidTM20tiK+QMcuoCz7CrA=
X-Google-Smtp-Source: ABdhPJyhuozME1HLdtqWtG3JumBjmF74EPKVkLRP8xE8YvzICkdvMIeDsCReYkTjNo5dUEt6gKAwQ+89+dDqV+KIbwk=
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr34168015wmh.51.1608051951892;
 Tue, 15 Dec 2020 09:05:51 -0800 (PST)
MIME-Version: 1.0
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com> <a9c24d20-0feb-42c8-ae2c-5cfd564157ee@suse.com>
In-Reply-To: <a9c24d20-0feb-42c8-ae2c-5cfd564157ee@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 15 Dec 2020 12:05:15 -0500
X-Gmail-Original-Message-ID: <CABfawh==44+wb0wt_NSmR_eJGfn_17BTNYLJxKvctwrhx4Hyvg@mail.gmail.com>
Message-ID: <CABfawh==44+wb0wt_NSmR_eJGfn_17BTNYLJxKvctwrhx4Hyvg@mail.gmail.com>
Subject: Re: [PATCH 6/6] x86/p2m: set_shared_p2m_entry() is MEM_SHARING-only
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Dec 15, 2020 at 11:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

