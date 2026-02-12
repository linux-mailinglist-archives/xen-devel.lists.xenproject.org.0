Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cChpMAigjWnv5QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:40:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629212BF27
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228578.1534729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTAr-0005Rf-Mw; Thu, 12 Feb 2026 09:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228578.1534729; Thu, 12 Feb 2026 09:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTAr-0005Q1-K9; Thu, 12 Feb 2026 09:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1228578;
 Thu, 12 Feb 2026 09:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqTAq-0005Pv-AS
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:39:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c478b830-07f6-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 10:39:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6581234d208so10591802a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:39:46 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65a3cf50e38sm1526324a12.33.2026.02.12.01.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:39:45 -0800 (PST)
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
X-Inumbo-ID: c478b830-07f6-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770889186; x=1771493986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apUhlxAvd4x8zuB7ub7Bs0AjAqJPi31qMLk+fS6Pepk=;
        b=QTj5QUA4rIpVzVqaNTHwL3Zk7g7oqlj8To1eQMnh7fy23DuhsCQXS0N+PDFtjLQJLr
         TGaYaFpLauOB/OyxKvdmHVRq3ulcDUvKJr8JA9eLJ7wM1zOEtDf30u8cmA3JYjeDU6x0
         t6b0pOhe4Go11N/Tl/2OVIjgsaotpz1qC7YrJF15C+G6a3yezW1b4TtjaaIzQMXGX5ly
         M92Fl6n+oGZrZgUENqJo5SNiHg4AwRlAn2P8xqKIEbRxhxGgcuJfZFxSabZfWvVHS6AW
         IbGDn18VSvvU3WVhxjwJMMTnQ9sfjZdIlvyEoJgB8UwRkvydraUNRh3s27SoSiqIRYmP
         rRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889186; x=1771493986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apUhlxAvd4x8zuB7ub7Bs0AjAqJPi31qMLk+fS6Pepk=;
        b=nTqUlkuWMqnZKMldXgVoDEO1s8OE5gjbbeyIeFEVyYophpJHD8DkxT+/arYA8ByLzk
         clmrqaHd6TX0m98pXh1f4lqY3T1k2XAoRQ6fJpajabj2/LoGzs2eCwJZ4CR6ALrlJgWd
         iHeKs6x4ntoWEHOqAtW4aDBJD/xykCGxauJkliZqVBShr7J2OhSitQVutcZ3xzQ6z6/k
         ptoN+TVoU9mVmK7xogwZUEjx/opC3nvgHIh0UDgdvXnCUQC4ZOLMpONh4EwjbkZAX5bC
         B+PhAubujJ5qDvK2W7maY0N0mq3Po0GcLjNN9Q2wBisBnYdwbG42NhCsj6Nvldx7ZWRC
         L7ag==
X-Forwarded-Encrypted: i=1; AJvYcCVCNHnPe2DUdW9SpIkIyXr2MwzchBAXxZfl36wRAKjbLqum/jFZMuxzAJo2Kc80o8f7bM02fQ0aDkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2Jtw1HGP5M7t54X855LD9U9i1EKWiJ1XZ1ufFZ0yiEVsAPIuG
	9VuoWUjhAdBZ/RAmP31yNLaTjIP2oYt7jQ2e970fPBqYhnFq6IS788vo
X-Gm-Gg: AZuq6aKLXojCNxrpjyoyiazHMixqtGhlNDJW5I+p4b4stRKUw20CrPAZFhzqX/smiOI
	E8AWXh+Awt7pwoXg46cLfcR2J3VRTB35yQs1w2ckiNoXuLWMjLJYIQ7wkHSBvXUi3wNP+o84PEo
	YxpIJH4WfopHEwxiOi3lSrh6Owqg8btTHFv72kk80y52CXmTF6bYWtZnr1cBIDg6vo2w9ICfvZ8
	pNTqoy431gzQ1RT/sATSiBgky+l7htmHXcsr0i1JtLIcxfmh4/JOaoj1Y4RSJuHwMshAzMAMI4+
	el1mpGEn2OO1OAj/LPWkTImcv4KFbzBNgqkp2NXAp8cPtjlBFvx/rgAc3iLeDIR+MtEMN/kP7gH
	LBapB6uMnxw9/nboTkjV9HFPK7SSf2N/3LUwqVdI/AFFEULpqXRdpGRDuQzd4u3jtfGypultDkZ
	LL2pWcRMhjy1ZDU0j2n8PVCczq+b0eq67do/yO1PW5S7Wn/8O+5V0/lZj0VdpZwVDy985IV8Iuz
	5mEwe+N2tPTf+IQlg==
X-Received: by 2002:a05:6402:50ca:b0:64c:e9b6:14d7 with SMTP id 4fb4d7f45d1cf-65b96def65bmr1176917a12.24.1770889185818;
        Thu, 12 Feb 2026 01:39:45 -0800 (PST)
Message-ID: <972837f3-fa50-4ec8-ac4f-4b6edabb42bf@gmail.com>
Date: Thu, 12 Feb 2026 10:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: move vCPU exec state barriers
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
 <1beb7c04-5c21-4ba2-a74e-467f659224e5@gmail.com>
 <436bb64f-39d9-4b01-9f50-7a734f3e6764@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <436bb64f-39d9-4b01-9f50-7a734f3e6764@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7629212BF27
X-Rspamd-Action: no action


On 2/6/26 4:02 PM, Jan Beulich wrote:
> On 06.02.2026 13:57, Oleksii Kurochko wrote:
>> On 2/5/26 12:33 PM, Jan Beulich wrote:
>>> The barrier in vcpu_context_saved() is specifically about the clearing of
>>> ->is_running. It isn't needed when we don't clear the flag.
>>>
>>> Furthermore, one side of the barrier being in common code, the other would
>>> better be, too. This way, all architectures are covered (beyond any
>>> specific needs they may have).
>> Don't we want then move ...
>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -333,17 +333,7 @@ void sync_local_execstate(void)
>>>    
>>>    void sync_vcpu_execstate(struct vcpu *v)
>>>    {
>>> -    /*
>>> -     * We don't support lazy switching.
>>> -     *
>>> -     * However the context may have been saved from a remote pCPU so we
>>> -     * need a barrier to ensure it is observed before continuing.
>>> -     *
>>> -     * Per vcpu_context_saved(), the context can be observed when
>>> -     * v->is_running is false (the caller should check it before calling
>>> -     * this function).
>>> -     */
>>> -    smp_rmb();
>>> +    /* Nothing to do -- no lazy switching */
>>>    }
>> ... to common code with ability to re-define sync_vcpu_execstate() by arch
>> as only x86 does something inside this function?
> Indeed this was considered already, as a possible next step.

Oh, I missed that you wrote that in Arm-connected patch. Sorry for the noise
then.

Then this patch looks good to me:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


