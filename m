Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A733DD654
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163021.298749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXY7-0006ns-Md; Mon, 02 Aug 2021 13:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163021.298749; Mon, 02 Aug 2021 13:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXY7-0006lr-IU; Mon, 02 Aug 2021 13:00:07 +0000
Received: by outflank-mailman (input) for mailman id 163021;
 Mon, 02 Aug 2021 13:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAXY6-0005r0-Ij
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 13:00:06 +0000
Received: from mail-pl1-x636.google.com (unknown [2607:f8b0:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56f72e1c-05ae-4824-a716-915ecc398201;
 Mon, 02 Aug 2021 13:00:06 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id k2so1952173plk.13
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 06:00:05 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 c16sm12058607pfb.196.2021.08.02.05.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:00:04 -0700 (PDT)
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
X-Inumbo-ID: 56f72e1c-05ae-4824-a716-915ecc398201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EeSreHE5hdlnf0oXwm47d4tHu8/yxl93O4VWV6niMlg=;
        b=efFY4vl/l2ivNbm9EOrCQxUa+dPOqt+8w3noLnVCdDetf0McOpBx3fU1tspnDVVuA9
         7Pzv+sfvPIPgVGU0Gqn+pSKd3nKVxLIzug5jkaYAf1sxqB4Sj0UeiEE6tIsKyIsNrbdb
         ZzB+XhOGshwvZxs1k3uAu6PqViC47olBDYUYasFKmXsBP6Tc5r37JShifRbS9KCBLzOo
         ccydI/zYibadoznRJjQWxzc/7VlNTvJt95AEOP6ibHmciLPQPtUqMmcQXmeQ5eZpI1FU
         pyJaLee84JdYVXLzgQtCDJTZdDbbh45idglyEUAoA7BOt7lOK6B0ANXplELatDb4KrR+
         M5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EeSreHE5hdlnf0oXwm47d4tHu8/yxl93O4VWV6niMlg=;
        b=c77vX7OQI79uBJYQBrEhTY0CBcXIAaS2MkiEbLRe9AwL1Dh8xzs8DJA2iJoFmfzN5/
         2EFH6u7FcVcMvIuRWpdne+2SPJlQcN6X2GhzdY3SyOf0TrGtzuSQVheozHNUwr0Q03G4
         5LC7rE51v6SSF2tOlvibBhRWafJ758OL1QIijHbrRv+SLiw6pxq7ZWQvfN0n2OUfkpbG
         aK/Wao0fE2MSoQ0R9XlnnZs8zG1omnODu7v0JtEPxCHAdRapBb6b5URQr4n8PCHiNQFs
         JoAmFVwipF32ne5mmPjyGaMYRNlbnFzY2reMmE43zxfP3yUNKdXp/soI3KJuzGM4Sj/l
         ey+Q==
X-Gm-Message-State: AOAM533hyO0xXEWdYEb6gZ3wbLbLiM4NBNFJEk7M/is0YyNCwlZ6hp9s
	CG5gT4VIPOBpolBfO+QgZpQ=
X-Google-Smtp-Source: ABdhPJwQqurl+5kiEreCzf7V/W8FK4cyMJ1mZbyof3Kxoh8aAKG0BtZ6XERTRpAICjuoFK7OauJ+1Q==
X-Received: by 2002:a17:90b:3556:: with SMTP id lt22mr17715473pjb.174.1627909205346;
        Mon, 02 Aug 2021 06:00:05 -0700 (PDT)
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@intel.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
 kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
 Tianyu.Lan@microsoft.com, rientjes@google.com, martin.b.radev@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <c00e269c-da4c-c703-0182-0221c73a76cc@intel.com>
 <YQfepYTC4n6agq9z@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <996e46e1-6776-6c87-d791-0df6f0aa58dc@gmail.com>
Date: Mon, 2 Aug 2021 20:59:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfepYTC4n6agq9z@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/2/2021 8:01 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 08:29:41AM -0700, Dave Hansen wrote:
>> __set_memory_enc_dec() is turning into a real mess.  SEV, TDX and now
>> Hyper-V are messing around in here.
> 
> I was going to suggest a PV_OPS call where the fitting implementation
> for the guest environment can be plugged in at boot. There is TDX and an
> SEV(-SNP) case, a Hyper-V case, and likely more coming up from other
> cloud/hypervisor vendors. Hiding all these behind feature checks is not
> going to make things cleaner.
> 

Yes, that makes sense. I will do this in the next version.

