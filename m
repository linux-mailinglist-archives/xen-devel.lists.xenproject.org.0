Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25198AB1CC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709152.1108436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqAy-0002N0-OJ; Fri, 19 Apr 2024 15:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709152.1108436; Fri, 19 Apr 2024 15:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqAy-0002Jo-LH; Fri, 19 Apr 2024 15:29:20 +0000
Received: by outflank-mailman (input) for mailman id 709152;
 Fri, 19 Apr 2024 15:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxqAx-0002Ji-8y
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:29:19 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9543032f-fe61-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 17:29:17 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-23333ef4a02so1303924fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:29:17 -0700 (PDT)
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
X-Inumbo-ID: 9543032f-fe61-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713540556; x=1714145356; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8CADajUXjgywsd6w/7YkFv869kBJfm+FkrIyPrpFC4=;
        b=MYLflberSNnwKlTA3tutIX/7zFg9pbX1o5rS2fOZi1b/VpdwYYeDUQXmxhjArh4ucw
         woDytehJpx9KK1/rToH3UEs7KvKu+zsEtzIDQR72B5LSUoRiIADdAdzKytfRngwl3+v0
         enLaDH2zoW8602rUpaE9F+R8MI1Z+yCzkruDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540556; x=1714145356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8CADajUXjgywsd6w/7YkFv869kBJfm+FkrIyPrpFC4=;
        b=d81bDBGaukTtRtp83+dwba6g/PJaHAVEBVUUCOYO2b7PHDHsM4RxDWKvOZJEgwpz6U
         7BZkxPy1nq5NYwhq8IHD+JRJZyqgi2dYzhqpIT5OyBYND48Byv70wkXf2bTlT+IcG5ML
         KHQwBRYG22cNGa/Ylt9zV1I9LVXU8Ce3d+SFdQhIO6rUjn9V+fvNM2qyxGh1tcFgwNLB
         asoE5VT0nWNZ6bw2l5yFdh8UvCdwW1tvmU1PK6QToyl7CuOcQeBv70TVImfhCqaOfX92
         yVyau9Jx9uSwXvjv9nR1cCDDcaYoj1Ky7PdG5yrsnm7PXYiyghxADap4hE5mIFFrrZyM
         p/2g==
X-Forwarded-Encrypted: i=1; AJvYcCVA8KndCPI8ONux+0JV8U2pESNsiGidhcjyEjZypNnMBrCp//pTeIBXSSzyCKagSG4mo+AcDT0B4SzHaEUx3HSzo5j49VL6TslOkgn+ZIs=
X-Gm-Message-State: AOJu0YzLjhdJVbH9uyqPjUB7B7NbFEmKYanfeKMPEU/1oRVBqa5/N2H2
	UlaYkZ7/kzMSQD5MBEHzNrcdkIHjbQkjhvsh3zdv9ObgTswNRYA0GRbvFFwsf9Mj+v93Newh0BJ
	opzuJ93x1v0yrDJjwEbh0g4gJtSRaZWxKCwUwoQ==
X-Google-Smtp-Source: AGHT+IFPGQni5H99tCq9Lmi/Lr2fqmpyHjbvMCUthFYYBjwZI9Ydwc2N/c8B0FCtZItsdrMLgUfl5vohAu1oNxWxHrg=
X-Received: by 2002:a05:6871:d287:b0:22e:a70f:158 with SMTP id
 pl7-20020a056871d28700b0022ea70f0158mr2394277oac.7.1713540555936; Fri, 19 Apr
 2024 08:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
 <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com> <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
 <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com>
In-Reply-To: <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 19 Apr 2024 16:29:05 +0100
Message-ID: <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com>
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2023 at 3:56=E2=80=AFPM George Dunlap <george.dunlap@cloud.c=
om> wrote:
>> >>> Xen's public interface offers access to the featuresets known / foun=
d /
>> >>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessibl=
e
>> >>> via xc_get_cpu_featureset().
>> >>>
>> >>
>> >> Are any of these exposed in dom0 via sysctl, or hypfs?
>> >
>> > sysctl - yes (as the quoted name also says). hypfs no, afaict.
>> >
>> >>  SYSCTLs are
>> >> unfortunately not stable interfaces, correct?  So it wouldn't be prac=
tical
>> >> for systemd to use them.
>> >
>> > Indeed, neither sysctl-s nor the libxc interfaces are stable.
>>
>> Thinking of it, xen-cpuid is a wrapper tool around those. They may want
>> to look at its output (and, if they want to use it, advise distros to
>> also package it), which I think we try to keep reasonably stable,
>> albeit without providing any guarantees.
>
>
> We haven't had any clear guidance yet on what the systemd team want in th=
e <xen in a VM, systemd in a dom0> question; I just sort of assumed they wa=
nted the L-1 virtualization *if possible*.  It sounds like `vm-other` would=
 be acceptable, particularly as a fall-back output if there's no way to get=
 Xen's picture of the cpuid.
>
> It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the o=
ld Virt SIG CentOS packages; so I'd expect most packages to follow suit.  T=
hat's a place to start.
>
> Just to take the discussion all the way to its conclusion:
>
> - Supposing xen-cpuid isn't available, is there any other way to tell if =
Xen is running in a VM from dom0?
>
> - Would it make sense to expose that information somewhere, either in sys=
fs or in hypfs (or both?), so that eventually even systems which may not ge=
t the memo about packaging xen-cpuid will get support (or if the systemd gu=
ys would rather avoid executing another process if possible)?

Resurrecting this thread.

To recap:

Currently, `systemd-detect-virt` has the following  input / output table:

1. Xen on real hardware, domU: xen
2. Xen on real hardware, dom0: vm-other
3. Xen in a VM, domU: xen
4. Xen in aVM, dom0: vm-other

It's the dom0 lines (2 and 4) which are problematic; we'd ideally like
those to be `none` and `vm-other` (or the actual value, like `xen` or
`kvm`).

It looks like ATM, /proc/xen/capabilities will contain `control_d` if
it's a dom0.  Simply unilaterally returning `none` if
/proc/xen/capabilities contains `control_d` would correct the vast
majority of instances (since the number of instances of Xen on real
hardware is presumably higher than the number running virtualized).

Is /proc/xen/capabilities expected to stay around?  I don't see
anything equivalent in /dev/xen.

Other than adding a new interface to Xen, is there any way to tell if
Xen is running in a VM?  If we do need to expose an interface, what
would be the best way to do that?

 -George

