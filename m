Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBB95205A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 18:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777566.1187680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seH95-0005UA-LU; Wed, 14 Aug 2024 16:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777566.1187680; Wed, 14 Aug 2024 16:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seH95-0005Rp-Ib; Wed, 14 Aug 2024 16:46:47 +0000
Received: by outflank-mailman (input) for mailman id 777566;
 Wed, 14 Aug 2024 16:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2uER=PN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seH93-0005QO-NM
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 16:46:45 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c97a2514-5a5c-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 18:46:43 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so1929658a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 09:46:43 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f48e67sm192662866b.40.2024.08.14.09.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 09:46:42 -0700 (PDT)
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
X-Inumbo-ID: c97a2514-5a5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723654003; x=1724258803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YtFreksT9WIQZ/GkQ4jaJFT6y2/YGzTl84/ksGEKBOM=;
        b=scMI7uKpAgpiciRsZsfe54cbAnnBRIHr27tnzLnEKhtAoLLqjsvBkW55Gta34ISR61
         Q5S8//PYyXPjthggGUeZkbI/cORoj9pUro2HODEoJIO2RATkzc3wlOViGELwMbPL9dJD
         IkaqQt4U36QlLGNMezJZh91WRRxiSjAtju6wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723654003; x=1724258803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtFreksT9WIQZ/GkQ4jaJFT6y2/YGzTl84/ksGEKBOM=;
        b=YM7g9h7CimbPV7puxrYwOejijW0kHEnOtJe6ut1CyJWs14UA4X96ngcw3ulwo2TJTZ
         n6fkOlrfCaf3jIYF4uDyV6rFeuQlFB5uAEd/Yz0BsWRVEF5bZmP6nhmccghSASXTChnn
         3IRLS7L+aoUlHnH041NOJ6X5z/v+dswqNfzu0ipGEKg84zdZTf71y0qrexVGRpsr6wS5
         fEjf02MXJtvby/tEkClLt5WCYb7DDqD2+yHrMpcAzIxc5R34iqUYBrAyNGSzldpG2Lkg
         9UhSfzZYoYE5znuizZkfz+YspWBvL5uo6X/drV3bPtmq4FiYWTCIcTYZ5pel1JUR5uMs
         rZHw==
X-Forwarded-Encrypted: i=1; AJvYcCX0mWm0nud5dVVjHEliSb1vWPDLJUKhBMFIRk5T2MHG/4Fa4sExsn4DUEdHGUpbCInEP3NOIk6o+1VSKOLc6TjBlyIox/c50VcJjg0dBi0=
X-Gm-Message-State: AOJu0YwIWrn3Lv5ibwqWebRpPqfrXqqIedUNQI2Gxyhn5Xu4dy/obghW
	5Ed2TIaj30tw+0wBmt6caayzxMRDaDnmNGdAR8mAvR2Vf2PZoy4Kv3lWx/uaAus=
X-Google-Smtp-Source: AGHT+IEj0Z261BtvEkCqYgfyUsutbo12UlZOoEp6gR67kYs6p1EVuRmZJ44N+XwL+MlIMF4fI3gm7A==
X-Received: by 2002:a17:906:db08:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a837cbccdcfmr22165866b.4.1723654003023;
        Wed, 14 Aug 2024 09:46:43 -0700 (PDT)
Message-ID: <9dec870a-5bdc-4539-afe9-228afb40249a@citrix.com>
Date: Wed, 14 Aug 2024 17:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Jan Beulich <jbeulich@suse.com>, Matthew Barnes <matthew.barnes@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
 <d2a71d20-d3c5-45cc-9e3e-10a0773508a0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d2a71d20-d3c5-45cc-9e3e-10a0773508a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2024 4:58 pm, Jan Beulich wrote:
> On 14.08.2024 17:52, Matthew Barnes wrote:
>> Upon running `xen-cpuid -d` on a host machine with Sapphire Rapids
>> within Dom0, there exist unrecognised features.
> Without looking at the particular bits yet, just a question up front:
> Why SPR?

Because it's what we have easily to hand right now.

I veto'd doing this based on pre-release hardware, because they often
contain NDA content which we shouldn't be publishing, or at least
"publishing yet".

We should be getting production EMR soon.

>  There's newer hardware available with presumably yet more newly
> used bits. If the goal is to cover everything that's known, this is only
> one step in the right direction.

Correct, but it is *a* step, and that's fine.

We anticipate doing patches like this for every new generation, as part
of our own checks to support the CPU.  Right now there's a bit of a backlog.

~Andrew

