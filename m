Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E446F88CA39
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 18:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698185.1089626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAGG-00034u-6z; Tue, 26 Mar 2024 17:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698185.1089626; Tue, 26 Mar 2024 17:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAGG-00032f-3I; Tue, 26 Mar 2024 17:06:56 +0000
Received: by outflank-mailman (input) for mailman id 698185;
 Tue, 26 Mar 2024 17:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqC6=LA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpAGE-00032X-Hx
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 17:06:54 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dd6425e-eb93-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 18:06:52 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so64861701fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 10:06:52 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c138200b004146bcdde06sm12186029wmf.6.2024.03.26.10.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 10:06:51 -0700 (PDT)
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
X-Inumbo-ID: 3dd6425e-eb93-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711472812; x=1712077612; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Lil4XHHupH9pVMZOy3d4NrDmD8ftMIDsaMKq9dwcYo=;
        b=afRNlXrMS9Y9o6SnilYBNyuvqoZ1S90Hlp+UNkYh6stHknUHDf2+TBq54szsS7z3GF
         h+AUxvGFeyIeKTAq27Om33E/qoDqpm/q2P/UuwOSlKKYI1GhIYFOae2BttqCR9NjcCOY
         BbP3HylmNTDVQ9Doco4byMjqY3P066qhLMtHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472812; x=1712077612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Lil4XHHupH9pVMZOy3d4NrDmD8ftMIDsaMKq9dwcYo=;
        b=HE67MZ7aUXcM6YCyG50jdLwZEeVL5B4GGgn7j0M/ZJd1p7DPKomHiSYXCbamAO63h4
         jkYi/A1AqqYGAogsG+A7UWFCZXpbMbEVaQy56irKnFE6ew0Q98PP6ftMnwvAhQoQD5pE
         aBAQ948deU3TYAfT4L+g5YswPjJfNK650ADeZqLyqVM5rnkJJTu1VurhIL2G1K/PVNzf
         nVvw3P+FD4Lm1HuAuv08tPDdJqaig2v4/gqvUUQWAxCx4V65nqoW0AXqOphOrP3vmCzA
         BVyM9oTDxI0qpClKBta82vqNi2oqr69pWJjXy0k2Z7i02VAeC7uaqu35F0e4L1l7y0hX
         LNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGuhF5R5K450doXIzQysWs6WubZayqzW0rb/LH0UV9YZK7cpPw1XPhIEBEU30UkSBQbJnw2H9kF8+d4AXo97S7UCI+0bEGAINK1N4PS1U=
X-Gm-Message-State: AOJu0Ywerq/lTPo2fBSJpnhAayY09lzJ2K5JnY1ORAFY7CKdvzGVCtuN
	RENn55gFOfbuBVaCf5j6P233vCDvS8p0QdsbS301KGLtP9uGUTJMh4YocN8ThGc=
X-Google-Smtp-Source: AGHT+IHv4uNFDY0BUyZmHrj5BK8Xw5p0BQXHUgMeT4rCoeC67uEPB3r/L3ngTN3jBvyPa6LPOwQjKA==
X-Received: by 2002:a05:651c:1502:b0:2d2:c8ff:d2b6 with SMTP id e2-20020a05651c150200b002d2c8ffd2b6mr3155025ljf.1.1711472812034;
        Tue, 26 Mar 2024 10:06:52 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:06:50 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] hw/xen: detect when running inside stubdomain
Message-ID: <a6345b81-5c67-4c05-acff-f73ceea904ad@perard>
References: <20240305191312.321127-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305191312.321127-1-marmarek@invisiblethingslab.com>

On Tue, Mar 05, 2024 at 08:12:29PM +0100, Marek Marczykowski-Górecki wrote:
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 124dd5f3d6..6bd4e6eb2f 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -603,6 +603,20 @@ static void xen_set_dynamic_sysbus(void)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
>  }
>  
> +static bool xen_check_stubdomain(void)
> +{
> +    char *dm_path = g_strdup_printf("/local/domain/%d/image", xen_domid);
> +    int32_t dm_domid;
> +    bool is_stubdom = false;
> +
> +    if (!xenstore_read_int(dm_path, "device-model-domid", &dm_domid)) {
> +        is_stubdom = dm_domid != 0;
> +    }
> +
> +    g_free(dm_path);
> +    return is_stubdom;
> +}
> +
>  void xen_be_init(void)
>  {
>      xenstore = qemu_xen_xs_open();
> @@ -616,6 +630,8 @@ void xen_be_init(void)
>          exit(1);
>      }
>  
> +    xen_is_stubdomain = xen_check_stubdomain();

This isn't really a backend specific information, and xen_be_init() is
all about old backend implementation support. (qdisk which have been the
first to be rewritten doesn't need xen_be_init(), or shouldn't). Could
we move the initialisation elsewhere?

Is this relevant PV guests? If not, we could move the initialisation to
xen_hvm_init_pc().

Also, avoid having xen_check_stubdomain() depending on
"xen-legacy-backend", if possible.

(In xen_hvm_init_pc(), a call to xen_register_ioreq() opens another
xenstore, as `state->xenstore`.)

(There's already been effort to build QEMU without legacy backends, that
stubdom check would break in this scenario.)

Thanks,

-- 
Anthony PERARD

