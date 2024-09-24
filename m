Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DE9847AB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803000.1213382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6XA-0005hD-BL; Tue, 24 Sep 2024 14:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803000.1213382; Tue, 24 Sep 2024 14:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6XA-0005ea-75; Tue, 24 Sep 2024 14:28:56 +0000
Received: by outflank-mailman (input) for mailman id 803000;
 Tue, 24 Sep 2024 14:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st6X8-0005eU-N8
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:28:54 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52627c92-7a81-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 16:28:53 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5e1b55346c0so2181780eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:28:52 -0700 (PDT)
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
X-Inumbo-ID: 52627c92-7a81-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727188131; x=1727792931; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blphOGGEPum8qI2RfKqmzlaasWIc6MKUwni86lT69jo=;
        b=THmJt9Yp9iRddcEHE6LtI+/SmKEeySLEMoFAcd+oNy7to3nNNKlG+mUGHXCmTb9F2v
         gn/SGeTSJAVEBN4K+GdIZDKLqJac+Xh3FwofC6JLfpFl1FNQmUVvNNyBwP/tZBpffrqG
         ExPhlJHCKzLcUXRvgCK1EUbNbRL9mdjPWkndU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188131; x=1727792931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blphOGGEPum8qI2RfKqmzlaasWIc6MKUwni86lT69jo=;
        b=i9eBZUgobe0NVzYM97BWUDehiDOjxBICg9uSeXpxnYbL0pQDIIT+PxtHHaMxEDgzv1
         kYqfwZw7+F9O7oTtCrR4/9NJwMNUA3F2bJ/P5Kd1jjA5gYNrL/drfeRyrLMpgqIRO0ge
         0N4Kw+S6viXw0nVhd+gx/j8lTprkx9S0L5KZGsgnX47sE/eiHz4n989KqI2kcG8VArSG
         vCcUE+u7Mz85yN4H085+1tOwv8um6gFssjeyunb3D6aobgjOfoX/6LTbc/tbVPkfBJSd
         NNChC4llrx4hWKUNMJfpZsAUkC4QhYZm6igHzZcQLYO80hJduRNt3/ufz94DLkuDE+dn
         PoXA==
X-Forwarded-Encrypted: i=1; AJvYcCXSO3LhMXy9iye4FoJxMH48Eki7BaQqBYpVpSgnFT9D3c34kmm8oNbMUlLic56BVIqnzMMRcSSVGuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqm9q4zCVvMFU25bc9Z+BssQgCbIeJ5V1jBpg6rCmEYLWdYd50
	MLyfCBQZkZeK2KPnfFqawQ1AxHGpIi/YCIoSfTXgy7+m3SltHM845XMWx4X3BV2CjwPqfKkzJIC
	dHIpZ682KoAx74bnUhmiShpsWY/VgH19/ZBWvRg==
X-Google-Smtp-Source: AGHT+IFae3BtCXzK60E2iXlZYBvcLKqaD2MqGrKSQ0WbSlgXOWxd6jb8b+DNP+eMm18hh5AyvO0il0jcjVK9POMcqEs=
X-Received: by 2002:a05:6820:210:b0:5e1:c9d8:38ca with SMTP id
 006d021491bc7-5e58ba2a4f8mr7980194eaf.4.1727188131694; Tue, 24 Sep 2024
 07:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-4-frediano.ziglio@cloud.com> <7b684c1a-0e3b-412a-ae44-995463510fa9@suse.com>
In-Reply-To: <7b684c1a-0e3b-412a-ae44-995463510fa9@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Sep 2024 15:28:41 +0100
Message-ID: <CACHz=ZhhV2bwaCJBOb2_zpe3-Z0wF7FXXMB2_WfYgOwr=3R_SA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 3:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.09.2024 12:28, Frediano Ziglio wrote:
> > No need to have it coded in assembly.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - update some comments;
> > - explain why %ebx is saved before calling efi_parse_mbi2;
> > - move lea before test instruction;
> > - removed asmlinkage from efi_multiboot2 and add to efi_parse_mbi2;
> > - fix line length;
> > - update an error message specifying "Multiboot2" instead of "Multiboot=
";
> > - use obj-bin-X instead of obj-X in Makefile;
> > - avoid restoring %eax (MBI magic).
>
> Despite this long list of changes earlier comments were left unaddressed.
> The new function is still named as if it did only parsing, the stub chang=
e
> is still in here and (if already not separated out) not mentioned at all
> in the description, and (as Andrew has now also pointed out) the
> declaration of efi_multiboot2() didn't move to a header. Maybe I forgot
> some more. Please make sure you address earlier comments before sending a
> new version.
>
> Jan

What about renaming efi_parse_mbi2 to "efi_multiboot2_entry_common"
and renaming "efi_multiboot2" as "efi_multiboot2_entry".
I remember I replied to the stub change and nobody get back, so I
thought it was fine as it was.
I also replied to the header asking for a location to put it, and I
don't remember any reply.

Frediano

