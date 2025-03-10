Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D6A5A326
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 19:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906779.1314161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tri18-00029C-4v; Mon, 10 Mar 2025 18:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906779.1314161; Mon, 10 Mar 2025 18:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tri18-000278-2D; Mon, 10 Mar 2025 18:38:22 +0000
Received: by outflank-mailman (input) for mailman id 906779;
 Mon, 10 Mar 2025 18:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tri17-000272-C3
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 18:38:21 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e65667-fdde-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 19:38:20 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abf615d5f31so910094866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 11:38:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac287653c7esm354515966b.84.2025.03.10.11.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 11:38:19 -0700 (PDT)
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
X-Inumbo-ID: d6e65667-fdde-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741631900; x=1742236700; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/+kFflcnVhBXbdsOwjnJ9fWSNTzxNEzBqKowaVKxWAI=;
        b=XLujRLsA/Ix19pczZvv70gs4ZXvlXnPVFoTz7rjLNzaAtvxKfg2DP4IuNfh55wZR2R
         958vKhbHUaFIHm55oZFhz63NpaUDdI+48F8pAsaR8gruu0W14+cm7JMrZOyp9zYJ+h+v
         CKKqJ7WtcWYvqSLUIR2OEcFQSwRC/pSJu78+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741631900; x=1742236700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+kFflcnVhBXbdsOwjnJ9fWSNTzxNEzBqKowaVKxWAI=;
        b=M1oc2OX4shrchARUGiWZefRlLt6qeXJhGZURjd7WQcsnyE8xy3phhuw3ywvhULltB4
         cc5ydwxpdgLKBMxtn6aZd1OAcfYOgfDLx4X4/e2y7G1kjTib4UhC7IwvbYT3qEWTIKFm
         OQv81PXIwo+D6P+axtzStdl1+AQipnhd1Dp5b5MWYC9JRiHNUTWvTEere5UJqlKuaAvR
         dWt0CA42dYcVa9a6tmip7HC93A6V5pZECmdseXnUmw3FpOPEekKYJ2H2FYGUOFex4Tlf
         vnQmsIjwpGcTxr67ogrp38y1EaoFL89GKflK9B+5Qfi/g+VSDY81zHpm7VuQaIpHLlHt
         mdmw==
X-Gm-Message-State: AOJu0YysGvqjqZFk/bQHSv5hgHF4xBmfc76B5rTvUINxIv2ow/jP+QDu
	VK4lNRvam50yewx2QX+dftTcoF7bqHxYxLr2Fcu4XnE3pYV/M14I32ilKdLtsjU3sWXW/fI6egv
	C
X-Gm-Gg: ASbGnctPvwXAExAyv1geKQOiTSI8zaIxZOxSdMcbCbyv6aprtizdyuV9GwX3yzImAyx
	nxSAni3O1EWL5JFDprpNy+Lva8VxyVIOh2yU2WGta68p+pXFlTlU0KQ9hhRRndV16QHlRi+BheY
	AK9QnXh+nPTd4h1EwxShGR3jIcpWir1Um7itqlgV/GkAtJuaQ+FnPlz2l9Gndilj7jDSLaJYKg/
	gwfEbcj+q2crkBjQiIxzXiW5PYJ1fB9w91DeGttVTaHH/+kycta7fUjyu9Dzj5fs85wC0ZSpTqC
	oTS00NWs31yGgSlznO7vezDhDxJlSkydsjPNixIlMJhqLDniR96vza5U4/33
X-Google-Smtp-Source: AGHT+IE8sKeOwNlNtkeF/EF8QY+aAzmcnQEUfuRhumL3vDB/4OCVK4i33B3eqf7W6pF92ioAGxFknQ==
X-Received: by 2002:a17:907:6d0f:b0:ac2:89d6:9123 with SMTP id a640c23a62f3a-ac289d6a156mr884065966b.41.1741631899756;
        Mon, 10 Mar 2025 11:38:19 -0700 (PDT)
Date: Mon, 10 Mar 2025 19:38:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/cirrus-ci: store xen/.config as an artifact
Message-ID: <Z88xmtUGw5k1nsBN@macbook.local>
References: <20250310181638.51196-1-roger.pau@citrix.com>
 <b95a2bcc-4ab8-46d5-9d92-1f2c37d4c279@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b95a2bcc-4ab8-46d5-9d92-1f2c37d4c279@citrix.com>

On Mon, Mar 10, 2025 at 06:30:15PM +0000, Andrew Cooper wrote:
> On 10/03/2025 6:16 pm, Roger Pau Monne wrote:
> > Always store xen/.config as an artifact, renamed to xen-config to match
> > the naming used in the Gitlab CI tests.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Looking at this, I suspect my failure was caused by trying to capture
> ".config" directly.
> 
> > ---
> >  .cirrus.yml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index e2949d99d73a..1a39f5026f9a 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -15,6 +15,14 @@ freebsd_template: &FREEBSD_ENV
> >      APPEND_INCLUDES: /usr/local/include
> >      CIRRUS_CLONE_DEPTH: 1
> >  
> > +freebsd_artifacts: &FREEBSD_ARTIFACTS
> > +  always:
> > +    rename_script:
> > +      - cp xen/.config xen-config
> > +    config_artifacts:
> > +      path: xen-config
> > +      type: text/plain
> 
> Can't this be part of freebsd_template directly?
> 
> Or is there an ordering problem with the regular build_script ?

Exactly, that was my first attempt (placing it in freebsd_template),
but then the collection would be done before the build, as
freebsd_template sets the env variables ahead of the build, see:

https://cirrus-ci.com/task/5086615544004608

Thanks, Roger.

