Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F050D4562F5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227573.393629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmWu-0006fM-H9; Thu, 18 Nov 2021 18:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227573.393629; Thu, 18 Nov 2021 18:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmWu-0006dB-E3; Thu, 18 Nov 2021 18:53:04 +0000
Received: by outflank-mailman (input) for mailman id 227573;
 Thu, 18 Nov 2021 18:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezFO=QF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mnmWs-0006d5-Jm
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:53:02 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12dd5bf-48a0-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 19:53:01 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id u1so13422134wru.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 10:53:01 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599?
 ([2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599])
 by smtp.gmail.com with ESMTPSA id z8sm662323wrh.54.2021.11.18.10.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:53:00 -0800 (PST)
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
X-Inumbo-ID: c12dd5bf-48a0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+/z/+p3MB4VD85Cgq5R8YOH64O5nYkn+Jf+PXXgbrdQ=;
        b=JVzxHwdc7i61sfgZKUFmRkD6+s5sb1FcB/zviWblE+8R+d5q29Dao4Y2YztqOkYi63
         RduHA1YqvULw5vPnyEhFwtHAB8B5rJ5MuUps2+hHtvl2Mf5OncKhQqdN66wv2qHLv64H
         /5SBXtZ7Jwgla9F3YU8vbf/iuAn0+sOeXBRDuZxzr9ujwjIxiJQawr91N/hgi5I1jVHC
         51vXvyPjtkvrbCrDHx6I014u3SqYtB71JaJUgfOUSGDzh4dhrck1iDWJTjPQGy5l+xt9
         cnsWGLuBNEAYhdGjdzcwedynoArBkeRNaURn/WiRUiVEpgGLrNSSrHUneQ4Kw2HcZoh3
         cusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+/z/+p3MB4VD85Cgq5R8YOH64O5nYkn+Jf+PXXgbrdQ=;
        b=WqFWnyXRhRwLMA5hZhffFtRvbaEkxlc5q/ZhAzSCC3vRov4NOhxfC2DK96mIlNG92k
         UKp3ZnZNjoRcEGV8FJ2FqCEt7Z8sLd0nsSQWgIQgKEJ/rZaY+DD+gm0AmTYKCnLwhrkL
         pDGd8OJ7DEXEhi6ulop+0y0RublxYyaf2iSHzv30g4FURfvbaIMK4/+n53Fu65+WagT4
         qd8IUujCJozO5pdpaoQpJ4pOvq5TSE2Lm5L6EolzeSFPNzupR5JlCW5RV0fqwo5O711u
         A4NkS82x7a++/1mnHZCIEIje8U2bdEX55XjGUj1vLV15fYJGEaxc5IZuTCJhgkIOm2xu
         4PMw==
X-Gm-Message-State: AOAM5306xMnGKGNYwyZYKs64u3TUPoFE+zeCbB9VOwcQaK1JqxnsQQq7
	DOwUUuD7bZ/3iDwiE2acOVw=
X-Google-Smtp-Source: ABdhPJx6ywYUfZFyx4XoCGFG/U4N36nmAK9oqsHWeE0lOvs2gr0cauPSqVBv2ee/mknhfDLXVL6ioA==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr32715077wrs.46.1637261581263;
        Thu, 18 Nov 2021 10:53:01 -0800 (PST)
Message-ID: <c1dbbf5f-c0ac-af17-af4a-b1b93f90310c@gmail.com>
Date: Thu, 18 Nov 2021 18:52:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86/hvm: Remove callback from paging->flush_tlb() hook
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211117182603.20057-1-andrew.cooper3@citrix.com>
 <df71b9a1-9aed-d0ce-ecf1-2addc69511d1@suse.com>
 <439464d3-43fe-58a1-521b-0cc4eed02d08@srcf.net>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <439464d3-43fe-58a1-521b-0cc4eed02d08@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/11/2021 11:19, Andrew Cooper wrote:
> On 18/11/2021 10:45, Jan Beulich wrote:
>> On 17.11.2021 19:26, Andrew Cooper wrote:
>>> TLB flushing is a hotpath, and function pointer calls are
>>> expensive (especially under repoline) for what amounts to an identity
>>> transform on the data.  Just pass the vcpu_bitmap bitmap directly.
>>>
>>> As we use NULL for all rather than none, introduce a flush_vcpu() helper to
>>> avoid the risk of logical errors from opencoding the expression.  This also
>>> means the viridian callers can avoid writing an all-ones bitmap for the
>>> flushing logic to consume.
>> I think you want to clarify that you convert only one of the two ways of
>> specifying "all". The other (HV_GENERIC_SET_ALL as consumed by
>> hv_vpset_to_vpmask()) could also be converted, but this would be a bit
>> more involved. I have no idea which of the two Windows would typically
>> use, nor why there are two mechanisms in the first place.
> 
> Oh - I'd not spotted that path.  It is well hidden away from
> HV_FLUSH_ALL_PROCESSORS.
> 
> Giving how windows APIs typically evolve,
> HVCALL_FLUSH_VIRTUAL_ADDRESS_{SPACE,LIST} where first.  It has a limit
> of 64 vCPUs, and the VpSet sparse form is clearly catering to massive
> numbers of vCPUs.
> 
> I'd expect to see both paths used, so we ought to see about optimising
> that too, in due course.
> 

In my experience, yes, it only uses the sparse version if you have more 
than 64 vCPUs.

   Paul

>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> ~Andrew
> 


