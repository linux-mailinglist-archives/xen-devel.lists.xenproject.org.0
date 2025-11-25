Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18389C8372F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171601.1496621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmOm-00027u-0k; Tue, 25 Nov 2025 06:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171601.1496621; Tue, 25 Nov 2025 06:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmOl-00025p-UL; Tue, 25 Nov 2025 06:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1171601;
 Tue, 25 Nov 2025 06:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmOk-0001QO-9d
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:19:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e5019f-c9c6-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:19:32 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477770019e4so43564845e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:19:32 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4eb2sm230183655e9.12.2025.11.24.22.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:19:31 -0800 (PST)
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
X-Inumbo-ID: b4e5019f-c9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051572; x=1764656372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayCvkqAvPPz9n6xMxwdSlHGHuKgh4PUChBb7KqLIT+Q=;
        b=p0dbO1kVBgtpcjIj4eBIPUDl+uQbnZSyFkllKabbqXcog/SSCV2VMmaveGzkwfY+GG
         my8avQCKBySLHwAH3nK8CJHRj5JuD8drH0fidBkBymSyFG4b5w/gnFdhnWZVwhPhgVxy
         tmGpH03eiSXARuS4dlDH7X/ivyaBOFc+lYGiF/bZud9aFX5z60+H50PFYj4ixMft16oh
         iTgKihCUTzMvASOL905sUyLHPxO/FoBwrecE79sHNM5NS8KL61ToplfEPmG+3FzPz9Dt
         +jL1yQpEFIbdKc+VkLRoY1lPi9CRJv7+LwuGCLvO/pSN05ZweteTcQ11ni/eR8PN70rR
         Cbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051572; x=1764656372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayCvkqAvPPz9n6xMxwdSlHGHuKgh4PUChBb7KqLIT+Q=;
        b=Nsvj5GqwsPjgzXN1mGEXuBZhXciMScXwpWUaLr1OyjnWuDeEbEMAaygvmEL8ToPUgE
         0sQs8xlAu40jqywUCVvIUZDXuTs7yrnbKzDWWpn3zL0BWeerMLbzhnijv0JorqB6BlSD
         NGQ4ApDBfh6rfD/3xSpX+npid352iz3ooR44AdilEhM98H8tyUhrLcY7WfbGjw+GCMJR
         6bZrJ7pfTkXr/8Rhv9FYsIyJkTSfKAzpOvYpwWRbikMHyMB4v7l/AZ8wSdGU2o4tJrrs
         u/8CZoumtXqEaUue88rWnAYc/b5xHoy8CfSujvlqFYCC2+aYX6ud93CcaoyAwwGEBe6v
         CDXA==
X-Forwarded-Encrypted: i=1; AJvYcCWQqDpSKW35ZfJTiqglHR+2xI0FpI9rVcJv92+6mRNHG5XFL1zVQWyS4lMZYJJXvxsow9T4bl/9rsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgVYVowxTCDwQHw4SlRQ4TP1oD+h8hKkVPebwTpiubTC4pIe0G
	UJBuI4wa1/TPTFkotVyFrDROWX+4HKbij/QJQQ2fYpR2VkTJOODvCX4iSgZ21sP0o4E=
X-Gm-Gg: ASbGncuDbUZ5l4dpcpr/PeUadQlImfwi+d9JDhVrWkKK8TJpiIG8KQ1Qb7CqQf3AtIk
	BulbbOK4qF+0E7CJwFVLfu+6WTXXKd5LzClD7G1SMmhNn8BH3Dr8kBtz2Di677OlSFzxHXzMvp7
	s1obf3/7oLCZe9Mzpq+bqYPQhh7wgQRcnEtIf96H0lViPHhpbMiiBgD3d3pCr7HbF/M05LeSElr
	zUox+1YemueF2Y1iVeGE3VbrK+Q7DiMMCnkjaWc+ioUJ51sUTb6Spoekp84ECWsLrR/9eMe3MtU
	lc0H8dtyp5M+G9b3zV/1jaDK9Ttq+9RFrezttGoPnjuzHHsafP28KymMPRURLB/q1ERi59hV+yE
	ysRasU4zeG/yGvFgNKZOCXK7oQ7zXwy5SCRDIAuwSaS3LLy+aDv9WndWqRsOWQSCmShV0rOp99n
	Mf0JUR68CIqCzYQf8tW5j5qO+h1ep3Q8x6E2xZ5qwYVJAVztHhrv+PxA==
X-Google-Smtp-Source: AGHT+IGCGhdbHAxDlOenXxyfRDqxklvPY0q7ajM0L7BLu8g1ZJkCYTA/gCYbTbb1g7QtxJ0wSEDH8Q==
X-Received: by 2002:a05:600c:8b37:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47904b1ab30mr12611775e9.16.1764051571921;
        Mon, 24 Nov 2025 22:19:31 -0800 (PST)
Message-ID: <786d2523-7e15-4a41-afef-ee97adcc414a@linaro.org>
Date: Tue, 25 Nov 2025 07:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] net/tap: Use error_setg_file_open() for a better
 error message
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-9-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-9-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      tap: open vhost char device failed
> 
> to
> 
>      Could not open '/dev/vhost-net': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> We could put back the "tap: " prefix with error_prepend().  Not
> worth the bother.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   net/tap.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


