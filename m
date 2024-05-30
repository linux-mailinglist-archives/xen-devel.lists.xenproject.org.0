Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E38D46D4
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 10:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732543.1138539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCavb-0000dA-Gh; Thu, 30 May 2024 08:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732543.1138539; Thu, 30 May 2024 08:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCavb-0000aY-Di; Thu, 30 May 2024 08:14:27 +0000
Received: by outflank-mailman (input) for mailman id 732543;
 Thu, 30 May 2024 08:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCava-0000aS-F1
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 08:14:26 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0752cfa-1e5c-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 10:14:25 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43fb909d45cso3108991cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 01:14:25 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad860c9fdesm32734876d6.34.2024.05.30.01.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:14:24 -0700 (PDT)
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
X-Inumbo-ID: a0752cfa-1e5c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717056864; x=1717661664; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AB3C2fbZzXkeRXi10wONWuuMDzrUvbNythpE1EQ3R7I=;
        b=HWEZinL6IQdpTVZAAtHk3LjgbfqYijhBQF5NLMxGZhkDJznq06Lmrfxo+ByXYY08tQ
         oQVjrta2ZBZu/aivvC5pp3XcmaAqORilBGeb6JxPRYL6agOZQJBYVEXkS4xOLK3Os2+g
         pfFi69ky5H1NzWeKHgb2Sis83PGu/0b4fjxl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056864; x=1717661664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AB3C2fbZzXkeRXi10wONWuuMDzrUvbNythpE1EQ3R7I=;
        b=reoIMfeqMiQUUX0uWQdfsZ32zRL7xY9/xvpw4Z39sbbsF/75oXdOfRq1Hl7Sv/Ewi9
         I3SKOnUkxDmKDObZcTlxO5dsl3GtaZ2808K2CPrnnQCQx3103LJeltv2TqwS6k69Bbqb
         nNeGUY+ycT/yU9FNRluGDDtO0rnI7QwH4nmtqClNcCyqPxdyZIP1j4jLiH4IAY8+DElb
         oK2EnCN0r/Lviy9zZmVxCruG3+NDZpHBv8XzEW+6TiBeRl6f352jo3H8jhzNADE9yw9c
         suqoYPkiH8+BgnkR/ATPQnkwZBc17nyQpgZBv9q3uavlfX6WHKb80hEgm81nFf6ZAUdG
         ed0g==
X-Gm-Message-State: AOJu0YxWxxLwBfxjitYRxq8kcC7R70q/RX6hl2GO5PERCzQGKHOaRqAf
	qVPSwWQRuStZxTfbuqu5jHeHZjc2+MvnzL7wWG2A3C06V+sAZm5KEG27ozj16LsZXqO4opiwjjS
	n
X-Google-Smtp-Source: AGHT+IG1BWCAhoXAMgzSCSERzv+mVXMuvxiNmddmuDXRO7NPrUPAUFBAnZFStlhC/x4Lb/usqgx5mw==
X-Received: by 2002:ac8:7d54:0:b0:43e:3d29:4312 with SMTP id d75a77b69052e-43fe92bba06mr17241281cf.22.1717056864437;
        Thu, 30 May 2024 01:14:24 -0700 (PDT)
Date: Thu, 30 May 2024 10:14:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] x86/hvm: allow XENMEM_machine_memory_map
Message-ID: <Zlg1XiUFR0sF3KCg@macbook>
References: <20240530075318.67491-1-roger.pau@citrix.com>
 <0768b842-719e-4736-a941-dfa4d50c173d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0768b842-719e-4736-a941-dfa4d50c173d@citrix.com>

On Thu, May 30, 2024 at 09:04:08AM +0100, Andrew Cooper wrote:
> On 30/05/2024 8:53 am, Roger Pau Monne wrote:
> > For HVM based control domains XENMEM_machine_memory_map must be available so
> > that the `e820_host` xl.cfg option can be used.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Seems safe enough to allow.
> 
> Does this want a reported-by, or some further discussion about how it
> was found?

I've found it while attempting to repro an issue with e820_host
reported by Marek, but the issue he reported is not related to this.
It's just that I have most of my test systems set as PVH dom0.

> Also, as it's mostly PVH Dom0 bugfixing, shouldn't we want it in 4.19?

Yeah, forgot to add the for-4.19 line and Oleksii, adding him now for
consideration for 4.19.

Thanks, Roger.

