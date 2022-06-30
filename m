Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB8561250
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 08:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358222.587307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6nRM-0004OC-FT; Thu, 30 Jun 2022 06:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358222.587307; Thu, 30 Jun 2022 06:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6nRM-0004Kp-Bu; Thu, 30 Jun 2022 06:14:12 +0000
Received: by outflank-mailman (input) for mailman id 358222;
 Thu, 30 Jun 2022 06:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bdU=XF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o6nRL-0004Kj-2N
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 06:14:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da4da19c-f83b-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 08:14:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 06:14:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 06:14:07 +0000
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
X-Inumbo-ID: da4da19c-f83b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWCcEnPR1WDh5J8401R6ouTVmKN6p5RL2wISrZ5VgFc0aFopT3EixClNHAV4V9n78MONB8Vtlwk3l3pEfqWqSCDF/XEhc9vrggW9OxqDtM2NJa5jouIuJNfYLJyHY6TYCWqwiMh083+jMGSvYnPRYdVRWb0ZkLhbfMMH1xxZck+XOnGsSSfKrEzdeVEbnxMlByhkh4Yo5Cbj89UUJW6DlKybdCl6nPUk4ybYL1M4L/KG5kwrq40tSJbFdECzncorpWVHG0N8kSIP3ssF3I3GP3jFjmoGTuJumpuBI6jeFvLaSmnQgMRUEH9Va783CpcLlrW2lbMUIu4TbQEVyw8ciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOsIoU12XOqWwOCjoOU3p78EJ96++2DYfJgKQaIIg3I=;
 b=m6Qf+MaCeFaSWcNOcViUCj7JyAzrvWUF1Z9M7vLC/GeLuvKHJgO82XcjEU6vqP3XGFxJJNorUWDndpV/WHt0JxqwsOaZFGK3k/ZDQD+ai/4jEnj68KFDyBR0Kor2CeTY5246ii24RxcOkEa56STde4Ws1Cmox1UOHF20YtvWBNUQBRP+CrdHNrlOV3dZRZSsIqW8LMTf+JbKf4TZVluDftuH5fkSeq7Io/AfQV9tmOlv+K4dxb7QmOIFDNSJom44WlbVu5iMMG0iA+1//TXtiA+CJgFr7Z8S0v0z1BFyD8IaRJAZEjjhGr5yal68AOUxUvbOzCuwB5w/YXsjDdtHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOsIoU12XOqWwOCjoOU3p78EJ96++2DYfJgKQaIIg3I=;
 b=PCmxKSTGBQaIlh6zBDut0NWpyphuXkFHlzq1Rp1oqWGYSEueApoBqeDHtoamzSm6YaHoPd4rsfk81PXpx0ZhI3Vs02ZQ+1Psh638LKrRaAISjIeNQ0vBGqRztRfS4suQMFpfTjG27G0li3XDWnI9UvoxtraTaVT0t4FKaswJZm5Z840aTBHGWeHfKrATII8rl/APBWu7HR6ko6zGvFdZyAnxUS0Q0VtitncMQyBCV1xgj4pWZQDEfUwYTXCaft7hjWAWQUtpkt/qLoio0OFCqxay9P7KbYhATL4Z+yXKhCx+Vq0mgMvAJ2ND+iokf11V9Zr4Fte0cerft5hWlt2E1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9833c7cb-d71d-10a3-f74f-3caf46db3cb4@suse.com>
Date: Thu, 30 Jun 2022 08:14:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630022110.31555-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0382.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f41f92d-2f27-4183-6f6e-08da5a5fbd4c
X-MS-TrafficTypeDiagnostic: AS1PR04MB9240:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ea7gNALe9XVzeo/qzYutWxqZmHyl4zYmuUlUDlW+sJaX2q9Z6ZLzD2MbpRHx98uEgot34kthTvmt1omzes7GxgTHHdV5xSHjgW65GkdyGfW8Tsx4QdzuQeEPNcphIu2yV2hRrE4htATGS0TRZk3VET3SIPiI0IRJNya3aCctdbc74DkqP1VqkgPr11ZWaQoNKSTiTxVnb6QUTH6Wp+Q9gccZD3u+ZHLdkNoJbrLjAbcQH7SL1VLSavHGryGASYh4fRHh7xNXejh1vg3SrlrWWxy8hs6/f/UbrCF3LazL2k3U6X4OQqEURteADoEGUAFAQI3q7QQD0UShFRl9DuF+Jo61IamBiS2bLhB7Bb6GkWntL4U2MXC6b/LMQ6bqE/sGwWTd1216hNlNTTfVRlSnZit3Pd3NM9cGaq14MYsjkglVf0HpmnuNS5Gr01sjNULRsHZNQxLQxD0VhpOBgsbQuKIJl8NP6aQhBvDdzEZ2vG3sGWlFeejR5ZMs6Z4uKCgxEJjex2pxkb71G99YHBPfD8VDjCJSq+wOeYB52+sZ9b0R+zHiBZvReTmIN34o5ft6BbxFg+NwVK7SBKlroN5uHN5heHvqNHrKNLdMpr+rFrDebzb/i5Q3+oQ+dC8AjXsquVL19hTh8o0/Jj/6x5BJ5P/Ov7yv874mowi4wKxM8yrkBLvzEhpGXq5Utu/8z+Y7E/yEJoOj3SeiLiEY8A79GoliOWKYbRdb33K5sotnz7oHkoCgiwsCekThME5GIfM5ZQbs3BrIRRrkWxKNgCUQz+n3C0xs7ny8g6ZlNA6bxKDlLsH96OUilW2arXPdiy06T4LFFF54Azs26Wf2m/wGzOmOjcbLBXT21d3myLk+I8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(376002)(366004)(346002)(136003)(8676002)(4326008)(316002)(31686004)(36756003)(66946007)(66556008)(83380400001)(66476007)(31696002)(186003)(6486002)(6512007)(26005)(2906002)(41300700001)(86362001)(5660300002)(53546011)(38100700002)(6916009)(54906003)(2616005)(8936002)(6506007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emxON1gvNXhLR3RSdnV2d2ovR1VWZjd2TitueVdNSHZNTTBaMWY4RTgrMmNt?=
 =?utf-8?B?dWZWM2E2VlI0cjBhb2Q0RlB6RC9EQjhLeTA3SEF5RGhuRDgrQjEyK3d0Z0lq?=
 =?utf-8?B?TDh4cHZtS3Y0ellnOXhMaHZTM3YzZ2d0NVZqQkJaU21wZERvVkJxaHVvbXpV?=
 =?utf-8?B?bVVscGVZOGlIZ2F5MzRVM2JNNVA2ZERuM0NxbVhXbzd2dVM0cmh3S1FSZ0dz?=
 =?utf-8?B?bGNWWHppZStVQ1JGVnhyUVJOSlpiVTFZOE0vUU1VS2g2TEdmN2V0d2s2cXho?=
 =?utf-8?B?ZzBPaWk1OHBzbUc5RThCYWVXSXJjMis0Z0R3c1dFdEpzWnNpL1BjdFRXa1NW?=
 =?utf-8?B?YzhDcEFmWDlOM1R4V3JmWThFVW9LODNFd3BwNDV0ZGZ3NkI3Uy9Iem5VWWF0?=
 =?utf-8?B?R2FjeTQzcVdzWFJjZ0YycjJEYU82eU1tZUhzZ2dqOThyZC9Ob0lndGpibEkw?=
 =?utf-8?B?Umt4d3dJNUZVeU9wb3N1NGhsYmFiUUprV29sc1BYWjg2cTVmK1AwWXVRZ3ZO?=
 =?utf-8?B?ZDV2S29HVEZNT0xObHUyNXR0NXUzZXpMbUNqMUVKQmt0Qlc5VkdrSHMyWThw?=
 =?utf-8?B?bEsxN0dqRFBNVWVyMkQwWjRneHJOTkQyWmd2Y0VmOUVub09RU25kK0U1SS9O?=
 =?utf-8?B?YXZlSnVLSUhyZGZJckNncVZFM1p0OUFQdHhvenRnUmROVFhiNWNFVWVmQnlt?=
 =?utf-8?B?NStuNEJwZzB0YlduNVpKLzI2UU9pSEM5RlRzY2I5MTRzazBvQ3c3aUtQZUdY?=
 =?utf-8?B?RWpsUk9rSkxoSzBVYndybXd3Q2h1ajExYXkxUFdUNlRjNXlTaDhwZGRqbE1G?=
 =?utf-8?B?NmMwbGp0KzBZMDJqYWtqcExIdmhQTzRxcGR4czdZZDZNbzM5SFhXK240RE9C?=
 =?utf-8?B?MHhXSEhHemxQNWM4ZE14VEhGRXF3S2NGako2ZSthUWJwOWJ0OW1EWWF4T01u?=
 =?utf-8?B?MFE0UHZYOVBZN1NPR1d6cTdya1lVYWhYM0kwK3lUZUZ6NHJ3NVYrWFVXOEhF?=
 =?utf-8?B?bnJFeE5PL0FmOHR0OC81Z1J3Sk5vUHhtS2dmOWU1bmxMVjZzdWNCaDBrYnMx?=
 =?utf-8?B?NFBKRmEzZGszY3FwbExVUkt4NjJ0aXBKK3FLbTFBbGJObXM2VVlzNWc4NGNQ?=
 =?utf-8?B?d1pROGtVOXF2eHhrdlZiM0g4U2M3NXFtRHVmTExyc3hDNWlBeUxYTUIzM1RG?=
 =?utf-8?B?VmZjZUJ2Sjc0V0RYb3IxTFJabkY0Mm9XZXVLWWhLait6UTNZS0VNOE5xcERL?=
 =?utf-8?B?VE9oNytlS2lGSzVRUXdFYm9hNFpUeERGbUZvaUNmVGVMUUx4ZmFFZUgzY3hP?=
 =?utf-8?B?ajFRZEdheENWc2REZks2M3VFSTBUVEdYME5ZVDJBWDJOT3hHdXhRblZkQ1BE?=
 =?utf-8?B?cm5SOTk3Tkp0SldlTEZkQnF1dkFUY3JVWjUxMzJxVjg5R0Vvb2o1R2NlVE16?=
 =?utf-8?B?eHlqcW5jSDlNZ3lrVU54K3NadG4rU21RYnlKVFZVWGRKc0kvUjZUUWdGNUNw?=
 =?utf-8?B?SWo0MUtqMGlOWXIwZEdSODJVQWhUL21Xa3ZQcXRhMUQwT2ZZbFhCU3UxVXR4?=
 =?utf-8?B?S0cvUjBJcW1WSVA3eXlEUzVzajY4QW1BMndHMytERjBnUDhQVXU4c1lzTmNv?=
 =?utf-8?B?cGVXSStIK3ZHNEtPZTFHOEE1UGdvZ2p4WHQxU2xlQTJxWS9UUkpTamJPOU5C?=
 =?utf-8?B?ZWo0UVQrR0YycEFURzB0Qk9YZ3E1c0RuWWVPOHJhMHIya05rRW5WNk9GVlJG?=
 =?utf-8?B?bzZTc3ZQbTBPRG9sUHNEV0kzbGxIRGdnQWFlanZiQ0V1bjY0V1dUajJpcDMw?=
 =?utf-8?B?V1ZZSXU4blh4dGJ4eGlRREd4b21qQXdyUUtSUjc2YTVMcEh1N21ucmtUaDBi?=
 =?utf-8?B?NHZQOHpaZ2JnY3E0QkJvOTNhRWFhTU56a3BERWphTGQ2cm5vRnB2YnpQMm0x?=
 =?utf-8?B?YW9qeFpLY3dwbEs5ck5MYUNQOXJ1QkEydTgxOVhCY2VOSENXckloMWlURWhw?=
 =?utf-8?B?REFVZTk2VndjK0ZYVzd0clN3QlIwNVRORXdONERpdE9nUzhhVFJMVUczQnZt?=
 =?utf-8?B?WHBud0EvU3RGaWptYkVwQmpuT0NYNVNXcnBHbzZjanV3S1dpemtrek05WFpR?=
 =?utf-8?Q?Kp8IJbYA+hv/cRybhVfkcM9PN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f41f92d-2f27-4183-6f6e-08da5a5fbd4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 06:14:07.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuL0mfLY161sG51ibLkQ5vonkdM/3wWYg4IIldLLAfdf51sPjTqstLKI0rlHFTObOvsGAiUXMp61s+Oo+IdJSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

Just a two nits - while the change looks plausible, I'm afraid I'm
not qualified to properly review it.

On 30.06.2022 04:21, Daniel P. Smith wrote:
> The function flask_domain_alloc_security() is where a default sid should be
> assigned to a domain under construction. For reasons unknown, the initial
> domain would be assigned unlabeled_t and then fixed up under
> flask_domain_create().  With the introduction of xenboot_t it is now possible
> to distinguish when the hypervisor is in the boot state.
> 
> This commit looks to correct this by using a check to see if the hypervisor is
> under the xenboot_t context in flask_domain_alloc_security(). If it is, then it

While (or maybe because) I'm not a native speaker, the use of "looks"
reads ambiguous to me. I think you mean it in the sense of e.g. "aims",
but at first I read it in the sense of "seems", which made me think
you're not certain whether it actually does.

> will inspect the domain's is_privileged field, and select the appropriate
> default label, dom0_t or domU_t, for the domain. The logic for
> flask_domain_create() was changed to allow the incoming sid to override the
> default label.
> 
> The base policy was adjusted to allow the idle domain under the xenboot_t
> context to be able to construct domains of both types, dom0 and domU.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  tools/flask/policy/modules/dom0.te |  3 +++
>  tools/flask/policy/modules/domU.te |  3 +++
>  xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
>  3 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
> index 0a63ce15b6..2022bb9636 100644
> --- a/tools/flask/policy/modules/dom0.te
> +++ b/tools/flask/policy/modules/dom0.te
> @@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
>  admin_device(dom0_t, iomem_t)
>  
>  domain_comms(dom0_t, dom0_t)
> +
> +# Allow they hypervisor to build domains of type dom0_t

Since it repeats ...

> +xen_build_domain(dom0_t)
> diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
> index b77df29d56..73fc90c3c6 100644
> --- a/tools/flask/policy/modules/domU.te
> +++ b/tools/flask/policy/modules/domU.te
> @@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
>  migrate_domain_out(dom0_t, domU_t)
>  domain_self_comms(domU_t)
>  
> +# Allow they hypervisor to build domains of type domU_t
> +xen_build_domain(domU_t)

... here - s/they/the/ in both places?

Jan

