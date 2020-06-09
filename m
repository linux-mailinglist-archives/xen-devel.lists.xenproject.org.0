Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC161F4183
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:56:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihXn-0004Ew-Cu; Tue, 09 Jun 2020 16:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jihXm-0004Ep-Ht
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:56:10 +0000
X-Inumbo-ID: 1dfe69d0-aa72-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dfe69d0-aa72-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 16:56:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p5so22099945wrw.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+jVS7nVhGMmjR2wZd6JnAyCPYfj4Qx6JkWv06lXyIXU=;
 b=SAqnV5iZiBHXALRNyS2MYrJxxysK7xa+3roh7XPXvDQZ2dYxbkOw9q5Px07Wou2ne5
 5gg/AANUVLKTx7eG0qqR4AEm/GzrCnzSQExXKv1EhARIs4hvK1NhFxwGRxJU3Ien8Wld
 BzlXMo0GVL4uRCV+xgcNS0BQFJ5ZEt1UmzJ9JzPb/9Z2g13kuilfnOKWo25EuytQXejS
 0Kq9cLXX08hNDUb7iQ1Saabj2CZZLCiaodfJhYx4/ISLMJN7B6Yz1T3+AW6hWjhwyGHm
 Ipnr7p1ipLtiGUPBBMXabJASIZPROsrZLXYw0egN0GA1NDUMVZvjBuq7BYI9snNAW70o
 ESXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+jVS7nVhGMmjR2wZd6JnAyCPYfj4Qx6JkWv06lXyIXU=;
 b=jioy0ri3VaohMk9cHaEsX10RWvoo3Zb/lEz3rU7mzXpQnxUbqlT6eVxZ4wcwlxkNUs
 ABvmULsIjLmguCLZdgqwy+XAzqrMdAVO7mDZDsUkRjRzlbSxCvUuRhGlZ21wZDWWhkTP
 xjiN5Aa81olSAScnsd5G3Eenn02/PULbqE/h5Y3QHk4uQI9YP4EK0fh/b2rSNbI3Up+L
 yycylq+EnGMpB6M7HwL4PlSFvo2UniYlwyXG5jQ7TITO5gL+c+jdPHSqj+2xY3pzBYUM
 vQwAiAOMQ90oGa79bAg9jpKJy91L+e7Zy8ZB/406RxgcI0lgcTOyqHkB2aoHAUadcHc2
 XAWw==
X-Gm-Message-State: AOAM5331wKNQAzZE+b4XpweRSjjSX2DKPSo6cgfcrqUZIuwf39LRJtr7
 /7R3+Yv1N8JUu+a5oKjCf54=
X-Google-Smtp-Source: ABdhPJw6q+vyrWjd1QpjmsIjW8fT1b4UmM2He3Oq8ali+vtJ9/uAng0/xGkJliIz2BVoXMZkL2vC9A==
X-Received: by 2002:adf:b348:: with SMTP id k8mr6033250wrd.157.1591721769098; 
 Tue, 09 Jun 2020 09:56:09 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id r5sm4234675wrq.0.2020.06.09.09.56.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:56:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <B965FD5D-549B-48E2-A05A-1E4D405F624A@citrix.com>
In-Reply-To: <B965FD5D-549B-48E2-A05A-1E4D405F624A@citrix.com>
Subject: RE: [TESTDAY] xl restore gives an error too soon after xl save
Date: Tue, 9 Jun 2020 17:56:06 +0100
Message-ID: <00d601d63e7e$df2eb570$9d8c2050$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLRonHjt2w8GfsetSvzpyHiuZLogqbZtxow
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
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 'Ian Jackson' <Ian.Jackson@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: George Dunlap <George.Dunlap@citrix.com>
> Sent: 09 June 2020 17:45
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Paul Durrant <paul@xen.org>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu <wl@xen.org>; Anthony
> Perard <anthony.perard@citrix.com>
> Subject: [TESTDAY] xl restore gives an error too soon after xl save
> 
> Somewhat surprising that if you save with -D, you get mysterious error messages for the next so-many
> seconds:
> 
> root@immortal:/images# xl save -D c6-01 /images/tmp/c6-01.save
> Saving to /images/tmp/c6-01.save new xl format (info 0x3/0x0/950)
> xc: info: Saving domain 19505, type x86 PV
> xc: Frames: 524288/524288  100%
> xc: End of stream: 0/0    0%
> root@immortal:/images# xl restore tmp/c6-01.save
> Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
>  Savefile contains xl domain config in JSON format
> Parsing config from <saved>
> libxl: error: libxl_create.c:692:libxl__domain_make: Domain 19505:domain id recently used: No such
> file or directory
> libxl: error: libxl_create.c:1233:initiate_domain_create: Domain 19505:cannot make domain: -3
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 19505:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 19505:Unable to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 19505:Destruction of domain failed
> root@immortal:/images# xl restore tmp/c6-01.save
> Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
>  Savefile contains xl domain config in JSON format
> Parsing config from <saved>
> libxl: error: libxl_create.c:692:libxl__domain_make: Domain 19505:domain id recently used: No such
> file or directory
> libxl: error: libxl_create.c:1233:initiate_domain_create: Domain 19505:cannot make domain: -3
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 19505:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 19505:Unable to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 19505:Destruction of domain failed
> 
> [A few minutes pass]
> 

Yes, this is because it is not 'safe' to re-create the domain with the same domid until it is deemed not 'recently used'. This
should indeed be documented.

  Paul

> root@immortal:/images# xl restore tmp/c6-01.save
> Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
>  Savefile contains xl domain config in JSON format
> Parsing config from <saved>
> xc: info: Found x86 PV domain from Xen 4.14
> xc: info: Restoring domain
> xc: info: Restore successful
> xc: info: XenStore: mfn 0xbe8d2, dom 0, evt 1
> xc: info: Console: mfn 0xbe8d1, dom 0, evt 2


