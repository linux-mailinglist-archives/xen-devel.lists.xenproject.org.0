Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB50350A3F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 00:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104066.198612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRjKO-0003Fd-4Y; Wed, 31 Mar 2021 22:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104066.198612; Wed, 31 Mar 2021 22:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRjKO-0003FE-0y; Wed, 31 Mar 2021 22:28:44 +0000
Received: by outflank-mailman (input) for mailman id 104066;
 Wed, 31 Mar 2021 22:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=up+v=I5=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lRjKL-0003F9-SD
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 22:28:41 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aaa9b7c-1d23-4f34-a974-fbc95c8cacce;
 Wed, 31 Mar 2021 22:28:40 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1961179pjh.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Mar 2021 15:28:40 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id l19sm3232027pjt.16.2021.03.31.15.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 15:28:39 -0700 (PDT)
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
X-Inumbo-ID: 8aaa9b7c-1d23-4f34-a974-fbc95c8cacce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:organization:cc:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=+LKgt4TcyAyJ1QqoZkm1no5mFekC4wFQ3fM5jafH8a0=;
        b=U58w9yYSLzlKklIEDGJoFfQhtG8W8GX3HPtxmc13jv4oBLY/EmXrKF7zCqSuIFnuzl
         XeWbCd/VMYUr9rEwJZbaDDXucM5yFNGnRcR8wtimGjC86cGvug3daE3CbjTBvaHPhplw
         jkeTDN4HGK7cQJmuFvTW9fWcWSYaeJK0DihH9YD7/70JMf4P+pS46QfO0LJEevic0t7q
         sYNrWapw9pjtJfrquvoAbzQu3mlPR9i6BGbl90ZjC1kIL2UDgjdrGuFfoWzxYmiBRoKc
         lecoNgx3OITAEJSsI2lBG7BG83oA9qBr+bN6wt2NysnmWSXZvG16Cm3u3mYSYxUa4qCn
         e2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:organization:cc:to:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=+LKgt4TcyAyJ1QqoZkm1no5mFekC4wFQ3fM5jafH8a0=;
        b=TPxB5Ps8Sn8Nf6gOKlNVBwc7LhizWErAUxFxUhR34+jvqmxreu2AeLm8sI+P3XgOPk
         wjLGbVPY2T4HTWFVAl91OVjSdUwEoG0iDLn9ojN79J/3ak+1zUElHaoMZmN2zylbJURG
         7YcIVxEbSLR58UmP6tSJwjlJv0UODACPkbg4rR6n7lCDZWtwuuwXixT9bq5RXBYk5b63
         eBP6YWDq21KvKacfcO/iJ7OAsiHwd9b3h11bBHBh9Ub70otHUv3aSs4OzvYynF+vi7uU
         RfS3D7aw2ezerRiZRjK0uU/9lg3+T5oghyz4jPY1Opnov7k/jKIGnV9bb+do/4WOSYsw
         BJVg==
X-Gm-Message-State: AOAM532vheWcaUckkGRbGUna91958xocvzRM6pHGF43Oshdq6nZRjo5v
	HQd8na5bHC1IzYLYpLcUDvI=
X-Google-Smtp-Source: ABdhPJxm+h9yiZfB/eKTiS6v4zZth0YSRJ18MPbWWwjrN6i8x2QZGe+B7ZZjTaAqe8F2xX7RnU+97w==
X-Received: by 2002:a17:90a:7e03:: with SMTP id i3mr5551404pjl.234.1617229719981;
        Wed, 31 Mar 2021 15:28:39 -0700 (PDT)
From: Bob Eshleman <bobbyeshleman@gmail.com>
Subject: Xen Secure Boot and Lockdown WG Meeting Summary - Mon, March 29, 2021
Organization: Vates SAS
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?TWljaGHFgiDFu3lnb3dza2k=?= <michal.zygowski@3mdeb.com>,
 Olivier Lambert <olivier.lambert@vates.fr>, =?UTF-8?Q?Piotr_Kr=c3=b3l?=
 <piotr.krol@3mdeb.com>, Rich Persaud <persaur@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>, Trammell Hudson <hudson@trmm.net>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <14f458d5-a806-3364-5e83-6a03c7b05e9d@gmail.com>
Date: Wed, 31 Mar 2021 15:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

# Xen Secure Boot and Lockdown

This document summarizes the Xen Secure Boot and Lockdown WG meeting that
occurred on Mon, March 29, 2021.

We identified a list of requirements for locking down a Xen system that
(at least) requires the following:

## Verified Boot Chain

Various projects are underway already to support a verified boot chain that
includes Xen and dom0.

    1. via the EFI loader
        1. Xen already supports verification of itself, the dom0 kernel, and the
           dom0 initrd, via a PE32+ bundle and the EFI loader.
    2. Trenchboot
    3. Add PE/COFF header to mb2 Xen (patches on ML, needs revision), allowing
       shim + grub2.

## Linux Lockdown in Dom0

    1. Needs further testing, but seems to at least nominally work with QubesOS
        1. QubesOS may be benefiting from outsourcing otherwise locked down
           functionality to stubdoms
    3. Integrity checking for initrd
        1. Not an issue for bundled xen.efi

## Xen Lockdown in Dom0

    1. Live patching
    2. Kexec
        1. Will dom0 kexec need extending?  Probably just "plumbing" to work for
           Xen.
    3. /priv/cmd
        1. Violations of SB include:
            1. set_trap_table
            2. mmu_update
            3. ... more ... (TODO: add to this list)
    4. PCI Passthrough
        1. usage of unstable Xen interfaces
        2. PCI BARs mapping in guest
        3. Interrupt routing setup
        4. See other QEMU-related issues below
    5. QEMU
        1. I/O permissions
        2. resets may be an issue
    6. Xen command line
        1. What parts are safe? and unsafe?
        2. Allow safe options from unmeasured source


The living version of this document, to be used to coordinate future work, is
found here:
   https://cryptpad.fr/pad/#/2/pad/edit/IrfCfGH3l1Z2oUGlbBS2kiz6/

Please feel free to add to / edit the above document!

The raw meeting notes can be found here:
   https://cryptpad.fr/pad/#/2/pad/edit/YHfyA-IbuEa3SLe-hsKVEjRC/ 

-- 
Bobby Eshleman
SE at Vates SAS

