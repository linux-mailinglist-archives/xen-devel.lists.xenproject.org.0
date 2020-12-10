Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727FF2D5D85
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49337.87242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMu4-0003e3-Uo; Thu, 10 Dec 2020 14:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49337.87242; Thu, 10 Dec 2020 14:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMu4-0003df-QX; Thu, 10 Dec 2020 14:26:44 +0000
Received: by outflank-mailman (input) for mailman id 49337;
 Thu, 10 Dec 2020 14:26:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knMu2-0003da-ND
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:26:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5ed05038-207d-4f7e-bad3-00de52d3f290;
 Thu, 10 Dec 2020 14:26:41 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-13Qwd3tkOn-axT977J48wg-1; Thu, 10 Dec 2020 09:26:40 -0500
Received: by mail-wm1-f69.google.com with SMTP id w204so1293804wmb.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:26:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9483846wmd.32.2020.12.10.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:26:37 -0800 (PST)
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
X-Inumbo-ID: 5ed05038-207d-4f7e-bad3-00de52d3f290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
	b=PBRQfeaHriwLyAXVmlv/JplQaG9lrRd/D+rmZ+S0fl2BMJmH79/TTgraV9IBULy67HnnQl
	6mCHEJyWz9A7qy29YB7F7rtExVwc1kLWYegHPgxbhVhWki+2fakKnhZUdx/MoLRmmmpz8U
	hv7gKU5z3vAcz+abE7PWqL/HVy3u8eY=
X-MC-Unique: 13Qwd3tkOn-axT977J48wg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
        b=hmXzCkhHAMuM3H+qQhNhfQUNfK8Ws0pHHWzu3Z2pvcKbSAfS319x5eTEJ9H6uCVa1K
         FLjXomy8cS077coxo1FRJpjqB5dlw9zYdLXN6WAs2hhmLHxeBgBY+DpGDoZy0R8Az46J
         vqORnZUKLEbdtMod8ZxsARgWNHtWGLdigs9hS2U4XzJRjNZo3+2QfA1rzOIHNuEhaOXB
         1oOfSXnzEgfTb8RZjL3usTCWjFsp2sBlEbH1PH44xKGACgS632+T2MDGWFx08icM2vYX
         1SRhJmc+uwCk+6lx4kaaHTwcA297WjuiCoVpAltr8h6093h6Hs3jzTgKetLwcEfm5rjx
         Ho4w==
X-Gm-Message-State: AOAM53126/9roSNblvHmf9wMP/xVmn3vmKVaRtojjsRLHGzRs4P3NaTC
	w7RmYV7f7IoNCoPM9m5t2UIvTTeLC1ugAKf3U6evVFuRqfVvKZcdlGmZstUJt3lZNR6CELw6iEG
	Ltz4LDXCOar3VqNjI9zMOd9bD+/8=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646313wmf.149.1607610398621;
        Thu, 10 Dec 2020 06:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaUj7tpOFO2508Lw7v7CE5X685qxDLYndPVRSbnJIXc50ft6ZIJ81hdHJIppshYmFGwc18AA==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646296wmf.149.1607610398481;
        Thu, 10 Dec 2020 06:26:38 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
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
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
Date: Thu, 10 Dec 2020 15:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-9-marcandre.lureau@redhat.com>
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
> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> Drop MSVC fallback path.
> 
> Note: I intentionally left further cleanups for a later work.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  audio/audio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 46578e4a58..d7a00294de 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>  
>  #if defined AUDIO_BREAKPOINT_ON_BUG
>  #  if defined HOST_I386
> -#    if defined __GNUC__
> -        __asm__ ("int3");
> -#    elif defined _MSC_VER
> -        _asm _emit 0xcc;
> -#    else
> -        abort ();
> -#    endif
> +      __asm__ ("int3");

This was 15 years ago... Why not simply use abort() today?

>  #  else
>          abort ();
>  #  endif
> 


