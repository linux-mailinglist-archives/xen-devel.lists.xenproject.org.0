Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B641742EE21
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 11:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210047.366755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJpS-0004Iz-F3; Fri, 15 Oct 2021 09:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210047.366755; Fri, 15 Oct 2021 09:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbJpS-0004Gm-BO; Fri, 15 Oct 2021 09:48:42 +0000
Received: by outflank-mailman (input) for mailman id 210047;
 Fri, 15 Oct 2021 09:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbJpQ-0004Gg-PW
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 09:48:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65d989a0-0d5b-4fa5-93e0-31042c693c6d;
 Fri, 15 Oct 2021 09:48:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-6X4l4gyDOwa-zn6FjXwk2Q-1; Fri, 15 Oct 2021 11:48:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 09:48:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 09:48:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:56::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 09:48:34 +0000
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
X-Inumbo-ID: 65d989a0-0d5b-4fa5-93e0-31042c693c6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634291318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxyHKNc/iXTt0TtTxZAJo9ZsPSW3psvBcn7Q+Jb4ATA=;
	b=aGCECnOIRSCyKTTX0bKlF2AJiHjILjV6/J1NwLBUDXoWwh+VPbJ6k60/oSqUwv7MBXcXX2
	ehjGMeaWOsuI23p571XHaAUUPpcSLi/j1YEsTLJBGn5bh2CfAJgatoV4cNrqe3KHnhSJwV
	w9Lt7nuySKehoyd5ubkh6DujslLmCMs=
X-MC-Unique: 6X4l4gyDOwa-zn6FjXwk2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtoIcMEppkhWYmP6Nc2S5/INRZUWcdBXj0pM34Rf9FFsFY9uRNLCnSSQTBUjF3WszVoJNKVPR9bGsI+cQC7AgFW4JJWuRNqkXFJCQMHRZx2ALV0WYpxunesSX9BEGQ9aiy661XknJbFC2ztwvgL+tBN20GqSOsVrJa9iC+JK7NQ4NsG/tb4G8P+6Iu7RqBIqGJW5FYdbVWqnpHTwl/jxHn1hourZIy1s2D969i1Uo3rkfHadV3v5xnqT39i7McK7OK21dty4aGix+Qwm5lYBrmehuLK529Ge6xhrc50mM9iPu31wKV2O8jdhBkA+FX+OI74brcZ+z6CNb6mDslzroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxyHKNc/iXTt0TtTxZAJo9ZsPSW3psvBcn7Q+Jb4ATA=;
 b=JRLe43yvYr0T1DTQGiDp273CswCv767jN2w80KmPgi0zSsMyKEwbwCn2cllXrZVWzJXsKm1vRqQ7TWp7lH7AlabE52KHyaW4LmADiIWY4E96GZh27oZ4fXrK8V1UF8ZPjaY8enkd4SJF4j2uIAgvOsZ4YxoCPDrR3yBPpW55b1c3jmm0gZvpVU0GuHWUDrONiH5+EaiF57DcHvIerXUeMHohTRKjC5ZD4V+G514jvEVELAGnp0iQ0UqsYGl+yqY5wiqIrQPDTnP+E0W0oU5ha8XISu7P8SUX+yiDflskRtzgFzArOIAW+UUPrvjJSr6AmHKeHd+BCX5LfKR84Wqbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
Message-ID: <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
Date: Fri, 15 Oct 2021 11:48:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c279e25-fbde-4e9d-525e-08d98fc0f4ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191A8F097CCB6420A6BC2D2B3B99@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rab21fxsAkEJtJPt2XcZ0DEbz4SIIRlCpnF05ExYqCuC1pCt6VzJSf39+ANp1aX3ZpVmu5v2Zue/DRwOxYY8vBJfPOI3+8YSfNRb3igJ5lZvRVoSV7qB3AEeH9afQHyAi5LHidsJqBycdkgldxd9sbd5dtdtPLxLWQHC1exzu2U77RXeOWwkOCE+xRkfBQUvODKP6+ugCY2y5Z4Z1uybLB4SS51o+YkEUB6TCY9mnahjfVbx9IcJ9W7cgKJLFcNJgDzw7/eoYllOsk1f3FFHYckUA+1Z1h484ojEX681G5Wp2BintS37cPqs6KDujsru4ZOyI7ufANAJ3NpqOg+UQLbDfKzoRhlhBokfNgJnnRF7eRTXlGIUqtZra3fzPVmoSVo/IsrDVDUt8fDdvGiXBbMszLTfRW0GjSTt2amhgDZo4qYdOFqQbLZMQvbkO/3tj4vjevOHNmaDJhoaCYKtbtX75s6LNlvix0uBdLvcHnKHztbfXS3sBLSi1Z+pixaxIoub/OZon3XiVQveuXRiyztaABbzw9LMGDOvfTgp2PQNiRmDciRnEzObmV1qgaPd6chDEmDuDhLzTW6JWHeuWVBQ42u3y3tJH236AhHX8tVKIrhEKI5Ol/xVoC5iGQ8T1yNSh0orlwnU9dYSqYp76oozMUJcHJzzWYSnLc1xbpIng8GN475r1Dvu65LCc6quX+sUEWUzKmi75STd54jm43ausFJFWdhxhOfmaFB3mnhccGm7WgroJqyF0cg1wP5i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(16576012)(66556008)(2616005)(956004)(66476007)(31686004)(83380400001)(66946007)(7416002)(53546011)(54906003)(36756003)(186003)(31696002)(2906002)(26005)(8676002)(86362001)(6486002)(508600001)(4326008)(6916009)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHh1VlZpQ3gwUmcveGNscjU4dGUvWFhFQS9Zd0hsOHpXcnREOWZ3UVA4dVUv?=
 =?utf-8?B?WWxxdUJPNGdwbXlYY0dMNVZGN0lVSmx3L1RsRW9oalp4bEIvNEF2Tzd3Z043?=
 =?utf-8?B?WThyeDFrVWxPUkRUVU4rOVdWSFhwRUdMK05uSzR1ODVnUmlMRk0yeCtpZEJB?=
 =?utf-8?B?ZFIxWmRhNWx5TThaeGFBRHZMZTZoMFZBTGV1ektFcVFrNno2S24xVUZaMlpZ?=
 =?utf-8?B?ZTE1Y2lNU0p2ajlrMmExSVR0QXBwdkc4ek5FSkJiNnR5dHZJY1RPQUFjcDgw?=
 =?utf-8?B?OEh2aURYT2p0R2M5bm13R2lqVDNFUUltZ3pob3JPNDdIRUxMSEhiZHB2ZGp2?=
 =?utf-8?B?WlJSVEdIMW9BdkZQdkxLT1dlRzJmd3V3SnVYWEprQVlEeDdXU2pnT2p4MjBV?=
 =?utf-8?B?UHdkZEJVQzJmclZWMWVRcy8yeWVnYm40Mlk2bUZsdkJIeXkzdy9zMUhMY1Rm?=
 =?utf-8?B?b3lwcVJGWnZnQWE3ZVZ6K3dLNjZMYms4VkZ1bVArdW9xdGxFQ29OMS8vN1N2?=
 =?utf-8?B?b0wyM3J6YWJ2NUxsM280YVNwMFBRNUkwbTJpVnY4anRwc3REcG9mN2t4NHpv?=
 =?utf-8?B?WmhqYUlVRVpLNmpIdFZWeHRlUzlDL00waDhBLzllcWFYR3F6SCtOMlRZK3Yx?=
 =?utf-8?B?eE8xWU04ckg4ekpVcWZYemZIalYwdVE0VlVVTU91YUJTQWtoTEFJeFNLV2pY?=
 =?utf-8?B?akROYXNxWVBDdGhzLzJ6OFNyWDhoN3lRbkYxNUc1T3VZdm5hOFUwamh6Yngr?=
 =?utf-8?B?YnlFSnpoc2JYdVJ2a0FOK09EY0J5ZEl3NUozTnoyajgvb0VmaE8yc2MzZ0xo?=
 =?utf-8?B?dXllNHpWODBvZUZSZ0JTd1dlanVHQkxSTXNHL2NBUnVWWHVjRFcxVzN0Z0tN?=
 =?utf-8?B?ZTBRMnJkY2JaN3NFNk1yQmFTcTJYbGhyVnFEOHkvV1BhQThsV3VsZVc1dWpr?=
 =?utf-8?B?cUtsOHlLeVY1UG5VUXhwZWt6K2xBRlk2ZHV6cUt1WmRJU1BqL3VIVjYxQzRR?=
 =?utf-8?B?MEhxODIwaVNWUVB4YUtmdHkxS0t3QlRxUG4zMFBLYzdQK0d0QmU1TUVnYVJT?=
 =?utf-8?B?L0VQakJjRFdTZlJaM25lVjE4Z3lIOEFMK0xrU3VEdnJPend1dzFSbGVaekNE?=
 =?utf-8?B?Zk9MYm1DUUJBU1hWaFNhSisxNXF6M0tVT05iMHRsb3ZGZzdyM2NBeWVXQXla?=
 =?utf-8?B?Q0tjb3ZWQjJEZmt1bm9DNkJ6cWQ3d2RMMldnNlRwREVxSkRIc1FIU2M5YUFO?=
 =?utf-8?B?S3ZYY0FTZXFtVmdGQVFBNE9tc2ZkTnNFeXZjeWtyd3pGb0VXckdwa1AxT045?=
 =?utf-8?B?OWIwaS9kdzF1N2F3Z2RXb25tdkU4ejFwQXo3alBDSll4ZlZNRGlZM2hUejNG?=
 =?utf-8?B?TWRLczU5azNuaUx2TVpGenFzK3piekN3U2ZlN08vNTJSRk1HTGxlSldHTU5q?=
 =?utf-8?B?Q1F6WXEwVlNEUmUvRm9keGt2aDJGRzYrdXo5YW14S0QydGxHMjgycTgwVGxE?=
 =?utf-8?B?U1NYeHE1U1EwUGFOVy9CRVY5OUhQSlZSdi91eTBoaTJpU1EzalpRSCt0ZGxP?=
 =?utf-8?B?M1NUZ1ZaaEZMcHpNQmpjTVF6UlVzOU1nZG1pSDZCSnEvRlBsckFGTkFKdzJt?=
 =?utf-8?B?Z0FEMy9ONjdTZExVeHVsSkFJRy83YUVzK0J1S3phT1BQUzlLb3JBVWhsWUpP?=
 =?utf-8?B?blZNekFwbnJrYTUwZXdPVkJMZDBBR04wRnplb3lyT1RtT0lGZEh0d3I1TFBP?=
 =?utf-8?Q?nZYN2D7dhDjOaYIVNX9lYHhlb/wMoGavAlXjqdG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c279e25-fbde-4e9d-525e-08d98fc0f4ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 09:48:35.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etEdMcBKJ8Qnv3VMdnMvWbJSw3nkNvtKp3F1cnnq1z0E811+XGHIJB2JvwQ8t/IYqBNjmGIYQ3ZVOp2B4B5j3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 15.10.2021 11:39, Jan Beulich wrote:
> On 22.09.2021 10:21, Roger Pau Monne wrote:
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
>>      /*
>>       * Various domain limits, which impact the quantity of resources
>>       * (global mapping space, xenheap, etc) a guest may consume.  For
>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
>> -     * default maximum value in the hypervisor".
>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
>> +     * means "use the default maximum value in the hypervisor".
>>       */
>>      uint32_t max_vcpus;
>>      uint32_t max_evtchn_port;
>>      int32_t max_grant_frames;
>>      int32_t max_maptrack_frames;
>>  
>> +/* Grant version, use low 4 bits. */
>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
>> +#define XEN_DOMCTL_GRANT_version_default 0xf
>> +
>> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
>> +
>> +    uint32_t grant_opts;
> 
> As it now seems unlikely that this will make 4.16, please don't forget
> to bump the interface version for 4.17. With that and preferably with
> the nit above addressed, hypervisor parts:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Actually no, I'm afraid there is an issue with migration: If the tool
stack remembers the "use default" setting and hands this to the new
host, that host's default may be different from the source host's. It
is the effective max-version that needs passing on in this case, which
in turn requires a means to obtain the value.

Jan


