Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307542EFF2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 13:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210370.367223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLgm-0004UG-ND; Fri, 15 Oct 2021 11:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210370.367223; Fri, 15 Oct 2021 11:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbLgm-0004SJ-K9; Fri, 15 Oct 2021 11:47:52 +0000
Received: by outflank-mailman (input) for mailman id 210370;
 Fri, 15 Oct 2021 11:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbLgk-0004SB-CO
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 11:47:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9b7b373-58d7-4457-9a33-9dd50f335ed5;
 Fri, 15 Oct 2021 11:47:49 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-GWwMQo6gMHihJJdg5inCDQ-1; Fri, 15 Oct 2021 13:47:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 11:47:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 11:47:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0039.eurprd08.prod.outlook.com (2603:10a6:20b:c0::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Fri, 15 Oct 2021 11:47:43 +0000
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
X-Inumbo-ID: d9b7b373-58d7-4457-9a33-9dd50f335ed5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634298468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHRBOLdnfasBwrRmnIyqCz064wyayF1zWhy6MAvALLw=;
	b=ZoEPpafA98y1l/GHEEQ4DZtr3IDDyKhIAN8OTeENoSZQN5tkY8Bp3fC6WZW/9wAJgwzJ2T
	YFhrMY4nZ8JhTc4Y0lr/0LYGuRunyOlBiHe4gzhC0ByQoJtRZQQIzAmq7WE7VMpUcuRLBg
	Nkk6kb293IhAL+v5b3BaFmNvlmvv+uo=
X-MC-Unique: GWwMQo6gMHihJJdg5inCDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTkgfL0vzllWNthidoxtGojAmNyFgtbk+hcJvOQNO+daabsRYpWCKQo+dlJFUD22XSf8m04SjyTeppkFhSOdmhlRAdoL+G+j6L6RVcha1NyOSIB5kz0gjYHxYj12ujfD6MeZTQEDBFmONJWuMHPyR4B+fqGDU3E2vC/K5I2Gl8TOutv24dghMpvDrO0Pbq0o+3c8v25H0LpVxyUpVqfC1puuJyEd5rLb8TcEA+x13VXu9GUvXAZ57Yd4eWG0OVDWkwThw4QSOP/yzbiYsilc1ZnAJaqDn3PxMzUgBzOa2jP2TBblQF2XabCLW8sT3rxOnM123IQzkU6Qti7UVFUCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHRBOLdnfasBwrRmnIyqCz064wyayF1zWhy6MAvALLw=;
 b=GWuQwnlN0sXCOYf2CAZR1HoxAaunfvcoi/dObj4meGH/Bkl8t1ZP++i0S+hpwveFLBkxXiZwYBuKPpDPJPvTC8q+EJUbtA8VtJl9vHuVPLz6KmdCNQq48DL05+SobyO0YCctULh3bXTNWhx6dk9ZlhVBT7/HKtsfblB+qqnEK+Kosa8AZNKwwWvAhVunJ0tUFfdyeqwC+MQAJUTHGJfepGeyo+iXIORn4ZCyD9lzana16rMaEEzhg5qDqpDIeQV/qzvQioxNJ56LF044GG7QGf7Ojw217Kzz6/eWkHpyFB109BeX/BChxqXH7IpgWEqQB3UXuBky4MeX1xBrcUE/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe51d9b8-5c2a-9e1b-a613-bdc36a613463@suse.com>
Date: Fri, 15 Oct 2021 13:47:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922082123.54374-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0039.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a86a6ac-8324-420b-66f1-08d98fd199e3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33924FCDC9BC8C0BE90C8BE8B3B99@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EstWfbhtY/Wz89u8MClT6L1Bbrdb7vELcRBWbAFZnXp5YDfAg5/hJq7FIShNc3+Ec3U7SYd12Cj5jca/lTpoSE6j6YDKQeeG/rIrP34/Ypa+LgaVNBK+lQYAWQ5wbx5vasWa8K3OESVc22uhJJV/6hfBFVteO24XZ0dJJ2jwXOahASSxeBRkgKkjUINQoD2X9u/n+D4OHJEcIEnGJD2NG1gBDlnZSrfTxJge7gtnRtdQ6j+noN+rbJE0NcjdgiaipJoSNsfJ+1NXm7N/JQ6PccBEc5r5w5dfjMQoNsVnhzA4ilQgxH4IkT79QMnY8J51KI2PPzxKunAQSJfEaY1W6ziJXxjkQJ8RL31ttUHIYDkcP+nBS15ktiWnZRLVTcqAAfyXfRRqRgG1acH2db4zc5mZ8wudoSQrag+rufHFHkKqhvAUTnDGKwBIG/C4FomDs/IDxHD8Ka/9YESrFh+qMqSc+O+M0UPeNKJyX06QF65aX8l8SSpnJkjwNL2M15hQL4ubwgFtM5qSsXdj+eiaqvkqgRYkGRZX+6FC57uE8ZVOfHZya0RmslW5e1PbnZwbJ7SpmSZSEeKEZ3DZC92Jnq07wiWbPky4Ha36FqiBrBzbQhLlSEKfBtEG7sQpq2BMVVU4MG0rtJHWFB+mzu4CPMV5kwzFK4Dy/pwZYkhwTjfvcRXVW2f+OvJMUeQA/ruhBLlpfvleIDR1Mqg3OaXUcpI+GIcxZDOW5hjbt1lns4hDMhxYssglJdcLAkl4If6Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(6916009)(2906002)(26005)(66476007)(186003)(66556008)(2616005)(316002)(508600001)(956004)(16576012)(5660300002)(86362001)(31696002)(7416002)(8936002)(6486002)(4326008)(54906003)(8676002)(36756003)(4744005)(53546011)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3RIVkxTVlBUaXo3dGhuN09qbHcycmh0T0xuR2pKazlMN0lvM2tyMWVrWWFZ?=
 =?utf-8?B?cjl4bHNZclBkNXZwVTRISExpcU02dkFFcURySVRpSkRiQ2JPaEpTQ2FoVjNn?=
 =?utf-8?B?b1ZaQjBrMk15N3JjRndqK3JXUGtNd05lSTN5T1Z1U1ZPUjFwYmJsdUxtaTdu?=
 =?utf-8?B?alBGd3M1enZuMFE5dmZrWmhwSGtGOUttTzliRFpBL0hTVElBeXcwaWZ4MU9v?=
 =?utf-8?B?RCtMOTNXZkxkeHRHMURWbDdsK0d1MDFqQUtJVWxvRFQySnNlbnlyRk8vVFRU?=
 =?utf-8?B?V3dpTEh5Vzc2Q0RFL2VWaUEweUY0a2QzcGpTYVRic1NoNExBdTI1Vmc1bnN6?=
 =?utf-8?B?V0QvNDJJUkppc2s0bkt4S0YrN1VSL3JJWldJSktEYjBqQlo4d2IxVW1idnd1?=
 =?utf-8?B?Sko5amtiY3ZFa05yS2RHVkk4UEdoYW5vSG5Fbmsxb0xNSVFCdy9IRkhtV0NE?=
 =?utf-8?B?aDBBTzNUSTRvdU95Y3FMYUVnZ0JqMTFOWEQzN1o1MEJhRXBmNTF0cjhybVcv?=
 =?utf-8?B?blFzUGNaemNYVDhOdW9EeElUVERjQ2hSc2FzRkRFVjhsNy9PeXpKNy9UQ3Zp?=
 =?utf-8?B?bkFSK25aWUxkL24vcm9EOEdoTmZyZ3hqMHZwbUMzazBxWlYyTm5QV1Q0THZi?=
 =?utf-8?B?dnpLdmpVUUxSVG9OL0tWdHhOWS92c0tZNzc2Znc4NFl5dkZPMktWVkoyZksr?=
 =?utf-8?B?bUIrTTEvQlRLdlZEUUU0ODduVWplQmpMdHd4NUpHV0JBSFNlRVpqRnBTUUpF?=
 =?utf-8?B?Z0JadVRkbDVsSHNsa2p2eTNMWThyZytPTXdFZ0ZFbzhWZEhNMWxOVGk4bXlW?=
 =?utf-8?B?VnlwYk45eGdOV080c2Q0d2Rja3VMTVlpNmdGakZFVXhGYnEzc3EzUFZMZUZ6?=
 =?utf-8?B?NmU4OHNDV3hwaVhTc2l4ck1ENG1lM1l4eDlubHVTOTZwOGRxSkcwT0N1aUNN?=
 =?utf-8?B?eVEyanpwa24rTzM2cEIxMWtja1ZtV3MrekttZ0ZJZDQ2Tzh1enZGbVU4cmNa?=
 =?utf-8?B?RjJnZUFkcnhVeDZMTjQ4SmlqU0FEclFFR1Qwb2JVTWIzY0Y0VkF6Z2kzNnJm?=
 =?utf-8?B?YUxKWDA3VkZneEllWFFkdnNqVzFib1IvQ2lVdmZpeUJIY01oWGNWemxzdlJu?=
 =?utf-8?B?Y2dyTlB2Yk9PZEZPeFlnMXN2b2l2dStuNzcwS3NubjBPM25DNnRiTmJ6N2x0?=
 =?utf-8?B?UzNRLzhSMXlOcDhNZng4S0psVnhJOGlKK1NUMXNwU1haVkZ0Q2twV1krcEw2?=
 =?utf-8?B?NW01VGczNHJRd3JFUk1nZENucDV6ckZFaG1vUFBWVzEzR1d3NDdtcit0N1JE?=
 =?utf-8?B?S2haWjdXWVR6czUvZFh0U3BzNjJBempzMEVqaDhtQU0xSG45L096YmhSR3px?=
 =?utf-8?B?T1F4QlI4RDB3OWRMVDNsZFpRRThPckZYM0Q1REZYMDY1Zmd0TDhVOTRsMVdv?=
 =?utf-8?B?dGRLVC8rOVVPcVNXSG9WUGgvK1ZsNFA5bEJ1eEQxSnpFanVxNnh4TGQyTXRu?=
 =?utf-8?B?akYrbkRqRURaa0FPSzRsUEU1UHVNN1hxbmt3WHRzeWtBZEZXaytFd21NUUp0?=
 =?utf-8?B?NW1KUVZKZnBMVEpSelI2WGdWZi9oRWxwck5BWlRDVDhnazRWRCtTYy8yYUlq?=
 =?utf-8?B?NnpYSWZtcHNPMDVBRFkzSTc1bjR1Rzl4blJYbDUzUW9rMUJGdWVPMVdUbkEv?=
 =?utf-8?B?Z2dnWFZEMFY4Y0ZONkI1WHlpQ0ZKaEZmUjFCMm5lMjBlUUtORUNta0FFK2sy?=
 =?utf-8?Q?NmJMqfb4cjNbwUhaGLDyVJUYg9QkoCLYnqY855E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a86a6ac-8324-420b-66f1-08d98fd199e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:47:44.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uD42nFJD1TBYeJHUv0+SKiwgUED5zFDGJO5UhVVFj12OmVLTuukOaZed0M4mGs0fkJY7DftjSZdfgRnm15Ys/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 22.09.2021 10:21, Roger Pau Monne wrote:
> @@ -1917,11 +1918,27 @@ active_alloc_failed:
>  }
>  
>  int grant_table_init(struct domain *d, int max_grant_frames,
> -                     int max_maptrack_frames)
> +                     int max_maptrack_frames, unsigned int options)
>  {
>      struct grant_table *gt;
> +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
>      int ret = -ENOMEM;
>  
> +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> +        max_grant_version = opt_gnttab_max_version;
> +    if ( !max_grant_version )
> +    {
> +        dprintk(XENLOG_INFO, "Invalid grant table version 0 requested\n");
> +        return -EINVAL;
> +    }
> +    if ( max_grant_version > opt_gnttab_max_version )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Requested grant version (%u) greater than supported (%u)\n",
> +                max_grant_version, opt_gnttab_max_version);
> +        return -EINVAL;
> +    }

To aid diagnosis of issues, maybe also log the affected domain in
both cases?

Jan


