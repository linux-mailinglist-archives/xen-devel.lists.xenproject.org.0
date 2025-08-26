Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2DB372F0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094989.1450148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzBu-0005SP-FI; Tue, 26 Aug 2025 19:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094989.1450148; Tue, 26 Aug 2025 19:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzBu-0005Pk-Bp; Tue, 26 Aug 2025 19:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1094989;
 Tue, 26 Aug 2025 19:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xnf3=3G=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uqzBs-0005Pe-LU
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:18:44 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6b9e9e-82b1-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 21:18:42 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3c51f0158d8so4634641f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 12:18:42 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c712178161sm17253471f8f.67.2025.08.26.12.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 12:18:41 -0700 (PDT)
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
X-Inumbo-ID: 7a6b9e9e-82b1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756235922; x=1756840722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K/87ggPVxPhk/JVrlcvj/h1+p8urGGGoBBR3nERXNno=;
        b=PsAfRGEHeu+ojChQw75cQKq5Few3dsmH81J4HzVf0jV8m7QA0WjEXQgUjoNhCxN9pW
         nFc2Kzg6YUfH6MAZMu7m7Xl/O9BO4lhiCciu8e3mcyTkYg2BAk/52BNG4S3uraTlJV2V
         ZYefs7ZtHs15DOm0umcxBdtarr0kflVcLfwoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756235922; x=1756840722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/87ggPVxPhk/JVrlcvj/h1+p8urGGGoBBR3nERXNno=;
        b=SHEAmyMb40qjEgPyjfhCnVoXAItmbBVfz4iYb08ozBepJBvb0xCq/FlurSdT8NHLxA
         78eTl6bqNMm8yfGJVEF/m1cKX+T3p6joDjb17a18Pq9iGrLyswXzSwV5pxuWUBmC988g
         RsOQmYr4ZeiDvX9b5hiLFOc0nqPhc6xwWEf9F8YQxseYH1UEDGdr2g+dKTukKUfghMgv
         9K0jS1NnjTKOfnQWinlyOKiUhSJt90u06A7KYWLE1XVMaH6I1gzDwDkpRwpEzROtmE0Z
         UuOQY9bs9MBOPaAZy6vItHRXFoGCXADKb+wuKr6QvgcEvz6JU0rH97TNACk9kmiasQj2
         YpFw==
X-Forwarded-Encrypted: i=1; AJvYcCXWoidephXyvQxQygISCUx0LDHqUX4SmCQDgtwEHuQ8V3Chn6ahGHcbmZ9bryAPa884SF33VptBztY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoxA1g4qn+CtymRbcJTmdqVNNewv7rakOMPX7hB2JSAoTmq9h/
	bjpMzoPNs+9996OSVt5wMt+2Ijz4FxLklHwvd4tRDlUoWZfhiklloBYt/n4fvYRTN4GXfuek4hy
	cRB/H
X-Gm-Gg: ASbGncshMgDdPrDLrXgDdxZWyqIrFAfnU/BdfWNp2trKUCng01EefzIw+sP7TOJDWES
	sWUX5XLD4MUHKaQty12U+zjjPKn/Uwx8tnomzp07hmuw/mAfkBcpnL0iCnLREdd4uoRVUDyAklm
	8pfbkkz4ySeB+6f56MR9J/19iPmvLeLCGFTkRrqTh8P0a9znzVhWuh6f1ndUulbUWf+chC0h16p
	KQlty08e+/bzKXyMRyUBX2Yo4fSgrPcqdNb5JfTHNFxZl8Rs5id/HSSnHsuYYvIZwaM8d/MUIav
	tWdvIv/GMWM7k3es/ucPUYaSFjtIgYdp5h92593tSbmyAujZip4nhq2NH8/zAuXu/r5JAUc29+P
	PuLbXpTz4SlGJUSarc+lowMVZlKtMP50Ojix2W3KP5w08xdzUFf8glHHKRTNRCGB6vBUCAZGXBp
	q++sGbxXABZDqm2g==
X-Google-Smtp-Source: AGHT+IGmEGbi+RRrQzlT6hi01Zaz7iW/CKtDJOvI956aShqfS5naNAZLu+iqlC6SZOhJKGDkRmLpqg==
X-Received: by 2002:a05:6000:24c9:b0:3cb:7c9:d2e1 with SMTP id ffacd0b85a97d-3cb07c9d3a3mr3103917f8f.28.1756235921746;
        Tue, 26 Aug 2025 12:18:41 -0700 (PDT)
Message-ID: <f175b0d1-7fbc-4c03-9aa0-c7eb61a625d8@citrix.com>
Date: Tue, 26 Aug 2025 20:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/08/2025 4:50 pm, Oleksii Kurochko wrote:
> Hello community,
>
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
>
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

There's still a pile of CI bugfixes (de-root the ARM containers, fix
tools-tests) and improvements (Debian Trixie, Alpine), as well as bugs
that need fixing which aren't complete yet (fixes for the de-rooted x86
containers, see if we can do something about the KBL console problem).

Adding Trixie, and moving off an obsolete version of Alpine are critical
for the release, but I need to get FRED more done before I can come back
to this.

~Andrew

