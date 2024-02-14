Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA381854CB4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680999.1059508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHC9-00075Y-1f; Wed, 14 Feb 2024 15:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680999.1059508; Wed, 14 Feb 2024 15:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHC8-00073m-Tk; Wed, 14 Feb 2024 15:29:08 +0000
Received: by outflank-mailman (input) for mailman id 680999;
 Wed, 14 Feb 2024 15:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raHC7-00072s-1z
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:29:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0ac154-cb4d-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:29:05 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so21571621fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:29:05 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x8-20020a05622a000800b0042c6c103f7bsm2086260qtw.37.2024.02.14.07.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 07:29:04 -0800 (PST)
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
X-Inumbo-ID: ca0ac154-cb4d-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707924545; x=1708529345; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0x+jTbx8fMoAuRbaxP8v0E7jzDJuyaaY44PCp8u//Y=;
        b=QiiKJpOcPe6GjVROB78/agi2tyAZJ+KpwiEsE58jIlur8lc0QAgJtpU8tNEdOF/yso
         4tEN9ffBhP/7CqeVwIdPG64CMbPXr/n8+4nS4xDzWgxvK2/jljroj7qKTa5HLikZLAZz
         5Mku+NV73ejfIcryiZ+usr2lnnypC2jnnFPRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924545; x=1708529345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0x+jTbx8fMoAuRbaxP8v0E7jzDJuyaaY44PCp8u//Y=;
        b=oDMgVYemuOhek+PlfOISOhPNFheLQ65uG656pJC0SVE9HslG3Hx5HYERt/VebIrHTS
         eOWft4CVCcEBTTiNy+eavQC2ARS8aTmrXSlaj5jGSviIoTGfVxq8imaoShzhtZ4a1Z21
         Oa9ARhsFRKcvW5LZaK6ViW+9kZpxMXfQsd9rW+IgLAaWkfLksOgAXiUd39/wy8T+teWB
         xEZvTO3Hp55glampO707hkse90VEOh+uVozFOsFGRTxKIAw6TcMcXG8L056pQWodRgxd
         ADFOIRjEmRJznb27rlutzHhag5CLuZEGNRdUOAfJi9f+I8pfjww3mSQGgNBeUtjKmZ2X
         eTpg==
X-Gm-Message-State: AOJu0Yx1eLEQ461R/8zNsjYZnpHKkGYFRrYQktTyICRdrjZKnGzcGDtV
	AlpMgy8WsVoQNb6WXVvH6Au732YoeTFRTlsHJQqF7U8rnMtS6guOO/H1fr1nMmg=
X-Google-Smtp-Source: AGHT+IGWgXFe467NBjTQNZyxtkG+dkBrckGoZ3SUMb3Cvn1fK1d2Nq0QSwV/7n2RFrGw3H3RLDEa1g==
X-Received: by 2002:a2e:7818:0:b0:2d1:8fb:1b35 with SMTP id t24-20020a2e7818000000b002d108fb1b35mr2250905ljc.16.1707924545249;
        Wed, 14 Feb 2024 07:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXig/OACCIjeXM1ftSPa+G34KJe7Nk3mTiy/Ud/aSukvWfORq7v1/LUeajVSK6KUEwFxYOcnmlUMGGhAJXh268TWERfB1S3l6FO045vHmulBEBVAYXKmrJMQhI0R/xqUV+ngnNKOOCesmxxmCnnClNh
Date: Wed, 14 Feb 2024 16:29:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Message-ID: <ZczcPhpcWuAO7OYh@macbook>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
 <ZczWAg-zmoLXiWAr@macbook>
 <ce3ae020-92b2-44fd-8055-694e374f68a9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce3ae020-92b2-44fd-8055-694e374f68a9@suse.com>

On Wed, Feb 14, 2024 at 04:08:12PM +0100, Jan Beulich wrote:
> On 14.02.2024 16:02, Roger Pau Monné wrote:
> > On Wed, Feb 14, 2024 at 10:35:58AM +0000, Frediano Ziglio wrote:
> >> We just pushed a 8-bytes zero and exception constants are
> >> small so we can just write a single byte saving 3 bytes for
> >> instruction.
> >> With ENDBR64 this reduces the size of many entry points from 32 to
> >> 16 bytes (due to alignment).
> >> Similar code is already used in autogen_stubs.
> > 
> > Will using movb instead of movl have any performance impact?  I don't
> > think we should trade speed for code size, so this needs to be
> > mentioned in the commit message.
> 
> That's really what the last sentence is about (it could have been said
> more explicitly though): If doing so on interrupt paths is fine, it
> ought to be fine on exception paths as well.

I might view it the other way around: maybe it's autogen_stubs that
needs changing to use movl instead of movb for performance reasons?

I think this needs to be clearly stated, and ideally some kind of
benchmarks should be provided to demonstrate no performance change if
there are doubts whether movl and movb might perform differently.

Thanks, Roger.

