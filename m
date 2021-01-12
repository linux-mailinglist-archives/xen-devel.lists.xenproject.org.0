Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3992F2C21
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 11:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65558.116179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGWY-00062x-PR; Tue, 12 Jan 2021 10:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65558.116179; Tue, 12 Jan 2021 10:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGWY-00062Y-Ls; Tue, 12 Jan 2021 10:03:38 +0000
Received: by outflank-mailman (input) for mailman id 65558;
 Tue, 12 Jan 2021 10:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Pv=GP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzGWX-00062T-Rw
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 10:03:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ae44a1a-9db9-408a-a511-e48081011ca6;
 Tue, 12 Jan 2021 10:03:36 +0000 (UTC)
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
X-Inumbo-ID: 0ae44a1a-9db9-408a-a511-e48081011ca6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610445816;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Z6ypfUf35RhbFi1swGPSYCLgLO6hnkQFIhw9cDZ5eaA=;
  b=hr4NljTkMkrKupi6bBYupIjCehoV+hsqiqsOoqUA0BKwp7Y+igrbesbw
   zggYenCNR0ewACIg2Mh1Rx3aUKRIvVyzRbZ79YiDaAfLIj6xualhArM6m
   Fbi6xRjtttXBNw1prNGXQwjERI4Ym/wRw9LDH5VQa59dFRjjIt4mSkrct
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6/zImbji96Tlg28r5IFrvYd+x8aqpv+tT+tIyASGf3VSLNLU8emddp2uNMUiKfEo7y8ceQ2n6R
 1fu2t768SReLbxnEpVg02Q/K9xHOSRiV4yS50WMEqZfGlSZva5ZucmVbl5eBHO1k94/fZiaacG
 TbI87UKzuv4Ak9bdrtyW6xDDNFHQwaJaNuRtgQk7SiFf6f4W63wp8phY3o6wSTHX+A6LD9kB0+
 JIFbpdso2xLXlJJvDhd9vRvc3bgFVTnETfeJSzqxFKtU8MzYlUhGni+9immIRYxj227J4wZO9D
 gSg=
X-SBRS: 5.2
X-MesageID: 35268229
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,341,1602561600"; 
   d="scan'208";a="35268229"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG8txY4Ucn51KwyOOyo85P2q59jXaZhKp5RQG/WYXftCS2BHkjrBQoUtPV9rjvVZPA+G6ZouUHHy9csElQBodgRHixkFv9LGxqXxO4jhfUrobKtMJ89z1sPgCRZxw5Yr2dHFh2tHiP+6Lc7MWNdYrjjs2Kk4TM3/gG1XYAdc+HI2E+PcY+Qfi/UB3vMoDUgBfKd8o5hAoBhfmbkvzx1gXCupAHSVhfdpBymIZNsaeVXx08BaO9e/8zuWHegibE1ajEoIptWLTQoK7g3c6adD9e/DZZFjJhdR9dEa1EtfL4064zroadyHpOWGaofR98dD+ZR4QvfqW5JRqDu9ZJslTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBkuX8FT5jUzq1WN/uGEa7TYFFxYQ7VC9+egvnGrTXM=;
 b=UK4PmxIg82NaO9SYSvpTwCA4K4eAgKRfTv3Po2OWPboY3NQWYJKig4mP+u/3PrKYz9u6FTe2GMF9D7/19whzg52QUJtoUZ1B4rEuJjCUtwdyYIyWM5OMOm+b6oianL69OKArCJGjC6o689Wyf/rJXxE3wMsLxiWFm8thVT4kJl4r7Q6LsT5ez8ZfMUml7O2Fto9D/VhqTAcuujurdYCo+yHAZGFcI4XRvcPe87vFrS8NFGUkepYIvbYG5tkCBE3+R224/L3VbKoFmv21Gg5wxQlRmgoyUhu8gStIoeDSwkNxMga7kO19X4Arc9QSP83ZTmR1xNjdqbUk5oK6Qa1LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBkuX8FT5jUzq1WN/uGEa7TYFFxYQ7VC9+egvnGrTXM=;
 b=EceCWQJbRhyM7jsLTr741a2ufCFpt1gfcOEgC7A8/1o5vuAqtVJ6g4U3PmLeD8UJ4o94yofWfTbi0xNFjrtcX3UFNatjporzD0fRl3NPyKI0LCAVhqWwRVnZJwBLK3vFrYMur7YoexFDddf4KX0UiPlaYxJnPESACeOtA6pjipg=
Date: Tue, 12 Jan 2021 11:03:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <linux-kernel@vger.kernel.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
Message-ID: <20210112100324.ii34oqldfrtmfd2f@Air-de-Roger>
References: <20210111152958.7166-1-roger.pau@citrix.com>
 <5063e696-5a7f-4429-048e-2bf0d14881d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5063e696-5a7f-4429-048e-2bf0d14881d7@suse.com>
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258f526b-88be-47cd-264a-08d8b6e15165
X-MS-TrafficTypeDiagnostic: DM5PR03MB3211:
X-Microsoft-Antispam-PRVS: <DM5PR03MB32116760A46925B19DEF67728FAA0@DM5PR03MB3211.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bm8JnEDaY6MavGHY/OD2UinDJ0GYaijQlr8+QpFWgekbO5TqSJHGwzAd2N8lISQCbgU5GObrESfiVJ81kfFhZkRXD8tGyD2WPv4I39Ea831AgnP3v0jbN3CSkrEA3Scg92jP8D/Y3Kt3koFSy2GN3MnsgX8cGS0cjIVbH6KxRHOWDyamSbOgaAGtCdwSph8wMjA/asEL/jWEfaUmqrkOxU4GYdHQ+SwM8gEChWnvH1E66+vbSsKnzbmUiA3/78Tcy5Rree4MVy6JJFLkZtfg5IKnFA+sbih8977/ebinpg4Ox0FPvFIouUqlEif60bNmFtOlb8r39aItyAPFbnlxd/Q/d9WJOovEe/JemV+bod+T0S69txZc7CMt2FG/EGK2ypo5b9eKPW/+fkVHglh5vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(366004)(396003)(39860400002)(376002)(136003)(478600001)(66574015)(8676002)(8936002)(316002)(6496006)(956004)(16526019)(6666004)(9686003)(66946007)(4744005)(86362001)(5660300002)(83380400001)(66476007)(33716001)(6916009)(4326008)(53546011)(85182001)(6486002)(66556008)(186003)(1076003)(26005)(54906003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RU5SY2tuWVNOakpvNEtWVkZEWXFtZVpiVjBWOWUyN2Y2cUNLMDU0S0NuclY5?=
 =?utf-8?B?TVFKVlR0WDJUVk5kRVVvR0g0VUtqdXRrVUQwcnIveU5LcEgzaXV1bVlEMUVM?=
 =?utf-8?B?cUNEUFpJOUJaS1JWM3BuUTdxVWk2bnFnTUZ6eW5JQ21ZZEo0NzU0ekVkV1pG?=
 =?utf-8?B?QTFXbWREK1BJR3BXcW1aek9EaG1NbTlKK0RIRmgyNitHbUx5U1JEaGI0Mm1T?=
 =?utf-8?B?MHlwcmlScWYwV1RSZ2I4TVZjdkRRSXRtcGFYMG1rZ1BwTHJLVS9kbktQQjRM?=
 =?utf-8?B?WGtab1BEd2UrUUt1TWdqNDVQZXFJam4wY2grc2FxQ2xiV0luYjQ1TmdidXRP?=
 =?utf-8?B?TklNbWtFTGZRUGVUUHpRZ2NFaW4xL1BnSVR5Y2U2Qk12R2I4TUxJNjlOUGpv?=
 =?utf-8?B?ankwQVFobFdRT0k2aVFkTHY4YlFCZTJENHYvYXBIZUs4bE0zb3kxYy9nK2lV?=
 =?utf-8?B?Zm9MWTM1WFZKLzljT3BrYkd2eWEvS09LbnVrM1NlakRkRC9iTEhRTmZEQXdC?=
 =?utf-8?B?UHEwUUdjZ0oxSnA0QVhiSEdkeTRCTlVPZjA0SXdLU2pZKzR1K04xd1ZhdWs0?=
 =?utf-8?B?aDlBK0s0NC9iSEUzV3g2dkt0RVZmc3NzZlhLYVd0M0pXdzVGUitHVHVLRk0r?=
 =?utf-8?B?THh3cWdEaW0wQncyMUgxMmFDaWRLbyt4UGRaaGJJdy8wTEdvbW5sdk1DcTBt?=
 =?utf-8?B?OGFvWWllYTBCTCtrbG9UcGRKb3lmOUxPSGZMaXRwWjFVeFd1amIrSm1jandC?=
 =?utf-8?B?eGJack1Oalo3YmszYWFheGJxV3ZTWDIxTGduVXhmNzliUW11Z3U4RVhxemxz?=
 =?utf-8?B?b0xqYm9FWG9tV2d0UFVBZmhPRi8wR3JUcEptMmNzQ01xamVlQjRrcWdhSUlF?=
 =?utf-8?B?ZXloV3NINFVwbkM2MjdMWG54dUpDa283Q0YxZTZ4dmhyRHF6cTUvdjhSaXh6?=
 =?utf-8?B?K1h2Nm43OXhnNzc5VnAxK3g1TmFWeUQvZmwyaVZCdHdaenNBeXFyaE43NjBM?=
 =?utf-8?B?ZDA2ZUVvanBhSllLS0JpS1ovYUUrMmF0RjBZWWx5cU1xWmRmUmZpNXpOY0gy?=
 =?utf-8?B?eFlqcTBrZjRTNHBNLzFYL2RZWDdHMEVlV3ZBQXdJN0szeEdTTWJiRUFoTllv?=
 =?utf-8?B?NXdZbHZ2WGF4RFVWdFd0V051Umordnhwa1BrQ09TZ0p5ZElWWmdldXFOUEw3?=
 =?utf-8?B?dGxNbEpGUFJ6b2Jrc3hNbFZkSWtrQXpveGVNRk9aY2NSZ3VycWwzVkErdDNs?=
 =?utf-8?B?ZStWZDhMOS8vVDkvREE5ZVVZYzVQemdrQi8xSnRSUmVNd1NtOVd5UkdCRHU4?=
 =?utf-8?Q?GXpsYoCPuymxvkkb0mbOryoz1+X12kjpDh?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 10:03:32.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 258f526b-88be-47cd-264a-08d8b6e15165
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBS+GAX51Ek58stk/qIMW4HcGj+r4Ydq0Gw0y6+qfJVne+9diX4TVB8uafA/rAPC3IbQn6sy9M46fcKwRnoNeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3211
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 06:57:30AM +0100, Jürgen Groß wrote:
> On 11.01.21 16:29, Roger Pau Monne wrote:
> > Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
> > addr = 0 in order to fetch the size of a specific resource.
> > 
> > Add a shortcut to the default map resource path, since fetching the
> > size requires no address to be passed in, and thus no VMA to setup.
> > 
> > Fixes: 3ad0876554caf ('xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE')
> 
> I don't think this addition is a reason to add a "Fixes:" tag. This is
> clearly new functionality.

It could be argued that not allowing to query the resource size was a
shortcoming of the original implementation, but a backport request to
stable would be more appropriate than a fixes tag I think. Will drop
on next version and add a backport request if you agree.

Thanks, Roger.

