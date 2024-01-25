Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B7F83BCE8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 10:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671408.1044735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvkb-0003W6-OB; Thu, 25 Jan 2024 09:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671408.1044735; Thu, 25 Jan 2024 09:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSvkb-0003TX-Jz; Thu, 25 Jan 2024 09:10:21 +0000
Received: by outflank-mailman (input) for mailman id 671408;
 Thu, 25 Jan 2024 09:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSvka-0003TR-U5
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 09:10:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff4d52c-bb61-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 10:10:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso77051995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 01:10:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b0040ecea22794sm1708714wmq.45.2024.01.25.01.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 01:10:19 -0800 (PST)
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
X-Inumbo-ID: 8ff4d52c-bb61-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706173819; x=1706778619; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13hw+jSl0gF3eZ6rlPYeh061glQKyoDVGbDjjwDq6vY=;
        b=bZIl0DKjVkdJ2V4CwZgb30krPBbJvFICRfd3Ahpd42qYHHf1T2Wmi7QTVafbsAgRI5
         0XtzHYQ/sWlcfi4xfqTefW+/B2l9ujxDQ2lywPfPzJ7xKhdgOBx8na9/mQeq29KTBOe5
         hud/z3sZBtsWPfC5E9o0p4TjRYOUoJ5wp1gTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173819; x=1706778619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13hw+jSl0gF3eZ6rlPYeh061glQKyoDVGbDjjwDq6vY=;
        b=Eqq5tY6v4CqsYpS9Y0PRYJ6WQUjdCuB9k5SEPobHB+hE70Qv21mCJWkI6Yzo8vhD43
         eif5apNU0rx2z4+GhyXZe5TL3p9MfJUf9xzmagNUrbDZCoc/yS/nS9MPEhQv4STt0fqR
         agujtoqkRfsWjrQDupgpZXkwXo7CDXzimGc0EITko/WzzDj6SNG1HWh344WvOaD5r4o+
         eMuCqrm6otVzEFXUJZW1GUZbUuTj6x567xsqhzwE9kMqU0v4LTzpUDpgCxX940nSh7o2
         /yYn3yxUK2Rvwa4smipoZ9l5LcSgehPKW8YHGlMvXukQd8v40alkeN7RmRZfi8cg61Y0
         zyXA==
X-Gm-Message-State: AOJu0YxMkMzNeb8aOGP6wpkiBBDAqUwzXx7OoQG7Kk+uRx58em4lTvp2
	pZ2oQyYIo6w/8RsrKCxLeqyoDP/Yo1jP+uodbGFsQx4Y/Jf/C5c7PT+Pkf0No/I=
X-Google-Smtp-Source: AGHT+IHK8IV1xz+aLtEH/Ews7qXoRV7VAnsVSxr00M4NCEMFDAim6Ov5lUXhB2r0C8rIi1GNTtErkg==
X-Received: by 2002:a7b:cb16:0:b0:40e:54f1:5d3e with SMTP id u22-20020a7bcb16000000b0040e54f15d3emr173043wmj.199.1706173819612;
        Thu, 25 Jan 2024 01:10:19 -0800 (PST)
Date: Thu, 25 Jan 2024 10:10:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/NMI: refine "watchdog stuck" log message
Message-ID: <ZbIleqqWHTY4vhqp@macbook>
References: <87108f1d-4b13-4c1e-9432-4f14d4f5c12d@suse.com>
 <add9b6b3-cc50-4165-8f63-cd4541a3ba23@citrix.com>
 <c8f3e7d4-8b7c-4835-b63b-dc784f27a936@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8f3e7d4-8b7c-4835-b63b-dc784f27a936@suse.com>

On Thu, Jan 25, 2024 at 09:05:13AM +0100, Jan Beulich wrote:
> On 24.01.2024 16:55, Andrew Cooper wrote:
> > On 24/01/2024 3:21 pm, Jan Beulich wrote:
> > but if you felt
> > turning this into using a scratch cpumask and %*pb then I think that
> > would be nicer still.
> 
> I expected you might say that, and indeed I considered it. But then
> I wanted to keep code churn limited. The way it's done it's imo an
> almost purely mechanical change. Much like with Roger's consideration
> of further refining the message text in the error case.

One suggestion I had in mind (which is not explicitly related to the
fix here) would be to taint the hypervisor when we hit such selftests
errors, as that would make it more obvious to go search the dmesg for
reported failures. I think it's still fairly easy to miss noticing the
watchdog selftest failed on some CPUs.

Regards, Roger.

