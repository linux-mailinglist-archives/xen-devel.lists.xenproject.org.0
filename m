Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025EA1D7553
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 12:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jad9a-0000ba-Ox; Mon, 18 May 2020 10:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPYZ=7A=linux-powerpc.org=kda@srs-us1.protection.inumbo.net>)
 id 1jad9Z-0000bV-Lu
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 10:37:49 +0000
X-Inumbo-ID: 9e1e67cc-98f3-11ea-9887-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e1e67cc-98f3-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 10:37:49 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g9so7997016edw.10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Bl/WG6QnU3SEi8B+fZ0xquucXbSbIUYtTuEV8XsL2w=;
 b=KJeAVM5yedKkJIgWwNbyfnVys3l7bclbOzdmns1BXhHb20udhMxCoPtOxsMu/kTO6H
 yD6p3+LVK9QcUyKf4UQz/CNc/0bbfOtpeb+3fNpywCaPSYZMYvzRL3jAwyokUkb7AcXL
 aSogFIoeAxb9PxpEaYaToavYxuFvqcPDTHvqKMkFHlDCDLCiKBURqIUamxEWSAT1kvRO
 IcKoH0/IKhrElGGtHCCLs2xXYCLRKYEtP3PSFfOMUEHcWpKqBDemLVOFzTKnWc9b8cj0
 yMtXhj52ADtbC62jCwAHdbpKnb8/80XdIuo24BefbRLPWDUdGcryTXS9cieQf5zEjdDp
 Et9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Bl/WG6QnU3SEi8B+fZ0xquucXbSbIUYtTuEV8XsL2w=;
 b=qlls+oJSP0Rl7VXovEll5Hunxw1zrj6Fh3E6sPiEG6XJbr5HIIRfBhN0eeew4x+gVN
 uZkgO5SetTXNbyHCOjOpN7M0swM74w82/QfCKL79b/gQu9sh0IYd7r7VUx16upty2+ez
 YKaEyohp6GCf7+/tmz+/xCOVQj5BdzPipOvXedQcinlQNySYELzymZnolelceyZoUzdi
 b/yHS9H1YtiANM+3VkyBqzXywdVTDEwzH5l+KSXlltwK6xaT4OvgKCONVha/HPRFL5dE
 Trdv+G/Qk+S2uEH9Zb1CwlKaUpCJK9WNePtpRLX3Y3bHdWuixMrng43otVcyMCMW1P69
 PwQA==
X-Gm-Message-State: AOAM530TV5gkOoMgDMNbMvU/jm6NNg6HLs0TEd4RdTlWvt0xpFrudLfJ
 loLY5JFojO9BXJORuIiaoc18T+b1r0NVywZpBM7eZL2NExg=
X-Google-Smtp-Source: ABdhPJxdot3/awlmb1zQUzX00JePE7Qs3APx29J6/8Y5vscdjZoogGVM6aRzly+26egsaUsEHkx/ayArSupHaJ9qhs8=
X-Received: by 2002:aa7:da04:: with SMTP id r4mr12705670eds.346.1589798268112; 
 Mon, 18 May 2020 03:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:34e:0:0:0:0:0 with HTTP;
 Mon, 18 May 2020 03:37:47 -0700 (PDT)
X-Originating-IP: [5.35.46.227]
In-Reply-To: <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
 <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
 <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
 <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Mon, 18 May 2020 13:37:47 +0300
Message-ID: <CAOJe8K08BJv5UefSYUQRWuFtsR=aMxJEV=JJvkMsrGk6q0fQRQ@mail.gmail.com>
Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/18/20, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
> On 18.05.20 11:52, Denis Kirjanov wrote:
>> On 5/18/20, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
>>> On 18.05.20 10:24, Denis Kirjanov wrote:
>>>> The patch adds a new extra type to be able to diffirentiate
>>>> between RX responses on xen-netfront side with the adjusted offset
>>>> required for XDP processing.
>>>>
>>>> For Linux the offset value is going to be passed via xenstore.
>>>
>>> Why? I can only see disadvantages by using a different communication
>>> mechanism.
>> I see it like other features passed through xenstore and it requires
>> less changes to
>> other structures with the same final result.
>
> This is okay as long there is no Xenstore interaction required when the
> interface has been setup completely (i.e. only defining the needed
> offset for XDP is fine, enabling/disabling XDP at runtime should not be
> done via Xenstore IMO).
I've checked netfront-<--->netback interaction and found no problems with i=
t.
Paul found an issue that the value of the netfront state hasn't been
re-read (during unbind-bind sequence in dom0) and I've fixed it the
patch for the guest

>
> And please, no guest type special casing. Please replace "Linux" by e.g.
> "The guest" (with additional tweaking of the following sentence).

Oh, just sent v2. I'll fix a comment.

>
>
> Juergen
>

