Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FB53A994
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 17:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340519.565571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPvf-0000BO-15; Wed, 01 Jun 2022 15:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340519.565571; Wed, 01 Jun 2022 15:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPve-000096-UC; Wed, 01 Jun 2022 15:06:34 +0000
Received: by outflank-mailman (input) for mailman id 340519;
 Wed, 01 Jun 2022 15:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwPvd-000090-5u
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 15:06:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b74b9c4-e1bc-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 17:06:32 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-n15_hrpYMu-ufdaKvupBKg-1; Wed, 01 Jun 2022 17:06:30 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4320.eurprd04.prod.outlook.com (2603:10a6:803:49::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 15:06:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 15:06:29 +0000
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
X-Inumbo-ID: 6b74b9c4-e1bc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654095991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rg+Wj+pnmP/KzNgZ8zU/T4xM1gq+BWv/F6lOr7MqrIY=;
	b=NvGiGeyWaxivKk9A7m6oKJcwNtwkEJyXeCm5/kFeY873ccdXQE4oFDtkgN86XkE3AyRJX2
	rSUhCdHaxm3at6g47KKlyqtO9SDA+ItFkC7/nBOtOoZu3gkw78TzuP4uqwFg8v+cG47wQy
	DPYFWH7MQnoW84kteAxVuy3luAHLNKc=
X-MC-Unique: n15_hrpYMu-ufdaKvupBKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPDMsa6YQYBOZX/QvgXZVo6+xCycPpM12h3KUz4GJdMrouayvmMvRY2u8FdAvlc0ZORClQuSNhH3YaCyVU+xDPQ1DA8aJawVe7U/g8nVLZ93BURR6MSjcAB3WewTvQkkqb74BxR8OBh10WbWMxLeLE1guYmZ8aKhCmuGTHZav43rl/s6Pwtk+6Tnd61Z6L+3D0pV7RVqfJan24RLoXj38vp/YvjsA0imUOBh5lJq6FCXgDfUCSPpEYBRNqtHZrLmw+fGTR+jyWcY4fowLt2b+35TyK/aHXSaHWtfL5JvFmqndcO2nsaEPTbSQuCPC/t4ahIwPkRXjhQ25f1y2oImqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg+Wj+pnmP/KzNgZ8zU/T4xM1gq+BWv/F6lOr7MqrIY=;
 b=MYgx4XfqeWmYhgcc77PIEG422Nel37hrDHEgQ37nXahPhDDZpyMX0JZx4tkc1VQQ/YQ1koahXpEZErBjxlmWX6+hYizsv8Q4FC2rMVa0BPYLBt8CQ8W9pZkbAx+9OSaAh4MCm610gOBFUr9Z/x3Ej5pSQaBP3XQSympFlA1VSdsyvEiPbJZn/bLvURmOmwGbdQ7ToI08evnnCNDREI+7UrzlkwlcXurD5PgjLOHYtpo7rq0vLFw+PpMJRM9Guxyli9gzi3zgtv0NItWygOvSZkh2qYNpzaNG1lC8GdxD7QWhy5b82+gtX3hCgPr1UPcrozK9lcHz3VPZZlagzASx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f463934c-c196-6c25-12d1-85f5494de593@suse.com>
Date: Wed, 1 Jun 2022 17:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] x86/spec-ctrl: Enumeration for new Intel BHI controls
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220531192137.12468-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531192137.12468-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 628efdae-14f3-4281-5498-08da43e04e24
X-MS-TrafficTypeDiagnostic: VI1PR04MB4320:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4320D29D702B86E743702051B3DF9@VI1PR04MB4320.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ANFDMhvjlwG/HvTGqZJcd2KSvefNkBrO6/Kpk2sjI2ZjUEqGPpMPolU7kYc5woYpTr8SYUU+0WYWLXPW92WcP/QwszNPZE/CVQTa+K+Wn0BrqRhIHwikM0KAjexv+CM26gZHJaZBtGpATP4RXQVRjSVs3rEqMQisU4aKlcxOD+dU7IYeS28rGceugqC0cLltNKSCN6kmVM3GFQCVgbELuH3bHQtjgrFMQ5YTsyEoLKKUeJMEdeLlu2e7uPL+Y9hJLarovcVnvuXRn0howxzNSXyPR/0XaWJpxQfH2E15j6yCvNCFq+hTPuzgWzaHzDdXmj32l48m4EyYYrTNj+n0PnZeKPrvz1H+3yMNMZP3b+1kKRzVYHJyzXbfTjm2VmCqrQyMfBDl3f03s5fwrkiQvD19xPZleeRGdTOKzVj2BCZbYJbzUWA1ApVxFd+TF6+ElFEyHW+rV4WNZyddfAioGh03RHSMextFn8U4jciYEU5E+7I1PaViLZg4/M5AoWsHPZ3+8qQuTgG+TrGgCxKaTb1ynCs0D6v530Alqh6VOBr2Lu0ldtU2W6yzmCJPVpHT/KIsrBwnzicuM0mXAVlcKferVWoT0MMjpMAlVevfucqttBBkLnUVfgFcoVfPM9tPNsSO2B6I1XQHGBDmrSbmDhe6pAfEi4clyrgfpQSXUc/aul++w5qNd9FOBLiqLNU8zHgFkwRyA9tJazFfD7Q91NgTgZccbVO9C8Mlmaae9PaObt5mvo9g8/nFckv8d5iBFPstPbL0Zj3K04ZvOn/fCBnmZe8mfe0SjMSYoUtSwyz+PpPUk9PKXMTXr7I/4X+3se/jwk7ZRqyg4ByQr1sA7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(966005)(6486002)(186003)(2616005)(53546011)(26005)(38100700002)(6666004)(6506007)(316002)(66946007)(66476007)(4326008)(8676002)(66556008)(8936002)(558084003)(5660300002)(2906002)(31686004)(6916009)(54906003)(36756003)(86362001)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmxCRjVUd1lWZ05tMVVZUGtRT2YwTCt3VklzL3pUTzdRZ0h0RmJoUVptT080?=
 =?utf-8?B?WlZrZ1l6ekhpN3pvK2ZlMlNFb2RGeWswUXFqdWd2V21VSlRiUUxqN1ZVeSsx?=
 =?utf-8?B?aGM1elVKWlhPRWZSWkJiY2M3TGxEVWZBSExza3pXV3g4T3piMU1aUEZHNjhG?=
 =?utf-8?B?VDRQVThrZTJPUDhuVDRWQUtyVWx6aWZEOGpGVDFhMW1iMTZKVWZEQytlT1NL?=
 =?utf-8?B?WjAzVURnZmdVeDFLYituQlF5eXZUTTNLQTZEbWpmejRqdlF2N3I1SElBM2tr?=
 =?utf-8?B?UTFMb05qWlU1V1pPRzZDNTJ1TU81eFVxZVhweXZPRjg0NUpIdmZmQ0M4R2Jl?=
 =?utf-8?B?SFpVdTc1U3A1V2p1amVpOWFMK0xkdlBtaHY4S2lXMWFtMHVLd2VRYzlOa1Jn?=
 =?utf-8?B?MnNIMnYzN3d6dXYzcjBrQzZPQlI3MENtQUtNa1ZRbXJEZ1AydktISHIwUjVH?=
 =?utf-8?B?MVgrMHdrL3VmM2RHcGJMSnF5MG44ZUtUK0xCRXlSZlA5Y29aakp2Z2hSM3Mv?=
 =?utf-8?B?Ui9JMjFJZk9qaHFGck8vdHBvQkEvRlRSMlFiazQ5QW0xTDlYVnpMVUVBanR5?=
 =?utf-8?B?NlVNWEVHQkVLVlNtSFNzdlNnUzVlSDlmOFM2RUdCdFI4WGhmRVd1aVJjZVow?=
 =?utf-8?B?N3VQOVBUT1ZwZlpiMEVOZmtPMDFIbU44d1BpQ3hYL3RBUEhMWU9wdGRlQ1E3?=
 =?utf-8?B?am1PazQ0eGVLRFc0eUJFN09hdWJORm1UZ3YxQ2UvdDROeTVEbVppR3BLMnVj?=
 =?utf-8?B?ZmQ2NFFQWk9xUmZEWGlsUkFPWmtPMHRZQzJ3Yy9hSUVTS2Y3OGZ5YXN1RmZu?=
 =?utf-8?B?K2huZ0hkM2sxSms3ZTBnMk1QZTBCZnBraFhwUC8xL3M3ei9yaUFpclFxMmtJ?=
 =?utf-8?B?MXJlT0RicDhQVmorblZHTTlrdGNWYVBnazloUGd5VHNPSFp5bXdTdVZlYUVx?=
 =?utf-8?B?NnNnMS9uaGh1V0UwcU9MdnFoNXF3VW8vRGplckJUcUtZVjJMclphcm5iRGVP?=
 =?utf-8?B?QlE0QTRHN2FUUWFpbXhFUU13WWVrS3FESFZiR3lIaU9CMjJ0ZzVQWDQ4N1pU?=
 =?utf-8?B?TFNBbktYNE15M2luSE1MaFo0VHZjM2RIYmxVKzVuWlk5STlLc1RGWkxxVFA0?=
 =?utf-8?B?bWErQVlkK3FCcEtSLzE0azlQbFJ6eVZZWUViTWF1eURNb1VsTmJkbU13NC9H?=
 =?utf-8?B?dXhkelZlSkg3NWFVeG50cGYzQ3A3MjR6c25VNWJvMXlUVFlJUFA0NmU1NFRP?=
 =?utf-8?B?eTVDbjBwMUJUQ2pscEJmVTJGYWpYbE80aWU0WkV4WDhldVlPU1IwY2xEOFNX?=
 =?utf-8?B?Q0JGRWMrTnpLcFBSc1cyTU5tWjFhNFFCQ09kTUYyMEdkay9GK0Jjem1OcnZK?=
 =?utf-8?B?NlAxRDJGeThSSjYvS3YzaGNOTEorWWxVTXNQQVRmK0cxY0lLaG1wZkZJR0E3?=
 =?utf-8?B?UXhNckt0NEVwRG1xNHRMaGw4ejhkNVJjSy92Rk1ZR0RFbnVaQlUzVHJJU2sr?=
 =?utf-8?B?SGl4ZzFadXR2TnkvUDNVN2lPTjE1UmFnNXJOak1jdGxnNDZEUnBPdHltT3ND?=
 =?utf-8?B?dktZeVlBSHdHTG5jaFc5NnBUVVlBOWo4c2tBTWhaTjRqZ3EvcWFVbmZqUHVo?=
 =?utf-8?B?dENzZEZJSHJvdkhjckpKL29zbDFUYzVnWVBaMnpYbWsrZS9XQ0kvQnJRRFRW?=
 =?utf-8?B?Q09QK2EwQmxpVXpNR1Bkck5NRVhqOHRtWFo4aFlxUmxmR0hzUTVxUWpYNkY5?=
 =?utf-8?B?S1dKVDRtS2N5Yk1nTWdTU0E3bHE1NTNvNGZCclh3a2haQ0h4cjU4S2ZwWnJx?=
 =?utf-8?B?Ym5BVFJ2WFRYSSttNkYrSU9TdjE2ZVJnVXRiWVRXeUc2eC8rWC9WTEZhMjNp?=
 =?utf-8?B?bjVCUElWRGtxa0ZvUFlyYzQxdXNKeVVFNFV2cFpaUDAwSUZTZzZ1d2hHMFhZ?=
 =?utf-8?B?Q01MeWdoNEYwcW1ZT2NISk5BRUQyQWFRTHNQY28ydHlyRS82cXVZZ0lWZVFR?=
 =?utf-8?B?dXlrSmZ4MExtZDhJR3hlNjY1RHg3U2dvM1ljTXlVYWVrRGNpc3B0SVdCRDlG?=
 =?utf-8?B?Z3JncGhwN3dLd3Fkb2Q4STdZd0tWVHFXWGdiTGZkTDhqdGdPSVpGNnBTYkFS?=
 =?utf-8?B?MUl2YldEWUlYWm9RS1VXeE81WVNCY0hzVWZ1S20ycXRBKzlyckIxazl2UmdX?=
 =?utf-8?B?YXI4VkNDV0FCT2I1WFo2MTlGVXhwRjE4cW1INXNYVDFtcGxwdU9HZUtxaW9N?=
 =?utf-8?B?ZmV0aDB5L1BRTE11d3ZOVVZLUGxMcDJNd0dmTjYwWWh4WGR5YU9WcDFwb2Yx?=
 =?utf-8?B?QUN4TGw5SEJUdHNOcm4yaUNCSUxpMnc0dUhVSWJzTDAvQ1kxZEpzUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628efdae-14f3-4281-5498-08da43e04e24
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:06:29.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63LZmiOup/2MF+fSRQQt/Fj7cYb6ZMxWIulG18Ild+YSIY0pTpHRCb3akwJNBRz0rwMTOpyVEy3BZra9QS+IRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4320

On 31.05.2022 21:21, Andrew Cooper wrote:
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


