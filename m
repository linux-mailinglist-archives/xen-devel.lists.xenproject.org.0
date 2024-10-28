Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744639B3799
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826909.1241361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TVi-0004eu-Fr; Mon, 28 Oct 2024 17:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826909.1241361; Mon, 28 Oct 2024 17:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TVi-0004cU-DC; Mon, 28 Oct 2024 17:26:34 +0000
Received: by outflank-mailman (input) for mailman id 826909;
 Mon, 28 Oct 2024 17:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owpo=RY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5TVh-0004cO-TM
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:26:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5ed0e36-9551-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 18:26:31 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso708322966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:26:31 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b30d6fdc5sm394889566b.163.2024.10.28.10.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 10:26:30 -0700 (PDT)
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
X-Inumbo-ID: c5ed0e36-9551-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730136391; x=1730741191; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsqMoxtXULfn2iiQA+6XYVvRZeNzl30o7ByaG+8mNJc=;
        b=FWBQUGE5KbRFzm6k2OcGJTnnpu2pTQl7+sXP5B1j5PZmP5iBTRj4M74uF8FaAYU4n5
         JNe/1t8R6o2kARCIKbiape/1V9wag1t7k7os2ZL+3qgCKk0CqId9bebmpp5BT5Rp5O6Z
         kTNX02jT9ACfHISwEVm3zi099yvU5sZ0jhEjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136391; x=1730741191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsqMoxtXULfn2iiQA+6XYVvRZeNzl30o7ByaG+8mNJc=;
        b=T8gZAPSgo8naGy1LecyIBaUGBf6ZtLyS3J53senw8Y/vLsOyf9CtHrRlsroAEbimJK
         3/MD+D/C8mhxmWTlzIJ4CDMDeZg1a2qrguWvqRC3DssIjodQwyENuxxUQTVkHOGqtZQC
         Zvuk3NqeNHd+vQk1V2dWzrBOFb8iZ+ZDXwGXw4uFYujEPVX62PrwNbzQAf3b3NDrY6GU
         rqCblQZrs9a/+CxLC0olGc2rDJuzQ+y6a2xxpbnnl+aYw/XlH4LXvqXinMMlOM23KRHN
         QZFYle7mnhJ1AG8uj4fz/foMkKSBdzAa6g1LJVeMtdeEtOOrDNMAlydvJBgfhkHiz2Yo
         cEuA==
X-Forwarded-Encrypted: i=1; AJvYcCWgebhv0IQ0yHYZP+lHhwFPuvUjG3lF35aDPDqsvKhCt8u5UhiMIPUxoXEJY+5HfydCg3Y32Zld7Rs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrGQ4KxzQVuP49l+WlW/YC0fHGMqriIEdFI241tMuJT6FBlhTf
	Eb9xYOr7yp4XX9KUz1X/WDItnevrRhCudMpEnlrLQnxoDH6BIn7SfE3uk5YwfBw=
X-Google-Smtp-Source: AGHT+IG77GekEcE+1P2ekSiQLucfNcRsDpTr399Lar8agdq9FphHiDCWAZxtcy8ODrZU63IcPnHKaQ==
X-Received: by 2002:a17:907:72ce:b0:a99:7539:2458 with SMTP id a640c23a62f3a-a9de6455bf8mr722374066b.65.1730136391117;
        Mon, 28 Oct 2024 10:26:31 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:26:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
Message-ID: <Zx_JRaViUiEF2IrH@macbook>
References: <20241028114831.27487-1-roger.pau@citrix.com>
 <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
 <51632c96-9a12-4656-b8f8-1631c11a3a19@suse.com>
 <CACHz=Zg4mFn5zn42f9dDFao0r7ePj=Owhc04OSW5LfW6cJoUaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=Zg4mFn5zn42f9dDFao0r7ePj=Owhc04OSW5LfW6cJoUaw@mail.gmail.com>

On Mon, Oct 28, 2024 at 12:57:30PM +0000, Frediano Ziglio wrote:
> On Mon, Oct 28, 2024 at 12:48 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 28.10.2024 13:03, Andrew Cooper wrote:
> > > On 28/10/2024 11:48 am, Roger Pau Monne wrote:
> > >> Clang 19 complains with the following error when building libxl:
> > >>
> > >> libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
> > >>    48 |     char path[strlen("/local/domain") + 12];
> > >>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >>
> > >> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
> > >> string length to be known at build time.  Note ARRAY_SIZE() accounts for the
> > >> NUL terminator while strlen() didn't, hence subtract 1 from the total size
> > >> calculation.
> > >>
> > >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > >> ---
> > >>  tools/libs/light/libxl_utils.c | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
> > >> index 10398a6c8611..b3f5e751cc3f 100644
> > >> --- a/tools/libs/light/libxl_utils.c
> > >> +++ b/tools/libs/light/libxl_utils.c
> > >> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
> > >>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
> > >>  {
> > >>      unsigned int len;
> > >> -    char path[strlen("/local/domain") + 12];
> > >> +    char path[ARRAY_SIZE("/local/domain") + 11];
> > >>      char *s;
> > >>
> > >>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
> > >> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
> > >>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
> > >>  {
> > >>      unsigned int len;
> > >> -    char path[strlen("/local/pool") + 12];
> > >> +    char path[ARRAY_SIZE("/local/pool") + 11];
> > >>      char *s;
> > >>
> > >>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
> > >
> > > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > >
> > > Although I have a minor preference for sizeof() as suggested by Frediano.
> > >
> > > Can fix on commit, if you're happy?
> >
> > Please can we stick to ARRAY_SIZE() when it comes to strings? It's the
> > same as sizeof() when the base type is char, but the difference becomes
> > relevant if the base type was e.g. wchar_t.
> >
> > Jan
> >
> 
> But "literal" is not a wide string, and the type is "char" which is
> not wide too.
> 
> BTW, both me and Andrew are not strong about.

No strong opinion either, I've assumed it was clearer to not make
implicit assumptions about the size of the string literal array
elements.  I would rather like to get this committed, and Jan seems to
prefer to use ARRAY_SIZE(), so I suggest we get the patch committed
as-is.

Thanks, Roger.

