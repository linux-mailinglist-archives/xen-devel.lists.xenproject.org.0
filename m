Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A580CB0F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651826.1017707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgN1-0006yx-Fe; Mon, 11 Dec 2023 13:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651826.1017707; Mon, 11 Dec 2023 13:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgN1-0006xM-D7; Mon, 11 Dec 2023 13:30:51 +0000
Received: by outflank-mailman (input) for mailman id 651826;
 Mon, 11 Dec 2023 13:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DlHr=HW=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rCgMz-0006vx-T2
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:30:49 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee92440-9829-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 14:30:48 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9fe0b5b28so56788421fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:30:48 -0800 (PST)
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
X-Inumbo-ID: 7ee92440-9829-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702301448; x=1702906248; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sv073sw38M5XUHhg2bmfvZnIS/XjUxvjVoDIpH000Q=;
        b=BTay1ffaCBgseyWsZm8NMGeOGuOM80UMs9Xhb5CZCnKESXiWlKMnUkkCFIpH8fjn0l
         ax25biMJ6CnWxdCFxSYhzcsrPyPRc+kT3fLRRd+WmZ+K/td5HV4blSXPnUs8dL0qEnVk
         N7ruuNLWxOgeFNl4Dss9MdnyooPUZw7GOwx+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301448; x=1702906248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sv073sw38M5XUHhg2bmfvZnIS/XjUxvjVoDIpH000Q=;
        b=C/QKjNmY/ei0BVQ+25w6RmxwRXMFqsD6OJBZfVsNAHRTLwRozpGNhzQU9sEwnZ6cmj
         1XNfMJ5YD26sHIu/1tanBSl180iPpa35wUEB7kFunqj33e9KlQL2y49K6na+NRjlXJDQ
         gjNpKPjvcEVDDCAntDPkQXR0gt2+PllsiGnvuB4DM6HzIGRiolw/CN4uvPk94533u8/e
         6qvElQW8Pln34ckO4nKniv23BGhDDod4rukzyyJ7iZOZ09Iq3JjN1XVz3HazpYMUhQnm
         Lgby3gUnibC465ZnXTTrYwlmnInEY8uK9aGgGa2lHLbz4FT6WYCb9lEVf1sbImgPk5X5
         fLOg==
X-Gm-Message-State: AOJu0YwlVW7tFDnydPWKauUQ5PpzOhBEpqKQF/6V10em+1KymxI9rLBv
	agZWqHDCNJihGFBWcHwml3lUXhPQ4kg//vdC1q+GspidgH7R77al
X-Google-Smtp-Source: AGHT+IFJciHzkyEMyb4MC/mfDQV18qU/hB47qYbwRTPjfJyRafJuKDCfPKt05hqq/SuBEmP0t3p49qw2eXP04Lj4W6M=
X-Received: by 2002:a2e:2a01:0:b0:2cc:201f:28a2 with SMTP id
 q1-20020a2e2a01000000b002cc201f28a2mr1011972ljq.49.1702301448266; Mon, 11 Dec
 2023 05:30:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <4006f1eb1977a89a57c5c02f003a2fefc06dfc42.1702283415.git.nicola.vetrini@bugseng.com>
In-Reply-To: <4006f1eb1977a89a57c5c02f003a2fefc06dfc42.1702283415.git.nicola.vetrini@bugseng.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 11 Dec 2023 13:30:37 +0000
Message-ID: <CA+zSX=aZYt_Kzim6XFsPku1UVK+0QGafVdfeJqT7HZpVkz7JCg@mail.gmail.com>
Subject: Re: [XEN PATCH 4/7] xen/sched: address MISRA C:2012 Rule 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:30=E2=80=AFAM Nicola Vetrini
<nicola.vetrini@bugseng.com> wrote:
>
> The break statement after the return statement is definitely unreachable
> and can be removed with no functional change.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

