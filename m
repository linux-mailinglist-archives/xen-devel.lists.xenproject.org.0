Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD83AF708B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031955.1405701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHJX-00073R-H1; Thu, 03 Jul 2025 10:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031955.1405701; Thu, 03 Jul 2025 10:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHJX-00070K-EF; Thu, 03 Jul 2025 10:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1031955;
 Thu, 03 Jul 2025 10:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXHJW-00070E-3u
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:37:10 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a62e8503-57f9-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:36:59 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so4311232f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:36:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59736sm18239983f8f.74.2025.07.03.03.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:36:58 -0700 (PDT)
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
X-Inumbo-ID: a62e8503-57f9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751539019; x=1752143819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+077bGJoYaQwSPqU2t7mjWzaHvBT1/6TDFNG+Ena2VI=;
        b=Rs9CwGia5lhylJc/QffQ/0LYUB8xOxpb6ZZafiksg84ujPtMAwgpAsOLnh4xrzh955
         pDF/Lp8uLuOmjtU+PDRuntlS3MFZyqhEtZJQaUNAYf2FUn9PcIL8Anq94ivM1KooJvQE
         E69pvHMDH+fzGrjqDJkzXiPvqL1pl8+Q7agZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539019; x=1752143819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+077bGJoYaQwSPqU2t7mjWzaHvBT1/6TDFNG+Ena2VI=;
        b=YfS8cxK7tLhedsSRpFkHw1nNGSDVvL3m9ATmm82Wur9cprUAOdl7TubfbHoXcQSOvk
         Fi1rVRmfEpfDg7QbUfNsna9Fh3FQFc8epdeG2ojXxd88XRqCaqm9eGL29anDQMVN2tmx
         XbAYTobzQYxN/UtfZkIHQQjPzpoviHvrp5GENIR7MJgIT1ypSJ/MgKdgmyGqJabaz4Ww
         rM8cVW/aPpXHzYZPQXyex8beiZFZ2sjEbIdAJaN1ovJMOufP37GSyVV2omiSwhpo5N9y
         Yyu8oTuqtLD7dkkNP5OyNM1JP4KQTb2l9OYBdY6EoW2wyDPvmChfjR8GzXgoATh9r94L
         Kcfw==
X-Forwarded-Encrypted: i=1; AJvYcCX9WyLt2io/lBROr06tckwtWtG4dGeam22QYpBRNMFYLCj/6TBaU6H0CvDDqUaKnf3/JDfSuJWOF5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwviQ58fWXAdFavlATVdiUeWBx1Mh6qJAoCP7yDemsro7phUS7j
	zilf5q3SwaPGiwOn4LoNIDBFFrpG0n8cmrGRYGtqgSqeSAvoqWVm/hgz6TT24uOg808=
X-Gm-Gg: ASbGnctUh2mMfkrcJflFVC+NSOqulO9WwA35lVIAYV/FhChFOAQg++wk0vzlRNNNnHo
	dCWMFERTIy8TzOI5w72ui3DFJ1rEbga9tP2Y6BBnU26UkzwGQ0Tt9SiBz6s2EGETKjcGxPS5hv8
	8iYE200zhBKJXVV/62pMUcq9PA7MygDpn7yaHV6b0UEAZJRowlVVpfOItbGxW7M8Gq3G243mcgl
	L5I6wrZFzqhPsT0Wi41xOdHTCmIrdVmUqyYO2HL+Bi2oWCaiPtQaJpKnC9ogblaVg1dHGPhbzv5
	dAPOKDx0hUVCcRNocNIvD2x/rwy5X2R7hlo9lQIlXERZwKtw5Jbxl3G4Ff9slukbr1NqchNthUB
	FXk713Z2Q6a3v1i/ugCXi7dWguC4=
X-Google-Smtp-Source: AGHT+IGrU4SQhzGSVvfUk/9rE119ZpqEpRTnwr+VdzJDCN2Gx+sb7x3JVu0VNqlBJixklOe2JT0zEA==
X-Received: by 2002:a5d:5e88:0:b0:3a9:16d5:cacc with SMTP id ffacd0b85a97d-3b32f666188mr2023141f8f.49.1751539018955;
        Thu, 03 Jul 2025 03:36:58 -0700 (PDT)
Message-ID: <56566ac7-7bc7-4908-a755-5e9a9071f096@citrix.com>
Date: Thu, 3 Jul 2025 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into
 arch_pend_softirq()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <7789a13c-04ba-4ad4-8df0-59fe82512e40@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7789a13c-04ba-4ad4-8df0-59fe82512e40@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 9:11 am, Jan Beulich wrote:
> On 02.07.2025 16:41, Andrew Cooper wrote:
>> x86 is the only architecture wanting an optimisation here, but the
>> test_and_set_bit() is a store into the monitored line
> Which is intentional aiui, while this reads as if this was part of the issue.

I don't understand what you're trying to say.

It is racy, and that's why we're changing it.

>> and is racy with determining whether an IPI can be skipped.
> Racy here as in limiting the effect of the optimization, but not affecting
> correctness aiui: If the woken CPU managed to clear the bit already, we'd
> needlessly IPI it.

Correct.

>  This could also do with saying.

What about this?

x86 is the only architecture wanting an optimisation here, but the
test_and_set_bit() is a store into the monitored line (i.e. will wake up
the target) and, prior to the removal of the broken IPI-elision
algorithm, was racy, causing unnecessary IPIs to be sent.

To do this in a race-free way, the store to the monited line needs to
also sample the status of the target in one atomic action.  Implement a
new arch helper with different semantics; to make the softirq pending
and decide about IPIs together.  For now, implement the default helper. 
It will be overridden by x86 in a subsequent change.

~Andrew

