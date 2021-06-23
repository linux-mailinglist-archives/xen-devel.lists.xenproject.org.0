Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B453B13DC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 08:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146131.268829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwDp-0007As-57; Wed, 23 Jun 2021 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146131.268829; Wed, 23 Jun 2021 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwDp-000792-1q; Wed, 23 Jun 2021 06:18:49 +0000
Received: by outflank-mailman (input) for mailman id 146131;
 Wed, 23 Jun 2021 06:18:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmAD=LR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvwDn-00078w-OW
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 06:18:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e99ee2f-ec17-4fdb-8321-b602159a094b;
 Wed, 23 Jun 2021 06:18:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-oRNL6vCaOCOXB_UY3VwJKQ-1; Wed, 23 Jun 2021 08:18:43 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5428.eurprd04.prod.outlook.com (2603:10a6:208:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 06:18:42 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::d52b:45ce:e793:f9c]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::d52b:45ce:e793:f9c%7]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 06:18:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:205::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 06:18:40 +0000
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
X-Inumbo-ID: 5e99ee2f-ec17-4fdb-8321-b602159a094b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624429124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ytVM0OQTV9HSm4wl625AUkrcGQRWP/PTGgMxmvw8Jyc=;
	b=cw/5KBtfXVNgYnBwLV2ZFBwA9AT2JoT2qzNW4Aa+77V/GaR7T4eB1dvbhltjY2MJk2QdJY
	li8LDgieXo6pENx1oixoulbljpBQEpnNd9OCFe/If7Z+Geow4wXW+ay6nuQT/97w5Em+Uf
	9EV9q2LhvMN10ERIy77YvgtIHN2EH2U=
X-MC-Unique: oRNL6vCaOCOXB_UY3VwJKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9ywDJ6ITUngm/Y4tFfN9HSzO3Ke6LQ1/tMSHc41OjhR/Z0BdZJPvLgW6LpLz3WmuQA7vtiym5CKAH5oAPa3gXQzHkqprPT7U4eTy4ixA8QeC9clBsiPYLkaPtI5D0fGjXOhrXc1vrfcZEun5eHJPh4BPgropJ6eujvM5PRBYHu9MzFD6Rallcg3hv5YPCDTJGK5M9QPqpj7OgOm2hh/eFH5izbgJIfI0UgSVFMq0qA6gYXm+shK5Oz4vZV+xUxcwi5QESJiRPWK8GCQ1MICFbvTUJL8bqPmIR8R2WsmN7Fg2Cdl+GU3rbPfowvMEsb7eLMyWtZTO+J0zmtRzb3xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytVM0OQTV9HSm4wl625AUkrcGQRWP/PTGgMxmvw8Jyc=;
 b=jUzOv1C4BGTBJuE1/R57+u1kH5AfG3+PUz5qo4ljJFyr8K5P+mJDJJhNUSujLewfjFyhulBJuTTc09hjAtdZL0syJTPQ0jT0i39rQx6jvlGiPSjGm97MLWNVqGmLtA+S/xWtMozaaQwrQxU1DCPeD9JHCfFSxCdrYt45cUXvD890le0OAECVhGXukdKyzR9nyUFoKT/pxQ1ns+Yl0h+6ibN+KurYXV3gGpBRYheRQ1BShosqQvyj99NaXIevdupqJTlymZdI41f+u+4b87yzCWlLa3JdUV0RwHgp6v5LqYVcEGiMpDfw32oGolvDE/9/f9MltAWAWfv8rXY1lg/EKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 5/6] libxencall: drop bogus mentioning of xencall6()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
 <1792bdfc-7510-6628-e63c-aee2c7d2cab5@suse.com>
 <25fa82fd-957a-d378-9761-070006d083ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b729fbd9-90cd-0bf1-c40f-c8382a5ec7ac@suse.com>
Date: Wed, 23 Jun 2021 08:18:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <25fa82fd-957a-d378-9761-070006d083ae@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:205::39)
 To AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ba6957b-2d46-4bbf-6adc-08d9360ebeda
X-MS-TrafficTypeDiagnostic: AM0PR04MB5428:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB54281D69379E7967A4B929C8B3089@AM0PR04MB5428.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OpHwStPUMM3ez1oskxH2FhqqexmYC+r4BAjtAkfccCP56lvR6dRBXrvj8hKVn0V7ZXaeXNv0KwZLuXwFozdDPewvSLT2kPsS4g4i4OXMSoMYBmanFdgkhai5+gnx4IwEVtiibpZ7MSlvQZfujSh9c48o5P7BTHgwWq9IRzL2A3krGTLAnIWQFz05Uin8bHx3aSMHeFX2wnUu6s4HzbnuadWYwci3c7YIi60LqIzP+HCJYPHT3aHIvGYFGDmiUhsoHOhD2vcqkQs9rYvZ78DyhHj8nIgrtqZk74BT+z7eDRbIeVxsdWc4Tv+Mm3KZgM2ZHdTSk/uf0r2I3nbGqcvnz0qNbJ6731n41pLXSag8o97eZtmdCITPeK/YumX1YEe68AuNO3bhrGDiNHSjlUhHvlgAIAICC6Qb+kay4pTpVpxuN0LmgZhAh8HM8onX1IMO1wmax3d0cp1PNDyCqUUdBf1RyUT3W8jeq6MmgALWK49xdu1Fsvf2RKsUCpLxiA754SBiEF8CaDzvL3ZIpAdU8QjCPCPzVyBhjNUp/GPX3JmfhZJP766ZkJkIwT46d/NM9DlRm34Am3H2zfshPWsHn9yZnJ0k9f7oNjGiE9WFHsEng4cdA/+mdzZ8JB8dreMoC+pENEU8He4UrNz8ZvK2x0u7QeDKyMD96SPXWnNLrOIgXib+WStSkpslOnGmP2eS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(346002)(396003)(39850400004)(4326008)(110136005)(66946007)(86362001)(31696002)(478600001)(5660300002)(956004)(36756003)(53546011)(2616005)(31686004)(38100700002)(2906002)(54906003)(316002)(16576012)(83380400001)(66476007)(26005)(6486002)(8936002)(16526019)(186003)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFYxV0pMWEFLa0VHOVMvZ3hKdTh3TlFxSjNSMy9CT0lrWFE5VEJaK1NZNjVj?=
 =?utf-8?B?MDBYRldNWUtrTVZ2Nk1oMzFjbmVZcWx2SFlOWDZIYkFwSlMxVzEyM0hTTTJl?=
 =?utf-8?B?WFZOQW5NWENNUkFDMkFEdnlCZS9LV3ArZWoxQjFyTUtWeGg4cU9QUFR1Rlcx?=
 =?utf-8?B?TWRtMndORDlFVHVQTnpnbzIzMTJhdE9TN3d4UzlpL0ZmaEZmdGhFY2lWVGUx?=
 =?utf-8?B?S0RocHdPWUFSbjUxZ2luQ2RHQjdZZzRJMXFTcUV6anFUT3JTNndBSHFxdmgx?=
 =?utf-8?B?b0Y3cVlvQWE5dThWWFppVkVKUkkyRjVIN0ZFV3h5VUM2TWxwck9SOGxmUEtw?=
 =?utf-8?B?ZnJOa1FTRXV4d1pwUUQxU2Nib2Jka0RKaXRVRTFSY000Ryt6OHV2Zm1sYVhp?=
 =?utf-8?B?MlllL1pwMjI5cHluQUVmdGRRSkZUMUlrL1kwaWpvdFZ4OXpBelB0ZXU3MnZD?=
 =?utf-8?B?KzYvcEtLOFpFcHhEUXlhR0JMQlVyeE5iNUZzWTFta215SlJ6S2hRV2NKcGls?=
 =?utf-8?B?R1k1OWZsd2dRbVRKNCtBTldwVTVPNzRFZUM0RW02aDVqRG54czRIN1I2WllM?=
 =?utf-8?B?RU9QcjQreEl5bW1heUh6dzduSThWT29TUGYvZXlRd3VJcUR0MmxSSUJYRVlT?=
 =?utf-8?B?VUhpV0IvVWN0eDY0elRlNGhFOTNINHAyQzIyb3R0cWg2L1JTMkxrU3NGQ3k4?=
 =?utf-8?B?ZnpoWXdTUjd2M0hmazRjeGFuSFVmQmphUlJyMWVCenNyUDVIcXllT0NoNVB3?=
 =?utf-8?B?WXdJVktxd1EwMjh2MFZ5bHN3eDFLbTlHbU5KOFozb3JWMlpFYlpGY0NDMVh4?=
 =?utf-8?B?UEN4SWxTWlJ4amQrMFlLNDA0dERXNTVmaHBwVEZ6bzhYRXNaSmdFSU9pUnFP?=
 =?utf-8?B?YUJPWWtaOGdyZG15cEVuOXRQZXJZd0Q2NUt2VXBCQzRtU3pYZmZsa05XMG9U?=
 =?utf-8?B?SEVNVFhVcVJDOXVMVDRjYm8xRExQRGlLVjlDQWN2cjlMUGdZbXpMWGErRlZ3?=
 =?utf-8?B?Z05aWEVwZ0J3NWhORUpXeUFGWDcxcllodEN0L1l0YjFXaHlwTFI0K1Q2ZU5R?=
 =?utf-8?B?VmpqekozZ3loWVlUbTRwdTBZeStyRFJwczVZUloxRVdiNHNna0hFUUg0OEJw?=
 =?utf-8?B?Z1Ezeng4MmY4eW5tdWRhblUycDl3NUpMWjFYdDVRYW8xbDVDTjRLaUd1NXFV?=
 =?utf-8?B?cDN3TEFmcDgrajJzeXhLREN3dHlVMFVMenhUdW1JeVRoY3hxSGNOVE9VcjZw?=
 =?utf-8?B?L3B3ZURadk9pQ21vcmFTeUtNZGxKQU1NNlpiOUhuNUZGRkRUK01JRWowd24w?=
 =?utf-8?B?QzJkUGNldWs0Q0hncU00Y2VQTm50S0FuSkZSWEh1Tm9KM3YrMHNEczFDbVRm?=
 =?utf-8?B?cis4YkkxVlk5U1hjMUprQ0pSMXhJQWpPU2ttSjM1cUFrbldtQUI1Q0xndXp0?=
 =?utf-8?B?bHZlYm10TkZLMjlaQVlySzhSbVJyM0FUQVBHZGlXQ0tMOU8rRjEvbkdxNkVN?=
 =?utf-8?B?ZmlJbFUwaUtNQUNIb1Nka0dEaGRienRadStQRTl6TUsvdkMycC9HWWN6bDFM?=
 =?utf-8?B?cmpkK2J1bTBwSkw1WmhXcmlOalN4ZWJNaktPWTJXNUVYeW5jcHI0OHNUM1pv?=
 =?utf-8?B?UEFOMTVFbVVNbm91ZnBibXVJK0Z3Y00zUG9lMXBkSERxWGZ2alVjQTFlNVRL?=
 =?utf-8?B?eE1YemZ1dTY5THhkRFFEK0taR3p6eHhET3NRaDRsTkFjdHdub0YzTFlpd2ZO?=
 =?utf-8?Q?fNtQcz2qbe0Tti/Tt3NxKj02nmgpjy/xxWaTpr3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba6957b-2d46-4bbf-6adc-08d9360ebeda
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 06:18:41.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gooen4tdf2/BL08dZ+7ejFzOnKr8oSKA/HKovfiUaXwc0wSuJuUyAEoT/3DjOimGfVrV3inbqxt/VqSTG1x5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5428

On 22.06.2021 20:25, Andrew Cooper wrote:
> On 22/06/2021 16:19, Jan Beulich wrote:
>> There's no xencall6(), so the version script also shouldn't mention it.
>> If such a function would ever appear, it shouldn't land in version 1.0.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> This really does need backporting,

So far I've been unconvinced it really would need to, unless we
expect that a further backport might introduce such a call without
us noticing. Since on the main branch such a change would then
need to add xencall6 in a new version, the question is what the
linker's behavior is when the same symbol would appear in two
distinct version sections of the script.

In any event, this being a tool stack change, the final word on
whether to backport this one is going to be with Ian. My
backporting request here only covers the first 4 patches of the
series (and I'm likely to take the liberty and include them in my
own backport sets, so Ian, if you want this one backported too,
you may want to indicate to me that I should include the one here
right away, should you agree with Andrew).

> and it is probably worth stating
> explicitly that there is no change in the resulting object, nor
> abi-dumper's view of the object.

I've added a sentence along these lines.

Jan


