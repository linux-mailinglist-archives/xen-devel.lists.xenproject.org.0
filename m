Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A747D09F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 12:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250773.431880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzZd-00052K-2k; Wed, 22 Dec 2021 11:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250773.431880; Wed, 22 Dec 2021 11:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzzZc-0004zy-Vx; Wed, 22 Dec 2021 11:14:20 +0000
Received: by outflank-mailman (input) for mailman id 250773;
 Wed, 22 Dec 2021 11:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtqY=RH=gmail.com=ryancaicse@srs-se1.protection.inumbo.net>)
 id 1mzzZb-0004zc-Dn
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 11:14:19 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b94857-6318-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 12:14:11 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so2291228pjp.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 03:14:17 -0800 (PST)
Received: from [30.135.82.253] ([8.218.232.85])
 by smtp.gmail.com with ESMTPSA id l6sm316268pfu.63.2021.12.22.03.14.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Dec 2021 03:14:15 -0800 (PST)
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
X-Inumbo-ID: 49b94857-6318-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:date:subject:from:to:cc:message-id:thread-topic
         :references:in-reply-to:mime-version:content-transfer-encoding;
        bh=Vt0OKRh58O/606zjWJRGs/sHWORIYATpLumAzbOlz9Q=;
        b=eS5ryiwtbz+h1+iXR/P4pqk1UA0Gf1KsgFgEjlD2MQXPBoG8+K1FM+qNlBm6ndD84N
         R4sh/41SgUEn2Ci+fF89ZAcviGsS1BNwlUMS2T8r03K98EvA75JlHkUPUU/pOfXIGL4Z
         /B3pWaB04RS09NKXshMpY8nRGu9QiYgirABoRvFJomcH85N01e3dq9miSjWczkj9Cnb7
         0P4vtirx/Aw7reeKhXCOyuiCILvusVeIArzHixBzeJ56Izjwppcxt/7qFtpX6J+mqIHR
         kg9C34pYUrSh2xtveVHH5c6uH6lcNyO/Sv4cpZ6u7A9E0AZUicV6NZbTlRV9l0GozAXR
         Pe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:date:subject:from:to:cc:message-id
         :thread-topic:references:in-reply-to:mime-version
         :content-transfer-encoding;
        bh=Vt0OKRh58O/606zjWJRGs/sHWORIYATpLumAzbOlz9Q=;
        b=tY3a5iPRcF2Evaq/jgaR860RF3JemYcae3PkyqFmmaBY/oDIGbMU2D3A2ymkln5oDm
         j5fDibtacTG0ZOfnNZCPze6FTES2uCIblGjkugat8HUKSVqTRpuQz95h4UOyi59Yz2wa
         GWHq1qKbcUPXWaRc2g+9IkEYRLroOYcCBJh/Bf/d+lP8ShVljAJZ63JYpFhZW6ZYH/VE
         wBT0ScbJYa1sSyKbpy7d/GqVmc6jBImUE3dVoL1EoEL7gr6HvKGnanmmUaGANE7jj04R
         1nfKHyD/O9A0x6ZOzwiW8A5qN8Nfbl80uuC8yyPzJFa8yHvjeEp8RvWDI7akrw02zHCc
         pFLw==
X-Gm-Message-State: AOAM533jf0efsKkMchTFHa+KCSconDS2IWW2GUjGhLes0LSQDWJ1joC+
	w1XNIZPUo3CYyS9D1MyLUe4=
X-Google-Smtp-Source: ABdhPJxu2O6+2pmI6sPt1MZ0VG5K/N+QpEYM5MsjdHSD+oll/KJcKSQmY7peQXouM0645KFVWC3vew==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id q16-20020a170902789000b00143c4f759e6mr2433972pll.87.1640171655515;
        Wed, 22 Dec 2021 03:14:15 -0800 (PST)
User-Agent: Microsoft-MacOutlook/16.56.21121100
Date: Wed, 22 Dec 2021 19:14:12 +0800
Subject: Re: [BUG] Resource leaks in Xen
From: Ryan Cai <ryancaicse@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <dgdegra@tycho.nsa.gov>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <224F8DE1-BBE1-4107-BE58-6A9DAD9C1C84@gmail.com>
Thread-Topic: [BUG] Resource leaks in Xen
References: <62B51AB1-2C2B-402A-A7C8-5ADACE265DA4@gmail.com>
 <afe6bc04-c87b-e627-d032-b205a6bcfe7e@suse.com>
In-Reply-To: <afe6bc04-c87b-e627-d032-b205a6bcfe7e@suse.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

I have send a patch. Thank you for your reply.

Best,
Yuandao

=EF=BB=BFOn 22/12/2021, 5:28 PM, "Jan Beulich" <jbeulich@suse.com> wrote:

    On 22.12.2021 09:05, Ryan Cai wrote:
    >              I am writing you to report potential resource leak bugs.=
 In the file /xen/tools/flask/utils/label-pci.c, the methods fopen and fclos=
e may not matched when returning at Line 76, resulting in a resource leak. L=
ooking forward to your feedback. Thank for checking.
    >=20
    > Locations, https://github.com/xen-project/xen/blame/25849c8b16f2a5b7f=
cd0a823e80a5f1b590291f9/tools/flask/utils/label-pci.c#L63-L76

    Thanks for looking closely, but I'm afraid I don't see where any
    resources get leaked here: "f" will get closed implicitly after
    returning from main(). It might be good practice to close files
    explicitly, but that's purely cosmetic here afaics. Feel free to
    contribute a patch.

    Jan




