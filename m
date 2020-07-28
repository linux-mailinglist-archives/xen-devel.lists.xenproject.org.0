Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FA230716
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MIW-0005Dz-3H; Tue, 28 Jul 2020 09:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaET=BH=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1k0MIU-0005Dr-QA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:53:22 +0000
X-Inumbo-ID: 2bfa8bf6-d0b8-11ea-8b24-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bfa8bf6-d0b8-11ea-8b24-bc764e2007e4;
 Tue, 28 Jul 2020 09:53:22 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id v21so7184639otj.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bIUEUz/EAiYRpt2WF2Gu3Ojb4mqpsyytf7cpodlW4II=;
 b=CQqRT4Hg47XRLF6tzyrfHAQjvIY+LZv/43yt7a/JNKbRATGnHrOMTV3gf3XNXzacat
 j4lsq7sLk9uKTEevI0cAp1OclUpBjMWsvEvMM3f6SIegsYLs/mRnYThdXh9PRMBNYTtC
 Lw+6G+Grdy3uaiMqmudqLMMIBT28tyPKwh3SoWzRgjrwa1YxxMr74aZjM+thdcmWIq2x
 gbN8hJrqU1LLcsS+DB5NRZktQQm6USh1zsHH97h8iyEUvKuWAshY3qiWeQ3ptLyjkLBb
 DHf1eoj3TBVmLnEXe9OW0EMSw5kKemKDAgxtbTGAbTlkKFiNQR2UbicoqFSZ4x1Hw5o9
 AgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bIUEUz/EAiYRpt2WF2Gu3Ojb4mqpsyytf7cpodlW4II=;
 b=mOIHTc9ZiSfh9sJ6JnWgSfyuX/NhceyC4PcNDoq9kwIUN+8NZTvRB3SQbtpqWNyx5P
 cp49rmIMkOZ1t0MiJAB86uFpogGpVnHFDO2FIsn5JQKT1C/Qsnzo5LAWEsoPlsCQww1X
 KHHzsQxPdFjxH5zetsoHrH+OJlyYIZ8zIaZTP9UqkgzfeyMgKrdTTvuCG+LBoQ6oepKS
 yWYcsMQ798wNBeBUx+S9kVQqVTm/884FkeEwFMaS8squIP7220woT3vTOptfTUwB5uJ2
 yQTRZ+nAeGhl5O6BMfMUsixzN68nUjgtbf9azfr0qB4aHX8JSpxnOAnNQY6dBUbNV2PA
 CsxA==
X-Gm-Message-State: AOAM532cLmxIYshHdwpyxGWu1QtTU2DjDAbaZNtXa5oHOg5FasZgetEe
 yOP1I6meU7BnVzS3kitp3dhdiOc8U+a62ilwR4G+cA==
X-Google-Smtp-Source: ABdhPJxvuQZlFISljT+BrSNAaPEtI0usqXjXhKX0zGweSLdhJcx7AtuCM7hYcsi9yHIhzUhOUeI4YgIIiqmVx7n0ny4=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr24370836oto.135.1595930001461; 
 Tue, 28 Jul 2020 02:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200728091828.21702-1-paul@xen.org>
 <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
 <32ad0742-bff2-1fbc-2f7a-d078980eb171@redhat.com>
In-Reply-To: <32ad0742-bff2-1fbc-2f7a-d078980eb171@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 10:53:10 +0100
Message-ID: <CAFEAcA84fH3aGpbrJoA6S3qJ-FjD3NZMoj0G7jqvRneH_pS6=A@mail.gmail.com>
Subject: Re: [PATCH] configure: define CONFIG_XEN when Xen is enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 28 Jul 2020 at 10:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> I'd rather uninline xen_enabled() but I'm not sure this has perf
> penalties. Paolo is that OK to uninline it?

Can we just follow the same working pattern we already have
for kvm_enabled() etc ?

thanks
-- PMM

