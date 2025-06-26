Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7197AE9E44
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026352.1401542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNY-0005yW-Ha; Thu, 26 Jun 2025 13:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026352.1401542; Thu, 26 Jun 2025 13:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNY-0005vP-EU; Thu, 26 Jun 2025 13:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1026352;
 Thu, 26 Jun 2025 13:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmNX-0005vJ-Ka
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:10:59 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe70581-528e-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 15:10:58 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-739f2508ffaso684747a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:10:58 -0700 (PDT)
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
X-Inumbo-ID: ffe70581-528e-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750943457; x=1751548257; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx5FUsSKfgP2TJrEREDe0yQWf3Zalpe0SRkPT5EUUFI=;
        b=WSaBuJvdGcTictjU8xcyVs+x+hCcHHz/GTlqIaqcfWO+AQjL299ihjc4SCv61rxNC8
         7IkvdxUx2yoPcz/aqaFa54L8QYkazl2QtHIGOaknhKWeJJnQ8WYVeD+Zbe+dkykZs48o
         DeL/mr7Qyf5ebKGhVwZUpcps6kwG+QYUk3Sdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943457; x=1751548257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rx5FUsSKfgP2TJrEREDe0yQWf3Zalpe0SRkPT5EUUFI=;
        b=B6dymB1ECbH2EURupUQmAVxMsLWGVWJ5+7mNWDIlX/qQCyyJF6CmBbgNJkG4KQFEma
         OFMu0gG0/OZOdLQaQn1hnRyejYDf1UqJfoBU7oWh/zg2NItXHXRUiIsbmw+5Tkn/5o1m
         whkGUlNpTF5FFd7Nj5Vpyd9r5as207Q8JiEItGr6qteKNqDm5NYp/Bbb5+w3wZKKXG7l
         rjwjwyh3zBycYmxLYutwIwNqpzLBP9ooJwUB6Pptq7d/LL/AQmF62CvtLrIYWuc3YlZn
         qpAwfZx7j79APZcHZQ1/sUYl3nLTLGnceY3ow94np5o85pftVP3NlHQh3ufJi+G2SCAK
         xe7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh/vLDPq8pfhFck0iy67Nu1NCuLRgUsuNcTdZNr9Qin7G6FzpEutDLir6yVB5lKWW0Jcn79J1/e7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW32/WUwVf732PE92SgV66Yn2Ivp4O5sryTs9lsKP/7Jyr4Zdx
	Q/dUqCxWXlN/F0la1uxGqEi9ci8gRzCg03uTIfnmRaisEqlyCxzK6ti9NHmiwHxWS82uIkM1omU
	AImxkpcWtfqDU/l8xYPL4MwI9f4hkhNlCHTkKLx9AuQ==
X-Gm-Gg: ASbGnct4mtGapVoLyfKYAknX/MItE18P+WOkqr8vD07fNpO/hrUiNNaKGghlKROus/x
	gmM41fFIlkw6WHxtvAls2Z5J5zcnbAaHqCfpM+S0ZNNpMnHpEjIMrQRYlGhg7qjw2VwTTOE/bSM
	78SO7pRQWu7/5v9gMcbaeJC6FmCA/kadqGWXVYiF4J
X-Google-Smtp-Source: AGHT+IEofwggQsHZnosStN/XNnzweBloEtubNd/yIfvbRhRFw27NlRSp59qIhoMxarRc2ydLIccux7f3dP7dYLxWy/o=
X-Received: by 2002:a05:6871:70f:b0:2d5:4d2d:9525 with SMTP id
 586e51a60fabf-2efb24ee421mr5193806fac.8.1750943457363; Thu, 26 Jun 2025
 06:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
 <20250625073408.7496-2-frediano.ziglio@cloud.com> <e6687ac7-8ff1-4418-a32e-1fc610045c2a@suse.com>
In-Reply-To: <e6687ac7-8ff1-4418-a32e-1fc610045c2a@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Jun 2025 14:10:46 +0100
X-Gm-Features: Ac12FXxVjCMfQen9NpeMclxAomZj8RkryvC3ePbKWf-m-qiWpTT2YqUCcLkMESw
Message-ID: <CACHz=Zj8Pw29dk7ks6joAFa-zJDHtRH1XfAzd=bpbxvthwFw5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] xen/efi: Handle cases where file didn't come from ESP
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 1:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.06.2025 09:34, Frediano Ziglio wrote:
> > A boot loader can load files from outside ESP.
>
> I think it would have helped if you said somewhere what ESP is. People ma=
y
> think of this as UEFI System Partition (or some such), which doesn't coll=
apse
> to the acronym used.
>

The acronym is EFI System Partition (ESP).
Most files and prefixes use "efi" more than "uefi".

> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -443,6 +443,18 @@ static EFI_FILE_HANDLE __init get_parent_handle(co=
nst EFI_LOADED_IMAGE *loaded_i
> >      CHAR16 *pathend, *ptr;
> >      EFI_STATUS ret;
> >
> > +    /*
> > +     * In some cases the image could not come from a specific device.
> > +     * For instance this can happen if Xen was loaded using GRUB2 "lin=
ux"
> > +     * command.
> > +     */
>
> I consider this bogus: Why in the world would one use "linux" for loading=
 Xen?
>

The question could be why "linux" for efi is very different from
no-efi "linux" not having much to do with Linux kernel.
One answer is that EFI is dominated by PE format and so "linux"
command just use PE standard entry, relocations and "LoadOptions" and
use specific protocols (like LoadFile2 here) instead of Linux standard
ways.

> Yet I'll commit this as-is anyway, as Marek has acked it, just with ...
>
> > @@ -1404,7 +1427,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >          /* Read and parse the config file. */
> >          if ( read_section(loaded_image, L"config", &cfg, NULL) )
> >              PrintStr(L"Using builtin config file\r\n");
> > -        else if ( !cfg_file_name )
> > +        else if ( !cfg_file_name && file_name)
>
> ... the style issue addressed here.
>

Done, sending v4

> Jan

Frediano

