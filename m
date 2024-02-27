Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D9868EA8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686011.1067515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revWA-0006Dn-H4; Tue, 27 Feb 2024 11:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686011.1067515; Tue, 27 Feb 2024 11:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revWA-0006BR-ED; Tue, 27 Feb 2024 11:21:02 +0000
Received: by outflank-mailman (input) for mailman id 686011;
 Tue, 27 Feb 2024 11:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revW8-0006BL-Dc
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:21:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47f65cba-d562-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:20:58 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412949fd224so21471725e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:20:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x9-20020ae9f809000000b00787b95c91d3sm3491227qkh.62.2024.02.27.03.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:20:57 -0800 (PST)
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
X-Inumbo-ID: 47f65cba-d562-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709032858; x=1709637658; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1Cub/YqSvCVVFtSPnLaVSR7dkwlBhVODg+6zhlKa/I=;
        b=t2Lv543V+2rL3uFjeRuJNExN9duTwwJTPtzL9UNofmzFYpvi07+JX8DmUEPW+Fgtg8
         V0y0Y/99ey+ejpdrZSHcwBvD9GPLcrXo2QyayfIyDPBp2h+1VVEkLlWINlVNHyQx+l3o
         bIwv8azBO/myA9PcOVhLPaIZZfz7WvRM3UpbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032858; x=1709637658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Cub/YqSvCVVFtSPnLaVSR7dkwlBhVODg+6zhlKa/I=;
        b=SUFty4WxWM44keB4kderracbCojHx68hVS7ANB5TSYS1gdoEs6Ce5Gw0l67EgKWR4d
         QVEy6zzekfl+/O0pAlVOPA6ekYSKueJPjGugOKoJu0Lb+5rg6KQ2Vn2uowD5wJGzyeQC
         ESQJzlOulW8CgOaejyKwIBEE4sCpHhB1FyV1lEkHtyzcD6WBhXWuJn9se73jO1K9ZIPN
         ZIB1I7iyAq/8keuOsVKUPbEWBz2OyKNC2xTXTOg72QD7ckLm6eflcdlT05+LhZ4YzSBT
         6OllXN+7n3gvC/k99HxcDsI8r+0tsUfFUk2C1DTgMJdMDT05kPHTkWwiuwI7b9hmHNKX
         aRyA==
X-Forwarded-Encrypted: i=1; AJvYcCXwi1oSLibWCj6u6kT2zVRFOEsmG0ui5cCXDdkFDDSxekU9BBe3e1Ey2qZVSYTaVxcH5iL3+ujRZkSsxk/na4wrbNp+pEaS2Rp1uQDLkGw=
X-Gm-Message-State: AOJu0Yyij/uQM6wChz8g2loqhF7kvc2GOfW+vqTr5VPp3ZynbQ8x9bac
	OPuXTnddSod9OGjcCg4PKw022BKbVZZKKIeZbEL0qb2EZco6TEdLnCuzLVcZwfw=
X-Google-Smtp-Source: AGHT+IEw7clDteVMfPNJHdusSpmUghVqFMUpYTerFucgttEF8M+ih7uJaB1UCbtl74wm0gooEeEL1w==
X-Received: by 2002:a5d:4701:0:b0:33d:9d49:cfe2 with SMTP id y1-20020a5d4701000000b0033d9d49cfe2mr9040748wrq.21.1709032858007;
        Tue, 27 Feb 2024 03:20:58 -0800 (PST)
Date: Tue, 27 Feb 2024 12:20:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/spec: do not print thunk option selection if
 not built-in
Message-ID: <Zd3Fl6nx-R4aq2wR@macbook>
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-5-roger.pau@citrix.com>
 <30e1bfea-d76b-4e3d-b148-f25d1c811f8d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30e1bfea-d76b-4e3d-b148-f25d1c811f8d@suse.com>

On Mon, Feb 26, 2024 at 01:54:54PM +0100, Jan Beulich wrote:
> On 26.02.2024 12:07, Roger Pau Monne wrote:
> > Now that the thunk built-in enable is printed as part of the "Compiled-in
> > support:" line, avoid printing anything in "Xen settings:" if the thunk is
> > disabled at build time.
> 
> Why "Now that ..."? It's other logging the earlier patch adds there.

'Now that ...'  would refer to patch 1/4.

> > Note the BTI-Thunk option printing is also adjusted to print a colon in the
> > same way the other options on the line do.
> > 
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> With either a clarification of what's meant or e.g. s/Now that/Since/
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

'Since' is likely more appropriate.

Thanks, Roger.

