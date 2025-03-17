Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CEFA661C7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 23:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918181.1322911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuJ5n-0006Y1-SH; Mon, 17 Mar 2025 22:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918181.1322911; Mon, 17 Mar 2025 22:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuJ5n-0006WB-PP; Mon, 17 Mar 2025 22:37:55 +0000
Received: by outflank-mailman (input) for mailman id 918181;
 Mon, 17 Mar 2025 22:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oAQD=WE=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1tuJ5m-0006W5-1Z
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 22:37:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73c18d6e-0380-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 23:37:49 +0100 (CET)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-QoMxqy4uOoGdsveaQ1UC_A-1; Mon, 17 Mar 2025 18:37:46 -0400
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85b48bd978cso522778039f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 15:37:46 -0700 (PDT)
Received: from ?IPV6:2601:282:c100:48a0::aa6? ([2601:282:c100:48a0::aa6])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263702075sm2481735173.6.2025.03.17.15.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 15:37:44 -0700 (PDT)
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
X-Inumbo-ID: 73c18d6e-0380-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742251067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uz73BbCUaqtdYR+gICGbN6AT48ejOu9pXaDANWFGjaE=;
	b=ilPt7IndygqbBshLqzD5ifIlAiiXL2llL20DqGIeAUseDUjYcNUT6jvl1lTGCrrloRQcDn
	NoIXScGv5+YWL2+nlgCZdChG8l1XdzkePwi+GSVbjHzoqlcER4ca1zutIGUyra+PQOIG/o
	YrNS2OeE3JuWuIQP7unqJGmiJu3aC+s=
X-MC-Unique: QoMxqy4uOoGdsveaQ1UC_A-1
X-Mimecast-MFC-AGG-ID: QoMxqy4uOoGdsveaQ1UC_A_1742251066
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742251066; x=1742855866;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uz73BbCUaqtdYR+gICGbN6AT48ejOu9pXaDANWFGjaE=;
        b=aaY4ji4dl+9cMipj/cObI1ojpdaPpNtPXcl/YQ+1OtZa53HBbGbGBpRBCrNUcCKNDc
         wOKMsB+OltRp3msshNkfcCLJs7qENgMtDfb1mKgJcw2BCSqxiqgirE3t/+lMCUXwH6jh
         cuLXv5YHzbBXqlx9YFURQmX/sLQjKGvOdMYq5cFjK23NmqL04V4C52kZeYED9TZySiKR
         Nwz1T0XDzZub+1Y6qLmBCExxOu3I4Mxeaf0JPt/FBlp32AE+HH5rzTggs4TmSWwureGW
         AGPY6ht+1skOfzIcNjer+XxMCmMGkmX0fw0DaM54lhR40WvFf/fMltmN7qLsB3n8/3Iz
         NHeA==
X-Forwarded-Encrypted: i=1; AJvYcCVIx058gfggcxyclBqMnZjbZX3AnCwpwzu6Ifne6aXSKi9RO3dkaeY8UkTB/nIUhNw/jfwGHbCl8Zo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD9wqxbxnYP5zVlVD4sQm/0xBszMOlvXWWIFvKTY188q5RnSvA
	1NLpjCcAb+WSY0iZt1ow92PjytnLvxvlyw06CAsqB0sZOiavGggp+7ePRAxEc2o+OPWrklDrGCl
	Rj/vdYFZ9bQxH+q0U0o5WBYEF3XRTGdo5cQAe1iSa8SSZn5KzT3OHW5Ao7MyerUV0
X-Gm-Gg: ASbGncunDWcHR1YxTta74AHXxaIF+4wwRlmlIGPqNI7G957cUMaLU+sVU6kKgYqB/l6
	A6ynh5WEj4HI3W7x+lDp6gekRPfsm1iOut7jTM2H2xMkmb/lbffvTSAf2g2wt/i/5sORysxweJO
	g1llaCK74h8fVA7oY1T5FCWzGqPDCM2lDERtNSaHpEu+G48KTpur4/gyyC/1Jub+TyAl/xR2kEV
	Ncfbnw6NkD4L7BYDlE75oN1ezIaRPBHyevHUdcBiUQdFU5iDiMtDbKCpKN+DylSpjOiDSFMpQbZ
	OaLkw5rGbX1amsMhA0Ds
X-Received: by 2002:a05:6602:4084:b0:85b:59f3:2ed3 with SMTP id ca18e2360f4ac-85dc4832c03mr1654237639f.8.1742251065758;
        Mon, 17 Mar 2025 15:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXMhXDdQ9jMsi3nNSx90SCr5dH1/wJp5bRT/DRCJ6UEq4at0o5Rp4a0vN5yQf18mlko59M2g==
X-Received: by 2002:a05:6602:4084:b0:85b:59f3:2ed3 with SMTP id ca18e2360f4ac-85dc4832c03mr1654234539f.8.1742251065465;
        Mon, 17 Mar 2025 15:37:45 -0700 (PDT)
Message-ID: <a0315ccf-f244-460e-8643-fd7388724fe5@redhat.com>
Date: Mon, 17 Mar 2025 16:37:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nico Pache <npache@redhat.com>
Subject: Re: [PATCH v2 1/4] meminfo: add a per node counter for balloon
 drivers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, virtualization@lists.linux.dev,
 alexander.atanasov@virtuozzo.com, muchun.song@linux.dev,
 roman.gushchin@linux.dev, mhocko@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 mst@redhat.com, david@redhat.com, yosry.ahmed@linux.dev, hannes@cmpxchg.org,
 nphamcs@gmail.com, chengming.zhou@linux.dev, kanchana.p.sridhar@intel.com,
 llong@redhat.com, shakeel.butt@linux.dev
References: <20250314213757.244258-1-npache@redhat.com>
 <20250314213757.244258-2-npache@redhat.com>
 <20250314180625.8c3a2a5a990a132a7b0b9072@linux-foundation.org>
In-Reply-To: <20250314180625.8c3a2a5a990a132a7b0b9072@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sWnZrCtUR6INzbdF3bIirAcr-Umvk4MJzAcKHyVI4Yc_1742251066
X-Mimecast-Originator: redhat.com
Content-Language: en-US, en-ZM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/14/25 7:06 PM, Andrew Morton wrote:
> On Fri, 14 Mar 2025 15:37:54 -0600 Nico Pache <npache@redhat.com> wrote:
> 
>> Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
>> expose it through /proc/meminfo and other memory reporting interfaces.
>>
>> ...
>>
>> --- a/fs/proc/meminfo.c
>> +++ b/fs/proc/meminfo.c
>> @@ -162,6 +162,8 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>>  	show_val_kb(m, "Unaccepted:     ",
>>  		    global_zone_page_state(NR_UNACCEPTED));
>>  #endif
>> +	show_val_kb(m, "Balloon:        ",
>> +		    global_node_page_state(NR_BALLOON_PAGES));
> 
> Please update Documentation/filesystems/proc.rst for this.

@Andrew

Can you please squash the following?

From b1b379a32752e64c60b5e3b6365c93db8e1daf9f Mon Sep 17 00:00:00 2001
From: Nico Pache <npache@redhat.com>
Date: Mon, 17 Mar 2025 16:07:18 -0600
Subject: [PATCH] Documentation: document Balloon Meminfo entry

Add a Balloon entry to the Meminfo documention.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 Documentation/filesystems/proc.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 09f0aed5a08b..2868bb74f76e 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1060,6 +1060,7 @@ Example output. You may not have all of these fields.
     FilePmdMapped:         0 kB
     CmaTotal:              0 kB
     CmaFree:               0 kB
+    Balloon:               0 kB
     HugePages_Total:       0
     HugePages_Free:        0
     HugePages_Rsvd:        0
@@ -1228,6 +1229,8 @@ CmaTotal
               Memory reserved for the Contiguous Memory Allocator (CMA)
 CmaFree
               Free remaining memory in the CMA reserves
+Balloon
+              Memory returned to Host by VM Balloon Drivers
 HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepagesize,
Hugetlb
               See Documentation/admin-guide/mm/hugetlbpage.rst.
 DirectMap4k, DirectMap2M, DirectMap1G
-- 
2.48.1
> 


