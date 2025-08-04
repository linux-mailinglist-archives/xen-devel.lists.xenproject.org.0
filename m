Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A0B19F19
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 11:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069014.1432859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uirwc-0006l2-6l; Mon, 04 Aug 2025 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069014.1432859; Mon, 04 Aug 2025 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uirwc-0006iX-3v; Mon, 04 Aug 2025 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1069014;
 Mon, 04 Aug 2025 09:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uirwa-0006iF-LC
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 09:57:24 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6880ec81-7119-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 11:57:19 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso25118915e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 02:57:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459dcb86d6asm18645125e9.5.2025.08.04.02.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 02:57:18 -0700 (PDT)
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
X-Inumbo-ID: 6880ec81-7119-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754301438; x=1754906238; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45MldcZFDZfa9n7F93O/FJSzHhJPk1R7jvKrUOH4Ac4=;
        b=sHTdD0nX6t5Oz/K16EnkjfA8wzinkuKF1021Iuk3PlIG1byxIFKqXem1vuAqcm2pdl
         9kylj75niXZkZrhF490fLQnUHqiGtR6eqJKwzEoN50Yyedj4JMHDdKzjsdrcCzasZekI
         RjOkZlObTR/xTmMl92RRIjbDh6JmWXZxOyxCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754301438; x=1754906238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45MldcZFDZfa9n7F93O/FJSzHhJPk1R7jvKrUOH4Ac4=;
        b=IicoBjxPi7fmnIMxj/IxT80/f26ktEtea86wWqTAzG22X3XI2XYO+VNOnIQDtG0Ud5
         74sM3BvNSmNjYlFNUucEwc8APdL1EXaNiHyrhDA0DRCpsDKHECPjHoompgaWlqGB66Ep
         ZlRt3quEFUIcUjHa86H/knERQBeC+lz4uVsbzBZXjnrmk4t5K9a0NjXfkTQgGQfBBxcB
         wWu4lZ3ZXkOmNRx74igwlZGa957VBhPBCuztoJiMp6soJ/bUNaTOdTG8ad8qEQadzvjE
         KxIZ/+MRmlhkdZQXS1iX0zfKEYeiEBz2YvfnYk2Xuyk7fDu00st8NMgIo0DeVXazhj7T
         Q0yQ==
X-Gm-Message-State: AOJu0YwNr2DelU/t1TRHaCicDmNQ4deAOjUP3ZcoBj5BNgWcCkZfDGOU
	RDCDaRoVfAyq8uHWz26KO2nH6sez7J2m53DNNtnRAUvZhVw8T0IzoqlI7+22KvSAqco=
X-Gm-Gg: ASbGncvuAWtuEn5D9/Aklw4JBaIy3cUaQ4xp2abUsNcCcc37LJAV/ncUsNu/YTBPg7D
	6+n1j5beUjHsAiTlueirsMemLwQWiS2dcdJBrbaizu2SGfPz+berm/Magaiy10/VM3IguBX+a1M
	JHFt20U/dqAGIDvliWYTldXJFG7iWr+66iTqJy1ISvKM2ApIn9dmIErsR+1sFxyspjdAaFAT/V7
	MUeAaVRBJcCGz5IzYm5YSnfLhBbzACHuECEtsednl91oK7luOHUiAY2lH+oru9OZgCqD89kWuO+
	CRlC2BDG94zAMFccyiNb6SJh2JCtY+xzkN2wDElC56I1kaO35ecfAgT/C9sILgQfEoTK8+H7YFE
	UA2cHWwCCKvkpN2GN55ZQtX+GjkfF8CgDTXfJ/5vdIFisIpazsXXL4wtlFpaYvoyfJLgIlWvZhy
	zn
X-Google-Smtp-Source: AGHT+IFOOBmQqczUB5Wv1il1MnrmQncEDyobNOAK6ZBifpU7MHIhVb64NC22uOKz8bl1XjxJvuC6hA==
X-Received: by 2002:a05:600c:1554:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-458b6b2ff8amr65187255e9.21.1754301438512;
        Mon, 04 Aug 2025 02:57:18 -0700 (PDT)
Date: Mon, 4 Aug 2025 11:57:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/CPU: correct reset_cpuinfo() comment
Message-ID: <aJCD_e_8eI1eBQIn@macbook.local>
References: <8b4e75c9-7633-4487-b56d-61218dfb93d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b4e75c9-7633-4487-b56d-61218dfb93d9@suse.com>

On Wed, Jul 23, 2025 at 02:00:55PM +0200, Jan Beulich wrote:
> Part of it stated the opposite of what actual behavior is.
> 
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> Reported-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

