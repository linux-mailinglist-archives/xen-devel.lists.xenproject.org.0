Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304DA3C32E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893124.1302055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkliA-0004VN-HG; Wed, 19 Feb 2025 15:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893124.1302055; Wed, 19 Feb 2025 15:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkliA-0004UI-E9; Wed, 19 Feb 2025 15:10:06 +0000
Received: by outflank-mailman (input) for mailman id 893124;
 Wed, 19 Feb 2025 15:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkli8-00048S-8r
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:10:04 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 971c18c0-eed3-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:10:01 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-545316f80beso3838878e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:10:01 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545304defb0sm1543957e87.6.2025.02.19.07.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:10:00 -0800 (PST)
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
X-Inumbo-ID: 971c18c0-eed3-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739977801; x=1740582601; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV+iLjtQoPiHWdI11LiSzY9mdu10N+iNs7QPJ5g+5no=;
        b=bsM2tahhyQvWDUA3QZHDyO1wSy8YMQA1GpIZmt9LYV2obtfWIB2TslWkv6MAZOmTJI
         8JshEllUxJK35e/791d3tLaI6Adp034b3aq/PaqHuJ933thEg1BsbCcRL/wbw6wGfB9K
         I2Xg0dAX2eIhpAelQoTECZNkz6C1y5zRvzpKi04Zt1JJAbRZFluAk4g7yCpp9NUFJjRF
         Df9Ce3nX39quUaZw3hsZ9l5tCLaPgL6dzkvIrcgQVrixHK0HQYII3kmI0aAt/O5L8wU3
         GgpQxC6cXB3ufWWbI+lFJGRrNXrvLqW9tKOmR4wEWiuDX88bfc0AGgvHAc/3Gluy53gA
         o1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977801; x=1740582601;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cV+iLjtQoPiHWdI11LiSzY9mdu10N+iNs7QPJ5g+5no=;
        b=r8XhLurALnzIhowLmIYGSFMXFHS4bYakOPX2rc8oKY/AEcNKKw1Z5MutHeun6snD30
         wkC2hk2MCj/O9UX8/A1UepjN6DRd5bB+BoS+gKYrDvIPfHlFrL6dcW/QPomlcRLAJ73J
         XrX8fTSiXfGxpJDq1DWplbCIQv5Jo2Ni5GvTjrPhRo40lfXut2Y3/8A5D6PYWvq95iaj
         eCIaveswh6MiBPb7xm0U+ZZrlLXrZmbAjbByuICX92bh4pSAFCK5LlHY+uWPFL8jMFX6
         SUOZ54n5R4dImQy+97wXagJ/nkLOTbZQ+95yVgCjS0ifrg1yzoEVRt0Mrdd3ghQfv3WR
         2X/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLHDzBotBnKD37fRkcCKGgHITLNVHeDXb7Lf0kiOM0nngxul5pC5d6+KzudcC0A7A3pf9dcvNGaSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUi1v+o77ZEGvH0+kjGlk6dY9uP23pbvxUr0R9ZhU+bwo+E7tQ
	9jHr+BUM20KJ4w9JqDioVBJ2DhuiTAobq7PLJESz23lzwjsuw5I5
X-Gm-Gg: ASbGncvfjhipBCstFL60tkUVXnjNb5L1Zd6cbUNbJGXX+PmQTv8MBLQDvgNr2BsR3f5
	RfPxHd6S6ZkA1XTLXdyOnZF/X5YzhlcjbCfchQuT/YHE/LwAj3rn/91rFszyN5jzgRLey/nMRgF
	jd/E4uXQ+gzbeaka6xXdJgLR/QCVYbLRPxlaStb3VY6Rc69GXMyG/LzJ0+1LZSjZsyPWYQ2aZfr
	5QceaNUjPQvIuYLakQWSvP9u4JvfYJFmROUMt/8Uf9zbunUrpdSbiGB5Z7o7r0G25Di6E6E2G2A
	ccxDlX1sLodSVfAkeh6Pu9af
X-Google-Smtp-Source: AGHT+IErzFERwBFSkTc/W5KJ+FtIKMRnNiynlXDG+qA939cwvcWYuEPiU24qbUoj70hfbE08WjOYww==
X-Received: by 2002:a05:6512:2398:b0:545:59f:47a6 with SMTP id 2adb3069b0e04-5452fe2eb14mr6507791e87.22.1739977800605;
        Wed, 19 Feb 2025 07:10:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------75hjluwMocpQXT3GpWyCI3yD"
Message-ID: <c7004601-a10d-4a82-9bb6-7cebf4eff08a@gmail.com>
Date: Wed, 19 Feb 2025 16:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <38093d9843afbba9dda7326ee6e8cc3c99343cf6.1739363240.git.oleksii.kurochko@gmail.com>
 <2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com>
 <d398d595-74b3-424a-bab9-992653cdca95@gmail.com>
 <701e841d-6dd7-45a8-b56b-c67dd04dd3a5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <701e841d-6dd7-45a8-b56b-c67dd04dd3a5@suse.com>

This is a multi-part message in MIME format.
--------------75hjluwMocpQXT3GpWyCI3yD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/19/25 4:05 PM, Jan Beulich wrote:
> On 19.02.2025 15:46, Oleksii Kurochko wrote:
>> On 2/19/25 12:28 PM, Jan Beulich wrote:
>>> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>>>> +    else
>>>>        {
>>>> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>>>> -        if ( rc == XEN_TABLE_MAP_NOMEM )
>>>> +        pte_t *table;
>>>> +        unsigned int level = HYP_PT_ROOT_LEVEL;
>>>> +        /* convenience aliases */
>>> Nit: Style.
>>   From the 'Comments' section of CODING_STYLE, I see that the comment should start
>> with capital letter. Do you mean that?
> In the (earlier) reply to "xen/riscv: identify specific ISA supported by cpu"
> I said precisely that. I didn't think I'd need to repeat it here. So yes.

Of course, it was enough. The problem was that I started to read and answer to this patch
series first and went to another (where you wrote that) one after.

Anyway thank you for clarifying.

~ Oleksii

--------------75hjluwMocpQXT3GpWyCI3yD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/19/25 4:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:701e841d-6dd7-45a8-b56b-c67dd04dd3a5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.02.2025 15:46, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 2/19/25 12:28 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 12.02.2025 17:50, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    else
      {
-        rc = pt_next_level(alloc_tbl, &amp;table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        pte_t *table;
+        unsigned int level = HYP_PT_ROOT_LEVEL;
+        /* convenience aliases */
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: Style.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
 From the 'Comments' section of CODING_STYLE, I see that the comment should start
with capital letter. Do you mean that?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In the (earlier) reply to "xen/riscv: identify specific ISA supported by cpu"
I said precisely that. I didn't think I'd need to repeat it here. So yes.</pre>
    </blockquote>
    <pre>Of course, it was enough. The problem was that I started to read and answer to this patch
series first and went to another (where you wrote that) one after.

Anyway thank you for clarifying.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:701e841d-6dd7-45a8-b56b-c67dd04dd3a5@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------75hjluwMocpQXT3GpWyCI3yD--

