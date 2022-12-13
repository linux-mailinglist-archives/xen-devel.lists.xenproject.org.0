Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0CD64B743
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460672.718624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56BS-0003tC-Hd; Tue, 13 Dec 2022 14:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460672.718624; Tue, 13 Dec 2022 14:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56BS-0003pt-Ee; Tue, 13 Dec 2022 14:23:02 +0000
Received: by outflank-mailman (input) for mailman id 460672;
 Tue, 13 Dec 2022 14:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p56BR-0003pn-Dx
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 14:23:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a568fabf-7af1-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 15:23:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 14:22:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:22:58 +0000
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
X-Inumbo-ID: a568fabf-7af1-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTsuBtzdors2mROChSOP9cijUvMmC7Bg3ioEdpWm6Lpvenh/LE/PBnPEcYQoJJAjag7IJtC8oZkxszcgaYVPgJ6GXriDmAgbQ8uB7kSHLqC2mfiVhbtkIm4dvlzW7IgIUJGa8UGFvZ0CaHtTcAdZXKmdeGjOzoaBl5HXfeD/3DJ3oheb9yewFtsmBg9uWGYJb3hEuWPtrMrh8OvKk8UXISDLIU0i3qbzsTv5yXnpBUjl0wLFXT6+KX2f7ZfoGJcAvazoVLKQ6Y2ZgSjGANh0o7J2VMq1z5gzSzx/Afw1QXEkRubcb8ZwHZX3MqsdYx6jx8SxmS9GeIiCSY1ejmrL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsuVLthkkiwRc3cGgJgC8giW+xrAnne6Nrr1GmY3WIw=;
 b=Ipp0eaTeKH/W+iDA9i3N6qdptsTJnx2/IkBEKZPrwCSmxSmhbm1oUoeiPHJEuh+Mp29/QL2YqDBzRJsXIaYPt/FXBF/RZTtgDbKv5FoOcrmfWQ5BmVHqLtYleJ7LO6Skj/4kbMEQA6QPbCBOb7iqxTvk/iCYRvZs9Ek1hFs/ckNZMVeR3y92NEQ8HnxU0qf3Wq9YTaANVWRUkH8nEnBhlRRRZ5dx25z96dl1Y9hLf0aTMkv5sqj8jyjROUROJWlmMLbvGw8P/sLIAprSJs9GZ0GdXr10hDe3JJxNSHIdtHKn6z8vT3WzRHb7K/DvGYodXBSnaxYe3TA1AX3FQ4C28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsuVLthkkiwRc3cGgJgC8giW+xrAnne6Nrr1GmY3WIw=;
 b=BJtR5ee3KnR2aW4EAvnTyWRTm28Jy8ahAVVjW28WvPCVNm8vUxt+TwJoTV7bOkphrmot7sb5KdE9u5wqdJhUxXnLAOBVpy5eb911Ku+jNc79oWqAB3CBvObfN/lQT70S1+H6vAtR2Zw39Fk4SUuEfMb4NEllFsDC+y8U/IXh8FcMpwswEkxebxl0joLDBHycrQHEdBvocxZyKehhhXrIqWf+l489ehCvUgNfZwGTTYjFuCeeHLfTDCqzC/7l7D5tGC9GcPtQrEfwUkF+yEc46YqAqz02ywgIHn3jpA8eNIbA4ziAZx0oDkd5ryT34UMEP68jmmtwSmfGuS/Z9TAB5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b305d4bb-b561-1dee-0869-2d08edebfe47@suse.com>
Date: Tue, 13 Dec 2022 15:22:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Relocate the ESRT when booting via multiboot2
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f90f583-1c14-4c9f-f064-08dadd15887b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ex4UNvZ07Qk6jnBV1mJJMF3g2uwE11O9pnGt0FbWQIE0BT7tPQQsIIEUX3Dz1gyCFme1jtX6gtTdCsFBBxtofMvwRjKUzgH8VfK+wNPGVY1rk5pVXqa3TQMHGHVkQQzKtwz5RJGQQPzm1b7j4E17+JGBRmEmxOJT0H6w28texHxZTDBseAPl1CZxMPdqb4FARKPLGivD+zZGxBi70mY+Q8MVHr8ecZarRKlDU8mvdpMBCQHPGiOLq100bLJWMyNyRLH9zcJHGSYs5ue27+wQw9lqVwR46GDly7NIGwJdnpHmT/7epzXhMScLEsPP9b+dagvYRTd/T/nwh7cgbC+pGSeqot7DKs9IkMfdNQkXcuWor7roQd4EU8qFtpqlemHZh1A6p0W/QNoUOVAfqjgxANlGz6D/nuhANqlwepi6mLUk7Kx0OXuaQ+UPa/U32FmhFA8MsYNmz7V5HCovfAQaUDsmII9LKAiqtlT65IX0AtSnw7T8kf/gCOex2Yr63vhqhFHTgz8/tTF6R5ZrNaXiECy+i/RA2YWEAHVpTsa4tzM2VfyEMZjy/SDorXXuyFNAig0jnMutQLpviyt2cz/Pgy88BLeRPgIlrqDvHAWRIKRDPE4284xeEKwDnpCfWLRPHa5mvQHz7XQNliSWxUU2lUKvyPDw9GyV3KpMum490vUREF+EZNxUjD6318YSg4EgDHZW5YEsQS+bZWIic53sL7x872XEptYTiHIC4Pp6HFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(38100700002)(6486002)(31696002)(5660300002)(86362001)(478600001)(66946007)(2906002)(41300700001)(66556008)(4326008)(8676002)(316002)(26005)(186003)(6512007)(6506007)(8936002)(2616005)(66476007)(53546011)(31686004)(54906003)(6916009)(36756003)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0NrNi9EUklBVCtGcXYrdW41aldxcXpkRXl4eUxNOUMwR2hZeC9TUU9nSHlS?=
 =?utf-8?B?QlJJdmo3MmRuQWY5RUJwZXFoZGZIVjhPRE1GZThCWURUVGsrNXhadGdVUDd3?=
 =?utf-8?B?bTh2MkZuYnphUWQ0YmwxYWoxbUliNkFlZDlueHBtakNnMFJGY0pxYlhDbUJP?=
 =?utf-8?B?a3Yyc1BIbDhuMkQ3bDBFOTA5ajJpT0hoYnVTV2p3UUdWMERjMmt6alhhVDNo?=
 =?utf-8?B?SVA3NmJvMy9rOHRNaXJEUnNKd0Rxb2t4ZEliak81ancwd2VhNm4vRnBnTkhv?=
 =?utf-8?B?cW14S0xqM2RuVHo5UG1YN1ZQY09GYUtqbEVJYVBhMW9LZnZITXdsL2E3ZHlN?=
 =?utf-8?B?aVpwenIwcTlSR29oWnhROHNidWZLTGRabkdvemJ6Q0tpSWpvRTU2NHFuclBG?=
 =?utf-8?B?MTZYQTdvWWorWHpTN0hMYlNsWmFHMEEvOGcyUzZsSHJmYVQ5K1lObU1TekUv?=
 =?utf-8?B?RmRwaUhkY1cxS216K3ptOG5CRE5jcWxZY1l1KzVmMXJ0eWtNSmJxZFNJUVps?=
 =?utf-8?B?YzNaTm1RQ2ZIMTdkNDBBMmx5WVRBREF5NTU3ejFERHhFZHAyNnlzclpiRkJn?=
 =?utf-8?B?WW41ZDY1TXJhNlJKVkx1cmN1OHNhKzBwRXFCOXhQZXhyTjhibWlRRDBDTE1k?=
 =?utf-8?B?c240U0tXWkg1WGJWOEU1S3Y2QUR4eWh6Z3plWXFEbUwvZTVFU1BUV1I2TTlk?=
 =?utf-8?B?V3NGTWV4L3JsMU5weXZzSHoxU0RuT0wvUnFqT0t2NE45b1dENUp5a2lwaFkr?=
 =?utf-8?B?c2lIdFlOdnVOdk1qZld2SWs0eVJmeEpzL3JRcm9TNTJOVkVTQjJNa3Q4dHFr?=
 =?utf-8?B?R0xXeFZOY29yVWh1aytzeldBajNNTjN2QlJLc1dGTWtxWWZMRTZ5WnhCT3Mv?=
 =?utf-8?B?VEhpVG56YXVRV1JBNTZRRlFWaU50cFlPMFJoKy8ydUwvMnBrd3Q5N2hyRWxI?=
 =?utf-8?B?MncwRG1kRzJ0RStlTmtyQ3daKzMzRjdXWlRKcGtVWHRsMis1RERWNGFPYUg5?=
 =?utf-8?B?b2hFclQxbUlvMWc0ZFo3ejVPci83T29ra1IvdVErZmt5ZEJOMERZdW16cnJk?=
 =?utf-8?B?NWZVNmhLWnMwSVhEYmJVNlZwOGR5S0JBNjRFK3V2TmovSFNSTDRia1prWUNh?=
 =?utf-8?B?aTBoczZ2cVJPTUhUa0FhSEtPcDkySTlkNzRqZ2RFSGRRdEN3dEVoRDlma1pN?=
 =?utf-8?B?RFRPUk1TRGN5R3NudUFaV2dVd0dSOGpkMW1rN2JxSDFkaC9pTU9xYXNXaEZP?=
 =?utf-8?B?UUxkM29Md1J5Ny9EMldKdk5jaitpN1drOXVoc2xVbHhpbEg5VW5kZElrd0VC?=
 =?utf-8?B?Vlk3U1FlYlBMcDVGUGV2b0dKaFc2UG5Nd0ZjQ2ppbGs2OXozV0Robjl6eGFN?=
 =?utf-8?B?eVU2NGc3ZmZ0TmtnVmtZUHdwMWgwUXJ0Vm9aWUhxc0dNRTh2VFZjMUpLSE5M?=
 =?utf-8?B?dVpoSzI3WnhCVHd4ZDN4ZTNXZ01TYTFzREVJTkRMNXNRVXRXS25iVEpGclFk?=
 =?utf-8?B?OEwzdkRzb0JlSnZzWU9zUWJ0MzV0VW5IcjBCdTFvVlNHeTMyL2NQWVBmd2ZW?=
 =?utf-8?B?OVA1T0xON2QwTkNBZ2QyaVNmNTlITGxTS28yVXdvVFRLdVRlNEVkTWswdEZ0?=
 =?utf-8?B?NUpQazE2eWRqQVdNSUx5eFFJQmdnUW5JZ1l4U0p3Y2U1ZUg1Q0lXVUJQU29h?=
 =?utf-8?B?dDJxK1VlNi9vQzdZOUd3cW9mdWpvaE1TMC9xYTduaGNKTFk3L2UyblRwOE8r?=
 =?utf-8?B?VWdhN1BMV1p4bGc5clVJMFdnNDd1ZS9xZlltZU45cWlyVFdBSjdhdmdMRUVM?=
 =?utf-8?B?NlZKdno4RDJKWk9aNWE1Tmc4eE9uOW0raXlQSi9sMHdFYWFNbFRwZWdrZ3JM?=
 =?utf-8?B?aE52QmJjK1kyem1idVJwNFpQOVNCeHk3QzZkMlBFelhWOWNCUHBwTWhZbTI5?=
 =?utf-8?B?Y0tKRUc4cEtHSFhNa3FYUzUxREJsOTY4Z3V0ZVNxUDVHQzdHYmNvOWtVQ3lt?=
 =?utf-8?B?cmhMbGNzaTNMUU9xejB4b01pY2psbmZkZFV4MEo3OGlTQXdYbFp1V1N4TDFt?=
 =?utf-8?B?NkRwdlFpT3hnYUhyb1M0b1IwcFZtL2JKcjdIdW5IdzlGblJZcVlRdFhHdzZt?=
 =?utf-8?Q?VSTASb2miaXUqOWjq//QQgaFt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f90f583-1c14-4c9f-f064-08dadd15887b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:22:58.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNt8JQaEvyJQoPi4eugbMPwZTLJZ1eVPQXo8GaZ26US0hZuK/uwVLZiQ6vqk7MOHuYQ7Feq2TEYSB2we+ViTzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622

On 09.12.2022 01:52, Demi Marie Obenour wrote:
> This was missed in the initial patchset.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

This doesn't apply to current staging, apparently because you didn't
put it on top of your own "Use EfiACPIReclaimMemory for ESRT".

Jan


