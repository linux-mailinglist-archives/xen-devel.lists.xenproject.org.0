Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C811BBDAE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 14:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPQa-0003g8-SA; Tue, 28 Apr 2020 12:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTPQZ-0003g1-DD
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:33:31 +0000
X-Inumbo-ID: 776bcf54-894c-11ea-9887-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 776bcf54-894c-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 12:33:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u127so2670156wmg.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xS+yLt7ge8xiOU6IbkcdYZBC50HgTxf9aJlIZ1nJYHo=;
 b=pwXMbRm965oGRSmqS9QK6ybMcOArhlrKCxr6DUbrardiaOo/WWT13yRtOgrbRol+zY
 fl8GqfcIV7wsXMVM2uX8XxUhi6emqs5bILfBJklf0XHrf6fGiM0qLEMoQjZbhevdJqaG
 cYmuGk2qAPtONV4+MKK5x6/G5G5S0wXtp9OmXak/eWwzEldSUyWK+7tPMy5NcYw6HwVZ
 0Ije/o8dTJ3zSrPQtcEdse7cXhCTxrL280SYxqoHc+kruGRkU1aS3vugv/5KYAfu17Pc
 eidJoS07uuovyaJnoVWpW2pEV82hHKTKCFg4O5mDl/50yPoOkje/1qiQFdzgtpGJX1Yh
 Rung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xS+yLt7ge8xiOU6IbkcdYZBC50HgTxf9aJlIZ1nJYHo=;
 b=uVWaHnIEh1DJ/9HEIcJRgUWjCCU+NTeUEuQl/RHfLBn0DQ6zO2mlOXjwVrvAFWginv
 z9xMLXmI92qiJRamWqJysuRSWHF6pSAFl+aikCPoxgbZ4uvmsyT3GYJSiLHsUrBd0SbP
 lGVXUISeOVmrgI7+3bcOVDZ97EaPEoApeYMd2QHTq9oOnkhGsdr3zzUN3Vnm+Owd++Yi
 RZEqGjWLEtHRqA/CN6HvIUxXUfaOL0uolQLsbGFbeukEx/larU+s+FpG1JFPJL6Cocww
 /6VcTdaKQJi6GHWXvk3/4Wp8xkjPlg0mASCRU4mnMmtpdYReHu8J90sXdqC1noGiq+kP
 V6Qg==
X-Gm-Message-State: AGi0PuZUesC0Zk3skuuTj2wQ40eGkHmoQrPU6b3XFqJu6A/7GSyJpLCc
 imToz1ZwYDzzMtlSI561QW8=
X-Google-Smtp-Source: APiQypJb9wVCnw5brzV8/l7uPCSh68KOalMqsEymBwz9CA88NFzc/Eqb4BKGTikR72h8Jw8/LAix7Q==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr4291826wmc.123.1588077209864; 
 Tue, 28 Apr 2020 05:33:29 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id t67sm3404801wmg.40.2020.04.28.05.33.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 05:33:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <paul@xen.org>, "'Artur Puzio'" <artur@puzio.waw.pl>,
 "'Grzegorz Uriasz'" <gorbak25@gmail.com>, <qemu-devel@nongnu.org>
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
 <000001d61d34$6c0218f0$44064ad0$@xen.org>
 <90a8b709-c506-92e2-800c-e1558f18df94@puzio.waw.pl>
 <000901d61d59$1edbe270$5c93a750$@xen.org>
In-Reply-To: <000901d61d59$1edbe270$5c93a750$@xen.org>
Subject: RE: [PATCH 1/2] Fix undefined behaviour
Date: Tue, 28 Apr 2020 13:33:27 +0100
Message-ID: <000a01d61d59$38898600$a99c9200$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZJJhe4DhOB0QFT+Ee5i7aNCDcTgF4qWDWAdBYvl8CjAnLpgJCzKCMp0eqVnA=
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
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 28 April 2020 13:33
> To: 'Artur Puzio' <artur@puzio.waw.pl>; 'Grzegorz Uriasz' <gorbak25@gmail.com>; qemu-devel@nongnu.org
> Cc: marmarek@invisiblethingslab.com; jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; 'Stefano
> Stabellini' <sstabellini@kernel.org>; 'Anthony Perard' <anthony.perard@citrix.com>; xen-
> devel@lists.xenproject.org
> Subject: RE: [PATCH 1/2] Fix undefined behaviour
> 
> > -----Original Message-----
> > From: Artur Puzio <artur@puzio.waw.pl>
> > Sent: 28 April 2020 10:41
> > To: paul@xen.org; 'Grzegorz Uriasz' <gorbak25@gmail.com>; qemu-devel@nongnu.org
> > Cc: marmarek@invisiblethingslab.com; jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; 'Stefano
> > Stabellini' <sstabellini@kernel.org>; 'Anthony Perard' <anthony.perard@citrix.com>; xen-
> > devel@lists.xenproject.org
> > Subject: Re: [PATCH 1/2] Fix undefined behaviour
> >
> > On 28.04.2020 10:10, Paul Durrant wrote:
> > >> -----Original Message-----
> > >> From: Grzegorz Uriasz <gorbak25@gmail.com>
> > >> Sent: 28 April 2020 07:29
> > >> To: qemu-devel@nongnu.org
> > >> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> > >> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>;
> > Anthony
> > >> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> > >> Subject: [PATCH 1/2] Fix undefined behaviour
> > >>
> > >> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > I think we need more of a commit comment for both this and patch #2 to explain why you are making
> > the changes.
> > >
> > >   Paul
> >
> > I agree Grzegorz should improve the commit messages. In the mean time
> > see email with subject "[PATCH 0/2] Fix QEMU crashes when passing IGD to
> > a guest VM under XEN", it contains quite detailed explanation for both
> > "Fix undefined behaviour" and "Improve legacy vbios handling" patches.
> >
> 
> Ok. Can you please make sure maintainers are cc-ed on patch #0 too.
> 

Actually they are, sorry. My MUA is playing tricks on me.

  Paul


