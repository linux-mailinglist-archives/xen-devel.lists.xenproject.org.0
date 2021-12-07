Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B146B8B4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240827.417563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXZd-0007Kb-MM; Tue, 07 Dec 2021 10:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240827.417563; Tue, 07 Dec 2021 10:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muXZd-0007Hu-I8; Tue, 07 Dec 2021 10:19:49 +0000
Received: by outflank-mailman (input) for mailman id 240827;
 Tue, 07 Dec 2021 10:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muXZc-0007Hn-6b
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:19:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33cddee1-5747-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:19:46 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-OM5SwhrnPG2bnmAWjBn7Zg-1; Tue, 07 Dec 2021 11:19:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 10:19:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 10:19:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0042.eurprd04.prod.outlook.com (2603:10a6:20b:46a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Tue, 7 Dec 2021 10:19:42 +0000
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
X-Inumbo-ID: 33cddee1-5747-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638872386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFYr5eFQCOPueSfTXUAt2nrsz3PFVQr6N31Xf2JZny0=;
	b=g0lq3s0hoY3hc5sauO7LFECIi5lSVrANkCVJJUeunQTbyxciwDw+fnxq49J0x4vZodz5EH
	E+7BbiQzCUtCpOYL728L2gqHS8qqWcOcW4i/99nVKZ9ABusXFlZx3DQdC3bixI3Rq8W0PD
	z9zymI+uD5guP90nzAl7M1HsJsSXCuQ=
X-MC-Unique: OM5SwhrnPG2bnmAWjBn7Zg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eD3I/e5Oo0umReDInPeOvq8hN1W+Heo6U2Y190A2/wvhGd8yn288tN6V5q9B1zbD0SWodOjyDu/uqJKaAQpqWgfTx9BPSHu8m6M/rgotVpTAq9yuYH2l4J2BSSiTew8ieAHxTOvDN4bvQTQlcjt9WQL5S8Nvf+IhJzQ57x/elqvoEov15f3P4Bj3etKLZW2WLODkbbzKAEzfwooe+Bwy/tFxJA5VYt+Se5iPr4mvp0XpXl6Zi3podJt4qX7kVd9y87WOr0cSs4Cg/DhY5YYO7h2Z8gDQ53t4QR1aXgNQXn4bu+QGMNvb8iHGoibSizeAAvg9ikecGIflMZhwpUwCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFYr5eFQCOPueSfTXUAt2nrsz3PFVQr6N31Xf2JZny0=;
 b=ePwp/vPBIhgJnLCxyFX3BuvG/Dn9hu27tK6RGQqwF6sIvrLkhqL8qBd+yjX8GZ+I/iODxKzDokpZID4xImuz+fSprTsN8LKsBAUEdnKq0rOI358ndtsTya1dS5m3lOkkGQtzoHYB+HOierc6NbJyDcfCJfrI2nokNn3/Lrh1kYBqn37nw34BGqGUkyEP3WTygynQN64EwSpvq2Z5iXvZsmWe8kC9LBxUkU3RHrRgS6GxKizgRoczpylhODnF+gvS1D9CjnaiYcJm2Nm+JaLGqMcMjTnG0cK3copwF/LukxcVjoz9cF2OR3J0Vubwo+L72sb7vspo2jgZ1tLGulGeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bb0ecfd-038d-2671-9929-8f9b37f5ea75@suse.com>
Date: Tue, 7 Dec 2021 11:19:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
 <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
 <9c86ae6c-f62b-f54c-b5ad-a776887ae9b6@suse.com>
 <b43c072f-4d4c-a108-2c24-801116e99c3e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b43c072f-4d4c-a108-2c24-801116e99c3e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed6cbb0-6a1f-4a06-c1a9-08d9b96b15e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038A465D0A4DD4445244678B36E9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LHRpfeTvxzCyQkf2JSsj8HKwPNxO2yZX66IZQZDQL+o4TBqQr292AquJd5+6NZNmuZ5tWNE8K9vMIsWRljMCnmKKaTm/F6vkM/sfmPyrZSxCpSEKq1Sdgls6g3dUcsPMJp5cm7T1WDDxdAr2tXQld3YKDmr1jnxlbj+HZL1j3u45KL9U+tfCLujPNXxoqgqARzsKsDR5WyzJPu0bFk3fvJtXFurTGFaqXdZVD0SPzShLALXIz7z4PUAl0nVAuCM7TysueLQVtgxiy6ygS/eLcgaBzl3uKungvsQLxroXnPcXodyBLGpvH4rRtO7UUtbOEMz+aECoNetJWEmKxlnW5VS5p0qEsOwrWcy9XJlYE+WrfYKPub6ObBkIuGInHJC3GJ9JcYWYozDMBqZ9vweCIYniueH/9G7/7ISWc+a/RavQUW+EPEnDffbD8VdROesoX852ex3tm9szVHtkWWZz7FDzlgGRIqgVXaTXv7UhLwtcne+IdQx2cxLNm8hcSU9bqbK8Il5yn0YMcT5w9lXYsRjqN2V8wU6oObKd3cBBcU6Bafl1QfWynQ84A2XjimolN+57Y2/mg9Ls1wfjE2TorkI+/tcT81PEX1mPff4aseLzw9FBj9Vsj3Eh3FNgKnnsogRD8jhsK/9VZ9NJrbF5Aatl4gPc+Xk972y++/0r5OEoI/ugwamtmp20MgfaKka8/9ntiFQpjfwB/28rGozq8jVeEoGsksUdU6qlbl4yLp2PfyPIhbr78lGy8jbDA41kmvlPyvKobiN8yuKyggjE5k3XHidzDJ4hpDS79CvFADpJC8lJc7AGo0SRyri8XwzK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(54906003)(31696002)(38100700002)(16576012)(5660300002)(6916009)(36756003)(956004)(316002)(4326008)(2616005)(53546011)(31686004)(86362001)(186003)(83380400001)(26005)(8936002)(6486002)(966005)(66556008)(66476007)(66946007)(8676002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNvc1VBbGF3Mk82NHdiTHN3cmkwVTJXVVpxazZxaVVhK0F3eHB5VDc5Ty9P?=
 =?utf-8?B?blZtNWNETkVoWnQ1SWFKUHRRWGhzU1VtTGhDVitKQXM2TEg3aWtmZEFOaS8x?=
 =?utf-8?B?VkxQUC8wb1BoTzZUbURSYzVEOFJlZG1HU1h2UjNrclgrYlNKeVRaNXNkZWta?=
 =?utf-8?B?OXNTN0tqUnFEb24vbHdOVUpHRTVOdzJrUzZxM0NpYUpQVkQ1dXVqSE05S3FD?=
 =?utf-8?B?ek42K2RtUjhhenZONXdEc3RoaVFXeE8xUytWbnVKV2lId015ZlpteFlVWjZh?=
 =?utf-8?B?U0VLRkR2QjBMNHhoc0s0a0JxbURaaDJISHE0Z2h4czVCZDkzQkVMUGwrbGIw?=
 =?utf-8?B?OU9IYkFvY0w4Z3ZTYkFnQzdnRDNRWGhxRzlwRFFwcUFJVWRiZ0xVdzFRLzJH?=
 =?utf-8?B?bnhWWi96S3Y3MmJHMGdFeW9GdEpnR2JJVlJQZVNRd0QxbWJGb0o1ZTVxTkJW?=
 =?utf-8?B?SmVJcXkxQk1MR3VXbGp4YkZFOTVLa1R0Q1VMTk91dUxzaUlOL24wQlNUSUYw?=
 =?utf-8?B?Wms3MWNlRGdYd0hRdndmMHptcmF0S0FKS2Yxai9yVGdPV0dGNnBLd1JTbFI5?=
 =?utf-8?B?MCtNSVBjekcwUmZiOVRNaEgrUkY2cE9zUnZFYVp1SERwa1NlQlpZZ0dhY0lq?=
 =?utf-8?B?QTZqd1NvamkxQStBY29lenowQ3NjUTJ0OHdDaTVsRGJ4cG0xaDVlNWxXSUZ2?=
 =?utf-8?B?b3ZNY2RWQkd6cnZsbktwek0vSXU0RHRjUGxvWkRmdFZXSDJQdXJMQ2s5bStn?=
 =?utf-8?B?RGlRYU5uNVl6WnF6NEVqL1B2MEhlblZNWVdDMzczcGtqRytxNW4vRFJ4bTBB?=
 =?utf-8?B?d2JJY3hqcmdKdW5KMGVxWllqa05XY3dIOW5odDVGSi9qQ05leGR6RkkvV3Nw?=
 =?utf-8?B?dG4xWnMwNjh5Zm1FcGhZV2hlREZRZTYzNGVFNVEzNGt4V2lyVmNZbzNpaHVV?=
 =?utf-8?B?TEMzRkp5UXA4V1hQNVdlUC9DalNJNmNqOHdYU0J4aWx4Q3NLcithSlBVek9O?=
 =?utf-8?B?MVJDbkU5cXZOSkxROVVYdHVvTTQ1NXNSVm52UGdXSTNwemovSWY5dWpmYkdN?=
 =?utf-8?B?NytHbnhDYk14c1ZkdnBadXVJZFZ2Zm55am9IUFpaYnBRQnlvMjk0OTlTMmZI?=
 =?utf-8?B?bXRVN0RMaVk0SklJVko4ZGRyV1l0NWxiRndIaXpwUjNmUy93QUNWRW9tbHBG?=
 =?utf-8?B?VFplUlpERnF2ZGNlQVVvS2JaelluWEh2UVpXMVRVbXlnVFZuUyt4eC9ZWmFY?=
 =?utf-8?B?TVpCSm9YUzFGTk1sN2g4MTg3UENrWDdvdGt2RFJvQVZ0djFVNkZSNUovek5I?=
 =?utf-8?B?bncyblRzVVpUdThtWHMwSGxZbnBkZ0ZWcE9PYkY3bnNQRHlyZlg3eFhGUDRo?=
 =?utf-8?B?YlMxUnExWVptVnhraERKZVZQUXJZUUkzK3FRRzdpMkZFbEwyMW1Oeko3OWcw?=
 =?utf-8?B?bldQczFZcWpoTFNNU0ZCekdFL2R2dTJTT0poek0wcXBjMEU1eHRPTjI0Y0w3?=
 =?utf-8?B?VGRYZ0tsb205WUZhOXVnc1FCZnhwb1lRaGVFejlRL1ZENlRmZzFSZGlFY2N2?=
 =?utf-8?B?Z2NjaithNExoWHhCM084bU5OUlh2UnhpUHNrS2s4MVhlVG85QUlYeVNXazkv?=
 =?utf-8?B?UnVNbGhOSG9DYy9aam9ZRlpreUZOOUZ3Z29ESW01STFuVTdhYTRUTEo4eHNp?=
 =?utf-8?B?S05kVHRONVVSVEh0RDVoR0c5UkNLanNNUFNrak9ndnIrZ2tWZ3VzaXVEUTZW?=
 =?utf-8?B?dXNMZE9BQ3ZIM3U5Rmh1N0xJUmlNOXhOQ0JwUVVyYXRpcjhmUHpvNFVROUQz?=
 =?utf-8?B?c21uRExWYkRRZlF0RnlRMGJ5WkJ6VFBjOEhKdWRCQmVuL1ROVis3OFVaVVR4?=
 =?utf-8?B?TmRGZGU1b05DZzFxRjJWSUtKNmcxdXlMaGt4bG9IbXcwWkhUOEQvZTErTkJv?=
 =?utf-8?B?OEtaMFc5QisveVU4QkhIVFFWaCtCelhqQlcyL2gvNGZtWWlJYVkwZmNTV04r?=
 =?utf-8?B?ckdrM2hSbWtYK3dSeWkySHhFUHcySnUvcU4xWlBrdTM3dEFmMjVNbStpamx3?=
 =?utf-8?B?QitJU3oyUnVCemFtaklPbFgvc3pCNlhrWTRMVEF2U0VFVFdVSjVnbUdaZ2hZ?=
 =?utf-8?B?Y2J1blRVcW9DZEttNTcvWklHZ0N0aFc2eUNoTndjdEdodFpnNktCWU85ODRl?=
 =?utf-8?Q?2uHY1rJeA/cR+OhPMBcQbC0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed6cbb0-6a1f-4a06-c1a9-08d9b96b15e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 10:19:43.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Fj2rDmyUAyShedQb2L3F1VVuqkMTuRqS61KXs68dRF+H5vUS9CSo0ZM0F1pry1UpUyT+qNpLnr4d1qiBMuozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 07.12.2021 10:59, Julien Grall wrote:
> On 07/12/2021 09:11, Jan Beulich wrote:
>> On 06.12.2021 17:21, Julien Grall wrote:
>>> I still have have no way to verify
>>> what you did is correct.
>>>
>>> For instance, the tags in patch #2 are:
>>>
>>> Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
>>> Reported-by: Yu Sun <yusun2@cisco.com>
>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
>>> Acked-by: Daniel Walker <danielwa@cisco.com>
>>> [Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
>>>
>>> The tags in the Linux commit are:
>>>
>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
>>> Reported-by: Yu Sun <yusun2@cisco.com>
>>> Acked-by: Daniel Walker <danielwa@cisco.com>
>>> Cc: "Yixia Si (yisi)" <yisi@cisco.com>
>>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>
>>> * The first two matches the original e-mails
>>> * I couldn't find the 3rd on the ML.
>>
>> See e.g.
>>
>> https://yhbt.net/lore/all/20191108202754.GG18744@zorba/t/
>>
>> (Andrew Morton's reply at the bottom) for where it originates.
> 
> Ok... So this is taken from a different aggregator. I will have to brush 
> by search engine skill then.

To be fair, I went hunting for it only when writing the earlier reply.

>>> * The Cc could be ignored
>>> * The signed-off-by are I guess what you call "mechanical"
>>
>> I would generally retain Reviewed-by when our code is still quite
>> similar to Linux'es. Acked-by are on the edge of being useful, but as
>> you can see I did err on the side of keeping it. As said in a number
>> of places elsewhere, for what I call mechanically added tags I am yet
>> to be told of their value (or even need) in our tree.
> 
> I think the question is how difficult to do you want to make to the 
> other reviewers? I appreciate other (including myself) may have ignored 
> the tags in the past. But now that I know you do it as a manual process, 
> it makes me a lot more nervous to simply ack such patch without any check.
> 
> You seem to be unwilling to simply copy/paste them.

I'm unwilling only as long as I don't understand the need for them. As
indicated, while I appreciate your "make verification easier for
reviewers", I assign that at least no higher priority than my desire
to leave out inapplicable data.

> So for this series, would you be happy if someone else do it for you?

I'd be happy for anyone else to start over. I would even ack such a
submission myself. But as long as I'm recorded with S-o-b, I'm afraid
I'm not going to accept re-addition of the tags for no good (as per my
personal view) reason. Otherwise, based on experience, the example of
this series could, in the future, be used to tell me that on an earlier
occasion I (seemingly) did things differently.

As said earlier, if submissions in this form are going to be nak-ed
going forward, and if good reasons (see above) will not be provided
(and hence leeway will not be granted to the submitter) to support this,
then someone else will need to start looking after imports which may be
relevant to us.

Jan


