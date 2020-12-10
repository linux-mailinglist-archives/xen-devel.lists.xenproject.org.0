Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87DA2D5D97
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49349.87277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMvK-0003w9-To; Thu, 10 Dec 2020 14:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49349.87277; Thu, 10 Dec 2020 14:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMvK-0003vh-Qc; Thu, 10 Dec 2020 14:28:02 +0000
Received: by outflank-mailman (input) for mailman id 49349;
 Thu, 10 Dec 2020 14:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knMvJ-0003vR-BN
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:28:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ef049fca-65dd-42a5-a523-94518638f57f;
 Thu, 10 Dec 2020 14:28:00 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wJxBrpx2Nc-d0yrBhGMlXA-1; Thu, 10 Dec 2020 09:27:58 -0500
Received: by mail-wr1-f72.google.com with SMTP id g16so698110wrv.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:27:58 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c81sm10499615wmd.6.2020.12.10.06.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:27:56 -0800 (PST)
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
X-Inumbo-ID: ef049fca-65dd-42a5-a523-94518638f57f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
	b=hz+/Z64fpHPN+Lnbx9W3iPDGU+MQHJdxRQ+oo26mGExJuL/FV7HqjQK8gTqJUlYTw1G8VN
	U5FRUoxmxLwt39oxykDtFwT7nTw/OxEo+EUlHK4UZm68aMSpjsas7IxCn97hYFWsxS5CA4
	BeB0Oz5RslNAcdEEqta+amALbfGQiRU=
X-MC-Unique: wJxBrpx2Nc-d0yrBhGMlXA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H6gmFIInvImD2kayUKLyvQaKlpV11gJ7jcME2e0PUB8=;
        b=bQqGV0iEbq1GB6QPlntRuZs8t6NrPEWfpkM/KNGeDMNblv8zmvvZC97zw2B7mpfIWz
         okAI7dPKyFObTaj0S1cQ0EKUNQTJlfnh2ID1+BVrNdlxjck2P9597fGfrVtKKdoFpj9G
         T2u4NM+WQSMOtvd+j+sos8Wbe/oVTmMrImZizfWbn5DhD4mZ9ev9Vr9VUv6yi+1WPuA7
         ljQy2S+tPwQQr/O0rfMX3rYE0JB725QHY8L69C0tcMCdQG2RHFjQY37/x0E2/4jgpwfi
         RcUr6IUBgHjJ85K+wkfRWP4nq/dgtcF8m/W1+CXULJIMv1O11GoH9pl093GT57eLESh9
         FAVg==
X-Gm-Message-State: AOAM533qZuioLz0gO9WqN66Ju6pDgPJdu7R0gyQ2wG8UJScj2A88zrpC
	Jbcm8VD0yNbTtUtZXsa06Hgv/a3em28TC19RevVXcJQPfQPQFaZoGU+T1Rhp10DY84Tw7lxNHkJ
	q1gP/Pa/x+hWGMXyCOtMPj9K/qZU=
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454233wrt.223.1607610477558;
        Thu, 10 Dec 2020 06:27:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7bHwU1JSlDFVxpuvOX/Iiux9ODs4iDn2SnVkkhqy/VoN5VHkkduwq/x4vp8pvjDYzkbi8dw==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr1454216wrt.223.1607610477406;
        Thu, 10 Dec 2020 06:27:57 -0800 (PST)
Subject: Re: [PATCH v3 12/13] linux-user: remove GNUC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b87fb20f-5b0e-2995-fe03-968391d3dce9@redhat.com>
Date: Thu, 10 Dec 2020 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-13-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/strace.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


