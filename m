Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G+5lMWztVGp4hQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 15:51:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6074BE40
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 15:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mFHmXu2f;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361687.1613833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjH49-00059e-Af; Mon, 13 Jul 2026 13:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361687.1613833; Mon, 13 Jul 2026 13:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjH49-00057C-82; Mon, 13 Jul 2026 13:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1361687;
 Mon, 13 Jul 2026 13:51:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjH48-000576-9F
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 13:51:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjH47-008Qfy-7g
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 15:51:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54ed58-2eae-0a2a0a5409dd-0a2a450689f0-8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:51:23 +0200
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54ed5a-0835-0a2a45060019-d155a733ccdc-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:51:23 +0200
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5aeb11c7347so2653944e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 06:51:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39c84b13407sm27820531fa.12.2026.07.13.06.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 06:51:21 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783950682; x=1784555482; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ff0EkN2TJXIY1rQ2tgdc647EOhcHItZ1JKqzkBdIWQ=;
        b=mFHmXu2fqin/MDPKslCBdP6Zi8h/mliYue3yHq3HUroWqtWl0IDIm4xTWsLILVyL12
         8AR7UzfHWi5gJ0Y2Lbvlgxq/CNdKqVz6EuV1u0NSBwwlVWrfPhdabbgyv+QK7XOwmvPF
         Sy+3vX9kY8QBdvOm4xwTlqQ1SrYdYY8UqMKcBXTepe4FFHDl5WK2H/GL0eK+wyGQCRVq
         Eh9VwqFvHECTALX74CtVIoU3tTUBpW9cyhjiBpyjrUbGeE2csBXLBOapHZWg4vGSRJ/0
         AeAFAmEm5M6RZn9bwteDogxH+SxQssL8wjW7JmjMa55H7JyjCrt4Lk2qRcTX8FvF/eix
         a6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783950682; x=1784555482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ff0EkN2TJXIY1rQ2tgdc647EOhcHItZ1JKqzkBdIWQ=;
        b=jdImW2OV2+Cb+EaQ6Zw7C03IUdD4wRzND63a1hLJvIu6SBTIrLxYk2IZQ+IbNTpP1L
         ktP8RLbnPm2A6FDx38EuPignYVIxayp6Pyc4l2gAYGSpxSNBmWpCbiJSmtrgpqq7X7im
         9QHzgJvUOtGTlHhodSEsYgVH3w5Ha6gJSJ24aTQpn9NJ78y6+0Hdu6AsmG5EgmLHgKyH
         5Mq4F4FuO/gyysMhgWKhxH11jBtw+u9L5/rVFI76mLEg9cvBGRntEZbq5G0GPzzjqU7l
         zDyZx9McetqrNUdfhGQw4hctpmhd5SbbQ7bQ0GPxlOU67x9Y9QqrhkeatIDBPss0Q60a
         ae/g==
X-Forwarded-Encrypted: i=1; AHgh+RpfY3jlDFJZlkiQzLluMxcVnkx6tqShp1qsOEAylMmhIS2XnarlumVAb0anrVQ6HNaRChrREXyXeTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4n/wimVsMmi8p1cpQRjU6uZBc+ygEekOlPzhOkHt26QjUiGgA
	Mj7nNB4DXEBZDfPrDbGQ6H0Jdv7y4v1TrxsjUN4TVUfTqikNe6fJMp/MO2VwGw==
X-Gm-Gg: AfdE7cnt8C8X8IRfXqyOu62Uxy9Sa1x3BHF0tTTNhe3yTBynkVv994AD4ghnw4eNpnp
	bFpI8gwGL99VVzXwh6SaeSJRE1qgq5Hd/lC57lDmpmCru77z73fVsJJRYHrbLlp4icLBzT91Yng
	qIUmj2oQ5aKWqOZExt/rUx0GIAYPfJozk0A3OIAeFdhHi2+ygVcZfnGTbJXUJO8A957P5PKWJKD
	fa/Nspmz/kyhGK1xUvtS4bWKilliQT/JGeBIZpkqucY/6OJBEFGxv9SR+NTnw7b8Q17sb+TKMNB
	QVyLhA1VqBY2FVJ20CqJtUVseAycrkRzf8tN06Ca/PGjoARYe8/WW3b0daymklvrUENLD2UFROA
	oOh5eVZY8RLm9xACfyZkwwtSAA98I7+c8yXfe0MfSeYlF9n5OOTxSrTD7X/MrHtZ/D9Rem/fayk
	I1lLLmT63rAZgJ8dq5lbiQM8slfvMx9LlK4cN5eECCRK/ACURRUgTTyYODwC4nrtvsgyw=
X-Received: by 2002:a05:6512:158b:b0:5ae:be30:ecb1 with SMTP id 2adb3069b0e04-5b0236c9444mr1813032e87.65.1783950682277;
        Mon, 13 Jul 2026 06:51:22 -0700 (PDT)
Message-ID: <00c9a30c-fa0f-4dd9-bea2-15de27973f16@gmail.com>
Date: Mon, 13 Jul 2026 15:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
 <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
 <u46k277cxsw53rb2d4pnxksbbwr35rjp54vwxqm2phbrp2ywll@etlvezzojxvi>
 <9a75baf4-b889-4f2d-8cfa-d8a229411b68@gmail.com>
 <CAGeoDV-wPnhUuC2XRndZNEJOSAC2-tkkTpUi-jKCRn5eiQG6Cw@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV-wPnhUuC2XRndZNEJOSAC2-tkkTpUi-jKCRn5eiQG6Cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783950683-502B7617-229AF516/10/73395122804
X-purgate-type: spam
X-purgate-size: 2948
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EB6074BE40

Hello Mykola,

On 7/13/26 12:46 PM, Mykola Kvach wrote:
> Hi Oleksii,
> 
> Thank you for the review.
> 
> On Mon, Jul 13, 2026 at 10:39 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>>
>>
>>
>> On 7/10/26 1:48 PM, Mykola Kvach wrote:
>>> On Fri, Jul 10, 2026 at 12:44:44PM +0200, Orzel, Michal wrote:
>>>> On a tangent note:
>>>> I can see that you pushed quite a few "for-4.22" patches. We are approaching the
>>>> release, so afaict at this point we should only be taking crucial bug fixes.
>>>> Moreover, when sending "for-X" patches, please include a description with your
>>>> analyzed pros/cons of taking a patch in.
>>>
>>> Ack. I understand. For this patch specifically, I consider it a crucial
>>> fix for 4.22 for the following reasons:
>>>
>>> Pros:
>>> - It prevents an out-of-bounds irq_desc[] access which may corrupt Xen
>>>     memory or crash the hypervisor.
>>> - The issue was introduced by eSPI support already present in 4.22.
>>> - The change is small, and valid IRQ handling remains unchanged.
>>> - I tested CONFIG_GICV3_ESPI=y and CONFIG_GICV3_ESPI=n builds and
>>>     reproduced the issue on FVP using a fake DT interrupt with reserved
>>>     INTID 3000.
>>>
>>> Cons:
>>> - The trigger requires either a malformed DT interrupt specifier, such
>>>     as reserved INTID 3000, or an eSPI unsupported by the Xen build.
>>> - The demonstrated failure used deliberate fault injection rather than
>>>     a reported production failure.
>>> - The patch adds validation to common Arm IRQ setup paths, although
>>>     valid IRQs continue through the same path as before.
>>>
>>> Assessment:
>>> The hypervisor memory-safety impact and the presence of the affected
>>> eSPI code in 4.22 outweigh the limited regression risk.
>>>
>>> I will include this kind of pros/cons analysis with future for-X
>>> submissions.
>>
>> It doesn't seem as critical. IIUC, exploiting this issue requires
>> providing a malformed DT interrupt specifier. If the DT interrupt
>> specifier is valid, the system should behave correctly.
>>
>> Given that we are very close to the release, I think it would be better
>> to proceed without these changes. If the issue proves to be critical, we
>> can backport the fixes afterward.
> 
> Okay, thanks.
> 
> What do you think about the second patch in this series? I believe it
> is more critical. Unlike the first issue, it can be triggered with a
> valid eSPI configuration: freeing a valid eSPI uses the raw INTID as
> the bitmap index, causing an out-of-bounds access that may corrupt
> memory.
> 
> Could it still be considered for 4.22?

I agree that the second patch is more critical, but I don't think it 
should block the release. It would be good to include if possible, but I 
don't see it as a release blocker.

Maintainers, what do you think about taking the second patch for this 
release?

~ Oleksii



