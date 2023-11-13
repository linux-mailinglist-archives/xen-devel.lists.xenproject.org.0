Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF17E9E31
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631607.985122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xd5-0000WZ-DW; Mon, 13 Nov 2023 14:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631607.985122; Mon, 13 Nov 2023 14:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xd5-0000Uu-Am; Mon, 13 Nov 2023 14:09:31 +0000
Received: by outflank-mailman (input) for mailman id 631607;
 Mon, 13 Nov 2023 14:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Xd3-0000Uo-BX
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:09:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e239b2-822e-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 15:09:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Mon, 13 Nov
 2023 14:09:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 14:09:26 +0000
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
X-Inumbo-ID: 41e239b2-822e-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8Qa6qyPZ81gQ7xfdmet/q+iBP/W7+3TMRP7uzidedK6qnMcmgwhQWRke/r9R6QMkYbQt7TxmxIOmW7PB9BolXC077v4wBGUe3q+jWkQ93WpHDeCX4iJf1Ohy3AgH9ZwqM2kEGBghqtqd9v9PohX/N9LBx5HBow8sDXNX74gIx92WCphnnsPCLI6YNM0NzuB8XisYAqv+y2hyYB9V3hFSsdqe3q0bkd6ebc6VmgVMQlDTVvvBumZy2w+kNcKgjfKvS/GOV0l6/22xgEeHZymZ8UvreAPhDGzdQbQrYjWBVjdh3KeLLgBL01fARqECJkHQKf61GAowiFTET3PXimKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQBxa5irDlgy6TrWgjMJ1O5liy7STpDHdZSG6bICTNo=;
 b=AfACGZu82h2acPTH4GWPcFEX+9YZrwfqk1ct0wH5XNUq50eJznv0c8CjVeSBKYZHLwLGqFw0zCOz9DiLjGwWTF6oJNXNtrKoZ0WzfUavTOkaztKIWa57TpeBPTckIvRmJWclD39N2q8Bu38sHvZVJOoOi3e7nk/t9r/l8J9lExzqx8W/qDKasEpmvSugwMuZpNtmxdhCdGcLqAgMXyjIIs2BQ2Qj2mQbb08zuH9dq9gJFEL4daujmhxMa6ggzTRUZuDTEbk/MLoXJ8VO2PamIscX5BJpulO8gTyGcpJHV7BJBFiKw9IHVYt2KcLRoIc2iUvGexeMTlKzlLO6UVMxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQBxa5irDlgy6TrWgjMJ1O5liy7STpDHdZSG6bICTNo=;
 b=trHJ2Zq5zd0AHWXL4FhV1G8UZQi+VDqseUNLdcw9qhJwANEBLnsfFaTJwLJM2wumbAcULsHlS3PvC3H7aZ16VLoAyIgUkgirFvxc5B+Wyd01SmcJQYD4aUKqPC6rCTfMO2sxo9HXYcvXtcipd/yrwH9QARU/QdL3vaPNvC5R9JVITc74+WLXER+4gmfO3ZAqJtlafZznmX8kzMJOexI7X4hk2sdvcYzge46871t6d2XgdJnib655h4+Uepg0vQ8aLtjYXCgDkb6dHLqDcsLEbXtb6ekGY/IS8yF7RdPWtVdayURbefd6ekUXkej93KVxdrjAvRfgzkbn7+P6VU6l4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7df2987-ab46-bb09-4440-e743018561ad@suse.com>
Date: Mon, 13 Nov 2023 15:09:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: f931b24d-28cb-43c4-644a-08dbe45224dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmjX06g2YBAd2Cr8a2HsZhoqsAKhd0VvT2VOtvmJLyNXGr6o18X3Bpe0VI83eqqYAxvo9s5v7GHy11Q7WSBsQ7sLhosxPHGgjIGwDN4T892OslErM7A+c6IfS29WjATLxLjx4iHPR1yaLsTT6odnnFUWl1/LXGOiR060sjTTcjDY/bNaLnDT7/CT1ik89GweBdWMofD2Nlh/awydPUiogZ0+WmyqXY/5DrCUXzAVVBnUXTEa7Jf8QueWRuIFvdX/FUf0GYyp48uorCS9/gqpVisLyfW30elg6kG2YThCq8FlmFo//rD1GMPyWhmEurnreADsahiWdb/BZGw39OlYXyMy+7TBfRVOwOykIdqfvoJVSvTEQwo2TUY90dD195YhGJBMOZ7Dlud/NP3fh7tGkmX/UDis+T0qdRjt78s2nptHb1PhTBxmVtwBantl5cov67+hRKbDRnj+KrW8OdCBJBUDRsszTIkZ75x+y+vB2U3zvwtWs8prnAfM5wtmOG8OXA4XgstEtK3Z7b75Wriqn8PEHb7ru/dA5I2foeIDxfAN1xKDPHABIsrEdjHbSBuYg4Yq9U90yHWZTsIYD0BhgjFFt/+qAaU35vHV1tvOaRWeb8DdBTuk1ptX+mvLChmR9VUyrZQU9MPmVO+tFmigTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39850400004)(366004)(376002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(86362001)(31696002)(6486002)(478600001)(38100700002)(6666004)(5660300002)(2616005)(26005)(7416002)(6512007)(31686004)(6506007)(53546011)(66556008)(66476007)(41300700001)(66946007)(54906003)(2906002)(8676002)(8936002)(4326008)(83380400001)(36756003)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHcrTndONThkb29MNnNrdVRzb3VoK0xCZzZwdFFPcGgreEVaaTRrTU5KUkYv?=
 =?utf-8?B?dU03Zm9pZTYrM2JSVnE0RWpHK0VGVXhYTFlTcmpNQWFSSU1yN2hRM2xpOEhZ?=
 =?utf-8?B?VDNIdnJuaFRwOXpreDl0cktRcFg0OUMrYjlDbDlGTDdLalNEOHJmamJNK2Rr?=
 =?utf-8?B?ell3WFhsc0t1eEMzcWZCWHZuR2gvVnVwek5yWGxrUzlYeEpjdlBKMHBENDgv?=
 =?utf-8?B?cXFUK2JrUlFyNW4zS3ZqeG1RQ1ZCUFVQU2pwSEhnQlJSeWxzR0txa3pVbEZi?=
 =?utf-8?B?bnExREtaVjJkVmNGaWE3RCtLWDNaT055L0U4NG9HcVNlL1JmcVd4QkptZVFq?=
 =?utf-8?B?Q0pSRTRPUTdjNWFZbnRhbjF5ZzI5dEFOYWI5QW8zZEg3OUI5TEZ3QlA3QStx?=
 =?utf-8?B?cERVdjEvRVVGeldtaTVEckNDbmJ5QUNNQnFCVEp3ZUMvdUV0N2E2dUdBaDMx?=
 =?utf-8?B?RWQ2MXo2dUc5RW5JYVVjZmdOQ0ovSnkzRXp1MGdnYUVrRVFUeWRMcXYwemNL?=
 =?utf-8?B?RE9hc3hscmNXWXFmTlRSa01FSFY5UUk0dzJpanpQWEk4QU5xQWI1OEhrTWlP?=
 =?utf-8?B?aG5zS2NzQTROM3Jma2kyQStqcCtKcnRBcXRueTJXU3NWUlBFV0JVNEN3NzJL?=
 =?utf-8?B?TFJhS0hJbkQva3V6a21wd3MwSVkwcjFDT0ZuUkhUU1VWV2UvdjhtZWg0SFpn?=
 =?utf-8?B?ZGJ2NHZJYW9CLysrNWU3NlEwUWVtNHBUQlBtTjR6WmExQW1KdGNsVlRxdTNQ?=
 =?utf-8?B?R2NIeERFeDdWeHRLQ2V6V1RZOWpqRXNHaXJlSk5PVGhQN3hhYlc0dzh6RXRV?=
 =?utf-8?B?ME5kdTdyc0dRV0xCbU83cStpeC93b0RGa0pqZzZqZEhYVU5rYXZXTUtDV1NI?=
 =?utf-8?B?bUlWVGg4R011aDdlMnkvYW13RXJidW83Ykw2TDdiQll5Mi8zR0N5OG9YOTRm?=
 =?utf-8?B?NjU1THV3VU1YcGFnRzN0SDArclp4dXFxVGpadUxoMDV1NGQ3bTd5ZVFJQ0gv?=
 =?utf-8?B?eHduN3BjdkREc1U3Smh1TGlWWmV0ZXA2NXhvSTJGVzJZc1RVNXdrdTU5dnFw?=
 =?utf-8?B?amxOZ3JRM2Zhb3U0MWNCcEFoUUNjTDlvaHhrUEVCcjYvM2lZWU9HNFBXWTQy?=
 =?utf-8?B?Nytub0s3V2pZeHB0ZGd6ejNBRnhZTC9CRlViSnZNbWlEak1WdThYdHNJZHhy?=
 =?utf-8?B?ZEZnb1FUSTVXclNpMGFTd0lKMEdsL3VzRzF0ZHZFK3ZqQkF6VGE4YnowUmYz?=
 =?utf-8?B?SzZCMkxybUt4ZjZWZU5kdkE2YUNYcyt6M2RubFZKbWlvcEdWcVVtQjUxQ1ly?=
 =?utf-8?B?Qk1vWHhyRlkvWXVmZU8vWUZubGp5M3dFQmsyN29lcnVMck4xd3pVUXpHYTV2?=
 =?utf-8?B?U2ZzY3JUV0p1V3RNVHFkb2psZ1BGdlRPMXVEUURxOE9SWmpUdkY1M0dMVWxP?=
 =?utf-8?B?aDJjQnNqQXYyZy9aY0tmUGJIMlpEbmtMcjdtR0YzRmgvRnFkQ1NNQlQ5V1pC?=
 =?utf-8?B?dXl0U256NGFOUnYveVh2S0U4MURTdVRMRFVIRGhBVkRiNVRIZ1ZLMVVPRzUv?=
 =?utf-8?B?aVdxQzN1NzI3WUgrSjZ4Y1VRQlR2M3k1cklydVhDd3NoT21MdE5ZUDI1MUVU?=
 =?utf-8?B?cisxRFkxVlEzMi9tQ20rZHhCT0lXN1dLVXRIaDBBeExseVRDdWNvSzRLY09p?=
 =?utf-8?B?NStPN1NUWVJ2WEpJQUNJUDBxdHNnd3Frd0Y4a2ZTdTl4N0pxeUlwQy9aVXZs?=
 =?utf-8?B?Y3VlQlhMcjNrMFJUWnY2YTY1eHo4ZEZBN2xzK05VeitxUDFtRVRBSnkvWHAy?=
 =?utf-8?B?elcvTXVic2VXeWpnOEdydzlHNWdaL1A1Q096YVRXZllOYkZVUnlkY3A1M3o5?=
 =?utf-8?B?ZGthSFMvTWlPMXU5cVBTZG1tcnJwenptcHBmc0FsZ1BzQnZZc2FHZkFyZFZ3?=
 =?utf-8?B?TFNPOTdObDQzY1hQTzdNN3ZTRjFuSDgwUDlSSlRWZENLR2lpMEcrVVFnT1JZ?=
 =?utf-8?B?WWFNTERDTjZQNHNoVlYrblN5dWxOM3RsSnd4UDNVbTFyN3NEejZGRXViNWdN?=
 =?utf-8?B?ZjZ0TisxR0I0di9KcDdpZm96Y05qUFVGYlp2WE5ROGJKRmdoZ0haZkNwaUxk?=
 =?utf-8?Q?09HuiEXSG9ZZDANSc8DFyqXAb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f931b24d-28cb-43c4-644a-08dbe45224dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:09:26.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZqinABC1xoeG7VkrCZgrccmC4ZA027dDBQybod9VWy8E2qbX3dZ0udT5BI5DXb4KK4ekMTUrvOFqtPrpFx6gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

On 19.10.2023 09:55, Nicola Vetrini wrote:
> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> compile-time check to detect non-scalar types; its usage for this
> purpose is deviated.
> 
> Furthermore, the 'typeof_field' macro is introduced as a general way
> to access the type of a struct member without declaring a variable
> of struct type. Both this macro and 'sizeof_field' are moved to
> 'xen/macros.h'.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v2:
> - added entry in deviations.rst
> Changes in v3:
> - dropped access_field
> - moved macro to macros.h
> ---
> Changes in v4:
> - Amend deviation record.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
>  docs/misra/deviations.rst                        |  6 ++++++
>  xen/include/xen/compiler.h                       |  8 --------
>  xen/include/xen/kernel.h                         |  2 +-
>  xen/include/xen/macros.h                         | 16 ++++++++++++++++
>  5 files changed, 32 insertions(+), 9 deletions(-)

I tried to commit this patch, but ...

> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a27..28d9c37bedb2 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -246,6 +246,15 @@ constant expressions are required.\""
>    "any()"}
>  -doc_end
> 
> +#
> +# Series 11
> +#
> +
> +-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
> +-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> +}
> +-doc_end
> +
>  #
>  # Series 13
>  #

... this change doesn't apply, and I also can't see how it would. There were
no dependencies specified, so it's also not clear on top of which other
(ready to be committed) patch(es) this might have been meant to apply. Please
resubmit in a shape applicable to the staging branch.

Jan

