Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C594B1D1961
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 17:28:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYtIC-0007rp-Fj; Wed, 13 May 2020 15:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpYu=63=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jYtIB-0007rk-3k
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:27:31 +0000
X-Inumbo-ID: 423dd6b8-952e-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 423dd6b8-952e-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 15:27:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id y16so14241008wrs.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=9atujlcgusW5HYpnti+tAVTbDLW9h5r5ESSqAQKGoYI=;
 b=El8k9x9pPnRMmeA4DcwlA88LCHObx9eQg+njZXhqgT8e7w5M57l2ve8PfzaL8RTOHN
 TS8cm0m59jmLR9gk0Tm7Jw++bPV9DeJH0WEzE2CPdf4e5X7C7eR+k5P42yFmKkA6d4eK
 6u+4X13rWSxiZlXbe0BKT8Xh8+4Ee+zvg58MS1AeogRsgf3Y/75F7fxvdZ0tyjiRGR8j
 MezCj1ZOqurKxZjSs2f+skYNVKY35UTZhxfO3uvzwJFpcYNG2eEcAEBlPAtBnhKYrOaL
 mrXClGktVhaXxw/LUKiqufmhPNDe3L8ryu056j7Iu3cHms+pZjC1CR1Dfizxl7qUxOTU
 DJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=9atujlcgusW5HYpnti+tAVTbDLW9h5r5ESSqAQKGoYI=;
 b=smir2kiYR2JooEi1DlioUVJFjeT49xI7/PFCk8JEkR0u8ZaToDQpwmNMI4Y732M9lM
 hbymR9Nsy0dTygdVnxqcZV/j6iDB3bOCpDXKkXwQVkFN1EyjWLwGEZ/tFRJhFshpXNTM
 BZ9l75OChGyds1ik1SG/z+u+fQFV0BJtZLP/qJiLlmA0ZYcJLwEZO4HJ91TJM9R17CKr
 psT/Bezp2HBHaD7m/64Wp3C16f/hWtWWLMR2lJjedWw2pL62u1YdAoQJ45E1+eEqtC0k
 jWlmW/DtA70PAqRxJUhGunLTbfLMfn62cYwE/p9boEcyU7N+8P6vtzXEIdOwj+8U29fT
 ARDA==
X-Gm-Message-State: AGi0PuakN0u+4r+42p8HW4HfoowsucmP8omrCgKmLSjPWgitzgSoBOBk
 PxH8Z0Qm+O+EmRMeWvGRBUA=
X-Google-Smtp-Source: APiQypIFooOW2UeOBm1MA4feXuxZvob1heQ0TNb+VHV4u/m0Ozp8GHgvPm6t1GG09iuSH7Onygbe4g==
X-Received: by 2002:a5d:56c6:: with SMTP id m6mr31013234wrw.78.1589383649674; 
 Wed, 13 May 2020 08:27:29 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id 89sm27716332wrj.37.2020.05.13.08.27.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 08:27:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-4-paul@xen.org>
 <76e91373-1f7c-bd68-2800-83163fb22aa2@suse.com>
In-Reply-To: <76e91373-1f7c-bd68-2800-83163fb22aa2@suse.com>
Subject: RE: [PATCH v2 3/5] tools/misc: add xen-domctx to present domain
 context
Date: Wed, 13 May 2020 16:27:28 +0100
Message-ID: <001101d6293b$0374bdc0$0a5e3940$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwFxlJcKATUa0IqoISjFcA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 29 April 2020 16:04
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v2 3/5] tools/misc: add xen-domctx to present domain context
> 
> On 07.04.2020 19:38, Paul Durrant wrote:
> > +int main(int argc, char **argv)
> > +{
> > +    uint32_t domid;
> > +    unsigned int entry;
> > +    xc_interface *xch;
> > +    int rc;
> > +
> > +    if ( argc != 2 || !argv[1] || (rc = atoi(argv[1])) < 0 )
> > +    {
> > +        fprintf(stderr, "usage: %s <domid>\n", argv[0]);
> > +        exit(1);
> > +    }
> 
> Perhaps also allow dumping just a single (vCPU or other) ID?
> 

Yes, I can add optional type and instance arguments.

  Paul

> Jan


