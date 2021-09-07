Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F64026B1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180721.327493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXy6-0000Q5-O8; Tue, 07 Sep 2021 10:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180721.327493; Tue, 07 Sep 2021 10:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXy6-0000O5-Kw; Tue, 07 Sep 2021 10:04:42 +0000
Received: by outflank-mailman (input) for mailman id 180721;
 Tue, 07 Sep 2021 10:04:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNXy4-0000Nz-Rn
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:04:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c641a18-2079-4ef0-b785-ddea4c9fce01;
 Tue, 07 Sep 2021 10:04:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-hpqGuoH9PGq115orbvAkig-1; Tue, 07 Sep 2021 12:04:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 10:04:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:04:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0086.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 10:04:35 +0000
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
X-Inumbo-ID: 8c641a18-2079-4ef0-b785-ddea4c9fce01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mESkZMCn3zmsbiDZ07Z3XiuHmv0bzZgcJCIsETD9bV4=;
	b=f9te18dHO8t7eLXe6jKnWru5DmTbFdpaqOanYQOAK/1Ki+v7RUdsnr6jzD6IlHl+x3cbwW
	6nfYDgOasNNen5DFzxQrk0Sj73GVnhAyPWoL/kYIvndiqCoDe2c3rsM51qAh7MEk9+IS07
	+7psCLuIGL+JJbr1cJOOHY+FmQ9QANU=
X-MC-Unique: hpqGuoH9PGq115orbvAkig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBFcSFwxe8k9APKb6ChixWW5QTh3KUK3lQrk/5ZSjQzECd983whDtHVuXV+zVKW3hLWUTZYNZQ9ibCDanbCTJ93aBRVDLYcxCHUlEyOBl8f3ZhZJ2DD8zJ7ijJblnMNH7C25LN3d//X65rooVLtr4ZXBgKbnmuouQh8JQOj1kpinW0Ve9UBRmo/MgYJgSX3TMYiOaloEOclRIW/YnjwAGZUg+4h3bc0adJEKyl92UkdDjUx2eaSSnFoI22Hb/gwaVMYD+x9mPFZFsIWtDZwMqQPD7v7Ys9O6qqZalJlhF39PVdOsVDn9sxR8Oy+A4pQRzHagpwNkYDsMAzRIDCngPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mESkZMCn3zmsbiDZ07Z3XiuHmv0bzZgcJCIsETD9bV4=;
 b=OJWnPLAL1KTnRcJZuu48HMMOASP8nA6t5tNHyXgJIZkMuEFwwbiMnLfqz7rWylxbJrNj2HpnhQ9e+gL+f3/4wfsR/rlkPa2erXsW0TCpnevVHY10YH3Nc0Khtgpa+X5ZlqCCGHMDBqrCz0AzFmIDckWUxd6lYysjv3nTHeJLT9U29m2VPikckQ/Gn9TBngC94rXbjWxd3j8NQcV0R55ksXRGcPe8VdIxoVcT17iVvOSfOQ58xr1UbchOBHHfSnCsINO2oYqPYTUjiZk1EaapZLR8ZIxwVLxKlqvNeN3u1f/z6vFQ5Z9x2tZFWHBA6U2YDiuipOnXXTQ1b7Lg2pUsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
Message-ID: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Date: Tue, 7 Sep 2021 12:04:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0086.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f7bf4a6-61b8-4bae-9838-08d971e6e5de
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861E95D1B4BAD83CC93F0DAB3D39@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2HFuW6qjrpDU+nMRA4sqT+UmRulKiRMvir2UGiWWhZJVi+TyTBfaarxs2jLscRYOX5OtsWFqOt7FbB4P0DYcKn9DufThRExjmgt7Qm7vaEUR8A/OhixtQbLZMnp3Ak8n/PLU1U/z1fFfgYKCiqhgHJJQxeqdRg8f5AcX19KkPEw9Ws2AZ0GKrAxnesGTzL9ASdZP60khriLDDb5CI1igK1JHMJ3b5Ub+gKrCUUQ52grVKgsLqKkB9kubmo7d4D+DKC1lYi6j8Z30pW4DCZneL4oroOkFrSZIylgOxiOJlI7yGbYKyo8lJEMSRKCccNyPmRBYFUYxPqtHFLUzVgap5PEARjmd6OfMvtqWQh2Z5iUQuJOiUipIX1WFt3GGBuN3WS1EzZySj4k3ZTj0ZgXDUZjzwb8pjZ8YWMRdrdT3EZuvXq2ci4tt4R4OGLc1wI89PN32cXBq0c06CjKCY0pT0LwIYTsxDb9uhx3Ip+qlj1sEd/AyOO6rkK8dCoO/PrM/a/udwDKVwft+fYsuThECxK1ml9beKZct7g06RzHyTGqktSzoHTB+lmT8Mh0sYUWT6nvSA+g05bKDWgF74YHCVPpPa90mH9o0jMHEbGK4tc8cKWIMAQMYGRLAZ84HdklWRmczRpOMXyqRLamPT2idtD2MtaiQQViYst8nF8Zu8eh3gMTsX14UfN4TAlF7qLfBWu7663XALdWvltHnjoN1gQdfj7A2uhKI5Mgoq5Oa1anf14sfQpYuXs8BB5Oy73ZA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(316002)(16576012)(54906003)(83380400001)(86362001)(2906002)(31696002)(110136005)(6486002)(478600001)(36756003)(38100700002)(4326008)(31686004)(186003)(26005)(66476007)(66556008)(8676002)(66946007)(8936002)(956004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJSSjlBZ09IbHV2Z0NoZXZzS2M0eGxYb0JLeTlyR0V5QkJZT25RUkcrNDVN?=
 =?utf-8?B?QjBHUEVOaFIyYVlMT1lWSFBPN2V5MC9wV3EvUUU5MzhSWmpmcmcyakIrck5z?=
 =?utf-8?B?U25yRE9QbmNIaHRvazYyc1FsUDFaaWR5cUtGdzFmREQzV0pVTWhRVU5lRzV0?=
 =?utf-8?B?TWlWVmZRMkx0bFNjSzBLdHdWbEZwak55K1Q3czRZWVVpcDl4aGFYUERqUnBw?=
 =?utf-8?B?dXpuZVJ1S01qZVEwaTdXK0lsUkMyeWwvRHRxbkVLZW96M0Z3N0lsWjdnbG9Z?=
 =?utf-8?B?NDRiclFMRjRSNjB4NkI4WDJydUUyL3VYOG5hYThHWEZWbUxhQjl2ZlZBeVZX?=
 =?utf-8?B?QXZHR0VMcHRNR1RRNHl5R2xhbGJqZW1udnJ3ZndleEIvSWlCK2hvUlhTa3dE?=
 =?utf-8?B?a1FmaWoyTFBMNENRYXRnTVRSNnROTHRkZlY4dnZUVjlQQkZGbTVDeUJTK3Bq?=
 =?utf-8?B?Q25TZCtJU0RwQTA2cGcxL1JIUnZDUHlsRFV1cW9oTnRwalZnQzZKdUx1aGFj?=
 =?utf-8?B?N0x2T3RwcmtsbENPQlZrSTBFOS9kNzNQTHBpZ0xubERmc0p6USs0R0duR3d1?=
 =?utf-8?B?QkZOZWdVSDJoZHZlMnUxKzhwOXZpYjRRNnV1ZVNRU1crVFA5ZS90OTh1SUFU?=
 =?utf-8?B?cEgvSHVSb21BOHgzM2FlSEdFdHZtSXlKQmFUQVo5NFFQVS9CcWQrRjZ3R2dk?=
 =?utf-8?B?bmVXelU4UGlIMUVuRTZuQnY2NkNwRzRIUzFpZnc5bWMzdktIMWtQZW9QdHpl?=
 =?utf-8?B?TFlNNXphT1g0Q2dJTTlqZi9zblk0WEdaTVFsRnVxVThlNDJzaUtVbU1WVnpP?=
 =?utf-8?B?ZGRqbGhUZjh4YUJ1ZjNERmFiUjl4QjM3cWMrZXFtMXBiZXhPdjg0aWp4OVpB?=
 =?utf-8?B?cWc0b2tXQ2wvWlV0dEJQcjlxUU5QQ0orVzhmUU1LaldXcXNCQkpjcVNUbDgx?=
 =?utf-8?B?MVdYSGR6UkNmL2FmYk1vRlFRaHhNTGRjaWpUWTVMUEhENXFZNk02WWlGS2R1?=
 =?utf-8?B?dVNmVDlwUmFXQTBITUhQZzlzOXE3MStVcXVkRWduYWxNSXpYUUxLMDhBUG5J?=
 =?utf-8?B?OHROU3RTKzlHa3c4UzVSaUlGQytHOWVXZFFOVnZkQzRQUERjaGsraDFWVnF6?=
 =?utf-8?B?ZHhpcTZHcWVXbkdrNjFuRmFoY0duODhSTk1xRmtZbTdVWDNhRkxPeUpSczFj?=
 =?utf-8?B?bzlldTF1em04TnM4VWFNbCtSZktOSzhKck1GWGFHaFMzWXJRc2pBV1ZNaEM5?=
 =?utf-8?B?TEx0ZjAxS2dFUTJGNDZSRVhsanRFS1hCd1YzdFAvekQvOU5lN0xCcFFTY0t4?=
 =?utf-8?B?U2JPOC9sVHU3MC9ySXduU2J0SUdMU2wwKzFnZXFmL3hrdWtyWkpkbXBpRTNH?=
 =?utf-8?B?Qjd2UUMvY3JzQUFhdHU2TUNvdGJQN2VtbkhiZXhPbVBXa1FDeEJQL2hNZkc0?=
 =?utf-8?B?cDFsejdWd1dPaEFIZnVsbW9CL1ZDOVhhaFRJZVdteUhkeTRQaHhjMTVTaWEv?=
 =?utf-8?B?dEwydG1Ydjc4M29XZEFFaGxZeG5WendIOFdKUm9admFodllESVJhTDhNRzFZ?=
 =?utf-8?B?K2dmOXN1SkZ1RjJBRWhBbklvb2oxVStteUN5am8xa0hDRnZvUXYvVVB2TCsy?=
 =?utf-8?B?ejNJb21XeWV4MzArejRZNHYreEpaZWE5cXFScTlFOUI4VjgyU2hiMU1IQW1y?=
 =?utf-8?B?MTFWcXRoVC8xUWxWZldZSnI1NzdUaWpySGFta2VjWHFmM2t3RjUvNzdyRGNU?=
 =?utf-8?Q?t/TZlfT7VPwDUXdKhEkGyH+b5fvEBIJB5aqBUYh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7bf4a6-61b8-4bae-9838-08d971e6e5de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:04:36.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUdCjTt80pqdIGPC1zPRU8QD1iXXM9sL+g3kvZyTWuaPBXu9MbyA21lMB215uSiHDcysixCMNOPLx3hCRfwWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

In order to try to debug hypervisor side breakage from XSA-378 I found
myself urged to finally give PVH Dom0 a try. Sadly things didn't work
quite as expected. In the course of investigating these issues I actually
spotted one piece of PV Dom0 breakage as well, a fix for which is also
included here.

There are two immediate remaining issues (also mentioned in affected
patches):

1) It is not clear to me how PCI device reporting is to work. PV Dom0
   reports devices as they're discovered, including ones the hypervisor
   may not have been able to discover itself (ones on segments other
   than 0 or hotplugged ones). The respective hypercall, however, is
   inaccessible to PVH Dom0. Depending on the answer to this, either
   the hypervisor will need changing (to permit the call) or patch 2
   here will need further refinement.

2) Dom0, unlike in the PV case, cannot access the screen (to use as a
   console) when in a non-default mode (i.e. not 80x25 text), as the
   necessary information (in particular about VESA-bases LFB modes) is
   not communicated. On the hypervisor side this looks like deliberate
   behavior, but it is unclear to me what the intentions were towards
   an alternative model. (X may be able to access the screen depending
   on whether it has a suitable driver besides the presently unusable
   /dev/fb<N> based one.)

1: xen/x86: prevent PVH type from getting clobbered
2: xen/x86: allow PVH Dom0 without XEN_PV=y
3: xen/x86: make "earlyprintk=xen" work better for PVH Dom0
4: xen/x86: allow "earlyprintk=xen" to work for PV Dom0
5: xen/x86: make "earlyprintk=xen" work for HVM/PVH DomU
6: xen/x86: generalize preferred console model from PV to PVH Dom0
7: xen/x86: hook up xen_banner() also for PVH 
8: x86/PVH: adjust function/data placement
9: xen/x86: adjust data placement

Jan


