Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CEVBcHKhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:52:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA867F5826
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222237.1530238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2a5-0008L4-Lw; Thu, 05 Feb 2026 16:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222237.1530238; Thu, 05 Feb 2026 16:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2a5-0008Jb-H0; Thu, 05 Feb 2026 16:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1222237;
 Thu, 05 Feb 2026 16:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vo2a4-0008J5-S9
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:51:48 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f608769e-02b2-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 17:51:48 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so11628315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 08:51:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d3e245sm63613365e9.8.2026.02.05.08.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 08:51:46 -0800 (PST)
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
X-Inumbo-ID: f608769e-02b2-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770310307; x=1770915107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xosurgFRAJa+Xu+VaoPk9Fn04w7h4egiOjazTi8msA=;
        b=lLqP6Hd2KMUfBNmAazkBLAXQRjmm/RhRBjZ5dAmb3M1yAuG5N7E/MW+VV7V9LSkPFw
         BlL1ZxljK9SZ2nJIqgm9CTO+HtB3qdpyQmJwAYwwuylTy9SSem67z5kc7BWJtiubw0su
         2JojYzeDfkznIciTXw8xnNpEsLUwdA9dj8STugsrLzsN1zk5VMqn1naWxCmS5V0J29HD
         FlUu59qStRjNX2OK1akTPDFBdWBYHYqE2Z0fQ+bLAS0NYmaK4Qi49sbAo84M4aRtHrTi
         OUKTtvAREGmL4LIta74rN+vkAnidj9tHM40qW5b9m4zFEynx9tQa1LE8IuYMojSDbkjf
         rhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310307; x=1770915107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xosurgFRAJa+Xu+VaoPk9Fn04w7h4egiOjazTi8msA=;
        b=bO8IHOjmJp2w7BfxfDOJP0hnH8vrvLQqsnSNdvpVTHFPrE0jWa6sLwVbH2qBVcidRz
         wDxU9LOKqVVG1vRNep6qiOYQ0BbJdoeBbM66rcaGBwo2vopgtUCz/lG3f9QL/eZcBaly
         o5Lhe0cgnwL4qu+qzMdTMFBSWderBUiN+t5/gJJtFTOUHRwAYbbsrR66sLGjCIjBXs5W
         y4x8BftBzGPTp/LQ969/j88prmwfCeXmZgP0NKgxxFzVUh4AkcBG+u5WKYJXPnWeVm5j
         ONrzCyLv1I1vwuCJFsE3eH1pJ9shLe/+mPBmzZj6PYQncxvegRGmmkfn4yk91DdnMTBN
         JExg==
X-Forwarded-Encrypted: i=1; AJvYcCVwoDI3kMICKvyp+wxWDA8az2xqq/R0wSm4PXQhOG+UowlXf5ALZ88nsqAGG2frSTm+qhtMSzLSXl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv8oKUHmQQfhPKHSj+qO4aDYMWLq/m/DEBLWNgD0AnJf+QrOEh
	8YEVbPsp8ZCA17oNojTcLVzF95BLdqWsjJN3aobT1a0QVqpGWs1JHOY3
X-Gm-Gg: AZuq6aIG+r/jr3dBqSwEjTA+5AnlN2u0K6OGrFStMHs7BO5/XbjjXZaBsetCoi7/Flc
	+/skTmNwPMb49pOOHnUbWTHSZUWeXHL7xVFLcRehgHsvV4jR3YKPxpSeva1qQZFoTcKTd/5VUQ+
	oAfqgGa6dNFDuJkAPOFEm5mEfPPD8Ka6Az+NOPsHGVZyktBolqX9W0DzywkYqJx9bcUV6oBMtph
	4x7qjmg9DPbKtebsrwwsq157RXZrkx37tcWGLVfCg1PjCYOl8DqrWdSDFuLmTNlLhvx9zCHkGG8
	9qisq+InVCDg8Xsai1S94RI/xFGvPcwN88I6lNieN3ham87eBhrSvd+oFcfQpS+JchKvxMUBIoh
	I5HSk/od1CBVW/16ILD9NZVYHd6VhZQG75/spl/kBK++mM4MO59crAMb9pK1Ove7DSiBjaabhBS
	zs9M9AjgvrEonAwMqNu0yVnSUyqoguJaJIVMiLzviLESrU+Csaf8ugIYZc0+zrcRI=
X-Received: by 2002:a05:600c:3515:b0:483:14ec:5925 with SMTP id 5b1f17b1804b1-48317992008mr50461455e9.2.1770310307257;
        Thu, 05 Feb 2026 08:51:47 -0800 (PST)
Message-ID: <135afbb9-8863-4a9c-b012-832575f04edb@gmail.com>
Date: Thu, 5 Feb 2026 17:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] xen/riscv: implement sync_vcpu_execstate()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <eb254f5a49d01712f9b3745e420dd37a4a9ba0bc.1769099885.git.oleksii.kurochko@gmail.com>
 <316accc5-2e6b-4571-98a7-5776a47a4ad7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <316accc5-2e6b-4571-98a7-5776a47a4ad7@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BA867F5826
X-Rspamd-Action: no action


On 2/4/26 11:49 AM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -259,3 +259,21 @@ void sync_local_execstate(void)
>>   {
>>       /* Nothing to do -- no lazy switching */
>>   }
>> +
>> +void sync_vcpu_execstate(struct vcpu *v)
>> +{
>> +    /*
>> +     * We don't support lazy switching.
>> +     *
>> +     * However the context may have been saved from a remote pCPU so we
>> +     * need a barrier to ensure it is observed before continuing.
>> +     *
>> +     * Per vcpu_context_saved(), the context can be observed when
>> +     * v->is_running is false (the caller should check it before calling
>> +     * this function).
>> +     *
>> +     * Note this is a full barrier to also prevent update of the context
>> +     * to happen before it was observed.
>> +     */
>> +    smp_mb();
>> +}
> Where's the counterpart of this barrier (going to be)?

As it is mentioned in the comment it is invcpu_context_saved(). ~ Oleksii


