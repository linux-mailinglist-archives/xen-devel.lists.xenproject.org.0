Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE837E49ED
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629016.981050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Sml-0006hw-Uq; Tue, 07 Nov 2023 20:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629016.981050; Tue, 07 Nov 2023 20:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Sml-0006gH-RQ; Tue, 07 Nov 2023 20:34:55 +0000
Received: by outflank-mailman (input) for mailman id 629016;
 Tue, 07 Nov 2023 20:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Smj-0006em-W0
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:34:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a542d98-7dad-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 21:34:52 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so10251254a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:34:52 -0800 (PST)
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
X-Inumbo-ID: 1a542d98-7dad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699389291; x=1699994091; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgYlcKWdjIVZaMq0/A61/NIOM+zvlgxzxNYQI9cAnpc=;
        b=ICy919mfQpMYN4NEMxwzsJA61Drg5BBxav+h5BbiC7moSiK0ZKI+F99yCkZBYUm2gB
         fvrrEiTjnPywglqMnWLS1tK9/tPXg9rMg/GWbiGj+lIp2KicpFMlEFLiIzt+vPlY4CkJ
         d2OFuK8c8mzmD8y8OXWY0vktGPDtgJhmC30Hf5fp68ARSHChUmQU6kZKeeDta6sfs3nb
         v2062w69ux3QnRlhhY2q+E4y7aWktH4hCxmx60FQvmNfNFv8WmSi7Yy+NkayHOBPkmeD
         92T3NhQ0Aajb871pEjmCCQhC9mWMHGdP/zrthwsaUcEDmvlyP0jbUqTT3TI9ptQljEtx
         CHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389291; x=1699994091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgYlcKWdjIVZaMq0/A61/NIOM+zvlgxzxNYQI9cAnpc=;
        b=igWinkFoe4uaXEM1XEJ/Btr8TRfG5wylWAADvG8Exj3AgaHuz4TDCkYj/ClTPxgQxq
         +CBq6Wh8MUqYn6rthPmfwuVZyaYdKYTDZI3SV3pzcDSRzlXNBmuYUgiDG2n54aIkL0AU
         Qd5avPff/eBR18K++Q5voe50D2qo6Dggeme/PnAjDCFxa2Z2IS/FzhdavgcxvkfESsh4
         F1GiKJm2c8iUk+TpFV98TT3uAgp+Dajn21wNWcyorfJSq1QaeGsZRTv96gIswxJMpnwS
         MTry3Glv8uXRrG0EzXl2F9zixasuxNlHpf/PFazwk9u4cI4HYK/DhWfwYkZzXQert+nF
         iTDg==
X-Gm-Message-State: AOJu0YzB7sDRH5hDg9fLJEYw41s4h53OTTvO1GRYYhV1GKmmz7D/+kyB
	DZcHxqUyBE9647Rsk0Xo6l0Luw9fnUBuYsmR3I8=
X-Google-Smtp-Source: AGHT+IE8qvO9Fm8u+q0e0go6U7YriP1T2GfRJr3665yj69+rMThF2TyJLGqQBPVwc3sXb9zAp7BGpIF+aaDgz09vP7A=
X-Received: by 2002:a17:907:2682:b0:9e0:5dab:a0ed with SMTP id
 bn2-20020a170907268200b009e05daba0edmr6212960ejc.58.1699389291479; Tue, 07
 Nov 2023 12:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-28-jgross@suse.com>
In-Reply-To: <20231101093325.30302-28-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 15:34:39 -0500
Message-ID: <CAKf6xpvQ+hAs=o3Pj-W5KwV9ry_cs3XioyEfTUKrSy5UXyWb_A@mail.gmail.com>
Subject: Re: [PATCH 27/29] tools/xenstored: add daemon_init() function
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:50=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Some xenstored initialization needs to be done in the daemon case only,
> so split it out into a new daemon_init() function being a stub in the
> stubdom case.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

