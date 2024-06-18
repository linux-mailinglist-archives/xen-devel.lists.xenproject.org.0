Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C290C84A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742987.1149880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWdI-0002h5-3Y; Tue, 18 Jun 2024 11:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742987.1149880; Tue, 18 Jun 2024 11:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJWdI-0002et-0o; Tue, 18 Jun 2024 11:04:12 +0000
Received: by outflank-mailman (input) for mailman id 742987;
 Tue, 18 Jun 2024 11:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJWdG-0002ea-DF
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:04:10 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c623ba4-2d62-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 13:04:09 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6b07e641535so27812846d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:04:09 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5bf2879sm65400806d6.21.2024.06.18.04.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:04:07 -0700 (PDT)
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
X-Inumbo-ID: 7c623ba4-2d62-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718708648; x=1719313448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ubvMTyLxpTIVR9o/ecLoRMfB8L0MpN0HMxm8gMBgCmg=;
        b=ICl3SbDQRZq6S5uWZSHKDpMyHr38xkj9jUgX4qAjKEYBeF12oK0RtKHXz+bOupvTd7
         LNboXqr3ALlFQ3Dq41wqNkKKIZr7bROB+6++U9J0zhEiTlEM9SpJQ3MWGqGPpX/5C80A
         URagLbgmqciQUk8obgM/7Ucy0wfiZUuVzAi3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708648; x=1719313448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubvMTyLxpTIVR9o/ecLoRMfB8L0MpN0HMxm8gMBgCmg=;
        b=NcW5B0/GwkXFEuHHMSqVebLsAG9tLuTI5GYSPDVVnHhtAIRBbXrSJJCjkIdO9C2gSP
         R8LeXI1GjKkFdOzBMd9EhAD4B2+OFVdnUnc9SMWieIfvazZKTKkv1XC540ti8J21GIkl
         nZqvB6yh1wnUGVKtlJB/lgxJ+FeaBQI4r86J7hu6G1nIfMxDELVEvg9bJUJfnWCSGvGf
         B4pOSPowf9DYQEEpSFBocTkFaUTegZShiXRyd4FE3Y4yfCuwlM7F/bID69tSQ9Zz0bcP
         eV2kKECWUGQyO0/gmFNHLWda0ZG6E0Ih65JZDHIrjosXv/SvLRFZoBlJbU3MjTbsQGOS
         szYw==
X-Forwarded-Encrypted: i=1; AJvYcCXn0TflYaDXq0cRK8EeCqFpyFzI68yakm4+f4CQCUYb/8uwQfAtpxsoDK/AwjbXN835usrYCeQHH32vVUtmZkRYgdf/vqvUANMm3zZw2js=
X-Gm-Message-State: AOJu0Yz1OdyhHPDFowyxH+UpJ/6iBVRsFHYArEviVC2WdzKGPEWfeh29
	kfIX4Lji1nzF1sJ9hOUwZTDhztdZYH49vOdRMt8EU0kSxdJx1EenuB0w4g+GnGo=
X-Google-Smtp-Source: AGHT+IE6E/NG17tJsTbKKPvEa5gIaI35Erc7JsSpzhJKtgDBDc+mwDks8dkbbgR/37yJ/M/yvZVHDA==
X-Received: by 2002:a0c:f2d0:0:b0:6b4:fde8:868b with SMTP id 6a1803df08f44-6b4fde88991mr5513296d6.50.1718708648262;
        Tue, 18 Jun 2024 04:04:08 -0700 (PDT)
Message-ID: <bb768c00-0a91-4e47-91b4-21ec31a71f13@citrix.com>
Date: Tue, 18 Jun 2024 12:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OSSTEST PATCH] preseed_base: Use "keep" NIC NamePolicy when
 "force-mac-address"
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20240617144051.29547-1-anthony@xenproject.org>
 <a65a83be-1236-4699-8124-c0bd809c4b97@citrix.com> <ZnFXFjeakYBmBHSB@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZnFXFjeakYBmBHSB@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/06/2024 10:44 am, Anthony PERARD wrote:
> On Mon, Jun 17, 2024 at 04:34:09PM +0100, Andrew Cooper wrote:
>> On 17/06/2024 3:40 pm, Anthony PERARD wrote:
>>> diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
>>> index 3545f3fd..d974fea5 100644
>>> --- a/Osstest/Debian.pm
>>> +++ b/Osstest/Debian.pm
>>> @@ -972,7 +972,19 @@ END
>>>          # is going to be added to dom0's initrd, which is used by some guests
>>>          # (created with ts-debian-install).
>>>          preseed_hook_installscript($ho, $sfx,
>>> -            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END');
>>> +            '/usr/lib/base-installer.d/', '05ifnamepolicy',
>>> +            $ho->{Flags}{'force-mac-address'} ? <<'END' : <<'END');
>> The conditional looks suspicious if both options are <<'END'.
> That works fine, this pattern is already used in few places in osstest,
> like here:
> https://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=ts-host-install;h=0b6aaeeae228551064618abfa624321992a2eb2d;hb=HEAD#l240
>     >  $ho->{Flags}{'force-mac-address'} ? <<END : <<END);
>
> Or even here:
> https://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=ts-xen-build;h=c294a51eafc26e53b5417529b943224902870acf;hb=HEAD#l173
>     > buildcmd_stamped_logged(600, 'xen', 'configure', <<END,<<END,<<END);
>
>> Doesn't this just write 70-eth-keep-policy.link unconditionally?
> I've check that, on a different host, and the "mac" name policy is used
> as expected, so the file "70-eth-keep-policy.link" isn't created on that
> host.

This is horrifying.  Given a construct which specifically lets you
choose a semantically meaningful name, using END for all options is rude.

Despite the pre-existing antipatterns, it would be better to turn this
one into:

$ho->{Flags}{'force-mac-address'} ? <<'END_KEEP' : <<'END_MAC');

which gives the reader some chance of spotting that there are two
adjacent scripts and we're choosing one of them.

~Andrew

