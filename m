Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9223A6889
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141549.261427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn2J-0006WE-9e; Mon, 14 Jun 2021 13:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141549.261427; Mon, 14 Jun 2021 13:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn2J-0006Sm-6d; Mon, 14 Jun 2021 13:53:55 +0000
Received: by outflank-mailman (input) for mailman id 141549;
 Mon, 14 Jun 2021 13:53:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsn2H-0006Sa-Cy
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:53:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39cdf45d-8500-400f-b461-5031f4456551;
 Mon, 14 Jun 2021 13:53:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-qQa5LXm9OSKUwqy-z1y1aw-1; Mon, 14 Jun 2021 15:53:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 13:53:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:53:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:101:16::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 13:53:47 +0000
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
X-Inumbo-ID: 39cdf45d-8500-400f-b461-5031f4456551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623678831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MmjRk9izpB0nnTeZQGZQ903HcGexrQTGFs+AxEdyMUI=;
	b=IfB+UetWsj3VM6FOQbYhrSlTsA7u/PjUnqHIOVzwZ2o+6kgV3oW551Rx/dDwBLPnJHbTV6
	W7R8gbSKEhlv0jywFLPvJ2+l2w+4HkRLijJTeZsbOo87wJ90ZJkSAAITBsPAtBoYc3WHKz
	dqF3kP6sKn+B0MNtia+NApr6VuplUYM=
X-MC-Unique: qQa5LXm9OSKUwqy-z1y1aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAGgDoUn0zghCFbLNl6UJsUL2z2hFQRwlaClh85kpEdHleFJzzaFfoHfLUCK+qTYRcFML7jDyqLfgCvG3Gn5sOQiAZ5iWcr1LQN3Q4tTKMegFVLlEfofHdBW6e7nB9cj9+V96FwLYOfzM9LThFy7BVN10GTz/Y5urwlTXLGEE7d5rnazUaogbw9kOH2TgoHFTR+0IhOrJgVhXPsU1ZvzsdovA6Xl614/VXBeUXTX6lFzCLWI7FVQ1R5kwgBKagAgffg7n9HCZcig/cGJtPykUUjRiZzjlwh1VLGdTijVNhPuVj9zObVvBUxKUMrD44GZoMyjiYpidFdcnuE0/HPPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmjRk9izpB0nnTeZQGZQ903HcGexrQTGFs+AxEdyMUI=;
 b=eBrfUReXSXga97oPAC20xscm6wRTzsxMhfz8xbOYe7FOSE/AGm1u+PrA4RSLGaWEdI57a+tfBj4CzTJhB2pBnwwjHrgsB4Bkn+PcTTMPD8kxK+SFUlZl3cw3ujtaQQG55rIBw4wiY88baVrOE65xlgz/oFy9fSG0Q8maWMcZZGAHb5DmlaIwEKnZSIo3ylsWy72mzA82YgRtQujV96MG/+pn1cp0bhjBRV35ovZPG/yhJ8Gell0PbTdITGj6zYFOn0+9E8gtg0DmKFb9XOfsdq0YHN8Vl5FB5wqoQLTXN20qJIMdrBLXQZaGb0jzYu+Mv0woMCzH6QS7ZVIJkzD40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: move .altinstr_replacement past _einittext
Message-ID: <759595e2-808a-46c0-7a93-fadecfeb991b@suse.com>
Date: Mon, 14 Jun 2021 15:53:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:101:16::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fcc1563-ca70-4190-5cff-08d92f3bd521
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119513E084E8B985DF2CC40B3319@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8480KIYf6zDgALnhoUtWzFmjyJg+LJUTqe/kbKhPAVizPfWmy/JdNOJZ3vg6y0M3h8xR9pqPUXb4HGpBKQBfomxF8FHTaRA6k2hLTjm8ZK6XqQt9FX0pfUB0isWXoQPcWENZGpvS+5GCEc4aLZZsQt6oj0x6T8IM9BvOBmP9oHbhgW1R1jjnILsb0XzmM1D8Bd2j/hxtwbSXo/K6/l3fPj48wjel/j2zHgCYMoVS84rSFMh+jO//BQLAbkAad+1hcR4AQM36QKu0CETbuStyhOYFw6sTVKYDahJvdFrlnqXLNzMOteWeWLqsumf003km568Se9vrhcm+pdz9JlwU9vE6L2P5z4d9cJbRChP95da87rvq8thF2+iKLh99SyVsswr4aDUjNzOWhxr8PfQnCgkJUhUU5ftmewyfuvagG5umVmMTcUBw+VEBMAfKKSN4O/e8PjS5dRnrClG36wUDduTvApuAqlgf40feviB2C4sL038JzEC4hDupdy7btMS+WJipm8gEf6sbQPfBEZMtzgS5keq2sZJ9n3eNmDoIPTrwhiOujSX9y+194Z1BJ0tu2Q4KeKwT/sRLSLJHddO917BphPE6h+WcPNexRqCsqWdTRG+QsolkDmSWQOlUdB8FwXRZBPlet27VPpFeEi2PLKLO1+EKjtfI4OQfbh8RImh37o95dI40HlFob+hxBv9b7MiPIDphI5unQEfBBvlSbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39850400004)(396003)(346002)(136003)(66476007)(66556008)(5660300002)(38100700002)(2616005)(956004)(8936002)(66946007)(2906002)(31696002)(31686004)(4744005)(316002)(16576012)(54906003)(86362001)(36756003)(478600001)(8676002)(16526019)(186003)(6486002)(26005)(4326008)(6916009)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzlBZVB6RmRzMXhvbzl5RnptSTBKYVp5Zmh1Nll3ZEVHd2k1dHd1MEZvS09Y?=
 =?utf-8?B?eW16T1BXQ1kwd3NzZWdzOEhaZzdNRjdmazBUaHhvRUh6L3dtbHU1RkE2TDJs?=
 =?utf-8?B?RVpuL3QyZStDNjdIUUg4OVlJU2pzcStVNGx3enZadzAwemxLN1BMUVl5VHlo?=
 =?utf-8?B?bkdXblFRNmhwZkpjdlVsMjk3UHBDbkpNendUVzdFYktseEhHZVVqZC90aGtK?=
 =?utf-8?B?YVZ3R0Y3c25XeXdLN0pnR2IyVm5iZHJvdm9jNkRWUTlONkF2WDQyTUorSzIw?=
 =?utf-8?B?RHc0a3pqS3RKcFZwRHNKTDA1MWFZSTFrZFUvZW5VRmlwQkxyZnBoVnFkSXRO?=
 =?utf-8?B?Y05KWXpWM1RRVjc5b29LUVJXQy9QcGJ4bWNCdHdyQ01Kb0tWanoxVUpsWkg0?=
 =?utf-8?B?VldudnM2WUIvSTBJVWl5eFFzUGFpeWw4eWQ0a290SkZsTDA0V3dJYUZzZUQr?=
 =?utf-8?B?ZitEbWpwZm1rNHlwdUJnZ2ZIQlNsaU1LOGNvTFl2T2syVXkvTHBtcGtXNVIz?=
 =?utf-8?B?d0Y5eFFIdGxaOTFRdEdqQUt4TnZJbmtuTm5oVG1veWZ6WWtNdnhvMGJYb2Uw?=
 =?utf-8?B?dEd0QkxYSUllMHNlOHB2dFh4cmxmejV2VVR1QVVwdXZJWEJaMjRsREY1Ykdk?=
 =?utf-8?B?dEpqR2RLdHR3YjdXRFdpV29nbkdSVzJTVGprTDdBQktReFA1T0FjRTdyMzFF?=
 =?utf-8?B?SkNKMzk0cFlEWVorNFZLZGdCeTJDTkZiWXVGNzR6OGRmMjlxZCtHRWlBMDdC?=
 =?utf-8?B?UGZldHpaOWVyc215THVhUEllUDdVT25qaXdQUFdid3duZWxJTWQraSszOGRm?=
 =?utf-8?B?dEMxbXNDWTcvc2Rxb0Z2aC94NWFGMzQvWitTaXdkWkE2cm1EcTBvOFNNQTUz?=
 =?utf-8?B?VEEwSitkMUtqcnp4bzhpYytZb1JRbFVUd2tuRnVvUElzd05UL2puTHhqbDNh?=
 =?utf-8?B?ekxZV05pWTd4ZWJFZjQ3aUZLTWoyUDdmSDl3d2hGbmtZcG1nSGVkOVJrcVll?=
 =?utf-8?B?akZrK0lEbm9UMUYwbXFwTG1kZ3ExYzQ3Q0NZZEpiRWpEVkp4UDRzUHdBQWNr?=
 =?utf-8?B?L1ZtWjhDdndYKzZyMTZaaFhWTWxuOVVQRXdVZEJVUVlseGZLN0FucU1mWE5k?=
 =?utf-8?B?TWhjYnB0VlN1WWNsdWNJcTBYUlgrTHZyN0JKRHU2c2tGTVE0YmFnTXRSYmVE?=
 =?utf-8?B?UVJHcWlQNmlOa1U1SjJiNjJ6TjZJdXIxT1hIeDVLMTMwM3NMdUNwT29RZmdh?=
 =?utf-8?B?ODUraDhCenlCeFdobmNDSVhDNnBsb2FjTm4zcHFCT2hHYldHdlU3Vm05bURv?=
 =?utf-8?B?SGxJcDVpNjVvdExMWnR1b2tmaGRERk5UR2ptc0ROaDB4T0NWUHh2MzZPZDc1?=
 =?utf-8?B?czVkQ2plV0pjRWJjOUVzTlIzdzBSajJvd3BZSGVyekhKLytUUy9hVlBRSDR6?=
 =?utf-8?B?N2Y0Q0g0SDdraFBsWFlpYlBDNHhFV0Z0dEg5SG02VDRZTjZXd3F4ZVdlaU13?=
 =?utf-8?B?NmNUMVphcGtvWC95bnNyM0x1V293VW9jT3ZRcjFPWlZkU1Q2SVBzNGN3UGg5?=
 =?utf-8?B?U2taZU5iYkJROU9BU3Y4TmxIMzVWbXhoU1Bpb0VydVlHTzhRM3doUnlPOVBz?=
 =?utf-8?B?VVpRZy91YjlHWDEydm4zSVZwRjFBYThzN0ZzVXZCQ1lMVERQSWJYbndIZ2lp?=
 =?utf-8?B?NXI4a2ZtMGNHWHpybGZFUXZaaDk3K2FhSVhCY1B2aDhrSFpDa0UzQWF2ME5T?=
 =?utf-8?Q?zFFZyIEKpXK8p2hh2MTxYGo+RcSf+a0on+qlek4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcc1563-ca70-4190-5cff-08d92f3bd521
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:53:47.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMgRrTjwMROxAv1kue79OAKY2JL4Ii8UUVFtOngeQlP1eVtGQP6FrSU22RPHlE7SQiFKFL9Ohgnc3McEZZuRJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

This section's contents do not represent part of actual hypervisor text,
so shouldn't be included in what is_kernel_inittext() or (while still
booting) is_active_kernel_text() report "true" for. Keep them in
.init.text though, as there's no real reason to have a separate section
for this in the final binary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -185,13 +185,13 @@ SECTIONS
 #endif
        _sinittext = .;
        *(.init.text)
+       _einittext = .;
        /*
         * Here are the replacement instructions. The linker sticks them
         * as binary blobs. The .altinstructions has enough data to get
         * the address and the length of them to patch the kernel safely.
         */
        *(.altinstr_replacement)
-       _einittext = .;
 
 #ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
        . = ALIGN(SMP_CACHE_BYTES);


