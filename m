Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8945024A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225744.389891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZ6K-0007pU-QX; Mon, 15 Nov 2021 10:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225744.389891; Mon, 15 Nov 2021 10:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZ6K-0007mo-N6; Mon, 15 Nov 2021 10:20:36 +0000
Received: by outflank-mailman (input) for mailman id 225744;
 Mon, 15 Nov 2021 10:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZ6J-0007md-8m
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:20:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaedd2cc-45fd-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 11:20:34 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-djC64rE_OgOkuNTR8WjqRw-1; Mon, 15 Nov 2021 11:20:32 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7988.eurprd04.prod.outlook.com (2603:10a6:20b:24e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 10:20:31 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:20:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 10:20:30 +0000
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
X-Inumbo-ID: aaedd2cc-45fd-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636971633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycgNOxVJRYLj0YEZjL+D8k3uwU/iSODKZskAKvuAumU=;
	b=Pkew552aph48f9nuvKHOYrxMiA42REcykg4GUC3jfXfJ/ST5SaBzfCrvFXzTbn1ozXgg82
	z2/SWDTl1YSeH2IXiXlVACzq4GuK2a25yiCH7qHhGRkaaiUmFS5eHG+yWgAeKZ5qUAFRM1
	2axL7+z0fxGPHoSpfXMMR/mKm8vuHR8=
X-MC-Unique: djC64rE_OgOkuNTR8WjqRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFk7A3z6hUpmrP224iwlLwOsPoWx2of9j2D+rujHWZqvic8w5hbl7hR7UnVCcb64lXDESVs3PT+o18UyVRgYsJPSipOsucGIRGr7ph3tjirmJ1HO/+Ge3bVFCr9BXQoLfb1BXV+GlY8wz1+QT9qKZMoaCaNPY6vkBw/SyOwWSKUe0HIUiDKlgg3dHEsYVAL7x3PgrFdWTs0WECFrXG+wdsgHkUmmwL+e4FDrlu2cJ9EtlRR0I26CbzNlDSNmZk8mM1/pb+tVQdJL5bgh1DoXdzce8vcFoNfQ5qeBtSmOBnI8wCEkQEJroeYdjKobRm3QhiQDCRWUY43TqhO+WrQtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycgNOxVJRYLj0YEZjL+D8k3uwU/iSODKZskAKvuAumU=;
 b=addhgLTQC7ZWLsU3JyWFGjKyWjlI2+BNWOrlgUMx/rmnl50zenW2W83iOEaCmUI2rA5XJr13m0sQce/v8JFINYfDXeIviYkbhwdJUVW7xv+f8gnG9CZsC6y7mNRu4+u9S59oBJtn9ZICZ5uMqPEawQQyv+rSZbwPkRKAH2i/cq2IsJtQ0VBlIb4aZJb49cB/eOG95BD5rJd+BVst7DI/j19e7TEErO2gHYYXUysaXKrytk6LnIzCK13XG/MI39cqJ4hqrBupN5DguKkWoBDOUmNiKOagcVbOWhMw8fvM+EHSXMYxXeWwGfvQyOLAuyaP5joTpivS0hIgGJ9nVYuN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
Date: Mon, 15 Nov 2021 11:20:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::39) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d0d91d7-d8e2-4c20-05e9-08d9a8218d77
X-MS-TrafficTypeDiagnostic: AM8PR04MB7988:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB798846270BE656F8AFC03ACEB3989@AM8PR04MB7988.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZXxadpiEmvgHWwEnZe0rAa+KXl7GEojEwObfpBPpF7frE3fGTQl3XbOlfhetgNyPUwDY1uHT/8LhgVFPR1zq4jJFs5tB8e2OkdyMD+SUquD62+ikK2DgCFNG0xPtQvuYhfFcUSwh21z6P9Yr4NNBsXP7842In26o4r/uCcO8DRoya9jO9uv+yYR0zRQIW4ug+2AexXyiHo5WO5uNI7vEP8Qvdw7YK+gPf8wcp7Pjk0EvjKA1DcR2AK+dlP6L5JseDEIPJLz5/pTems7j7m3qnligtrOb+WwPMW6nJwwxAPLe4Rtxqk5sq7MBtT8VgPbzrRNiilJVAfDDceCjatIFHXCqR0Z7V9W+hka+skyGAk/bjLy23jIph+nyDWmlo89eUR95Wra7LNqvaqCdjUBpGrLVRULEbbNrUHLfugzKfJB2q/w51nI3EjgCWaqf/LByD9xT7kKY5C027YE/JzrURN+BCLnEau7LIKk5RrN2cvXOqnFtonUmp8VtHnP1of5hNL/JQOwmE2FX0SxjX8FAK0/jAWczB8I+C6KCVerY4djHXOH7YCG7xkZ9NfRWCma8Ucr2T2SYxkKqrtNFXOgKrKC2Jq53vcVsRKRWMutUcxdvtNXAM+HfstIb2Q82oEUH50fK6w0gzxToPHYlhoPgckMw3sQbgjFysGDwD90kgL78iUHJanpENJ0V10+y/kReGAYEWWgJA+5VSK1nr4MRxteJdzT4HzAWSiP/CCHXEXGNoCDybjwsgjhgNsUGp3Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4326008)(53546011)(66556008)(36756003)(38100700002)(8676002)(2906002)(66476007)(956004)(316002)(54906003)(66946007)(2616005)(31696002)(16576012)(86362001)(6916009)(31686004)(5660300002)(186003)(26005)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1VUc3hRWGMvYmlINmtjMno0MUt3TXYxMDhXV2dEZExSSHFuQ1dyb3pTTi9s?=
 =?utf-8?B?TjMvcDhoQXdhRTQzWG00L3RNQm1Da3ZHRzlFMnhTV0w4elFqU0tsQUJOSmkw?=
 =?utf-8?B?aGJ1amR4TkdObDBGKzVRTzRaZWdHd2w2cUxUbXdBMDJnY3dacXpFU29tSlo1?=
 =?utf-8?B?Uktycy81UElsbDhJc1NYNHRLSERLYlFLMk51a2xFUGhBM3NKUzIyYmNHaG9S?=
 =?utf-8?B?UWJlV3VyTjdmRjd5aW5QUExTNklCQXlQZEJQdld2VjJDMnJseVFMeXF0ZExX?=
 =?utf-8?B?OHBLZ2hnRHJ2NDA5Snhxd2lZZFNGdW1sWXFWSWJFeWw4VlZueFZlQmJqV2tj?=
 =?utf-8?B?ZG9RUTlCRzBhYXlvTVBIamRZK1k1UUF1Wm5mNHVEcFcyMk51TldHNWlHdlZ4?=
 =?utf-8?B?Q0tnaHQ3LzFUYVdscm1xZHduWEZJaDJDVEJhS3ZtdUV3WjZZRmJTMFRkZGVv?=
 =?utf-8?B?dWlvc2NEemt2cFBMS21qNzNDeEhUV1dSSExtdXU2Qks3Mm9TVkpPMkppVnd0?=
 =?utf-8?B?SVBRdEpYcTFvSmJGRnFvU2hlL2JkU2xvN3ArbmtmbE1CeURaYWZBSGI4L3Zy?=
 =?utf-8?B?ZlJuVDJnUEtUK1NyWWwyM2VwNVJlL0NPMkFHTDlwSXZvemNiUmdYK0FRMWRv?=
 =?utf-8?B?NGlxZXFBK1lXTVM4MVZBN0NsSlg4dXgrOTd1VG1FQ01hMFI0cDA0c0tNUHVF?=
 =?utf-8?B?SHVabmZjTWxZMUdKWVdvMU9EM29QNDRqZ20xQjlSMWZ4RFFKWkpQWUhpdW1r?=
 =?utf-8?B?MlVFTjV3dTBDU3o2SXdyZGlXYi95ekFLZnFnc1Z5bU5QUWNObzNYemxtNkpy?=
 =?utf-8?B?R1pHL1RoWXhyWTlxcUdvTWZRMlZHOWhyREFINlI3dkl4MytOdkJRRldXL2FX?=
 =?utf-8?B?RVdrd0lNM0ROejV1Y09GUit0aXdKVVFjQTdORjB6Zy8zdTlPSWFUS2ZVenBY?=
 =?utf-8?B?WlpwdUMrNWc0Vys3bVREWkZlMmE2Qml5OEx0ajlTTzBKb2hYcEpHMVA1b1I2?=
 =?utf-8?B?MXNiTGtYSE1YTnYvbnRqLzVYbktGNGFmTXEvNkRPNEQ4cmNhRzkyTWk0d3Ez?=
 =?utf-8?B?VGx1OEtCNTZFL294bzdNaTJ4Rm1XUFZjMGQwbno5blJXL09rU3VwNmVjdE93?=
 =?utf-8?B?YlBMcnRVQzdscDVEYk5xSzN4M0EvRFFtYjh4R2ZlY1FaRHZUMmY4dXh4Wkd5?=
 =?utf-8?B?c0kzWjFaMGp0b2dZdnJ5NVFneFdQazMwdWlGQ09ESHRHYzhKSTlMaEdINnUy?=
 =?utf-8?B?US85YURCNlNIS1ZjUm42WlVsdm45d2lyYytPNjVaRTZiWnBMbDd5QlFRQjZZ?=
 =?utf-8?B?ZENGNy9LOGJneDZBeVNWL0MwWE1MSE94OHVNTTl3MWlQSyswdHVGYTQwZ2Vn?=
 =?utf-8?B?SldlejFSdFJSajR3OWc2S0huMlpHQ2N2akt1TjZLeHR1RnozYnk4UU1uNEtF?=
 =?utf-8?B?VWp2TFlWZ2NTckVSdncvWUdUc0tORUVSeGQzalJBWVJ6amxHVW1UZk9sM1Ri?=
 =?utf-8?B?RDlIb1JPdlNJalcybDlNZkhPM2dKS0xYMHVaUXFvYTZRSlFuRDNCS3NlQzIw?=
 =?utf-8?B?ZklyanFRbDBOK0Nad1RINWhtMkJQODRaY0c2SzJxN3pYc0pFRjVIT3g1c3gw?=
 =?utf-8?B?dEpKN3JBUlFGckIyODJ4eE1vTlVrVFJIam80TERnNnRkYnJ0OEsrSnBtWWhP?=
 =?utf-8?B?TUpaWEhQSWRtT1VkUHBYUkRDcDdXMkhJaG9ZeHNtSFo4a2VKR2pFQ0sveTJK?=
 =?utf-8?B?NDZZbVE1MU5UOFNuS3ZKcE01ejErT3FzcFpaQ3R3N1JBN2dLRVpMeC9jWjJF?=
 =?utf-8?B?OGNabHVFWG5hOEpyUHFZVkxjaVp0aFJGMjJIMmk1RWJ3dlF3TWo5d1hxUnhG?=
 =?utf-8?B?R0d0QUVidGhsVGJtdnh0VU1vcE93TmZna0xmQUhJS0ZPWjFPaDU1QkgxN2Iz?=
 =?utf-8?B?bjNaelJEYjJmcE4wV1ZJaDN3dTJkRkF2bi9HK1lDZFN2QVFEMjVxbkYyTm5T?=
 =?utf-8?B?d2xyUTA0aFBNRG02ZTIzMGw0dWVRUnVobmFZeDNZdzhxZVFQUWxlVmY0OTJX?=
 =?utf-8?B?a2QwOFlPclJIRCsrWThXNCsySW1mR0FWcUJxRlFYTkJQbWUvdWRYUmovMENj?=
 =?utf-8?B?OEw0bi9pbi9mSkhpTjZXaFlyVnFzYWdaRi9iczh6bFNObHo4QXRvSWcxL3Zh?=
 =?utf-8?Q?3H52/uJpdSAWUUjiFU5tfM4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0d91d7-d8e2-4c20-05e9-08d9a8218d77
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:20:31.1640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6dyBJV0USnmRdznk/ydusGkGCJ/OIHMNUDBaReX1gh6HWxhDQihPKHl+GSaj0L9Nb2nlknL/4eoAL7Acpa47Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7988

On 15.11.2021 11:13, Bertrand Marquis wrote:
>> On 11 Nov 2021, at 17:57, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>>     return 0;
>> }
>>
>> -static void do_domain_pause(struct domain *d,
>> -                            void (*sleep_fn)(struct vcpu *v))
>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
> 
> Here you use comments inside the function definition.
> I think this is something that should be avoided and in this specific case a
> boolean sync is clear enough not to need to explain that false is nosing.

While I agree the comment here isn't overly useful, I think ...

>> @@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
>> void domain_pause(struct domain *d)
>> {
>>     ASSERT(d != current->domain);
>> -    do_domain_pause(d, vcpu_sleep_sync);
>> +    _domain_pause(d, true /* sync */);
> Same here.

... comments like this one are pretty useful to disambiguate the plain
"true" or "false" (without the reader needing to go look at the function
declaration or definition).

Jan


