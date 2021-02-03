Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BB30E42B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 21:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81058.149070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7P4Q-0004UY-Ui; Wed, 03 Feb 2021 20:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81058.149070; Wed, 03 Feb 2021 20:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7P4Q-0004U9-RL; Wed, 03 Feb 2021 20:48:14 +0000
Received: by outflank-mailman (input) for mailman id 81058;
 Wed, 03 Feb 2021 20:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7P4O-0004U4-UP
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 20:48:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68e15af5-dc03-45f9-b444-ecf44685bdf1;
 Wed, 03 Feb 2021 20:48:11 +0000 (UTC)
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
X-Inumbo-ID: 68e15af5-dc03-45f9-b444-ecf44685bdf1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612385291;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hfvo2o5oAnfmFGbVgAajbGLECLlQJM7Qv3dgtr2MtPI=;
  b=W99/6qyQklcEw9Nlr0z0Ow/jGkmI31/kmvzPPLTHaF1mkiBo4Kj99vUN
   Vhb23asivymqHmfmiTKZxdL5O+gOOK4xGioEF9iqhjzKxSs3WJGfSPPuI
   zCoqdrk8mosGNZDszAkHJupwvg2PBKwKQSvg7GZy91K5KtPlowPT60nzL
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J8W5GzqPsHr3Y97JsKDn4XoU0asK6UaQdJx3R/HEl69t6vF9NhijpyFW/6HKFGf+xoLUL5Iizg
 AnfShKY/nMZ7p/qpc13nJ+6mGpg3WnkvDSm1d8Pyg4a/GJjIXkexzIBmESUuddYqPmZco7av/M
 tz8WxeTZ/B23cAw/dmOi1rPClQYic4VaX5TY/NUwfLQlX5Mg0hbea/BZPDrTC7uteAvEBfvdEg
 kF7bafdV6hhhmzL+u5gbyGr905i6BsRhP0oN82EehG8hcaagGR3GOYz+/5mOsF6sH3axaY+nxn
 BPI=
X-SBRS: 5.2
X-MesageID: 36879825
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36879825"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7IteZYoU7f9t+HoNzz7zglJq1LAg7hfUn48ReByZk9r/iBv9cz5fcYUIHAiBeMWduZSRi96D5QNbd9Ws6jQiVd9spgarQqr8op+KGUIn15SqtHWxq0VGM3pjI9+P/ntdo3fHqS7IzfkOdGuDLnsvMvIdPWvs5xzbrzLeNUc7QhErzmdYpUQufGEYqL9jJwUn+1APdfguAplbee0Vf2cOzY5F/e9FxyASeXlHLK6++WzhDGB5TvwvYZKWgOm+6+RcwYT6p9d7ygJ3d+BmXVEsHLXCeCJAk7mtuBlNqfhZvecXlgzrPioJQmOfXoZJTv2EmIIOZftclEYwkigQn+xKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfvo2o5oAnfmFGbVgAajbGLECLlQJM7Qv3dgtr2MtPI=;
 b=NXKYUdfF7PjD4x+iAtt4vsWqhw0mBxNEcQQL5LGDSvIczyloWgrb31bQ6SWd4HezhNI1rBFgiAzgix+5mbJD2OadJfIRVNmvQUiVK/d150oqfHenFSjoFjy6NQyEt2YnatQDMHm/k8FQIf1IPUPV63/6xzF+QRwaTVpt1k0vrZEy1KcRQr/ycCUq3gzGraPIK39Ka976oAZfp2K46ok2obvuCqOHwJNAySujn1ClDapA2TVL2bj1mWc5srfDj7Hw8ThuJKhxB5j7vEnJVz+dHBIEC05I+lca9supAynrbgJlf8ytYF/lulCm8hX6YA+oX9WSZs0Q0trZ9UYgRQLXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfvo2o5oAnfmFGbVgAajbGLECLlQJM7Qv3dgtr2MtPI=;
 b=cB5DeKgTUHygCqXK0G/jsexnynUigX4MwnYTy0uvmofWLTVP+vCL7zMQLpmzbYler9mbIaBFXVfY8hgVgkC/IZpB0VSnVr3NRIN5PEPqCSv1kNji+R7YAzXCnw4xbLzRu3SGRtOJntHFoz22SvConY5RH52g30tjXbju5T2hnRc=
Subject: Re: XSA-332 kernel patch - huge network performance on pfSense VMs
To: Samuel Verschelde <samuel.verschelde@vates.fr>,
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
References: <dc5d60d7-1ada-5eb1-ff91-495d663ca89e@vates.fr>
 <20210118100340.6vryyk52f5pyxgwv@Air-de-Roger>
 <48ac8598-1799-3b80-73c0-210076639fbc@vates.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e7b6c47-2fb3-2231-9bcc-13a036dc0766@citrix.com>
Date: Wed, 3 Feb 2021 20:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <48ac8598-1799-3b80-73c0-210076639fbc@vates.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0410.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::19) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ff521e-502d-4873-33fb-08d8c884ed25
X-MS-TrafficTypeDiagnostic: BY5PR03MB5218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52184E48EE1834E749693E0ABAB49@BY5PR03MB5218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhyMNvQ8smFP5MdYB7jBOrMOfTbtlJPfYnpT6b7v5B4i6OIAQP44aJqKU9uAseNY2bSoySA6pRpx0UjiV+oNf90r7j3LbRd+kxoytEI2die9RNDakKd8SvOfH1zAdsGwbgSQFS/NFd6QUfOKr0g/AbtbWanXbOx3N+A6eIH5pYwyAZ0GFvPqb1SJO9WYYVIn+maVcGx8adDHcmE8oPKvdcUpp6RJfk41Z7JTHOfCbcX3FIP+7SDE4QOCnRfpbzCK1H90BjasyEGg2NFElJlRKGCWG5LAIyy2oeUirdTbsblf35ZcrWzbQK7Mo4qztBZeLS3SCrdueyjIEIprUQ6UIqAGeDtLJ5oWL4Vf5wm/MgCz3KYhefKfMeosYZa7BT7fqq0x8ch2U8qqtfjEjShj+wuCMs71BpZNM2C3dTksMZfmCQnEYXeowmVVln8EmK5suV8382kjGRHOWjaGBbFaZdsSoD7Dqc2p9tLVDuMvkl8LhR9Ccq5mEaoE4F0aL4H9QXlqr35CYw1WLwI9rFJjS/W5ZnQAKs/G8//zeaHOb67Y1KnF+SbPbxvdcPHR3tqBeH+mXOMpA/n1nyW48k56dhtyozECPbhIQ+78M1lq1+umAzQsWZKL0YQcQnzACPz6MsPUkWIxoGnhj+EwrurwdccGaDoanT1Q9JngQrbLerQoRVEzCW78Ur2+qcU9SnEzOt8Cz3HBBJi8V03809prPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(31696002)(66556008)(83380400001)(5660300002)(8936002)(86362001)(66574015)(2906002)(36756003)(31686004)(66476007)(186003)(16526019)(54906003)(6486002)(956004)(16576012)(66946007)(6666004)(8676002)(966005)(478600001)(4326008)(26005)(53546011)(2616005)(316002)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bU54YTBmZXhhYzU1T0VIak9QRHZJTUluNXUrT3BJVE5yUGxRR0EybHpyemJY?=
 =?utf-8?B?N09xa3FZK1VhbFRRUUszbWhNWkZDZWFTdDU4M3BoZHd4NEFSbFc4Um1WT1pK?=
 =?utf-8?B?ajNJbTBwNmZqYTRnUTVZM3NUeGhaTDdCVUx3V25jTTh2MUFXRjlPMjJJbURF?=
 =?utf-8?B?WTNEYkdIOHRQajY4WW5sZ2t4OXJic25Ia3pmRkora2E4K3paSmZhUlZUaVVx?=
 =?utf-8?B?cHlrQWJxVStQblFuSEFnS3N2bUVzZnFUMGtTYjJ0V3p0R1p2MStnQUhzTitt?=
 =?utf-8?B?TGJuRXgvZHMwbUoxdDhlNGhxc1pjNkszbHBIOG9XNEdCTnkvc3NMVlF3VmhI?=
 =?utf-8?B?UkJnTlFpY1FwN3UyNi95UnVxUUZTRG1KTnljemN4TUpERG9HS3B2RFp2cW5x?=
 =?utf-8?B?eTZITGZrbnpZRy9ySzFkcVdpdzlaWWFKTG82K2RubGtDNDBNaWZLQVIwRmtk?=
 =?utf-8?B?bnpCTWt0YzdmRDZBdkdXYzRvMW13dWNrTHdkZzFUV08zclN2cTU1WHFRWS8y?=
 =?utf-8?B?eW1yei9CVFhBRzVLbXFoM2VTMklScXQ3aUtpc3Avbldxa1JTWkNNd1grTlMx?=
 =?utf-8?B?RnRlTXpzMkJnYjJjd25vWjFuVWFlTzVMcGNaWWxVZ0o5aW9pNUlQRE50ZFRV?=
 =?utf-8?B?ME8vL1JPS3M3Y1NhZVVNZk5mT1pvYms4akZvdEpSRXRDQkdCVmlyRFdMYzda?=
 =?utf-8?B?ckhhUnVoWHJoQ0JDMTYybC9wOS9vYnJmU0R5aFQxdDVuRGFRc1d5aVVndmZZ?=
 =?utf-8?B?QytmYkF0WjB6Y2p6d1gyNCtJUG5yd3NNWThpOFhUR0c2b0RQOXNCR2l0cmtN?=
 =?utf-8?B?YktkaDRJelJDWG9HK2I0V2pjNEUreEJsQWpueHhNYjFna051ak5pRlZ4OFVx?=
 =?utf-8?B?Sng3cnMyRTVjbHJSeTZJSmRWWlR5MEJKS0toN2pQZFJqaXFjVHJKZlFIenNQ?=
 =?utf-8?B?MTNDZjlKOEhCNVA5ZDQ5UjlaaU9iNktla3dRUUdzblJXVm5qaDBBekFkWis3?=
 =?utf-8?B?QXBEUzZoaHBHUGVDeGVLVzFnbFpObExUdGNla1FWcXFGdWhqLzdwV2lRd0o2?=
 =?utf-8?B?ZXhqUHF4Slp1eFYyNzZFcUZLeEdiL29DZ1RlOTh0WUxueXBVUXM1c2VPMEtj?=
 =?utf-8?B?U2krWElwYWQvMlJRRnJVdHlCS1BETGtGZ1FESmo4RThDUXRjUlRMZm1SZG8x?=
 =?utf-8?B?UVJMaVlxc2lFTkgrTm8zMzQ5UU1CZ3FxQi9xTTQzM1FIV293ai9BOUdwYnhV?=
 =?utf-8?B?bENEQ3BRM0x3a0FhNEN5NnU0cnRlL2Q1QkltWSttL2FtOFg4cHg2QldVMS83?=
 =?utf-8?B?eUZpNG1kSDh3MlFMWmp0cENzZVAyQkdIYmlnejE2R2tEQWUyYWUza2wzdXRw?=
 =?utf-8?B?dWh4QzFWTm9BejROSXpYbjFtenFqNDh1c2pnMU56RWowWXR3SUgrRUp2L3pa?=
 =?utf-8?Q?4Q5VjwC9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ff521e-502d-4873-33fb-08d8c884ed25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 20:47:31.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxTiVOWS/uIhwnYxs+VH9/wt4E4BpwIpc2kuYhINo9k5iDU/vqqowc4iYAJGLFEtFKEEfhQ0KtoLdXe2n+Q/LuLmOU9FAhR042iD4PeJdI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-OriginatorOrg: citrix.com

On 26/01/2021 15:04, Samuel Verschelde wrote:
> Le 18/01/2021 à 11:03, Roger Pau Monné a écrit :
>> On Fri, Jan 15, 2021 at 03:03:26PM +0000, Samuel Verschelde wrote:
>>> Hi list,
>>>
>>> Another "popular" thread on XCP-ng forum [1], started in october 2020,
>>> allowed us to detect that patch 12 from the XSA-332 advisory [2] had
>>> a very
>>> significant impact on network performance in the case of pfSense VMs.
>>>
>>> We reproduced the issue internally (well, we reproduced "something".
>>> The
>>> user setups in this thread are diverse) and our findings seem to
>>> confirm
>>> what the users reported. Running iperf3 from the pfSense VM to a
>>> debian VM
>>> gives results around 5 times slower than before. Reverting this
>>> single patch
>>> brings the performance back. On the debian to pfSense direction, the
>>> drop is
>>> about 25%.
>>
>> pfSense is based on FreeBSD, so I would bet that whatever performance
>> degradation you are seeing would also happen with plain FreeBSD. I
>> would assume netfront in FreeBSD is triggering the ratelimit on Linux,
>> and hence it gets throttled.
>>
>> Do you think you have the bandwidth to look into the FreeBSD side and
>> try to provide a fix? I'm happy to review and commit in upstream
>> FreeBSD, but would be nice to have someone else also in the loop as
>> ATM I'm the only one doing FreeBSD/Xen development AFAIK.
>>
>> Thanks, Roger.
>>
>
> (sorry about the previous email, looks like my mail client hates me)
>
> I would personnally not be able to hack into either Xen, the linux
> kernel or FreeBSD in any efficient way. My role here is limited to
> packaging, testing and acting as a relay between users and developers.
> We currently don't have anyone at Vates who would be able to hack into
> FreeBSD either.
>
> What currently put FreeBSD on our radar is the large amount of users
> who use FreeNAS/TrueNAS or pfSense VMs, and the recent bugs they
> detected (XSA-360 and this performance drop).
>
> Additionnally, regarding this performance issue, some users report an
> impact of that same patch 12 on the network performance of their
> non-BSD VMs [1][2], so I think the FreeBSD case might be helpful to
> help identify what in that patch caused throttling (if that's what
> happens), because it's easier to reproduce, but I'm not sure fixes
> would only need to be made in FreeBSD.
>
> Best regards,
>
> Samuel Verschelde
>
> [1] https://xcp-ng.org/forum/post/35521 mentions debian based Untangle
> OS and inter-VLAN traffic
> [2] https://xcp-ng.org/forum/post/35476 general slowdown affecting all
> VMs (VM to workstation traffic), from the first user who identified
> patch 12 as the cause.

Further to this, XenServer testing has also observed a ~5x drop in
intrahost VM->VM network performance between PV VMs running under PV-Shim

As one specific case has been bisected to patch 11, its obvious that
FreeBSD's netfront is hitting dom0's new spurious-event detection and
mitigation.  It is also reasonable to presume that the other ~5x hits
are related, which means it isn't behaviour unique to the FreeBSD netfront.

The next step is to figure out whether the event is genuinely spurious
(i.e. the frontend really is sending too many notifications), or whether
dom0's judgement of spuriosity is wrong.

~Andrew

