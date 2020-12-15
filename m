Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25F2DB534
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 21:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54833.95416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpH29-000095-Ip; Tue, 15 Dec 2020 20:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54833.95416; Tue, 15 Dec 2020 20:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpH29-00008g-Fb; Tue, 15 Dec 2020 20:34:57 +0000
Received: by outflank-mailman (input) for mailman id 54833;
 Tue, 15 Dec 2020 20:25:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xjw9=FT=google.com=sjg@srs-us1.protection.inumbo.net>)
 id 1kpGsy-0007fk-Jz
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 20:25:28 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4ca9329-08aa-42d1-abe6-0ece8b4e08f0;
 Tue, 15 Dec 2020 20:25:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id x22so424021wmc.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 12:25:27 -0800 (PST)
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
X-Inumbo-ID: e4ca9329-08aa-42d1-abe6-0ece8b4e08f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKgedKEtb5mnSfvh4xlmj/r1V3a4kPz3KEPIfj5KHQI=;
        b=dvYbP6TUERJsKbDFxZbdxZzIE8DNpnd6A06uozqtUq7LhX4cXVtUbBAiVtR79WfZ5w
         0HvIER4UPQWC9gGqh56/kIFXpyY4oXuDM8SZcmvrbgTwLhkE+AAsyAlfBreoUJwuBYam
         nKo6Tqps+C58xcXy69jk4lsy9StBWGLoNOOgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKgedKEtb5mnSfvh4xlmj/r1V3a4kPz3KEPIfj5KHQI=;
        b=eSSVQDR0BgfE8q5YCHLzgjoyC5UDHhmhE664HwTUz6sDWkXmdoU854PlyMqMkdAcTE
         XeBowTXwHzwjVQ/yrSPjPM+E2IpJSr7rywWXaBWd8onFNYk6QEn2qXKWFpqV2cvs5Nso
         ZniuhRwIRmdg0poCPRDHGjWs+ANbEbLbYkNcWyEoP/Sm2s7zlWaQ3oo8EaAqcKPrb+rS
         dDpw7kq82IjtHtXppWJfKqRaz34+FBzZFDi9dUxxXQ13OhJ4QcHC7aLxOJ/C2fZ0yP5Z
         7+gP7ExUzvIjQOl/lIFExswdFQiVPfZWnPXWw3zJHR/8GeNUqHok8YQKYw/4UWGovGGH
         iNnA==
X-Gm-Message-State: AOAM530p07Sx6VsErKyWsfFIjqb4whlijIi1hDRtkpT0hI6YfluLAQWS
	llHiW3ix8DeM4OzHYeJiE8seZW0rhOx7zzA8nBFRCg==
X-Google-Smtp-Source: ABdhPJxLA99SR44IbyCAzhlr5dVrSinm0a/tZD0GiKoMvdNv7FPsSRxYrHstKKbx77iIrtQuc2sgy0E5I1H64h3mosg=
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr552217wmg.168.1608063925901;
 Tue, 15 Dec 2020 12:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
In-Reply-To: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 15 Dec 2020 13:25:14 -0700
Message-ID: <CAPnjgZ3zCuLd7G-bOFp38OoyboAbHG21L_5oogN_7tLmba-ShQ@mail.gmail.com>
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Coreboot <coreboot@coreboot.org>, grub-devel@gnu.org, 
	lk <linux-kernel@vger.kernel.org>, systemd-devel@lists.freedesktop.org, 
	trenchboot-devel@googlegroups.com, U-Boot Mailing List <u-boot@lists.denx.de>, x86@kernel.org, 
	xen-devel@lists.xenproject.org, alecb@umass.edu, 
	alexander.burmashev@oracle.com, allen.cryptic@gmail.com, 
	andrew.cooper3@citrix.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, btrotter@gmail.com, 
	dpsmith@apertussolutions.com, eric.devolder@oracle.com, 
	eric.snowberg@oracle.com, "H. Peter Anvin" <hpa@zytor.com>, hun@n-dimensional.de, 
	javierm@redhat.com, joao.m.martins@oracle.com, kanth.ghatraju@oracle.com, 
	konrad.wilk@oracle.com, krystian.hebel@3mdeb.com, 
	Leif Lindholm <leif@nuviainc.com>, lukasz.hawrylko@intel.com, luto@amacapital.net, 
	michal.zygowski@3mdeb.com, mjg59@google.com, mtottenh@akamai.com, 
	=?UTF-8?Q?Vladimir_=27=CF=86=2Dcoder=2Fphcoder=27_Serbinenko?= <phcoder@gmail.com>, 
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Peter Jones <pjones@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>, roger.pau@citrix.com, 
	ross.philipson@oracle.com, tyhicks@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 13 Nov 2020 at 19:07, Daniel Kiper <daniel.kiper@oracle.com> wrote:
>
> Hey,
>
> This is next attempt to create firmware and bootloader log specification.
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
>
>   struct bf_log
>   {
>     uint32_t   version;
>     char       producer[64];
>     uint64_t   flags;
>     uint64_t   next_bf_log_addr;
>     uint32_t   next_msg_off;
>     bf_log_msg msgs[];
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
>   - version: the firmware and bootloader log format version number, 1 for now,
>   - producer: the producer/firmware/bootloader/... type; the length
>     allows ASCII UUID storage if somebody needs that functionality,
>   - flags: it can be used to store information about log state, e.g.
>     it was truncated or not (does it make sense to have an information
>     about the number of lost messages?),
>   - next_bf_log_addr: address of next bf_log struct; none if zero (I think
>     newer spec versions should not change anything in first 5 bf_log members;
>     this way older log parsers will be able to traverse/copy all logs regardless
>     of version used in one log or another),
>   - next_msg_off: the offset, in bytes, from the beginning of the bf_log struct,
>     of the next byte after the last log message in the msgs[]; i.e. the offset
>     of the next available log message slot; it is equal to the total size of
>     the log buffer including the bf_log struct,
>   - msgs: the array of log messages,
>   - should we add CRC or hash or signatures here?
>
> The members of struct bf_log_msg:
>   - size: total size of bf_log_msg struct,
>   - ts_nsec: timestamp expressed in nanoseconds starting from 0,
>   - level: similar to syslog meaning; can be used to differentiate normal messages
>     from debug messages; the exact interpretation depends on the current producer
>     type specified in the bf_log.producer,
>   - facility: similar to syslog meaning; can be used to differentiate the sources of
>     the messages, e.g. message produced by networking module; the exact interpretation
>     depends on the current producer type specified in the bf_log.producer,
>   - msg_off: the log message offset in strings[],
>   - strings[0]: the beginning of log message type, similar to the facility member but
>     NUL terminated string instead of integer; this will be used by, e.g., the GRUB2
>     for messages printed using grub_dprintf(),
>   - strings[msg_off]: the beginning of log message, NUL terminated string.
>
> Note: The producers are free to use/ignore any given set of level, facility and/or
>       log type members. Though the usage of these members has to be clearly defined.
>       Ignored integer members should be set to 0. Ignored log message type should
>       contain an empty NUL terminated string. The log message is mandatory but can
>       be an empty NUL terminated string.
>
> There is still not fully solved problem how the logs should be presented to the OS.
> On the UEFI platforms we can use config tables to do that. Then probably
> bf_log.next_bf_log_addr should not be used. On the ACPI and Device Tree platforms
> we can use these mechanisms to present the logs to the OSes. The situation gets more
> difficult if neither of these mechanisms are present. However, maybe we should not
> bother too much about that because probably these platforms getting less and less
> common.
>
> Anyway, I am aware that this is not specification per se. The goal of this email is
> to continue the discussion about the idea of the firmware and booloader log and to
> find out where the final specification should land. Of course taking into the account
> assumptions made above.
>
> You can find previous discussions about related topics at [1], [2] and [3].
>
> Additionally, I am going to present this during GRUB mini-summit session on Tuesday,
> 17th of November at 15:45 UTC. So, if you want to discuss the log design please join
> us. You can find more details here [4].

I hesitate to add my opinions here since it is probably more important
to settle on something than get everyone happy.

It would be nice if the format were extensible in a simple way. As
others have mentioned, we may want to provide logs from various
different sources (EC, AP firmware through various
read-only/read-write paths, trusted firmware). Each of these is
presumably its own separate log, but with a coherent timestamp. I
think the log level and 'facility' (category) that you have are
important features, because they help to provide hierarchy and
attribution to the messages, allowing filtering out debugging, etc.

It could be more compact - e.g. a byte is enough for the level, use \0
instead of size, add a flags bytes to allow things to be optional. Is
ns necessary it would it be good enough and we could use 32-bit and
have an hour before wrapping.

Thinking about U-Boot TPL, where every byte counts, we would likely
store it in a different format and expand it later, but it would be
better if the format were efficient enough that it did not matter. A
flag byte indicating what fields are present? Overall, is it important
to have a simple struct for this, or is something more compact
possible?

IMO timestamp 0 should be the time the SoC comes out of reset, so far
as it can be known / estimated.

Also if we can repurpose something existing that is extensible, that
would be nice. I'm not arguing for legacy, just for retiring old
things.

Regards,
Simon

>
> Daniel
>
> [1] https://lists.gnu.org/archive/html/grub-devel/2019-10/msg00107.html
> [2] https://lists.gnu.org/archive/html/grub-devel/2019-11/msg00079.html
> [3] https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00223.html
> [4] https://twitter.com/3mdeb_com/status/1327278804100931587

