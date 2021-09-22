Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38900414B0C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192775.343398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2dv-0006kV-Ni; Wed, 22 Sep 2021 13:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192775.343398; Wed, 22 Sep 2021 13:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2dv-0006hv-KS; Wed, 22 Sep 2021 13:50:35 +0000
Received: by outflank-mailman (input) for mailman id 192775;
 Wed, 22 Sep 2021 13:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT2dt-0006ho-NL
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:50:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d7574ee-1bac-11ec-b98e-12813bfff9fa;
 Wed, 22 Sep 2021 13:50:32 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-BxfABUEYMza0WOxIjD2uVA-1;
 Wed, 22 Sep 2021 15:50:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 13:50:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 13:50:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 13:50:26 +0000
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
X-Inumbo-ID: 0d7574ee-1bac-11ec-b98e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632318631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTFda4+SGUG0aGYL1bV9SUmIq1XXpALnAtoQXqLCOqE=;
	b=IQ0n3/XIbChgz0ndLQ3XeSRpk9UjuYCS+ZSx7tcWASTvfrEGwjeGvA3i9qZ6DnC14mM1LW
	V8pi28ftuxaRVabjIQaajkQlUsyHvSk/L6iBV11e/CP3usJV6HEQvvtMDt/O9NBDrinOVJ
	U9hd9DPiTfRVr00f9uW3iqf84zJQ+4I=
X-MC-Unique: BxfABUEYMza0WOxIjD2uVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFPeItqSdl0dF9QsH3ibQBSM7aSbbLMB+WvvT33ExnKbvtgDXz0FvKIhv1ENTtK1JEKZS/8MF2lNzViV+CRlbGh3WibonW0pt7l9f+sCHBPSow0L5q5xPJ5JDDHcE0/uZ5qHa+fe41u+Ayr1fw1v0pBQWbdwLOQ4PxvLahCBZ78uTtngNujWUMOKIt4OF7yZr3spYP3jNYT6xViH3s2Ih2nkkasbZLYg8YvY+Nk+aTXhRI7bXCWLEwvHHjldeMtDC8oAPYJKDYHg/eiieT5D21ykKvVtGzcpyt068dym0Z/4s9H59eLgppZoN1KE8zGOEmu9b+RB8SIyKT86hfuyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VTFda4+SGUG0aGYL1bV9SUmIq1XXpALnAtoQXqLCOqE=;
 b=BweWMUnheQ2VbrrqSClhnE85rKNnDpI+tQggz1P5eteqv6R0GKYYt+Q/0nUxcJODGE9aW+m80Tg3kVFW1AO4Vl4o1u/ba2uJk28GriBfcrP84DskCZGewSRiBArCN8ZVEPxKsv9qdeLRo45FXSrtXW5pAAw06FK4ilzdXKvcCo6f3AEWJ3Wwy7C88VcVpBMvgkiaH3O8B9KfpvHX6dlScH0gQiOjmaNOSvxZex+UZjDqHc9fXTiLQ9cRhMKJmuqRF3VxQG2nkVGW68wY5eSyyzf+XsGaA5N0jTtJQgYjODjqP6N3qQRW+hecbjLm1arQRTLaa0Eryg2sVZRYGUftUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
 <b2a2fd30-225b-2b79-f160-8ed2e4ad439f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c1ab98a-8fde-3d9e-5250-c5a40af70453@suse.com>
Date: Wed, 22 Sep 2021 15:50:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b2a2fd30-225b-2b79-f160-8ed2e4ad439f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9df45b7-51ec-4e80-e5ee-08d97dcfef04
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260645FB577051F955DB6F3AB3A29@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ts46yRoKb+jRDlZqR3liPXzJoeT3R+w4CwFHZiF+2CD3HOpJiGJR5TAT7xzhUHyBO00tQGBMiuPb1khWb2tYFIoqvdYW21J5qRikDUgy2id6F45w8vZaVKJZp4xHZtdXq1Jasd4cvwovQSchCqP4+0cvKfugalLy9/7RKITlUJg/s/gejL2DOPF1vBWP4C+Gz6TFaecTW3xiMFf/mSBTJ/i4BSltODuAs7fD2QTHrFw2wKY8iatD7oDIg+TOVEH23wv2iY2zWXkROT8qyMa4ZCPr1pRu7H2G97A07RLmGugIWFb6m4dNzgJ3fvQbJ2q++b+65MtdFCRflTownDOTAPO9pcJXmFXvesk84XoNkOWNAfZUtg9gI4gMX3/7A56/Hplv+9xv++IGTVhk1QD+EXX3JqYuMOOyNy37akmGzjGq1jGfJHI9T01AFzdEISkIfp/zx589XruYf2lC86ZF3LSAdDHCBq3uLamgjGSeI+BOaF6+32CNT0EQlfB9hW86vwP80ibmZv7miOlYjIAAs8fzEeEQRLmgHCzuCA/66/ijeYXzuaHG8H17R6iSae6Tttq0NcFIGAkrztCT074yhB8tjUd/yUcud5Y/g27V/mVVom0UmabLkAbtBIPGxZtLKXj0SYESpdb6inS1/FXuJcZHH1sslDBzDSm6MqD/qRHQjvIrrNK6hDteL0kJT9NnGyrBDX4UTlOzLA7TTLACLBm1xihqqrEI0OJXYuyYpPmxEmHlgHwqlBLAeSlrhH7X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(83380400001)(4326008)(38100700002)(508600001)(66946007)(316002)(2616005)(66476007)(66556008)(6486002)(6916009)(956004)(53546011)(8676002)(186003)(54906003)(86362001)(5660300002)(31686004)(16576012)(26005)(8936002)(2906002)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0NMVEZXbW52aEs3ZXBCY1lJcEQrQXJ0UGNub1BSTFV4NktkMHRJMnNXRDhm?=
 =?utf-8?B?Z3g1ZTlrcGhIcEFZdzFDQXovVUl0NUtUMHRJR0J0NEUxS2tTeHVkaVVya2tP?=
 =?utf-8?B?bk5LRzF0Y1pOSlFtMXZxZWpybmg3TDUwRzcydkhzSitCKzl6K2tVYnVWNlJW?=
 =?utf-8?B?Mk41d3VLSnRHazc1OVVjdDZBQjUzOVZFMVMrWmNIeXVhSlpGWTVYZjQrVGpn?=
 =?utf-8?B?NWNydVNqcXhoTWV5TjBwMHRkNmRlQ0labWoyemo0NzRPWXdxaDM0Y1lXWnlC?=
 =?utf-8?B?Y3NJN3dFNmluTWNxUHJ4dDA1ZmpqTmZVNS95QkZkZllYMXFhMmFJL2VUWlhR?=
 =?utf-8?B?TXhqL0xNYTAzUjZnSnBCRHJnK1c5ZGt0MGRKc3lGR3NJcXlsc3UzS0NSRnMz?=
 =?utf-8?B?Q3NyT2xlYmY2TFhIVTJtSVNHVm43QmNZUDd6WVFubEFNbUNGNDFkbUFXZHIy?=
 =?utf-8?B?Vy9Zb0M3QVVHYThLWXJrK2k4NzljcmxRelJHajczVFl2bGhhWVNjOG1ZUzdB?=
 =?utf-8?B?K3NjL2xVdW5qQWN0d21TU1BlWEI2TFZKdzcvUE9saHl5cGtjM29GNy9DRGYv?=
 =?utf-8?B?bEtqR1FEeFN1bVN2VGYyVmttK01IWm05QS9YcUhFMi96Tm9KNDcydEtXRmhu?=
 =?utf-8?B?RFhuQ3ozdFdySnhjUEw5YlYxdEFNWmFQd2pKMGtFcTI5THhLVS9NVGxvNkFa?=
 =?utf-8?B?dHZpdjFrdU9NRnB4MGxpL2VsMXMzUXZwZVpyVDNWK3d0VkUvVXdZZVVzSHhV?=
 =?utf-8?B?Y1Z5Z0k4eFo4MkRDZEN4WFlGOTA4cWlBOTRCM2xxeUR4N3FBa1hpQWpiVG5y?=
 =?utf-8?B?UWpwZzQvTGNPaGF4VGQzWDhwa2I4Y25PVzlhZm9adm9LWUtMaDZqVURLTm1z?=
 =?utf-8?B?VVl3RzAxbnZObDYrakxiMVN5bTRMeGtobVBYMElWRFI1eWVoUy90eklLNGcw?=
 =?utf-8?B?YlhINVJMeUtoWmFEM2svM1lOTnFoNUFjTFZVa2NYcHBVY1J0UXhwNTRlUzA0?=
 =?utf-8?B?a0I0bTZ3V0NYS3RjaUVoU2ZqbmVHTklqRnVrWkUzUUhtNFJaNmhFdWVPTm52?=
 =?utf-8?B?RVZWbzdmS3VNVEtpZkErZzF4U01lbm91NnU1YjlQYllvek1jY0g0RnlYeVlB?=
 =?utf-8?B?MDVVVFpNZVFkNWIvQ0ZlOWNjcHR0UTl0SE8veEIwdE9DUVhWU1BBd1RxRUJ3?=
 =?utf-8?B?RVBUL3VRaWRJOWRITS9KNGN4WXNvZ05wQ2lqUnFVck9KbWQ2b0NXcEdTNG5k?=
 =?utf-8?B?bEZndEhEVnV3dGRRTFJOaWViT0xLTDdlb3RnRkR0STJjNE0rRXpNRkthKy9M?=
 =?utf-8?B?Ym9pbERpUEJ4a3ZyalA4Wi8rYjdRYXFmaE9vWFFrUmtPbXRpdGx2TkIvNmRs?=
 =?utf-8?B?WUY0ZDBiT2RQUVVjZjNTY1ZwZDFnNmV1bXFXY29yWlBBVkVDS3lTallyYmRx?=
 =?utf-8?B?RWx6Y3ljZ2ZVQmJla0ZvME1neXg2R3RhYkxTK2xZWm1vd21nRUpqSWU3bzZN?=
 =?utf-8?B?NCtrVmN4a0xJS1RvV1gwOHRxQnhpQ3AyZTFYU2haMGZhMWRUcktUSG5uWk9q?=
 =?utf-8?B?emJlOFhNdnBDYllKR3R3U1cwdVVrUXIvVi8rOTQ5Umd1ZXlkZFEvRE8zQ0dY?=
 =?utf-8?B?V2xMNlRTeVFNcTV5ODE0UXdsR0Y2bWtYNWoxWUg1WGZzaVpHVXVKK3J2cXp2?=
 =?utf-8?B?V2JPazk0MHFJWEVuWUtQZHRMMm43NVM5TFlxazdLSzhMZGxranBkbjF4T2FP?=
 =?utf-8?Q?Z/a2ZvdwAfMFER38xD9HuO0m6rPNTDfqjZF6mdC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9df45b7-51ec-4e80-e5ee-08d97dcfef04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:50:27.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlhnB/Xw9nxTH8sCUqwL/Ot3b5msPCEQ1pxzhOcllPbD0lLkti+cbABcJ19y/jQahuCYutIXzYpfmTRYzI91Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 22.09.2021 15:31, Andrew Cooper wrote:
> On 21/09/2021 08:17, Jan Beulich wrote:
>> @@ -933,7 +934,18 @@ int __init dom0_construct_pv(struct doma
>>  #ifdef CONFIG_SHADOW_PAGING
>>      if ( opt_dom0_shadow )
>>      {
>> +        bool preempted;
>> +
>>          printk("Switching dom0 to using shadow paging\n");
>> +
>> +        nr_pt_pages = dom0_paging_pages(d, nr_pages);
>> +
>> +        do {
>> +            preempted = false;
>> +            shadow_set_allocation(d, nr_pt_pages, &preempted);
>> +            process_pending_softirqs();
>> +        } while ( preempted );
> 
> This is still broken.
> 
> The loop setting the shadow allocation needs to be outside of this
> conditional, because it is not related to early activation of the l1tf
> tasklet.

Well, I'm not sure what to say. On v1 you already said so. But then you
didn't care to reply to me responding:

"Are you suggesting to set up a (perhaps large) shadow pool just in
 case we need to enable shadow mode on Dom0? And all of this memory
 to then remain unused in the majority of cases?

 Plus even if so, I'd view this as a 2nd, independent step, largely
 orthogonal to the handling of "dom0=shadow". If somebody really
 wanted that, I think this should be driven by an explicit setting
 of the shadow pool size, indicating the admin is willing to waste
 the memory.

 I'm further puzzled by "not to retain upstream's security
 vulnerability" - are you saying upstream is vulnerable in some way,
 while perhaps you (XenServer) are not? In general I don't think I
 view downstream decisions as a driving factor for what upstream
 does, when the result is deliberately different behavior from
 upstream."

Which has left me with no justification to make the change you're
requesting. I've now got an ack by Tim and an R-b by Roger. I also
view the change as is being an improvement on its own (i.e. I
question you saying "This is still broken."), even if (later) we
were to follow what you request. For this reason I'll give it a day
or two for you to reply, but otherwise I'll commit the patch as is,
leaving further adjustments for a future change (by you, me, or
anyone else).

Jan


