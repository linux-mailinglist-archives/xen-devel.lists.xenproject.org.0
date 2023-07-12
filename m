Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032E750518
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562333.878969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXOD-0000SS-Gs; Wed, 12 Jul 2023 10:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562333.878969; Wed, 12 Jul 2023 10:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXOD-0000QL-DL; Wed, 12 Jul 2023 10:48:09 +0000
Received: by outflank-mailman (input) for mailman id 562333;
 Wed, 12 Jul 2023 10:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXOB-0000QD-Nl
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:48:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c1bf1d-20a1-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:48:05 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:48:04 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:48:03 +0000
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
X-Inumbo-ID: 94c1bf1d-20a1-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk5i5eAOTlRyVHKvCDTDEv3kn4EWsObjttgoyP99yArNHpHHt8CyNEqg4rPFeRpgGM/6hC0rd20q/927NXUZ7d98v6xM/eOvmJvNHSD2ZgpOwiVp/gQ+ZlBNCDEP/Fp2lZmkidcKuiBpmPDsfk+Rgff3NcvBKc5jCow/dHchAqxkUDAiF6MdcMPeC7P+SNx8ol0hEisRhvzHV5b2bO1ebxly3b5GF8qeQkDD7yTV3XV2qOZRHuEzFhn4Tf8U+FBikGxq25HqVGGaSlv73xMgIl0a9cdeWKnuzpsSBQ8iwSboNbQqAtXJUUDHMV16BPfqccDwCdp05/miFGHCcaZ3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d28IX6SUR1otnle9UfRUzrwIC6qGz98aNQ8xAMS7yi8=;
 b=FCc70OjyCXEV4oGWPtQRztJhNfG9HE56crCuhIriIBytQgSVVDirCMhQ77qpbQqCmo2Q4T7ro5MiWKfwH/RWIUn550gWASkWnZr8gPlAPEN6wDYNgmuNN+XBsQF88quqREt4E7KJx+UuuDqyURzNeALkKxwdSPCXAX1goE4Mk5pozE6UKb7VHOSLpXWuQTRoKUd++W+mCWh0Ptt9siumF5m5dHFqFDitCcl1EYcBGh5uzOWyi6iT8rh82dL5vSg7CFlUDwjqa7DB6p2m1T/dAWuWPaja+4dwhSePqUYv5gCJAieN5bC4c7DxnE868DhAEnAFFSa3qGAbDAIYbHWFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28IX6SUR1otnle9UfRUzrwIC6qGz98aNQ8xAMS7yi8=;
 b=Lx2n132BU3MAAKp1XFUSCcDCk29ySGR+Yg+xUSZk5+dMTi4R5Vuv+r1cUs/zBX5k7zZY9OqiRBHb0vRzQ0XX5H5fd0adAYk14Hqe0MEaoz9SawIQfIdkmHmhkpu+UdaLSsK0ioSXDB6UBHoz22/FhGKqbyIjZ7oaUM7XoT9uV8rQNURBLbNmlG2yDFZ9knzS1Z68JDYHejOIwq3M1ZDzjGCimJee+wfXN1abYpDoaB51+zFv31L+ybkTheEG3yOtdL+VZ1pPj1pl8MFW3WUlEbDMbSBOMh9ptm+KRuWXpfXhQ7mU5rbTutYKHGByUmtxv4du/vYIS84lw0xOYNwrPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b15f6ed-e411-1ec4-d53b-afccc2194ede@suse.com>
Date: Wed, 12 Jul 2023 12:48:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 06/15] xen/efi: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <4e53fc8fc5c3512a521311220375ba8542ae0e5f.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4e53fc8fc5c3512a521311220375ba8542ae0e5f.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4a0a93-6aee-49eb-85fe-08db82c57817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2XIv6QRZHRJMKRSPol/l+VepOpXQ4lbzt1w/LovNveH6pW7YEqZJzq+KrKel2VX7KglCAUwrhjR4K3+UgJPG2g/qkLBiPtVrNRlC+Z7ORVXyRvhbgrx/sGqZwHxjR1yEyih0Y5o+i0inYtruPHKXQP03+0vPo+axhFoFfAgvthKMZlL7ZpsWafQgCekLChMT0rc+vrfk1eR/rETMKwYDENNKfA7PYR5GgN9dsW1Jsr95qpeNnNuRfWgRcrqJ4EeTrPdcErpjud05EXsR69aggdouLVJp+KliWYhRx7BWPeHXFDBD5vS/J6LNxGUFHBHLrvGkjUfHPzsJsoSdtOuJvgXVHuseu3f0qYRmKdq+ELlrn+6cOPmjgPxjm92xEh2stX+0BpgFpodmMLha90Nw3VazzPSjj612pPCopraXDyb1AMr770S/yfVBAjJK0EJMwoy0PEAt4WSIsMvDgTywd05mYBRlfhn8ZGubpXeUJmSB3oMpJr1PJw9KPhnY+TWs47Kq/gWtki5uHIjAqUNTV7VCNQ9S1oNFLt0eOyXD8ThFgRknYK1WPhYQrvoKKlsbkxZlewf6ucQm1D2Tq+KUeDVlKk/R8bAFk1fN6uT5QuRAQqMfKO2WnkK9ACvq3FGHsFOPRDEint4ofhSNddS1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(478600001)(31696002)(186003)(6506007)(86362001)(26005)(5660300002)(8936002)(8676002)(53546011)(41300700001)(6486002)(38100700002)(66556008)(66476007)(4326008)(6916009)(66946007)(2906002)(4744005)(31686004)(36756003)(2616005)(54906003)(316002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDdCdHNSVmE2U0MwRE8zRGo3WFNid1htakJra1A1a2kxbXRBR1ZrNkVjMEVN?=
 =?utf-8?B?MG1LZVIxczJ3cExTU3NsR2RxNnBheU1mNVEwR0RCR1I1ekg4dVVScjA3ekUx?=
 =?utf-8?B?N0hsQ0dPSW1FT0o1NTQwZU1rYkErNnNLdW4vamtFZTROZDNMTmRPRTJ4YmQw?=
 =?utf-8?B?bEYwQUpjY0kvZ3JKeUFrOHB6Nnl3Yzc2WVJSWlR1WjJ4QlRsWTIxMnVaNUFQ?=
 =?utf-8?B?NktsMmxNa2dJNmJ3RDE2UE0yQ2ZMTVptZzh3M1FGZHNJM2tKNnRxdE5WRjJH?=
 =?utf-8?B?SWwybG1nTG9pbnlFTjluU1VONzNhSFo3dzlpTmJSYWtOV200Qm4wanVJcEpQ?=
 =?utf-8?B?bkg5UzRZcjB4endPREtONU9xbkdXUUdwanUyQlNTdmJlM2FJeDd2TDEvdWl6?=
 =?utf-8?B?WEM3UkQ1UDkxS1dDcm1sV0poNFRBbGRWMlQ2R0VOQXZGTjBQSm05cXZadU5o?=
 =?utf-8?B?bHRMR1NvOHpZNEszaUh5eWpDNkNQbjlTbFNzY3NITE9tVEUvdUZBSU9mdnVX?=
 =?utf-8?B?MkEvYXZvN0pHZVNhK003MTBOUytkREJueXhScXczWTlBTWkvbzhnQ2ZmNlhm?=
 =?utf-8?B?cmsvKzJPYnlqckd6Mks1MllydU1YNXVHVkxrU0lZYndsejRkZTRvZ2JZTG9D?=
 =?utf-8?B?UktHUzVoR0NtUWVqb3J5ZUJxelFHRzBaR2NUcDVIa2RHSDBVbHdsQVNXSW5C?=
 =?utf-8?B?WENGUitJS1VpL0ttUmtFMFVqcHphQUIrSUV4UHF3akNCcnNDazNUaitqVEph?=
 =?utf-8?B?VWhrSTJ0Z2FTamtTR3ZHbVVkUWFXWHcvQWhEWTBxQmFVQTJ4M0syZHlTeGdL?=
 =?utf-8?B?WDFjLzBaZFJBcGpoMGxuY2M3R284N2F6cjI5UitWblFUOE9TUEN3NHNoMTZu?=
 =?utf-8?B?VGphV3NLekhxbzBPNTZSd1kwREh2d1BuZU9wMjRPaSt5UWFtWFlHdmQ4T1JE?=
 =?utf-8?B?VWFWU3krRmZTbVBGSVh0b21TdVRzcWpHdlFIb1QrbHpYbDVXd3pxM3YrUzJz?=
 =?utf-8?B?SDJtR0FJd0I1Zk9UY2dtSDZtSENkSGpxaEdDY1dVa3pTR2o4MUVYUXVnMi9Q?=
 =?utf-8?B?a29PKzdZUXh6bzRCM2UrNWpCTjM0TW9na0ZraUhsVHQ4Z3dRaE5lbmVWelpy?=
 =?utf-8?B?WW5LM3JmTXRVLzN4UHd2dWR5ckVCZnk0TUNRQ0Jtc1BKbzNFcGVlOUVES29F?=
 =?utf-8?B?aHl4Njhydk03NlF6QWxmMXVyd2RnSTRabTRiU2NPTnoyb0VKOW1YR2ZKYUZV?=
 =?utf-8?B?ekV4TDUrRCtXZmxJcjl4SUpNa0lISThXcnR2UEN4eloyQ2lzeG1uN01nUm1X?=
 =?utf-8?B?NUJzWS9tNWlndnh1a0k5SVhtUEhRMnpCOGpkZHlLR1pPSW9Wc2ZoZGtEY0ww?=
 =?utf-8?B?MEoycE1ENVNoSUtuanhaU3ZrQ0hxVDExL1BKbmJBbHlzTUxHVVpSZjc3NnRh?=
 =?utf-8?B?MGd5OTR4cmFrZWRPS0V2WWFTOGVZRFVqZ2hWbTJ2RzUrMXBlekh0V3h4UEhD?=
 =?utf-8?B?OVljdjRLRXBreFcvTDZFZVVDcFhibnk3elNuV1NQMkVOVGY3TkpmenBSN3RI?=
 =?utf-8?B?b09UdElzTGYvTU5ibjFadEpNRWxiNXZZd2NNdWFXZU1weWVEUnIvNkdOMDBO?=
 =?utf-8?B?MWx6bGhIZnU2QkQrRXc1QmVXd1Z6ZFJseXpXQlZHYWZtUzF0SEdXS2tFK3V1?=
 =?utf-8?B?OUtyV2xnRmdrT3VKMkZ1a2hueGpmNzNyaitaekVDMUVOOXlVd3EwVnlIMHhx?=
 =?utf-8?B?MkpYbE9GWFFtcFVGZzNIL2xOSlNLUjdtbnRQaStuZlBleWFTTzRTT3llZU5K?=
 =?utf-8?B?WHVxT1liWEdvZkFxVTZ5MWY4Y2RxMlFlck0rbnlRZ2gvNTR0eHZvd09BMWEz?=
 =?utf-8?B?WXdiMzFlL0RjQ2tlRk5OWHluQkM1Y1pvN2t0TzQrWElpMjdPT1UxU2sxUnY3?=
 =?utf-8?B?VkZDUTlwYkRLbmpkV05iVi8wY3hNeWd3MEJsRlNjTjBwMXJTQzFrOGJaQXU2?=
 =?utf-8?B?aVpzTUV3QjdKY0R5MGc0a2lkZS92bm1PN1FYYXZUUmFDMFpGSVA0RkJlL0ph?=
 =?utf-8?B?U3hvQ2VvSmcwTlo4YWN2eHM4d1BUbWRMTHplbE9zNHdHZ0NUQVVkb1hHcStB?=
 =?utf-8?Q?Vftl/mB3DDOmmHwSQDYs0ut2c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4a0a93-6aee-49eb-85fe-08db82c57817
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:48:03.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8L8RlfhqRGTumbLrIdwEzpPnvG4zT0Hor9Au3uM/LxvxyHAwekkTVnyWK05Is16g0v5o3gFAwX6TeiGkbAIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 12.07.2023 12:32, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following changes are made:
> - add the 'U' suffix to all first macro's arguments in 'boot.c'
> - add the 'U' suffix near '0x3fffffff' in 'runtime.c'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


