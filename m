Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75EF7DE172
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626480.976734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBBn-0002QN-EU; Wed, 01 Nov 2023 13:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626480.976734; Wed, 01 Nov 2023 13:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBBn-0002NS-BV; Wed, 01 Nov 2023 13:23:19 +0000
Received: by outflank-mailman (input) for mailman id 626480;
 Wed, 01 Nov 2023 13:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyBBm-0002Mn-2P
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 13:23:18 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c89bf6-78b9-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 14:23:16 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso1805597a12.0; 
 Wed, 01 Nov 2023 06:23:16 -0700 (PDT)
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
X-Inumbo-ID: d0c89bf6-78b9-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698844996; x=1699449796; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqMhOc0o469J2B5kXslJ09c6Fqpe+rw+VILnhQZ9WiM=;
        b=EfKK+G57lDiBffoXwfYfDRfc3aaV0hOD+OgR7nj8NXHxehRsDRWIo9zO/UXrieaGAE
         sDVBm9xbmWN0oFVrpT2LhZOLSLAEVwf9tE+bI8bW+vFgmrOSEnd0Ykg7rgOqRwT5OBYP
         8iydySDZcwSr3GC8kaVZcV7d3/JzDj1DGCY5s2uPm35aJSRdZl90Qz8i4sYNmh6+MRpN
         IWVnWG6h14scmcuab+B4dWStWUW5pjjrs5SUyCl+HD4IRQM6F+I6lI1vSDCtnNZGeiud
         gJKR6tE+ZFv+8Z9JKvjA0axUV2qnipZqhYIn3nS0UDhoSdKKUBAtsq0x/O8yU+VD7xpO
         9dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698844996; x=1699449796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqMhOc0o469J2B5kXslJ09c6Fqpe+rw+VILnhQZ9WiM=;
        b=lN0AQ37Oi3wLlTx/an/+ObTL1FVGBzvBFilWHw9UoHzgm5TeX5Yz043UpDJZ1doFXj
         4ArQ60XaZpSdUQFdOOZjgzo3J7uBFe1alRsC9O/Lu4bPJqbuiGGgiLvIQmOpJxx8+yMy
         oFmVlItB5UgO7FKwEk+viyTGRcaPQ1A6ELzUcT0ZgB/Jns/Fn1R+dCp7E5y5M0cLjNPT
         MT4d1TO54jVk5hb97ccOnzd9YZBiH4eEO34U8sUJNCfonpVwrE9B6TBKXech2uYfusKh
         D3OWBXVOWJNT9Am0qFH2u/YlpkBJpihP/dUp8r3kBw4G0pHpyogOeyMmHngFCTU9WIkW
         YVOA==
X-Gm-Message-State: AOJu0Yx9JHtOg6ojG80r9MuqKV0zQDKsi6/uf5iLEBY6oYPC6pPR3NhX
	vqD3L++KZfsKI/95z5GUn1xY4NJxhA0ysYs0sv0=
X-Google-Smtp-Source: AGHT+IEAQ5uDjCSveZCqZKHYlEZ6+nMsYYs2N4Dhb/l25nuDgkpi/SqNX9ZphGweKGZ7vXb+Tj1iq+sTWTeuQjtP5/g=
X-Received: by 2002:aa7:c042:0:b0:529:d147:e9f3 with SMTP id
 k2-20020aa7c042000000b00529d147e9f3mr2527705edo.5.1698844995640; Wed, 01 Nov
 2023 06:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231101090024.28934-1-jgross@suse.com> <20231101090024.28934-2-jgross@suse.com>
In-Reply-To: <20231101090024.28934-2-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 09:23:03 -0400
Message-ID: <CAKf6xptqN+QgU0TBhAfrOn3xJ-Z9-mS8WFA_X4nv7ay_RS+exA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Mini-OS: make xenstore_buf externally visible
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org, wl@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> For support of the 9pfs frontend in Xenstore-stubdom xenstore_buf
> needs to be externally visible.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

xenstore_buf will be used by the xen.git patch "[PATCH 24/29]
tools/xenstored: map stubdom interface".

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

