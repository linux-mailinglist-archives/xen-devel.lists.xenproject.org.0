Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36921A3C6FA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 19:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893353.1302251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoQZ-0000Zq-Vq; Wed, 19 Feb 2025 18:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893353.1302251; Wed, 19 Feb 2025 18:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoQZ-0000Wv-T7; Wed, 19 Feb 2025 18:04:07 +0000
Received: by outflank-mailman (input) for mailman id 893353;
 Wed, 19 Feb 2025 18:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkoQY-0000Wp-3t
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 18:04:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80b16c5-eeeb-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 19:04:05 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f504f087eso67588f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 10:04:05 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439880fbd6fsm85992155e9.18.2025.02.19.10.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 10:04:03 -0800 (PST)
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
X-Inumbo-ID: e80b16c5-eeeb-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739988244; x=1740593044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=av1B2KtuVF6XOLyNu7tkpBNokmN9YzRgCSMOrTuC3gY=;
        b=nl32OtND+Chip/EhYMXcrl4BCXTz+TKeqV2REVkQd65e/vT9LNCBMMa7DGIa5o+WJk
         PRFSNayZFJ1Rnbo7lGJPXP4yoQlqL7jeOWnVkg6H0+tCW7Q8hLtKCJ9+dTf5W/JyMhEU
         iNJDIvLqz5jzkd418GWj7l+zoRSS85J/tghLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739988244; x=1740593044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av1B2KtuVF6XOLyNu7tkpBNokmN9YzRgCSMOrTuC3gY=;
        b=KZKNPQlS0S7TRWcN1gBvRn2XuUNJNMmTZaEq6pNObH+aulY8HMQwgdN7eh56N2ioib
         lCobd50NSQiVFZjkL9Z1m8On1yzhIeT4Yb1/JPMfzpGfLoCEGiq++sFBugOw8i4FE3Oa
         4PBcDLbBRzG1fUYhv67iJs6hp+bUdqQBgyCt7U6v47d7IiPxwqmCOnB8qUSbJC16Bs8g
         WG0kA5sQwxa2OnFCs8fjZOkV63n9W7G65aC28Pg10i18fuP4rUc0ryqM2TcXmyriI5D1
         5EoChUaWXiwmggmULpbU2pfJ49Xd5x19dQY6wBUBXgKEv4TUT2axZEygk0JAZwdyQxN6
         WzKA==
X-Gm-Message-State: AOJu0Yx9sGiqUV4EGS2tm7xkWq4Nw/xPfdlaYVSrOo7kGx63GALwR9mU
	V8pKdFN9AQwmroSJ1qrj9bXO6gb0pi3hIrFkhC1tYHUiQ7/2Q9VfFtf1POOlOCs=
X-Gm-Gg: ASbGncsiTMxbFeOsh4kTYP4yPXwieq4SgMKMGoMCsN88hG1Wi24H/gdrcr8LgTB8Pgo
	+vFXcQ2o6riHo5jV1SQTX9/EipvytKz5VIIw8TbNTFBxoEoFY/6zZpDdC8A+Dm3qs60LXm5nYx0
	Vijm/PQUKOYAtUA9FhcpGSSHiJQpACwINeknR70ugq7RhdxIbuDnD9N3v/4qThK1EYB7jWrh1pm
	0dT2sIYC5dO3Do7OxgBatrbz+iPK1r5iQlAFWAmirJeftUu+5X+bs/ophaQndOLq8Kb3hL1UqIa
	iE4neAVZQstmLWZFS0sQKaZNQmq4Mu1Nsh97Rzsz61/N4DUwJMkWtDk=
X-Google-Smtp-Source: AGHT+IEhjp3H0QvhLE/IysQQu4X7Hr/7N38XcsR0+zXawp0QhGd9o9tkxMmkBOawrzqsuoojwbgMKQ==
X-Received: by 2002:a5d:6a85:0:b0:38f:513a:e12c with SMTP id ffacd0b85a97d-38f587e5b02mr3429748f8f.45.1739988244287;
        Wed, 19 Feb 2025 10:04:04 -0800 (PST)
Message-ID: <c75a1003-5035-4ba5-a65d-d9e5f9dc5624@citrix.com>
Date: Wed, 19 Feb 2025 18:04:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
 <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
 <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 7:54 am, Jan Beulich wrote:
> On 13.02.2025 01:51, Andrew Cooper wrote:
>> On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
>>> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
>>>> Hello everyone,
>>>>
>>>> During the installation of Xen on an ARM server machine from the source code,
>>>> I found that the wrong release candidate (rc) is being used:
>>>>   $ make install  
>>>>     install -m0644 -p xen //boot/xen-4.20-rc  
>>>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>>>>     make[1]: *** [Makefile:507: _install] Error 1
>>>> My expectation is that it should be xen-4.20-rc4.
>>>>
>>>> I'm not sure if this behavior is intentional or if users are expected to set
>>>> the XEN_VENDORVERSION variable manually to ensure the correct release
>>>> candidate number.
>>>>
>>>> In my opinion, we should set the proper release candidate number after
>>>> "xen-4.20-rc" automatically.
>>>>
>>>> Does anyone have any thoughts or suggestions on how to resolve this issue?
>>> Hi Oleksii,
>>>
>>> I did a quick test and I see exactly the same on x86 as well. This patch
>>> fixes it, but then it would need someone to update the RC number in
>>> xen/Makefile every time a new RC is made.
>>>
>>> ---
>>> xen: add RC version number to xen filename
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> This is a direct consequence of the request to keep XEN_EXTRAVERSION at
>> "-rc" throughout the release cycle.
>>
>> I'm having to manually edit that simply to create the tarballs
>> correctly, which in turn means that the tarball isn't a byte-for-byte
>> identical `git archive` of the tag it purports to be.
> Just for my understanding - may I ask why this editing is necessary?
> Other release technicians never mentioned the (indeed undesirable)
> need to do so.

I did point it out.  I also needed to get RC1 cut and everyone had left
the office.

xen.git$ make src-tarball-release && tar tf dist/xen-4.20-rc.tar.gz | head
<snip>
Source tarball in /home/andrew/xen.git/dist/xen-4.20-rc.tar.gz
xen-4.20-rc/
xen-4.20-rc/.github/
xen-4.20-rc/.github/workflows/
xen-4.20-rc/.github/workflows/coverity.yml
xen-4.20-rc/.gitarchive-info
xen-4.20-rc/Makefile
xen-4.20-rc/stubdom/
xen-4.20-rc/stubdom/Makefile
xen-4.20-rc/stubdom/grub/
xen-4.20-rc/stubdom/grub/Makefile

mktarball uses `$(MAKE) -C xen xenversion` which uses XEN_EXTRAVERSION.

XEN_EXTRAVERSION needs both the .0 and the RC number in order to make
the tarball with the correct name and correct top directory.

What I didn't anticipate was that, while editing XEN_EXTRAVERSION
locally gets a proper tarball, the contents within the tarball are
nonspecific as to the RC, hence Oleksii's observation.

It also means the tarball wasn't a straight `git archive` of the tree,
which is one of the reasons behind taking out the sub-repos.
>> I'd not twigged that it mean the builds from the tarballs reported false
>> information too.
>>
>> While I appreciate the wish to not have a commit per RC bumping
>> XEN_EXTRAVERSION, I think the avoidance of doing so is creating more
>> problems than it solves, and we should revert back to the prior way of
>> doing things.
> Sure, if it truly is getting in the way, then it needs re-considering.
> Just to mention it: Then the question is going to be though whether
> really to merely adjust XEN_EXTRAVERSION, or whether instead to do
> this consistently in all (three?) places.

It's only XEN_EXTRAVERSION which needs to change (I think).

I think README and SUPPORT.md are fine to say as they are, for
generically -rc.


Oleksii has asked for RC5, and we're overdue.  I'm intending to commit:

diff --git a/xen/Makefile b/xen/Makefile
index 65b460e2b480..4e37fff92514 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 20
-export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc5$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   =
$(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
in order to make that happen properly, and finally have the tarball be a
straight `git archive` invocation.

Does this sound acceptable?

~Andrew

