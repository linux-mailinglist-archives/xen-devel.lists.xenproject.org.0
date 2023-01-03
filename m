Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81965CA3E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 00:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470785.730408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCqSr-0003Ss-LO; Tue, 03 Jan 2023 23:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470785.730408; Tue, 03 Jan 2023 23:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCqSr-0003QV-IX; Tue, 03 Jan 2023 23:13:01 +0000
Received: by outflank-mailman (input) for mailman id 470785;
 Tue, 03 Jan 2023 23:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JkUc=5A=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCqSp-0003QP-Qh
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 23:12:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28c971a9-8bbc-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 00:12:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id y8so31270773wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jan 2023 15:12:57 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20094284aaccacb64e1.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9428:4aac:cacb:64e1])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b0028df2d57204sm16840020wru.81.2023.01.03.15.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 15:12:56 -0800 (PST)
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
X-Inumbo-ID: 28c971a9-8bbc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+qafBATEoa+2wTKgOzGNp070b+aJSvCBksgwfL9zmI=;
        b=FfjpMyyhXfBZThxZeYGQQO7vyOLV9v0CEBG6dVn0ZgBxugLJMWJFd+HsU69RlII0C5
         /NLql6fmLqkER/sYBYysomuni9ejwEf7pxSGpAaLjsF7eIsaeBgxI1z74MJkrgXL2kup
         nCuuYp4mXX+BAmgm7SJnSWiNnYy1w7RUz530xYxJMgmpoH8y3sHa1My98uOYcLgv7QnL
         xlHE4D85uwdfL1i7el8H9LOGgF+r9iZrSVpxLUQpOXnc36chinVi9laOaZdgnkTVpro0
         ck9PK0oPV359foRYgxXgeM46zviSi6e0Qi7JAOcLHC6FAfFdoQHJMEmicC2WMdlMwzGD
         k7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+qafBATEoa+2wTKgOzGNp070b+aJSvCBksgwfL9zmI=;
        b=1+jdHgsIUKXyam0rAKhbMaMdeNe2Hw/qhMM9jjyuxQUaTh6QvfxulR7znGv6B14ilj
         elo6afXkXW2cbQFp3DGXBLGaKjEviNxonXksOdYZuCo2gljTtKJp+lBnLCUwZwMti2ZT
         b++c0KttX7RqOy3VcPEFr0Vj6otj/QiQTwbfuvye30OPDl6bWzzTnqHU1phpqbzU4Ute
         12WoJ6V0WG45h7VBFUyJ0wr1t7rLzUNNHH0qr7i8jeaxnI5u8mqIDMOONB6/PJ3Rndqp
         DqS0qFQW+XUciao4dVaEReYibzNfjj2D4Qsmns15Y2D4VBt6kkvt3DlC19inXPmRhChQ
         SNoA==
X-Gm-Message-State: AFqh2krWJU0dI4ctT2wFsXMNzEaEOa3TH1yDycLEMC7shWq3yXfpshdc
	poa2/FFJS7glvT4YF9Oxsj8=
X-Google-Smtp-Source: AMrXdXv5WbayTDQhnHzoCHddCGvxv2hlBPr+kTrTQpT4lKo5mnbVdopIJ2APRWebmxbsRfsVjBUHYg==
X-Received: by 2002:a5d:42cc:0:b0:28a:326d:1d11 with SMTP id t12-20020a5d42cc000000b0028a326d1d11mr14209407wrr.53.1672787576887;
        Tue, 03 Jan 2023 15:12:56 -0800 (PST)
Date: Tue, 03 Jan 2023 23:12:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <6360e4a1-dc2b-685e-5e19-62b92eec695b@aol.com>
References: <20230102213504.14646-1-shentey@gmail.com> <bd4daee7-09df-4bfa-3b96-713690be9f4e@aol.com> <0de699a7-98b8-e320-da4d-678d0f594213@linaro.org> <CAG4p6K7hcJ-47GvsEvmuBmdwP2LsEC4WLkw_t6ZfwhqakYUEyQ@mail.gmail.com> <6360e4a1-dc2b-685e-5e19-62b92eec695b@aol.com>
Message-ID: <DD07C54B-F562-42B6-A6CD-824670514248@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 3=2E Januar 2023 17:25:35 UTC schrieb Chuck Zmudzinski <brchuckz@aol=2E=
com>:
>On 1/3/2023 8:38 AM, Bernhard Beschow wrote:
>>
>>
>> On Tue, Jan 3, 2023 at 2:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro=2Eorg> wrote:
>>
>>     Hi Chuck,
>>
>>     On 3/1/23 04:15, Chuck Zmudzinski wrote:
>>     > On 1/2/23 4:34=E2=80=AFPM, Bernhard Beschow wrote:
>>     >> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and fi=
nally removes
>>     >> it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to m=
ake Xen in the PC
>>     >> machine agnostic to the precise southbridge being used=2E 2/ wil=
l become
>>     >> particularily interesting once PIIX4 becomes usable in the PC ma=
chine, avoiding
>>     >> the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>     >>
>>     >> Testing done:
>>     >> None, because I don't know how to conduct this properly :(
>>     >>
>>     >> Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "[PATCH v4 00/30] Conso=
lidate PIIX south bridges"
>>
>>     This series is based on a previous series:
>>     https://lore=2Ekernel=2Eorg/qemu-devel/20221221170003=2E2929-1-shen=
tey@gmail=2Ecom/
>>     (which itself also is)=2E
>>
>>     >> Bernhard Beschow (6):
>>     >>=C2=A0 =C2=A0 include/hw/xen/xen: Make xen_piix3_set_irq() generi=
c and rename it
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Reuse piix3_realize() in piix3_xen_rea=
lize()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Wire up Xen PCI IRQ handling outside o=
f PIIX3
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Avoid Xen-specific variant of piix_wri=
te_config()
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant k->config_write assi=
gnments
>>     >>=C2=A0 =C2=A0 hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVIC=
E
>>     >>
>>     >>=C2=A0 =C2=A0hw/i386/pc_piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++--
>>     >>=C2=A0 =C2=A0hw/i386/xen/xen-hvm=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 +++--
>>     >>=C2=A0 =C2=A0hw/isa/piix=2Ec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 +----------------------------------
>>     >
>>     > This file does not exist on the Qemu master branch=2E
>>     > But hw/isa/piix3=2Ec and hw/isa/piix4=2Ec do exist=2E
>>     >
>>     > I tried renaming it from piix=2Ec to piix3=2Ec in the patch, but
>>     > the patch set still does not apply cleanly on my tree=2E
>>     >
>>     > Is this patch set re-based against something other than
>>     > the current master Qemu branch?
>>     >
>>     > I have a system that is suitable for testing this patch set, but
>>     > I need guidance on how to apply it to the Qemu source tree=2E
>>
>>     You can ask Bernhard to publish a branch with the full work,
>>
>>
>> Hi Chuck,
>>
>> =2E=2E=2E or just visit https://patchew=2Eorg/QEMU/20230102213504=2E146=
46-1-shentey@gmail=2Ecom/ =2E There you'll find a git tag with a complete h=
istory and all instructions!
>>
>> Thanks for giving my series a test ride!
>>
>> Best regards,
>> Bernhard
>>
>>     or apply each series locally=2E I use the b4 tool for that:
>>     https://b4=2Edocs=2Ekernel=2Eorg/en/latest/installing=2Ehtml
>>
>>     i=2Ee=2E:
>>
>>     $ git checkout -b shentey_work
>>     $ b4 am 20221120150550=2E63059-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v2_20221120_shentey_decouple_intx_to_lnkx_routing_from_south_br=
idges=2Embx
>>     $ b4 am 20221221170003=2E2929-1-shentey@gmail=2Ecom
>>     $ git am
>>     =2E/v4_20221221_shentey_this_series_consolidates_the_implementation=
s_of_the_piix3_and_piix4_south=2Embx
>>     $ b4 am 20230102213504=2E14646-1-shentey@gmail=2Ecom
>>     $ git am =2E/20230102_shentey_resolve_type_piix3_xen_device=2Embx
>>
>>     Now the branch 'shentey_work' contains all the patches and you can =
test=2E
>>
>>     Regards,
>>
>>     Phil=2E
>>
>
>OK, I didn't see the "Consolidate PIIX south bridges" series is a
>prerequisite=2E
>
>I will try it - it may take a couple of days because I need to test both
>patch series in my environment and I can only work on this in my spare
>time=2E
>
>I will provide Tested-by tags to both series if successful=2E Otherwise,
>I will reply with an explanation of any problems=2E

Sounds good! You don't need to test the prerequisite though since it is al=
ready reviewed=2E It would be completely sufficient if you could test this =
series to fill in the gap for my limited Xen knowledge -- thanks!

Best regards,
Bernhard

>
>Chuck

