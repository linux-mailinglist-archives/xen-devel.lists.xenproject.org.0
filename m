Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF6640273
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451555.709320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11gH-00053u-GP; Fri, 02 Dec 2022 08:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451555.709320; Fri, 02 Dec 2022 08:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11gH-00050u-DQ; Fri, 02 Dec 2022 08:46:01 +0000
Received: by outflank-mailman (input) for mailman id 451555;
 Fri, 02 Dec 2022 08:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11gF-00050o-KP
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:45:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb3b4d5-721d-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 09:45:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8706.eurprd04.prod.outlook.com (2603:10a6:20b:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 08:45:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:45:56 +0000
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
X-Inumbo-ID: bdb3b4d5-721d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0m/ahViPGORYEKeUYdwt0+L195+dqmK/swdECNrWeUJHSBAeyKVf0oHtMD9nXYroay/LtzPqPoDyBvNBviioOmrXqrw8L9F7kyxN7gypiyP+AGgvikY5kJ6SWghPvXu2/TtzgctNEc4/kU5LEd7eQidvPmchwdWAMsWlrfqQNYOnKOYUF12BZaLS3ch4TFh3//ak3WTYLd6T1izRWiBk8IYL45aKLGKzJqfa7YGU5Yxggi7cJmh/G0qJSV7EGGMSFXvRXczjTTshAq5LaPOvp+iyMOhku8w2FVq1nbwQORSeWgPMuD78zblPIVQ9aL3j/3GqkclVvdqz7N7Z79Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfNZKKlh54Jw2rGhQy62ITEtVewVonuE7OiRM1TF8cE=;
 b=eC4SOFHtbSptQnq1l86T5xzRaU9XiebU9kniLFS0hCOEBfXA/3zkaZ6h+vLXG90tYdsZFIrSdcGbRTvXoKR6eOaPaRx9iFU+BWaBp6lHIvL+2EBzApe24RAWmC2wmfBYOX75ym4hKDGaMzbixzxha+bFvFmIrZ8xZc7gSsZOGW27G6iOvy7suAik7uGpa3dwMCC/Xy4AxSl5tykcBlnK2ThXRzC8SEi8KE97HxyofhegxTInLGB+6q6MOWx/zBKJ/4qDCts449oUGi5nQIG9+AM7sWM7TpLGtvlHeZZAsT8aXqULS+d8fNgt3imF5nTzeW8S1Qe8zYQkAhHi9iSDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfNZKKlh54Jw2rGhQy62ITEtVewVonuE7OiRM1TF8cE=;
 b=LyO+WKhNqSDOAPD23sgxYqW+tpAXFRqNFofoh8ci4sF0Vu3ojT+FBtxLyT6prDyGR9EUNShb3oPvoQY8GMeA6KUzHuBhmrcElzxJYqhPriGGd1zVSoy6hM7M/DoTfQw61hwFBqTxTGSSwa5ad3FpOybxqzoJ5rBRGhyw3DHwlqrL2KLrWTSEe6C/wVWTIMvznzEquG26HGKZxO8mR32fGMROtopxBh24r1CtvHMotil81/Yw2rf5t7li6Qxbu+oBrWm2nPsmV5W7NfuQfApT/Py2SeK2fOgIoocCCjuCzb3Vbn0+Jz+F0eKd+/8A6Q5EQvuK2+nPrTeoQP+rDRZJXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a995f3e8-eb40-36d9-9d3e-95bfc3e7f75e@suse.com>
Date: Fri, 2 Dec 2022 09:45:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 06/21] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <cover.1669888522.git.rahul.singh@arm.com>
 <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f020ef0-44e7-4b8e-a95c-08dad441a0c3
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdFp11jk3HU69BzTNII+deSW1jvXs0SLu3GD3wmQcV6Khss09Pe0Uc7P6t6W0qgM0JAZCTMc2rbllZleHCtmEcA4izl5IyLCqpM5k6rtJbciKSJ0Kde335vWP0wW/dFtrZ85yH0g5vr2I07iVJmk5SlaJ7HsbQ40q9PjvaeppGZsz9sLIeFWe026FThWLZPcYN6LSH9/pXkiQWXDcGk67dOgZfD5y4hTi1MsNxyZBXMWCJE1KwbYFbK5UHDoz1Wbwfh2J5YSTHDfXg79KfkECZVPMQ//GLJmSA2m6P5FGC+/cxvXiNqOqblXVyK61SO1dXo79VKh+IHsGu07mmpSa6D/VUOVZCMuCgHCsBS86RVRYQla65NiE4scvnSW19srtc2x9t3fHyoG+CuxjX6lEXpRo+E7eAcRrFypI1hPGvLZXtXMR8IgVmn01WFgXVX+HApH0VKNtJoxvzhsO3L0wAguazd13u6cIp1Y4IDDjAtbk04YIG3hzEzm5Hx+DfcLKfNdxur/3RKQJipq4MtCV2hK0RlJ7W3wBk+JCK6PpkgosqMNZIsTUdilguOhy1DLKXSMv2zZPbq36nERaNsqFOLtyFE1N1EfpCq0rtOuQkMPrQ3Bq6PFCAUXRHJg0dsXkK6vU+pyRuQrh7Kg+KqhAuvgYxtqXNNyLqo55nO88Vsktg/h/RmWDy2kgngrYWT+SbzPP0B6KFVNgtzcH0qUIpTRhHpFTuZfhBq071Q5Gpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(36756003)(6916009)(54906003)(316002)(83380400001)(5660300002)(4326008)(2906002)(66476007)(66556008)(8676002)(41300700001)(66946007)(38100700002)(8936002)(31686004)(6512007)(478600001)(31696002)(86362001)(6486002)(186003)(2616005)(6506007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2tIaGVZZVFob1ErVk8yZGpacnZCQk9sdmJjRENvdlJxdkJTOHpGTy82dzI1?=
 =?utf-8?B?ZVI2bEtFUno2Zlo1MW1uU1RVOEFDaHZGaG16NWJ3MGtVaEYyZDdKNnFnek1u?=
 =?utf-8?B?ZHFoVFMySVNETndma0h0MVVjbjJlWCt0M2trMjFIdml4U2ZGRWx6KzZ1NVhY?=
 =?utf-8?B?TEQ0eTlNZllWSzNXN3V0WVU2c3owdEtzclRXZlNrSnZka01SNWNHYnZoRTZM?=
 =?utf-8?B?RS9OMkFnMmVZK0tIajFPVFhydTVUdHJ4eHBUeHdJRmJVWmt2RlZDczNlTllW?=
 =?utf-8?B?UGM2bXRXVG0vTGhWNkR0V1RjMXd5RXFXRU9sYmhKOWZZT1dVUEhMYVI2aXZo?=
 =?utf-8?B?ZENXejB5QWZwNmFtWkt0UXh6ZXJMbXFVeG85NEpMcmg3YktBUHhyVnpiNm5H?=
 =?utf-8?B?YUdxKzBkYmYyblNQQkRQRTA2ZWx3MWkzM3pQNDZleDRoNWpwZzk3TmdjZkEw?=
 =?utf-8?B?bjc5WkJuYnpBUC80b0hCdmZsWEV2clhIMWxyZ1dhZHhsSmNDa001aDFEMmZn?=
 =?utf-8?B?Z05obS9DVytydlBIczJUQ0tuZ3JCN3Q2MGxPK21UdkVkZmlXeGZNajcwVlh2?=
 =?utf-8?B?SE56RjlGZnBmWXp3U0RIT3B6TU9SOVduMXNyaVF3ZU02OUJSdWhWNCs3TFgv?=
 =?utf-8?B?elFCN1k0bW9zQWVLbURNVUpoV1JubmNWZndJUXFPdEVZMGRqL2ppdmQ4MUtV?=
 =?utf-8?B?NW40SU1BSWx1VzJsNXE5MGwvWVFUL0NqcDRQSGV2Q3JnNUtBbmNmZ3RNUGtB?=
 =?utf-8?B?VUhrTmRHUlNnaVMzSFhyRFIwaUNnMk9nNWNadXkrb1hyUlNia2dNcGNxRGVH?=
 =?utf-8?B?L2tnUjUrdmErVVN5S3M1U1RrS0U3Q1lxVys0QkNNNkd5V09TVHlMUjZ4eVli?=
 =?utf-8?B?RDJWYnBsY0oyMTluS1ZlNXpvR1RVTDdxMFQwaGZoMUNIdnZVQmxjbnVtdk5J?=
 =?utf-8?B?ZUUvZjRFSHJBQjBIZWJISjdsaXArQ2pzak5xcW1BQmdnVDQraWVTdDdtZ2J2?=
 =?utf-8?B?aittRmFUSS8rNHU0Zk96NDNUaHRpK2h1Rzg4NHNsV0M0bmlLeEx1TlpYekd2?=
 =?utf-8?B?TldBMTRldFZPY1dMOERlZGhQQTJRdWNNYk4yYlVlM2FnVkV0dGxNUEhOMXh0?=
 =?utf-8?B?eGczZ2RNVmsvT0lVM28waGpBek1SZEI2NVlVV2Mxbkg4bjNtdHB1b1dxRGtl?=
 =?utf-8?B?UkErUG5HTC9rMktQQW5sQmJtM1RUZWZkeE9wVkt4elZKT2s1bU56c3R2V1lT?=
 =?utf-8?B?MnNRVEF3SEVOaW1IRjJLSzZUZy8zcjdqMU9pbzhMeG1jVlJ0N1VETXlWL3R1?=
 =?utf-8?B?Y2R4bDBibldnY2tubDFHZXQ2aE5UM20xd1dHSkFZRlZNZTZiVEsyeVowODg5?=
 =?utf-8?B?elQvbVZqYkxKMnpmQ1lDWThJSDRYR0lEaS9CSUk4U0JGMVZPdUU3UisvSURx?=
 =?utf-8?B?bk5rLzFrNlRneGo5Z2FHYXFmOEFpR0ZSQVI2L213dFp0V25UelhVZXlUWExq?=
 =?utf-8?B?ak5ZZERmdno5bXM0NEV2cU9wRS9La3V6N0E0Z214SDNRRmlXODVCSzFEMjI4?=
 =?utf-8?B?Q0s3Zk05TGpBNVFrZnp6Y3Y1Y2R4dm5rQnoxaGdDeHU1eVE1WmNCdG5wZERV?=
 =?utf-8?B?ditHTmhzRlA4eDUvdE1pTyt5MzdPdm1oVWRnM0IzZVVjVk5EOC9ZODg0NzdB?=
 =?utf-8?B?bU9DOVBVYmJIdlMrUGNjbE5FZVhpRWpWb2tVTmNndldON2xJT1dUR1RBMzk5?=
 =?utf-8?B?RHREelNiUlQvbkxZcDVzMGFrYWJUSHdVcVRpdnB0dE92YlJSQk11am5Mc2xt?=
 =?utf-8?B?R29HT0l2U2txOGVqRXgwc1pLWmtBYnJkVXRaWXhXUVYwYVZEc3hRMk9GQlEy?=
 =?utf-8?B?SDlaRmZmeUVVQnhKdmZ1djVWZHg1NDgyZHJFWWZ0WFF4eG9rMmR5clJReE00?=
 =?utf-8?B?dE1Ga0lTTG90M3VLWXk2QVZEUmIvSGVzMWRkVTIwQmZ3KzdCYUJDSmFIb2dm?=
 =?utf-8?B?R3J4bWlORGRLSWkvVnpCcVRFaE9JR1EydmtsVEFENWt4TDE3V09aWmlnL3d3?=
 =?utf-8?B?OVdJZklvRXc1UzlrWXM4bjBRWmZNTk9vTkU5eWRuNGQ5UUo1eC9lSmZNakd3?=
 =?utf-8?Q?jEv53d6GJL1few5c7Yr1TZlXa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f020ef0-44e7-4b8e-a95c-08dad441a0c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:45:56.4142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRHwwCJ/fgyrDUs5hBjzu+Mb42wEfUZRjRBIc0NJXFGP+85KGZJjGmAly+gaBtw0vvBdQIvqdE9buDD/DDGIHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8706

On 01.12.2022 17:02, Rahul Singh wrote:
> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
> enable/disable vIOMMU support for domains.
> 
> Also add viommu="N" parameter to xl domain configuration to enable the
> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
> for ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  5 +++++
>  tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>  tools/libs/light/libxl_types.idl     |  6 ++++++
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 47 insertions(+)

This diffstat taken together with the title makes me assume that e.g. ...

> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -179,6 +179,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> +    switch (d_config->b_info.arch_arm.viommu_type) {
> +    case LIBXL_VIOMMU_TYPE_NONE:
> +        config->arch.viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_NONE;

... this constant doesn't exist yet, and hence this would fail to build
at this point in the series. I notice, however, that the constants are
introduced in earlier patches. Perhaps the title here wants re-wording?

Jan

