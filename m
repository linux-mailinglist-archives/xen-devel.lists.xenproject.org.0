Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D4610B33
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 09:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431433.684329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJgk-0002Bl-MB; Fri, 28 Oct 2022 07:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431433.684329; Fri, 28 Oct 2022 07:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooJgk-00028T-Iu; Fri, 28 Oct 2022 07:21:58 +0000
Received: by outflank-mailman (input) for mailman id 431433;
 Fri, 28 Oct 2022 07:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooJgj-00028L-8O
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 07:21:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2075.outbound.protection.outlook.com [40.107.104.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c60a38-5691-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 09:21:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 07:21:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 07:21:53 +0000
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
X-Inumbo-ID: 33c60a38-5691-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV5erz9oEQdMcoEAm3htOgDfSAXy6K5nmnLq48x7fXdZcRS8i63DziepT2Mkuw8hl2Tk9lPlsAybmptrLfOodvkQxo7RE5lQeHbqXP6j/w/m5lJt9uvG6fXQKBYvFJJeHPX4YouAOE6MbCwvpjZN5pvkzJiuPSJ1ZSG18aM7L+vlU4Z6GWboPpGOeZdev4yCD+9N/Lk87fwMj9ipPMRJkyy7gpIxQ5ViqbitBeTtxggMIUCP+VdGSArUyXyMycz1yrvJH1uF3k98vJtNxgavBadg3lBmijL1bUOZx6oR1Xs89Y47DMUvo9+INis98XILfZocLFXbXCh7v295FmKg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIhWJYPncYb8h4kWhPCveJpPZuHkPif4kdTPxSU2Ykg=;
 b=QZUyx5uiObIxM1V5G7249iHsNDqtsQYm6a5rdV8d8GVpkHVs7GVxb7+gWsKSpOLtp0NIelOGr51z0BwfMeOsvI0VrthesU1CGrtZffxTehIfIXq2w44zFpseSuPoTkdW9NRywalD6FLStgFT8fCwj0QSS2VagPs/lMKl5GUzIrdMz3aHHcUFM1EB8iak4yimRqPR6/VR7rO1siAv+5tMvEz7x9gvvisBx6W8EkAt8N2CTo3/+ki9/XqZxaB7AtYAD6mulhXvjJz5JWdqMRPlVX5u0T2ayU5wWw7k1xYO7mvz2TPrPLL6e2r8d4HB4UjxZP07x0tREaoDxlepV8zP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIhWJYPncYb8h4kWhPCveJpPZuHkPif4kdTPxSU2Ykg=;
 b=wbUyDYfI11shxrh2N9Z8wo0Vm5eMMWZMfjyHWvxBWW2yqjnkNHrPqxhyIlALufhum8/xSlxY+TM45JPKGZbv4Z5uPIl4jSjbzF69gg2nLO9fJsc+1qRLRuIQoJT+yl3xVSeFDkaJ6Bbl2phXurPlV1nSJaSrRjLwCaunVxaWM+yJJqsFU1R/IYslQyTz5VdTpcgSK/bwrPZOe9WvDUpfkvA6wWtD1MQYYSmB5vKLcr1KGhbZQAgCRr2iFGGkVRVnoC1CHzu/H96x8uQ8YvCmwlNusep7DnmlF5+DRhLPuYUydrBcAx3v0PdrlK+Jc3nSZLdGWdjOnvxLd1jJhvIl5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2678ded5-f3d1-12de-91b4-ef2ac14cd5d9@suse.com>
Date: Fri, 28 Oct 2022 09:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: [PATCH 1/3][4.17?] x86/pv-shim: correctly ignore empty onlining
 requests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap <george.dunlap@citrix.com>
References: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
In-Reply-To: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cd2d88-69a6-40bc-b50e-08dab8b51675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NMW+S6LP+vkSEiRuif0795HAyFavCXKTAcvuAViytGUm/D4uP5BhCN8e7y3/3gUv31DQniY7q6F9CCfcM/84tTulwuEQ5ThVFHykeBLbkwtqYjJu6c7qbdpFQy7uNnyHfsftezIBuPzj5qEJ/dizm0jJN6UJ3f6Ty2CBphM8MCoudg5Lq0NqP2abfd+AILV1jxfppkqY5+V1UKMeAi9FrZFIxFZd5bM4WxR4W4COvwCUTtO4DLepC7NBYjUuXlBmB08VwLSJuj14FlfczQ4arTCboZZGfyjh4QXRPsyNwtjPRuWPN3mr18d6VyFCIHNgHCcBZRG9c85m7lzouW6YSgeAdC8FWZhl3BP/gAWqgb6tPChVX5MB9J8QUnX09Jfgy3R3MApvAxPmVxHHFwyuW0UX62f7zkQLXq4o39VMt4Or9X1eyJ0ANsyNmGUtaBIZl+Vjgg8ktIgP4EvNyrPEVtoFO6oj5EmoaJAYllcNABdOEXGgEF342LLAMDYW2tUPYx9UcCQYnCDI+AVbjRWQTauTqU1OXUxiQUjxxJyy5GAWvW3GoIwcsX2eXlaOBMDhR9TpQqxeipDvjMeAPGAGnP54yvGWVKlojYr2rxBBvPihHkCaFWvrQtosU2IBih6Unut/wKYUQ9TKNoexA4+XaaeJa0gGHqktTOZ0J+d3UPiyBfTCbm5V+uKfXYluwkM/SJtvM9UwXUuOBQuNvNqiisN9ExcpMDvweCXAZbJ+v8mgJoXUIbnKbewMlRa6MiUrWSDXnsTW+DZy1I8gyyXmtqQJ501AIHuViaq9QRh9iEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(316002)(54906003)(6916009)(8936002)(5660300002)(2616005)(186003)(4326008)(4744005)(36756003)(8676002)(6506007)(66476007)(66946007)(66556008)(26005)(6512007)(41300700001)(2906002)(83380400001)(86362001)(31696002)(38100700002)(6486002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2Z3VTVoNVRGMDRnc2YzMnBkdFdRRW5MSUJiM0pHSC9qQXhVNkNHY29YODBR?=
 =?utf-8?B?QVIzTDZkek9Ycms5b2FUUlA5STJ3bXZJTjc3N0s3cEtPT0FKbGFxWS9oKzhD?=
 =?utf-8?B?eVZ6YXcxbWNpeXB2c1ZhWHp4MjVtUHZvdFBXUHVxU1JYL2tTcDhNMFV0dW1q?=
 =?utf-8?B?Z3RhNHRhUjNhTGpjWTFCUGQybkRqcXVZOU1WSkdWUm1VVDIxdnJOcXpvQ01K?=
 =?utf-8?B?Z3BHcjA1SGg3aGJSclVNRkpacGM4TVJwN1Q5djB2OWFZMzZLRnNJWkdIaXBI?=
 =?utf-8?B?TkVScHNGaEhFNnhudFVGemF6RjZlR0NPNjcyU3dtYXE1cUUzNUp3MGFnR1ln?=
 =?utf-8?B?c0w5WXk4dkpNekxPYTJoN0ZqK3VpeFlHclRVRkQ0WnBJYTBQQXBmekhEVE9m?=
 =?utf-8?B?OE5GQXZLb1VKSlRraFZmUzB3RjRMbXdXUGg5Y0NNVkZoYmMzRUxFRGFXMDJK?=
 =?utf-8?B?MU5iUjNkRUVpZHBLcjBnV0k5TkZWWFVrSzhTTG9tY2RxSWwzc1lKcEtYUVE0?=
 =?utf-8?B?KzdJL3U3Q3RGbEFpYlQ1ZjJMQXo5aC9XZXZIZGtEZ1RxdVVTelZua1pkaDB6?=
 =?utf-8?B?VzBoYVBQUS9XdWpoMzJWajVPNjdTcGY1dEpyd0tPVzZmVkc5ejJvTW0zUWJU?=
 =?utf-8?B?dnRZTW1CL0RoSTJPcUlnYzE1bzBiT2tpVkZtVTNDbElTSS94TDJtVXNaeTZZ?=
 =?utf-8?B?Ums0YVRGUVVEeEtWcTFYb3ltbHA1aGwwUkM1QkV0N3pNZ0NWbkxQZ3VubVRS?=
 =?utf-8?B?dk5SamhwWEFQMDlUUk04VkJNOXlzMEsxS3ZWVkY2c2Y1OVI3TmdPZUJxSFo2?=
 =?utf-8?B?bllKOWExMm5UV1Bmc21SZU1oZTdTTlVMWFlLckZNL3hoTmU5aXV6bS82TmVx?=
 =?utf-8?B?MGxLcmV0NXNEdllUWDAycVg3czVMT1V1dmVBY2htWTE3YWw4QkM3WEhsTTlG?=
 =?utf-8?B?c3Rwc29PalBZU2VQZFV5UEtUMnJqQzRDbTRibDlmdTY4RFF4emtGeVhHdm5a?=
 =?utf-8?B?VXRvTTJpbDU5WXJ0MEZ0QVFxVXJOMFA5eTgvSTh3NlVheDJVcXF0Q1E3T0dS?=
 =?utf-8?B?UHgxRnB1TGdrYXgvWVoxYlF5bFNFRUNyTzcxMnlCUHVWMHo5S1hUZHJKTnpj?=
 =?utf-8?B?eXFGTXdYdjZKbXdxRFljajQ5UHpOQlJrWkhGVjFHTGE3Zzl3a1FPdGdmRWpP?=
 =?utf-8?B?ZC9mVlV2aHBBZVVYWis0eEhlMllzUEE5Y1ROOVZWOEpIZllnc0Z5Um9uNVFT?=
 =?utf-8?B?WU55dUNmeGQycnduTXZ1L1ZLRVlHcFZGMDlwYVZ5SWtwNXpGbE1xaHJFTFor?=
 =?utf-8?B?aDBWNHpPL0I3a0dWM2sxMTh3ZUg1QlFRUVZ4OU50ZnZCT2FIcmF1OVB0Q2FF?=
 =?utf-8?B?eUVORXBBSHlld1F2NGtrWU5jU0NSbk54NXhPWTRRUHJmdkY4NlM2cFNvL1kr?=
 =?utf-8?B?U29mMlUxWFJWUkFXT2duZzF6QkdySnIvblV3Tmg3V1JvbjhQcEoveW02VHQz?=
 =?utf-8?B?eWtkUUxITTRZRHArYlB0Sk5VakdPZyt2aGpVdjFSelRWOGtJa3NRN0R6NkM2?=
 =?utf-8?B?NjZvYlQzeFlRcmdpdlJnWHZxLzJ5QTZMdkl0Nm1ZcFYwU2JjUUMzbFZ4YmRW?=
 =?utf-8?B?NHk1ZXFmRndvVXhiNDNsUUlLWHFnNUl5RjhLdm1tTTY0dldjTTA1QkhUM2Jw?=
 =?utf-8?B?NWlzdDU0RWFoeWJEMGFLV3QxSWtOMHdiQWlPNFZtNTVoQnhNSjl6YmRWSEQz?=
 =?utf-8?B?eTJUcDNuRjlOOGl1aXlYazJEaG1UZE94dlE5Mks2RWxxTWtyRDRIWWRrRUkv?=
 =?utf-8?B?VUxHM2NJeWxBVmNCaVlWOVF0YkFhL2xOaEZmaGtrUUppcCtwK3FFb2EwS0tK?=
 =?utf-8?B?WVMxSnVGZ25FYW43NGFXa1BJZlNRMndYQ3VveDRjUU81TWJmYnQ2OTRxUS8v?=
 =?utf-8?B?ZnVxbWNIeW5YTU1ubDR2NlRJS1MwT0lsbFNlK0h5RkZ3UGRMNEIwY2RFRnU2?=
 =?utf-8?B?Z2dpYm1OYTNxQkl5REh3WVdMbnhPNWUyYVZYSDNUTWQrTllHZU5MOGtkM0h1?=
 =?utf-8?B?TnVuUjZ3TlJzUDRMTGJvMGw3VTFsc2N0QWhncUtqVk1Nbmc5MkdJcUxBUlF1?=
 =?utf-8?Q?yQTLt4DA9qTfxmWDoRDhxn1IA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cd2d88-69a6-40bc-b50e-08dab8b51675
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:21:53.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inOAM9FkWk89zo1JOAA6NBvm8v+tLfJsrV33oAJqFnj9dcqjl+vl1YkEYDWNaOM8ZHgOAGC+1RmqZY8lVKOEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Igor Druzhinin <igor.druzhinin@citrix.com>

Mem-op requests may have zero extents. Such requests need treating as
no-ops. pv_shim_online_memory(), however, would have tried to take 2³²-1
order-sized pages from its balloon list (to then populate them),
typically ending when the entire set of ballooned pages of this order
was consumed.

Note that pv_shim_offline_memory() does not have such an issue.

Fixes: b2245acc60c3 ("xen/pvshim: memory hotplug")
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -944,6 +944,9 @@ void pv_shim_online_memory(unsigned int
     struct page_info *page, *tmp;
     PAGE_LIST_HEAD(list);
 
+    if ( !nr )
+        return;
+
     spin_lock(&balloon_lock);
     page_list_for_each_safe ( page, tmp, &balloon )
     {


