Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113ED797950
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 19:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597566.931793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeIWB-0004dh-SF; Thu, 07 Sep 2023 17:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597566.931793; Thu, 07 Sep 2023 17:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeIWB-0004bG-Pa; Thu, 07 Sep 2023 17:10:11 +0000
Received: by outflank-mailman (input) for mailman id 597566;
 Thu, 07 Sep 2023 17:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXLl=EX=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qeIW9-0004Yb-Gw
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 17:10:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d104ea-4da1-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 19:10:07 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401d6f6b2e0so15632775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 10:10:07 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05600011c900b0031c77c010e1sm23683813wrx.96.2023.09.07.10.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 10:10:05 -0700 (PDT)
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
X-Inumbo-ID: 64d104ea-4da1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694106607; x=1694711407; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVtTxv5H7d5MLrMzRAGMDJIUJA7lHgoSYV/+RtqQn50=;
        b=Q4iHCwGflOFYTSkYkn+NWZDbBAfZT0rxjMs2+gouUE1wD70VuGN2dI3yOKMLmTHGrp
         cojLhXWLF67iVmnWlOs4pKT5SU7SB3jThDfBU1qvOF5Z4vUYvSwat6No1a5zi1tPp19i
         NavsiMDvJ1ouMoz1J8MSZpKse8dB4b+RUDrCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106607; x=1694711407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVtTxv5H7d5MLrMzRAGMDJIUJA7lHgoSYV/+RtqQn50=;
        b=ERKyPPY5xUkWqScsGVeTRYppDZgvMtXfcA8cc0uFAwHOlgaIqCJZSKdPMb7Xxg/Trj
         XtGIazPwzQURW3MF7SvdqQgDihH+kricnGZ8M8vbSyymL+Ia7CKqwTx1Zq8wybjLMbt4
         7DPcogrTctw5TP2npJ1Docfs3v8kVFZgOVCDNept6RrJco81cGCF/geUpQSCAmffuf9C
         WJfy0+Atq9NcmdFhq3qFdmcTECILpsUpyboxv/aCa8PtsrQC4c7xz1GzRcL8JY/BJK0j
         6NOhe227/PCTfI6SFSWx0Plpx1zU7SwwpJ0Qwj8dCnaveijB7tm3hEKYaNuz9rt5pLdg
         OJOA==
X-Gm-Message-State: AOJu0YzDKgHqGGMSi6tiToWjvceEfKIG2KaGW6gx4VGIwVXkmGErkDcE
	7mvR7rhfqQ1rzP6sHoDxUoGY1w==
X-Google-Smtp-Source: AGHT+IFXX/L+doy+jzJOJmLqKpos7ivS5VULH+vH+aRyqjC3wYHDmEpIa0lpj/tjYnn8vIRrdTQrJA==
X-Received: by 2002:a05:600c:2241:b0:3fe:1b5e:82 with SMTP id a1-20020a05600c224100b003fe1b5e0082mr17632wmm.20.1694106606736;
        Thu, 07 Sep 2023 10:10:06 -0700 (PDT)
Date: Thu, 7 Sep 2023 17:42:24 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Message-ID: <5fyyfcgb4hhvtvogawodspk2bx5bmn6kgl3knj3iruonpng4xc@kdmacogvavhs>
References: <20230902151351.10325-1-javi.merino@cloud.com>
 <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>

On Thu, Sep 07, 2023 at 04:41:59PM +0200, Jan Beulich wrote:
> On 02.09.2023 17:11, Javi Merino wrote:
> > --- a/xen/common/coverage/Makefile
> > +++ b/xen/common/coverage/Makefile
> > @@ -5,7 +5,9 @@ obj-y += $(call cc-ifversion,-lt,0407, \
> >  		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
> >  		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
> >  		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
> > -		gcc_5.o, gcc_7.o))))
> > +		gcc_5.o, $(call cc-ifversion,-lt,1000, \
> > +		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
> > +		gcc_10.o, gcc_12.o))))))
> 
> This is getting unwieldy, so I think we ought to try to limit the number
> of different files we have. Already gcc_4_9.c and gcc_7.c specify the
> same GCOV_COUNTERS and differ only in the version checks (which could be
> combined). Therefore ...

Right!  I tried to keep the current structure but I agree: it is
simpler if they were all combined in gcc_4_7.c.  This is what linux
does.  I'll simplify it as you suggest and send a v2.

Cheers,
Javi

