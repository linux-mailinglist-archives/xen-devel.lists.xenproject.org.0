Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388766FF047
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533249.829743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3yw-0002MJ-DD; Thu, 11 May 2023 10:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533249.829743; Thu, 11 May 2023 10:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3yw-0002K1-AW; Thu, 11 May 2023 10:57:10 +0000
Received: by outflank-mailman (input) for mailman id 533249;
 Thu, 11 May 2023 10:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px3yu-0002Jm-HL
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:57:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91f99ad9-efea-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 12:57:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 10:57:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:57:04 +0000
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
X-Inumbo-ID: 91f99ad9-efea-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJyNp5Y63WeV2J+kgWwNS81fk3nTLp6qNkWXZQPL4UP/BAH6MykV7Uv3nCEgvYDAh0O2TDCisqHERuflq3qaT92x2V7GrsP+qzYMlYFuaeaRNDr+7r/SYuQU3+rYq9Xt/kjg+ozaG5n/KdP2TU5arFTLHrKZpQBWHiqqtLZWEubvrynv3mW1Fe91V9dKN7rJV5ZNAcZu2V09o7GODEtz5ttPJqjbVfWZFQb7lxq8Dv/LOA8+846bl9uVC1SaDswkZb3BgNS2oy7n2OivSrpOGtnfl3AVTrAdPhh08T90bguCImkq0ySZ1ntk4ce3lu5cmMQw2LEYqGUX5fGjMD8eOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxPrUb6VQf4cpKazuHKWLK2Znz3V+Dq5+6nS4clOEBQ=;
 b=fbU/Tiz3sKDwG2/PZ5Az5OAzU7F2uqHiGw/gtcFFh0Ys9j7StDUyBMqWKaHi39eCVrPa+wubocaYktv6iLXqW421VaRpcf2VTC2XlceUnrpU0Rg08OIk750oIhsp1Cu84VEpRjPimqGvQm0g02AcJII60snmrEldSRi0BUAnmbNMDFrv0m+sR2tOxpFqxT2YfZ2ZrTwMzqvSQX+XfG45UcZEpalYztXFOOacvpkIazVSkNEY+NEisNj3gPaNGdosbjuReiLLuD5bWQyoo+s9DqE/pMUXxWcFDiwIMobTQchKsZh1kNXFZ57dZHWSltxJ0GD9bdzaJ3oPMUdvCf41xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxPrUb6VQf4cpKazuHKWLK2Znz3V+Dq5+6nS4clOEBQ=;
 b=L9vUfKTY3IvWI4Y3i/R4pXTHOBlsDazZwobk+v1xfJlQT6eCtHGC/FuepjVEyR6pl4bcYRMg8a7/baS1y9zhVhpTrMFWxB00saPDzpGCKnczfGswHkGM+0KfKn4KjRIjCAljlr6U8+86p4J3Wm0Cr/1MZHGXPjV1A9bcru2fUP766GUx10lm66YUvfIOGR0DWnob7R0mWbH4sKRONW7BLbh/dq3w8TWOoAHtHlx8o5JxnvSAO8INjAaOjstOGOaEqKa41UQEk9ZycgOlVFTw9qqrCVlIm/J1ktWzCgOQM7ZLi2svbJcFn+FdDLdo4SJVp/IQrE/8rVn68+evzqI6fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d1802a-76d2-9b8e-b71d-33c214a6b675@suse.com>
Date: Thu, 11 May 2023 12:57:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/3] x86: Refactor conditional guard in
 probe_cpuid_faulting()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509164336.12523-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: d52a4ba1-6bbb-4f5a-5aae-08db520e74b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xWiCNIfd91kwW3aoQD7JhaQKC/fY0cF1t0fvUDzFlfC3SSpxNGG50X8JMdpz1NVXa7Q+SPsO/6hMlZd5G2g/PIfZ+ym7zlV1LIUU/bb4DXICsajCkcqihmCGgb9ZRa4GJd1D1aRr48t0bsmxZ0RrrYDycB9mobvU0wF6/jOBqMMnt00FeX3oSBchZXNm4Yb0bXS3eVWycUc6uRuXzDtvz9SaiaM0srogJiyiMpyJPvIpMt4Z80IyvlZdr0KhmtbP3zu/Rom80v0ORBr1igrrkLbhdCVgLENCu2eEtSx9Ob4ABCMc2rzAgwJyMTLfDDBW3qXytwI4lq5UdWAucAUVz4fEDktW014n0HIL1hWzV8dY8aOZfZmPotvA5i/epqm+IbsG4iMJXUXIT1YNBwHXNUh9X0FJKdT35u06f3SQQVJmPP+e81AXKuotvhZYUJLODe4y4+Ie0mesETu/SkNPLOtCNLRklYaVc/1/79akorK8gE4Fx6OJlWw0xzKe/Frq5n+kXvyVs79+mMkcZEcEa+c7aB9mVrPindT2qIN3Z3qSSlreEAcMvC3E8rgGI6iViySM5uEr0ezc5NjFqkoEJnzdizJUa16s5oeMIIj6GHyejcX52Eht6fXGji1vwMPAL2mDmBziuSWn+bNRl/ttvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(31696002)(6916009)(66946007)(66476007)(4326008)(66556008)(31686004)(316002)(38100700002)(478600001)(54906003)(6512007)(53546011)(6506007)(186003)(26005)(36756003)(86362001)(5660300002)(8936002)(8676002)(6486002)(41300700001)(2616005)(558084003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1yRTNTb1JOeWlnQVozWEFrWmxqRGVhL0VRVCtFNDhCbENDcUw4Y1BIU0xJ?=
 =?utf-8?B?eWx4b0JheU81N1FZUjRia1h2NDc3ZFExeUFVM3hGcTMwSkczM1RtT1VUckoy?=
 =?utf-8?B?RmNRTG9GTDRZL2tQakpsR0tVdlZZVWZjajh6NTFHMmxCQ1kwR0FBQVpTV2ZJ?=
 =?utf-8?B?TEpJSFdFUzBRaXFFWjNqcE5UdG9JcmcxVHdORzE3OVY5bjZ0Q0l1N1pkZnJX?=
 =?utf-8?B?bUFEQWYzMDRKNmdOZ0VDYVYxVzBDS2hnRUhIWUpKUWJ4SGFuVE16M0psc3lO?=
 =?utf-8?B?eWlHNEtEOVZ4NXBFTzVXd1g2N291WGNFYXErR2ZodzFuck4zL05SQktnWHg0?=
 =?utf-8?B?N1ZRSnlwamduODN3OU42ZUwrN0d6MmlWbnlISzlDUmJLMEptcXpiVDVFQjkx?=
 =?utf-8?B?RE5kc2FUSFlHZDVRdG92ZzhmWEFiUnV4QlhtSU5oVEdjV3hmZTZFMGNnZ2hD?=
 =?utf-8?B?WWFnbXRrWHVZZWdiTUI0cVkvcFdLZGhmYU9nRFdRMDJqODZWYUoyWDVNMDJK?=
 =?utf-8?B?c3JlWVZGak1UM1ZYMmJHMU9JRERVOUJQMzRCNGZMN21wSkJtcjk1WitXTjZm?=
 =?utf-8?B?Qnd3TkY4VUhvVkxpcTd0NDNKUis1Zksza0k1c0l1UmZsa09PeHoySTB4WTJX?=
 =?utf-8?B?M1BBdjI5bjlYd0dFSUZCSE1ubHNFbDg4K25tNnYzRUs0K3VJQ3FZeVZSTlQw?=
 =?utf-8?B?bTR6clBUcjU1MFh6ZHJVbGpyb1dQcGplbzc2M2Jnd1BtZDcrOW40NExLZ1Rq?=
 =?utf-8?B?Skg5RThYRXFiZm9GU2ZvNndIRXR6c0d4UEZTUy84SnRKaUdWWUJOT3NVK3gz?=
 =?utf-8?B?OStGRDlScmlsTlNiaFdwQ1h5T1VCbDRFWERvcUNKUGxIOEdtUUpOcGI1Y2VC?=
 =?utf-8?B?OEQyY2tIbWQ3Ym5lZ1lpNDU1aFRrdmk0N1pLbWw5U2VhZVJPK1BMdEFEcTJt?=
 =?utf-8?B?QVhQSG14SFpXWDFoVlNDckFBWmVxSzA4UVUwU21pZkpkYkk1cDlUcjR6ajhU?=
 =?utf-8?B?YXhNdVdCd0FVLzNPd2l1YnhEdUlEK0Fld1Q5Ti9GaWhXMDNEQ2U2bTFqbGVJ?=
 =?utf-8?B?TG9WWGV6SmhVYzQ4Y1RoTm80OFJEQ05EbVJDRFI0a3BtT0hGMmVRc1hHMEVw?=
 =?utf-8?B?bjdXNHR1TnZkUGZPSkFVNlkxNzRFZ3Znb2RzYlFCR3RZa3MvRzJNbjlaYjZX?=
 =?utf-8?B?UVBxTWZQMXgyRzMzZW9FOTNSN2ZQclI3QWVlcGlBeWZ1L2dwMXZxek91OTVo?=
 =?utf-8?B?a3k4eUViQ2dwb3diYld1OUNiOXk5QkErQkF5TFJ1dDZGZEpmQ1FyNGY2K1V3?=
 =?utf-8?B?allVZzdudGx4Y2RaVUo5R0dDS3AzbVNqT1pNVmZ4dkU3cURUdlpUb1ZzUjMy?=
 =?utf-8?B?UjRpdFdpK0pSWWRxWnVPYmRDSmdaWkN3TXRmNitZOVNoTlkxZTA2WFhXTW9z?=
 =?utf-8?B?UGpSTEcyaHBTbGV5K2NzQ1lZOXhEcFdTL1REZnNVaDJUcy9uNlF0N0lWdzVM?=
 =?utf-8?B?OFhXN21EVDhFajAvRy9oTFFvcXhwWDVQWFpqMUI0bU50eXQ0SG8ybUhGSklE?=
 =?utf-8?B?WkgzdkJuR20wd2RoYlRuei96amk3NS9LK3ZmTzlpcWRVeVpCREJFcW9UdU03?=
 =?utf-8?B?Vy9OamlIMkp0VXhuUGg2RXJHOEJvV3hSYnkvbGdmTU1BVjNlNFVqUWlQa0o5?=
 =?utf-8?B?anpwRXdxcHBla3ZGY0NRQ2I2NkFFbm9YaWpIblFSRloyYXNxanNOcUIwYjJP?=
 =?utf-8?B?bm02a1hYeVQzRWhpWGNPMERMdTUzSFN0T3U3eGpKTHlGdUZDVzJPa01aMzVy?=
 =?utf-8?B?ZkxiVjV0a0sweFgrWGthMmY0NStHWUQwa2RRbSt5OGRFSWRKVkw3UUx6RTAw?=
 =?utf-8?B?Qm5SQ2RUbEFTNWU2L0g4dXpDTjFaamd5TTdDbmtEd3pGUnA0bWJEZXNUU3RT?=
 =?utf-8?B?NW0rc0xwM0dTRXQ4VVQxZFZjcTllY3Z4WG1xQzg3NXJnM1BVRjloQmRHdmZ2?=
 =?utf-8?B?dFV2L2oreERvM2ZOaVZOM3lxSlpodFVycE5JWC9HVUt2U3lPak9HS0Fnb1dF?=
 =?utf-8?B?M001MXpUZUVNYVMvQXRmSXRjTnpQT21JQzZaME1ScXY1dGRBaVhTdmR4WGRh?=
 =?utf-8?Q?yhbIzLT9lBnQyeQH55frMdkbn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52a4ba1-6bbb-4f5a-5aae-08db520e74b2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:57:04.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V03x4QrF3eqqFAaYQ4gLvBjO3SnglQeYN17Q4KSQULimhkbmdY/MEthbbFFXvuq4tLICbd03VNYj/tlJ1PN5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809

On 09.05.2023 18:43, Alejandro Vallejo wrote:
> Move vendor-specific checks to the vendor-specific callers.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



