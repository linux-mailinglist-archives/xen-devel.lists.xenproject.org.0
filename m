Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F1B1EB66
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 17:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074794.1437284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOpo-0001Of-RZ; Fri, 08 Aug 2025 15:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074794.1437284; Fri, 08 Aug 2025 15:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOpo-0001Ls-OQ; Fri, 08 Aug 2025 15:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1074794;
 Fri, 08 Aug 2025 15:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukOpn-0001Lm-FJ
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 15:16:43 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adeeeab2-746a-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 17:16:38 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso1270924f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 08:16:38 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f8b1bc81sm8289222f8f.69.2025.08.08.08.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 08:16:37 -0700 (PDT)
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
X-Inumbo-ID: adeeeab2-746a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754666198; x=1755270998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UlCCSBOGyt/alOiIsi4ur2+ZRdDyb3EuCXPGeG4MBdE=;
        b=sbvnW7912X57iNvIsLo/LlXf4/v879MUbtn5321cvIsu8GhmAiA7tbpd/40M1XJDto
         zahPWmTxt4hUygpBRsqWfb4ULQ1ZAyTkkbrswBiCSnBk3tLd554AatBr3Bik98rN7Hxn
         cgP6JVIpWk9cfulVJeVmPWvUO6JNdQjBbTuPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754666198; x=1755270998;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlCCSBOGyt/alOiIsi4ur2+ZRdDyb3EuCXPGeG4MBdE=;
        b=wYaEMW/zIHhbJd//tbzUE9qTsGmNg5F+/2NA09Rc7lNOjCgDVW7ZNdGiTA7Qxmb5n8
         Z/xOoF8ieA5Tff4ArsH1Dhiw/xv5Q1gguJvpkL53YcbTGj6GG917eZZi+2O14yUTjJVl
         XVpqO7cIvpl8jN7nayCpCVVqJY0Z4sb7Sl4IziyE2LnNjnwaxrBIsFFRGjTonKh3zdxc
         JxvN/BZm7BUnGBc/Qvp27tfqXsMdGGohwoxZh5Bhwul5pUn+cAZLHha2fEEwkkrBvhW+
         upxjYM/vz/ITZlwycbwScu7c5d2PeK4iEOIUzmjGL4CMCy+8mz/xaaI6NfEx58y8wCI1
         rMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFTfI1fmtSIuX7VXd6wbOUyIXDgojAuT62P/tMAockRmFM9gz11Qa1POUrXyxpKskSGZxl4ka39mo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5iIN7ZDEJTWXvfbJv47rByLwePRn6rnkCxxyvjHTvdVFmp53Q
	+TP9bAm3X4rdEZqZ7LJudjo4jrv+KF/d7aW9hbbHhZtFsw53F94hJdnAAF5Y6trT9qw=
X-Gm-Gg: ASbGncuYcyxEwdy5coBW3nmEYsKDDw1xhy6aS+HnCF4V0zedljs+riT1ccx3yl3AoGl
	VIvPG6haMkjn0Yquk9WCECHIeyG1HY8j2EloNwk5CG8pGjjNRy48aWeNR6P2iLOGjXahus9f5Qy
	Mj+pg92QxB9BPQV9cSrjz1PWd4VqqPhVU7eZN3zhBx3T0m9MNnwFdL9XEX7HE+BNwWd1CtlPG7z
	07+VeglKg+qqcFwUBUHaM3/ue75885Ffrpi0SRkSu4gRS5XupkgaW2SKhbq3zGpD2yhMf1U37F2
	LyC9PUPRvxNiFyDSHK2Jr3F9PRfvuOvGPggstAhqSc/iayJODkueNMZdy8Jlbs5XSOO15uteVe3
	4T4H1CpmKMljSiTj3tM1BTHOygG7i7uAl6v6xAfWPTD11T+wKUffY0KB7OO/Oy7jACb/+TBQh6u
	G7khI=
X-Google-Smtp-Source: AGHT+IEmPfmGffSn5h6oyOdDKN/cxMWMpMs0ON2XwIfZfiF1tbpTQ0FLbDepH0/FGncTDkSpT5HH8A==
X-Received: by 2002:a05:6000:220c:b0:3b7:8abc:eba2 with SMTP id ffacd0b85a97d-3b900b4f140mr2657755f8f.20.1754666197784;
        Fri, 08 Aug 2025 08:16:37 -0700 (PDT)
Message-ID: <5bef1a60-e608-4f9f-b658-a702e2306ebd@citrix.com>
Date: Fri, 8 Aug 2025 16:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fork or replace dependency yajl?
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Christoph_Gr=C3=BCninger?= <foss@grueninger.de>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <d49ad645-35dd-4bd2-b166-d1803b2d95ba@grueninger.de>
 <25afca10-18e7-445c-b914-98d767016d70@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <25afca10-18e7-445c-b914-98d767016d70@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/08/2025 2:36 pm, Andrew Cooper wrote:
> On 03/08/2025 9:52 am, Christoph Grüninger wrote:
>> Dear Xen developers,
>>
>> you are using the dependency yajl (yet another json library, [1]) to
>> parse JSON files. The project seems abandoned with the last commit 10
>> years ago, the last release over 11 years ago, and 75 open pull
>> requests. Packaging yajl requires patches, e.g., to make it compatible
>> with CMake 4.0.
>> There are some forks but none has replaced the old one yet [2].
>>
>> I think there are three paths forward:
>> 1. Xen could pick a prominent fork and use it as its main dependency.
>> 2. Xen could create a fork of its own, hopefully attracting more
>> people interested in an maintained successor of yajl.
>> 3. Switch to a different JSON parser library that remained healthy.
>>
>> Sure, you could stick to option 4., do nothing an offload the burden
>> to fix yajl to distribution packagers.
>>
>> Xen is an important project and its decision can create momentum that
>> might lead other projects.
>>
>> [1] https://github.com/lloyd/yajl
>> [2] https://github.com/lloyd/yajl/issues/252
> CCing the libxl maintainers.

To follow up here, please try
https://lore.kernel.org/xen-devel/20250808145602.41716-1-anthony@xenproject.org/T/#u
which should make libxl use json-c by preference.

~Andrew

