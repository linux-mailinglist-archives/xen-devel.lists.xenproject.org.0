Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C892CAB5F45
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 00:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983597.1369844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEy3v-0007Dr-L9; Tue, 13 May 2025 22:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983597.1369844; Tue, 13 May 2025 22:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEy3v-0007Bk-IQ; Tue, 13 May 2025 22:25:23 +0000
Received: by outflank-mailman (input) for mailman id 983597;
 Tue, 13 May 2025 22:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sQlm=X5=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1uEy3t-0007BB-G3
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 22:25:21 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26886216-3049-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 00:25:20 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54DMOpTA2629221
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 13 May 2025 15:24:51 -0700
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
X-Inumbo-ID: 26886216-3049-11f0-9eb6-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54DMOpTA2629221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747175093;
	bh=7lqXvgutqBhxBiqB2WRmqV45ZUWRMix0kVNa0a5yjjE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=jRy0VsKlS3Nvf/A+ezlJoCBAkUunwHrhNiPzC26OWpSiO3GDjxRzVP+5usgYjAIWk
	 4FbNyhxrRkEl/j9FrntXweVv7V7NhKgxIXbEFR4cSrHZghN5QHXW8xvOL1ahGOfAha
	 yfsgN1IllT6qL/n3XTuX23ybYMKX3K7jJyvYgvx7mujkTK0PdIk4SJXKIbmmrS/DwM
	 xGBftzkT6HDCYa7z4oqwVfxG6xNOgdX+bDVOKF/YLznkmBnGWkksg3pKNzqLjeTs18
	 gcIkkwKjMEK8SmckOFvoI3Wrlf8chFeD3NCcX5NUHCT9kSfqob8w7uGl9BPhSJKEAH
	 Hsq+1NLFpOPcQ==
Date: Tue, 13 May 2025 15:24:51 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Xin Li <xin@zytor.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        virtualization@lists.linux.dev
CC: Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.amakhalov@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_5/6=5D_x86/paravirt=3A_Switch_MSR_acce?=
 =?US-ASCII?Q?ss_pv=5Fops_functions_to_instruction_interfaces?=
User-Agent: K-9 Mail for Android
In-Reply-To: <6cc20ef6-d8e5-4c74-89d9-6a949c84b397@suse.com>
References: <20250506092015.1849-1-jgross@suse.com> <20250506092015.1849-6-jgross@suse.com> <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com> <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com> <ff567466-a46a-4f66-935a-8fae1140c1a2@suse.com> <eb077393-ea95-4ac0-9479-980e227f7bff@zytor.com> <6cc20ef6-d8e5-4c74-89d9-6a949c84b397@suse.com>
Message-ID: <DDA7C560-1BD9-40A6-8B93-28D5AC10EBB2@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 12, 2025 11:06:02 PM PDT, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=2Ecom=
> wrote:
>On 13=2E05=2E25 07:55, Xin Li wrote:
>> On 5/12/2025 4:24 AM, Juergen Gross wrote:
>>> Now with the mentioned patch really attached=2E :-)
>>>=20
>>=20
>> Does it allow patching with an instruction more than 6 bytes long?
>>=20
>> The immediate form MSR instructions are 9 bytes long=2E
>
>Yes, shouldn't be a problem=2E
>
>
>Juergen

However, it is more than that=2E The immediate instructions have a differe=
nt interface, and it makes more sense to use the extra bytes to shuffle the=
 bits around for the legacy forms:

Write:

    mov %rax,%rdx
    shr $32,%rdx
    wrmsr(ns)

Read:

    rdmsr
    shl $32,%rdx
    or %rdx,%rax

For the write case, this also means that two separate trap points are need=
ed=2E

As far as Xen (the only user of pv msrs), note that it only paravirtualize=
s a very small number of MSRs, and some of those are fairly performance sen=
sitive, so not going through the Xen framework for MSRs known to be either =
native or null on Xen would definitely be a win=2E

