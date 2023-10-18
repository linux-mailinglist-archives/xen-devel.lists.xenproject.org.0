Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8447CDD44
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 15:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618570.962365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6bu-000115-Rc; Wed, 18 Oct 2023 13:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618570.962365; Wed, 18 Oct 2023 13:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6bu-0000yh-OB; Wed, 18 Oct 2023 13:29:18 +0000
Received: by outflank-mailman (input) for mailman id 618570;
 Wed, 18 Oct 2023 13:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt6bt-0000yb-7C
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 13:29:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f59834-6dba-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 15:29:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 13:29:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 13:29:10 +0000
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
X-Inumbo-ID: 52f59834-6dba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX4HzXSQqtxGNuJj87/4af0hpsBNZOb0/GlgUcnH7VWDK1ry/5yVidGVx5t/6eE1GcDyUIRMgNH7rNH43PaUA/btBvPv65bEV6B3TtQLEjIyTaWeXpAZ9ZAf7ZKTxDBuqziYLt8w0Mm8x7bQO4EEQyKaW5vtQZz85nZuV0ErdmXcLJt95CeZTZRXzgXZFVn2qj0ndVS2LV27y6795Ij57uz0IGinE+VxlRUb7Gnb12uZz44lO6HYutM2iPpxTDgeYw6N7c8d843X6f4Pd1gsPB4ocRCH6IsyfGE+wKVuaOHRg1wzfzQdODD0kaa/h/NA0AG7dtyxSyRTszFO45a+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvwJ9iVehLeeMjXBKTpnEazMdsJg/OvA/WoNYRO4C9s=;
 b=V/nZTi0zAGiU0u2qkTvqeU0LzrgiA6XTJluc08GrQvOwWWT/E95LfMHqStB/ELdItJ9i2MbqktlYDGL0lU/5xDi9sWdd8DaS/PKi/n3aj5M7scMXqXb9H0/LFYHguM3CMxt1QK/bzebVNkYfwYLlvP+lx8foGYpEJu3vZAax8LjmAwRhhrUfGIF0GYni16whAGjdKbUFfwitr2KWKOfBIoN8M4nKqUJCmRtMCsZxRTDPIY2+bMqky4IMu3X4wRhsIrrQAR2dejSFfvo0yGhsDAMCaKV1ojFsgpOqeJUJw2vFNu8hNlcQYwbzASnzGXxMQVs+6NbGQkZD8tCi9jIiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvwJ9iVehLeeMjXBKTpnEazMdsJg/OvA/WoNYRO4C9s=;
 b=m8990YKI/XlQ2AMzHbaspCKgFWa84jotkQ6u9sPlsUNPCMq/LOI20GTQ6gOeY18dZ3xoP8yAcIhurIZGzLxLxuPGh8eTY7RpxJAPBVLEiYUR3WLQmb5+o09GmRSIa/r7VOlIhY1mWQcErlyDu2BwWSjewzPSZ25/MKBg6IjsWsgk7f+1GjNsmkthgVjAoyZoXbVn5/qkictJStbajCO4iJyuFdS3uCbfwWxrMFwWjAhe5uGKDhlG8RC54srKtmOy4VE3mPnB1KTtWQ/AI9snm6iyfEMv666c/G/DxVtOcPyExWYYDls57XIOlFZMUP9219hnzmdrdG+dNUNTW4yLDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f5c0af3-44b6-e98a-2032-14185af265c9@suse.com>
Date: Wed, 18 Oct 2023 15:29:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-US
To: Manuel Bouyer <bouyer@antioche.eu.org>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: 62023101-24d3-4e82-c096-08dbcfde35de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19RCs9MxbKsJPU+vYGz+c4C0NiptSPTAHRDSW/7mmzTKL5IV/V9EcayP3z1LHyDI5MHU8pY+3BkzefAPz/eTC33PpxYQd/hT4VEETOT9xj/e8oFTe8JAwkP8UebSugWLy050grH+0vQiEB0v6dEjYWjUGmvRJqeXn0nYUnBvmlAEiFDP+DtcY7iI2tbaTbaUgpQtrZ6YW/4gm6xdLehbahNkGSVnLRQXZ/WT0LA9GoJjvfwhQB6Gw5ijNGEYXiIr27N8VlgEz2UsbYUYUdgQi9EcVHsClEb2UBMw7DFXAWewbtnmjCnv4YPOXaVoaTXjG5i9OJKs9luVz10a6PwZZ9AaRsI9wu3IAg8xUmQj9QvOHwL9Q3fmWcvBvN26wbZmvm1Tkxw3mReTVmSXv4i1kwKuDaBWVcEk7nM6/9GqFHbHs5Qoa8xEeK88xKq0Se/IWf/StGkT0VZQaC1AJdzsI0ftdOQOxjUr+V5wWAOu9NT/baNkHl++kaLIhEAvcnhmjA0zLapTDRwRdTgyEoTk6+u0LUzR88oBItWxf9yZq9OZYXRzxeH8gipsLX3zbfr2jR+IVEg15kT9yaXqo0aonKd7hG0js9a/harmJW4N9jBccWo2sW+J0JxujdvEgr+MDH19StBnwa0ejf/Nn4Lrr8yk0E4r3A3cTMY3qMv9Jxnutkg7GxH9fGeD65mviKtj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(66946007)(54906003)(66476007)(316002)(4326008)(5660300002)(2906002)(41300700001)(6916009)(8936002)(66556008)(8676002)(4744005)(478600001)(86362001)(6486002)(53546011)(6506007)(31696002)(2616005)(36756003)(6512007)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZMK0V5NzlCTlZ6eWl6bytpU0F5V2pQa2ZyZ2NSTXdZZ2s5Yk1GdndHN2N2?=
 =?utf-8?B?SWhiUGo2dFlpNGU2Zk9QcDZmcjZDZ3lHUmNBc0gyTTlzMWgveHF1MVBFVk50?=
 =?utf-8?B?QUJxK3laWElGVjN1aHdyZjVDYVFZRyt4ODY4L1dDQzRRRXhyVXZXd2VwaUxP?=
 =?utf-8?B?Uk1zb2JlakM0OUFSd2tSZ2wwaTdja2phNHBvU2s1TmNoanNzKytDOGVZTWVQ?=
 =?utf-8?B?M1hKWVlMSS9LeG5PM0dEUjZ3UUluZ1pSMXJWem5GU1owVEhvWkxRQ3VKc3A4?=
 =?utf-8?B?d3B4NlA3NnZ2cU0wN2pOL1FOSUtMUEJBMitOSjRFY2pzS2M1YWQxNFdkTDVS?=
 =?utf-8?B?NERyQUVYVGdlSzFQOVBld2RUMjZteUQzVUtJZWlISDNoTnZITEMyc0J4RVlk?=
 =?utf-8?B?emhrSU5yQXF2ejJXU09PcjIwSXF5a281QWZPaDY2TmlYYmhneUtDcFpPMmtY?=
 =?utf-8?B?aHZoczRLV25YMXdYSjlrZ2dzSE9VWU1XZTFHZ0trTmJmUzdlaXZ2QUxCK09X?=
 =?utf-8?B?Q1dhT0U3UngySG9qYXFxTStHWm1nN2FPQU5BQ3V6NUl4RXgyN2kwYSthV3dp?=
 =?utf-8?B?Q2Yyd2J5VzE0K1doeWY4d2xnUHBmbXppbHFtZ1RvUk5Lc1VrM3NSSjBTTDFR?=
 =?utf-8?B?dis0Q3dhdFhJSHM1TmR0c1FiclZUZVdWWTRmcnBiL0JmWWQxVjN4Zlp5VjUr?=
 =?utf-8?B?Y3NqWUlEd0xvdUl3QUQzeHN4TjhQNVBCQ2NPMFNoLzhtVldFZE1XNGYwbzlz?=
 =?utf-8?B?eWNEQmZlVXlzM2hFZWVYZ1RETERFZzhraXVJRFpCRmRJQ25KMGpvMzlqMUdn?=
 =?utf-8?B?U2RZVjhxOCtVcW14MlZOYitCd3VKUjN5bjl4K2lVc3FYMFg5R2J6K3hZQldK?=
 =?utf-8?B?VmFRVGt2YTFBNWlPeXZST3A5b1ZXTURtYTE4ZkZhc0tuS1E0Y2xwYWlacUxW?=
 =?utf-8?B?amlFSWZ4NGNBUmEzdC9pOG5LK2YwSW9GWElvUm1JbUdiWXJRMFozOXBwcjAy?=
 =?utf-8?B?dzhhOXVnamhrcmExSEtvRUVDSDErWVQyQjFoVzdIYzZ3K0xwQnFJeGpqeThV?=
 =?utf-8?B?d1E1eEwxMjFBYytwTGNmNDJDbklidnlHS2RucVNhczc0K3BUdzNEcGo4blpt?=
 =?utf-8?B?Znc1NEtsSW1Ib0Z5REVkbjJCZVFBUStIcDdNWVFVc2ppWEd2UDFDbWxjVjVn?=
 =?utf-8?B?azQvZVZDdFNwdFl6RVpCSHBhM21ldjNRVVd6SUhPU2ticHdDMTJpSVV0YlJt?=
 =?utf-8?B?UjdOMFFMVFdhK1dwZHBwNm9wRGVYYXJ6T0RaQWU5WllDeExtckJnS0NveC9V?=
 =?utf-8?B?b1ZoVnBReU10REM0OXlsM1NtSXFXTzh2bUoyc2NhUlZaZkJ0eUUzM3E2MHgx?=
 =?utf-8?B?dEsrTXQ2NFU1WDlDQWFaMW1NT0tvWVI3MmpmK25nTzZUTG9TT05OcFJYbWRU?=
 =?utf-8?B?TXA5RThGT01kb3Q1djhIYktGWUVvYjVSemJaYk5pUkpEL3ladHRvd2NFSnJJ?=
 =?utf-8?B?cWpXTnhsSjl2UmREYXZpNUJMQ1ZsU3llZVU4amdJdU5uU2poVURITlVoS24v?=
 =?utf-8?B?cVNPc1dTYXJGbHpDODFwUFF5OTNGc1lJZjZPQzZZZXJtcGhrZXRRdXk2Q0Fo?=
 =?utf-8?B?TkRuaEFFcTMwd0w0Zno3TGI1S1IzNVdxeXlMVDZjd3UxeWFDbi9vdFc2Wkt4?=
 =?utf-8?B?QUh4NlpKZzlnYU9PaUxZc2x4bFhHN0crMHN2VWJvaXc1NVRHcE1CZGpDWXNn?=
 =?utf-8?B?LzdHaTQ0amE3WW9kL3ByV0MwWVBaa1F0akx0Ym1Qa3BGbEQ4M2xzVXNtMENa?=
 =?utf-8?B?TE8rNDJWckVYelZUS0ZtT0FwNmZOdHNIWk5JZUkrSGJyOXVMb1c4aHU3emlD?=
 =?utf-8?B?V1pPTHF6OFNpSkVDUnRYa1VraHk4OXg5MWxCZVFLU2N6NmVOS3VtVVhCZ3RU?=
 =?utf-8?B?VXdsa3NLeWJXZk1EU0pqLzJYaE9vTzhnNXJ6cVFTQVppRWQwaHg3MjNtb1Y1?=
 =?utf-8?B?eWxlaTJOUWxyVWRvcGsxeWgrcEJzT2dqSUlPUnhlYXdXbmt5R3YrVUU2QmhX?=
 =?utf-8?B?YXIra3pmYm80QVlkYndWUG55RnRwUVA5WWlYWlpsbGNCUTE1VmFNbW45Sy83?=
 =?utf-8?Q?Q9dpoadM4aW6m2GInpKf1WkYC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62023101-24d3-4e82-c096-08dbcfde35de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:29:09.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+BHxCVCy2TWDpUzXfGcwgou5tBsfxtqEGira0YO+GmxLo+ujwRvN5RVwjtYZ3B0q2MawTH2GmI2CAsqKEOQAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 18.10.2023 12:38, Manuel Bouyer wrote:
> Hello,
> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
> hardwired to 0), so console_input_domain() will never select that domain
> as input.
> 
> The attached patch fixes it by translating 0 to the real domain id for
> pvshim, but there may be a better way to do this.

My primary observation with the patch is that it presumably won't build for
other than x86. There are also indentation and other style issues, no S-o-b,
and no description. But I wonder whether a different approach doesn't want
taking: Wouldn't it help if max_init_domid was 1 in the shim case, with no
need for any other changes?

Also Cc-ing Michal as the author of the (possibly) offending patch.

Jan

