Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728A6A4C0E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 21:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502888.774915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjry-0001ro-9q; Mon, 27 Feb 2023 20:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502888.774915; Mon, 27 Feb 2023 20:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjry-0001pz-66; Mon, 27 Feb 2023 20:13:10 +0000
Received: by outflank-mailman (input) for mailman id 502888;
 Mon, 27 Feb 2023 20:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CN8x=6X=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWjrw-0001pr-Dy
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 20:13:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24f75107-b6db-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 21:13:06 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-u5E_gQLHOpukMUDnOQ9W9A-1; Mon, 27 Feb 2023 15:13:01 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so10120182edb.18
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 12:13:01 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v29-20020a50a45d000000b004af70dcce7esm3516370edb.40.2023.02.27.12.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 12:12:59 -0800 (PST)
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
X-Inumbo-ID: 24f75107-b6db-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677528785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
	b=Jh0e87RCm6MS8qiDKRUHNF63siOyfCgawt2e0yHlqTNmO2K78AyvRFS1e/1GyvlZVASv0/
	m4+NRjlqGiPaYNZ0GGW1oJOab3TJVqFAe94TTs6PANbrAoVIBlMj/hBdd78aX7r3W38mMM
	jrYwH2aa0XALfcpGaXxB2b/uuApEcnc=
X-MC-Unique: u5E_gQLHOpukMUDnOQ9W9A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
        b=yvQXdmLJR3RlfIkA/g/Cu0Vhqg8MHIOnGmsKbEN0S/ROxHfa77Ll3lRrNtTX5i+e7q
         zpZ4kCyMl9sVxE88Svcpu8Op8i133oM8yh8QjLps2v2LkYynVw9gf9LWKX08VVQwFUkI
         CvxuOsqZbniKVlfKbZXyy+hEa0EyHTnQaHLQG2d58cOdotP6icOPIiIfbS4p8AsIrm8X
         4I49vgkZ2xTQAzq/J+ujGtR0k001PXT/najIufYduXcdZ1kJifd28jsKKJrjs6OOdJ/G
         inAOzYY7KO5r8JPj3bhQH70GbNs+ThSAVikmdMAB6rp+EZZjHO1l/dNLtTrxsXoWjVFy
         XnUA==
X-Gm-Message-State: AO0yUKUMTZd63TgT1lrEigFW6JIW1kXhXwraO5SKhEpcbwvaXjSJ+NTw
	Z8aiz5xLDED8pbEdtA4ORzakEWsQq1iA+wxrDpg1CtLKwdrgZuJaBTzzHtJNwhUN8sqCBmC3ZAs
	tDQviZYZYNkG4v+CYMCQcqH+5ucs=
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id d25-20020aa7d5d9000000b004aaa1d4bbd4mr795781eds.42.1677528780646;
        Mon, 27 Feb 2023 12:13:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/s65ko7k8eMliaBLSgcdKtqsDe7q45PYpAz8p7fZUIE9CJak+If2OjVIOVHy1F3DAavKzVwg==
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id d25-20020aa7d5d9000000b004aaa1d4bbd4mr795759eds.42.1677528780354;
        Mon, 27 Feb 2023 12:13:00 -0800 (PST)
Date: Mon, 27 Feb 2023 15:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230227150858-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/yY72L9wyjuv3Yz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> I feel like we should have separate deprecation entries for the
> i686 host support, and for qemu-system-i386 emulator binary, as
> although they're related they are independant features with
> differing impact. eg removing qemu-system-i386 affects all
> host architectures, not merely 32-bit x86 host, so I think we
> can explain the impact more clearly if we separate them.

Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
a superset.

Removing support for building on 32 bit systems seems like a pity - it's
one of a small number of ways to run 64 bit binaries on 32 bit systems,
and the maintainance overhead is quite small.

In fact, keeping this support around forces correct use of
posix APIs such as e.g. PRIx64 which makes the code base
more future-proof.

-- 
MST


