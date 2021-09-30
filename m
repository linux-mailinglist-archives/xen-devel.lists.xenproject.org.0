Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B452C41D4AC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199478.353561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqiq-0006k0-Sc; Thu, 30 Sep 2021 07:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199478.353561; Thu, 30 Sep 2021 07:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqiq-0006iG-PJ; Thu, 30 Sep 2021 07:43:16 +0000
Received: by outflank-mailman (input) for mailman id 199478;
 Thu, 30 Sep 2021 07:43:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVqip-0006iA-CW
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:43:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 110c5ba6-21c2-11ec-bd3d-12813bfff9fa;
 Thu, 30 Sep 2021 07:43:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-Ad-g4B63Nv-5uhENxI1DJQ-1; Thu, 30 Sep 2021 09:43:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 07:43:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 07:43:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:110::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 07:43:09 +0000
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
X-Inumbo-ID: 110c5ba6-21c2-11ec-bd3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632987793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpucGsVZhrfevTC5K4PRHVCceXpffo7TMvvJJoU3tNg=;
	b=WyaK/KaUG+Vqnd7y2UsLabRwDF1pB9368rCGvA4mpld4TRwjM2I+ic0wzWGM1djLcMIEAD
	5Ws75B7db4t8yqbAVmtiFOpIAtrJTkYFpCUbmltJBUnwhAn8bi5ZxMsb4dVVpCAUEOn5/5
	zHwlL25sR1MrzSnpBP8ZKr9qP5tUNXc=
X-MC-Unique: Ad-g4B63Nv-5uhENxI1DJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnl9iO/14sn5Zt2MsKCaFt9LiX9TcmuIWi+ACC+KKjmtlrcI0H94LV8AcJmzXys3ZktuQgNcxHl7zTBzc7qtV/GXjkpeWKedC4J1OgN+LDgBUnoZJRI9lCcZ65SrJbfJIrIUXggmY7WV72tozDWhzg/OE7on8nE+56iwmRpPvXIJ+BKR0G5Edw8uMZY8kZ14AW1xJsg9JHO0o2QR3wnnuOIFp93dB8XOIEWNB34Qtrhn0N8aw8ZEQYhqvogIHjX61iR/JH5gZ8v3PgyJAHLQcbxXau5p3Jhzx7EswNxTsQv+W50dkD6YFl0rE2t8C0nR4rBy3w8LbzRmq7+HQn4oHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SpucGsVZhrfevTC5K4PRHVCceXpffo7TMvvJJoU3tNg=;
 b=Y4EH+gK/2R4wwICbvw/tt2oC/zrGnjqFsw1O9wiizyIXNdp0c1lq4kCimS6P0gKK5KlsWJA83mzchRQkiqnf45O0D/Etfe0f3mmnZPDP1zzUsTM8ibWsyXhvmnvAwH4AjVdTs3sUNr8+6qKOpydUy1LIlRGbSkG7SpWmZU9K6Wza7CktykMRPf9k/z5xA0Q55K5jPI5ioj+t0p0LUvTuVx3frHRSgz44souAa6Z7OzuZPM7ElFwHu95qk5vQDfhdrGE9EvLs11ziVj8DkBy3Nx0+RXNfyw8NUGGW3TLUKb964gWxuFmJLTCkPVDpeY1M9XaDkT+NgKvKrTvhl5bW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
 <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
 <YUFdIPLo1AfM5BT2@mattapan.m5p.com>
 <3efe115b-1ff7-dcf1-8198-37bd7d7fb52f@suse.com>
 <YVD59QVbmdVwzYQI@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5a0bbc6-30ae-58f4-0326-3c6fafa9be25@suse.com>
Date: Thu, 30 Sep 2021 09:43:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVD59QVbmdVwzYQI@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 882470a9-afd9-446f-7198-08d983e5f300
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479205C4DFE5E9759E0D460B3AA9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	giJHaIKsSnH35IgGq/YldBTiCuAxA+znDDhAL0P2Xd2d6mz42Jme9+82NdPFVZiHgrTggnPINX5yVnKNAV10FCFGuCThbJBmphR9YJolIZNDEbdcfrXI5BZOKDvpYA96RU7asoVIEqrj1tKYvzq/dk+guO1NCjVcISadq9kzIZcD5L0C6XhK99p7J9wjNK9ZH543hJ6oaFq4HOjjMB5GgDQeggIdAGnG0lXfkaUKWhOFpxoNL0dWn2PWK0v+yafJSlp0JW/cHKL2K/PIfHjcyFFrZ32TxQC+WE67tsL4tm28WgUkE5MgvAR/WMazRxglIUCysh9vUp5IedjzDSH6GNiec6G1HHl3j1yM890ITZQLONbZ2P9MRO9ILnjVYhOW7ypBwmwpRbvchs4bw6Xb+XDUDPPMWkll63RlutJm6iwGkEDERcFlmkIGnVySDtmnoSPbERcOHlhBi3WPaKlqEdI2/TTrCOKyFOGTRgdl5fUCCbw/jyW57nDONOk0srD2+yesPWQB1lOjvQUItdHDjqkn+CCe2UUprltgIDtGswG/05pw19BLRWz7QnX57hd4gNAWiLU/HdG4kgalsFkr+woBoBzHwSwQ6vDXTbHAcsvf9eUh4M527tUt7WNGdSU1T64RVE1S1Ymq6LWs4Ne/S+pDt9fsnqGU6auP51QqM7zD0wJJnn2qlNl/1VLC6MKCtJ8HOwwUO4FO9UU/b3tISI7awjVENYWA3jEz4Zb6AkE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(8936002)(83380400001)(31686004)(38100700002)(6486002)(8676002)(66556008)(5660300002)(31696002)(66476007)(2616005)(66946007)(956004)(3480700007)(36756003)(2906002)(53546011)(186003)(16576012)(316002)(26005)(86362001)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEp2a3dISU4vYUQ0bVJjdjF6eC9hUzNIRUM4bW0vYWRlREdFSG9IU0pEeDRZ?=
 =?utf-8?B?NEZVM2dmaXBzWjR4UGVNUU8vSldjN2d0NDY0UTliMmdJbDI0aEFZZ2RkZGFl?=
 =?utf-8?B?MmZDTzhZL2c4OExpV2ZVWG5nSjVSZXdhWldqcDVwL293QVphUXJYSGVKODFU?=
 =?utf-8?B?VUZlQXhkZ3RGU25QeHpNN1F1V2xLUk1Yd0tXTERWNlJFSUpFQ1psUzJVdHE1?=
 =?utf-8?B?SUU3NnFkQkpKbFBZYnZrK2JabC9nd3pTTzNjb1k0bDFSMHFRcG1EYnowZkZ0?=
 =?utf-8?B?U2V5UTBWRmxNWDZqeExQT1dQejNyM0lOMVI0dVZWZWViVnhvNDVYSXZnRzdG?=
 =?utf-8?B?dmc0YUhWb0dqeVVXWFlnU3RqMjNvcklzbWVNc09OY2VGbm9wd2M5dDdmRTRE?=
 =?utf-8?B?bDBRWVIwTUJTZGR1OHJSMG5WVmFyMGhQeFpMdHNPcnc3Q292Zk9PL0svcGhK?=
 =?utf-8?B?MWNpSWkzazRjb2pDMlNaem5vdlI4MXE0bG52YzlrZHhYNXdxYitUWUV6UFhi?=
 =?utf-8?B?R3VnZVdyODdvenc2QmE5ekxGeWZGTW1EejcwSitVL3ByNlRjenYvQWdJSysx?=
 =?utf-8?B?YjBwbnlNMk9ORkZPeTRPZWpqTXZwUXFIZlBLVG5rbWw5SlZJSE5XVDZCaUdU?=
 =?utf-8?B?WXJSeDJKWkw0MEdUanlDUkNXV0RIdzVnL0kxRkxIUWhTbUMveXpXUGkvaW05?=
 =?utf-8?B?RmNUbnU3LzAzdVBvbjYvZ0NrbzdmUUtORVM1TXRMaWtmaWdXcFBsKy9GQ1RQ?=
 =?utf-8?B?cEVVQlQ3eDdyM3h3ek40UDZ3Vy9zWmNaU20wNUV2Y2FWSURmZ05iWGF6Rnhp?=
 =?utf-8?B?QVplZkdOZE5sa2dLRDUzSE9iYldjNDgyKzlJM3gvWEU4Y3BuYUJ4djlNSTBW?=
 =?utf-8?B?SkJYRGF3NndVQU9YOWMyeVpuYmFLWFpaM0oxU2ZkandnRTkzcnVaUk5SZ3U4?=
 =?utf-8?B?NkdLbUcyeVVwNm1meDFKZUc0Rm9QcWY0L1R2MHJSdU5EYVJyeTNiaFVHZUpv?=
 =?utf-8?B?dVh6YkhOM3lvVjlwQ0ZDZWVOQTEveU1SZmUzOGtoQ083cHBTR1FGVWlWY2lR?=
 =?utf-8?B?dVBKVmwzVXUwSlhNbTNqd28xNzVKVG4zRllYZVNDZHRIVlZhSEU2cDY3aUtj?=
 =?utf-8?B?QmdVbUlkdjVha2NFR2NPSlpHL0NhMlNKTE8rd3F2MCtmbUlkam9OR1dBMzZa?=
 =?utf-8?B?dU8wRnd6UGJUTGhFa2tWa29xbmIxWnpNcmdTZkhCeENMTXdKbkNhZFN3azZk?=
 =?utf-8?B?anNBd2hhQUNlSUVheHI4c3pkMU9BTnkwSW1ybmRScU9UTFd0RGdyaUMySHpm?=
 =?utf-8?B?MnA5NzVhN1N0TEJoczNVVmZUckkrbG4xckRKSk9FV3ozU0g4RDlnOVhodXQw?=
 =?utf-8?B?RUUrbHR6RWtTeTUwbDAvNnJ4VmpaWFVGOUhrRjZvTjZSSUlqZkE1V2Fwczhu?=
 =?utf-8?B?VzMvMVJZR2FVZTdCczl0MExJbHYyNllDOXNzclUxcFdWd1hxY3UrU2tpcVZ4?=
 =?utf-8?B?Z1R2ZmJ5VjVla054SWlRNzBKWkwzc0xnQ0FyTG1RV1JlZStZaE4vQXMveU9O?=
 =?utf-8?B?TWxNZnNRVHZzTDZMeUFCZWNmaVRLajJEejUxT3JGd0JTekFOUGljYUNvWWZB?=
 =?utf-8?B?dzVmZnVDTS8rdXNlMGY0eW9hS054aE5GWUN2KytVU3ljeXVGMHRabFdZQzd5?=
 =?utf-8?B?TWhLTkJTTXk1QVloQ3hwMTM3U0hrcVhGVTVjSnpKMTNiNXpqK1Z0SFBpbTlX?=
 =?utf-8?Q?7vZnpbX5v/Hco6K48YXy4YsYyZx6H+tqMPWo6g0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882470a9-afd9-446f-7198-08d983e5f300
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:43:09.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8aGpajH7av7GBE+eCr+jpVZ4BwYN404noWfcx38tqXT1Tq/iRuenofnjE364QYqB1IeCN1ZgxkUa4fqv9d6+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 27.09.2021 00:53, Elliott Mitchell wrote:
> On Wed, Sep 15, 2021 at 08:05:05AM +0200, Jan Beulich wrote:
>> On 15.09.2021 04:40, Elliott Mitchell wrote:
>>> On Tue, Sep 07, 2021 at 05:57:10PM +0200, Jan Beulich wrote:
>>>> On 07.09.2021 17:03, Elliott Mitchell wrote:
>>>>>  Could be this system is in an
>>>>> intergenerational hole, and some spot in the PVH/HVM code makes an
>>>>> assumption of the presence of NPT guarantees presence of an operational
>>>>> IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
>>>>> code, some portion of the IOMMU code might be checking for presence of
>>>>> NPT instead of presence of IOMMU.
>>>>
>>>> This is all very speculative; I consider what you suspect not very likely,
>>>> but also not entirely impossible. This is not the least because for a
>>>> long time we've been running without shared page tables on AMD.
>>>>
>>>> I'm afraid without technical data and without knowing how to repro, I
>>>> don't see a way forward here.
>>>
>>> Downtimes are very expensive even for lower-end servers.  Plus there is
>>> the issue the system wasn't meant for development and thus never had
>>> appropriate setup done.
>>>
>>> Experimentation with a system of similar age suggested another candidate.
>>> System has a conventional BIOS.  Might some dependancies on the presence
>>> of UEFI snuck into the NPT code?
>>
>> I can't think of any such, but as all of this is very nebulous I can't
>> really rule out anything.
> 
> Getting everything right to recreate is rather inexact.  Having an
> equivalent of `sysctl` to turn on the serial console while running might
> be handy...
> 
> Luckily get things together and...
> 
> (XEN) mm locking order violation: 48 > 16
> (XEN) Xen BUG at mm-locks.h:82

Would you give the patch below a try? While against current staging it
looks to apply fine to 4.14.3.

Jan

x86/PoD: defer nested P2M flushes

With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
order violation when the PoD lock is held around it. Hence such flushing
needs to be deferred. Steal the approach from p2m_change_type_range().

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -24,6 +24,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/page.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
@@ -494,6 +495,13 @@ p2m_pod_offline_or_broken_replace(struct
 static int
 p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn);
 
+static void pod_unlock_and_flush(struct p2m_domain *p2m)
+{
+    pod_unlock(p2m);
+    p2m->defer_nested_flush = false;
+    if ( nestedhvm_enabled(p2m->domain) )
+        p2m_flush_nestedp2m(p2m->domain);
+}
 
 /*
  * This function is needed for two reasons:
@@ -514,6 +522,7 @@ p2m_pod_decrease_reservation(struct doma
 
     gfn_lock(p2m, gfn, order);
     pod_lock(p2m);
+    p2m->defer_nested_flush = true;
 
     /*
      * If we don't have any outstanding PoD entries, let things take their
@@ -665,7 +674,7 @@ out_entry_check:
     }
 
 out_unlock:
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     gfn_unlock(p2m, gfn, order);
     return ret;
 }
@@ -1144,8 +1153,10 @@ p2m_pod_demand_populate(struct p2m_domai
      * won't start until we're done.
      */
     if ( unlikely(d->is_dying) )
-        goto out_fail;
-
+    {
+        pod_unlock(p2m);
+        return false;
+    }
 
     /*
      * Because PoD does not have cache list for 1GB pages, it has to remap
@@ -1167,6 +1178,8 @@ p2m_pod_demand_populate(struct p2m_domai
                               p2m_populate_on_demand, p2m->default_access);
     }
 
+    p2m->defer_nested_flush = true;
+
     /* Only reclaim if we're in actual need of more cache. */
     if ( p2m->pod.entry_count > p2m->pod.count )
         pod_eager_reclaim(p2m);
@@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
         __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
     }
 
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     return true;
+
 out_of_memory:
     pod_unlock(p2m);
 
@@ -1239,12 +1253,14 @@ out_of_memory:
            p2m->pod.entry_count, current->domain->domain_id);
     domain_crash(d);
     return false;
+
 out_fail:
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     return false;
+
 remap_and_retry:
     BUG_ON(order != PAGE_ORDER_2M);
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
 
     /*
      * Remap this 2-meg region in singleton chunks. See the comment on the


