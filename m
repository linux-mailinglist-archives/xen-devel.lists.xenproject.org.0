Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494996742F2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481312.746103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIahZ-00083B-Kt; Thu, 19 Jan 2023 19:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481312.746103; Thu, 19 Jan 2023 19:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIahZ-00081A-Hy; Thu, 19 Jan 2023 19:35:57 +0000
Received: by outflank-mailman (input) for mailman id 481312;
 Thu, 19 Jan 2023 19:35:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vhZF=5Q=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1pIahY-000812-83
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 19:35:56 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7af6aad2-9830-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 20:35:52 +0100 (CET)
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 30JJZ95D909956
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 19 Jan 2023 11:35:09 -0800
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
X-Inumbo-ID: 7af6aad2-9830-11ed-b8d1-410ff93cb8f0
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 30JJZ95D909956
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023010601; t=1674156911;
	bh=KFNC6n5tjG56AZ6QGCCnA813vxZPvPdVzmseUKYQm/I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TfwjDirpObGhbZuqhQo/OjXlYctFSVNIqq7knSM29fRDfZ2tQke+RwtNnj4zfQlUu
	 Bq7qw2iSUSh4dJSDm7i/EaoS584mAtH8JI0HxllkzWt3z0T8MZU4Yg0NjdsZBw+YZK
	 ZfM4pgmJ0Ook31LrNi0G4ZIduvwtcQZqBqp0unnHdEG7AuhbJIo+R1m0AcjiUZ0cRr
	 NKhVSWrU3s9CUZaUwpuO6d8p7hTU5Lu7doD4erJ735/nqwxXHrIi/r4/iUAE4IvqIK
	 0aAr/sWn86woN3PLoEzLyYRrgoztLvaP7svvxfNwZ4ItddpzPXF3KsA96J5mrIBTMy
	 XnFHIg1J9H7Nw==
Date: Thu, 19 Jan 2023 11:35:06 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        Joan Bruguera <joanbrugueram@gmail.com>
CC: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Jan Beulich <jbeulich@suse.com>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
        Andrew Cooper <Andrew.Cooper3@citrix.com>,
        =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, jroedel@suse.de,
        kirill.shutemov@linux.intel.com, dave.hansen@intel.com,
        kai.huang@intel.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/7=5D_x86/boot=3A_Remove_ve?= =?US-ASCII?Q?rify=5Fcpu=28=29_from_secondary=5Fstartup=5F64=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>
References: <20230116142533.905102512@infradead.org> <20230116143645.589522290@infradead.org> <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>
Message-ID: <5718C98C-C07A-4BD1-9182-7F3A8BDBC605@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 18, 2023 1:45:44 AM PST, Peter Zijlstra <peterz@infradead=2Eorg>=
 wrote:
>On Mon, Jan 16, 2023 at 03:25:34PM +0100, Peter Zijlstra wrote:
>> The boot trampolines from trampoline_64=2ES have code flow like:
>>=20
>>   16bit BIOS			SEV-ES				64bit EFI
>>=20
>>   trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
>>     verify_cpu()			  |				|
>>   switch_to_protected:    <---------------'				v
>>        |							pa_trampoline_compat()
>>        v								|
>>   startup_32()		<-----------------------------------------------'
>>        |
>>        v
>>   startup_64()
>>        |
>>        v
>>   tr_start() :=3D head_64=2ES:secondary_startup_64()
>>=20
>> Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
>> touch the APs), there is already a verify_cpu() invocation=2E
>
>So supposedly TDX/ACPI-6=2E4 comes in on trampoline_startup64() for APs -=
-
>can any of the TDX capable folks tell me if we need verify_cpu() on
>these?
>
>Aside from checking for LM, it seems to clear XD_DISABLE on Intel and
>force enable SSE on AMD/K7=2E Surely none of that is needed for these
>shiny new chips?
>
>I mean, I can hack up a patch that adds verify_cpu() to the 64bit entry
>point, but it seems really sad to need that on modern systems=2E

Sad, perhaps, but really better for orthogonality =E2=80=93 fewer special =
cases=2E

