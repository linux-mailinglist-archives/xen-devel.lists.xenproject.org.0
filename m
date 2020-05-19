Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CD11D9B66
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4HX-0001hv-8P; Tue, 19 May 2020 15:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb4HV-0001hp-Ms
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:35:49 +0000
X-Inumbo-ID: 69eae8c4-99e6-11ea-9887-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69eae8c4-99e6-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 15:35:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id w64so4117795wmg.4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=iZ9GK+2pKiMpaDV0l248S1LD25qGZ49UXbb330WifgI=;
 b=WQyFWW1OHP/EgPG0Kg8ZCfISC+AuO32mkjjgpfa6dQbzBwa/bGPQ7zG/CpdM6gR7Fk
 S6HjYbG1qAVtW6PzQu/dfbF2bnEK/oRcdSVm3/aIJBZoORhsAtLETwYl9OA3AaWJDPhX
 l5WYLAC5/gp87cIXeOvv2fZd8+X2eppxERoVntdf0rQMx2A842OfPIg3SdS3eruazegP
 FSZZbePcLd4HJieb1ry5dKylNCaEiVChXkEjVERWDxe+imA0sqdfzuG4mFT7YewHnNvy
 vS1yUQZHIn8+SNel/miXa268i6t96Vs2zERfyyUL9TJqc6A3Qq6oug9W6+8i6dGd06RE
 tsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=iZ9GK+2pKiMpaDV0l248S1LD25qGZ49UXbb330WifgI=;
 b=c+HMlQ77Zsr4mjsaGaDCbXEuFD+M3TZw1dcgvjxrPByhTLXP3SCkEKgvU+/ps7q7XD
 1xYI69VIO6AtY2zQvnaNjNIj5LTnqi0vvu1tzaQckpamGPoCX9Al5E+anK/XfkqRhYTt
 8qN4cHpiEZsfvHwNumsvSMqi6S/JkfPcJw+tdlYDvMV8SC5gmGS8OF/pPP/PQXojsiVm
 Lk3bOlllTco49A8hGXAJ2YtsMfwtrG6RvuR9Ly5Xi+RVXMTBosTxxVleMcgt/As3rULj
 L4Y+ADV8UA01WJqkYSPgUY+NVJcxHUTIRA1ZWa6OuKEvEuaPGnGLM7UO5CKUOWRjNXaD
 zFkg==
X-Gm-Message-State: AOAM531fUC2B2JUV4GtdK2qGj6W9X0Ys1HOnfwE/hw5uZA96vOQ72dQG
 JLlagBHEzt95NJNz7ToXtIw=
X-Google-Smtp-Source: ABdhPJyk1ExcUlWNRggZ0HhHqmKdA1p4JSHGtP2Co9otprbafUdV+vN570LmIsEZk2IYGwz4E1jEig==
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr6097942wmf.186.1589902548360; 
 Tue, 19 May 2020 08:35:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id l13sm20983585wrm.55.2020.05.19.08.35.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:35:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-5-paul@xen.org>
 <bbebc62f-8066-a60e-5717-58e46cd2d172@suse.com>
 <000a01d62df1$28e876e0$7ab964a0$@xen.org>
 <035bded3-9542-31e1-aacf-515be43b8536@suse.com>
In-Reply-To: <035bded3-9542-31e1-aacf-515be43b8536@suse.com>
Subject: RE: [PATCH v3 4/5] common/domain: add a domain context record for
 shared_info...
Date: Tue, 19 May 2020 16:35:46 +0100
Message-ID: <000e01d62df3$2b222850$816678f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQHAdhdAAmVNhmkClMN59gEjf36DqC2QVyA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 May 2020 16:34
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Julien Grall' <julien@xen.org>; 'Stefano Stabellini'
> <sstabellini@kernel.org>
> Subject: Re: [PATCH v3 4/5] common/domain: add a domain context record for shared_info...
> 
> On 19.05.2020 17:21, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 19 May 2020 15:08
> >>
> >> On 14.05.2020 12:44, Paul Durrant wrote:
> >>> --- a/xen/include/public/save.h
> >>> +++ b/xen/include/public/save.h
> >>> @@ -73,7 +73,16 @@ struct domain_save_header {
> >>>  };
> >>>  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
> >>>
> >>> -#define DOMAIN_SAVE_CODE_MAX 1
> >>> +struct domain_shared_info_context {
> >>> +    uint8_t has_32bit_shinfo;
> >>> +    uint8_t pad[3];
> >>
> >> 32-(or 16-)bit flags, with just a single bit used for the purpose?
> >>
> >
> > I debated that. Given this is xen/tools-only would a bit-field be acceptable?
> 
> Looking at domctl.h and sysctl.h, the only instance I can find is a
> live-patching struct, and I'd suppose the addition of bitfields there
> was missed in the hasty review back then. While it might be
> acceptable, I'd recommend against it. It'll bite us the latest with
> a port to an arch where endianness is not fixed, and hence may vary
> between hypercall caller and callee. The standard way of using
> #define-s looks more future proof.
> 

Ok, I'll go with a flag. Probably is better in the long run.

  Paul

> Jan


