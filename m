Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53EB56965
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 15:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123873.1466574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxn1K-0004AT-CC; Sun, 14 Sep 2025 13:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123873.1466574; Sun, 14 Sep 2025 13:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxn1K-00047y-7q; Sun, 14 Sep 2025 13:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1123873;
 Sun, 14 Sep 2025 13:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uxn1I-00047s-3w
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 13:43:56 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da7ce60a-9170-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 15:43:53 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3dae49b117bso2605853f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 06:43:53 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32df2bf49b1sm3496242a91.1.2025.09.14.06.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 06:43:52 -0700 (PDT)
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
X-Inumbo-ID: da7ce60a-9170-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757857433; x=1758462233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKoCnE6l414VKWhPoxHQvdoC8TQFdArRiHZZAzXuJPk=;
        b=bELoh1HYrEJysdvtTamp7M3keFdZzG3mzzIy0WD5Mep3V4n95EtObpFbOmlFpOsxvx
         xPvNixZxxyYgFqDuyGCR3HTue7t1Rlbkd20GEEAx/ukXA4OGqj+sf5M7PxmrmUrnuqXn
         uBNzH6uVZl2HcCpyWI5nFS1O0LPCRQKZogTlbN4QqdwnrDNvuiVU0alRgtuf3+fyetzA
         bKeU6kjj2Q5Snlc9TrXEsEZqQJTc43aCrjrVaQ5FNVDWS2/kyJJumIQkWGrXG5+qgyiN
         bEYdGX95UFWUr2jkMvxPV1dglAzh08qCLtr2z9/RlPZSHLBKqFAsKKrzlmtLsSCjOT5S
         XorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857433; x=1758462233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKoCnE6l414VKWhPoxHQvdoC8TQFdArRiHZZAzXuJPk=;
        b=USzWEfdSnlObuvsdx7K2ROcUnM66ZX2O80MKhxKvzEeWoff/Ecls34yV4ZViGl0xuF
         kuqFsESrDntu3H0a1fYnDnxJkZOFBYQOtXub+7lJfO9g04mRze25F7UQdq3KIWg+Fcvg
         fZ0yu7mnNBzXLjxxUWnWxqPn2glK3We5TROfZv2RRHtxi/qGJPEVLFg6MAF6d8ABJflt
         2gkcHU5ZY8HxkNuRaCJpz6J2cj9Q4xZNp5QmBbv5P7cwOZ+kwLEsWLqL+LtLVNqBgWg4
         gbNDfjcAht4PPPEBcs5DUENeqS+N8D2kkrNOJWtQG1cH9N+uX9xancFDz8KL07cI0ocQ
         85Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVDqH2onW8bkbeFzM0m6xydfpvYy5uBt/dct0rstqQnCVEdBrxnxMrVj5TETyjEcVtoJ6m9KvEOluE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOoyYWs5Hwgy33q92pRQXnxpPDm4orNudiXp4XYfML+Iom3BJ0
	qdkylXAQLBGzRBStnllna+uaQk4TMJWrxnTImm9XfZ5gF8jwRiRdmk5bIDSGMuCGlA==
X-Gm-Gg: ASbGncvZvPtpeHMo3WiW3vfCzyJVwp6L7Qrcfrp+Le7md8hR1CZNsOLEMux6vqYc3tN
	rhNIlZ1J6rGZenpw8YpQAS1Acx/IJ/Lf6AxsVy/35EIWR+RxX8CH8OhuGIANUL7kGgpfQqsjlxD
	gouSCQa5r8rODKEHZm5e19hx7qjY6hxHeG1KhlFvPIZLRdcqLvKvnPbUm7ZVQK9c6O5fnaiwZmZ
	+FMgyOVfvGrc1sDgJuzPYZIOJw35ORAQVsuxLWD1aTAhZo4UScIInozuG7Jg9OMIV8mPFN0KH1d
	YzrGcGToJ3PMYvtQOkOMzb3DEknVCjKPLNRHtX898QBCMo3zDCVmOW3RBCEoiE18WUFPEbXbY/o
	Z4QcbgI25oqtE5mFjSvUpOzM/nU3uVArh4WqVeEe8kA==
X-Google-Smtp-Source: AGHT+IHddcuDiwmhwy8tIym6TxHFInfVIoVq9M2Ao0l5IdkMBZYzrYZf2oHFbrZS+nN14BhNvtlIEQ==
X-Received: by 2002:a05:6000:208a:b0:3d7:eb95:b1e1 with SMTP id ffacd0b85a97d-3e7659eb4admr5824405f8f.32.1757857433167;
        Sun, 14 Sep 2025 06:43:53 -0700 (PDT)
Message-ID: <b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com>
Date: Sun, 14 Sep 2025 15:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] releases: use newer compression methods for tarballs
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
 <53d760ad-c58d-4d3f-bd66-598b4a95a8ff@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <53d760ad-c58d-4d3f-bd66-598b4a95a8ff@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2025 23:23, Julien Grall wrote:
> On 11/09/2025 09:14, Jan Beulich wrote:
>> Other projects have long switched to xz and/or lzip.
>>
>> Tidy things some as well: With the removal of qemu from the tarball,
>> intermediately extracting the tarball again has become wasteful. Drop
>> that. Invoke compressors using asynchronous lists, to reduce overall
>> latency. Drop the -v option from the (previously implicit) gzip
>> invocation.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I have tested manually the steps and the correct tarballs have been 
> produced. I will update my scripts to copy & sign all the tarballs once 
> this is merged.
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> Tested-by: Julien Grall <jgrall@amazon.com>

Thanks.

> Is this intended for Xen 4.21?

So far it was, but I'm increasingly unsure, seeing that it still hasn't
gone in. Cc-ing Oleksii too now. Andrew had voiced concern towards the
rm use, but hasn't come back as to his argument towards the uncompressed
tarball previously not having been removed (when I can't see that one
would have been created in the first place), hence why I couldn't make
use of his (conditional) R-b.

Jan

