Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90516D672E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517971.804033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiUW-0002Uy-Ns; Tue, 04 Apr 2023 15:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517971.804033; Tue, 04 Apr 2023 15:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiUW-0002S0-Kr; Tue, 04 Apr 2023 15:22:36 +0000
Received: by outflank-mailman (input) for mailman id 517971;
 Tue, 04 Apr 2023 15:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjiUU-0002Rr-QI
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:22:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 858a8cf5-d2fc-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:22:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8264.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 15:22:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:22:31 +0000
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
X-Inumbo-ID: 858a8cf5-d2fc-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiqgN4QuaDD3A9CSFy0Wym+tlZHRTfB5Ng9rjtsnn0OCi3phTzxozAy2l1Ks5dkziE6JfNz4dqsAthA0lzg4tshVkB50bvQWXGPTjDS9PEBTzS4e5x2WP9kK4eQqU/k+TTSVZJ9hmgHTD2DMc1EPwTTw7ezMrCYHzyvkc1YEaU7qoa3zHIxVSaicW9kLixuH0WCGmw7ZuR+Ki8Zn0ePhyOveWOWyzf7Odpr7hoZWDjg/JQcQAQFkKSOme2XBqVUlHYBDn1pwxs/Dp2H5f6C+E7wW5nnh6TOq5a9pjVGW1RKbNEOwZsOQg6aJCIMyhymxQ2qq79DsVggTjWoPgAkeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTzjGYye49h2XlQsudSBmRNkFZaxCU/5/YM7mQSQXcU=;
 b=W3eDZaCvNG/0j74Bv01VsV9z2gIRqJPib+EVdQ1ocihWhMzsRSrwlz0IX3FMcE1jYLWeziOvMhzHLch49winTPUjhh2EoZlLCn100Hj9RT1r5SM8ouka/cdYmxSCAD14QDod1hmsESqBreBfcIpPBZHs8QsjJdh8VYQnFwcfUy02gI23fU7YwlfDdwkaDKpCMYxqH6Sc5h0FlFyQeNocpb3H3GUAE/nvVpAm2swqWxE0IZtGnOrO+zp2zNL1ZKFapA88OW0Irrw+UWJ1Of8tj5iYB/25enpz6W4IVAZxIw+MzE/UUozpFrg+adDoXe8Uf7aXM4mLtuHCdlMjfUEv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTzjGYye49h2XlQsudSBmRNkFZaxCU/5/YM7mQSQXcU=;
 b=pqZxDDb1utSba/nygGJzk/A+a3zjogYW8saU+O+N9Jgwcu5N7+A7ZLePvC8YtKVhlE5vekM50jBmrYPGEF7CkPz0dleQimwxH8g11YBuLFPoivLWSCJ5dZOX69LoYIL7nLDyd+FH5lUB/KpJSDEuSvAV1T0ugcziBXww6aakHH6pg82BBnzkmwY5V4Ruq0rSdE1JSynQSY9K6SJwGvXx8tZeO3l/KYgQ7dm8tll0bXrgcrxE1ehAeLWODAYNZg7WQ/VjIQr1+AEpNgd+L3wJdjcyyHP7zmJC1IwMBZg1XpBfOvIazuv8CZkf6EDgBWhdl9PvzEUm4/JmGZAfn0bo6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c132e7c-8582-874a-1964-31368fbd5872@suse.com>
Date: Tue, 4 Apr 2023 17:22:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 12/15] x86/emul: Switch x86_emulate_ctxt to cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-13-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: f807b7e2-69ae-4c90-4094-08db35206845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ux3dH5JOxY+VxSOXqvaEjLj7TxxzPL6hixN02zNFlI6+WDuG9z+9/Bcyaj4BhLLNPp53J3q4OGTP66pyeiOp7QBEU1lZMd4MZNPnbmYeUjOOs0QQrI8HJexOIxm1lPc/WuYie3ajwP8JtAXkEvQrRXfU7dbk1QtSLo7H5Lc6wqcdF0+ak6f4jsTs9p/1O4X7EtikZSsRVmBMl5Xhhit4zmKODJfZfQgKPw2XV0wUYr8s4cQ4hVtD9SOhNAzCi7E7NhMUCOJPa0vVtQ63PiKKBJLqj+gIS4MhVD2PzjBwRuo08A83jUVbevkt6kx+8855US3Vm/D1kZ8ija8yorhSTkISRkiPl9L0XU0FHSvyHVVi4mDpK3rAd5HaYLZWdv2c8u3VKBBYFwp3J9Pzm7f0D5x2cgGP8GsEuKizP/fjAsPELshihBUdVMbe1kTH1yO9K+RE+X+oD+4wEWD68TstuzFCvB3jZBDXml6Yw+m1z+OUuEsGR2qUbg2dO/j2qN5+lxA7XB+lVMDlyKUCQh38WryO3CUTdUUseuv5XqHntGgQM06AfCuExzKYlLFrTD8juMttbtcveeZzRB7setKz375TU2Hc/XeMj4oiAZE4L9BV7iTCQXM2HMpKNSgEAv2MjzpLTRvOT0ybnIrFaHQYDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(4326008)(478600001)(66476007)(66556008)(8676002)(66946007)(5660300002)(316002)(6916009)(54906003)(8936002)(41300700001)(38100700002)(186003)(53546011)(2616005)(6486002)(6506007)(26005)(6512007)(31696002)(86362001)(36756003)(558084003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0t2bDg4MGhQWjY5NUdJblNzNGkrcXIwVjRWaDFXSW9YWkhBZXF3eFBkTWpo?=
 =?utf-8?B?M3Rpek02OGQyWnYwUUZMc09nZzFjVHRmV05FZ3A0dUwzL01RTUZlZW9UaVF5?=
 =?utf-8?B?d1VGdjZDVDR2WlRlWUhlYnJybUY4MHhYN1paSW5YZm5DeGtGOWo4a0pFaEZr?=
 =?utf-8?B?SngvemljU1B4enAvdSthcWp0Z2J6ZGpZRHU3RGd6S0U2ZmJTalB0YkQybTd0?=
 =?utf-8?B?U2p0alZrSGJtTXB5Y25lV3hJdUhZQWNSV1NSeGUva2w1NDZQUElsc3NBNTFa?=
 =?utf-8?B?OTFKdFdzc3NMR1BYc3czTG5LVHRSM1hDZU92WnErT05PT1N3bjdTY25PcFFC?=
 =?utf-8?B?aW9uZ3h4d2VDTzIwcUdsSVRkU2xOYm1uSGZycXYrNThwenpCT0g1a2thN00w?=
 =?utf-8?B?MHhUTGRSdGRIcnBGd2MvamZydFM3TGJISzRnWjZyOFFVd2ZvUzUrQmFHQ0ZW?=
 =?utf-8?B?ZFl4TGFoZXZydFNjaFBrZWJLNEFDNW10WHBoY25iUG8rd2JVOFNWdXBiekpy?=
 =?utf-8?B?R2JSU0EyellRK1JKRW1QaTlvV2xyMWlKZGw0Nm4zaFllb0VaeFRuZUJTc3BX?=
 =?utf-8?B?dW9FRWdDalRnRDJBSWxTV0pJdHhXbkd2UVVyVXZTUXJJSDZXL3lUYUsxdnIr?=
 =?utf-8?B?b0hoNmozeW1zRUxJQmp0VXdGVnN0NEpramZpMmdFUnZtNGs4RlVNUjBoYzh1?=
 =?utf-8?B?aWlTY3VURnY0VE9LVGVyRm1CYk1pZGZVdk9tZCtpY24zOE1ydDJhbVdIVXQr?=
 =?utf-8?B?WWZGeFFLQ3gxdzJrUENVN3hyc1MvWk96S2hiK1FnWUg0dkFJdFd6clhWcWp0?=
 =?utf-8?B?a0xtdWFObDNOZHZSMy9UZ2FMMXZOdEhlMUlPb2lNYzdNMHVDaGF0a256QWdC?=
 =?utf-8?B?MGQ3VERXT1k2clNOaUYrVnB5bkhweGY3UXJVTlc4ci9PcnQ1MldTSjgyRElV?=
 =?utf-8?B?b1R2bXBJUDYzV2YzSCtmMjVYT25ua0xXM1B0MCtkWHBkUTZZM0JoZmYzUlBt?=
 =?utf-8?B?Z0h5WXJ6WUJpeWZ1MUlqZTZkanRhU0M4M3Nmckdxa3o0NldxN0dLRkhjV2ow?=
 =?utf-8?B?VFZJVE5OdUw1eXlzWmlEQVJFSll5VHFscVZxMHpERFFWNVFEZWlETmN1NzFi?=
 =?utf-8?B?VzVTZVlaR2M3VDZ2YWZFR1BmZ3JJM3psMncvbU5DUEFPdlRHUzg2ZjJSOThz?=
 =?utf-8?B?WWIyRDJHejRCRXZvSS9jVjN6bVNwYmx3NW9YSmREQkl3ZDB5R0k5cWx2QTZZ?=
 =?utf-8?B?d3c5QXpHRTY1TmVnWWMzZ2EyMTlqTXo5cVd1VThYNk5tM25zN0pIQ1NaUTEx?=
 =?utf-8?B?U09PRkJ1eE1DandXNCtxdjBQSDQwU3JuQUZ3aHBGYk11cVFlVmQzOEdadnBt?=
 =?utf-8?B?OXNkVExsenhXWVBlai9pbXlad0ljczc5VW5zTWdaeTJoV1FCa0VtQ2tjZ0J0?=
 =?utf-8?B?Y29UazNjY1BFQVl4VEJ3S21Hak9yS3ZiNldpaExiOFhHWnVOOTY5dWhWQVBC?=
 =?utf-8?B?YVIrUHlIeU52bDAzZGZIVDJHRHdOOVJoRFNXMFJOQmMzZGdFVmxFaVBob0VC?=
 =?utf-8?B?WXAzZTdxYTVEM2JUc0s4YmRwNnpVb3lxWVkxSUUrYi9SSkdod21HcFQxVjEw?=
 =?utf-8?B?Z3ZXQ3RoclNMYnA0ckpLYVphL1kzVDZOTmEyUkFyR3IwcnFNL1AwRGRldXFn?=
 =?utf-8?B?Q3VCdU0yZ04wcHdscXNCUTNQUUhyZTR6aUxKTnh1UTFhcy9qKzdYNEd0WEFC?=
 =?utf-8?B?WGFvUGJIQUZOaFNkVG5yKytQWUMvQ2hkbEowSXR6aVc5cEJMVm91L1Y3dENL?=
 =?utf-8?B?QkpWNFYzdVFtcEF4ZFFzTVdPNTRKbks1cjFQMkJ0bGZDMTR1V1dIampPYXB6?=
 =?utf-8?B?UmIvQnJsZVRleEdPSnRWdllKaDRVaUlmaDJtU2FTNFIrSm5uUDNHd1hEMFNl?=
 =?utf-8?B?WFhWUzMwRUFFUWV1aGxnU3NPUDdYVXZEVEN2UXBaSHArYzdqejVPMmgyN2ZM?=
 =?utf-8?B?MVNlNktNSyt6L2J3MWRXWTF2cDBtT092MExoaUl0MWJrbTdtTFVOcFBUdUFN?=
 =?utf-8?B?Nm1yUHJuckk3Vkl1Zkt2YTNuVVIvc1FGS0x2RldENDVsRk9yUE1UbHZ0ZEtI?=
 =?utf-8?Q?JIXF5Vgof0FAArKWM65Ip4+Tx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f807b7e2-69ae-4c90-4094-08db35206845
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:22:30.9659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uACBSfMpPjYGvyypp/S7Ax6HnYNQKwhvxq6ZI2/qbBpryMOtUxVMG5ApJ7NvbnV1UdDKERnMHh7bUHGre0Qtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8264

On 04.04.2023 11:52, Andrew Cooper wrote:
> As with struct domain, retain cpuid as a valid alias for local code clarity.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



