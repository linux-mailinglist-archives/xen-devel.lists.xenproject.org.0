Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D9209A26
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 08:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joLpC-0003JY-OQ; Thu, 25 Jun 2020 06:57:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bJ+=AG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joLpB-0003JS-PT
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 06:57:29 +0000
X-Inumbo-ID: 222badd8-b6b1-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 222badd8-b6b1-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 06:57:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k6so4645118wrn.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=szCiaWbBc/QLQKscU+Ab67r+h00I2UsP7dR/oAh2Bsc=;
 b=mUAPzUbHpsUaO3D1zWtKMa0040E0TSkEnaUDosIRai6z7sIS49QJsbbwPRAGG3qzWK
 e0VeLHFKq7TQwLCblBp96hpy/6i1IMvrPUy7aDplB01sJl4NzERHEo7qzlqDX+qpdn70
 rRtdCMXq0/t3md6Ib6bw1wusek7laLT4yFH22NHHJ68mYalRQrdZQxdk6J48TN6dbBDL
 eAc41kUrQu36LRLUgPJvSH1BCFWXNuNlmmW+hcNTk4ED5tqbzFBG+8069fG5BAmhPkgH
 +gN6LXf6PA5JPshOiWKdvuDj7H9Fm89O+r2IxECNnDywOD+Ub67yYPj3gvLuqdFySFT+
 7R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=szCiaWbBc/QLQKscU+Ab67r+h00I2UsP7dR/oAh2Bsc=;
 b=anP+I5m+PFmpdgDcPwavTS8VXpvR2whYYOVvWF7rMSJDQ1htLYw2LJVfVFTe+uqls7
 a12Z+raHLEpB00gkY0GS01thVW/mo80U0TVtZ+srtf+4cHhdp2Mfrg9z/zDIBK0E9UNg
 6l0sUOqMin6VEELLI5TycBnK6epQrsT0/Gd9YQSByh4ke3sl2vI687d4zRCdA+KLNmCr
 MEB6OXiiRln0Vs/tGrf1VNREW2tbH+iL1wyPxEYylwow1TMroCks7SczYjHQS+oggAIE
 GhacjXZNz93ImnQKkvV7Lyf0vyrUqjQ5BLzmmzFS3AWJtEEEdrxTt7Jn/UOIEbMxxozh
 D0CA==
X-Gm-Message-State: AOAM531GZAInt0g1k3tVUYef2xsILBhXHOF8hWRqtGcKi2C/weo8WDE2
 2as3nBHFKT9z/lhtn2314nE=
X-Google-Smtp-Source: ABdhPJyEWIqLdTLRBO9eswaBz0H1p+Qzd3rhtUZ/THAzBr0kjvhEe1LR/i4ZkzI4IWxcb25h5DZWog==
X-Received: by 2002:adf:e749:: with SMTP id c9mr37860167wrn.25.1593068248354; 
 Wed, 24 Jun 2020 23:57:28 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id c20sm27289994wrb.65.2020.06.24.23.57.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 23:57:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
 <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
 <db4c744a-a7f5-7499-a1f2-3276486d89c1@suse.com>
In-Reply-To: <db4c744a-a7f5-7499-a1f2-3276486d89c1@suse.com>
Subject: RE: Ping: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
Date: Thu, 25 Jun 2020 07:57:27 +0100
Message-ID: <000101d64abd$e376b3d0$aa641b70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFLSWsOaDQxr3vkX7lc5kkKH9cReQClPCHVAeSkPHCp6pnN4A==
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 June 2020 16:36
> To: Paul Durrant <paul@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; =
xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Ping: [PATCH] x86/CPUID: fill all fields in =
x86_cpuid_policy_fill_native()
>=20
> (sorry, re-sending with To and Cc corrected)
>=20
> On 22.06.2020 14:39, Andrew Cooper wrote:
> > On 22/06/2020 13:09, Jan Beulich wrote:
> >> Coverity validly complains that the new call from
> >> tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() =
leaves
> >> two fields uninitialized, yet they get then consumed by
> >> x86_cpuid_copy_to_buffer(). (All other present callers of the =
function
> >> pass a pointer to a static - and hence initialized - buffer.)
> >>
> >> Coverity-ID: 1464809
> >> Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID =
serialisation is sorted")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/lib/x86/cpuid.c
> >> +++ b/xen/lib/x86/cpuid.c
> >> @@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
> >>                            ARRAY_SIZE(p->extd.raw) - 1); ++i )
> >>          cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
> >>
> >> +    /* Don't report leaves from possible lower level hypervisor. =
*/
> >
> > ", for now."
> >
> > This will change in the future.
> >
> > With this, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Paul?

Release-acked-by: Paul Durrant <paul@xen.org>

>=20
> Thanks, Jan


