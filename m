Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0E4E4CFD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 07:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293758.499154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWuvj-0004yQ-QR; Wed, 23 Mar 2022 06:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293758.499154; Wed, 23 Mar 2022 06:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWuvj-0004wa-NE; Wed, 23 Mar 2022 06:57:15 +0000
Received: by outflank-mailman (input) for mailman id 293758;
 Wed, 23 Mar 2022 06:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWuvi-0004wU-1k
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 06:57:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c83355-aa76-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 07:57:12 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-eqZGhxjYNfW1cMqM6jWu1A-1; Wed, 23 Mar 2022 07:57:10 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5982.eurprd04.prod.outlook.com (2603:10a6:803:d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 06:57:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 06:57:06 +0000
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
X-Inumbo-ID: 76c83355-aa76-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648018632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10QfMBRDJdM7xSzPM0h1SgST36SwVd6fWpFXivIhfrE=;
	b=ZzV4YW2V6jnBR2rmRnl9FtRZqrkeFoYBg5HDPyL2OkLchzC/XkF7u07TeJRZQgSTUs+2wM
	4c9Tr7FWy6mrQOJTl/QELtzsb030RWVFCLrMCYvtGtKkIIl4hP00bHm3Ra+01AXfM+Ov3w
	/KpsvOsydTKrd3f0obhgfFDN5SyUPnk=
X-MC-Unique: eqZGhxjYNfW1cMqM6jWu1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac8te2lu0ZlNtAKtuuf10BeHSL6+8iyxgMLN7E+riUcanu/3Uhm+kIx01pkornccZXz8apXTACTkw234Lx26KTnFbpWbtklamUmiIn3Q43+X//EFOfJWr4kGOHywH9UfSjfDDYEEQfF0ijMz8qDwvGpggIMKQREdFm2HKV5PA2bR0VciEgEpvPpZ47XmZlyR3gq+zdSRANkyvG9U0hCQYtXLayg6jekQkZp1m0c6Wj6UP9c0HUjdF5u5mEtbINM3E0eHUVTvJ1IfM87Y2CYQQzHv1zT3S5YVXorB+iwoSCPGG28ikzxy0mWPUu2JHKURDJiGHtcgUS4+aJkeup4gHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10QfMBRDJdM7xSzPM0h1SgST36SwVd6fWpFXivIhfrE=;
 b=YfA+ZEVFeFpyLOGd+Uq9CpjASQvplzWklJzizBTk2PL4+jq1Cqn4Cru3tuAYsy9CD5P9b/HOt5LCmp9MqfZG9Rrq7NX4KpG86RtDD4aKDwB0Ko0nPK5A7mPjrHMbUPBkw5DUM1JfpSKheGPYWD92ae2G3BnEomoa1TnND18ue4ttHd3i/d+Hf+RGoaPlH2BRPzrbPf45B9sFI2UnINzjbmjWw42Ppei4vL/3pG150lxn2Ip822OoidjQDI9Qel/Pfce+k8Sb5tnXwcwE6qOb+so3xjp7/kXhQ15y744rgNccPMDfVZYwXyQT9HEtSj9W5UF37PUU1npisR8i/nzDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
Date: Wed, 23 Mar 2022 07:57:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith.dev@gmail.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0026.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::36) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed1d7cf3-4783-4b4f-6c9c-08da0c9a5764
X-MS-TrafficTypeDiagnostic: VI1PR04MB5982:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5982088A55476CD4225562DFB3189@VI1PR04MB5982.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHg56+fetDnSBKOhYdyrZwqgXjx7nVKFAxSKYEgXdGMC48rWYwSB2jc0AFkTReGeIW5gR2+xwWoI5aZQBX3/m2YLTyVc+KQr2DbPCVHFWu89S1O+I7bVbWFj3qwzy614iOZ6mHWE+XEo2F6WHbk88etXl7ktvdFgppDmgawsOkZZ/WTF7Hqny3F8C6RwCkDF/Io27opKoq4Uf1cqkIpyu7uXTCjc4Jgw1Xmo6PqKpaTWGxF+jJkZNCllAucHfTWy5oDhVc+u3jKBocSg2O6aV110YonjW9li4AbYUyaYsuaWzbNX/ekuH08hSOXKJLGR3UzoQFmD7+tF+E4cGBIMq3fx8Wn7S80A4mRB1WlMj6zXsiF12vMKTMn/kH+TpK/uf9MDIvDitJNlQNlIF9KsO3kvPxmXQXZImTHBh7pB8kQA+t9JlszGNyzdQJfT8vvFfNiZP4ISIuuneD+xYNE+kJrnvPKHb68x8Egjsw6QptO3Yo0jQXF1SR1HMs0l8FputTKckfLlIwa02GiZpt+LIcmWwNL+4KGAZ5a4MvRVO7GjhncRjem0YKlzNyYknd05PjUVzpQSiOUlpeWJ5qoFi2xN+zYgSiXsIKVphyENAMtLV0d7GFhIQA7udOS7MZpyPtNHGKOTRL4Po9cGhKBLxSW8x/5jdHqUc+2vzIwJisqHPVIUk5hmJx3dy21E6OIPfe5SIblTe/TMotSMfWLYQO0s07TofT6stmzrQbo2fkj7ufOGiKWPwyuTYHhiRka0UdE73nadHyi3svKOPTQjiW5kqiTxFBdOy8Nk7XvJHRTe3MUhDUGMkrjQTxcdcbZy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(31696002)(316002)(508600001)(31686004)(8936002)(36756003)(4326008)(8676002)(5660300002)(38100700002)(66946007)(86362001)(66556008)(66476007)(2906002)(6916009)(54906003)(6486002)(966005)(83380400001)(2616005)(6666004)(6512007)(26005)(186003)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJtUG10QWtzMFVvbTk1NFJvTTVzcWtBUzZXZUJRMTZxZTJLa1pCRUJybW1k?=
 =?utf-8?B?TThWMjlyUitmaSs5VWx0M2l2YytMNUFQdmdXMW41TW1wSzRycUwwT1RJY1B3?=
 =?utf-8?B?TzcrYjNEcmh3SXBNS1k3TDVab1o4Nnh2TkwyM0VDQmdiZWRuWVFyR2x0dEQ4?=
 =?utf-8?B?SmozalZSQk1nK1FjY3RZRkNUM1dVUUZ3OExQcDN0M3J4eHFsRFZTZGNReXdo?=
 =?utf-8?B?ZSs2QjFobGtmeGJwSVJlNDZvYmdPOW85T3E1VlBHQnBSdjd0a09XYUZxaExV?=
 =?utf-8?B?Y0VUczlUdmxXMW13MjZmMFdrZjBDRTVqazl2M1JRT1JXOTlmMlErMnFma3VO?=
 =?utf-8?B?NWZjVmhuY1BaY01ua0VFSlhZOTBuMFV6ekxFZDVSV3ZMM3ZiKzJmNHBXNndI?=
 =?utf-8?B?WDB2QmRjNER4cFJtWkpiSGlwNC9BM1ArNHF4VXRMdEQ5UVVsa0Ntei8wdVFP?=
 =?utf-8?B?SVdlM2Fhc0cxbVlwcThmSHRxZkxRNnBwSEd0TjdMNXRNdmowbUsrbTVRTTgz?=
 =?utf-8?B?WUt4eWdCTUE3aTFZbWNsalp1Szc4ODdDdnNnRjYrOUU0VWdEdkJJNUFSeTdW?=
 =?utf-8?B?cXJVaXFCQUw1WjlOYlpuZDZ1NTFubHNrMk44by9qeVduK0Vvbmd1OVdTKzQx?=
 =?utf-8?B?bHdIQVhTSGh6Z3hWRWs3cTUveWJ6V0IyTTE0eHdZaGV6aVJGS0wvRENFaGUw?=
 =?utf-8?B?N2w4VnY5ZTkzcEs2TU1uenZzM0FCNU9xWURLSVJ5akM1WkJ3bTlCb1p5elVl?=
 =?utf-8?B?UkFGVFE3OTVRUENpOXR6STdyZFBvTW14ZC9lUWRiZXdZdWc3QlZ1MHdhZ1ln?=
 =?utf-8?B?UHdwUWRsdThSVEozZk85amxwTXpHMVVzRVFKRXdvRWZjbTdxdUNFOFZVVCtj?=
 =?utf-8?B?WkVabTBUY21hMlczeVpRajB1K2ladU53WTJLckhHV3BKOFZMc0Q0aXZlWDRp?=
 =?utf-8?B?SEJXMHAxK3p0M0p6aldEeFJoZG1JVWtWWTVmTjZCY0F1V05odXlsTUlxVWdr?=
 =?utf-8?B?eThoQVpyUXRrUmJRSTh3YUxlYWIzM2JQWWVxc1ZqNy9QeG44KzRQcHF6RzFo?=
 =?utf-8?B?VEZUaEl1TXhNSllHUGV5VC92Y3hWZFlRYlFnUkZCS1gzMmExUHlKQlBNOXVi?=
 =?utf-8?B?aDlPaTRIWndTdjJ1ZjFzSm42dXVJem9jemROOWVsNXF6NGtWQ2pQbXY2ZjI1?=
 =?utf-8?B?c1RraVJiOU9CckExejB2K09iUmFxWGhDYTAvaUo5dHdFaWs5UjZ0eFNGVnhJ?=
 =?utf-8?B?cUVLNVI1aCtYR1pKbFdKb0lsVU04dVdBa2hzcFhCdHpIV0VaZXBzR3lnN2Za?=
 =?utf-8?B?USt4VHgxclRpTXRjRmhaZDlERjNPRVFpNXVGWjBjQ1oxcjZLUWhWRnlpWTlS?=
 =?utf-8?B?dmpmNk4rZWw4Y1MxeDFKbUFNNTg4MmQra1pkZjdtSlhlMkxFU2ZFQkZ1WGtM?=
 =?utf-8?B?Wk9UMi9YZEtCQS84SktXYjNYNUhWSy9EVzFtWTJVUXBNeUhFZ1VCUzQ3MkZ5?=
 =?utf-8?B?cFZ2VzlrQ1BFSmR4M3NreklPcVFtcDZ2SFBTYTJPUjcvRXNiWTFoek0wWmww?=
 =?utf-8?B?ckJ4b2RlQWs3R0ExaUFnU3VaQkZOOUNLUm9WR1BhcTVxSGxEZWZLczlocWha?=
 =?utf-8?B?eWJKOW9xWVMvNFJyS0FPSUNneWUzTlhCWlpqZXRveG9EcVRFTmRhUUtGQmQ1?=
 =?utf-8?B?cGM4Qnk2aTM0OWVEUDZJdi9ZVXRWdlVheU5FeTBoNDB5ZE0zc3FUaDRPem0y?=
 =?utf-8?B?WVlmQUhqZUVXMSs1OFVqcHFmcG1KUjJKVy9aRWViNi83bFFIYnJoTFRhTjdZ?=
 =?utf-8?B?L09uMU1oNjBoczlGMjBNb1RtQzNkSm9DY3lHSExJRXpRUWNyWFRjVkxnMHlI?=
 =?utf-8?B?Q09OQnpiOXRvckpEUWF4S0ZZdFdlblhwekpWc1BhSitTZ0FUTFF0eHBycFVM?=
 =?utf-8?Q?WtLaKPYfeDxYWlqnXZQf0jqJ4NnFKoeC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1d7cf3-4783-4b4f-6c9c-08da0c9a5764
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 06:57:06.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WR7ivlDlhyU9/L8UY/H3oo6usOrC56I84kYcnMevu6Gn54/sTJhSwZfuXeQQleYcBwl50tLQ93eJohfAJ01WkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5982

On 23.03.2022 01:22, Stefano Stabellini wrote:
> On Tue, 15 Mar 2022, Daniel P. Smith wrote:
>> On 1/28/22 16:33, Stefano Stabellini wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> The xenstore event channel will be allocated for dom0less domains. It is
>>> necessary to have access to the evtchn_alloc_unbound function to do
>>> that, so make evtchn_alloc_unbound public.
>>>
>>> Add a skip_xsm parameter to allow disabling the XSM check in
>>> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
>>> originated from Xen before running any domains.)
>>>
>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: George Dunlap <george.dunlap@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>> Changes v3:
>>> - expose evtchn_alloc_unbound, assing a skip_xsm parameter
>>> ---
>>>  xen/common/event_channel.c | 13 ++++++++-----
>>>  xen/include/xen/event.h    |  3 +++
>>>  2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index da88ad141a..be57d00a15 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>      xsm_evtchn_close_post(chn);
>>>  }
>>>  
>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
>>>  {
>>>      struct evtchn *chn;
>>>      struct domain *d;
>>> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>          ERROR_EXIT_DOM(port, d);
>>>      chn = evtchn_from_port(d, port);
>>>  
>>> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>> -    if ( rc )
>>> -        goto out;
>>> +    if ( !skip_xsm )
>>> +    {
>>> +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>> +        if ( rc )
>>> +            goto out;
>>> +    }
>>
>> Please do not subvert the security framework because it causes an
>> inconvenience. As Jan recommended, work within the XSM check to allow
>> your access so that we may ensure it is done safely. If you need any
>> help making modifications to XSM, please do not hesitate to reach out as
>> I will gladly help.
> 
> Thank you!
> 
> First let me reply to Jan: this series is only introducing 1 more call
> to evtchn_alloc_unbound, which is to allocate the special xenstore event
> channel, the one configured via
> d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN].
> 
> It is not meant to be a generic function, and it is not meant to be
> called more than once. It could (should?) be __init.

How that? Its pre-existing use doesn't disappear, and requires it to be
non-__init.

> The existing XSM check in evtchn_alloc_unbound cannot work and should
> not work: it is based on the current domain having enough privileges to
> create the event channel. In this case, we have no current domain at
> all. The current domain is Xen itself.

And DOM_XEN cannot be given the appropriate permission, perhaps
explicitly when using a real policy and by default in dummy and SILO
modes?

Jan

> For these reasons, given [1], also not to subvert the security
> framework as Daniel pointed out, I think I should go back to my own
> implementation [2][3] based on get_free_port. That is my preference
> because:
> 
> - the Xen codebase doesn't gain much by reusing evtchn_alloc_unbound
> - adding skip_xsm introduces a component of risk (unless we make it
>   __init maybe?)
> - using get_free_port is trivial and doesn't pose the same issues
> 
> 
> Let's find all an agreement on how to move forward on this.
> 
> 
> [1] https://marc.info/?l=xen-devel&m=164194128922838
> [2] https://marc.info/?l=xen-devel&m=164203543615114
> [3] https://marc.info/?l=xen-devel&m=164203544615129 
> 


