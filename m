Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B973E8A0F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 08:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165511.302459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDhQC-0002TU-Rp; Wed, 11 Aug 2021 06:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165511.302459; Wed, 11 Aug 2021 06:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDhQC-0002RB-Or; Wed, 11 Aug 2021 06:09:00 +0000
Received: by outflank-mailman (input) for mailman id 165511;
 Wed, 11 Aug 2021 06:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDhQA-0002R5-D1
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 06:08:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c5a1d58-fa6a-11eb-a03c-12813bfff9fa;
 Wed, 11 Aug 2021 06:08:57 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-z1Cs7I2yNQCJEqswKXyxoA-1; Wed, 11 Aug 2021 08:08:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 06:08:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 06:08:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Wed, 11 Aug 2021 06:08:53 +0000
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
X-Inumbo-ID: 9c5a1d58-fa6a-11eb-a03c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628662136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfSTDbDBpgjpIjsDKd2Q5YvULOfbX/n8xvDJH/w+7d0=;
	b=kfgF3DduZB2InGfYZWwb2s21u9GkAkt/tS47kokf058/6EKhybipbVRld3u1h07NoRKBzZ
	YtPT1fqpJaN4/gmnnk5PottdO2cJy2QK6YuIGObRHqCArf7vOnoVYJjQTvW4TfyWhVwebo
	pb1Lb276j0JmV9xPDkqUbpkyXiYw/EM=
X-MC-Unique: z1Cs7I2yNQCJEqswKXyxoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks8Gs/XnpsikHTAuKZYoiipKpJ/FV0m4DXuseP4SeiaRa/v4CxfNzFZstsmOhlEV4ISD2YAHN24mdL48OVUJvdacJefVf3DbTwMACkf/4+UBhpoFu/iP+QTJbPZR6BRHwy7+XpfzdnO9netLvaNo5oStIGhJA29qmQQtIXYJxnRRKc4rDwfDeWJ7w+YmFq4TEUb/tTD2GuIw1jGiG65xvB1mDAdzGM75uZObh0VdOoKBOntd2AgzVl3PKIh/UkTAIFsoLW5weGS6XgRLXqwM6gC1R91eIdhKMvnJ5c8fy4Z2U0+A5YSJ/9Ad7cswedFV1Vc1PQiRjtC/3T080x0vbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfSTDbDBpgjpIjsDKd2Q5YvULOfbX/n8xvDJH/w+7d0=;
 b=eASHQJlELnWpd9P1V6m3iy0PBTUVpLX3G+e/9MDPp4KuZGdu4wVNjJPm3yLYKRJB2xUs3laG+rbONt/HHtl//R9UJlhtlRmJGIFyYlSC9DuZDQzRb36bu9K2orujnb7VRqV2aqsEf9V2Y5gmtotD3Z8TGlhEogrwFcUahbT3IL3RNk+dIJAsPHIl4Q0U9UY0kdxVnpaRlaTUO3PXogOpLMHCZqrVnL3oo416bw8qA2EEBqGHpfj0c1lUFThxFcFn9vphJG4ZOLoJPrnzeihLl0hLEqC9t1zznoL0PD7KG7FBD0PWfiiXBmD+dttY1dXHo0FHeDzey4jogd+Fts7j7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/2] xen/kexec: Remove use of TRUE/FALSE
To: Kevin Stefanov <kevin.stefanov@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20210810174737.56297-1-kevin.stefanov@citrix.com>
 <20210810174737.56297-2-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7117c3db-76d1-5550-c34f-c16e95c0e73f@suse.com>
Date: Wed, 11 Aug 2021 08:08:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210810174737.56297-2-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cfc7843-9bf8-47cc-1869-08d95c8e7ed8
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477C6AC0611E0E5D9AFB015B3F89@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3a75LxBVsXGbUltxaXv8O6psGdp26hzFJayuklp5MGJUu3PhNVsPvh9PDkUHh3LyNt5Cz6aoxbnMQfQSsIraEI1g2iNwXoViYG0ckJuwF7WpVNdx5/1rgSTdT+ywZ7HgPbBKOCLcqQHY5sNqfJZvhxq1+mIK9WKRrAXtQGKNHKp/STLcF1mLFJpPO8AyVtLhLrUBk8OfSjSGfverVeXiL8giIWukW/q5hmVmNd8d2lUuWzQpttRhCTwerNqzSd8CtZt+HyuRg/Q/fb5xpJlhdpQYt6yGxVLIHaslouScT67adz+YfHRihW40Xb2nYOkzqQjhY3CvK8spwuyADWwo0yw3W0Fb5SIGSPH/H7LO3gnnbC4nR4bh0ypwIdYcy7+19SfkWVS46tk9xrqIEOYxjS62MdLKTh3mNKYoP/HgfUBlB8TwxodR+MnaWlnOmsrFGK8hZZ8nLfMmB1scw1SV1oQRRBoRYcAzlFQ3aJg+h6GYH9W3FLHrYg8XkSXPHW4nszfV/Y5f8llv3dgLOxfK+l6n/ZmydIuoAcvCk0RNwUSLvFuXm18OYrOV5v1jybKx2KEJEjvHmYzHufNG+sQToGFlAHrmZXWuDIPii5M1TusrFlj6gLqMh1Xrhldfm493PWRL4SlCZTE2os+NnSKkU+IHY1ASSxMYLBFoSEzqnBmTBPUkx5pe+JGMx6Vt48vIbH6G2QQOouCdcsBSIhVDDpL35KPJz/r0zwRByFUABs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(366004)(376002)(39850400004)(53546011)(38100700002)(66946007)(478600001)(66476007)(4744005)(66556008)(4326008)(86362001)(186003)(31696002)(26005)(2906002)(8936002)(5660300002)(956004)(2616005)(16576012)(316002)(31686004)(36756003)(110136005)(6486002)(83380400001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNrcE1DQ0hkK09wcXNRZEowVkFCam9Hc2JSajRFQ2VGS1VtQldNT3BTVFAy?=
 =?utf-8?B?dm5HU2pqcGNWMXhlbzlnRVpKRnNUN2h3RE9WbDF3QVcxeldNRzNGaVBTbUZC?=
 =?utf-8?B?a2cxTlVvV3JSVWtYNDBibkN2Zkl1RWhJekZRRE8wNmM2cDBUc3ZVVzBmVnFW?=
 =?utf-8?B?d3gzNmh5Um9hWmk2eGUrZEJudEJ0UmRzLzNXRUZmQU04ZFpQZ3ZrTFprL2dv?=
 =?utf-8?B?Qk5udjlLaHpPYjM1R0VITEZxWjNsd2NCVHRORzhhVnRKUTBVTnFjempaWngy?=
 =?utf-8?B?RTY2bWhzazBWZlAvOWlVR09TcXJDSDFGNzAyQjdELzlleTIrQ0JhT2lHb0pM?=
 =?utf-8?B?Y0NrUm9SMlg3dlp3UytjV1I2cm9pVlMvZDgxRVdsMVNnYUVqT1Y2eENibGFn?=
 =?utf-8?B?U1VuYUltSmpJeWNHd2lrc2JjRUxqd3FKeFlZcVRHTFpKcXB3WkR0ZEVIYUox?=
 =?utf-8?B?R3BZOExYOWJXbXhDdFcveWNSc3FKSWdXaEpVb21ISUhZSjFTeFkvK3lNalRt?=
 =?utf-8?B?WGhoWjZ5bUkyZnZBVUNxdHRsWE1iVWRaTFdJMG1BdCt1UmxzSFkyMm1yVjNq?=
 =?utf-8?B?amF6eDRFTm5rZk5lK3BMSFJpTThCd3RxYmNFUnJXSUpBSUVoWHdiWkx1YWZQ?=
 =?utf-8?B?K083Tmc5K3ZEMkpLRjZlUEtzd0hacTFMVW93SWhlcjI4ME5IVmlUNlBXMEpq?=
 =?utf-8?B?cUJZZCtZV25INlNlVmFhblkwMkJ0alFxbTVWdk91QUYwUGs0TmdQZFdJZ3Fh?=
 =?utf-8?B?SDhUL09sV3F2ZWtDZGtELzJOcXdKcmt1K1VXbnk2aE9wZnVFSmszcGM4TTZa?=
 =?utf-8?B?U044Z2oyTXp6MW5uaktkSTVCdTNtdVpzakpRTW4wWkFvNUtqazgxd09TS1pS?=
 =?utf-8?B?cHNxbktkRHA3ZG1NZktqR1hmSnF4VERaSStoeTFoUGsrZ0VtVGJTM05MZ0Fh?=
 =?utf-8?B?dWVsOE13RFJkMUJITHdJUlZmVVJHeE5UNnBYbHZvTFJ1eHMwaE4wSzJOb2s4?=
 =?utf-8?B?azVsdGRBaFlsZkxzMzAxdFdRQklyd2V5TXIrR0VKTFU5TkYyai9sem13bGdi?=
 =?utf-8?B?akdvUEF4THc0blBua2lpQzBJUFI1dGU1TWtyYmc0R1ZCRG9QRnk0ZW0ra1dm?=
 =?utf-8?B?N0E4aENkUXpHUVNHWWhVakpvUzRXSDFFMFMwa1dTUWUxNDNCM1dtQm5NMzRQ?=
 =?utf-8?B?aXZMKzV6bGpOKy9VMFlteXRXZ3ZNUU1YZGs1OEhaUDVQVGk5RmI4VENPazg3?=
 =?utf-8?B?T1hUZVM5MTFua0ZESE41dW5oQnNDS1c1ZHoxT3FBV29HdUt0Y2FINUIreUox?=
 =?utf-8?B?bHVtVjA2cENDQ09TbUtKeWU5MENEOXg0Uko0NWRRRlpyckFHTUdLRXhJS0xL?=
 =?utf-8?B?QXNhTlRzZ0NGNHZucldUM0g1dGlWWG9RVlFiZ3dTKzREUkVteENiQ3Z4VmFw?=
 =?utf-8?B?bFpQZ3Q4cnREeUZjWngwN0hQejc0VG1yNFV1M0YrR2J4b1BUQWVhdy9aNEJN?=
 =?utf-8?B?U2RkZCtYRWFobFE4MFh1TWRtSFBpWkp3c2VFRVE2WDd2SmxzOFhwc0FJYmRi?=
 =?utf-8?B?M3NuNDR4NE1oWE1yZkhKWThVY1hwRkxlUjVMVVNtZWxPOEFRMVEvQ1J1MVVH?=
 =?utf-8?B?RVFBLzVrNkcyUkpJdW9LZi9IZ1ZnTXEwd04xUmtKVU54NTlJam5lWDFsUnBr?=
 =?utf-8?B?S08xNytPY2pKUmRWVXVQYTloc3o2bmozUTlJQ2FheTY4cWx2Nlh4UlBhZysx?=
 =?utf-8?Q?phwsMVjElY8OLSQD+NrHknalQy9MDTs7+bBSFm4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfc7843-9bf8-47cc-1869-08d95c8e7ed8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 06:08:53.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pmb2yk5qyzTN+pnCgtG2JA5iBZBjyXAN0SsOk6buA9be9B/2wDIxqarS5tAdYDG9SkRk+u47SxtMfjiCnlASsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 10.08.2021 19:47, Kevin Stefanov wrote:
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -35,7 +35,7 @@
>  #include <compat/kexec.h>
>  #endif
>  
> -bool_t kexecing = FALSE;
> +bool kexecing;

While not overly important for either of the two present readers,
I nevertheless wonder whether at this occasion the variable
couldn't also become __read_mostly. Andrew, thoughts?

> --- a/xen/include/xen/kexec.h
> +++ b/xen/include/xen/kexec.h
> @@ -17,7 +17,7 @@ typedef struct xen_kexec_reserve {
>  extern xen_kexec_reserve_t kexec_crash_area;
>  extern paddr_t kexec_crash_area_limit;
>  
> -extern bool_t kexecing;
> +extern bool kexecing;

Later in this file there's also a #define of this identifier, which
imo then wants to also change from expanding to 0 to using "false".

With at least the latter adjustment (which personally I'd be fine
carrying out while committing, just like I would be for the earlier
suggestion, so long as you agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


