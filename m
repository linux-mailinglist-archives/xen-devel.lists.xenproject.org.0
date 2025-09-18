Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF1B851FA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 16:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126195.1467875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFQT-0006YR-Sv; Thu, 18 Sep 2025 14:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126195.1467875; Thu, 18 Sep 2025 14:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFQT-0006Vp-Pk; Thu, 18 Sep 2025 14:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1126195;
 Thu, 18 Sep 2025 14:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV2i=35=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uzFQS-0006Vj-NY
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 14:15:56 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdc470a9-9499-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 16:15:55 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-577dd4c1e84so1345469e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 07:15:55 -0700 (PDT)
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
X-Inumbo-ID: fdc470a9-9499-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758204955; x=1758809755; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H2UNlJV0Vw4pv3+GHxaqsbGCtynJeSBicB/lSvznXj0=;
        b=MFIJhdY1F5jHzyF/w/yg6g5uZ9T5ddy1f+6l7bbVNAujzs53ov2jFxiPNtFmFAhfcJ
         oTnm1M3RYAdzS7bH4o7ABMIeWtgo8MJ1lkzjR0turycYMDiysQAV10iMfu8iLlchPMeT
         Yte8WmSQGRt49pJQlpgYokH3VcuucLPflSQF4DXzIC4Wzec32PwwEYxVCDhN3UgW5ZMp
         MXo8tOcrrwIoWiO2w7zyPNrR57eJmvqCVDQ/e3pWmJhIa+BTGBT11djTJGzbK81u7y7A
         ISY4rLO/memhAw9kLkmTHoJqfvQ+/XZRlI5MgSYmR40hnj8K/ixD7sEs8zER/Gwd4x0b
         1Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204955; x=1758809755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2UNlJV0Vw4pv3+GHxaqsbGCtynJeSBicB/lSvznXj0=;
        b=WredHR/ZyeI1HVUHFVmRHVCE+cI9NLZ73WviE91xix6mC7uCKP/yKxy3v9a4Xw4SCW
         SQzVumllq8dCmZLqNBLvclSF3vmhGvjarvGXwOIdijyskO2YXw9WaAyCEOQyYxF5szg2
         AX6Z4klIhLzGDYaXzusybKcByMtZjgv/IZ7aQGgD+30mgAXS4Sdk6rn862SiJa/L36og
         vtrRC+ZghbUxrPNNSEmgE6KaJl2/eKkI9f+wmU+Rj5aKKOXIxPVLhdfZthTQycN6KWz1
         a+iIyvMnvehRFtwDtjA2/stGBHWMFS3M3zx8JkgPWKDDXizd/BXTTuAGkd/mMh8y4GZq
         myoQ==
X-Gm-Message-State: AOJu0Yy0dS5Tyxv4/9nI/kZyz5dULIfBzcQhXzXABA41y8xSTJE2zZlr
	EU41x9Ur5r72PEWgDC6OsadKeN8C4QMGJ1NWDQn8eqTJsoQhOJpv8taA2qqBS84kXpif6w+xOXN
	LAxUo403xDgTBlNqkZgpEDYtPfBnd1tu9WWLB
X-Gm-Gg: ASbGnct4EDKswDbBTrJAcksHBWggT9YggJCZ3su/ie99YO2ahGCrSWfzH28uu6qgpJ4
	nbdataiYcLn5j0k6POkUeaUgWMMwC/JFscZB0FSD8ARMVw4uXlBIkzynO7nrKqS5kwJZxGzRHKJ
	NumU5q78ef3y2YP6bkFKett/ZNJcwIaOj0NiYp7WX9YQ+vQqFzz3M+ivmLj3mDkElr+hCMsf4No
	5bxKrYdqsrT3/2ctCpi2RCs
X-Google-Smtp-Source: AGHT+IF29FYnuzWbD7Sn9kzruNLO8IHcXj3Z2Z3AeewnB92LepxY48RilkxIi1RwwCdeKc/ng7IrLuCk8q/H4MoZXig=
X-Received: by 2002:a05:6512:6382:b0:566:41cb:66af with SMTP id
 2adb3069b0e04-57799cbb53dmr1891693e87.14.1758204954403; Thu, 18 Sep 2025
 07:15:54 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 18 Sep 2025 15:15:42 +0100
X-Gm-Features: AS18NWCygu6Z40U_cmh5wLb0JRP3ynb43j3aG3LHcHgw8_f6nRSjmj0TLDcqPs8
Message-ID: <CACMJ4GZq49jeDby9OCJYK1-LYx5jeTGku7nr5s_1RPs=CcFT+A@mail.gmail.com>
Subject: Xen Summit 2025 - Design Discussion Notes - Xen ABI, second session
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Xen ABIs/APIs second session notes  (apologies for errors, etc.)

Andrew Cooper (AC): There are two classes of hypercall:

"privileged": ops such as: set trap table, PV load IDT, that must only
ever be issued by a kernel, and others such as grant and event
channel ops, because they act on per-domain resources, so mediation by the
kernel is required.

"logical": ones for userspace to invoke with general audit by the kernel, but
the kernel mostly just checks that the buffer passing is safe.

so: classify all the hypercalls as input to the new design.

Example design issue: separating event channel ops and domctls used during
domain construction from others due to the difference in privilege required.
Plan: split hypercall ops that are currently combined.

Longer term plan: Flask policy, and in general one entity will be more priv
than another.
Many domctls don't apply to self due to VCPU pause semantics.
Can't require kernels to know about hypercall parameters to know this one
should not be referenced.

So: need to evaluate what each (existing) hypercall op can do.

Yann Sionneau (YS): Q: before changing privcmd, need to implement the new ABI?

AC: Yes. XenServer has a filter driver in the kernel patch queue as a stopgap
for now, not upstreaming it since aiming for new ABI changes first; progress
slowed in discussion upstream.

Want to get to a plan, for example: XenServer will do ... , Vates will do ...
Have a stopgap for lockdown mode and a plan for upstream.

Christopher Clark (CC): Q: for background to this session: said previously
XenServer's motivator for the new ABI work is adding support for UEFI Secure
Boot, and Vates is interested for the Encrypted VM implementation:
are there other known major feature motivators?

AC: Edera's Rust toolstack is affected by interface stability.

Within XenServer, affected is mostly xenops, performance stuff,
"xenguest" tool for implementing save, restore, etc.

QEMU makes hypercalls and distros can't ship one compatible with arbitrary
toolstacks, although we also want to support PVH guests with no QEMU.

Tapdisk is userspace and using /dev/xen/evtchn.

Windows on PVH: there is a plan!
Can write a ACPI table to put initial drivers into Windows:
WPBT, and Windows will want the drivers to be signed.

Daniel Smith (DS): "Windows Platform Binary Table"

AC: Windows runs as gen2 VMs under HyperV - has VMBus with PV disk and network
ie. pure virtual environment with nothing else
so there is a plan for fully virtual Windows guest.

Alexander Merrit (AM): do we want to write a document for all the hypercalls,
since we stumble over things as we work on them?
DS: there are headers!
AC: previous documentation implementation avoided doxygen.
Plan: kernel document with the sphinx plugin.

AM: would like more than just the call plus arguments documented, also:
how to use the call to achieve a goal.

AC: an example doc is the "lifecycle of a domid".  is a precursor to
"how to build a domain".

A large amount of complexity is due to not knowing bootloader or firmware
options - is a lot more simple than people think
eg. build memory, populate images, ...
sometimes we put in hvmloader or ovmf or run pygrub in dom0 to get kernel off
the disk and put it in.

Hypercalls used to build a domain are not documented. libxenctl.

AM: valuable as meant to be a stable interface, so put effort into the document.

AC: docs are missing the higher level "how to start a domain".

Also relevant: Alejandro's plan, sent a while ago as RFC to the list, a
somewhat long, language agnostic fashion description of structs.

complexity is difficult to generate C that you would want to consume: if it's
not identical, or has complexity such as compat support, it is difficult.

Alejandro Garcia Vallejo (AGV): still want to generate in a language-independent
fashion, but it is hard due to compat.

AC: so can be done only for the new ABI.

Result is: for all hypercalls, there will be several changes to each operation
how it works.

Discussed other than using C to describe ABI, because
eg. struct handling by the compiler in complex,
it can and will make changes
so the canonical description must not be C.
Ideally text, and then generate C and Rust and Go, etc.

DS: like Intel and AMD table documents?

AGV: do not want to implement a new language to describe, but is ok to describe
fields one after another with preamble, for example, saying: no padding,
no holes, etc.
so you don't need to be so precise for each item.

AC: unions is a headache for any language not C.
so we want to avoid them in memory structure.

?: ban them?
AC: they are useful in C. eg. domctl: header, command, union
so we want individual ops instead, and then can drop
the existing unions with a different structure.
Is reasonable to say "no to unions" but don't want to
outlaw them since will likely need the option to use them.

AGV: the problem is not the union, it's the absence of the type.

AC: sched_op: has a union with a tag inside the union,
so you need to know that data before you can access it.

For reasons of Xen being an academic project initially,
a notable Xen book was published containing an exercise on
how to write a scheduler; it was attempting to be a variadic
call over multiple schedulers.

XSM op: hypercall that may or may not be compiled into the
hypervisor or not. Is an accident of the separation of
XSM and Flask implementation. Should create a flask_op.

DS: XSM implementations: dummy, silo, flask (plus possibly
another soon). Was written originally as flask_op though.

AC: and also want a way to ask what XSM is in place.

DS: do you want a hypercall per XSM module?
or to properly multiplex the xsm_op ?

AC: Would like to avoid multiplexing as complicated for bindings.

DS: but flask is very unique due to what it is being asked to do.

... (discussion)
AC: no known buffer

DS: theoretically a capability-based XSM versus sid-based.
If no multiplexing, then you have conditional ops.

AGV: with lockdown, there is a limit to the payload of ops: all
direct and indirect references must be marshalled ahead payload
for secure boot. They cannot be fully opaque.

DS: today you send in label and get back the SID.
Either you implement multiplexing or you need two ops.

AM: would it make sense to define a set of principles to
define hypercalls?
to avoid arguing over each hypercall?

AC: yes! this is how we (CC + AC) have structured the documents
that we are creating for this. Third document is about
Principles for Improvement.

Teddy Astie (TA): We want the new ABI to be somewhat stable, but
how do we introduce new operations to it?

Jan Beulich (JB): adding subops will always work.

AC: domctl and sysctl: we frequently tweak those.
domctl has an example of buffer sizing: will get an invalid
response if there is a mismatch: allows extending an existing op.
Can do this in some cases or may be better to add a new sub op.

AGV: See what Linux does: if an interface doesn't work, they
add another op.

DS: Could you consider a TLV structure for adding new items?
Is common in Linux.
AC: An encoder and decoder are needed.
AGV: a problem to avoid?
DS: Is a pretty straightforward format; just a suggestion to consider.

AM: Has the NOVA hypervisor been looked at? Their hypercalls?
They only have 5 or 6 plus a capability-based system.
Calls are low-level, very simple, so not much churn on hypercalls.
Can we take from that curated approach?
but they don't do backwards compatibility.

AC: We care about backwards compatibility, so that's a problem.

AM: Are the concepts in the design useful?
AC: Don't know.
AGV: Their IPC path is optimized to not take a long time. Xen took
a different view, eg. page-table walks.
eg. get/set cpu context: many bytes in vCPU state: could instead
be done by get/set each index, is extensible but would need many calls.
AM: Could we create a multi-op call?
AC: We have multicall
~end of discussion

