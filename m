Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD99293DEA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 15:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9642.25325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs7V-0007rV-Hq; Tue, 20 Oct 2020 13:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9642.25325; Tue, 20 Oct 2020 13:56:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs7V-0007r7-Ec; Tue, 20 Oct 2020 13:56:09 +0000
Received: by outflank-mailman (input) for mailman id 9642;
 Tue, 20 Oct 2020 13:56:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BvO=D3=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kUs7U-0007r2-4C
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:56:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cf29dc5e-27ad-4ca8-bdf3-e5ed5c700bef;
 Tue, 20 Oct 2020 13:56:04 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-5R7MHkehMSef3ftuAUd6Yw-1; Tue, 20 Oct 2020 09:56:01 -0400
Received: by mail-qv1-f71.google.com with SMTP id t13so1395574qvm.14
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 06:56:01 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id b8sm775938qkn.133.2020.10.20.06.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 06:55:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0BvO=D3=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kUs7U-0007r2-4C
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:56:08 +0000
X-Inumbo-ID: cf29dc5e-27ad-4ca8-bdf3-e5ed5c700bef
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id cf29dc5e-27ad-4ca8-bdf3-e5ed5c700bef;
	Tue, 20 Oct 2020 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603202163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyQ28xr5/lapv6azTtFCvHFT5XQ1+OzeHk+84iEm66Y=;
	b=QUp+Tm/49C2D2ArfwdGiXcYEZLmxY3ITF9bXZyS+HEfcJJoqaGxmch+2EHiNHeADDWpHNz
	Ouzap4oFcZixuWmorb4Ub+lRVmWRZDipZO+0tL8W1vnU06zVM/xfLz81/8VfcBPp80A1RW
	EdBHqnK2mgm1gY9dzcmZeB2rW1Al8Fc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-5R7MHkehMSef3ftuAUd6Yw-1; Tue, 20 Oct 2020 09:56:01 -0400
X-MC-Unique: 5R7MHkehMSef3ftuAUd6Yw-1
Received: by mail-qv1-f71.google.com with SMTP id t13so1395574qvm.14
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HyQ28xr5/lapv6azTtFCvHFT5XQ1+OzeHk+84iEm66Y=;
        b=gnESylwg3bfr2FliaHl2xILt8lpeI7jklBbtEGGxjhSD+84uMSQ9ZZuW6ZMAPMxhFP
         Ww2RqWTzJsrcEwoFkiaQ3YW2mdzix/A5qgoC8TrEKzLE8hzLafGdHlXCf4JujR1+ifdx
         vNe8AVmwlLhzShLvNw5LerMTILJe5Irlg1Mr3nAF80c2FMx3R7aGNmgdDhxdLKBIxtQ+
         qypnVCTPRDzYhTHR8wLFeFxjvopu0id9joglpHyHGKyyzkcgnWB0SvEDetg+P7U76IU6
         XqzIEIqvXz0KcZGGWz2jvTPcS1O/7nhXQi3ZLfc+Sz4vKQuQIqTHO/6rKFelUEOeN+p/
         WlAA==
X-Gm-Message-State: AOAM531rgHFs14OYQvtv2qCqAZpTvI1WPCpHo20pjaShUt3YqN9TFB9h
	R5EEoKnsQ1fqdBhZJTtq5sZFBN/CErlgRx9k0RRAGNJhOmlC9K6jFtOzJNfAQ2Ml/zYdpnJdyQB
	2GrltopGzBuLZvi15MCOLVg+oa08=
X-Received: by 2002:a05:6214:174f:: with SMTP id dc15mr3370433qvb.25.1603202160688;
        Tue, 20 Oct 2020 06:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLUAfqrAOJzxwKF3+voCBF5yQYNbMOvfOkDZhumkJj3bEnT15V4x8vUJ5iQ5pWt9KusIZtsQ==
X-Received: by 2002:a05:6214:174f:: with SMTP id dc15mr3370377qvb.25.1603202160139;
        Tue, 20 Oct 2020 06:56:00 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b8sm775938qkn.133.2020.10.20.06.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 06:55:59 -0700 (PDT)
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-can@vger.kernel.org, Network Development <netdev@vger.kernel.org>,
 intel-wired-lan@lists.osuosl.org, ath10k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-nfc@lists.01.org,
 linux-nvdimm <linux-nvdimm@lists.01.org>, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 patches@opensource.cirrus.com, storagedev@microchip.com,
 devel@driverdev.osuosl.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 bpf <bpf@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 alsa-devel@alsa-project.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Greg KH <gregkh@linuxfoundation.org>, George Burgess <gbiv@google.com>,
 Joe Perches <joe@perches.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <ca1f50d6-1005-8e3d-8d5c-98c82a704338@redhat.com>
Date: Tue, 20 Oct 2020 06:55:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/19/20 12:42 PM, Nick Desaulniers wrote:
> On Sat, Oct 17, 2020 at 10:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> This is a upcoming change to clean up a new warning treewide.
>>> I am wondering if the change could be one mega patch (see below) or
>>> normal patch per file about 100 patches or somewhere half way by collecting
>>> early acks.
>> Please break it up into one-patch-per-subsystem, like normal, and get it
>> merged that way.
>>
>> Sending us a patch, without even a diffstat to review, isn't going to
>> get you very far...
> Tom,
> If you're able to automate this cleanup, I suggest checking in a
> script that can be run on a directory.  Then for each subsystem you
> can say in your commit "I ran scripts/fix_whatever.py on this subdir."
>  Then others can help you drive the tree wide cleanup.  Then we can
> enable -Wunreachable-code-break either by default, or W=2 right now
> might be a good idea.

I should have waited for Joe Perches's fixer addition to checkpatch :)

The easy fixes I did only cover about 1/2 of the problems.

Remaining are mostly nested switches, which from a complexity standpoint is bad.

>
> Ah, George (gbiv@, cc'ed), did an analysis recently of
> `-Wunreachable-code-loop-increment`, `-Wunreachable-code-break`, and
> `-Wunreachable-code-return` for Android userspace.  From the review:
> ```
> Spoilers: of these, it seems useful to turn on
> -Wunreachable-code-loop-increment and -Wunreachable-code-return by
> default for Android

In my simple add-a-cflag bot, i see there are about 250

issues for -Wunreachable-code-return.

I'll see about doing this one next.

> ...
> While these conventions about always having break arguably became
> obsolete when we enabled -Wfallthrough, my sample turned up zero
> potential bugs caught by this warning, and we'd need to put a lot of
> effort into getting a clean tree. So this warning doesn't seem to be
> worth it.
> ```
> Looks like there's an order of magnitude of `-Wunreachable-code-break`
> than the other two.
>
> We probably should add all 3 to W=2 builds (wrapped in cc-option).
> I've filed https://github.com/ClangBuiltLinux/linux/issues/1180 to
> follow up on.

Yes, i think think these should be added.

Tom


