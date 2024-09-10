Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5E973F2B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795924.1205403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4ZX-0003ij-VK; Tue, 10 Sep 2024 17:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795924.1205403; Tue, 10 Sep 2024 17:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4ZX-0003fx-RS; Tue, 10 Sep 2024 17:22:35 +0000
Received: by outflank-mailman (input) for mailman id 795924;
 Tue, 10 Sep 2024 17:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=it18=QI=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1so4ZW-0003fr-RS
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:22:34 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e017f0-6f99-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 19:22:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1725988948937667.618672498255;
 Tue, 10 Sep 2024 10:22:28 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e1a9463037cso950023276.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 10:22:28 -0700 (PDT)
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
X-Inumbo-ID: 42e017f0-6f99-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725988950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XxBcy3QhDG8fN81lqJHtYv89wmwBz49qxK2lC8itLDaH6krobQTViJfgP+bONVQAwvvXBkjYqO9NalMz/2d0FEkUiaBdzhNjSSr6jeMyzvTNkTTbTpMsnaUkU9k7wwu/7QSlX7HPqpo4pmSBhQiVOjuLW2MIam9bqQcWu4BrUzM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725988950; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jlHE7YednL4hbzSvbQIcLfF6pIs6MzU887/4NW7gZf8=; 
	b=CzCgcRwdC8ZvjrD1MyeHCl6CJ+bMcuiUPa4dsVA87Bk9Htsw79fdnjUZLf4riUDzK8jj3ZBmVYHuN0RcmoDA8eJmXF3nvMAc9MQzDkZCu9jssvr+ph//Ew0v5hACy13jUHWPM/vSvGzgcMiiqFyJsx/Qv3+/34iV1hPnFyvJAp8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725988950;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jlHE7YednL4hbzSvbQIcLfF6pIs6MzU887/4NW7gZf8=;
	b=W/GOXChAYCFLgwDdr2UbOT/iDeQ8TeVyaY8TvipNh2yUDNcR8CNbYukPOXEoqlNY
	SLT+RgFSn7aXJOKf9RXl1tsmYxgavM1guv3CX9auYexVYkz6ZMu7+UHyNE/NZwqtbq7
	xwMbSkHgfxfkATTuqFd6HqMO/ka0rNwfOvgKi09U=
X-Gm-Message-State: AOJu0Yx6zQ+zEB8XxkdIs9w7Fr7TwDpJnPxs+fJFr80zQfTtfqyKqcAw
	2vM6pY5bmqyNMiFj9HpCAk1+V3PyPXNxftXpGci3CbIL22yu26Ba1Y9umJ5z9BCtkK+9lLs+3XB
	Fdo2B2n1WBuYq8htVRefSvG7RVKQ=
X-Google-Smtp-Source: AGHT+IGBe4GCnuUl0+A9AeaiiZ7bUMAvhiLpiWIftWtzUtqSVBSQ4ydINqpffIxaZekWcHKgzN1oD5TlGH1avq0nU6M=
X-Received: by 2002:a05:6902:726:b0:e05:7c38:1085 with SMTP id
 3f1490d57ef6-e1d8c52562amr217247276.41.1725988947971; Tue, 10 Sep 2024
 10:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725958416.git.federico.serafini@bugseng.com> <c71edd14ccff27aa682476a858d39410d9907f77.1725958416.git.federico.serafini@bugseng.com>
In-Reply-To: <c71edd14ccff27aa682476a858d39410d9907f77.1725958416.git.federico.serafini@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 10 Sep 2024 13:21:51 -0400
X-Gmail-Original-Message-ID: <CABfawhn0DkptwrguNjnNqZ9ux-9TRpe8181jn8UxZU0gN-9b4w@mail.gmail.com>
Message-ID: <CABfawhn0DkptwrguNjnNqZ9ux-9TRpe8181jn8UxZU0gN-9b4w@mail.gmail.com>
Subject: Re: [XEN PATCH 05/12] x86/monitor: address violation of MISRA C Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 6:09=E2=80=AFAM Federico Serafini
<federico.serafini@bugseng.com> wrote:
>
> Address a violation of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

