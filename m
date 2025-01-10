Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D746A0984A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 18:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869880.1281337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWIcs-0000Xw-B6; Fri, 10 Jan 2025 17:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869880.1281337; Fri, 10 Jan 2025 17:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWIcs-0000VR-7X; Fri, 10 Jan 2025 17:16:50 +0000
Received: by outflank-mailman (input) for mailman id 869880;
 Fri, 10 Jan 2025 17:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uskN=UC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tWIcq-0000VL-Tb
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 17:16:48 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abd31dcf-cf76-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 18:16:46 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-43635796b48so15130975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 09:16:46 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a9362947dsm3653964f8f.40.2025.01.10.09.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 09:16:45 -0800 (PST)
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
X-Inumbo-ID: abd31dcf-cf76-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736529406; x=1737134206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ET3va3W5qodirtlnB3hmd7FzkttgNwj+uXCKjs0LgWw=;
        b=bKbz85SJmOU3yqH2i2agBHSyTxlAGcbXDK3y3UNnAsn/7iQl57AsG3ieoV7TcMKzf+
         jEJ6QyUnBxzvBYwcnM3mfB7Snm0kI661ZV7Wi+tUrUjzkRjguCa12lcBgMSYvqWx9248
         Ia1F6LwSOnWQGrRrQPh+h0vj+KWm/Tqv3qFKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736529406; x=1737134206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET3va3W5qodirtlnB3hmd7FzkttgNwj+uXCKjs0LgWw=;
        b=pfrtGoN166ipaRP4uDpGomsCf7lHo9u3xXX92gHTPLe/o45ia5FnawuOZiuF+f9p7B
         nViF5TxYt/CxwXO7mBm2Z/f5bNVz+nPg9+o4WWGUoP0YMYgkBvhtQEe+4FcPzWXct/2G
         JsssP+/AF9+HTWPEb4VsIIBWNyeoMP+/33h6TEowXAojPEx1vULtMfAvk63UaFlviVDV
         z2fOHAFj7HsjsxBQci8aGqQUDkUrPFptyAxADzjg3xwkR8ItCVsmhjeOadcD+2gmXOJH
         6fJeSN/bMu3rP3XqcWyMWFdkjVWaWVTX5dY/9Lh2n9eewTzrgOm8p/Jh3S99vGdPkPAl
         RaXA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZshsnR2tfE34PE8/eoDUf/wPWYjoiHKXRVycp3PQEFbi8fvn/6H3VT27UZgL9WAMHpgtx9YfyUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9eQ8RbYFl9929WMgUOO1L2IBCoS2UJ6Gtxk9eNXxV7WFp3qRC
	YrghPEektAGEN4LeITcdeN/XfO3Zh1y2bjhEaoBD1Zbep+uZWOdsp1EVDXrukOE=
X-Gm-Gg: ASbGncvOVeBkVCMAEHd/I8MzdQQChYB0dJfsgNDWWw6q3VtCfr3+7tAVxo4cEswOjod
	H7atDOnMHOVVMpn4blClmRqz8q5y1G3otah+TFGJzty44vOEXRfgVuJ4vFXuwltjwKiFSy9jOK8
	hdu6gDcFX2OWnqWW/aR/JHTLtxSB+3CzsFa2sIaZzd7qOcgpwEcV1ISxODiV7R9pFoMdFi57HC9
	z6D/IWuBfGWPjBdexCJx+QZzUs0JY3VwYaeBNv6C+W1+JrQJ06cajhVRRN2f6HqzJo=
X-Google-Smtp-Source: AGHT+IEW+C0UYINtElg6dOB6egZSf2JdQKq3h/6pWVTyxYZL0mnh9eE6xvQOEQkDNwqoeA+457pHig==
X-Received: by 2002:a05:600c:4749:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-436e9d6ff7bmr56536635e9.6.1736529406318;
        Fri, 10 Jan 2025 09:16:46 -0800 (PST)
Message-ID: <10577192-c798-4298-98e5-bb2f33d53cd3@citrix.com>
Date: Fri, 10 Jan 2025 17:16:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.20-rc
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
 <20250109153921.43610-3-andrew.cooper3@citrix.com>
 <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
 <c7eeaa80-a4bd-457f-824e-accd23c2f471@citrix.com>
 <bdb4a31c-01d1-4f48-82af-f3eb54cd8d69@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bdb4a31c-01d1-4f48-82af-f3eb54cd8d69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2025 3:53 pm, Jan Beulich wrote:
> On 09.01.2025 16:46, Andrew Cooper wrote:
>> On 09/01/2025 3:44 pm, Jan Beulich wrote:
>>> On 09.01.2025 16:39, Andrew Cooper wrote:
>>>> --- a/README
>>>> +++ b/README
>>>> @@ -1,11 +1,11 @@
>>>> -############################################################
>>>> -__  __                                _        _     _
>>>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>>>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>>>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>>>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>>>> -
>>>> -############################################################
>>>> +#####################################################
>>>> +__  __            _  _    ____   ___
>>>> +\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
>>>> + \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
>>>> + /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
>>>> +/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
>>>> +
>>>> +#####################################################
>>>>  
>>>>  https://www.xen.org/
>>>>  
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>>>  
>>>>  # Release Support
>>>>  
>>>> -    Xen-Version: 4.20-unstable
>>>> +    Xen-Version: 4.20-rc
>>>>      Initial-Release: n/a
>>>>      Supported-Until: TBD
>>>>      Security-Support-Until: Unreleased - not yet security-supported
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>>>  # All other places this is stored (eg. compile.h) should be autogenerated.
>>>>  export XEN_VERSION       = 4
>>>>  export XEN_SUBVERSION    = 20
>>>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>>> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
>>> Since we'd been there before I take it the .0 in here (which isn't in the
>>> changes to the other two files) is deliberate now? Clearly I continue to
>>> think it shouldn't be put there together with -rc.
>> Oh, that's because I cribbed this by looking at the recent releases.
>>
>> The documentation leaves ~everything to be desired...
>>
>> I can drop the .0 here, although I shan't repost just for that.
> In case this (both patches) requires any ack:
> Acked-by: Jan Beulich <jbeulich@suse.com>

It turns out the .0 is necessary to build the tarball in the way the
other tooling expects.  I'm going to bodge it for now to get RC1 out,
but we are going to have to change *somthing* before getting to RC2.

~Andrew

