Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52792FA56
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 14:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757980.1167159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFTE-0004Z4-36; Fri, 12 Jul 2024 12:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757980.1167159; Fri, 12 Jul 2024 12:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFTE-0004Xa-0Q; Fri, 12 Jul 2024 12:33:52 +0000
Received: by outflank-mailman (input) for mailman id 757980;
 Fri, 12 Jul 2024 12:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tlf=OM=bounce.vates.tech=bounce-md_30504962.669122aa.v1-cb88003a0e0a4a599e05df2331f4a31f@srs-se1.protection.inumbo.net>)
 id 1sSFTD-0004XU-Eh
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 12:33:51 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb27918-404a-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 14:33:49 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WL9xl09CHzB5p8Z8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 12:33:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cb88003a0e0a4a599e05df2331f4a31f; Fri, 12 Jul 2024 12:33:46 +0000
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
X-Inumbo-ID: fcb27918-404a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720787627; x=1721048127;
	bh=qsLAa8oE2og9iv3HjDhMbDDLOHpOYucu2hYO7m1bzS4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VlLNltFtMWZEQFyRyj9hBzXJe5fuq7jsmc5KkrbDAofdacPDdzO2cAGJ8oRi66BUZ
	 dZVtApHTDFcSaoLqz59suF3hx62ji5ltxoGVUsP2UOWSaKvE6KJPqptrW7OzVYiP27
	 ylm/3+NUGb90MRI3C7snO3fXWwEfyyTVzXNfX8DHSi2XhNy0dZa4tsBNYGj07cQH8f
	 ++ksUxWixsbyIHsZe14JArrSG2+czL3DCePOGUdJnO+weEnedhYUEV3lBrcZpW6Ze1
	 wNKZ0p/TslQK2jyfDi47fn24EdtgBXw3tlZAv9rocnxXE7Z/JtnPvye8HxyM4xqz41
	 D6XFsa1mr8UvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720787627; x=1721048127; i=anthony.perard@vates.tech;
	bh=qsLAa8oE2og9iv3HjDhMbDDLOHpOYucu2hYO7m1bzS4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=j9ekYZ6I4CJ+VbweQy7KjMl2nnCwOqna64l8GTxXPQHS3KcG6e7i5ISBZqu2tKuvZ
	 6z5Z0A+uypUgHqzLmCOZA4tYwCDkDgRu578nKmY6KWI5i9VzYuY2X9Fu4eLxd3npit
	 61nQAY5XLc3Cl67DmPsXU1OUPEC80G3nMcWrR7paUzoQqDfubBz0ngQ0GoaT1QcVxO
	 N1qerPML8myD3nTQiaZHx7lh+jyMNDk6+RyDlJX24Et1s7IokNEYhHt9n8G8StOkNd
	 WBZBGUizwShFDXJ4TivWoqcv4QAD2bI2rBPX7RZyflWGY2FDPk+yGKq/Rd7JcsbKwT
	 O34n07h5QMXBA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2013/12]=20CI:=20Refresh=20OpenSUSE=20Tumbleweed=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720787625411
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, Olaf Hering <olaf@aepfle.de>
Message-Id: <ZpEiqM7XWlzb4q+z@l14>
References: <20240711202337.3128473-1-andrew.cooper3@citrix.com> <20240712111426.3244115-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712111426.3244115-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cb88003a0e0a4a599e05df2331f4a31f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 12:33:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 12:14:26PM +0100, Andrew Cooper wrote:
> while removed are:
> 
>   bc                   # ?

I don't know why, but this one is also installed by osstest. The commit
adding it doesn't say why it was needed.

Also, looks like many QEMU containers are installing `bc`, but I can't
find a single use. Maybe historic.

>   libnl3-devel         # Libxl COLO(?), option

Yes.

>   libnuma-devel        # ?

There's some mention of it in QEMU.

>   libpng16-devel       # Qemu ?

It's added to a few QEMU containers, but I can't find any use.

>   libssh2-devel        # ?

It seems like it was used by QEMU at some point, but they switch to
'libssh'. Probably optional, like many QEMU deps.

>   libtasn1-devel       # ?

QEMU, and it seems to be only used in tests.

>   nasm                 # ?

'nasm' is used to build OVMF.


If we don't want to build OVMF in our GitLab CI, which I don't think
would be useful to do anyway (no dependency on xen.git), then:

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

