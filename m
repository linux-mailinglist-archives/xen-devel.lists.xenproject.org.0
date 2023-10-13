Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B64D7C831E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616404.958386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFSj-0001uC-98; Fri, 13 Oct 2023 10:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616404.958386; Fri, 13 Oct 2023 10:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFSj-0001rz-6P; Fri, 13 Oct 2023 10:32:09 +0000
Received: by outflank-mailman (input) for mailman id 616404;
 Fri, 13 Oct 2023 10:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrFSh-0001rt-VO
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:32:08 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1603b62-69b3-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 12:32:06 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690fe10b6a4so1547173b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 03:32:06 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056a00178e00b00690d7da743dsm11569450pfg.161.2023.10.13.03.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 03:32:05 -0700 (PDT)
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
X-Inumbo-ID: c1603b62-69b3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697193125; x=1697797925; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QT8JDS4d48Jv9Iw7CxbI81UddAFIE1jRso45ubnb8DM=;
        b=SA6hN32jDccDddh9VexbSRYPFx+xkPzqkVPYilQGq7HeKisfy7sTjByN2UrJnoT0Gn
         Rk6M20vVAsJxXsv4ifUS/A5o43ML0yCTUdb1yx4JzkoR8CXPGPaPeEuAGme9Kt54+kqj
         +xbZyc3Hto/UVObmqTX/TZO0jxNRCm+x8/XJMXgiIIh5oKxipvLh6grhDhWP/ogTvYcu
         O1Z1//klMNU3euyyA1dXGp0PstPrOMpFYeLCogo5oLDnQXpIAzNXzZy06nCxBj2YYrhf
         7Bbnkb1JPntvH//4qghWTjkhtiqoJcTriS6mI0adFZQWjb9QwQWteCCge/Xw1VPizKXC
         IZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697193125; x=1697797925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT8JDS4d48Jv9Iw7CxbI81UddAFIE1jRso45ubnb8DM=;
        b=mrlGYXL47uHIH3MEmJvHUR9mc2Qbg7JWg2wLL1fJGL2JLMnZibj9NnwG18d2TtcbOY
         DPbTuXOuu8+C8B0tCY5wd9dwXX/jPPWzjWwBwgTxqlmBlu21BaGljo6UcGn7k1EiE62M
         yKQ3HvcM+3zwnIRu1QE6TpGAieQQ6QIKeVxzB7QbK82aTnoEUPI9RJIIvjC0E5k9VBDm
         hU6ClfoDWMu52SvACcumSCSF+xo8So8X/hBQdgrpUDt3mgYswofwKb/Qs/FdU0d3x5n3
         aOhHcJdctJfvykIk9BD4js3gz+nvzCuG1qGLfTVV7MPriDSqmOY44Gbr1TsB6hKxJCv6
         dsbw==
X-Gm-Message-State: AOJu0YwsRKC9ke9GsCXV7kTkGK83UWzH3qd37XIO9LQ1YA456KR/nghg
	l+enl0DH6hZnfPKQWdwvncWslA==
X-Google-Smtp-Source: AGHT+IH1eMBiIrM/xbdNKZeiDIp3diA8eBl2NiBmBUKGJI+m+MKU60zDZoKUbfLQMNEPpQ8iRH/W3A==
X-Received: by 2002:a05:6a00:1989:b0:68f:e121:b37c with SMTP id d9-20020a056a00198900b0068fe121b37cmr31024332pfl.4.1697193125454;
        Fri, 13 Oct 2023 03:32:05 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:32:01 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Skip memory nodes if not enabled
Message-ID: <20231013103201.GA928468@leoy-huanghe.lan>
References: <20230928143110.248221-1-leo.yan@linaro.org>
 <a8d87efe-908b-8eed-dc42-550037051492@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d87efe-908b-8eed-dc42-550037051492@amd.com>

Hi Michal,

On Fri, Sep 29, 2023 at 10:11:19AM +0200, Michal Orzel wrote:

[...]

> > +static bool __init device_tree_node_is_available(const void *fdt, int node)
> > +{
> > +    const char *status = fdt_getprop(fdt, node, "status", NULL);
> Please see Julien's comment for v1. To save some jumps,instructions
> we should also check for length of the property to be > 0, just like we do in dt_device_is_available().

Sorry for I missed Julien's comment.  Have sent patch v3 for review.

And apologize for late replying.

Leo

