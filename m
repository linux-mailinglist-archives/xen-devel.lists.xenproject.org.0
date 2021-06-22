Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA523B0A92
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145988.268545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjVK-0008Gm-BD; Tue, 22 Jun 2021 16:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145988.268545; Tue, 22 Jun 2021 16:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjVK-0008Ei-7E; Tue, 22 Jun 2021 16:44:02 +0000
Received: by outflank-mailman (input) for mailman id 145988;
 Tue, 22 Jun 2021 16:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p8IA=LQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lvjVJ-00088P-2m
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:44:01 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a53bc060-620b-4270-b905-69a87c3d67ba;
 Tue, 22 Jun 2021 16:43:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so460669wms.5
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 09:43:56 -0700 (PDT)
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
X-Inumbo-ID: a53bc060-620b-4270-b905-69a87c3d67ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xLHrOk5OVDoI85ryDFnPzSJzc2ejQRiXSH+YDbiqsic=;
        b=P/u+uaa/ptDfeKpbPc7mua+7ZWJnGEUpntNynLCH2A5RoZ9PIVT5SuERdlCFhvrnU2
         QWOhDSnd0rY7xwoMCY+lZ+ENcwDmgzmxx8uR/XNViIqgCwuScrwecSYxNheZBxB+Z0GR
         8/bAilMoaX6KXajBYcTOOG3pPGSdohlZM/dVyQB+EeilZWGo2Ajbkg0LVUft2CIwgNN0
         mr9Liw9R+FtvE0Rn2Om3JS3Z3vhSZ/ZHONRxmo3jc8JaEfyFhc3ED33RDEgfHPSZcgz0
         0SQecS1vsHHgOIRd4BnAjk4Guvb9FSWj3GbhMwwOpHvJhSK73r4wRAalxa0Q79+U2mgS
         q12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xLHrOk5OVDoI85ryDFnPzSJzc2ejQRiXSH+YDbiqsic=;
        b=hHanrCG5GMK/dlt4OheZFa1usFSCvbO9AVVKKcYGKdJGWdmw3+pDmFqz7x5BS5J6Dh
         oGJbWKE9hgHoxJWOYe+e5nQGZUg31uGT56Otx7lYqtDEwiO9P7OqSwbYfKR3jXU5YYXp
         tmrL9dUhoOVgWwhb9lLr2yw+4U/HZQptOVR920GCGKL9pBEXVUeiSOGSA4EbWtkV+y5l
         kKhxlhfdf3aUJ+2ZfUYee+jCfzrwugTdn7wKvFiFBEcHk+EtV+qnGIe+w0f0SL4Mz9n+
         r2VlqPSVbfLdbg+cKi7r6OHQDR/Mz8tihQUpK5hWxNbbPwrqbD24tnHvAMXib8jSMnZp
         7T0Q==
X-Gm-Message-State: AOAM531uo2kanRybTYXEzbYzkyGUPBqSK3qw+2UPi9fcrZ4xlSjmHbvv
	XEgvbh5kNJl9crlvS/j+WHfpZdDdUEaof7vC76I=
X-Google-Smtp-Source: ABdhPJw9jRJxK3pjTQw0gOz0fE2qhZ6h6OXEaVm9yPI77UZXUmt1dD9bLmS7SnPCOWJRumkUC+h8CaW6y5Wv8dyK4eE=
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr5576754wmm.154.1624380235589;
 Tue, 22 Jun 2021 09:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
 <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com> <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com>
In-Reply-To: <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 22 Jun 2021 12:43:19 -0400
Message-ID: <CABfawh=W92ioejsZ-zu+WVofw_jfxVLteVieC2Ysfxd3Wrs+Og@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Neil Sikka <neilsikka@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I used Xen 4.15 and a pretty new version of Windows 10. It is a bit
finicky, you have to run the debug commands on the debugee and then
reboot. When the VM is rebooting the domain ID changes so you have to
start the serial bridge then. Windbg will attach afterwards. Just make
sure both VMs have serial=3D'pty' set in their config file.

Tamas

On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka <neilsikka@gmail.com> wrote:
>
> Thanks for the quick response, Tamas. I tried what you said and windbg wa=
its and the debugee hangs when I click the break button in windbg, but I do=
n't see any output in windbg. This means that there is SOME communication o=
ver the serial port that causes the debugee to hang when I click break. Cou=
ld it be a debugger protocol issue? I also tried the guidance here by runni=
ng the crlf program:
> https://www.qubes-os.org/doc/windows-debugging/
> But windbg waits and the debugee hangs in a similar manner.
>
> What versions of WIndows and Xen are you using?
>
> On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel <tamas.k.lengyel@gmail.c=
om> wrote:
>>
>> I have managed to get windbg working with a serial bridge between two
>> Win10 VMs using the following script:
>> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scrip=
ts/serial-bridge.sh.
>> The debugee has to enable a couple options so that windbg can attach:
>> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scrip=
ts/debug.cmd.
>>
>> Tamas
>>
>> On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com> wrote:
>> >
>> > Hello,
>> > Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger =
attached when running the Windows10 debugger VM and the Windows10 debugee V=
M on Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization fai=
led" error. I tried the suggestions in the discussion here (https://bugzill=
a.redhat.com/show_bug.cgi?id=3D1947015):
>> > -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjust=
=3Don,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,arch-capa=
bilities=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \
>> > skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-spinl=
ocks=3D0x1fff,hv-vendor-id=3DKVMKVMKVM
>> >
>> > note: i had to remove the following 2 arguments due to errors from QEM=
U:
>> > pschange-mc-no=3Don
>> > hv_vpindex
>> >
>> > Here was the error:
>> > C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
>> >
>> > Network debugging is supported on the following NICs:
>> > busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in=
.
>> > The Microsoft hypervisor running this VM does not support KDNET.
>> > Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or lat=
er.
>> >
>> > KDNET initialization failed.  Status =3D 0xC0000182.
>> > NIC hardware initialization failed.
>> >
>> > I am using an Intel e1000 NIC emulated through QEMU because its suppos=
edly a supported NIC for Windows kernel NET debugging.
>> >
>> > Thanks in Advance!
>> >
>> > --
>> > My Blog: http://www.neilscomputerblog.blogspot.com/
>> > Twitter: @neilsikka
>
>
>
> --
> My Blog: http://www.neilscomputerblog.blogspot.com/
> Twitter: @neilsikka

