Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A2393E22
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 09:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133827.249293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmX7y-0008AS-Sl; Fri, 28 May 2021 07:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133827.249293; Fri, 28 May 2021 07:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmX7y-00088G-PP; Fri, 28 May 2021 07:41:54 +0000
Received: by outflank-mailman (input) for mailman id 133827;
 Fri, 28 May 2021 07:41:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmX7x-000887-Ly
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 07:41:53 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c312cf2a-0f9d-4e48-a459-40f23c47ba95;
 Fri, 28 May 2021 07:41:52 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8FF81FD2F;
 Fri, 28 May 2021 07:41:51 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id A388E11A98;
 Fri, 28 May 2021 07:41:51 +0000 (UTC)
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
X-Inumbo-ID: c312cf2a-0f9d-4e48-a459-40f23c47ba95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622187711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPdJQ8YPDL8kMV256eAWoFl9ZI+yCo1/juFVkI6RjKM=;
	b=KCxZmXHSvaI64T+6b4NvxQtxZk7ULPHXvkQ4W4tEzeNQYCMq7NepEec3j6LKAN4gEIQxjT
	psEVNVAN3y64OgxG+ej0yocdAfokoZrUTTiOWXto8zIkM1p2w/Mzf4kZhu3mUwH5zrbUaN
	aN3Q2V+61HFwlLBwBU6aY2KhCpl3xDQ=
Subject: Re: [PATCH v4 2/4] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
From: Jan Beulich <jbeulich@suse.com>
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <f76852db6601b1bf243781b0b8b16c7a6fdc8a01.1621712830.git.connojdavis@gmail.com>
 <3b872d59-4330-68ee-c62b-230f5d6cb2cf@suse.com>
Message-ID: <c415c691-1f59-b13d-00ec-80fee777da79@suse.com>
Date: Fri, 28 May 2021 09:41:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <3b872d59-4330-68ee-c62b-230f5d6cb2cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.05.2021 10:44, Jan Beulich wrote:
> On 24.05.2021 16:34, Connor Davis wrote:
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
>>      return dfn_x(x) == dfn_x(y);
>>  }
>>  
>> -extern bool_t iommu_enable, iommu_enabled;
>> +extern bool_t iommu_enable;
> 
> ... just "bool" used here, as I think I did say before. Can be taken
> care of while committing, I think.

Actually, while preparing to commit this, I realized this would
better be

--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -51,8 +51,12 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
     return dfn_x(x) == dfn_x(y);
 }
 
+#ifdef CONFIG_HAS_PASSTHROUGH
 extern bool_t iommu_enable, iommu_enabled;
 extern bool force_iommu, iommu_quarantine, iommu_verbose;
+#else
+#define iommu_enabled false
+#endif
 
 #ifdef CONFIG_X86
 extern enum __packed iommu_intremap {

Which is what I'm about to commit.

Jan

