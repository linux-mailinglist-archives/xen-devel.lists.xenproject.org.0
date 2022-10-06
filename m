Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407445F6775
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 15:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416894.661574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQds-0003eX-Iv; Thu, 06 Oct 2022 13:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416894.661574; Thu, 06 Oct 2022 13:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQds-0003bk-Fk; Thu, 06 Oct 2022 13:10:24 +0000
Received: by outflank-mailman (input) for mailman id 416894;
 Thu, 06 Oct 2022 13:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogQdq-0003be-Rl
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 13:10:23 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa70e3d-4578-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 15:10:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 13:10:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 13:10:18 +0000
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
X-Inumbo-ID: 3aa70e3d-4578-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoqpIHIG3j0ZRc/ODX49pw2XEXFBApS28q+e5mOX8Q2k7kJYz+OG0DV7pUrDduJgIwQfQyoDwzxe50m82kVorJmyyNCw46wWmtLylXF80MMjd66wAxPkoF3ari/PyVRm6G4vsZhnFkmXJraU3udKSBUyHaB6Kp34h2eSeiAs3KpYNiBFl+83PaV+uCTAnxpjGHyLg6blsxc3ldfV1eAQUuv333FmI82FNhEHRShfveoRwhi1CwFcIpkX8bcybzD/mqiJ23OgidzV8XXpKNqne1ZogLAAR3JKKUsVOB8SeJGUqlqILrVdq0Ok02a+9xkn2feK9HIMX730Q8tHhE6ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfG6jW6NwZFVigTSy0urFosnhX7NafSMfX606VrU1B8=;
 b=liEx22Y0SShvVwrVhPNK0RgJ4N5MYXJjJXDlfeQQOh4khiV6JLlnxM+u4vhUBdPwdJUg9WXccW2V1pA9RZbyzl1ajdk+mxERp7OvoxDdw+TV1rFGeKKqmKXlMaNuqqzUr2NtKadWwtGa9Q1wbjqbAgL4FGMavxC/8l+oHE5NuwNXXJJVzDuozxjYVRH7KqzKyLdXZ74Uz9RkufJVPynArcg5r2af8JQ37IywFKSflmNyKHmCt00w25Qf9sq84Uj+ecpyHeTpziEV9kqUVEmBsUrg+HkdosH38f+RJzzMhu0lce5xMCKj7+dYlNSmvAM7t5L8G5PxU7bPyLwqKqSIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfG6jW6NwZFVigTSy0urFosnhX7NafSMfX606VrU1B8=;
 b=UTqVFL8lP7N8yy1vmCfjeU0kSD85S0yvcbQlrl4/9ron+iPjqK/vUa9DPx0TaLGqxyhIXJPS2VSnI0CaWq30/gMarj9daJqIz2hxllzYxm3pTxm4O6uvB67Esy4eoAa9/zkcTx3mXL16UsbWoD5AfBeDayq7/59CQ1klqaKSH9CYUSByvwrMP3yndpu+txev+kvRiXFTQRVzX3L4S2F/sij68hB1ueaR/d1tQSXXxw1QLLJTnujevaSU7Yb2SoEchudDY8CdsaDAgI/Dq89Y4Pem/Q+EIZiXw0f/epCnKnB7HpWZgPRCu7mv+t7po+FOBfcCzQqu+C75FIot7o42TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
Date: Thu, 6 Oct 2022 15:10:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2][4.17] x86emul: string insn corrections
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 68313f1e-9fcd-412b-fe30-08daa79c1dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6cxLtAML2vKXNZ4HLUmUoXoa8kK2IbSR6psQ3sSm4JTaFDi9q5SkZz58lKjLtgqmyGV6BIAWdXMhOIwBF27tbIZoLD8mJ2UlNO+CfvGnrzF+MMIgsvpZienLvxEQzTHmq97BD1aBdj0airM762XP7z94u34L99lT/Y3652lBdtFc+AoJH5O7A7pfxNSXHD1YBix3YGA+N+Y/qRfNud2Nkbie1Udt3lpSZkNeIp+0oFOXx6yv7HLJlTbRfzkZjSjwhrnMiSBEWCE79NZiXatWeR8Cf6zN8wA4Cqud/6Xy1QfJCuekcpnk6FFNz5eaMjKsjfgZxyh1tzh4/p5jf3yF3I1knzs3eTuZPOop4Oh8oaybHMe+MC0dMuySJ1zY51rrnL9eI4BnvRL9FLkk1F0HpYtbGIQbTEkybVt138txc8ixuieved3dUx7qIPE9urRJFnbs5ToTD5YJP9x9xSyE6M+90Q31wN1ItpTuuwm7amM5tkJA1Y/Cb0sTiWQ3gAlgMs/LM8a/uK6F4fFUe8p9dRjAe77dEU1YxsLYG7uq2Chg63dxhkHP3Cfwvvy5aYjJNGPFf8qxXhpfTbZa7fb7cq+/ehU5Ph+G7ZstdDLkCWKxBNHwaIY5dLVSvvsi2HUMs7eH7/z3Uqb9GjnQyW9xlarYNPxTk+Vgre0b77XTRbh7odL2lt924GOkLhmO6eqBTfYVYbSjcU9AHyzKHUvMsSyZX8YwEgkwwDHZ/ZAyT6If3YBKMeTxryj6/n0I1YmjYVTjKnwrZE7mnpCxlJgW+MeI5jcAMtCs6sw+pSfPzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(31686004)(36756003)(558084003)(6506007)(26005)(8676002)(4326008)(31696002)(2616005)(478600001)(2906002)(186003)(41300700001)(316002)(86362001)(6512007)(6486002)(66476007)(66556008)(38100700002)(66946007)(8936002)(6916009)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlFtOVUxVGxCdkJlN1F3MTJ1WVc3QnY2eDliMlErZ20vTEFYTWxRMDNtZVR6?=
 =?utf-8?B?VjFzOWpCVHpIWUczKzFXVWVkZyt3dDJBdTNDZExvaVlNYldzK0czempIL2FK?=
 =?utf-8?B?ZHd0aDBKdjJjRjJKTy9Fa3VuN203TXhuZHMyRnY5b0c0ZGlIeklKTGwzblpL?=
 =?utf-8?B?RHA1Wmg3T3BneXlYUkJwUFZoWlB3L0J4bVN0VHd0MEJRNVZ5OFNiMXMzUmtZ?=
 =?utf-8?B?MGtFbHpVenBwbWc1WWs2SnRHbjBPaXJCdE96eGlRN2FaVWNZb3ovUEZ2NVo3?=
 =?utf-8?B?VHh6aVhFMjhRWVVBRWZPTGExSkdwWGkxZW5PQm1xSThuSDlCbWhEVEYxaTNJ?=
 =?utf-8?B?RzRXMW5kZkYvTTY1TTFGbGlVcDkxSVFPVldTZC9IZnpXVGd4c05lam5LMS81?=
 =?utf-8?B?VXNLNytQQVljNVB0d2NENUtUMWRFeHpac2RucUhIVStKa0FTcnNGSFRwQVFZ?=
 =?utf-8?B?b004VHp0bWVVb1FvRklLRHRFcWpQM0hNZlBmbWdVMUVwNllDVTEwZHczbW51?=
 =?utf-8?B?NTFXcUlCeUt2R1h1ZERpMWJKK20rR2RZcXdMaEs2OUd6cUxNVWs2MDhYNGQ0?=
 =?utf-8?B?NEpnY3BkWWNKQW41L3R0WGRrN0JGVHFURGZQN3BHd2VWQzVLaTA1VnYrNkFx?=
 =?utf-8?B?M1Z6UmRWbVpXZ0c2UlFXWWt2TlZwMUZrMUJuOG5KaGY2Q0huRjR1ZGVyU0RQ?=
 =?utf-8?B?b01LcVBzSGkrajBTTWZWZUtqYkV3dDNCVHJHRlNqNFZTdzlmWGVFbmpuN1o2?=
 =?utf-8?B?Q3RvbVlUTU5SZ2VlNENKVlE2cTkyWkVGanNvWXY0bHBmM1hwOFhNRDJHUG0z?=
 =?utf-8?B?aXBlSXVpWUpvajFURW12SnZpZmE2ZE5WYm5EK3RCVitLQnRicFhPRXFTZlFY?=
 =?utf-8?B?K2xjV0VpNlhoRXFmaU1zOU8xalRZRzMwdDJXMjAwV2ppRXJETmlEb20wQVh3?=
 =?utf-8?B?K1Q1VlpFYVJWVTFiTGJzVnptTnJ3aDFSUlBYRE0vRytzSHNBU1BaL3N4cXh2?=
 =?utf-8?B?UDk2OURZb1Y5UzFGcndhcU5JSHpJRXhSakwzdGZuQ0dKRzRSbUNFYXBVVWU3?=
 =?utf-8?B?bHJWOCtZU0RoalN0aDhwaE0wTkJDbkIwQjY5VFJycTNVWkV5aWliTjdJS1J3?=
 =?utf-8?B?cTAzSy9lbCtsY3Z2NGY2bkl4S3RKTHZqZ2V3OXRkZkdBU1Z0SWNxeGlNb29D?=
 =?utf-8?B?Umkya1dvNjA3dU9kMEJQOFdvQ2xmLzFkbWZkMnE4RTY5dGlud0VRUmxRR2xw?=
 =?utf-8?B?NXB0RDdiY3dxVVE3Q0ZkYjl2bm1yQlZMRGJUS3Q5V3F4K0V0d3BBMSswUStz?=
 =?utf-8?B?K0lqTzQ0SXYwdklyTmtIRHNzenNBb0Y2UTB5SnJIeGJDemZobHNaZ2xaS1h6?=
 =?utf-8?B?ajFXNHBmTWRpeGZjQTU1SlRWRitGbHFxZjREMjl4c1BRTUNWMW94L0QxQUEr?=
 =?utf-8?B?bWtwYXczYm5oQjZVYlRkUlRZdERYNXVUeGV3UytyVHMyNW5zaGh6aXVkM0dp?=
 =?utf-8?B?ZzR0MDNaM3BIQTdEZVVnL1RXdTFacVR0RUhaOTdJdURpS3orYzRSeTNHbnNI?=
 =?utf-8?B?UjBwNjVsU0xTNGUxMWh0VWhkMjhlY2l1b3doTFUxakErZlMzQlFrQ2NzMVNN?=
 =?utf-8?B?TVo3eFUva3lOa280MzlQUCtVcTFpSVJleEdwdGpIdS9hVW8ycml6dm45bC9N?=
 =?utf-8?B?ZC9oLzNKbFlzMGNLcCs4R1gweXMycitsaTJ0UG1adVZVS0dJeVRicDlnTXRM?=
 =?utf-8?B?NFQyQUFuTUhVY0dkUVdKcWp6MXpLQ3N1SHhuRXVtckZPYUMyWjFxTXZvSkFn?=
 =?utf-8?B?enF3RXc0L0hmOFhqbFc0VTVpUXRJM2h4T2tFd1pXNGVtQXVSeVhGeEJUZEJX?=
 =?utf-8?B?bGNrOEt2eVN0VWR5RHpGb2U4a2dIYXNlWmpGVHYyTTFYNUhxRjNUS1JMOFRN?=
 =?utf-8?B?c0NKQlZjQm9EaGRGeU9nYWlHekVRTnc3ZXdEQ2Yyck9IK3Qydkt6bkdJVWNx?=
 =?utf-8?B?RkwyODZMSjdFMGlpY3ZoclZmMTRCVVVpN1A1UVlHYUt5bWFBeS9QN09tY296?=
 =?utf-8?B?V240bTNCY3dRZStwclBNemZnWS9MTWNMRXpvRTdzZzdrcTQzWmdqSG5JSEVz?=
 =?utf-8?Q?8zRnVnE2etXLPELJmCa49aGpx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68313f1e-9fcd-412b-fe30-08daa79c1dd7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:10:18.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D9VDeFZ5HhsTE8Z7CSbgEnArruRJE4T2cZmjK3fLyKqV2YC3h2g3nX/H6iD2FVJuXx7gVo0+/bVl7klqrxpoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560

Both partly RFC - see the remarks in the patches themselves.

1: further correct 64-bit mode zero count repeated string insn handling
2: pull permission check ahead for REP INS/OUTS

Jan

