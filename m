Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EF5104D3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 19:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314074.531970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njOaS-0006sj-On; Tue, 26 Apr 2022 17:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314074.531970; Tue, 26 Apr 2022 17:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njOaS-0006qt-Lj; Tue, 26 Apr 2022 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 314074;
 Tue, 26 Apr 2022 17:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz8a=VE=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1njOaR-0006qk-Cg
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 17:02:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b43beedf-c582-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 19:02:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id s21so11654983wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 10:02:50 -0700 (PDT)
Received: from [192.168.15.219] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1c4c06000000b00392b49c7ad4sm11609653wmf.3.2022.04.26.10.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:02:49 -0700 (PDT)
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
X-Inumbo-ID: b43beedf-c582-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:from:subject
         :content-transfer-encoding;
        bh=QgGA29WYYss0uXnrZthmQcUKUJ5ool5DKmGzaQtvt7E=;
        b=AYtMUeMpCbkxR6IZ25vCX9hRC6af9ygPQno9E7h1YG7LA5JzHwQ3EHSdP2QGJX/UqV
         u7CY6ntoATzwnoyCPdimbQjKGOcTpVCCnLCqwSwcS2QEh/CsYxBum4Qd03diD5hnUU2X
         H/4QAsyrBKPZ2OQB/Izd3/BIUE5fNACljiTH4TxqxO8BWRPecF5o+a+Wuw3z+fKVndJY
         0g320z52SUK7qZT3pYY5IE1jkKMrVF2uHdSAl17TmBmlJ+f3TAk72Arz0JtLoij5aPdI
         d7ct+zd6a9QcI5zaDK3TE16fYQRKUCK7ZXZPgGvlCQF90hbE4BmVj8KQR6DRuQHIN8ST
         0YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :from:subject:content-transfer-encoding;
        bh=QgGA29WYYss0uXnrZthmQcUKUJ5ool5DKmGzaQtvt7E=;
        b=cJvc6LMaagIhJO8VG3INX0q8hI67pqCwPYjwrAi6BNIKf60FG08xa8wy3i5QkQ1piy
         AHRh9aEGvBDre8E3Hn8mMUikz42GVYL+T3/+cuA2A9IsVTK43foUmKDwy7cuV16d1GQo
         aQESKIJqJ5Z9mxGI4IRO2xilvKgB83oHPH+NY3xdXJWNSeTDw3LwuvEByA3WzOgoJ5SU
         xkt0Pc8RwWY+F/m2fet5s2v0Nk8M1hK3OvCD3hndH820sGuKNJUKDGeGuOzqSHF0hgPi
         K7rGwbT77/OWqdjRmhwKbq/7tw50HSl4c0TN712bY9HwT0M15JhbSscEOcq2QThtUZxU
         Blug==
X-Gm-Message-State: AOAM533hCK2GFuzWiEXx2OeOaD+A2yCf+7PH7fX8A9moCmUvBMS9LtUv
	2coQVllesIfCKkh0rMa/mr8Ql8vnZ/wCqQ==
X-Google-Smtp-Source: ABdhPJx/FrZSa50T8fmwAMPz4mUtT5p7EdOg4Ki77fof+NAxQL5w1AiyEBK7qqQv+u3dQ1VcLWZKbQ==
X-Received: by 2002:a05:6000:1a44:b0:20a:ccde:c139 with SMTP id t4-20020a0560001a4400b0020accdec139mr16390537wry.320.1650992569536;
        Tue, 26 Apr 2022 10:02:49 -0700 (PDT)
Message-ID: <eb024e77-17f4-cc89-f621-a9d5b879c184@gmail.com>
Date: Tue, 26 Apr 2022 18:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
From: Raphael Ning <raphning@gmail.com>
Subject: [cxenstored] Potential bug in special watch event firing
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While reading C xenstored code, I noticed that it may send special events like @releaseDomain to (privileged) clients that only watch the root node (/). That's probably not the intended behaviour.

For example, when firing @releaseDomain, fire_watches() is called with exact == false:

https://github.com/xen-project/xen/blob/2419a159fb943c24a6f2439604b9fdb1478fcd08/tools/xenstore/xenstored_domain.c#L234

As a result, it will check whether @releaseDomain is a child of the path being watched:

https://github.com/xen-project/xen/blob/2419a159fb943c24a6f2439604b9fdb1478fcd08/tools/xenstore/xenstored_watch.c#L195

And when the parent path is /, is_child() unconditionally returns true:

https://github.com/xen-project/xen/blob/2419a159fb943c24a6f2439604b9fdb1478fcd08/tools/xenstore/xenstored_watch.c#L66

The xenstore documentation is not clear about whether @<wspecial> should be considered children of /. But I find it counterintuitive that clients may be notified about a special event without explicitly subscribing to it. Is it a bug?


Thanks,

Raphael


