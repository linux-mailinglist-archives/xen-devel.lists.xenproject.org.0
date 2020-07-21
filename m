Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435AD227940
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 09:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxmP5-0002ud-0c; Tue, 21 Jul 2020 07:09:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDR4=BA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxmP3-0002uT-VW
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 07:09:30 +0000
X-Inumbo-ID: 1de5cd89-cb21-11ea-84f2-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1de5cd89-cb21-11ea-84f2-bc764e2007e4;
 Tue, 21 Jul 2020 07:09:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id f18so1762934wml.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=HzrjnWe/4mTstvWu1GALcbzpv4WHCbnOVotodTJVkCM=;
 b=WwbLMiyjAj5o7tOzLMsEG7Icofdsxm5YgoUf0FNdCOz7n+IkFEhZ5qO6BSo7dBJwpH
 nf+j7NlAPlLV3dyFhiOPvBR96OMoUREx8wGe09Q1wtNvJHcT+UmlhDwxKRoepNgyuyh4
 7A5vnGBy6gvHqtcZMdCaOV6e0wTCxcDTyKST5pqQ+kpKgdmMlydKIHoFNS/B3Ms41Az5
 4r1H4f4uFjbDak9fbYUl0knIrYTyAbm7WXPmucKrb+OldzHAHpBJH6lcmTS2veE6uX38
 67F7/HDjpmOFer2UymyMdJNVYFmOKdtP9vHsajbtqUmMvWBL0LElJ9TMi7ZuAHvztgFc
 SPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=HzrjnWe/4mTstvWu1GALcbzpv4WHCbnOVotodTJVkCM=;
 b=YtQv7+Un+2AvZm/dx9A4Z16tyBAT6BQ7u9KJWwGJxvfcyKUzkd/9yaZWKvHVgJArSl
 e+ZrRMZ9hMAVmwskISYtBcWRLRQ4gkpNXacV/7SgIokLvzzRu6tT2AR8xoqP3qWWWfXV
 SF8uY+gHojRDJ3fDaUBXkABJdFPxmPzqIpgrnMZDNTXEs30+zSC7iY2bqW7yr11SwxWZ
 iHMg/wjTzDzEt45A11Ea5+bRSCbZWTWULo1wmnlOTfa4sB4Wb4JsErpL0VRSC/R6wU3G
 CyfRzhpFpH4imqSd8o050i89G1Wq0Pemekd8l0GL2UMoVLJ1WzHnaWpZBxgXe2tzw978
 SmPg==
X-Gm-Message-State: AOAM5307IfdV7ldZ9ix52BAvMeyP7xFJdL3SvREPZJwqnraTEMUNxu4B
 HrrkoianJgpJ6A8NAJvDZ90=
X-Google-Smtp-Source: ABdhPJzIVeblSd0ad0JtzAaGVDQgtGzIwl6Al+M/ZW2KRDoZO7m2p7OjNuYzfdX5DzV7vuNzGekxwQ==
X-Received: by 2002:a1c:9c0b:: with SMTP id f11mr2640108wme.0.1595315368039;
 Tue, 21 Jul 2020 00:09:28 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id y16sm37353587wro.71.2020.07.21.00.09.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 00:09:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200720173635.1571-1-julien@xen.org>
 <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
 <627851f2-d28e-5c3b-6f1f-882e9eb02ed4@xen.org>
 <aae69fa5-4aee-781d-2f52-291d8fa948bd@citrix.com>
In-Reply-To: <aae69fa5-4aee-781d-2f52-291d8fa948bd@citrix.com>
Subject: RE: [PATCH] SUPPORT.md: Spell correctly Experimental
Date: Tue, 21 Jul 2020 08:09:26 +0100
Message-ID: <003801d65f2d$df17bc10$9d473430$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIJA8r+zryR5zyBmuKSqGVsBFT/MgKv6aA7Adqhqd8Burtywah6KbBQ
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 20 July 2020 18:49
> To: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>; George Dunlap <george.dunlap@citrix.com>; Ian
> Jackson <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
> 
> On 20/07/2020 18:48, Julien Grall wrote:
> >
> > On 20/07/2020 18:45, Andrew Cooper wrote:
> >> On 20/07/2020 18:36, Julien Grall wrote:
> >>> From: Julien Grall <jgrall@amazon.com>
> >>>
> >>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> >>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> Although I'd suggest the subject be changed rearranged to "Spell
> >> Experimentally correctly".
> >
> > Did you intend to write "Experimental" rather than "Experimentally"?
> 
> Erm, yes :)
> 

Since this is a small docs change...

Release-acked-by: Paul Durrant <paul@xen.org>

...and please commit to staging-4.14 a.s.a.p.


