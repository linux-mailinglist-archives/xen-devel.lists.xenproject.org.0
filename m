Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951053056FD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75866.136744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hAT-0005yh-2h; Wed, 27 Jan 2021 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75866.136744; Wed, 27 Jan 2021 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hAS-0005yH-UF; Wed, 27 Jan 2021 09:31:16 +0000
Received: by outflank-mailman (input) for mailman id 75866;
 Wed, 27 Jan 2021 09:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4hAS-0005yC-As
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:31:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88812854-7505-4e09-b347-f6d01ebf1452;
 Wed, 27 Jan 2021 09:31:15 +0000 (UTC)
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
X-Inumbo-ID: 88812854-7505-4e09-b347-f6d01ebf1452
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611739875;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h5qLvc8Frt1pIrxCjFLNsZmiEUrdr2BghLc0KrUpxnU=;
  b=hOl06j2bIh6ryI+yoZrn85eiWW5nh1CvdE7s1/9jWPZqeah6p2B4PKUe
   kJP8uv72g88wTKwL+7jAm2jyxG/breLgduJXP6Zq1nAPSD37hf0pMrn4J
   7PHsOkqhlyDONO1BKCqLfboe88tQ02CHPoegIx5Bt9yneAYyywH4InICy
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DIxG7KKluWWupACOcVEzpwxlTaJeI5kr7LC3DoQBr0bj5xwLNZuzzyccznPpF7Ik4VCCZCv5da
 8yN55gqHWx0OoefGgS0K1xOH2hxWx3fSBRrsN+HqVcNLtEawYvem1gjxzxBCwoVPj9Sqwpr3sm
 mCHLQ+yOl6ziVJApHdSkEwjoMQAe/NK42DvMRR2AgjZkVV2zWgUxY9+FlG7/nsESB3u5UcvVt/
 R3DxRCsRRy9SgvR6JaKiKIn/D3JOJc48F4/5rTDvH2exmNfo1sMr32fLMQLPxVSWMOBVILqYvh
 bYM=
X-SBRS: 5.2
X-MesageID: 35989823
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="35989823"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivUgIjD73GYPLMkyNWyvAK6IKf5dtrAKY6f2IQom3epIfFTDzGPAPzJxEfLUUY+iurMRe1wJRp1sWDEEq07gQqP3Svf59lqbckQj0pQVmIFlFfW9XdB3LbQuQrZj7TZujIcb1aXVwU8xINe/PH9jtuEkl7q7QVdt+RQSIxr7kZklvjNOyk0DPiLW/90zAH4zv1MTEzgxwChXO6AGRr5217zDFouPm3e9kg5/zkfkqCAbZH/rcpXgFM41EBui0DGrWSbfC0KaPjxn5HKK2pmtMCzoIMcnbPEMDytQTI7zJEUv424zb1aRRAs4TaN8j7SKvk1tY4mBbkpoaZ4Of9POsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LmC+wzkE5qkbJLvAYcITb7m1A8Qfil5hJXatTpCYMY=;
 b=YksTsUYFHip4BGz0XeYJBL5hlrgvsDvcVPI/wi5DhqTI2JjAgJDe3/UVVsTKmBawPwb2qXXjm/BAAN8k8pxbxcHJ6q7zobVAh1ubDDCaH/AlLoYLdm44RhrfzqJdqMHoZQVS/koKN2BJ0A2IlHdn+zktvNIqCUjjSpQFH1q1zrVY2WDp9Vgj6G/dqkroy9r2qGqT1DRxZv/roZjIkb+q5Y+WueCJg4ig9VGCZcVP7TSOUkto3t0swSZOkAzkbJNPGSrO8spXUQZ1KdP/tX6yD7g/FGukcZaTzv/8YNYoEHeYZJY8S3ouY+uIIFuNKPqTpWBLAOvFwySqQ3EkTdMmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LmC+wzkE5qkbJLvAYcITb7m1A8Qfil5hJXatTpCYMY=;
 b=wirE7U2IATXKtHPn5YqYSF31XrvcJTQ4lKGbAJ7SUXpmCAeyVxWb80ochoBtHY0ozE9JD5aS41sjHKx7upEnxN/HIKbe/nq/zceV17DTkuKgpO5XtsAKcq1vXEQeXtNtgkQEGfuVSwWFoHU/zbhJTARGtgMNdzd4nNtcL0dl4aU=
Date: Wed, 27 Jan 2021 10:31:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH] libs/gnttab: implement on NetBSD
Message-ID: <20210127093107.j3zi65ncjwz7zx4m@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-12-bouyer@antioche.eu.org>
 <20210118175411.lvokghuyvmremdwh@Air-de-Roger>
 <20210126170508.GC8309@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126170508.GC8309@antioche.eu.org>
X-ClientProxiedBy: PR3P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07fe1d4f-e90f-4e4d-5b80-08d8c2a64956
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-Microsoft-Antispam-PRVS: <DM6PR03MB373853919E403957F210ADC68FBB9@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWg9hJb39inYCIZD8sn6+6a5taCnJG0K6eqOgKVieExUdUaE5pLvYGajDAqjEbAEaVbH5eRD2lLXHdBE2EXC2+V4M80Amk1xAGgUgxWlPykaNjOo4+4i61QW8EW1OC2QEzILfLl5QdDuyJWIf6o5+VeoLSaCFvorJuY9bOK5obtBG45TKrMz9rZyV7U7WRI9SRu6My7UWnOanJifE5TNZdZubiIfl+fqYBTiSmp7QGrD8xzbsY94HLRnTNSFkcle8trf/jLH93MAjy/DJqVvnY+tNpziYzpMN4Dt1K3GDxRhb0atzem4HMm6El8I9pvljEDJ4SgzvJl1YJ3SJzrARft01e5IKnpA466lR3qsxzJnJ6lxt8WGadEWvVBJvkYlLecofGfSfYgWknwJBw2Darm2v6yBsWhYZOlQgrYsVzKQ9d4AhatXhm5Tvw4JoWdF42UzTQ6krvXfJkG1lhMBkkh9X3sxeFFfnYTLWrilqGeuYiQp/5GVdWYwf+kqXGkKaToKRzyqx4LiYm2s+pbARQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(6496006)(6666004)(16526019)(6916009)(33716001)(186003)(26005)(8676002)(4326008)(85182001)(86362001)(478600001)(5660300002)(54906003)(4744005)(1076003)(316002)(66556008)(66476007)(2906002)(956004)(9686003)(6486002)(66946007)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajFJWkVEdkJhNE9WRlEwU1pzL2dCU3BZR21ZRkFrNE1zbVZ1ZVQyTUNwUmZ3?=
 =?utf-8?B?NlI3QU0reHAveHd1eHF3QjIyd3A5TEN5WVl2aW44WDJRelJkdUEwTU5kQVpm?=
 =?utf-8?B?RDBVSGw1K3lrK2VDZ2lRTTNKcVE3L214TnZIbk1oQlJqZm9Gamw4NXAxOXVE?=
 =?utf-8?B?QVZGd0YrNThmRnhNeVBBaHB1NmpIK3prUUhwUkplQ1BDL082VzdqYUVUa3hO?=
 =?utf-8?B?UDN1UTZlNmIraWJRUDNZbkx1VjV4NU9QanpSTFJoZzFRTWZEUDRIZEhsUUtP?=
 =?utf-8?B?NldYZUFLNzVub1RmUnJVN0JpZml2eTNXQk90ellYU29yak1vNGxwbUd1b0hJ?=
 =?utf-8?B?QlpIa0JXamNVaVBDbXNjSGwrMitoMEI2NVJFZ2I1OHlackcwNUVwR1Q4K29x?=
 =?utf-8?B?Ykg4TWREbGs5Wko0VU9uMnZJbEsreE9CdnFFYldSRWNvNzZXV3dqMlo2R2hz?=
 =?utf-8?B?amJDR3AwTTROZVc5enVKRmd0VEIxNjZjRTFGb05TZ2JBak1FcEMwRjFsZWVn?=
 =?utf-8?B?dVJUbFhKaU5EbEIwQzAyZGhtNlJIOU90KzJyVnhCQjc2Q1krdUUrMzdhNVVI?=
 =?utf-8?B?VDBzbXBjRnI2clk1SEczejg1eUhTWldIdG1PM3BBSzRYd25tZlB5cEpBVGRQ?=
 =?utf-8?B?VVFaUDlwM2hTT2pMWHJPK0hiQXdobDZsVUJKWE9EWnBDck1xVjFQdS9ycWRC?=
 =?utf-8?B?NWdZViszTElSMm1RNVNaSXg2L200NitkdVM0NnZxY1ZnZGo3dVpzQWJpTllY?=
 =?utf-8?B?ZzlyYmZJNHNFWnlDTndZYUZpaXZHTUNVcG92NTRjRkQvM0N1MDN0UUtsNnNp?=
 =?utf-8?B?TEgrcEUwMk5LRlVmOUdoYjVtTkc2N29pbWU0WDhvOTVDV0cvQUVPU3BjSlNl?=
 =?utf-8?B?djV2bTU4ZytXVzluTWNSaW9KSE0rc2tXQmpsT2gyQll6NHBoL3Y2Z1dwQ1NL?=
 =?utf-8?B?NE8wR2VUdGtjY1BjTHlweUtIeDVCTmpveU9pU3lLWFF6Z25XZjJkbWphRURM?=
 =?utf-8?B?Wm1Mais1V2UvQzFQZ2xydnVPR05SRTZ5a1htQXRyZDZ0NzFlV2tYaXVJdDZF?=
 =?utf-8?B?cFNyMm9Sbjh6Q3V4b0FBK2NKalRMMWxGUDRiMkVIVGU1NjMrN3FtNWlnbENB?=
 =?utf-8?B?YmVDMWVmSDExejVScTV6Z29jNSszVmVMVnZmVDY1M3NHWnJ0SytaOWgvajlR?=
 =?utf-8?B?TkZpR2xObVdwWnQ0YmRzNkF3N2lmZW50RE1ia3Q2b2hWL3EzRllGYVRDZHpy?=
 =?utf-8?B?RFdaYnMxcitiaEJ4OEVUcm8yUzZpZjFWWVZsMmlBQ0ZkZC8zMzFxNjNXZFlY?=
 =?utf-8?B?c1h5WmNuVXFtcDZtU05Sc2xPYkRDLzcycHpYb3M3NXRWUG5adjhpR3Iwdk9Q?=
 =?utf-8?B?YlRZSnk1alB6MjRHY2d2V0V5L28wU2RaTDN3UkdYYkNhZEx2YWJ1cmgxZE05?=
 =?utf-8?B?Nlh2eTlDUUtGYmpBSE5OTUtUVk9CODlvWGRiRjZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fe1d4f-e90f-4e4d-5b80-08d8c2a64956
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:31:12.4855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MrXZEShAFB7c+M9zw/AlaRbZvT6D4aMLmRaQdL3NY+1bTdqn4DSW2r/ly3friXK3LS9WbEstnVi7N+L9/ZN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 06:05:08PM +0100, Manuel Bouyer wrote:
> On Mon, Jan 18, 2021 at 06:54:11PM +0100, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 07:12:32PM +0100, Manuel Bouyer wrote:
> > > From: Manuel Bouyer <bouyer@netbsd.org>
> > > 
> > > Implement gnttab interface on NetBSD.
> > > The kernel interface is different from FreeBSD so we can't use the FreeBSD
> > > version
> > 
> > Since I'm not familiar with the NetBSD interface I can provide much
> > feedback, but you have some hard tabs in the code below which should
> > be removed.
> > 
> > Maybe you would like to be added as a maintainer for the tools NetBSD
> > files?
> 
> Yes, please.

Could you send a patch to MAINTAINERS to that end? As a start just
searching for files/folders that have NetBSD in the name should give
you a list of paths to watch.

Thanks, Roger.

