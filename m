Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD993BC6FE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150805.278793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fIP-0002cM-D6; Tue, 06 Jul 2021 07:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150805.278793; Tue, 06 Jul 2021 07:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fIP-0002ZF-9p; Tue, 06 Jul 2021 07:15:05 +0000
Received: by outflank-mailman (input) for mailman id 150805;
 Tue, 06 Jul 2021 07:15:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0fIN-0002Z8-VA
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:15:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17ef5b4-de29-11eb-8476-12813bfff9fa;
 Tue, 06 Jul 2021 07:15:03 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-AiWrY6YHNcOAA8iWjmsXOg-1;
 Tue, 06 Jul 2021 09:15:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 07:14:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:14:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Tue, 6 Jul 2021 07:14:58 +0000
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
X-Inumbo-ID: e17ef5b4-de29-11eb-8476-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625555702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXk2Wdq9PXDPwAThJoG+9ZIO/JrEsHbliRDZXe5sTAo=;
	b=BKPkYf3kBwOXW8XnjZsQVJyyVb9Nu2F7gETgOQcW8N0P7u/ya7bYMYeltDg4XwPwEA93s2
	O7NqePYdQgzBKEX4QpGlUrHl2Z4+1grAYTM7YRBnu6D3p8fvv9tB8WwsiyXZncIz0rEm2Q
	+Oo51b/I+FsCWjyeMWAyM5PRI0MeY7Y=
X-MC-Unique: AiWrY6YHNcOAA8iWjmsXOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ1OVwbHEiTRYqnoL6W8VqzO5XPlHNIveqKzNyfYBbMmWBcUkMChL8cdQ01x51rTW29OYIUjI4wL5eAG3v8MeYaId0MujS8b0tvPPYb32E0g4jScJmdRpO6Rdk0RPa3ZdY8MC1/W1J2+el/bbugGwckyCd4l8US9EriVveMWTouhCjzpaGc90vFSOnRgk8H6Ft9zoKqlWTuLx+asQMJ/MzSWkEhUZruBSUsLVRobCyD1lgTVk9ljsuLrFZUEhxJf1F8svEoGV0S4dXpg0K30f8cQFpbGhRZZL7AD9Y5UdaoCcKWUIbPffblBQrahjMEdN8ymD8L0NfXxE2/VcJEHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXk2Wdq9PXDPwAThJoG+9ZIO/JrEsHbliRDZXe5sTAo=;
 b=jQU9TIdf5zerKy2hx/J1K9FmFAI8aJhuo8FdsyCQfHtXikCRgA1oIq3+3OqXM1Uxxu9eMMyFHnG7SQ+aed0pmUtu42SLIST7i7H3jYETMzxGBdSrVks6+qS4xOc7KYMX1mdjsg0J4P3YfQfvWHwv0qSNBW+KtBIWT35L9j1hfISV9ySy2ipzGSEkjwEMgvgDLZ9N8SvcAPMaZjIYddpT14yjakjkEJj4YNzfGhkD6EoTjhNeluGAWRfuaRKDD7SIHGKC+NBmSg2YjQxgdRfAAKGWbLrBFU5P3UQ+gS5lNslE9uu53pZpDuPYaQL+BKzv6r1vfw9NJnXyBg/VtareFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Ping: [PATCH] x86emul: pad blob-execution "okay" messages
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3250a871-e49d-d3c4-333a-eff435e092c2@suse.com>
 <e53a10ad-3489-eccb-2707-8445746d84b5@suse.com>
Message-ID: <6746cd07-c6d0-30df-dec3-f15c27d260d4@suse.com>
Date: Tue, 6 Jul 2021 09:14:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e53a10ad-3489-eccb-2707-8445746d84b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d769379c-bcde-4832-8775-08d9404dc378
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54719D664E6010AB3AD7BC90B31B9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c3S2LGIPcwm5Hz53dUQwc4qXudHLwpcjvmj3ZL+TO1iscMndNtNXGhk1JHsfNBosTWN0zXNIKJKi2U+Wi9kzHlc94KJSTknml/gclR9oW6aHrURWlmg7Y2pBy7DX9WYaaVO6AnyUXt38zH0qYNpTdC0/rKJAd/G7sNu0JsJwYwHaCiN58xajeo0lC30qTR9EXxNrOIhPi8NfhTIA7ueJNWX3dql+KrnzO0eLR8Y0D+Nm6O87cnDQ7dGKdWcVgNwicBnycUS+IOykRCn+t82OfaTGHdoJEJCPB3epNqoAk36WnGgRr+Hd0oBinKvOygFM57hbBEu6HzVpkBm8pQOMVkVYzQ6QIVxCokITCHRmSIyJbTzmSKcSnL0V/8DfM7fTg9er/UXvpwChjn+SJ61WQV2BKSIRSfP21IhppvJ+J/BHRb66HfQrEusnkFSEvMaZKk64Nb3SVbrL7U5KQFFNaLH+PldefdbASchPP/FzYMQ4PbDTH1IM5T5i9rAw2ql61v+NVNARUO1pQkUJsoZnjEgabTybjpzyZY3aGq4Iyxi11EVgs9PSJrwRzpIRFq6xcgihzPmkKYWnF93AHVtqqbvW3NBQPL6Q56CaOQx6iHYLFLAdbopTPvaUlisyHWAC+EIT+F37eTsUa+8XTN9CpCAQQblBJiVLWUbokZZmRKmzwTBOCACDm+1GE26Tpf3olzv3VEbWqlg82Hfni+HpKbI5O0Q2mrj69sOffuoPXdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(366004)(39850400004)(110136005)(5660300002)(83380400001)(8676002)(66946007)(38100700002)(31696002)(66476007)(186003)(15650500001)(956004)(2616005)(316002)(478600001)(66556008)(86362001)(16526019)(26005)(16576012)(8936002)(31686004)(2906002)(4744005)(36756003)(53546011)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXkvbmFsZ1d1NkVHWWRSK1I4TXFqeHVIOVRlTGkrQ0toYndSOVFRekR1Z2ts?=
 =?utf-8?B?TmhBcWFYVGN1ZGQ0R3RhWFJpeGdFSnREeVU4YTNKZUNqWHQ1ZnVENmFoZU1w?=
 =?utf-8?B?NldCYityaE83MTVqUVlBWTVZcHJJSUNueTFXWWlPa0xzbjdOdWpPMHRPZGwx?=
 =?utf-8?B?QTFudE81S0NaRDhVQUY5a0taOFFUZytqejZ5WmZESzZ5NXp3bjZjUXlHRGJN?=
 =?utf-8?B?UWlpYXhJU3lWYUZ4SnFpRWFPTlhvaVRVeEF3ZmZjVy9MYTNSUnZpc0NwdEZx?=
 =?utf-8?B?M0EwdCsrZyt0T05TaW5ocWNwSVQvcHR3Y2wzS0dQSm5xRUI4SEFNelRKY2pm?=
 =?utf-8?B?bThoQTMvNlpRalgxbE8zYUJ4c2pIazc2aGZ2eW45czhiRmR2dlJnWjJSNys0?=
 =?utf-8?B?STd6SVhHNEdXMVZtYUtZZXhCUnRWOEJQTXVVMW5odXhwZC9RUjQ5K0NXbS9S?=
 =?utf-8?B?d3ZXMk82clhWOFJXb3BxUHVTUjVNWmhLZ2RvWkdTcWxUWGRtbFgzUitEdzZx?=
 =?utf-8?B?aEI1enlod3VFT2FPbW1kc3o3NmZWT2JMajlPMUdUN1FibjgxM3h5SnFXbm5B?=
 =?utf-8?B?L2g3ckpxSlNkUjFZZ0s0RXhMN1ltelFVeWowL3czdjd1Q2wxZzB5MXBMMGxF?=
 =?utf-8?B?dDBRaGpaOXJpaHRINmUvVTBybERPRFpDTU5VaDVLUmxFWUJuZDgwMms3WHBt?=
 =?utf-8?B?cFUxSXZsK2ZQZkR6WlJxM2VQb0xnbmU2Q25ENUJRTHRFOVlEMm95SXREZitZ?=
 =?utf-8?B?a0RUT2MzalhHUVI5M2x3UWhUSXZTdnZLcFp4ZXlBMGNzd3NXZVBWVThnMEp4?=
 =?utf-8?B?WlVYdGhoK0F2RUZ2VFZWNzZaTDllZmNUU2NFdUVxcllVaTZVYXRncTFsVEhj?=
 =?utf-8?B?Z0k3ZUtUaWRRd3BYWlUwUnJBRDNjd2g2OXlpZmd4L1VWejZCa2ZkSjlUbG8x?=
 =?utf-8?B?ZGFIeXAxa1EyS1AzdmlmU0tWOXNma2V5dVpnUFZYMUZodmNJYnZpVC9XNGxK?=
 =?utf-8?B?YWVhVnB2SFhIajk0eDRjNTBrYkxGTllhVzVRTjVDWmp2R3F4QktQZlR0N3RZ?=
 =?utf-8?B?ZFNhT2dXYjNxTkpnOXBFKzJXK2FLTDJSS3M0QkgwRHA2ejBQS2Q1djlmQkFG?=
 =?utf-8?B?SnpsaDI2SERlc2I5R2RNRENWR1FaZUt2eUpIbXkyUmc4RzRkbExWOHJ5NG1G?=
 =?utf-8?B?ZFZHNWppNHMvemY5TlR1TW9PcjhSSGhCbVZRSHFGTEZTT2QyUER6M1pMR0Iy?=
 =?utf-8?B?b3dSaE5oZ3MzWjRkZElMM3luU0NrTVBOL1B0S2hVNHovNEVPcndGTjA5RTh6?=
 =?utf-8?B?eDU1OXdkWFpLWXozS2hwQ0FobFhwNWtDdFcrSEkyWmxmUm4xR1Robi8zQTBz?=
 =?utf-8?B?N1FGSXNPalRORm1sQ0RZVEx2Q21nZjJ0SytWclg0bG91N1B4d2wwbHJyMzEy?=
 =?utf-8?B?QjNOSC93Yk43M1lMK0Rndk9LeDRtVUx4bmdJaWw4T3VjcDNtRzc4eThxYnFn?=
 =?utf-8?B?L3RrSGt4ZlBKOXNkTHhyREE2WUhJZk9tYVBTamhKWEM0VzZzOU1RUTE2V1h0?=
 =?utf-8?B?OTZJRytBSVc5YzdnZlZrNXFUT1lsSWF5U2tQak4wUEppc1M3Qy9lTzBTZ1Rz?=
 =?utf-8?B?cjQ5dVA4WldDRzA1YnpQa1lrRDloaXRnMjNidVlKUU02Q3ZlUGpRaVBwMjFh?=
 =?utf-8?B?MlM2SFJjM2ZOOE5VbEl5Yk5pZ0hMYUZvcnRHYkp1ZkxxeXZmUFVOcUhLeSt1?=
 =?utf-8?Q?PF+bWhpWZF+mlI8eITesul8sSnBJszkSUwHWptN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d769379c-bcde-4832-8775-08d9404dc378
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:14:58.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhxaeMkzjBfLY5j4hdeR4BHrvPxi/VRdNZwJ84eOuQCf2Xqn+eyBIqFiIxoyl6NpjhhVqbJcEA7E65eVEDEL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 28.06.2021 14:15, Jan Beulich wrote:
> On 02.06.2021 16:38, Jan Beulich wrote:
>> We already do so in the native execution case, and a few descriptions (I
>> did notice this with SHA ones) are short enough for the output to look
>> slightly odd.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Again - anyone?

Okay, this is trivial enough to fall under "lazy consensus" if I don't hear
back by Thursday (i.e. including the Community Call as an option to voice
objections).

Jan


