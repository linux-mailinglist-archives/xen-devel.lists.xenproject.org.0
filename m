Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98C89FF0E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 19:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703525.1099167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruc5C-0001Pw-27; Wed, 10 Apr 2024 17:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703525.1099167; Wed, 10 Apr 2024 17:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruc5B-0001M8-Tx; Wed, 10 Apr 2024 17:50:01 +0000
Received: by outflank-mailman (input) for mailman id 703525;
 Wed, 10 Apr 2024 17:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruc5B-0001K8-Bw
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 17:50:01 +0000
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [2607:f8b0:4864:20::92b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf7ee5e0-f762-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 19:49:59 +0200 (CEST)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7e7bd3e7d0aso195661241.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 10:49:59 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f17-20020a0cc311000000b00698fa74199fsm3979247qvi.1.2024.04.10.10.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 10:49:57 -0700 (PDT)
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
X-Inumbo-ID: bf7ee5e0-f762-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712771398; x=1713376198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUbwomd5J1OW3cjrKO13gp2AC0+F0qqAeqKGk5r28uI=;
        b=Ol9eRQPdQV54KfDFQnG7YRSfUduG9v+vRdyRGDVtfj1h0YDye1VIqw+ArUkzg3Blgq
         yD4e8RBTcw/NWaDioZ+FhQI8hHoYwVoOmbCiTSMfUe1TgF6AdB00KIGSmmU83m0Ji72c
         rHJxfXhNFhfCNc6fxdKeGdM4h5gQ7wwudmC/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771398; x=1713376198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUbwomd5J1OW3cjrKO13gp2AC0+F0qqAeqKGk5r28uI=;
        b=N4YqUP6wgn/i2AVNqJBLzNMyeZgddwAFGODT1dRRrdnMHWa7FJ5zW0jaJYShWl+0CR
         BslbpkASyhsgINLYNudDnmG16EPC4B32uTllcM2BNZj6P6WnGkh1FPhX4RC+HD6j8mj7
         ihY6MU4Q/eZntEXGo/pS7akoL45EaTn1Vl0AWxacTnPoxQvuV/Yik6QSKNLSbhk0diDb
         7Yw8j68Y4lEMphquQM2+W/gOar8cS/o2JVjm8hlfYgKETFLO1weRkcRektszlr2hVu/s
         ah/+LtA/VO7M1YrDrRcWaR1gmRYdEf9+scJziAkT5EgKvo+t3gv1VChKcQg2PNumAR0W
         pb4w==
X-Gm-Message-State: AOJu0YwJYM+i2tTh8M5WLZrOXYdMPp7KCZScJ/G6Gz07duz5+Ahg62Wk
	fSzVfeX2XsZBeHU2Csouwk6nZMYrHy5NRNgZJOIx5kG4AvbX5E4r3QAC9t9Ilc4=
X-Google-Smtp-Source: AGHT+IEQmSURNEb+vr6iSgLBmKz8OegheTCoJyXmyDSDxKwPMCcrZMXw75vwYRT4YHn1LdxtaWz80g==
X-Received: by 2002:a05:6122:1d8f:b0:4da:e977:1fb7 with SMTP id gg15-20020a0561221d8f00b004dae9771fb7mr3420436vkb.15.1712771398130;
        Wed, 10 Apr 2024 10:49:58 -0700 (PDT)
Message-ID: <7a6ae6d2-f070-4b87-9c40-688cba3184de@citrix.com>
Date: Wed, 10 Apr 2024 18:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <Zhas4MQdL3hQ6Uww@macbook> <2fd969ef-8326-4ae8-a568-4256f00542f0@citrix.com>
 <Zha_hXU3zRwVzFZN@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zha_hXU3zRwVzFZN@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2024 5:34 pm, Roger Pau Monné wrote:
> On Wed, Apr 10, 2024 at 05:21:37PM +0100, Andrew Cooper wrote:
>> On 10/04/2024 4:14 pm, Roger Pau Monné wrote:
>>> On Thu, Oct 26, 2023 at 09:55:39PM +0100, Andrew Cooper wrote:
>>>> +
>>>> +config AMD
>>>> +	bool "AMD"

After double checking what {menu,old}config looks like, I've extended
these prompts "Support $X CPU" so they make more sense in the context
they're asked in.


>>>> +        default y
>>>> +        help
>>>> +          Detection, tunings and quirks for AMD platforms.
>>>> +
>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>> +	  must be enabled for Xen to work suitably on AMD platforms.
>>>> +
>>>> +config INTEL
>>>> +	bool "Intel"
>>>> +        default y
>>>> +        help
>>>> +          Detection, tunings and quirks for Intel platforms.
>>>> +
>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>> +	  must be enabled for Xen to work suitably on Intel platforms.
>>> There seems to be a weird mix between hard tabs and spaces above.
>>> Naming is OK for me.
>> Yeah.  I already fixed those locally.
> With that fixed:
>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

We can always tweak later if necessary.

~Andrew

