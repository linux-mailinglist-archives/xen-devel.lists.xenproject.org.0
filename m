Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601F7D54A4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622095.969281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIwu-0007RC-Lc; Tue, 24 Oct 2023 15:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622095.969281; Tue, 24 Oct 2023 15:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIwu-0007P2-IV; Tue, 24 Oct 2023 15:04:04 +0000
Received: by outflank-mailman (input) for mailman id 622095;
 Tue, 24 Oct 2023 15:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvIwt-0007Ow-Ct
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:04:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90fb4774-727e-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 17:04:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so10379975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:04:02 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056000128500b0031c6581d55esm10091262wrx.91.2023.10.24.08.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 08:04:00 -0700 (PDT)
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
X-Inumbo-ID: 90fb4774-727e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698159841; x=1698764641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Qt2wllMLDF+l8+9ma3m0C77TgrERD8kIo4WEkyC+k=;
        b=HTDsf0HZGB1W34XjCXbeLL/El/YdAJg/fyddeA/xthNcyzDq4rGxcllIVLn5Wwtt1r
         SWQQXbS2SuNrWMTodNfvcCDg8EPAes5zF9UwgQ/wMjBTC2D3RPnlVba3MWz1t1cUXUo/
         RTTcpFd75OHD0b+dyQnmJsFEOV5wL9BbD0NsPxGgBYlhPftETcSogEqvWAFONeNVWwH/
         ob+rSkn6h3JU8BSCtv4AXp8OQKoPeIrkkYlaPp4irAuPDyPk3rg1ijAL97lTr+Y7ToJy
         WFlFQHeFoFGvqk8TOIRawyuiqcfA+2IMsFJ6poy9ePjucYoQ/25kjprjQwQhZoEUJOOF
         vwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159841; x=1698764641;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1Qt2wllMLDF+l8+9ma3m0C77TgrERD8kIo4WEkyC+k=;
        b=QfncTkJn4vDoV7Q4wz/FaKbkl+3UKemiugUQrYthoUqKfTteA+esswZDks2hYHa5fk
         rqoU2ecV9jFQmhvGHEVNhDAmDEZJrGw9nyDD0p9qMB6AszT6OQ6V1XP6U321EXfXK3lI
         hFiol2n0uzq8oZFI+UHelBVH45gGwGwoTksJm7nnTzgT5+nxuq1wHduFV9wAnOvSRxjg
         Nfn6i8tkharKllUlhtaZu+stJZVuEZVKABiidj0icPwp5tcomflpWHR1h8TkT5aG+sym
         c7gDzJAeOHTkjulnPm8YYlmI7hUAtfc3wg+uFuQBLws5pEjdNXcgGnhrC5OQL4VA7ebl
         KyeQ==
X-Gm-Message-State: AOJu0YynsGEaX4WEqEAS4JpjdYoGiA1RuEYcy+cLw6xLNaOOMqH/OwKC
	+vUnqWS2+mh8w3ArWj7Hv9I=
X-Google-Smtp-Source: AGHT+IGm54ISKlvZ6ARRotUsrpXMLiaRdkUDxht2f3+ks747mTY2+cIYmiFMPEYmjUe2mjy+rnM4zA==
X-Received: by 2002:a05:600c:450d:b0:405:409e:1fcb with SMTP id t13-20020a05600c450d00b00405409e1fcbmr12972927wmo.5.1698159841241;
        Tue, 24 Oct 2023 08:04:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c13a1ff5-0853-41f7-883d-abae08f9ad09@xen.org>
Date: Tue, 24 Oct 2023 16:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 04/24] hw/xen: don't clear map_track[] in
 xen_gnttab_reset()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231019154020.99080-1-dwmw2@infradead.org>
 <20231019154020.99080-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231019154020.99080-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 16:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The refcounts actually correspond to 'active_ref' structures stored in a
> GHashTable per "user" on the backend side (mostly, per XenDevice).
> 
> If we zero map_track[] on reset, then when the backend drivers get torn
> down and release their mapping we hit the assert(s->map_track[ref] != 0)
> in gnt_unref().
> 
> So leave them in place. Each backend driver will disconnect and reconnect
> as the guest comes back up again and reconnects, and it all works out OK
> in the end as the old refs get dropped.
> 
> Fixes: de26b2619789 ("hw/xen: Implement soft reset for emulated gnttab")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


