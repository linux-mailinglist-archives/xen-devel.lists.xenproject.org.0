Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF4B517B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118228.1464090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKbS-0002N5-MA; Wed, 10 Sep 2025 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118228.1464090; Wed, 10 Sep 2025 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKbS-0002KE-J3; Wed, 10 Sep 2025 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1118228;
 Wed, 10 Sep 2025 13:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwKbQ-0002K8-Ol
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:11:12 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eabe3bb-8e47-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 15:11:10 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso45148055e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:11:10 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7522387acsm6812647f8f.40.2025.09.10.06.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:11:07 -0700 (PDT)
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
X-Inumbo-ID: 9eabe3bb-8e47-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757509870; x=1758114670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow6FD6a4zTTUiQDCDP70Lj/7acZG5OGLgjzi9bSr5XY=;
        b=h2IS1YjT/ouHX7FU6qziHeMG9kqefrFKOdezvNKL4IBygof/rkItWek/JZn/wGBRSy
         arHKxdZQjdkR18/GaVt8xtoic1PDWj0SVmalSr7JZmj81K3YTFm4isUySqKvjkI6ZdpT
         XmJC7TAr1xzVnbW6mU8zUAQd5TR/a6Pj8sRbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509870; x=1758114670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ow6FD6a4zTTUiQDCDP70Lj/7acZG5OGLgjzi9bSr5XY=;
        b=BuBjzXY0OaZUouLJvb6aH9eeLRqv3m1WBuuInOsAOoTQ1Hwvi8CMXxXiaxxoyXA9nJ
         6181ySXBw+WmmbsRMuxz/zoTFgMF1GDWLoqc7eKor/A72qreYt1vAnuTWJ4U3kOlHi71
         A5rLRK05QUmqtB5tZ0xUiUA+2b2Pt+6vu6zLF6685S3H/H5Ww7sJ6whlUX+6cqyjy5lf
         dWEWetWaMoaOkCLhV9LzqCU6zDmqNbZMMyRlQRfNjPWX+w0Ih6TbmBssn06/5DAtF6t2
         u4vlezA628dQS9/bQiT+L9A8YkekttUWr6cYLe15J6lyAPl4VDNaNZ7y7DPvS27h8FgK
         0WWA==
X-Gm-Message-State: AOJu0YyO3JO0279krNAGTh9NaEQ5t3EqgeBYhImPOE9+y10rUu+ikz+X
	z+hXPQUSo0ziPPlMt+snPgl3gWhUyTNtZvJxaoOoE8Xu6eUotn9rwXFsJiJsy3wb9dc=
X-Gm-Gg: ASbGncvFRuwkl/yUjoWIKN6PU0dooAP3HLToTFhdje/BjEv6UCziaRDnwgc7+fQev4N
	iF21sYK53WvJaAVFRdAdcB+e7nWTxc26hkIwm2adcVqJUg+E2gOfTtbAeD50oFEyPuZDBX1Qxjz
	a3xkN96ZvsCxNc+GVnygEehp2anMvi2jx5+0cVG5Gi+hyP1+cqyXFk/06uK3ougy2slpC7sWti1
	OLo/fUA5H2GiMGywvMqyyYmoRyj07ffVU4cnJ8+WZgm5AkUkfa3eqBzEdTF6FHa+P6aPcECa5UG
	263J4IH1xoTXE1OGMEdT+wjnhg95Fu/KRXJ3bh/J0BfV1HJMiUmQnk4sAI8Iv+yRaJ/mYvpIRUO
	P4Vz4SHB5MG6uyLl/VKjl8+NBjuHReog0a4gDnb9u/+9RVDC6vqA2N0g7IhW/rNqo2b5o
X-Google-Smtp-Source: AGHT+IHJUNflVznGtQBQ66yq6dLaLbNIShPzRyn6PiH6nnnqCwWViqokKPBtikjL0Atq7QvglQwCog==
X-Received: by 2002:a05:600c:314b:b0:45d:e111:de7e with SMTP id 5b1f17b1804b1-45de111df85mr121329225e9.19.1757509869878;
        Wed, 10 Sep 2025 06:11:09 -0700 (PDT)
Message-ID: <2c91d873-7f13-4f78-a0d8-8f67f06c88b2@citrix.com>
Date: Wed, 10 Sep 2025 14:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Switch the alpine containers to be non-root
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
References: <20250910113416.1835988-1-andrew.cooper3@citrix.com>
 <aMFnqW7xgbL1ZSBi@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aMFnqW7xgbL1ZSBi@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2025 12:57 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Sep 10, 2025 at 12:34:16PM +0100, Andrew Cooper wrote:
>> Testing on staging-4.19 is hitting a reliable failure, caused by alpine/3.18
>> being a root build container, but debian/12-x86_64 being a non-root test
>> container.  Specifically, the test container can't copy XEN_PAGING_DIR and
>> XEN_DUMP_DIR (both 700) from the build root in order to construct the initrd.
>>
>> staging-4.20 and later do not repack the initrd in this way, so are not
>> affected.
>>
>> Switch both alpine containers to being non-root.  This is still slightly
>> fragile, but better than depending on using root containers for both.
> This will likely explode done as is...
>
> First, grub.cfg is not writable anymore:
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11305545275#L170
>
> I'm not sure what 'user' gets remapped to here, but the whole container
> is running under rootless podman, as gitlab-runner user. Files on the
> host are owned by gitlab-runner user.
>
> But second, repacking initrd as non-root, without any extra care will
> result in broken initrd. At the very least /sbin/mount is suid root -
> when repacked as normal user, it will end up as suid to non-root,
> breaking it quite effectively. I've run into this issue when needing to
> repack rootfs anyway and ended up using fakeroot (again):
> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/bab939159127a9f8e56e119c1fa553c7bbb6d4f7
>
> At least your "CI: Create initrd fragments explicitly as root" patch may
> need backporting, but TBH I'm not sure if that's enough. /dev will
> likely be messed up too.

There's a lot of collateral damage here.  Summarising things a little.

* We cannot change the root-ness of alpine/3.18-arm64v8.  Like
xilinx-xenial, it does need root to drive real hardware

* We can change the root-ness of alpine/3.18.  It is only used as a
build container, not a test container.

* Contrary to my previous analysis, we have backported the test-artefact
CPIO work to 4.19, but not the build step CPIO archive.


And, what to do:

* We really do need to be rootless in the build containers.  Therefore I
think we need to split alpine/3.18-arm64v8 in two, and when bumping to
the next version is the obvious point to do this.  We should make a
dedicated qubes container similar to xilinx-xenial, and separate it from
the build step.

* I should see about backporting the build step CPIO archive.  I'm
beginning to think that was an oversight of mine, because I didn't
intend to end up with a split like this.  This should avoid the step
causing us problems here.

* I'm very inclined to change the root-ness of alpine/3.18.  Testing
suggests this is fine.

~Andrew

