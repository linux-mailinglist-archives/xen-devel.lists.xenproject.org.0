Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F82F0EF6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64707.114343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytNh-00011d-HK; Mon, 11 Jan 2021 09:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64707.114343; Mon, 11 Jan 2021 09:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytNh-00011O-9h; Mon, 11 Jan 2021 09:20:57 +0000
Received: by outflank-mailman (input) for mailman id 64707;
 Mon, 11 Jan 2021 09:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+Cs=GO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kytNf-00011I-7X
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:20:55 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c754ddc5-5ee2-4297-958d-9dfc32d38c20;
 Mon, 11 Jan 2021 09:20:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id 91so15599858wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 01:20:53 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id b19sm20440190wmj.37.2021.01.11.01.20.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:20:52 -0800 (PST)
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
X-Inumbo-ID: c754ddc5-5ee2-4297-958d-9dfc32d38c20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=mhjobAz7S8ZYZjC/AJtRfD9yDXmC6EiUO2FAcCowUl8=;
        b=Tt4bbnFtRCg3fkWLfRoxset0yO2LFHUC+V9juhClItA2KIiCOdCU+ubNgZI1eZL9gr
         MBKrhtkwA9GucenEt8g6N/GfdemGImf9LA6XLD0hSp8LsWtTUaFE8FnzPoEgJnN6Q9Tc
         UiiK4WAVKuhhs/p3hdWU9vucO3xorXMhZZIrBC8ehwfuN9myfWxWfFvoZ3Nw0rAgaW63
         fa5SuiEKIVXzc+z/j6BYuhvMISKe8Ni8TnQaV5vzAYq8SdirhASlrdie0HQ8ovEYtk7g
         YQw0KY3GiTyTEIkIKsrTyn3hXjSDVnwmWjSRIBA5ZJIyBNAMu1GQMVHd/go/Qv83nI3c
         c0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=mhjobAz7S8ZYZjC/AJtRfD9yDXmC6EiUO2FAcCowUl8=;
        b=DYM8RFeb9O/ldzHv80a3crNQYydNXxIU6xWuFzjDtEWA1QQHARkKP0bs/pcW/y+KtA
         Nl7/GuezhV/PezSBH2WGqRXS0jEDI1lIzJ+j9+Dw/Fx8qgkd/2v9TfEfAOEYsJShFNkZ
         bfAnFQzJsypg3wn/xxKJAbjDhEvE2L3mAjJZF48ADJ9MjQ+fUJ8R20jnOvOpvzJ/QZw1
         2X22xgmtmuahLJl8mC8FyGFhCGbCnvAol57Yp43RyJfsiCV2C+Yx81Qcb2m01QoA9kCV
         LL2gO8kNX8DQSoZfqwxoGK9sTwXjQWJJDNeXC1QD1NBzXE3mB02kcGZUHfKkwMCYlIYc
         sxoQ==
X-Gm-Message-State: AOAM530WXChLt7bGo1yOhLp8MU/4HJpsjjxNXWX0TDDEp7deUuKLzWnC
	qUsPfVzChJUBCfmxDAWm3qA=
X-Google-Smtp-Source: ABdhPJw0rOnzz0z8TfLE1j1euzVCXhsOWKdBQQaA1jjwafPFEcPrFNi5x42E9KdrfZqrVdb5VPCa8w==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr15208139wrq.238.1610356853072;
        Mon, 11 Jan 2021 01:20:53 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <wl@xen.org>,
	<iwj@xenproject.org>,
	<anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>,
	"'Igor Druzhinin'" <igor.druzhinin@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com> <009d01d6e598$bfdd0110$3f970330$@xen.org> <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com> <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org> <33322763-6810-3bfc-9573-1e326b38293e@suse.com> <00b001d6e7f9$80937a30$81ba6e90$@xen.org> <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org> <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
In-Reply-To: <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
Subject: RE: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
Date: Mon, 11 Jan 2021 09:20:51 -0000
Message-ID: <00b201d6e7fb$0ecc83e0$2c658ba0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIZObzvX1fStk6d0If1Grmzp4ChNQKH77KyAjM4vxoA8ianTwIvmyEuAapfz8YBmnsfowGbd8zyqTeXv8A=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 11 January 2021 09:16
> To: paul@xen.org
> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; roger.pau@citrix.com; xen-
> devel@lists.xenproject.org; 'Igor Druzhinin' <igor.druzhinin@citrix.com>
> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
> 
> On 11.01.2021 10:12, Paul Durrant wrote:
> >> From: Paul Durrant <xadimgnik@gmail.com>
> >> Sent: 11 January 2021 09:10
> >>
> >>> From: Jan Beulich <jbeulich@suse.com>
> >>> Sent: 11 January 2021 09:00
> >>>
> >>> On 11.01.2021 09:45, Paul Durrant wrote:
> >>>> You can add my R-b to the patch.
> >>>
> >>> That's the unchanged patch then, including the libxl change that
> >>> I had asked about and that I have to admit I don't fully follow
> >>> Igor's responses? I'm hesitant to give an ack for that aspect of
> >>> the change, yet I suppose the libxl maintainers will defer to
> >>> x86 ones there. Alternatively Andrew or Roger could of course
> >>> ack this ...
> >>>
> >>
> >> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
> >> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
> >> that's enough.
> >
> > ... although adding an option in xl/libxl isn't that much work, I suppose.
> >
> > Igor, would you be ok plumbing it through?
> 
> This back and forth leaves unclear to me what I should do. I
> would have asked on irc, but you're not there as it seems.

No, VPN issues make use of IRC painful I'm afraid. Let's see what Igor says.

  Paul

> 
> Jan


