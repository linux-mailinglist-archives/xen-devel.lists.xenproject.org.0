Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RVtWLQ8oQmpB1AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 10:08:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4456D74CE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 10:08:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=TEpYlNln;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="c 24Brf1";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=arndb.de
Received: from list by lists.xenproject.org with outflank-mailman.1347304.1605161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we71r-0007Io-Qn; Mon, 29 Jun 2026 08:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347304.1605161; Mon, 29 Jun 2026 08:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we71r-0007G6-KZ; Mon, 29 Jun 2026 08:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1347304;
 Mon, 29 Jun 2026 08:07:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arnd@arndb.de>) id 1we71q-0007G0-0S
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 08:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we71o-00Gden-K7
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:07:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arnd@arndb.de>)
 id 6a4227c7-bab6-0a2a0a5309dd-0a2a4505a5c8-16
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 10:07:40 +0200
Received: from [103.168.172.137] (helo=flow-a2-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arnd@arndb.de>)
 id 6a4227ca-3cb2-0a2a45050019-67a8ac89c4a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 10:07:39 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id 95552138020B;
 Mon, 29 Jun 2026 04:07:38 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
 by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 04:07:38 -0400
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 4D341182007E; Mon, 29 Jun 2026 04:07:36 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782720458;
	 x=1782727658; bh=/WIe7fhbq6CJNEEuiOwk3r/zWUSncZp6R6QFRwJ6sZY=; b=
	TEpYlNln6M/GwjHpSnfu7rcdvzFIRDl8PaPZdTR79bfu+93tv92bHNDr8ENAoz0o
	I+3XOz+pyki2rkkp/RkwXg8QRaJpJiIvR1f0tt8I+SaQuvnEJlOAQI6CC1z6yuZ0
	cVgd/4iHRc6MLkND4uxVIRG0nvMRx4MGsgfInhPlnKeJM8pUkN12VG8ueW2PsOxW
	4MefLznfvAN244lHNATTmj+ua+WwiZat+gfP8BGqjCXRdi0M/+5lN5Uzmi8DBRk9
	qOZeAPBpKTz28WGmYMtNgUnS3AhyykTIUnN8T+m0kvmDFl4Aj7gFAV/TTmsNx+r6
	Jtg81SkeOZQVOe1HWz4Juw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782720458; x=
	1782727658; bh=/WIe7fhbq6CJNEEuiOwk3r/zWUSncZp6R6QFRwJ6sZY=; b=c
	24Brf1SGc6bjX+gJggjD7fmSOT+iM2lF24wJCuV8s2Amdzt3Twtd0vjLYD7Kbt7Z
	+kQoptcHz/VtGk8XGv79LNoCZacAq5R7BAxPksArO05cBqn1akZdOx6QMuzHyKsp
	jZ5aPv2lk/STvMi4lhBu2oUJ3KD+K5F5xqv9MBLZ6CU0PGJ3KI+fRCvE0f+e7q5T
	uEQZkmuOQpm6EKiGmWuLksFY8y18pLeUcAz299olDRkgTanwR4wU8CSDkLsduURr
	qyrnHb9qvfpeWKz95/irIS1jl+HSEg0BQDlK7TA+5DM9R3tqbP934xrod3JsNeCN
	bn6beHziPLZyr1RaQBnnQ==
X-ME-Sender: <xms:yCdCapri6_Fghw3mlaxsy_gFSSzhIwFXsDsNSMOFs66NbUuvHEYu7g>
    <xme:yCdCamerjDzu3SkJsJt3qEPErm5Jr5VIrDx-XCtfJMJEoOf5pYL1aPAL4K1m0ol0d
    u21Y6WhZ3M90bX6VcOFH8qU30t4-5iJBk_D2YIapVkzsHqYJk_o71YS>
X-ME-Proxy-Cause: dmFkZTGqoTHHYaCI7RURCJhbWHvAkwwtWLTme13LzQ5hLxT15nHz8y1KVwyjgVqWxzHrQs
    ToUxEitfKDOpnMGHxJtxeXXfPwSpUOYKCbLG3DvDrtRiFisamjIvbRYQ8eHCu3vuqKkFV+
    oGsvHlqt2QnvGfcOvmRuOO3Rgzas4qMskWtx3Scnrrx20Qj6yj3iPd9+zKy3qioo1rB1kC
    NbqXUUQhwk7CbH9jPKcbA4qnRTFNBVVyitidRmU/FN7E7sMWO92pJbypgI30pCru3tSGoX
    4d3jRIE5+wGTHtOqlpEwsN0x3RyunobmR8KafNHjr3b8znb/Ht8a7MfJTFEzr6ZVtoIPkp
    YEm/Y5IKpJ7BR9D7SOhiAKZmz+xhjw+Rj3xZl+UuPyzGO/ptf2uS48xftDP82jFSPGfW1i
    WUFvAhWp7rn6kmw50O2IbqNmMpIJJk3N6j0QnhkZxe9rSsCXY+yz3p4OT2eGCGDnr01Arj
    1sqDxkxM7AGOwRp2cqGArUzSLYhPKHqfyQLHeEzDtqWWPt2AfNkUlUPb4ugsBXY3ifDHcm
    rEin2AiU1hzBEGVpJXGUq8YO8ASTb7YaAQ4Ms9TA2vnH06i8XtAwN9VbW6ypBxduNhUPiP
    nLczW/MyU9OJ2FdWXbqKiIb/kfE3CMT7L0MTJSderW3WxiiH9wuQPU0UShyg
X-ME-Proxy: <xmx:yCdCaqfbNNdmOfirtwC33qahd0NFGOxhg_dXK8UoYrkmnnmFjgFULw>
    <xmx:yCdCakdFbzk9KweAfKAiLwLQgD4racV8i02VE4-Fx5JTJvZq9isCqw>
    <xmx:yCdCakb8QFZewQ3ezXiHAUYXU4zyjwrQ2jNwpx7JVpowCgaV4w9SdQ>
    <xmx:yCdCar0ySJMq0u8YC5UhoDauKTq85d7kaWxynrhTGphqhhBu2OB0Rg>
    <xmx:yidCaoHTNZ_VOhE49MHuA-FguNtgyjgUdDsWkzp50DUo55mdeNXYC66h>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApSqBjiSqQZ-
Date: Mon, 29 Jun 2026 10:06:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Juergen Gross" <jgross@suse.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-pci@vger.kernel.org, virtualization@lists.linux.dev,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-crypto@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hyperv@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Zhang Rui" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "Jason Baron" <jbaron@akamai.com>, "Borislav Petkov" <bp@alien8.de>,
 "Tony Luck" <tony.luck@intel.com>,
 "Yazen Ghannam" <yazen.ghannam@amd.com>, "Len Brown" <lenb@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Kirill A. Shutemov" <kas@kernel.org>,
 "Rick Edgecombe" <rick.p.edgecombe@intel.com>, "Pu Wen" <puwen@hygon.cn>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Ajay Kaher" <ajay.kaher@broadcom.com>,
 "Alexey Makhalov" <alexey.makhalov@broadcom.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Reinette Chatre" <reinette.chatre@intel.com>,
 "Dave Martin" <Dave.Martin@arm.com>, "James Morse" <james.morse@arm.com>,
 "Babu Moger" <babu.moger@amd.com>,
 "Tony W Wang-oc" <TonyWWang-oc@zhaoxin.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Niklas Cassel" <cassel@kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 "Helge Deller" <deller@gmx.de>, linux-geode@lists.infradead.org,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, "Long Li" <longli@microsoft.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "James Clark" <james.clark@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Pawan Gupta" <pawan.kumar.gupta@linux.intel.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Huang Rui" <ray.huang@amd.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Perry Yuan" <perry.yuan@amd.com>,
 "K Prateek Nayak" <kprateek.nayak@amd.com>,
 "srinivas.pandruvada@linux.intel.com"
 <srinivas.pandruvada@linux.intel.com>,
 "Artem Bityutskiy" <artem.bityutskiy@linux.intel.com>,
 "Artem Bityutskiy" <dedekind1@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Ashok Raj" <ashok.raj.linux@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Rajneesh Bhardwaj" <irenic.rajneesh@gmail.com>,
 "David E Box" <david.e.box@intel.com>, xen-devel@lists.xenproject.org
Message-Id: <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
In-Reply-To: <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1782720460-1550A2B8-D0E54FE8/0/0
X-purgate-type: clean
X-purgate-size: 1592
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-edac@vger.kernel.org,m:x86@kernel.org,m:linux-acpi@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-pci@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-ide@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:platform-driver-x86@vger.kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jbaron@akamai.com,m:bp@alien8.de,m:tony.luck@intel.com,m:yazen.ghannam@amd.com,m:lenb@kernel.org,m:pavel@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:seanjc@google.com,m:pbonzini@redhat.com,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:puwen@hyg
 on.cn,m:bhelgaas@google.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:viresh.kumar@linaro.org,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:babu.moger@amd.com,m:TonyWWang-oc@zhaoxin.com,m:dlemoal@kernel.org,m:cassel@kernel.org,m:airlied@redhat.com,m:deller@gmx.de,m:linux-geode@lists.infradead.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:linusw@kernel.org,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:linux@roeck-us.net,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:jpoimboe@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:vkuznets@redhat.com,m:luto@kernel.org,m:boris.ostrovsky@oracle.com,m:ray.huang@amd.com,m:m
 ario.limonciello@amd.com,m:perry.yuan@amd.com,m:kprateek.nayak@amd.com,m:srinivas.pandruvada@linux.intel.com,m:artem.bityutskiy@linux.intel.com,m:dedekind1@gmail.com,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:ashok.raj.linux@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:irenic.rajneesh@gmail.com,m:david.e.box@intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,akamai.com,alien8.de,amd.com,redhat.com,linux.intel.com,zytor.com,google.com,hygon.cn,broadcom.com,linaro.org,zhaoxin.com,gmx.de,lists.infradead.org,selenic.com,gondor.apana.org.au,linuxfoundation.org,microsoft.com,roeck-us.net,infradead.org,oracle.com,gmail.com,bootlin.com,nod.at,ti.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,arndb.de:from_mime,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_GT_50(0.00)[95];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A4456D74CE

On Mon, Jun 29, 2026, at 09:01, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.06.26 08:52, Arnd Bergmann wrote:
>> On Mon, Jun 29, 2026, at 08:04, Juergen Gross wrote:
>>=20
>> I assume this is fine, but since you don't mention it explicitly here,
>> please clarify what this means for 32-bit CPUs without the rdmsrq
>> instruction. Those will continue using the same instructions as before
>> and just change the calling conventions, right?
>
> Yes. I thought this would be clear from the following:
>
>    - They are based on primitives using 64-bit sized values anyway.

Right, that was my reading of it as well, but it's not entirely
clear when the function name is the same as the mnemonic of an
instruction that only exists on newer CPUs and the later patch
descriptions (e.g. 25/32 that I was Cc's on) have a much shorter
explanation.

>>> Note that most patches of this series are independent from each othe=
r.
>>> Only the patches removing a specific interface (patches 7, 15, 26 and
>>> 30) and the last two patches of the series depend on all previous
>>> patches.
>>=20
>> It looks like you are touching most files twice or more here, to
>> first convert from rdmsr to rdmsrq and then to change the
>> two-argument rdmsrq() macro to a single-argument inline. If you
>> introduce the inline version of rdmsrq() first, you should be
>> able to skip the second step (patch 31) as they could be able
>> to coexist.
>
> I've discussed how to structure the series with Ingo Molnar before [1]=
. The
> current approach was his preference.

Ok.

      Arnd

