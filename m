Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25A293E36
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9655.25385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsKU-0000xH-WE; Tue, 20 Oct 2020 14:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9655.25385; Tue, 20 Oct 2020 14:09:34 +0000
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
	id 1kUsKU-0000wg-SC; Tue, 20 Oct 2020 14:09:34 +0000
Received: by outflank-mailman (input) for mailman id 9655;
 Tue, 20 Oct 2020 14:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BvO=D3=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kUsKT-0000wJ-6W
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:33 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6309b2c0-1d40-43cb-a39d-e6892d122521;
 Tue, 20 Oct 2020 14:09:32 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-crs-SrgkPQi59zbUaQsCog-1; Tue, 20 Oct 2020 10:09:30 -0400
Received: by mail-qv1-f69.google.com with SMTP id m11so1420326qvt.11
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 07:09:30 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id o14sm785284qto.16.2020.10.20.07.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 07:09:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0BvO=D3=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kUsKT-0000wJ-6W
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:09:33 +0000
X-Inumbo-ID: 6309b2c0-1d40-43cb-a39d-e6892d122521
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 6309b2c0-1d40-43cb-a39d-e6892d122521;
	Tue, 20 Oct 2020 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603202972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOdQp2iOSkahNa0CfH1+VDlgH/zqWEjNOjN0qUXEes0=;
	b=ewDv3aOrdJ+x5A6s7YiY6e3DZ/xG19fiCFYxEBc219ynzJxgu/51wlX4XbcPcMAU2oHyfD
	PtMot7BJZaqOvPJXq6YGOAgeRSVWl5/eHGglGFP0XXl1T9R1hHW25Ri1M+zqhWdXytm0kf
	dEEfBPozJhD9ETuNOOZz/yhFPpgdSTo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-crs-SrgkPQi59zbUaQsCog-1; Tue, 20 Oct 2020 10:09:30 -0400
X-MC-Unique: crs-SrgkPQi59zbUaQsCog-1
Received: by mail-qv1-f69.google.com with SMTP id m11so1420326qvt.11
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 07:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rOdQp2iOSkahNa0CfH1+VDlgH/zqWEjNOjN0qUXEes0=;
        b=iMPUrsx4ldXtzpmz3w5ub2agzkVd7ReSWu67R0EvJZjAUeQ0Fz/iD0LShrJuziZn4z
         KvL1wk6wT04TUVuxhTDQiWbMtdZrvEIRcJL/zCudLhkfe5Vc498WnMdwD9a7G6lRo3Xf
         rIwzOsXA9aNoMGxh3++vsTlzUD4HYrQlAcAFq1zqG2DQWuqr8z6XA2n4diAfw2On/axs
         n8noU3v4+KgndbkrVPYXiv218smDYYNCMeNIEWOozM11bZ6nEYqHd6/Iobz4ZAl9XJ1U
         Cu+YPF8L3nQgNKKWHIADfvOUVAsHxitE2lvMlw9knDrYRgxVupxeSyW26l6YDIUPZ/5+
         jNKQ==
X-Gm-Message-State: AOAM53161i/OxhEqiTYh/qd7Ztsfct6Mqn+zml8i4sDZmQsBSsrmza05
	4/3YOiJ9+e0jqilM+/3aSOCBNSjJaq++VbyIB+JhMAc0hybVhjYqeFcP75wVIMr5z1Ycyz93bfs
	YW4djY0HojDmNjLF/mu8EOsz0VTM=
X-Received: by 2002:a05:620a:2195:: with SMTP id g21mr2990080qka.358.1603202969736;
        Tue, 20 Oct 2020 07:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKUy8N8weGLwzCzHDZ8oTBMtQsWbHEBLlPfZD5zpEfJ13ExA6QvxSe7FmqqHnm4D1jNxINeQ==
X-Received: by 2002:a05:620a:2195:: with SMTP id g21mr2990039qka.358.1603202969497;
        Tue, 20 Oct 2020 07:09:29 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id o14sm785284qto.16.2020.10.20.07.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 07:09:28 -0700 (PDT)
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: Jason Gunthorpe <jgg@ziepe.ca>, Nick Desaulniers <ndesaulniers@google.com>
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
 Greg KH <gregkh@linuxfoundation.org>, George Burgess <gbiv@google.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
 <CAKwvOdkR_Ttfo7_JKUiZFVqr=Uh=4b05KCPCSuzwk=zaWtA2_Q@mail.gmail.com>
 <20201019230546.GH36674@ziepe.ca>
From: Tom Rix <trix@redhat.com>
Message-ID: <859ff6ff-3e10-195c-6961-7b2902b151d4@redhat.com>
Date: Tue, 20 Oct 2020 07:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201019230546.GH36674@ziepe.ca>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/19/20 4:05 PM, Jason Gunthorpe wrote:
> On Mon, Oct 19, 2020 at 12:42:15PM -0700, Nick Desaulniers wrote:
>> On Sat, Oct 17, 2020 at 10:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>>>> From: Tom Rix <trix@redhat.com>
>>>>
>>>> This is a upcoming change to clean up a new warning treewide.
>>>> I am wondering if the change could be one mega patch (see below) or
>>>> normal patch per file about 100 patches or somewhere half way by collecting
>>>> early acks.
>>> Please break it up into one-patch-per-subsystem, like normal, and get it
>>> merged that way.
>>>
>>> Sending us a patch, without even a diffstat to review, isn't going to
>>> get you very far...
>> Tom,
>> If you're able to automate this cleanup, I suggest checking in a
>> script that can be run on a directory.  Then for each subsystem you
>> can say in your commit "I ran scripts/fix_whatever.py on this subdir."
>>  Then others can help you drive the tree wide cleanup.  Then we can
>> enable -Wunreachable-code-break either by default, or W=2 right now
>> might be a good idea.
> I remember using clang-modernize in the past to fix issues very
> similar to this, if clang machinery can generate the warning, can't
> something like clang-tidy directly generate the patch?

Yes clang-tidy and similar are good tools.

Sometimes they change too much and your time shifts

from editing to analyzing and dropping changes.


I am looking at them for auto changing api.

When i have something greater than half baked i will post.

Tom

>
> You can send me a patch for drivers/infiniband/* as well
>
> Thanks,
> Jason
>


