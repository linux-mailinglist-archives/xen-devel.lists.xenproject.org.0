Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3E42538D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 14:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203547.358684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSyg-0000AM-TZ; Thu, 07 Oct 2021 12:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203547.358684; Thu, 07 Oct 2021 12:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSyg-00007y-Pw; Thu, 07 Oct 2021 12:58:26 +0000
Received: by outflank-mailman (input) for mailman id 203547;
 Thu, 07 Oct 2021 12:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYSyf-00007q-2T
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 12:58:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40fc2e20-276e-11ec-bfd1-12813bfff9fa;
 Thu, 07 Oct 2021 12:58:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-2GqadKHVP06ZjfzmzFUTVw-1; Thu, 07 Oct 2021 14:58:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 12:58:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 12:58:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 7 Oct 2021 12:58:19 +0000
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
X-Inumbo-ID: 40fc2e20-276e-11ec-bfd1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633611503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjpHCtqK0Ax0GEWu4x1GsK7W7ug1H1ZupZ6k1MECHEs=;
	b=luGMypkShjiO5zPrpvx+LimxCM+k9JQvnN5J24Ftru8WGBcIhZ35Mf4knDNpiOiTtDJ0RB
	wo9jmRNxhMRgCBWkn7tlTR9xNwHmlMbA1HJ4jV+bjW8ajDyo/yzSvSmWo6mu9dRQXvAsWY
	z7xAxmk+4VHaJzhrFKUXQividZDAJtg=
X-MC-Unique: 2GqadKHVP06ZjfzmzFUTVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XicJMTtCNMW8aUTDuyl2jss266HdGu1JLdxo5LcRjLEEZLxov67DGgNkZSEdfn/XG74yzPz5cBbQe0P+PO7h0ys5yCreHR3KiIU4SRrTKEAcB+01NOIEtvWwyJoNw/wmb6dMvomScEHwAsdXHC+SrfWUXFSyeZoQ+UYiaiOgKbrXByJ1DvHOz0ydyk28U8AV2Sl1y9iETLQGxlh9KUNWOEfiG1Z5rvN5Q6AGHu7l2XI30wsqb/UdComL47NfzKPq8gpNfF8656VUoKi4BnC46zO59H2ib6eBgyPjYNL8BgfCJc/zXurbxRgw/ou8LBR4OKTRXq+qkWH4HAC1QaE2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjpHCtqK0Ax0GEWu4x1GsK7W7ug1H1ZupZ6k1MECHEs=;
 b=QYMoV/FpaPUVXugdxGvewVCDcAnsFTGxUuRSq8omTjUDxXnuYCyj585Mmo46OJUgWcAMk86FimWNtbsXY/zXJ7aq3Dw6vzmVN/70XtWSVxKR8N0dTU839KLa/SL6gxe4ERENO6aY+EBex0uaYXLQ9ZzCcw1KunknXr9jaQeD2ZQvejtPQ3/b2VU5prN6M5OLbJSkHQakTZItPMBzfmQWH33BRFZwcfhB4/grdi7mmX8n9uX/iIYHXJ5mbYiHH0QQHZ76FNcve+Ys+Z0BnuE/mj7bWqnP5LSBJdbTxTkjh6LU5QaZWGAtet3zgFHrON832UJ19dgLWIRS3iVASh2wwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove)
 support for ARM
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <0dc4423b2e20c1eb40c961b211b18ed041f707b7.1633540842.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110061704280.3209@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0cc5a3a1-e31d-a6e4-9bc7-3f2db5144b4e@suse.com>
Date: Thu, 7 Oct 2021 14:58:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110061704280.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b7d3d4-1419-45f3-53d7-08d989922341
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119509720CD06531F24DA7DB3B19@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cAjS6Q6gZOgAoRYT12oGjrORf1h62yMm2ox+m1SbCyihicPXpwNdHHxZiHojYzWDk8kazXsAG+2M4C8Cq3ujh8tsVgMDUe3o2VsGPQoq2H7z8SFjKS/CKmUdz0Yy70ps8/d6FH+xvFVjjIm1jfkVQG1wMRGLkO4Xt+JNg4yBK7+FEEFVRwojz+jQW2m8YyT+PdpJ4qHjH0r6JCIuXmTh5JHBJ3xW0rnHc+YyG0gmpf1YJ5chkXpVqjneJ347EKOHJtQn+3coJvtyVc8hLGW0HMTFMR3pZq8QJrqZAMDqFGYz+um+bkTF+6bfCFPkw170rzdYisLulclYLK9ZELtmzqoVXraggP/aViNn0d/ymYAI17TudFgRqVarXMnvZQRU5HsmgdJMP12Qq4o/R3/tqM2zE/daVnkRCzGHJrQOt2d0LY24tmzrwFPCKmXfPZP+BQ5qJOF5KS/feJx6eyizwe8l4dMIiGCo+hOF9YjFgS2XesWqzcjnalw3Af4bhVYeJ+Z6evhzZGvU3kNHwpYNhIfe669Pj1pZ2GlcfHTfu9UVLZtX/5B6aL4eHVszzSc/O2qZS+ivE/EX37sEKhnT5y4artTyhQf/QWZZcyfA9WDBl1uDMxhj77IwoG8aO0tV0+Qtwk1SPDtEkpcf5AgZttFFD4Jp48DyM5TEjh4shTybT1vB97qV3oHt3TrNY/9bbKfRwhKgOojOD4EuuAkxaKy6ypLs4pvfXvX2csPO6hg+Ie2h7LXmJh5xn6ocXOwR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4326008)(31696002)(2906002)(26005)(54906003)(5660300002)(186003)(4744005)(110136005)(86362001)(8676002)(16576012)(8936002)(316002)(53546011)(66476007)(36756003)(956004)(38100700002)(6486002)(7416002)(31686004)(66946007)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWZSODhFMzVKZ2p4amNFUSthQVFhRDNpeTZXd2h4TmpiUXQwY0VSMG9IdFNR?=
 =?utf-8?B?aGRISmloVVM4c0doVkI2SHdQUWxyeWRJS1hkVktsd2tCUXZLTEVmOWZkZStT?=
 =?utf-8?B?YTBnc0RnZlljUHZUQ2p1dDd2RFlPcTlsMi9LWTBzQjZ0cFBMdzR3dzdZRStY?=
 =?utf-8?B?dmtKNnh0MlFBOE1XOGJQZ0Y3WFlaWDZyZGttTk9iaEZ4T21mR3BxeGN4d2FV?=
 =?utf-8?B?Nk1tcFlOVkh0dnA3akI3ZzkzQTFUdVVIVDJtZjdMSGJtRm5BME03UFoxNXEr?=
 =?utf-8?B?MWtzZVFwa0Z4MTdoMzBTV0QwNGRSMTc5RWp6bG5yTVpIWnY0TlhjU1lNK1hF?=
 =?utf-8?B?WnI0eEpVMXpwZ1k0a0JEVjkyRWJnenJ4V1lpci9sOFI4SDNpWHVlRHV3Wkd5?=
 =?utf-8?B?V3hjRHRhOHgwSGxDbWRFdnNjbjJUM25JNmRiY2NiTUdKNCtyK2Y1dW1vMHZ5?=
 =?utf-8?B?NEhWRDJDeVFpWGhkeG9YM0hLM1QzdFdNQW9UdXVjeEErbTJ2M2U0UHRXR2pG?=
 =?utf-8?B?UGM1bGxzcFVFM3V6dHhvL0VQbWdVNTF3ZS9UaFpDRk84K3pJbUVJVXZvaUxB?=
 =?utf-8?B?dlJKTGdpTkEvM0YwdHE3U1JiZTJ4MlJuMEdHRlRkVGdSRzA5Zkxvd2NnY2NY?=
 =?utf-8?B?aTNRUEVpQXVnbDZza1puc3NWemRkdldrN3VHQ0ZKWXcwclFUS1BuTUdNTDhr?=
 =?utf-8?B?SXYyd1lKZDdWVDVLR1QzNHNYNFE2OFgxbGgrbm45S2lUV0N3dHdiY3lLenRQ?=
 =?utf-8?B?c0F2ZWdadFZyTG96MExEbDBZZy9oMzkrNnBGVHo0Z1o2NHpnekZpYnRldGU4?=
 =?utf-8?B?TDIzVEpRQkN1RXNvaStLcDNPUXB4T2U1ak44T0hESkoyUkxpK0g5NmpPcW84?=
 =?utf-8?B?YS9jY1d4Y20zbk5tYlpHVlpjTi9hdFpqYVBzTDcvMytpeFZVZ0MrZVdNMUhs?=
 =?utf-8?B?NWQvaXh0cTBqQUhUTVNETXQ4MWduNmFUQkliT2ZkZ01JZWQ3Y1VndlZwZmtV?=
 =?utf-8?B?OSt4aEJRM3kwV0ZOL05nb0orQmk4TmdaVWNZU2JTckwzcHcwdU5WOStNU1dH?=
 =?utf-8?B?Sjl2SnJrVHNsZmEvazMyRTgzeWhPOHhvU0tIZkh2UE9sWnNBNlpRMTZVWGxW?=
 =?utf-8?B?WnIzeFJKZWpHMEZZcUo0Sm5PZFRURVNlTEpmcXFYa2ZpdGltT09GM0FHUW9G?=
 =?utf-8?B?RGJ5K1FuUkIzZkYzbDY2L0swY3Z1b1Y0aHVqODRVaGpWZHNSdDIzR3lTZVcv?=
 =?utf-8?B?eWgvYXlFSE5Hbk5kMENBMUJScVhtQWdZaG1SMEliVFJPMGV1cUVWVGlDeHhQ?=
 =?utf-8?B?bVFKOXlucEh1U205WDEwYU1ta3MrdldtMExzNkM4OVR3QlkzUzJ0TDU5WUd1?=
 =?utf-8?B?ek5WUWVBeERsd0QrSWdsSUJLQndCSHJOUzdIV1VuVU9rcnY5aTR3ZDExbmsx?=
 =?utf-8?B?eXFsV1kwQlFwQUVSVC8vNzJ4Qzl0ZXdVUU92ZjRKcjJDZmcyclZpL3F0cThs?=
 =?utf-8?B?M3BudXBOYWVLWmNKcFNRL1BmV2tqVkhzYitmeE9YUk53OC9WNHAzMUx4ei9w?=
 =?utf-8?B?QnAyZ2U0bERIbnA3OERzaXVCMG5NSzNicXhWQW04eVZhRlNUZnV5YUNQWHNy?=
 =?utf-8?B?czdpM3ZzUEcyWUZENFZzNHlZTWJjUlRmV3FVYVg3bnlZUldJTWwrOTViRWht?=
 =?utf-8?B?VHpad3AvbkgzSEJLWWs3L1dXRWxvK3VSa0ovUTBsOG9ESEs3OG5uSkRJYms3?=
 =?utf-8?Q?tj1eh1vE9QiKwhuTTdXAkQIOhsPDOaXYNzjjHGo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b7d3d4-1419-45f3-53d7-08d989922341
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 12:58:20.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPy57LY5DMmLoJxh8HkYGOz0MqogEndZvzHP+vaCPbol0HippuzBUyT1v/PgRViTt/jYt2zEf6LLWLBYMiZFKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 07.10.2021 02:05, Stefano Stabellini wrote:
> On Wed, 6 Oct 2021, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
>>
>> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
>>
>> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
>> and ARM, move the code to a common file to avoid duplication.
>>
>> There are other PHYSDEVOP_pci_device_* operations to add PCI devices.
>> Currently implemented PHYSDEVOP_pci_device_remove(..) and
>> PHYSDEVOP_pci_device_add(..) only as those are minimum required to
>> support PCI passthrough on ARM.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


