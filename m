Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C509FA248
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 20:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862511.1274155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pv-0006Il-Jz; Sat, 21 Dec 2024 19:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862511.1274155; Sat, 21 Dec 2024 19:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP5Pv-0006Cy-Fq; Sat, 21 Dec 2024 19:45:39 +0000
Received: by outflank-mailman (input) for mailman id 862511;
 Sat, 21 Dec 2024 19:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6MP=TO=gmail.com=sedat.dilek@srs-se1.protection.inumbo.net>)
 id 1tP4rq-0002fx-RK
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 19:10:26 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bdad759-bfcf-11ef-a0d9-8be0dac302b0;
 Sat, 21 Dec 2024 20:10:25 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53e399e3310so3315136e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 11:10:25 -0800 (PST)
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
X-Inumbo-ID: 3bdad759-bfcf-11ef-a0d9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734808225; x=1735413025; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DICSLitDkSZdoKgSJ3JkSamUIfZXy0wB9Dy+tZ/JX4o=;
        b=VGraXY34BkCwkRt3vN5XfRUgOLCG8kE3WkbN1d7+kTGf8B7sXDKVxxUM3Y4iaHCmDQ
         /0/5/Qy+5jghcS7SBJclPiANkXnt7O3mDzZEEDWi9Mc0dLe0NFsBSeDFkmGeioo6+Z0q
         yIFPTwTLtkkS4W86AJBsocHFFXwLiP32kdo2yuXX/nxBTZzNGom6dUQFsmdroLZJPdVt
         7kHz6gX6lfwiuYRSWtIMn1jP0je7E2cjjH7gPub1//O/piAoyPVzgCkMHHi+qCcOKl3V
         qEcvYedCMVHBYo0NRJrttWGpucY6o9EqzSW9wur8Aif1PgjLE4Ku79a6m6QvZQaLoyRv
         Rz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734808225; x=1735413025;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DICSLitDkSZdoKgSJ3JkSamUIfZXy0wB9Dy+tZ/JX4o=;
        b=BwdQfU2FO9p6hhCz+13mUJ5HnWiHwLjzdXwtiyNBgbyLOUqoduBBQkqc87QwyIHtL8
         MXQJI4mLJhHozRgGAku+JC1Twf3jYOIcGWvVfdpqmCXgPMGzrCIaQ0sgllskciMlRTfE
         eai4IZmH4UWAszl5ufKQrm+L1BMfShUEAB4gujlajpdj2kKaSDQgnClUMSsWI/nSI4CA
         iL2ofF7jD5YtNP2enWxtJXIKQIv2f0He0DHZ4KqUG5qUHUpTklHs8hpRKjiEEEUMcQC6
         GdWiuDcxTsdgBM7pIVCyJWsPuuRHqKBpUjIykcO1gZ4XNWSRnFCyl2OOsql8ZB489cnU
         AGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4g5ddCrim7IKh1zscpGNtlA5j3kktE9KM+OlXmaS6HQjen5Q4K4qfQQHXVpEG85MK8tSFpgAa6Ac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3Sk5zm9Zt6JH9l6G1z2ZIqLozl5E++8FKdl6m783IudTsHp2G
	hXaL7K8INTu6KrtmRVY2KZnYioVmwAiuf6Z0GVY4ktuPyo37cjLXMyJpHhFnmnxJK4aSLqmNVQP
	dYBt4JCMe0YT6HpNJwLx6ndVH2lk=
X-Gm-Gg: ASbGncv9cXs1c1KJzZ5ilJwQ9DTR7Yi686xysIg12+RwfUp5zbNnBmTDau3s3AcV3Dt
	CdLenFe2uBVBwq1pwgmOPWng8DXGdqRJ8qZsyknImjtIKVkTAbxGD425hWRnu/1zvQvK5
X-Google-Smtp-Source: AGHT+IEe2LojPiPTBvWcFiJy0Wow6bjJvCnYTDrCzXg4UoYFG87UC6TJQDcIoRRxmiY1F2RYuqc9z090hwAo9aGKC5M=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr879572e87.42.1734808224878; Sat, 21 Dec 2024
 11:10:24 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com> <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com> <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com> <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
In-Reply-To: <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 21 Dec 2024 20:09:48 +0100
Message-ID: <CA+icZUV2=20qAqUmXBSfeechf_ObF-m71H7u9zAxGq5hz7k2-g@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Run all SUCCESS tests on my selfmade kernel.

# xl info | egrep 'release|version|commandline|caps'
release                : 6.12.6-1-amd64-clang19-kcfi
version                : #1~trixie+dileks SMP PREEMPT_DYNAMIC 2024-12-19
hw_caps                :
bfebfbff:17bae3bf:28100800:00000001:00000001:00000000:00000000:00000100
virt_caps              : pv hvm hap shadow gnttab-v1 gnttab-v2
xen_version            : 4.17.4-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_commandline        : placeholder vga=,keep noreboot

dileks@iniza:~/src/xtf/git$ sudo ./xtf-runner --host $( grep SUCCESS
../TESTS-SUCCESS | awk '{ print $1 }' )
...
Combined test results:
test-hvm32-invlpg~hap                    SUCCESS
test-hvm32-invlpg~shadow                 SUCCESS
test-hvm32pae-invlpg~hap                 SUCCESS
test-hvm32pae-invlpg~shadow              SUCCESS
test-hvm64-invlpg~hap                    SUCCESS
test-hvm64-invlpg~shadow                 SUCCESS
test-hvm64-lbr-tsx-vmentry               SUCCESS
test-hvm32-livepatch-priv-check          SUCCESS
test-hvm64-livepatch-priv-check          SUCCESS
test-pv64-livepatch-priv-check           SUCCESS
test-hvm32-lm-ts                         SUCCESS
test-hvm64-lm-ts                         SUCCESS
test-hvm32pae-memop-seg                  SUCCESS
test-hvm64-memop-seg                     SUCCESS
test-pv64-memop-seg                      SUCCESS
test-hvm32pae-nmi-taskswitch-priv        SUCCESS
test-pv64-pv-iopl~hypercall              SUCCESS
test-pv64-pv-iopl~vmassist               SUCCESS
test-hvm32-xsa-122                       SUCCESS
test-hvm32pae-xsa-122                    SUCCESS
test-hvm32pse-xsa-122                    SUCCESS
test-hvm64-xsa-122                       SUCCESS
test-pv64-xsa-122                        SUCCESS
test-hvm64-xsa-168~shadow                SUCCESS
test-hvm64-xsa-173~shadow                SUCCESS
test-pv64-xsa-182                        SUCCESS
test-hvm32-xsa-188                       SUCCESS
test-hvm32pae-xsa-188                    SUCCESS
test-hvm32pse-xsa-188                    SUCCESS
test-hvm64-xsa-188                       SUCCESS
test-pv64-xsa-188                        SUCCESS
test-hvm32-xsa-192                       SUCCESS
test-pv64-xsa-193                        SUCCESS
test-hvm64-xsa-195                       SUCCESS
test-pv64-xsa-212                        SUCCESS
test-pv64-xsa-213                        SUCCESS
test-hvm64-xsa-221                       SUCCESS
test-pv64-xsa-221                        SUCCESS
test-pv64-xsa-224                        SUCCESS
test-pv64-xsa-227                        SUCCESS
test-hvm64-xsa-231                       SUCCESS
test-pv64-xsa-231                        SUCCESS
test-hvm64-xsa-232                       SUCCESS
test-pv64-xsa-232                        SUCCESS
test-pv64-xsa-234                        SUCCESS
test-hvm32-xsa-239                       SUCCESS
test-pv64-xsa-255                        SUCCESS
test-pv64-xsa-259                        SUCCESS
test-pv64-xsa-260                        SUCCESS
test-hvm64-xsa-261                       SUCCESS
test-pv64-xsa-265                        SUCCESS
test-hvm64-xsa-269                       SUCCESS
test-hvm64-xsa-277                       SUCCESS
test-hvm64-xsa-278                       SUCCESS
test-pv64-xsa-279                        SUCCESS
test-pv64-xsa-286                        SUCCESS
test-pv64-xsa-296                        SUCCESS
test-pv64-xsa-298                        SUCCESS
test-hvm64-xsa-304                       SUCCESS
test-hvm64-xsa-308                       SUCCESS
test-pv64-xsa-316                        SUCCESS
test-hvm32-xsa-317                       SUCCESS
test-hvm32pae-xsa-317                    SUCCESS
test-hvm32pse-xsa-317                    SUCCESS
test-hvm64-xsa-317                       SUCCESS
test-pv64-xsa-317                        SUCCESS
test-pv64-xsa-333                        SUCCESS
test-pv64-xsa-339                        SUCCESS

No CFI related stuff in dmesg seen after running XFT tests.

Best regards,
-Sedat-

