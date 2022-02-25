Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C04C3FCF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278783.476162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNViW-0007Gi-BR; Fri, 25 Feb 2022 08:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278783.476162; Fri, 25 Feb 2022 08:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNViW-0007E3-74; Fri, 25 Feb 2022 08:12:44 +0000
Received: by outflank-mailman (input) for mailman id 278783;
 Fri, 25 Feb 2022 08:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNViU-0007Dq-4i
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:12:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b378e84d-9612-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:12:40 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-D9MGV2fxMH2jSVdXog5zOg-1; Fri, 25 Feb 2022 09:12:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6542.eurprd04.prod.outlook.com (2603:10a6:803:123::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:12:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:12:36 +0000
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
X-Inumbo-ID: b378e84d-9612-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645776760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtSJfUDPTaZX3Ro+9HI1MQjzcDYms16CEya/kgr+EiU=;
	b=TZZruFp/SGqEXHhLI34UayZD9TITb1+0rHyxiZuNjt4+30g2Av0Ffuha1wHKx6sVTbzRsx
	4M70GmvBZhCgKyxnv3X2soFDUp/1YXrtw9aB/Cl4nMWFu5Vd5zm4BJmLbguLNlNdaIAsQL
	ZEBxcLRvpwhW3/3rJwXfC0GxXVJIvXs=
X-MC-Unique: D9MGV2fxMH2jSVdXog5zOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJyPUqFTsiq1KQJKlM/tIVjPscdsOA8hAAYX8cVwJ1nWvD9e4jRfCuzulxa7+nS5MrshbgetpJL1FBNxmP3phlNrzUo6DNZvMiWVjdWMU7ZdcKWhNtruy1/Lwn80H2DA2YfLofGgsrVAbbjkQ0nniI3qn872MZhVxAam5VabnxOyyO+OdblueqdzrRlpeoo9/OHpoj+0dORSDWkX2AaI5puWsqMh2nh74CUP/3acL9Ep4Zpt1tAb8nChdOc5AwtLtR+PT11lH+TzUEtObZcX3SxUMCmy+l2/rJnTf+6K++fevvkgU9HqD0W6vnRSMcvg8n+Fo50jcC4PCTVOAsfEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtSJfUDPTaZX3Ro+9HI1MQjzcDYms16CEya/kgr+EiU=;
 b=dk5anf7rqdYt/9LwW6bqsCxJ6Yln5AFv+7p2xbUDZ74jP2CwThfVw99+W/PxNeiwsx0AupWEec+57nN0W4Mpe8MW0EpXfPSQmWG8g2x7u2WShwem0XJyoSKCE+kzYlN4WkW30JRtLyilCIeNaUhhv/tGQ8V55o/1Jex1s3t4YaPEPkx282fQb5U6z13ZuBNw8c+ARA5r17k+XgICH0MUg2UaYdAQCyacjdlt4KEUl5P+b5A9lUHs6QhHtzRu+8K3t8yVyOAtb9YWG7VBGHqtv7g+WyOmTF+ayRmW8WBgae8Uvdfbig18Yf8pZ7V09A4bFjnS5Oi6bvoPF256uyuKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
Date: Fri, 25 Feb 2022 09:12:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
 <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:206:1::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da837d05-2dae-417c-00ef-08d9f8369435
X-MS-TrafficTypeDiagnostic: VE1PR04MB6542:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6542F749C73B1B9B5C47BD4FB33E9@VE1PR04MB6542.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JCnkbxDSzs0aiAl/yNxOk410q1xOc74hvHN5eK3eHHu82VCDNSsH6oAc6WX+TfnLae8pfTVwcpEyJHfDrsHFOj1c6Oew1o4M/Qlq/2T6Dl8awoVavA25zrbxm18fTX1NNcq0kPiGk3QFN19/+DhYy62zZFxriBKWPvdUwDi9cCd7CbDtW4ONww7L21XcOGKFLBR/5ZQs1sRcnh7s/MriF9BnyHzT48RcGA6ufTxZo7ipwrVqLo4v1fQmKpmnrM0GdSzgfcow8PoCFrrUXbQ/m2juFxNtfVJC1ncl4QaggPoDlabrRDlulK/y2+uNv4v02E2EyUE8sCriW0RdlJP2Cj6/9kPkmPBFnPTqJbpXbQvF31eSvHe7pn3jYlYVdXsvrk4SIWpLqmAo2Tgzlnlu3PYqofDdeqlQZVpw2Rq+nydbci/BAnAUH6bFNtwihWzrAz+7ZDLVArg5Su1bXbKrAIAxkKfNhD+c3OYGM8WiA/WzTdq9GefW6V3yvrFfrkOc4+nDmkKeWI67RLGnKzIeCFwD3jbbgN1i+bckdOywsfzVywx1CSPm5bpWlcJtIwk0Mk3VnKeSEn9lmvlJ1aOmf/++mYz5NKm6gF/37mnBc8GmdiCiQucFecnHFbwKldfHTdfrWCoQUsCnuI26vp15Jgii8NhreSVNR/kU8wAboEcvv6c4FKH4xMnPdQz77r5Elb/vYaMU+40Wi8xWWCJCvGMUCHC8vEV6udQz9bq1Cw9qMXgXKzLaVW4tDaSuE/te
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(86362001)(8936002)(6486002)(5660300002)(83380400001)(6666004)(31686004)(31696002)(54906003)(6916009)(186003)(26005)(6512007)(316002)(38100700002)(53546011)(107886003)(6506007)(2906002)(66946007)(4326008)(66556008)(66476007)(508600001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mko2T0pIcXhmc20xSVU2MWkwMFJ2N1o2eWFVdlFTYWxUMXVCQnIrOCtQMS9h?=
 =?utf-8?B?RHozWjZQUm9JaUtkQWFYWWd6STRXSnVXdllJempDYVRuMEROS2pZZktYenk1?=
 =?utf-8?B?dmhTd0ltaUU2c0FjOXRWTnpOM0tNV2pteTdqY2hydUFzUERLTXdSZ0ZIRDVO?=
 =?utf-8?B?MnIyMUNmMzF4QVJsMmtoWUhhb1FrYnFGYkJVOFRmTWxzRXNnaUN3azFqMmpR?=
 =?utf-8?B?Vi9KN0FWRXNLbC9sbDdhbUxFUmp3L3BpWlNDSEd4amFvZWxaSFovMU9HamVD?=
 =?utf-8?B?emx2MTZGZFVpQ1BqKzRkaDVkVEtCeUprbzBjUFpPUGpOVGw5K1ZYRzUzaDhk?=
 =?utf-8?B?VmRvU1VKcjB5WDJFdWQyc2h5WWdOMUJGYjNUTEo4VGdOZUlvNXl2ZlFYcExW?=
 =?utf-8?B?aDV6UTJQdmZZUy9rdWxiSXVxbXZOU0FkTEpoWTlrbHh0SUY2amk0Wml0MkxS?=
 =?utf-8?B?YmNndVd3NnBFajF0L2RIdFpFOEcvcVVtNEpod0xPbGI2dHRWb2tWam9SVUR3?=
 =?utf-8?B?NVVjdFl4bEZhdGt3RzlGcGZEOW04TFgxdzlFNHZFV0gxcnJpYXMralB0WlZK?=
 =?utf-8?B?TDVnWmZDWHFBcFRHdTY3KzN4Zkg5Z250cU9FMnZkbHVrSTg2RnpKTi9vZmpo?=
 =?utf-8?B?Q0p4dHN6bjFNN2dyV2VkencybDEyWWRyOG5peDNEeXR4ODNMcWN3TlVKQUE5?=
 =?utf-8?B?blV2OEUzbEYwUTIrWDUweS93Witsb2c4d2tNVW4wYWJQZ1BnT2NNUWkxYkdy?=
 =?utf-8?B?Qm1kSkRNeTJ4YVBHOUFlSk94Tys3anUyS2JTcXV0ZVVsVmE3ZWlOUWdoL0Rm?=
 =?utf-8?B?dzBDd2RsZGdsSkdHZ3RuNStsUmpBNXA0TXBPbWJ0d3FnQTgwclJRMzdLM1dq?=
 =?utf-8?B?U1QrazFDLzN4WE50cThLbUVpNStUREFCQzhMK29ySUZTd05pSHR2S0VEUVVU?=
 =?utf-8?B?TkUzU0d6eGN5UnBta0JqUVlkdDFQcWdlVkNLNkdQTjdZL1BYcmt4dXhkMER1?=
 =?utf-8?B?RmxRWU5zOWhheFY4S1c1WDc2SFJLRzJoL2VHVkUrTGxVMEJNSVk1SnhVTlNs?=
 =?utf-8?B?U3pua1pxOXRCbHZKUXBoQmFCYjZKeC9LQkk2aFI1Zkh4b250QzhrbzYrakpZ?=
 =?utf-8?B?TEl2MmZ2VVJtUGJnS3dPcHorTGtGdkVoU1MxRHhUOE92aW5VSXRwaDA2TVBD?=
 =?utf-8?B?MWZ1U0NIbTNNWmN5VzNCeDdtSzBFWWJGamhEQmM5QjFHUzdJNW1IK094R1g0?=
 =?utf-8?B?UDAzNFhFSkVIQ1lwQmQ1RHEybnppL2RFWjliUHdnU25PcnZCa3F6VThkODI0?=
 =?utf-8?B?Q0loL2k2YTV2UEdTUVhZUVo1MmlJZ1R1VEgzbzBhVEJya2tGUUVhekttMFZq?=
 =?utf-8?B?NENLM3gvckcvUWU1QmY1dERZcHQxS2pEVnI0MXdWVWpuSlUxcnZZMWtYeHZG?=
 =?utf-8?B?YjJPRGFDNnhDaHd1d0tBaWJ2d0dlQW01R1pTaENaaVhTK09lcnFNdi9QRGti?=
 =?utf-8?B?SGc2Rk9iOUVIV0ZZVUtaczB2Ymdhd09SUkVac2JMTFRtS0c4VEozNGl6Z0RS?=
 =?utf-8?B?VDVSdEtpM2MyaDRFK090bnRtbE5nV0EyaFpiZzFMSU1yYmgvS2JpRVgzWGVS?=
 =?utf-8?B?aDM3L0g0UTNpV1pTdEJkRG5VSDBhQUVza3VuakFoSW1LQVBoYlQ2L0V0dHM0?=
 =?utf-8?B?dzREdHNLcHp5RmZVdjNuM0liWVJaMnBHYVM0Q1BGQTUzRGFhVHhucFFjWUNq?=
 =?utf-8?B?cFlBVGxVdHEwNjA4R1phc0pwNXUrZExaOUphSHNUS2djQ1pQNzUwL1U1SXZO?=
 =?utf-8?B?c1BReVUxN3ZSVS9mRTNIQXFVSEpyMnVucnNvNzZJck56YmY1MEZ2dXA4Znh6?=
 =?utf-8?B?SWo2RlI2WXNFeEhLQ0lwSlh1eGs5RDJSWnZvSjRFeUllUGdMRTFIeHBRa3Jq?=
 =?utf-8?B?MnhPQlBuNVdTZGw5Y1pudXR6UVpJWE5FYyt6aGY1bVNxZlVGOXNzeUM0cW04?=
 =?utf-8?B?R2RpN29ac1MyME9qVWN4anp2RU51Umh5NXlicHZpMkUvay8yNHJSYjA5OE9Q?=
 =?utf-8?B?eXkvSW95YjYvcVJwUHp2a0d1TWhWaXR5elJpQ1lqTEdYRE9JN0I1ZllCQjZI?=
 =?utf-8?B?VkZhYmNFWlcyN0RUOU5kMXl3cHNlVW8ySVAvSjMyK2c4cmNwUFF6WnNUc3l5?=
 =?utf-8?Q?UPKiOM/aqzSTQVwR67aHASI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da837d05-2dae-417c-00ef-08d9f8369435
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:12:35.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t9M56upUyZ5UdH3+1fI0OA/IV8EZRyFer7ZkDqW5wFIZYK4zHYZGSn8EeBwOInmH4v/d2zdE6KpSKUf8z5hRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6542

On 24.02.2022 23:55, Julien Grall wrote:
> On 16/02/2022 09:29, Jan Beulich wrote:
>> On 16.02.2022 08:20, Juergen Gross wrote:
>>> On 15.02.22 22:13, Julien Grall wrote:
>>>> As a side note, should we also update SUPPORT.md?
>>>
>>> Good question.
>>
>> I'm not sure here either - talking about individual hypercall sub-ops
>> seems overly small granularity to me for this kind of doc. Plus I
>> don't view deprecation and de-supporting as the same thing. The latter
>> would mean to render unsupported any old XenoLinux which may still be
>> in use, all of the sudden.
> 
> I understand this would result to unsupport some old OSes (not clear how 
> old). However, from what Juergen said this feature is untested.
> 
> To me it sound like we are not confident that we could security support 
> this feature.
> 
> So I am not sure to understand why we only want to deprecate it.

Not sure what to say: Rendering unsupported however old guests is not
a nice step. Hence my concern (which isn't an outright objection).

Jan


