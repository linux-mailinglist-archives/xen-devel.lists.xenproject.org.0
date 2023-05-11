Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478886FF8BF
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533524.830284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxASU-0002W9-S7; Thu, 11 May 2023 17:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533524.830284; Thu, 11 May 2023 17:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxASU-0002Ti-PM; Thu, 11 May 2023 17:52:06 +0000
Received: by outflank-mailman (input) for mailman id 533524;
 Thu, 11 May 2023 17:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1K6=BA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pxASU-0002Tc-6z
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:52:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ab3fab-f024-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 19:52:04 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-965cc5170bdso1329675366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:52:03 -0700 (PDT)
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
X-Inumbo-ID: 89ab3fab-f024-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683827523; x=1686419523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSEK5kRaNfaTazE+L2wcv81AP85ltDVrZA2W8j/izv4=;
        b=r4F8DX5TRMCjOEpnUDkD6/KVwwOvJtr3iQa5BjXOxEeSRT71GrVreW1vg5ZRGFgqtV
         pvNUvzP4eJ3Q7CI9UBnxUPrdy21eSjOTEF1lFCCOK6WqePAs/zCe6MBtWlgSIgsm+pEE
         q2w9HvEP2wEVjRJcv4N+5iqOWb6vU3sEufAUkCiXZn9RUgmHJSvBbDCWOyl2lBIhJ2xL
         xMNZo33Bakk7ELbbfJo33i2uIAPaanDQXJjlBI404nEltehEkoWrTKV5rg4o8qVKZb9I
         yO1QLtYPd46j6cHFdFNqTmMDhkV6lBvXoJvNGCR2EOReuImI81R+UJr0wJcIvGVcgyIE
         xFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827523; x=1686419523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSEK5kRaNfaTazE+L2wcv81AP85ltDVrZA2W8j/izv4=;
        b=W0b/lwU0y2eTEVsexB1znLeMgiGztCiz7ctBPtexCOA7O/twXoEgMBPqqAkA4Pxq2K
         qyrXst66M8Zl+tvuB/k9mduoY6065OIT8BJusy9zwLF4hAHdyJ43vCAmv6Ldiv9NOe4j
         Hh6aeS781gmQfnEl8LEhgXm6xLsxFgh937aVM3i/l6kWc7SssB2O5xIKVgxuzfujCh/A
         VuU4UhiwMEPdSlWo1S3IOSBS14m1ILjfFqrmVRdyBmWEUfsOKQMZ/XnWPvB/zY5U7lys
         xmsPE5bHx9XzauQZ0px233nBS2tKx2C0crUI433DQzWI/LoaQ/Pitwjlp468VENWwAI3
         OHiA==
X-Gm-Message-State: AC+VfDy+8VDVzQvEfR9pgrzZneN550XqLlSnzy58zA8NGTXujGgg0rxz
	QNmh7WsFSj06HK1wIBDgJCdauTE0sLWoVRFi+AgSnJzC
X-Google-Smtp-Source: ACHHUZ6vhfG4DY6IBNq5pmsc4iJiRCN9IcyQg0GHOmEnY9cspA7pXFvIf5lz/IsMkH/YZ6q24NwcvtUSKIZLTwA80Bk=
X-Received: by 2002:a17:907:e91:b0:967:769e:a098 with SMTP id
 ho17-20020a1709070e9100b00967769ea098mr14240179ejc.15.1683827523190; Thu, 11
 May 2023 10:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
In-Reply-To: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 May 2023 13:51:51 -0400
Message-ID: <CAKf6xpvmdVT8QWFk_V8TCoZ1YHZecTUDT3x9HuRbGmUdGYKb-Q@mail.gmail.com>
Subject: Re: [PATCH] x86/vPIT: check/bound values loaded from state save record
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 7:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> In particular pit_latch_status() and speaker_ioport_read() perform
> calculations which assume in-bounds values. Several of the state save
> record fields can hold wider ranges, though.
>
> Note that ->gate should only be possible to be zero for channel 2;
> enforce that as well.
>
> Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
> the value pit_latch_status() may calculate. The chosen mode of 7 is
> still one which cannot be established by writing the control word.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course an alternative would be to simply reject state save records
> with out of bounds values.
>
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -47,6 +47,7 @@
>  #define RW_STATE_MSB 2
>  #define RW_STATE_WORD0 3
>  #define RW_STATE_WORD1 4
> +#define RW_STATE_NUM 5
>
>  static int cf_check handle_pit_io(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val);
> @@ -426,6 +427,33 @@ static int cf_check pit_load(struct doma
>      }
>
>      /*
> +     * Convert loaded values to be within valid range, for them to repre=
sent
> +     * actually reachable state.  Uses of some of the values elsewhere a=
ssume
> +     * this is the case.
> +     */
> +    for ( i =3D 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
> +    {
> +        struct hvm_hw_pit_channel *ch =3D &pit->hw.channels[i];
> +
> +        /* pit_load_count() will convert 0 suitably back to 0x10000. */
> +        ch->count &=3D 0xffff;
> +        if ( ch->count_latched >=3D RW_STATE_NUM )
> +            ch->count_latched =3D 0;
> +        if ( ch->read_state >=3D RW_STATE_NUM )
> +            ch->read_state =3D 0;
> +        if ( ch->read_state >=3D RW_STATE_NUM )
> +            ch->write_state =3D 0;

Should these both be write_state?

Regards,
Jason

