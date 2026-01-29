Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +w+FCeaOe2mJGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:46:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08AEB2641
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216882.1526800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlV9t-0000tR-Fb; Thu, 29 Jan 2026 16:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216882.1526800; Thu, 29 Jan 2026 16:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlV9t-0000qS-Bs; Thu, 29 Jan 2026 16:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1216882;
 Thu, 29 Jan 2026 16:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1BJ=AC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vlV9r-0000qJ-Mj
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:46:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02871d12-fd32-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 17:46:08 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso10273185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:46:08 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5dddb2bsm725705e9.8.2026.01.29.08.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:46:07 -0800 (PST)
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
X-Inumbo-ID: 02871d12-fd32-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769705168; x=1770309968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ijeuy7NR98hE9WqGDyBoicU2CZPmwQBUOd7DtzCUen4=;
        b=VVCRgEsksXfKR7iQzGzvn7R+iBfldaPtYaEK02JETUtO/d5yizg2Amt/djk0OnWuBc
         sTnLdKoI41ONH6hvyIGoBNGTrXaYPSN1UlR9dB/DuRyMx6UsUWqPVygI8i45P0jW+CVR
         42mNO9QMFUvvBX1hVDNdKq6LTtsqLWn+ncikBFDpXCorVPUnGjm6XAeNATz6fj9DhOnJ
         S7fS7kkdQnpxw2wo+lZLTDH5hN0Uwbep2YyB6CizqcOv5HRcIMO2EO3zYYQcV9gkfCvz
         lpRBSDgVUjvyzk8bI5lc8mmx8umL7L7+DpMXMjlDmq8TWJI/MykmzhyS1ragfl5L6xbx
         35xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705168; x=1770309968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijeuy7NR98hE9WqGDyBoicU2CZPmwQBUOd7DtzCUen4=;
        b=BSU2lOUEMData9Y4XbqbMH+SwxQ9fs41PaCiIF6vi6QDTpJ+iTasr1ob0o6h3J8S3a
         Nm6EsLhBrRPU7i8H/5OQU126c3pFK6cr6zRvu5Z2TGLjLy73YIDw1TXFhW5/XLX/5aYb
         OOH6G7nQjuJ9d110ycVW+R0uYolLwY23PHvGEj9Y3hZYPBW1Id0VDUtTkTVqdL9+HpVb
         xDCJhuTUYe3yDsFYInZiCP7p4KuMzBl3kErf2N9JSexkfpqbAH2o+/iWEDkHTRnymkk2
         87U27KCm9LkAc4UdomYPw/BdlK8I6w/goA/IiQpmoX3eboA2ZjsQb3wbofvTt/zqjtYG
         aRCg==
X-Forwarded-Encrypted: i=1; AJvYcCWoVWFQln/z53MlO8Tim3/O4vM+qsIRJ80MZj/B2gtbSDxKGViIW/lRvFa/j0Py2q29BtTe1ZMdB9E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP5SEkidqbMOewb+S843KvvttvrjHzcrrnFG1s0UVi1gfzZEFV
	nZhRBYUCruJ4XJGLJGZDRZylAfscimLhYWSK/sPWHr9CD+C66lD13dO1
X-Gm-Gg: AZuq6aLl2k7YwHWjDMkKKKs/3n48z3H6uEXNnWYN1zuUO0RbFFq5LfGhceShnXafDxH
	QiQ0MzBw+d2GIKj0qTVh6amm1se/kCmtoenveZG1IDvas93zWZ5+5e+FBmNjR2ppN7RF07JCsul
	nXZQqRoDqkTRQEjKW9E8YDciptn4oFxxcEG2RqT07Upsd6Wc+2IsjeBhEYL6Y42klAyaRrQIJvn
	v/KZOFZ5rS+YeLiJol33U2h/6F5gefkNUg321iPDeFnQB8dZ9/8A5IGws5CLdzY/wabCS0kAhv+
	0sc1MvuLe6CaxmiUpzwi0QUCquSKAQAYL5HhIPxdY3F7ekZg9qsk4em4f8EKLRvOXrUbXUbbjkP
	KhJzJn+CEOIQGaaPEdaTOVBai/QYYQRx/08SpejQ+Fa74LVF+oTOtI0f117fz9DD07TYTaKuIK2
	2U3xCpmYVVcE7Wij6rgvsMZYIZDF1MTZx5uWIA8IBTdjf6mmvkMx8rUcr3YmSz3MAoWcYKaUsOX
	A==
X-Received: by 2002:a05:600c:1d16:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-48069c9ec08mr136662435e9.35.1769705167489;
        Thu, 29 Jan 2026 08:46:07 -0800 (PST)
Message-ID: <1937ff09-1037-499a-aa01-35112e02f232@gmail.com>
Date: Thu, 29 Jan 2026 17:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] xen/riscv: add temporary stub for
 smp_send_event_check_mask()
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
 <062dbab8751bd0c27b913ce78de3a3eeb0ffe22f.1769099885.git.oleksii.kurochko@gmail.com>
 <d250f11a-9fdf-489c-a533-bc767441a103@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d250f11a-9fdf-489c-a533-bc767441a103@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B08AEB2641
X-Rspamd-Action: no action


On 1/29/26 5:32 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> RISC-V SMP support is not yet implemented, but smp_send_event_check_mask()
>> is required by common code and vcpu_kick(), which is introduced later.
>> Provide a temporary stub implementation that asserts the mask only targets
>> CPU0.
>>
>> cpumask_subset() is used instead of cpumask_equal() because some callers
>> (e.g. cpumask_raise_softirq() or cpu_raise_softirq_batch_finish()) may
>> legitimately pass an empty mask, which would otherwise cause false
>> failures.
>>
>> The BUG_ON() ensures that attempts to use this function with multiple CPUs
>> are caught early once SMP support is introduced.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Looks like this is independent of earlier patches in the series, and hence
> could go in right away? Please confirm.

I confirm that it is independent and could go right away. I, also, checked
locally compilation of this patch on top of current staging and it is fine.

~ Oleksii


