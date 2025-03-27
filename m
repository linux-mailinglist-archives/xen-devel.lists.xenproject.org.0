Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC9A73549
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929532.1332226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txonY-0002Nn-8O; Thu, 27 Mar 2025 15:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929532.1332226; Thu, 27 Mar 2025 15:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txonY-0002ML-5l; Thu, 27 Mar 2025 15:05:36 +0000
Received: by outflank-mailman (input) for mailman id 929532;
 Thu, 27 Mar 2025 15:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txonW-0002MD-6r
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:05:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1c77eb-0b1c-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 16:05:33 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so587157f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 08:05:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a31a7sm19831040f8f.23.2025.03.27.08.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:05:32 -0700 (PDT)
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
X-Inumbo-ID: ee1c77eb-0b1c-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743087932; x=1743692732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VIRKwdVRurrs7WTBM2RdGcNH+5YfptL5R6g2udGz7Qk=;
        b=thFFJcRB4ozRzbc0bLCPa+ARiAbF2pfEqQhBEF1ClEsZrptxdSx7ts3in3/weiLUTQ
         H3yTVocoBE6WzEFqOMUQ9VKTtwl9SA5xDabCoK3pkAQRt7tXo9geHlGOO3qUJ877tOPq
         uYa3eHRgnBBGRyjFqx2L6+G0GW6BmSLbVWZkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087932; x=1743692732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIRKwdVRurrs7WTBM2RdGcNH+5YfptL5R6g2udGz7Qk=;
        b=XO8aLdISO6nos/EyI5LVoH0SGEWrErOh0r8v8yGiW7lJx5EFp9SlJhb/8007UKEylK
         GWoZrQWHt21o9m+7WFmkkzIq5qwqtYx7XkmJbLX7OB7cefCPd1k7ZArPg+J4kksiOvnv
         zIVg55AGczUgamMh5/C4na7avoTAJrCPMZfgjU68gFy9L8NBT2Cpvpr+1BkNL2xqDUg6
         uhwN5naBci6BofHwQuVHbr//Uj1ZZ28zfA8syD+Ve49Ne0Dd4HMEhlKlGfih0h3YAuah
         KiHnDmQQAKaDiAAMIi70dZat2+ldk84MlUPJm+l0mdT+yWLe8b/GwkEI/wRW7waa1DY5
         CRlw==
X-Gm-Message-State: AOJu0YwbON9f8GRrEk26VdP0ho2XV0e/k2G1b/ex8jrbOSdYZdgp9Ja2
	SvXH84Uz485dhDsh670tUjD/X6+QffZ0M3I3MjE5FHdc6DlK1JAUrLbUd30NORM=
X-Gm-Gg: ASbGncst4GlsvWM1hn3tCNQBlp75ElXnSRkw5lu2qgSVDx6G8ZrHayNX79ydTONEK+O
	cRjQ99tVlv6LHYqR//B/QSyznyA6MJ4K5wkv/Uetpes0t5EuMYRzoDAwPkmcDyRrXlCJa1uk7DX
	js6T96bQN0EVz1+h9uwejHoqGwM62XQtypnNi6rqHaLtctitcXgImo+J+5sHs4cVP9eptAUVb28
	MPaVyHJcRwol7hK02nHhKC/mJ9CnHigus2+zLgnUnqavje9qhwvTOCeEiFboCwAo8f81yR/W2aO
	Oc8Tn5NlfDgTKrqBlEllLV1G/583LjPwcY6rIJw1B06RGltM/2nKjUdkTnwFACDitUmVCbKsLYj
	higM8JLZxWQ==
X-Google-Smtp-Source: AGHT+IEwaHx0BivAwqvxevOY35LeI3UM2gV6CUvf0D4KmXBxFV6OYMgwiS/JDe4eDrJeNfH8Wczp5g==
X-Received: by 2002:a5d:5f91:0:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39ad173f987mr3588337f8f.9.1743087932574;
        Thu, 27 Mar 2025 08:05:32 -0700 (PDT)
Message-ID: <e1d9c8f1-f649-49bd-b2b9-9a873aedd939@citrix.com>
Date: Thu, 27 Mar 2025 15:05:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: constrain AP sync and BSP restore
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>
 <Z-UuG2QW56iSfeFj@macbook.local>
 <47e6ad0b-ca4e-499e-8824-6f2dd525c354@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <47e6ad0b-ca4e-499e-8824-6f2dd525c354@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 11:03 am, Jan Beulich wrote:
> On 27.03.2025 11:53, Roger Pau Monné wrote:
>> On Thu, Mar 27, 2025 at 10:54:23AM +0100, Jan Beulich wrote:
>>> mtrr_set_all() has quite a bit of overhead, which is entirely useless
>>> when set_mtrr_state() really does nothing. Furthermore, with
>>> mtrr_state.def_type never initialized from hardware, post_set()'s
>>> unconditional writing of the MSR means would leave us running in UC
>>> mode after the sync.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/cpu/mtrr/main.c
>>> +++ b/xen/arch/x86/cpu/mtrr/main.c
>>> @@ -605,13 +605,15 @@ void mtrr_aps_sync_begin(void)
>>>  
>>>  void mtrr_aps_sync_end(void)
>>>  {
>>> -	set_mtrr(~0U, 0, 0, 0);
>>> +	if (mtrr_if)
>>> +		set_mtrr(~0U, 0, 0, 0);
>>>  	hold_mtrr_updates_on_aps = 0;
>>>  }
>>>  
>>>  void mtrr_bp_restore(void)
>> Maybe I'm blind, but I cannot find any caller to mtrr_bp_restore()?
>> Am I missing something obvious?
> You don't. It was lost in 4304ff420e51 ("x86/S3: Drop
> {save,restore}_rest_processor_state() completely"), with there being no
> indication in the description that this was actually intentional. Looks like
> another S3 regression we need to fix. Unless you, Andrew, have an explanation
> for this.

Hmm, I don't think I intended to make a change without discussing it.

However, I think I'd concluded that it was redundant with the
mtrr_aps_sync_end() call.

~Andrew

