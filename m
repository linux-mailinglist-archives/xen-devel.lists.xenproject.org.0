Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B906F5B33
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529304.823570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puES8-00063H-9B; Wed, 03 May 2023 15:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529304.823570; Wed, 03 May 2023 15:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puES8-000618-6T; Wed, 03 May 2023 15:31:36 +0000
Received: by outflank-mailman (input) for mailman id 529304;
 Wed, 03 May 2023 15:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puES6-000612-OG
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:31:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 959eed8d-e9c7-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:31:33 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7498.eurprd04.prod.outlook.com (2603:10a6:10:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:31:32 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:31:32 +0000
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
X-Inumbo-ID: 959eed8d-e9c7-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwXYI9hGwllz7WFkaXJzseWu6gBclgIP+sKNRk7IkdGLOZVCNdDzwKxep5U676xKWzWY93uCCqT+c0VAeRQOvkH3Fb68IQ7eB5QcZ50y0C+ohTqEX6k5wnAuHxPJpzAybnlWjz25OfEelfdyC3RA+wXx3FYmsjnhQfHMby65tccRSR6Y0Fa8sUAN1A7Ll+oQlSjZzXZ2iJgVBQCfrChKY0TmKGplarA7a0EK3j4KtrWAjx/mqA3rd4Q+nxnf1D0RtIrCsRWZOfZanwgbgCJ8QJmxHSQiw3PWPh329VT4YXHsm4Wpq34glx8I494gDB2k7R04KXKKTSoZu96wPvDHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2xNVauUIZx/Q0E/ZFLgBZEw6IdycaAvbYocEzDzrNA=;
 b=bcX5NVUyfmyi3B8iYPDSKIutil33aYHB9MEs18Fe3H2ktn0x6tVSIYoe69cYtrk4rulDIj35tC3ni+0mg+DXEdGdhsc2uDoB7+/vpcPcoh1ovewLBJorF5M8BI5NGgyq7ZA+kUl5lxqzn5IW0MgaXHxkwH/9i7swK4bShOwpNTWVyQtvWj+LWv3kE/yT6KVMp3hv4gpcUNpoZY/Qsi4JWDUPN9bf/FCUymNN4XKjR8AUwmDhlstyjMa6DdvPFOyzJCW6dDl4dcbOA9avvnSjs0LazwOvogeByyzHAB5Do9Z5p0iv5lVysorEKmQvZES5zRUFKK4g8FLlkFM8pEqBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2xNVauUIZx/Q0E/ZFLgBZEw6IdycaAvbYocEzDzrNA=;
 b=MdECWLAR2t6oAuwhKfXNr8DsRx0IfidXB901+DMweeyEFGQG+lRJOhVg4n9cMxgig2eBn5MWL2iB7+qe2afSqwMA0b5tgFqFvRl4ZhmF5aJabMrp45fUE+iJGKc+FISpHW0HJnnGkjzHbav/Qg9L0rZFVwjCzx/xh5JfVFE1kbUCNwFD+uGEhfCMw+2aAWsesLTLQDvyOMBi2y4Njcu1BrCx6gRdEmpaMWVc4dRl5a9pRlfE5iQbBA7tlQEVRJTxHEWqioaGFnW2TV/+74Q9Wn5tBNkhfZ0+Rj3P+htaWUPfECRhDAarKcnTUZ9HG0+nY7/Pm78dfWsyk2WxzhcjQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
Date: Wed, 3 May 2023 17:31:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] new CONFIG_HAS_PIRQ and extra_guest_irqs adjustment
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6d5a8b-e508-4a54-a9f1-08db4beb790e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CuuTJOXHpxWsbBFYh906b/aRzcD5b66USGPSbgRMS3uOaTOQ+XqG47zmMk01ucYUDx8NaxxibjyZunDtgFxf/HCozMhISPRpliOxQWhg5luCCQMUB3stcwS8gVZlQGx6IGihocqqUe14CNJrzm93QHvLSTHJ1k8M07u6IUfSDy5CBVMMsOQk4E6OLz+iL8qY/VGx1mmVaO8hdeRn6465vtXpQtgv4dKAyccyTD60K5zQEA5M1rzlWJ0tceYMW67UEQ5iNysyQxAVsNVSAMH0GKQc3yiWIkhtHh9R2RBbzfHkGhBJDzy7pETqhCpSn+e+LBo3z0ItXw1scsnRgf4d53vd1lrijsd2VA0UWdf1qVISOs1nEHfEuGv9jjOJbHTNVyVkiz5AxWUeGou4GeD94CNnUVS8NDdJKRnpHGxwE+x7Vyf+Pdm/59wKVUW91CjL4HyfBEbvw/qw8TCm+n/7DGF/nmhCmH1v6AubX2epqmBFwuYrsgkz315hpKQuXM+7LM3dmYVop2/wC2HDam8F7q3Yu9sEpbPRGtrO8dZqZr1Jc24M1ZzUSZ7fU3XLYnWx/bFhrsaJFZ+Z2vRuF4T0N/JuUXHT/2klwauJ3ZPdFegGDAw4c/y1IixhYifa/OBnnhE1A/gajTsh/Coa9CXUXUssA70tVFlG6bRZsOempjVqVd7wpTuNGJKBR1f0GZ/w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(2906002)(38100700002)(2616005)(26005)(6512007)(6506007)(186003)(6486002)(36756003)(558084003)(8676002)(8936002)(5660300002)(86362001)(31696002)(478600001)(4326008)(6916009)(54906003)(316002)(41300700001)(66476007)(66946007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGVOUXNwKzU4NkRHcHJCd0dzTWZ2TjNYRHFMc1lrS21KMTc2OE5SZ0MrNEp0?=
 =?utf-8?B?TmxwcTczMll4bkREb0toSHh3aWtsbUx6ZXMvNUgxbEgybnI1alo0eithZ3dp?=
 =?utf-8?B?Z0NPWDlVM0duTG94cGp3QlRYTWdiZGlrbE1tL2c5S2R0THF1OFJnTEpHTFRV?=
 =?utf-8?B?T2lTNlRsTnNhRXl5THYyU2hQYWtvRVRjbklrcEc0S2E0bDJsZHlVeE0zM0Js?=
 =?utf-8?B?MTN0UVV2OGtQSTVqMnM4eDJGMnk1UzlIWEEvZGNRTGZ1ME5pVmNIU254QW5P?=
 =?utf-8?B?YjQxVWFuQ0pYc1BYOE1rVWZaM2xxZGN6eTJ2ZUE1eXNXMWVHSjRGdm5RV0Vj?=
 =?utf-8?B?UkpxUTJqWm5XRkVIbGQ1dkVCc3dBeXlHTWRTTXBtVm5sVi94T1ZBWVRtMEVK?=
 =?utf-8?B?RktVLzVicnRhTjBqR0p2dENEMkFwRTNoeEpicGJETFZRVGNGVVRFaENLSGMw?=
 =?utf-8?B?Mko4Z0pGTGg1WWd6c0dWRXV3YUszTnFVbGQvOUx5QUVZYVJ1elI4OGJrd0N3?=
 =?utf-8?B?ZHVscVRsbUl0Qzd1NG5Id3pWbEhpeXVsczhnVXZ5b2VQL0ZqN2dEQXdjUXFr?=
 =?utf-8?B?ZHNkWEZIM09uYVFsRy9CM3laV0w4MXQ3WHZOajNOVTNsb3ExZXd3TVk0QkVR?=
 =?utf-8?B?T2dGV0ZOU1k1U1YwdUloanNoTi9scmlwekNQczFqd2dRME85dWdjWkhIYmwv?=
 =?utf-8?B?bFpDc0hrM0lFUGZtdndWZDJiZ0lMaW94K3Rrb0VVUW01eHdZRDdheGFDc0F2?=
 =?utf-8?B?bm5SMnorNkRCa21maUhDNmR2aTJGcnZmczhrdkljUi92SHBFUGZscjQzMDk3?=
 =?utf-8?B?bi9XT3B1QllrYnJsSXNtM2MvZ05PVzlEV1gxaXBJS3Z0NkxsREtoT1VFMGJT?=
 =?utf-8?B?REhUc3o0VTQ0Y2NwMEFQYW9FMXFSaFpFMjgwa0FUOUh4djB1L05BOGJ1WDFt?=
 =?utf-8?B?WXRPQkM2UXBmelFQNUZ2K0t2MUtFejBrSG1RdS9mYk9TdGpEQ0lSYmdWbytx?=
 =?utf-8?B?cXFPSG5YU0d1bUVZNFVqVnhPcGtzWENFaEg5ay9lYk01YmExcGluWjRUWldU?=
 =?utf-8?B?V2Zkbm1Ganc0UDNUVDlPaXB2dTIwcVVoSGV5SEo3TGFNNjZrSVlDUlVDSyt6?=
 =?utf-8?B?ejU2Ym5LVE9mZ1pOREVFVlZLSDVZOEQvVkRkb2YzWEZDMVdRR1VXMXMveTc2?=
 =?utf-8?B?ZkF5V0NlM2hidndFY2lOS3RSa1QxaGlZaCtpT28zazNJdmV4STFyTjgwUXh5?=
 =?utf-8?B?ZWNoNm9qMktqYlR0Skdib2paeUkzSCtJRUk1VWdwekZCeGtCaW5FcGt0RG5E?=
 =?utf-8?B?Z0xNNG1IOE1haE1rQ0RTWDQraGZJNnRBNVhtV1MwNXdQL0NOT3RVRVhjVU1Z?=
 =?utf-8?B?RHUySmwyeEl3QWZpZ1ZGblhkNnlrRklrd1Z4WDAzbWI0UDh6Q29ZZnU4THZl?=
 =?utf-8?B?SDlXSjM1OUZDbHd6bkhJYWFrSHZFUkhkRm56LzlVbVpQZyt0M0dSTHM2NG9X?=
 =?utf-8?B?QzBJSWFpdk1PVisrcSsxNW1naE9TT25HVTAyWDRUV3FCSUFJaWJXb1BkTTFC?=
 =?utf-8?B?eVhhU2FQVHJUcXlYTzdzV3J1ci9rQy9CTGhaZ2RheHR1cktLWkZXWUo0Zjd3?=
 =?utf-8?B?RkxrcFZKOFM3N3ZFcFF2NzlqWjdwNEFRV0d4bFdtQzZnbzVpaXU2Zk5iL1g2?=
 =?utf-8?B?by9aSTBJRUJmTmNDTW9qVmZhUGtLZnZlRWF6eDBLOUJnQmdrV3NmckMxNE9w?=
 =?utf-8?B?TkFGaHV5QkdabjlIYkJWV1BWWVJMdk13czRKcDVMQWlaNlJxVHhZMXh6eVll?=
 =?utf-8?B?SndMdU5iaU0vM2hLY3I0MVhhUmx6T1VKcVo2U1lmUUhxblBzQWxEQldhV3E0?=
 =?utf-8?B?WnFkVnVkTHVNVnlFVWlWallGSWQrYnhwRmxUS0l4NlFsazRDVW55MDJQalRH?=
 =?utf-8?B?YllReHkyVks2QkFDY2xPTlN6aEVSVVF3b3hlYmRxN1p0dmxrekNiRzJWaDJz?=
 =?utf-8?B?STd6QW9ockwzNkI3MU9hb2x2dkhQOGhyMVNNZFlveFY5Vmd3U0ZVRjNjTVdq?=
 =?utf-8?B?SktpUDZGYXZaaThjRzQxcXBSMHFQMXhVQmFGc2pUckFwQ1JLVHZBZjZyUkNJ?=
 =?utf-8?Q?EAt+A1PYjdxbyjSVqb4UhdaG8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6d5a8b-e508-4a54-a9f1-08db4beb790e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:31:32.5434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwCoFThrBh5+er6xEfw/rOCvcQLjoj/+TOPzvM7oqlNb376bZQrGtcan/8MPK4jqpM2v4tb7UGmsKlIWTopk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7498

The 1st patch (new in v2) has the effect of the 2nd one no longer
affecting Arm.

1: restrict concept of pIRQ to x86
2: cmdline: document and enforce "extra_guest_irqs" upper bounds

Jan

