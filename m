Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FACF8D4C58
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 15:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732713.1138744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfcC-0006Or-N2; Thu, 30 May 2024 13:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732713.1138744; Thu, 30 May 2024 13:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfcC-0006MT-KS; Thu, 30 May 2024 13:14:44 +0000
Received: by outflank-mailman (input) for mailman id 732713;
 Thu, 30 May 2024 13:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCfcA-0006MN-Md
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 13:14:42 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9297fae5-1e86-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 15:14:41 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-794ab0eb68cso92588285a.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 06:14:41 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb18b027fsm65531381cf.76.2024.05.30.06.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 06:14:39 -0700 (PDT)
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
X-Inumbo-ID: 9297fae5-1e86-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717074880; x=1717679680; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xbga/+JxbiPkiiuMYw3s9l83Twi+4Hqsqx9Nq475CQE=;
        b=n7yy8E0eXoou5q3o3G/4yB1CPizBZgUjpQfKf2dLfCs+SYcj7XQgzBgzAB1EOIev5I
         dVWzf1JzKzgRR1Y2NCh9ifv4fP0hpL3pD149sIfqHnybyp6b43rDumLSPWRvTbepD7Qn
         0CLilJpvYDCftipOekdzYC6bvT+HcyH4OHccU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074880; x=1717679680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbga/+JxbiPkiiuMYw3s9l83Twi+4Hqsqx9Nq475CQE=;
        b=Y8zoBi3CH0NKrehZDwLsEy1YqTisa5UGNVAAbNO8/HrxhyeUm42/aHAol9vBCsSee/
         ulaweZ47Ck5GcvUK9w97tOsOVvpzzzAk+928JAmmD/DBnvoQ1XoyBMkJSGF88IZcB1qB
         swReazKbHvytZ/qyFfVdt8idBJ2PTwKA7vJd1hOOyHPglNx7rDtvYWhVTkEC08pngOwm
         1ubOmJBnYgunzKbNUOs0I5F7U1Y5b82JPjuBK04pPU/S0P667iY609HibTLeDc+5Luu0
         SF9F+MIoD5dq00G/jD9Y3fAQS/78fNwoJ4sxzGRPyZ3UAr3NyFyAcKdwohb0VfzfTWiI
         dd4g==
X-Gm-Message-State: AOJu0YyCUDArL9miVagZsUn2ged9dl0nHM5TdWUjAi2x9CEln4T1YCA3
	1vit8yFHRgiGqlvdyQOF1GuPh5DzewhAcIm2Gw46KF/+futyOFQr9aRANHusrAI=
X-Google-Smtp-Source: AGHT+IHIgaB7UKhhdbvoRc5d1psxZQ5SKNxQT1S/t9pW8iWAFFgunQOihZvr30j2U2Bz42sMR085IQ==
X-Received: by 2002:a05:6214:48d:b0:6ab:6d2c:ceee with SMTP id 6a1803df08f44-6ae0faf57a6mr26698856d6.21.1717074879875;
        Thu, 30 May 2024 06:14:39 -0700 (PDT)
Date: Thu, 30 May 2024 15:14:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] tools: (Actually) drop libsystemd as a dependency
Message-ID: <Zlh7vRwvICxVg06f@macbook>
References: <20240530101439.16730-1-andrew.cooper3@citrix.com>
 <ZlhcyOmu_Cc92pP5@macbook>
 <71bbc310-1093-44d1-a0b0-e5a8ab10a0ea@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71bbc310-1093-44d1-a0b0-e5a8ab10a0ea@citrix.com>

On Thu, May 30, 2024 at 12:12:19PM +0100, Andrew Cooper wrote:
> On 30/05/2024 12:02 pm, Roger Pau Monné wrote:
> > On Thu, May 30, 2024 at 11:14:39AM +0100, Andrew Cooper wrote:
> >> When reinstating some of systemd.m4 between v1 and v2, I reintroduced a little
> >> too much.  While {c,o}xenstored are indeed no longer linked against
> >> libsystemd, ./configure still looks for it.
> >>
> >> Drop this too.
> >>
> >> Fixes: ae26101f6bfc ("tools: Drop libsystemd as a dependency")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > LGTM, but my knowledge of systemd is very limited.
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.  TBH, this is all M4/autoconf, rather than systemd.

Right, but it's about systemd dependencies which is what I don't know
about.  The m4 stuff LGTM, whether it's appropriate to drop the
dependency is what I can't be sure about.

Thanks, Roger.

