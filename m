Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87F4108E0
	for <lists+xen-devel@lfdr.de>; Sun, 19 Sep 2021 00:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189974.339825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRjDg-0000d0-2d; Sat, 18 Sep 2021 22:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189974.339825; Sat, 18 Sep 2021 22:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRjDf-0000aT-VB; Sat, 18 Sep 2021 22:54:03 +0000
Received: by outflank-mailman (input) for mailman id 189974;
 Sat, 18 Sep 2021 22:54:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP9=OI=gmx.de=xypron.glpk@srs-us1.protection.inumbo.net>)
 id 1mRjDe-0000aN-VK
 for xen-devel@lists.xenproject.org; Sat, 18 Sep 2021 22:54:03 +0000
Received: from mout.gmx.net (unknown [212.227.17.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50143a0a-18d3-11ec-b7e2-12813bfff9fa;
 Sat, 18 Sep 2021 22:54:01 +0000 (UTC)
Received: from [127.0.0.1] ([89.15.236.83]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1n6ZCm3Vc4-00h86f; Sun, 19
 Sep 2021 00:53:45 +0200
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
X-Inumbo-ID: 50143a0a-18d3-11ec-b7e2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1632005625;
	bh=Pwh/KmGzeiwrqQm3C9sI0E5AfSnePPH3AAuooUuBTY4=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
	b=AfrHCn31S00A+m3IQ6CvlxYlpRX53Lkbs/Ru5BY+abRvw9V27s/cMSqh8HlJehfUN
	 JaNmhUhyb83dCO1Hnvs6OzcqXhrmMoW/TE0jmkTExd53CesKdb9Rv4BIOY/gHD+kcV
	 GvwM/PUhuEEwFp8yIzyfDrAEzDQaSohI5b2gFwzc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Date: Sun, 19 Sep 2021 00:53:35 +0200
From: Heinrich  Schuchardt <xypron.glpk@gmx.de>
To: Alec Brown <alec.r.brown@oracle.com>,
 "coreboot@coreboot.org" <coreboot@coreboot.org>,
 "grub-devel@gnu.org" <grub-devel@gnu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>,
 "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Aleksandr Burmashev <alexander.burmashev@oracle.com>,
 "allen.cryptic@gmail.com" <allen.cryptic@gmail.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "btrotter@gmail.com" <btrotter@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 Eric DeVolder <eric.devolder@oracle.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "hun@n-dimensional.de" <hun@n-dimensional.de>,
 "james.dutton@gmail.com" <james.dutton@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "jwerner@chromium.org" <jwerner@chromium.org>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
 "leif@nuviainc.com" <leif@nuviainc.com>,
 "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
 "luto@amacapital.net" <luto@amacapital.net>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
 "mjg59@google.com" <mjg59@google.com>,
 "mtottenh@akamai.com" <mtottenh@akamai.com>, "nico.h@gmx.de" <nico.h@gmx.de>,
 "phcoder@gmail.com" <phcoder@gmail.com>,
 "piotr.krol@3mdeb.com" <piotr.krol@3mdeb.com>,
 "pjones@redhat.com" <pjones@redhat.com>,
 "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 "sjg@chromium.org" <sjg@chromium.org>,
 "trini@konsulko.com" <trini@konsulko.com>,
 "tyhicks@linux.microsoft.com" <tyhicks@linux.microsoft.com>,
 "ulrich.windl@rz.uni-regensburg.de" <ulrich.windl@rz.uni-regensburg.de>,
 "wvervoorn@eltan.com" <wvervoorn@eltan.com>,
 "rharwood@redhat.com" <rharwood@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BSPECIFICATION_RFC_v3=5D_The_firmw?= =?US-ASCII?Q?are_and_bootloader_log_specification?=
User-Agent: K-9 Mail for Android
In-Reply-To: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
References: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
Message-ID: <A7F710D3-5148-4E92-9E3D-5D850AD0245F@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p+pgeoo6oBsAP4kAPcHthdyoXpZ4AZYVoI5rLrwKC/Udvo8IvyC
 9B0KDNX92DA77n0Iq/jNAwdnMSZ4ZBx9tN8lOSZfSACpGaqq5KS7YKa0+1xIPBL02PF4Xui
 yl/ffVYfKSD5IF5H/4RJMjiFO8h3Z0d73xYMJiRgqEWPf/GH4VkK9yuHTfh7ibu6tQ2g7ET
 OCUlrIKDVm9LiXYsCD48Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1uRDmIY6xbk=:xsJ4Qt3Clc/AmnfVmjW15V
 mnfp54ZfezrJamNK/0LSMX2ZRC0GVYPIUt0YTHrdS4GRGbTzOhXHfSrB3srhlBcDHi3IKjpQM
 ZYPAFeDLGtBZsH2J1o1jC+C916gcziGLaDmYW0Q7Hk3YtEhcorqg2JqfmA7NsCZJF9yyev0ks
 PaSvUW2LsEiL/nxF27y8kWIWsqqMZ3Vpnp3ZhaBU/hLrcj4dn+EKkcImtVmz7AgOj3zEjg0ia
 eYU86/Ud6AUbUFIB8l74tZ3v6MHFXRmALSAUONJPe3sGykkaY95WwDTt/b7OlRJlQVIcavw2O
 WtjdjHojv4Xfwdfe/Hmv27YwHxs5N7eYlKk/J84J/XV0QK5zZQ9BQqWhV1TP3DeZLNWTn5bnL
 XtDHpRNwYuKZB9Jdoj5o6eVT8gxPDPW2PoBzW5DGreXhHiYzvacXI1BDZy36r4xj8hu8aYPkI
 rLXraOitFx7/8Yh+BUHA/+xBbrbhO+9Pw5WjavxWAN2ojK8UcB2NE4qwAX6CK+0OoaRnqtUjG
 XYWlX3T0mbFi7nPmpPolWbItPTGbpRIeOPwxs0exR16IfxBpmYvXm0kAoYfcl+niZVQybx3Ki
 Z/Z53jxyIcTDQAxH/lHEYL32U6PNFA6gIg7x/Mhfsb3RNgOsCX/4SFsoB7p5hM8kqdLNu2JHn
 inYsrnfpNFprGhfYFsP54/gJayFFV7CYeSCaDi09oo07JWt0jYlcBHq4ZAPPuflAOI0HeXQLo
 r1jpX/YtxWHzW4CyqPSpXMn1PNrLJ+Cl5PU1OjlJ2KD5lzwdqWfEt+Q2+r+xzfpTKz/hBiY7T
 OT0c3DfNf/DWBEv/zOH0RheBwlIselptrIybSc03c3jThRGibdINSSAaH/vHpGfnxwPYp4K/6
 UcvOx8GGN9kzQOjHg3Xn33SQOtCRsm/QXTNZ7PsOZarnUlvsh6rVJt6JzTQmdPUyBQKWJU4NS
 +dplF3ZPX88ILFf/pIcWPxtDXTauS2TDHUwtYYd72EENou8XI+/7lmGl8AU9qF1uDhBZ7t5qQ
 t2KOCJ0Jc5RZtWhDHljvtWR6wtzvOaD8EvowmWgikvTIrkA7h2POZtZZuKt1b81/ZkDoodZMR
 YDx8rKGb1NOqA0=



Am 18=2E September 2021 18:04:13 MESZ schrieb Alec Brown <alec=2Er=2Ebrown=
@oracle=2Ecom>:
>Hi everyone,
>
>I've been working on improving the specification for the firmware and boo=
tloader
>log that Daniel Kiper has proposed and take into account most of the sugg=
estions
>that were made in these threads [1], [2]=2E
>
>The goal is to allow various boot components to pass logs to the running =
OS and
>then to the user space for processing and analysis=2E These logs should b=
e generic
>enough so that it can work in multiple environments and be human readable=
=2E

Hello Alec,

in your mail it remains unclear which information you want to put into the=
 log and why it is needed=2E I would prefer the motivation and content to b=
e clarified before defining any interface structures=2E

We already the EFI_TCG2_PROTOCOL and RFC 5424 (The syslog protocol)=2E Why=
 do we need to start from scratch?

Best regards

Heinrich=20

>
>It has yet to be decided where to put the final version of this specifica=
tion=2E
>It should be merged into an existing specification, e=2Eg=2E UEFI, ACPI, =
Multiboot2,
>or be standalone, such as a part of OASIS Standards=2E
>
>Below is how the layout of these logs would store their data=2E
>
>bf_log_header:
>               +-------------------+
>u32            | version           |
>u32            | size              |
>u8[64]         | producer          |
>u8[64]         | log_format        |
>u64            | flags             |
>u64            | next_bflh_addr    |
>u64            | log_addr          |
>u32            | log_size          |
>               +-------------------+
>
>bf_log_buffer:
>               +-------------------+
>u32            | version           |
>u32            | size              |
>u8[64]         | producer          |
>u32            | next_msg_off      |
>bf_log_msg[l]  | msgs              |
>               +-------------------+
>
>bf_log_msg:
>               +-------------------+
>u32            | size              |
>u64            | ts_nsec           |
>u32            | level             |
>u32            | facility          |
>u32            | msg_off           |
>u8[n]          | type              |
>u8[m]          | msg               |
>               +-------------------+
>
>Where l is the number of msgs, n is the size of type, and m is the size o=
f the
>msg=2E
>
>The bf_log_header structure forms a linked list=2E Each bf_log_header ele=
ment in
>the linked list points to the individual log buffer and the next bf_log_h=
eader
>element in the linked list=2E The first element in the linked list points=
 to the
>last boot component in the boot chain=2E The last element points to the s=
tarting
>boot component in the boot chain=2E The log buffers which contain the log
>messages are produced by the various boot components, typically from the
>firmware to the bootloader=2E The log message is stored in a log format t=
hat is
>compatible with the boot component that produced it=2E
>
>The fields in bf_log_header structure:
>  - version: the firmware and bootloader log header version number, 1 for=
 now,
>  - size: the size of the bf_log_header to allow for backward compatibili=
ty if=20
>    other fields are added,
>  - producer: the producer/firmware/bootloader/=2E=2E=2E entity, NUL term=
inated
>    string, e=2Eg=2E GRUB, Coreboot; the length allows for ASCII UUID sto=
rage,
>  - log_format: the format used to record the log messages, NUL terminate=
d
>    string, e=2Eg=2E bf_log_msg, cbmem_cons, etc=2E; various producers ma=
y generate
>    logs in various formats if needed,
>  - flags: bit field used to store information about the log state, if bi=
t 0 has
>    been set it means the log was truncated,
>  - next_bflh_addr: the physical address of the next bf_log_header struct=
ure,
>    none if zero,
>  - log_addr: the physical address of where the log buffer is stored,
>  - log_size: the total size of the log buffer=2E
>
>The bf_log_buffer is used to store log messages from the firmware and
>bootloader=2E This format for storing messages is called the bf log forma=
t=2E The
>bf_log_buffer contains the header information of the bf log format with t=
he log
>messages being stored in an array of bf_log_msg messages=2E
>
>The fields in bf_log_buffer structure:
>  - version: the firmware and bootloader log version number, 1 for now,
>  - size: the total allocated space for the bf_log_buffer including the l=
og
>    messages stored in msgs,
>  - producer: the producer/firmware/bootloader/=2E=2E=2E entity, NUL term=
inated
>    string, e=2Eg=2E GRUB, Coreboot; the length allows for ASCII UUID sto=
rage; same
>    as the field in bf_log_header,
>  - next_msg_off: the byte offset from the beginning of the allocated spa=
ce for
>    bf_log_buffer to the next byte after the last bf_log_msg in msgs,
>  - msgs: the array of log messages stored in the bf_log_msg structures=
=2E
>
>The fields in bf_log_msg structure:
>  - size: the total size of the bf_log_msg entry,
>  - ts_nsec: the timestamp in nanoseconds starting from 0 (zero); the pro=
ducer
>    using this log format defines the meaning of 0,
>  - level: similar to the syslog meaning; used to differentiate normal lo=
g
>    messages from debug log messages, but the exact interpretation depend=
s on
>    the producer,
>  - facility: similar to the syslog meaning; used to differentiate the so=
urces
>    of the log messages, but the exact interpretation depends on the prod=
ucer,
>  - msg_off: the byte offset which the msg field starts in bf_log_msg,
>  - type: the log message type; similar to facility but NUL terminated st=
ring
>    instead of integer, but the exact interpretation depends on the produ=
cer,
>  - msg: the log message, NUL terminated string=2E
>
>In bf_log_msg, the producers are free to use or ignore any of the level,
>facility, and type fields=2E If level or facility are ignored, they shoul=
d be set
>to 0=2E If type is ignored, it should be set to an empty NUL terminated s=
tring=2E
>
>Since it doesn't seem possible to have each boot component using the same=
 log
>format, we added a log_format and log_phys_addr fields to give flexibilit=
y in
>how logs are stored=2E An example of a different log format that can be u=
sed is
>the cbmem_console log format used by coreboot:
>
>cbmem_console:
>               +-------------------+
>u32            | size              |
>u32            | cursor            |
>u8[m]          | body              |
>               +-------------------+
>
>There is still the outstanding issue of how the logs will be sent to the =
OS=2E If
>UEFI is used, we can use config tables=2E If ACPI or Device Tree is used,=
 we can
>use bf_log_header=2Enext_bflh_addr to present the logs=2E If none of thes=
e platforms
>are used, it becomes a lot trickier to solve this issue=2E
>
>Any suggestions are much appreciated and will be taken into consideration=
=2E
>
>I will be presenting this work at the LPC System Boot and Security
>Micro-conference on the 22nd of September at 7:50 AM PDT (14:50 UTC)=2E C=
ome and
>join if you want to discuss the design=2E The schedule for the System Boo=
t and
>Security Micro-conference can be found here [3]=2E
>
>Thanks!
>Alec Brown
>
>[1] https://lists=2Egnu=2Eorg/archive/html/grub-devel/2020-11/msg00100=2E=
html
>[2] https://lists=2Egnu=2Eorg/archive/html/grub-devel/2020-12/msg00021=2E=
html
>[3] https://linuxplumbersconf=2Eorg/event/11/sessions/116/#20210922

