Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPhWCwhYlGkXDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:59:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C214BB05
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234920.1538010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJiy-0005Kb-Mo; Tue, 17 Feb 2026 11:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234920.1538010; Tue, 17 Feb 2026 11:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJiy-0005HU-JW; Tue, 17 Feb 2026 11:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1234920;
 Tue, 17 Feb 2026 11:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsJiw-0005HM-FW
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:58:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f88879c7-0bf7-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 12:58:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-65a36c8bcabso1108387a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 03:58:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad29d4afsm2258690a12.10.2026.02.17.03.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:58:26 -0800 (PST)
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
X-Inumbo-ID: f88879c7-0bf7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771329507; x=1771934307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQS0biGMi1toghT4wNPDy2yHAEiT+Mm05gcElsWjRu0=;
        b=XxvIb8lSYdDGBVMOJkg0bsq07l5nmNv/DGM/gI/hloCZPi1hrntS+fUdKNCTmXNDlH
         DT56hSN+9f++yD0AaM4UiXk1UVKax8LSPmtwdlsb2uxVz3ypYHOQD5CTMBcjUi3cyROt
         62OED7I62kqjHgPK/7hb/1ExYwEx+fdLcOuvL4vTWxR/kjjCIwW7FcYjyVR3hsxQU35q
         jojb7Afnf3SHPtyQ9hMD8hciBTZBnmHbWcEYhTn0OiQC9kX/fChlwWivIE3Sh1x7Je7Q
         wK76PkVdaFAJFeemNryctXqOKmEmhymoyIDeR2/h0RotGVhGSSIvud7F+YiTRsUpK5YD
         6+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329507; x=1771934307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQS0biGMi1toghT4wNPDy2yHAEiT+Mm05gcElsWjRu0=;
        b=NCFpJ5AvBcZ9xRHZTVQ4xh76pj8iaQWO9Rj9WphzIjcBnxuGG1kgkkQlK14DISYTiW
         apFTOhc9q6urB35Fz89RPZpkdMUYYe/ZLgO1AlfArgxBBBHM3Q5d3ZNyWgWHzbmVLwp+
         xVq4bGH3LP03nLng3fN6gC39o7ysr/wntHTUsZB1moCSnFNmD7I/x+NPQJFIhB9+ti9Z
         VB/dsKnXFL6Igl7+rz4/GQoPlKz2Ozvq0O0ZdTnTHOgCz8SiDk1YVIxBFR729O+ZY6kP
         q7PhwguZRkfnrSnQrgOiGZuVWhgAZp5lzdGZSQUmoiL9W3Saci278FdoNI7yRXxfkavJ
         dXHA==
X-Forwarded-Encrypted: i=1; AJvYcCVyiJ1xXxOkAsth/hH33J6PGsn0kBlyDGrzFRMO5HGhPS120Owd2UsVFdO+XSf/YZNXiaO6TQTo6ss=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3jR79YNgB5qlGs1TnQUK0uyn24UUZhpGWqrWwf8rrrq1NRa8+
	/pLJYKTtRGsymyl9Z29obm66fuLQlCklQTQp9XRrIHbn7YfmaX2fB8TP
X-Gm-Gg: AZuq6aIAYj6HxB0al+wmeBJN3Yly2v0HZqfSk3nGFRaBO1Wb31Scb9/cNEAAP0Bkqdk
	AcOWAEjs0lvBYzCey1UyYuglnYbDAfHNW6FejrzeZohwnirKGoijYUIB5qXHjRFcTA0qMQQ7v4g
	Ngkgvc5IFUOO5HRVLFdF1jEjqq+lBut6JnFDmxz+2iMg5jM4LJSMIjl48uDs48j+Kik3bHBM8Rm
	QdQwDDpPWjFm/Fjnzr5J3JXtirEsnbpu31za+qQR61EvSZ2GSaYgCtTixOfwk4odovZ1o/3nZWF
	wfWLn20JOXnqfY+twFMfRfYkNaK24Qw50o8HUB1JIl5WOr8HJAnSrjxMSJ1YpnRwtoH3ChGwxVR
	HR1osbR2em+FR4uFYzG41Y664FAP+GvKRkXIG7KH3B0Mt1iJCDZe8OIVFWj43rX2EN5A7+KEahj
	y2IBS5cM3Zbf5/dqGY+YrpqLfst2GolKl8Z9j9W+26yEXG1mwxiHdtsHQd58qH86phinyl43cM6
	nF6Ue0jD/vqQg==
X-Received: by 2002:a05:6402:399c:b0:65b:f5fa:afce with SMTP id 4fb4d7f45d1cf-65bf5fab2cfmr2666031a12.31.1771329507342;
        Tue, 17 Feb 2026 03:58:27 -0800 (PST)
Message-ID: <f95c9cae-0d57-42bc-b435-3f29c54b67b9@gmail.com>
Date: Tue, 17 Feb 2026 12:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add zImage kernel loading support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
 <0bca8843-9c52-4544-88a6-87ddb110095e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0bca8843-9c52-4544-88a6-87ddb110095e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CD6C214BB05
X-Rspamd-Action: no action


On 2/16/26 5:31 PM, Jan Beulich wrote:
> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>> Introduce support for loading a Linux zImage kernel on RISC-V.
> Before I look here in any detail - where would a zImage come from? I can't
> spot any support for it in Linux'es arch/riscv/Makefile (whereas
> arch/arm/Makefile has such).

Good point.

It is something that should be renamed as not Arm64 (Arm32 really has such
target), not RISC-V doesn't really work with zImage. They are using Image plus
Image.gz as compressed image.

Maybe it would be better to rename kernel_zimage_probe() to something more
generic kernel_image_probe().

>
>> Note that if panic() is used instead of returning an error as common code
>> doesn't expect to have return code and it is something that should be
>> done separately.
> Is the "if" in this sentence a leftover from some editing of earlier
> different text? I can't make sense of it. Also, which "common code" do you
> mean? kernel_zimage_probe()'s sole caller does respect the return value
> (handing it on).

It is about kernel_zimage_load() which is used to set:
   struct kernel_info->load = kernel_zimage_load
in kernel_zimage64_probe().

and which is called (and is in common code) from:
   void __init kernel_load(struct kernel_info *info)
   {
       ASSERT(info && info->load);

       info->load(info);
   }


>
>> This prepares the RISC-V port for booting Linux guests using the common
>> domain build infrastructure.
> Again, what's "common" here? Not something x86 uses, afaict.

By "common" here I meant dom0less's common code which may use functions
from this file.
I will update that part to use more specific instead of "common".

~ Oleksii


