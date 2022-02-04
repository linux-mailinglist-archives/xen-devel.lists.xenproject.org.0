Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA44A9A62
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265555.458954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz21-0002XJ-RL; Fri, 04 Feb 2022 13:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265555.458954; Fri, 04 Feb 2022 13:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFz21-0002VG-OD; Fri, 04 Feb 2022 13:53:45 +0000
Received: by outflank-mailman (input) for mailman id 265555;
 Fri, 04 Feb 2022 13:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFz21-0002VA-0P
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:53:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddcd0af3-85c1-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 14:53:44 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-XOte82LdO46m_Upetux8Ow-1; Fri, 04 Feb 2022 14:53:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7835.eurprd04.prod.outlook.com (2603:10a6:10:1ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 13:53:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 13:53:39 +0000
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
X-Inumbo-ID: ddcd0af3-85c1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643982823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MY/lD1JtK8C2rlX1n7vsJEdpJ2aqLEXe5vkiEi7t6E=;
	b=Xuhm1EX7XxUY5C+kzUiIcO6Qikj/8eDXZXd9n/3qLXzXriz4EpPEPywM2/mtql+bFR1Y4e
	MSBRPYMehyS9ikgFqWAZGDWMqxdwFsf+0DKAZQWdUV5qWoTVhlYNjkKAtHQ0voxp8z34dI
	Kn7a/HP3udLhDpSYlzEq86GEy2U8xP0=
X-MC-Unique: XOte82LdO46m_Upetux8Ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGbyMJhzlujMTied3LlP3EcRD3J+Vbio9aVfLRvKkl4BiE+SD8BvIixvxzv24bADZYMu1M8PoaQsPdYhK4k4jP5H6n0zeQLAglY3hle9vzs2u7Mka6x3PmzmjqX2jYXWxrS6LuW+q7S8sZucnxGERWE0v+ohvDJCiM+1jWlOTaS4NfWLiRuUvWvAgAw19YBL7h3NZ3RDp7nbcMziDQXRmKEROvh7OLWlQv3Q70S9jM38lyN+uQx0MuX21G19yVbxnk4Xur/7cGYIopxUnn91SQ9Ekg3M7PjJ0Rtyql9ic/1B8HDH8fYlFcticjTKNcymTqYK/VXS9xaIW4RZTtxBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MY/lD1JtK8C2rlX1n7vsJEdpJ2aqLEXe5vkiEi7t6E=;
 b=dCeLr6IayNq4sgZCqPCoxs53YAmemQOdB+MmY5DEnF4GA5SyYAKUs2ry3jE3P33Il6SZXxiMb4xcMidCRf9vXWRHsVkwDaJYGlz4sGH5//V+hzOr3d7TIUjl0aVo8cTBCYp0IP/5CDRFO8GRCworAm2QswPpgjv7E3rFvdWXjn6xD4em9y4+9QdSGFtc9sfzKNi2gFL787mpRbezAyq6t1QEi6RgcZ7/NOCqO+781K4b3J0YfI8BW5+sCqLwNK7YjzcHRRQ8Qh0iiw63qN3XUNNpJcywuVdJ+VYE6t8UxIAuWpN5QIuDrz9kFnwMwzY+kz07fwnpe2yQAVjiovppBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6173683-caf6-b1b7-aeb5-eed637d14a0e@suse.com>
Date: Fri, 4 Feb 2022 14:53:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] docs: document patch rules
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220203125438.21807-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220203125438.21807-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f689e08-ecf3-4585-c7d3-08d9e7e5bf69
X-MS-TrafficTypeDiagnostic: DBBPR04MB7835:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7835AAFD34A8BC70111A7998B3299@DBBPR04MB7835.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WW45dXPYSrJlMP3V2/GvQ8hgE/GG6gva6QViu/Qc045sQoUyRftB/hZrS/dTU59I1nWEc5L4+Bt/bEl1LG/374qVcz8sa76COm8d2/+Ps1deZi/K4HeDoaQi0UksJSMu0270kKb77r1Rpvd5vVQkb9sSG5gEDT8lPCmagJU2Bl0iZl/gki9IeN8TsWnQdfYRJt7I2t2RKbx/DckK9G7672dEY//EPvdbo1bMCx7CMeywLemFyYZY+xlbmMdvgHuXdUmaLssRImvMs9n1EtKFGL4QodPAmz6vAYOxWVq9mszcUQpltYp+RhELxiSWO+ikbceeiAlM1eZqY4GWkiONgewYps5Fto/i7pcsSBMYxLsclxNvjtdPbHoBGFbyI9GDz7YwRlFfSwkCJ+YMOHCcs73zx0x81k1MeiqZ2oO/5Lv8Kn9efgvT0s1Fhxz2W3f8eoBSAqViHDoBy6AVyVEXGsycYO4To1Ipi1YqG6zrYpKsUFkEyNtF6cGhKVZqtg5YSrgi7CSpkgwv31fuVxa5hzyvIflVLP7lSVooiQjUMl5EnqA1JVo6wKOnW+L4Lh0kBE1cc9Zry51o6y0ZhZSeeCaZ+LdEHUm/yBasdpkvlqX5VPQiy95tHTA7uqm/3RAPxGE8eT/4/miIdMmMb9L6lODswbcv8o12VEscGn2e6bjntqbnNjFYSO3zjpgph4Dyrq/S9lf0rPB3KodZedJYT4KyI6d1EXMRTDvK5TV+X0VeMnrP2omBb2krMFzCrcAw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(53546011)(5660300002)(6486002)(6506007)(6512007)(4744005)(508600001)(66946007)(54906003)(38100700002)(37006003)(316002)(4326008)(6636002)(86362001)(2906002)(26005)(36756003)(31696002)(6862004)(31686004)(2616005)(186003)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0FZeFEvMi95RzlHRFdtWm90RHkvcERnaVkrd2o3VmtPMUk5ZU0yd0JZTlFE?=
 =?utf-8?B?QlNoOWNrVXhqWWpQQUpDMUEzYjNJdlZIdVJ3b2NlL29nMVRrMkdSMjV5TGZV?=
 =?utf-8?B?RjJyb1phMjI2OVhCTlFzejB4bzRUSXhUVUpSYVFUcXBMK25FYm5QdEJ3WjZl?=
 =?utf-8?B?TDJkZWRnMk1kOU9uN1VQZS9sODVrVjV3TE81b2RCdWNCRFI4Skx3SkF2NUxk?=
 =?utf-8?B?TEtWNkhLUVp1T1pYWk5pYWwzZmFUamIyK3ZRbnZ6ZldndVZ1VDVRVnNUeEp5?=
 =?utf-8?B?bTdlYUJOR29LZDM3MmhWR3pWRmZ4V2pZeVNOU3BueENVKzlpQXF0SlB1UnRx?=
 =?utf-8?B?QlhKL25pT1RZemdZU1dKYXRvMHdnL1dNS09IKzdhOGFMb2V1N3pwamd5Vmlo?=
 =?utf-8?B?TysvMVRkS25SNlZWaW14MmVFRTlGSDlkSTBnUGcyWHplVlNKWmV2SDFZNHZv?=
 =?utf-8?B?L2pJVVhOamZ5dUhaVUc5aXRtRjZYc09vZ1dKNGRpbmU4bGhqZDBxcUZRb25h?=
 =?utf-8?B?YTQ5bzFaaW9lVU9uRjVwbkRpUUcyOGFCMDF5bVl5c2d2UDhyRlpEM3QvK2Z4?=
 =?utf-8?B?TDJoZkRKQUJaN0dlcXd3TGVMa1diODlNYklyaWFEM09jTHFQbEpJMjE0YkdY?=
 =?utf-8?B?eHlNZUQ3bDQ1QXhmanU5Z1BjbkZQM3RQZWlvTGFyaFFrQjJhRjEzWk5QeUpV?=
 =?utf-8?B?eTlPRDJZYnNPanhEeVZDQllXaW9QMS9vMTZYTndWRitscGFUOU9UMkZaclpS?=
 =?utf-8?B?MHhpMjcvb0hGMWpvUUgzNERybGNxa0RzZUs0S2Ewa2JoL1FKMWRkam1rM0sz?=
 =?utf-8?B?c3RDbmNwc3hOa2FIL25sclM1cTNLWktaSEZ3YVpzUWN2MlB5NEV1ZkxuaXhN?=
 =?utf-8?B?VGM0ZzJVbU54ZFR0MXA0OXhnRit5MGhzRkVNdllLZkE2S2tZZXRWZ1hnNHVr?=
 =?utf-8?B?TzdvNW02OGdtZ3ZZdHFlVGd6MXZvZEtRQlVQUm92YnZzeSthaktETElvRHN5?=
 =?utf-8?B?Rm0ySElyRWhycGR1eVBHVVBMUVk5MXdjUlF6T3hCWjB5TWFCMzdNSjhVNDJi?=
 =?utf-8?B?QlhycHhCcCtFN09vN29YejJadDU0dWZ1b3h5M0dPY3A1R0tmUjZ5NnFReGVl?=
 =?utf-8?B?a3dwODFLcU03d1padnZnTmFKYm1TdURZdXowak1yODR6dWhQTHhSdGpMeGpW?=
 =?utf-8?B?WkZHVlVyVEZML3YxSTVCem0xeE9VOEJyc2EvVlZ1WjBibVl6MnhUN1dyNEF6?=
 =?utf-8?B?a0diT3JqZnpxNXRHYmRrQ2xhaC8rR2tacmxMNUhzbFBkWldxZFFtbEVyaGRJ?=
 =?utf-8?B?ajZMMVQ0b21RSDE5aXpjTWVuNmRVUU1pU3p2YjhGYW44UnlMZjhPNGRTMzEy?=
 =?utf-8?B?YStYKytPU2dqbVJsS2xSZWpZTklPalR2R2VFUks3Tnoya3cwVFR2allNRmRj?=
 =?utf-8?B?MVpRczM4Y2F3WnF1UG40eWg2dVI0Z2dNYyt5RitqSmh1ZnAyQnVSVVkzQXRT?=
 =?utf-8?B?a0dkc1hBaC8rcmQ4cU1iVzhVK0pVMEh4c3FVRFZmZTFqZHdJbG53Tll3SitO?=
 =?utf-8?B?VFdnZkdRWHJRQUQxSmFDQ1ZPZUg0eHhlT01uSk45OGo5VjFWSHRPTUNmeXVW?=
 =?utf-8?B?K0E3ZFdnMkc1aUkzYW9qd25EY21aSnJoOExPd3ErUlM1bWZ1b1FrS2FTTEVh?=
 =?utf-8?B?aWRZZmdPOXZuZjUrSVhweWtoMkxXUHd6UDl1ZitUMWdWOXBwSEhwNXpra0F5?=
 =?utf-8?B?dStHVjY5VThnOWhxN09UQzkzQVhvR1Jrc29VVW4xL0poS3NFMnJaRStQY0ZQ?=
 =?utf-8?B?OUVtQVhNTTZVNlFtSk9ZQ3ZsNjdLK2V3M3FQOWFLNnJTNlVIb3V0WXczVmhD?=
 =?utf-8?B?aUdmZmVwQzBnWHljQlpLMEY2Ry9XZmIwYWpia0x3R0RNbjZTK0tmTTNYY1VM?=
 =?utf-8?B?SS95Yks4bGtOSTZ0QXk5WjdwZG9zekR3aG5NcXRKYXBQZDdJem90dGgzcW9i?=
 =?utf-8?B?ZnBCMER2R1Fsb1kybng2L1I1VFdTdE5abWJPSml2anIxQkpKRytYejJmcDNu?=
 =?utf-8?B?bFFPSjRUdkppcHpNUEp5a3Nqb2NvdHJvbEpscDV6Y2VweCtlUUNCQmpBYUVa?=
 =?utf-8?B?QVpoV2luOHIreXdIRW5CZFMzYUhua013eE90UmdrZS9SY2VVeHBKN0p0TjQx?=
 =?utf-8?Q?YcXvOd2p01Lu4lyEqzQBOno=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f689e08-ecf3-4585-c7d3-08d9e7e5bf69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:53:39.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BVrHV4cgq6yFTMY1mNFUPLPOET3G7paCdQKsyyIjYCEZLuJAWqYtTsqwNo049q5vYCjG1QCoVxXyGAWls6J5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7835

On 03.02.2022 13:54, Juergen Gross wrote:
> Add a document to describe the rules for sending a proper patch.
> 
> As it contains all the information already being present in
> docs/process/tags.pandoc remove that file.
> 
> The "Reviewed-by:" and "Acked-by:" tags are expanded to allow an
> optional restriction of the tag.
> 
> A new tag "Origin:" is added to tag patches taken from another project.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


