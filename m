Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA00C30C19
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 12:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155722.1485162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFK6-0000Ct-LT; Tue, 04 Nov 2025 11:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155722.1485162; Tue, 04 Nov 2025 11:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFK6-0000AU-Il; Tue, 04 Nov 2025 11:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1155722;
 Tue, 04 Nov 2025 11:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RsLI=5M=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1vGFK5-0000AO-4u
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 11:35:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 616bddae-b972-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 12:35:36 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so4770053f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 03:35:36 -0800 (PST)
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
X-Inumbo-ID: 616bddae-b972-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762256135; x=1762860935; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEmvEJ569yU5RcglEclTpCH8Bhz3hNTAvll9P58zPAs=;
        b=aBQtR0/W3HfgtJ1jTuZ7OrPLH2OlcHojFIAM+9iNaWj5CG0JTS6xC7GwXFa1xbAUD4
         P8/Z4xroqs5J44KsFerlxuKgXXw1LmUeRtLn/pIlX4YHrHlTbz1QvKJfWkzWCDZL5OD+
         SoCGtWqs+R4gNOdTvNuoP85MrJW9FKpMm8eN+TNaseHGLZgjGr6p64nx+mIA4qa7Wuo9
         NdXemH6R41A3KsP3VV+KdhVLuCuAvJWsvRuDG7sP6bp3kJtvfah00YkRVg+CcODebGsO
         m1y8zP926NDEdlspdcYsXrEZO1gLiRaFDQEGQKHPTUixgQ0eDXlnn5qHWQ5us832WT9O
         JMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762256135; x=1762860935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEmvEJ569yU5RcglEclTpCH8Bhz3hNTAvll9P58zPAs=;
        b=Kxxb6XrE5p0RZYKW6N09H0sxE3rYnFci2spT4tcMDCsCvZmImdoNMUNSxgAbrK9poZ
         Ht06kvaE+8W7KuC7IWrVJ4PWVovw+2j9ggFKDgw7Tv+ZPq2ZOkNDZhdpFOLJBmCnO6G6
         5Y82xnGE+Vy1QWCIj5MBNJBdb0zK6Jeff3HxpLruz0LOKLZAq/tqqRCTeSEbwS0e+Pov
         HLEAX4/cOODo0HLQfnGOngw0EhVRv/2H3dO89xWMC8Xqu0Y639lTSxDzpU0MnZFr78Uv
         SERKj75dvTARv24SAPhaUkyjXDYgWU97PcZSJvkPy+zdhSYkf5NCJr7Bjs/NbBBYh9Ps
         2UAg==
X-Forwarded-Encrypted: i=1; AJvYcCXfizLyOMWJ4EmvUc/+SJF1nNEXRbZCyJ1o/kOOt1nyRg3KVjug4c5j8kSWY1+aK+6auuJCAy22Q5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1Y+ouyq9W4pp3u5Lhv5y3EVYKNSrVDZEHIIvK5yhoZQGNu8zX
	TRP6kpI0Z6VpmZSDvQEBctOdHOOXr/v4hASTduUPJrLw24XC5vMJekPQ5KC8MPaRALT6EfyfHit
	xvCL8g5AufCuKUBKYL/+zCorCMLcdbVs=
X-Gm-Gg: ASbGncuOVtBzvuLEam8s7oLPxWlzbiQ0bT6V0GZmRwTLV+TdL8wManyZYE0zy8XemR5
	zyKWWPu8jEHONz6xRIBN82nUXoY1nliHJgLEMe9ulyNbMgmfl0cddP5RRkHtJ6jms+KeTtkTxhV
	MMjn856o/UYiTyhxkq5BSuhUb/jBGL6k1zDWFGd/oLzTFPMff//PzwGiYFAETMG/lv/+Xlmyyq5
	erJuCLqxhWiEdNL9kv6qfiHwuaknwoICTKoxLPBkhdxNOu+tr66F9xtdHpzZZ0iXy9UJKib5OVt
	OR7K6qAloikW7EtonR8kLMg=
X-Google-Smtp-Source: AGHT+IGaLY+JLIYC+PCz6Po1zk8eBb5OGygI2hYtgllNgiV9B/bGVoEyNwBPY0xfwIC/o0NtnoKZzZH3qj4GP3m24jY=
X-Received: by 2002:a05:6000:2387:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-429bd683416mr15476430f8f.14.1762256135401; Tue, 04 Nov 2025
 03:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20251023233408.16245-1-samaan.dehghan@gmail.com>
 <f61d5a29-04f0-44cc-bef6-de05f240bbc8@citrix.com> <88bff8bf-195b-432d-97af-317398796d40@xen.org>
In-Reply-To: <88bff8bf-195b-432d-97af-317398796d40@xen.org>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 4 Nov 2025 11:35:23 +0000
X-Gm-Features: AWmQ_blyA9YZ4uueKshDcanABVUP5rhPkS6sjLaXVt30rbRZeGmP9GrQ8Rc_Eao
Message-ID: <CAJ=z9a2=jzZSJW9Y8rNhA2L=m9jYF1ziuzoEwH7+DAG+q-HKCA@mail.gmail.com>
Subject: Re: Support of building Xen with Clang/LLVM on Arm?
To: Andrew Cooper <andrew.cooper3@citrix.com>, Saman Dehghan <samaan.dehghan@gmail.com>, 
	xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wentao Zhang <wentaoz5@illinois.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 4 nov. 2025 =C3=A0 10:44, Julien Grall <julien@xen.org> a =C3=A9cri=
t :
> Happy to review any patches for clang support on Arm.

I was told privately that there is a series on the ML to add support
for Clang (see [1]). It looks like there series
had some reviews but needs a new version. Adding Volodymyr as the
original author.

[1] https://lore.kernel.org/all/20241129014850.2852844-1-volodymyr_babchuk@=
epam.com/

>
> Cheers,
>
> --
> Julien Grall
>

