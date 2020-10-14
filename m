Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F528E46E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6861.18029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjdB-0005EK-Kp; Wed, 14 Oct 2020 16:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6861.18029; Wed, 14 Oct 2020 16:28:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjdB-0005Dq-GI; Wed, 14 Oct 2020 16:28:01 +0000
Received: by outflank-mailman (input) for mailman id 6861;
 Wed, 14 Oct 2020 16:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSjd9-0005AU-Vt
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:28:00 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e75df86a-1cd3-4001-9df5-80a838c4cadd;
 Wed, 14 Oct 2020 16:27:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so96145lfp.10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 09:27:58 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSjd9-0005AU-Vt
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:28:00 +0000
X-Inumbo-ID: e75df86a-1cd3-4001-9df5-80a838c4cadd
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e75df86a-1cd3-4001-9df5-80a838c4cadd;
	Wed, 14 Oct 2020 16:27:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so96145lfp.10
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1r3Mi3nzZHo+KHq/rD+GI+FDOuQPdwRMPGa7RKX0szg=;
        b=EMya3lOZYJJ8Z8JieBre1xEOpk9Xq6EVYzPCMrt5dDZlfFQI4SNNiy0AM46dMhz6WY
         d2trOsQIOrGsRGrIn0QM1ng06w+YKChSQqi7Pf7fGUsRWVl0TVpJ4sAhZ+Dz/ySF5rZ6
         AA5FhZdStDEWaAiSnzTKbliU8wjKY5Giab1goepJKMRtYCqZfCDhPQjuMCMb5xzL3j7S
         +S7vzhc9set2TDaR7KNuN9F7cFa6SDnYKvZzj89Uht41Xxwpxklf5eBDbGnMSRbQdM/Y
         x9X79dMTCbaiYVUcv3fsBoCRHdw6HpDsb4K1jtw77GKgBHoOiDRv+cLYcLcSp29LFcMq
         n3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1r3Mi3nzZHo+KHq/rD+GI+FDOuQPdwRMPGa7RKX0szg=;
        b=LMtA0cY8EZ7kCdWQF/oivav+nJdIa0ZOPcykYijOf7OxwKDcTixp72A3njf7Vc4Dyw
         ioYsr9sBFMc/uBcuVNAz9JmhosXgIBF6v2q1aiRTUt3ZBoOsG8baJ6g4EyT7Jy1+doem
         HviZEhxDz8rCod3g8v2zYAVOSGao7PqiGjnvaYUWuLt7c+fRAVQywudflS8MJiVwmK5W
         1LlyfMaGex5aW7pFLyX4bU7NYxB2aegl4QThWA5As+LzGWcj6XIcDNVsMJGHOWZ1LnWI
         gLbo/PtBCErQaqYyYs3qxK/gHoHsN87J4iST5CKLOq97RQu+mzdYlUhZMlMc9sVxvTgC
         lhPA==
X-Gm-Message-State: AOAM533009JLlA+mE93FlGELIcQh6Xo6UZh50xfhcD9mgDtsdzCuy48a
	G5T1tU+lImiGEX43Ilw4CKYdpRWyaUPawCOC+/Y=
X-Google-Smtp-Source: ABdhPJz6K2y3twdlgXriMYPczuRxnV6v1ICjDrBpOzy/uppp50Mj+JCsAH+sJMnYN1qCFfUMAn+5uT6ZR5rcuU4r/SY=
X-Received: by 2002:a19:7f4a:: with SMTP id a71mr58788lfd.202.1602692877110;
 Wed, 14 Oct 2020 09:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201014153150.83875-1-jandryuk@gmail.com> <77e8bf3b-6172-2900-dd5e-9d059a410b0e@suse.com>
In-Reply-To: <77e8bf3b-6172-2900-dd5e-9d059a410b0e@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Oct 2020 12:27:45 -0400
Message-ID: <CAKf6xptqRKJ87KiJ52MpYR50RNgDEqqA5RsqXphQ1NUeVZgb=Q@mail.gmail.com>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 12:12 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 14.10.20 17:31, Jason Andryuk wrote:
> > Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
>
> This wrong. Have a look into arch/x86/platform/pvh/head.S

That is XEN_ELFNOTE_PHYS32_ENTRY, which is different from
XEN_ELFNOTE_ENTRY in arch/x86/xen/xen-head.S:
#ifdef CONFIG_XEN_PV
        ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
#endif

Regards,
Jason

