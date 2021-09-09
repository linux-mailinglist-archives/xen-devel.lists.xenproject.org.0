Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C2405A39
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 17:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183332.331442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOM5O-00085Z-43; Thu, 09 Sep 2021 15:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183332.331442; Thu, 09 Sep 2021 15:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOM5O-00083Z-0R; Thu, 09 Sep 2021 15:35:34 +0000
Received: by outflank-mailman (input) for mailman id 183332;
 Thu, 09 Sep 2021 15:35:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOM5M-00083T-68
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 15:35:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bc137ec-1b6a-458d-8af5-adba222f2778;
 Thu, 09 Sep 2021 15:35:30 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-Vjc0mHLZPvumYYTrEfKQ5A-1; Thu, 09 Sep 2021 17:35:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 15:35:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 15:35:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 15:35:27 +0000
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
X-Inumbo-ID: 7bc137ec-1b6a-458d-8af5-adba222f2778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631201729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OaZlGOQVIu/SHCco4zvHNMIsRoe3fyRLX5UBV2NO/tU=;
	b=MsWf7tbEk/A64a3W4w0uI8xDq14OQuDQw4u7c7wWDWaNVzM86PMnVSkSAEoOFkIjBI93Al
	wPh9KjOZi/4ug0QWdYD00A+EUnMt/dAjeDvpXf0zvewIKp6Jbqc8addj2XrT2IDUwlFN+r
	ufOkyIrMe5usGZTMq8e4CnzC7icJHt4=
X-MC-Unique: Vjc0mHLZPvumYYTrEfKQ5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDFT9ujSQSI5/b/T2MG8G1lxxDyzeZ2U15vSH3q30Cf4sjpudrWxv0OPHO4B13zg/kwb/4Yt7CVk/ep7JHPCdEpYzAH6hCwVA7UbboY2fSJKLMDIZGoBtvos1suKFNZqh4zIwa2/DWPIn4mRxdY+iQKPZaxj7XZGeXyPd4hyb9gtMsJafv2TEtsetcaCWX7G7OAOupsckdCpnVfSIzo7sNp0BFxoauRoSXIzAv88ftXnWqwz1bVkrA9BBSCM8kXxppjbtmYshFBwfTFN7XgsMFGyLkMpM4U48anW3+p5pmTTeSC4cFyCGn3Cj/AgtC7k/V7Zx2lc+ZJjHoBrtto7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OaZlGOQVIu/SHCco4zvHNMIsRoe3fyRLX5UBV2NO/tU=;
 b=gYL3fQ2Th0HY6aq1e1p4le45VFsKUd4QNZKHqLDX92kUpzXbZB1eTHDyWp22sMLiG071UcuEeUF3r8VDbd1+kdqpYZgGI0c6wP5ygAqEMhzEZcYOzlgLzGXA8+Nhi2zgvBIUrIpM1OUxX8BrxF8MfqgRpfrUiMd0+zijoE13G2xXi/xV3TBpaj/Xuj7LPyrS4PwLPyq775y9v8qgrQLAF1ppWxWMNrisMA2CthAwkytfd6wZGri6kOG/cyXS9V4araRveyMKnYlDtTVBBVHlwDhBTUryK5fyNcFklS/7tlwzu7dDt1sdqZm6JSTvyD/2WprbSYg6+1a/UWFdijBGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 08/11] xsm: drop generic event channel labeling
 exclusion
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-9-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e920645a-ffda-c8e5-ea81-c5a607e0bcbf@suse.com>
Date: Thu, 9 Sep 2021 17:35:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903190629.11917-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e36ea22-45b1-4b02-6254-08d973a7733e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478B86272229514FB01D90DB3D59@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1IcJ10fr7Wpn+TmzRZa6kJ9b85CygtvB4QWRBxWmufgizrmztYHcmPFLJ7VsEdHI9TbE/+5zFVFdd4/lXvhgunG9HILkfIuXYN0UzBWBqeHoKMQONdyxT12PdsW75q3VTbJKlWaR5/Ea44VUwvKV563bXIQ3KrBgNTvyTkEcW8cxZMWkN3nDQx1zgtOj78XSfA0oiZKUfXKhbgsMoyU20h7Nj4iFIR3m4hzK0jZp9z2ugsQ+TWkyiOPyFt2FWVA/Hu2vTiOOO7JrGAD8CKI95e2JSNw8Tq6rdgfJX9C8zAzLCXCzvIO0LXQzLQ2lQ3C6NtfsIHvl35UmDk3xMlfQrze7vw+9Ypbj3Smu4WtOhqE8Dqn0nf2EUCsb03gn/hWSJl0SPJB7/soMP0KFcDI+2Tln0NoQzNuqy/yvthbzEHIKrFjfneMTvjIRelPK/VvYHbe2101IBqIh4GQ7HlGLNvu5D8ehUhczl9EKjDPPHVXYu+a+SEGCZu2hDVD85qBrynzaOfxTNyTWLtboQeutwn2cidSrR2VsmBxBIzqSyACr8M4ldBehZfstu32IcrQkzLs3NIw7CmnojNCUu0GMYt2y2jNQ8EN7bucDJC711Tv8OntG+3xo12aJ3jkUI2srXKGtc1VbBQ5rOiaVf6Toa2YZwYuIXB1a4OQN0YfH+ZzWAhmeWpH5QcFv8A0fVEqYg7MbWgc4cFO3bxGv3mmluaVfb8d1/H2dcFi5sD18NUcX5LiOOXN7C4TeFQQVJDTey4jB6e9oO0HR0Ey4tbjf9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(136003)(366004)(396003)(346002)(31696002)(2616005)(956004)(6916009)(31686004)(53546011)(8936002)(6486002)(8676002)(26005)(5660300002)(66556008)(83380400001)(36756003)(54906003)(66476007)(16576012)(66946007)(316002)(38100700002)(186003)(86362001)(478600001)(2906002)(4326008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVRHODN1bmo3YXYvaFFaYVZSVVEwbFBmNGg1MUlaQ1FxdUVwUXRCV20ybmNX?=
 =?utf-8?B?TXh2N1ZDRElEY0c0L2lSZXRKM1l1Wm1RdW1NQ2pvcEIvbkgrMkFGazlDSzln?=
 =?utf-8?B?dGtQTVFvQ0ZBeTByWlpCQ0NBOVdtSTdYTHd0ME45K1lXT1Q0ZHBFTFliZkhz?=
 =?utf-8?B?Yk10dSsvaTh0KzZtVnVNb2NVam9rUVI5REFUVk1pTUdnVk9oNlB6NnJyNDRZ?=
 =?utf-8?B?bmlwQml4amNHdlFWbzBRTnFoR3l1RDhJV1NyU0pZdHdEVk02WEhJVGtiZStW?=
 =?utf-8?B?c0ZaNStRendQRFpTTitPeUJlMVFuWmFMSFlpR1E4dTRpMGphclVYVnBSU0pC?=
 =?utf-8?B?aTVRY3k2SWFwN0wzVDJKeUZvZmRWUnI2bFA4YW1pZ1ZXY29aaFN1dzN6LzE3?=
 =?utf-8?B?M2FmMUc5RmxINEJxRS9ua1d3MWJ1dDZud1k2Z21aMTRsQ0M5L2JQa3BtZUUz?=
 =?utf-8?B?WVdXZWdKVDZYbWpyUDVZN3I1STY3N2pzQ3FUcWZlcWh3bDV6ZVNWYWE4cTkx?=
 =?utf-8?B?NTdRa0ptbm9PUHFpWS9sWTBmQTkvMmxnbkwyZUI3Ung0c0E3NjhubkVTYjBF?=
 =?utf-8?B?YjA1Wm5LZ1U5RDRieWVMdUo3NEp1RXNMcmRZb0NqRGcxcERROXovTTZWSXJD?=
 =?utf-8?B?a1UvZVk3cVVGRFpaV2MzM3ZuWFRNNm9aQS9pRWs5V0V3OUpyQWltS0sxckpX?=
 =?utf-8?B?WnJsdFhnSzZ3OExtUFhiRjhpOFM3ZWloMlVzQVQ2bTljVHZxcFJYckJScGsz?=
 =?utf-8?B?bUlaOUw3WjM1SUY2ZHFZaCt1QjV3SUFOT3Evb09XV0JWTjZ3TE1ZZU9LUWJT?=
 =?utf-8?B?VFp4cTBBTWIyS2dscFoxSXNRVU5YT1N5eGhKRGJPZ1hZRXFXdTlrMmdjK3pM?=
 =?utf-8?B?aVhFSlpzcDRxMUpNTTFRQ1hJZ01sN0hQRUx5U1NDNGRaRWlHQ0NYSHBDUEFV?=
 =?utf-8?B?VWdRcU1xMGdVMkVoZXRIb0Nmb0lYWS9uNUsvazRCNllNbkVUWnNWK0FUUGVF?=
 =?utf-8?B?Uk9YeGExMXBJLzVxeUhjcUtJbS9JWUlNbU9hU0hmcDJLQnBIcDRPSVdTYnhk?=
 =?utf-8?B?R1hVNElGT3hxVlRTckhOUFN6R0g4ellUU2ZHUjROMGRFSEJIUTR0MUVmL1Z3?=
 =?utf-8?B?Sys4cmwrUTFaanR0MmNhUDFNVWQvWmplWnhBcG5QZGdFd1MwT2F1cVFIM2FH?=
 =?utf-8?B?c1FsV3doQ3JLSGZSaFpCbkt5Y0F4R1cwL3h0WW9YVjFvOHJtYnA0Ynd5aFIx?=
 =?utf-8?B?QVk4NjVCcERRMWx0cEFFZGhQT2phQVVKSGl5SVl3OTNid0RhQlNXSzJtaHJJ?=
 =?utf-8?B?V09zRmpkRzFWakoxRHVFaUlBNUo2UGh6YlBaZnVNV0ZsMjU1RG8xM2ExMSt1?=
 =?utf-8?B?WWROVVVrZVUxUnZMZk1QUFVkc2lFOXhOWWFWWTI4OGxBQnNST1BBYlZ0Zksy?=
 =?utf-8?B?VklSN3RtaTNyZFg4cWF5Y0J3cGFicUJ4NWxPRU5oK1hXUkV6UEFCTWYzcnpE?=
 =?utf-8?B?VWpucWRva3d4dVVjVnhjZ1dFcjd3cWFBZWRoREtzdGVPVGszZDBpUGErNXE0?=
 =?utf-8?B?ZkR2eEhvMWJDZTJqZTc0dEEyeFhINGZNRXFJLy9zcGhCS09FeTUvdmpteGdk?=
 =?utf-8?B?NkpVeWFKeDAvb1JPZnN4QnI0aTIxNkFLR0Vhajl3enpIc0lINnNkZm1pYU10?=
 =?utf-8?B?NTZ5V3M3U05UYVFmeXZpRHdzeER4dHpKYVlFSUlaU3RpK0FDWENZNXBmbU5G?=
 =?utf-8?Q?vYlWwVxzv2fFmCCMoPJuT8dGzO0qIwuhGVbt1YT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e36ea22-45b1-4b02-6254-08d973a7733e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 15:35:28.0486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WF0A+S3gqgaWgWp0Gm2wMyD+rvRHumucOCDetgfO12fxN0++X4MEQMYGhfpPhku4XJ1s2zBUEZds+IgxFHfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 03.09.2021 21:06, Daniel P. Smith wrote:
> The internal define flag is not used by any XSM module, removing the #ifdef
> leaving the generic event channel labeling as always present.

Already on v2 I did ask

"I'm not fully convinced of this removal: Does it get in the way of
 anything?"

I have no record of getting reply, so I'm still wondering.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -122,13 +122,11 @@ struct evtchn
>  
>  #ifdef CONFIG_XSM
>      union {
> -#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
>          /*
>           * If an XSM module needs more space for its event channel context,
>           * this pointer stores the necessary data for the security server.
>           */
>          void *generic;
> -#endif

I don't consider this any better than what you had originally: Then
you've removed everything inside the #ifdef as well. Now you keep
it and drop just the #ifdef, exposing the field universally (as long
as XSM is set) despite Flask's 32-bit only field being enough for
all practical purposes.

What is there demonstrates what the original intentions were. It's
easy enough to put back if needed in the future, but I think it's
even easier to simply leave as is.

Jan


