Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E292E56046E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 17:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357936.586825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ZX9-0004RE-4f; Wed, 29 Jun 2022 15:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357936.586825; Wed, 29 Jun 2022 15:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ZX9-0004O6-1F; Wed, 29 Jun 2022 15:23:15 +0000
Received: by outflank-mailman (input) for mailman id 357936;
 Wed, 29 Jun 2022 15:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXcD=XE=citrix.com=prvs=172c93792=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6ZX7-0004O0-5w
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 15:23:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f532a5-f7bf-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 17:23:11 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 11:23:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 15:23:05 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 15:23:05 +0000
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
X-Inumbo-ID: 61f532a5-f7bf-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656516191;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aRMQn6lIowK23J0Wg4x0oNyRCGZJYIOiBGp/kDgX2+A=;
  b=e05WLUfDbRs+K10fuoNXCp8HO2sm4ZON5n7GmELO37EufQ6PMsK5u94P
   hJrjH8ieGShcvO7vNg0MG8jCydfjhvYAG3O5r/gabojl1tV2wL0UwVLm6
   07nM5OjHfyU4/X1RO9VmZL6e3NIAaqTrkNc8kN1ZIFPIepVplXzM1Hwwj
   I=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 74697971
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QjKLIK6v9b2t8UK/dg5uTAxRtCfGchMFZxGqfqrLsTDasY5as4F+v
 mZMDDvUPPzbYjGmeowgOo/lpkwAu5OHnNc3HAVr/H9nHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjUlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSJEDsjY47gnNgSEAICNCB1F/J9qa3IdC3XXcy7lyUqclPK6tA3VQQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiVo4YHh1/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IE9gPK9PVui4TV5DJf1JjiYITWQcWlQJRy2X+Eu
 VvtvGusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXQC8oXOClg4RXZxXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 kCNt8PkA3poqrL9dJ6G3rKdrDf3NS1LK2YHPHYAVVFcvIKlp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjv9hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:539hBqB1jAxYBrjlHehJsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dO0EPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmffHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+3CVTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qe5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuoktrdT5CvgglLfck7wk9HaIGOuZ5Dt
 v/Q9VVfZF1P7orhPFGdZM8aPryLFDxajTxF0/XCWjbNcg8SgLwQtjMkf0I2N0=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74697971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oavj1XIaD3FQyLpcSyNo8xmU0j7+4nBhHiz8JB5OA5zaojGwR84hAkwIHgt4dNsUTbLcna1Zh3+pO8LRdatGm6Qw/HQMaJB1fUorrSfmk6HpuD/BmiGCakXR4w8alFNwEizapQCM+4MH3GeVSb0YpeisDqUNqrO4Em439Nl0zlqBKpxzoqYcioYDBdLWaCfsHI/8t5QYHXFnPTPd5lo0DYTBlKPnn5Xv59Yp3PBqFObk1j/Jt5Izoh+fngroTWpuCE5IIgH4y4Z7nykIuts/+HSg4whSWwqNhYm9if1NR+3u1/nyJHUcD00gimlM170NFc3f9RYcvvIDhDnp0k5arw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qotMkl5OwEnIimmwqNF0LmAhZev6AVNiaN6J2nWxWMw=;
 b=oRZ6F+YXqp51+arjMcIhkiRoCV7lK09/DOKpzKN4hnjGq6amA0s+6NXwaF9iATqNbWzH37SvlvTsCPOd2NB4QRzJXFBgsB836gPRsgdNlX1z72MFA1gNzM6Uow1Gm1V6Q6H58edEAM/tKdl3SU+BTUgg34ADtrUxX1Uyx8zbBCAZKvQgBRYV46P6p0ldYIhuQFypt/cZX+LfMrKek6Lc/38R68sFIl2XrrptXEiRMYwcRqc2MWwPwumkMMK5RYka91b+FmAdcNhQaqsojlMYHoZYopE8c2wxQl/n2NsSzfcyI4fKMOuPcrtU5EJ5tWXoMNXJOQoDMwL2yVsYNfL8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qotMkl5OwEnIimmwqNF0LmAhZev6AVNiaN6J2nWxWMw=;
 b=mns5juI2NQAUZ5oJ02UTjyo2PH8oCkBnTQcqLYSm3vVzbJfyzBEUzRaoyYckeE5cbOPJ9k3OD0+s4zG6/prVwTpBKTMafd1lmm8OSlP9yRutfhVlrarMQRBmaJBwEm+M+KP59WxA0IPDTIkBJx+fQtUikM8Rn/XYrffHrtzEYpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Jun 2022 17:23:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Message-ID: <YrxuVPMb990xYKi9@Air-de-Roger>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
 <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 424ed0b8-873d-403e-ec01-08da59e343b2
X-MS-TrafficTypeDiagnostic: SA2PR03MB5722:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OB2kVP9MZ0nwLUSEAhTsSgrvIV3S3FYk+5poVidQJ7AxHfLk+dYkNvmdL7wWBnEGc1AmVu5V8SF/7DEicd1OcqvJ1+7iaX4ENYa1cmnRczrSR1ZV0GFqW8ouw7NteHQwbKa2vxobSoQRy4+zHV+frCIYGTmYv9HgoCsKPASAmRTMgfBD438QW5zHVQRZpt/roeD4BBFPFBNDEqAEfnfbntNVkFq5zJzRxulNgSRQ3IF+nluGGpHYvsD2tFFOuqaMCgA+HxacPsJByphWSoMN1+HM9uhKiifAtd1EGJwHSprdJXvsIMIRKD5kr3xwFoDt/JYjbeyfYmQ6giHIETLtNhwJWJjkBF4G9s/y5BnbjIc++oZz+wSQXWnzY0YWkeM6bp2ze86R7VfZHtNTv9bigv4wmCLp07sycsziiWbxKKJtRDiRuXBk+Um1FMwhSwj/+q0SgppGr/u4Qk0zaXpVdC2UCJ3hXCbmeLxwIEbrNFD7RZXYXK+A8I/rtk66iCeitY+R8OUHiSuyQvTzRw1e2SQyHwQTbedlnOqCaM/CzsPaWfoO/b9o5OlYzjz4CyGdMneHogS9eom+cjV7Ft+cQJ4+UKQSJEAk6hgH7Q8M1AYXzpsVUdgHQILYP29pO07hmiXq3HrlPaNhCnVg6c8/atvX+EexUdDLM3hb+grYFPjez4JLGIaEZZBzXm0XAwUIt9YDOv5sKJ/g00caEWNVxFAy+LzlPijXW6IuDrWuYkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(5660300002)(54906003)(82960400001)(186003)(66556008)(66946007)(2906002)(41300700001)(83380400001)(8936002)(6666004)(85182001)(6512007)(33716001)(6486002)(316002)(86362001)(9686003)(6916009)(53546011)(6506007)(478600001)(66476007)(4326008)(38100700002)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVNNVoxcGRmaUVhaGVkeGo5ZXUyYXdSZWxSdFNoMFBJR1RtWnpKNXlwbkFx?=
 =?utf-8?B?QUFrYnM3ZGpqdEhSTEJTMi93bVBhZkxDNVI1eUJKb3puUHJZdUpiMitOTjNh?=
 =?utf-8?B?dlZLNC80akc0MXFRRnF3SDU3M3RBY1JyNXdiNkc3OGFZbjlUMk02dXpOSlpT?=
 =?utf-8?B?dm55RXF2SitsU2dGMS9IQW5xcXlWU2JuVXNWR0p5MEJnV3lwOUtkVHhoRFNR?=
 =?utf-8?B?Y0UzcE9OZHVvVC9XbVBlUm1GWFhPTndiNWdvK0QxcHpjUXlPZWwxWFV2ajdD?=
 =?utf-8?B?dlkyOHJMZjkrTkEzZ1p0citSVWxwK0VlckdjZWlOUHZQNUgxNUpWUlhJNTZQ?=
 =?utf-8?B?ZHJhbEpXSExDa0F3cXdZdkQrREpGNmxZT09sUFZETlZadzRGazdBU3dnVDRD?=
 =?utf-8?B?cHV2OGZiM0JzaGpEa0NyMkRUREN2WjFJUGtkbzFlV1J3cGRzK0FDRGpkd1Ro?=
 =?utf-8?B?ZjBqOE5aRzlCZ1RvNGdOaHdKU0pmTVN6SlpqcW5RZDJYTW55aW9GdTFNS21q?=
 =?utf-8?B?MW5nb1dwRkJxWlRjSVYwM2hYK250eERaNEYyZUFoV2t5NkV4N2duZTB1NUxX?=
 =?utf-8?B?WUM4SDgzTUNHVDBvK0pWMG4wYlRMWnJlcEJwYTE4WDhSWkVnQ1NoT2JOK2hl?=
 =?utf-8?B?NktDZ3NOanJZbG52eStucURoamFvWWdkTEdyNDIzalFPRlZTM0hWeHZZd3Mr?=
 =?utf-8?B?Y3lLTzRkZmtuMVFra0g0OXJjWjl3d0VwbWI2Q0pBYlo5NDRmWjBLd25jYXVq?=
 =?utf-8?B?Zk1sQ3I3ODMxRVZNSWhHYVdIRS9xbjRNMVhwdWM3TFBMTVhuU05tNWxVYmhR?=
 =?utf-8?B?MlVSSzV3aGw0MTZBSEVZandDV1d6U0JESnJqZk4vZjFrTWZXSVZYN2dzOExC?=
 =?utf-8?B?T3VCRmJvSGZ1VVJENkxGTjBmM2xzZkdWSEUvdW5jamdsRmNLYlhyWFhSQ3pa?=
 =?utf-8?B?UlZnbVBYQVZmdXN2Ny83YnVrSFFVYnJaMi83UkxvNlpqamZQMzZnckN1eU9E?=
 =?utf-8?B?R2pZV1FVSys2S1pSUXRjOFR2NHl0UHVHZFBqRDAzOHpFd1c0ekZnS3ZWVGVz?=
 =?utf-8?B?RWx5YzZkVmVRdmttU2VFb2FGUm9IMGM4N0t3dXRTc2h6RWV1WUN4aWZNODha?=
 =?utf-8?B?ckJOWS9RMEIyRko1RjZWWm8vckFKSnFNZ0RUOFFabG04TVVpNzNPUHh0cFRz?=
 =?utf-8?B?OEJzcGFZamxFZUhpS25jUGplK2VPZmhzUHFaUEJsazNKQ3ptd2F4SEVpSlhl?=
 =?utf-8?B?T2xkVUVtZW5hbHRjUWtjUFB3SlhBUFU2K2ltVW1WUURHeGFyeW1xV1lleEJS?=
 =?utf-8?B?RlNhSGF2cnJvb21lU1JZT3pUUFE3amtKaHl3dTdQZUJWMGg2WmpBcXpjcmZU?=
 =?utf-8?B?cTAxOE1vVXlQSlZ6dUgzUk5EQ3ljTzlDb0pQU3NINk5XbmZCaDdHWHJVSUFv?=
 =?utf-8?B?cndBMVVwS21wWW9ReFYwbXZRWnNRQjhwN3BpSnVmYllqWkZ1MzhWb3Z2WGdR?=
 =?utf-8?B?TTJyalFadnhHVEdCMUliMmlCcDVac3RyRFhUbUJaZ3VFczZOeWJaOWJkMVVF?=
 =?utf-8?B?QTZKSTJRNkVxb3JyNFFCaTgrS2Q2WkduR1JrSDR6aEJ3YlBrTmZuenJwUG1l?=
 =?utf-8?B?ZTV1Qy9mRkVOd2k4akkzTnNXazVxZXJDT2ZzOWh5YjBtL3RsR1ZMSEhtaWdt?=
 =?utf-8?B?UHhoK0o4NU8wL3dwcHE4L3BsMVVTVGEzdzFMa0wxUWc1aFBQaWRVeU9vNmJN?=
 =?utf-8?B?MWJpT2xDbElrUWMxdHZNSDZaVXQ5QkNVQUJHYmt0V29UN1hNbjFBMFFYalR2?=
 =?utf-8?B?d3VkczBJV0ZRRzZUS1RMdWxRMW1mNnFmdXpZSFJSakxGcUkwSERrZ0EzdWlo?=
 =?utf-8?B?TGJZYVRDTnlJUFFidi81Y0ZIaFJCaUpIb0dPODdDQ3ZrV1F6aUUwdXlJV2U1?=
 =?utf-8?B?TlhXcFhlbVdXd2swbjlEWE91bWI4U3BJZlpaTVROWmY4Y2l0emlrSFZBcVdR?=
 =?utf-8?B?eCs0NnRkaUlxSC9qMmtVdHJBNi8rNjlwdW5hcjk2cmgrd2E4Mm5jNzNsRHFN?=
 =?utf-8?B?b0pBNWcrVVlOSXZSSEpxdWt5bHk2cFVOYVVJSHN3T1pDS1ZHV3NIR1ozSWFw?=
 =?utf-8?Q?6Miebczw24K2QbJfiZ0oRT29M?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424ed0b8-873d-403e-ec01-08da59e343b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 15:23:05.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9k8p1ZsqqZNHwVs6SSEh1dvil2pVZ01O7p9ZrIAllN3L6OT1jmf4OdQDp3XNlr4/zwpIAW4LEid3GWjNboCbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722

On Thu, Jun 23, 2022 at 03:32:30PM +0200, Jan Beulich wrote:
> On 23.06.2022 11:08, Roger Pau Monne wrote:
> > Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> > being filled halfway during dom0 boot, and thus a non-trivial chunk of
> > Linux boot messages are dropped.
> > 
> > Increasing the buffer to 32K does fix the issue and Linux boot
> > messages are no longer dropped.  There's no justification either on
> > why 16K was chosen, and hence bumping to 32K in order to cope with
> > current systems generating output faster does seem appropriate to have
> > a better user experience with the provided defaults.
> 
> Just to record what was part of an earlier discussion: I'm not going
> to nak such a change, but I think the justification is insufficient:
> On this same basis someone else could come a few days later and bump
> to 64k, then 128k, etc.

Indeed, and that would be fine IMO.  We should aim to provide defaults
that work fine for most situations, and here I don't see what drawback
it has to increase the default buffer size from 16kiB to 32kiB, and
I would be fine with increasing to 128kiB if that's required for some
use case, albeit I have a hard time seeing how we could fill that
buffer.

If I can ask, what kind of justification you would see fit for
granting an increase to the default buffer size?

Thanks, Roger.

