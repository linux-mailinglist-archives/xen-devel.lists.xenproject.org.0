Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP1zOohuEGqgXAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:56:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD095B68D4
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 16:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316956.1586287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRHp-00078o-Ay; Fri, 22 May 2026 14:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316956.1586287; Fri, 22 May 2026 14:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRHp-000765-8J; Fri, 22 May 2026 14:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1316956;
 Fri, 22 May 2026 14:55:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQRHo-00075z-Ke
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:55:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQRHn-002gHx-Ma
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:55:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106e6b-e002-0a2a0a5209dd-0a2a4507aeda-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:55:39 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a106e6b-229c-0a2a45070019-d1558035dd2d-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:55:39 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso51067675e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 07:55:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49048c6acf8sm5696675e9.10.2026.05.22.07.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 07:55:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779461739; x=1780066539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYMB1KIId4yJCMr6zMiGmSHFkpr56ebGf9Xev1KwhXE=;
        b=M/wN19RjPcX7zZdt2uixq8j7W9NNx7zWlCeh6uSr/I7Glezyg/FxPs2+nvKJbLRfXH
         b8rk01vK2vCCBWZQTUmVVTLquXHZH/t0SC4I5TSjPtwDVVHLRjeOstt1D/1Cp+6tM6i2
         gXcZvqnFPeFl+IavEfMKB/raRcUYDzaxRBMe9hGKIcYm5LgVhuo7m9iNTJLYkwAAcUta
         SYWYIRaFzVIKYG1KY9176+yKcKI/z2vIMu2l+dqdBwTok8D+37uA/2IeWCetj3dDt9BG
         Ot7kCtxv8SrwVtXeFI5yWmiG29xhOBo7G0ni+rc1fWpOOaqnpT8zYBqm3JmvPgXOwV9B
         OT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461739; x=1780066539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYMB1KIId4yJCMr6zMiGmSHFkpr56ebGf9Xev1KwhXE=;
        b=nRUd4nOkMjy0L7oLWdP+0JfQF7oJtC8R8H/AQOA+sqw3Tsq8kZ5U4W8DY9EB+UHXj6
         bCD4rQpgXPWXMUwwU8vFamDDawDySz1YuyMjzqCzHNoR8a5EowS9enUM/pwUYAuDwwRW
         MvYzgyTpK4VwVmsbUfQ+YG3HYYSSYBXm30f3jjSI3+nlEO+OrnZCQpoHxcw16UkRQCvz
         wNvEW8rrulEsX8flIgSIvHWZ5wlEg5Ft/J39nMHfuJoIJ3zHKjI8xIoOIq72sQvFyBy5
         HGLgzbm9pjMIbUyTUr8ZxFVMRW8QPtipP4l6vNDnuy5TERALA0Wbh3iaGDkj7eYbY1It
         5gUw==
X-Forwarded-Encrypted: i=1; AFNElJ/y0hJ4RWvky2iHG77FConSznVSyRTJgO2oqlWP6O2D7TCq0MeYDGx2bSVwWWBxOuB7YXkuXNe2bc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzStktYDy3fYSDi+Pm7y6j8ii4kUl9vLKqcE6wlOTOoN0hZqDDW
	VTooRh/mOuGBGJv/U+rqItmI11rSMCV8IYVcTUPArqTTPn8Hx4MlFAH2
X-Gm-Gg: Acq92OF8TMjY8IW8eG14lPOx6o+Z7lAwZddGNeGw5DBkayHEvr6d30WsR90uQfqMXKT
	ZL0fKyI5/Spu99vEKYgsdMd4KrYGIiu+OC5Q+MtnhIheRrdJgtWW6nVIoWRMGHFVacMLgQWmAdZ
	04a+9GV3XtSGiv9qnGlc0BHg5JM7oCorIh3XRI36l+gf8u23vjeRflYdVRKG3UipR9XWk3peygt
	Z6hjkOprzHnw0dtVeTh14cHadKeNMyD+2eihL5Qp3C5zKkuhskVCYcgb1W6YDcQ3rqvdFh2rPD0
	oG6nU0qURl2pdSjDpLVBenmY/EATBRKprgZ0oPfo/lUs5ibNKcxu183k6n40IAezklkpmWhv517
	OeSdvlSQ7anhwvNCCwf0EwbqrVT2fdKzi3gQwQ11oPdtZ1RuExNgJvLSVspFjvGTmeXpeHyNd2f
	TLCWTl+fVEhJWrB/2i1PjYw4Tp43k29Wz+eWaPjYfG1l6wOl6V4G1buGCkTGLafYvDC7GX5GpQ4
	6ZaHAIPjQ+eZw==
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490428e5a6amr59617785e9.30.1779461738883;
        Fri, 22 May 2026 07:55:38 -0700 (PDT)
Message-ID: <faa36370-d9ed-4c9f-b041-25a0e1b0a9a9@gmail.com>
Date: Fri, 22 May 2026 16:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/26] xen/riscv: introduce aia_init() and aia_usable()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <66ca7f49756740c3d54ac660bebf406479ed011e.1778250616.git.oleksii.kurochko@gmail.com>
 <c4054fd8-5491-4cdd-8921-e058c2243f7f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c4054fd8-5491-4cdd-8921-e058c2243f7f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779461739-23B78C48-98246FA9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1824
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5FD095B68D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 4:57 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> aia_init() is going to contain all the logic related to AIA initialization.
>>
>> At the moment, it only checks whether the SSAIA extension is available,
>> and if so, sets is_aia_usable (which  indicates more than just the
>> availability of the extension) to true; it also signifies that the necessary
>> components (to be introduced in follow-up patches) have been initialized.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit again with a comment for consideration:
> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/aia.c
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/sections.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/cpufeature.h>
>> +
>> +static bool __ro_after_init is_aia_usable;
> 
> While in an if() the is_ prefix may make sense, in most other uses (all
> of the ones below, imo) it is of questionable value. I'd suggest to drop
> it, but of course with the then leading underscore retained, to ...
> 
>> +bool aia_usable(void)
>> +{
>> +    return is_aia_usable;
>> +}
> 
> ... not conflict with this function.
> 

IIUC then I am okay with the following changes:

-static bool __ro_after_init is_aia_usable;
+static bool __ro_after_init _aia_usable;

  bool aia_usable(void)
  {
-    return is_aia_usable;
+    return _aia_usable;
  }

  void __init aia_init(void)
@@ -19,5 +19,5 @@ void __init aia_init(void)
      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
          return;

-    is_aia_usable = true;
+    _aia_usable = true;
  }

~ Oleksii

