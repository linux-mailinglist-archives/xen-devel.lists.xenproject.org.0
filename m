Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEE931918
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 19:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759217.1168841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTPKL-0006z0-Cw; Mon, 15 Jul 2024 17:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759217.1168841; Mon, 15 Jul 2024 17:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTPKL-0006x3-A0; Mon, 15 Jul 2024 17:17:29 +0000
Received: by outflank-mailman (input) for mailman id 759217;
 Mon, 15 Jul 2024 17:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTPKJ-0006wx-5S
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 17:17:27 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a13e7d5-42ce-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 19:17:24 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79f190d8ebfso263788485a.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 10:17:24 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a160c6f54asm218076785a.121.2024.07.15.10.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 10:17:22 -0700 (PDT)
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
X-Inumbo-ID: 1a13e7d5-42ce-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721063843; x=1721668643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hSMeIAIsSAsWysAgG5KOa0+7KQ+RbdOmBwF42aMVp6M=;
        b=TYYQxwGvBsFAMpA2f5ZDZYbJnM3stkKtbXCMBAY35ZLRUvFh7T8a7N5SHsQaQ2JijH
         SOTgw6wm8WGR8mKssOm7tU8Re3d4Vvyj2wYT6nGej6Kmqz2DlL4kXKDgwctoHIKIYwl6
         E4TYmTgc41CiOIYcnyIiljWXDj6kDSj4sY+A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721063843; x=1721668643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSMeIAIsSAsWysAgG5KOa0+7KQ+RbdOmBwF42aMVp6M=;
        b=v4m9jvqX6z60VLdmuBqlbDinsXYZD4pE03NJlpblEES1eDkj2P2z3T3Z7LlR/A6p6L
         5HUtdRgpZAi0Ga4jTHRNnQSXKbfnrbsvEFjzcTJLtjUffBtsf+cW101gd91wbt9Byg/i
         G4STmQWyy52kyyEsWkejD8a1LjgvX4JpXfMn5bxLUCd1M3VeZNjq+cTHulC2FDhKwiAE
         EUcbFvBTrCJybfy0nC8xWJ9ZH7GfJ1PCSvkJQaRExxIESteAt11qPWuaMu5qEAxXnI9Y
         qu1vDeQtFVD91JcvJK87GtBjs9ppU9UlBnemUR4Ti7IujO5whQlQ9amlFMHVdhrnmetZ
         xDEQ==
X-Gm-Message-State: AOJu0Yxy6lI7r9ITJySjOQjQTWBON4c3PjPM+5+bSdphBBSXdY3jXKzl
	T2+FcvsJYS6NxRXeZETQ8VNBf9cGT9I6lkSjabh5x9HPax+TzY3hthlYgd8YBEHBJeGXUGIQfu7
	P
X-Google-Smtp-Source: AGHT+IGCBE//5KXnPhIEEZEevGQHRtwmhvnym3R2aRiDCzhnR8bXApI3eLyppjlzy1f+Wg689P1lQA==
X-Received: by 2002:a05:620a:4484:b0:79f:22e:94a6 with SMTP id af79cd13be357-7a179f3fbf6mr49373685a.23.1721063843465;
        Mon, 15 Jul 2024 10:17:23 -0700 (PDT)
Message-ID: <ad921dec-ca2e-4a0d-b63e-810cab985faa@citrix.com>
Date: Mon, 15 Jul 2024 18:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/12] tools/examples: Remove more obsolete content
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240715151640.3374005-1-andrew.cooper3@citrix.com> <ZpVUGYOHHekE+zMh@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpVUGYOHHekE+zMh@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2024 5:53 pm, Anthony PERARD wrote:
> On Mon, Jul 15, 2024 at 04:16:40PM +0100, Andrew Cooper wrote:
>> xeninfo.pl was introduced in commit 1b0a8bb57e3e ("Added xeninfo.pl, a script
>> for collecting statistics from Xen hosts using the Xen-API") and has been
>> touched exactly twice since to remove hardcoded IP addresses and paths.
> Xen-API, is that xapi?

Yes.  xapi is a contraction of Xen-API, but even the docs intermix the
two names.  https://xapi-project.github.io/xen-api/

>
>> The configuration files in vnc/* date from when we had a vendered version of
>> Qemu living in the tree.
> I guess QEMU at that time didn't have VNC support? Because looks like
> the vnc config was supposed to be put in a guest, and `xm` had support
> for it.

Thinking about it, this may have been for PV guests instead.  We used to
have a mode in XenServer to inject vnc configuration into a PV guest in
order to get a GUI installer rather than the TUI one.

Either way, xl doesn't have --vnc, although it does have -V which seems
to have subsumed this functionality.


>
>> These have never (AFAICT) been wired into the `make install` rule.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Anyway, patch looks good:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

~Andrew

