Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B87FC54C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643466.1003724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84eB-0000zw-CV; Tue, 28 Nov 2023 20:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643466.1003724; Tue, 28 Nov 2023 20:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84eB-0000yI-90; Tue, 28 Nov 2023 20:25:31 +0000
Received: by outflank-mailman (input) for mailman id 643466;
 Tue, 28 Nov 2023 20:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r84eA-0000y7-3Y
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:25:30 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43938d6a-8e2c-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 21:25:26 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54b8a4d64b5so2869638a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 12:25:26 -0800 (PST)
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
X-Inumbo-ID: 43938d6a-8e2c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701203125; x=1701807925; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzgjAb4nVABM4cdLet+A5u4oypfd10kZH7nsP0njb+0=;
        b=Fx9vHMGbmRolnNIw97X+2s8up2K2UGDojBfXkbja35dn3G/RpaloDmryCgGGhI4rlX
         g0WtmRqkhpiqCQcKP0MGZglNTQCYMgY+w0QAQMwvB+rG2Ew4RYtd/RkfDDuJvwPGk33e
         hMo/WFRgQDBAAvuWnF+6b1t24134mEQ2xzHDnrppYZA/rXQjCs5GDgfZOqpca84ONDzh
         +qdWatboLyvNa/bK7dAlBCHrRORIJDtL1abbSJa8ONNcwHNgF12oFaJtqKoQNJQ0JN1l
         WO5QqEAAODa1c4o4w8PNk7/V62ABP5Kdm12SKcCdWHTQ8jP8KcIVgsuHRrJX1qzKhC4i
         DhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203125; x=1701807925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzgjAb4nVABM4cdLet+A5u4oypfd10kZH7nsP0njb+0=;
        b=bSs2qQpsV0GQqjA7U04fCesF7AYo1UaepYknhwpOhUI1yIAbrBbe36/1Ae443e79vq
         4WFHUFD7/fNDUXcV2/eDaB9XVMqRkyazlNsQVUwJliyZYuBiC0vQfw6KJIPGrihlzP9o
         CC1e2PoNYD3+zbl38GLR7qMXmg1URSQYvkN2Qto0533EikIWP/JA6D2w4l/8fRzTl5fj
         PsYFoZg6aYJxeWSkFaZfMj2XFZ5s93bOGKSZk3oXsyD3oTTphn9a6Cg8OWxdYIHLhqnc
         54xevwL82GHpcyogNlbZz3ELQrg3z6ZB54hYNgmAqWxSi1908EPbglhTIdwz5/RLGGxn
         6iMQ==
X-Gm-Message-State: AOJu0YzvfS5FvtO0oMM3A6DwVd7EtUZkAzqULIgpqAa4wlWZVb9SEJok
	zPlwqtwQHnQ3f1PxMMar34+NBJs8r0YD5BFprLc=
X-Google-Smtp-Source: AGHT+IGLwGXEmFMxrEvPX8hlIwdB7FP9jLlN4xV1/kyDCkuZAlDQ//WwOlZWX7wrU2nd8VxPYQ541vJUXYGMXak/a4g=
X-Received: by 2002:a05:6402:2047:b0:54a:f3df:5814 with SMTP id
 bc7-20020a056402204700b0054af3df5814mr10500317edb.25.1701203125234; Tue, 28
 Nov 2023 12:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-17-jgross@suse.com>
In-Reply-To: <20231110160804.29021-17-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 15:25:12 -0500
Message-ID: <CAKf6xpuxDYYvFAw4=40+aEc24_kD_d4=920Lb9jjRu4=6o-8eg@mail.gmail.com>
Subject: Re: [PATCH v2 16/29] tools/xl: support new 9pfs backend xen-9pfsd
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:19=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add support for the new 9pfs backend "xen-9pfsd". For this backend type
> the tag defaults to "Xen" and the host side path to
> "/var/log/xen/guests/<dom-name>".
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

