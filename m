Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18948E4A7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 08:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257547.442639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8GbR-0002to-8N; Fri, 14 Jan 2022 07:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257547.442639; Fri, 14 Jan 2022 07:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8GbR-0002rw-4S; Fri, 14 Jan 2022 07:02:25 +0000
Received: by outflank-mailman (input) for mailman id 257547;
 Fri, 14 Jan 2022 07:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n8GbO-0002rn-Vo
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 07:02:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1a5f41-7507-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 08:02:21 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-BEiYSwdzO0-yV63zI9Ya1w-3; Fri, 14 Jan 2022 08:02:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 14 Jan
 2022 07:02:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 07:02:16 +0000
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
X-Inumbo-ID: eb1a5f41-7507-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642143741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0gnMEQOIpPKl4jmI1uGgU/Ts53WMgX8AJj1qhT/W2s=;
	b=Kjd4Sboc/luxoAAckDnc/FGt2WP83oRs+z8yaAW1NypjTM7Z6gThC7Jh4IpCjjlrMlQP7h
	ozmM/kvcN+3qW3jQeTTCuWMboK1uMP4PIhCpqbyIuyb8uZ0ZCGPODo9orDwI7eM3lf4X8p
	p+nbtz4GxSoCM8z2G+xMrBBONQoGixk=
X-MC-Unique: BEiYSwdzO0-yV63zI9Ya1w-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF3Jg3fgKsVheaBHyZLyzo2RlLsR0danD1Cl6kXhU/zuzTo+YwRMR2p7/aeT/7XSCfmPp6DFw7CdIA1aRxN4oJfWs1ZHlh9d68xE/1Xr2uVPo0x8w3LgKaWBRQW3OQXWKIKpFkCz73Y/1/WJIQcgEDhuvChphw9honywlvqCjdZOSt7CeDs6OfI45XBkh5OrxOA/Yyr5hJ29o9Di+PGmO2qMowzmunfzuFKcsjv6kQMiq+kT3PU6LGXpR6DQoA2pOa6oqBkHCykSYxJKeRDJjj+FzKymXkt6T6ZTzrPK0RnnIRPYBeBWthl00CBIWCiO5MQizFLUVPUeb9R6PtEJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0gnMEQOIpPKl4jmI1uGgU/Ts53WMgX8AJj1qhT/W2s=;
 b=W7GaAWue0CzXl+6Wnnpf9FYAVmR75NhKqnp8i3r4NNhSJFDV0HQgm+Tx6xp5x18mi3ZdL840Rxhtesal/qB70mhzslthPHCXEOlbrYXxdqtf/rsnFDqP3fHWyu1Wn08D+YGA8VrjWR6tB7CW/za1iVigdG6gv6sRapWMwFK2fRSQLJ4Q8P9QY2vT6cwmcn6JffXISp46nuXufwaqfB9Xp5puCnXB+YN0rzCuEmfV+mf2et5rsO82P/ZHecNg33Q3VB/Njd7us6nFqm7DmXQiqy3uYS7fzlCrZCnsVjO33AcKcD0zo/KPLbVLqmYoP+dbL5qVz9l3AWmct77Z0IqsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <758b304f-4df7-4fa7-fa0a-8ebbebb661d5@suse.com>
Date: Fri, 14 Jan 2022 08:02:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <4ac4cdbe-a3bf-2be1-1e1b-789ac5de067f@suse.com>
 <alpine.DEB.2.22.394.2201131713140.19362@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2201131713140.19362@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc3db561-feb1-4f8c-307d-08d9d72bcc5b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351F5C8AA3FA53421236BC6B3549@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RVgUsco2BOesBd6EtHm3SYwbkzHxyrOcJyYHHoivq4BNQB0S2r+AfdsG065FMVTG9nRblfSdwDxjtND0pKbUHHX59FtaALJZVQiY6AZ5uMtTnqJkYFF9NW3ANpg+sxBhr8d5V70thDWWlTV5jTWu/rxDwZYGopIl1HSDvLNymoKF02J81tSdvo4hckTI9aPYn0Oq1j0bJl5tx78ncdy5tdotlL0MPIJmJTaEpwVtCvElmuVdnK9KV94mCemaZcSCU6ASLaUpHX/hN2CKOIdnvnIkGVSvkrIlxn298WzLAbdsVLDvAgk+xOK5h/2JGxF2fVamq/x4QfG24OxYtQbbfE6YJkjY5WGknIYC5sC4CA1GFV0/g48G+PdTNPou+0RSCnBPqTfv4O13IJPkjENMcDctC017lXS/mKOLh3ZgzJ4+oRhfb860x2fxjS9ogi3IbTRAWMMVHcwbatWC6iXAltCdZ/umtLdt6/8Y4495xlOAYHf49f4HwNxms3vlAZWT7XAWGMfKI28XW8QvXQILLANJsKDt8qc7KnNPcivxDPfMGsETzqCUxWnZYU2D8kRuSDi52qtTM5EE6xNTCZjGqlkzk2V3NUYSGPcNBdiJZeqp6nCRmu234mGc5eNS/0WqNBP7CiX90urkXEnRRZqD7iv2DmIDccD8/VzmAkulVQkBr1TK3U2zJv8h/P6hyIqezBzcvPCvEH7fTYzkFtBk89w8/6yWxGMmlVpfAYq7lvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(5660300002)(6506007)(31686004)(8936002)(26005)(86362001)(66476007)(66946007)(66556008)(186003)(8676002)(36756003)(6486002)(316002)(54906003)(31696002)(508600001)(6512007)(6916009)(6666004)(2906002)(4326008)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUJTckc4K2RlNmZQU1QyRGhBb2JidTdJakVGNkFlM0xBQkwrVFhBQ3VzSjNs?=
 =?utf-8?B?WWh6Sm93a3hqTWljV3h6N2pqSkU5c29iamlNRFNFM25YUG81R21VcXJudUNL?=
 =?utf-8?B?aEtSc0pUMUw4SUFIdHZnOWRvL3dVellNN3JIZVFDRFE4d2pESndFeGJyMDJJ?=
 =?utf-8?B?L0pVWFZmdFlMZ0NwQjFRaFN2UXVoamFIM2hjV29Pd2dLYXBLb2cwa2x3VW9C?=
 =?utf-8?B?dWVzNWo2aEJQWWFpOUVkYUhNb0JJL2JWSlpoekozVWU4RnZwNHZCb1liSnM4?=
 =?utf-8?B?djBYK3JoWVBzR0pjUHdBRGxXYWpXbHNEMlVObGlmbW5nT2dGdlQwbmxvZUpv?=
 =?utf-8?B?d2Z0YmxqallQL0Z2WURvbnJ1OGQ0Vi8zcHo4TitJaTA2a3VLUVd1THliQWpo?=
 =?utf-8?B?VlFoRnE4dGdRdEdNeWt6d0VSb1huZHVKb3hwb3FmajUyTXI4KzRCYS81WWph?=
 =?utf-8?B?TGc1OUw1WXZ6MXpSRDI0dGFsQ01vU3laL0NOeXBWY3cwVE9yZHc0OGJQNXVM?=
 =?utf-8?B?VEtEK0N4c3MrTTU4YmFPMmQ0SkhJVndXSVpKVW8vaUhDQWJRWi9KU2JsMkpL?=
 =?utf-8?B?M3ZZb0Q1ODczN0lwa2NhUVNIbzF0T2NpWCtRcTJNMTlXL0RydEVRbzZHNjZw?=
 =?utf-8?B?VTQ3QnFHais5MDBvM1VuaDN4Q2FldUgxN1Z2WWdUZGZ2eWlSM0lJWUZ2a3Z0?=
 =?utf-8?B?ZDUyL3NyQVNvN010V3BMUythTGM3ZXNBQldDQnkvZ05xMndqMDBLMXBqbTBU?=
 =?utf-8?B?V0ZadXBKT1YwVW9CRWJvS2xncUVuOVBDQnpYVWltcFNDU0o4eW0wcUtXQzdK?=
 =?utf-8?B?OUZiMkV6Zzl0cUhyNVphdXlrNEVSOXQ0VkxuY3ZySWd3YXlBaDZMNlkxTFo3?=
 =?utf-8?B?ZmFzSTYvWTVmT1pyTGtyQko0bDRLUUNRWGdlRUQ5VVFhQVk0VTB1RlhsbU9h?=
 =?utf-8?B?NXE5WWw5bU9OcjhOdVJuQ3oydTdjOTB2NEVueTRZMys1bGZFMXFaVTE1Vloz?=
 =?utf-8?B?VXcvRDBTSkFsUC9hMGd6ZHY5M1dNN1ZqeC93ZGJOdkVlTmFyTFpPSmZiOXY3?=
 =?utf-8?B?SGhnNHJHeFJXMXdMcUcraTJHc25DTWVJZnF3VWhtcEJ2dW5ZUUlqYlZOempF?=
 =?utf-8?B?RERWZnhoOXJOTU9jZ1YyTG1NeXlwV0dUTVdhWTNLYXQ2VldnYzhqaDhCQUph?=
 =?utf-8?B?ZVpGNlh3QXJFMEFSbTVybTJOYjJtdUdBMDJNR1ZwRi84eEcrZTlzU2I2SmNM?=
 =?utf-8?B?OTl3RmlPRURKekNaRjVnRlJzZ0MxOEVlNGhnRHNVNHdDQktPVnpOdyt1SlpC?=
 =?utf-8?B?NmtwbjE5ays1MmJiNmlKbUdHMUpHYTFYSG85Rnc2eVlrZU1JaUtvRFBnTzFX?=
 =?utf-8?B?MFRaZVFkOXRiblpUQ2taODRsKzJTbFh4ZHlTT3dlc0IrK253ZXBKKzd6R2kx?=
 =?utf-8?B?WVdVTm5vZk45UnVBckUrY2taZ3RydzBjN3l5RWhJRUEvajBUcjk1MVBHMFZT?=
 =?utf-8?B?M3BQdGNHUUExb2IzdTJIb1d4b1F4SW1XQ2RVbTI4aXhyREdrT0o0NlkrdXY3?=
 =?utf-8?B?Tm5Zbmw2RTN3L3FuZnFFRFdveC9oK25JVDhwU0VlMzdoSFdOQ3JabkJWRW51?=
 =?utf-8?B?UXVqOFk3RkdnTEYvTlBiOUl4dE8vQnoyY1l1M0ptRnNrd2k5QnFEV0cvenZR?=
 =?utf-8?B?RUFCVWFITDFhb2lWRnhJQkc0OFhUbFBGQmV2K1AvREREU3VxZTJ5ajVjY3I5?=
 =?utf-8?B?WTBmTGxpNmpCSzdVSkEzRjQ0bEdQcnRlc0FpbENtM0FkVzk5S0RMQmpKRk1V?=
 =?utf-8?B?MmtndzlFd1U5VEJvclZzZk83aUlhLy90am5EUjV6ZXR3Q3VXTUhLaFdOdmcy?=
 =?utf-8?B?TS9BcmJwLy9aeE1PYnh5VDhjN0cydDNoc3NmYXV5Zkowb3V3MHNlS29sZGor?=
 =?utf-8?B?Q0RCUVpWeGxhV21QRVlqcnNQSWRFaDh3NEowQXYzaGVyOGVWUE8rTndOcFo3?=
 =?utf-8?B?dXVyR2V3SkphRUtKcXphOGc4bzVIakU2NytmOEdlMjFoVGQ2T0NkRGxpNUxH?=
 =?utf-8?B?UGxkREJLK1FqNGkzMklSSUV1MFpiR21rdHhjZWg3eHplM1dLTmxMdkRRMnd1?=
 =?utf-8?B?YUhUbXlVa2FvNGJ0WVNYK3JHZWhDV1RNekJ4U2lHak5yanZZaDE5cWhCSzdF?=
 =?utf-8?Q?WIUKMX6nrtdiQ2q8FUmr+ao=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3db561-feb1-4f8c-307d-08d9d72bcc5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:02:16.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SKeq+66N4ne9eakqU0RQzIJfad6/wBPbYiQRwN2OC38ydWk1o+cymnRTKO+weLQMnUEa6+2S/XFG+TEm8gqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 14.01.2022 02:20, Stefano Stabellini wrote:
> On Thu, 13 Jan 2022, Jan Beulich wrote:
>> On 13.01.2022 01:58, Stefano Stabellini wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
>>>      return 0;
>>>  }
>>>  
>>> -static int get_free_port(struct domain *d)
>>> +int get_free_port(struct domain *d)
>>
>> The name of the function isn't really suitable for being non-static.
>> Can't we fold its functionality back into evtchn_allocate_port() (or
>> the other way around, depending on the perspective you want to take)
>> in case the caller passes in port 0? (Btw., it is imo wrong for the
>> loop over ports to start at 0, when it is part of the ABI that port
>> 0 is always invalid. evtchn_init() also better wouldn't depend on it
>> being the only party to successfully invoke the function getting back
>> port 0.)
> 
> I agree that "get_free_port" is not a great name for a non-static
> function. Also, it should be noted that for the sake of this patch
> series I could just call evtchn_allocate_port(d, 1) given that it is the
> first evtchn to be allocated. So maybe, that's the best way forward?
> 
> 
> To address your specific suggestion, in my opinion it would be best to
> have two different functions to allocate a new port:
> - one with a specific evtchn_port_t port parameter
> - one without it (meaning: "I don't care about the number")
> 
> Folding the functionality of "give me any number" when 0 is passed to
> evtchn_allocate_port() doesn't seem to be an improvement to the API to
> me.

I view it the other way around - that way the function would actually
start matching its name. So far it's more like marking a given port
number as in use, rather than allocating.

> That said, I am still OK with making the suggested change if that's what
> you prefer.

Given experience, hoping for others to voice an opinion isn't likely
to become reality.

Jan


