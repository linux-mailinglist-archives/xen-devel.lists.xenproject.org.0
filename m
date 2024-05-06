Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8808BCFBF
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 16:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717682.1120131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3z32-00043m-KG; Mon, 06 May 2024 14:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717682.1120131; Mon, 06 May 2024 14:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3z32-00040m-Gr; Mon, 06 May 2024 14:10:32 +0000
Received: by outflank-mailman (input) for mailman id 717682;
 Mon, 06 May 2024 14:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3z31-00040g-El
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 14:10:31 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6538683a-0bb2-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 16:10:30 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34da4d6f543so1620788f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 07:10:30 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 g17-20020adfa491000000b0034de87e81c7sm10895688wrb.23.2024.05.06.07.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 07:10:29 -0700 (PDT)
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
X-Inumbo-ID: 6538683a-0bb2-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715004630; x=1715609430; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHNKIOJC2nBVBjalRj5ZvSAiBNsF3fzv9026i5Rh2Ww=;
        b=Z9fUmnFJF+7QDltF0yhoPPrWGYM+W8v2+3mi0Y2qUbejc1SfGalFBkNvCVk+RkCr8z
         FXFwth4JHIQv70fZ4oWZg+FCNXkfV+0Jmk2quuOyyUFydTw6e6ysNXvl1WRwnVJOphmB
         +smSD7UvURR2FCSNWbEBhWrVlxffItysLH5tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004630; x=1715609430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHNKIOJC2nBVBjalRj5ZvSAiBNsF3fzv9026i5Rh2Ww=;
        b=k2NmbnuUCkXppr0DFUtpIlkKl94kXSmP1aer8+CXPyIWpfIHDPjyt89XRUQ4F/5bOi
         8F0HHQFsdEFZXOMy8sg1qqaUhLhs6rZDDesKl6tW4B/ovxauDlF1BiIRJsIsFeThtwOc
         4e6LqYOjUZWdxZmvqc5J63N8lvuHnUy96d6nkL91MRKGRZNQMZ64AKMk4cLJBPPRTyzf
         iU4LDVWC3+wb4HFCtaS2aZrnVNS1JQu1/D4JJMYBxhzdmyavfI6yTlRPjyKiw1PfmQb8
         9APR52yPNbbvloRGJXfU2YvxsX2VFsoH6gNSvAUJaG4Smfb2Z0mY3/soAUcucI4REgJZ
         ovFQ==
X-Gm-Message-State: AOJu0YwbONgz1iL4VayTCv3W/DN/hTl4bf0himCBSL8Cn2fcXE2yxQ+1
	CADXeTNWjQX+AJxAC9w21ZSCi/mVMHF405vacANJ3iew3N05W/9q1gqoG1n7MeM=
X-Google-Smtp-Source: AGHT+IE7rG2/g32CPYKAv4eA0DehOawrIG6WaReqhZ1Nt0rzfC5tlkdl37IwezvjwkTTMwAkHd9zGQ==
X-Received: by 2002:a05:6000:e42:b0:349:8a7e:e0af with SMTP id dy2-20020a0560000e4200b003498a7ee0afmr7326422wrb.11.1715004629734;
        Mon, 06 May 2024 07:10:29 -0700 (PDT)
Date: Mon, 6 May 2024 16:10:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 12/12] PCI/ATS: tidy {en,dis}able_ats_device() a little
Message-ID: <Zjjk1Fya82MGzyHA@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <edec0260-e338-49aa-a21f-c507ef9e35cb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edec0260-e338-49aa-a21f-c507ef9e35cb@suse.com>

On Thu, Feb 15, 2024 at 11:19:46AM +0100, Jan Beulich wrote:
> Use appropriate types for the control register value as well as the
> capability position. Constify a pointer. Use "else" in favor of encoding
> the opposite condition of the earlier if().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

