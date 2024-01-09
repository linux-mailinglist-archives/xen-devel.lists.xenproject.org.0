Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05535828D85
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664928.1035068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHuk-0001EH-TQ; Tue, 09 Jan 2024 19:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664928.1035068; Tue, 09 Jan 2024 19:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHuk-0001Ci-QG; Tue, 09 Jan 2024 19:37:30 +0000
Received: by outflank-mailman (input) for mailman id 664928;
 Tue, 09 Jan 2024 19:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNHui-0001Cc-V9
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 19:37:29 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84eac3c8-af26-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 20:37:27 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so5961729a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 11:37:27 -0800 (PST)
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
X-Inumbo-ID: 84eac3c8-af26-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704829046; x=1705433846; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JufRb3v6Ocno2vQc4pm6Nu7BjmQD9aFQ6+XHPNGl1pQ=;
        b=iSKHCFC2isawnTWKip0KfCh6bpqX78b++GjSQO+TlqTiQrtMBLQjNGZgrnXbWazpA4
         mD+1xpuUokOZfE2YHkAYH0zueMpADLOnKCWWpaLBmvkPgy584VGMP0h5C+ZegU/DNhxq
         uXEza+hSYULwSvCHDtAqpfSUcXbVmzEOIEzUJudirjUSit0odcbJHoCDEEHzlem3dUG3
         vKLnKx21p+Sj+e0bZXKqCC49+eQtEbElYDX5Z50JiQ14PHimOb76q7mvNOHoVmv44bL9
         jnvHsXlv2MfsevwxJV0/k3IW78LE80QRsqJa3Q7Vxdns0lVQDuNy6LScK/eWPSzrHlrC
         7XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829046; x=1705433846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JufRb3v6Ocno2vQc4pm6Nu7BjmQD9aFQ6+XHPNGl1pQ=;
        b=HI8mtD3B42fCMftyoZpnkyWVbvXU/cZtTe35QTLzua0lRXTXs9ofz+zULMzyGyCoiV
         e0jUbrOaBg74ET+YCKQCBtXX0wh+ZhA0HurDPV1ZCly7ZaO4x4c8vq4+YLmC7BgbLU7A
         k+bgwD9PAIVRKSUk/6EP4xA8dbP4R5ho4BHkef/BmPOvGRjYxZx+4kt1TVBBdQ4/hN8z
         a/ATWEQUC0DPY7xm4S8xcaUFGvtXhC4/FPqeJie1WVh3kmtwug9KMK2RjyNDpcSL9+6s
         vQamca93jGbmCG9nXdGzKBCJnp9vazeHgLOYKZE9nrRcOpqoLFr6nuETPqWRPI2sPM/H
         MkVQ==
X-Gm-Message-State: AOJu0YxhS5fa9WBBEdkMD6uf5vCB9gg88Noow4XR5kmlHQLbQP1qGw4+
	iYVP1D7ULZJFfbhwGDYdc4Z+LT6vg8/2sJHTY9Y=
X-Google-Smtp-Source: AGHT+IEh5B4pQyZo9qoHfmu5CFroTHk0kZ1h20OnkPlde4IXL9LTwz0In7XdzdK5s/fT2dY36by1fzFVFlWmfroXQ6Y=
X-Received: by 2002:a50:d709:0:b0:558:252c:21fc with SMTP id
 t9-20020a50d709000000b00558252c21fcmr933897edi.43.1704829046416; Tue, 09 Jan
 2024 11:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-11-jgross@suse.com>
In-Reply-To: <20240104090055.27323-11-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 14:37:14 -0500
Message-ID: <CAKf6xpu_Ts5wY9RxzPid0_Fo4rd-aj=t4x8a9Nd1qA3jrscK-w@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] tools/xenlogd: add 9pfs open request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the open request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

