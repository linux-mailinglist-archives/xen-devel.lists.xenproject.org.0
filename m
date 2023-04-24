Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2C6ED578
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 21:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525593.816860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr27C-0004Mj-87; Mon, 24 Apr 2023 19:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525593.816860; Mon, 24 Apr 2023 19:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr27C-0004Kz-5E; Mon, 24 Apr 2023 19:44:46 +0000
Received: by outflank-mailman (input) for mailman id 525593;
 Mon, 24 Apr 2023 19:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAuZ=AP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pr27A-0004Kt-3j
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 19:44:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74c87829-e2d8-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 21:44:42 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-508418b6d59so8904564a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 12:44:42 -0700 (PDT)
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
X-Inumbo-ID: 74c87829-e2d8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682365481; x=1684957481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqH4nzjLv7bSAZ/EuLYdgg//7mPmqDhtT9z9RXX9OSo=;
        b=bSHHFH2JMdilNt7rvuiUY0AqTmD6WAWbvslRQept8CXOJgOIN5nyVsRbQp2YL3KXCk
         2yC5zhg5SCdkS+DNEQTfhbG59DIeNMw6KCEefPF9vmPb8F0rh1CPDSIeBhyr/8a4jTPG
         h029j+uGOtp8aPB25dCwvh3msxBP3zu1MOlhoc6Ik9BS7ng2jLuZ1GmY+c9efwNNC7gM
         raQgP5NhPdnujeuVPr+YNe2iDpViutSaQ5raZVd48cdThYAH+t7Bo0npPmpHjnhhU7XM
         Y6/RngI0qTZd5g/HptSX4U9qLXgoRAhC9rTfBRj1WvstRcxGAdghZ/k4230mJ9+JNUVz
         tQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682365481; x=1684957481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqH4nzjLv7bSAZ/EuLYdgg//7mPmqDhtT9z9RXX9OSo=;
        b=Nu6hdpwLjvfXGNMy3nAqvX71Fgq/BpZ9Ovnfzv+2KWfQEKQmgiI/f4naAVCBJ1bnZ+
         d060/gkc2rzPrJiN9CJWAdxryeIRTbLeuQlYaGtjL87kuxDgEB3zCoUfWYNVNQiYky/b
         npvAELl0/w9yoB8hvfDjTp6uwqpmQz033OQ6pPwgV2mvAobIfV2AckVIxYAxTm93Cmpf
         yCuJFzSxeZ9pxOcafEhLRRfmnh4j/u25EuT0gl0lTpprgAHkWdisaeixqVH77V7M9EuL
         KlwJfTKjXcoQIFqnTGeKB8a5+5jG2ZW69LahpZNkjxXKbX8RwYoxsgpdN5Zp36r9aguR
         7hbw==
X-Gm-Message-State: AAQBX9ewwrurc6hgmB5iPkmJmw35zo66SVIfEyLa7C0z+RpyeO2Cd4d0
	hQEE5Hr5gmULU36MsiZuU16id25eMV1lJT80B8k=
X-Google-Smtp-Source: AKy350ZkoQHmlw44xB4ini7JXYTQSi22u189iUollFTqDEL4T65VRULY6zIR8+kFNykj4/YFg9uRJ9cpdsbHwFV9zyk=
X-Received: by 2002:aa7:d858:0:b0:4fe:97a2:4b86 with SMTP id
 f24-20020aa7d858000000b004fe97a24b86mr12663621eds.8.1682365481348; Mon, 24
 Apr 2023 12:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230419100633.13047-1-olaf@aepfle.de> <0fa11dd4-da6f-df95-bff7-dc4a80553b01@suse.com>
In-Reply-To: <0fa11dd4-da6f-df95-bff7-dc4a80553b01@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 24 Apr 2023 15:44:28 -0400
Message-ID: <CAKf6xptdnmKds35e8QH-d0c-9ktajYCsJSmGA7ZMKWkJ1cHK5Q@mail.gmail.com>
Subject: Re: [PATCH v1] tools/libs/guest: assist gcc13's realloc analyzer
To: Juergen Gross <jgross@suse.com>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 8:55=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 19.04.23 12:06, Olaf Hering wrote:
> > gcc13 fails to track the allocated memory in backup_ptes:
> >
> > xg_offline_page.c: In function 'backup_ptes':
> > xg_offline_page.c:191:13: error: pointer 'orig' may be used after 'real=
loc' [-Werror=3Duse-after-free]
> >    191 |             free(orig);
> >
> > Assist the analyzer by slightly rearranging the code:
> > In case realloc succeeds, the previous allocation is either extended
> > or released internally. In case realloc fails, the previous allocation
> > is left unchanged. Return an error in this case, the caller will
> > release the currently allocated memory in its error path.
> >
> > http://bugzilla.suse.com/show_bug.cgi?id=3D1210570
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Compile-tested-by: Jason Andryuk <jandryuk@gmail.com>

Needed to build on Fedora 38.

Thanks,
Jason

