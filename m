Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B99A76769
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932582.1334691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFop-0003Ta-Pg; Mon, 31 Mar 2025 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932582.1334691; Mon, 31 Mar 2025 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFop-0003R1-Kb; Mon, 31 Mar 2025 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 932582;
 Mon, 31 Mar 2025 14:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCWu=WS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzFoo-0002y4-BL
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:08:50 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa104eb2-0e39-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 16:08:47 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so3857153f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 07:08:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588dbsm11213738f8f.2.2025.03.31.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 07:08:46 -0700 (PDT)
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
X-Inumbo-ID: aa104eb2-0e39-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743430127; x=1744034927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FGxObq2IxN5p9SAmnNwbMDrvj9l8oAk8lHYVy4oyLZM=;
        b=mlB9RDkCzQPrlS8fwEg1R5qLrpfsLN4p/mbjkGk8uW/LXeJuBcIFWLvSAIyeHUkHsO
         HPlAPAmtbqT5bPigssH19wHXpmGdgoL+t+flZwxeDk6fO4rmkxWrsFk7eRA5Jd4mJBgG
         Fs5xZg4Gd89mnLbR73311vRsvGGj7wkezm0oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430127; x=1744034927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGxObq2IxN5p9SAmnNwbMDrvj9l8oAk8lHYVy4oyLZM=;
        b=XwTJ7p/+NnaKVhryrYePPUpawwQ2XHLJbCE3XCOyZQ+rqwN8RP94y6RPEkvglBbb/L
         3mmqZ9lAOi3rxz7ALnbEVtqyFSNRsSjYYE3+tYFE0l3JJDu5/k7nAIHzmJpgAls/7Q26
         fo/BIeWd1N2DWL2E1tzL4swintIb7L2dmVRqaVGAxwK09/pE5hSkl919YKT6gzlkHILu
         aYkop6smkosHVX6SpZjgroKmDzM9JmTsJCkLfUqmCiXWeY6zaSFPegTbC5PampBRy52O
         ag/fJo+8TSgE2z7xp6f13uwjO9AFSbEe2UXHy7SJKDBNR9w9givs7umqqHjzS4xwywlx
         sy+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9g3b0THEWqt18BwJSB4zqpPvvHKHrPd5/8bq+49pUkkEhPxAqDsn4GCoKNUVYpp/jc6/MoncJ0iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7vK2ywZVgikyiNL+nd2UlFEH7RKiQ/nM7W6kUZ05KoByfd8zh
	zuD6vPPKJ15f1lIeEz+wZ4g17qVhKElFeUoL+ZNm2PFhyaa/qC5BHznKXEL0B/Q=
X-Gm-Gg: ASbGnct/kTXhNh+hLU2ZJRkWTkSujTTe3CEuBksdVzoXtySOs2BBv56uhdOi/1mB37K
	L7HBZfW7uaJUloolJbfGerfSCVN9AszDDPfnJ/KktT3fFSBEK8cWWvML2VnHeeOBXkPXasN/MNq
	h7oVfnA+FDVanaPnFS54tU3cj3Kd5K6DQonr7MMfJZ/CLzW16d2IpZiam4ahSaJBGQHUVlP0Im2
	UJeyNS48zoz1uej8e8k4PJMXDDCbxbYS5FoL3UyqTCt6ijMbIz2w8mrguYc4O65v1FK6pi2vhXf
	8dUaQyKS778G0nisOoaV/41TnM0Z7JThUy6bx+rl5/75kbMCaDHKJx5D+WFiofCTS18pIr3N2dp
	M5cLzTAvUGtdTinmfXrHS
X-Google-Smtp-Source: AGHT+IGB2F+S/hviiytix45DOKQIf1F/WyGdr4X7YnxUqJGbh2BaAxZ2jRpeVAULLNkn6R7nBpbpBQ==
X-Received: by 2002:a05:6000:2d10:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-39c1211501fmr5131646f8f.44.1743430127325;
        Mon, 31 Mar 2025 07:08:47 -0700 (PDT)
Message-ID: <cb5e2b75-b212-4a9b-b4ef-c5960b32a7e3@citrix.com>
Date: Mon, 31 Mar 2025 15:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] xen: Remove __{BIG,LITTLE}_ENDIAN_BITFIELD
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-3-andrew.cooper3@citrix.com>
 <88971ebb-6a58-4d7e-b7e6-2db9b78fa341@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <88971ebb-6a58-4d7e-b7e6-2db9b78fa341@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 8:42 am, Jan Beulich wrote:
> On 28.03.2025 14:44, Andrew Cooper wrote:
>> There is a singular user.  It's unlikely we'll gain a big-endian build of Xen,
>> but it's far more unlikely that bitfields will differ from main endianness.
> Just one point: While endian-ness in general is dictated by hardware, endian-
> ness of bitfields is entirely a psABI thing, aiui. Hence tying both together
> (beyond the latter defaulting to the former) doesn't seem quite appropriate
> to me.
>
>> I'm tempted to simply drop the logic in maptrack_node.  If any big-endian
>> build of Xen came along, that's probably the least of it's worries.
> As long as it's not obviously broken, I'd prefer to keep such. While it may
> not be a primary worry, it's still one less of all the worries then.

Given the way patch 3 has ended up, this is easier to keep than in
earlier revisions.

Still, I think it's of very dubious utility.

~Andrew

