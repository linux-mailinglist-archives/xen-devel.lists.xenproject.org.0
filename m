Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228B2F8040
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68401.122480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rd1-0007qu-B4; Fri, 15 Jan 2021 16:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68401.122480; Fri, 15 Jan 2021 16:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rd1-0007qV-7q; Fri, 15 Jan 2021 16:07:11 +0000
Received: by outflank-mailman (input) for mailman id 68401;
 Fri, 15 Jan 2021 16:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Rd0-0007qQ-0e
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:07:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85539ada-c652-4f14-ab56-0010215b6240;
 Fri, 15 Jan 2021 16:07:09 +0000 (UTC)
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
X-Inumbo-ID: 85539ada-c652-4f14-ab56-0010215b6240
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610726828;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wSjaqWiuvkRf+lbSIo53aT565fluOVcN8nV/qXqeoes=;
  b=Y33UXanDIj/qMYbXFGjPXrfDh7g9Vde5PzZAG3Bpdm9GjvSB6CDzSIvU
   rDzdr7tAOEkmdJfBKKd6C9olBK3MYX8BJeeumVzLCrmyNj/c0W7CySFIE
   pWS1BberEmr2FGp2Q0J3W+C1bODe6DiBBoHLksJgG5tWGO+whGWbScQ2r
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 36NuoRVjUK47SpbvB+vxyyvSPXt1A8tWMTS5rNLdqOfwG/SjqFEZ2TZeX6f/Zc7gNeoQeMMDaH
 w23ZPBGZ5+mwMw7gfkuUMXwxpcISlerOx7zju+s3IKu3Nbo3DlOTVmmqdHzwYZ9I81I7HW8pVS
 SLeLL8C5KIZoPmDYCwNgXHjJN8kDVZYJAQbqY97ssbnW+nsNlbW+82w4CefoRUipePK7uLGPCU
 cP2zlj9V3YH8N4XGKT4I6oSGj2iRtF8aoabv+sGLhq0yoZC89Zyh4ydRd4bKpEsLo5cz08bz8D
 bjA=
X-SBRS: 5.2
X-MesageID: 36480724
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36480724"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bazHO2+ARDjJvHy6rkMBq2l5ycWYCBjH8BQw4lYQ4ofLAJNv7p6EA2CtV5F9i/hT7MrSz6/yiP8/GacBVgw+RpfZrb0mBsLzilAVaGYwCqEgP8gh2ghIZsVVM8ftSNaEeRGJiAUmRmTijsEp0M10YkXEvuj2faW5Rx07WLRM5MtDlEYKqTE450mZKyoS13cV7L8M7N4OP+XHGjqKNERQ4LiReDftC76qCX0CHBqA4dtdcSG1BxT3BAkIC9ozLXa6R65wy6O9QtUe/0Vatg8Q5+LT2EzZP2eQfUZiLJFAUVLGF2ZoX1z9hK/wDDAe0L9MyNY1LrbSTn76uU6KkVO9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0m1WPxIBfxZlD46zAlaHoJtJUV9MMZFCOigqjNWTpQ=;
 b=AAGeC/pfAD8gaN5MORGnhwuibJ22a+lx7Ukxfqb/UnGexctbRiZmOZa1ZBxPa92cDQzCnYe3crt9prDEmunumHZFRwaxTiDsEBPPy8DQ1Z5gQ8vyoXQUHdAIYm6R/7vg7B0KMRhWK2Lt550fCDJ5neHXdMm+OIZcLjoNG/1zbrLmyxkoN064Oi1xRk+bqecvxvVB0SsZr9lKAxsuPFh/9H+XJjIPgiTy0HXs8k8c350AirHXM6OK1xs7vvB20iMDyUFoema8zDFZO4hAmXKNLeMybcEygrpST1lOs7WoVYOM/FpzQGGQpI+ArdRlCOvBbd8soA3vuhrfdVN0PNS2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0m1WPxIBfxZlD46zAlaHoJtJUV9MMZFCOigqjNWTpQ=;
 b=xMhsqSvkTNX0xNtE0mUe+D2pZGNKCAQ5ubVUHqLEk4fHWOv4mPca0DS8cL9FhsR+z+wuSiPVmRgWwmfLxMJzMKFBm+dcyRTM/FGRlqAQzT1fVEyl0YYVKNbmR24eB9vapooXF5naNmPwogtbm+W/EoT3hhzg3QWplk9WlI8FpWk=
Date: Fri, 15 Jan 2021 17:06:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: handle case where vifname is not present
Message-ID: <20210115160659.hux7u7cbwktfog32@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-5-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-5-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 191044ac-4f97-4a26-afcb-08d8b96f999a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-Microsoft-Antispam-PRVS: <DM6PR03MB453840FE6535C35814BED9618FA70@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Bol+Jq9lki/RZsfyjHfFpSC35WyqY1wvsn0XFoFCa1Pu1I8S74MQpKiNUpH36WM7VF4mNClJCJAJRjhzH3ih81B62hXJN6TPOx6DSTEswYbfJkHGeKQxOoCN130tUK3eO9JgpjoJKqUQzOzlJrBjc6sDuIfE6eCzG8nz+C4+FJts8ONH5+MDPuqLBe/XnBUCWi1OTC6K5mZiuOv8UX5Ya4jIKkht1fQ9H6DnNp0XXZQNN32H21hmD8L8Eg2Ngu6qWNYMuo2eex2M/YhshqqJSWckt3MLXNrMzyGFhww5lQd9gnyRuzQ3w5o2EVy8esksWMH/lFI9PlXkudwF+5BtEWJqNk6LfRmgPYtWb7zYRMmvFRPvvDmrY7zb4IKnHv4EBxqbDy6kxyIuS4XtNfPP1dXaySbuN7jDrfexsXUHY1rwQnkpRLLcdweWZFU9pP9eTfXe5Lz/31dZwXXSuWYraoLbjNoL+0Qe2SyivtcE8sjg/JARiwDe3PwiVi7r4GnP2lJGhllAB0szzRD3rIzcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(396003)(39860400002)(136003)(346002)(6486002)(66476007)(66556008)(66946007)(6496006)(316002)(478600001)(8676002)(5660300002)(85182001)(956004)(86362001)(4326008)(186003)(2906002)(1076003)(4744005)(9686003)(6916009)(8936002)(26005)(33716001)(16526019)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHVWM0l1WUM1dzRnSkdZMFg4MURMN1pTT3R3NkpHQk93M0w2clR6UXVzZlY2?=
 =?utf-8?B?RXRLcXhxc1J4K1FDRVJFWnArVm5ibkZSVlh5QjFJREVVMXoxMXlwazgwVHBj?=
 =?utf-8?B?VmdWeE15WmpyRjFwZHl3akNNSWlDcEZNVVhtT2I2WkFHL2k1L0hzbEljN1VH?=
 =?utf-8?B?bisxaTR3bVNxTHNzR3BSNVl4WmdZcGZKN2RPLzhJWGwwQlQ2ZDA4cjc0aTlo?=
 =?utf-8?B?cnVkVlpSS25URE9mWjJxYkJqNVhpNTFqclpYU2FXWTZiRlF3WjErSkg1SS9h?=
 =?utf-8?B?Sm5LdzU3eE1JT1dsSXVOclJmaStlUXliVVR4N0FERU5mWklBbW43YmVvSWNL?=
 =?utf-8?B?MHBHcXoyMVQyUHovOVp5MzExTDNTSGRsUTJjWDJZdU9CcU9oYUdDMi9CSzRk?=
 =?utf-8?B?WU5XSk9WRndIYXl1aE1VNFZqdEZlK0hyeE5NSDFzcHhXSW9CZVpYUHlRc1lj?=
 =?utf-8?B?N3RjZCs1SnBlL25CNGdIbkVWdmdMa2s1VjNoZUx3WEJxNGJXWkpKd2wyT2lT?=
 =?utf-8?B?MWRzemllZGVPWERGTWlpbUEzUTJ5VnpkNWo2UlB4b3FMQWFuNFZQZnl6QVFx?=
 =?utf-8?B?VkFhMFhCLzU5SDFUWHFhZ1hpYWMvNTY2enZ6bDFpaG5hMDNvQUoxOGYxQWdr?=
 =?utf-8?B?UThrMWdGUGZhYytzRFNBWVRzV2czZmljcURPNVNpNXExNU16Kyt2OWFiNXhU?=
 =?utf-8?B?a243dkd4b001Rk9ab2ZnaDdmaXBIRDNxWGtCUHVPQWxTVzVWdGxKdC83b0M1?=
 =?utf-8?B?bGdBU3I3eHRiWklUancwUG1tTHFJRzdNS0pHTW9lY3hmbEMxWTdUcXZuYUJC?=
 =?utf-8?B?NTZ5TFhFT21FbEhnS01LVTRlWXdKOXNjSE5rR1hjWWZyYWliR1RMeTcybEZt?=
 =?utf-8?B?VWE1SG9vdDZ3aFBKaFQvbnRKMGhCYlpsMkZFNmthVzhTZ2UzSGIzVTNlZ2hk?=
 =?utf-8?B?KzJCaER3NU1wM29DNmhjOFVjZmhVOEIvRkFHc2xkS3JnK2FuUUdIWkZmNmNk?=
 =?utf-8?B?aUNidWNRZmRxeGoxWDNQSDVkei9ZcnA2TFJoSW5QbktBaHYrcFAwWnpxejZL?=
 =?utf-8?B?Zi8yNUU5RnNSdUJmVzhVaTBxci96WDFKZzdiWVQrbnljaWNkK0IxVVdDaXpD?=
 =?utf-8?B?SEcvL056MnAyaUh5QUJWTDlQM2ZEZkJpTFFSWUV5K3cyS0FiVlhrdndMdS9w?=
 =?utf-8?B?VkxCRzJSMldueW8rVGpEL0F2N3U3d3l2ZlpuRDc0b1lRblVNbW8ybTFwclV3?=
 =?utf-8?B?aTJKMjJpRmtuV244YVlvcjJ0a0J0aGJSVmxLQnhRWFBVYTVWdUVaeWVlZGtV?=
 =?utf-8?Q?VOD8FdkOF50q85F0SvJxi0C8XW6Dh8/mak?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 191044ac-4f97-4a26-afcb-08d8b96f999a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:07:04.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cuZDZU6Bd2qU0QfJWQjqQRlmmG0hSIs1x/HNTjVcOGZSMwjQt5HJE8SUpOrEMbtPATGimFG933aNUzHNtVFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:25PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Some Xen version didn't set the vifname in xenstore; just build one if
> not present.

I think the current version (what's going to become 4.15) should write
the vifname in all cases? If not that's likely an error that we should
fix elsewhere IMO.

Can you check whether the current version has this error present? And
whether it affects PV or HVM guests?

Thanks, Roger.

