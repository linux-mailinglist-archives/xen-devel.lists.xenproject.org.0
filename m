Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09590AACDFE
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 21:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977974.1364866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCNwE-0004eX-VV; Tue, 06 May 2025 19:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977974.1364866; Tue, 06 May 2025 19:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCNwE-0004c7-SA; Tue, 06 May 2025 19:26:46 +0000
Received: by outflank-mailman (input) for mailman id 977974;
 Tue, 06 May 2025 19:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCNwD-0004c1-DL
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 19:26:45 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a0b64fc-2ab0-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 21:26:42 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso6468870b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 12:26:42 -0700 (PDT)
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
X-Inumbo-ID: 0a0b64fc-2ab0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746559601; x=1747164401; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCM8dEgWqYXzV4yuApGstbuTGP9YrkOoeWFczEIDq+M=;
        b=gSOi6n1f+X1tjnBANiaA0mWiFEbvHMmgHVVW7cxr/J8OqknlVi2Csgn+UhPwUIE4c2
         SXRNx4HRKP6Hbxe04HafJwuCnBtZ/xjs/f6wuUn8uJMyup9frUtFpoHLYHzbETsIQoCS
         bhUKBq93Nv7zHGllmAhoLlKEfNhkgttNvNKko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746559601; x=1747164401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCM8dEgWqYXzV4yuApGstbuTGP9YrkOoeWFczEIDq+M=;
        b=KkXKy9FMVn0k4yIYXHWKt/poRnytCKWT8fJZZN2/VjIV/yQQtVVHdTqEcLe61lcuO4
         wVah5Ntoq5TDZ67jYzJfv5jsR1o02CYBN/KjEejBWfYhMJqGq2N0TAvxd2ul++ES5Yia
         0+aoGXO4A8CC9PaREcWF8IC8nHBfewg9zaeM/wBev2atWTKVFA0FDm3dKHJWf68NAu7H
         DR3QjM4vDzTqf6bk2u8JtO3n/pamHhicrOEIEmGJTzDgOMISUPvxQgaOpdtAAno0wiC8
         NehgPkog7u/kvB4nbn2cDLNOmbtk6+2l0IwmKVukHieBhaYzNLd5gB+7GHNxuNGjWClY
         SG7A==
X-Gm-Message-State: AOJu0Yw+LBKl70wOzArF/jbDqpU6fA6h8pR3KvwfBFWwz31bLKU/rqjL
	SSmE5RlZPOtztnOLPgtn0npXWC5sOIBbSVk4xbDY8kntpcJSww5R8yBD3raSWSyDVVCGdU70K0J
	KKFRF3dcIp00w4JQUD7EU21kvN7WSlXPyRcCzEw==
X-Gm-Gg: ASbGncvWl+ig5jyp662pwoGysxe56hJcrg8BtkaFnhA+sxTxoFICh9eT46t6ziUjAbF
	lQUbyXFs/iIVl2QjLCtxt8qQMka+ihPwO6YwL4qBVBfJgjhn1RyrFH7sBsbo25XyLVozgYQqB+s
	R9py837Fv5h6VnOhszAmIi
X-Google-Smtp-Source: AGHT+IGaEeAHgf3So0om341FKH+GPnlJgDYKRQB8+JxNdcFdPhowuBcuicT+dHcSbHr0ZCR3crN9l5EFFwwmWemhCOU=
X-Received: by 2002:a17:90b:1c05:b0:2fe:68a5:d84b with SMTP id
 98e67ed59e1d1-30aac15f608mr810931a91.1.1746559601298; Tue, 06 May 2025
 12:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250506081456.1572050-1-kevin.lampis@cloud.com> <10538064-1085-4ae4-82f8-0aa9cabcfe23@citrix.com>
In-Reply-To: <10538064-1085-4ae4-82f8-0aa9cabcfe23@citrix.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 6 May 2025 20:26:28 +0100
X-Gm-Features: ATxdqUEhcCHTHIr3BU_jUvvfhr2B8Ra1rZED_PuRlZsmw9yvGEbrVobHmzKGIVE
Message-ID: <CAHaoHxYfw7d4z1YUB1dXg_OTmgYS6ZmFR1gyr_vRmMKk6gpEmg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/cpufeatures: cpuid features for Sierra Forest
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:29=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I can fix all on commit.

Ok, thanks.

