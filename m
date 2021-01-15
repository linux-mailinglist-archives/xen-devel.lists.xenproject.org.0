Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C142F824A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 18:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68464.122600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ssv-0008Gq-VI; Fri, 15 Jan 2021 17:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68464.122600; Fri, 15 Jan 2021 17:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ssv-0008GR-Rw; Fri, 15 Jan 2021 17:27:41 +0000
Received: by outflank-mailman (input) for mailman id 68464;
 Fri, 15 Jan 2021 17:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Ssu-0008GM-Eu
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 17:27:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63b15683-d67e-4184-8d12-2ae0e48b579c;
 Fri, 15 Jan 2021 17:27:39 +0000 (UTC)
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
X-Inumbo-ID: 63b15683-d67e-4184-8d12-2ae0e48b579c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610731659;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=i5xUBEMFhfPGXQJMzpCgAk0sDX8BJSjnDva9h3no7N4=;
  b=cc2i4/LsZbXuo6gl1+FAbLQ1+IfJMqIi97vLYaKZEw1Lexvzp7Vdl2WW
   qyyZQ8DOCH3UYr3cJPSqjPpHPkwjzZb80cBRoGAR2eJ24j+H2xCQIXwf0
   BDIiKUs6NMoRLFu6RDEDuzq7RUPSGk2r15ak4Mh2cZ3uuWxdKldNyVnXJ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kMtxnh2dFs+XOAZVC1oH5Os4lCkSHuuY2aUX8ccVdsE7MUufUg0E5wfA0LQEWDnb0ad3DT4+ES
 TDUhyIXgb26yJY+smLvfyskvloPU8Zs5LwJ/7D/YeVvqq6uYVBhrr/fh0ptwMITgSUo4slhj7i
 Z5aXtiKnW1qwdgAA7bD9zt+yx9XhAbSy0Aj3v3qpxjHlY2U0wHwv3oXMvtMxGZOkA9SoZU56Ns
 cHxBfAznL643QF8FSCXsscITEC5x7zAtWUdsO/sk3Wt6OOMnJk3Qhyo0cr75+L0j/wjEu+g5nV
 czw=
X-SBRS: 5.2
X-MesageID: 35184556
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35184556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpykWLifjTfBzAMhdOE4nMcdCxR80RfJXrIW5/zUcHdfZWA1rUW+oVa4Vj/C6BRdDODUpW85ZfAhBlWq3nA1K41BggXYEuvAW1swrCvXSIF/9gSwH+qN4lGU5DBBEnNFodeutUB3CNM3RzFSM0mkWLIbSVbgEw44/tKyW1vJbvo/N/godkhCRTVkPcAsahctRkRU0xPkIDcv6M3xQo/b/gC+Pxd+X/j1cLC0saEGcUgTLrjpT2NnQc4Z4N8tsBSDlgOO284TSX3ZyGfHlTwpnHIpTk2cGeMpnFIaJ1NoMKbJ2HDJVg9tQ2xJnW1oJB86+EVbGbLa3az3lkAOgbsipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiaQVdYylX/taMnLmZOdp6pPpJu+4KHB6O+qAanA6Mg=;
 b=ckVzZJnGBFFODQIpoFEkv9tz63PsEpssBFof8CIMoEXqfPnGlnaIfMCsWfU8SWoIgi0RCaUYWzISP742P0uof5udq/E25WkcDxAWBvLOPrpI9dfwgSiBbEIoOGFOrD/VnFXuxv7d/djismkFK9tBVNXJeFJY/4uX0nenIIirKuvwdAKCXO9eMua9EEbpoN7kQsd+nimLCPKVK0qjmZwdBATPQtk4p110a4rmwiVA+ty9unzfbc3r+mDNh4Gg94eBYUdo2mhGMREXvSXu1uVwLq0yEcYqw+iP+wGBxEFU8SVQX+Yni7qW0AUHfXdF7zih4KkzJOCxrOyxiTmeYW0zXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiaQVdYylX/taMnLmZOdp6pPpJu+4KHB6O+qAanA6Mg=;
 b=Tb2DwZaqFlgzaRdDMrNqBhReu6cMf3k5m+xZvZdDZsE3we0e0eWd976Y9/+ewjoR19YEvmzIuneHT0wTRXrU75pMQvg7ueY2Glf98a3F+5P8+pfI73FFcghhTjKK38tIULfpb0MtCRb3dc3AHfDwWaIFEdKrHm85ltwGyeiFxw4=
Date: Fri, 15 Jan 2021 18:27:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: fix uuid on NetBSD
Message-ID: <20210115172728.6srpypfygemkuwgf@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-15-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-15-bouyer@antioche.eu.org>
X-ClientProxiedBy: PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df9d4d7a-d32f-4022-d5d3-08d8b97ad8cf
X-MS-TrafficTypeDiagnostic: DM6PR03MB3914:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB391462A805EE6C39C202099B8FA70@DM6PR03MB3914.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IsUlteGSvgbxpcgXZIKmR8rj1z8tRtfAjynCsDXd0wJq5EIfqYQlq8sJZ51AvpI4pqhIMc3kGlpOwnVEG9Zzhxfz4oWwneJDsL3eP7sNavLSerFblqWng2vc/xDE41AYPb/Og62dBB9i7c+BeIf0RAQ8fkzxNo91//aUCrpjyr7QtK1zF2DoNEQmFJbdRA1szmiQtQ6Jhp10equtUgJJHy95OVeBpQw+l8zYaWw8X9JxOH8YgXDwpisAAXnZeHKEm3zqiCxRgg0siUAUcAmwjKZN2EgClnfU3RSjASa9Dvd8RYHljcX6B8wDpb0t7+Y5UwjGDEuKZNH3cHbbH5cDNSBUzfkUvjBgxio6J3Lbiby2Q3gWKDdGyOJU9+A8RklPyvjtMQ/Vo9ViJ2HM0L7iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(26005)(6666004)(83380400001)(16526019)(186003)(86362001)(6916009)(85182001)(6486002)(956004)(478600001)(5660300002)(54906003)(66946007)(2906002)(8936002)(1076003)(4744005)(4326008)(33716001)(66476007)(66556008)(316002)(6496006)(8676002)(107886003)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WC9VaG9zNkhFeTdJVWxyNW9xa2NwSHRJcmRkY2ZHQ2lDUnRkZjR5Z3Rld3lW?=
 =?utf-8?B?NnJSblRnQ1lySG04L3gvNzVPU1pYZUhtSDBqUGVhSjF6SkRVd2FYWkcrcU9i?=
 =?utf-8?B?VXBsVnhMSXkrbWk3ZithMmFvM0VFSllZQkUzbkxLOCtuR0dSeC81QzlMWTdx?=
 =?utf-8?B?V1pLbVo1blJxL1hTWFhSL2I0NFRCc2h4cWg1ZFBmNHUvRldZYXZjaFg3cFRL?=
 =?utf-8?B?SzF1NWVubVVFVFROK3Q1K0NEOUdZUGhxayt3MlBVV0s5dWJPakxwd0xuZjR4?=
 =?utf-8?B?bXQwRjlnZDJKcVNvU2c2U3pTS0lWV0FJZ21NSVo1bitkR2o5Y0FuYnNnRTFK?=
 =?utf-8?B?aUV5TnkxcE1yY29xcGJ4TlduSXZXMUd3bE0vS29aMy9lNENXQmREOU5BcENP?=
 =?utf-8?B?M21raVEzR1BXNG1ad3ZhT1FNbjg0a29PNmxEZ1VhS2R2SmoycWtFWTNRUmV0?=
 =?utf-8?B?OUNwTDY5bWpkbTYzQWZhM1UwbHFyWXZiMUVPbkZsdDRndEJHc25SaUdRempn?=
 =?utf-8?B?dEo5MkhTSXlIdmdxQ2c2RjVmQ2dyRGF0Q1RYVkxoYklhZC9VZm84QUhRR3BW?=
 =?utf-8?B?VmoxWmM2V0VzN0pUSnFJRWJBY2RPTkZwOWJ1cnY1NVJiTTU3WUM5dkFDczgz?=
 =?utf-8?B?aXVDdWZrblk1a1k2NmY4cktyTWhoRHB3YWYvT0lURTcwUXlrdHFHLytJM1F2?=
 =?utf-8?B?NWdVYS9JNUl1VE5SV0V3QXVQUkxFSXdRSTRMaWVLeklTVFpyWFFLL3pyWUJK?=
 =?utf-8?B?bjlBY0Jtdkdxd0MycVRWNTN4WmN0Y1kreG1ka1R5OE5wU2o4eFdncng2T0VK?=
 =?utf-8?B?cGZ6N1J2R3V6Y05VdlNyY0d4eHNveXRnc2lEOExQNm5hVFRrQzhNZDFpOWU1?=
 =?utf-8?B?akt2Um5uOWRCUGg1em9YUTJacnJjS0Z6MVVGdzZSMXJuakpWNVlkRjc4dFo4?=
 =?utf-8?B?dzNlNzBSbEZWNEV5VTJiY3JVYjVNOWVhTmZkcVJsTXY5UHpDQUs4TjBpS2xF?=
 =?utf-8?B?THRBd0Q1bzZRWE91cldLYitPTWhqb0NIK0FnNmlBWE9qbFFsMmRRTnU3SVpn?=
 =?utf-8?B?dlVWVUV2dEtzL24zWnUrYnZSSks2UmZkSW5GQnp1NWtuSmFSSXJOT0NOSTJL?=
 =?utf-8?B?K1ZqWm41b3dKcUZDL1hRUTMrcEg1NGEzL1lrY04rY09iVHgxdXZpSlhqR05U?=
 =?utf-8?B?N0xLYWZkQkU2bzZ1QUdqU002VzUrdzFJeklreFFNQ0lRa2RyODYxUVJsbVJS?=
 =?utf-8?B?b2ZUVGtTK24vZXBjdUV6V1p1R2ZsM2p4d2c2bmM2cldNNGl5b1VEREdFd0Zx?=
 =?utf-8?Q?3L2UMJjIDu1ys0nFoWwaZuXiRg41azfnrs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df9d4d7a-d32f-4022-d5d3-08d8b97ad8cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 17:27:34.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg6WqDk6b4biFoUiR1D+BrFZkaTp+HUcKkBRuUNQ6nXmHLdePpEbcWJwwy1nL9ebdZqX9bezqODO0tvWEX9Wwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3914
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:35PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> NetBSD uses the same uuid library as FreeBSD. As this is in a
> __FreeBSD__ || __NetBSD__ block, just drop the #ifdef __FreeBSD__
> and dead code.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

