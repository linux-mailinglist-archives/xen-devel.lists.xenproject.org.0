Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3A2CB2A0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 03:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42401.76237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkHXs-00031S-J0; Wed, 02 Dec 2020 02:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42401.76237; Wed, 02 Dec 2020 02:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkHXs-000313-Fe; Wed, 02 Dec 2020 02:07:04 +0000
Received: by outflank-mailman (input) for mailman id 42401;
 Wed, 02 Dec 2020 02:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mC+d=FG=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kkHXq-00030y-Vq
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 02:07:03 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e9618d-3d7a-4847-8294-5baae0f26b8b;
 Wed, 02 Dec 2020 02:07:01 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id i199so3448992qke.5
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 18:07:01 -0800 (PST)
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
X-Inumbo-ID: 70e9618d-3d7a-4847-8294-5baae0f26b8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJry5lY9fqlB7gymDPuJQp1TTD65xULilrywO6EkZec=;
        b=Ts3QTO4qF5p87V8b7b+pCtltXZl8F8MKXn5KgaO+jLE17XGCClMD2Gvnm23hhPx0yr
         S3/9m0sGipP/O/+5/3T7lmZVtipiLkOkrcP+BBy3ingZ+v3timNaTk5b6u7S0B1zGzLs
         oMenFUvXVLmIiG7484baP7UOh7MMAivhcmtrbu41Hi1j/h7pf2V8gt1u+dst/QK0TT/6
         Omcr4MP+b173uHv95SurDgmpjf9+J2azNXTYIBf6EGmp1X5aiMfAJqzMIh2JgbilTIQD
         dWMKgnDNLyuuW0cpjtSlfVsY2MKJAteSJZkhMJk/Y4jswiBFE7cZzOPi4H4/7R2AcSpU
         dm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJry5lY9fqlB7gymDPuJQp1TTD65xULilrywO6EkZec=;
        b=ftfZo3lmSrUjocKPkzuKLkNhKprb42pn4dSwQ4RTsg1zZIDK2Zzu+qLi/Ks6zQli0t
         psLxg5qmqHFBS4lNQfZ8rNMDo5VBmzMhKa5k/4wY/DO745decKCvqHtGlFmUX5Ljg2r/
         lObVkIy+d7fS8JMApjfTJSyUZYDqSFDnM5HaD581y99Kdhx33WpHA764uOJcfmCCj4bC
         1OoJLyLd5bnXoTyd1f+CUSWoIx7Tzbv7c3mrl5MpQ285tVylNczPf2pvoZj9oODKCq17
         ydtA0etJ5w9Z1ovr/fXS80vCw3KD2FaTx26wPo9oCaju+6CYNGd6qXAL/w78wES9vva1
         LglQ==
X-Gm-Message-State: AOAM533wZ1hDIDr0RElrzvcgNXDjg2v4CSYlqO/7jU4xuwH7w4V3ELj5
	m9Q5PyuqFyxaoIk7mqDswhoxTJHPnrTw9KgWbgrKtg==
X-Google-Smtp-Source: ABdhPJzd95etu8V3mPeMRcwjrH6RdlvEzShvzjKtsmqpFS1prrNQ+8CyuOFz7bq/tHdqJ/zGpmmBFDVvnOLNhKfbhhk=
X-Received: by 2002:a37:6546:: with SMTP id z67mr486261qkb.22.1606874820941;
 Tue, 01 Dec 2020 18:07:00 -0800 (PST)
MIME-Version: 1.0
References: <1326147626.1969889.1606825358993.ref@mail.yahoo.com> <1326147626.1969889.1606825358993@mail.yahoo.com>
In-Reply-To: <1326147626.1969889.1606825358993@mail.yahoo.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 1 Dec 2020 18:06:50 -0800
Message-ID: <CAMmSBy_3wgU=DHsAxG0EK-WKAf71PEsXvu=1hbjoJ_cyy=gcDw@mail.gmail.com>
Subject: Re: Apple on Xen?
To: Jason Long <hack3rcon@yahoo.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 4:22 AM Jason Long <hack3rcon@yahoo.com> wrote:
>
> Hello,
> According to this news (https://aws.amazon.com/blogs/aws/new-use-mac-instances-to-build-test-macos-ios-ipados-tvos-and-watchos-apps/), Amazon EC2 can run macOS.
> Is it OK for Xen Project too?

Amazon recently clarified that these are bare-metal instances -- no
hypervisor of any kind involved.

Thanks,
Roman.

