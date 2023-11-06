Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA367E2969
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628192.979377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0277-0005qp-AJ; Mon, 06 Nov 2023 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628192.979377; Mon, 06 Nov 2023 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0277-0005oW-7m; Mon, 06 Nov 2023 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 628192;
 Mon, 06 Nov 2023 16:06:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jw9=GT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r0276-0005oQ-Co
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:06:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a470ea-7cbe-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 17:06:07 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4083f613272so40717375e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 08:06:07 -0800 (PST)
Received: from [10.95.110.31] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b004094d4292aesm12576758wmo.18.2023.11.06.08.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 08:06:05 -0800 (PST)
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
X-Inumbo-ID: 64a470ea-7cbe-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286766; x=1699891566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeZXKteg9ly/LgC189oPLkONMw9yBgVhmCgiKF0kD7Q=;
        b=i+u4G/4tkN7RNzWrUVrUQbmUkyVEPwWU3F9EF/bb3URqCfmPwAQ+eRJjP7FHLX63N9
         GOzqyMXOgqQGzddHfd8Gk0DvT0VNxv3ylz3+5v9GYNAHy5tJZx+QErniwcXev0zTAROo
         +sAWFQigpO54mBBsiyLd0Ba3+KgL7xJCgjckjTNimqiKB+2XFkrAN5EKZcz/WTdjSnoR
         6sev9GDNqAz+3DQqXct30fKwMoH6CuZUfk6rrXnQON9vEC2yBU0qo6Mq5y8Hu1lVsH9J
         PL8dHV063Vosb3OqSJVrMQxiZlo9ZmrTHQfzohGA1z31z9xdSxmpvE9Y4pOPwRXtCgWP
         iZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286766; x=1699891566;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeZXKteg9ly/LgC189oPLkONMw9yBgVhmCgiKF0kD7Q=;
        b=c3Z6VDCPeFsWKCMj1FmmBTGsZiTE/ewVawqxZtb3sAL8EgMFrz/ZqVbomeRWY3GxS9
         HrGpz9OZu32cys/5iN1WcCcPk2luVDu4N2wR2ze7xdLR8Mdz9A3kK/qWTUUqZRG+1Iay
         YcBReSML75+wZiokGAsM/PNn5tS/bY0d1MAI1AEZef+d9yt9ZyFFIkzsUIZmK7V1fWUo
         0kmQ0gf5tIL2AjWA8zWb3AnC+LlMoFYPBkqyOSSVF996TWYc7ByDy+qoQ5HoR0DSOXTE
         +AdUBcgclwWaZLaJ32zzp/XlDAe/XaaBzvyEIJ4o3Ha6FHYbt/SCT72F2Clnzu1ajSQl
         JiIA==
X-Gm-Message-State: AOJu0YzZTa457MN/6Ot1RLwLdFLCvYcRBuMdbxvAjI677IPF8wHPlufR
	ogabNeQSyn5MKUX4LIDrYA4=
X-Google-Smtp-Source: AGHT+IHSWnf3wN6plpUIgGebG8qT3uQ6MHwdZ3cvFdZB/eJDKIi8+G3R12MVZ1RUvoie9Yarv/csaQ==
X-Received: by 2002:a05:600c:1d19:b0:409:5a92:470e with SMTP id l25-20020a05600c1d1900b004095a92470emr102303wms.28.1699286766483;
        Mon, 06 Nov 2023 08:06:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8531c820-549a-4979-9575-e659ab1b6659@xen.org>
Date: Mon, 6 Nov 2023 16:06:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v4 16/17] doc/sphinx/hxtool.py: add optional label
 argument to SRST directive
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231106143507.1060610-1-dwmw2@infradead.org>
 <20231106143507.1060610-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231106143507.1060610-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2023 14:35, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> We can't just embed labels directly into files like qemu-options.hx which
> are included from multiple top-level RST files, because Sphinx sees the
> labels as duplicate: https://github.com/sphinx-doc/sphinx/issues/9707
> 
> So add an 'emitrefs' option to the Sphinx hxtool-doc directive, which is
> set only in invocation.rst and not from the HTML rendition of the man
> page. Along with an argument to the SRST directive which causes a label
> of the form '.. _LABEL-reference-label:' to be emitted when the emitrefs
> option is set.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   docs/sphinx/hxtool.py      | 18 +++++++++++++++++-
>   docs/system/invocation.rst |  1 +
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


