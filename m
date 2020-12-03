Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D42CCEB2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 06:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43065.77560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkhHX-0003rH-Mi; Thu, 03 Dec 2020 05:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43065.77560; Thu, 03 Dec 2020 05:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkhHX-0003qv-JK; Thu, 03 Dec 2020 05:35:55 +0000
Received: by outflank-mailman (input) for mailman id 43065;
 Thu, 03 Dec 2020 01:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FEMK=FH=google.com=jwerner@srs-us1.protection.inumbo.net>)
 id 1kkdFn-0003kK-61
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 01:17:51 +0000
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0041973b-43b7-48b6-b8eb-9f3db2d58ec3;
 Thu, 03 Dec 2020 01:17:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id i9so392974ioo.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Dec 2020 17:17:49 -0800 (PST)
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
X-Inumbo-ID: 0041973b-43b7-48b6-b8eb-9f3db2d58ec3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lmpg5qD2M65fYVjtflfrq1MH1jnryFUeBIm4GzOqPYU=;
        b=NewOo2y8CU/oYPw9OMV6e9ukvbZiS33BdvMIIJ+GYNU3j8Wxj4K+F6lDxVEkbcBsTf
         6RiNwLOjHTnq+6bVlvatcfXpCQzFM02B+5uVjzELo+A71UPUCwh1eLyExncnxxRK8T5Q
         UdX2sGfZRUHOzZhrlzTGk2Sr0d0JbW5FSkATo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lmpg5qD2M65fYVjtflfrq1MH1jnryFUeBIm4GzOqPYU=;
        b=cUhTlEOa3Dx1GT3jGYPr1dZWimaWKxHokT+nzoYctRRrrU00Jy5UivpYZgcN1DUMBG
         TGRE2R1z33kKuK/cEA1HmgjvYIK4eL9+OacuEwm4fA+2/QgRuR18UtYujJ9P5zAghOEh
         6yXjHoiixZk2AY8ZWFmBvop7CLoTqVyLk3pGWtJSiHXi1kCsFsCs41J1dNwPOmdPPkJS
         NYR+IhfZgUTCU0Ac64N06wDfzjNG0iQL0+Zfu7T7EUUJIxT+gZ15o6Q+aLXD9WiE2dcT
         WhyINg8uE6GjEl0WF2MR27cpMPeMuWJV8gNIPbZAUAM9SwOMIdt+a/vJ0jzGuTfb6dQz
         earA==
X-Gm-Message-State: AOAM530R/Jpg+wHN25IbU275n2imoZOtM0fjkvjZqvumWU3rMmEcHSyc
	NYQOXldImIPD7nLoEEIsXeJYySBW0tRx3GIJCPVqUA==
X-Google-Smtp-Source: ABdhPJwjoA0fKKVjk9eLidoE5PocSKI2LcJfWILMWRz/wAwVo+R3t4mrTndLEkKe38ytToxMrMoxjf+nYsHf9jbBYf0=
X-Received: by 2002:a02:bc9:: with SMTP id 192mr1303365jad.50.1606958268859;
 Wed, 02 Dec 2020 17:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl> <ef50dac9-3ded-6836-28b1-7addb0bab986@gmx.de>
In-Reply-To: <ef50dac9-3ded-6836-28b1-7addb0bab986@gmx.de>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 2 Dec 2020 17:17:36 -0800
Message-ID: <CAODwPW9dxvMfXY=92pJNGazgYqcynAk72EkzOcmF7JZXhHTwSQ@mail.gmail.com>
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Coreboot <coreboot@coreboot.org>, The development of GRUB 2 <grub-devel@gnu.org>, 
	LKML <linux-kernel@vger.kernel.org>, systemd-devel@lists.freedesktop.org, 
	trenchboot-devel@googlegroups.com, U-Boot Mailing List <u-boot@lists.denx.de>, x86@kernel.org, 
	xen-devel@lists.xenproject.org, alecb@umass.edu, 
	alexander.burmashev@oracle.com, allen.cryptic@gmail.com, 
	andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org, btrotter@gmail.com, 
	dpsmith@apertussolutions.com, eric.devolder@oracle.com, 
	eric.snowberg@oracle.com, hpa@zytor.com, hun@n-dimensional.de, 
	javierm@redhat.com, joao.m.martins@oracle.com, kanth.ghatraju@oracle.com, 
	konrad.wilk@oracle.com, krystian.hebel@3mdeb.com, leif@nuviainc.com, 
	lukasz.hawrylko@intel.com, luto@amacapital.net, michal.zygowski@3mdeb.com, 
	mjg59@google.com, mtottenh@akamai.com, 
	"Vladimir 'phcoder' Serbinenko" <phcoder@gmail.com>, piotr.krol@3mdeb.com, pjones@redhat.com, 
	Paul Menzel <pmenzel@molgen.mpg.de>, roger.pau@citrix.com, ross.philipson@oracle.com, 
	tyhicks@linux.microsoft.com, Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"

Standardizing in-memory logging sounds like an interesting idea,
especially with regards to components that can run on top of different
firmware stacks (things like GRUB or TF-A). But I would be a bit wary
of creating a "new standard to rule them all" and then expecting all
projects to switch what they have over to that. I think we all know
https://xkcd.com/927/.

Have you looked around and evaluated existing solutions that already
have some proliferation first? I think it would be much easier to
convince people to standardize on something that already has existing
users and drivers available in multiple projects.

In coreboot we're using a very simple character ring buffer that only
has two 4-byte header fields: total size and cursor (i.e. current
position where you would write the next character). The top 4 bits of
the cursor field are reserved for flags, one of which is the
"overflow" flag that tells you whether the ring-buffer already
overflowed or not (so readers know whether to print the whole ring
buffer, or only from the start to the current cursor). We try to
dimension the buffers so they don't overflow on a single boot, but
this approach allows us to log multiple boots on platforms that can
persist memory across reboots, which sometimes comes in handy.

The disadvantages of that approach compared to your proposal are lack
of some features, like the facilities field (although one can still
just print a tag like "<0>" or "<4>" behind each newline) or
timestamps (coreboot instead has separate timestamp logging). But I
think a really big advantage is size: in early firmware environments
before DDR training, space is often very precious and we struggle to
find more than a couple of kilobytes for the log buffer. If I look at
the structure you proposed, that's already 24 bytes of overhead per
individual message. If we were hooking that up to our normal printk()
facility in coreboot (such that each invocation creates a new message
header), that would probably waste about a third of the whole log
buffer on overhead. I think a complicated, syslog-style logging
structure that stores individual message blocks instead of a
continuous character string isn't really suitable for firmware
logging.

FWIW the coreboot console has existing support in Linux
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/google/memconsole-coreboot.c),
SeaBIOS (https://github.com/coreboot/seabios/blob/master/src/fw/coreboot.c#L219),
TF-A (https://github.com/ARM-software/arm-trusted-firmware/blob/master/drivers/coreboot/cbmem_console/aarch64/cbmem_console.S),
GRUB (https://git.savannah.gnu.org/cgit/grub.git/tree/grub-core/term/i386/coreboot/cbmemc.c),
U-Boot (https://github.com/u-boot/u-boot/blob/master/drivers/misc/cbmem_console.c)
and probably a couple of others I'm not aware of. And the code to add
support (especially when only appending) is so simple that it just
takes a couple of lines to implement (binary code size to implement
the format is also always a concern for firmware environments).

On Wed, Nov 18, 2020 at 7:04 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 14.11.20 00:52, Daniel Kiper wrote:
> > Hey,
> >
> > This is next attempt to create firmware and bootloader log specification.
> > Due to high interest among industry it is an extension to the initial
> > bootloader log only specification. It takes into the account most of the
> > comments which I got up until now.
> >
> > The goal is to pass all logs produced by various boot components to the
> > running OS. The OS kernel should expose these logs to the user space
> > and/or process them internally if needed. The content of these logs
> > should be human readable. However, they should also contain the
> > information which allows admins to do e.g. boot time analysis.
> >
> > The log specification should be as much as possible platform agnostic
> > and self contained. The final version of this spec should be merged into
> > existing specifications, e.g. UEFI, ACPI, Multiboot2, or be a standalone
> > spec, e.g. as a part of OASIS Standards. The former seems better but is
> > not perfect too...
> >
> > Here is the description (pseudocode) of the structures which will be
> > used to store the log data.
>
> Hello Daniel,
>
> thanks for your suggestion which makes good sense to me.
>
> Why can't we simply use the message format defined in "The Syslog
> Protocol", https://tools.ietf.org/html/rfc5424?
>
> >
> >   struct bf_log
> >   {
> >     uint32_t   version;
> >     char       producer[64];
> >     uint64_t   flags;
> >     uint64_t   next_bf_log_addr;
> >     uint32_t   next_msg_off;
> >     bf_log_msg msgs[];
>
> As bf_log_msg is does not have defined length msgs[] cannot be an array.
>
> >   }
> >
> >   struct bf_log_msg
> >   {
> >     uint32_t size;
> >     uint64_t ts_nsec;
> >     uint32_t level;
> >     uint32_t facility;
> >     uint32_t msg_off;
> >     char     strings[];
> >   }
> >
> > The members of struct bf_log:
> >   - version: the firmware and bootloader log format version number, 1 for now,
> >   - producer: the producer/firmware/bootloader/... type; the length
> >     allows ASCII UUID storage if somebody needs that functionality,
> >   - flags: it can be used to store information about log state, e.g.
> >     it was truncated or not (does it make sense to have an information
> >     about the number of lost messages?),
> >   - next_bf_log_addr: address of next bf_log struct; none if zero (I think
> >     newer spec versions should not change anything in first 5 bf_log members;
> >     this way older log parsers will be able to traverse/copy all logs regardless
> >     of version used in one log or another),
> >   - next_msg_off: the offset, in bytes, from the beginning of the bf_log struct,
> >     of the next byte after the last log message in the msgs[]; i.e. the offset
> >     of the next available log message slot; it is equal to the total size of
> >     the log buffer including the bf_log struct,
>
> Why would you need an offset to first unused byte?
>
> We possibly have multiple producers of messages:
>
> - TF-A
> - U-Boot
> - iPXE
> - GRUB
>
> What we need is the offset to the next struct bf_log.
>
> >   - msgs: the array of log messages,
> >   - should we add CRC or hash or signatures here?
> >
> > The members of struct bf_log_msg:
> >   - size: total size of bf_log_msg struct,
> >   - ts_nsec: timestamp expressed in nanoseconds starting from 0,
>
> Would each message producer start from 0?
>
> Shouldn't we use the time from the hardware RTC if it is available via
> boot service GetTime()?
>
> >   - level: similar to syslog meaning; can be used to differentiate normal messages
> >     from debug messages; the exact interpretation depends on the current producer
> >     type specified in the bf_log.producer,
> >   - facility: similar to syslog meaning; can be used to differentiate the sources of
> >     the messages, e.g. message produced by networking module; the exact interpretation
> >     depends on the current producer type specified in the bf_log.producer,
> >   - msg_off: the log message offset in strings[],
>
> What is this field good for? Why don't you start the the string at
> strings[0]?
> What would be useful would be the offset to the next bf_log_msg.
>
> >   - strings[0]: the beginning of log message type, similar to the facility member but
> >     NUL terminated string instead of integer; this will be used by, e.g., the GRUB2
> >     for messages printed using grub_dprintf(),
> >   - strings[msg_off]: the beginning of log message, NUL terminated string.
>
>
> Why strings in plural? Do you want to put multiple strings into
> 'strings'? What identifies the last string?
>
>
> >
> > Note: The producers are free to use/ignore any given set of level, facility and/or
> >       log type members. Though the usage of these members has to be clearly defined.
> >       Ignored integer members should be set to 0. Ignored log message type should
> >       contain an empty NUL terminated string. The log message is mandatory but can
> >       be an empty NUL terminated string.
> >
> > There is still not fully solved problem how the logs should be presented to the OS.
> > On the UEFI platforms we can use config tables to do that. Then probably
> > bf_log.next_bf_log_addr should not be used.
>
> Why? How would you otherwise find the entries of the next produser in
> the configuration table? What I am missing is a GUID for the
> configuration table.
>
> > On the ACPI and Device Tree platforms
> > we can use these mechanisms to present the logs to the OSes. The situation gets more
>
> I do not understand this.
>
> UEFI implementations use either of ACPI and device-trees and support
> configuration tables. Why do you want to use some other binding?
>
> Best regards
>
> Heinrich
>
> > difficult if neither of these mechanisms are present. However, maybe we should not
> > bother too much about that because probably these platforms getting less and less
> > common.
> >
> > Anyway, I am aware that this is not specification per se. The goal of this email is
> > to continue the discussion about the idea of the firmware and booloader log and to
> > find out where the final specification should land. Of course taking into the account
> > assumptions made above.
> >
> > You can find previous discussions about related topics at [1], [2] and [3].
> >
> > Additionally, I am going to present this during GRUB mini-summit session on Tuesday,
> > 17th of November at 15:45 UTC. So, if you want to discuss the log design please join
> > us. You can find more details here [4].
> >
> > Daniel
> >
> > [1] https://lists.gnu.org/archive/html/grub-devel/2019-10/msg00107.html
> > [2] https://lists.gnu.org/archive/html/grub-devel/2019-11/msg00079.html
> > [3] https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00223.html
> > [4] https://twitter.com/3mdeb_com/status/1327278804100931587
> >
>

