Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569CA426E6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 16:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895255.1303847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmakv-0001Bc-H3; Mon, 24 Feb 2025 15:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895255.1303847; Mon, 24 Feb 2025 15:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmakv-00018y-Dp; Mon, 24 Feb 2025 15:52:29 +0000
Received: by outflank-mailman (input) for mailman id 895255;
 Mon, 24 Feb 2025 15:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jZ5=VP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tmakt-00018g-NG
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 15:52:27 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57c9462d-f2c7-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 16:52:25 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30795988ebeso47023801fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 07:52:25 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3097b6584efsm28968321fa.33.2025.02.24.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 07:52:24 -0800 (PST)
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
X-Inumbo-ID: 57c9462d-f2c7-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740412345; x=1741017145; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSqNlAdf74SRz9/hHoi9wrYyt0SMOFIqfnmRVufJzMQ=;
        b=ZkIwF6GjmnUuWTUscAVvaDm15caHgMbikbWprIzkp30Fds3a9ewLZ9oGWELf46pfXW
         c3qjjYEu6Cwf2Lkp8u3yWz14NQunn0gFaFKzmOQ83Qgi0d+i6+Q8/lp2dPjUC83Yv2ye
         nPGWLGoXQkeN3W6EskM+e2cilLzVT+AaSHYGCtUiKhh1yvt1GmCxpzPE4M7D1+tAyqny
         8yvP4Kwy+3H4/1pC089YfEysdQ/9GDgmmMoweodemETVudp6yxXEVE0ZGmKWNZOxZZur
         BVOMlp3jECWL9qXVbP1oJXtavIKMIz26Fftrt9GU6c0KJM6EE4LdSWfcipXw+pKFu1eS
         RzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740412345; x=1741017145;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSqNlAdf74SRz9/hHoi9wrYyt0SMOFIqfnmRVufJzMQ=;
        b=cFAMMMfEeymjQWrbzzublh0ewCJxoIb+fOeBkCieABjACoHjRkSE2fMr0YPn2bB4Fp
         Yht+NsFc859FMta4uWHt1s34R/75Ia25FLJv+03vApULpG5ENy2HFZeqFqczt5rAtBQg
         684A9SCzgmYpy0rsX9z2DNIbgig819ifk5zD1briLoOc//wlwF3exi4gMaQht7BWlUTi
         GGusmZireNtfg8VJjfmx7IwXhj4mYnaiocbXumNRq6P/Vt6PortRmt8/a5nnMPnQQ9rm
         VC7goKNghtheVT+C9oGNOFTq+SHL6hFSUIcpHTy3h9IWSgiQ1fpdBSJV7+oORRsvIeDi
         7bcg==
X-Forwarded-Encrypted: i=1; AJvYcCWEtZjXpOWv6tYyBH1O5uAmAGcveaO5O6y4w5JNd5NPeYovrsBCXbOARtEx93zwGdP0JHAcFDtichI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn8MOAy30z2QjmswYK8nH1MM61FjOXCI7co04yU7r0WE7WTtMQ
	XOJ7eElbJXcYbgyo1SLOTjPe/TRWchKMeuK6UEg+D5VWd2skOWZM
X-Gm-Gg: ASbGncu5Bc7XfLAzMa51BV5OFQVWZ3g6wKaUqcl9hU+zLb71AFCfdfdJWli4F4AqrFc
	uDyPUtdzu4M5z04PMFNfSHJkIeqe5ACip2MOm9NmNh59HHmyj4Qc/NA676Y1kLQf3AhzKqFMTPH
	z3ersObgAk3Iy16roxleTtNacI5fjucNNHazMkud53g4o+2W7VH9Hn6PEi2owqQu/dXIg9asFbG
	oaxjVN+7U0yc+NMzwcExMx/aFZQdAwDTpUv5ebvBTr0Vwn5UD+XrbKhR6jYcxwM3dwiNUNOXFrQ
	SWWDKpc5wYnvrORoox1BfwtDO5wgH+FL9As=
X-Google-Smtp-Source: AGHT+IEwarcDw+CjTpVBBMJgs8s2lbNE3gJkXM0LmzxLa90xuXydaQT4MMoXtEzu6ER5kEjIuOa2Tw==
X-Received: by 2002:a2e:9593:0:b0:302:497a:9e5b with SMTP id 38308e7fff4ca-30a59883021mr41141411fa.2.1740412345063;
        Mon, 24 Feb 2025 07:52:25 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------XBS7VL4Jxb8dStefJvY82SVc"
Message-ID: <b0d36a7c-6f7c-4c90-b1d7-a3d4c0543649@gmail.com>
Date: Mon, 24 Feb 2025 16:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 0.5/4] xen/README: add compiler and binutils
 versions for RISCV-64
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <5d71d27f7393753d549c73ab2e5639acc2260df8.1740071755.git.oleksii.kurochko@gmail.com>
 <da6639c9-479c-40a1-80f5-fe93d5947326@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <da6639c9-479c-40a1-80f5-fe93d5947326@suse.com>

This is a multi-part message in MIME format.
--------------XBS7VL4Jxb8dStefJvY82SVc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/25 11:57 AM, Jan Beulich wrote:
> On 21.02.2025 18:02, Oleksii Kurochko wrote:
>> Set the baseline for the compiler and binutils to >=12.2 for GCC and
>>> =2.39 for GNU binutils, as Xen's GitLab CI will use the Debian 12
>> container for RISCV-64 testing. Therefore, these versions are expected
>> to be the minimum supported versions.
> It's not the container that dictates the minimum version, but the issues
> with older versions. Those want naming here instead.

I will add this information too. (I thought it would be enough to have that
in the patch where debian11 container is dropped)

Thanks.

~ Oleksii

--------------XBS7VL4Jxb8dStefJvY82SVc
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
    <div class="moz-cite-prefix">On 2/24/25 11:57 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:da6639c9-479c-40a1-80f5-fe93d5947326@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.02.2025 18:02, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Set the baseline for the compiler and binutils to &gt;=12.2 for GCC and
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">=2.39 for GNU binutils, as Xen's GitLab CI will use the Debian 12
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">container for RISCV-64 testing. Therefore, these versions are expected
to be the minimum supported versions.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's not the container that dictates the minimum version, but the issues
with older versions. Those want naming here instead.</pre>
    </blockquote>
    <pre>I will add this information too. (I thought it would be enough to have that
in the patch where debian11 container is dropped)

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------XBS7VL4Jxb8dStefJvY82SVc--

