Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0582B0327
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25663.53574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdADK-0006Yq-1N; Thu, 12 Nov 2020 10:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25663.53574; Thu, 12 Nov 2020 10:52:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdADJ-0006YR-U9; Thu, 12 Nov 2020 10:52:25 +0000
Received: by outflank-mailman (input) for mailman id 25663;
 Thu, 12 Nov 2020 10:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kdADH-0006YM-Rt
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:52:23 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 882f9bd5-84ee-487a-bf7e-d8d18ff35b73;
 Thu, 12 Nov 2020 10:52:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h62so5070369wme.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 02:52:23 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id m22sm6384756wrb.97.2020.11.12.02.52.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:52:21 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kdADH-0006YM-Rt
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:52:23 +0000
X-Inumbo-ID: 882f9bd5-84ee-487a-bf7e-d8d18ff35b73
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 882f9bd5-84ee-487a-bf7e-d8d18ff35b73;
	Thu, 12 Nov 2020 10:52:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h62so5070369wme.3
        for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 02:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ujz+MgNk7p2PobWoZs75Nsm661znwucKZOQhhTTVSGA=;
        b=ggAew42lUOduzbiiuyepthV3vbIvjyrD6kcy+8O5viZ84B3mfBo0qgoLgljdRGg3CT
         SfLuvuujiP7qvF7sJEX90TScIvIW+/RSIPq6o1sSrl4HISrrg5iF6AUCNzegjDxm7tkd
         sfSp+AU7kJIlYnm1oxmnOg1kHWt3v6Ee8EOzFg3Mb+JuPTxgYaoqKXnskoUZz+A3rQIJ
         OkJBcd6D1AyZNByNojaSIaNc3WR8gc879ZHKty8i9KkRws/ehpm8HnzpxzuzhYGM7Yux
         GxOJvMyxq3RG1HQmGQlM8/pFFy5pF+w/MOEH8FKyO+cx2O+4iKuB7PTNlImkVSjn1wNG
         7Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ujz+MgNk7p2PobWoZs75Nsm661znwucKZOQhhTTVSGA=;
        b=NuernRAYUufERvGVUuV8UvvunSjJGVwO+OJ176lUVaJKxPWxpoW9l24KEt4DuYvH22
         P9AHLGuhPhF2CcWeV2SkX3gEgAFM/apbjfUVuHXSWNndh19eVi37SSAOWfFmrGMYLBPE
         M9hrC0i/v7FpHcBeBbbp9G7sObr2O+Nw/XgQN6aZuAPAt0zD87DVx2pNrjtd2GUoX0u1
         sz97WulHdojJPYpb6b1lD6O6WOlP7RXLFtChBvboHXyjDzXpGWV4pC6O70KghXTQ4kY+
         SGP/SZC49txmlA6V4uk25yuxbGJRSiTf9oQZAFRFmfNNQp9l2LXgCXh+CiPGipZe20r2
         RcBw==
X-Gm-Message-State: AOAM530KDK0o8Bbxvn2WYuPQxMF89p8uqZzaCw+pCBXqHZm9qx9tL2jy
	9lnfGJDo/d4Xal07mVKw5IA=
X-Google-Smtp-Source: ABdhPJzBXxhwnm0NWSmupEa6hYQm/lw3ahPsKfu6ri+3AFz4eVzK1gtzvNCMJ3eGTP3eSXNCJVVzbw==
X-Received: by 2002:a05:600c:288:: with SMTP id 8mr9014103wmk.106.1605178342201;
        Thu, 12 Nov 2020 02:52:22 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id m22sm6384756wrb.97.2020.11.12.02.52.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2020 02:52:21 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: jbeulich@suse.com
Cc: ash.j.wilding@gmail.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	rahul.singh@arm.com,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 05/15] xen/arm: pull in Linux atomics helpers and dependencies
Date: Thu, 12 Nov 2020 10:52:20 +0000
Message-Id: <20201112105220.22799-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <e5603684-1f4b-83f3-8b80-6c9d045912cc@suse.com>
References: <e5603684-1f4b-83f3-8b80-6c9d045912cc@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Jan,


>>
>> Note that Linux's arm32 atomics helpers use the READ_ONCE() and
>> WRITE_ONCE() macros defined in <asm-generic/rwonce.h>, while Linux's
>> arm64 atomics helpers use __READ_ONCE() and __WRITE_ONCE().
>
> And our ACCESS_ONCE() can't be used, or be made usable? I don't think
> we want a 3rd variant when we're already in the process of discussing
> how to fold the two ones we have right now.

Many thanks for the pointer, I'm still familiarising myself with Xen's
codebase and wasn't aware of ACCESS_ONCE(); yes, that's exactly what we
need which means we can drop Linux's <asm-generic/rwonce.h> completely.


That also means:

>
> I don't think weakening the checking is a good idea when the macros
> are being made available for general use. If they'd be renamed to be
> private flavors for use just in Arm's atomics, this would be a
> different thing.

This problem goes away, as does the need/desire to bump the minimum GCC
version up to 4.9 for xen/arm just to support the usage of C11 _Generic
in Linux's <linux/compiler_types.h>.

That said, agreed, I did think the way I'd done it was a tad suspect
hence the "possibly contentious" disclaimer :-) I'll keep this in mind
for similar porting work in future. 


>>
>> \ No newline at end of file
>
> This wants taking care of in any event - there are multiple instances
> in this patch (in fact it looks as if all of the new files had this
> issue), and I didn't check others.

Ack, will fix.


Thanks for taking the time to provide feedback!

Cheers,
Ash.

