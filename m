Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y++PIzj4H2qytQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:47:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5F76364AD
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rE7ggnxG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325994.1591380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiBw-0000Ie-9z; Wed, 03 Jun 2026 09:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325994.1591380; Wed, 03 Jun 2026 09:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiBw-0000Fk-6y; Wed, 03 Jun 2026 09:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1325994;
 Wed, 03 Jun 2026 09:47:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUiBu-0000FY-GB
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:47:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUiBt-006ZZ6-SV
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:47:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ff810-2eae-0a2a0a5409dd-0a2a4507a5a2-40
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:47:13 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ff820-229c-0a2a45070019-d155d030ec77-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:47:12 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-68ad1e513d3so10208722a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:47:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051e9c499sm121908466b.22.2026.06.03.02.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:47:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780480032; x=1781084832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mzPjT0jfz/1IMzfdIYIY2Q3WQY/x/sEzId7/HUoIlM=;
        b=rE7ggnxGlCSK4inQI0nQjFjKtblB3wr9HP1lStavZQV4PR/EjS0sPPhnTPxLDP7SKK
         b0FyfAvZRNItF1VOJ8pId+14UTw3aHxj2Ca7gTXSQCfRTWdZ56RUPU2songuYfIZAWsg
         o2I5Yv1mkOEq/Iq74ukuEx6b/dbX87T8BFfs7IpCq/lbMEjJJ1tFnyANCvG24NeIybGt
         oDY4XGuNuasPpwee608wns04GJ3/Ssuy81fhSCDZBCPrDCSX5FKKhpL41K3Cx5WXoYd1
         eRo950lv8d5pmhKuYsrVD7I5KVEHxdp0giJX80lZOqhmXGq67jo6yS2qLfdZw0W6prT0
         ll2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780480032; x=1781084832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mzPjT0jfz/1IMzfdIYIY2Q3WQY/x/sEzId7/HUoIlM=;
        b=L/1pd/Pk4GcdpfYSUUlrhHVmpgwghhQ8ijohnOZbZ3vUGMChZxN0hPTLFOxpCTMDks
         BA4u2ZIvzfSMcosUxCLyy3+4cKm5jCjwsxhNIAqZ9E1JzzGb9+yHP5YCcwBFZvjMhhBq
         fxtQTEDpl/OyDoNGGz1+57ckNgQbX8JIAEx/yXG5+eMfHlwWX8PFfLHGC/gUuKh4mL6r
         3dp6+psPoK45RPJYIbqhgkbjQ36gHLu+45b+RpgztYWQ232Xr9Y5JcOGtsfnVovFDIQS
         il+ZkEwkW4DA0fcDlb21DibUIM1ogHt2J70zjSaSgPhtqa9AbGzcQLvqII5UzhSeDsYu
         6kgw==
X-Forwarded-Encrypted: i=1; AFNElJ+cOo+2ldJ8eN4MIM2hjUsXoiAduCw3ugVcn1QYJcAPN+F/gut0r65xdYtG4h4BQByQTJ4QGaKlv84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZYAF2aR+NGqMP+5DMY5yC6bvG8qpLX8AqOkAFQbsekZvDaZv0
	vADuJWsqmbTFxENSYU4tyY9uWqHRAQ02AaD5pMlITPPdOVNqaeyTnyxL
X-Gm-Gg: Acq92OFNmLS61NkcCIErykC399JuU8AapRBNgUMTF2fBGlP7A3wrodzhDIjJs7mqQ2P
	E6t4O1wwsUIuuJlI0NrcP/XewlrQ6WpNX26uTolFnmypKuXDsjHWp7fC+Moiu44JAD4JBtKP5Dk
	bY0KgPiEGJLfZOf3emoixTLLUz62ZrR4KIn1za8hg0Z8tItbSnQNc6f3L/G7t8+mcJ2C5LS9eGJ
	FVlJLaa0TkhvS0cm6nNBIm4FIPJHKxR8QSnhePIYmljKpZlGVYGkWQ5kakUQQg59csxaO2ofSLY
	ZqBMY+wNmDnUivCHqKP87Jj9G4a5jkxLsNJRZEwHCOmwWLUJ6KIyss4KUREtqmiNRw2YPhHTPUF
	iXJQ/sS+IZisFuzWqZvWjZ3FGAA67eEtQAhDGeHyel9IsqQbW89oROAbmbPfGTrfP3Hu0tj+Ivu
	oEr5T3McCYIqL6SdLld9J21WvmPTfuwNH9/AbYDDMs+AgnW2fnqWUJgF3H3ZL4iJ3egxZLkE1ww
	tvdbEtDnmnEj7f9
X-Received: by 2002:a17:907:9446:b0:bef:90af:6ff1 with SMTP id a640c23a62f3a-bf0ae80264dmr124975366b.31.1780480031978;
        Wed, 03 Jun 2026 02:47:11 -0700 (PDT)
Message-ID: <0d378d0d-9e8b-4fe3-ac03-10f8ff8922a2@gmail.com>
Date: Wed, 3 Jun 2026 11:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
 <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
 <0e53e87e-df9f-4c30-a089-8c4e45babcab@gmail.com>
 <00daf333-a1e7-4691-9dca-240ebf9dfcd2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <00daf333-a1e7-4691-9dca-240ebf9dfcd2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780480032-21B68C48-FB3AE58A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2745
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE5F76364AD



On 6/3/26 11:22 AM, Jan Beulich wrote:
> On 03.06.2026 11:01, Oleksii Kurochko wrote:
>> On 6/3/26 10:18 AM, Jan Beulich wrote:
>>> On 03.06.2026 10:07, Oleksii Kurochko wrote:
>>>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>>> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>>>>>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>>>>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>>>> --- a/xen/common/event_fifo.c
>>>>>> +++ b/xen/common/event_fifo.c
>>>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>>>> int prev_evtchns)
>>>>>>
>>>>>>              evtchn = evtchn_from_port(d, port);
>>>>>>
>>>>>> -        if ( d->shared_info &&
>>>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>>                  evtchn->pending = true;
>>>>>> +#endif
>>>>>
>>>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>>>> (in which case #ifdef may be unavoidable here), an alternative where
>>>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>>>> causing a link-time failure when shared_info() is used (and not compiled
>>>>> out).
>>>
>>> ... here. There are downsides to this, so which route to go needs settling
>>> on.
>>
>> For an alternative approach are you okay with the following introduction:
>>
>> #ifdef CONFIG_HAS_SHARED_INFO
>> #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
>> #else
>> void *__shared_info_unavailable(void);
>> #define shared_info(d, field) \
>>       (*(typeof(__shared_info(d, (d)->shared_info, field))
>> *)__shared_info_unavailable())
>> #endif
>>
>> And then use IS_ENABLED(CONFIG_HAS_SHARED_INFO) everywhere where
>> shared_info() is used including the case above:
>>
>> v->vcpu_info_area.map =
>>       IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>>       ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>       : &dummy_vcpu_info;
>>
>> Everything that in event_2l.c could go for now without
>> IS_ENABLED(CONFIG_HAS_SHARED_INFO) where shared_info() is used as that
>> code isn't expected to be called by arch which doesn't support 2L so no
>> linkage error will occur.
> 
> Yes, this roughly is what I was thinking of. I'd like to remind you though
> of issues with identifiers with two leading underscores.

For event_2l.c would you be okay to make compilation of it conditional 
by CONFIG_HAS_SHARED_INFO or it would be better to introduce separate 
CONFIG_HAS_EVTCHN_2L:
   -obj-y += event_2l.o
   +obj-$(CONFIG_HAS_EVTCHN_2L) += event_2l.o

~ Oleksii

