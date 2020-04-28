Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43D1BBDAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 14:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPPt-0003ZI-He; Tue, 28 Apr 2020 12:32:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTPPs-0003Z9-95
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:32:48 +0000
X-Inumbo-ID: 5dbdd28c-894c-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dbdd28c-894c-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 12:32:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j1so24451672wrt.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=m6zv80HQf6wTcYQSdLFqcBDzcXmAOK9wtyk4ase4ObY=;
 b=UYkOlWR7pmh9AitmIVOtSNLHPamv1uvz2vG8OGwJCys6mr5J5au5MGwKWkJUUdByz+
 TdH6xseGDAuMaBCR3mP6ZVDWTih1nJNteqk0YAhU4KWnCd2vf5Jby+NRPtw8aZKzFDJv
 2NCxN8zCzpg7UAA+qRKzQGOlzWLdc3LE2grMIoEicWDfRMNsAtPYR3t2Ac7fFq5yWHnZ
 AjJJX6IDkGYXwzHpxdK5EaxeAtNK6J05O3OMbzNlcV6x8yVEAnFw+P1EijYYRwwQ4aEi
 O2JtYP086wTMIqMDWHqgtCbVwKDTj++PbfqsBl6YcM/De/CEGuurUx4grLlLp7wy5uVB
 ou9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=m6zv80HQf6wTcYQSdLFqcBDzcXmAOK9wtyk4ase4ObY=;
 b=KgnslLPiA5GIgGiFg8J3N2l50LRtzw1XKE0D6ZrDpTuD2uueimnfUJayP9vezx7g6W
 eupAXxspMm9LJwdxpynNKupUPWB3Iko+V8Fd8vH9veMVF1UdwYxKN15H3gm5ZToOxPQ0
 D80gI1Gm00Yy8YTaQVo0wCr7XCoEgNwmoaG0D3AY8ldW4ooln7qWEF3I/XZls4faghXH
 pDS09x7B+C6ZQ870ljw3h6LBIbngGir8C9ht0H3gWVn6xVSJUL7B1juaftTZ6SKvu9Zd
 du3/K81SxWY381LouyJYhChHqDsWNrxL5Mdk0BAevA7mrV3eJbfDf/Wgy58YFlNWOWqQ
 +KPg==
X-Gm-Message-State: AGi0Pub+qAm/fSNCaq1c1w9J02DL/9LUjk217mPH8fYl8fXk11GjXE+D
 y1mZcHVSiRJqKPkVp3XDLfw=
X-Google-Smtp-Source: APiQypI7gTYIM6odIWFB8N/KeFsoFgmr4S2wZyu5Gyw0XqI1rYMkdIh9CrcJhU1Y0HSwF5rnO2i7ZQ==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr32848766wrw.389.1588077166799; 
 Tue, 28 Apr 2020 05:32:46 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id t16sm3069026wmi.27.2020.04.28.05.32.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 05:32:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Artur Puzio'" <artur@puzio.waw.pl>,
 "'Grzegorz Uriasz'" <gorbak25@gmail.com>, <qemu-devel@nongnu.org>
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
 <000001d61d34$6c0218f0$44064ad0$@xen.org>
 <90a8b709-c506-92e2-800c-e1558f18df94@puzio.waw.pl>
In-Reply-To: <90a8b709-c506-92e2-800c-e1558f18df94@puzio.waw.pl>
Subject: RE: [PATCH 1/2] Fix undefined behaviour
Date: Tue, 28 Apr 2020 13:32:44 +0100
Message-ID: <000901d61d59$1edbe270$5c93a750$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZJJhe4DhOB0QFT+Ee5i7aNCDcTgF4qWDWAdBYvl8CjAnLpqdZwHhQ
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, 'Anthony Perard' <anthony.perard@citrix.com>,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Artur Puzio <artur@puzio.waw.pl>
> Sent: 28 April 2020 10:41
> To: paul@xen.org; 'Grzegorz Uriasz' <gorbak25@gmail.com>; qemu-devel@nongnu.org
> Cc: marmarek@invisiblethingslab.com; jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; 'Stefano
> Stabellini' <sstabellini@kernel.org>; 'Anthony Perard' <anthony.perard@citrix.com>; xen-
> devel@lists.xenproject.org
> Subject: Re: [PATCH 1/2] Fix undefined behaviour
> 
> On 28.04.2020 10:10, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Grzegorz Uriasz <gorbak25@gmail.com>
> >> Sent: 28 April 2020 07:29
> >> To: qemu-devel@nongnu.org
> >> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> >> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>;
> Anthony
> >> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> >> Subject: [PATCH 1/2] Fix undefined behaviour
> >>
> >> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > I think we need more of a commit comment for both this and patch #2 to explain why you are making
> the changes.
> >
> >   Paul
> 
> I agree Grzegorz should improve the commit messages. In the mean time
> see email with subject "[PATCH 0/2] Fix QEMU crashes when passing IGD to
> a guest VM under XEN", it contains quite detailed explanation for both
> "Fix undefined behaviour" and "Improve legacy vbios handling" patches.
> 

Ok. Can you please make sure maintainers are cc-ed on patch #0 too.

  Paul


