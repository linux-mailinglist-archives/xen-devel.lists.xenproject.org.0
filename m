Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE26361006
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111411.213089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4k9-0005dt-3y; Thu, 15 Apr 2021 16:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111411.213089; Thu, 15 Apr 2021 16:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4k9-0005dU-0x; Thu, 15 Apr 2021 16:21:25 +0000
Received: by outflank-mailman (input) for mailman id 111411;
 Thu, 15 Apr 2021 16:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tgI=JM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lX4k7-0005dO-3L
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:21:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30b87765-250d-420a-96e6-cd91258bf850;
 Thu, 15 Apr 2021 16:21:21 +0000 (UTC)
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
X-Inumbo-ID: 30b87765-250d-420a-96e6-cd91258bf850
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618503681;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yaTgXHbxWtss1Sz1hnv8d4uwdsysdt73FH6fveeYwpM=;
  b=SiB0dahqsOZhLN9dGmNqsdHWDJnghuRC1BuLedcsayebWiBw3C7JA+8/
   Uz6OZjK0dGQjnkhuybsW9WjBsY5QMKhElBY54QlzImDgfutGxM/we/M5z
   ppCNB0f3XzkQ4Sqnb/p9vocKroYAjTj7OzwlxBPbRrg56BBxsCLiqaiR1
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qdZ+ZkHy4m62mHd92HbBnfT5Rlwp2g5ySDNN5Gt2W65k7MkFC2q4zm3HsE1hgFAx+RuxCnnIeA
 GiE9gao95W1ugix7GZG1t635t+Qc43Fbw/N/QimBU95An7ph0mK/QCJsQUWpsb1mhpERXaWTQd
 xb8QFvcs2BP9ynk+exxHTjRYH7yag6PB1tvCYnlIc97eiMuAMbXQe2aCT1ULUJEuYDreclDXq1
 2+ckYSVwUVYd0RzaGd0h3TZOeAk/4zK3RTWFBPGRzxYxIV3BrUj5x4XrlW8RnRJZ+WYuHKRORK
 gEI=
X-SBRS: 5.2
X-MesageID: 41688739
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bKlV96N2Suc+rcBcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFfLM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MFzxGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rciK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW87Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqwu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjwwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW00pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/TvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF363ACyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/ZpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/koNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUD8qg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJwfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3uinHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczq8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Std+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rdkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXCvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmRSae+jQuUIqk1xX/DFhmBrM4+GdkRbmNHADFxbYjJVQVSRUKV6Sg6
 3+gLOl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41688739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui1FjuFCk+UsUfhZFI+u3+dyrqh2Qiuq/Y5NfT7YC8oXOHAkLEaZoLmF8+cZlWS/TNSzkxOufci8pxttiTyA7wCTIqjPlB1hbA3bdUihkgl2YQxEcgTXtaVrW3vgjUkD0WTjTdm2aGPjvL/5H2FQMnXAkLzuRNLM8rEeU4IaW4IdaSlSVZ+mgB5fWjZ+TEhQA6uzG9p4MEBWs6cQjOc7npbLgOALYC8Hjn6EnosMEA3/0J5Rm6m6iMJ2f5oyvDBdY2Ap7Xwe+nBxvpbaulCXRRaTPDVDTGH17AY62UUJskfwGOday4qYuMGPaO1mU/ep6hnHRvr4S6k0YhuKu9cvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaTgXHbxWtss1Sz1hnv8d4uwdsysdt73FH6fveeYwpM=;
 b=ETWSmTctGHGfL2QZkQ9nsXpV8RW0cqmoHJLsYkj91CgTiyof6YsHSJ/jWJUGK/FeVxl1AKAwF9H/RzmBLP1KJ1/cVVLTI/7qDmnZ9l8p7bEaEv5jOeG+t3PITQyTya8197xtpNYec8oqQx8mMR2VfU4zy5AmyshdW+U+DzGV5osEBIGXVYFNhM/bIld1jiNHBRuLG4fXOXIhJ3LemreEugS3Apl1yigYiLxeOr6x3+ir+vrOEnSptOgeTUer4EXSHgVujGcQcDmt/HbAeeVDTPjQ2rhc4Dsd26XVWeiETGRRW3KlgYUKWjpu4GCybj1fGzvGICb1piJPC8gIlFOJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaTgXHbxWtss1Sz1hnv8d4uwdsysdt73FH6fveeYwpM=;
 b=wpAgV1IY7VN9u0G0n6j8CsS6zS2xlNyBaGx+C1uYjZsHwEGXpDd0tkqnhpEYfmu/myoTYd67XffxwGPXL7eq9uUauJa3FY+4wBBz/Yo23Ii8ucj3b/jZnZin1ZBcGUbZueFuwC9ROZCuL7My5bnjHg0S97nIUfOsqVAkY6PmdyU=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
 <21c00073-86a8-a040-fa40-e99e2fb434eb@citrix.com>
 <213c3706-5296-4673-dae2-12f9056ed73b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: x86: memset() / clear_page() / page scrubbing
Message-ID: <843e5c66-65e9-3b0b-8bcb-ad1d7df89d78@citrix.com>
Date: Thu, 15 Apr 2021 17:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <213c3706-5296-4673-dae2-12f9056ed73b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16ae1f7c-6ed0-4b2b-af4e-08d9002a7ed0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57760436EF88023E4507F873BA4D9@SJ0PR03MB5776.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NI+jGLFcLqmFO8lz3uMyBGwMdKUDEBom6746b8o43kVxU9VVpHTXYfH0quLNG0pgA1dLvpZ0ALRkxot1U32uwewVo/jRfOQ8heR9tf1g/Eq/fx4ObIlEhv6FGiXmOa5yiAWm5pKXqbqDUuGXWLwokfc8tVxeDCIn4wE/5OuOzEOCOyvAqvJJkaPON2VafqW0qNlmKGskthzWra10gSRydErnSjz8Jq5L7B7kRyhRHL50LTVTHmljiCvRrOhG0kDkp9Oy7HHi4jVbMihJnyx+CZndZy4paZQDBwlGYWLESUVtXYTMI8bPRZnfQBKIu2UrsHhyMEU+y5kFFU2cbKSbeyWtA9VcOa64Tq5rJXg2Y7cvWC7c7dejJ4VHfYKVg5PPLt9t8oCzf2u1eM2akg1kc5SsE70jnaG3TvL+ht9VMUCUdHiB5JjEt7xDFc4umz1V3w/ou5jcI9o1XsRtIoyUKHQhwBLMmCsJnVAORA/EZWQ/ludeBF5NfsXNjyXwsRHbYcmUiLhRSysDZzg571KmGZ5J1j30hpxEe9ap8EjtXS3EZot3CU3JPIW4XAxiIppI2eqkO1kWzgaeqaY+ypOZaPDP3BC+kMqHKoRHPd8mXrq9Dbn4IBGdzp9/IjOI8kzWcUQCrhNhAAn8TrjeMv21s6vs53xMD3rdx5zyqpoVMbOBCdFvNEfIYrO5ycWu3O83
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(2906002)(86362001)(31696002)(6486002)(66476007)(6666004)(16576012)(83380400001)(6916009)(38100700002)(53546011)(186003)(5660300002)(478600001)(16526019)(31686004)(36756003)(30864003)(4326008)(54906003)(316002)(2616005)(956004)(66946007)(66556008)(8676002)(8936002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d1JRNzViTzZ5RVZJazN6SmJMMjFTT24vY09aRjRVYXBCdnhVQ2tXdjRWcDMr?=
 =?utf-8?B?OUlTaXFwTnZIK0hvUmIvdVJQbzVCdjNoajNCVjJ5Tm9iUUp1azVQaDhDUVd3?=
 =?utf-8?B?VGUyMW5LMXZUTEM4eFJ4VGJEMUdHMzlLdUxuRUdGU2I3VEdnc1ZYNEVETkcv?=
 =?utf-8?B?VG14QS9ZckpqUkxmQVlIQ1Y1STFxQnlzUmlMT0tZM1UzOVMyK0w5T0lPZUI4?=
 =?utf-8?B?VWx5RWxidGtXdVZUODVwN1dhdElXN1VYTHp2ZWY2ZmwyZkU3d0swZ0NuL2Ry?=
 =?utf-8?B?SXpJcVRIbk1CLzJJZjAvTXpvNmpmZndSS0lTaFk1WThtMDJjelpLeVBBU3lF?=
 =?utf-8?B?d0gwb0E3VC9ZcVAyNGF4NzhBZXpLMDRpZVdzNkhxRGFOUGduaWpsUXBwZ3p4?=
 =?utf-8?B?SjYxajhCbTlCWitvNHpwVmN0aGMwOWdWRnZjMjhra3hLbWhXQjl0aHpuMXFC?=
 =?utf-8?B?ZzYrdkJyeEpBaWxxT3k5OGYzV1RSMWVhVWVDY2dvSy92Zk92cFZtWHlrdm9U?=
 =?utf-8?B?VDM0K280ajBMUndidGVpZ3FkR3NhRFgxanRXdnovMHE2TTZxdHhzYlVKUHdn?=
 =?utf-8?B?WDBsZ2JsaUFWUmRrZ0dleTl1UnRraThIdkdPSDFZMXBnL2ZzNzNDMXNNK3VH?=
 =?utf-8?B?ajFmM2J4blhjeGlVeE1RSFRVVmU2N1pmZlhEaG1tMWdjbnFxaXFtMGlyWS9N?=
 =?utf-8?B?a0lUTUgyOGhkTis1Tm1UVS9kUjFmanJZTk1uUXdFTmFrRko5YXdxRXd1STJ1?=
 =?utf-8?B?YW96ODFIakgvT3dpcWhwM3lrY01YNU51dGdLODcwUURhTFgwRm8wSGVEekNn?=
 =?utf-8?B?SVhaZjdqbjNvYVlLbWtjTzEwbFFWaGI0R0VZczUrenpEVTBIajFld3VIY3NP?=
 =?utf-8?B?Nk4zSVNORFExWlJ3djlkVVQ1MmhYTlNwdk5kRmthaGJDNDBtOUtpZVJhNHZL?=
 =?utf-8?B?cnlrU3RBeFdvOUw4K3VLQ2tXZFNEQ1ZaSW11akN5eGxSWjZCRDkwdmh3bEZM?=
 =?utf-8?B?VVA1SlhaTXJsMmhNUm00RG5Kalg1QmNPTHYyOFF0VENFUGl3WkNOOGRCSWVS?=
 =?utf-8?B?Z0tOMzNuSkRCSk52T0xjdi9ZRmFQQmw5RWhiVit5YW1VYXBGbFJKc2FabnA2?=
 =?utf-8?B?bkxUY1R0ZEFDZ2lhTUN0b1drRkxNdHBnWlRPTURSa0l3amFwZkdTSkp2SHQ0?=
 =?utf-8?B?dm1ZYlhFN1FvWHdVTlBwTDFIV1ZRM0x2bDFaK3hkUHBsUHBHVk1qSTVnQUxW?=
 =?utf-8?B?b0I4bGhtbEdKQ0F2QUR0L0kzVHp4aW41QXh6OG5UMzREZU9PbFRiTGY2YzF6?=
 =?utf-8?B?Tm9FTC8yVEZMQ3p4OXpWMVlhQWxIYnZ2TE9YTlRDdlNzYy8zeGVWdU9FWFp1?=
 =?utf-8?B?RUNuYjZQYjJIbElJb1hjNUlVWkpsMG8wanF4dHFCK09QUzR1LzdPaFlqMzFN?=
 =?utf-8?B?VnUvSlkyWGZtL2dBbHJJNjJPeVlOQ3g2SG44cHJRWFh4Sndjck5SbFV5UVd6?=
 =?utf-8?B?Q2tkTWJVcHczUmY4Z0UrZWpvaEUxVE5ocmx0a21CR0lQUk5RVS95QWRGeTlG?=
 =?utf-8?B?czBHWXlYS1VvalFjVkZ0M0I1b1l3LzQ2VGEwTnZNSi9MbkRYaHF4VTF3MDcy?=
 =?utf-8?B?RENDVnZrbE1pYVZaN1NvajdldmVNL1Z6RGd4UkVlUVpBekRKWlcrSTlKamZW?=
 =?utf-8?B?ODFEK21ackdncnU0NWVUd0tnV01jZmQvUWl2RFRMYjMzREpmNzd3d0NFTXZG?=
 =?utf-8?Q?vHsNE/hdY0eGCbmFXSqH10UD8SvUGPNydDbn21t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ae1f7c-6ed0-4b2b-af4e-08d9002a7ed0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 16:21:16.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccdCrhpd1UwQNzDR6Wjq7nhDVVCYdu9ELbI9hY7A3kQI5XCdIVO0Swle3sHhydnmGw+snhP+dsraquIRYAdMKoOVmLtqRLF1zpAWFkBfaG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5776
X-OriginatorOrg: citrix.com

On 14/04/2021 09:12, Jan Beulich wrote:
> On 13.04.2021 15:17, Andrew Cooper wrote:
>> Do you have actual numbers from these experiments?
> Attached is the collected raw output from a number of systems.

Wow Tulsa is vintage.=C2=A0 Is that new enough to have nonstop_tsc ?

It's also quite possibly old enough to fail Linux's REP_GOOD check which
is something we're missing in Xen.

>> =C2=A0 I've seen your patch
>> from the thread, but at a minimum its missing some hunks adding new
>> CPUID bits.
> It's not missing hunks - these additions are in a prereq patch that
> I meant to post together with whatever this analysis would lead to.
> If you think I should submit the prereqs ahead of time, I can of
> course do so.

Well - its necessary for anyone wanting to compile your patch.

All the bits seem like they're ones we ought to mirror through to guests
irrespective of optimisations taken in Xen, so I don't see a problem
with such a patch going in stand-alone.

>> =C2=A0 I do worry however whether the testing is likely to be
>> realistic for non-idle scenarios.
> Of course it's not going to be - in non-idle scenarios we'll always
> be somewhere in the middle. Therefore I wanted to have numbers at
> the edges (hot and cold cache respectively), as any other numbers
> are going to be much harder to obtain in a way that they would
> actually be meaningful (and hence reasonably stable).

In non-idle scenarios, all numbers can easily be worse across the board
than as measured.

Cachline snoops, and in particular, repeated snoops during the
clear/copy operation will cause far worse overheads than simply being
cache-cold to begin with.

>> It is very little surprise that AVX-512 on Skylake is poor.=C2=A0 The
>> frequency hit from using %zmm is staggering.=C2=A0 IceLake is expected t=
o be
>> better, but almost certainly won't exceed REP MOVSB, which is optimised
>> in microcode for the data width of the CPU.
> Right, much like AVX has improved but didn't get anywhere near
> REP MOVS.

The other thing I forgot to mention is the legacy/VEX pipeline stall
penalty, which will definitely dwarf short operations, and on some CPUs
doesn't even amortise itself over a 4k operation.

Whether a vector algorithm suffers a stall or not typically depends on
the instructions last executed in guest context.

Furthermore, while on the current CPU you might manage to get a vector
algorithm to be faster than an integer one, you will be forcing a
frequency drop on every other CPU in the socket, and the net hit to the
system can be worse than just using the integer algorithm to being with.


IMO, vector optimised algorithms are a minefield we don't want to go
wandering in, particularly as ERMS is common these days, and here to stay.

>> For memset(), please don't move in the direction of memcpy().=C2=A0 memc=
py()
>> is problematic because the common case is likely to be a multiple of 8
>> bytes, meaning that we feed 0 into the REP MOVSB, and this a hit wanting
>> avoiding.
> And you say this despite me having pointed out that REP STOSL may
> be faster in a number of cases? Or do you mean to suggest we should
> branch around the trailing REP {MOV,STO}SB?
>
>> =C2=A0 The "Fast Zero length $FOO" bits on future parts indicate
>> when passing %ecx=3D0 is likely to be faster than branching around the
>> invocation.
> IOW down the road we could use alternatives patching to remove such
> branches. But this of course is only if we don't end up using
> exclusively REP MOVSB / REP STOSB there anyway, as you seem to be
> suggesting ...
>
>> With ERMS/etc, our logic should be a REP MOVSB/STOSB only, without any
>> cleverness about larger word sizes.=C2=A0 The Linux forms do this fairly=
 well
>> already, and probably better than Xen, although there might be some room
>> for improvement IMO.
> ... here.
>
> As to the Linux implementations - for memcpy_erms() I don't think
> I see any room for improvement in the function itself. We could do
> alternatives patching somewhat differently (and I probably would).
> For memset_erms() the tiny bit of improvement over Linux'es code
> that I would see is to avoid the partial register access when
> loading %al. But to be honest - in both cases I wouldn't have
> bothered looking at their code anyway, if you hadn't pointed me
> there.

Answering multiple of the points together.

Yes, the partial register access on %al was one thing I spotted, and
movbzl would be an improvement.=C2=A0 The alternatives are a bit weird, but
they're best as they are IMO.=C2=A0 It makes a useful enough difference to
backtraces/etc, and unconditional jmp's are about as close to free as
you can get these days.

On an ERMS system, we want to use REP MOVSB unilaterally.=C2=A0 It is my
understanding that it is faster across the board than any algorithm
variation trying to use wider accesses.

For non ERMS systems,=C2=A0 the split MOVSQ/MOVSB is still a win, but my
expectation is that conditionally jumping over the latter MOVSB would be
a win.

The "Fast zero length" CPUID bits don't exist for no reason, and while
passing 0 into memcpy/cmp() is exceedingly rare - possibly non-existent
- and not worth optimising, passing a multiple of 8 in probably is worth
optimising.=C2=A0 (Obviously, this depends on the underlying mem*() functio=
ns
seeing a multiple of 8 for a meaningful number of their inputs, but I'd
expect this to be the case).

>> It is worth nothing that we have extra variations of memset/memcpy where
>> __builtin_memcpy() gets expanded inline, and the result is a
>> compiler-chosen sequence, and doesn't hit any of our optimised
>> sequences.=C2=A0 I'm not sure what to do about this, because there is su=
rely
>> a larger win from the cases which can be turned into a single mov, or an
>> elided store/copy, than using a potentially inefficient sequence in the
>> rare cases.=C2=A0 Maybe there is room for a fine-tuning option to say "j=
ust
>> call memset() if you're going to expand it inline".
> You mean "just call memset() instead of expanding it inline"?

I think want I really mean is "if the result of optimising memset() is
going to result in a REP instruction, call memset() instead".

You want the compiler to do conversion to single mov's/etc, but you
don't want is ...

> If the inline expansion is merely REP STOS, I'm not sure we'd
> actually gain anything from keeping the compiler from expanding it
> inline. But if the inline construct was more complicated (as I
> observe e.g. in map_vcpu_info() with gcc 10), then it would likely
> be nice if there was such a control. I'll take note to see if I
> can find anything.

... this.=C2=A0 What GCC currently expands inline is a REP MOVS{L,Q}, with
the first and final element done manually ahead of the REP, presumably
for prefetching/pagewalk reasons.

The exact sequence varies due to the surrounding code, and while its
probably a decent stab for -O2/3 on "any arbitrary 64bit CPU", its not
helpful when we've got a system-optimised mem*() to hand.

> But this isn't relevant for {clear,copy}_page().
>
>> For all set/copy operations, whether you want non-temporal or not
>> depends on when/where the lines are next going to be consumed.=C2=A0 Pag=
e
>> scrubbing in idle context is the only example I can think of where we
>> aren't plausibly going to consume the destination imminently.=C2=A0 Even
>> clear/copy page in a hypercall doesn't want to be non-temporal, because
>> chances are good that the vcpu is going to touch the page on return.
> I'm afraid the situation isn't as black-and-white. Take HAP or
> IOMMU page table allocations, for example: They need to clear the
> full page, yes. But often this is just to then insert one single
> entry, i.e. re-use exactly one of the cache lines.

I consider this an orthogonal problem.=C2=A0 When we're not double-scrubbin=
g
most memory Xen uses, most of this goes away.

Even if we do need to scrub a pagetable to use, we're never(?) complete
at the end of the scrub, and need to make further writes imminently.=C2=A0
These never want non-temporal accesses, because you never want to write
into recently-evicted line, and there's no plausible way that trying to
mix and match temporal and non-temporal stores is going to be a
worthwhile optimisation to try.

> Or take initial
> population of guest RAM: The larger the guest, the less likely it
> is for every individual page to get accessed again before its
> contents get evicted from the caches. Judging from what Ankur said,
> once we get to around L3 capacity, MOVNT / CLZERO may be preferable
> there.

Initial population of guests doesn't matter at all, because nothing
(outside of the single threaded toolstack process issuing the
construction hypercalls) is going to touch the pages until the VM is
unpaused.=C2=A0 The only async accesses I can think of are xenstored and
xenconsoled starting up, and those are after the RAM is populated.

In cases like this, current might be a good way of choosing between
temporal and non-temporal accesses.

As before, not double scrubbing will further improve things.

> I think in cases where we don't know how the page is going to be
> used subsequently, we ought to favor latency over cache pollution
> avoidance.

I broadly agree.=C2=A0 I think the cases where its reasonably safe to use t=
he
pollution-avoidance are fairly obvious, and there is a steep cost to
wrongly-using non-temporal accesses.

> But in cases where we know the subsequent usage pattern,
> we may want to direct scrubbing / zeroing accordingly. Yet of
> course it's not very helpful that there's no way to avoid
> polluting caches and still have reasonably low latency, so using
> some heuristics may be unavoidable.

I don't think any heuristics beyond current, or possibly
d->creation_finished are going to be worthwhile, but I think these alone
can net us a decent win.

> And of course another goal of mine would be to avoid double zeroing
> of pages: When scrubbing uses clear_page() anyway, there's no point
> in the caller then calling clear_page() again. IMO, just like we
> have xzalloc(), we should also have MEMF_zero. Internally the page
> allocator can know whether a page was already scrubbed, and it
> does know for sure whether scrubbing means zeroing.

I think we've discussed this before.=C2=A0 I'm in favour, but I'm absolutel=
y
certain that that wants be spelled MEMF_dirty (or equiv), so forgetting
it fails safe, and code which is using dirty allocations is clearly
identified and can be audited easily.

~Andrew


