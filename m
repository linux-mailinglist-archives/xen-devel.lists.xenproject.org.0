Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5D81A17F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658098.1027147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxvz-0003iG-MI; Wed, 20 Dec 2023 14:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658098.1027147; Wed, 20 Dec 2023 14:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxvz-0003fZ-JO; Wed, 20 Dec 2023 14:52:31 +0000
Received: by outflank-mailman (input) for mailman id 658098;
 Wed, 20 Dec 2023 14:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHJo=H7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rFxvy-0003KA-IY
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:52:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66028f44-9f47-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 15:52:30 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c236624edso62738525e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:52:30 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b0040c58e410a3sm7815235wmn.14.2023.12.20.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:52:28 -0800 (PST)
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
X-Inumbo-ID: 66028f44-9f47-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703083949; x=1703688749; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibG6vmzkWlhTmqyuSp3GHp8mv5e6cQE5qos9D6b1g9M=;
        b=r85qXKvVzNeehHIjWsn5ldrrh/AS731ceM+5vW/HDLT88HZOG0B37LeCsmQ3TozkG7
         u72eL6ky2ZGbMp36OJiueL/9Bg+94dGnkpsWniiZM0m7lo+TlS+UKKCdN8bYP2mXOMDg
         vjWaK4NlCe8snEipsuKIiV8OPp7YbYAMbVBbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703083949; x=1703688749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibG6vmzkWlhTmqyuSp3GHp8mv5e6cQE5qos9D6b1g9M=;
        b=E6hrp07DC5FrW5ifO7UY/3uJ5dq9IKF0NOTm7QF+ccNaSLziqFlHitcUXAzEwdWEpk
         MdticsSlRLy3en48c9Pn0CFKrXHAYfGNoTWX4ziuj/sRIrGOEaor9+Znvoz7+HDJBwhQ
         XrOtmkvgds7VHcPRSqESeOIDvaTT5w0JQ1K7c5g7P8jVZC9zX0i3v3Mdv6X8JbRd4/YB
         mp5VYxMAUJx5V7S/2zgRR9HHV/90x1Q3NR02LeYxh/S1/7AJD/HMjMiKxVW8ILkwMtbY
         iEz1EUh31pboaJqieoxKcNR9aqSk878ouJYsKDy+dBKtG97TgvKmU4yceZVU7MZmNWJi
         JI/Q==
X-Gm-Message-State: AOJu0Yy/NBLX4D2i211/f1/nfkZc++l6Kwzi3cHIubG4O3npTn4CCGZm
	wgWxS4+69rekM9ZLE4QXTQruLQ==
X-Google-Smtp-Source: AGHT+IHra2LBpOzjyYRCLwOYefyNfnE3n7jHzwLXNvsHQ3CXBTrecv1U4UzTfEHyz9BCJfNhE8JaKg==
X-Received: by 2002:a7b:c849:0:b0:40c:a5d:860d with SMTP id c9-20020a7bc849000000b0040c0a5d860dmr10259294wml.169.1703083949322;
        Wed, 20 Dec 2023 06:52:29 -0800 (PST)
Date: Wed, 20 Dec 2023 14:52:27 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Xu <peterx@redhat.com>
Cc: Steven Sistare <steven.sistare@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH V8 00/12] fix migration of suspended runstate
Message-ID: <04583cf1-8172-49be-81b0-adb88d6f9808@perard>
References: <1702481421-375368-1-git-send-email-steven.sistare@oracle.com>
 <a9ddc1b2-d4fc-44de-857b-2aeb35fa0925@oracle.com>
 <ZX_VS_KDsoiL9T2X@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZX_VS_KDsoiL9T2X@x1n>

On Mon, Dec 18, 2023 at 01:14:51PM +0800, Peter Xu wrote:
> On Wed, Dec 13, 2023 at 10:35:33AM -0500, Steven Sistare wrote:
> > Hi Peter, all have RB's, with all i's dotted and t's crossed - steve
> 
> Yes this seems to be more migration related so maybe good candidate for a
> pull from migration submodule.
> 
> But since this is still solving a generic issue, I'm copying a few more
> people from get_maintainers.pl that this series touches, just in case
> they'll have something to say before dev cycle starts.

I did a quick smoke test of migrating a Xen guest. It works fine for me.

Thanks,

-- 
Anthony PERARD

