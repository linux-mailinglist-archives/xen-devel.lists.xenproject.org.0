Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2EA7C679B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 10:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615740.957140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqr87-0006JC-Pf; Thu, 12 Oct 2023 08:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615740.957140; Thu, 12 Oct 2023 08:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqr87-0006I5-MM; Thu, 12 Oct 2023 08:33:15 +0000
Received: by outflank-mailman (input) for mailman id 615740;
 Thu, 12 Oct 2023 08:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HOn7=F2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqr86-0006Hy-4I
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 08:33:14 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fadd555e-68d9-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 10:33:12 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so8847531fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 01:33:12 -0700 (PDT)
Received: from [10.157.20.243] ([103.14.252.248])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a1a5200b00279163e52bbsm1419935pjl.17.2023.10.12.01.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 01:33:11 -0700 (PDT)
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
X-Inumbo-ID: fadd555e-68d9-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697099591; x=1697704391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YQGXDiZOa4oZhnz1F/ZArXjooqt3M/3wb7GHD0KXc8o=;
        b=JWP7Fm5jEhcytDXTjuyrkXKq6jO0rto/yO1db7peYE8jSoS2RhO8GsYk/4sF6cEexk
         jrVS8jPdHn1mfi1UFWnI4MO3qxGCZFsey2wOm9B4MRFip9es0//KBw6cmbSQ/F91KR1e
         iZinWLAgpEUpa7xyR/xwXaJ/LB9dhcLrfsvZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697099591; x=1697704391;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQGXDiZOa4oZhnz1F/ZArXjooqt3M/3wb7GHD0KXc8o=;
        b=imh4JIAHe2cfvKNv5uE0aTflMjPe3xZxfCYHJ9JWgQXYSGB6b4rFaj8Ew6cPt0d3JZ
         uIu3ayyYjxO2mDjN2Fa2Mf9q2p662dTMgtkghpeMdNEc7hv89YfaF6gvpY/9c5URmqBi
         Hvb5QU/eCYfK8yhriigZ8IwkVk1sq2Zl6giTGClc+ffirXWfmcX3TSGr7pjZui8UtMRr
         3lgptJK0orKwG/igRgloUmiHJk4DXYTQ+42MjZxTDbePSCUY4Ly91wzgI0A5a53O0Uee
         Zfc4Oez+fWSJO71IQDrbdHPjPgVgbZ/8JD0/dD8VIRzZiK4571rO/m7zoBcJeE6t27Bi
         vALA==
X-Gm-Message-State: AOJu0YyDPZbcVQ6rCQ6FmPAbe+2QDnC6oUFqWsQaSAQ4utEMmmyVzx7Z
	L+Neg2ukkk605nlwkX5m1r+kkA==
X-Google-Smtp-Source: AGHT+IEPui0MMARyJjFbYHA3+HPIPqJAQIOCMHyAjyDbCwMJNfryepHbOaGogiaw1UY7Md9BKNAGzA==
X-Received: by 2002:a2e:998a:0:b0:2bc:b75e:b8b with SMTP id w10-20020a2e998a000000b002bcb75e0b8bmr20273047lji.38.1697099591585;
        Thu, 12 Oct 2023 01:33:11 -0700 (PDT)
Message-ID: <a055111e-c04e-4975-9fdc-81d6e74f1c74@citrix.com>
Date: Thu, 12 Oct 2023 16:33:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/sm{e, a}p: do not enable SMEP/SMAP in PV
 shim by default on AMD
Content-Language: en-GB
To: David Woodhouse <dwmw2@infradead.org>
Cc: George.Dunlap@eu.citrix.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <b4e8835566bc6e9becc4f8adea7bb3c6cc558db2.camel@infradead.org>
 <b978a111-4cfb-45f3-850a-a5051298abef@citrix.com>
 <26fd7f099ab39ffccc2a5db8b4224fac6806461e.camel@infradead.org>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <26fd7f099ab39ffccc2a5db8b4224fac6806461e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/10/2023 4:21 pm, David Woodhouse wrote:
> On Thu, 2023-10-12 at 10:13 +0800, andrew.cooper3@citrix.com wrote:
>> On 11/10/2023 7:34 pm, David Woodhouse wrote:
>>> But why does the shim even need to turn it off when switching to the
>>> guest context? Its guest isn't running in supervisor mode so surely it
>>> doesn't *matter* whether SMEP is enabled or not? Why not just leave it
>>> on at all times?
>>
>> 32bit PV kernels run in Ring1.  Which is supervisor and not user.
> 
> Ah, thanks.
> 
>> Some older PV kernels do execute on user pages, and don't like getting
>> SMEP faults when they didn't turn it on to begin with.
> 
> PV guests never actually had the option to turn SMEP on, did they? 
> 
> (Otherwise I may have to rethink the approach of just putting
> 'smep=off' onto the shim command line when running under KVM...)


Xen and PV guests share a set of pagetables.  There is no ability to
independently control SMEP/SMAP.

While we could in principle make SMEP an feature that PV kernels can opt
into, SMAP we really can't.  The emulation costs of STAC/CLAC are
obscene from a perf perspective.

One TODO which has yet to be done is to look at the PV kernel's
ELF32/64-ness.  For a shimmed 64bit guest, SMEP/SMAP should be on and
stay on.

TBH, it's probably best to just hide the SMEP/SMAP features, rather than
to play around with the cmdline.

~Andrew

