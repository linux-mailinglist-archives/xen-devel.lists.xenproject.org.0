Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33728752818
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 18:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563316.880485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyux-00078k-1g; Thu, 13 Jul 2023 16:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563316.880485; Thu, 13 Jul 2023 16:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyuw-000769-UW; Thu, 13 Jul 2023 16:11:46 +0000
Received: by outflank-mailman (input) for mailman id 563316;
 Thu, 13 Jul 2023 16:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eidt=C7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qJyuu-000763-R1
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 16:11:44 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f560c542-2197-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 18:11:43 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso1600986e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 09:11:43 -0700 (PDT)
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
X-Inumbo-ID: f560c542-2197-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689264703; x=1691856703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXyvRpUMWg4EI9ylPggQuxrJTaRonG7XdSB3edApzp4=;
        b=Qlv9PZFijkC/kT09RvKheT4rzhOZHzKdSJxitZqDlLxZrj+9OZgYVq37+PJQ8fPRtk
         +6QOatiaogdQ22w+U5Wq69Thxa6IXCsmL4nBpGlDEdTLx9dHoP3XjEsyX6MKsBTwBet6
         G60vqwlQpS4NxBImbyWpGxwBjqB/r//g+yIIVu8HYgt0aLel3G/BSs18Pionsq3pvRA1
         7LBynklb7SKFfvkGelJuR+SsDZZZw6XY2kO1s9U73vGdACDLsCpus7rqGCe9jL/Zy7bL
         TuPEirz4RiNbb0WxGobSEdEl4S2je4xT5Pxds+mahXz9SatdKcA0AUzXSnTKKkjzqDkF
         GmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689264703; x=1691856703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXyvRpUMWg4EI9ylPggQuxrJTaRonG7XdSB3edApzp4=;
        b=Lb9d1OpoussYgue0XL+V8/ediVBK2q3mTG4wR1Bp693Etv5nl8aRe8reFIw0d1lp+W
         uHTXjd0vK5tjkATCQTOpzLkOREs8kpBXVRI9U+eUjeNUmmpNapLKnFNMVURfK3r550Y8
         eHPLyz3K5Dush0Oliea0Fsh9Qvzu+oNPKVpo0Onk+nal1LDWCHKtshzvFNiD3UPhQ0iu
         heryrpV+sOvG0rXLPY2skISuDXjV0v/IclWkydjXLAE0NICLHsaQIfFEUvWIhBKqoFn8
         BI1T5fW4olRDEYRpze2LqNQWJp1mN8MGO59eVJ/iaYoK4tq6jLFMY/8S2TUoS9Yzcih8
         w6Lg==
X-Gm-Message-State: ABy/qLZtfbCmcpERNso9ubFJee1duDgl5S7hrhlNyNqWHQrW07HrfUAh
	ozw9iz8eOnuALyjcmai8qC2pkx1QImzWi989dXE=
X-Google-Smtp-Source: APBJJlEQnjMO9FK8lr/Fr1WodDzuvU4oogfIbXoJpnKfzfDz2FDo447f0ZkSkrTv4AuLve3WZHUxLh2U+9Y9mEXyGO4=
X-Received: by 2002:ac2:5f0b:0:b0:4f9:5f62:830c with SMTP id
 11-20020ac25f0b000000b004f95f62830cmr1468027lfq.7.1689264702821; Thu, 13 Jul
 2023 09:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-10-jandryuk@gmail.com>
 <9e16348c-4b43-0ed3-fa53-b7bb69538437@suse.com>
In-Reply-To: <9e16348c-4b43-0ed3-fa53-b7bb69538437@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 13 Jul 2023 12:11:30 -0400
Message-ID: <CAKf6xpvkMV91mPL0B0bBuSHpYYjVFxFAz9kyZhDs7Q+L2pnGYw@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] cpufreq: Export HWP parameters to userspace as CPPC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 8:37=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> With the adjustments (provided you agree)
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yes, they all sound good.  Thank you.

-Jason

