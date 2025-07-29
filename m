Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032DB15367
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 21:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062986.1428742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugpwe-0003ml-G4; Tue, 29 Jul 2025 19:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062986.1428742; Tue, 29 Jul 2025 19:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugpwe-0003jg-Cb; Tue, 29 Jul 2025 19:25:04 +0000
Received: by outflank-mailman (input) for mailman id 1062986;
 Tue, 29 Jul 2025 19:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugpwd-0003ja-7f
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 19:25:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b949ebac-6cb1-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 21:25:02 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so69093f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 12:25:02 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4588e5cc9a6sm41358615e9.17.2025.07.29.12.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 12:25:00 -0700 (PDT)
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
X-Inumbo-ID: b949ebac-6cb1-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753817102; x=1754421902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uIQY/b8N1qu+5uIiYCHQRex4PzEx+Ds0o0oZQ03ofNk=;
        b=EMSzb9u98Kkn4RkKgOenR7wKbKV9VWiFyV0OLaNIqOyzGTrWJ6AwNM46+2xWGGq67K
         6bvuP9bPo/557pekv8j83xEnAQaLmqnw+FfUW7Z6lQUxwVRVfDQkKs5KEWAK8Dj3/rSn
         cenXv7cG01qnkKHgz+xfbgLyFDbFVZ/iCJW24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817102; x=1754421902;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIQY/b8N1qu+5uIiYCHQRex4PzEx+Ds0o0oZQ03ofNk=;
        b=NeVdXrqgsGa5+3lcXlXLPfyRFYjyB1+yn81rGj4dgnLJcXDRSJQDnc7ofybvVYRh/q
         gLs+wlvhIOXxPZDvpEo8bYeNHQ/Sb7prnjI+3D7BFPr/LH5kfLS9FI4zUxGVS8//m0DQ
         julMgnSQp4RG/jm2tAns/WXX7qdPQ2C6fZkquABEcDxM3bkHmYQMV7ykxl+dpiDHWRNj
         Idv2vHeLd5FyOu6ptt2yyQ+b1Q7vj5eUBzIUpja6H5jvGeVyMHSIjUwvEXAC7MziO7YN
         h+bzRDP1tF3Toi/zkin3PiBD4s3JLha/PSUPH+sreniEK34fYSnv0eSNS80BVC9CKaSV
         EGjw==
X-Forwarded-Encrypted: i=1; AJvYcCVsreYBkrb7Nj3h5tZQfH5+FDTve1th+jLvcWP5kZfNjdLT6ffYQYK17ZdyjoMjJRJa+/YH1Y6zZd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqjFuEaWjQPXG7NLCq3ftIU4SPOlXSTeCZyms3MY5Lh9E6GwoK
	/B4foE3U4NJrsVRlJe/8TzPiPU/G87t+LMxUNMC1fFFh4zMAYsaRmoIibTjDn7MZU5g=
X-Gm-Gg: ASbGncswBVQiFCl25b4/zr1U4fvq99QTIMD0QUDCTUx+PMLsso3p0+Vvzfy0+BORyMT
	W7S+YiSjzvi3yf1q3RsvUj44Sp9VrfwjGFwB5ZkejubETGs9J24GcAV8l6oBCdub0To4DxbhMb2
	21pruARsEkW4OLWIBlxkPNX71jTGl05a+LCwMadPei/r9o5kwcZo0azyzzgAXl6ZVgksI0pFID6
	63ayeXeZ8coMQPcC0BR5zIpbKVhvzRIgz8Q+15ODqOJMk4uRv1YzF+739ddssmMojIqxUYXsx7h
	KEcn1i85ZGwwD11BplN7YKbQR9yzLmVWtU6Dh+lM2vtn7XobskD+n6k47v/87RzG1uXs2aMvfUc
	aveY02Eql5Mqd93cuyYQyq9gfX2tZ6cVOdsPKMQx5R2lLVNcEw0EQVEV8jAJqDR5HOS6f
X-Google-Smtp-Source: AGHT+IGB8LA6caz2dvolnrZ8ei4vjksWx/w/3w8kS93ulIL2C3qOczs7IkiTO00GRM5IGdN+VLP3dQ==
X-Received: by 2002:a05:6000:24c7:b0:3b7:9214:6d73 with SMTP id ffacd0b85a97d-3b794fed23dmr645907f8f.20.1753817101653;
        Tue, 29 Jul 2025 12:25:01 -0700 (PDT)
Message-ID: <d2eb4a63-1bec-497d-911f-cf458533cd6f@citrix.com>
Date: Tue, 29 Jul 2025 20:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-2-jgross@suse.com>
 <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dfd09f68-1d2a-42b7-ba8f-c1f54c6861ce@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 8:21 pm, Andrew Cooper wrote:
> On 29/07/2025 12:01 pm, Juergen Gross wrote:
>> diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
>> index 77e0d377c5..f2c8b92d07 100644
>> --- a/tools/xenstored/lu.c
>> +++ b/tools/xenstored/lu.c
>> @@ -27,9 +27,11 @@ struct live_update *lu_status;
>>  
>>  struct lu_dump_state {
>>  	void *buf;
>> +	unsigned int buf_size;
>>  	unsigned int size;
>> -	int fd;
>> +	unsigned int offset;
>>  	char *filename;
>> +	FILE *fp;
> I know there's already one unsigned int size here, but life is too short
> to not use size_t from the get-go.

That said, offset really needs to be an offs64_t if you want 32bit
guests to 9P safely on a modern filesystem.

~Andrew

