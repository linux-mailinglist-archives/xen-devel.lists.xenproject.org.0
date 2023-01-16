Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9766C617
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478837.742272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS7p-000431-GO; Mon, 16 Jan 2023 16:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478837.742272; Mon, 16 Jan 2023 16:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHS7p-00040e-Ck; Mon, 16 Jan 2023 16:14:21 +0000
Received: by outflank-mailman (input) for mailman id 478837;
 Mon, 16 Jan 2023 16:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHS7n-00040Y-PK
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:14:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d366c7a7-95b8-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 17:14:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 16:14:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:14:15 +0000
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
X-Inumbo-ID: d366c7a7-95b8-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2noB8WQxL9a2dzbSDE8DSEXpqRUh4MDlNSf5bdbjYYFWJgiJxq8/QWffIbtJ4cnIVF3tWflyj8DHD9hFTQV/EmLOQMW+Dwh7PPyFTlM/YJmSyxqIjyDxLeJ/5N0crRMaRfD87b9HDYBjleVeiL4dgzLRWDLAvQRLopjx6EaE+rJX0nGrRaJqABBQyYNJqlyiyjfiNomQ4n/1crIj1fihZ32W+dvh7jR+MU79MpZd7h6VkyULUUVnx92M6CgMDGzxcdNxGHSec8uMf/wiqHLYV5Hx1XpXA+f7SyzAho/l+c/2ph+3i/NkJ8+BitvQ4hyT+j5mFKBqK9h8ZNNLj492g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7zYV21ojY15fFTvj1ZVQOWr87Qa26P2o9uzlTRqVDo=;
 b=N2Raiu0Fn+nNiI0hlOowWaign0rPbBJSUH7+2IsvxU7ayebPD5hnXYypUXtbEoCFFYzx7r7KgDretgcXyIWfENqWvXZtzWwFuq/Gl5rJ8rOft0w69tI1ZIZEOj3fmsb9aQXAdZPG6kKDRvZrJBYppq6+bR/kFuO3HoCZHsZycfXtW3T8p36Pu3F1yrkadr/3zYxliRpIJ8ofrTLyv19VSlMEOWpr5x+QC7eIR5aq3KqFpBXfixwzngQJ7o1bLuja9aPSWfUtWcmk6uwJMTn4mpX/1wzc6pfmAn6BhkEaX/WBkiBXfjTN+HinWQlEVpZe5XAkZTaggyWuozOrdI0m+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zYV21ojY15fFTvj1ZVQOWr87Qa26P2o9uzlTRqVDo=;
 b=yiV27FIKwGRIsbYR+UcG0aF+bPC3CuNuS5Sit8ad7JxEsOyhSShNQLRAvHsPpICsuAmA+ApyV7wx/qgQjmuV1epN+YLxQUgcQtPWVk092yPATw7ymNQpyoUlHS4W9v2brhN6KPxVyCyGwoMVTQ/1lJZ+Qgrf0GKnvvcdBD65E4UYcuIRB5CfcZYROWwlB9jvjyEObYl51OoSHU2DZ/UapYik60rRifEzZsEBYv1y9kRS3jdigrCGpPqt39PzU3gCt0lTFHdqb6ot8DQGAsATGyaTU6PzxkZpdQdWAtd4x3zGWXEhNXoBo2LK44E2H2VIYXSfpEItW1bl9XXQGOUwzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f92334b1-7819-d638-fabd-91baca711615@suse.com>
Date: Mon, 16 Jan 2023 17:14:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] xen/version: Fold build_id handling into
 xenver_varbuf_op()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113230835.29356-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 39840d4b-d021-4fbe-2d5c-08daf7dcb64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ERWBWzavefKtdpdnuVszBDqDHHr4g6L914Zu/pqtUK8RG8fJTuuhidM5OI01+E3BpJMv21nktC71o47oVKmbPhuxPWa6zhHlUVV12ni2TnSIst+KIx28yEW/9D/NjTxrC6P0z4CBjPTDidj6HGCn20QfQZ6PG3+De18TtKLnyHwsAq2czbZnchaY+wgj7PnWWKlS1fV0hLWT3ZOlSDKA5HRlUaKKAk15COf7O4gue/mOsYzCdZRq45MMk1RfA2KgG3GLbj4S1ouu5NzXndW5JCrELKaihR5edwwgceI0Rx3Myxul/JSPf14JMvnm+r127foYOYULUVni0h9GVFPpWUbkdkPcwM1+U0rtxtPahii86mH0LhQinUyRpcsUd0Wyme6a5MlTD3JsCRzU2Feb8KpFQ1snEIfZ+M1p+k1vyXpshr8X/1RwoN08wHRf5MLB54oCFwqQ/vf5S294hxZhhP7VK3qe8MzOVLJoLFL7kj6Hln72LGZoqZEUyNb7yFnBVmX5SKvgn0h2YG7mAg2zgFvoJIqcMzPlNkjptwJJxyWqYQw8GB8Hx7FgseHMrjd9Rpm59erlj4SAfsUhc7OljCY9PO0WyfbUTdgLitHGJiYzUKwHtejnUSSdg+x9a2NeNZfOUSY8wTQJSN+f9pvqtkUBndqZqf9/QHPfOUyArqjFLxY6KXNniTcuuh/1ppge5zFKWklwqVyPp7PLWEtBhi6juK+TkeZVa5lVkaMdUlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(5660300002)(186003)(54906003)(36756003)(2616005)(2906002)(316002)(26005)(38100700002)(83380400001)(31696002)(6486002)(86362001)(53546011)(6506007)(6512007)(31686004)(8936002)(478600001)(66476007)(4326008)(66946007)(6916009)(8676002)(66556008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhZVDdmaWZ2azh1eGg3ZzhGVVNHbm9pdmZyTkhIM3pXNVdsWW55RVE5cVFu?=
 =?utf-8?B?QWhHNDRDZUYrTk1OR0RSNEoxQ25VUUFqakZzblhPVXp0R0lEeXFIUFRKeGJD?=
 =?utf-8?B?cE92cjZwTVI3c1Qxcno3cmhSQURTaVRnK2NiL0w4NWJTWUhsR2ZUbytuMnZ0?=
 =?utf-8?B?WTNBWmVxbkZrbWlnYzFmNFM1TUdQbkovWG5OWGtyZE00UDg1R0tZdGg3Tk1h?=
 =?utf-8?B?WkQ3R1N3NWJmeFR0VzRCZ3JTM2p2TXloZlh3R2RSZW5YRWg5OUM2WWxqMWtl?=
 =?utf-8?B?U2ZFdEdvbTVqbjN6VGhPbGlCQk5zZmRJRVprWWdNSGxUcWw2STI1ck9qdnh5?=
 =?utf-8?B?MEQ5dVVwa0dqUEowNVpRNzJEV1Fld0tyK09hNld1RDU5YXltR0tCdHZLUmI2?=
 =?utf-8?B?OVg0ZWVpSWpmS04rK1NhNDBUNlBTWERiTFBKUkRwZ1haN1F2dWVoVkpCSm1i?=
 =?utf-8?B?anhDOFZyNzZ5a0ZqTGtXWFFtc3gxNjVmWmZYRHBRVVgzRUN2K1M4YUUxd3Fk?=
 =?utf-8?B?YUR3ZUU0Q0xxWHR0VERoUU5ldFJXSER4S0ZxbURQNTYrdVJmL3VneUhoSERl?=
 =?utf-8?B?UFFVV3hkZ1NycFNuaGFqMkpwM3orMjN4QmZKOVFvYzk2TGU5SjlUUlJwWW9s?=
 =?utf-8?B?aHpsR2cwa1dGVDZLN0VjdjliZWZVdm8rRWlaQzQxZkhZUkMxZk9TUnJRRFg3?=
 =?utf-8?B?eUJmblYyWHdYSkFzTlBEdVVydmtMcXdLL2FVcG5rZitYMmtCald4b0ZkTkho?=
 =?utf-8?B?a2p2T0UyQUxPVnZJUi84bVIrZXJrKzd5eW16NlBDZ0YxTVo5b2VJTkJ1RG83?=
 =?utf-8?B?RFR2NUJaR0gwOHV2ZEVSZERkemRKMzBJYTdCYTNXOFI3Y3gxZi9kcU12eEZ2?=
 =?utf-8?B?b0sydSs3bWZVNXpma0U4RjlybCt4anhqc1UveUQwQ3M0SFg1djV2V25EK0Ju?=
 =?utf-8?B?UEhmSHNEUUN6RlM0ZUIwek9NNGE0K1hFbW05bk9SNVRJamIrUzJMQ0wweWhh?=
 =?utf-8?B?Uyt2aitGcnFQQUFQL3VyV1E1YmNsbjZWL0R5V3BFMVNYYlpoallDNUx0MTBK?=
 =?utf-8?B?ZllLN3lXc1MyYk9CTWxmNTUxemlsdkNoTitPVm92ay9vN2M2clNZK0pyZlNs?=
 =?utf-8?B?NjgyS29DMHNPZGhpdlVFWHE0ejAvbHc4M2hYMTBzUGFLK1ZWTnhVcTgxTXU3?=
 =?utf-8?B?QkhxSkoxa0thWjZwbU1SUnJMRWkrc2ZaSFc5VUdPclBQUUdkUXhZVXFSeE56?=
 =?utf-8?B?QWhOSGlnTExkbjFBYlVCalp2cWZBVVFKUXBhQXNHQU92YUtKeXhZN3EvZkpj?=
 =?utf-8?B?Q1JRQnhEUXFtVGc2OGRzbUFoRmp1OWxsbnVoZHFiR21oaUxlNlpzQzZMNW1j?=
 =?utf-8?B?NkoxU3NxOWJ6MEdMSWpQelJnT3gzTjB0MUlhcklIWVRwMDFNSDB1cGZqdUov?=
 =?utf-8?B?TDNTd01TaERQYXdtempweTVoVjlkMlNtTWJYN2hoUnJ3c2dic2VyMm5UeXBK?=
 =?utf-8?B?QWQ2aURJN1BxYTdYNS91TUwvdHY3WmFvbzVLbHlWTi83U2FwRUJnc2wyakFo?=
 =?utf-8?B?S1VDUGVSUnBFRUtLd1JNWWtNMVBJRWZaYkg3QVQzMUhiSjZwRVNvK3BwMW44?=
 =?utf-8?B?dDV3WWszNGpPT2NtbCtzNDkzNHIwZFFDaUYxODlXdkZqWS91MTYwTGNmV2Fp?=
 =?utf-8?B?VklHUEVoTXhsMkFadEhYbGVFNDI2ZmErNHFhRHgwRGxVdDVQeUU0UXBFSm5I?=
 =?utf-8?B?bjhUakFmMjNUb3YyRHFoSXZLdVI1dEprc2RXOUE2SUdydVBYWm1oSm9qUFdG?=
 =?utf-8?B?Z2tNbjl3UUc3am5XeGtDREw1Y1ZFN0lVVnF3Z0xDY2tuSHdBU3FKbHhuV2VB?=
 =?utf-8?B?dTRtNXZ2V2hnWGxhblZYenUvb2JRa0l1MitFK1BlZ3dpTTd4QzFhazdkOTdl?=
 =?utf-8?B?S1Q3ZTZ2U0g5NzV0NWZqOTlEanpyRVYxdzBTQ08yWk96ZktpU1hJU2M3L3NI?=
 =?utf-8?B?Qml1NXh4NWppU2hKVDhtdGo0eTBsOVFNN2FTMk92UmF0TExEbWZOaVpaZWI5?=
 =?utf-8?B?VEZVcHJPVU9qYllYUlp6Z1BEMEg4OUsrakJmdU9qRzQ2MHZ6RXN6amswQ2J5?=
 =?utf-8?Q?yEzWyRav+aH4QVn968F8ukj45?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39840d4b-d021-4fbe-2d5c-08daf7dcb64a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:14:15.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULe8uA9CryVkfzK2UcdCX16u1r6NrHNtcUYF5Z6pM/aW9vBTR9VwQtPizx9mrg20YHEZnxlw1CS+KvKy5eQvCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

On 14.01.2023 00:08, Andrew Cooper wrote:
> struct xen_build_id and struct xen_varbuf are identical from an ABI point of
> view, so XENVER_build_id can reuse xenver_varbuf_op() rather than having it's
> own almost identical copy of the logic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a style related question plus remark:

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -476,9 +476,22 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      struct xen_varbuf user_str;
>      const char *str = NULL;
>      size_t sz;
> +    int rc;

Why is this declared here, yet ...

>      switch ( cmd )
>      {
> +    case XENVER_build_id:
> +    {
> +        unsigned int local_sz;

... this declared here? Both could live in switch()'s scope, allowing
for re-use in other case blocks, but making clear that the values are
unavailable outside of the switch().

> +        rc = xen_build_id((const void **)&str, &local_sz);
> +        if ( rc )
> +            return rc;
> +
> +        sz = local_sz;
> +        goto have_len;

Personally I certainly dislike "goto" in general, and I thought the
common grounds were to permit its use in error handling (only).

Jan

