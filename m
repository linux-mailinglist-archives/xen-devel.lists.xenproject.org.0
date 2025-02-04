Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86FA275C2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 16:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881686.1291847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKoG-0002PL-JK; Tue, 04 Feb 2025 15:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881686.1291847; Tue, 04 Feb 2025 15:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKoG-0002NC-GP; Tue, 04 Feb 2025 15:25:56 +0000
Received: by outflank-mailman (input) for mailman id 881686;
 Tue, 04 Feb 2025 15:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfKoF-0002N6-G0
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 15:25:55 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52ffddce-e30c-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 16:25:54 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so271442366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 07:25:54 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff3d4sm937853466b.112.2025.02.04.07.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:25:52 -0800 (PST)
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
X-Inumbo-ID: 52ffddce-e30c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738682754; x=1739287554; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/Xy/oMj8a0s/vkKR2wng4gJnZ+Mwx7Z+KAE6HT2jIk=;
        b=hOmnSKWae+CzHXP7aU30ZoRNPy6zStJULZK8hoqUl6v75iaN/4tjgwIV4Oi5puc95r
         d4v1Tj3f7lWxTUk5l9/JhiT3r/redntn/bVRVzfOeYULicG9htFJcHkav0J4Yu9Jmsni
         lykHjXOSZl8i381dLKSmsC6+xenBKkgQKbwQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682754; x=1739287554;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/Xy/oMj8a0s/vkKR2wng4gJnZ+Mwx7Z+KAE6HT2jIk=;
        b=f0r64xwA3oT6tX5X62KylF+iEiZW4IFebGcauUmv7UOtM51OI+Hv2WSy33qIrVDyMH
         DNbZ9wzdV8cT7kNmq2577RDvPJxZ9wqj6nyToGmVJYZZklY7BPBzITB/ulzpu7Hp/owr
         Oz21U0EHLFjB8aWKBUDW8gjlMTs5cOqpNUfD8B2CgSjN/QhUig4lYbWHofOp9FReg5Tf
         qOt77nQBcI0jtgZ+LTSCizLHxfEXD3Dp46GlsyeFOPlCvDibsZhVCZZzP8I2+IG6e3gM
         lE4n8nZV9W4HOOlpWASf8UlCAtjYk2RC0VoSIFWMivwAZd28Gs2o3Fz5xFUR2wyOMBei
         Eo1g==
X-Forwarded-Encrypted: i=1; AJvYcCXw48MhUaD8UaH4yaTnRZL9Hbh4+vWavmFcR7vkNS67Azcxr2iVnfuDfZ0JNP2vK0lc0swAh0jPRro=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKCBb+Nbm+22DDSeimXVdsYg1uFsTWWvir/GistmStc4IyCgnS
	+sPobe4DFY9FKoKVX5dBj6tLqa9PWJOfG73x6gdRAJzIFBCBO9zRq7Iko+ULpmg=
X-Gm-Gg: ASbGncuyYnJPYkPeuEx5mC/d6ZLtb5ASB25a6n15+J9g+Z7kkHPD8AfqKvbr/uY1tIc
	gBcwjqgP/XbvlpMkN0gIL8PFW1AsWpWDNz24EWIUDCDPD2BJnYZr5ynW4PSi0aj5TmgxkAA5IJw
	JO3riWZ6uytz32O2kxYD+25Gl39BqCcvhRJMes2M6HwbAzwLLTvT0Apl3TJjXwMTHHsAgXer+u2
	uFIyanQCSN4bVt4Zu3QRKxP5n+As8FJrNbLEJ+8kwd4L+kiHhVV2a9Dp5LNkDMvudxWk61dYeiG
	tsgkQbUxXMVse4eZpb4mKmYE2Z7JueE2poAYFK69S8sNRQ==
X-Google-Smtp-Source: AGHT+IGKP/zSYppvG0C5znG74s2bHb9cKfmsHM0rQUbvxBVXYRgyEcrc/r2C/cayDARISJBRGsen0A==
X-Received: by 2002:a17:906:dc8e:b0:ab7:c11:a980 with SMTP id a640c23a62f3a-ab7484ef61emr367066766b.17.1738682752441;
        Tue, 04 Feb 2025 07:25:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 15:25:50 +0000
Message-Id: <D7JRLGZ0KL4Z.39AQU6NC6D0Y2@cloud.com>
Subject: Re: [PATCH v2 2/2] tools/hvmloader: Replace LAPIC_ID() with
 cpu_to_apicid[]
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
 <20250204144542.7399-3-alejandro.vallejo@cloud.com>
 <84c8d20e-b9f1-4593-b5df-86cc00ff33b5@suse.com>
In-Reply-To: <84c8d20e-b9f1-4593-b5df-86cc00ff33b5@suse.com>

On Tue Feb 4, 2025 at 3:07 PM GMT, Jan Beulich wrote:
> On 04.02.2025 15:45, Alejandro Vallejo wrote:
> > --- a/tools/firmware/hvmloader/config.h
> > +++ b/tools/firmware/hvmloader/config.h
> > @@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
> > =20
> >  #define IOAPIC_ID           0x01
> > =20
> > +extern uint32_t *cpu_to_apicid;
>
> Strictly speaking this ought to be part of the earlier patch. If hvmloade=
r
> was Misra-checked, this would be a (transient) violation.

Hmmm. I don't see it. The previous patch is fully contained in smp.c and th=
is
extern isn't required until now. Does MISRA have mandates on non-static sym=
bols
not present in headers?

The global could be static in patch1, but seems silly seeing how it'd be un=
done
here.

>
> config.h is also somewhat odd a place to put this declaration, yet then I
> can't really suggest anything better.
>
> Jan

Any header will do but there's no better one I could find, and I'd rather n=
ot
create a new one just for this.

Cheers,
Alejandro

