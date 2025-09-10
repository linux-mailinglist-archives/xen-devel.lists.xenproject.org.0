Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FBB51C8C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118562.1464303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwN9V-0000iv-Lo; Wed, 10 Sep 2025 15:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118562.1464303; Wed, 10 Sep 2025 15:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwN9V-0000gx-J0; Wed, 10 Sep 2025 15:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1118562;
 Wed, 10 Sep 2025 15:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwN9T-0000gp-Mu
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:54:31 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7d615d-8e5e-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 17:54:26 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so4509291f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:54:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521ca0e9sm7917503f8f.25.2025.09.10.08.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:54:25 -0700 (PDT)
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
X-Inumbo-ID: 6d7d615d-8e5e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757519666; x=1758124466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RFteJgx6AqwB4D6h4mss4xo0en8UTw0VErhmFRJ+5LM=;
        b=SterV82ohzpABw1E2oCGRr8XeiJPCeMnarbYrr/6S4+a1Rpe9Ju7lrOZ2mm81oe96E
         EWWAMlULhhd6kkvGhI0xFOr4DgFnnyjGG3EuvIBJ076UsyOjdiGBhJgbGkW+Dh4oLzhh
         +R389U7sarKFXG8imCWtMeMEgt917ASP6+FkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757519666; x=1758124466;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFteJgx6AqwB4D6h4mss4xo0en8UTw0VErhmFRJ+5LM=;
        b=AfOnp5U5CV2JVF406X9WUDfFJ5PWrQ2gPmsXsqVqeM+Fh9eAZO92lT9WuOWAA/ktfQ
         SKoyMddPmrjTLHX+1hTWIf6ya3dULY2V17SpudnTBBm2SFMPTnNapUQJpkogsytrQaeh
         h/2KyWcH/U4PdJ2xFRzDiWP4WbDBMierveOJNk1v+63ApEq+r1OPjIeZLwtDW2ngjv83
         h7OOemZPgADe6W0Bvnn5IpWkIuAjYhuxyyZwcTElkhRegLunME3qAAVqFHQQJvyFIF4L
         Tk7qtgIQdt3I+w/0aFOLOQnr2YRlfP81SrQODOyt9J8dyZl1x1xoxLysoS0wJovXgeeV
         +gkg==
X-Gm-Message-State: AOJu0YyVKz4E5yoxuqBqsU66X8w12T8EIm19GoOLINyHfjiBI2VwUTRt
	sZGCEQOWpGyDMhcHMHvRDIRHgRfeLH88os3faKmWr7pPGTY5OdVW45NYprVMbiqtZww=
X-Gm-Gg: ASbGncvZf5HubcQ9oVNA2PqLgGo9TB/50o5yumWozMG5r6ZxDMP2tOWPtxzq/esBiLq
	C1uUCh5RkN8xUOikQQspcq2ZINXI3kSH4YF6ldNA5W/+cNuwzUGuRzF0ecJob4hWkrUxJiyzc2k
	EZn+zNH1miFFjo1P09f27ZrhddOhyqEPgvXX/QdfIzDpyImpHTv+FZFSRG2chmYL9pIIVW5zWuh
	2fwfffl6LvqnzBi1jixhMZOmTQOCpLYMNMqd4/e98Yg9MZTDBmtluRnpelnq6sRuT9ZPY7M1iMM
	aLklAqdzUE6zOQHn5ld8ScWRuTW/lZuv++d6XQaqvA6Mg5XWAF7rsNkS/PEjqImD9RXRXndIGY4
	gjV7HxFx9OZH9/YDFHiu9478/B0hRXS7GnpOcUE2CCTnuIiJHFhlyntcuDI8te90W7v/N
X-Google-Smtp-Source: AGHT+IHqwcCcJ9+tMA8dz60LpMAZzAoi+ZHk6OLtgG13hHeSoWb5srKZzUW5EO2Kl2zvm6LHldq6eQ==
X-Received: by 2002:a05:6000:647:b0:3e7:1f63:6e81 with SMTP id ffacd0b85a97d-3e71f6373c5mr14230298f8f.16.1757519665687;
        Wed, 10 Sep 2025 08:54:25 -0700 (PDT)
Message-ID: <6f13d82f-743c-4bb7-ab95-c8a34fae957a@citrix.com>
Date: Wed, 10 Sep 2025 16:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Switch the alpine containers to be non-root
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
References: <20250910113416.1835988-1-andrew.cooper3@citrix.com>
 <aMFnqW7xgbL1ZSBi@mail-itl> <2c91d873-7f13-4f78-a0d8-8f67f06c88b2@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2c91d873-7f13-4f78-a0d8-8f67f06c88b2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2025 2:11 pm, Andrew Cooper wrote:
> On 10/09/2025 12:57 pm, Marek Marczykowski-Górecki wrote:
>> On Wed, Sep 10, 2025 at 12:34:16PM +0100, Andrew Cooper wrote:
>>> Testing on staging-4.19 is hitting a reliable failure, caused by alpine/3.18
>>> being a root build container, but debian/12-x86_64 being a non-root test
>>> container.  Specifically, the test container can't copy XEN_PAGING_DIR and
>>> XEN_DUMP_DIR (both 700) from the build root in order to construct the initrd.
>>>
>>> staging-4.20 and later do not repack the initrd in this way, so are not
>>> affected.
>>>
>>> Switch both alpine containers to being non-root.  This is still slightly
>>> fragile, but better than depending on using root containers for both.
>> This will likely explode done as is...
>>
>> First, grub.cfg is not writable anymore:
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11305545275#L170
>>
>> I'm not sure what 'user' gets remapped to here, but the whole container
>> is running under rootless podman, as gitlab-runner user. Files on the
>> host are owned by gitlab-runner user.
>>
>> But second, repacking initrd as non-root, without any extra care will
>> result in broken initrd. At the very least /sbin/mount is suid root -
>> when repacked as normal user, it will end up as suid to non-root,
>> breaking it quite effectively. I've run into this issue when needing to
>> repack rootfs anyway and ended up using fakeroot (again):
>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/bab939159127a9f8e56e119c1fa553c7bbb6d4f7
>>
>> At least your "CI: Create initrd fragments explicitly as root" patch may
>> need backporting, but TBH I'm not sure if that's enough. /dev will
>> likely be messed up too.
> There's a lot of collateral damage here.  Summarising things a little.
>
> * We cannot change the root-ness of alpine/3.18-arm64v8.  Like
> xilinx-xenial, it does need root to drive real hardware
>
> * We can change the root-ness of alpine/3.18.  It is only used as a
> build container, not a test container.
>
> * Contrary to my previous analysis, we have backported the test-artefact
> CPIO work to 4.19, but not the build step CPIO archive.
>
>
> And, what to do:
>
> * We really do need to be rootless in the build containers.  Therefore I
> think we need to split alpine/3.18-arm64v8 in two, and when bumping to
> the next version is the obvious point to do this.  We should make a
> dedicated qubes container similar to xilinx-xenial, and separate it from
> the build step.
>
> * I should see about backporting the build step CPIO archive.  I'm
> beginning to think that was an oversight of mine, because I didn't
> intend to end up with a split like this.  This should avoid the step
> causing us problems here.
>
> * I'm very inclined to change the root-ness of alpine/3.18.  Testing
> suggests this is fine.

To follow up here, backporting the remaining CPIO patches has resolved
the issue. 
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2032200270

~Andrew

