Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD91EB430
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 06:17:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfyM7-0001QE-7O; Tue, 02 Jun 2020 04:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2LS=7O=n-dimensional.de=hun@srs-us1.protection.inumbo.net>)
 id 1jfpBm-00041O-LR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 18:29:34 +0000
X-Inumbo-ID: d5e29be0-a435-11ea-81bc-bc764e2007e4
Received: from mailout01.mx.bawue.net (unknown [193.7.176.62])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5e29be0-a435-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 18:29:32 +0000 (UTC)
Received: from n-dimensional.de (p5b17584c.dip0.t-ipconnect.de [91.23.88.76])
 (Authenticated sender: pdim@bawue.de)
 by smtp.bawue.net (Postfix) with ESMTPSA id 6B0A320623;
 Mon,  1 Jun 2020 20:25:37 +0200 (CEST)
Date: Mon, 1 Jun 2020 20:25:29 +0200
From: Hans Ulrich Niedermann <hun@n-dimensional.de>
To: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [BOOTLOADER SPECIFICATION RFC] The bootloader log format for
 TrenchBoot and others
Message-ID: <20200601202529.6936930b@n-dimensional.de>
In-Reply-To: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
References: <20200529112735.qln44ds6z7djheof@tomti.i.net-space.pl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanner: SAV Dynamic Interface 2.6.0, Engine: 3.77.1, SAV: 5.75
 (9763E680) on relay01.mx.bawue.net using milter-sssp 0.1.0
X-Virus-Scan: Found to be clean.
X-Mailman-Approved-At: Tue, 02 Jun 2020 04:16:50 +0000
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
Cc: dpsmith@apertussolutions.com, alexander.burmashev@oracle.com,
 krystian.hebel@3mdeb.com, hpa@zytor.com, michal.zygowski@3mdeb.com,
 The development of GNU GRUB <grub-devel@gnu.org>, x86@kernel.org,
 javierm@redhat.com, kanth.ghatraju@oracle.com, ross.philipson@oracle.com,
 xen-devel@lists.xenproject.org, leif@nuviainc.com,
 trenchboot-devel@googlegroups.com, alec.brown@oracle.com, mtottenh@akamai.com,
 konrad.wilk@oracle.com, phcoder@gmail.com, piotr.krol@3mdeb.com,
 ard.biesheuvel@linaro.org, andrew.cooper3@citrix.com,
 linux-kernel@vger.kernel.org, mjg59@google.com, eric.snowberg@oracle.com,
 pjones@redhat.com, lukasz.hawrylko@linux.intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 29 May 2020 13:27:35 +0200
Daniel Kiper <daniel.kiper@oracle.com> wrote:

> Below you can find my rough idea of the bootloader log format which is
> generic thing but initially will be used for TrenchBoot work. I
> discussed this proposal with Ross and Daniel S. So, the idea went
> through initial sanitization. Now I would like to take feedback from
> other folks too. So, please take a look and complain...
> 
> In general we want to pass the messages produced by the bootloader to
> the OS kernel and finally to the userspace for further processing and
> analysis. Below is the description of the structures which will be
> used for this thing.

This should mention that this about having one contiguous block of
memory which contains a struct bootloader_log.

>   struct bootloader_log_msgs

Why the plural with the trailing letter s in the struct name? This looks
like a single message to me, and should thus be signular without a
trailing letter s.

>   {
>     grub_uint32_t level;
>     grub_uint32_t facility;
>     char type[];
>     char msg[];
>   }

How would this work? How could a compiler know where msg starts? gcc
just reports "error: flexible array member not at end of struct" here
as there is no way of knowing.

Where are the sizes of type[] and msg[] defined?

Only implicitly by just having two NUL terminated strings right after
each other? That would mean you need to change the struct to

    struct bootloader_log_msg
    {
      grub_uint32_t level;
      grub_uint32_t facility;
      char strings[];
    }

and have anyone parsing this structure walk through all characters in
strings[] looking for NULs to eventually find out where the msg string
actually starts. This looks at least a bit ugly to me, unless you
absolutely need to save the last bit of code and data memory in the
bootloader.

To help find where the msg actually starts without needing to look for
a NUL character, you could add a struct member showing where the msg
string actually starts within strings[]:

    struct bootloader_log_msg
    {
      grub_uint32_t level;
      grub_uint32_t facility;
      grub_uint32_t msg_start;
      char strings[];
    }

This msg_start value could be defined as an character offset into
strings[]. Then accessing msg->strings or &msg->strings[0] would access
the type string, and &msg->strings[msg_ofs] would access the message:

    struct bootloader_log_msg *msg = ...;
    printf("msg type: %s\n", &msg->strings[0]);
    printf("msg:      %s\n", &msg->strings[msg->msg_start]);

For quick parsing of the messages, having a "grub_uint32_t size"
struct member to quickly skip the current struct bootloader_log_msg
completely and jump directly to the next struct would be helpful,
regardless of how the strings are actually stored:

    struct bootloader_log_msg
    {
      grub_uint32_t level;
      grub_uint32_t facility;
      grub_uint32_t size;
      [ ... string storage ... ]
    }

>   struct bootloader_log
>   {
>     grub_uint32_t version;
>     grub_uint32_t producer;
>     grub_uint32_t size;
>     grub_uint32_t next_off;
>     bootloader_log_msgs msgs[];
>   }
> 
> The members of struct bootloader_log:
>   - version: the bootloader log format version number, 1 for now,
>   - producer: the producer/bootloader type; we can steal some values
> from linux/Documentation/x86/boot.rst:type_of_loader,

>   - size: total size of the log buffer including the bootloader_log
> struct,

"size in bytes"?

>   - next_off: offset in bytes, from start of the bootloader_log
> struct, of the next byte after the last log message in the msgs[];
>     i.e. the offset of the next available log message slot,

It appears to me that next_off is only interesting for code which
appends log messages to that structure. For reading such a struct,
next_off is useless and could thus be a private variable inside that
bootloader which is not passed on to a next stage bootloader or an OS
kernel.

So specifying next_off as something other than a "reserved" uint32_t is
for when you have a chain of bootloaders which all append messages to
that buffer, and you want to avoid all the bootloaders having to parse
the messages from the previous bootloader's messages in order to find
out where to append messages. If that is the intention, this procedure
should at least be mentioned somewhere.

I am also missing any mention of memory alignment. With the number of
CPUs in the field which cannot directly read misaligned words
increasing, specifying a 4 byte or 8 byte alignment for these
structures could significantly reduce the code complexity for such
CPUs at the cost of a few bytes of memory.

And while on the topic of memory layout: With all these uint32_t
values, is this only for a 32bit protocol, or will this remain 32bit
even for otherwise 64bit code, or what is the plan here?

>   - msgs: the array of log messages.
> 
> The members of struct bootloader_log_msgs:
>   - level: similar to syslog meaning; can be used to differentiate
>     normal messages from debug messages; exact interpretation depends
>     on the current producer/bootloader type specified in the
>     bootloader_log.producer,
>   - facility: similar to syslog meaning; can be used to differentiate
>     the sources of the messages, e.g. message produced by networking
>     module; exact interpretation depends on the current
> producer/bootloader type specified in the bootloader_log.producer,

>   - type: similar to the facility member but NUL terminated string
> instead of integer; this will be used by GRUB for messages printed
> using grub_dprintf(),

Just to get an idea of what type[] is supposed to be for: What part of
grub_dprintf() is supposed to end up in the type[] string? "file:line"?

>   - msg: the bootloader log message, NUL terminated string.
> 
> Note: The bootloaders are free to use/ignore any given set of level,
>       facility and/or type members. Though the usage of these members
>       has to be clearly defined. Ignored integer members should be set
>       to 0. Ignored type member should contain an empty NUL terminated
>       string. msg member is mandatory but can be an empty NUL
> terminated string.

Is there any idea of what is supposed to happen when too many messages
are being generated to fit into the memory area allocated for the log
messages?

One could copy the data into a bigger memory area and continue
appending messages, or just stop appending messages, or copy all the
messages towards the beginning of msgs[] by a few messages such that a
few older messages are being lost by being overwritten and new space
for appending messages is created.

In any case, the consumer of the log messages may be interested in
knowing when some messages have been lost.

> Taking into account [1] and [2] I want to make this functionality
> generic as much as possible. So, this bootloader log can be used with
> any bootloader and OS kernel. However, initially the functionality
> will be implemented for the Linux kernel and its boot protocol.
> 
> In case of Linux kernel the pointer to the bootloader_log struct
> should be passed from the bootloader to the kernel through the
> boot_params and the bootloader_log struct contents should be exposed
> via sysfs. E.g. somewhere at /sys/kernel/debug or /sys/kernel/tracing
> or maybe we should create new /sys/bootloader/log node.
> 
> If everybody is OK with this rough proposal then I will start working
> on making it a part of Multiboot2 specification (the text above is
> just raw description of the idea; it is not final text which land
> into the spec). If you see better place for this thing just drop me a
> line.

Starting purely from a Grub and Multiboot 2 point of view, this
Bootloader Log Message spec would fit into a @subsection of the "Boot
Information" @section, even if that @subsection would be a large one.

Eventually, the Linux docs, the Grub docs, the Multiboot2 docs, BSD
kernel docs etc all need to reference the Bootloader Log Message spec
(Is "BLM spec" already taken? Or "Bootloader Log Message Block" aka
"BLMB"?).

If the Bootloader Log Message spec does not need to describe for each
and every bit how it is supposed to work with Grub, Linux, BSD, etc,
keeping the Bootloader Log Message inside Multiboot2 would be OK.

Otherwise, I would consider the Bootloader Log Message spec not being
its own separate spec being a bit weird.

> Daniel
> 
> [1]
> https://lists.gnu.org/archive/html/grub-devel/2019-10/msg00107.html
> [2]
> https://lists.gnu.org/archive/html/grub-devel/2019-11/msg00079.html

Uli

