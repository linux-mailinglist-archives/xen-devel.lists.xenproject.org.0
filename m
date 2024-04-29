Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0E8B5BEC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 16:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714120.1115134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SKF-0003HZ-UG; Mon, 29 Apr 2024 14:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714120.1115134; Mon, 29 Apr 2024 14:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SKF-0003F0-RQ; Mon, 29 Apr 2024 14:49:51 +0000
Received: by outflank-mailman (input) for mailman id 714120;
 Mon, 29 Apr 2024 14:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SKE-0003Eu-CF
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 14:49:50 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba13d23c-0637-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 16:49:49 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-439dfa27003so26288431cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 07:49:49 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 m3-20020ac86883000000b004365bc5b9a2sm10418902qtq.33.2024.04.29.07.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 07:49:47 -0700 (PDT)
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
X-Inumbo-ID: ba13d23c-0637-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402188; x=1715006988; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQVwmGnw4AtV/5ML7zk73UyIDJQUeLuqoYN0ypngkvk=;
        b=tCkcgqSOD1De91iGnNDu/QGTvluJknu4x+4PqEeVE+5+PP/Tr7lv8hGCze0FawdIjH
         ER7crBFSC6N9JsVwPwj2QFbN4pr5TNYF/mqCsgxVNULfJ8tY+svh1QmUTgVgjTnPUHgn
         M/uxfH7Zmr4otvGOxrdIRAZGd1VAUUVThw7sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402188; x=1715006988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQVwmGnw4AtV/5ML7zk73UyIDJQUeLuqoYN0ypngkvk=;
        b=rPIiAE6EsxBkTnVYct2pRZfq/LZxx7+Cf5lcDzaKGG2FJmK8A1iXnFKuZ9kfSblJ9m
         +4aSkbPc8ujZZt9d+ktlAdi7XdcKqDLcv5lwdyFJtoGHdOc30fMcaL7+1kiqmDkDkoe2
         igyqlZknSk2hP0ba7/2EdlU4fkPfAdrSPLFlHCvcqaoTbtbt0oo7SoZ49ODHTVIVferY
         dwX2o/B7fgmkPHaFR/RwY3X+GMjjOvFr1jN9gMxg+6Wd35fCgZaLO2oF2T/vTxrszHmH
         NUvHmYJmEF7UYRyMqLjZykjZnSp1XihG+e65orwno+ZmFIWiyVsxojPsubHYEW1OoQuc
         WqJA==
X-Gm-Message-State: AOJu0YwEbMv19pIBwC5xPEONQrOHAGf3WRXjHjZ6O5RawBh+mijSTUlT
	aOshLO0UQRidtuUY41eJ+4mwQ+7SdiFd8lrZG2XUvMUscULgPUpqpfgDB/P7dds=
X-Google-Smtp-Source: AGHT+IG8MjdwnaQGJ1Sp4lZVMFzY9Z3ixMbiTVrFlWwL7A6BkY+WVrO6QCDX+3FW7EmIO0SbHxvxug==
X-Received: by 2002:a05:622a:344:b0:43a:7660:2114 with SMTP id r4-20020a05622a034400b0043a76602114mr8575280qtw.6.1714402188021;
        Mon, 29 Apr 2024 07:49:48 -0700 (PDT)
Date: Mon, 29 Apr 2024 16:49:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@cloud.com>
Subject: Re: [PATCH] revert "x86/mm: re-implement get_page_light() using an
 atomic increment"
Message-ID: <Zi-zidVJKYAMKjzG@macbook>
References: <f54c05d4-b61d-4e26-8e93-6e1bdc22a1d4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f54c05d4-b61d-4e26-8e93-6e1bdc22a1d4@suse.com>

On Mon, Apr 29, 2024 at 03:01:00PM +0200, Jan Beulich wrote:
> revert "x86/mm: re-implement get_page_light() using an atomic increment"
> 
> This reverts commit c40bc0576dcc5acd4d7e22ef628eb4642f568533.
> 
> That change aimed at eliminating an open-coded lock-like construct,
> which really isn't all that similar to, in particular, get_page(). The
> function always succeeds. Any remaining concern would want taking care
> of by placing block_lock_speculation() at the end of the function.
> Since the function is called only during page (de)validation, any
> possible performance concerns over such extra serialization could
> likely be addressed by pre-validating (e.g. via pinning) page tables.
> 
> The fundamental issue with the change being reverted is that it detects
> bad state only after already having caused possible corruption. While
> the system is going to be halted in such an event, there is a time
> window during which the resulting incorrect state could be leveraged by
> a clever (in particular: fast enough) attacker.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

