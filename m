Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B87600AB4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424261.671557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMQp-0000CG-UQ; Mon, 17 Oct 2022 09:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424261.671557; Mon, 17 Oct 2022 09:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMQp-00009t-Ra; Mon, 17 Oct 2022 09:29:11 +0000
Received: by outflank-mailman (input) for mailman id 424261;
 Mon, 17 Oct 2022 09:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEel=2S=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1okMQo-00009i-Nq
 for xen-devel@lists.xen.org; Mon, 17 Oct 2022 09:29:10 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26edc1b1-4dfe-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:29:09 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso10438109pjk.1
 for <xen-devel@lists.xen.org>; Mon, 17 Oct 2022 02:29:09 -0700 (PDT)
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
X-Inumbo-ID: 26edc1b1-4dfe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxEGpiSzBHt9BqiFkOcZ5zlKXWHEoNLLevXAafowxWo=;
        b=Kpc5sZNJnO9CwwdgqFNc7oKQBcYHT9ae/Bjl1u46ikkM4MH4bF6j+GshmNjQCXZlPy
         IHaucVX/62ciBC9Ja6LunhhQduPYLU2u38vKKC5TaTKM2DnSNsQexWuDAykvzQIrKqqh
         olSpA8JEHTEhhrusl/LGt97MVy7cLSRhupU5rqK5i64xr2W8QYg2r4hn0qEQ9wR1ERwk
         2rXsUIqMaLkTNET7BYATlpSg4j5BfIsmAh8b051UGrc6hjdmKejnru59MS1gmLLAKMyi
         rZu9xIIu0uAEKwlZHkNMH67W6AZ0584s6w2X/waNFfXRF9i4pgg642PQJklBtfmp3k18
         oklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxEGpiSzBHt9BqiFkOcZ5zlKXWHEoNLLevXAafowxWo=;
        b=6El07fQ0GYSlTgZn8c5ko/lS98o/g4fOXnBD5TBD7DhVwL2VDJIjSl9g+HUrjkhO3R
         oeNVrHqIIilb0d8ksUzlkUIFDL3e17dATflU2m/5tDJ+hBqdw9qkv+v4feHKx2DNIBnU
         r3HmH9otToGBix3/3fYZZ5RmxEooMqXW1FXUo7TC39XgaZU+HDbgc/aw+UBz7+Uc7df/
         l47d1CmAq/PuJxpty1YJN8X83oXL/eRWXI6vNxY7BtPriw1OJMzVGyOrON05vQlGXSKV
         hei2mJ9DACXvQd2RaTfRXM1SaGbU3cmir1011FQJPL+zVppQmc6oPH7YcYlFc0Z8gkOu
         XMow==
X-Gm-Message-State: ACrzQf0FHMsWVlqb5eGII0dARJ/XBNdvNyImJt6PqEGDWPkI6wED/DU3
	ujEKl4EQx167bgAP+ZFuJP26aJw//ugCfre5t3MGDA==
X-Google-Smtp-Source: AMsMyM51AOB0WrRXL+jvrgmy+L/8DCtcmAXW0tHJVZjJrm/ib0nHzR9TOPXF/xVX0dvyivuGdBaWmZ91P+MwGAXuG9s=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr31450109pjb.221.1665998948362; Mon, 17
 Oct 2022 02:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
 <1b3d21a2-9029-6f3a-0579-e08682814222@suse.com>
In-Reply-To: <1b3d21a2-9029-6f3a-0579-e08682814222@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 10:28:56 +0100
Message-ID: <CAFEAcA-PqE4p9vJo3TWmfBdYkGiYfCnxNDJhCAWCM2Y0txGTLA@mail.gmail.com>
Subject: Re: [BUG] Xen build error - undefined reference to bpf_program__set_socket_filter
To: Jan Beulich <jbeulich@suse.com>
Cc: Arthur Borsboom <arthurborsboom@gmail.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Oct 2022 at 10:02, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.10.2022 10:12, Arthur Borsboom wrote:
> > Xen 4.16.1, 4.16.2 and 4.17.0-rc1 don't build anymore in Arch Linux.
> > I believe it is caused by the missing function
> > bpf_program__set_socket_filter provided by libbpf.
>
> That is, qemu doesn't build. That's something to be taken care of there,
> not in Xen, I think.

This should be fixed in QEMU by commit a495eba03c31c96 (May 2022).
Are you using an older QEMU version? If so, then either move forward
or else cherry-pick the fix.

thanks
-- PMM

