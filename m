Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF53C6B45
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155047.286360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ctt-0006lC-AM; Tue, 13 Jul 2021 07:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155047.286360; Tue, 13 Jul 2021 07:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ctt-0006jN-73; Tue, 13 Jul 2021 07:32:17 +0000
Received: by outflank-mailman (input) for mailman id 155047;
 Tue, 13 Jul 2021 07:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3Ctr-0006jH-O7
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:32:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c391e981-962c-4c24-b169-4156f37cdf14;
 Tue, 13 Jul 2021 07:32:14 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-S0BDWLcDNk-E73AfhXRAWQ-1; Tue, 13 Jul 2021 09:32:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 07:32:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:32:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 07:32:10 +0000
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
X-Inumbo-ID: c391e981-962c-4c24-b169-4156f37cdf14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626161533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Vkp9tSA4aA3ABziLTFUO8428NUHA8vTa+2c7slAeLg=;
	b=lD+Mg6CF+DbnHmsPgcmgwpbNXXQf9xjH90l0MW8V3u+BG+IFzcYybFWlj5e6k65sWADV/E
	RvWkhMymle8ai/D1gYtycBPIdUwi0acGrZDF95kGfFm/tHo2hFtlc9YeEJxrpuNTYMVf7a
	raXFE0mwCfwku/5UuqZ/VSZd3oiVFMQ=
X-MC-Unique: S0BDWLcDNk-E73AfhXRAWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP01vk5Z/UOvF3zyBDqQxP0L/k9AKJ6bjm6u6RAMA5BoLJz9uAecfz3AvZEmCpVSzUf9iPvoqKTClSxAWg40E3VoN1FAbmsGXDezuFkkcjY8P5YaWHBFih+6CEzEfMuE2AHZxeOdTs/ah2RqeUPTHNruj5dLcKKsJyybI7pqn4fhdEptyWAq1cluKueQh8K6+Y5qjCXTW8FyoTiJ+2XNf4KV+k5upk/n2QpR1C6NASXIAt8zW6JswOSdFJwxsKndmAYYU9hXY+ZoHclGqLrzl5z4QcSD62+cO4iYIg7lertnpsEm/nWYiJhVfzYhbNvQ8tIMvP2lPFuJciA43m+Unw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vkp9tSA4aA3ABziLTFUO8428NUHA8vTa+2c7slAeLg=;
 b=fgJYMoh2MQ8Kb27k/o+Ouy5Nxnl7wBEimTI6wDSEJ+OIbE6ierwfHUM6dKcwe/kAIkTohfN3sri+Dh/6vHUHTCUXxOIRZK4CBLl+X+0zVCN7tilfScWH3w/r4gtg8NGm37yOnigJzrzBVkuBmsujNtZKW0qYTplPSFs0Y9DN1Y6pS2knxBWUS9A8kycnZSqv+YdUoOMWcFKt/40ap8NgC739Adkcqq3l2ETjnLXycrgDdHUAVQ62rEWJk+Qipen7WRXFEHykA4ln6SEDZnU5ie1VSkwZTJJ4bQb4ZDnAp450kbmq8JNTcgTlj0VBrNtZOHswd3DiqU/Sn/MR54uczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 06/31] x86/mm: avoid building multiple .o from a
 single .c file
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-7-anthony.perard@citrix.com>
 <73b924a9-dd69-7cc8-acf6-e4ae746c244c@suse.com> <YOw6S4uJ4hF6/P3y@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14c31abe-e395-6d60-bd91-4941564fc5a4@suse.com>
Date: Tue, 13 Jul 2021 09:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOw6S4uJ4hF6/P3y@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a584682d-e7ed-4d24-d8de-08d945d053c1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49422361C8371DD4A515DBF4B3149@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ioixtbi7yk2gLpro2UxFyDjagBYfwwzywRRogw66HbozEUPQXoHf2w93P4thydr1pBt+eRPne8ex7dXHlDXUUaGW2MiGWZ3DkGiEEVMceKUEONlygK2enWnDoRpyHKMQu1Iq2zWWcGeRJ6Cno+vNUkpRnmu4CdliL6b26xe1pxQiyFqIsyuyvG9np053ONJ9E0Ei6HHTMD8LyhsjAonju3uR5+CxKMZ4W/3NdYDjtl9YUZsfF+JmP9+ine/8s3Qfwsb4HUOO8tqUt+N9cleSf8FJurlN9QiskEQC1Ww7oBswZrWMt3t4G+UGzVIGACg319PG3q20cQ7Vh/wd8k9nEtz697QyIGF/M0SN6Amk7wJQBH7OVYN/aBAm9eCnnEI5QzYOrX+ogvC6NXpMHwO7auqr2T91ud7Bgb1Jj0Ma2mLNtaKEztCV5qNg6KN7igKt1ZSjtmSmkcASUgYqwiqdtw1cZYNezMaG6MiM5DxqqK31tQZB02KOGVV8pNCpaW7h2KNlfMUFJYFkXJm88uGob5bAqp3EOuTJvDmPmH0TpE0/STr958/3UuNH2aDYmCcdrKLkAM8ojHYT/6PbKQVfV+FIe9CWMYQnyfz0CT23xKcV4THeIbMjYPMbbSQNuiX7xPRNJVQCnRN69Eqf88l2pcGBZgNOpM79Y5GaD8DdnMQ3pwScUT5jyKi63r0fR+J/WNtJU1ZJLTqxMTasHzjOXu7OhVUS7ubd/O6yOP4MqbC4YgBfQl+UY/aGtKKy56ltyaCtga17PdWDvhvW4gIbiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39850400004)(366004)(136003)(376002)(956004)(86362001)(53546011)(7416002)(5660300002)(316002)(2616005)(186003)(6916009)(6486002)(16576012)(478600001)(8936002)(36756003)(83380400001)(26005)(2906002)(66476007)(31696002)(38100700002)(66556008)(4326008)(8676002)(31686004)(66946007)(54906003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VExKcVdzQmR5UkZKcFQwQW1oMlFRNWlBTy8wQ3ozY0JwdWZ5aStyZlEvRTBj?=
 =?utf-8?B?VUZhaWEyR3BDWm0wUDZuRWRxYzljRURlNzk3WUJJTk8rUVhxRUplb1RxeEZ4?=
 =?utf-8?B?MitqTTN2K0VJbmV6T2kvOERiNExWb3hYUXk2dEJBTkxLdUJiRzV5SDNNeFhC?=
 =?utf-8?B?WXZMMitINnVNYXRFZGc0aDZNUTA2U2g0UDFDOTBFR0kwQ0c5Mzk4b2Y2clBn?=
 =?utf-8?B?a0oxSEg3dEllZFdXRzAzUHNzb1pERmNHc1EveXprNkZDVURqazZVZFZhdE8z?=
 =?utf-8?B?dVE1cGJEN1d5d2c0aU9vR2JsVVpVblFxd2NIQ3lHU0ZzSXltUnFJSjF6aGNT?=
 =?utf-8?B?L0RBUDBvZnFiSlZ2ZkxuZE83WTVkOGFyaTN4MjZMTWdHSmtNZ09pWWdQekxJ?=
 =?utf-8?B?aWl4MEdjU2lLYkdVWWgyNjFESkVxWGh3cXpiVzJxOXdHMitsbHF0T2k2UXpH?=
 =?utf-8?B?WjVBUk11TEc0dCtTQ0ZXYXhhcElKaHozVkFQdDdNZ3EzaEw0QlVBWDE1MUx2?=
 =?utf-8?B?YzJTUVV0WVllZGkrNUNtWlM5eElWaFNnYzdya2lkWkZaYVF3QXpjalExSTlJ?=
 =?utf-8?B?YXZoNExqelZHREZsaUJaTXBTMkZQUlMzdXUyQlVJWFNlZytXd3dsWVh4amdG?=
 =?utf-8?B?dWJQTjhZOGJkSW9NYldOd1cya3l1Sm1tVEVVZGhyeDZhN2VBQzhSdGdBVE1j?=
 =?utf-8?B?bU1qdUNRbVltTHNvWGJYVG5GVnVIUlNnQVZzTWtWa2UvNmYwYkJSRjJObm83?=
 =?utf-8?B?Qk51dE4rM0dvNFZWM3E3eERmUjNrRzlxZG9RWGV3bkszVkw5QzVYcXkyRHYx?=
 =?utf-8?B?dFFrMXFMWDFyUng1TmJHdi8wQncvTEtaS1gzZ2lIVEM1RERCbnJ4Um04Nmg4?=
 =?utf-8?B?UU0vRVdIaUIvVFFFL3hWTzMrZ2M1aEQzUm1UKzV3UkZaNzFOaWRBTlB4ajlG?=
 =?utf-8?B?d0FSc3hlRURKcGU2bHhsd3ZXaGkxRlIzSnZQSXhEanhsN0VDRHptV3lKYjdK?=
 =?utf-8?B?V1hvelZJV096U2pSODlXUDVYVDQvTUZLMEl2dDBVQ2JmY25PK1Fwa3laczBw?=
 =?utf-8?B?MmpLVWs1S3JuZUt3dUwwZ0JsTWpWVTQ2azNPMkl2alJPa0ozN1dyZE8rUnpJ?=
 =?utf-8?B?WE1lTUJFcE9pUnM2Ykw4S0d3Z3NVNDJERmdRQnVFb09wbng1TlZZdCtYOEF1?=
 =?utf-8?B?b0F5cXJRMjRMekp3eDJUZ01Id3dkcThJeWkrdjluallSY29Db1Y1L1NEc1My?=
 =?utf-8?B?bExsZzNRYThybmhiMXZlYlg3eno2YjJKdTJ5U0IxWFAzcnNnbnpTaWF1WU91?=
 =?utf-8?B?NENIWUtOVG1tWWNBYzFLUmRvOTJmMzlsbFZ0a1Mxd1JMUzA0WEhjdjFxWW4z?=
 =?utf-8?B?ekdsRTZTWTNxYjI4R1lPUisvcVFLOWRxcFdvb0FIV1ovdTQ4MGVleFpVbmRW?=
 =?utf-8?B?N2lLZ2tvU3ZMRGF2My9COTEydmpsNi96Y3RoRmVhVHdFZWJaSGpwL3BDbTRX?=
 =?utf-8?B?WUc5OHpyaEtHSlhLVmR2OWFSNHJvMDhRMjltNmxPZndzeEt4dUhvaWdqdHQz?=
 =?utf-8?B?dmpQdHB6ckd5d00vS2FoamgxalVyamJxSk5GYlJRM05ub0dPY0xlZlFJN0Vl?=
 =?utf-8?B?aEJ3SjJYV28vRG9Xd2Rpc1hLejY1SlQ3a1M0L2RuaXlCWURwSURzZGRWOHZr?=
 =?utf-8?B?UHNsZEVGR1U4UE9KWTFKYyttVFNyTUI3VWpWTWZxTzZiUnFvT0I5S2RYMXNJ?=
 =?utf-8?Q?fYutEsKlhpWKTYDHU27V6RtnBDeCodSrfgQ0FOs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a584682d-e7ed-4d24-d8de-08d945d053c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:32:11.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uplggo2aQjFQhC9wR+S1TFkJAaf0Py1hclqbNnNiFSSvFDTHv15V87d3foJhY7GfnobAuIoO3eVM9siEHuSxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 12.07.2021 14:49, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 04:45:11PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>>  xen/Makefile                            | 11 -----------
>>>  xen/Rules.mk                            |  2 +-
>>>  xen/arch/x86/mm/Makefile                |  9 ---------
>>>  xen/arch/x86/mm/guest_walk.c            |  3 ---
>>>  xen/arch/x86/mm/guest_walk_2.c          |  2 ++
>>>  xen/arch/x86/mm/guest_walk_3.c          |  2 ++
>>>  xen/arch/x86/mm/guest_walk_4.c          |  2 ++
>>>  xen/arch/x86/mm/hap/Makefile            |  9 ---------
>>>  xen/arch/x86/mm/hap/guest_walk.c        |  3 ---
>>>  xen/arch/x86/mm/hap/guest_walk_2level.c |  2 ++
>>>  xen/arch/x86/mm/hap/guest_walk_3level.c |  2 ++
>>>  xen/arch/x86/mm/hap/guest_walk_4level.c |  2 ++
>>
>> Is there a particular reason you've kept the "level" in these three
>> file names? Preferably with them shortened (and ideally dashes used
>> everywhere in the new file names instead of underscores)
> 
> I had no reason to rename them. (Also, renaming them makes the patch
> bigger ;-) as we would rename the objects files.)
> 
> But I can rename as part of the patch. Should I rename all of them (mm
> hap and shadow) to "guest-walk-$level.c" ? Or just "guest-$level.c" like
> in shadow/ ? On the other hand, it would probably be helpful to have the same
> basename for both the source and the .c that includes the source (e.g.
> "guest_walk.c" and "guest_walk_2.c" have "guest_walk" in common). So if
> we were to replace underscores by dashes, we should probably rename
> "guest_walk.c" to "guest-walk.c" as well.
> 
> So I'll remove the "level" from the filenames in hap/ to start with in
> an update to this patch, it it worth it to do more that that?

I'd be okay with just the removal of "level"; switching to dashes would
be nice imo, but I can see this being controversial - as you say, names
would go slightly out of sync, and whether renaming the base files is
warranted is hard to say. I'd be personally in favor, but I can see why
people may prefer not to have those extra renames in here.

Jan


