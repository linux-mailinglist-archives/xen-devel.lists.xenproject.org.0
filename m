Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6B7C6293
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 04:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615682.957018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqlCX-00089V-2w; Thu, 12 Oct 2023 02:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615682.957018; Thu, 12 Oct 2023 02:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqlCW-00086d-Vz; Thu, 12 Oct 2023 02:13:24 +0000
Received: by outflank-mailman (input) for mailman id 615682;
 Thu, 12 Oct 2023 02:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HOn7=F2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqlCV-00086X-Jj
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 02:13:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eae051ee-68a4-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 04:13:22 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50444e756deso721886e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 19:13:22 -0700 (PDT)
Received: from [10.157.20.243] ([103.14.252.248])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170902d35200b001c74df14e6esm595728plk.51.2023.10.11.19.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 19:13:20 -0700 (PDT)
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
X-Inumbo-ID: eae051ee-68a4-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697076801; x=1697681601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pkLWl7zdfFAAY5jEulAwXuGW1v1hxxfyppsZPE+H+3U=;
        b=XaKF1Dh4mg3GId2ep7OXNJ2GigbpbfxTUzacyct02RoHRGxGlTXQhSe1yn96CNCVb4
         LKznuSZ8zPiRgqRWIJEI2XWWgNo+G/Ezy8+IzuSKqWdi1CWMkTNS/tnIZN+RlQwLvXtP
         209Blt8IVivePMWT61Si1DgT4/RtYHvHtsWD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697076801; x=1697681601;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkLWl7zdfFAAY5jEulAwXuGW1v1hxxfyppsZPE+H+3U=;
        b=O5thX7NXiZn8u62hYFM7ERyQidzj4A2RBzL9yG4/3cHVWKVdnpJV9cgypwjXTZwasd
         mko96ExwIA997XdCjSvR2cahdyHceAsfVNa0GRDm/sGCzzfuPiUfkQzpitf62gbD+UpD
         T8JhQR1OByyeCGVuSNnNzWFzV4NLouV2A66ZAwqGuZ4UtOCnl9VWgonNnB7AQJE6ozpM
         GgaqQPVQYQQxlt0ahdDjOwcE858GAwMxxFnOlU1+VGGEhhDyXMVRdE5J2qg+453lL4Ga
         5I6FN8joMw1QmUqzi8SEprlJ9oSEzECdBx2xlMVyE5V3bVXBAqgkk+UXHhlgyhLySy0q
         GPxA==
X-Gm-Message-State: AOJu0YwUDTMMxjucKO1JPTt+O/rg+8A4Dc79eveXoLqrgWSpjYIBoEs3
	5KWctrEOuptlfsHZy+Zq4Lmepw==
X-Google-Smtp-Source: AGHT+IGUyIvaNnscSuCKLNbGU8A8K98dFMHNR+pmgbGYIyvLwaOcfeVA6NcBKU82s2CG3h9jFVFfbw==
X-Received: by 2002:ac2:58f1:0:b0:500:ac0b:8d52 with SMTP id v17-20020ac258f1000000b00500ac0b8d52mr17431506lfo.7.1697076801399;
        Wed, 11 Oct 2023 19:13:21 -0700 (PDT)
Message-ID: <b978a111-4cfb-45f3-850a-a5051298abef@citrix.com>
Date: Thu, 12 Oct 2023 10:13:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: andrew.cooper3@citrix.com
Subject: Re: [Xen-devel] [PATCH] x86/sm{e, a}p: do not enable SMEP/SMAP in PV
 shim by default on AMD
Content-Language: en-GB
To: David Woodhouse <dwmw2@infradead.org>
Cc: George.Dunlap@eu.citrix.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <b4e8835566bc6e9becc4f8adea7bb3c6cc558db2.camel@infradead.org>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b4e8835566bc6e9becc4f8adea7bb3c6cc558db2.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2023 7:34 pm, David Woodhouse wrote:
>> On 16/01/2020 16:00, Igor Druzhinin wrote:
>>> Due to AMD and Hygon being unable to selectively trap CR4 bit modifications
>>> running 32-bit PV guest inside PV shim comes with significant performance
>>> hit. Moreover, for SMEP in particular every time CR4.SMEP changes on context
>>> switch to/from 32-bit PV guest, it gets trapped by L0 Xen which then
>>> tries to perform global TLB invalidation for PV shim domain. This usually
>>> results in eventual hang of a PV shim with at least several vCPUs.
>>>
>>> Since the overall security risk is generally lower for shim Xen as it being
>>> there more of a defense-in-depth mechanism, choose to disable SMEP/SMAP in
>>> it by default on AMD and Hygon unless a user chose otherwise.
>>>
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>> ---
>>> I'm a little bit on the fence with this one. We're having the same issue with
>>> general nested virt but I'm not inclined to trade security for a user in
>>> general case. Disabling it by default for PV shim only seems rather inocuous
>>> due to the use case restricion. I'd like to hear more opinions.
>> So everyone on the list is up to date with the discussion we had IRL.
>>
>> SMEP/SMAP are defence in depth measures.  We support running on hardware
>> without these features, and the overall result is the same, security wise.
>>
>> In the PV Shim case, there is only a single guest and nothing
>> interesting in Xen, data wise.  We specifically do not have the risk of
>> sideways data leakage from other guests to be worried about.
>>
>> We do however care for performance, and not taking a VMExit on every
>> SYSCALL/Interrupt/Exception makes a massive difference overall.
> FWIW when running the shim under KVM even on Intel, constantly frobbing
> the CR4.SMEP bit still performs awfully.
>
> (Yes, we should make KVM pass that bit through to its guest on Intel
> hardware, just as Xen does when it's the HVM host. cf.
> https://lore.kernel.org/kvm/7fba6d8fc3de0bcb86bf629a4f5b0217552fe999.camel@infradead.org/T/#m39a117e90f29fc862b78ec1441b761459e7be86a
> )
>
> But why does the shim even need to turn it off when switching to the
> guest context? Its guest isn't running in supervisor mode so surely it
> doesn't *matter* whether SMEP is enabled or not? Why not just leave it
> on at all times?

32bit PV kernels run in Ring1.  Which is supervisor and not user.

Some older PV kernels do execute on user pages, and don't like getting
SMEP faults when they didn't turn it on to begin with.

SMAP is far more horrible.  STAC/CLAC are CPL0 instructions despite POPF
(changing AC) having the same architectural effect, but again, the guest
kernel doesn't tolerate SMAP faults when it didn't know it was enabled.

~Andrew

