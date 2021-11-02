Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0212443180
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220358.381608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvdF-0000Kp-H6; Tue, 02 Nov 2021 15:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220358.381608; Tue, 02 Nov 2021 15:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvdF-0000H8-Dj; Tue, 02 Nov 2021 15:23:25 +0000
Received: by outflank-mailman (input) for mailman id 220358;
 Tue, 02 Nov 2021 15:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhvdD-0000H2-Kj
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:23:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d01e0e66-3bf0-11ec-8558-12813bfff9fa;
 Tue, 02 Nov 2021 15:23:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-Dz61UtDgNDCELBlaoSa3Yg-1; Tue, 02 Nov 2021 16:23:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 15:23:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:23:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0081.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 15:23:17 +0000
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
X-Inumbo-ID: d01e0e66-3bf0-11ec-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635866601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRia4D1qA31mkef0NY01MZn2Qmj8+Iy0JRLsQc6vzno=;
	b=ATn46Es64k56S3FMmJ0PQYZMMa2pZ1brn2jBG/DfXPLbDo9ORAN8x+Vtm4x/gZmtfU/Y/S
	07Fk1vi9YHposDoNtAXoZPugRgVpGuH4mRkIMeVSUJ5GUKywQlDZnpQGlAHj5epvWU5O0G
	0+xchoZ2qykWcWBpNxYq7utvAP1x72Q=
X-MC-Unique: Dz61UtDgNDCELBlaoSa3Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv5ii3a6sysRu4c/6q4T3SoiKu7TcxnEFzKVcgINxcusZ6IREsQ5k4/JZIPQbUiUVW1rxGsiT5WS0lFVKbAn8lth8mum6FqIgbwRC/2b4+7lXj09lqgOn9UTRoZt+ngAnvZY9DLpcolu4Opku2WBtuaoaRNvm/T06pBH3vVGyAtrAFCV5p9Rq7kMJTXvdXIoJbpRbJXaTc+Jlyh5yGltas0PEGzQgh0kmRGHRjTKEpkeRZn2+qD2eOyEOf56eKREZ9jMXvNbjCPlJ1UpS+e1FpNaVY3fF0T3yMxP6xFGVDVO5MXVxJLoowkBQyfBhnDXU/xV3amkD7KzEzUtkQ8N/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRia4D1qA31mkef0NY01MZn2Qmj8+Iy0JRLsQc6vzno=;
 b=VqV/YLD93EpYLFHCez0AqXlNRhVBIrBahSqVLe2egMfCb8Is0QulzweY5gCNmN7ojU46LV/+QiA+wi1KhIrPUd1MHRvBPzFgTPcPCtBRwZzOgx+pV3XDyX6yV99p4zPXYBZ74b6yevMW5yTXhpckE1sRc57xAy25rAVorju2KasCezLp+u0M7MyLKgXmQs61xXk7HljSKA+lB8Xax9NSYICi55UWm3HzkPMqQCZ70Wh8WmykUTwKlHXOrtQfJXe4le3T0Ehg0t/osEf1cGRcwNZVWIdDta2gGOqox7xtOdYkdHP9nX39J0MMni1Eh7t4rwTJcQg1IAKCiX0Lyba49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <deff112e-2546-43cb-0869-964336d27f8b@suse.com>
Date: Tue, 2 Nov 2021 16:23:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 6/7] xen: Switch to byteswap.h
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1634897942.git.lin.liu@citrix.com>
 <f5a79881bfdcef06aa950632250f551e0ec26458.1634897942.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5a79881bfdcef06aa950632250f551e0ec26458.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0081.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba14070-78e6-40ca-c0eb-08d99e14b22a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53259723F092FACD6973E40EB38B9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQFZyAfNZJRTl5bCPS1A/lodL6onHxysCb8AhZe3pRCxMU+2m/E7aKMJpW99T6X497Y5FpucrdBmckWGBNiwzdlOSypB8vy0+wTGgkykX3DEZJsJUoCSqeka1wpD+8pV6l3px+Vj7Nogb0md5mh6C/3AmaGqLKmh1BlSR4Y1o3TCMERBkwniESfyYGlmYMJEbV/RivcUiVOrKojikUUFioaS8pbwQlwGlt67UkLTYEYxNT+AaPdKNyeAaTRR9LFtshOoiuy+pNzjFDGAqPdS/ldEcNPCUK5t+sVT4M8s+CZ2HsXGiNrblgbEUrUJRfUdxncfnzDoIpV8mD/AC0grWMkO8tMele8cZLyUxS28Pn70ldIrfb6VK05SfFm4fuqxPI5IZhXaiu0LgWAnhTESBjYrrNKcAkIQvdP/Et+Fs+DojkW+POlg0G91B5L0kAbJvYheSIDV36NGyZgf1JswT6+PLJrSXhHKZCoutlQb4jehIex108ndfuBqYpnCoWDj5vX3uQAzyy/DbFISNjBY9Gd/AiXeyTjy5ujXuLp8jrDnDcHa6BZoB94At6Xd6PCigEb7f96JdxqxpooPORsKlo34sJi2Hq2rWE8XcOvfqdM1QWbCeG4RPk0g74ZZff91aI7H27LGoMQF2K9DGwy1ReFv+U5kmajd2F7M2rQaQ0d5TQLhSClAjWGtUWhncuBTHx9RXQKcQZzWrkZ8sgaYqLRvJEFfkIQmHDdxqjMIm0Zfc0zNWWX4hn1j+ilsC4rZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(66946007)(316002)(66556008)(53546011)(6486002)(38100700002)(86362001)(26005)(66476007)(186003)(2906002)(16576012)(2616005)(956004)(508600001)(4326008)(5660300002)(4744005)(36756003)(54906003)(8676002)(6916009)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJlb1Vqejg3cTRHT1VMdjNlSStzczVEVnczYkl6dEpVaUNjYm1yUHlueHYz?=
 =?utf-8?B?bWdXa3MrL1RlUGZrc2FHNlRlV3lKVVdYWU9ReU5KT256Q3JUMGU0Mmk3NkxE?=
 =?utf-8?B?TXlObURvd2ZVVkFkbnNKV0pRRGdVVXEzQ0JVdUhvOXI3U2o3akJkd04yZS9Z?=
 =?utf-8?B?SVFWMGVJSDd4SVRTVUJXejdFbzdvRnUxZW9yVFpiK2c2bnFuakVWNkUwZU5U?=
 =?utf-8?B?WitTbERaMk9wNkloMnhPaVVReURhS1huV2pPaGVkYnBaTEMvdVU4eUgwUGhN?=
 =?utf-8?B?ek1FVng3UTlLM0FTR1RhQ2U0ekd3VmN4R0s0TGkwUi9Wc3oyRFdWdzJHOXJZ?=
 =?utf-8?B?VnB4UENiZ0l5TnRsdnJKY0pYcXdpY3BudUwva2NjY2FPM2l6OW9XM2pEYVM5?=
 =?utf-8?B?SEJPZ08rZ0VJM0E4cEo5K29kei9uM2ZLbGI3b3NNY0tvekNlbTBjQ01qOXVw?=
 =?utf-8?B?WmRJT3Nod1JIWE53ZHU0dFhoUmhpS0d2R1l4UEhKMVVkREVMemZpSUwxQ3ZC?=
 =?utf-8?B?NHExSTRNcDZOK01RUXpwRjdZRWFwL1d4b1MveTZGbHJKSjhJUittdVpVQkpr?=
 =?utf-8?B?NFg3WVBJcE1ySXNyckZnWkNoNTlmcllpMWtSeWhCZnI5dDVtN2VhM0gvTlpR?=
 =?utf-8?B?aVJvaHpKRU93UXBLYWVZYlFldlFZYmdsdTZycWlEdXdQRG5rVHlZNDlCSGZ1?=
 =?utf-8?B?Vzg2SHNRK0VPRjJERkpWd3VOWnd0VkRTSTZwZUdUOXQ1L21xS1hkUEErdW9G?=
 =?utf-8?B?OEllb1o3MVVacmlDRVN1YkNsZHNTQlFPVUY2NWg2cEF6alpBMmZFNGpVZHhr?=
 =?utf-8?B?WmtYNTJQTHN6RFZMUkhoaXZXVi85ZkVWUnZEZHJwRTUvWlZVMjlpWitVSVBm?=
 =?utf-8?B?RnpSbTRaWktxbU8vZERnMXgwV0lnYUtXU3E5TC81MEJDMnVvTWw4aXZ5MVhD?=
 =?utf-8?B?Z0M5TUFVcnRaZ3hpTGhHdHVIaGE2QXpLaDVrcWdqcEF4UGhxVjlYU1ZmeE1q?=
 =?utf-8?B?VjRWVnpVT2hTbmZ5MGg1amZlVUIrM213TGF3NFNRRGtpMEZad3R3bDdvTzRZ?=
 =?utf-8?B?NzJ5TmdQMEFGZmZPTTgyOFlHUGpnOG9wTUxCSUx4YjI1WGpHd1FVL3RlL1pF?=
 =?utf-8?B?azZtcTZObENxaFJFbGZkc01INnZOSjZkZU1DMENTQ1dDQmVNY3MwQ0NOcEh6?=
 =?utf-8?B?MW5OeTFVMHJESUQ0QzBobXhBYWl1TFk3TVEwc2pISzF0c1dUR01hbklCNVBF?=
 =?utf-8?B?S3ZXNGp5VTRnUzNRYkRiZlBTVUlUVDVwZXdNZzZncVZFaHVBM2tQS3Q1WURS?=
 =?utf-8?B?THEwMkZvWHdXb3VJWXdCNGZ0anVqTHdheS9Hbk90WTZBTldaYXBkTUtPVVpO?=
 =?utf-8?B?QU5Qd1lza3gzdUhuTzJsemw0V2Eyc00vSTU1OGlRV3czdHIzOHFCN3hqQzBB?=
 =?utf-8?B?UU5ueW9jbEwxOHNaN2VOUzBuOGNubEFFK1h2UUQwQXB1Zy9mdUxaK3NPRFJI?=
 =?utf-8?B?ZG1lbzBYSFlkS1NyRXp3YVB3c3VUakRZbUdZRXdkTnhyeDJyM2NsaTFOY0wr?=
 =?utf-8?B?bm56Y3dFTDhyNHdoYXlZWU1uSVNkck1uNEsyeU5VS0RNTFNucThtQWtjclBw?=
 =?utf-8?B?YVNhMG8vMXBEQWdwKzBmVzFNdXAvcGZTRGxzdTR0U1FiZVU2Z1JRZHFOZFY5?=
 =?utf-8?B?WFQ3NC85TFJmTmt5U1JOYWxSaHRYcm80UFhIaEJQUkVuVURpSm5vampBUHNs?=
 =?utf-8?B?QVZHcHJPRkhtcFVjYUN6Mi91eE80TlZyVkdEbkVBeGc5OHZGVkxUTGF3Wi92?=
 =?utf-8?B?NTd4OXJVN1p6d3VxSTM3ZHNrR0RZNHdWd0Z1TzZkRkN1VkZGa3V4ZHJDa0dU?=
 =?utf-8?B?YlpPZzdrSlZGODdTdGJpNmZ5UFBNNVhLUXVpa0pzaXNhM0grZGlHOEtIcmVJ?=
 =?utf-8?B?VkdIUlphNGxUNExram1BWXFLeDMrWUlmL0dseGtHbnRCVGkrUlgwajJPalYx?=
 =?utf-8?B?alZrcnd1U0VOQW4yQ3JjZjExQXl0THBXYWZSaEZZTVczcGlaeGhKd1hLblZZ?=
 =?utf-8?B?VnQ1WEQ5d2tUMDFaVHZYMEdzeExCem8yUHZOV2FScmZkWWZEUnIyUjJTUGlY?=
 =?utf-8?B?WktxNjgrQUU3dzdYM3JJdkN2Yy9Kb1M5QUlnWXFxUmtVaWVwZFZpWlhSOUdR?=
 =?utf-8?Q?5CwSJ+4qsoJRVsrzQoUowfQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba14070-78e6-40ca-c0eb-08d99e14b22a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:23:17.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pI/VitPc24Zu32FQzDA9X/peS7Ce/Toeva0qI/eSdpXyI9pkZhjk0/JkaEBbc7dOhdcLHmhnpRQk61G5JSDTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 22.10.2021 12:47, Lin Liu wrote:
> @@ -28,7 +28,7 @@ static inline void put_unaligned_le32(u32 val, void *p)
>  
>  #endif
>  
> -#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
> +#define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))

While here the adjustment may be okay as there is already an
open-coded cast, ...

> @@ -20,7 +20,7 @@
>  
>  static inline uint16_t get_unaligned_be16(const void *p)
>  {
> -	return be16_to_cpup(p);
> +	return be16_to_cpu(*(uint16_t*)p);

... here and below you add open-coded casts. Is there a reason you
don't retain the ..._to_cpup() macros?

Jan


