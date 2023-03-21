Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849C6C2BDD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 09:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512249.792114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWxw-0006bm-7x; Tue, 21 Mar 2023 08:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512249.792114; Tue, 21 Mar 2023 08:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWxw-0006a1-4l; Tue, 21 Mar 2023 08:03:32 +0000
Received: by outflank-mailman (input) for mailman id 512249;
 Tue, 21 Mar 2023 08:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peWxu-0006Zu-Mk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 08:03:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9c52c9-c7be-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 09:03:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:03:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:03:27 +0000
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
X-Inumbo-ID: dd9c52c9-c7be-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYyIf9rywEStpQAfDz+JReRR23sd/fbD6t1nEtTtTpHJI/guLZq15pab4XdJle4/nybb4fMF4fActAq2H3Wo+zZHB4M1so7DF86ZNm6vm4VPAz0P6MfS7Z0ef6soP7bor6NwQir+ThYGJNx/UeXPgAB75H1RcRlKZMoJW8u5GS4RFjDlrFlBxyd69+SzfSt3ghM6WLpEibZDqK8B/3hn+PeZ+tVhcxWbcNzwvJI4S9mwgOkO6rRIXbUxNOiUkpLHwJG9MXTTEjUSjJQ3pdcNY6WPREtQ7er3rY4Vzv1ucop0TGpSsM9I7bYu+V415///smjZyVLHpVITw5dRh+dYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koRo8zcUEQZe8q+4HcGJaqbTevf8UXXSvHLf3tkcOw8=;
 b=fu4+Hru9KqBo5HSC1vUoorlwF9OwoOshWQZyQvPpLcoiNHKMJ1RMcIIV0yd3T/2Re3VNJEiLUO0/ocgujR1ZP0sbIVC9D+3PITsiWSvr3zWVoXlZJ4FybAF2lcCqcZJeSCThHPzhShCj7lYUalLhKWauCfuhGJbrzijh1AruzKUmSi9Y5SrrNsO+3WJrZa1mtdzmR6UKo4PbYJ3oy1ZxEfZLiaDxakFK2k2gdq5pToHAlmyJnTHy8NmbH6Ar3bGUAySlZO7BjelFLbZkcs862PKnoDL0XXISCWkqyNISTbSNa1hvX7neToerWzFOZPU2p3m5ImbFvVzs9BPsQSVCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koRo8zcUEQZe8q+4HcGJaqbTevf8UXXSvHLf3tkcOw8=;
 b=RPytEYVl+AyMK6jaDKEBeKaIL1bjEwtO4GNnrVAfvnbDfQIf2g6tbjFrW6m/WoN3JxCfYUM+wFSsC9KmRBhPfna2fJ1YfXe6FmYB9fRd57HMJYVTFP7st/TBOIB/ti2/I9Kuva2YxnZxrhsNuaYmS8ZsYRpOcnpcauVlJ9vc2WFTk3/WsWIop1/LHI4zDGyK5EJNnq7+svHQZNyAUdPaOtG6nSUtauFhxldQBtwcFD/3zEU76QDCecqSTOBGaJWSJjELEnYZRVNjmvrFfBAsHrQsyvMMus4LqDqdJ2uOHQKJHZkq9VgCVRIaa9SZOjv9volMW+I9tfLptVEA3OfHxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d2193ff-670b-0a27-e12d-2c5c4c121c79@suse.com>
Date: Tue, 21 Mar 2023 09:03:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: avoid 32-bit build warning when obtaining VGA
 console info
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 2211c9b2-63de-4972-f7ec-08db29e2c0b3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H4TgTkxGWNDNgYyBCb14pieDAOyV6MIeGuQdoka7ipQM/Rqzt7WRisqB8UA9iWLMPxp5sSAZ8ypz/dnb7eieJiNy7v6sr2MZscwMxExPrxCxBtUPBgg72grLQz/6RJeh3Cizwd+tgrzHYT05vMRxpC3Wxew+CZcLqkqWxtPJV4YY5a/cY/mNRLYipCMqzzFo37V1vUhcyYQVbn7kEur/G3g1GinwR29UM0S6HxxUlUchHH0WFx1isxMp+9x14YRlGMKgOStUFy4tncLdKf1WWQEAHGBrZYn3cQSR9ScEjd1zOKxKB2C1z3RWkqxQd64hjr94b3mulKm0RCoqxYNkQXzUMbBqHqQx/L0dg/EHdj80LUq5gjQ9cY5d4Z9IZet606+YdKJtXn25tEmmV8khRhmW7PIhzw/lR6mZ0DBNGJr7EOc05MdO5ULXa3y4hS8POCoaqbA9tkzAzZIcGn/ouuM/9W0ULLU7Pwd96s/msciHSGFA2Kzt05h819sfyGXzpl3zH42NjSoeVJrwNJMyh7t6Mzw9IZ+3Py4JWo4a+N26SkayGn2mqop7CLvwbHmZcS7jrkXd3hQiR4soHUFFyV0QKMlDwHQRmc6dKGV3zTPyb1qR6c4s3BrVySnWLgxPTgZCS1mVw1sdFyZsyqwMPbImVUPuKj3+ACyS1NgoeNral/4gsblrMRPVGnMA+7ibbv/D7HYkkPetQgWU1vw/mE5cBGeYauePNZurjEuCPQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(8936002)(5660300002)(4744005)(41300700001)(86362001)(31696002)(36756003)(38100700002)(2906002)(4326008)(6486002)(478600001)(2616005)(186003)(6512007)(6506007)(26005)(31686004)(54906003)(66476007)(316002)(8676002)(66556008)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFk1ZG4yeS8xQlJVWlQ4cjNmSk4rTDZ5T2lRdFdvK1dwc0lqTUZvd1lUMHJl?=
 =?utf-8?B?N2JCKzRKdStRZk4yMFZUQW9aNVEwTElkdGxUY0pIWm9uOFp6ZnRZVlM1am10?=
 =?utf-8?B?UDhEeER3c1ZpcHRZdENCMFVsQWxXVFl1cWwxZTI4UnU0ejJjcjRqN2o5R05m?=
 =?utf-8?B?a1dUaTYyNUlMQkdZTUhBUFFKWXZpd1AzY1NoWGpDR0F5aUlzWWFxQ2lxR1FU?=
 =?utf-8?B?SXRjQXNJWlpaL3o1YTMvVFl6SkU4SGpOQS9Ybk83a0RxZzNMell5MUF3eUpM?=
 =?utf-8?B?MEx0U3RrdlA3cWlsalU5VWN3M3d0UUlNV3ZzYWpQdEJiSjg1SXBEMHdYRXVZ?=
 =?utf-8?B?MEUvNjN4b2pIK01rZHMwa2ROaktwRmFlanFFV3RlMUx5SUJoNkVTQWlPOE9X?=
 =?utf-8?B?dHR1ci9lbjJabjI2d3QwcEY3MCtqcmJHSmpGOWtQNFE2elo5ODJoc1VWb1E0?=
 =?utf-8?B?N2tWM0hLU3V3T2RubUkxMFhFb3ZIcERYL3lZa1F6MTI3RncxejFVZGp1bG4r?=
 =?utf-8?B?d011Ni81TmRlTm1KTUp0TkJickhaZ0gySU9ZT2lLTElwa250L2J1MW5tOWYx?=
 =?utf-8?B?RnFnWEZGOCtXZWlWU3FFbm9LMnYxL09YM3J2Q09xL29BVWtSQitHOTZuekxJ?=
 =?utf-8?B?U3Y2OEFnRUFlVWFVZXFSK3NtRlkza3BDVmNXR2FucTBzRlJzNmlJOHVwQ0Ru?=
 =?utf-8?B?QjdJdDlYaEFJckRtUWErNGphRFlSK2Z1MXBkYTFxYmVPc2ZzblNoa2M0RTZn?=
 =?utf-8?B?MFdRcWJiZHYxVmJDcXR1K1BDZmkvV1FQU05HdlgwcWVRUDA1TEhYRjAzbFBm?=
 =?utf-8?B?bk4rVytmQ3p4RmRaU1BHajBSb1A3MnY5cnR5UHJuUXdoZW9hRFFXN25VREZi?=
 =?utf-8?B?Sk1DNHRqTkpyMkJ2ek84N21zSDB1THR4TUVSSzhoYnNiRVgwdm1HZEQycGpP?=
 =?utf-8?B?ZmV5Z2VnM0Q4N0J1NHd2U1FkbXBRNmtVTERZSHczSnI1Ry9EcGN1NlhRbzRs?=
 =?utf-8?B?Y0pZZkhBMW41Rk92UGJjcnhIN0ZudXA5QmxEQ2N0UVhGcWxFM1N1VFBpLzZs?=
 =?utf-8?B?S1hXeUlFSjRaUnIzVm5tbSsvTy9Lb3VrSm1SOHh4M0ZIeVYxd25oSDdsaWVa?=
 =?utf-8?B?WjhXTGNwNXFwck9YYmg3VDhRUXEyMGduK3F4UlJRbkVHUkJST09CYWFWQmx5?=
 =?utf-8?B?V2MySmZ4REZXMWNsNGVFUHF6R1c2MkdtOW1tODYzMHlHMloraGlWVDBPelIz?=
 =?utf-8?B?VkJDcUJUV3JYeUkzQzBtSnE1NDJNUHVaVTZCRUhkVk9RTzYrVWE2aTRhOFlU?=
 =?utf-8?B?SEtxczN6enBqMFVYMVdDOFBwUHN3cU5MWWZpVDJ1R3VEVDlONkppcnpVanhH?=
 =?utf-8?B?WTRJbDF1Vyt5azhMbTk1Qk5vZkJpdmNhamdDR1ZXcnloUlNLeE8wZmFPUE5D?=
 =?utf-8?B?SXE1RnlISmNFTFprUDFTUU9KWHJXQ3pIaW5URGxBcEVybUlrSDM4MXdUNmo0?=
 =?utf-8?B?cXBaeWYyazJkSTRBZnNUcG9jUFB3ZEtHK09CRXdzRTAxQmFyWkxqT3JjMkJB?=
 =?utf-8?B?U1RNQzg3b1NEa00rdnZ6ZnRUZ3B1b1cyaHl5cGtORGNtRksrMHRGcnpyUHcv?=
 =?utf-8?B?SFVGWmczWnRleGdmTnJWU0tvS0lpOW1INDlFRGZNNE9YYXVhWHBMdjlvRDc2?=
 =?utf-8?B?cmk4NHpPamtTQkxTY3MzMlBSQitFMmJPaHZ2SWUyRW1NTWU5bEttSUtld24y?=
 =?utf-8?B?RVFHNG50MWsxOWo0ekZIZytlRDJOazhXdm5meTZUb3Q5TDM5VktwMFMxYlB2?=
 =?utf-8?B?UW1FaVcrajNtTDVlemw4KzVaMzcveFJwcWd6TTZ1bGJzL1ZDK05TakJvWHRs?=
 =?utf-8?B?c1JwWFl4SUgxZUtYNHR4Z0FzazV2d0JwZXF3RWZhckZoTFg2b0hhZ2R1RlJ2?=
 =?utf-8?B?ajdxc1dXSWc2SGg2eHlURmhZV25hYTNUdTFEaVpXSURCQ2tWdStoNExRQnl1?=
 =?utf-8?B?QnpWeHpLQk5ka24vbXMyQTlJMkE0MW16QW1GekVzZnRrWFFib0pteko0V1FK?=
 =?utf-8?B?Q2FLZUJCa093blhtaHpnMmFtUDhkb1NvMGZEbWxXbHMvRW5EL3I3ZGgxN2Fk?=
 =?utf-8?Q?3HG/fKRLelzSryxWN/K0puTxA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2211c9b2-63de-4972-f7ec-08db29e2c0b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 08:03:27.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cACM9AGQkgdswCJv8krcoVzhbAa4pqAfOuIokvsDdc5ithA+5ogqx3uKF+VTzR+JZbf4BHqoSEXfM0D6h8J7Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

In the commit referenced below I failed to pay attention to this code
also being buildable as 32-bit. Adjust the type of "ret" - there's no
real need for it to be wider than 32 bits.

Fixes: 934ef33ee75c ("x86/PVH: obtain VGA console info in Dom0")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -48,7 +48,7 @@ void __init xen_pvh_init(struct boot_par
 		struct xen_platform_op op = {
 			.cmd = XENPF_get_dom0_console,
 		};
-		long ret = HYPERVISOR_platform_op(&op);
+		int ret = HYPERVISOR_platform_op(&op);
 
 		if (ret > 0)
 			xen_init_vga(&op.u.dom0_console,

