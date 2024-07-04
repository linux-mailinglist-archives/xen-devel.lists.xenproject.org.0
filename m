Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33392718B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 10:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753597.1161791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHd3-0000fL-71; Thu, 04 Jul 2024 08:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753597.1161791; Thu, 04 Jul 2024 08:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHd3-0000cX-3P; Thu, 04 Jul 2024 08:15:45 +0000
Received: by outflank-mailman (input) for mailman id 753597;
 Thu, 04 Jul 2024 08:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+PiT=OE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sPHd1-0000cN-Df
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 08:15:43 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a5a897c-39dd-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 10:15:42 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-650cef35de3so3216857b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 01:15:42 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69260561sm656038785a.25.2024.07.04.01.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 01:15:40 -0700 (PDT)
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
X-Inumbo-ID: 9a5a897c-39dd-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720080940; x=1720685740; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JcbOHyVZoFB/vPv30n4nbPVBNdfV0vjCuMQn/fbdyCM=;
        b=rG3qFJlq1Jzmu+CgmNb3YLXsVOkyCg9eJgUdiix1ne2Z7w6vZUvobE6f+RC/hBirbs
         woXSrHemUErrmIm6IqBUJ0xl8/JHGMA1abB2Ze3yc+DkWGHoVKsqSvvvX9AqEpyfBhZU
         Ddd38n2sY3h35pNbpy74doU+wt8OfHvN/v5h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720080940; x=1720685740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcbOHyVZoFB/vPv30n4nbPVBNdfV0vjCuMQn/fbdyCM=;
        b=OIswIoLUVIWCbeyfaGYQMNzqriik8of4eD2CXz04S6oDfqaQQxSdmmHE4RWX/YOSqs
         yjVivxVWYaf8RQV6KzRzq2khPX2d8ogJb9Iass03dQ3lsr7KrlDMPW0y06dg6M1UqYlR
         ZbQntqnZmG2RJmRytao9UiVsnJV7eI/xBxfNADh/bfjKWGvCPIMEVpADuBclSDgQx/lx
         w8PoAOvfCwB1Jv31A2qVS6oFMaDpTs64g+pdd4oINZZToJxFFCR5UWJrYsWccYLNQrkB
         kKo6WvEHt0uJe0Pk0c5iSpi5msv6wf7lo6abpRAjaNY8smIG1v67Ojg16UWn3wHMLNKq
         VWPA==
X-Gm-Message-State: AOJu0Yx0678QDps+v3P2yhsH8PecTHUoifJA4ycpaip8A0HiuvjFUdDL
	89W3u8zpc03HqblQlysV1fQdvtih9ynxK33vCZ32/ib5TmouDwHyU7THRO6YOLw=
X-Google-Smtp-Source: AGHT+IHwQzCFSlcnmNFapR/+msSQr+26dVtuu7ZyhwWvKlzwXWdzHLWOyGEZhJRRQak2U/LFdzODJA==
X-Received: by 2002:a81:8386:0:b0:64a:d5fd:f19f with SMTP id 00721157ae682-652d5917b98mr7982427b3.18.1720080940467;
        Thu, 04 Jul 2024 01:15:40 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:15:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 4/4] CI: Rework the CentOS7 container
Message-ID: <ZoZaKeEJR1ekqPk8@macbook.local>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-5-andrew.cooper3@citrix.com>
 <ZoVmSWt9bwxDNMuF@macbook.local>
 <b10061e7-1bf7-4bac-83d9-fe621cbad65a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b10061e7-1bf7-4bac-83d9-fe621cbad65a@citrix.com>

On Wed, Jul 03, 2024 at 04:09:48PM +0100, Andrew Cooper wrote:
> On 03/07/2024 3:55 pm, Roger Pau Monné wrote:
> > On Wed, Jul 03, 2024 at 03:20:02PM +0100, Andrew Cooper wrote:
> >> CentOS 7 is fully End-of-life as of 2024-06-30, and the Yum repo configuration
> >> points at URLs which have become non-existent.
> >>
> >> First, start by using a heredoc RUN for legibility.  It's important to use
> >> `set -e` to offset the fact that we're no longer chaining every command
> >> together with an &&.
> >>
> >> Also, because we're using a single RUN command to perform all RPM operations,
> >> we no longer need to work around the OverlayFS bug.
> >>
> >> Adjust the CentOS-*.repo files to point at vault.centos.org.
> >>
> >> Take the opportunity to split the Xen deps from Tools deps, and to adjust the
> >> other packages we use:
> >>
> >>  * We need bzip2-devel for the dombuilder, not just bzip2.
> >>  * zstd-devel is another optional dependency since the last time this package
> >>    list was refreshed.
> >>  * openssl-devel hasn't been a dependency since Xen 4.6.
> >>  * We long ago ceased being able to build Qemu and SeaBIOS in this container,
> >>    so drop their dependencies too.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Acked-by: Roger Pau Monné <roiger.pau@citrix.com>
> 
> Thanks.
> 
> >
> >> ---
> >> CC: Anthony PERARD <anthony.perard@vates.tech>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Doug Goldstein <cardoe@cardoe.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >>  automation/build/centos/7.dockerfile | 70 +++++++++++++++-------------
> >>  1 file changed, 37 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> >> index 657550f308bb..9e66d72a5bd5 100644
> >> --- a/automation/build/centos/7.dockerfile
> >> +++ b/automation/build/centos/7.dockerfile
> >> @@ -6,44 +6,48 @@ LABEL maintainer.name="The Xen Project" \
> >>  RUN mkdir /build
> >>  WORKDIR /build
> >>  
> >> -# work around https://github.com/moby/moby/issues/10180
> >> -# and add EPEL for dev86
> >> -RUN rpm --rebuilddb && \
> >> -    yum -y install \
> >> -        yum-plugin-ovl \
> >> -        epel-release \
> >> -    && yum clean all && \
> >> -    rm -rf /var/cache/yum
> >> +RUN <<EOF
> >> +    set -e
> >> +
> >> +    # Fix up Yum config now that mirror.centos.org doesn't exist
> >> +    sed -e 's/mirror.centos.org/vault.centos.org/g' \
> >> +        -e 's/^#.*baseurl=https\?/baseurl=https/g' \
> >> +        -e 's/^mirrorlist=https\?/#mirrorlist=https/g' \
> > Why do you also need to uncomment baseurl and comment mirrorlist?
> > Isn't baseurl already enabled, and having extra mirrorlist won't harm
> > as it's just extra location to search for packages? (IOW: even if they
> > don't exist it shouldn't be an issue).
> 
> It appears that having an uncontactable mirror list, as opposed to no
> mirror list, is fatal.
> 
> I didn't end up with this because I like the look of the sed expression.

I wouldn't mind a comment to note the above, but it might be obvious
for people more familiar to yum than myself, hence no strong
request.

Thanks, Roger.

