Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B180A7A48B5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603974.941151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiChu-0000n2-UC; Mon, 18 Sep 2023 11:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603974.941151; Mon, 18 Sep 2023 11:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiChu-0000kJ-Qt; Mon, 18 Sep 2023 11:46:26 +0000
Received: by outflank-mailman (input) for mailman id 603974;
 Mon, 18 Sep 2023 11:46:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCht-0000kD-3G
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:46:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe285423-5618-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:46:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9382.eurprd04.prod.outlook.com (2603:10a6:20b:4da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 11:46:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:46:21 +0000
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
X-Inumbo-ID: fe285423-5618-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDnyX0PGgg1yTK5pUlTiX/+lyUl4TVyiCJfN9bxZOPefepITL/7bcEZfcg+pvQFx+BZmx+StsLIpVsAB4Eo8ngmWn9MVqVokvuXSEzErcTGdi979i7mRwld48W/8STe75R0sG9+VrMxlhrbYWStvkwQhK4Z0sRoLfH9RLv94o3Qd/e2JNLjWqkxGv9lgbEDloRKLhJN8ryJ1UJ8Im7/K5qQarffbiQJ7TDcP72roXE04J9LGGQ0dBPFtoEBehPYWsJIOk4H0mhy/PPJ+1q9jizqlFrHdCMG/seRSYUQWbi6da6XH9DsbUhyZ0EMxlt72ZqPC7DtwPmGKYcPza0hePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16/HsGxMSMAYDRdz+AA4pmHjS8iA/+e6BbAGyjHtETU=;
 b=LDGDhFaJe/2sugzj/m7M/vn1PRouVJPJDerntqGunMsZG1y7BaEFJUUVhd1MFeQJ5aHWYF6MoSTKEVVKgoquksitaYUHja6JnoHa2NxMmKN9P8olfOzoqtT1Sa/gNVmbh3NZUnoY0R9hqGgYo0mnijEcWj824exmrAAzdjb4W+PVYFkSMwwFFEY3pWRuvLMkQ4f5vsGBs+SLvaOwEC5Oroz79FYaFm5y12uMEMNAJN5c6s94n/LlOKYYZuj1nc1TOvIkRKje/SENQzOENuhBI3iHLtVbL/dk4tM/11SzNQ4ixGkt7U90t02r+bjJ5XfFjgZtFBYUkQp9vN1q9TiV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16/HsGxMSMAYDRdz+AA4pmHjS8iA/+e6BbAGyjHtETU=;
 b=WYgFxr77FaCVQenTlLTmWrVQB0qMs/NKF5KprBkbn8gbRTZyBlKjc7ZeUvB1eFCPu9GI94YE7RfYQ7nJkEtjt/U2+dJzXpG2Pq/p3nt6Ngu5V9TxUDyzw6leyglAP5FIvfGZDDzbi1Kj+ZJ/d00BtPJb9XVQ65NopdT70s76OV8J9fI+CnuitiOxvzr87sUZjAp/+0f7D9WwNjbApJcHh+bxcjKRAE3B7aUsOWjqpS+fLxaTaD4wXlsYJMPdnTlH9iaU4iqqDcMDiFluLwiHtN07DEj4uYbQgSH/qqGUnnKJ3uXlvnsRAHRaixGfdy4q23IUjekiW3nbOWSqvk7CDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0723515e-e94b-8560-4b9c-39537637d635@suse.com>
Date: Mon, 18 Sep 2023 13:46:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915203628.837732-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9382:EE_
X-MS-Office365-Filtering-Correlation-Id: 37235e53-9131-4a55-6500-08dbb83ce0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o/a3hBMU7YdpEK3EjhGcnEv99T4BzGQfVsNg+plXxvHpeKYH9DkP9MldYEXT/X1wonhywpMpArOiCP0Wy3I7pXNILAZLOCxbRCa/bQPTr7e9l5o502C4IAvNbqj6CMo1c5vE0hRhZkx622P83XBcq4FIiKbiV8vBTT/GOJqB/hK43iM73uCJN2dkSRs1j8SpgjwDiNeg5Zbod6TDPmwimgVbPeSzGKb/fki4G1XI+iijnPm1tj3Km+/V2Cph+A+8UtxuDZtnbOMiodW6L1dh3YuvSlFSQ3Twn8pZ26moX+BqFXYkEDNaIBthsNgSmIQA9LbOtWe9jA7KJygbnBZurIChcTTWwPS+/BVN8/TDDdqyUPlB/nUE2lOr0x/f4FWQvW8+q/8IzpIZS/RaS29/G+zgge9RQklmLkfdqSUbIAaXjLYWU4nHwjEB+D0kFP9LmUwjryMOxO/S/qG3Ecqdbp+NRsBgPrTmG7PdCMYyxP43UCyI3DfvbPdGVBJV76ZJDhhWDmUSQZUWb4QPzlW0GYz20ShZ5YrblBloY1m9QR0bilPCf9dRE/kc3lwo3Po8PHBjZq6FTpBwAeAcc8+frZo99xHQSokgq9XZoyDAs3tMXt32S0acKa1fU5WSLE0ZPGTxLlHVsd7rX8tIPUtTng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(1800799009)(186009)(451199024)(83380400001)(31686004)(6506007)(6486002)(53546011)(36756003)(86362001)(38100700002)(31696002)(26005)(2906002)(6512007)(2616005)(478600001)(41300700001)(8676002)(4326008)(5660300002)(8936002)(66946007)(6916009)(66556008)(66476007)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDNJNVNSQys5UllkK1dHOWVURUlSK0JwZWpmQmdrUHpWUFZFWFVIcUtROTdK?=
 =?utf-8?B?WW5JeDkwUGhyNHo4OC96alFXZWJQWndaRkRKUkR4SlgveGRiaUc2cHlEdENz?=
 =?utf-8?B?WkFqY01tTURwRDRHa0pPZkZrOGo1TTk2RnQ1a2pKZnk0OE05d0Noc0d6VmZq?=
 =?utf-8?B?L1ozVE55OEY5Q0tOV01QdUdCa3prblBlOFBva0t3aWtYRERwaDAxc0ZsUHRJ?=
 =?utf-8?B?SWtXOGNzdlBaTDZuTlQya05nODhzb1J1eGZabFd3d2l3NDViNExmbW1WRlR4?=
 =?utf-8?B?aEFPeWpWZTE4Y2NpSXJ6UTk1Kyt1cmtNcXlZRUptWTM0NlFjVnlSN1duZVVj?=
 =?utf-8?B?UjBkejMvU3RtSjZDL1JYbWFkaFBqdUdVMGlHZEFEVHJIZThiMDJFMXJ1TmVv?=
 =?utf-8?B?OFBGT21zS2NMV2IxK2tjM01vOUdEaTVjVmlJSGE5TXhicjVMQU8rWWQvOURL?=
 =?utf-8?B?VHVlempra3R3WnB0RlFuTjEzZzV3TE5pREM4VFNCcjF3aHVORlpjd2lUVm1Y?=
 =?utf-8?B?SUVsbjJVVUF0M1lHSzl1YTFCRXJzdXNGbXBsMW9oL2IrUTMzZjRuVVhKVk0r?=
 =?utf-8?B?VkxnZVQxNGlMT3FMNjh1SW1NZ1dqcmRrNmc0SWd4NlNjWHZ3ZWhJNGFwaW1C?=
 =?utf-8?B?ZjBvcmZnTkdGRHkvNU1pWUJNK1M5ZWF1L2JEYVpRNnJvVlRZTW5wR3dqQktk?=
 =?utf-8?B?bEdBZ1V3dXNsT2drZE5HeVN1cjhYWnp5WlFrSkplOUtGQ3dTbHFwTm9SdXhB?=
 =?utf-8?B?YkxDa016bWt3MFhDYWZ6ZkMyRXdqM084VWg0S0lrbDVkRmxaTmwzeXl3SFQ2?=
 =?utf-8?B?ZSt0YTIvQmRuWGRkOVNUWU9MQU12TmNrSXNzOUE5a1VHNm1LdWdmSjVTcld2?=
 =?utf-8?B?R2ZETW93R2lQSCtjUnZSWlQweDExVzNBM1Z5UWJ2bUdTQUxDc2dSc1crZ1Nr?=
 =?utf-8?B?WCtGVlp4RUlUU0doV0hRN0MzSDZXQ0hKdmI2Nm4rRmRWZ1BvOVBqRVRtNDdC?=
 =?utf-8?B?TytENUZYc3ZZdFRoK0NCSThNNkIvVXcwd2REY2VmU0h5RWhQNktFK0NkSndW?=
 =?utf-8?B?YlQ5dUZZOXNUY292TlBuclplR0lsUGhleFFsSUtvejU3YndlYkdZd1BBRklQ?=
 =?utf-8?B?NUNPci9PQlB3dDFqbTErcVVSQ0hraHpRZ1pibjdRaTRDODQ3ZWN4V3ZNRnZY?=
 =?utf-8?B?d2ZZTGtUd0haK0ltNC9MTWZKMDJlcVNidmMxZ042dFNxTytvbHMvM3VlY3Bl?=
 =?utf-8?B?NlFVY1V0S01sbE4xbENvNTlmaGJ0M1hjWnBQbSt0dFZaYWtabmFFQ25RNVlF?=
 =?utf-8?B?ckFIVHlMRFdEUkwreFVsaUZYQWJUL2U1bThIQ3hubVFFVW9NQUpTbTcvRGYx?=
 =?utf-8?B?T3ZoVUpkeXRGdkIyRGtHWS9EcVM2aFM5anF6R3IwZGE0aDY3Y1FrZUJrRXZZ?=
 =?utf-8?B?elhKOGJyaHdrUk9uOHNiMnVsWmU4OGF4WnBnaUpCOVZqQzZWWmx5UCtrMmxJ?=
 =?utf-8?B?eWFNRHFjUDA5S3RCS1A3d3VUb25KZDg3cVZnY3hqbWtKRmhrZ3huc3dqMzhQ?=
 =?utf-8?B?UWZSU2piRk4yOUZIZ2R2Sk1GR0R4SDRvVFR1SnZFQy9RMmJCSE5sempiZXJj?=
 =?utf-8?B?U1hQQnd2VVNOaVhkRksyekNZVkhiYjJDVWVDQ1JkcUZEeEtWMTdJK0I0WENF?=
 =?utf-8?B?RDZlTk8wbGtOc0tuN2NwWCtyV1NnRno3RVNXb0Z5Q1VsZm8vZGZMNzZvN0hR?=
 =?utf-8?B?OGRwaVdVQjc4YktzUDhSb0poTkxlWGxjcy9RQS9DYXJTSGxMN3JPTWtwdXhP?=
 =?utf-8?B?dlAwNlFpajlab3ByRzJUS29MUmNQZmc0RElPV3ovUUFOSDZsVXlTNXluK1ZL?=
 =?utf-8?B?SkJRL1B6OG4zcDdTU1R6T3Y2RG5DNUF0VW5BZE9KUURPVmFwb1BRUHJDNVUv?=
 =?utf-8?B?M2hCSWNib3p2NnRheVlnNUxkeGJaVnVRN1NvNjBSNU00SC94djhxS1FraTFP?=
 =?utf-8?B?RFZHeGxjUzV4Ky9XMkRMSCswdytGTWF2RFV3Y2Q3eW50T20ra3IzUFNtY1lW?=
 =?utf-8?B?Vk1WVFZGNEhxaHUvZk9SaWFqMncwQlozRklqUDI3dk8xbkxwRFBQOTYvdi8x?=
 =?utf-8?Q?j6YZha8LHHmA5XvC+iYPOGLvD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37235e53-9131-4a55-6500-08dbb83ce0af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:46:21.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2qicbiVJbUjFvZLL75JoLwtvg24tCScZR7a/a7M+4RKxRMH9BRIibjNTjV/0ZK8gguu+AkbUg2CngGCxm+GDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9382

On 15.09.2023 22:36, Andrew Cooper wrote:
> All #DB exceptions result in an update of %dr6, but this isn't handled
> properly by Xen for any guest type.
> 
> Remove all ad-hoc dr6 handling, leaving it to pv_inject_event() in most cases
> and using the new x86_merge_dr6() helper.
> 
> In do_debug(), swap the dr6 to pending_dbg in order to operate entirely with
> positive polarity.  Among other things, this helps spot RTM/BLD in the
> diagnostic message.
> 
> Drop the unconditional v->arch.dr6 adjustment.  pv_inject_event() performs the
> adjustment in the common case, but retain the prior behaviour if a debugger is
> attached.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One minor aspect to consider:

> @@ -1990,24 +1990,23 @@ void do_debug(struct cpu_user_regs *regs)
>           * so ensure the message is ratelimited.
>           */
>          gprintk(XENLOG_WARNING,
> -                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
> +                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, pending_dbg %lx\n",

Would you mind shorting to just "pending"?

Jan

