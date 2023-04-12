Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53906DFE35
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520350.807849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfgs-00074T-4u; Wed, 12 Apr 2023 18:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520350.807849; Wed, 12 Apr 2023 18:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfgs-00071e-0P; Wed, 12 Apr 2023 18:59:34 +0000
Received: by outflank-mailman (input) for mailman id 520350;
 Wed, 12 Apr 2023 18:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKmc=AD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmfgr-00071Y-5T
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:59:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27f1d415-d964-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:59:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a4a898649so223231666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 11:59:30 -0700 (PDT)
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
X-Inumbo-ID: 27f1d415-d964-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681325970; x=1683917970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfKtPIZLyI/9kyv0UlHMQW/E9H0QfT6xiEL4AwLN9MA=;
        b=mMglum5fqjfiCG7dFKCTVMDKeWjPt0TTq66CTLfgOcTIRq7JNlX+ickLCdUi669e1C
         GvykWxqeZRdVcPEBFuaLBzprxK8efJXDWK0ryJAYraZLFjAzQuTcNgihiu3y8Fx/bG4j
         0rzmVV9NZ3L9tRjU48S01OFPLBEvTA+LKl6YHEPLWriBH+1tPJgDqdYtTke4wSdh+r9C
         8DfQGztPQfD+wDrkiDMBUSf8MMat4W6chryhuxWCWg+c3wB2Gqg0GUzKQ33dI7R+UAw8
         hF6bbkEFmyJCS68UEPqY9ywQvXP/TlWXQnICcXyZxL51Y4Ci/px0t40bjvEqXu3wrtp9
         nPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325970; x=1683917970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfKtPIZLyI/9kyv0UlHMQW/E9H0QfT6xiEL4AwLN9MA=;
        b=V+TA7Pq+nl/Nv4HVoqPyZRsY4rkeiapBdL/KpFioCKejtBd04LoqZs72mmcLQRACcl
         m+9CDagf18GajogAfExcVFwXFUL85/0JagNjCZQlm9KCtST66+PrBKgtM+bbvz0OQeYL
         UoRMOqNrk9NgWEFBPx11o3bpBm3yYs1er5NU6A5Mnwmbs1NojUXuaNmAyoWJHwvuPYD1
         LBCqZ/z+n8/1TRef6w+jaJQhDpcq3k6u4yEOjWw72l0ShaZcBmc6oQinp9mhSh4qURRn
         SHu883ZC4dgiW1CTHKkL8BuSQHpqkreMyYfEQlBw2MvPgJp6ynaW8H1mn2HbfDuiBkIp
         zkVg==
X-Gm-Message-State: AAQBX9dfpe2p9Wa+UY3zkA/jpbrk7eO0IqO2RAhj1Q7PAGLMQlEqHtNO
	eXo7FX+3Glz3DZbnVJ16vAyfYRzq2n/vbmhWFm8MkQ==
X-Google-Smtp-Source: AKy350axA4G9jLT9eVbrgGwoJ8edxXEnerhD+zot/u3c030bUJZC7VGQJkI6O/FFhxjTF6mlsmSnzBPsK6fIIXKEV88=
X-Received: by 2002:a50:cd42:0:b0:506:6ca5:3128 with SMTP id
 d2-20020a50cd42000000b005066ca53128mr82975edj.6.1681325970501; Wed, 12 Apr
 2023 11:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org> <20230412185102.441523-5-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-5-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:59:19 +0100
Message-ID: <CAFEAcA8KS1Hx+zwFPa=8em3RnQJFfDtg0S486U44Byb6+yujMA@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/xen: Fix double-free in xen_console store_con_info()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
> then for some reason immediately call free(path) too.
>
> We should just use g_autoptr() for it anyway, which simplifies the code
> a bit.
>
> Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

