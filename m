Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BBF8BCC13
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717532.1119834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vgQ-00011V-Ma; Mon, 06 May 2024 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717532.1119834; Mon, 06 May 2024 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vgQ-0000yz-JK; Mon, 06 May 2024 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 717532;
 Mon, 06 May 2024 10:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3vgP-0000yt-IS
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:34:57 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 481639f2-0b94-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:34:56 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34eb52bfca3so1194741f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:34:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b0041ac5f19213sm15647564wmf.8.2024.05.06.03.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:34:55 -0700 (PDT)
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
X-Inumbo-ID: 481639f2-0b94-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714991696; x=1715596496; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wiclyWMdqkQ7SzHiYugOC5HvIxzP8WwGlPvhETChz/s=;
        b=rSJGrrh4N59ciftotwTJXvtUOMnPNrC6HOvHd6t5IdhbnHbUiyPFWp+tn/PqLZbSXF
         VKU7Q69lzd765oeC+GYBaT1WTLqhqWoL/94BZCo/GfznlR+nB8JsyGL/R+hcRBoyN9jc
         3relKrE7GhTbRPvA1jdrKOmjc0C/v6jAHt2uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991696; x=1715596496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiclyWMdqkQ7SzHiYugOC5HvIxzP8WwGlPvhETChz/s=;
        b=LxKjJpsKzLfYqZlgT5crLGAaFexRKoCZbQWh92rAABLXkXtTzUO28c7+czfZzYP38z
         Yd5vihIZ+GMKkQIxfhKSwR2j9r/TFYMkMKkv+osQVhedT3ZDcnXZCToJX+K6iB1nF5Ty
         Fqv5XQWuVFlZAralyEZgI+Pl1gNOnR1+ihP3M9DYL2PpoPYha1RniW4LEjjabGgIZo02
         YzqQlXQifAZgPMGsDbXclW9rZsQIOhMCByRiBCeidwdkPI3TEDlKDYaH8POOaZrd4+Si
         DP/yRdplZ/WSTmiZkcsjsqoCtF1NOjADCpv30k3Y5LUgM5uP7MylRg2677s6gZODXUeM
         S48A==
X-Gm-Message-State: AOJu0YwTgZwJeASe+PCZOPUFqFcxZbnIlRYAiSR8/7x19vTKut6uTsrN
	uukeYmty3UIS6tEM9WNP4KEsYlO40BHRYfvQPDTmA0hPWxk72tqNpTt2CjAt9oc=
X-Google-Smtp-Source: AGHT+IE6jinlnyJfDz8MX4gSaw2yYikTgjDvz4mPmZmg1aFRyCTPcztXI34kcbX1x8CONwCQDeHpig==
X-Received: by 2002:a05:6000:c0c:b0:345:663f:cd79 with SMTP id dn12-20020a0560000c0c00b00345663fcd79mr8358570wrb.14.1714991695977;
        Mon, 06 May 2024 03:34:55 -0700 (PDT)
Date: Mon, 6 May 2024 12:34:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
	community.manager@xenproject.org, Kelly Choi <kelly.choi@cloud.com>,
	Oleksii <oleksii.kurochko@gmail.com>
Subject: Re: Xen 4.19 release status tracking list [ May ]
Message-ID: <ZjiyTp-1qKEOnGVN@macbook>
References: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
 <ZjiiOtvJq1KjXo5F@macbook>
 <a8be9d16-36e1-4528-b14c-42746bae605c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8be9d16-36e1-4528-b14c-42746bae605c@suse.com>

On Mon, May 06, 2024 at 11:35:00AM +0200, Jan Beulich wrote:
> On 06.05.2024 11:26, Roger Pau Monné wrote:
> > And then some patches that I don't expect to make progress:
> > 
> > x86/shutdown: change default reboot method preference
> > https://lore.kernel.org/xen-devel/20230915074347.94712-1-roger.pau@citrix.com/
> > 
> > x86/time: prefer CMOS over EFI_GET_TIME
> > https://lore.kernel.org/xen-devel/20240315114242.33309-1-roger.pau@citrix.com/
> > 
> > I find it quite funny how everyone complains about all downstreams
> > carrying similar patches to deal with firmware bugs, yet when I
> > attempt to formally post them I get zero interest from such
> > downstreams.  Maybe raising them here will help get some eyes.
> 
> Well, as indicated on the Community Call I've meanwhile proposed a design
> session (which won't really be about design) for Lisbon, as to maintenance
> of our EFI interfacing. I think I had provided feedback on the shutdown
> patch, and I didn't think there was much of a point repeating almost the
> same for the time one.

I know you are likely not OK with those, so I wasn't expecting input
from you.  We had discussions in the past where people complained that
our defaults are not OK because they lead to errors and panics on
production systems, and I'm surprised to find that none seem to have
cared about the above patches that attempt to address at least part of
this.

> As a minor remark on what you say above: It's clearly not "all"
> downstreams, as we don't carry anything similar to either of the two
> patches. But I'm pretty sure you meant "most" or "many" anyway.

Yes, indeed not all.  I don't carry those either on the FreeBSD
packages.

Thanks, Roger.

