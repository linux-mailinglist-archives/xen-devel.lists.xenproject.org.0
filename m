Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2BC3BBD4E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150216.277770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OG6-0008Ee-B1; Mon, 05 Jul 2021 13:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150216.277770; Mon, 05 Jul 2021 13:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0OG6-0008BF-7K; Mon, 05 Jul 2021 13:03:34 +0000
Received: by outflank-mailman (input) for mailman id 150216;
 Mon, 05 Jul 2021 13:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0OG4-0008B9-Kh
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:03:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45347ae6-a68a-4db5-a774-1681769b0a9b;
 Mon, 05 Jul 2021 13:03:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-AYkUCCdPPQ2-Ialtrh2_7g-1; Mon, 05 Jul 2021 15:03:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 5 Jul
 2021 13:03:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 13:03:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 13:03:26 +0000
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
X-Inumbo-ID: 45347ae6-a68a-4db5-a774-1681769b0a9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625490210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNvUtbKDDtkudyr48bQpvmevEivU/ymo5pA72T+9QcI=;
	b=BlAKXBHx2P7Lp4pdi0A0+9sE+LlTcbDXMFsGYehTbym0ZdugdJgiDlc3qziThvxIpHEo5B
	httlJfPTshbmHuz8HZUyiZuSKnm4bex5a/86VR8RfCf2XZegjv2xWUzoY/SBMJkII1WOac
	+T7JgZDXDIsmHIGDQTE9R9dwJmdLli0=
X-MC-Unique: AYkUCCdPPQ2-Ialtrh2_7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8mAlu82qsJuSj9yVD8MdjEotKZvPuZdO65Vc/MUB3oNGByvMk4B2MocIA2laso87jUG/Jcewh5ji3MBq3xGR62f0J253q09S+bsBE3t91Lw/RNpp4QUpZckKdLpTJIwR+HJPEmUuNDWnx1ZSDUZH/pe5JJcMEkvQjaphBtI6gIznQ7wWU2dEj9k7O8E8wx3rsF9xNczDSO0ZycqwjV5IfLCU3CLfQA7vwlMri/5owJelAc5hwr43AjVijHKRBm54C06NApJ5NYCURvaO+i1Pg39G7qds2mIPqivGT34MQ32RcmHbO92rZnFG14U7cq6q6t/GuzgWCOCEoQskhBS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNvUtbKDDtkudyr48bQpvmevEivU/ymo5pA72T+9QcI=;
 b=jamP7s0FgbbDq2lOmoEqO4ylv1ER6IMD9/6N2xeB6c5vZsQq/FcWbsA1+Lgfcpn3k6JvtExsxWdc5oAzbt3aaDOOal89+2yoR16uqdh24IJQfS+tdUUMLu3AqGD0AMQGENsMofxwY9+5i5EiwuNeqqzKXHR5jTL+RBI945He7Vutr6cTpAVYl6iFSxnwTn9lIza6KZJjvqpCThbzjZQKxUJhVWEMpCppb2Lh+oCos4kyedVG0Xfr5XjyI8AG1PeEI5TphGPZOwHApHshwEZYThkgvMVJHULsMLy+88SDXKAt9QBCKMOVwkmIvuM7eZ/Z/1iPFjJqym6tR4uGrV/qwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1f026fb-33e4-4d18-5718-ae9f9f42327d@suse.com>
Date: Mon, 5 Jul 2021 15:03:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705105103.14509-10-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87a24cc-719d-4b4f-f7d1-08d93fb547b3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3391442FF610A1A465F4EB8DB31C9@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOYA8garUAwGBmwkJ/yquojkaSmH4nOa3bSrSlqUcP3F+QcivnnnsySQP9NlQBE2EAzIBGg5Da4u4BJJT7CVo0UNmpFroPKQQzQTFZjLEO6RvYHhNeiS/unCRitgGvYF/++lTGrnjgDHtnblRZF3eIA3JLOBnxDnldSCwpogSkbDSWVtxfTqWBbMoJp+BnkKLtCADsUCzq+kB4bNofP34YajkbHlgS8GovbxIYl4HIofYLzXD7YdpxKHTbafwHTQVWf26o3L2qQijyti/orTXpDKWUjRMy4XxTjSDPcMzxMjgDSFjmUBWpBmrsSq+//HoIZNCcBD5Qf4q9bKbIty5uynFWCgY3o5kHDFPFOoElInAZm6QFw+anPCSqxLJGFhcOWnDhdVXNXQkdqaJPMUoR1j+17ICHhI6cXQo1tjqQ21SVV8NgNlN5YL1okejBKvaduBWSofF5lwfXLlqsLBELT5xwhdW6PCyd9txQkh92xq4aTIjDparlXXAz5gNSDiWHM2Ul6hOk1Mbncy3uaGG2RTJSTHrVqZaLfe4rOtUX/06pLIfMZhaGUWq7rCc+56GslRF+u29wSHyu1SZkv4eQAiMMa+uOSFzt+sjc/TbMKWBEQmFk+3NGzWMb6DCHdeKORQW1Ny3ZGPJ5kOoNzPqjmJ/exEFrSGjyIhIUcjiRqQwjijNocTIHMgVV/OGpWZ3ijqU23hYxs6dnyt3Bu7DcXiLwq+X7eD3obEAXTA91g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(38100700002)(5660300002)(316002)(66946007)(54906003)(478600001)(16576012)(7416002)(2906002)(4326008)(66476007)(66556008)(6916009)(16526019)(186003)(8936002)(6486002)(26005)(31696002)(86362001)(31686004)(36756003)(8676002)(956004)(83380400001)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzlIN1hoV0ZZZS95OEpOT0Vwb1ZNRWtRY3VVOUVyVURVRWJsZmVOdmhUcmY3?=
 =?utf-8?B?U0ZFR2c4QVphemppcU91RWhHb1p6Tll5aEpkdDdqb21GZmNqNGV4QWlPaU1M?=
 =?utf-8?B?UEwyQmJMWDZHZHNrMTY1YUYrcmhWK0ZrTE1TKzFPNlpIZDFxY2FRdTlWNlhG?=
 =?utf-8?B?ZVc1WnpDbFJxd1FrRXk4VUk3cXUzQjA4dzNvZ05DNUFEWUlVMzcvZFF3RlZn?=
 =?utf-8?B?U0FqZEoxSmVhY3J6WUwwZDRsMldNbFpvR2ZPa2VwUkV0SWNmSUkxSXkzYS9i?=
 =?utf-8?B?NmJldVZVQzNNSUllOG9UVmpEVEFXOXNiKyt0Y1FGSDZOaTlIQmNjWnJYcEhq?=
 =?utf-8?B?WHdzR2lsWWJwV3F1VDRnQXpyM0dxY1lUMzhkRWdzQnhlS2JMekxJU0dzMk1q?=
 =?utf-8?B?QU9tQUlYSXIxaU9zNFBTcjBOeG5PQXRBYVZobHZGWGEvVDcxcnJBLy81S29Z?=
 =?utf-8?B?SzVtaWdBVndIOXhQMTgzVmtNMFhxUEpRamxYNU9sWkdLRXdXTk4xU2tJOUR1?=
 =?utf-8?B?dEtoVFc3R2tMcVFydmM5SGNnUms0dDEvY2hGek9ac2l6ZmtuRDNaMnJqQmk5?=
 =?utf-8?B?UUpUTHM0cld4Mm9ocFlLOFQzS2F4bGJBei9sQ2F5UHgyMTZ3N3V2SVNYM1o2?=
 =?utf-8?B?MXo0YzljR2NwN29ESmRCN0hXUVJVNTFsUFc5UFFBSUtCSGxDeWF5QkpTaEox?=
 =?utf-8?B?YWFJbXppYXNwbFdaR2xCa1hJTDN5UUhOUDM0Y2VXa3hKUU5lcDdmRW1KdHZz?=
 =?utf-8?B?WERiLzdQeFdPWGh3TUxjdUxPYmE4Q01SYWhGYXRRL251b2diZEQyUG5abWNU?=
 =?utf-8?B?MFB0UGNEQkMvMGVlaHBqUVUrZVJuSTY0a1Y4cWJjazQza2U3ZDZhVFVjcm1J?=
 =?utf-8?B?TW9nMytxWVIwejVXa0tDZ2VoOTB2aDg2ejVFMUJ4NURSaWJWWDUxT2pEd3ZV?=
 =?utf-8?B?a0J5ejRWb0R2L3NjVGg1WnNSV1hveFlPaks5VW9sSHc4S1VRZkVIZW9LS0ty?=
 =?utf-8?B?cERXcWJPQWVrclFhVXo4a3ZQWk94aDY3SWcxZnF3Y0tzd0d6dzBJSkhiUmJM?=
 =?utf-8?B?V0Y1NEcvc3BPaW9xVTVYYXVHVEtIcjBmSjRTaXovT20vRUgwSHE5WFM3UmE0?=
 =?utf-8?B?K2wvSTdISkJPVnIxRFIwRWtRUnl5VUNvQW92eHJ4cnBEM0l0S2hoSGVoRC8r?=
 =?utf-8?B?c3RndHZjd2hlSnFGZHlKZmRZa2p0c0RSazJSR3ViWk1ONUhBZ1hTcXdqQXdk?=
 =?utf-8?B?cFRwdVVWSll2UFlPSk9PbDZwZm1WSHdMMytKZWUzZXJ1VGl3QlpSL0l0NENy?=
 =?utf-8?B?Y0Y3Vll5aDVUZ0RFenhFWjRwOUI0K0Rwd0Q1VmtaWjVEeURGUU85ZWRsRWor?=
 =?utf-8?B?SEhiMjZ6dWlkZW1qMHh1alJhYUtqNEo5TkRLMUZnR1labzVKZVJyUHNzTXdt?=
 =?utf-8?B?UEZ6QzQ0VU9pL1BQWlJ6Q2lMTllNT3ppOTJaRVBZZHlGYmh1TUlFL1lMSU5p?=
 =?utf-8?B?ZmtnYURpRWhUR0tDQ1p0a2pGcGx0SG94VUhhd1dwaUxFUTVEYnc1U2UyakZN?=
 =?utf-8?B?b0hoU0JFT2cycFRzYko1cENSS00wckRoU21Sc3pVZk1NYlI3TzR1UXZnWlRi?=
 =?utf-8?B?cktwWFpnaWNDanF4dnhhckg3ZHZvZ3RiNXJmTlFuaG40QlRrcDh4cnlhMi9x?=
 =?utf-8?B?aG5HQVRFb1lKZzhzaEFMNFpOclhuR1NCZlMzc0hQeGNOWUcxZUJhek9yaU9Z?=
 =?utf-8?Q?REnBcBOevihWxyoPlQt7bBw+7tYJ1dD4YtgUnCr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87a24cc-719d-4b4f-f7d1-08d93fb547b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 13:03:27.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUZzxY4OCnusCOGcuxJCZZr8GxeiXP4RKCnd55AbYYitL1XmDl1Q6LDY5nqFYxgx5dJ+MubbkFPwuDAF5pYUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 05.07.2021 12:51, Luca Fancellu wrote:
> Modification to include/public/grant_table.h:
> 
> 1) Add doxygen tags to:
>  - Create Grant tables section
>  - include variables in the generated documentation
>  - Used @keepindent/@endkeepindent to enclose comment
>    section that are indented using spaces, to keep
>    the indentation.
> 2) Add .rst file for grant table
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v7 changes:
> - commit message changed
> - Add comment about grant table queries and uses
> to the documentation
> v6 changes:
> - Fix misaligned comment
> - Moved comments to make them display in the docs
> - Included more documentation in the docs
> v5 changes:
> - Move GNTCOPY_* define next to the flags field
> v4 changes:
> - Used @keepindent/@endkeepindent doxygen commands
>   to keep text with spaces indentation.
> - drop changes to grant_entry_v1 comment, it will
>   be changed and included in the docs in a future patch
> - Move docs .rst to "common" folder
> v3 changes:
> - removed tags to skip anonymous union/struct
> - moved back comment pointed out by Jan
> - moved down defines related to struct gnttab_copy
>   as pointed out by Jan
> v2 changes:
> - Revert back to anonymous union/struct
> - add doxygen tags to skip anonymous union/struct
> ---
>  docs/hypercall-interfaces/arm64.rst           |   1 +
>  .../common/grant_tables.rst                   |   9 +

In patch 8 you now add arm32.rst and x86.rst as well, so it's at
least odd that here you alter only one of the three. However, ...

> --- a/docs/hypercall-interfaces/arm64.rst
> +++ b/docs/hypercall-interfaces/arm64.rst
> @@ -8,6 +8,7 @@ Starting points
>  .. toctree::
>     :maxdepth: 2
>  
> +   common/grant_tables

... to me this seems the wrong way round anyway: I'd rather see
common stuff not be linked from per-arch locations, but per-arch
docs to be down the hierarchy from common ones.

Jan


