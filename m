Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65C5AE405
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399703.640967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUlt-0005zL-4K; Tue, 06 Sep 2022 09:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399703.640967; Tue, 06 Sep 2022 09:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUlt-0005x8-0W; Tue, 06 Sep 2022 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 399703;
 Tue, 06 Sep 2022 09:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVUlr-0005wy-Io
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:21:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50086.outbound.protection.outlook.com [40.107.5.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 481d5f4c-2dc5-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:21:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 09:21:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:21:20 +0000
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
X-Inumbo-ID: 481d5f4c-2dc5-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GadAF7jcpK67JKFwn79SowcTw72/PwV7E9CyTLJhpdpEm2gaKnhHu1LTiIOtrKLLWsnp9uDd2nl/QA0NKphRvvPz5Jj1kv5JVP/iOzGfoO8hdiVqPgkZflJHIIf0U1e4pqlfQ2BRDjCKyp+K+G8fBsmI/vEzNtgeoaziOgV/KtZykVm3J/CBgwSJz6TfAmh4nTeUPxxpiRZkftDXvTdOHX0Eyu9dasQfJxEKglD4hQP05zVxwhPrFjGbZGilsppA/EI5gWFXQymxtlpiMDO2uwtbhWePsI1HdiRFWmNs4kZdqU3LrGB0QGhn4JU137AVFB6K7a1tJe3Lj+8dXYFCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6IvH2vWjfNyw8BT5s4X14T5wXVPWT10Z9HdGeXBvR8=;
 b=IR7s6yQzJbJ19iDHnKnRghmUmCcXcBFIyEW8SGavQkDy9TscGsafUgoXskpGbg3RD2HMEy7lcGZEd3+/b78np5i20n9XiUtEYWj086XCREwSqsNCgdMQnsmNr2z2mZrbFXxCAt/c8MX99skRO5WWwCpgzkxoVv3/yBJc3iTQyWlFO3+ET6zfJgahXyb7zl94BTXfpxTowDA8weYmW2OjVmBzOXLK9qEBmPf4ae0vzhp02sUvdocaKf5Y2EBkmrs+KAhBVctMo2GrZmkVdA3CCJhC7ld86errwq/xpoUDbH9KuYaDu8hY+cQyrOLL0bJLEquCcHwkMm+SJ/JapZD6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6IvH2vWjfNyw8BT5s4X14T5wXVPWT10Z9HdGeXBvR8=;
 b=4fP50mM9yyVar7Cibzpf2jEQBbRjADflWWUlSLO4sb3tgitima98FMOXINOq43RL8auDqAS/8IVVluIXKZ/78EYt7shMFXDB61Uq0ZZKFQtuB6netlI8fBSob/ohqdEcI5pRHBvmMo5lET1RE76MAQqI+2jaXJO1XEp2cXR5ZL6DJc1l6BYfOP54pVI2rrrIJ++nYPLraks2ZgLisVnk/JNjb9x1CDilZQbDgPz4BugZeKeGofzZIUYTzB1M0dDKQIqX38CiNfiEt7vg7bwBGlcOpRQNxwnyQ2KejdVUSeqBFLO0CHmb9koh9joPx7rFK9TnzAUBAu79vziRkeW3Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdc79941-361a-b604-238f-4133acfd9ee9@suse.com>
Date: Tue, 6 Sep 2022 11:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 09/10] drivers/char: fix handling cable re-plug in XHCI
 console driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <c53d287bf741831e1eb19137091c00efc3f9b3c8.1662124370.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c53d287bf741831e1eb19137091c00efc3f9b3c8.1662124370.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48425ba4-a1e6-4394-8181-08da8fe92927
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5eksSORK4+wFBWv42WQLJD+F3112eNUtqt7NHptJJw1/3gN2QnAWWfPiXnThpf83AjCCTBJvBK/z2Cu7QHVSnjc3t0nwarj9CJKQFjSYUI3xqaIdDC8+m6G1EIVqwYyCaBH7CXcmgh0J+Db5vQsxoVDBjjXo8D0BDJHq5pkeXsSccrvZjp64eaV8j8HsHParh5FVkNX/XmATPIo8o8j9ZuL/feaR60S2H85g7rqMHkKSMVIcGA1OZQsk+790N1xXvmpZMx4UvhQ8wpxKoKvIoC9vhup+HgqtqNOM8IjWXvdA5I/mFXNGYhb9MNc2+brEDRdD0JKk98po9mYZ0+QUa2X2Mtf8fjVac7ORjb9CQQRtcluJpFc0ChvHWBR4VKr/DQ99bPWun5QiNfuHDoHGYlFfuczJ1PRPhiIMK1TLpR8xo9w5egSqGe6RtlVt5h5R0I4yMYvlPVkhZXbdeH01/1bRRGocY3x2EvhISV65TbSsEAh/j6YOaHkTn8IbACseEpxKvP067mCz/BmESbw77L8xZyBBB3omlHTr+tdsGooWCHibXwUftveqkvyu70wnsNobXBREPG82p4X6qxkmUPqFIouDy6T+lzRKZmFP7yc29JGZMimwn8U7u3RzxRu7og6fKHm6IS2TsyQD0ITehwT9UTP3UEmGTEkxa4tZhchF3bGGKCNL+ykwMTvv5hrK8Lt+LS9Wmm5THS+wAzuLHgVf7frjAOpeiUlT0hK5zyNy9tvXhDADr03H2PCcjaq+Wf2KDy5dyLFzOH5GGkewYmj3XOx34HyqLl9K7V0l3ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(136003)(376002)(346002)(6506007)(6512007)(53546011)(478600001)(83380400001)(41300700001)(26005)(2906002)(186003)(66574015)(6486002)(8936002)(5660300002)(54906003)(316002)(6916009)(4744005)(2616005)(36756003)(31686004)(8676002)(4326008)(66476007)(66946007)(66556008)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxIN05lbG1ZQUJVSklmSHBxNnVUNHg4ZURlN21WWVNWeUpwMnJUVFE0aS9p?=
 =?utf-8?B?UVp6aWlBc3NlOHFZQmQ2bUJlRXVod0R6Y1J2anZLaWY4STZmbGsvNncyTFRZ?=
 =?utf-8?B?M3dKN3g3NFhFeFlnTFBJS0ovRFc1bDVXaTNTcTdmVnZ0NnNZaU1pUHkzM2Q0?=
 =?utf-8?B?ajlmMHdvTFhQbmZLOGNOaTIvb2VkaFZJTzZuekdNczI2NW5USFZOckRUWFJs?=
 =?utf-8?B?bWZDMmJoenR5ajdGU0REWUxHZzRpdDg1TmdrQWQ3S3Y0T2pPV3JMWGwwZzFF?=
 =?utf-8?B?MDZoSjBySThKSGRDZHJzQ2xNRVFjdVA1RGU2U1ZlNU9zckhWcDR1WlZQcC8v?=
 =?utf-8?B?RjJydTgzNFhXaVRNL0ZmajNnUXBJUnJpVjduaCs3Vm00bkJxU2lZOHV5cmhX?=
 =?utf-8?B?NlNkVXMvVG0xS2RpWnl2aUFLWnNHdER3ME5iTE5xdG5oTjc0amdHNjlZdE9U?=
 =?utf-8?B?d1BLUUVwbFN0TWdmUFV5Mm1hWnpiU1M4Y2ZJZnJWSVYyK1VKdGkvazRvMXdE?=
 =?utf-8?B?Zksvc2M2b25keDlxTGxUd2d4UW1pL2ZIY2V6N2pPaTNSR3FaZ3pNMUszbmJt?=
 =?utf-8?B?SmJkdytkVnlyVlhEa2pmR3BoL0NrVGRvTW5CWEtmc04yTG1aU2IwNHNxZmxa?=
 =?utf-8?B?WGU4VlQvN0N1MUVNbDRGK2tZMEJVKy9vVEFjNGJxaHBGc2Y5ZG9IT0tJRGNJ?=
 =?utf-8?B?YzJTVWVXaU11a3lGb2dUK3JGTmRzWlFManVCNVJ3TTVwdTYwZFlWeURIaGZS?=
 =?utf-8?B?ZkFkSG5naG9GTFVmeEtMbVFIS1lVQVBOekc2TnN4Yzc2cmNCTXE3bDZlRjl0?=
 =?utf-8?B?VUZCNWVFTEcxcnlLU2pPUFZKcGRuVU9ab2E3WHh0aGkxZnV5ZDQ3b0NwNnZy?=
 =?utf-8?B?N2xZVWNYZ1VjUVY2SVFRM3hVOGg2aVF5QVhJUCtlL1RtNnhaMmlRTGw5Skc0?=
 =?utf-8?B?dWkyQy96VHR4aVY1c3JGYjZKYzRLNlVqWEJ6SnllRVlIWGJJdXU3bHM5bGh3?=
 =?utf-8?B?ZlYyUUFtdXFIZ3Y3SHlBbVlER2tjS0EyL3h1cEJjUlV1UUtBMHlxZ29pVEdT?=
 =?utf-8?B?TVZ0YUtscVJQUloxTVRqU1lmV3h6Z3haY1NSa0h5VFZQRDNVbzBnZGFxQkNl?=
 =?utf-8?B?Rm9pVEdGZlFsV1NDRXJHcHFMc1lvYnBMRkpmbm02OHFGKy9hNEcrSmtMUnFn?=
 =?utf-8?B?M0hWWmRvZUNEU0ZuRTR4QjRqNjdnZTJTbVRRVWZxcExCOUVMR2ZNOTg2YkJr?=
 =?utf-8?B?Mm5yNUMremhqdjA4Wk1ML1J2TzhId1l1dE9ObW9YQkZKU0oyYW1NSVJSWDhz?=
 =?utf-8?B?Z09vb2k2UlhQSGMwUXhvVHpvWTNjWHZodWlZRHFZazE5NlpqVFBSTkhDY2R5?=
 =?utf-8?B?MWFBT3oxSllBUTFvMWQ4REF6dC9wS1lWU0ZxNDR5cEl6M3hpTm4zOHhrYVhj?=
 =?utf-8?B?ZjBNcHpsQjJKNFh5QzNEd2dyMUNsTkxLNkphbzJoeTFsVkE3ai9la1NzM1ln?=
 =?utf-8?B?dVp2YTFCNXpXTGFZVGxqazhhWW12dkZ6MzBUeDB2SGZuNE9xN3ZwQVQ0eHh6?=
 =?utf-8?B?U2NvRUo0Lzh1WXN2ZXFXSVlYMytyY0VVWTJUdmMrN2hqWnBvYjZYSVJmUW8w?=
 =?utf-8?B?dXVxVlBENEc4OUN5MDZ0U3c4WFRNdGZKOTZ2S2w0cTAxL05zSlpSSGZPOEti?=
 =?utf-8?B?UDluS0pUZGVaY09aVlFOcUN0a1MrbUM4bVh3OHlPM0hDSGNNc1MxRTdXelZV?=
 =?utf-8?B?RUhhemUvTkVQYU53WUVWTFVab2hhYlpIWWRHOFVtQWNaT1NCNk03QjB1dUN6?=
 =?utf-8?B?YkRVOENqNnJvZ0F6Z0p5M1V0NU5LRGZ2c1llVmV3WCtDaENIUkRvLzdJOFZZ?=
 =?utf-8?B?ZWhBb3dvK0tIYVBWbGt2aVZNekZUeXdScEZoTjBYaDAvcVpEUkVQaTI0cGhV?=
 =?utf-8?B?Tm0zaFVpeWRhWGFZUnk4TklSMVJqcy9uSkMxMkoybHZ2SXZQTHdqSHUwQjVG?=
 =?utf-8?B?QVFNTnFQSWp2THRrVmt6YmU5YWx3NUpXbE8raVF3V0lhTlQza0NFZ3R5M2xL?=
 =?utf-8?B?MmZwcmdXTDBEcmFlR3drdlVxcExXRHdpREtxL3pDS3EzWUNkMDB3d08vSkpI?=
 =?utf-8?Q?Hm5i9I/f/htiPiWdSlBYceGMs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48425ba4-a1e6-4394-8181-08da8fe92927
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:21:20.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4tKp8dicxxDYyvqlfFTWLRtyT+2+1kN50Rp/Y8aP80JzjZw17tqHTD3xOwJdYT2uNbAm0HQJvgy7p/C7d+nfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 02.09.2022 15:17, Marek Marczykowski-Górecki wrote:
> When cable is unplugged, dbc_ensure_running() correctly detects this
> situation (DBC_CTRL_DCR flag is clear), and prevent sending data
> immediately to the device. It gets only queued in work ring buffers.
> When cable is plugged in again, subsequent dbc_flush() will send the
> buffered data.
> But there is a corner case, where no subsequent data was buffered in the
> work buffer, but a TRB was still pending. Ring the doorbell to let the
> controller re-send them. For console output it is rare corner case (TRB
> is pending for a very short time), but for console input it is very
> normal case (there is always one pending TRB for input).
> 
> Extract doorbell ringing into separate function to avoid duplication.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



