Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E381EB81E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:15:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg30D-0004Yc-Hf; Tue, 02 Jun 2020 09:14:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg30B-0004YX-Vv
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:14:32 +0000
X-Inumbo-ID: 777301c2-a4b1-11ea-81bc-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 777301c2-a4b1-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:14:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h5so2583476wrc.7
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=2gtBXT2WEaFsOyVBj6fU7pOgQwyc+PWjyl4kh85zrzQ=;
 b=g6cSZ64QO2CexPzzxnFwOeRNMr9TRyv3ozGyqY7SYbgYqQ26cPu1VIK/AIPd1I40eM
 BJRg/vibrWG9ooGQ7Shs2rsXDM/5Ds3ImAx43/mNReiXiCv2aFc8y7FRkqO5MC2nSNBD
 HTqjYihxbuYViHRNc+WV4Qm2L5xkyaZDvP9y2qLaTfz3p39xMmUl8msB6EgO1B5Lctia
 j2jSSBxcDgYUg94n4r9Im1lZFAmY5BVfcEDGnIXzq/P8A5I4DlPRAWHWn8gO/09rH2L+
 olPfh/cdJvnQBPv4r3X2pNhx7gKDNvHB2gkj2ShWrx0ocZjIuyfSxCgNpAFF1BQqyRgq
 OBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=2gtBXT2WEaFsOyVBj6fU7pOgQwyc+PWjyl4kh85zrzQ=;
 b=XB5dwbCrnlahFuUEBpoxfDlr/4briRLAf0//Y0w9ddff96obt8Fh0gc3t5QwZ1u7HT
 wLqsUAn3VZtJ94ZAHvoZ3ubXYonQZa94K1K3oJyxDxb5+AXG32U3YkGXq2FgPbpeNMEc
 edmN+Jnbyec/vZSruX7aH183ZPeyo+Lkl638uR7qK9fZxZwlRjpb9BvYLMWZX05IJOSD
 V56nwcU7hMJ0n2u7zkssT55ERVIonkPo0eOGYHCCSBShfr9psJD0SQgwVC+oC2HhxuaY
 84TuDBjDeIV8v+9xVU0UKd2KzlOT8oaLVbI3zJanP1GmSn7uyDZRB0yWoCOSnpXBVQEd
 ZMhw==
X-Gm-Message-State: AOAM531ZDF3wAIi98ilzlYJ6IAiVRwxws3u2o5BSo/O04osdQ3qM45Ng
 BJKIlZcZSUdqE7BaWQtVk0s=
X-Google-Smtp-Source: ABdhPJw0VXcV8e7xC2bR8JDv8ZUgdD5eEIPSzV8tJCOfe3d9rREfqcCtxYLdHBms3ykP+UgEX6re2A==
X-Received: by 2002:adf:e90b:: with SMTP id f11mr25018933wrm.248.1591089270428; 
 Tue, 02 Jun 2020 02:14:30 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id q1sm2541712wmc.12.2020.06.02.02.14.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:14:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
 "'Xen Development List'" <xen-devel@lists.xenproject.org>
References: <20200602090138.28656-1-wl@xen.org>
In-Reply-To: <20200602090138.28656-1-wl@xen.org>
Subject: RE: [[PATCH v2 for-4.14]] m4: use test instead of []
Date: Tue, 2 Jun 2020 10:14:29 +0100
Message-ID: <003701d638be$38a3d110$a9eb7330$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMAVpDG94+7TqBfX8RhE9XZuCEtz6ZwzqEg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Roger Pau Monne' <roger.pau@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Bertrand Marquis' <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 02 June 2020 10:02
> To: Xen Development List <xen-devel@lists.xenproject.org>
> Cc: Wei Liu <wl@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>; Roger Pau Monne
> <roger.pau@citrix.com>; paul@xen.org; Ian Jackson <ian.jackson@eu.citrix.com>
> Subject: [[PATCH v2 for-4.14]] m4: use test instead of []
> 
> It is reported that [] was removed by autoconf, which caused the
> following error:
> 
>   ./configure: line 4681: -z: command not found
> 
> Switch to test. That's what is used throughout our configure scripts.
> Also put the variable expansion in quotes.
> 
> Signed-off-by: Wei Liu <wl@xen.org>
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 8a6b1665d987 ("configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS")
> Signed-off-by: Wei Liu <wl@xen.org>
> ---
> v2: Address Ian's comment.
> 
> Run autogen.sh before committing.
> 
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: paul@xen.org

Yes, pretty clearly wrong in the original patch.

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  m4/set_cflags_ldflags.m4 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
> index 08f5c983cc63..23706e256b42 100644
> --- a/m4/set_cflags_ldflags.m4
> +++ b/m4/set_cflags_ldflags.m4
> @@ -15,7 +15,7 @@ for ldflag in $APPEND_LIB
>  do
>      APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
>  done
> -if [ ! -z $EXTRA_PREFIX ]; then
> +if test ! -z "$EXTRA_PREFIX" ; then
>      CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
>      LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
>  fi
> --
> 2.20.1



