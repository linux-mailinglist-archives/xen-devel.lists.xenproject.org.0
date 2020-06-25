Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E6209A36
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 09:03:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joLus-0004Df-DQ; Thu, 25 Jun 2020 07:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bJ+=AG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joLur-0004Da-3s
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 07:03:21 +0000
X-Inumbo-ID: f38b0644-b6b1-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f38b0644-b6b1-11ea-bca7-bc764e2007e4;
 Thu, 25 Jun 2020 07:03:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so4451918wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 00:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Ffp6vk9DWgyyb4JWQlJnOhmIiqEep57Li3Os6i2clXI=;
 b=gip3A8czL1UymoXE96iV0phAm0/m0iqBwYNf4u+EFtQ9+z4TwcbG/QQY9TDiQSFOa4
 3fCtkRb3Esz+d6AeX0JgLMnKWfazhfH9BQx1GSjeBFqi4FI4gwdhFxxqACkdHczqyImb
 MKm4aAVHNQ6P/0CXaIvSWmpxPq/SMSTEFm718NWGOmFJeg0qiZxQvR/4qu4u7O+No9MW
 sgidJEbHBsvPzQPYAXLJLhoxnFPsO5JBAUgTFKMfKN/LaiWExxYd+2I42YHAAe2rYjyN
 dnDj+NZgHfdYiGgkFNSs2GMKVC9bUij3iADE8RJfv1AHXLkkmP7NGHhlvGeF8gDjVNj6
 5htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Ffp6vk9DWgyyb4JWQlJnOhmIiqEep57Li3Os6i2clXI=;
 b=uZ3HHjQSTnJ5Kn+F96erCav04yneFO8wE0K+zdTZCMUYDoTAe3NbCUcBD2yv7bIYx5
 Qg/qAydm+cDZP2G6rG7DhkbYY/Uds9Wiez0vL/dVn9xoFcaHHxfzJDkn4AUYnErp9qUS
 yjtTr5ffYcPKyelCgDBQXkFlg5PeP0l+qL+Ogw9OSZnkY8c6WQNVXuQyoQqQ6mVtZ9Is
 nEpn/XkODljI4Jf2o8RO+iAioJNryGcA/0PyrXTERJy4t5v31Ar4vnHTqsri8iaj9npw
 DHbVyEn/8ycXlAESfmTaoGCgqXrAXRCTxmLjxiuwtVFI60ptqJZf81EBKc5E6hdGqahY
 5wlQ==
X-Gm-Message-State: AOAM531yYd/Gdkkc0NBIGGmC55WC0pYfXmvFRP6OKplJTEhSfYxfHqRn
 U0O5NGbODvPrlYzEOknc3/I=
X-Google-Smtp-Source: ABdhPJxLR87+GuFn6T6t7fpAoLDZCtIAFt/+DaCbFEQ8p/TinVIq+lPIJCT+mkQQEKjpzlLEQdzwQw==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr1830017wml.65.1593068599553; 
 Thu, 25 Jun 2020 00:03:19 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id n8sm27072610wrj.44.2020.06.25.00.03.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 00:03:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>	<20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>	<fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>	<4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>	<814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>	<CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>	<20200512195005.GA96154@mattapan.m5p.com>	<049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>	<20200512225458.GA1530@mattapan.m5p.com>	<24253.9543.974853.499775@mariner.uk.xensource.com>	<0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
 <24307.32018.502303.817846@mariner.uk.xensource.com>
In-Reply-To: <24307.32018.502303.817846@mariner.uk.xensource.com>
Subject: RE: [XEN RFC for-4.14] Re: use of "stat -"
Date: Thu, 25 Jun 2020 08:03:17 +0100
Message-ID: <000201d64abe$b4ab86b0$1e029410$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQD9L7QdWbiS7yjvIZuWryR1qUi3DAIffsZsAXaO/qwBr8ysOQGBdD/EAyVLdE8CJhcjaQKGFSQfAwf2ZywCggq8zwIiPKyoAIo7x5+p5KOqMA==
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
Cc: 'Andrew Cooper' <Andrew.Cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 'Wei Liu' <wl@xen.org>, 'Elliott Mitchell' <ehem+xen@m5p.com>,
 'Jason Andryuk' <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 24 June 2020 17:20
> To: Jan Beulich <jbeulich@suse.com>
> Cc: Elliott Mitchell <ehem+xen@m5p.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Jason Andryuk
> <jandryuk@gmail.com>; Paul Durrant <paul@xen.org>; Wei Liu <wl@xen.org>; xen-
> devel@lists.xenproject.org
> Subject: [XEN RFC for-4.14] Re: use of "stat -"
> 
> Jan Beulich writes ("Re: use of "stat -""):
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified
> the sender and know the content is safe.
> > On 14.05.2020 13:02, Ian Jackson wrote:
> > > I've read this thread.  Jan, I'm sorry that this causes you
> > > inconvenience.  I'm hoping it won't come down to a choice between
> > > supporting people who want to ship a dom0 without perl, and people who
> > > want a dom0 using more-than-a-decade-old coreutils.
> > >
> > > Jan, can you tell me what the output is of this on your ancient
> > > system:
> > >
> > >   $ rm -f t
> > >   $ >t
> > >   $ exec 3<t
> > >   $ stat -L -c '%F %i' /dev/stdin <&3
> > >   regular empty file 393549
> > >   $ rm t
> > >   $ stat -L -c '%F %i' /dev/stdin <&3
> > >   regular empty file 393549
> > >   $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> > >   $
> >
> > $ rm -f t
> > $ >t
> > $ exec 3<t
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> > $ rm t
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> > $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> >
> > > Also, the contents of the file "u" afterwards, please.
> >
> > Attached.
> 
> Thanks.
> 
> I think this means that `stat -' can be replaced by `stat /dev/stdin'.
> 
> This script is only run on Linux where /dev/stdin has existed
> basically forever.  The strace output shows
>   stat("/dev/stdin", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
> and the transcript shows that your stat(1) behaves as I hope.
> 
> Jan, will you send a patch ?  It is best if someone else but me writes
> it and tests it because then I am a "clean" reviewer.
> 
> Paul, supposing I review such a patch and say it is low risk, and we
> commit it by Friday, can it have a release-ack ?
> 

In principle yes but, given Jason's response, it doesn't sound like we have agreement on what the final patch will look like yet.

  Paul

> Thanks,
> Ian.


