Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77A4677C8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237606.412114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8AX-0003XH-76; Fri, 03 Dec 2021 13:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237606.412114; Fri, 03 Dec 2021 13:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8AX-0003TB-3F; Fri, 03 Dec 2021 13:00:05 +0000
Received: by outflank-mailman (input) for mailman id 237606;
 Fri, 03 Dec 2021 13:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8AV-0003D2-Nq
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:00:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd538b7-5438-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 14:00:02 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-SqofBKZXMfm3zklGrtOw4A-1; Fri, 03 Dec 2021 14:00:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 12:59:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:59:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 3 Dec 2021 12:59:58 +0000
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
X-Inumbo-ID: edd538b7-5438-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638536402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8L6gKBQB4yw9bPpzm9o0BysGMBwhBrfVCZM/fzk3hqs=;
	b=Ytzwbdt89jmw3J+Y6vTNPqs9xr6QozsWbRmcUAwKGAWbU3/oSoBqvfnGtnABx+AJRFfIRN
	cwsjNUffXZzJXXQGBqAZqUZnSEhoGHgdr4A3QpFWJly8az15R+PAeTb0k0k1vv6qP+cosC
	seaJasIzxvVm5WujuXHMW1ZA10KC7r0=
X-MC-Unique: SqofBKZXMfm3zklGrtOw4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6X1e3vU7+p95LldtGs05B9lWJsTJgujDud9Ymw49MrKpCugUU7J9OEwUqqAUxhwZG9EtNSBcLmydVARmV/rHZRtCZ3APRNZNpfquHHu0idVIsK74pj8DzpHreXIBdKUM1hSvq9SPZ6/wVUIx0IEu8P8Acrg774JW0gtb2kRSpjH3dOrhRU3G0+EDVEJtxMlmmmXlzQr+2sv9ddP6YhIOwB5ANJyazBAcFMP5CQooh/l4+lpghgRVOOpesGCH0RFoDuJDq7WL3A6wxLrucRgHQIA6/TsZyYdel/xzaTWa0BQfMtzYCx/YbMyDTI25UH53rUB6DvHiC7wV4C+vBExNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L6gKBQB4yw9bPpzm9o0BysGMBwhBrfVCZM/fzk3hqs=;
 b=FAZoI8c6FcNi91TWV7QdRph525xM02EoVEYvuTz6+laZgPghjP8IKHEHPouknUKVFsSKrwcq4IkViDZ5nELR9Qqdzes7p7cgHlFyDoiualWL+3qcJPhJooflnwpUHmBuXOfMO4skiO28XQkbqq3PjlQMTmh4ft6zXrYRfVsR+nMDDIogaAErcECGb2FVTju3NDpBjuURfPJO/V7UfPvsHyu2aMzXpGNMjw7uLeUJsaQmlsyM1g10uloLsGz9iHghfMV0lKBoPQNCcZLBUAQ4KStoNtD5OtsWTU5pWVzxJ2TrVdqSnb4egJHoqFBX9ljAv7UV+Tu2kC/nMN3S2NoaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a87263b9-5cff-d106-a3f2-0e8719c9124e@suse.com>
Date: Fri, 3 Dec 2021 13:59:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 58/65] x86/alternatives: Clear CR4.CET when clearing
 CR0.WP
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-59-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-59-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d16dace-d359-4353-bea8-08d9b65ccfc0
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957C82EB01FD23DACBEB5C0B36A9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnjXU2DAzoWvI3QXcMSxEnh+sAnhTCrfcNSyaJoWV7JkwnagBrN33kfx8TKG8P0GD4hm5EeFIoDcQJM5HYavZp5MxVK3CGNtDk+ny5J74rZU1Tj4Wn83d7bTYxEwlOvqlnuMD0x9IMgl2b74AWAu/tOO23NY9U7XE41ofmtcK/mcRyQc5XLWzFEukOuw8lKkieLDZvjyTDgccBi3TCBy3Lhx5TKAA4vxxnf8rhLP2Zrop9d2OT6+Cs+OoHQpCmM7cFOktaDpVS48b2hZsgikWRU/kfKuK5SNPeNz8DeQ1YlYvGGRsEJt17aVospEZhHwaL8vcopcH+pSd/fK1r8Td0s9vJf0MQ3Z76d5UutOFTgYThJByvjaWqqRWfNggHIhLMee5bAxMPHecPkmVtgf/hmORV/HfNGLZLu8sqeq/zBJg2lMptHwqs8ss9VqYUxH9uLq4u2Au5iLwsEH6aHL9BttFMlEFymXF9Liajmk1t6krxiU/2kCgwZkrPcDZLVEwDDawTXNzwAtE+dJLn3Kms/IL/lYfanzqdOJAIECFa7k5KfDRej/kyI072RbxuOhsUHYAx3sVpRxM25PviBfaNYbbMXg1QmVhsRO5XXwb++npFZ65NX6Me/BUY84IjrPZCKAAPYFvoEXWYOXWx5HmHo6ss6qNaJSMo+GrKV8s3Jrjanp11GriyCFW6GbS4pPO8kTos6+p6pvK72MTHxBuIyty30UCm/iY9ea8NJpxJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(86362001)(956004)(6916009)(53546011)(31686004)(54906003)(2906002)(6486002)(508600001)(5660300002)(38100700002)(558084003)(31696002)(8936002)(4326008)(26005)(66476007)(66556008)(66946007)(186003)(2616005)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWpZakNmL3BJdFBmODNJcDU4ekZ1L2F5cUdNYmN0Q01iWHJqM1lCS3orZEQv?=
 =?utf-8?B?aG03U05qQ1VHYVFrTC9yVUNtMjRwVlNia2lFKy9jS002Z1lJc3AycG0rRi9y?=
 =?utf-8?B?aWNVQk8zN2JWMVVLTys5aXY4bk5UYnd0VHFQY0VianphVFQyTjduRWhaV2RZ?=
 =?utf-8?B?MDc4d25maWNwWmdKMlZEcG92Q1RZbVRYcllsRXhHUUhZN0hiTHp6RjJHaGJs?=
 =?utf-8?B?MU0vbitTbjFWZ01SQk9vc2l6eVptNDRDYzZSZzk0RzlLSHZLYnBSZVZtNGpB?=
 =?utf-8?B?RDZsb2llbFJJa3BQbkVGRUp4aUNYb3V1cUtTTjJBNGRIbTVHSGdOZERsT0FB?=
 =?utf-8?B?RmxxNWFkV0JRUTBLL3M3TzlhajRCb3MvQnpHWXA2NVFMTEFIVVp4VUJ1TVlv?=
 =?utf-8?B?S1pjSDIrTkhZM3hNbDJzTFRxVjN5N2w5OTVlSTA1TWJQM0VHNGtDYWNDMlZ2?=
 =?utf-8?B?VVJ6YTlEaEdSajNNWTRDblcrRVRYTmJHNlhWRnFHZVFkUkFMcHRZQ2FOcXls?=
 =?utf-8?B?SzhmSzRHaTlVYWxBYndHUFQ3SHprMXhqckhKZFNaT1dkdjdVdDNvUUl5aDlv?=
 =?utf-8?B?bWU3S1VERkJOeERaZWFiTG8rY3M1TGdPUEtKTCtxaVNYU2NPd1ZjQ0tqeVFh?=
 =?utf-8?B?RklkVnkrNHZtb3JuY3V0THc0dDBMN1Q5bnNPYU1jbEdkNFJVM3pnekM1YURa?=
 =?utf-8?B?QzdFT2kyVzNxV1RWZnVYWXpDc1B4eTFDd3VlSmNvb0F1Y0JVcnpQcUdiY0ZD?=
 =?utf-8?B?SXpJNmNzVTBxMzA1YXZkSm1xRml3N2s5N0hUaW1sMVhPQjA3U09qYnhLYko2?=
 =?utf-8?B?eGJGTWZVOWZiRlo4SVFPT25WR0VzN2lhcXNReFRXN25CdDBlY1IyaFFHdjBC?=
 =?utf-8?B?VGtMTnpseEk0MHY4MkQrbVhFZkVJM1ZVOUZjRXBCUXo3UkJrcXRRcWhZVjZv?=
 =?utf-8?B?MGRtdFVzV2RkcGlJUmVoMWlkRXlDT0ZoK3VyZVZVSlJWU1ZndEkrS0YxRm1I?=
 =?utf-8?B?TVQwTlZYSWxQSTlHWmo5K0xBcmdEenpuUTYzVUJUUnpmOUFCMkdSYkhteXg4?=
 =?utf-8?B?VWtXY0FOdlBHK2UzczVISUFmMEcybEhncmVzSkdZbE5BdFB6ekFXWlg3alMr?=
 =?utf-8?B?MDhYMUs3TjdiYUkvUC84dFova3FSUjNtdjJ6Q1J2TEFiMU1LcFR5Q0J3Z2ty?=
 =?utf-8?B?ZFduNE1jWnJZb0ZISUkrbEtlVHNMYW1BRmxYZklIWEo4VkgwU3hNSHNJVXVE?=
 =?utf-8?B?VC9kSlI4WVJ4TU14bzAvMllJN3U1Y29heU9HdFZtZUJlbkdNRVpvNDNoQmZF?=
 =?utf-8?B?ajR4bnVQMTlhODZzenJ2eloxMGFVandmYldNa204WW4valY4QnBTWU40VUNG?=
 =?utf-8?B?TXZzZGtMSmhuTGVlWWlwWU5GdnpaQ3RCTkpSSzBPMk9SUXR0TlBpdnBWSlNw?=
 =?utf-8?B?TzVZc0kzejB6ckFiUFBXcjgzYWtqSU4xYzVMZGVuc3B3bUlBWndGL1hKemZQ?=
 =?utf-8?B?alJNdkZkSlVRc29XajdSQy9kdHlxZ2QzUDhmaW52Tk1aUmg5VTlEV2FLMWl2?=
 =?utf-8?B?T3RHT3FGTThHRW01YWVJODNjNm9IQTNGaUxWaHlFVS9lMXZtL1d5MGRXZnBP?=
 =?utf-8?B?eE53VUcwZlJaQ0lNNDlQUlpQNWtwMWhDditSdzJpREF1ZHVHcVM5dGVjclI3?=
 =?utf-8?B?aEwyNExmOUQxaGlIa20vTWJCYXgxeDlFNGVtaGQvU3ZRQUFFZm5BQ2YyR2ZD?=
 =?utf-8?B?a1drUjhZQ2lvVnBlYmtSWWJjYVZ0UFJmY3FhL0hIaW1aV1hJRVFBUGdwYnMw?=
 =?utf-8?B?cEJHdXpzdUhBOUNYQWIxUTM4SG0xTTU1OTU4cXM1WWxmVDJnblpieEZIZFVu?=
 =?utf-8?B?dFhjaC9OcHpwaUNXcjlRQm5HcWNsWFVGRDkvVWw1Tnp3MzV1K3FQV0oyazM5?=
 =?utf-8?B?UmdRUEhsQ3lMYkdyUUxRckZVR2ZNTjRUSC9URCsxREEwNy9yVDBQcDFGM3hj?=
 =?utf-8?B?MmRPUkFwRVBSODEwbXlYMnVGQ2dkZ3Q3NGQ4V05waTJXK0xQVmVlRnAwZ3lC?=
 =?utf-8?B?QWh6ZS9UOTFTTlpvaThjZlBpYUs1RWZTNzl5Q0V1M2F6K01sSXpXUjYvejJz?=
 =?utf-8?B?cUpUNkhwOEJaVnpZQzNWTWs2cFplWEdRNmNDMFJVMTFKZnJTQ3BpL25qTS9q?=
 =?utf-8?Q?VazDnRIQtQvAi4J5O9/dtM8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d16dace-d359-4353-bea8-08d9b65ccfc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:59:59.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/b285eEMGA1YC9edPUqo7sn+BwL5xNXFoMhYaJBfdtQFkAjrjPccOaSbo2Nx88T49LnF/15VsDslWCWEdIDaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 26.11.2021 13:34, Andrew Cooper wrote:
> This allows us to have CET active much earlier in boot.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


