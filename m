Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27019938FA4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761942.1172010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsk2-0004nx-E3; Mon, 22 Jul 2024 13:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761942.1172010; Mon, 22 Jul 2024 13:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVsk2-0004lh-BM; Mon, 22 Jul 2024 13:06:14 +0000
Received: by outflank-mailman (input) for mailman id 761942;
 Mon, 22 Jul 2024 13:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVsk0-0004kL-KN
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:06:12 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c303bd-482b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 15:06:09 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eefe705510so48999311fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:06:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c7d32e6sm6102137a12.84.2024.07.22.06.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:06:08 -0700 (PDT)
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
X-Inumbo-ID: 29c303bd-482b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721653569; x=1722258369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pE4/l7qbbob/UpFsaDfWF81AsDgiFOJVYzZ7Spjnv64=;
        b=E+LprUp3iKvcQcbD7cDfZv7At6+3wOhFSF95hIehzhBCKsnBC1Uxd94Pch/Oh8ersf
         Eb8iONuJUoMfvTxGzVCgl7Pc8dE7INQCpE36EBEJcNATp54kvoOTceSrxNkweVy4bW4u
         cGtHlnCNu6bEIIHVIDgZNOdCiilIdAdyUQnmW5c7W7a37h6mNYNKT5ETpvqn1C2EtVez
         Bd3iyuwICh4GMhrAffy6K+J1KFDK6uG1MMXQ1E2niWu93ed8eUqwmORz0MB0i++1HMDD
         pxLJ80p5OvhdxIIG9U7qlp3nnG/vrn/3QWq2EFXS3CLte9KIU5sRZ63dEakKZ4enz/xG
         2PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653569; x=1722258369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pE4/l7qbbob/UpFsaDfWF81AsDgiFOJVYzZ7Spjnv64=;
        b=hZROkY+8XKH/fRVs3HOAqayXxTPOz0n4l9mX0Hmtjs3aV7F+NChTFWTU2kOP0KNK8W
         ga0ecnUVl6vN5BUP5zyZL1dbJgW3byLnFr9IXiyNUv6+Eu7fL26klp8+Misa4hsuangJ
         gkQKel0FmjMYfD3ZHJ4eIRYnBhQegn2pdXj4ceTEpvOyNGdoAQz4Eo6ZoUcE2PqBGZ33
         C5nAsSaSfsQUrJVcOFWHXcgaVqMVHMF29UgFZ81quWJsrgdIOZsJECIAT4rvD1X/LNj1
         R3Z9sBzEuiOnBFxIOI+peUfWPR//wMDO16uDyXZedXF4nx3Qq36oSqElroGmumbjlV3o
         XtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Fs55QWhmeFmN8HxwXW+UdInnxyeBIRlaVj1RfMT0FihE6CAr9Ru30/OJhqpnG3qIrLbfrIi3sTe+OP9RWoRDjKQ7YEgxozhhkaEk9r4=
X-Gm-Message-State: AOJu0YykNRtsnjb6uciOQ9MMwMJU43drG5PpnnEeonpNQNSlxdcxahCG
	QyLVeAxzEQVCi0YQxTRcQcnlOUjrvlavbcNF3O8kzn25fcHadSIBZ6gFVLaTdQ==
X-Google-Smtp-Source: AGHT+IGFXGO1z3faH3dZzDNlLT3+ak27ZV7RmWDuhy1LqET+13vTWfwCWCtJydlPNQl4rR75z97p6Q==
X-Received: by 2002:a2e:a989:0:b0:2ef:2593:334d with SMTP id 38308e7fff4ca-2ef25933587mr36545561fa.47.1721653568817;
        Mon, 22 Jul 2024 06:06:08 -0700 (PDT)
Message-ID: <b9a9f515-71c6-4219-8493-df890da7fcb4@suse.com>
Date: Mon, 22 Jul 2024 15:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 186932: regressions - FAIL
To: Anthony PERARD <anthony@xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <osstest-186932-mainreport@xen.org>
 <39d87a30-7722-45ec-bc13-11111eb46483@suse.com> <Zp5YpOt42lATLwQX@l14>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <Zp5YpOt42lATLwQX@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 15:03, Anthony PERARD wrote:
> On Mon, Jul 22, 2024 at 09:05:43AM +0200, Jan Beulich wrote:
>> On 22.07.2024 06:56, osstest service owner wrote:
>>> flight 186932 linux-linus real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/186932/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 186827
>>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 186827
>>
>> There looks to be a basic problem as of flight 186925, yet a brief look at one
>> of the logs doesn't really give any hint other than the system perhaps simply
>> being slow. Ideas, anyone?
> 
> Well, yes, it's really slow to reach having a running ssh server. If I
> let the machine boot, there's two reason in the log for the long time:
> 
> Jul 22 11:44:25.216867 Waiting for /dev to be fully populated...Timed out for waiting the udev queue being empty.
> Jul 22 11:46:25.469002 done (timeout).
> 
> Jul 22 11:46:29.103350 Configuring network interfaces...
> Jul 22 11:46:32.127350 ^@Timed out for waiting the udev queue being empty.

Yet both of these instances of timing out look suspiciously like a regression
(in or caused by the kernel)?

Jan

> Jul 22 11:48:29.256918 [  403.298102] NET: Registered PF_INET6 protocol family
> ... more network kernel info after that.
> Jul 22 11:48:33.204921 Waiting for xenbr0 to get ready (MAXWAIT is 2 seconds).
> Jul 22 11:48:33.204984 done.
> 
> (on previous run, "configuring network interface" is followed by
> "waiting for xenbr0")
> 
> 
> So, we lost already 4 min waiting, out of a budget of 7min for full
> reboot.
> 
> Also, "reboot" doesn't work with this newer kernel, the machine prints
> "Will now restart." then nothing happen.
> 
> I have also try without Xen, it's the same behavior.
> 
> Cheers,
> 


