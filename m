Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65E4429D2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 09:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219789.380783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpT9-000052-TE; Tue, 02 Nov 2021 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219789.380783; Tue, 02 Nov 2021 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpT9-0008Ti-Pf; Tue, 02 Nov 2021 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 219789;
 Tue, 02 Nov 2021 08:48:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhpT8-0008Tc-P7
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 08:48:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a89ed3b6-3bb9-11ec-8553-12813bfff9fa;
 Tue, 02 Nov 2021 08:48:33 +0000 (UTC)
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
X-Inumbo-ID: a89ed3b6-3bb9-11ec-8553-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635842912;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qNYhPe6+IOk3qWrrB2tkzk0okd4cYNQFjP78s8xVD+E=;
  b=ZHU0aL7vcn892/3YEWWoNsUZCy0RkI167npvS5EUqtmkbmp7QhNvUNYy
   ZGRzHq50n4W0ooSYJz7FRHneK0aqSvolLzirHdCutiHgRhoM9le56uXpZ
   GEFt0ia0qFlauejDSQSUckosG9GXiAEnKVOCAA7uFug7K1yEyzacinZb8
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0MFhZP2WmPEWDRFKb4CUXUoj8/INKiWBPFOINljpJ9sU47O/Ep42IlPcSA92B2M+cgK0jiCBoG
 upo/Sq0OK9hvabS61k3/Ke+HGpfS4eZoQkf2IpEu+Ro73J1btuJvIdxl6MkftDGYmZp5EIqOAr
 1ppas9TCK9vycM/py89uUaXab2BZ+KGxkG9f6PoApLGNK65nEZBPY+72zjIY0WrvKEI1pYXaYo
 MClva39pDmkQ0ambeiKlfMYIkEJ/0dVUebpRRYloEG8kIAPhWM73RmCAxUR65SyGc64funAxE+
 PdNRNVs29iEUoQ8VcMLvIIAN
X-SBRS: 5.1
X-MesageID: 58791224
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D4Y84qCxd3eZzBVW/5jkw5YqxClBgxIJ4kV8jS/XYbTApDIl0mQGn
 2ZOXjyEb/eCYGSnctp1boq+8RwD7ZfXmNYxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540Ug7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pguJxNB18
 fZ3lI2zGDwyHamSuMlHekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWVtIYChmtYasZmD9LyW
 OQYbGFVdRH/XERpIH4NAs0ug7L97pX4W2IB8w/EzUYt2EDI1xB42rXpNNvTe/SJSN9Tk0Leo
 XjJl0zjCxEHMJqEyDyK8lqlnOqJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80g0qoKsp/UqnVO7UWRGivWWEtR4RXdlXO+Ai4QTLwa3Riy6bG2wFQzhpeNEg8sgsSlQC3
 FKTg8ngAzAptbSPUG+c7Z+dtzb0Mi8QRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPXYJzGrw
 zSzjxIflrZCttUo0/ub0Aru1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRenxv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/3lP2PcebgKrrUqzGKJQM8/y/D5g4ifIVOvBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbxAju5xnn9knzqPLXwe8/hB+eDHDJJyYexdWGZik8hjtP/UyOkr2
 48HXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq72t/pCLMRrJeFPGS4K5accc
 sTpsv6oW5xnYj/G5y4cfd/6qoljfw6sngWAI2yuZz1XQnKqb1WhFgbMclS9+S8QIDCwsMdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T83q0tPsUBCRTf3T/Gh
 QyYNggV+LvWqIgv/diX2a3d99W1E/FzF1ZxFnXA6erkLjHT+2eumNcSUOuBcT3Hennz/aGuO
 bdcw/3maaVVl1dWqYtsVb1syPtmtdfoorZbyCViHWnKMAv3Wu8xfCHe0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw55PO6N4u4Zx2vJ5vMvLUSkuCIupOibUV9fNgWngTBGKOcnK5ssx
 OostZJE6wG7jRZ2YN+KgjoNqjaJJ30EFa4mqosbEMngjQ9ykgNOZpnVCynX5pCTaooTbhl2c
 2HM3KeS1a5BwkficmYoESmf1OVQsp0CpRRWwQJQPF+OgNfE2qc60RA5He7bleiJIsGrC95OB
 1U=
IronPort-HdrOrdr: A9a23:JR57YaHP7nFGc3zVpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="58791224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlLVKL82c1DDO85hNz1fMZkqYkfRYfJDJ5xvfeKFULyewNkCxaPyM67I29mafIAjkzj1h7Lvw1oWRbt+n9nCpfHB4XZzvSKEoJFOFTaMmRtbo4PmkxykGI4RhFbLU5Bv+fLoxcBO8HuBm1XT0hqBqM2xeumVHakpVcnRG8ESYgQc+DUJW7oVkjrA1yUnlp7YJPtcOdJfmjtmVxnpM6hNo23yrmwToBHJzWDHLnkSeqUNyoeN65agykpET5qaJhhC/B356atYUyaqHdxIkRlw4wbq89u6E08Km6T2rNChE4OyrCeT5bfQXCStllzeX2GVT4hFdJf3C2b28se7jtwlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQfaRdk0WQYaBpJN3Gi0z2LuijTg4/LxYun6RXSlJ8k=;
 b=g4IW1LzxyYcNkchXzmVmynyCwFyCXtFnO33xSHjuUKWbU6K223w5Ou2U7SoPSA4Ob3DKbd8FOYZm5dSaaC5QxNxVqOidnk74VcwLhUAwIOGaDuzrWZIFgpW7U5hd4oqIZUgQgj0ANWN/P8/Vje50jn/oZtmhRJ1sWSEIQ/FQ1/jQJx/iLdhyIDV3Pl1Tvroeg0CPFaAS+6+ZFQMMhLSHaqvC+c/br9ZjOqaUNVh1rWQXkhcvOr37xBCgwkRqYe3WJwacFPQeFhXPWizcPi93EQBjJ3Yh43FrCuY3vBgvvWbIQA48ttaPD6t71c3lP61QdKOVcm4KlMRzc4ftYYRdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQfaRdk0WQYaBpJN3Gi0z2LuijTg4/LxYun6RXSlJ8k=;
 b=G7E7VRjTUXYYKVVSA+s1h2Q8qlOO8mJIymwrhECEhT4wQc7hgi0zN6Eh/OcRe+QJYodiF2q1IECKx1SERW0NFaXBq2dDNeROwLo40BU5tMYD/viC3G9+wrxzoqPalL6XOmD2Y6mzlFyCMTR5VVUFHwNIygJh5tBoIeoI8auld+4=
Date: Tue, 2 Nov 2021 09:48:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YYD7VmDGKJRkid4a@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
X-ClientProxiedBy: MRXP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09eb411b-d49b-4a67-0ba8-08d99ddd89d9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3833:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3833F6394A22F3220BA664948F8B9@DM6PR03MB3833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 462WiVkt4TpjFY3xsL0Z68SxaC+2Na0/p1D0AV6FwLt0vbuQM9DzbZkLauH9DrjY63lxG0f27tsPoTT5ndmbX7xkAXnpnhQbmcnij/34Y1ZIovd3vJ+nk9wbyWvNoDKa7mXENNTYv+53D1rIzTDWqNtvllbvvTJfrUqgBYVstOoDBrhgdBwBCt89PEzmpdqGnYXgLDzjTYUK3VYfI0XzptiL2+eFQj6aSvxhhpfv831KtWKUw5U0pazqRiZkFz5gzsMjSXRH/N8P+fJ1ryF1Zt86jHwCRBiirADVW2jFaqNp7XTMxQpkBZ10E8gR4G6CpaDS8ee74tzzRlkLZhD4UyhNy8OzvKyoT+LMtpt4y5FuyQd9YstEVembF1XxPLI4VAqYKHqZNQz8mNfFaruXcfeF4RGBPtUYeXTkg4kP5ZG2qMZh/K7UU2nE5lS711RCC09/25LQUZ1y+eCEq7eCiY+3bkf2dfhNDBq3f9euBNH8X9cdjwXRBpPgsqnikAcV8G/XMc2HlQ4JddH+rnLM7OpnWBRC6jqSZ/fyge6OuVJ4OXNfK5xc214oac1gAMOJX7pS4iIjBAjyU4mgrVJRobhX3YZH2NpVM/hIy9mvuJL7kTLv8A5ORPLAKWW7xuRPiBffcnpWVCJ1TKuYHMuwmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6496006)(85182001)(956004)(8676002)(6486002)(6666004)(53546011)(82960400001)(83380400001)(66946007)(33716001)(66476007)(316002)(54906003)(6916009)(26005)(4326008)(2906002)(38100700002)(5660300002)(66556008)(508600001)(186003)(8936002)(86362001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NIY3dTU3p5NTJVZEZ2c0c2R3RwY0pCclJla3ZaM0hualEvKzBSMEE5WTZG?=
 =?utf-8?B?aFpCOUFvR1ZoVzVOaFRuaE4wd0JuTHhJdUZPL25pQ0V4SC9VdzlwMjJUK1FM?=
 =?utf-8?B?cm4xa0JxamFvTE9vYXlMVUJuSUg3cXFuWnlydlE3dUpBaUdPVUpBQ2dRYm42?=
 =?utf-8?B?dm5EbE5xYnNnem1tamM3ZDZRQVdDaXFXb0t4bFNpOC90aklMVVdzR0p3Rjhl?=
 =?utf-8?B?YllKREtVMnJ6VjdmN1Q0M3ZtcWRMUDF2ZVk3R3dsbDFDR1ZwRzljTDZXSjJR?=
 =?utf-8?B?aS8wZE51TUpWcldCZ2Q5dWs0ZXRoQU53am9JN05MZm1nYmpYRjB2QXpTUTc4?=
 =?utf-8?B?dHFEdXc3K0k5anVoNjB2b3hqc2ZoMGZJd1FwT1JueWJnNE0xWFp5b2dFajJ4?=
 =?utf-8?B?VDBNYUtPSzZhazFSdktqVGtlME4zWFBoSktwTytQS0FaNnBzdjZlQnlZaVBN?=
 =?utf-8?B?ODROb3N1MXRhRElEL3pvdHBPb3B4ODBPYVZ1dHFOS3dNRElTdjJwbUx4S0hO?=
 =?utf-8?B?Q25CemtVVWNaaS80WXJrNzExZXVRZjZFelBwVGp2ZjRHd1ZHb0JockEyNkow?=
 =?utf-8?B?NC9scHd5Z2pFKzNhTUdSUVo2czVRY0JJUXFycWR0VG84NlNRNEtFcUdQZmF6?=
 =?utf-8?B?Q2xRbGdHZjZ1T0hPWmFQWisrakRwcjlUVjBsVzRRdkloUm5zMk02ajVvYmJR?=
 =?utf-8?B?dkovWkhWYURtUkdXaUJ6T3dEOHRvc0tqMGZENXpod1RpekxDcHJ3RUh3YzZ5?=
 =?utf-8?B?dWZxcElpWkozeTVPekxUK3dDcGJnNEN0Rk1acHNmbUlwMWVaNkhVcDB5dzFs?=
 =?utf-8?B?RUJSN2JveHhsQXV1dHM5TERnKzgwMVUvdjdkb1FYVmtoMTlmTHhwZjFwVlV2?=
 =?utf-8?B?WFU3MXgvYm81QnE0TDlyWVZLbVlCVGswMS95VkJZd1NLQ1oxc0dWQ0RzTE4w?=
 =?utf-8?B?L2k1Nm5HZ2twMEEvYlVHQlBBVXNLS1lCTWtRWUxPWFdXbmpna0dHMzVEdWZZ?=
 =?utf-8?B?WWVVYlorRFpmcjVwQWlOODVqQnpoRFozN1Z3N0huMmcwMVVnUDFldWw4RVVn?=
 =?utf-8?B?TG53NnhyTHVDT0lFUXFqcTNSUThhWjZYSzMwZFJ1OVN3VHllMVJQVHduU2g3?=
 =?utf-8?B?cXo5WWUrRzdMcmk2NEJjeXhLai96WFZUZklYSVVIQkZ5SkVYb29xZnVXSzFM?=
 =?utf-8?B?UmNxTTdTWk1RcThpL3Q5VndlMUc2OEhpQVRVZldta21rYVFQVTZqbGt0S1Rs?=
 =?utf-8?B?MmNTTzdxWk9LV3JlbTQwczh6OGdZQzJkejl6WGVuQjhHT1ZheXlnWkVwTktn?=
 =?utf-8?B?OHlUandLb29ndldabGI1YWFVaWV5dGh0eFpTRG9tV2R5eldWQWMwQUFRdCs4?=
 =?utf-8?B?ZmxxS2pYdUpkcFd5cGx1VnVybExMeS8rVEprVEFLTVBqYjNqRk82VzJreVNm?=
 =?utf-8?B?S21TM1BkMFBHUFNObEg3YkFDSXg2VU5HNW9VVVlDOTN6N01xem5LMzUxTEdo?=
 =?utf-8?B?dXl5eEJIOG9GNmljMUhMWHBwT3k0eFZmaDZxVlRxRzRsdS9HZXl1S1N2MGlB?=
 =?utf-8?B?a1lJTGJEMEpkTTJjUThDQ3NKZFlmb3V5dVgvUXJBb05HWjJYOGRnemlyZC8y?=
 =?utf-8?B?OVZtbWg4UDVKVk1OdEdKajN5RGs3SG5ISytKazY5U1c1NHhGN3A5aUJTSFBR?=
 =?utf-8?B?LzlJVXNpM0RWV3BaSkMrV1JubDkxVVNHWFMxbTNOZnh4dXhqeWlJbWNxekNL?=
 =?utf-8?B?ZmJFQmlyTVNSVVFXODFWSjNUMUd2QmlwWG5VOTA5U0RNL29BRlNyMWd1NlNI?=
 =?utf-8?B?SlZiSXN2K0pBdnZjVDFiUk93KzB2ZVRUbzNGdEgwSDczMDhmeldUbitjd0Vr?=
 =?utf-8?B?L0JhUGlXWUFWZ2I0SVdjdnEyS0ZhZ0VKNFplYXhGK3hrU0ZlRDVxVmRCTUxT?=
 =?utf-8?B?R1RmTllWN2plTGNOeGtIMEQ1dDRJdTc0SFYwS0hhUHRLcmpUcHQ3U2hEeDFB?=
 =?utf-8?B?MjB1RlhaMSs3TUtjN2hBOERQdFVUNFVkSHFNemNSRTVkNTFUMEpVNlR1UEdO?=
 =?utf-8?B?MGNUaUZEMXVGMjBjQlhmOVAzRHROWk9PTVZXK3lRS2U2NnkwNUZqek0zenNT?=
 =?utf-8?B?UkFlWXJUVEh3SmpQN0l0aUVLdnJTbERnUEdSQ1FrVUlTc0JVVHpSMEVxbm8z?=
 =?utf-8?Q?okBMZya3un/d6s4TY8pN0tM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09eb411b-d49b-4a67-0ba8-08d99ddd89d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 08:48:27.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjvV61qWP2S9HJaLzf5jdsr9IvqUnWpGVfCHZrfWpNsmeZrlP3uuv/xQDzhTtZkSWLfYKgGP1wFCLfe5Wa7Tgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3833
X-OriginatorOrg: citrix.com

On Mon, Nov 01, 2021 at 06:14:40AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 29.10.21 10:33, Roger Pau Monné wrote:
> > On Thu, Oct 28, 2021 at 05:55:25PM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 28.10.21 19:03, Roger Pau Monné wrote:
> >>> On Thu, Oct 28, 2021 at 02:23:34PM +0000, Oleksandr Andrushchenko wrote:
> >>>> On 28.10.21 16:36, Roger Pau Monné wrote:
> >>>>> And for domUs you really need to fix vpci_{read,write} to not
> >>>>> passthrough accesses not explicitly handled.
> >>>> Do you mean that we need to validate SBDFs there?
> >>>> This can be tricky if we have a use-case when a PCI device being
> >>>> passed through if not put at 0000:00:0.0, but requested to be, for
> >>>> example, 0000:0d:0.0. So, we need to go over the list of virtual
> >>>> devices and see if SBDF the guest is trying to access is a valid SBDF.
> >>>> Is this what you mean?
> >>> No, you need to prevent accesses to registers not explicitly handled
> >>> by vpci. Ie: do not forward unhandled accesses to
> >>> vpci_{read,wrie}_hw).
> >> I see, so those which have no handlers are not passed to the hardware.
> >> I need to see how to do that
> > Indeed. Without fixing that passthrough to domUs is completely unsafe,
> > as you allow domUs full access to registers not explicitly handled by
> > current vPCI code.
> Well, my understanding is: we can let the guest access whatever
> registers it wants with the following exceptions:
> - "special" registers we already trap in vPCI, e.g. command, BARs
> - we must not let the guest go out of the configuration space of a
> specific PCI device, e.g. prevent it from accessing configuration
> spaces of other devices.
> The rest accesses seem to be ok to me as we do not really want:
> - have handlers and emulate all possible registers
> - we do not want the guest to fail if it accesses a valid register which
> we do not emulate.

IMO that's not good from a security PoV. Xen needs to be sure that
every registers a guest accesses is not going to cause the system to
malfunction, so Xen needs to keep a list of the registers it's safe
for a guest to access.

For example we should only expose the PCI capabilities that we know
are safe for a guest to use, ie: MSI and MSI-X initially. The rest of
the capabilities should be blocked from guest access, unless we audit
them and declare safe for a guest to access.

As a reference you might want to look at the approach currently used
by QEMU in order to do PCI passthrough. A very limited set of PCI
capabilities known to be safe for untrusted access are exposed to the
guest, and registers need to be explicitly handled or else access is
rejected. We need a fairly similar model in vPCI or else none of this
will be safe for unprivileged access.

Regards, Roger.

