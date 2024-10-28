Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B79B3123
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826511.1240787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PJY-0003Sv-V0; Mon, 28 Oct 2024 12:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826511.1240787; Mon, 28 Oct 2024 12:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PJY-0003RK-SP; Mon, 28 Oct 2024 12:57:44 +0000
Received: by outflank-mailman (input) for mailman id 826511;
 Mon, 28 Oct 2024 12:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnZV=RY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5PJX-0003RC-Fe
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:57:43 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b343c0-952c-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:57:42 +0100 (CET)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3e6104701ffso2597825b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:57:42 -0700 (PDT)
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
X-Inumbo-ID: 37b343c0-952c-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730120261; x=1730725061; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3Hn8Bw3foJ3vhKRRsxCTUCp91ONJNwhsUh1oAIAUt4=;
        b=MuNRpfvUC6rq0RS2huQoliCANkQrRBxiIv+TKlgtM5InUKG6SoQ6RtWLoiyEd6rIVp
         NGx1I9z7flIOkvT+FeYTiZYi+e6f33BwjgcqLcaAcfE3S4lZo8EXYGkSupAGlUesAvg2
         9qTKdfDtxbigHdsIthJANpIRCNpZW9Eoj3U8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120261; x=1730725061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Hn8Bw3foJ3vhKRRsxCTUCp91ONJNwhsUh1oAIAUt4=;
        b=NE9O4JXzi5BgxdWirsdVkBmBoiWLEbPTSklEuP95/Cb0rtpsLJ8T5iCcEGijc0ZTO4
         ZQXR8RoFVBMAHpyFYchZ6xgaO94tClhMFWkrUGfluFm9ETNyhhMxJ6oUj5h5UAVNK/yW
         gmUvkM7Ex+MBoCUb1xhiHj79xpIu5JpNdpTW5j6tFB7M7jbrGDTPKPSmMZb5x/daDPOK
         qLDB8XU/QHMEXUdhytF+OZ9gW16prHtnuus5kpPm3VZJJTTRlY0PhEX6QE7eogpec4Hl
         c1y3dDgs3Bn0IytdW0cMTDkFvcHf7w6NrUSzV21btHaceA2O58hHOA8CbgpfzEF38JdM
         QGxw==
X-Forwarded-Encrypted: i=1; AJvYcCU8P32fNUcP3XB8FtGvhICdcabDMbsW6qdHgZT0Gfjs18JME0KVI5XUVIosEfjhr8I+fzbd3beUUqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbnGTrc0XV2WtMxRI1/uOQsteMTPmsQ9MOBT4o97tzKYI4KrAt
	UpduwIjwVDMITAIgZvWiqA2ZEUsCDY1W1exZ8gM141nD+XekT8WF4+4QKch+U0BGqbSQ6J+XWJu
	OR8pXkLCDJ8S9Ibw+5awKu978D6Usp581C3o+kA==
X-Google-Smtp-Source: AGHT+IFPFWAIN9gROzrdrIoC6jV9+4fmVwI6IcrIK8RJAsV6HVYJb9GzsOz9FBCLmYw6wd6yfhpj946cdIF+B3SJkSQ=
X-Received: by 2002:a05:6808:6492:b0:3e6:3cf7:dc7e with SMTP id
 5614622812f47-3e63cf7dc98mr4816811b6e.3.1730120261200; Mon, 28 Oct 2024
 05:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241028114831.27487-1-roger.pau@citrix.com> <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
 <51632c96-9a12-4656-b8f8-1631c11a3a19@suse.com>
In-Reply-To: <51632c96-9a12-4656-b8f8-1631c11a3a19@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Oct 2024 12:57:30 +0000
Message-ID: <CACHz=Zg4mFn5zn42f9dDFao0r7ePj=Owhc04OSW5LfW6cJoUaw@mail.gmail.com>
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 12:48=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 28.10.2024 13:03, Andrew Cooper wrote:
> > On 28/10/2024 11:48 am, Roger Pau Monne wrote:
> >> Clang 19 complains with the following error when building libxl:
> >>
> >> libxl_utils.c:48:15: error: variable length array folded to constant a=
rray as an extension [-Werror,-Wgnu-folding-constant]
> >>    48 |     char path[strlen("/local/domain") + 12];
> >>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> Replace the usage of strlen() with ARRAY_SIZE(), which allows the lite=
ral
> >> string length to be known at build time.  Note ARRAY_SIZE() accounts f=
or the
> >> NUL terminator while strlen() didn't, hence subtract 1 from the total =
size
> >> calculation.
> >>
> >> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> ---
> >>  tools/libs/light/libxl_utils.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_u=
tils.c
> >> index 10398a6c8611..b3f5e751cc3f 100644
> >> --- a/tools/libs/light/libxl_utils.c
> >> +++ b/tools/libs/light/libxl_utils.c
> >> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsig=
ned long maxmem_kb, unsigned
> >>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
> >>  {
> >>      unsigned int len;
> >> -    char path[strlen("/local/domain") + 12];
> >> +    char path[ARRAY_SIZE("/local/domain") + 11];
> >>      char *s;
> >>
> >>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
> >> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx=
 *ctx, const char *p,
> >>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
> >>  {
> >>      unsigned int len;
> >> -    char path[strlen("/local/pool") + 12];
> >> +    char path[ARRAY_SIZE("/local/pool") + 11];
> >>      char *s;
> >>
> >>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
> >
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> > Although I have a minor preference for sizeof() as suggested by Fredian=
o.
> >
> > Can fix on commit, if you're happy?
>
> Please can we stick to ARRAY_SIZE() when it comes to strings? It's the
> same as sizeof() when the base type is char, but the difference becomes
> relevant if the base type was e.g. wchar_t.
>
> Jan
>

But "literal" is not a wide string, and the type is "char" which is
not wide too.

BTW, both me and Andrew are not strong about.

Frediano

