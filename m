Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C78149B8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 14:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655116.1022803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE8d9-0002h9-Gh; Fri, 15 Dec 2023 13:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655116.1022803; Fri, 15 Dec 2023 13:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE8d9-0002fT-E6; Fri, 15 Dec 2023 13:53:31 +0000
Received: by outflank-mailman (input) for mailman id 655116;
 Fri, 15 Dec 2023 13:53:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE8d8-0002fN-OK
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 13:53:30 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5271b931-9b51-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 14:53:27 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-336417c565eso537163f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 05:53:28 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040c490db950sm19040676wmq.47.2023.12.15.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 05:53:27 -0800 (PST)
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
X-Inumbo-ID: 5271b931-9b51-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702648408; x=1703253208; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oTz+EykF+iasEo40v/D9N01k9DWVfqX3JPjdOrNgOQ=;
        b=H/FGigUm/f6nMu5OIrHGm8EmyksVkYm8slmfPqALWDIlWHjCHF9dOS0fzy8rYZIWId
         AleQt2mw3nF5xIqlFFvzCm8WlHA7KdstjtZuGdpj1eVZGXWuuttZTDeXORJzuuThAlj1
         ac3I82bfn1omY+xiIum0FzUloCdmBHMkPwKBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702648408; x=1703253208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oTz+EykF+iasEo40v/D9N01k9DWVfqX3JPjdOrNgOQ=;
        b=UYltmy3G5QCVinlf+AbHz7cuDeGAMJa31dDKJC3KQPViNFTdQ8KnJvI0LGw13OXbrd
         F9aBGKXUGgQWvXpmHHUFuRV3QbDCJhOEZlJl0MyInrKKECGi522GP/cZp+GAvayjkkxn
         7wT7cg8S+w4IxqppsyP6DkESu9mZUoyzODX8bqcZ2inUdSbNlaMUGfSwpdosT+LVELN0
         92rpjgAmzRShw7OOxD20HUSXY8UpVZ4u7WRCbJMIE+IB3ie+956dkV3U2BjM/oOWOF9o
         AkQ1ys2gUC46fOnBWjEwNhJ9AF48NhxmZtizXuC6vt5ZeaIlsRo+RdsNQNeSPHO55gBK
         lWCw==
X-Gm-Message-State: AOJu0Yz2gfpVNwmZ9ZDcJOvwT+keEa/7LEzp2T1oW0Yhs+LjbVwuiyDO
	d0Q5eOfntpjHUwAQkEQTP4cOaw==
X-Google-Smtp-Source: AGHT+IG8ejPic4fq3YUyqBFC2M/dmpjPZFhF9B/YOZq1B3ztev0FIYtpvxqQAyPqpkLkxn5hk22mGQ==
X-Received: by 2002:a7b:cb95:0:b0:40c:33ab:1b37 with SMTP id m21-20020a7bcb95000000b0040c33ab1b37mr4423010wmi.152.1702648407871;
        Fri, 15 Dec 2023 05:53:27 -0800 (PST)
Date: Fri, 15 Dec 2023 14:53:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] livepatch-build-tools: allow livepatching version.c
Message-ID: <ZXxaVq19etLNbjEl@macbook>
References: <20231214085424.16890-1-roger.pau@citrix.com>
 <CAG7k0EqHi2gTFY8rhuceVURTWv1TvHLuQgkvjtjoz=A7GWdiAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0EqHi2gTFY8rhuceVURTWv1TvHLuQgkvjtjoz=A7GWdiAQ@mail.gmail.com>

On Fri, Dec 15, 2023 at 11:47:18AM +0000, Ross Lagerwall wrote:
> On Thu, Dec 14, 2023 at 8:54 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > Currently version.o is explicitly ignored as the file would change as a result
> > of the orignal and the patched build having possibly different dates, times or
> > changeset strings (by the patched build appending -dirty).
> >
> > Fix such difference by exporting the date and time from the build script, so
> > that both builds share the same build time.  The changeset string gets set in
> > .scmversion, and is cleaned on script exit if it wasn't present initially. This
> > allows checking for changes in version.c, since the rest of fields need to be
> > manually changed in order to produce different output.
> >
> > Setting XEN_BUILD_{DATE,TIME} as an environment variable and .scmversion has
> > been supported since before livepatch support was added to Xen, so it's safe to
> > export those variables unconditionally.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Also ensure consistent changeset version.
> > ---
> >  livepatch-build | 14 ++++++++++++++
> >  livepatch-gcc   |  2 --
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/livepatch-build b/livepatch-build
> > index e2ccce4f7fd7..332d26f5c6b6 100755
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -392,6 +392,10 @@ echo "Output directory: $outputarg"
> >  echo "================================================"
> >  echo
> >
> > +cleanup_version() {
> > +    rm -rf "${SRCDIR}/xen/.scmversion"
> > +}
> > +
> >  if [ "${SKIP}" != "build" ]; then
> >      # Make sure output directory doesn't exist, and create it.
> >      [ -e "$outputarg" ] && die "Output directory exists"
> > @@ -417,6 +421,16 @@ if [ "${SKIP}" != "build" ]; then
> >
> >      export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
> >
> > +    # Force same date and time to prevent unwanted changes in version.c
> > +    export XEN_BUILD_DATE=`LC_ALL=C date`
> > +    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
> > +
> > +    # Ensure uniform changeset between builds
> > +    if [ ! -e "${SRCDIR}/xen/.scmversion" ]; then
> > +        trap cleanup_version EXIT
> > +        echo "unavailable" > "${SRCDIR}/xen/.scmversion"
> 
> Shouldn't this be "${SRCDIR}/.scmversion" since Xen runs
> "$(srctree)/tools/scmversion $(XEN_ROOT)"?
> 
> Otherwise I still get spurious version.o changes...
> 
> With the 3 uses of that changed (can change during commit),
> 
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Great, I had a stale .scmversion in my Xen root and that's why I
wasn't seeing the path not being effective.

Please adjust on commit.

Thanks, Roger.

