Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627724F5DD6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299828.511042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4gj-0006NI-21; Wed, 06 Apr 2022 12:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299828.511042; Wed, 06 Apr 2022 12:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4gi-0006K2-Uy; Wed, 06 Apr 2022 12:23:04 +0000
Received: by outflank-mailman (input) for mailman id 299828;
 Wed, 06 Apr 2022 12:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc4gh-0006Jw-S3
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:23:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4db3b486-b5a4-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 14:23:03 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-WQ2EFeyNN8qXhBlIg-zMhQ-1; Wed, 06 Apr 2022 14:23:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB2992.eurprd04.prod.outlook.com (2603:10a6:802:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 12:22:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:22:57 +0000
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
X-Inumbo-ID: 4db3b486-b5a4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649247782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ttWm9ee+aHhw0r/e9vcokzPDdYX2VuhekspXIMntow8=;
	b=ntvnM20wc4nGddsJxIR/X06y3Pe5rOW4haJ+Krb8CPhjMU27y+TlIAUdER0Pw/pxj1x315
	rbKGhesiqJ4ZKul/Kww/Y1Vf6rF2E00AG2F9fldlqssaYOiz+wmvxLRhI5n7jl3iqFL0Y8
	L7JbvowHeeVpsWZF16ohZi24+Ff6zEI=
X-MC-Unique: WQ2EFeyNN8qXhBlIg-zMhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIbf9ODaJyaqGYJsNj1kkZiab/9WcIzCkRB3TWgf+k/HKdhuiEIcyErhJHSynlolxj+Qy/A0CciEM2WNDZSmeCcVPJqM86QQeHKi+00RXClFKCJ3AhXrwW1f+NAxaSJrG5bQkkISpMVnjgnrTfiNwV3XKbdPwBwZiAKVS3nDmj85UspY293SBhVlRA0Pt6Lb/C/Ix0v4IaiHErqirSD5r4BKhR85c0XxtXZo7nUHti53EtMb3bP+NngPGYZ+dEZfJXoenh3S1qucuZIpozlC5ZlYTOB1MFpRYaHcXY/QswEuJy8cMIvIZ9V+tPdZJroNhorPkerZDlwvX85q99FnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttWm9ee+aHhw0r/e9vcokzPDdYX2VuhekspXIMntow8=;
 b=J4tfd9I3s6BOiKvqdT+u3U1+6r6Wt0YjpXCOtu3ngx8xxLefgfy6LGJh/yhba1HzDCkyYZEDmEvejcD7GiBrrheoVJ6PzOelbeAtiwYrB2M5FmKnZiwzbmGYAeQeC3GPLcQ7ax23GTXdvEIvqhsgklvTuuX5cM/tnfAjnYHWjCQ/AY6kP9v8/iftBTy0FFT9XUuilsrasSWriUjHAi9x6OS8JXOBE7qMLxYUEnpDxWdjVqyX8AbwRAiHvcMHx3VyvOhsi6QiQnKd+soohJzT24Wpjzr8cGuJYX311XX9DawRTpSNifKWwvfMydn9k/M9RpVL9Y2ig0/bRcS2FUgIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
Date: Wed, 6 Apr 2022 14:22:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] VT-d: address fallout from XSA-400
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::33) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4476bae8-4b14-4f7e-2262-08da17c82eec
X-MS-TrafficTypeDiagnostic: VI1PR04MB2992:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB299296B8B49626CD4D4FC08BB3E79@VI1PR04MB2992.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNTQ3UtqfjzBgS11iyOHQq3Ggqi5mRUjarSJyBgudGW44H0vnod0r0bkpM6rLHFChiO7G0u2KUdp5mlLaKWnk5rCOoy5l+hENjaFleh/Aa7I4zh4M3dFVyce72dDL3WvnG63DZERoVKP63ql04R3f36Nw1aho1Iy6XhYV2QICgs/r2V90fmbtqfCDKFmZwJMbr6HkA6hoG1S4DMLEQKBk3ShSIW6DWWaab+q5N8G15ZB2NdmHVQPWsVRjrBwJFOF+sei0AHDXz3hWaUcJrUU3cVJBMlzzHRz21k1tW37D2dWwVIyb/OAa5il7gOOFwHlo/mqJfiFo0oB3YpBhcNDO1LxLDTbs8orzFIrL6lX/YKjE54wWMKYyRpP/dUNp2rvsxVAgniLmkKyhqQr/sHOOcVTP8YgtXtvv4KgmlOYgaopTUU6e3Pa1XzeZ7r/YZN7blpgQM53CRRqE//3cJOjsMoRGJbnTBdoWPkmFLxeTXy1FFv+rf4O9FwemaDUkpaA4yGG86QQ8IVb9x1hCizN4j1pWlAAirPnZN4kGHEaQy2V017Uq7OnXOl/yqjFaAPB96KLX5x9rUD60jSOyplUPSGtzWiZm/VCGfDH7ZDhf7LRV91WmUFrhVEcVvvbaPKjSk2A/JE0v28BqAogQDatuNlhvdGWzwBmz0yMyE8e0j2qQbLCrepfeGoWPPfI5Wx0xSYra8WAkewfA06ZKj3slF69IRmRZIkYpfWcLYzF+3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(5660300002)(8676002)(8936002)(66476007)(66946007)(66556008)(6506007)(4326008)(6512007)(38100700002)(31696002)(36756003)(2616005)(6486002)(316002)(6916009)(54906003)(31686004)(508600001)(186003)(26005)(558084003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2VSQmQ1WWNrN2hCZTZHMGk0VGNrU05Od2FWNHlGeTErQy8vNkNySlFwbkU1?=
 =?utf-8?B?b2gzdkxHb2tjdlp5TUVUOVBhOUJLWGpFK1BjNzBIUGFPNEpCZjh1cHpxZ05B?=
 =?utf-8?B?czVIZlEzUFZpcng1b1dwUUYxeGVrNFBvUHk3TDU1NVZhUmhvS1lxVENQcU5r?=
 =?utf-8?B?S3ZqZEdiWnEvNllQOVE3YnNzRXpTODFId0lvZytXajRDQWZ5cVBRSGJyZkkx?=
 =?utf-8?B?a0pleHhCeFZvOCt3NHFJMm1RNmtRbnU2YjZvWnBTTWU0OXpJOWNHTlA2VFZu?=
 =?utf-8?B?aFpxK3dxS1RUOGFZNEtzSnAwSnZKbDF1T2lzV3lqWWpZTmsxMFBGSG5FUjY4?=
 =?utf-8?B?V3F2eEw4eWl4bVlSUkNQNmEvQ2NQSlloOVVCVjZlMG54aUFVRUVRazVSTnVj?=
 =?utf-8?B?SzJOc2NUWFlncmc2aHMzOG1ra0pKemhZdTA2bGNxREVEK3I2NDU3bmVwcTlG?=
 =?utf-8?B?WCtQWWlOUzAvUHRmQjV2UDE4aXJsQzA3VU5NY29SM2pUZC8xd0N0M0ZaejdI?=
 =?utf-8?B?QkkwZnRFcDdFVCswbEZaWHBHOHlwd0VhdEs4THJhWWM1dmw4SHMya0lnU00x?=
 =?utf-8?B?clY0U1VwbzJhaXBMNVdPK2ZYcmd5TFh5OFlKZEFTREhOc3o5MW5SWjZyaDZH?=
 =?utf-8?B?aVNWNG5JbnRlMlZkeTYvcVRlS1ZIN3dQRHAxdEliMUdKZzlhYzh5VDhsRFVq?=
 =?utf-8?B?QWp3NXZJYXBuM2hrS3EwNC9KVldMKzZIL2RuT0FuaVYrbldNMGxRaElNQ1dC?=
 =?utf-8?B?SFNucmk2VWo0Ny9nZzQ5M2pkckhMVXdaOUVPaXBEWFllVFhuZEl3UGwzY0Jy?=
 =?utf-8?B?WDEzMnZCWEl4bDBHbjMxL3l1Y0U5QXlJZ0FCeTV6OUYwQzFoM0tnamRuSExZ?=
 =?utf-8?B?cW1NMDgwSVM0aDhRM3UxUzhFNFV3c0cvaGVLTzd1d09ib2ZyMnJMOFU3Nmh0?=
 =?utf-8?B?eFh2R3dyUFNMTGFoQ0FQajFwODFqc0J2ZVl5bUJsc05ZWG5nMjkrL1N3RGd0?=
 =?utf-8?B?dy9BUHAyOGtvTVE5cGZCcGJyL0pQSjRRNlN6Q1NoRmI5aUQvL3RBaS9yNzVK?=
 =?utf-8?B?ODZNU2JKMkRHQ3FYZlRkK1VvOHlpd1RIazdYV0M1MFJ1NmxCd1ZDN0lEcjhm?=
 =?utf-8?B?aGtTUkRrWHU3alFrMzJnV2wzQnU5bzliSXMxRWdDMzFWSWE4WlZjYW13bWtv?=
 =?utf-8?B?b2E3QmVvNTR1aTZoL09saGh5azB4RXBEcWFBUzlNQU4xTC9KSSttYUJPaWJQ?=
 =?utf-8?B?S2Y1OU1jc1RzczJtSjgvRi9uczFIdE10WDNraGdsa0RXcWJKR2J3b0EyeEtt?=
 =?utf-8?B?L3d6YmpvVXhGd2ZDMDlRakpnWjZTWUdEVU5VRm5NYmNwdmVzZTVpbzVkSFlY?=
 =?utf-8?B?R09ZcWhFZU5ub1Bvay9zYVRjTUZ1dTRuTFR0U2NyNmpBT0t4STdqTTl5UDI2?=
 =?utf-8?B?RlVLS0RzVEZVMmQzT3ZmMWhNWU5wRHlTN2pKblhaYUxHTlcxSEdEVUIvZmR3?=
 =?utf-8?B?Qng0OGRFR1M2WGtFOU1DMFhOSVBPMGxlQ0U4OGZkb1lsMitCc1daRkxycktn?=
 =?utf-8?B?eXYwblFndnpUbXpkU0NuQkhHWmtxa3JqK3Q4bzI3Nkw5alY1N2ZRMjFSRzB1?=
 =?utf-8?B?STFrSHFBTGl5UkowODBjOHhPdnFQam9nOWQzbko1OXJmdzB6eGw0L3ArR0Fx?=
 =?utf-8?B?VCtybEk5U1ZGUG1sd1hZVGljUTB5UzhEVCtiVUJLM0E1Tk91V3dRUmtEdUdQ?=
 =?utf-8?B?UFh1dWp3UGY2THdodkJoamlZOTFDUVVvRjlNS1BQeU9hVU9ING1SdVQxd1lr?=
 =?utf-8?B?Rk1qSFBCMWdMZE9PZkJpd2l2d3VOa29CejUyUitMWlF4eXFJRURlQUdqbFAv?=
 =?utf-8?B?eElXdnNha0hEeFlKVWJTeVRvSG1Dck5ZSHR4dll3VGc4WE8zMk1paGl4MU9T?=
 =?utf-8?B?RVRmSURvdnRydnpOakhjVFA1b0lVZ3IvdEVyOXlOL3pnMDNYQnhqSS9wV0ht?=
 =?utf-8?B?WFFyWEN4aUtnSDNhTllnamZIdE9BenFhTVppRnhybVpqdEY0WXJZaXBlbVhq?=
 =?utf-8?B?ZXU5VE1MSkJjTzJ3cDNleEIzc1VHd0FNSXZsWVowYVNaL0JsQXREVExXNWdH?=
 =?utf-8?B?czVDdnFxOXY4cFczaURXbnE1Q1o0WkxXY2h0TkozcE1BYTV6NW1RRzRWd1NJ?=
 =?utf-8?B?YWNhZ0V1WFJlL2tMTVAxcGswQ1ZrYmswS3hBcVVVWU9XL2oyb1A2S0tyclVK?=
 =?utf-8?B?UzFmUmoxbm1NL1dLQkd1aDlrRGd5TVlyUEdsOW1RR28zakE0UWZaVDU3UjdE?=
 =?utf-8?B?TmlCL1pJUVg4U2VGcUlFdnBKSk5hT25zRnRnSVUwWEJpVGRCWVpwZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4476bae8-4b14-4f7e-2262-08da17c82eec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:22:57.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9w/cbwn32b9o88alpZsrhQsNb0VEbe073oyNg0BbnUt0bJgSlJpSzuCnXQxlXeSV3UjfTDZiGz5nGVpZ86DXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2992

1: avoid NULL deref on domain_context_mapping_one() error paths
2: avoid infinite recursion on domain_context_mapping_one() error path

Jan


