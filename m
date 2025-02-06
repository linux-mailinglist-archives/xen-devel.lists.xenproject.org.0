Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BAA2AC1C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882920.1293002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SS-0002t4-EY; Thu, 06 Feb 2025 15:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882920.1293002; Thu, 06 Feb 2025 15:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SS-0002qg-Bb; Thu, 06 Feb 2025 15:06:24 +0000
Received: by outflank-mailman (input) for mailman id 882920;
 Thu, 06 Feb 2025 15:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SQ-0002qU-Sk
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a7e40c-e49b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:06:09 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so2188776a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dd9510a321sm828398a12.63.2025.02.06.07.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:08 -0800 (PST)
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
X-Inumbo-ID: e5a7e40c-e49b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854369; x=1739459169; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+ZSfscqvaJdEf5hqDGzqu1SOpCqYRUonooJDVhKmNQ=;
        b=CtJEbei2eNJmDk/+pwUKCt5UPCfjw6HZts8VWLyKs/jDF68LPbIul1dVjsyhfDpXpt
         ECdntWVCKdBdPXRfXqDhrlY5uoi1SAHCuQ1Jk65cUxceDevNLJAEEBZUyfIa4+GBrV+m
         +sm9qCY/3JN43RyiUiESYj+KK2TZvsfqh3oQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854369; x=1739459169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+ZSfscqvaJdEf5hqDGzqu1SOpCqYRUonooJDVhKmNQ=;
        b=ebGRnm1U3NnktMsuQTRh4jV/kPFzCau/axg/FOLZPZtovRpqcgKqlwiJ4qeX4xXoSv
         9aBf4qUsdSPUPSYx6a/K9SDDHYZyZOWVw/Ewa9axyipNIc0dFV3c3VMqZ4oEAjCnfKDA
         zQNUe3AmTxGplXir9vIvt2HUdEoqKP6dHy5SJGtgZx7hpZ5e26Lxb7dlDjI/L3SGXUmd
         lTJoEdllnrjHZQ4qzCUeX1xlwzJcAiOCFL6XVTDm/xi0xUS3Lb8iDnV4Em70vMmb1Ple
         Xm2Xjeq86jdJVGvJsryOqWIQbWNHqmwPU3RlYX7zUTqp4TpJS7UwRoLlI792fvynWai6
         p+yg==
X-Gm-Message-State: AOJu0YxejiT/FYOmm+EPM95LtALicE2rNTA3UGSIcrrAnIRAH240dQCr
	QnFIq/MCkPcC34RP3NQUwALnEb3i/kF7FZKVFe0KGa3nWv7vWwYp84hDEpnkYMI=
X-Gm-Gg: ASbGnct4cjEmUISym0kjIWHWt9All2jtYNK9nqrfdAYa8SQrkDlfOQNIBVa7SsWopYC
	B11S6SrntnqCEBjxNZAceqpq91uE9QsXsFAfb8/UlCllyKRDKRtaTodhh/Eetul+hyUZjmOOKHm
	onuf6CaoIWhwpLjjbdcB28WqvxByARKBfymI0zP3eqg4nXaGF9MFw/7opM3CUMH46GxbhYxkray
	WZzcT91FuKLMLj/h8Npau1yrSpFgCiN+H0yuhQHtYaBcHSBul0V/DwtkypX2wcl2LrfQmXTr8Sn
	bvff8gtPpXArTp7KOL6m
X-Google-Smtp-Source: AGHT+IF2ZNX8LbvHCciCql0VCnc3xrkJ1WoltT1EYAiNPaLlrgRzYg6O5cGq5S89/KO+0AafTtOxHw==
X-Received: by 2002:a17:907:3fa4:b0:ab7:4262:6851 with SMTP id a640c23a62f3a-ab75e262775mr840119166b.30.1738854369256;
        Thu, 06 Feb 2025 07:06:09 -0800 (PST)
Date: Thu, 6 Feb 2025 16:06:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 00/15] Remove the directmap
Message-ID: <Z6TP3yapDJNO_LIA@macbook.local>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
 <D7LG7IBBLR82.3FEHRYE0WJM4R@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D7LG7IBBLR82.3FEHRYE0WJM4R@cloud.com>

On Thu, Feb 06, 2025 at 02:55:44PM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 3:18 PM GMT, Alejandro Vallejo wrote:
> > Hi,
> >
> > I picked v4 of this series and run it through XenRT extensively, fixing crashes
> > and errors as I hit them. Likewise, I've run it through Gitlab, fixing various
> > CI failures. I listed all changes per patch. I fixed ARM to the extent that
> > "Gitlab is happy when CONFIG_ONDEMAND_DIRECTMAP=y", but I didn't go much
> > further than that.
> >
> > I _THINK_ I've covered previously unaddressed feedback, but please speak up if
> > I missed something. Otherwise, same old same old.
> >
> > Cheers,
> > Alejandro
> 
> Ping. Could I get some eyes on this? Or thoughts?

Sorry, it's very high on my list of review, but I need to finish
something for the release before.  I've certainly not forgotten about
it.

Roger.

