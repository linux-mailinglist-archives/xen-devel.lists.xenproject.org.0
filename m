Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0BDAC90F2
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001218.1381419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0KX-0005I4-Lu; Fri, 30 May 2025 14:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001218.1381419; Fri, 30 May 2025 14:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0KX-0005FJ-IT; Fri, 30 May 2025 14:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1001218;
 Fri, 30 May 2025 14:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJNC=YO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uL0KW-0005FC-2G
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:03:28 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbad9021-3d5e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:03:27 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4c6c0a9c7so1366308f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 07:03:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d8012b09sm18715585e9.37.2025.05.30.07.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 07:03:15 -0700 (PDT)
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
X-Inumbo-ID: dbad9021-3d5e-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748613806; x=1749218606; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwoWV4YWQnhRonAsr2ZbQBGENx07n89BubpTlvVFG/0=;
        b=Cvjjwkh7v7Fkng0IoPR1ZmnKYRgjbonvjl2Eh7OP1KCRfN46ZE7Ax5+OSr5oRqwIkj
         nzC5lRvzFlFdhz6xUUxMrUJMNYpHOnmAcXAdb7oanpfJGD8BBfsO5kkY3Khq6nKWz12D
         tYQ+rMUbUI0lnYWxKCsA3YFJodTgt4wtPwpQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748613806; x=1749218606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwoWV4YWQnhRonAsr2ZbQBGENx07n89BubpTlvVFG/0=;
        b=tnFBVT8N5jmNxPUG3y5VCxdsv2I4FjmEm/QygXDxgpa9ET9U8NyM/p6kIJDzrjQwTL
         fam0IqbyxJObjG52Hq9t0vWF9mfzqsuQjtbezwCFVVEa/lstpi6VhwJi7zRS7ZPiWNPe
         UMV+xQ/VZQWOwIfY1De6NHKwH3uyUR+SSfJbpfiQobOm291j6jtc3g6Jy8lc25gZkYxf
         VLK2RKmAYRpmIdKYWP3yNYMkqHMWk4l62Iet6agFXkItnHHfNn+ypxBHRwTIZfzrl34k
         kUiRp7wH9lNOuCuXQvFAeNWzFDUVrqPq/5oHGrqA1/NLVNVk9/J+9LwnTfVsrvMHSpxS
         Zfdw==
X-Gm-Message-State: AOJu0Yya9R0QGyNowuYxeMJIgtn6PMXi8BBXRMp/0UphYRTz//8kOobw
	AgQHj5UjOTmHgxwQ6cyNxl3xbKUdAJINaD4e6q/oZh3YnOXfT40U2R4UVS7yb6xkhX2aHJCI3oj
	XjKpO
X-Gm-Gg: ASbGncvgrraQGWLK+zkAkofl8mDxI2K9OwTxx5oPxD4lPungWsID7LSzfPSRKcxVUSE
	wKjpZdXz5BT2ejSOHPy+Fw3AZIxOjcSjfd4muJUjGVlHlyrmObQjWitfjXweHGgGpa3DpTgcEk6
	t6dwgBl4l0qZGmFCIrRZVHOvdGYWgh/VoadDE+ZLFQ9HhOiF1KuajZ06Mt9GvBdMh0LrbPJwDNG
	OVKvA2DkEgklnjUdqEaZJo0DCVN8w6is1LNq9ZpxmSoo5zbIErF8QQf68J/aUU8kJtTA7acRu8v
	80h9syF+xyFZet20r9t+hubGG1Ein+jRI6/FniK0w8ArQQC/WPPUQwx0WRAmL9n34294mkh9DlA
	mQcVbdEpIbftniLzs7gHBlZC7
X-Google-Smtp-Source: AGHT+IFT7L+seHHQAf7Y5KFqVx7ZUGM54eSERjkDhRBxFY8sP+0s25jQ8CrpWtr6ui5qZw0emV8zIw==
X-Received: by 2002:a05:6000:2886:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3a4f89e8f63mr2027206f8f.51.1748613795492;
        Fri, 30 May 2025 07:03:15 -0700 (PDT)
Date: Fri, 30 May 2025 16:03:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/tests: Add install target for vPCI
Message-ID: <aDm6ooBjmFtUCqjI@macbook.local>
References: <20250530104307.2550886-1-andrew.cooper3@citrix.com>
 <aDmPDlE2ZWDYg2wm@macbook.local>
 <2912f117-a898-41dd-9e1f-2723728a2237@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2912f117-a898-41dd-9e1f-2723728a2237@citrix.com>

On Fri, May 30, 2025 at 01:29:49PM +0100, Andrew Cooper wrote:
> On 30/05/2025 11:57 am, Roger Pau Monné wrote:
> > On Fri, May 30, 2025 at 11:43:07AM +0100, Andrew Cooper wrote:
> >> This lets it run automagically in CI.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >
> > I had sent something similar long time ago:
> >
> > https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/
> >
> > But got no reviews.
> >
> > Thanks, Roger.
> 
> Sorry, that fell through the cracks too.
> 
> What I'll do if you're happy is submit it as authored by you but with
> this content (seeing as it's the one I've tested in the past week), and
> A-by me.

Oh, no worries about authorship, you can just commit this one really.

Thanks, Roger.

