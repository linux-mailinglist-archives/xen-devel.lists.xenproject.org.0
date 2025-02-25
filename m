Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C7A450A9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 00:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896060.1304738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3u5-00061y-LR; Tue, 25 Feb 2025 22:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896060.1304738; Tue, 25 Feb 2025 22:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3u5-0005zi-IV; Tue, 25 Feb 2025 22:59:53 +0000
Received: by outflank-mailman (input) for mailman id 896060;
 Tue, 25 Feb 2025 22:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJJN=VQ=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tn3u4-0005zc-OC
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:59:52 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37499523-f3cc-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 23:59:50 +0100 (CET)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3f401d3b7a2so133645b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:59:50 -0800 (PST)
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
X-Inumbo-ID: 37499523-f3cc-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740524389; x=1741129189; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eVp01miuHlidbnmaygQlk57OV54I3I+b5P5ihMSP7s=;
        b=LCUL4AQ3Nz1M4+qkXvJcSy1Vu8mof5/udWyEr7xoPqDj7m+OGYoLkthI7lODG2rbaM
         KB/24tQb2u42Vle9l7lC4m8ezri/QgBAyGHU+JCt4uTJUVpaOfmPCJo4xLR0f2ZpZyLZ
         v4LBmjzbLJVRZObYzWaznV4sWlPYEVk7kyCacMnGlX/9rX7tez7hbwfKcl6HJDWF8Zs4
         x0rXmqXKhGuKmSmRUw4z8P2QmRU+l3L1iv34HKh8kxUEsUarci7XHNeqkQw73uzJiNtx
         CV2kbZLkeyC23Nc+EzbpEeSj+L2uOpnZ39D/kUdAKshotmKoZu8/K3is9GMNJhIe7Z+E
         n6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740524389; x=1741129189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eVp01miuHlidbnmaygQlk57OV54I3I+b5P5ihMSP7s=;
        b=H9WM0vSZRdwpT13Vnds/UPEVC5faQBOST/ETA/LMwRlFa35d9KbQnCGlI9P+OpUMt7
         AjdDeeCbYfsw4Z2KFdqe26w6dDWOBF0q/d6cIAlqSC7Yv5hZtPqqc5f7MeqOXZk2AhJr
         +eGc4izk/R6mZwqrf6cN9mQQnVfTqn3JnlBsOETe7yFFLxcMD8EmCm2V+nXgu1PkAraf
         FwgR3L9a7bsOhsreosN/5RuCanKDyskDu8vsvlXycMit/1i3Lxvy8cdCs30c5Umg7VBh
         FLoMgjEpSOlhlSbipAi44E49QC6DDI/sv2sbwW+dHB6qIoD40ebW0yIAGabH/3PTvDWF
         7Y6g==
X-Forwarded-Encrypted: i=1; AJvYcCUkf5W0uLCqXQ9/w2SySLHXS1ENzrrwC27ZHd8jKZmj3YZOPlXIrxR7aArFQE0cQdoBVXsc/IyQtjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxmVnQHqMOrDoSMTaXFZnKmgBN2HDBdIG0ht+QdPfuvgA7RqSy
	JYv9p6FiDPK6L7DAImBiz+zoYtDdUK8AQJx39Ao/lm5zeK/VRXh9NHw47MLtpXBYXvR0Jw8b8S4
	EVCAw41HB1RxeOk3OONLV/+oX3BY=
X-Gm-Gg: ASbGncuJmpt8Z+zf0Vsgi8++jAaFExMVb5oXXhJjQzK+Q9OD0dJG2PaQZAUYv+YFPPI
	QI+d03K1J0wJHB1O5+oWpmg2IeUEKqxQb6lslEK8xAZX2BnztcprPcYrYLthYMurp/QZufygn4z
	P1b8Q1xQU=
X-Google-Smtp-Source: AGHT+IHFeqmsuBCjj5uQ4zQRx3YCuviawkXO+6xixkpxyUwGkeSVfswfKuM2WBiDk21gkcKNwNMzctiXslVwPeiJDEI=
X-Received: by 2002:a05:6808:210e:b0:3f4:756:52e6 with SMTP id
 5614622812f47-3f42468cce4mr5542980b6e.1.1740524389267; Tue, 25 Feb 2025
 14:59:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com>
In-Reply-To: <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 25 Feb 2025 23:59:38 +0100
X-Gm-Features: AWEUYZnfbTC_Bx0XLg4RmpNBRFm_HlR3FxEKAtLEj2aAcVDcwYvcortvBlcbwxg
Message-ID: <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 9:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Just one thing - to (hopefully) get a better understanding of the origin =
of
> those errors, you may want to increase verbosity of the "xl save", e.g.
> "xl -vvv save".
>
> Jan

Here's an output of this command, that failed:
xl -vvv save win10-18362-103 /opt/ramdisk/vms/clones/win10-18362-103/state

libxl: debug: libxl_domain.c:2295:libxl_retrieve_domain_configuration:
Domain 90:ao 0x555eef6f1bd0: create: how=3D(nil) callback=3D(nil)
poller=3D0x555eef6fca50
libxl: debug: libxl_domain.c:2311:libxl_retrieve_domain_configuration:
Domain 90:ao 0x555eef6f1bd0: inprogress: poller=3D0x555eef6fca50,
flags=3Di
libxl: debug: libxl_qmp.c:1884:libxl__ev_qmp_send: Domain 90: ev
0x555eef6feeb0, cmd 'query-cpus-fast'
libxl: debug: libxl_qmp.c:1324:qmp_ev_lock_aquired: Domain
90:Connecting to /var/run/xen/qmp-libxl-90
libxl: debug: libxl_qmp.c:1699:qmp_ev_handle_message: Domain 90:QEMU
version: 8.0.4
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No vtpm from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No vusb from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No pci from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No vdispl from xenstore
libxl: debug: libxl_domain.c:2587:retrieve_domain_configuration_end:
Domain 90:No vsnd from xenstore
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose: Domain 90: ev
0x555eef6feeb0
libxl: debug: libxl_event.c:2067:libxl__ao_complete: ao
0x555eef6f1bd0: complete, rc=3D0
libxl: debug: libxl_event.c:2036:libxl__ao__destroy: ao 0x555eef6f1bd0: des=
troy
Saving to /opt/ramdisk/vms/clones/win10-18362-103/state new xl format
(info 0x3/0x0/1793)
libxl: debug: libxl_domain.c:508:libxl_domain_suspend: Domain 90:ao
0x555eef6f66d0: create: how=3D(nil) callback=3D(nil) poller=3D0x555eef6fca5=
0
libxl: debug: libxl.c:721:libxl__fd_flags_modify_save: fnctl F_GETFL
flags for fd 14 are 0x8001
libxl: debug: libxl.c:729:libxl__fd_flags_modify_save: fnctl F_SETFL
of fd 14 to 0x8001
libxl: debug: libxl_domain.c:536:libxl_domain_suspend: Domain 90:ao
0x555eef6f66d0: inprogress: poller=3D0x555eef6fca50, flags=3Di
libxl-save-helper: debug: starting save: Success
xc: detail: fd 14, dom 90, flags 0, hvm 1
xc: info: Saving domain 90, type x86 HVM
libxl: debug: libxl_qmp.c:1884:libxl__ev_qmp_send: Domain 90: ev
0x555eef703608, cmd 'xen-set-global-dirty-log'
libxl: debug: libxl_qmp.c:1324:qmp_ev_lock_aquired: Domain
90:Connecting to /var/run/xen/qmp-libxl-90
libxl: debug: libxl_qmp.c:1699:qmp_ev_handle_message: Domain 90:QEMU
version: 8.0.4
libxl: debug: libxl_event.c:863:libxl__ev_xswatch_deregister: watch
w=3D0x555eef703590: deregister unregistered
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose: Domain 90: ev
0x555eef703608
libxl: debug: libxl_dom_suspend.c:190:domain_suspend_callback_common:
Domain 90:Calling xc_domain_shutdown on HVM domain
libxl: debug: libxl_dom_suspend.c:300:domain_suspend_common_wait_guest:
Domain 90:wait for the guest to suspend
libxl: debug: libxl_event.c:812:libxl__ev_xswatch_register: watch
w=3D0x555eef702bf0 wpath=3D@releaseDomain token=3D3/0: register slotnum=3D3
libxl: debug: libxl_event.c:750:watchfd_callback: watch
w=3D0x555eef702bf0 wpath=3D@releaseDomain token=3D3/0: event
epath=3D@releaseDomain
libxl: debug: libxl_dom_suspend.c:348:suspend_common_wait_guest_check:
Domain 90:guest we were suspending has shut down with unexpected
reason code 3
libxl: debug: libxl_event.c:863:libxl__ev_xswatch_deregister: watch
w=3D0x555eef702bd8: deregister unregistered
libxl: debug: libxl_event.c:849:libxl__ev_xswatch_deregister: watch
w=3D0x555eef702bf0 wpath=3D@releaseDomain token=3D3/0: deregister slotnum=
=3D3
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose:  ev 0x555eef702c68
xc: error: save callback suspend() failed: 0: Internal error
xc: error: Save failed (0 =3D Success): Internal error
libxl: debug: libxl_qmp.c:1884:libxl__ev_qmp_send: Domain 90: ev
0x555eef703608, cmd 'xen-set-global-dirty-log'
libxl: debug: libxl_qmp.c:1324:qmp_ev_lock_aquired: Domain
90:Connecting to /var/run/xen/qmp-libxl-90
libxl: debug: libxl_qmp.c:1699:qmp_ev_handle_message: Domain 90:QEMU
version: 8.0.4
libxl: debug: libxl_event.c:863:libxl__ev_xswatch_deregister: watch
w=3D0x555eef703590: deregister unregistered
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose: Domain 90: ev
0x555eef703608
libxl-save-helper: debug: complete r=3D-1: Success
libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
Domain 90:saving domain: domain responded to suspend request: Success
libxl: debug: libxl.c:748:libxl__fd_flags_restore: fnctl F_SETFL of fd
14 to 0x8001
libxl: debug: libxl_event.c:2067:libxl__ao_complete: ao
0x555eef6f66d0: complete, rc=3D-3
libxl: debug: libxl_event.c:2036:libxl__ao__destroy: ao 0x555eef6f66d0: des=
troy
Failed to save domain, resuming domain
libxl: debug: libxl_domain.c:184:libxl_domain_resume: Domain 90:ao
0x555eef702050: create: how=3D(nil) callback=3D(nil) poller=3D0x555eef6fca5=
0
libxl: debug: libxl_qmp.c:1884:libxl__ev_qmp_send: Domain 90: ev
0x555eef6ff208, cmd 'cont'
libxl: debug: libxl_domain.c:192:libxl_domain_resume: Domain 90:ao
0x555eef702050: inprogress: poller=3D0x555eef6fca50, flags=3Di
libxl: debug: libxl_qmp.c:1324:qmp_ev_lock_aquired: Domain
90:Connecting to /var/run/xen/qmp-libxl-90
libxl: debug: libxl_qmp.c:1699:qmp_ev_handle_message: Domain 90:QEMU
version: 8.0.4
libxl: debug: libxl_qmp.c:1920:libxl__ev_qmp_dispose: Domain 90: ev
0x555eef6ff208
libxl: debug: libxl_event.c:863:libxl__ev_xswatch_deregister: watch
w=3D0x555eef6ff378: deregister unregistered
xc: error: Dom 90 not suspended: (shutdown 4, reason 3): Internal error
libxl: error: libxl_dom_suspend.c:661:domain_resume_done: Domain
90:xc_domain_resume failed: Invalid argument
libxl: debug: libxl_event.c:2067:libxl__ao_complete: ao
0x555eef702050: complete, rc=3D-3
libxl: debug: libxl_event.c:2036:libxl__ao__destroy: ao 0x555eef702050: des=
troy
xencall:buffer: debug: total allocations:69 total releases:69
xencall:buffer: debug: current allocations:0 maximum allocations:2
xencall:buffer: debug: cache current size:2
xencall:buffer: debug: cache hits:51 misses:2 toobig:16
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

