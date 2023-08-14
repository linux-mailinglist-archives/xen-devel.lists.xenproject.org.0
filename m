Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EA77B2E5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583307.913440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIA-0001bL-1y; Mon, 14 Aug 2023 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583307.913440; Mon, 14 Aug 2023 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSI9-0001ZI-Uv; Mon, 14 Aug 2023 07:47:09 +0000
Received: by outflank-mailman (input) for mailman id 583307;
 Mon, 14 Aug 2023 07:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSI8-0001Z5-N7
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c401486b-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:47:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7503.eurprd04.prod.outlook.com (2603:10a6:102:f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:47:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:47:04 +0000
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
X-Inumbo-ID: c401486b-3a76-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRWNntG5/P9CuyYdptZUzan6QVnPEez8nMIQ6mvoDhSSkBNNefS28b5O96X1CN4X2ngnqZA+CRnIeI3i9PZ/JaLCBPB+Xg6D86zVet+oIAKyz8ADzhIMpVoD4cUh/hTELxIv/EEkHx4lzZI/jqDzfhz6dmGURdHaWUUY++09kJtTEwi2yahcpEZgSNESY67Ay6OY/YQhqqVAZvPgTmp0VUyRdJrlrR9XbP41fou+38Zr/fiebVYZvC0UuWDabJtoCwYfYYyj6xXSbp9v2TS25RKk3mb4v77JruvEIqWB787gtIpOgPTOYXCYn/kE4ra7uuPnNL/ya0tXrufb9WIzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Kzc73uKuSH5JXOpxI9il3tZEXdtHLPQsJnaErBBvaI=;
 b=BhsqpGl6qQ9Hf5kUZ/X7Q1Rlv3aQh7J/LBtVK8Nng7bTlMGcEoyvXUMfBQaP8UTRezlJ98Awb6+Bzj6HVkciJXTad+LrRt06fVidYNBKYJ08rK3GYGZTe/AFwfR6UU+A2mqjo0s4I8YeodrW1LRiOIoS3tSClItYuUVPCiIZP5vA2RbVjarFyYsMr9Gwl/NtIlRIxUbQULIn6KnJ8gnEtaMW4lcJS2E/9oj3fAUWFQV1d059rNXYChalNAWaNAnqT7bLZ2qsnZC1hIio6xZk7Lg/1T4mgEgW2pqjuUaWrqJtmJn0wUhavcRlS6X7+GZh/jvAEqPnRxi1ntDSm1f+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Kzc73uKuSH5JXOpxI9il3tZEXdtHLPQsJnaErBBvaI=;
 b=4JsqLbPy6QbybRFTltQCJyKOZY8S9EWDzIRc5F1c43mAnfDApfln1IbhxOeogtTYsmfKEeL1ev6DhbBBwpEPs/5O2ezpSEFoj8aQLDgNtzVu/5JOOVnmNtUTRlPPUyLcX1lvd6NQGnylNhtBL1wu5+yj8MPO2EHOHAn1GHoNB575ePF4jRTBbBblMli+TwqpYhH/b63EbSs7KXKTda9knT8BVt/6XuDjRUt/glyLVE1ow7MXyeDGBHzYa05r9iLT3G7Ix3tZxi1gEHGdwlLV88j/XEevPdzzCT3pz/PksBFP7PKbkMcTwz7rZNcgY9XQFOiOUs1qmq9QSp30r1mJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d021c6a0-6826-351b-1613-82ec9ad85868@suse.com>
Date: Mon, 14 Aug 2023 09:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 6/6] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfcea1a-8a13-462d-d3da-08db9c9aa713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f0E9LVKfkEdta4TE1YpUc5RvPOQvsMmKBibTQDuTG34Ss0liHK9HPxxBY4NuBhBgI9xxU1tCja8Z5hCLpGZ/utfs1YTH3MHzCgNLggcUQJBYHWpmW4qdqt0vdf/tMPVH0jxIzOh77DhD6aKh4I8TVUtgkrGnlv8x/dnieffPYMsylIIY0zSLidKrVoVVUl0gEK/3g51Oh8BBGrWvBquC7fZlmv1I8L4eoFhG10NSHgJeS46sSqP8EUns6Vxh3vDmKd5wu4rYoUCOxHs0ipevfevcqqPyOnzIr/bZCn+LSwovPq8b4uxsPp25bDjzr1tWvotFLd4/4hO+gHFapDKVn70eru6ruUE29CdMA/9wBBJVElsaBIAdUIhwtPbB2cKlfWraXnuA/7RDkaYWYFayiX5QbyaJutpIYIj0BoH3CR8fEJKykj5ekh6LUIH2rz15Q3ii85apPi7ptf0SO34hgXPN6Tf7xeLsNxlNcy5ckE+Pnsoiu+ZmWcbnsOT89hDxXoGjuwj0XfyZnBccrmaY+EDvCCcFXpUBMYtzS95kVrz8KgbJ8iUF0UWd8YmRFWw62iXgxTRPKbnXOV031+J4VrhM245Xr36LOFfG0l+0YmaZiPeKnX9R6m0wa0sqGwvLJWC3P601JvEVX67+bjdOTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(186006)(1800799006)(31686004)(6486002)(6506007)(478600001)(36756003)(86362001)(31696002)(2906002)(6512007)(26005)(66946007)(4744005)(2616005)(53546011)(38100700002)(316002)(8676002)(66476007)(6916009)(66556008)(4326008)(5660300002)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmhKcXBmaHpvR1VieFRLeWhzNTNlNk10NXNKWHN0MzFCbVlScG4rQ0h2V3JV?=
 =?utf-8?B?MTcwOHg4T3pSSEpqc0xodFB4eVNJenJpKzJyVU9FczdvZEE5dk1YSDV3b3g5?=
 =?utf-8?B?WE1ROEV5eFNyclVobTlBc29MZmFLclhkck1KLzdMd3J1QUpSVEdDREh0N29a?=
 =?utf-8?B?Zlk3TncrcGZGaDN5MlRrTDhxdDFCYjhHTkhlRU1NSm1vTXpSY3czMFBMZ1lC?=
 =?utf-8?B?RFVROXVNVk1QZ1NzWVhHaTV5RmNLWkM2aDlKUHJ1OWYzTjIyelhzcWdvVnNp?=
 =?utf-8?B?TlNJeG9Oc0VNWE9oY1p5c0haMDNFT1plb294VUZlS1Ard0FVOFRrR1k0Qjdl?=
 =?utf-8?B?NitzSEdwRUZKbHNEZFVPMnVOQjBrVkpVeXo4QjU1eC9DbzBVcFpGWTlXVVFR?=
 =?utf-8?B?QlRlb29teU1RZkt6aVd0Q2IrM2UvMVE1VjNWUFlPNGJ1N1JEWCt6OUY5NUkz?=
 =?utf-8?B?anBUbVQ5SS9zUEhuM3VGbXJMZTB4RkJCZlNzZi9RZjBCOW5PQ2dPc1o4V1BG?=
 =?utf-8?B?ZGpOZEcrTXlsK01XV0NNQ21YN1pvU0JVaHM1Tm1vRkFxRmYvU0p4ZnBsaysy?=
 =?utf-8?B?aC9LMTNlamYrUFFBazhkS2FoSHlDaGpkdGRRa2Mzd0N6MEpEUzU4RUxzOXVp?=
 =?utf-8?B?SjhmUEY1WWh5UVA5RnY4SDJyVG01Nys2S21SSVhzcFl4a3FSU29HVUhsa0p3?=
 =?utf-8?B?N09Ta3VjWHRVTitjdE9hdDlIS25PamNwdWw0a0N0TXVadVBXV09wd215Zitl?=
 =?utf-8?B?L2JzN2h4RVFDWkxINFRsNkNCQndBbXZoNmFFcnNyOEZEamFPTWJlSzJueEN3?=
 =?utf-8?B?cE9vMDNnVkVxZHY2QmJZNDhvckxKTzRCMzFESmxUVWE0dHdNR1NaWDRRSXdE?=
 =?utf-8?B?dFlENFkwWU43YkEva0RLVC83TUVWMm5WZzNzdW40SlV0dUJEVCtLVUl3UVJs?=
 =?utf-8?B?cUl1enhLRXZDSjczN09Ob0xjandPQ29ZQ3RDY2M5MlR1SzlnbUhtTHBIYlFN?=
 =?utf-8?B?UUs0T2lWRkxNN0VKNy8rQkxvKzVKTThlTGU5dFNJK2hoSjFQVTdzQlJrQzVZ?=
 =?utf-8?B?OGdwK1Ardm5tODZRYllLSVlxM2J0WEdVVWNhYzFrTnNldS9ablQ2SFRKT3Zu?=
 =?utf-8?B?Uzd0eTdXVExvS1lDL29ZclEzMThoQWFYalkrb29SY0JIcUsyaW5VVDZpZmpO?=
 =?utf-8?B?R2dOZHR6SEl1T2FkKzN5Tm1lS1dNTDhmZkhtdE5RVHpoc1pRMEhpWGpxcGhL?=
 =?utf-8?B?eGhEZHBya2g0NytWdEYrNjhkUGN2WGJHcGxubXlheERocnRYUks1Szdnb3VV?=
 =?utf-8?B?emdySlJ4VUFBY21tU0wrYmJpUmxNYmduWU4rcFFHaVN4aFJtRzNxYVNqUWJi?=
 =?utf-8?B?T1EvUGJkUFAxR3VXVUVVUjI0WUtpVmdZcVplSU5iOHFPeWVwMHBzdXpuVXZM?=
 =?utf-8?B?UXNPYWJWL2VybEZIVkNWSCt4bkM0WGlVUzNkV3R6WmJnRWN6dW85WEZXUmZq?=
 =?utf-8?B?eGJjeUdKWG9ibEk4WEZ2V1hKcUVFdmQ4SDIrcmpNUk9yK2RiUTFsMUdFeTcv?=
 =?utf-8?B?WWF4TlVCUUlHM1dnSVVGRlgrc3BvZGJXSkRPNUNnSkFuOWZiMzRhUmJkQzc0?=
 =?utf-8?B?dThnMVFTKzZjaFZnOUcwRWlRa1JUbTNTV2EweU81Z1JiZWl0VFZGdFpQcTZO?=
 =?utf-8?B?Vy9lM0JJOVE5T2RaWWlZa1BVSFRpemg4b3dGREhxUWJMdHdhZnFqOHF3VTJH?=
 =?utf-8?B?cmZtSE92UDhkZE9DMzdtU0hzOVBWeDNvdi9NY2t2SjhnbmI4Q3JSb0dNOXhn?=
 =?utf-8?B?Y2NWRTI0UUUzRi9mZjUyYm90UFFYY0hDKzR0WDJxeTRLV0VBZUVQMFJoUmth?=
 =?utf-8?B?YzJrYlUyNW1LelQxVytlSjNqam5kTElYK1F3NXEwYjkyMkN6WGFFZVM0MUw5?=
 =?utf-8?B?R3NwUytZSFVwSXJCU1BsV0piQThKVHVud0lldXBnTzVVQ1hmOCszOEhrdFdj?=
 =?utf-8?B?QmFGR3N0SDlDSHFtdGVJVWxKVlpJMEtQQzBwb2tSSjlsd1BxT2d5cnpkRE1y?=
 =?utf-8?B?TWxVV0pkZWdXc09HVXpvNHlSdDBHdTBaWE9NWmJqUzRyL3lwZUdVZGpuOUpT?=
 =?utf-8?Q?qf4WtBX03lZY/1H5+eD6WXtm6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfcea1a-8a13-462d-d3da-08db9c9aa713
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:47:04.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSmmMRSgFZ4Z5IixO6s1DeYZZFmu1LQlVaJO6eOmOH/3Hc9SaxuqSQ3LcfroCMZDbbNnFiM4oIqI+grA5DAbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7503

On 11.08.2023 09:19, Nicola Vetrini wrote:
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -9,6 +9,7 @@
>  #include <xen/mm.h>
>  #include <xen/param.h>
>  #include <xen/vga.h>
> +#include <xen/console.h>

xen/vga.h, which you move the declarations to, is already included here.
Why the need for xen/console.h?

Jan

