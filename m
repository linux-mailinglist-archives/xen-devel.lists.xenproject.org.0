Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D43EB5A2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 14:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166788.304440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWPh-000771-0q; Fri, 13 Aug 2021 12:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166788.304440; Fri, 13 Aug 2021 12:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWPg-00074E-U8; Fri, 13 Aug 2021 12:35:52 +0000
Received: by outflank-mailman (input) for mailman id 166788;
 Fri, 13 Aug 2021 12:35:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEWPf-000748-4D
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:35:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 271ac63f-42ef-4515-a317-7ce433f023b9;
 Fri, 13 Aug 2021 12:35:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-kXh1UKFcNPuKp98o9g3qeQ-1; Fri, 13 Aug 2021 14:35:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 12:35:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:35:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22 via Frontend Transport; Fri, 13 Aug 2021 12:35:44 +0000
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
X-Inumbo-ID: 271ac63f-42ef-4515-a317-7ce433f023b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628858149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P56ITVavRR7rAmONoTimKF5xpeKb2AXY2002iQih6cg=;
	b=VECFXkaq7bCmw9Z8L0UdkzZuzTG+YNnq89gS/nA5DvTko6usRquDkt+LdwTApJsohJ6HdS
	xr0ZzoQ8VUNr6nnlIK5gPJ2Y7rkv3Qw1u6MILq+WoOeWhnm2CsFvUI+EqG/cBYlh+1eG+8
	7rDFzJdsKJ1GN+rddTE7ymq1Sgvxv8Y=
X-MC-Unique: kXh1UKFcNPuKp98o9g3qeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV2/bHL7vCqGpdh6j3So8UaRPNm64BR4AR2Wal4hDfHPi39q2z1xoynxqWVDDwWMQviKlKAUHbyqWqhinPmVrg2bf+/KCbup3l97LokcfASeaYJT2HLX/gqdDGHw/v1h/rqMjsNA4c9sS4rkM8kYa96RyvM6sbVN6YeepmYPjkWCL180aMxBmk/Xfhdjmhe98imv66/gPwcyRHMSZiIbiiHIPq2T92lzpSM31gMP0Nnt4AWLZuau1kiDUSYAmTinUKVnivRd3LRZ/IaUMFUNbd4MO5/d9GBEo7RDlEgxlGweiKHxLzx3eUYaEA4gilzAAyIvwavXGpaBv5tQrIIq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P56ITVavRR7rAmONoTimKF5xpeKb2AXY2002iQih6cg=;
 b=NrSFKJQNFwuHeKljP+clDXjzOgPhYZFZiYecxzLFwyiosHPuB1BEG4qYDVL6qZrC1+oSTIaws+Iuisx1KY3mMPIXkW3DB3KUdaosr3nmguzsWLDWNwmLV6uXaoCw1vskaApu9uJl6KjmFFA2zkIrowe+yDXaouhTpgd5gbqUOTZHJfvfDcBk93FdWvYfo8LQnDJHZ0ZQAWPzwvioGzsn37UgxqYm+07jGCd9AK1D+ILsywIGWNIx+0zw/VRHJeboWnFWWo3KzzkxOUncDpDlRwB6mskbN/SiUSiQSsgM/JcEsjlqIEaZprfk47pSLf5RozgyxvSpSrJBiUKJmK73og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] tests/xenstore: link in librt
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
 <24853.1273.985325.539310@mariner.uk.xensource.com>
 <74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
 <24854.21217.976758.626859@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fbd9038-8603-da23-ce7f-1544f7c04d55@suse.com>
Date: Fri, 13 Aug 2021 14:35:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <24854.21217.976758.626859@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e27fcab-74ef-406d-3825-08d95e56defc
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360AC8C52C88C06627509A3B3FA9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yK/HmuWYwnIBB4O62tVeUapooCzGFuL0yYGCtWembdmUzfOoRpEDMejH3gmDRfexjo7GzvojIwKB4iwXCPW1dJAyXa8jUFlHtC/IYXVkkaP96Vufj/i+bEGOzg97EFsnPU/Wz6Xv46TsHjJCKtQYSQcsowbDyzCnI2Rh7G+YLScvUUtc0/M5v5HWLWF65L7W4yPUqsiHQ8fcmCaU2lHsZBfZlr4dfLXrKdiDpBbYUuLi1ELrnbbdgcDOFLV7ui8cKpvE00jD3lnYT0PU53YptYV+fY1vG2W65zScjQb+F9XoqK/IpRqBYArwQU8VOe1z0y6EqphTG595+ZxkeEjH9DVTWXVymx/f/E2uSrB9HQ6Pqkj2erDuvyERtfADwABV+9DHkIb6rENZ6LL5knfmqHVD4oz8RwA+2Ui5rWrXG/OzqcXapAgkxpFeDCesIndkyD3GiMoKfTvdxAqi3V58CY3+dn28QkHIg0TB1ASHP8NXNwHN3h1wPO+oRFcIdFnQA1TragrLozVyC6b8iN+/vokVagiZc12RT+D2m8RmG7kjvJf+Gt34QzYe3qSioXYfhJJIom+D9mq0Mbps+e+4+IZnTgV17/CQpoHecdzFYypKyh9XlldaPMrmuNrHLTmKr/ojB+T+vtVWfdXORS998tdjlZ6Fydz6U7CCILcQENAQTZ5JzBhizOmQM9YgBiGUjRYWZBnJ56Kg4h9ICHVJoSQ6myw7QlFMo5fw2yR+vfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(396003)(39850400004)(316002)(83380400001)(36756003)(5660300002)(31696002)(186003)(38100700002)(4744005)(4326008)(54906003)(26005)(66476007)(2616005)(6486002)(956004)(66946007)(31686004)(8936002)(53546011)(6916009)(16576012)(66556008)(478600001)(86362001)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVBiSjdsRXF0VjJlWmd3QnVXdE84Z1dIeVhnQjFjdnFpYVU4VkhGUFFObjFB?=
 =?utf-8?B?ZzNvL25XSStoeVhCZjd3RGZEWE5vMnZCK3dtUjBLUGRxdDBIVVprMDREVmRD?=
 =?utf-8?B?VkxKS3U3c1lJMkFPRHpkN2FEa0xHTWdvN3A5dm1qTnBHelo3OUtVeGo4ejdT?=
 =?utf-8?B?dSs0Y2phNEt0TkRNbld5alBsOWY1bGpOL1A0dXp3U1J5TGt0Z0hIV2NoTWtB?=
 =?utf-8?B?bXN0TzNGSE5QQWZnajNpSzlvbHNTVVhYellYUmxRSVdrdkFqV0M0T3JFYXJX?=
 =?utf-8?B?Vk81aWRmZ25FN3d6UVROb2tOQVRxd1ZhNmN6ZnFpS2Y0YUIvVVh6UklLZ2dt?=
 =?utf-8?B?dndvNjI5TDlyRWJYODNXMVkwd2RwSEZMa21xN3JTUlBHSko3bTFwaHVoRXNR?=
 =?utf-8?B?OHFza2x3TlJFcm05K0pVTE8wblAxais1ZlZ5djA3VXE0Uk1DYkQ0enhXcExU?=
 =?utf-8?B?czhOOFJrUzBoUXcyT0drQkpzNTM0NnZuNERvNFRrZ09lSDF3bFVMVUZTN0I0?=
 =?utf-8?B?alJuazBIaVhib0RnSktRZDl5cjlmQWpRUVdpVHBCbWNaTzA5bUJodmZNVk9K?=
 =?utf-8?B?dG81ZVRVK2Y2Ykc0R2UzcWVPRXdYeSsxdEU2cE5leTBTMkl3eEUrVmx3SlhG?=
 =?utf-8?B?a2lDNG85TWh2ZVBra1pZbHE0MnFzR1k5L0R5cG1LMi90K2JsT0oxZEFqQWFq?=
 =?utf-8?B?cUhPd2tRb08veCtHbVpaVkZOUkVpVXV4ejZFVVZNdVZBZkc1TE1XcTJUSU1k?=
 =?utf-8?B?RUp4VURQZkhqUkxJUXRONEhTa0dqT1J2Q28xRnh3eURZV2VNaHRTemxzOEVo?=
 =?utf-8?B?V2hnYkhLdEViRVZsTGFFbkNPcVdQaUVpdEh1eGpCeGtYemlIeUhTRTNlNDVY?=
 =?utf-8?B?UStqdGVUQlh0S25QT1BndU9jN2VwOWQyYUVMT2hTNmpvKzBEaDh1dWtoV2w5?=
 =?utf-8?B?WXgxUVB2L2Z4U3RkNVpqTFF5YnVqRCtyK0UyeWp2UEhoaFRRT3V6UlJwWER5?=
 =?utf-8?B?R3JTWWtSNFZWRjJCNTFYRzM3QkNheFpBTXQ4c3JBVXBodytxQjJETHVzTnpv?=
 =?utf-8?B?ODkxRkkzVGFCWEJOSU14WFQrbnhCaGs3Q0FWdFJhL0ZJVG11WE91ckdyVXJC?=
 =?utf-8?B?TnBuWTdDclJ1emNFWjkxd0JBb3owMEYzdlJQUzRBcDJYREtpMkNoamdCdit6?=
 =?utf-8?B?SVZXR2lSdmhBNndDUUNXcTZmY1BwSnlJMkU0WVhjcVI3Y055MmRna1pZYm5q?=
 =?utf-8?B?alNBZWpzTDBLZ1ZoR2tWTy9Vc3VVQThxczN1djZ6bWF3WXFjRjJMMjAxWGdr?=
 =?utf-8?B?ZkhpL1Q1K1cwZHF3bFVkbXQ4MEpvN1FWbmxUcXV4T3Rxa2NRR2x3UlBnY3B1?=
 =?utf-8?B?SDRMcXpDQ0FKY2o4K25McTdsK3BreHdzYlVNTC8rS1Zld1BROHY3SFlYR3hG?=
 =?utf-8?B?cWx2d2FkR0lHQ3Zkbnh2WTZBbm9hOGFaL1F2RjEzdWdMNm1IVGZnS3o5MThL?=
 =?utf-8?B?WTlvdDJpNlRRMXBrQXJ1bXRNRkJWdkJnbXJoZUhOaEdJb0ZscXMxV2RycllN?=
 =?utf-8?B?YWRoZUJScVgvVEdZMjBlcFdVUVdWZGxrZHZlUlBqY25NdG5YWTdaalpIc2Vi?=
 =?utf-8?B?ZlZhMWFicE90U1lYNk5vaGJBWHYvSlZsSXVnNmZ6SmdoZjRDUXNtUzJ1VGxU?=
 =?utf-8?B?YzhSL0lsR3JaOWREYU9nVGVUeFlDeEZ2dlNDd0c3RnUzVGova1JhWnpFdjFB?=
 =?utf-8?Q?LNWJ3exd21YDG34XA8mIYUFHizGa8d9ppyEcC4K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e27fcab-74ef-406d-3825-08d95e56defc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:35:45.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY85k5gW6NHVJVYQrkr0KkCB+oi+R2uPQTqWFlULDzFAB/niENXNMBAdSFD0k++ykavi7YwcxBXrjZzzbTKhzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 13.08.2021 13:09, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] tests/xenstore: link in librt"):
>> On 12.08.2021 13:24, Ian Jackson wrote:
>>>> +LDFLAGS += -lrt
>>>
>>> Don't this unconditionally is definitely not right.
>>
>> Assuming you meant "Doing this ..." - why? If the concern is that
>> librt.so may needlessly get recorded in a DT_NEEDED entry, then I
>> can replace the early addition with a late
>>
>> LDFLAGS += -Wl,--as-needed -lc -lrt
>>
>> one.
> 
> librt might not exist at all on some platforms.

Hmm, indeed. Do you have any suggestion then? Adding a ./configure
check is going to be beyond what I'd we willing to spend time on ...

Jan


