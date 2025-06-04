Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E0ACE11F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005676.1385103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpv3-0002My-G9; Wed, 04 Jun 2025 15:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005676.1385103; Wed, 04 Jun 2025 15:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpv3-0002Jx-D5; Wed, 04 Jun 2025 15:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1005676;
 Wed, 04 Jun 2025 15:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/urA=YT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMpv1-0002Jr-KR
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:20:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7add5135-4157-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:20:42 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so76323795e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:20:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm199613815e9.9.2025.06.04.08.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:20:41 -0700 (PDT)
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
X-Inumbo-ID: 7add5135-4157-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749050442; x=1749655242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OM10Z5QIzo2xd5+skjriv/42PaEeMYCQ1FffggO6aJA=;
        b=awt4e/3k7bYfZkPF52w7peW28tb5AQBXIv9bVePcJG27lmrke+Dbm4P3b2PV0L4Ga+
         B3fLBdR5aFihEWqRorH573/gKXk3OBSftevYGGFszIkrVcoxkHQSu8FdsEuyOr5E90+E
         b0yn6LvgsmfkB4oK+JsLZRdtzydg3E7RLxo9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050442; x=1749655242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM10Z5QIzo2xd5+skjriv/42PaEeMYCQ1FffggO6aJA=;
        b=P90WQHwsodCuyUtdbbyLr031C1os+NYag8PpZt3PIqUfZvR6xEuBBT3Tv8aw1YBgYq
         hEuP5cd/2jGXMNRzwYXBv8iJqpgxLUjeHQTzPWwTdEL/NM6JYwr/eUZ9d5zRqaSwu5GV
         QTPTNViYEJVsGbcnsdGZPEJS6hffUiVz16CokTxJY/B5E/VyesJ36DtcrdfHpD2SXES7
         TJ710kVEYad3NAPh/ktfOAsBb4/e2Y3mAeJ6yRBSBcokBC5E6E9UzjQaUkP4+ScrWWTT
         N7jgypReRn09XlRbCPpAuibIPJUkn0KzUbIlVScKMiegKIE2o9T0HnXhyARPEzLJ5K2c
         Br5g==
X-Forwarded-Encrypted: i=1; AJvYcCXygMBFDtsOZiUWY/FQL1sx9x+RqVfMm2/ntyg6trDe1OQob59TmEJjnzFTua/wYviVlgHUFCCb8/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbydnXo//sKwjRTTtxrn8rgEXAc3WUkJdikwb3Ni6x17k70Ulv
	wkFilrhYnG+Aws0UxUmsiU6RsuU8rOWaPIBsiMhpTytz33c/mIMvR4udxcgPUiH/3l0=
X-Gm-Gg: ASbGncvxEX95H10TNq7pEh6B2ehy7YZlu1SXm7QO2cpNGhc/kMzq0l0YAOuvQqXAFsQ
	WEqq4X0PicaM3/1B04F3Uk0ARSE03evEORYHaM1QISfhZdRTnMfraXjJvztrfRTB2JQrAlUVYFh
	5btYWktNg/oUh7j3e0GwEveRRbPD5H6HZ1QY2BoQvpSyhiQITt+xurdsf2HaKrdZEsrocFHkK+p
	UBS+x/1o9KNdMcX8C3bgLJUW5R8VRab2LpiLo9onc5XXgOeuZGbIReX8OzXUGGQwwQsnmsSyNTq
	gr0Qm7v50FOhCOV+qPHrzfZQXtiXrHfqCYK7+Ip+8OadRFlk5J/NxLNxJgyEhjOtMeskY+3/pHw
	vMhGQXeqG0ZqV7MOu
X-Google-Smtp-Source: AGHT+IFOiDqhkF/LuZL8w0Rtb4OkwCmEdbAvTq104oKUlTYWpVJV4+Naoh6nWzC9kYpYwot3hMrpug==
X-Received: by 2002:a05:600c:4f47:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-451f0a7c52emr32839385e9.14.1749050442235;
        Wed, 04 Jun 2025 08:20:42 -0700 (PDT)
Message-ID: <7c3f7bb0-b7b9-4909-8d8b-d412498aea59@citrix.com>
Date: Wed, 4 Jun 2025 16:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
To: Jan Beulich <jbeulich@suse.com>
Cc: Aidan Allen <aidan.allen1@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
 <b212dffb-0efa-48e4-9899-104db4754446@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b212dffb-0efa-48e4-9899-104db4754446@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/06/2025 4:15 pm, Jan Beulich wrote:
> On 04.06.2025 15:02, Andrew Cooper wrote:
>> @@ -246,6 +248,8 @@ static void cf_check vmcb_dump(unsigned char ch)
>>              }
>>              printk("\tVCPU %d\n", v->vcpu_id);
>>              svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
>> +
>> +            process_pending_softirqs();
> It's only an RCU read lock we're holding here, but it still feels somewhat
> odd to do this with any kind of lock held. Then again (I didn't even
> consider this upon earlier insertions of such into keyhandler functions)
> we may even be holding a real lock (the sysctl one) when getting here, yet
> apparently that was deemed fine in the past. Plus dump_domains() does the
> same as what we end up with here ...

The debug keys are debug functionality, and do play rather fast and loose.

While the Xen watchdog does hit first (5s), spending too long does cause
problems for the vCPU that's interrupted (usually soft lockup).

I was wondering if we should force schedule to idle before running most
keyhandlers.  That prevents holding a vCPU hostage (and if it's hard
pinned, then tough luck).

We would want a way of blocking further sysctl-debug-key's while one is
pending.

~Andrew

