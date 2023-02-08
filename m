Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D3068EA27
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 09:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491638.760844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPg6B-0005Kr-Bc; Wed, 08 Feb 2023 08:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491638.760844; Wed, 08 Feb 2023 08:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPg6B-0005J8-8O; Wed, 08 Feb 2023 08:46:39 +0000
Received: by outflank-mailman (input) for mailman id 491638;
 Wed, 08 Feb 2023 08:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FqSI=6E=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pPg69-0005J2-SB
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 08:46:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18cfbc0a-a78d-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 09:46:36 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so879990wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 00:46:36 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j37-20020a05600c1c2500b003daf6e3bc2fsm5133846wms.1.2023.02.08.00.46.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Feb 2023 00:46:36 -0800 (PST)
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
X-Inumbo-ID: 18cfbc0a-a78d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BElElEQ/hIipacRrOOmj7l0wq5XVFry676UGj3ToD4M=;
        b=JzUvg+GxfFxNR3dLjqK3bEGSDX93ztKUbP+eUDVe8CF1UELKkZg7gwveN0KmSHZRQo
         Zgw5tbadfODeZ2wa8H1JuatquPLEtTch5yRCW2SLyI82OeIFMwN0f2BFLCl/ykMedQKm
         eZDdMAnmwPC/HtMjazu/1M0TOn4G5Efn9BL8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BElElEQ/hIipacRrOOmj7l0wq5XVFry676UGj3ToD4M=;
        b=eCaG/+WVYrGfyYzXMmYLEWKamnK77/pr3dqTme0rmClDsDUaynrrDSeH22JuMjpOnO
         YZWSnXbZODFpkLgVPQCEgmJi8HE5fzB/7qqDejxe7lTE2otJEIoWEk96E8mQ/ePPl9Cl
         AtXC8BhaL44DmD2fuFKWNXNRSJ2PshFIeTgYZ3+SgsAN7ekYfH00xTC6Z7DP00cKdcFw
         sLYCTCJbCdG2QApi+F8HTVX5RZtUssjpMpLBZ0xMO7+y+yFuGcs3Rt1d1W78G+VzMxEZ
         KxtEONwoww7MZG513XHLkFgHWQ25oeh3f06PRv46/ttzN18uM8sJ9nPM+kXE6KBOsHUB
         55Wg==
X-Gm-Message-State: AO0yUKV3Kd8HizZxEFWXpfXaHBAxsRAFZfEMJ/yJNpSW/hxXZgfI4K59
	AoEsSH8H1OD4NGCMLlntEb9yhg==
X-Google-Smtp-Source: AK7set+sf9swTZMuxhMhLBUl7teg09yqYmoBCHyrmMdyt7vUvfNUCXwgEjVNJO+I9lTa9De08ED45w==
X-Received: by 2002:a05:600c:130f:b0:3cf:7197:e68a with SMTP id j15-20020a05600c130f00b003cf7197e68amr5753177wmf.18.1675845996444;
        Wed, 08 Feb 2023 00:46:36 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 0/4] Stop using insecure transports
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cover.1675829866.git.demi@invisiblethingslab.com>
Date: Wed, 8 Feb 2023 08:46:35 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5CD4D18-E8C7-4B37-A26B-B31DC15415AC@cloud.com>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 8 Feb 2023, at 04:51, Demi Marie Obenour =
<demi@invisiblethingslab.com> wrote:
>=20
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>=20
> Demi Marie Obenour (4):
>  Build system: Replace git:// and http:// with https://
>  Automation and CI: Replace git:// and http:// with https://
>  Miscellaneous and documentation: Only use TLS-protected transports
>  GPL License Boilerplate: Switch from HTTP to HTTPS

Acked-by: Christian Lindig <christian.lindig@citrix.com>




