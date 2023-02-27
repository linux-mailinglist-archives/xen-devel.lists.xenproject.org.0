Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D66A4663
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502766.774735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfiT-00060W-Tw; Mon, 27 Feb 2023 15:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502766.774735; Mon, 27 Feb 2023 15:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfiT-0005xZ-PO; Mon, 27 Feb 2023 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 502766;
 Mon, 27 Feb 2023 15:47:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfiR-0005wd-Ps
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:47:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9d696f4-b6b5-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:47:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:46:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:46:59 +0000
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
X-Inumbo-ID: f9d696f4-b6b5-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0xIqCqE6T+i1NMqLsj1GfS5oudO0IaK6f2NVKvCFYW1xnjZVizm8VlPwhxYn3i7PvpknHkgAp47TS60L6cvew7s1sz/MqNB2yFqzujMai74R0PesnhAuitaXeyLgAIJAWttlpUrnjrsrsu4G6aQBfYsSrlU18y6hwBp8Lg/7JW0LBNxiHoBBrBqe59uSGxQEjTppl+GfH4aIhEfDf+uZYkhTotZGhn3be3ZtqLL2Plp57q/uWdmheM5q0BBIQremue0puU4zgNsYh3w9gXj4vayNmNFsrr9VvCKiI7Lf9I/szyo/NwlNzWQEO7cvFZ85/Qdt1pOJCUG+69Iib7+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YbGiYWv+P9C0eRLhAqkKHFJfP7o6o+fdLZsgVcBByc=;
 b=eF3AhDwYdRGN63XDc163X5gF2Q+vdTx3759ibH6yrNNtzA4LyctCFjXFaXVnJk2OBnMjccPnwW2kg1QLnTPnkf1YhqPeeFGcxuza/9g89IyotaK0mmTzOJfhgZgjSjuLKInAMguMXiNZBoY5mK7dYZ3N0Q22TtsFtgl5kOuqKf+eIa0vdPnS/CevRzXUxHdQrsYDiNFD3awT3jk6tzm7T42aIVcCiFOELfftoP64Bi+23+G+yYs3l4+dkrkwLQusqPKkcVCzyYlO0GXSG4E4t/YnNzTuHObbRDw53roEWp0AQb9+OE4OeQ8k3azMxSpXRqUYj+nR4/969369P5Vi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YbGiYWv+P9C0eRLhAqkKHFJfP7o6o+fdLZsgVcBByc=;
 b=sThRqXb/6mCJ+2g/KPvrHsXz7b/U4O/5wHl1LYTs0+doqwgO9srnSuPrgOcAUnDNyo99ZqjjYveLJS4VnvfTf5fUo4xZSdixf1gZdtA/Kll6irni5IehNUfSaJL03zXpFoaXEXw7JpSIblTPcDIcr1OxZoQkJ+0LNvxlSz2ElXbyzirpRmXH5iZPXM36s+/RUtHXOf+xYWeKIuxSjZYOi01Jv6D2Jc3DDa+qEQokx99eaf9V0gdqomXlTfAOi7AxWICMHdVkPBGQixZS+IszFrFCcZ5uJMcK/x4wE09k1+MlU0AZFXpM1q/uhQTwAtFKOC94heGmyWnX19GhDYmvJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07780c4a-48ff-9c63-9f73-39d8e272a6bd@suse.com>
Date: Mon, 27 Feb 2023 16:46:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227154153.31080-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4e58a7-c81b-4ef0-d0ec-08db18d9dcc9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYPcKApRWgNcIbr7jZ3hIoEqRQFTCOWBXWKsVr4BYO370+JebKIr8zQ/d4Elc34a29jB9NMpV2T8ex39Kpzecp/T4UmWCRjeJdKK+GuWG6ygg+z0IGFRGhX584r1VflXeY0lZvoOBwqFj/nrweJk/vkHzs7HgX0ZsdK4Fm9vlqjv+wQhrIUjEjADYEuJz3o78h5OcEoxDA0THdTK5tkhX8KoARo0aFNg2I9qZgjSouIn5KVvB3x6AC6UGNbFVvpME4QVd1rQrkcmPO4MqdA6d1d36kc2S56ZoMdru0L8ThUghh+QVXP4QE4hQMZhxICyP3VXn/AaWAzpYbJzZeqHIKETfvh4ipQACKPvdvHkWuArC2meValN6LqA+CKS1IkYxcK7OHKey59v3tR/OAVSgCT9dOI0UDhr9MiRZUAGW5dnCQWDSRztdQ/qu6egiNXsaOw3guBG+jmnvrliQqPwmCUfKcvSRVb62OPQJKehEJ153gDLGeveuhHm+GTM4e5jZnhRFQyl+k4ktJOoWIjUVs+0L8/C/83YaCVJ1eY3O79imZezI4OAq2ngx7DU5ofJ9/J9CGjvToM0+rUJfNB1/w2LHbrNKEGhDS/DgffKodlIRlPYAj9oYh1dU0ZDJoL4jatoei28iSGY9NmdYJ9YhYTHCbOp/dEGWY2+FnJjpjzR1XgFcKIKYxyhBwc2lhrGhqUft6sIKJm+RO/T0Ouid4vhcvMq9Pf4ZTntzrdQxF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(5660300002)(7416002)(36756003)(4744005)(86362001)(8936002)(6862004)(31696002)(478600001)(2616005)(6486002)(186003)(26005)(53546011)(6512007)(66946007)(66556008)(38100700002)(41300700001)(54906003)(6506007)(66476007)(4326008)(6636002)(8676002)(316002)(37006003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlgzalBVU3lkZ0xSdTJvcHVBVDdHeitGazVSeXVIN1NETW1WdVFzOTFZN2xa?=
 =?utf-8?B?djR5UEpnV1hrWkViVXV1UWgxa1dKZGV3Y2hDb0VoVHI5RE1zYXFxTG5PY0lN?=
 =?utf-8?B?UEJCb1AyS0hRMDRFYlNteWFPZW4wUjN0dUlBc0gzSWVuWDVlYlRuSDkzb01q?=
 =?utf-8?B?MWgrYjZBd2hRdHlQY0RtSkJDQnZEbTl4OExSbHJkQ0p2SDh0Zzd5RHZ5U1or?=
 =?utf-8?B?V2pDMDUwY3FCSUJNQWpudjM1R0pGRk05Z0h2WGhDL2E3cVRxdVQzQnpmQml2?=
 =?utf-8?B?aUpUOEV1UERTdTBuM2p6bDh0RUk1enhnVkJTdU1BK0JiTVg0dUF1TDRBWTdq?=
 =?utf-8?B?OEw4WXpxNHVnME9GVmp4c3hqNE5DUnJsZVVLVDlVTHZhaDNHRFRnVmdmYXZt?=
 =?utf-8?B?ekkxNmVzNmJxcDFOT2JOdlcxRmdRT0pCUlVObC9HTnp6WGptc0UzbW9oUnIr?=
 =?utf-8?B?WFRhaDEva1BncUl4bWg5U0I2SDVLcTRWaVpodzVwcDhUTk9sWHVVSGVWTGlt?=
 =?utf-8?B?YllUdU82YjhlVkJ6cXkxenM1Zkp0Z1pQM0FLbVRaTE1pcXlaZ0hiK1pBR0s1?=
 =?utf-8?B?alkrelFGZW4yVUs1QVRpTHZpRHU2WEtuQnk3N095Z2dmVlc5YzBmamNBc0RG?=
 =?utf-8?B?M0pOOHBTWGtTaU1FdkV2K2pEQlZ4clBRUHVaeXVJZE9MbmRGTkdDa0VGWWJp?=
 =?utf-8?B?Z2wwVy8zU3l1S2dpcFpOQ3BPaGlxWkJJdzdBZ0wzZWVheEhVWlgrQjBjVU9J?=
 =?utf-8?B?M2pRNkNQOHpWYXJGanFTMmdTU25GWktVdFA5RldQNWhXZjlvWS9iRHorcXJl?=
 =?utf-8?B?L2RTUXpVUXhINyt2dzlUazRXMWxDT3p3QkFoWmlkeFpOaUdxUXY2TnFDYjlk?=
 =?utf-8?B?dS9lZzdIbG1jK3JZQmpRMnFSQ2J4dmVZMW1nMFNmMDhnRDI1MGJwN3NJVXo2?=
 =?utf-8?B?Tnl0SHBzQ2p0Y3AvcHlYWjZUWjhUZC81MG04NzlNZG9RcFN1Y3FYeTgwcXM0?=
 =?utf-8?B?SVljTWltTUxiRlNkVTNjL2ZoejZFUHJrSkNqMVY2aFhFbENQeHhWeVFRY0ZV?=
 =?utf-8?B?OElpUDNTRVFpa05Lb0s4TldmdDE0VTlJNGRZN0p5R1ZQV01sYkVXeC9yWkkr?=
 =?utf-8?B?dnA1bktWZUdWdkN3bnc4RmFzL1lLRnBpUVBNclhnRHpCcG9LV2hxb1E3blBK?=
 =?utf-8?B?MHVpWkFCaFhzeGhwZHdnQXl4MGRvY1M2T3k2U09ZbEFacEhNTER2dlNrazN1?=
 =?utf-8?B?V1R2UnZBcUc3dVQ4Z0xBV0pQWEVDbkQyM2UzQ0hiMmhock9DQzBoQTRCenkz?=
 =?utf-8?B?ZktXQ05SNHQrekRkbEZod3RyZWFhaGEwTjZnVjRjR1pQWXIzZzdmem9BaVZh?=
 =?utf-8?B?cWExZDFZdjhWVXludVFRdlRERW5PZDB1d212dkd5YkphZzNxenQ2azlOZzNF?=
 =?utf-8?B?S3RkMDZTZWNyTjkycWhhSmVrQldZdHN5Tzd2dytub1pYSG5CcDBUSkh1MXpq?=
 =?utf-8?B?dmN6ckN0OStmWlJpaGc2V1dQRzZwa3QxMWJjcGloSXp0TWNvRmNrR3g4dzRu?=
 =?utf-8?B?RlNTRFlvQU84R3UvRzI3N1FrWTRFZmdhL3lvVXltcDlPYVB3anE5cFVwNC9y?=
 =?utf-8?B?OXZacXFhWW4rQjlUM0hrNDR5QVdZeDkvb24zMzh0WGt2elNxcUZSVW1qM0Uz?=
 =?utf-8?B?SW9QL1R2OGJzZDhFK01Hb1JWOHE5cVR3NU16dHg2YmpGUEtLcWRmdzBxVnQv?=
 =?utf-8?B?dEZJTUlBMExCM2MyV0pZTWtzdzUrVVZETmFnTjBWUWtqV2pIekhrT2grcG1a?=
 =?utf-8?B?Z0s4WVB5QStGWFFjOXdHSGRYOHdxYkdpLzQyOEd3YnYzWHB3Y0NucWxnc0h5?=
 =?utf-8?B?VTEwYnNVNjY5N2Z0ZlREaVJFTm1BYlJUUlc3RjFhckl3NzcwK05rL0xGVCth?=
 =?utf-8?B?Mm1ZdVdlNGhGMWVmaWVwK2JrNHVINFRpbjNIV01tWjNKZjc4b0lHd2RISWdj?=
 =?utf-8?B?NmoxQ09hdWlrZk9MU29TZDZtcjhFVkVRellaWEx4NlhXRFBRQTFPSnZaby9t?=
 =?utf-8?B?Y0dUa05XS3E4V1ZBampOa0ZFVlc0YkxMS01KY1dXQlZyU1FJYk1JeTg1cTVJ?=
 =?utf-8?Q?c9T8MfIYAXLpcwIQfoyv7MIDp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4e58a7-c81b-4ef0-d0ec-08db18d9dcc9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:46:59.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XimhzQD52w0OcERZGY9lf1s4tG+NX+qhGfLLVGAqjvcDm+AA/nPBvEKoeofZrAEHyd+uKiZOalPL2xDM0xSJlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128

On 27.02.2023 16:41, Juergen Gross wrote:
> --- a/tools/include/xen-tools/libs.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -1,5 +1,13 @@
> -#ifndef __XEN_TOOLS_LIBS__
> -#define __XEN_TOOLS_LIBS__
> +#ifndef __XEN_TOOLS_COMMON_MACROS__
> +#define __XEN_TOOLS_COMMON_MACROS__
> +
> +/*
> + * Caution:
> + *
> + * This header must be completely self-contained. There are no external
> + * references to variables or functions allowed, as the file might be included
> + * for different runtime environments, such as firmware or normal programs.
> + */

May I ask to go a tiny step further: s/normal/target and build host/ or
something alike?

Jan

