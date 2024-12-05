Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F189E5DDF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 19:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849204.1263848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJGAx-0006VR-DA; Thu, 05 Dec 2024 18:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849204.1263848; Thu, 05 Dec 2024 18:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJGAx-0006Sk-9t; Thu, 05 Dec 2024 18:02:07 +0000
Received: by outflank-mailman (input) for mailman id 849204;
 Thu, 05 Dec 2024 18:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7i5=S6=bounce.vates.tech=bounce-md_30504962.6751ea9a.v1-6834e9160f654eb09fe924cf10ec595b@srs-se1.protection.inumbo.net>)
 id 1tJGAv-0006Se-Ep
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 18:02:05 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07d86fb8-b333-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 19:02:03 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y42K61FZczRKMxJk
 for <xen-devel@lists.xenproject.org>; Thu,  5 Dec 2024 18:02:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6834e9160f654eb09fe924cf10ec595b; Thu, 05 Dec 2024 18:02:02 +0000
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
X-Inumbo-ID: 07d86fb8-b333-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733421722; x=1733682222;
	bh=ad6+7K0MU3AplIOcEBv8BaP7kQJXpeNbZddg7QpiWRs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1yvwnZMlNUp3vJj+KC3E0hoW7nAJR3HUP65k3YGHWDOLYtsykSRAebgSuQ2+1ix1p
	 hvo7KVti7UVUFqngwqG2KApzVUtZff/XmI3Lo0bgLeRfUaNPxzg3w9oNuxx8RI4Dxa
	 RTYBQsEStrMRMPH1NYH0z28EsnAigiVXOnLoO6hNYZ+ce7l06R6RI+Lhu7WVr39s6t
	 M6btLsgwqwT68bctlBt3WGLnM7EcuMceLoNg6U0911cmDIXf+bivyxEz1XuI8DNAn1
	 jj9P27gWqq7L9LXxBV6vcnxdAA8MObqbTUVwlqr2Uom04T9ezHD8ki+B6HhSlpGvkp
	 XFyy0AJN2DxPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733421722; x=1733682222; i=teddy.astie@vates.tech;
	bh=ad6+7K0MU3AplIOcEBv8BaP7kQJXpeNbZddg7QpiWRs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Z0gEM+IP1NNdJKfVNAwxxY6/9X5ORQuRxdrf+MEzelSwZ9DWIdkmmjT7L7gZWdNqr
	 /GzCMFnhnoHk44ndkKJL3xJMXPxK9uSo8p3cg/LAt3r6TVEuxcqFq3W5CJ5fIdTyRf
	 5CnuoeW5tkk75GQCs5T1GuYtP1ziB2D3qObSsznWXuGpNoTXArCZC7W37S66kJSbFh
	 5Skk7TPG/dt8FwwEcuky4SJCRFBmWsTOi0ksK0kgXsiyzsNr5T8QmiL4T84Srqu9id
	 pCRho2P/7nqxFjT0LauBdfyLPepYUOIbnGMZOgP6nlDaCSo93Z4XOZXA8NIMERdBUH
	 FyhIUAnmLHIRg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2]=20x86/hvm:=20Use=20constants=20for=20x86=20modes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733421721142
Message-Id: <05013b39-fb2c-4eed-97e9-b91506ff89b2@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Paul Durrant" <paul@xen.org>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech> <79004c19-7e55-4623-86e6-badd165b1d30@citrix.com>
In-Reply-To: <79004c19-7e55-4623-86e6-badd165b1d30@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6834e9160f654eb09fe924cf10ec595b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241205:md
Date: Thu, 05 Dec 2024 18:02:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 04/12/2024 =C3=A0 14:01, Andrew Cooper a =C3=A9crit=C2=A0:
> On 02/12/2024 9:49 am, Teddy Astie wrote:
>> In many places of x86 HVM code, constants integer are used to indicate i=
n what mode is
>> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these =
constants are
>> are written directly as integer which hides the actual meaning of these =
modes.
>>
>> This patch introduces X86_MODE_* macros and replace those occurences wit=
h it.
>>
>> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> 
> As fed back previously, these are (mostly) not modes.
> 
> "Mode" has a specific meaning in the x86 architecture which is not
> this.=C2=A0 You are going to have to change your commit message, and choi=
ce
> of constant names.
> 
> ~Andrew

I took a look on the page you sent in the past [1], but I am quite 
confused on how they should be named then.

Intel System Programming Guide in 2.2 "Modes of operation" defines these 
as "operating modes"
- Protected mode (which are named in this patch X86_MODE_32BIT and 
X86_MODE_16BIT)
- Real-address mode (which is named in this patch X86_MODE_REAL)
- Virtual-8086 mode (X86_MODE_VM86)
- IA-32e mode (X86_MODE_64BIT and in some cases X86_MODE_32BIT)

The page you sent introduce multiple "processor modes" with variants of 
real mode (RM16, RM32), VM86 (VM16, VM16E0, VM16E1), Protected mode 
(PM16, PM32) and IA32-mode "long mode" (CM16, CM32, PM64).

I think we can add all these modes as separate defines, while having a 
way (macro ?) to check some attributes (e.g is it "long mode" ? with a 
bit indicating a "long mode" mode).

[1] https://sandpile.org/x86/mode.htm

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


