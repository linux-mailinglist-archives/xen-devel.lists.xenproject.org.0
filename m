Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B398715C13
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541082.843432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wpS-0006Ss-Vm; Tue, 30 May 2023 10:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541082.843432; Tue, 30 May 2023 10:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wpS-0006QA-SL; Tue, 30 May 2023 10:43:50 +0000
Received: by outflank-mailman (input) for mailman id 541082;
 Tue, 30 May 2023 10:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3wpR-0006Q4-Cx
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:43:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db72b455-fed6-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:43:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 10:43:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:43:44 +0000
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
X-Inumbo-ID: db72b455-fed6-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHg0ntIg/W4U6JvX+xPMDl/UtGky6BA8cvhZ3Ul7uE6OiBnsAKvQ6PuJnNBd5zb8nB7TpclmHyjvg8XkmgyRrnYJwgx2HHydEfRykKHl9WOgKF/7MZkwJ2his+ycdWpKjCmK8iaA8TqxuW101UZAaLKxhpv0FF809aEIAn7jGxww9MxbmS3jdEBhxjizkz/4WrMHLMDQrHr9c8gMhaKWgbR7Fyi1MKezs9ZXJpQiTA7G9Pglf2PKC2kn3C+jLyYyQM3uNYt7gzauHj8c64S+ISNqo0HTRw04tncWNYvRWo99WOluCHy3k8Z+G9izdsVSyUUOWpxGTkBdyuKwqSuvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/Gk5s24qJpyUc563MFjEoO9z5tiyu0lNPjN1g6jPiI=;
 b=StMY/eeu5QUrOkmcNXORJ4uiDZmJ4tMq+W52yaIKzYl8d1UjxKxgA/9Hc699RhKZN51G2QR4W1eEVRa4CAkKSyqi1+Ss/lDWeqX2jIBATuaCKCVnxIxmotJTEegPwY1HVe9UEDl4TBAOEc0dnN3/flzTKhavfcQ18SsrVW+ec4LGttnrVwtIFka88FbApD9pLvgpVUcrIssBY3P5RSiIeiT2rjVQm/4r8tQj1sqZi/5D/xjiOTsf1q3pb9LJEtlp607sCD99c0VjBPPEasNnDuwGE+2yYxWO3M8ZQuxAw0eM60o+zVJjaCu5jiqkOVoeXcFx0F4XQNoBV/IfGYLKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Gk5s24qJpyUc563MFjEoO9z5tiyu0lNPjN1g6jPiI=;
 b=5KEVb508RIjSN30twRuwtOsP8oLqI7bcbR6jPnaE3YsUbW+/0kAsiAPFfl8CSZ1RB0A4/A7N7VHyeNPCEu9cXppyrqTRINU6eNDGaTFUUfcOjZ/hmlqq/wH6wV1LBHKx8lEVP7xgWwy4KujgNeUWDCDPO+s8eme05tZaGg/30FmA/4edXPhGjYrPzNJi9RZ6Zv50gG5iETtLE5ItAtqXIC18+wTKapkYOS8ra4VNJHz1aFIwIWob60M6QjKKkNcoZPP1sE1db4E8S2C/qnFWIK+T1FPBCINY+aNmfSR8D9YoS3JIlXcFGZDFmPx5Mj8dG/I7bYpTvJyjr+0aqzQJlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fc6d179-e59e-3315-f483-a5c3de96c678@suse.com>
Date: Tue, 30 May 2023 12:43:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 14/15] Config.mk: move $(cc-option, ) to
 config/compiler-testing.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-15-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-15-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b0d85b-267d-49ff-4c5b-08db60fabda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JVxfEjEguH1Gol3OvBnqtMjg3piYDacG9ulzpx5IrJQJkAGxQk6gBUoNx+Z4Bxk92ULtRnVaS44uDfY0jGsJJFSAMbgCYVs1W4Z+1SSnX/Pc9tLqrsRgiDiwY5nMZ7YtpKS2HowIBmi/pWMhToe2a+v+1YllpD9fra+gu1OVIxCHHKDWhgrTTulMoNeUOIVCag1ps0yuvpWEcGtWa3R2dyV9hx/9V8bUGyiQVcxniVlUv5qDkmWeVeSXl8RQEZUQfEiW1cNmZn9p88DgYmwJwCzx2Jsqe7rvrbODdj56U9lq1s9stNZBq7x4b+1LFNvsRgGaCHNgy2i3SgaqyZfSOUlH3aWqBm/cWFn3zOn22GrJFCQTIhwaDrBxMnvImo5dc/MXjtaPOXKBPcuhEMtnwKKZPcb1vMfTT9Zt/uG5c2W789H943BVWKgylbtvn/y05E4VK+hn/u+XvJTeQTAtu8+ss8QOgK15S2PQanFCkjpYVs1Q99ONgAbRKVGCaTa/DRviS/wJoJIjC5aA9GLC2mM8wSuycMPPS1MTDwVVsaV3T+JbSPbcFus9vumiyiFCSKT3djnFG6/xoku1xUg3BcK70ZJeW5GRXL0VhnURIVAcM8jpyzLIHdkFtodNZvuMiKqsOc+B+oU5fiMOb7A1iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(31696002)(6486002)(86362001)(41300700001)(4326008)(6916009)(66946007)(316002)(66476007)(66556008)(36756003)(5660300002)(186003)(2906002)(31686004)(53546011)(6512007)(26005)(6506007)(2616005)(83380400001)(38100700002)(54906003)(478600001)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmRubG5NejZaSy9lV1VPMzRhazZpYXQ0aExJTjdQZkZpNGdiRW44Qi9lSHQx?=
 =?utf-8?B?WG1PZnkwVlNzbElqdVpXSk5NTEloZ09EeitqU254UU1hOGF1dmgyejRrNkdF?=
 =?utf-8?B?RE1yYUo1ZGlkb0x2YktDcGd2SUFRSVo4S3pNSnNqdStQS1I0MFl6NHlXVXNj?=
 =?utf-8?B?WnkwWklEN2wrb3hrWllnbCtLM0h5TjBjaEtSbG5pVUwwMjNqY3U1NXRjM1JV?=
 =?utf-8?B?bG9KbC93RWp3RC9zSTJEditqQlhidzNaTHhJS0MzektWREhCdTVvZFBFZ3NZ?=
 =?utf-8?B?MWFCOXBoaTdqaUF5K2MvWUFnVmQ1U3hvelUyTGx1WkVPUUhoY1BLekJxaGM3?=
 =?utf-8?B?V0FJNllqZ3NIbGNjR21sTk5pNHFVQnNYajlvT3pYVUNvR0trU0tkTnljUnQ5?=
 =?utf-8?B?S3EyVCtTVnB3TXk3cGc1WGVpeUZjMC9RcW5wNit3Rm9ud1lLbzJPZnFaNFl5?=
 =?utf-8?B?b2t5bkVXdGpHRmxXRGxzejlMdHdrYjI2NHQ0WGVFc2xzbHQ3clB1YjJFYWVG?=
 =?utf-8?B?UWhZK1lVOGhTVk91VHpLSGZlaG11aVdtcUNTWmF6NUJwc0VlMFNJTm12dFZO?=
 =?utf-8?B?MlhQWTR3N042czBydlV5UG9YQ25YMWE3dE1hLytZMTV3ODhabkl3bU1QaEFy?=
 =?utf-8?B?QnZDOHdVTHUweURZeXIvU05UWTJEVTliSHIrS1U4NXdOc2NUcUxwWTIzV0Ey?=
 =?utf-8?B?c1ZMcXhqU3VNOXJqYzlPL3dxL0dZNkNxS2tRZnBnNy83S2NZYi9xRjM2UW5X?=
 =?utf-8?B?Wm1xVTdCa0NCSVpHZnoyYzd6dWlXaEtPNzVscU10MGVMc0taUkN5Vk9sNjli?=
 =?utf-8?B?T2RmS25hWGRhV2RRUUhHQzl6RVhtQkFPOUdCMkQvVEthQWU0eFMxTklCQk1q?=
 =?utf-8?B?dFRVRldIQlJncWFVdE9KNkhKeGdPQ05GK3dPSWc1YWxtQ2lvNStKNURwRU80?=
 =?utf-8?B?ZzBYZ2l6anZWU3VUdVpZUnN3aWNmWFBJMzgxcFJ2TXhqVHA3UDBFdlQ0QkVy?=
 =?utf-8?B?d3FrT1BFRy9qb3BTeDdzNU5qb1pwRzNuajdWSDlxeEhLV29qOWg3akJoVjVp?=
 =?utf-8?B?WGFmMEZzU2VMZ3FHcUtENzJqWnJhMFZVNXViZUhkd1doNzdkYWtYTk96bFpa?=
 =?utf-8?B?dmJPTlJiOXd3M0RNWUZWdU0waTRGU3hYcGxObW9JQTF3OTltUFRsYVhWRkpG?=
 =?utf-8?B?ZmVtbVJhVnY0OXhVYkVGZVZzSjdaTGpYQ2hhWWwvcnNGMHkzN0ZLbWhyVWNm?=
 =?utf-8?B?ZDR2VndFRDBRdkd6TVhQVmpjTGtVTVNPb0tlWWJhUzRwRXp1RHBOTHRHOE01?=
 =?utf-8?B?c01FQWpzUjd6Z3hLL3NPNzAwUTJIdzFWR0hnVktyQmNwdFZMd2xOY203cFR2?=
 =?utf-8?B?UUh4aGY4bDgzSFYvUWhSanZDUFZ4azJNb2UxSTkvSXFwdWJtSUlXTlJDeXJ3?=
 =?utf-8?B?TFVHTDNRZWNrUDU0V2w3VWpXNlh2dVdnQWJ2WXpFaVBIc2J0MFRaQ1diYVZ1?=
 =?utf-8?B?OXlRcndJV1ZvYnBMeXlLeDNXZzVqVlE3ck54VUtwTGRhRUNsWlFRREJqOWNn?=
 =?utf-8?B?clk1aDRrcnk5QlROb1lGcklZZFdISGVjanBJR2hDaVozL3liVEFnUGV1NzlX?=
 =?utf-8?B?TTRRUXZOa25sRDh5aGIrU2xIdEo3N01WMDVkZmxPT1V0c295WGl0Vi9GQk5h?=
 =?utf-8?B?bG8rVWhJeWg1aVY5dlRTaVhVa3BSaGZaTlFwUEsxMk8rSXIveEJza2dzM1JT?=
 =?utf-8?B?K0x1NUZyZzBvMXFwNFdjQWF0Q3d1N3gvcHloVy9rWWV6dm1DZmdrZ2xES2FI?=
 =?utf-8?B?dmx6WjN2bVFvdUZNMmdDS2VSLzl5Sk9xVmFZbW1nZWpYQzNMZHZUZVVzaGsx?=
 =?utf-8?B?TkFURXpUblpFcnQvRWdzQm1ZNU5oVHNwakJ1M1N3RHpmajRVYWpoQWZDMGY0?=
 =?utf-8?B?THB2cVdscEpVY2FrdW9pK2s3VUVYMmkzdHlMaE1ibUNPVEhqYzd4WG5FdnZD?=
 =?utf-8?B?WTZyRW5lN1l3bHhCVEFDcTVwVWRXdzJGUGdJRVBMek1SNC81OGxQVUplUFBO?=
 =?utf-8?B?YnhZeit6eUlzTWdYSEYyRGloMFhlNWZSUDNEMEIzTkdwbUwwK0NwQUlNVXJ3?=
 =?utf-8?Q?rT9iGd7Cgt3+Y4iH/Uxb8IV6K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b0d85b-267d-49ff-4c5b-08db60fabda4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:43:44.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vArMV/8WM96ebvW8z+fwyT6IO1MWCJmUkVVSnWZ9R5KB4Y2UKhnJn0Ucaj7i+LK2A0BVlaS9CtCizTe9V5CD5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

On 23.05.2023 18:38, Anthony PERARD wrote:
> In xen/, it isn't necessary to include Config.mk in every Makefile in
> subdirectories as nearly all necessary variables should be calculated
> in xen/Makefile. But some Makefile make use of the macro $(cc-option,)
> that is only available in Config.mk.
> 
> Extract $(cc-option,) from Config.mk so we can use it without
> including Config.mk and thus without having to recalculate some CFLAGS
> which would be ignored.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

When I saw the title and in particular the new file's name which is
already mentioned there, I did expect something entirely different,
perhaps related to the testing of Xen. May I suggest e.g.
compiler-probing.mk or maybe even simply compiler.mk? (I'm also
uncertain about "compiler", tbh - I could e.g. see Kbuild.include's
as-option-add to also be useful outside of xen/, and hence at some
point wanting moving to some common file.)

> --- a/Config.mk
> +++ b/Config.mk
> @@ -18,6 +18,7 @@ realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "
>  or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(3),$(if $(strip $(4)),$(4)))))
>  
>  -include $(XEN_ROOT)/.config
> +include $(XEN_ROOT)/config/compiler-testing.mk

Possibly being one of the few users of the top-level .config, I wonder
about the ordering of these includes. This isn't to say that I consider
wrong the order in which you have it now, but I could see the opposite
order as potentially useful, too.

Jan

