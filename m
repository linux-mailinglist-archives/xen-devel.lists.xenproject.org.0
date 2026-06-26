Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mSWpBVorPmo9AwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 09:33:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635616CAF8C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 09:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RNr57u8a;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345940.1604543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd13J-0006vi-Of; Fri, 26 Jun 2026 07:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345940.1604543; Fri, 26 Jun 2026 07:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd13J-0006u3-LI; Fri, 26 Jun 2026 07:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1345940;
 Fri, 26 Jun 2026 07:32:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd13I-0006tx-0b
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 07:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd13G-005qiR-SW
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 09:32:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e2b15-e002-0a2a0a5209dd-0a2a45049d76-8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 09:32:38 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e2b16-a01d-0a2a45040019-d155802bc50d-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 09:32:38 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso8148515e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 00:32:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269009163sm64494905e9.11.2026.06.26.00.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 00:32:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782459158; x=1783063958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUxVBj8XIakN6zn8+RPIXWbA2r7d288fvKzWCKUF94k=;
        b=RNr57u8avyQNypplbevBe18++kVCCTHf1DAWECewJybeSzR5IvoZTwHYSvdy0Obb7c
         z9ZvLMN77qco2oh+bvz4EHReQTjDTCvtppPKr1sSCE8X65eKDyHDmPpCY5zItWjEJjGr
         791OOWsV+HX0+fYsDlnQ75wfK5PTYg63JCL8Bj6QQkgKQ344B/443Msww5W+ZKKBGmMj
         HigHxxUbnpu6ea56fAKsMuvAk5vDOM/NutqOap0uHC3g2t6+Eg52uSMg05FecBjXn5gj
         8hwXbI6ibSi1Zy86DOmoUmazX3aXg0BYErUGJhxaf1CLPFwK7EafBzcHMfBDkyPzyAMs
         e4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459158; x=1783063958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUxVBj8XIakN6zn8+RPIXWbA2r7d288fvKzWCKUF94k=;
        b=ka2DeL5Ote4ErrVXU1uRqUxJaIG/gVbeVC6ZvIx0KRUsU/n5BP/fc/8zuzhIlLMMfv
         RJrIZpCF5ITPgYbrEeJnZoUHXfmAT3NmGm5ZfdT8jAC0qFZX67NDkZRxyLqrqmKQ235d
         dddxwodx6p2dUMvchTWC7dTf+RtdpgpJPF6lpU1B8q9lCBGNrSWS+jeXhBINist/89OT
         1Wam3W3LDblwS6gR8GjbWHdvYyOU0YRoVl7pSenE9w/OXTZQyv6kt9QEj7HG6JZtlUQS
         4mUZL7dROQezbKYVo34ZofA8QG3vVLOCMLzBoe8pc8NTzXLu494hKQ5yqlSwTF0uceKr
         Hkng==
X-Forwarded-Encrypted: i=1; AFNElJ8JmyCmUU44vmTyFhs9BlHfNxGig/lWw/U+DKWND7lm0jpbjFRD3po2RTYs7PwoQ2oLFmKNYyMrWVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM4VunK6JjWmu9fHKlQkTcXVhGMAiRgse2AjUHAC7FKDoVhYka
	bRRS4a2sIOG54N40aA9ZikA4THP/nZ6w8i4t/ogrVLznAUl6kaj/FR8S
X-Gm-Gg: AfdE7cmCS4VJLfnUiK5WkvZBCy1qBrIFKE2OpBotya5WH3A2NTyExUo3osrfrV5ftti
	HaWuwlzIIoC4Bk6ClLhNgEVhitCI3YiUHHnsbFFO4hRE9tSl/bfscIZQgSrBlnQ0+3owW54p62C
	BSUN/p37DwnVpcEq4Mb7MDm8+oZxfn+G4jjkHSuaMAaYoJl6ZNm7u0WKJSV2zTXhB+CVIHpghtO
	HjqqktA4zLRjnmausu8ZoPKHcokngv2S9cDYnG1PRgx5a4d//nUY6cOjcYN+xqFllQcvMCEd8/z
	bMX/SHvMGucumHfY0B9AGIQhJo7hb2METdKZq9kjy+7G7EDaEMRNqUnyprTqZL5RbI4E7ljS4bs
	ZAYepFM12YYxYkpaz/NJ49ELrH0DZjAi+ARvgu69yrRm0hahQbTvd+zc2TWrws+AeEBIVqTjpjV
	JUOwoG2vEON8XeEEgCgxx20uHXLFNkmpJVVk8FITGR1Ejo0p5Qj0gQLYnjnycBmlZ7meM=
X-Received: by 2002:a05:600c:a0d:b0:492:6487:a87 with SMTP id 5b1f17b1804b1-49266893009mr82012035e9.32.1782459158022;
        Fri, 26 Jun 2026 00:32:38 -0700 (PDT)
Message-ID: <b0968234-06b6-4a22-96bc-5cfb51b36afd@gmail.com>
Date: Fri, 26 Jun 2026 09:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bootfdt: Fix infinite loop in device_tree_for_each_node()
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <8836494cb51f6e1f4b094fc690876d344adb47f3.1781955521.git.dmytro_prokopchuk1@epam.com>
 <50068b88-c7f7-4a66-a5a3-afbb2d2b6fb0@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <50068b88-c7f7-4a66-a5a3-afbb2d2b6fb0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782459158-AF5201CC-B68D59ED/10/73395122804
X-purgate-type: spam
X-purgate-size: 5232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:email,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 635616CAF8C



On 6/22/26 9:10 AM, Orzel, Michal wrote:
> 
> 
> On 20-Jun-26 13:49, Dmytro Prokopchuk1 wrote:
>> When a node's depth exceeds DEVICE_TREE_MAX_DEPTH inside the
>> device_tree_for_each_node() loop, the code prints a warning and
>> executes 'continue;' statement, which jumps to condition check,
>> bypassing the iterator update step:
>>
>>      node = fdt_next_node(fdt, node, &depth).
>>
>> The node and depth are not updated, the loop repeatedly evaluates
>> the same too-deep node, causing a hang.
>>
>> Fix this by wrapping the node processing logic in an 'else' block.
>> This ensures the loop update step is executed on every iteration,
>> safely skipping deeply nested nodes and doing the traversal.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> Please add a fixes tag:
> Fixes: 40f2ea3df2e2 ("xen/arm: pass node to device_tree_for_each_node")
> 
>> ---
>>
>> Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2615174670
>>
>> Local tests.
>> Tests were based on "qemu-xtf.sh".
>> In the "/chosen" node were added these "levelN" nesting nodes:
>>
>> 	chosen {
>> 		stdout-path = "/pl011@9000000";
>> 		kaslr-seed = <0x6ae81a67 0x26e92d62>;
>>          level1 {
>>              level2 {
>>          ...
>>                          level19 {
>>                              level20 {
>>                                  compatible = "test";
>>                                  value = <1234>;
>>                              };
>>                          };
>>          ...
>>              };
>>          };
>> 	};
>>
>> Without a patch Xen stuck printing the same message in a loop:
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) Checking for "xen,static-mem" in domain node
>> (XEN) Warning: device tree node `level15' is nested too deep
>> (XEN) Warning: device tree node `level15' is nested too deep
>> (XEN) Warning: device tree node `level15' is nested too deep
>> (XEN) Warning: device tree node `level15' is nested too deep
>> (XEN) Warning: device tree node `level15' is nested too deep
>> ...
>>
>> With a patch these too-deep nodes were successfully skipped and Xen
>> continued to boot:
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) Checking for "xen,static-mem" in domain node
>> (XEN) Warning: device tree node `level15' is nested too deep
>> (XEN) Warning: device tree node `level16' is nested too deep
>> (XEN) Warning: device tree node `level17' is nested too deep
>> (XEN) Warning: device tree node `level18' is nested too deep
>> (XEN) Warning: device tree node `level19' is nested too deep
>> (XEN) Warning: device tree node `level20' is nested too deep
>> (XEN) RAM: 0000000040000000 - 00000000bfffffff
>> (XEN)
>> (XEN) MODULE[0]: 0000000043200000 - 000000004337afff Xen
>> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
>> (XEN) MODULE[2]: 0000000043000000 - 00000000430ef7f6 Ramdisk
>> (XEN) MODULE[3]: 0000000040600000 - 0000000042f4ffff Kernel
>> (XEN) MODULE[4]: 0000000040400000 - 0000000040412fff Kernel
>> (XEN)
>> (XEN) CMDLINE[0000000040600000]:domU0 console=ttyAMA0
>> ...
>>
>> ---
>>   xen/common/device-tree/bootfdt.c | 31 ++++++++++++++++---------------
>>   1 file changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> index 7c790b9a4d..4d10013b2d 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -90,23 +90,24 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>>           {
>>               printk("Warning: device tree node `%s' is nested too deep\n",
>>                      name);
>> -            continue;
>>           }
>> -
>> -        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
>> -        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
>> -
>> -        address_cells[depth] = device_tree_get_u32(fdt, node,
>> -                                                   "#address-cells", as);
>> -        size_cells[depth] = device_tree_get_u32(fdt, node,
>> -                                                "#size-cells", ss);
>> -
>> -        /* skip the first node */
>> -        if ( node != first_node )
>> +        else
>>           {
>> -            ret = func(fdt, node, name, depth, as, ss, data);
>> -            if ( ret != 0 )
>> -                return ret;
>> +            as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
>> +            ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> The added indentation level pushes these two lines over 80 columns (the
> ss= line was within 80 before this patch). Please wrap them while you
> are touching them. With that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> 
> You don't carry [for-4.22] prefix, but I think it is simple enough to take it
> in, so we can ask Oleksii for his opinion to take it for 4.22. @Oleksii?

It looks okay to me to hav ethat in 4.22:
  Release-Acked-by: Oleskii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

