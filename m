Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3E987800
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805813.1217036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strph-0007Uu-Sp; Thu, 26 Sep 2024 16:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805813.1217036; Thu, 26 Sep 2024 16:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strph-0007Sg-Pe; Thu, 26 Sep 2024 16:59:13 +0000
Received: by outflank-mailman (input) for mailman id 805813;
 Thu, 26 Sep 2024 16:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1strpg-0007SY-C5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:59:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e3ea8f-7c28-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:59:11 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso232338666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:59:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2998d38sm16969666b.209.2024.09.26.09.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:59:10 -0700 (PDT)
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
X-Inumbo-ID: a6e3ea8f-7c28-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727369951; x=1727974751; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XoFXYKU35nmrRiFM+zRlLoNlQI9pX3wU1zQAbBWp8s=;
        b=LChz3YyXDgpY67TZPZTAOP81IwjaOvtRNBpP7qkDPRIZtcvX9eOlvu97Jtic+UzR89
         t6LQRlYSvbgqoeNr2BfVzx9IyUy/gZY1+2kswhMqnrBC4nzp4504ixDo9oVfDn2OATQa
         pZ0obfk/XT2VzDY5wjuTely7LJ0uPf+VjglhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369951; x=1727974751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XoFXYKU35nmrRiFM+zRlLoNlQI9pX3wU1zQAbBWp8s=;
        b=BK45ksE1FBvUHAxfoIOv1HL4DbEGD9Ypk7/GGHnJJZXCiqBUQMU6n6J3byVjP3woN8
         CO4pE65nos2FSt2vAaXQt2b8FcjlwSkKQRWef6xtOEPm4ALeAl915KOEPwFapPu1zHqP
         mgGytwmI1TIfQYgdfJO0Sndn8n0Ox4sHIiOlfaNwpBe0xS/ple3gBdDDMD/hy8K9lXe2
         7K1yWC9ZCmvosBhvqZOphaVt4VcHDaLNQKxs8qlnzoLgfRhXD1MrnGa8cb1HF0NeKg+X
         nSSYgGKXZ4MSjR7BWzQMQ70i8GQDIKOc6X7aJmBLgv5zQitibfof9FlmhlkmtITY6/n6
         jlzg==
X-Gm-Message-State: AOJu0YzDbs6KrDWum8cxDEE7YsgBmhCWhzJhL/zEQrGGCwhtqtXexQKQ
	tP/dO4Q3fgB7HNMAP0YX4G0ofH1Fu9dIrMSPYrE3qKCBYV2dyhaI95YS+q4irXWCD3Uw1I4qGWr
	2
X-Google-Smtp-Source: AGHT+IFAGuZYU4kBD/ihDDO0GTxxpH+2qlE5/mQD6fCdOL0/in9vpXFryz2z/5tXhAY9Ohcj8O6bbw==
X-Received: by 2002:a17:907:8687:b0:a8d:4954:c209 with SMTP id a640c23a62f3a-a93b165dacamr504680366b.22.1727369950745;
        Thu, 26 Sep 2024 09:59:10 -0700 (PDT)
Date: Thu, 26 Sep 2024 18:59:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/5] xen/livepatch: do Xen build-id check earlier
Message-ID: <ZvWS3W9L_Zt_6ENJ@macbook.local>
References: <20240926101431.97444-1-roger.pau@citrix.com>
 <20240926101431.97444-4-roger.pau@citrix.com>
 <CAG7k0Eq=TO+fPULFqCwmbPQtGVmn9+8JNOSnXxOAux=CTakEow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Eq=TO+fPULFqCwmbPQtGVmn9+8JNOSnXxOAux=CTakEow@mail.gmail.com>

On Thu, Sep 26, 2024 at 05:11:19PM +0100, Ross Lagerwall wrote:
> On Thu, Sep 26, 2024 at 11:21 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > The check against the expected Xen build ID should be done ahead of attempting
> > to apply the alternatives contained in the livepatch.
> >
> > If the CPUID in the alternatives patching data is out of the scope of the
> > running Xen featureset the BUG() in _apply_alternatives() will trigger thus
> > bringing the system down.  Note the layout of struct alt_instr could also
> > change between versions.  It's also possible for struct exception_table_entry
> > to have changed format, hence leading to other kind of errors if parsing of the
> > payload is done ahead of checking if the Xen build-id matches.
> >
> > Move the Xen build ID check as early as possible.  To do so introduce a new
> > check_xen_buildid() function that parses and checks the Xen build-id before
> > moving the payload.  Since the expected Xen build-id is used early to
> > detect whether the livepatch payload could be loaded, there's no reason to
> > store it in the payload struct, as a non-matching Xen build-id won't get the
> > payload populated in the first place.
> >
> > Note printing the expected Xen build ID has part of dumping the payload
> > information is no longer done: all loaded payloads would have Xen build IDs
> > matching the running Xen, otherwise they would have failed to load.
> >
> > Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon livepatch upload')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Should the ELF_LIVEPATCH_XEN_DEPENDS check also be dropped from
> check_special_sections() since it is no longer necessary?

It's dropped from check_special_sections() in this patch, just not
mentioned in the commit message I'm afraid.

Thanks, Roger.

