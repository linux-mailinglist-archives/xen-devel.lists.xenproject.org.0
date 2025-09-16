Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E4B58BB6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 04:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124497.1466823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyL72-0008IG-Pt; Tue, 16 Sep 2025 02:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124497.1466823; Tue, 16 Sep 2025 02:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyL72-0008GW-Mj; Tue, 16 Sep 2025 02:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1124497;
 Tue, 16 Sep 2025 02:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyL71-0008GQ-Dd
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 02:08:07 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb87a422-92a1-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 04:08:05 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3e9c5faa858so2191172f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 19:08:05 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a48c19sm14652415b3a.36.2025.09.15.19.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 19:08:04 -0700 (PDT)
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
X-Inumbo-ID: fb87a422-92a1-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757988485; x=1758593285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPsCIOYK1ovn9kCkK+EjWsBMX09q+U37GNtiL4+vhHI=;
        b=GQ9Ij5IIcrL66gglJ49ymwzkV3yDBg8XKVcNY4M5II6MPlo6rGwMM6VcqSowWBkOlL
         rf6D0ZQP6/9hoAr7Cp+8zmgCNhLZWzZb0P/lJTMCDeBbyX//LnTNc5fNb0Ic6mTwZZm/
         +wX97GpLz+YBdWUv58S5z+xngC4msn2gBUz1TFHo2yjDJg+x+uS+lQkniEX8qklorEOe
         g5KmCEHRXaywqijnPlLAHfEMMiU7zSl+QLZwbi+tVC/7nFA12iDNVjqZM8WPY4sRAL0V
         6/UrXzVIcsd4sD8o6MFT6ZoVuedK0AOVGiQHb7Jq3GZPkvBFWz6CCtTGhhA20Tm3yz2N
         W6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757988485; x=1758593285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPsCIOYK1ovn9kCkK+EjWsBMX09q+U37GNtiL4+vhHI=;
        b=ibCNwxMouksUJ1mqrfudnqiNgW130DsyJ0FEOyV521APcfWqszKXNHafwwM72FyJQS
         SCZZcO28q+iaZVB4g08fGQdLQ7IKOuGKjKIc/LxgnRtkkYCaS/wOBFGcrpNjPJo14oyG
         oum18GNyTCl2lj/TEiQCBnVesQ9V3qkZeC9UjDgNCwFPGTPcxq8vuqzXrFcH7Rk9EFIp
         J7WpT/tpDAEjVfV2yj3g48SI5BCQvzb5w/o2+w3+GnnGWhRzH2NVLk2bMWqy2NCknZMr
         ewjh3Ww6TPqD5tHPT6QgSIGIR+XuGUsY1hfTX2BJh7b0wFR85ouNFux1c37O2kILSxOs
         HySg==
X-Gm-Message-State: AOJu0YyQdCMxyKIGND5ygtOvDF2WO7SMko4x15976Ex3ARsCMPsTyIT9
	prIRhlHsLkpTQvp3SObrkDzY4qPprWPLfYrJHBZh/dXgszyOvWxo5PoEtBPug1GPCnvLQGjwSd4
	ho2o=
X-Gm-Gg: ASbGncujdneb0KcwIWximYhEL+Ei+4w4LjW1eoSfdHfXImMXcPU0a+5lZuBPnf3Rg5H
	H1XoH+JMpCIluc7vMJGNktruNJdvdRYiZeoPygJEv2vOYktxuTsdX/8VHlE7Nszsc/p8SXnDHV1
	b1qHGMQr5Z0g9m5NCutaRHQP+7zVGC2ptfOieHQtmmzjxahQLT5Rb+UUBdGvKt25+zZD/UUyvPv
	MWJepc3TtDWpk3eOQX/mt/aykbx3nrU0K3giZYYt3jATi+fHEqAToyiaCDE4SKc9kBFnQ40LyFM
	yt4gDZVPFquSf27Nv3awEb3SAxphjqkYfseuHqvoCE1w9Umb3sv0iEuhhr7NrpOh9zUdzPjYJVc
	p8WcWcjwVxfJycPLTQcJavIGRaOyg/msrL70auzE9iQ==
X-Google-Smtp-Source: AGHT+IHfIN4wemmccqIycCmIMWgsu/kfqM5TmDn/KFABeca2z5LgaL6gmyVh1i7MkMGxTf2zVCahBQ==
X-Received: by 2002:a05:6000:2410:b0:3e7:5f26:f1d6 with SMTP id ffacd0b85a97d-3e765790821mr14622490f8f.13.1757988485122;
        Mon, 15 Sep 2025 19:08:05 -0700 (PDT)
Message-ID: <ad0d3a66-99e6-43f7-b49c-cfd661ad93e7@suse.com>
Date: Tue, 16 Sep 2025 04:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
To: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
 <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
 <DB9P250MB0523A25B90E1223BD1037EE7A015A@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DB9P250MB0523A25B90E1223BD1037EE7A015A@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2025 18:52, Ngamia Djabiri Julie wrote:
> Dear Jan,
> I want to underline that this issue is a critical security problem affecting system availability and that it has direct consequences for XEN users:
> 
>   *
> Systems running Xen 4.17.0 – 4.17.3 will fail to boot when upgraded to 4.17.4 or 4.17.5 under Intel Nested Virtualization.
> 
>   *
> Diagnosing and fixing this requires advanced skills and time, and in some cases may be impossible for standard users, leaving their systems unusable or unmaintained.
> 
>   *
> The problem has been known to Xen maintainers since 2024-01-20, but no official communication has been made.
> 
>   *
> Root cause: commit 6bdb9651<https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=6bdb965178bbb3fc50cd4418d4770a7789956e2c> (2024-01-17)
> 
>   *
> Fix: commit dd05d265<https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=dd05d265b8abda4cc7206b29cd71b77fb46658bf> (2025-01-21), applied in Xen 4.18.5, 4.19.2, 4.20.0-rc3
> 
>   *
> Xen 4.17 remains security-supported until 2025-12-12, but this fix was not included in 4.17.5

Yes; the fix isn't fixing a security issue, so won't go onto that branch.
You (now) calling it a security issue doesn't make it one. Note how ...

> On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:
>> Dear Xen developers,
>>
>> I would like to ask if the following fix can also be included in Xen 4.17.6 (and eventually in the Xen versions after 4.17.6 that don't have the fix) :
>>
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dd05d265b8abda4cc7206b29cd71b77fb46658bf
>>
>> This bug causes a boot loop in nested virtualization environments (for instance nested environments that use VMware Workstation), making Xen unable to start. It was introduced in version 4.17.3 and the fix has already be included in 4.19(.2) and 4.20(.0) and woud be planned to be included in Xen 4.18.6 in the coming weeks.
>>
>> Even though Xen 4.17 is in security-only support, this is an issue that blocks testing and usage for users and projects such as Alpine Linux.

... there also was no talk of this being a security in your original report.
Quite the opposite, you asked for the fix to be included despite the branch
being in security-only mode.

Jan

