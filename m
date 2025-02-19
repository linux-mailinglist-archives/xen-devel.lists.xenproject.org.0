Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED8A3C711
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 19:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893373.1302271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoWZ-0002aN-Q8; Wed, 19 Feb 2025 18:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893373.1302271; Wed, 19 Feb 2025 18:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoWZ-0002Xm-N9; Wed, 19 Feb 2025 18:10:19 +0000
Received: by outflank-mailman (input) for mailman id 893373;
 Wed, 19 Feb 2025 18:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkoWZ-0002S0-0n
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 18:10:19 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c67d4960-eeec-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 19:10:18 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f265c6cb0so45073f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 10:10:18 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fdb19sm18907296f8f.95.2025.02.19.10.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 10:10:17 -0800 (PST)
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
X-Inumbo-ID: c67d4960-eeec-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739988618; x=1740593418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dOeyccmwlzh6VN6QoxKvjVynxtRBBefdtbjIt0msuAQ=;
        b=F27pR7lh8QxvF2Nc2Kp4/r7jFaj2xr7P+YcC9y5OVscJgAkNXnMcdZg0xWr3wkQwiH
         lc+XrZoCxuLO60oSfnoq9uRmsoMWvkc0Bdvw2yK5pLTmMV2XxMtfQ/AOcYnbgL0Y39am
         cpDEkLu0StXUFh2+OW1CZJdSd7kt5WBuDrxsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739988618; x=1740593418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOeyccmwlzh6VN6QoxKvjVynxtRBBefdtbjIt0msuAQ=;
        b=Aof+hLWIOcjh9EDKjl71Cfpt2K18XuyF6NBB75i0lkAYq5AAb7MRkHh+mJqz388V98
         S1Nj4hOJFu7ZQDoO0kDNYNeNn+LnONpT5g9pbYbYv6e5kn2IHtGPhmm1wtOI2DioNPwr
         /v65A6psdzghZdBUQp0wethj7z1jf+cGy+vyYBB0s2UZxRFzw2gsKaqeds6Xanc74+S0
         gHPd49thG1+BDvfjEPmkQ/l0u8ZMl8fEY3f34ecc3YfSdDt5SBCR3FsY3JKOFf3jKveA
         9MhIWm6NDqUr/roJTu14tIyQHQYxTJTdPSoBzEsASSSofD5B3hmiXgfxcOPGXSVwiT6F
         1YhQ==
X-Gm-Message-State: AOJu0YxIbKw4q1Dg+m1rAYqfWpq+W/Qfotz9EgvS8FnUmaAgcG96arKs
	uVhO8wGU13BTvVQAFh2vWPdkMj7bq8WleJNQzdOu6PgcCanKD44zn2lQ+RbyPBE=
X-Gm-Gg: ASbGncsvAsJo8eBrFq4ydLI/D2HvK873Up5D/Tvay/kS6UVPtuadegX09jsHg3CkNSz
	Tj9yOEE1X+F0F8YnDW+9KJktBdvLUfyPCO3QGV9/9YQ6Nz/+pr2LweKopZsgEmyk3AUG/xH8pM1
	B148hr3K5791Er98fhfFNsOUX4RBlfpaulCYhavmUd8V8FsIHrShCsjJ8k/vxDtWvLkgn/besOB
	cpynv3X8cpBbzU6KaUr1Zf/PNtrBeWtbthL0sTiHyhByVlmfcc9i28uwknJW8vEejBVvmRXsbu8
	ZcS+fNpp2Xg6gVMr5wrwfKp/Op6phJoR5vJN2DPHoNjZEKLJuioHp+8=
X-Google-Smtp-Source: AGHT+IHz4uiew2v5rUPDV1HEtmwlIz4pBcPKKK88slwK2f5KpPNn67NZFfizWc2NkRytOPOhNM34Gg==
X-Received: by 2002:a05:6000:1aca:b0:38f:37f3:5ca9 with SMTP id ffacd0b85a97d-38f37f36159mr16091498f8f.50.1739988617616;
        Wed, 19 Feb 2025 10:10:17 -0800 (PST)
Message-ID: <cea69d56-e69b-4297-90cb-5fbba3911d58@citrix.com>
Date: Wed, 19 Feb 2025 18:10:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
 <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
 <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
 <alpine.DEB.2.22.394.2502131103300.619090@ubuntu-linux-20-04-desktop>
 <f66556b9-1777-44c6-a086-320f65454021@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f66556b9-1777-44c6-a086-320f65454021@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2025 7:15 am, Jan Beulich wrote:
> On 13.02.2025 20:09, Stefano Stabellini wrote:
>> On Thu, 13 Feb 2025, Jan Beulich wrote:
>>> On 13.02.2025 01:51, Andrew Cooper wrote:
>>>> On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
>>>>> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
>>>>>> Hello everyone,
>>>>>>
>>>>>> During the installation of Xen on an ARM server machine from the source code,
>>>>>> I found that the wrong release candidate (rc) is being used:
>>>>>>   $ make install  
>>>>>>     install -m0644 -p xen //boot/xen-4.20-rc  
>>>>>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>>>>>>     make[1]: *** [Makefile:507: _install] Error 1
>>>>>> My expectation is that it should be xen-4.20-rc4.
>>>>>>
>>>>>> I'm not sure if this behavior is intentional or if users are expected to set
>>>>>> the XEN_VENDORVERSION variable manually to ensure the correct release
>>>>>> candidate number.
>>>>>>
>>>>>> In my opinion, we should set the proper release candidate number after
>>>>>> "xen-4.20-rc" automatically.
>>>>>>
>>>>>> Does anyone have any thoughts or suggestions on how to resolve this issue?
>>>>> Hi Oleksii,
>>>>>
>>>>> I did a quick test and I see exactly the same on x86 as well. This patch
>>>>> fixes it, but then it would need someone to update the RC number in
>>>>> xen/Makefile every time a new RC is made.
>>>>>
>>>>> ---
>>>>> xen: add RC version number to xen filename
>>>>>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> This is a direct consequence of the request to keep XEN_EXTRAVERSION at
>>>> "-rc" throughout the release cycle.
>>>>
>>>> I'm having to manually edit that simply to create the tarballs
>>>> correctly, which in turn means that the tarball isn't a byte-for-byte
>>>> identical `git archive` of the tag it purports to be.
>>> Just for my understanding - may I ask why this editing is necessary?
>>> Other release technicians never mentioned the (indeed undesirable)
>>> need to do so.
>> This is not an answer to Jan's question, more me highlighting
>> priorities.
>>
>> While having the appropriate RC version in the Xen name during the RC
>> phase of the release process would be nice, I do not believe it is
>> mandatory. We do need it in the official release tarballs though.

Release tarballs are fine, because they are always tagged on a commit
editing the micro version in XEN_EXTRAVERSION.

It's only RC tarballs that go wrong.

>>
>> So the most important consideration for me is making the release
>> technician's job easier and less error-prone. Therefore, I believe we
>> should follow Andrew and Julien's recommendation on this.
>>
>> Andrew, just to be clear, are you recommending to go with a patch
>> similar to the one I posted, and then update the XEN_VENDORVERSION
>> with a new commit every time there is a new RC? Or are you suggesting
>> something else? I wasn't certain reading your reply.
> Just one point here: I don't think we ought to be playing with
> XEN_VENDORVERSION. If we switch, we ought to switch back to how it
> was long ago - the RC number being part of XEN_EXTRAVERSION.
> XEN_VENDORVERSION really should be left to vendors.

Hopefully the other email is clear and covers everything, but tl;dr, I
suggest we do edit XEN_EXTRAVERSION (and not XEN_VENDORVERSION) for each
RC tarball.

~Andrew

