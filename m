Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6561490C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 12:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433442.686400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppU9-0007vj-Aj; Tue, 01 Nov 2022 11:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433442.686400; Tue, 01 Nov 2022 11:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppU9-0007tf-7w; Tue, 01 Nov 2022 11:31:13 +0000
Received: by outflank-mailman (input) for mailman id 433442;
 Tue, 01 Nov 2022 11:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB22=3B=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1oppU6-0007tX-QA
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 11:31:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc83830-59d8-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 12:31:05 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id 5so8689878wmo.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Nov 2022 04:31:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c6b7f5567csm1860167wmq.0.2022.11.01.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 04:31:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29C4E1FFB7;
 Tue,  1 Nov 2022 11:31:03 +0000 (GMT)
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
X-Inumbo-ID: abc83830-59d8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Gwj+KeVcMKcKQsIbe887gWwyMnAmJOUQ2Xug3392E=;
        b=P6PZjdiM+qVmj8ifokapnJ0O85Cpi0z8a3AnsFf/eXW7GRR4YEQg65+f6JuX9HqkTk
         rGxPOO7Bj3m3WLToJ5inAQKfzrLyS1yLrRw/zeRGFDHJB1xOM5zJT5x85gu3aHHSZZch
         utntvjrbRln7F5zcQofHW0BMSKRak1FAE0u9/duJxmjPtwbYWmwUkRSQ4OrkVOXWOesl
         Gj5bVA1jiABEnOB2+mg/XRPqAOcp2M+mXVZsl6FIIfgeXpeHxm7ziDOExU8yXhcxQqLg
         6z/sZyTNuc0f6YSFgp3zG0FEoCY+WkMpw+F93YzxCfAJvE1NgkEdYzjoOc1fpqds8eXe
         z15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0Gwj+KeVcMKcKQsIbe887gWwyMnAmJOUQ2Xug3392E=;
        b=p/+g3oW73A+mjkDA+YDcOBxuf6Iy7kea5/kIk5wZrGBXzyToFlzEqmngc/OkUs5y9s
         sQYybJ2Nb6cT81McgpIkcuJNWJCCOR/9/oHQAJKqeUCRjMjRoxvQwvgOkSgm2a9oRgxh
         ESDq7UFn5TnfiqAVjzCrBhxYDJvl67hfrDyon2SnC8oKnVF8tCa+u+xZKHEuIxUXfoBs
         GWYIW8Mg2OVb0DjtSi5EKjr17juj163RdQHZgqcP9Z6z+eqHDrv1ibHNyB/7pDgh428x
         diXcyFtGXUzzPlFPQKINXMIhiZvfs/xb+46TMqS1J1TJNE3MCKL6w9TE/MOZM3TSr93c
         L17g==
X-Gm-Message-State: ACrzQf0lWMFvjEqy5cqYVCHWJEbPajr6yJoD3gCkZtpkwiNVYTpP8SSZ
	7qPKKxoCGciibYPc4FMwrFpwvw==
X-Google-Smtp-Source: AMsMyM5o0tJvfqIBKDk20jbvxUN/qzPCBYCI8jWf41WcQUsgAdoz5Pi9lOd/2xFvWmS+JJHQAY5UNQ==
X-Received: by 2002:a1c:7207:0:b0:3cf:8115:b39a with SMTP id n7-20020a1c7207000000b003cf8115b39amr1287369wmc.80.1667302264398;
        Tue, 01 Nov 2022 04:31:04 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
 <87pmed1uww.fsf@linaro.org>
 <MW3PR12MB44094F971904ED24E1AC67939F359@MW3PR12MB4409.namprd12.prod.outlook.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Garhwal, Vikram" <vikram.garhwal@amd.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Date: Tue, 01 Nov 2022 11:29:03 +0000
In-reply-to: <MW3PR12MB44094F971904ED24E1AC67939F359@MW3PR12MB4409.namprd12.prod.outlook.com>
Message-ID: <87iljylxmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


"Garhwal, Vikram" <vikram.garhwal@amd.com> writes:

> Thanks, Alex, for reviewing this one. I built for all the archs and it wa=
s fine. Can you please share more about what
> environment builds are breaking? So, I can test the changes for v2.

My cross build environment failed:

  ../../configure' '--disable-docs' '--disable-tools' '--cross-prefix=3Daar=
ch64-linux-gnu-' '--enable-xen' '--target-list=3Di386-softmmu,x86_64-softmm=
u,arm-softmmu,aarch64-softmmu' '--disable-tpm'

On a Debian Bullseye with:

  11:30:20 [root@zen:~] # dpkg -l libxen\*
  Desired=3DUnknown/Install/Remove/Purge/Hold
  | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Tr=
ig-pend
  |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
  ||/ Name                       Version                 Architecture Descr=
iption
  +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  ii  libxen-dev:arm64           4.14.5+24-g87d90d511c-1 arm64        Publi=
c headers and libs for Xen
  ii  libxencall1:amd64          4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime library - libxencall
  ii  libxencall1:arm64          4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime library - libxencall
  ii  libxendevicemodel1:amd64   4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxendevicemodel
  ii  libxendevicemodel1:arm64   4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxendevicemodel
  ii  libxenevtchn1:amd64        4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenevtchn
  ii  libxenevtchn1:arm64        4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenevtchn
  ii  libxenforeignmemory1:amd64 4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenforeignmemory
  ii  libxenforeignmemory1:arm64 4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenforeignmemory
  ii  libxengnttab1:amd64        4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxengnttab
  ii  libxengnttab1:arm64        4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxengnttab
  ii  libxenhypfs1:amd64         4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime library - libxenhypfs
  ii  libxenhypfs1:arm64         4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime library - libxenhypfs
  ii  libxenmisc4.14:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - miscellaneous, versioned ABI
  ii  libxenmisc4.14:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - miscellaneous, versioned ABI
  ii  libxenstore3.0:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxenstore
  ii  libxenstore3.0:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxenstore
  ii  libxentoolcore1:amd64      4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxentoolcore
  ii  libxentoolcore1:arm64      4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxentoolcore
  ii  libxentoollog1:amd64       4.14.5+24-g87d90d511c-1 amd64        Xen r=
untime libraries - libxentoollog
  ii  libxentoollog1:arm64       4.14.5+24-g87d90d511c-1 arm64        Xen r=
untime libraries - libxentoollog

But also a bunch of cross builds on the CI system:

  https://gitlab.com/stsquad/qemu/-/pipelines/677956972/failures

>
>=20=20
>
> Regards,
>
> Vikram
>
>=20=20
>
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Date: Thursday, October 27, 2022 at 2:24 AM
> To: Garhwal, Vikram <vikram.garhwal@amd.com>
> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>, Stabellini, Stefano <s=
tefano.stabellini@amd.com>, Stefano
> Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citri=
x.com>, Paul Durrant <paul@xen.org>,
> xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export xenstore_record_d=
m_state
>
> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>  accel/xen/xen-all.c  | 2 +-
>>  include/hw/xen/xen.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>> index 69aa7d018b..276625b78b 100644
>> --- a/accel/xen/xen-all.c
>> +++ b/accel/xen/xen-all.c
>> @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *=
chr)
>>  }
>>=20=20
>>=20=20
>> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *=
state)
>> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
>>  {
>>      char path[50];
>>=20=20
>> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
>> index afdf9c436a..31e9538a5c 100644
>> --- a/include/hw/xen/xen.h
>> +++ b/include/hw/xen/xen.h
>> @@ -9,6 +9,7 @@
>>   */
>>=20=20
>>  #include "exec/cpu-common.h"
>> +#include <xenstore.h>
>
> This is breaking a bunch of the builds and generally we try and avoid
> adding system includes in headers (apart from osdep.h) for this reason.
> In fact there is a comment just above to that fact.
>
> I think you can just add struct xs_handle to typedefs.h (or maybe just
> xen.h) and directly include xenstore.h in xen-all.c following the usual
> rules:
>
>   https://qemu.readthedocs.io/en/latest/devel/style.html#include-directiv=
es
>
> It might be worth doing an audit to see what else is including xen.h
> needlessly or should be using sysemu/xen.h.=20
>
>>=20=20
>>  /* xen-machine.c */
>>  enum xen_mode {
>> @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>>=20=20
>>  void xen_register_framebuffer(struct MemoryRegion *mr);
>> +void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
>>=20=20
>>  #endif /* QEMU_HW_XEN_H */


--=20
Alex Benn=C3=A9e

