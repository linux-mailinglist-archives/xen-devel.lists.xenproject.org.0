Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D2999FB9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 11:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816845.1230955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBYr-0000Zt-4c; Fri, 11 Oct 2024 09:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816845.1230955; Fri, 11 Oct 2024 09:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBYr-0000YK-10; Fri, 11 Oct 2024 09:03:49 +0000
Received: by outflank-mailman (input) for mailman id 816845;
 Fri, 11 Oct 2024 09:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtJ7=RH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1szBYq-0000YE-3d
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 09:03:48 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9730cb0-87af-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 11:03:47 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53995380bb3so2499976e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 02:03:47 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c937153a6asm1720066a12.49.2024.10.11.02.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 02:03:46 -0700 (PDT)
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
X-Inumbo-ID: b9730cb0-87af-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728637427; x=1729242227; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=okOlXG4J9xUL0uC9JriYdFv4b1RpwRwnLeB8vH2XZn8=;
        b=EUekZxBSnpBT3OvDZ2/AuMDgie1GDul12RIbW3GxMwKBq/bljxPoAEt0/n/Zbv9e1q
         Ey/0V4PGA9XYD8vcAfJcnvhWUkeuQNejAqbfGBdI03Z3+wPm7dDhI6qBP3vC4IJ9S3rq
         Zi4oN7BFG69IOCX+tPCwQOubtuwIVxT4ezO2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637427; x=1729242227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okOlXG4J9xUL0uC9JriYdFv4b1RpwRwnLeB8vH2XZn8=;
        b=IbB8LJImBldwcYKglXeepycbsPJ9kyEWkUDlGtJiKx5nOe1rbxgoAYnT4rRWKEik6E
         yEalPCSSDhQndpJ3TrqCeZfPoMcnsbJn7mJTvZufJZlKlyAuRc5ST4mqoevMZIN/uqrN
         gXKSI3haPialn/JKiI/k3W5XBTXsUJun7VQnthHeKFqS4x3PoG7/62+TLH4ZXLy9WvDD
         1TOA5+w7mGQyYpQ/r6FJjwaluMo5m4KK9apc2JgTAWXdkLTqr3HLmXDPoFLBXoD3Xctu
         0owiKNWWAlbyaF1EXAy9jFGiNU53EtutXdetueJ4EouXkPJf8/XhT5Au+PabAznvx7LF
         0Uig==
X-Forwarded-Encrypted: i=1; AJvYcCU2jqZo2Fw4ryFIcq515lXw8kodMivabwF+0MSVGWqdc08rcDsaxp/14IfwTnM9HWxmk2gOi6feepI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfhHWrSJe+2IIbc470MJnWf7QoltdQIach8wlO5lxWwOwlRswt
	pC8JJFZDDapI8PI27FQtuI+kG83HmwpJ2RHGiYjp7IoLAADotWmZckrkXm2fnGA=
X-Google-Smtp-Source: AGHT+IGbY0jsfJtLwqSiLN2lrWW7Pxcc68LMkpzJl9mlG0vLThx5eHnOWovU9DEk0E6A+ARml/Iriw==
X-Received: by 2002:a05:6512:438a:b0:539:de9c:c890 with SMTP id 2adb3069b0e04-539de9cc99emr651755e87.42.1728637426720;
        Fri, 11 Oct 2024 02:03:46 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:03:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 4/4] xen/pci: address a violation of MISRA C Rule
 16.3
Message-ID: <Zwjp8V09rqz-hsYZ@macbook.local>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
 <ZwjlurKU7FrFvObG@macbook.local>
 <5d3217c4-253c-41c1-bfb7-1e926f9f3753@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d3217c4-253c-41c1-bfb7-1e926f9f3753@suse.com>

On Fri, Oct 11, 2024 at 10:48:13AM +0200, Jan Beulich wrote:
> On 11.10.2024 10:45, Roger Pau Monné wrote:
> > On Mon, Oct 07, 2024 at 04:16:19PM +0200, Federico Serafini wrote:
> >> Refactor the code to avoid an implicit fallthrough and address
> >> a violation of MISRA C:2012 Rule 16.3: "An unconditional `break'
> >> statement shall terminate every switch-clause".
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >> ---
> >> Changes in v2:
> >> - improved description.
> >> ---
> >>  xen/drivers/passthrough/pci.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >> index 5a446d3dce..a5705def3f 100644
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
> >>      {
> >>      case 1: case 2: case 4:
> >>          if ( *s )
> >> -    default:
> >>              return -EINVAL;
> >> +        break;
> > 
> > Would you mind adding a newline here between the break and the default
> > case?
> 
> I actually took the liberty to do so while committing (already a few days
> ago).

Oh, thanks, should have looked at xen.git before commenting.

Roger.

