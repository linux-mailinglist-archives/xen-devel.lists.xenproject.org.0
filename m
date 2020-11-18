Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6702B8001
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29965.59664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOxy-0008TZ-HW; Wed, 18 Nov 2020 15:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29965.59664; Wed, 18 Nov 2020 15:01:50 +0000
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
	id 1kfOxy-0008T7-Db; Wed, 18 Nov 2020 15:01:50 +0000
Received: by outflank-mailman (input) for mailman id 29965;
 Wed, 18 Nov 2020 15:01:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0zvd=EY=gmx.de=xypron.glpk@srs-us1.protection.inumbo.net>)
 id 1kfOxw-0008Sy-LQ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:01:48 +0000
Received: from mout.gmx.net (unknown [212.227.17.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a591a40c-982b-4e53-9a86-d9e6f00579b5;
 Wed, 18 Nov 2020 15:01:46 +0000 (UTC)
Received: from [192.168.123.70] ([178.202.41.135]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1kQlWL2f0s-00th5v; Wed, 18
 Nov 2020 16:01:31 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0zvd=EY=gmx.de=xypron.glpk@srs-us1.protection.inumbo.net>)
	id 1kfOxw-0008Sy-LQ
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:01:48 +0000
X-Inumbo-ID: a591a40c-982b-4e53-9a86-d9e6f00579b5
Received: from mout.gmx.net (unknown [212.227.17.22])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a591a40c-982b-4e53-9a86-d9e6f00579b5;
	Wed, 18 Nov 2020 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1605711691;
	bh=6sI8GRG+r2bpQj9f4Kf4zQEmoAbekTyDXxqajSWPs3g=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Mo/sNygYxu2Hr14nQWcibBm74o9glLqc2efB2Z1YkhL4c2oNEKaZP4DRsopReAoe2
	 oIyars/FVw7qIB47QKnboUU/IZ2KfYnWtD0WsQboIPeJtoPTp3Le1iLGPQ0XzhY0on
	 oK+4ZW9QvZmTa0N7jj51MHctKorI/TORG3AvrGiM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.70] ([178.202.41.135]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1kQlWL2f0s-00th5v; Wed, 18
 Nov 2020 16:01:31 +0100
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Daniel Kiper <daniel.kiper@oracle.com>, coreboot@coreboot.org,
 grub-devel@gnu.org, linux-kernel@vger.kernel.org,
 systemd-devel@lists.freedesktop.org, trenchboot-devel@googlegroups.com,
 u-boot@lists.denx.de, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: alecb@umass.edu, alexander.burmashev@oracle.com, allen.cryptic@gmail.com,
 andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org, btrotter@gmail.com,
 dpsmith@apertussolutions.com, eric.devolder@oracle.com,
 eric.snowberg@oracle.com, hpa@zytor.com, hun@n-dimensional.de,
 javierm@redhat.com, joao.m.martins@oracle.com, kanth.ghatraju@oracle.com,
 konrad.wilk@oracle.com, krystian.hebel@3mdeb.com, leif@nuviainc.com,
 lukasz.hawrylko@intel.com, luto@amacapital.net, michal.zygowski@3mdeb.com,
 mjg59@google.com, mtottenh@akamai.com, phcoder@gmail.com,
 piotr.krol@3mdeb.com, pjones@redhat.com, pmenzel@molgen.mpg.de,
 roger.pau@citrix.com, ross.philipson@oracle.com, tyhicks@linux.microsoft.com
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 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 Eg==
Message-ID: <ef50dac9-3ded-6836-28b1-7addb0bab986@gmx.de>
Date: Wed, 18 Nov 2020 16:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dPo4qeALMWM4Pgg4L2ctr733oiVff5JOAL9lOgM/oSdpk4wx0E3
 yNsWsHvPTTdjw1QELEaleKh0n+Nl34WRqUofql5zXFY/kh8SgoCniRoQmgshoM5iJb9SVlq
 O7WZ9kGWBMa3ZuS3/7qZwqnlz8323FE8R0pziCYJy1yH5HltqPXcC6ve9I2UO1IDGgI7kMr
 WqEjlwIWmK9iqYVJlxBEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:77Ci9R1aR/8=:qDp85K6AmJsxF/xbd/w99c
 mgfz5372Cc85Kxks48slOw+XrqMuQvQ8jUPOwd65S0rMiRrF43mktV6o948Feaq1FQB2xFtWg
 2lmdfNASHgrdQWEL8AKVzRVNqmoBNvFfTC/CwwhuI31W+1iq0YUKRcnY1CzuR8LmBWupPtzX4
 6O/S/p4SCMt9750qEMrX09eMZc9A09i6oXKWmnpBRdYwIFNlM5Z8WeETwfjED6+Dh3oP5+AsG
 vUhm2sGxwhGd5XOdCNCnsNn8JSd5qzU79mK/pSSRbSryn3RU15eIaTq+yWckcuupq8JnJV+Ov
 d7Lpp7HgvWiRw4Xnvt/XKPDyx2oNJj9d58EkNFRVlfWeQXALugRLnkXKZZMfD3S30dzr9Exy5
 g0IjBCbVHc/quAVgsWLyIf3Tv9AB1nH3sf4Wz6FpzGAtVF18ZV/vyTjXVH6hKptZYnCfm/F8U
 1vTr6e54b98FatVU6F1PNrFAFibe3THnuhS5lxGgUccSZ1+MAlW86OeM2LiTQTJvrWo46/gZO
 yPRlevJ24yf+0/4tSo59LBkrzy8QH3PvuiCShXmzsl2R8yHYEXlxJ46IIU8CprSNKkNkLGbYE
 E3zLOBd31I0dJIBNefMdjL/h6Ep9cS5C0BmJVEO8Ill1YAukUly+JJ/FFhfjBZJXlStBmqfTf
 l3XiHB7dA2K/bQmaGLpcTliYNxMyHwvwuiFaN2PL1Fw297bnaFYE9qHJdTGsXeVfw9NXr2zZZ
 Dtd57buNjTR7oyl3Y69sc2/+Py3EenbFiyj285YTs2wv24cWQDfQ4NfslAMK12cO/RfrPW3Q6
 hHD1jRYP0Ourg5GLiWod83l6GC4LMs+mpU+0RSec8e9QuA99CzsOsyztsBzsjN6tenEi+ZBPJ
 1l9wnu9SMuPdGjbnDztQ==

On 14.11.20 00:52, Daniel Kiper wrote:
> Hey,
>
> This is next attempt to create firmware and bootloader log specification=
.
> Due to high interest among industry it is an extension to the initial
> bootloader log only specification. It takes into the account most of the
> comments which I got up until now.
>
> The goal is to pass all logs produced by various boot components to the
> running OS. The OS kernel should expose these logs to the user space
> and/or process them internally if needed. The content of these logs
> should be human readable. However, they should also contain the
> information which allows admins to do e.g. boot time analysis.
>
> The log specification should be as much as possible platform agnostic
> and self contained. The final version of this spec should be merged into
> existing specifications, e.g. UEFI, ACPI, Multiboot2, or be a standalone
> spec, e.g. as a part of OASIS Standards. The former seems better but is
> not perfect too...
>
> Here is the description (pseudocode) of the structures which will be
> used to store the log data.

Hello Daniel,

thanks for your suggestion which makes good sense to me.

Why can't we simply use the message format defined in "The Syslog
Protocol", https://tools.ietf.org/html/rfc5424?

>
>   struct bf_log
>   {
>     uint32_t   version;
>     char       producer[64];
>     uint64_t   flags;
>     uint64_t   next_bf_log_addr;
>     uint32_t   next_msg_off;
>     bf_log_msg msgs[];

As bf_log_msg is does not have defined length msgs[] cannot be an array.

>   }
>
>   struct bf_log_msg
>   {
>     uint32_t size;
>     uint64_t ts_nsec;
>     uint32_t level;
>     uint32_t facility;
>     uint32_t msg_off;
>     char     strings[];
>   }
>
> The members of struct bf_log:
>   - version: the firmware and bootloader log format version number, 1 fo=
r now,
>   - producer: the producer/firmware/bootloader/... type; the length
>     allows ASCII UUID storage if somebody needs that functionality,
>   - flags: it can be used to store information about log state, e.g.
>     it was truncated or not (does it make sense to have an information
>     about the number of lost messages?),
>   - next_bf_log_addr: address of next bf_log struct; none if zero (I thi=
nk
>     newer spec versions should not change anything in first 5 bf_log mem=
bers;
>     this way older log parsers will be able to traverse/copy all logs re=
gardless
>     of version used in one log or another),
>   - next_msg_off: the offset, in bytes, from the beginning of the bf_log=
 struct,
>     of the next byte after the last log message in the msgs[]; i.e. the =
offset
>     of the next available log message slot; it is equal to the total siz=
e of
>     the log buffer including the bf_log struct,

Why would you need an offset to first unused byte?

We possibly have multiple producers of messages:

- TF-A
- U-Boot
- iPXE
- GRUB

What we need is the offset to the next struct bf_log.

>   - msgs: the array of log messages,
>   - should we add CRC or hash or signatures here?
>
> The members of struct bf_log_msg:
>   - size: total size of bf_log_msg struct,
>   - ts_nsec: timestamp expressed in nanoseconds starting from 0,

Would each message producer start from 0?

Shouldn't we use the time from the hardware RTC if it is available via
boot service GetTime()?

>   - level: similar to syslog meaning; can be used to differentiate norma=
l messages
>     from debug messages; the exact interpretation depends on the current=
 producer
>     type specified in the bf_log.producer,
>   - facility: similar to syslog meaning; can be used to differentiate th=
e sources of
>     the messages, e.g. message produced by networking module; the exact =
interpretation
>     depends on the current producer type specified in the bf_log.produce=
r,
>   - msg_off: the log message offset in strings[],

What is this field good for? Why don't you start the the string at
strings[0]?
What would be useful would be the offset to the next bf_log_msg.

>   - strings[0]: the beginning of log message type, similar to the facili=
ty member but
>     NUL terminated string instead of integer; this will be used by, e.g.=
, the GRUB2
>     for messages printed using grub_dprintf(),
>   - strings[msg_off]: the beginning of log message, NUL terminated strin=
g.


Why strings in plural? Do you want to put multiple strings into
'strings'? What identifies the last string?


>
> Note: The producers are free to use/ignore any given set of level, facil=
ity and/or
>       log type members. Though the usage of these members has to be clea=
rly defined.
>       Ignored integer members should be set to 0. Ignored log message ty=
pe should
>       contain an empty NUL terminated string. The log message is mandato=
ry but can
>       be an empty NUL terminated string.
>
> There is still not fully solved problem how the logs should be presented=
 to the OS.
> On the UEFI platforms we can use config tables to do that. Then probably
> bf_log.next_bf_log_addr should not be used.

Why? How would you otherwise find the entries of the next produser in
the configuration table? What I am missing is a GUID for the
configuration table.

> On the ACPI and Device Tree platforms
> we can use these mechanisms to present the logs to the OSes. The situati=
on gets more

I do not understand this.

UEFI implementations use either of ACPI and device-trees and support
configuration tables. Why do you want to use some other binding?

Best regards

Heinrich

> difficult if neither of these mechanisms are present. However, maybe we =
should not
> bother too much about that because probably these platforms getting less=
 and less
> common.
>
> Anyway, I am aware that this is not specification per se. The goal of th=
is email is
> to continue the discussion about the idea of the firmware and booloader =
log and to
> find out where the final specification should land. Of course taking int=
o the account
> assumptions made above.
>
> You can find previous discussions about related topics at [1], [2] and [=
3].
>
> Additionally, I am going to present this during GRUB mini-summit session=
 on Tuesday,
> 17th of November at 15:45 UTC. So, if you want to discuss the log design=
 please join
> us. You can find more details here [4].
>
> Daniel
>
> [1] https://lists.gnu.org/archive/html/grub-devel/2019-10/msg00107.html
> [2] https://lists.gnu.org/archive/html/grub-devel/2019-11/msg00079.html
> [3] https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00223.html
> [4] https://twitter.com/3mdeb_com/status/1327278804100931587
>


