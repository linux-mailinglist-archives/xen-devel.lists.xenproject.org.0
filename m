Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A321ECE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 19:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88337.166039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFcA-0001gv-6X; Mon, 22 Feb 2021 18:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88337.166039; Mon, 22 Feb 2021 18:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFcA-0001gU-2N; Mon, 22 Feb 2021 18:07:22 +0000
Received: by outflank-mailman (input) for mailman id 88337;
 Mon, 22 Feb 2021 18:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTf3=HY=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lEFc8-0001gP-6t
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 18:07:20 +0000
Received: from mail-pj1-x1031.google.com (unknown [2607:f8b0:4864:20::1031])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c56a066-11b3-4420-a818-37e6be53eb9b;
 Mon, 22 Feb 2021 18:07:19 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id d2so74145pjs.4
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 10:07:19 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id ga17sm81844pjb.7.2021.02.22.10.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 10:07:18 -0800 (PST)
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
X-Inumbo-ID: 9c56a066-11b3-4420-a818-37e6be53eb9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=33j1yZ2ahtKC/KNwknKm+XfvSDIpc6r4Koeq0CEeQqY=;
        b=EXkDaw/IP2+37adqcu0nnIfJjt1XnNKSu9friC7LZnR3rO5KAPRwSuEUe+8Rs0d2CG
         4ZzoCnlFCpJvGfpZ7eCS4p788sPXS2fafzejytEkQATJCEIGKi9Wep1u4BEEXQ3QgMh1
         A90yrxZG98vrUKsA2X4+vFJAEGZPcxLuDvywzdHMheYRNrkPngrJ/5pgptmp4XHXYSx1
         sFKox9RbmYkGn2fInBT2zapB5loc1A+j6A1bynOSS5rCuyz5KPyGZ6AAEHfpws75u/iq
         LIjGD7L6lxr725OwU/KdK/x4S3T7dWQowrYatCngaEb/owJC99Q0b+B6zEYUFWdmbGou
         WmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=33j1yZ2ahtKC/KNwknKm+XfvSDIpc6r4Koeq0CEeQqY=;
        b=DkEOh562BaAlmWID1dqd2GJCcEzqR7/QX81VmLdKQZv5RoeMoevkZK2zaZQ9xLqkZX
         xNZ1dlpZZdsFY9z8rf3hrhzQ1VZRPQTVpipv6EkLJv3bGJuhN5wly80tR/ZoAT/HDm6P
         1vhgeMRitiyPujudYDKKSlzUEwjpekgB4rPHhe3xE3axZ+jkPO+g+6EDYX1fXn51vkxd
         nR9PGxbl+WPOFbKkT25KSM0By0PqnPFHozXOTWH6lg72JYsUZH1D5/iuiTz84AXiBNr2
         wUCZmUj6vhIGSZ6e+/cFQcKBO8McEOBSf6p4cRqnolFkRorazONDygTadwIb4LgJ/1v1
         WKew==
X-Gm-Message-State: AOAM530bSFOll6N+9Ml2ijyMVO/eCKvf1G5gD8OZtYYhgmZKUza5Q4VG
	hGE52KsHU1w/N5xtk3Xc2js=
X-Google-Smtp-Source: ABdhPJwflyeD5qZuFjKo+t39goJJO/FOLErRnI52zJ4do+cWqYMU3VPKFDtK0qRdmT56Fav8AFjYFQ==
X-Received: by 2002:a17:902:8204:b029:e3:b425:762e with SMTP id x4-20020a1709028204b02900e3b425762emr20548485pln.13.1614017238855;
        Mon, 22 Feb 2021 10:07:18 -0800 (PST)
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Olivier Lambert <olivier.lambert@vates.fr>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Message-ID: <9a58bdf7-3a34-1b81-aec9-b14da463d75e@gmail.com>
Date: Mon, 22 Feb 2021 10:04:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hey all,

I just wanted to request more feedback on this series and put it on the radar, while acknowledging
that I'm sure given the recent code freeze it is a busy time for everybody.

Best,
Bob

