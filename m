Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC926C025
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:07:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITPi-0004bk-39; Wed, 16 Sep 2020 09:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7lL=CZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kITPh-0004bb-4E
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:07:41 +0000
X-Inumbo-ID: 97444864-d097-417c-a981-e1e182576cb4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97444864-d097-417c-a981-e1e182576cb4;
 Wed, 16 Sep 2020 09:07:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z4so6083321wrr.4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=8bNBCF4Lqdq6zeW2axoKSLv8rD4+9u6hCtOgBbLGjU4=;
 b=GH+IumZi5sEoCkOmjxWs9h69pwadUffz5FH/IBQ/95zywpQbnXDT6cjG7HC42ygZsD
 zNX7HH9ZLr6qgsCm5CC7po63O2t8Lz2ulv9/JpN4r36ji7FLEfZVTIHDyqtRjah2kqyB
 P6RCJPOZwQfyllO2ZtoTnotNTn6lLv5Izo3rqFlEDJ3wTYIgCf1AqNr4Pd3A4Bd2hNYt
 PeA53E/CG5OJZZKlJaspJ2y9GnepiIQcO/LBbmLVxcAbmqN88R1r26L7PhNzwRXqS3Se
 Rg87cX9ynSripR6qrkK6e02E3UVN9e/V/RKBkF/jVLDhuTbaSA8sTX1iPqqUFdep8WPt
 8apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=8bNBCF4Lqdq6zeW2axoKSLv8rD4+9u6hCtOgBbLGjU4=;
 b=jWUXFrIHdQwxiw07Qnh1cAZaVgSmi45T4AVIIck5JfxTMDeN4DSSdjF2If4MIQIhaC
 bqkSLnDOahzPJTTQZgVf71yCk0FCa076a6VfwrxB6vNCE+8LGO9rTkH5I/5eXeN0ZhbI
 4Xx8/C6AHlggsFX7RRLV8W7WMuPDia3aX1Fk+B1kqOIWo7aacMMeorMPyJPqjkHlDdNw
 +XprxEY8EOJfB9xFG5i/zccQowsM+U3caHRpKUTX3j240SvuZFgAsHr823uA9eeGu+jq
 8LmE4JkgsRByaDbkCUhPYiLNchmcwdB/yXaGJCg77mI8Iqp9UL/FB0xyfi3swUYhW4ey
 89/g==
X-Gm-Message-State: AOAM533dctFqII0P2hmiHrkSifSNARzAOPeBKJcOYlPBki9nc0UYGdgQ
 rw7sAbh/r73kxYkgg0tvdnY=
X-Google-Smtp-Source: ABdhPJxiRSnElSAlXQFBSrJyT0rPj2qsAnIfxZCC3Ddp5RQwhrLZpGkFatqVoETcyWK9gQLD46ePcQ==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr27443985wrn.175.1600247259585; 
 Wed, 16 Sep 2020 02:07:39 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id j26sm1095600wrc.79.2020.09.16.02.07.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 02:07:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Julien Grall'" <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
In-Reply-To: <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
Subject: RE: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
Date: Wed, 16 Sep 2020 10:07:38 +0100
Message-ID: <002a01d68c08$d3895c70$7a9c1550$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwM3mpe2Aj4RmJGoyqB/QA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 16 September 2020 10:04
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant
> <paul@xen.org>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien
> Grall <jgrall@amazon.com>
> Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
> 
> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> > @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
> >
> >          new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> >          new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> > -        cmpxchg(&pg->ptrs.full, old.full, new.full);
> > +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
> 
> But the memory we're updating is shared with s->emulator, not with d,
> if I'm not mistaken.
> 

You're not mistaken.

  Paul

> Jan


