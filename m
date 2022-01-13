Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFB48D9CB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 15:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257234.441971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81Ez-0001no-E6; Thu, 13 Jan 2022 14:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257234.441971; Thu, 13 Jan 2022 14:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81Ez-0001lh-AA; Thu, 13 Jan 2022 14:38:13 +0000
Received: by outflank-mailman (input) for mailman id 257234;
 Thu, 13 Jan 2022 14:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n81Ex-0001lb-So
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 14:38:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d6743ba-747e-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 15:38:09 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-z7reXLKcPQan4XjiJzb8NA-1; Thu, 13 Jan 2022 15:38:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 14:38:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 14:38:06 +0000
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
X-Inumbo-ID: 6d6743ba-747e-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642084689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5l7mYvMRindQ5jgt2KWQXZ2pHbCUeMeGbQPS1Rqtcc=;
	b=d6xd0Wqs1SLqkVlzn+50RTX1AMBSdiI0oJHoLqp54bZtq/oC58NNSm+kqC7xM+sA+lF1V7
	+0gnqnURr8R5DLmld4jBotlEhdpbYByFwmDtW/sm+Djn5q+vJCNKbhGlUtm8xELQAQhJpd
	LTnJzEZB5gCcv/IPAAwB7oabfmO5T4k=
X-MC-Unique: z7reXLKcPQan4XjiJzb8NA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7/t61jJw5tZOjHSMF6rAF09JAyPXCcMijSuXr4O2dPFJzEVOs3vVt4nfjRVlal+KYIWu/3wNn7SBnufX77jYsn8uN581UXVid8GSjj+NOLBOIQDLwr6l4REA/Y7VOkW4Ffa1OF//tP8iEc+2oxSUZHwGD7IiuU5DjyH9qMoHMyGP4DG5HZE4wC7El1kj0mTKkv+MWkA/IjSdiqCFdcnsNihsTuCc4CoZJHq9eriDnx2k5e+PsUYvEO2oCczyhJN761/ctCu2M2PH+0NLLHs8KUFarYi7LPVlTM4+DYZVNcjUibVhVlbGtf2xyQUldSi7IC1HzisVPxBnJB+exL8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5l7mYvMRindQ5jgt2KWQXZ2pHbCUeMeGbQPS1Rqtcc=;
 b=YDsF4O3oJfB6RS9S2nv9N3pn+t3ikEcxVnygvZO/Egz4BoNWIAqKoC05FeQ7yNkyk2ZGAr31KA6t9X9/MEDbT+ou1Ed/y07zQl+oAflARSYanpMF+wIaUAEAyanhVcBT5eOGR9scGnIzX4RyFpGz75+aHLoIx7dRhYXR/OtG6ZKH8Q8/7FI26zqG+Bx96kjjUHAZ7eFnaryPyiAAhXaxFwPlELoGeZNI68N7MbsJXlZI7dBtrf82nHWo3nCRzHqh9udibCzaZVOmGObfOFuortHvdVg2PBBN9isRW1HlcpcNIBDxhfex9fb9m7J/TazVC1u54FESVaf1VoFxnDgbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfbe31d2-4d67-d7fc-4bb0-5b2caf209460@suse.com>
Date: Thu, 13 Jan 2022 15:38:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113135035.23361-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113135035.23361-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0271b7c-fa9a-4ade-d759-08d9d6a24fd3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6175C8210C178127FB235600B3539@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d3DilSWuLD+3wcvmeMUh70HnEop5/D3aH9Wbx1PmDBgC63nDRBOO8VtcBxhf/Wj3vJFCuVSn/Q/x3NKLw3JJyQDoEJEApdj1eUgWU8ZNB8psB2ZyjQVhWNOzx5j50W3hfhs/Q4AQelq91Q1DI1BK/q5N/ZI/fCJFr+T7Rrl4GPHewPW7PjY9dW2WY/iI6/zia5tYb3XUiLWcWM1k0STIbo4N+qO664BK/m7uU+w4/QEelNil+mxZwM1ew15/WjjikWqzdIc37FEhw6y9EIRslxRO5vJ9b5zBPxu4VYOu5US8fi8BCRy/XgI5w2OWi3afgIBvNRc6oUjXpbvtt1NU3IETc40PGHrTesUbfv455gTO3nyNtRW+wBvFec4jrnbEAs7O4XJ5bHFhSeX7VulcqMKQaS8wbmlff+neG5k/pAhX3EqiT5lhw8+MLeBIOoksBfVD/Jz/2eQfWjF77Z55pIpsUId9P+FoWG8siv3m4pTBFoRnwAopNdA3Gcog+/DY5I2BnI7zuLx/Iu0Amfd3c77hyVMoXQzDayDBcVSoVcX3s47sBsnRn7MoGb9smM5pz44yGN8mpqihS22fZG+wdk5/Q34krhB2eIFpxzRRYAPsYcRj6kJ1cqd61TK+JVPMIbjsjBTbdrHD3i12u5PLwNzgV/Up+dWhrrkItdrvtyUEY4NNhFpvBSBvfS0jvaDSf9fmQ5yFaL/ixD1tNWCk7sS73K+7y+PyHh95JiTljFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6512007)(54906003)(53546011)(26005)(8936002)(83380400001)(31696002)(2906002)(36756003)(38100700002)(6506007)(6486002)(508600001)(5660300002)(66556008)(31686004)(4744005)(186003)(316002)(66476007)(6916009)(66946007)(2616005)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ZrdEZVOTFjSEcwVm5pS2RoVGh2a2NPejZNc1ZKZDVtNktrakoxdm04NTA3?=
 =?utf-8?B?M0x3Y28rWjY0L1hzaTYvWFhlNks1c3NXd0pMSVVEMmNvajkzbmNteXFIUDYz?=
 =?utf-8?B?SlRwSkxGMVh3YVBQOGxTWkNDcDJKV1lCOHMzMEd0WGJ6d3E4Y0lkcWVNaVRX?=
 =?utf-8?B?RjE2bTRmck1uZGkydVRLSExmUFYxZm9Gcm5ObWgrV1RzYkJ3N0JXZE93Q1ZV?=
 =?utf-8?B?cXBXTUU0Ui9aR1VYRXpVV2hEWVpoVG45OHlSVlhRZTRMSm1RU2FKd3hMdG5I?=
 =?utf-8?B?QmlzQ0hIcWZMRWFVcFVDem05cTUzRnErazQ0WHZ3OGszQjE5dGE2UHdqd3lL?=
 =?utf-8?B?SDZVSUZiN25udVVZSi90cHA3V2hRSkRKTkJHNGV5Vi9pMEQ4L3c2OFpZalFE?=
 =?utf-8?B?WUFNZ0V3aURNSWhzN3p5UVliNWhPVnBlbzJ2UFhwbmw3MW1hZFJHOCtveFV2?=
 =?utf-8?B?anNTMkdaTGZKS21BTDI3aWp2QXlEb2M2NFJ5SG1Jc09YblZ4MXdMeGFseEUy?=
 =?utf-8?B?K2Q2ME81YVQwdVkyOXdjaE5JRkFQR1hMMmpSRTdiWDdHZlZOcEc5elRSR0tM?=
 =?utf-8?B?cGVvTkhvNnpyc1lFRWx2a2VmdVc3TDZVQzY0RU9wYkNJSzBmcmdSaTlXWjRn?=
 =?utf-8?B?WGtNbTRXRzVBVW4yeWI3bDdqWUZ6UjlnNzBmZzlCNXhJVnhFTXVYaEU1NHo3?=
 =?utf-8?B?Q2x4VXRBRDZMWWdPckh2UDN0THRkQzZ1eWRRbFBWdnVheVZZcHdMdVhmMFUz?=
 =?utf-8?B?TjJYWnQ4em85WXlSdUJDUmJaTFdqTjZDNkxLdWRNbk55bWI5Q1cvdTJXZUdP?=
 =?utf-8?B?ZzVrU1A2WTNlQXdqclNZY3R3QTA5VDN6bzVhMml2aEhRS0ptalBaNnVxZ3I2?=
 =?utf-8?B?T1NnckRQS3RKNVd1Si80SzRQZ011YTdiU3A5QXJwdjBwNFpFRnhBTHdJd2tL?=
 =?utf-8?B?d2gxdnptY2VrOFNuV1JnbngxUlVrRVgwdUMyTjlJeWRqVUx4N0lQN2tvdmFt?=
 =?utf-8?B?dkZ0eUpmRjhBOTMyclNVNit2Z1FmMklhVDhWa0xlQ2NDYnpnWkNTN1RzZXVI?=
 =?utf-8?B?cG9VaU04SWQ2WmhhcXBqMHpXaGN0OGRIdnJsR1E0YXpxV3pQb2RKMTRsY0lu?=
 =?utf-8?B?SUY0SHlCU1RiOWNyNzhiVit1YkdkcHl5L3NYLzFjTVVHUEFjUnMwVHBydjJQ?=
 =?utf-8?B?YnBGOVZDWG1nK3RCQnVKeG9mR2RKcmVzbmU2elNOeGdmUkw0cndiSCtPZlJO?=
 =?utf-8?B?Ukxhb3lsR0szUzV2cXptdFF1U3hsL1BGOGxuR2JKREdSWWoxVFhOSWl3L1lO?=
 =?utf-8?B?QW9wTVJVMldPeHNDMzNVckZtMG1VaE9OakFRclJUTXY2ckYrTitncmRDek9G?=
 =?utf-8?B?a0ZxZXl6Q1lsRXZRK0FrbHNGQWgyWWVMODE5TjJyNnFieGxXSzk0WE9sZ2pF?=
 =?utf-8?B?UU1ZZHgxbm5NcnJDTlh3WDFEYVRMU0tZMVUxSFBYamw3M1YrWm04RUt0YUdT?=
 =?utf-8?B?UVhuYkEzUGVpU2JkNEppcWR2TGdZQlBYU3BWQlp3cVloWVJKSG02TEVJRmd3?=
 =?utf-8?B?YjBoSnJqeThXZDlTalVWUkJJRzFjNmJOaWM2UHJpVHUycytnd2R1WFg1LzdC?=
 =?utf-8?B?bkR6UTNycHdUSTdJamgvOEwzOE93c2JtQXRVR3BHTlFGUm8wVjFVeWpobTJk?=
 =?utf-8?B?czBGOTAySnNnZFNuS2JWbklJYlJ1bXk3WHE1THBjN1Ewa01pUlZPNmY5di9C?=
 =?utf-8?B?dExQamhDVFNBTkgwbHVVbG5FYkJGU1NoNEdhR0RrbDFRZ2FNKyswcTlXRnJR?=
 =?utf-8?B?cTVRQU5YdFFiaE16cmRmOTNUUzRqWXZ6bVFDeFdNMElmNkxTdCtoUGRXRUFw?=
 =?utf-8?B?dXA0cDZ3MjltTnpKYmRlbUxrbHB2TDJKdmg3NlVva0paOWJZUnd3OWNWVjhC?=
 =?utf-8?B?RmRkVXlFL1p2OHBsa0U1aXFBZVMzR3A3MFRmck1ncGxBWFdkaVg3dVkzTUdR?=
 =?utf-8?B?RnU0RHFWMW9oZHcvVUJuRnB6eVBleTYrbWhmUVNFeHVIYS9GN1B1anN3aG1H?=
 =?utf-8?B?ZUlkZnRSY29MYlBhZFRiRjliYnhZUS9LTGd5OVdVVUZaVXpHbTBaQ2VyK1M4?=
 =?utf-8?B?WEVtYi9IY0YyTlJLWmRFWnV1T21GdSs4ZmFPQ3huVDNwcmZ0bHY3RzN4WVU3?=
 =?utf-8?Q?krFdMowEltV8PwpOa/TdJj4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0271b7c-fa9a-4ade-d759-08d9d6a24fd3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:38:06.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IEFDVODB7EhtBCV5HJr2TXyfLJbt+zlqDxIHCYCS69VynXTo5qZ4NwnltXPO36lVsKtIzv5daCBhbryilAqbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 13.01.2022 14:50, Andrew Cooper wrote:
> This is a fastpath on virtual vmentry/exit, and forcing guest_pat to be
> spilled to the stack is bad.  Performing the shift in a register is far more
> efficient.
> 
> Drop the (IMO useless) log message.  MSR_PAT only gets altered on boot, and a
> bad value will be entirely evident in the ensuing #GP backtrace.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm curious though why ...

> @@ -313,10 +313,9 @@ int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
>          case PAT_TYPE_WRCOMB:
>          case PAT_TYPE_WRPROT:
>          case PAT_TYPE_WRTHROUGH:
> -            break;
> +            continue;

... you're going from "break" to "continue" here.

Jan


