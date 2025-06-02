Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD12ACAD39
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003229.1382730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Or-0005T9-PR; Mon, 02 Jun 2025 11:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003229.1382730; Mon, 02 Jun 2025 11:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Or-0005Q5-MT; Mon, 02 Jun 2025 11:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1003229;
 Mon, 02 Jun 2025 11:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM3Or-0005Pz-37
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:32:17 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b648af-3fa5-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:32:11 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5533c562608so3034583e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 04:32:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa25besm117437555e9.14.2025.06.02.04.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 04:32:00 -0700 (PDT)
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
X-Inumbo-ID: 39b648af-3fa5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748863931; x=1749468731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rTsOX+udqNxI/5fhKLImuGMnxGdWhWIRzg4v6yd1PN4=;
        b=EXkVISriaiqQ5G0jKarJJPU8/gjoH/0kBDW3KeBq9wZ3LBSMqXYxwvWWwEKWj8hvqr
         hcDI9CPz2gUlJYffw6Mdnc9D09QFYy0KGrFykh2G14IKy/jhPCl5jARlRPkr6nV/QJ1G
         qXlFBCpSKDjCPpYbk/+OGd6nDZUCq+9npW2OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748863931; x=1749468731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTsOX+udqNxI/5fhKLImuGMnxGdWhWIRzg4v6yd1PN4=;
        b=Ea94treCIUrkGaLw9xFppWdM2Rxs0amJRyd7vdRdJJXtGVZVHPft5ji6zFXdMc9CqO
         9j7s4bJ0VkAwVnYeO3cDSU410GcOZ9qklZU5AXrKZw5np/5uZVr9oDg6rvPOukRfAPpJ
         IIA8hZ9FG3a85f/+SOkR7wQMQIb5CKaplKGNK3sVgTXmecN/y+ZP5KxGvH4hcJjjNrdK
         IYfZk5nTFRfIo7ctfLTQ2seBpWfmuGqr3HGfOd0yx9e8nv8sUUxhL6si2D6k6e0j0utn
         Sgjs7cau1S2ePtNmsyGJQaMVc8j07oZU/hb69mzZJWenrR8+/yGP56uJN74xD224g0s/
         GA9g==
X-Gm-Message-State: AOJu0Yy249WFWvGQaiy9L9+FD3xdH1QKs+K8LgHfHFrsww96FKEbmOuJ
	KtCA8gVXrtU9hITMBXloVawziZR7szMsBBL86CBJeyzCGDXxtBsKieybO6Lbrb7/hnEnwAInZLS
	NOnlC
X-Gm-Gg: ASbGncvGRIl7VCQ26XDg6tJGWTwCNLcctPxXfxQJwreFpWmU1Zpy1G8+dw0CRkO2FdX
	tr91PNI8OxGc8LcqSXbbJNZiU2saga2idLOruzIvhLsp4YXjIXy33Y6YbWb3c4chZSFRpl7Wd9a
	SnfmCLXo/1LdVLEgYwYeFAOS0+x2o1C1GqmQ6QUQ5mdT0auedWa047AhwkwiK6Iyy7HbRaZ63AG
	SI5zIpeN7qZz4LKoTGoHcGkso3dqQBuKjl2/b/GaHgTFiY29vNZBLX460/GiQuN+qB2y4ktFSC9
	aNnyGN57v/c8F85eLR6TxdTXo6T0i1GNWOJilX1jRTU44Fpbk5Vh4GUVNIQpyvwsSihHQbH5q73
	uw5oFn0eWgCSUuuts
X-Google-Smtp-Source: AGHT+IHJ0vrFtipV3bhdiTI54MJYxlgcbCjwWWTW4o78zfgD4ViZkePmHjJ8z9feLzX6f3DvWYDFbQ==
X-Received: by 2002:a05:600c:1910:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-450d880ce23mr110309655e9.14.1748863920602;
        Mon, 02 Jun 2025 04:32:00 -0700 (PDT)
Message-ID: <ae5a5de4-22ce-443b-a88d-16b89b28ac11@citrix.com>
Date: Mon, 2 Jun 2025 12:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert tools/python part of "tools: remove support for
 running a guest with qemu-traditional"
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
 <aD2KpLtC257hlUj8@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aD2KpLtC257hlUj8@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 12:27 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 02, 2025 at 12:22:53PM +0100, Andrew Cooper wrote:
>> The migration stream is a stable ABI.  What this does is break the ability to
>> inspection and operate on pre-Xen-4.21 streams.
> Do you mean Xen 4.21 should be able to accept migration of a domU with
> qemu trad? I don't think it's a desirable feature...

xl is free to reject a qemu-trad stream if it wants.

What's not ok is verify-stream-v2 exploding with "unknown emulator 1"
when I ask it to tell me what the bytes in this stream mean.

~Andrew

