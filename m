Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54554008B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343304.568611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZj1-0007hn-Op; Tue, 07 Jun 2022 13:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343304.568611; Tue, 07 Jun 2022 13:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZj1-0007fb-LK; Tue, 07 Jun 2022 13:58:27 +0000
Received: by outflank-mailman (input) for mailman id 343304;
 Tue, 07 Jun 2022 13:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyZj0-0007Mg-HN
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:58:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6517dc9-e669-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 15:58:25 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-Dk7SnjefNqaGWPIQC7x77A-1; Tue, 07 Jun 2022 15:58:23 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7585.eurprd04.prod.outlook.com (2603:10a6:20b:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 13:58:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 13:58:21 +0000
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
X-Inumbo-ID: e6517dc9-e669-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654610305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eN69vorWK8qAaqyxGuU7P7QSV6TX9WVFh6JvHOKCMuA=;
	b=guKGIMk+b+h7ygtvew0wGcybcWJ5lTWyGegfU8ATLwEIpykSt8S2czR/uMFOiCn1FNRMkq
	M3JM4uKlI1ubmWvQkbGlhmJs0oRCbhXfSk7A6123FPf32EO2q5A5pqBW9ClVy6X5tLt6a9
	5BmBXxsmqTD9CdbWnuFUa6qhqpisi9w=
X-MC-Unique: Dk7SnjefNqaGWPIQC7x77A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIGNQJjpDAiRHVJ01EMeFEq4JXCf+/NYx/zxsIfeew2qgKsJIbpNxXoskBOZEi+6th4Eend/5iLqebsXmjQ+kv7M8CX6lIjde4XwyRpanvEY8FwI+1mArbi08OQ220qxkBCYsmVCQmqj346QIBUgPRM4DsZQG0HdKy85z+IGh/PrMzFQFEPzv+dsXWtHqM61kG25gD4yFbkWBtB4vODjWAkgwXP0zPyQbO+h+ZmJ7hvG2cnpd1kikvXXmUFGV/x5sGffgNJrke2vkY6IEboA/RvWWP49rxm9ap1vRQ4ECOJ/P0TRhv9RsSfTVw8/kMqwLCIoSJEC7L9XLVS+lvTKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN69vorWK8qAaqyxGuU7P7QSV6TX9WVFh6JvHOKCMuA=;
 b=MtktUecg/RMfQB+XQ3UnWdug9I3eHDwB/PhhIGArP57vwxRPvbigEFwjo30Tzi4TQ+3aR+e010uCYOx0DzFm29qBnoEK/QDafe/w3rldholgLaJIdgfTdl7dVXnrbx61xh8Mmzku6w902yEapSHyIcsppR2zCKya998+nIJneHEcHhLLdGwrwnDgltVNKZs6Gn3NzfUvs/7/+u0Smbc0IHpawp4ybfJUjcAkirhR1bsoJY1/D4KjrhRF3fsbxH2mbQQaPUhnqJ2lJdLZdQ23+rj05JiPEFZ5ONhHWXEUspJbPC4IxXHGE9zogbEjFTrYubgD5gfM9Kq8AHIvoBbfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN69vorWK8qAaqyxGuU7P7QSV6TX9WVFh6JvHOKCMuA=;
 b=H9NzDfoAYbQn561D3k1dAPHFqLDkOPYb60hHeQxQj/7PwOMmQKtGE88bAGLwMaXJJhySH2eIrrU9Rwnt66boznbpPraR5fZQOJ+u8xKoDeULfANk8rE8JqlZ0mdK/D2/3RGtar/CTH298p9R/4UjR0l3y7RWrgyTkIw/FVY08+O2hpXCzNPErSXSUJMKEBbKP1y9uhuqeGXcPRuAfzbSscwQXo8/Ngk9KJo7gSu63XSZMwBqwDLOsffdsKMovfiUjnPiYpZxwK3oXA/24XopIZhbl7MSOuHe5d1At+Yz37mmFrcpT7iSQbZRubHgvyIYE5qP6RjkvMq8S10sSoeY5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <054d4009-6042-c985-cc10-b133fc2341b1@suse.com>
Date: Tue, 7 Jun 2022 15:58:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
 <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
 <6447f0ff-993c-9d39-52a8-40a434be9e52@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6447f0ff-993c-9d39-52a8-40a434be9e52@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0061.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02197eb4-951c-447e-83e2-08da488dc817
X-MS-TrafficTypeDiagnostic: AM9PR04MB7585:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB758567955660BE368F1513B0B3A59@AM9PR04MB7585.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ieieJuqWSPFgTgV+nzQtIOhoVDlUec2VZvNOf06va1x0lnnd7MHQ1H9enBqGHrdEdxFXht7tMc8FknV73VDMIBQ0LEIS4b6Q/agJ3UXGew/m0fn6nYBT5q5eM9jTx4EgeEz08jMt0K8gwsZPeUMqs4mmwcvpIFtf6OAGo9dqXoM+yNPN7Lz3JAKASGol7zuVcs/WFQqKXiE5FDnBc9Gp7Ex2z0N5ScxRiU2WLKGoMfVbJ0lvMJG5eyjHbqIT7rJgFbyxhltkEnjm+W/jQh8nfC0a3nQXLyENsC+LKyCKilQlvTLJUc+CO6Sgv2noDPp5xvzZzTBrZZHkqhjjNORba8ycL6iEWGibsm3Vbv00xCiitNBob+QiM64ni54VMglM0YvWwL5+AaYGFMXM1w2zEQ6KvlwgaCqVwtRM7FG3yniVgeTSG4oJe5KB+FD03wUJUWE6afUrcxwAdFre/TEJ16CQYh9RL+zKMLr5P5W9GKkwWlSKxaQAx1GjIaZR7e7pkEIOpzndgRNpSZb9aoRwrdPBjEb0z93NJWpAvozFMWpN5Zoh7QGu/TDn99QQ8/COBq4Y+MtBVwxZ41NsLq9+aktd0QU4lV7Mcw+28ODiyh+5MqurRFMiodDZXJp0E232pHIqcSoEH+2A4VZbWxl/pIrQDpJ5dlykUdWxn7/UFqhzficmqdBiW97VOFMFoqVSFsAKFCVNJKGarUB3d8U242LkIylMcZyaj7dffl4CDdagyu34SsOqlaw1OEDfW51r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(5660300002)(31686004)(8676002)(4326008)(66556008)(66946007)(66476007)(6506007)(6486002)(6916009)(26005)(316002)(8936002)(53546011)(83380400001)(186003)(36756003)(2906002)(508600001)(2616005)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjAwbGlGaDhGMEtGSWd5VlRDUXMwQVVrSXhBdFlkOUlObjNhcVZ4QlJHcFYx?=
 =?utf-8?B?cUZvcTVhYWtjWURqWHM5bERicERpTFF3Wm16SDZpeEE5TEJ6cUoxQloxSU9J?=
 =?utf-8?B?dFBNL1lJNlNFNWNyc3I5em1PVmNXOCtDTk1PTnhrb0F5VU9PZmdyemNibC9B?=
 =?utf-8?B?Nm9YR1czVEt4UXdMejFmWHBXWFV3LzhKdjJ5SGd4dU16c01PQ2FobGQzeUdh?=
 =?utf-8?B?OVBpcjhQNEtqMlNDbVFyQ3hPQXViL3NrclpsdHpmRDF4bnFyaXBoQnNFNEtj?=
 =?utf-8?B?a2U3d29lSEF0TlF5dDJYRk9xeFhIQ0dMU0Z3ZEdXTzNwYktRai9LelJJWUNB?=
 =?utf-8?B?ak1QcmtaZytpOCtzMC9Vd0phYkZUaUgrd1YyekNEbXVVcDkrMU9jeHpoZXU4?=
 =?utf-8?B?QUFYV1lUcWQwKy9sZzVzOERYNWNnQXVrOVYyTDBmdXo2S2dFc2pqemNXOURz?=
 =?utf-8?B?UDdGVHpVNFRpQnpWaGtTMU04c3M5ZjZ0bytqWWdQSXVLbWR1QmExN1BZTUtH?=
 =?utf-8?B?bmZJSHp6M281L1dyL0gvZTZEVWpnMTl0TnkvSkczOEJwUjR1anNNS3BYeGZ6?=
 =?utf-8?B?aE1QYzVGRDlvN3VBVWdyWVVzZEp6MFZCYllQK2JRUFlsdmdjWFNwQjVqZzJu?=
 =?utf-8?B?eG16K0U5Q095WVQ3MmxobkszaWExOEliZzBwWm1TOW1KNjE5ZkRPOUVSWUlj?=
 =?utf-8?B?aGc5QWxWWVhYcTk3OVM4cmpoSTZ5ZHpKZ2pJbWYyK0QvVzRsamlWbGNlQklK?=
 =?utf-8?B?TlJlMG9NOVdSKzZuckwyd0Q1K0hTUkNET2JPNmNLWWVxVU1ORVkwSHM5enJt?=
 =?utf-8?B?c1hHSTZvb08rL25qelVYRFNLL0o4SUkrNTJ2Ukp2SU0xemx4V1dzUTBoUTNp?=
 =?utf-8?B?c2pLak44YVRTdUFjMSthNTk0MmJwM1NYbE9XRkRMWThqcmJ0N2hjR1BVQmV6?=
 =?utf-8?B?aHZzSEVETjVTQVNlZ0VDbjZPbWMyOGsxRGs1N090eFRjY0luWG8zMGZsQ1U4?=
 =?utf-8?B?ZmNrcjZqeWpnRTBGLzRpK1FBS3NOQ2o1MlpzbTJ5OHBrZ1RKSVdzRXpGamVj?=
 =?utf-8?B?RFhvSnFEK2k4eDNIMENXdU53SXl4YktCUW9aWDVDenNXbUhHc3Jha2RrVS9x?=
 =?utf-8?B?VWw4WjNqdVhmQTlHamV5SDRaK3lBaDFyUEhFMWFTak90YjJHUkl4MzA3S3Rm?=
 =?utf-8?B?bEltbGF6dVQ0SXg0S2ZNclpWT284NVEzM3R5dWNDejE4RmUzNmN0TjEwbFNK?=
 =?utf-8?B?dUNQT1l6b0ZCQ3BZRzF2NGVlNWtuc0NBUWxRYlFwM0ltcFdNME1FeGYxZnlR?=
 =?utf-8?B?RTEvbDBwelR6MUJQbXFMTHRtOTFKelRoa0RXWFhpaUZ4Q2tqc1BmR0JzUWNo?=
 =?utf-8?B?a2xJNlZQc1JiU1Y4enBUVSszUXBGdHU4Vzlnc0N4QVR0SVpYZjhhdE83eTRv?=
 =?utf-8?B?N3NWL2ZIT2NReUppc2tFb0tFQmxUSUZWdU9Vc284QmdoY3VaU2xLYlB6emU0?=
 =?utf-8?B?dlMvcUpYV3huYXhZdGZtSDJHYmNPVzZ2RnFwUkVkZ0ZJak1RUTNhVCtxNTdn?=
 =?utf-8?B?Wkxuckx1bDRXbXlSYTVaM1pudzlRZ1NjWHlrY0ZKU0VoMTBpdnJ1MEpqZmNy?=
 =?utf-8?B?K1R1ZzZOQXRaMTVwbWpEOXRqdFZIaGlHMUJPbnRFNlpVMjR3OEs3Y1M0bHZZ?=
 =?utf-8?B?SVUvWmJCUjRGZ3BRalE4R0dMNHdTa2xzaVlIb0cwYnFpTVRxaFRzZ0xhYlUw?=
 =?utf-8?B?WVIza0VmNk5wanpJUGZZL0piTzhQLzUyN3p0WGpXSXZaWXNCYWVNbXVyczRl?=
 =?utf-8?B?aVJGY211UXB6L1ZXZzBCd3N6cnd6VEQ5Z3FlTk9FaVhqbG4vV1VVVXdWd1k3?=
 =?utf-8?B?cnRlZWdPVE1qaGFUaFdOaUpndVExUktyWElzdkpJQVQzSTJmSUJSU1BVWnBW?=
 =?utf-8?B?UzV5VC9rckI2bkhNdGxaTjlFa2QveFlyU3lDTDIycnRsUnJ0cnpORWFsalda?=
 =?utf-8?B?VGRVQVRuajdjcDZMOVpPNDRDREtnTFp1QlhHekxpeE9NNzVuTGsza3JnTmxw?=
 =?utf-8?B?VW9INU1sSWZqYkZCaTlZZG9rUWZ2VTQrKzBiQklsSGdQZkRjbU1oc3dCSDV1?=
 =?utf-8?B?NlljVTdIUDViL2ppQk1ndnBwamNINnd3Z0hkN2luNXo4dWhmSWQxYk5WS3lY?=
 =?utf-8?B?UlRtQ28wT0R1a2NObUp0WWNCRDc4Sm1iS3RHaDE5V1dxbmRUU0tSY3JQcVdw?=
 =?utf-8?B?WVllNVJsTUFOeXRPbWl0ck9QUWt5U0pYZDFiaHRXMjZqWmxERXRmaXdNaUY2?=
 =?utf-8?B?amF2Njg4L2YrUmZUYUUyNGJoalhRaG8veWRiazc1Y0RxWEpucHRGdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02197eb4-951c-447e-83e2-08da488dc817
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 13:58:21.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0whvRjWXw2WVMmoPiKdYCun2c7dIzNFQfwymFJ3Wjb3T87flZBHx+WPq+WbPZTQtpm8FdsHriUKQV+qemKr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7585

On 07.06.2022 15:47, Daniel P. Smith wrote:
> 
> On 6/2/22 05:47, Jan Beulich wrote:
>> On 31.05.2022 20:20, Daniel P. Smith wrote:
>>> Previously, initializing the policy buffer was split between two functions,
>>> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
>>> the policy from boot modules and the former for falling back to built-in
>>> policy.
>>>
>>> This patch moves all policy buffer initialization logic under the
>>> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
>>> message is printed for every error condition that may occur in the functions.
>>> With all policy buffer init contained and only called when the policy buffer
>>> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
>>> all errors except ENOENT. An ENOENT signifies that a policy file could not be
>>> located. Since it is not possible to know if late loading of the policy file is
>>> intended, a warning is reported and XSM initialization is continued.
>>
>> Is it really not possible to know? flask_init() panics in the one case
>> where a policy is strictly required. And I'm not convinced it is
>> appropriate to issue both an error and a warning in most (all?) of the
>> other cases (and it should be at most one of the two anyway imo).
> 
> With how XSM currently works, I do not see how without creating a
> layering violation, as you had mentioned before. It is possible for
> flask_init() to know because the flask= parameter belongs to the flask
> policy module and can be directly checked.
> 
> I think we view this differently. A call to
> xsm_{multiboot,dt}_policy_init() is asking for a policy file to be
> loaded. If it is not able to do so is an error. This error is reported
> back to xsm_{multiboot,dt}_init() which is responsible for initializing
> the XSM framework. If it encounters an error for which inhibits it from
> initializing XSM would be an error whereas an error it encounters that
> does not block initialization should warn the user as such. While it is
> true that the only error for the xsm_multiboot_policy_init() currently
> is a failure to locate a policy file, ENOENT, I don't see how that
> changes the understanding.

Well, I think that to avoid the layering violation the decision whether
an error is severe enough to warrant a warning (or is even fatal) needs
to be left to the specific model (i.e. Flask in this case).

Jan


