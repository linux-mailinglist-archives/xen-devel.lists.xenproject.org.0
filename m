Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3765D538CEB
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339256.564093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxJH-0001HD-Um; Tue, 31 May 2022 08:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339256.564093; Tue, 31 May 2022 08:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxJH-0001Dl-Qk; Tue, 31 May 2022 08:33:03 +0000
Received: by outflank-mailman (input) for mailman id 339256;
 Tue, 31 May 2022 08:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxJF-00018p-JN
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:33:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444282af-e0bc-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 10:32:54 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-OPH9IvrJPVOvaakZ7zmXTw-1; Tue, 31 May 2022 10:32:57 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9190.eurprd04.prod.outlook.com (2603:10a6:20b:44d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Tue, 31 May
 2022 08:32:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:32:56 +0000
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
X-Inumbo-ID: 444282af-e0bc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653985979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUCkiladp1haNjXb+MHEHk58VBfkjSSmo+m4jwxW9cc=;
	b=naKFXXBHyLbkSkxEAHAvwQ4jBUexov0NPSm9+fOomPiCW6zBSVFxIRvt3cZH2Ne2apux08
	btqvzPQSdrcEX6lSopIsfdxlE0BqzbUhWvvILvkMFj1SSqVKq5q/qXOlbm8DNie3EVVLgG
	VeFIUXO+BdG3aPB9ZAB0b328WrZML6w=
X-MC-Unique: OPH9IvrJPVOvaakZ7zmXTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsKtQpWQ59rH2b4fm6p5DKsGp3FVnrtECHHnGlxqzpVoND3Gc3JxKEvyyN2JZMAIciO0LxhcbCrqbuMmqZuDRCc9d41beMoVZFOjOwg5NiyH0Syih5BuljI1EXPtBmNFfl8WaAPzI90boyKqp57BQCgXkzaldyckNC2OFqYsEXtt2nfTsTEvHpyHwdwBC1IHa1f4rOuVC/+LCPxbjRZHEjtdjvEcdrPsP/0i5Hg34+aThFHYkk0SxymXTcC1Ea7fboKYM3Xo/o03L2x0CwDx4wnjtF5Sd84bq0Jelm8aqhgY3VS15gLR/gUSaIszaBk6fF3nPLuZ9k2+qrH4eW4Ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUCkiladp1haNjXb+MHEHk58VBfkjSSmo+m4jwxW9cc=;
 b=iVyw2WSOI/OD7j+FmZmr959AZLpp0Q13IBmOKVq++aIabABAodLqZTfuJiwEiXVuALvzMTeFi+EL8WOWy+bl7lkZ3pUe+CVIjZjBZ4HXiiZGGfRTV/RNhyQhUsgxr1/Au3l5cni0nCxFs5OZkp3Tk/2IMtklOmeLWuvng5urYx/BsUrojpxJnYkDx8y+ZGWLYkpzOWvJUTOxwwzORwU12Ek9BdLZK9QSfnnWX/lxx+qNV7lO0e2vum4pYeqKeBMtI2RIm+Ie9o4ev3HBzeez2/FrnNa9hiMh2pdXX+gh6rz23O7CjZOx+shVxHkvhBVIyiKch90XC8R7+sIIt4/A8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6cb78106-3d5b-4fc4-7f51-9919f161d69f@suse.com>
Date: Tue, 31 May 2022 10:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 1/9] xen/arm: rename PGC_reserved to PGC_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-2-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0031.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 817710fc-b91b-4cb3-83d3-08da42e029a2
X-MS-TrafficTypeDiagnostic: AS8PR04MB9190:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB91908FC04020F8D74C5C7A15B3DC9@AS8PR04MB9190.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nIpKCRnI0wH550G6EVvqRO79/oE+DpEa3cyOedg0VX6/03Mt2MesjKK/BA/aa7A3GU7pZBlPe5SJneEqDYk6Hg4vlcPE3joWdmruwQtZv7+4+v41pwUIbvFmbtLOnwklMM+pFizwjhlKfW2bM7YkRy9O6jjl9yvGCiPteSR79yEdXtIQKQ4/RqjdU84R5u+tvAk2dRxDv4Ex10ZgwzWro6D0Gf36ikitO1+pl98vdyBcT0es5qMLv+xnDf0OJcqJI7sxXKsMXfTb1EjxpL/UKmevTjbuaK65FGFG+3rVPSlg1D79rU0sCwDXW0YzGQGg5yQScM1W2vJ7DYalLnbe2EkdGXgB6QXKjgMFzMUCA3PFvLX9gqF3mEBSCBNjwWOzSmw6j6w63axrSHLbgtaT6g3IIYiuJwWCCxwVCNl8B+S3iMBhFBFCqua080T0YE72PTLEYxIdFvtu9nbbboVVn83G10ovoAP5OelNjMym68tuMyu8JODRz8vcGLwq9DWYHRhY0fxjP8RcMyNdvhwRt79DTFbGzBWouKvau0YqJtWlDEURjr6xJlNlRlE+jr4swwGPJJWhr6zJmFEPx84Te/NdHP6mvnNezzJBWiG18JBbiUqFpeqK+hAysSGjol+58FaKVBXdnxtcghlJIiKoCA7tp8SVJhBdkwVZ094CM9PM8a7TtoBs8zrBxgzZUesngxl5JBGeUrY+S51VPfHRaNf0u7Fifzfv6lz17sdxbuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(4744005)(86362001)(508600001)(5660300002)(36756003)(8936002)(2616005)(31686004)(186003)(7416002)(4326008)(6506007)(8676002)(54906003)(6916009)(316002)(53546011)(66946007)(26005)(66476007)(66556008)(6486002)(2906002)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVUvVytBUG5GNUVPSUxYK2dISUxsWk9weTFIVlJWY2VzWnVISTRxYjE0TGJU?=
 =?utf-8?B?N284aHhFVndoMEpMNVZOVU04QWFFdFZTRkNyREQycW5KRyttYUtRZXJIdTls?=
 =?utf-8?B?VTV5WGdPY2hONFV2bUdUOVBPV3RFVUFLTGVIdEdsTVRxeEZ1NmVGU0dwU0Jm?=
 =?utf-8?B?TUhyZE11VkhrM3VMRTd3blluTjRxT3pkcUs5bnlHcDJrZjdvU0dSa2toYmhl?=
 =?utf-8?B?NGg3d1BlWXNhTVpGNUpNNC81WkdWTW1iQW9BY2NrSzQwMy9iWFcxWUU4VWtZ?=
 =?utf-8?B?MmpETTZ0ZDg3WlVZdzAveWdXc244WEwrVVdzMUQ3YmVlbU0xTkx2aU5NL0ox?=
 =?utf-8?B?R3dtWjRoSWFXaUNmUnFWRjZ0RFlZZGduMTlHRStvOWVsQU84eXdIS2toVmQ4?=
 =?utf-8?B?ckU4aUxRK2tnY3dhckVoOHk1alVQWXh6UlFMTEp2ZGhPcEQvTkhoMUtTN1dy?=
 =?utf-8?B?WE42ME1CbVN6NzhpYk0waWs2VjhNMlhLaXhqQTRpczJpQVBXSEcwUmRrWmJH?=
 =?utf-8?B?c0hMaGtDaWtReHpxaEdSZjhIRVkzQnpkSlp2dHZRa3dSY1dydzAvWDErL21Z?=
 =?utf-8?B?TnFma002RDc5NFRXck96SVFudjNvVitJTXF6Z2s1V0xSRnVoMWsxNmFEUGFh?=
 =?utf-8?B?SWVRY3YrU3lYV2p2UlphS1MrWEdEdklNU0NlVWJFOG1GRW4rNE92ZzZsbkFv?=
 =?utf-8?B?WnZqNlFYeXJxVnQ5TDMvUWt3bGQ1S2NRS1h4VTF1WGptMFl2VXlvdm92QmNP?=
 =?utf-8?B?R2gvcVdDL1NORVBXNVJaYWxSQld5andHN2x3eU1PZFRzMG42VWU1c25NUlQz?=
 =?utf-8?B?OHJGQk0zRzBtSW1lejlFYXZ1OTdEMWpmdkJYL3JMTEk4MDJmamkxbi9SWlRX?=
 =?utf-8?B?eHZxbE9HNUdvM2RaZDN6cTNsSThUTlNHQ3dyeFBncG5SSlJJUk05aVRXV2ZC?=
 =?utf-8?B?NGdsYTJNS2JENDJ5MmkrQTlMY1lodkJLMGVrNGQ3UEhheW55ZHlUQVRmcmxB?=
 =?utf-8?B?aFFxZjlnc3BMQkpiUTN0aVZzTVJRMnE5WmVTMVFiSVd0OHY2ZDVCNXZTalFi?=
 =?utf-8?B?U2ZjeVI3RmozNHhaK0QwY1RzOXJlOEFnOWRGMkNiaGZZTEg0WnNHR3hWd2RY?=
 =?utf-8?B?SkdoVzQ3NXB0d1R1ZkZ1S2dCT0VCVzJEOVg2MjlTRmZtY1E2RDB4SkxHWVFM?=
 =?utf-8?B?RFVmZ24yc0RYN0Z0TUhuRkwyREtFVWdTSzYzRjE2cFFzV2kzZFI5WjVUbklV?=
 =?utf-8?B?M2lGOVl6RzhDdkM2aWc3TTlyMUlvdVlMOC9ZM3VBZFhDS0t4VWE4RHRhTHFl?=
 =?utf-8?B?V21sUS9KNC9FSTFVVnZXVUxWancrMlBTeFZaMEdSRHBTMHdueVhkYnZJbkRp?=
 =?utf-8?B?SGUwRlhObjUzZVJnTVc2enZBWHhWMmZ0UTlHaDljV0Znc1FTaGk1N1dNSFVQ?=
 =?utf-8?B?N0JjclJ6NXN5V2ZZL0Vlb2xkc1FObGppWGRRRFkvSUlzb0krTVJ3K1lROFVO?=
 =?utf-8?B?NURxcW1JNnNINy9lZ3lONHZPMkU0b1pzck1ndVh4dHd3cUM3d2tWVlJ6dTRK?=
 =?utf-8?B?cEdYbjBEaTRka3lzUy9lYnpoZlIzYm5DdmV6dzlqY0tOOHVOWlowRk1leXov?=
 =?utf-8?B?aVNaVzBXS0JGeEg4UG1YMU1LZGtRVE9qK3g0TXE5cU9sbFp1TUs1UEFIemFG?=
 =?utf-8?B?MHpJbDJBdWdXUm1iMWg4NEVHQWlQak9wK3EwdnF4bTRWcFpFczRnWVlSSklh?=
 =?utf-8?B?eHZqTWtiSXFIL2VTK0ZmbFNBQ01oWHFzZkxKT1dJWWZsb2N4aGhkV2ZBZGhI?=
 =?utf-8?B?ZnpZNVdsaDQ2c0dwVzVyd2RHN3l4eHBpVFJrRnJibXd2eDJESThmYXdNV3ls?=
 =?utf-8?B?NGhBVjFnMGdpd0Z5L0w1N0xuc29ZanIyQWFVZ1d6SFJuSDR1RWQydGo2R2FG?=
 =?utf-8?B?THpiYTAxR1JSUEh0SlptTEpveHJGMVZsYW9neFgvdU1HaWZwLzlFYkUveVgr?=
 =?utf-8?B?UVlva3BKMkthV0Y1VXM1VzNtM3JZcUoxTEUxQjhBZnFSdTcvcTQvR2VNeHhI?=
 =?utf-8?B?dEM0TXliY051L3NCUTVzREJ1NkZHeDJBN0lMRXBNQ1FJRTY5VmxPQnNrWVU4?=
 =?utf-8?B?akovTjB3RUhaeTJpeGd0WDgvMGhnS3MwZkdvYkVad2tIOHpadlVtT0RvMjY5?=
 =?utf-8?B?Z25JRllQRjRpb1owWnZ6YW40L3gzbFp4Mm15ODFXOUxETXViMTNKYThmS2xD?=
 =?utf-8?B?b1NiQlpZTFBDNEtwbnFobU9KZkVoa1ZWQnlsbHRkdG1IdDBYNFFHTlo3OHIy?=
 =?utf-8?B?ME5Mb0xBZzR3c3JyTmlWMkJiMUk2bW9uQVJUak8vSFpzZ0ZSeDdtUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817710fc-b91b-4cb3-83d3-08da42e029a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:32:56.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtHYQy2Cx5ViNdUci/UxVGZcFKQ+fwIbql5N9geMWQ2UU2+/WMq7pYZb20Z1cEFXb9L14HL+2s/ja+0sf9uJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9190

On 31.05.2022 05:12, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,8 +151,8 @@
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
>  
> -#ifndef PGC_reserved
> -#define PGC_reserved 0
> +#ifndef PGC_staticmem
> +#define PGC_staticmem 0
>  #endif

Just wondering: Is the "mem" part of the name really significant? Pages
always represent memory of some form, don't they?

Jan


