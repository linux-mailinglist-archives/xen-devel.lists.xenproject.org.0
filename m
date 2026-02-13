Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNCfEEoxj2nQMAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:12:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1D136FA9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231086.1536398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqttg-0001sK-Lo; Fri, 13 Feb 2026 14:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231086.1536398; Fri, 13 Feb 2026 14:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqttg-0001pd-J6; Fri, 13 Feb 2026 14:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1231086;
 Fri, 13 Feb 2026 14:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=226k=AR=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1vqttf-0001pC-CF
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 14:11:51 +0000
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com
 [2607:f8b0:4864:20::b136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f02d74c8-08e5-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 15:11:50 +0100 (CET)
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ae222d87dso1101546d50.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 06:11:50 -0800 (PST)
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
X-Inumbo-ID: f02d74c8-08e5-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770991909; cv=none;
        d=google.com; s=arc-20240605;
        b=A7zBloeuNbvW4T2qQ4w/5MEnwM+BlGvRTz5GlLCw4ZYtnsi+5TYPwdrRIFNJKZ16P6
         BxQxG15izrm4Km/ihub6H9S5pXiXrIVymItJbZlUdOhHP/xeVD4o7mzTeAy1efrBxZ3C
         0WaTGceTstXzP8RPUSrTOf/ROJbDyrR2yftJ9n2D0ob1FalubrQkt7krka+N1FV8DIN7
         QAJDeGxLASNavnb5XSsRxSjDJNSorEWlUxUNBMgTNyFXavnEnHQ8jRcxF2i55//ZnbVT
         EUuGms3H9ccrroTOP34zfCzlXDNDbDzPletO/fyE/G+fHTK4vpMTiVAQgN3mOUmP/Lvn
         7BLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E+Hcp7SIum9H3zzUJZsKPurFW4IHGWWeOhHlNm8iPEE=;
        fh=PduvIRqI5AtPoAZbc8IE2LtG1FEpyBzo+vWGkDrV7s0=;
        b=c98y+r6seFyvfkXNiXc5yCl4rWXLe8AXXz/n9zOGs/CbV0diXR3MgmmZYXtlpsFujZ
         QrY/Hi1Qp5ZFBDvO2PMR/qdQ54fAe/1699CcxuQ7342m70EzJsqV+jIgfVHUfzVCOuc9
         3Dr2T8KceHHFAh8/iI4aNkdG+sMYvf4W8dAjInZwOYmiQn3BYS8AB1W7U6HnTApF97ZE
         sH6xCpsTP6td3R0piArb/UrsYaKtXGSn6+KitEH1GBTD6wQ6HGxkWk3AmmxAAPA6Einl
         InpdjaEjLiKc1zN/+GRkfaNPzsldJePqmjIl/zkFUBlIZqgcs06W0CpesOEa+Gv7qN1Q
         qHdw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770991909; x=1771596709; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Hcp7SIum9H3zzUJZsKPurFW4IHGWWeOhHlNm8iPEE=;
        b=BbFLBPEb7kdLjaqxxopOrZuN4poaNZVaeNjLDf4uFg5vHJ1oqKkrtnkFKw9lyA5mQE
         VMsQixjfQwhMQP1nCVy1yMjF+6eoLj1HAm8TNQtog7XWh1LP33zUflxmpYBDWNUhXd/m
         4aZY5Xpcmt/IMv/4ZIXUcZ/rM993+GS05Z3BhnvLpIJ0fJiCCeq/o7wtyNh3Uxh6k6rZ
         XYYu51yIEIYuV5PwV0XYmZElc7jMbqDOd6ldUu7gBAv51zCYoQhWYOP7HUiZ2iVD1N5O
         9dAGICOfkEAqLZYJmjVvuHFoiaP8HMcdmnTjUovVCGwNQSKP+qDw8GUj4rOe+HPE9iry
         6Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991909; x=1771596709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Hcp7SIum9H3zzUJZsKPurFW4IHGWWeOhHlNm8iPEE=;
        b=UpG31A4nvZjdkcfFoLaKCTaRtGODSJVjd1GeybBPxyupNbrz32lBk4g3PkSPSDOLw3
         pAhI5z6866Om6pgpfqBCzx6oUiMbs/NuCqFPCFm/SkMv8xi3N6ORePuT+N1qtHGoYWBK
         fBMzrCRsN0NdvuaGukUnCYixIKZNrfD335Fkv2YzXb2Blb9S9xN+BE8AhMl5jMR6Nz38
         Fn4j3UrkBYaWHxdq6AT6FInJDArTZvbBl+j/5C3y6jQB2XNid/ViqBhuARzsfANhtZ2c
         rRwuj92S1XMRv4TapGThex5Aq31fo3AnQcUdH51atC4x0Luu++4TiI/1DqFkZ/K/3xC1
         8Cdw==
X-Forwarded-Encrypted: i=1; AJvYcCU/Si34mXJvAL33lGr8HBSadLwCXixZPuYHf1zXruUVT2LQunnNs3davuBcSfvezorScEQ6D1KEAj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoL5Kz4Dg1PBimRRowignJhJ2I352NJJf61mONPVMAo9B0Dzmr
	X0OPoEAmQ/x0gG5Kt46p9IEN/xeUF/eqQ9bzIBID6deKl4fgw3HAdgch8/XPJH6LZLSogLw3HoK
	nXhtYN801fdMy7c4mU33ofJ2X11/G8vldxePhyIrdh5Hjs/G0IeEJ
X-Gm-Gg: AZuq6aJf3WV2CZgiUx7DMuQ4wkmL4GWxYg0uJmaHRqot4RI8F2S0huSMlzt+sj9NbNr
	p1Lt0MDW5O61TTRSMCP08LnQwl9StE2aFZD0ArHe7ePobJ+nu0ABN/EHkIpq0r/0Nr2hPZYJb4Q
	TJYqY1lGL+Gfn2KHMrzImyWhN7LaxeZVpi9ZQqamOkxtnYqJU8rAiqyDvWL7u8MGaUwHXtpCbhS
	Z9FTuhh5qobJN2jyTepzQXR9vj06x8GrF2doeiwiYB0wZqT36+1+6oR5x74ClZmbXe6P9I0d4vO
	1D4B7Hw/eApewzWLGIbNj8Yfn2VaglfnfvIe67TPut0iw0zHExfUeIkamn61XjwKIec=
X-Received: by 2002:a05:690e:bca:b0:649:b535:46ab with SMTP id
 956f58d0204a3-64c19b196fcmr1343989d50.49.1770991908901; Fri, 13 Feb 2026
 06:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Feb 2026 14:11:37 +0000
X-Gm-Features: AZwV_QhTszuPHuF69gBdjMmghGZj0GECDjqjodvkLk8R7I407V4-YWO9HB7GAYo
Message-ID: <CAFEAcA9M4OvfOEnAaATuUQwFk3YthTUjPNFLo4izgd+vORHbFw@mail.gmail.com>
Subject: Re: [PULL v2 00/15] Char patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>, 
	Anthony PERARD <anthony@xenproject.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,linaro.org:dkim,mail.gmail.com:mid];
	FORGED_SENDER(0.00)[peter.maydell@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:marcandre.lureau@redhat.com,m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[nongnu.org,linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.maydell@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8D1D136FA9
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 at 09:50, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 4ed6a7f2fdc09d9fc3411e83e278da00851220=
16:
>
>   Merge tag 'pull-block-jobs-2026-02-12' of https://gitlab.com/vsementsov=
/qemu into staging (2026-02-12 14:35:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/char-pull-request
>
> for you to fetch changes up to 98ba0e479771a391137119264156e9661508bbc7:
>
>   baum: Add copy/paste bindings (2026-02-13 10:45:07 +0100)
>
> ----------------------------------------------------------------
> chardev patches



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

