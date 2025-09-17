Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A713B7FC9B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125205.1467215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysrZ-0006ei-T3; Wed, 17 Sep 2025 14:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125205.1467215; Wed, 17 Sep 2025 14:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysrZ-0006cS-QU; Wed, 17 Sep 2025 14:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1125205;
 Wed, 17 Sep 2025 14:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uysrX-0006cM-Tg
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 14:10:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a61e514-93d0-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 16:10:18 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3e98c5adbbeso2002152f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 07:10:18 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a3aa1c54sm16948400a12.50.2025.09.17.07.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 07:10:17 -0700 (PDT)
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
X-Inumbo-ID: 0a61e514-93d0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758118218; x=1758723018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/BX4olgEIXCsLtqILeXjW50qgehf+5wie1lr1W3osI=;
        b=MXfFpM/+CSOohGysWZI9pGV/cJDL1bV9944oe5ch/tbl+I0Qp/0TQ7S4j6UpQnfUh2
         /phyPveMKHHUacm/D9b5+h/tyIxPCcYcNogkmGQJ8xcRCcryvFYOdx4DvZ+Pdy29i5/z
         Xdaii884CwUfgkElvbBtRpq+27O+eR48HdNmyCJnR8dgjrlO/vbSzhKK/h9ciZLbWzRb
         FrsZ/5rejDjijsazfeUIQq2JPF7RaQdMElzKUnSmULp5fbYFvghoO55T61yp3PU+1wkc
         Xb526Cx35iFihJPxRX+3dcVpl7sWVYZK8EHAOV4DXFcxW+Y5igBsxE4FG9oPocSt0O50
         fePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118218; x=1758723018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/BX4olgEIXCsLtqILeXjW50qgehf+5wie1lr1W3osI=;
        b=llI5JHLTXtNb67ejJm6xQFG0m5NxzLD4sUkFw4V9LN024RLIDgk1R0EpJ0uxQsGxrv
         GOac5rqkxc0UvDfUq90yXpCQe2yDRboYPgTn4Nys1FsWJaJHae1YbX8CQsprRUmKPKUl
         39pVv/q0HAvy5LcseITwGur207Smw64QIlAd4Jd8VF39kZHWEBydODD/WUD6uMnLNazW
         b6jlX/0Lf5BScgPwvJCRU5n/S5Wkk+/wiEPIwUjd2FmZtYwK2YPN5yo2waaxFBGm0Pel
         gus/DJMAzTFcIWbPtrQ2bt4bEKpN3yxO35i8TFFo4cRFxk0aAP05YfePb9HdDoOnm2Rm
         A0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXMl31lsxlYPoQdc+Fh+Y8a0vmOg+WGtN94R430jrhP2daFIWJsY74RPm5k+hcrjc7DKg04Dp/AySs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwjB0nswN5GRL6vAz86SELc6Rw7zfha68x4j9CAzl6TYo4mls2
	QBQhPC3YnatlA7GS1sAn22KxZzZHHiRhSbyHq/lUtZvkc6WdzkuT0kwnh7HNahuIQA==
X-Gm-Gg: ASbGncs1ntHeJjzP32E5fjyjTMiRO6ZmmxSZvly7nMaGMVTyU3vyux8hNXdiR6Sbcz9
	WYeR4Z8TlZbX/Q4ghRerzSZ3KfBh0hxIBryrQ6B/88lXionAdd4IPOL3LWJ6oMwSOJslERqPq4n
	Hne0wNRRau/4IU4LY8+oieazkXD85g5VLDLl7Oq6xnIUbR+/gQaNG0W2FcqKaAQ0HVkEXRRg+VM
	u0itpaHXtNnb1vCBorc76LTeNKUyVLiDDEZOQd1k8Al3PLZV3AQk0ivMNyrtUyEwqAxoy0u8nkR
	KO23FpB8AV+/knyLEGtLqHEsHsjFhL8dl9S1tSP/k/SH+m4mMrRjloxUCBrkm9176vH6/1nA1fD
	I0+cUMGR779OViGYQXvYf7n1barb+5U4=
X-Google-Smtp-Source: AGHT+IEdIuLLanJMxKWnT+klcFEmrgjTFDfZABsFQ5u3fwzd2xSk1kktZ18knYjByxGt7Zw7j6/ekA==
X-Received: by 2002:a05:6000:4008:b0:3e2:fd26:10f0 with SMTP id ffacd0b85a97d-3ecdf9b88b6mr2164632f8f.11.1758118218004;
        Wed, 17 Sep 2025 07:10:18 -0700 (PDT)
Message-ID: <cd9da45c-9603-47a2-9518-172531a02c31@suse.com>
Date: Wed, 17 Sep 2025 16:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: introduce DOMID_ANY
To: Andrew Cooper <andrew@xen.org>, dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250916173702.871508-2-dmukhin@ford.com>
 <9e5c0735-1024-4d44-b1bd-1a8909ce2c37@suse.com>
 <71e80d9a-0210-490c-a3b0-6b370a18145f@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <71e80d9a-0210-490c-a3b0-6b370a18145f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 22:51, Andrew Cooper wrote:
> On 16/09/2025 1:05 pm, Jan Beulich wrote:
>> On 16.09.2025 19:37, dmukhin@xen.org wrote:
>>> --- a/xen/include/public/xen.h
>>> +++ b/xen/include/public/xen.h
>>> @@ -608,6 +608,9 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>>>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>>>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>>>  
>>> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
>> Considering this is an implementation detail of the hypervisor, ...
>>
>>> +#define DOMID_ANY            DOMID_INVALID
>> ... I don't think this should go in a public header.
> 
> Except we want it for the toolstack to use, as part of preventing 0
> being a magic number to XEN_DOMCTL_createdomain.

Where would the toolstack want to use it? Domain creation? And why 0
(which isn't DOMID_INVALID / DOMID_ANY)?

In any event, if exposure to the tool stack is wanted, then yes, this
wants to stay here, but guarded by a __XEN__ || __XEN_TOOLS__ check
like we do elsewhere.

Jan

