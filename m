Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358C5EC94D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 18:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412834.656310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odDK7-00036q-En; Tue, 27 Sep 2022 16:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412834.656310; Tue, 27 Sep 2022 16:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odDK7-00033s-BO; Tue, 27 Sep 2022 16:20:43 +0000
Received: by outflank-mailman (input) for mailman id 412834;
 Tue, 27 Sep 2022 16:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odDK5-00033m-Tm
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 16:20:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53fe70c7-3e80-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 18:20:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 27 Sep
 2022 16:20:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 16:20:39 +0000
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
X-Inumbo-ID: 53fe70c7-3e80-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwSjnMmWzlFYE1uyqgmhxailnwwf0bXm3l+o6stM8IUokyaTCWbdM7VJTzCnZbScGiIQw5YwjrLln4qGVQt1czE2D4ewTwl4tji/tCnzp9JPqrYgHN05LM1dneErKHKAZXiiapmAa7QnpypXg3Mec97rs4QsidJpK2g1dxD5hssgG/yf6jcoVZiuHOg1OcgqOBJYxx7gRTQk+6k0qxmfAIdrV9C4YnwnzAduIbaKR18rEHvNpCDuVAn+BFpSUohTB89eXg7zcCvcpivq3cu5wFltGQIDxyDJ+VU+TFt2v4fKM+aEqJlCxaBEczavtkfk4O0i3Rz5jN83ZYxiwDVkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl2C6p9PWbUD9e4TXc1jSPxAzi12PvEP2PHorAUQ7xw=;
 b=JDKhCNe5oQ3SL/dQoc8+PhGajadutM/FwrhdYyeFnrjOhWYw/x15h59EuQ3VCc61ZVEVkTtH/IpP2Y/zZ8kItdF4jf9nFiIpirnPvrBv7iIlYcTta+E5cnOBZ0n3nHtkUL6bqKLHazBVvwGMqlMwj+TwJ6BbvsCUXis4CfNWH8h031P8FcO+AYJIZbsRWbBRxPqrfskMhNM+AuzkWLP9b9Hw6cbZmc+SH58kNU1n3owVPmO0Prikowsi44b8ExliMoYoy/HORYHucmHKlRnjlpVxTcxPBIwZ0tp1ExRswz5yBPjADsfTRC4n+9k56jaNN4yojA27LOWE1Ocj/8zvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl2C6p9PWbUD9e4TXc1jSPxAzi12PvEP2PHorAUQ7xw=;
 b=aYcWfYU7chvJIXAwE8E1UMB5YWydRycB6ZGCAp8Pac/4smLNHKIl+GX49OpgUmlI2DgecCQ8q4w43T9qUFzhlH3XWePLi+B8p2DTtk57+uiadGLtSqdNEURZsm1D+P3uFycRGSHRG8zBFBtpvWuZUyqkoCHaP32vxNjDIUIJoCcrqBwWdyevC/TsgJQYGr9jU/6v8qBoDwmEyuq7ygeN1/qBHxbWAuHSN0W1SEMK711mtXt0VqWkd3HLQ24HvNU9AqjNs77zIvp+8a+oV1qdO0A3YI6wYvSIXfCVJZIHtMYlq85WT3lVSxJAbzf9zHQFYCMr1De63Vz6t4URZvVLFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
Date: Tue, 27 Sep 2022 18:20:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/NUMA: improve memnode_shift calculation for multi node
 system
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0051.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2d697f-bfea-42b4-de2a-08daa0a4377e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZgByzwk1wQz7XO7LThLU5XZBhGnr05dC7BJpeh1sJ0t01mHNEz61hIQYCTjPDtPhJhB2OOGijnjxE4nBUPFKOYMiPIb2Wh6fQDG4dxdf8B2kp92CSGYbwh4O2N0MDtHmbVZmE45y0mVM0BiHysY4i2UqVpbhVpHWn8cSRxvep9bUjlmRuglwWjz2XEtUrwP61E5jqM4I8WkQozN+CjYDl3aaW7/stk+vR69/aUxyb1Yjor1VchkJOqjDXmhaHYef0TJ5sVa/TV2qw7qAjUiDzAOgke0GTNUaVs1J1hu/qe+poZ1KVYRsa3t5xd+HsMerRsbVIdb534NBYY8jv7cvSKgQz255beUbgjPKR2Z7Pffyk1Dp/dy0sB11J4k74YIKALBworEulIrhFDi+tsaFRrcn5bzZ4jRfzKdHQsi8DKixiWwIZQHdGeVs+AqC7ZkzMCYzdhmt/gWqnYTpHbfQbg9le/ECJxQbMW3XRsSCSPMXhE731qBte2/qDI6FD/GxJ886Oa1xEruRrumtoLhkLjKogKxGSXnTeT0q0/bZ3lbW7SrbWjUt5hDFCgi2853s/VL+vcWNRTvATTT0bCLYgdVEodSOFkAD9hpNDx1sONwN1zypbbjieSS/I9I5pyo8R883XR8IUrPZihLImjEbR21H43arhRdFsE5SIe0KJmfAa+xa8VY0+PUxhddQCG1YiDhHMBExSX6BDf0gZpB2ihyABA8tldXoyFT5CDzdP+0QwBu7b1e75bf+SVZcp9pEE6exKsDCUl/AUG5v95aQxQFWRYntvhzSZpw1TqmGGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(8936002)(54906003)(66946007)(38100700002)(86362001)(31696002)(8676002)(5660300002)(66556008)(6916009)(2906002)(478600001)(6506007)(26005)(66476007)(41300700001)(6512007)(6486002)(316002)(2616005)(83380400001)(4326008)(6666004)(186003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5UYTEvaWdBdmtqL3JDd00yaHN0aFFnME83OVcyRlJtK1plQXl4U3VxOHM0?=
 =?utf-8?B?RnVDRDRSdDdJa05icVZVRlQvbzl5Z2dLWjRtNnRveW4rSERCKzRnTkM0K2tB?=
 =?utf-8?B?TlkxRXQ3b0MxRlBhZEYzWldDeUJ0RFVyZEhQMDFjQk0zaE1iemx6WEtZdndm?=
 =?utf-8?B?OWRFL2hKazRZc3NialR2Zk1xdWFQbmhZYU1QdUVnYWNVNDRZWXB6YUNYOTdV?=
 =?utf-8?B?b0NWRmU0Z0FiZmYxNkpJT2ZuTG51VWNYM1NLWGVid290cE04WUlieFFDMHI2?=
 =?utf-8?B?ZE5CdkxhQlNNdFg3WjJpRkZyeWROS2ltZmhrNmQyUVVUQXJKdzN0eUxLM2Iz?=
 =?utf-8?B?bFhvbUhXQXFvWXpGU1RzbncxRGdBSkVSWEVjSWJEQXJqZ1lDeE5GY2hqb3F6?=
 =?utf-8?B?S0tUc3hEdm04eEFMdUZSY093dmRMd29obW1RUU1mZGwxLzhUaEFhY3IyQmN2?=
 =?utf-8?B?TzRKVXdvOUNlaXgzM282d1VUV3VSQldOZWpLbzNVcHlPL2JXQ2dtTDV3amMv?=
 =?utf-8?B?Y0F1b05vQ0tuNmFIb01CcktteWxqSTdOL1FpN0FIY3lQbkdQMXFxKzNRT094?=
 =?utf-8?B?RzFlanpRS1FPNS9zbnNwR2tPRE5vMG1iQ3F6aStuV0tLQmJYb0JQWlpTQk9H?=
 =?utf-8?B?cjRMQTI4TlgzN0krUzdZL2NRQU42SGQvRDNtWXYvNUJJR3I4QXJJVnd3RWpI?=
 =?utf-8?B?UXhqVzF2RDl5ZFBGc25BL3BkY0NyVXpCNXBsVlNKQVBBVXZhVnd6aGlsQk43?=
 =?utf-8?B?MFdtRHR1c1Vldjl3R1M3UklFWFgwZjI0ZWJaQm1NVGtRNlhJWlVJdDdKRSta?=
 =?utf-8?B?UWJxM0R0ZDgvcTBDZ29HdFI3WjJSK0xiWHc2ZUJFZ3BCOTNTSFBUQUsxNTVG?=
 =?utf-8?B?M0N2NjRDR0hyejVOYnV1R2c4dDJjZk9VMSswRlJDMVRTZXN3S2hLQ1hJUFdn?=
 =?utf-8?B?ODViSkF1ajVJVTE2MzhiZGppTk5ocWE4TkJ4UkxJMkZLMFJiSyttOXFIYWs5?=
 =?utf-8?B?bDQ1aUhxOE5Vb3JmQkkzVUZVUk1OS1NteDdXdk9uN3lCMmZIanEzZ2RFQ0t4?=
 =?utf-8?B?dzlReXZCREdiN0FqdjBTMllVbElQQVBQc0tPR21RTGdEVlNqSFYxNktIMmVk?=
 =?utf-8?B?eElpY0RlNkxVbkxBMTQxZ2hKQjAwQXNkWkxUaFpITS9TZ1JEWmxMM3pmNUZy?=
 =?utf-8?B?VzcvQlVKSlF6dEl2RHl6bWRMZjRLQjRBNmljNlhiSkpmb2l4eUdmZUpyRmtX?=
 =?utf-8?B?bk5GZVRGNjBuaHJFajIxdHd1Z0FyUjZCdFo5NXhnSmlIZ0J5ZE5ZYkZEYnZ4?=
 =?utf-8?B?cmRMN2lESlB2UFpLZUhCNU5jS3lPc1FZS1dUczBuV1MrSUZnTnhMU1ZEWkhV?=
 =?utf-8?B?cWluS1lZWXFMekx2SVJBSjFoQ1hialo4akpKMmpaUCt6R1p0eU11cm1WeHBW?=
 =?utf-8?B?MUU2dngvb3FrNlgxN3J5SkduLzlHU1pOVjN4L2diSGhtTnAwbHlNVld3NXNi?=
 =?utf-8?B?R1k5bkhPekJQeGV0Q20wM2NZL01yTmorY1ZIZXkxVjVmWU5WcHlUMVYxeWdE?=
 =?utf-8?B?OHFLR2lOc3hYTmxYYUd3SkhrZjlYdkY5Y0ZtblBNb1hoZWMva3MwNHFYTS85?=
 =?utf-8?B?NjQwVjBjcmkvYVdaVEwzdC95Z3FiOXM5Q2RiZ0NQN3EzS3hWMjhZMEJFYklM?=
 =?utf-8?B?YWFVWVZKOE9Oa205UTZKTTJxM1dYc0hqYnIxTmhqTUIrcXdPS3FTdzd3SC92?=
 =?utf-8?B?dE5OYlluTGx2ME5MdDdJQlljUG1BQ0huZHpIR2QwVmZQL0s2U1RQbDFINmRQ?=
 =?utf-8?B?OW5kUDNiRnV3ZjFhUjZSL0RLeE9EYUMrZ0JsNGszMk9iQ2RhMll4OE1vc3ZW?=
 =?utf-8?B?UTRUd1JJdUdWSlAzY0lEVlNDVmZRa1ZwRFpHTW1GV0tWK0JuVnJoZmIvVFJw?=
 =?utf-8?B?U1RDcEZ1emFyZG9tMHRQK2lsdy96SkRBc1AwcXFsdVg1bTAyanlVdHVLaHJm?=
 =?utf-8?B?RVQ2Y0hXTVV0aXZ2bUdUMXFNSG14Rkc1V3Uzbzd2ZmZzNWhqM3YzL21iVUo5?=
 =?utf-8?B?MVVKMlcvTDliaS9US0lTSU9jR250dGt0Qm1lY2g5MStoVjdDeFV0aEJCTXg5?=
 =?utf-8?Q?BB93ToG9pKW0whWOOJpg2/APv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2d697f-bfea-42b4-de2a-08daa0a4377e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 16:20:39.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYuhISNwlyPDygAt6Tf2VyPi24kPbyZnDuGmJk78D1WE8ohiS6s977PfGU2PhicShg70x/bWz4uAJsgl/+DTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

SRAT may describe individual nodes using multiple ranges. When they're
adjacent (with or without a gap in between), only the start of the first
such range actually needs accounting for. Furthermore the very first
range doesn't need considering of its start address at all, as it's fine
to associate all lower addresses (with no memory) with that same node.
For this to work, the array of ranges needs to be sorted by address -
adjust logic accordingly in acpi_numa_memory_affinity_init().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
On my Dinar and Rome systems this changes memnodemapsize to a single
page. Originally they used 9 / 130 pages (with shifts going from 8 / 6
to 15 / 16) respectively, resulting from lowmem gaps [A0,FF] / [A0,BF].

This goes on top of "x86/NUMA: correct memnode_shift calculation for
single node system".

--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -127,7 +127,8 @@ static int __init extract_lsb_from_nodes
         epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
         if ( spdx >= epdx )
             continue;
-        bitfield |= spdx;
+        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
+            bitfield |= spdx;
         if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
             nodes_used++;
         if ( epdx > memtop )
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -312,6 +312,7 @@ acpi_numa_memory_affinity_init(const str
 	unsigned pxm;
 	nodeid_t node;
 	unsigned int i;
+	bool next = false;
 
 	if (srat_disabled())
 		return;
@@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
 	       node, pxm, start, end - 1,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
-	node_memblk_range[num_node_memblks].start = start;
-	node_memblk_range[num_node_memblks].end = end;
-	memblk_nodeid[num_node_memblks] = node;
+	/* Keep node_memblk_range[] sorted by address. */
+	for (i = 0; i < num_node_memblks; ++i)
+		if (node_memblk_range[i].start > start ||
+		    (node_memblk_range[i].start == start &&
+		     node_memblk_range[i].end > end))
+			break;
+
+	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
+	        (num_node_memblks - i) * sizeof(*node_memblk_range));
+	node_memblk_range[i].start = start;
+	node_memblk_range[i].end = end;
+
+	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
+	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
+	memblk_nodeid[i] = node;
+
 	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
-		__set_bit(num_node_memblks, memblk_hotplug);
+		next = true;
 		if (end > mem_hotplug)
 			mem_hotplug = end;
 	}
+	for (; i <= num_node_memblks; ++i) {
+		bool prev = next;
+
+		next = test_bit(i, memblk_hotplug);
+		if (prev)
+			__set_bit(i, memblk_hotplug);
+		else
+			__clear_bit(i, memblk_hotplug);
+	}
+
 	num_node_memblks++;
 }
 

