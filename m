Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0296C4039A3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181828.329156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwYr-0007ou-Ag; Wed, 08 Sep 2021 12:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181828.329156; Wed, 08 Sep 2021 12:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwYr-0007mv-7L; Wed, 08 Sep 2021 12:20:17 +0000
Received: by outflank-mailman (input) for mailman id 181828;
 Wed, 08 Sep 2021 12:20:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNwYq-0007mp-0w
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:20:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2a7abbf-a19d-4ad8-9e76-39e7701f3a82;
 Wed, 08 Sep 2021 12:20:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-vTq9rxmwPEuZ5Swfl3pAtw-1; Wed, 08 Sep 2021 14:20:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Wed, 8 Sep
 2021 12:20:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 12:20:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Wed, 8 Sep 2021 12:20:10 +0000
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
X-Inumbo-ID: d2a7abbf-a19d-4ad8-9e76-39e7701f3a82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631103613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJNVwzYym6eiXmkVEWFw5XalOdBRLFERy32pUmqqaKU=;
	b=Q1/uisIDEIJuNKmPnulTL8/2K7tKUZsoUFajanfSCRpMhtJqwnJGzBCcZueUBicoMPb77b
	7VMNMJH+LIGC2iX4tndT8zDytwHnK/MjClnckU1DZwembFZL1gSCyWoo6INyTfYCg/uXDj
	rPViR7DNUe4RdOoVSaN5eqmLlbklKKo=
X-MC-Unique: vTq9rxmwPEuZ5Swfl3pAtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGcJX8fOZTqIRSx688p3aB7ULkkl6DZ7fJbWlSj1zyODk99N2TzCcwka5Mnd0XN7uasKr+76r58shHYSgTY9Hqszs7SrnkYW8XWzy9WFkRkLQdLesNbeIGnGJgYnGp/DLbfbusBO8HfqaCfn6pTuNsuMaVlPnLkpfIIZFdOlnNQsjUypJptwcOKMrG4ywh1kA7NguD6OmA1L2hRCcFAKtcE99XnLB/MrFwBQSat4/hFXV3FQopkIItNl3V03UO+/VKUFT5mVsKnBhGdarVYNhrEd3zL53inxi08MCDwb5zrhAnirr3ILd767pRJJoZt3rT7lZ/P1V24RHUA9gtF45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJNVwzYym6eiXmkVEWFw5XalOdBRLFERy32pUmqqaKU=;
 b=IYHghuzRF7ohVhDMS6BzBOVovru3ucv3V2iGjNGyfoK/fK07Yhx+yn+b3nMMdZvIM1X/1yPYkrLjUrCmYnBv6HW5ed/fEfPo59UKliCV1jSEBIbtCJMO+8DSGg4YVfOR7WyTJjBHbPebT4XzIrxHxv1rSqWWPnohfq8PyU24yzWi/Yb3bGkV1yHH0PTRfHVV1DYfebTO2bfw9afqI5OxD9u7pqI9MFu1NzB++8eTPje0Ao75to1MgGvunoh6wpRhECFnZ+AGgZWNeq4EJnAOgXmNqwd0bIuyJFwyr76N9NkTuv5mzNMP2wXYEwNlcIa4sG2aLd+VBnxmxl3DPtQB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH 1/2] build: set policy filename on make command line
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210908095422.438324-1-anthony.perard@citrix.com>
 <20210908095422.438324-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6f7e54a-36ac-aef1-98af-e8644cf34487@suse.com>
Date: Wed, 8 Sep 2021 14:20:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908095422.438324-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c8422d-c949-4027-078c-08d972c300b9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535C75DF67CDA498EC90DE2B3D49@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G6C0Bl6MOu1H/zU0qz7Qikd4dfeQAwzv9Jf3NYDvUsxIycgJXYbsKmeizho2V1EVTL/AIxYRooO+GDznx5tBWdrrLI0RsmKM0marQTiW4vCjn3OC0w0M4y9NtkhJeekd3Ii1ZFYhLYtyqqcgWsPBmW1MqmMpm81tq58UBebOHNreAlDFRC5GeJ4BPTwH2thorigH1QtO4d06puKfyp9zcLpQUsupTQ02/TM229FfmEw7J/9KW7A4545ELuMxB6uuGcKY40HsMwRVSayHdNZaZl89TaQugBE8m7L1o0iEq/9tnA+vB6WudjSrBMUTLHmPK9WuLnpmTnbrUBJGX12bAqtvGku7sNTblzNSKYq4jFnjnVmiF+DSi4HIjhEE9+tTxaDiTuDrofWeS86EzYRO4oxKgMRdZ7WlPm7rBotm6I64tyIf9tw2e6DAuh8qUOv37bz5Ov7DkiyIpYobkL6rDMdog0ma9Aru8X9fvXj5uGkrGS1Exkco9ELNmLGewh21/1qlAruIwsipC27qHQDTWptHjCtKl4BduQ3TqIcnKVkKeatF9BUlQ7eTSdJ5idEC58IwCJP596NayLiQAPYTDEjDjhb61IyTH7QFE5bFik/rFbzm+rH6rdsLoDxs7X6EaJnwWEpa+IvhM7rXkfjeSx/tyMQWLjej7nJGv/7DSFHK092drSWkhbNjJx77ksI9q+tiIxKiTTLynbVSnCDgTGx/0RJyxExFV6z8pBXBodE8yREuwtEvBqZFw9w36jDz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(346002)(136003)(366004)(5660300002)(4744005)(26005)(66556008)(31686004)(186003)(31696002)(6486002)(86362001)(8936002)(2616005)(956004)(53546011)(36756003)(4326008)(2906002)(478600001)(6916009)(316002)(38100700002)(8676002)(54906003)(16576012)(83380400001)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZjTEErblNUd1dxcGVlRWpqUnBWQ3kxOXB6ZHFSaktPYlphU2wxUDIwTXJj?=
 =?utf-8?B?czVaUSt1RU9VNER4dUl6VGZlakRRTjBWRXFpRUdaWTA4Vy83K1Zhb3MyK21k?=
 =?utf-8?B?bGlrT2l0em9EOGZPd0pxcnhXOWpPSFczaGwySGN6YVkzbkJsVXZDWTk1ZHVu?=
 =?utf-8?B?dERERGl3T29OTGZCaTl1cWd1ZGZkN2UxRW1YZTdvejUwUEhMUGdBQlNXYmY1?=
 =?utf-8?B?bDcrQmpXVHJtcVNldGt1YjY1U1orSzVJM1FyQjU3U2x3eTVRTVhBZzR3UWIw?=
 =?utf-8?B?dXdnRDJwRTI0V0dRbS9NN0E4SStNaTZaazd1cmM1REFkYXJxOGptVDFSWmZR?=
 =?utf-8?B?KzRGZGVtR2VWN1QwT05IblBkYTNRQ1FuRjNUR1JqSzNVQlpoanZOdzdoZ3RO?=
 =?utf-8?B?Z0hHOUpBZUU3a1dCYzNucjZxWGtXYk9GTm1Oc3NneTlGeEx2SnVBRURQY1RT?=
 =?utf-8?B?MlBlV3J2RkIrTllod0Fld05pWXVWWjJ2a2E5REdhY0JHK29HZ00rMy9hYjh0?=
 =?utf-8?B?amJlZmdmSlRtU1RocXlMSzhmRUdZeFZKUDE0U3liaDlnV3BISDBubnozMVJG?=
 =?utf-8?B?Q0xVcUh5ZlRDMUJ6VWpIYWdYbHl6MUpsVzF2SmhIcnJRK3JQVzI2KzZnYXRS?=
 =?utf-8?B?b1pVUjFYM1ZONHRDaXJMRUtZWmhTOWV1WWc0OWlIUHpNUy9yOWxacUhIVDM5?=
 =?utf-8?B?b0dDYUxrblpaelp2WGNCRGloOHRzWGtydHMvdiszcFVsMTVCUURaY2tBTmhy?=
 =?utf-8?B?K0ZpcFhZK3ZpYWlsK05WbmwzcW12SFF6eEFuTnZsYzN4USt0V2F5RUNIVHNL?=
 =?utf-8?B?Z0FPMU5aODlTUCt5RHFGeXFtS3RLTDg5RTJKb3hlUlVqUXZRSWNQcmYxWnp4?=
 =?utf-8?B?S3lEcjh3bVROQld4STBuYmFmNUNxa3VPbFhTenIyNVZBcXdGdE1sZWhlN2lV?=
 =?utf-8?B?T3AzWmV2MnZlNUxyWCs4czBPbVBGSHplQXFoRTR6Z2VBN2wwczdiRjY0dUlz?=
 =?utf-8?B?eS9HNWFuaGVHS2Z3OVlYaE1KNWxRbzNhamI4bzRhWmkyVXVHWGlWdys1TEVo?=
 =?utf-8?B?dk5KNmJzNEpzUExSd1BFTXZXRVlFeUxEMEU5azJyWmtVcnV0cmpJY2Y1MjVI?=
 =?utf-8?B?OEd2K3FxKzdMUVV0N2Y3RGtmYThqdjJUa3B4WURQTFpjejhUK2EwWlpza3FQ?=
 =?utf-8?B?blRpdFZGNGF1ZnlDWVd2SG9HOTZUZ1lVYlp6Q05JSE1ING11Y1dTTGM4REk1?=
 =?utf-8?B?U243bTlBeUpKRTJJdkdWUkVyTFQ2eFBjKzBjMGRNd2k0NDZ2aGxaQnFsUTh0?=
 =?utf-8?B?MlNjWStGRE5sbEJQaXFsL0pweEorcFZRcC9YTHF0cWhkZVBoOWdwY3NJREJM?=
 =?utf-8?B?NXhjOHlSNHkwWEF0L3kvT1lkWndwQ3VaQjhoTVU4YWtkYyswMGVDL0ZxQjhj?=
 =?utf-8?B?ZTQ3V25oUS94NzFUVzRmQko5Wk0rWEVOVGsxRnI2SWNYUnRzdUFNMUhNRGVO?=
 =?utf-8?B?YjZsM1k2dEJSTFdZOEdHQ2lPcGRCMWNwSWRyeFhFTEZvUXpCUzIxVlVnQWZU?=
 =?utf-8?B?OFp6STBucE1pTzhqd0YrS1dYUkZGQUo0Mm5yUWpRRU9aWWpieDVoYWdzNXY3?=
 =?utf-8?B?RnQyRHg4WGtBNDVxVVR6bGJOeVAxMktMK1Y0TElRd1JHcml1OTMxbUpBQ2N5?=
 =?utf-8?B?RHhZNHJMOGpOMnl2QjNvTUNpU25SNHlDbHg4MERpZXhhRks3Qml2SWZyV0Y1?=
 =?utf-8?Q?k3M2gvS9xJVoyNs/DlsIZGcPQHajroeCvhdrun4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c8422d-c949-4027-078c-08d972c300b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:20:10.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYY08AN9YVu8leTHukp62OED9PF/ZJIMhiDHVI7yF3n3AbjYElwvlI2v0YYs/LiKjUgbMzE9tK41k+0Xc4f9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 08.09.2021 11:54, Anthony PERARD wrote:
> In order to avoid flask/Makefile.common calling `make xenversion`, we
> override POLICY_FILENAME with the value we are going to use anyway.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -42,7 +42,7 @@ FLASK_BUILD_DIR := $(CURDIR)
>  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>  
>  policy.bin: FORCE
> -	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR)
> +	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)

I expect that you wouldn't mind me wrapping this overly long line
some, while committing?

Jan


