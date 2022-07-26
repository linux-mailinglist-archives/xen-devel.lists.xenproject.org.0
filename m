Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83B5816FA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375527.607981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN58-0007wV-Pk; Tue, 26 Jul 2022 16:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375527.607981; Tue, 26 Jul 2022 16:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN58-0007uR-Lv; Tue, 26 Jul 2022 16:06:50 +0000
Received: by outflank-mailman (input) for mailman id 375527;
 Tue, 26 Jul 2022 16:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN57-0007rh-UX
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:06:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f44b3d0b-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:06:49 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:06:47 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:06:47 +0000
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
X-Inumbo-ID: f44b3d0b-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhNPEsT0LgljoV7L82WarQM96DOb/sgRxWn4swUtd3UEXavXmfBgj61v0wq4R8Vd1s0HOXhqTIwL5/+8My5MqlhWaEcV/GzwS79jDlPjdwtdmldlPko40YhFhBuBJ/GC+w5uooDsJLqMC5F9iFDeUt2fFWyGMzK9BjpDdX76SJjje9LaGh3wf9mxreaD2HLYpnCQCuHlDLbIk0RsndX+XXOSvYO2obV1Y1EThyC+aEkLQp4ApBkELVqsR96awgTO2o0OdQqsiPAkN4Ea8E8tToO0P3LX74uYdjo3IIDveE1u1rXsfjoMWtVBvF+X+CcW56HNneNeMISXCrfGBnVpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiM5Ep+GIGxc9iGqIuErdW/YkbCSwfcFyzej4dHa1nU=;
 b=gSmfItKeTbY2YEHkO2k0nanqGRuZ5jY6XIN15HakqnhJaqPbCEMb/+H+J63/Zt6PO5j0oWH3mXp9/3sXfiWNBe6EG1vOnwfWas6cKA7JwqnwniBhxGhObV3YDPEnNfLn45PtAf97mnG+dFpWCOhodePfwfaejYS/jQ68w8MbAedR100J7MuNvX91yh7tdHUAfYCFz+Y+APSzq2SCJt2LGu+6RjLEy2nFk2HPI9KYRgYTr/Zn4aHlJBrQAB9C/iMqvMVyRIJGIB4bhEdLkyknv8KQ6xlINvs3y4LRAiPPDn9PGRUg6aE8mb4yx/ZgTwBziCIWxkpKimASFe9xBJ4wZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiM5Ep+GIGxc9iGqIuErdW/YkbCSwfcFyzej4dHa1nU=;
 b=HFU1uTKC1lzquHMpuCUhAoa6J6wr1Ld1Ih+RPYRQhbPsFE+s134VvO5/EFAhOUipihbJHrtW9HYOp81tn1WBQQ9d0S5yLIktKdw54Dp+P1c4vDC2Q3twqsdJFffnh47M7PHj7Vuc7RMQnJlRqtEBV3a0vL3en7bb4KCA683IhkR9gfaqnbiXCDbpxX0utj3zmJhKApaw7+3aMu57z3sep80i3TanfbecTZyQhmGPDePzzhvV0XKtNykvzcxvp9U3dEOQX2KHHzg5CrQ0UkTvSE6AnyInbzgLIWrBI7vE2q4w62a2FJ4r3gSiTZEsbTh0bRCn48ZwFsG2SaGImWVOBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40042c40-a2ba-e491-d16a-4bacbfc6154e@suse.com>
Date: Tue, 26 Jul 2022 18:06:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 7/8] x86/mm: adjust type check around _get_page_type()'s TLB
 flush
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cdd2baa-d08a-48b0-fd75-08da6f20d7e1
X-MS-TrafficTypeDiagnostic: DBBPR04MB7772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wghQfK+DMVXn1DNLhpAJTqoETZwwBydw5sXL3W37g6OZWzKgJgiUlITY8uv6sihGJlp5tPTLlAE5yoO5ZmyIZB6tgwXRFtBwkSLgUUbBwk2rCav0p+6vZvPDg5+2SmKMGZsVgO1xLw2Bj4XVvSed8Jmc6rvnfOOAGjlvpvNlMLMdHrWH/hxpY18ON3Gzh3WsoGgR9bP1reHUQ4Dzera6OhVFrDEtzgMhyJ2nGWnH4btkJvYvXQsERk7/XQQuQmPLbWo5q1TWemFmslklsfd1wrPPmpbDOnFARQq+8FKvFHxhd7MC/ygW3EF5FvyYmu/7Vc6QSj4neR9ZkygCxBzjLLaGvfgJoqfTRAbqf1WrC2GZXbw0fVm2XgI/I2XAZUBdit7A0Dq1zljXsrTtotHWI/yws7EZXqtsVBkEgAkIiP1HJyuNLGRC2bU0K4XS0iHYhWNiLjsIuc81LGZJcBFVmLNjpD9DNWlu5Nb0kKzFZMwPEmY6uTEsa7D1OBnelKm/UmUDmyHdj8FnyoE+/l//GN8ogpDpasXIYlJUEXyVXFdt09Pt0OVCp/9Fwx5eJJFcjHvyEiI29FoRW3mVKFpeqLQJ3SXgIugj0dOtLOQK6rseNtU5DM81233pm59EWp8mSsF33MH3nGoVmuDeRZxnm0mTe9MTtX9uD7voEF0/w84PeTgXu4SwQIIR0Z0+/6bvKpJmrMN0Bkqlex9fBktJWw7rtGmA0m8DyW3M3lTfFAm1cmV50NhidgXWYLgygJpN8XQiOuH7RU1BR5Hk9PBMnPsjLhQE/niY64sdISk48AamRa3KfOTJA7HerumPScQJuBVRleYap/hFJ2h2F8Awzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(366004)(136003)(376002)(41300700001)(186003)(6666004)(2906002)(6506007)(6512007)(26005)(5660300002)(86362001)(4744005)(6486002)(31696002)(478600001)(2616005)(8936002)(6916009)(31686004)(36756003)(316002)(54906003)(38100700002)(66946007)(66556008)(4326008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkdkNG5YL1NoWS9FelpqYXZqWGllTGszMklyZXdHdnA4M0NpMWNMOUJ5WDdp?=
 =?utf-8?B?eTJ1eFU4L2NQWUYyZGp0dGNURFJzVFl5VEp1RksrRGNPelBVTW9ibzVjWnBY?=
 =?utf-8?B?bU5xQWxmKzF5cndHMnBxek1NUEV6SVVyRE1TOUlGTDd2WkZPUHNpRFBLdlB5?=
 =?utf-8?B?ZmpqOWNrYSt0ek82dEJtbWpPc3NJcVo5b242WHpnTTEvc0VwSWdMSml0eHNk?=
 =?utf-8?B?NjR6YVpDNDU0UFZoZHNVa2JiNEh6TDY4MWE4ZGQxZ3pOMERhSnhoWEhQaCto?=
 =?utf-8?B?Yk1BcDZaNTV4djk3djJFcVNPN2JycHlQb1BPcEZ3aFltbVFWMzlaRVRKSmdR?=
 =?utf-8?B?SGl6aHB1ZDR5OXlBc3hva1NFOUE3Z2xzRWV5aXVqS3loblFpL3Z0MFd1eVM1?=
 =?utf-8?B?V2FIY1lROTJEcWlrT0xjYVBKejh2OFUvZGt2WlRiQ2xVZ2FGQmpBUDZpaXhZ?=
 =?utf-8?B?WVV6NkJTRmcrZDQwWTl2bXR1UUY2RWU2UGtySS9BUW9TVGtweE1QVEFlbG1D?=
 =?utf-8?B?MnZQY09PdS9UdDZwTVJLeWI1ZkVIaXROWjEyOFFJK2pvc0FQNVlYd0RJa21D?=
 =?utf-8?B?V0FYZ3A1Q0VsTEM5R2pxU05VRzhERnBKUEtkZVl3a3drdkRFaVN6QVl6Z2R4?=
 =?utf-8?B?Y1NNN3IwSW1Ob3JST3JMR215Sk94R2MwT2sydXBOT3ptdnQzcDNzZXhhbmVj?=
 =?utf-8?B?aFQ5a1ZZY3J0c0FLNUpzQTlkdXhROHVXVkRPU3Z1NDk4NTdhaTM3YW5KQ1hv?=
 =?utf-8?B?ZkJQSWtpNklYdWJvZDVKeDhMaHg1aUpraFBLeWh0Yi9aSlprT0xNYnl3TGQz?=
 =?utf-8?B?L1MvSWdWNVJWYy9MUThtbkVFVlJvY1dSSDVwUEdmOWt3QUxwUit2TU0zTnpz?=
 =?utf-8?B?N1Ira2tkc0kxL3hnZmhOSUZieGlzK3RHYnNac1VJc3JHTDNyWHgwS3RINThz?=
 =?utf-8?B?VkZWUzFtLytyM3RaY2NKTHpxdkNTZTlLamxVTE1EUXV3WnprYUJrVC8vemlu?=
 =?utf-8?B?SDZZK21oU0RidFg1c2ZNcHpjUzJGTmxZQUp1TUdJeEJLUU94TkZ2WjV4bndm?=
 =?utf-8?B?VHJuNE9HT3cyWjFGQXp0UzI0c3l6ZnlOTjFPZHd4bkVPc0dMeklUMTNyS05w?=
 =?utf-8?B?VVBKS2JLVzNiL00zVUZSMU03NlkxVThxSjNWNUlSRFB5QjM2eHdDckJJVFd3?=
 =?utf-8?B?UW9GSEFUaXRDNWk4aFdGZExlNHIwaFd6ZkhwUWl1WmFQek8yMldYL2pQUWpC?=
 =?utf-8?B?OGovejRWb0pyNGN6VjdWYkRzZXI4VnFSMnR1UERXR0UydHlGQ2ZlQXFWWS9O?=
 =?utf-8?B?OVExQ1ZIMlV6YVZoSElnUUdmaGN4TzF5blFyUzljQXFiL3VxanJzTHE0dUtp?=
 =?utf-8?B?UHJVcmxDRHA4S1FicXZkT3VEQi9NaXZ1QVkrMWk0MjRiMUNwK0cxZDMrWXJ4?=
 =?utf-8?B?SWFOUnI1bnJ1dVZ0NUQyaDFjdE1iVFMyRjRUenNrdEdISUdIRzRDTzVYRUxZ?=
 =?utf-8?B?U0pPMlpBNnpoSFJnSko4c2REcE1xdXpkMXVRZERkSG1Ld0hCbytmakQ4dldu?=
 =?utf-8?B?QUdkWGhnSFIvalU5VnA2R0duT0ExdUUwMlJMRmNsS1krK1dWbmFmMDVLVndT?=
 =?utf-8?B?M01LK1JTZ0hTalFpMm9HQ1RvNWpwc3ZodmI5MmtLazFRdmdxdUI5YXZ2QjlT?=
 =?utf-8?B?clVhems1VWwvSFZLQVhzc1EzQnlVcVAySk1aSERRd3cwcVFKRjdXOSt1aEZn?=
 =?utf-8?B?MEtud21wWVBJa0ZkTG5IZUw3MFhiVlJhd3FJUGFFZzFaaEh1RXgzWU8wc0JC?=
 =?utf-8?B?STJRb0ZLSWFDN2J5ZjhueGV3K3NiMUVvSFBJelN2OWJzTkxsYnV5Z0ttQ2o2?=
 =?utf-8?B?TUl1Zit6K2xHN3RsT1VhTlNyeGlndVUvTmpNb1VLT2lLYzNtUTZtM0Y5dEY3?=
 =?utf-8?B?dGFteXRnRWtHVXRZeXdTbnJwMElGNzRma3dlQVpqMW9yMWN4QmVsZ0hMdkNj?=
 =?utf-8?B?c0VocXRUYUIwcGcvT0NIUXVYN1RhOFRieEdFeVYrOE5HSjU1cEd0NTgzbG9k?=
 =?utf-8?B?MjdFOFk1clFZZmx0TXE2cTFocG1EeENYSUZ4a3hwVlgvN0tlOEo5eDBvMXhT?=
 =?utf-8?Q?gX603axYp4HLVgxeJxkUrEi3r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdd2baa-d08a-48b0-fd75-08da6f20d7e1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:06:47.8832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zkxIyuKLu3vR0xiks8dxE597UsSDjv9p+UthVbE21RZbaQiOX4rEMnQEzjNv5L2/iDdxmJFTBW8ojuxxMESrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772

While "type" can include PGT_pae_xen_l2, "x" can't, as the bit is
cleared upon de-validation (see also the respective assertion earlier in
the function).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3020,7 +3020,7 @@ static int _get_page_type(struct page_in
         if ( d && shadow_mode_enabled(d) )
             shadow_prepare_page_type_change(d, page);
 
-        if ( (x & PGT_type_mask) != type )
+        if ( (x ^ type) & PGT_type_mask )
         {
             /*
              * On type change we check to flush stale TLB entries. It is


