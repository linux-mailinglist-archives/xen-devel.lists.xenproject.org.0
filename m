Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4345D3248A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 15:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206645.1520045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkPm-0004H0-C4; Fri, 16 Jan 2026 14:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206645.1520045; Fri, 16 Jan 2026 14:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkPm-0004Eo-9F; Fri, 16 Jan 2026 14:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1206645;
 Fri, 16 Jan 2026 14:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZM7=7V=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vgkPl-0004Ei-DO
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 14:03:01 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1124ed09-f2e4-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 15:03:00 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-59b7073f61dso2592354e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 06:03:00 -0800 (PST)
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
X-Inumbo-ID: 1124ed09-f2e4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768572180; x=1769176980; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkRgaANMh8CQ8z4LC91LtnxcfXnjI7vhTwaYXv12uSM=;
        b=aeIpbcDr+Q3zCjwI8Mrz2LUAH6Oy6lfSYdai2ElZvZRitBML2BhixsNRMeWRyFxcP+
         KdOekqQki0ctmaY4pdvmjSU8zKwTndCm7x6114m6kXu7W2dXIqwxYr6hHJB3MbIFPvuU
         naDN1Y+q2T7BYOeBaxe7HineJ6mNjAeFYGXbdarLZpDazGsX56wv4OmbhwTogM5oJu6/
         IJsNdJX1OrhnyFkdqeMrt42WYFnCk7TkM42Z8ElbXqC27+BVfnm2oKww0tOV3AVHgbHZ
         mP2WP4dQeEa6WviCqKbrS7fHvci16Tayep4Li4Abave9WC9rmynMl+U1asAuX4PGjv9K
         TFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768572180; x=1769176980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkRgaANMh8CQ8z4LC91LtnxcfXnjI7vhTwaYXv12uSM=;
        b=ZAHq4AKzOHMuoacL1Go8Obo3E+KgW75h1sk4k9u0YCgDosZEA0m1SIwhle158ac7Ju
         kx9IOdsmZ0GNt2qqOcdDICAgWarUbqjPnRbss5P3Ua6oTnwt68xFuH2r2yCRoFJ7ZKw0
         NFqVmGeLlwQ7TlI6xBGsnOFLXvg5/w/Z84GyEGruTUt3jg6girESWAy99S9+8eCJVkKG
         uKCfh61N6kaEZrINjbElRqJ3hwSIkW7npj22Y2NhZLUOLwN1iVv6t1yjupY+T8rIrApe
         /c1Jrs70gm4I69MRypTf84m/iz9ngW06NhazccUZQefetlLKdhxprvdUuvQzu0tb7QNr
         0L2Q==
X-Gm-Message-State: AOJu0YyVUvnxDpqk9Z9p534FvFzcN/oyrygiQ12YLKX84DDFRA4+8xRh
	+Un2DVTPewbEhiSd6hipL4NpARYsQ2BHoPS2hEDQQfKRXakbo2YEnQM4bpO+duWBTDvC0CjoS6I
	7E0CZ1gy4Iczl45FbUddUQhPVHkwcCt4=
X-Gm-Gg: AY/fxX7urD5cHm0xml6DtAF5/2upKThDv6tmnJ4XJ/Zc23oIF+qQdCVFBvrNTodiZzy
	sbzZEpr0+eVhQR/mfOw+kPlv6VuWf37qupvQXa1Yn59uHGikx2b/1aRxvsPxKhCzezNG0X0zI+W
	mJKwzqt3rNL0ktdonUOlxFWlGpTfZotms/CXYsChPtvY/Pi/uEgje+JVZUM3tZVQmK1Tonxv3dT
	zz7It2EHE1oKKpLKBRE7FjrWjnjyFukGAnwwjcPJZ0XpJ0htuT+hyXnNg+QMoQCHpQ5qCZp3Lq1
	l8v5ng==
X-Received: by 2002:a05:6512:4015:b0:59b:b0f9:53ed with SMTP id
 2adb3069b0e04-59bb0f9545fmr789328e87.3.1768572179406; Fri, 16 Jan 2026
 06:02:59 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com> <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com> <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com> <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com> <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com> <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
 <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com> <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
 <CAGeoDV-sYJC-bXMAN2qJmPRHqE7oQPRb6D0e0BZi=tJ0aTK-Mw@mail.gmail.com> <728956d5-b404-4e9c-b618-06289acbc71f@suse.com>
In-Reply-To: <728956d5-b404-4e9c-b618-06289acbc71f@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 16 Jan 2026 16:02:47 +0200
X-Gm-Features: AZwV_QjBazq5TyGK8Cvf0utBL1NRcjz5j9TCbn4s1rgB30UYd2IAFKYchlo0VVo
Message-ID: <CAGeoDV_2xP_9P3-H209NWVqihXzRqufjQdcoGCfGzg8wE11X9A@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:50=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.01.2026 13:48, Mykola Kvach wrote:
> >> Actually, can you give the patch below a try? That would explain the 2=
4-byte
> >> difference (albeit I'm struggling with some other aspects of a proper
> >> explanation).
> >>
> >> --- a/xen/arch/arm/Makefile
> >> +++ b/xen/arch/arm/Makefile
> >> @@ -87,13 +87,13 @@ endif
> >>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> >>         $(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target=
).0.S
> >>         $(MAKE) $(build)=3D$(@D) $(dot-target).0.o
> >> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> >> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> >>               $(dot-target).0.o -o $(dot-target).0
> >>         $(NM) -pa --format=3Dsysv $(dot-target).0 \
> >>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sor=
t \
> >>                 > $(dot-target).1.S
> >>         $(MAKE) $(build)=3D$(@D) $(dot-target).1.o
> >> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> >> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> >>             $(dot-target).1.o -o $(dot-target).1
> >>         $(NM) -pa --format=3Dsysv $(dot-target).1 \
> >>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sor=
t \
> >
> > Thank you for fixing this issue.
> >
> > I tried the Makefile change you suggested (adding $(build_id_linker)
> > to the two $(LD) invocations.
> > With this patch applied, I no longer see the issue.
>
> May I translate this to Tested-by: then (confined to Arm, as the full pat=
ch
> touches PPC and RISC-V as well)?

Yes, I agree -- please add the Tested-by tag.

>
> Jan

