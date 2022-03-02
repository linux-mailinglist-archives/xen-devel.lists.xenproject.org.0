Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E44CA1E9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 11:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282158.480762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLyc-0005lE-3e; Wed, 02 Mar 2022 10:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282158.480762; Wed, 02 Mar 2022 10:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLyc-0005id-0b; Wed, 02 Mar 2022 10:12:58 +0000
Received: by outflank-mailman (input) for mailman id 282158;
 Wed, 02 Mar 2022 10:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPLya-0005iX-Ks
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 10:12:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5232b3ad-9a11-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 11:12:54 +0100 (CET)
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
X-Inumbo-ID: 5232b3ad-9a11-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646215974;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KShpUDFeDNO7NDkerg4z+iS5J1YnB7SYSH43894WEo4=;
  b=Olxy2OD5EDpyefGdqwVuYziXWnyUgmiNmjgRqMajjh8UFRIoublLwcQC
   FR2guR4SUJst7OYohpi3wvOeetKOJO8b4VAv7JfvVr7PA2TUvIBqoAr/x
   j4dEJpjJYPMTkbxG8h8bgh5EjCU/ckRaifYM0ISipFfaO8T2JdWxQ2ZCt
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64740714
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cBgmYqNJ6RddtijvrR24l8FynXyQoLVcMsEvi/4bfWQNrUom0TRTn
 GUfXW2DOfmJZmf1fd92bYnj8R8PvMDWn4BhSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 o535cC+RzkVZIbjh8A7dxVfL3sgMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQamCP
 5VANVKDajycej93Cg89M64vwuCxr13fazpxjwis8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTR4Y6BLC+sPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/gLKb1m5g+z9vD/zBm9IEwISQIbNtNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iJsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieh43ap5VJ2a4O
 ic/XD+9ArcJZhNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:BufCV6AT2g61TAblHegMsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UossHFJo6HlBEEZKUmsu6KdkrNhQotKOzOW+VdATbsSorcKpgeAJ8SQzJ8k6U
 4NSdkdNDS0NykGsS+Y2nj5Lz9D+qj9zEnAv463pB0BLXAIV0gj1XYCNu/yKDwteOAsP+tfKH
 Po3Ls/m9PWQwVwUi3UPAhhY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 v4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv+/VXEO0aSSAWQR4Z
 7xSiQbToJOArTqDziISC7Wqk3dOfAVmiffIBGj8CDeSIfCNUwH4oJ69PNkm13imhcdVZhHod
 F2NyjyjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1UwKp5KuZJIMvB0vFtLA
 CuNrCq2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMMYYDaxfzOmzGu/HQ18kiPg==
X-IronPort-AV: E=Sophos;i="5.90,148,1643691600"; 
   d="scan'208";a="64740714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feUIOFZZOYllMcP8kQO0pJchqjnMXh1QD6b1l4fLjAJYJ6Uh2TSbySRkG4Oawoitgmh8E42ZRqT3hDnBtOUCTqaw271nfH3RAMYIIK5Wi3U/XRDRGpO8Ul1PVj2jxTh1Jtk2DkTMtx7RS4mrpuzS0K7AguXf97gnID6YrA0EKZvYZs9XQdJU+Hns1y13siDiCmcNUAuln3Pu1vd5hoUm0bDeIu8hlj3h8IsdnKxg7+f/s0CINd7Y2cL0nooLgzZ/bfBR8n/YYTaEcMWRtixBSL8x2JFwW2e+akMdPCuOUhA8TXIaORzWFDnsguOPybFzO6XWn7Gx5rBcjWjN6GER9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KShpUDFeDNO7NDkerg4z+iS5J1YnB7SYSH43894WEo4=;
 b=ksVc2mEyuF2uRKC/i9aRiQXxlA1VN/w3uaRAIsir+RYDmLF12g76zmNbWon3uESUy7iQp4HuoYAVbdJirOkQmGygyIkKtshL1vuS8rJx8Q7nu6chLg2RZX9oSj0xWxOcq/+XS0/TyfyzmuZMuxxsFMhWro7o4qcDeazO1hJ9RP2Gv1sd7ZFVGQM8XoObJTOSN6Orht6MB0KZPR2hRP7+AvB+Fsrw5JOaUO8NzPQ4CQrsSuh6oXFUhf6ig57qNRUhQwxiTMi/D0rbWy1iZMbAzc8kqPBAayajudOAI6CBFJeuDfbZ89yHNZllGpp8CgWktRearyMpGBeAw2S5+9myzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KShpUDFeDNO7NDkerg4z+iS5J1YnB7SYSH43894WEo4=;
 b=lnVXKnwMm8QBFDoF+y9h+zsohRKIXvN8GAENuH6kGynHuKkf13h0Y0m3Qh/I/a1RydTJKSpNnsz3Ao0J9EjGEmncGirncdAQaP6G+oIQAAvNHJ6wN/HT9UjbRDfXhDpndBrwID2ffLDvpPkhY6PghbcVbnTQF7zKeeiEW4fqmuE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ+IV6PtRJY8p5U2wBnUH9jKzdqyj8n0AgAa3aoCAASBXAIAAIhyA
Date: Wed, 2 Mar 2022 10:12:45 +0000
Message-ID: <e41848a6-9aaa-f0d3-0c81-2e0e4e96a6a4@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
 <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
 <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
In-Reply-To: <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77f4eecc-774e-4f7f-a884-08d9fc353263
x-ms-traffictypediagnostic: BYAPR03MB3813:EE_
x-microsoft-antispam-prvs: <BYAPR03MB381323391EF9C41FFA79A4A0BA039@BYAPR03MB3813.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mKF1N7NkrnkWl0W52NB6IOqPV6YO3DsnWUaqunhugCsEKPxWJzvvxyWbOimTll8P3dDruFHl9NGZ1jG1YVLfh+dTLiwkB2fky7gHAZ53NiQKgYNbkrRsz2/Vdf3oRUpfpY2ya2r4vqSRQN3HspVyT3xOR4k+aaAQPoDnDp9xK+ggdukf6/XK+qZG7VlGUOyOZJzxXXofa0bqR7mWzhoehz7pD9qNpHElGNfosMJu4/6XOGozlaWZpO2UkQTC6LYAUTd2Y2AD9JvNoDtbox833Q2XxZN2BPk1opy5Kkb0wzw/91l+3BLGngn6FBPjEs4L2lvOXPQxWyFgZ2AxjF47Iqd3LLi16PMJmV1AmSv1cPdwej2OFQ29slVRD34ne/VktNAWl9u6R+QpxkBhxbzN5SEq+X5383/NabvZI5VEvJe/ETV8j226xj6nXgRRhF4FTkvFzt4ka63sTSArzyyPM9K/Z3vrqszpz8Ls3bLxwi50iOpgBENNHdTBshFET+5KLn8vbQreWzP87TyZ5nu2gVQm0o8ckeja7DhDv0WnQbVob5DirIDPt1c1/oTIiV4mqc2s2u/AEFaPTQm8jCnyjwjhfSsAfWDHNK13Lu32KrmwwZO/RGV1njyhYIDI7FQDIHvw5FR8fl8QuPj+R1xkQGmYN5gyPP+unMjFyxGXvKFml3CmE1QDdxrDhH2w0ZG7UPr0VYn1r5os5Pu6sOcmtdUKkoPCjB+ZOwaNFDh3WQH33LsmTWtkW7vrM8WDkz/gdblFNu53l9lRoQBn7xnF2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(76116006)(186003)(8936002)(31686004)(91956017)(66946007)(6916009)(64756008)(8676002)(316002)(66476007)(2616005)(86362001)(66556008)(66446008)(26005)(82960400001)(36756003)(6512007)(53546011)(2906002)(31696002)(122000001)(38100700002)(6486002)(5660300002)(4326008)(71200400001)(38070700005)(6506007)(83380400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1pLV0lKYUZWY0xFMElGTzIrWVJ6YnRhVUxlRmlDUHdRNHRrUC9rVWVrU2Fo?=
 =?utf-8?B?SDdCemNTNjRGS2xpWkNGcVNSNWJkK1I5R1JzN0hlczNEMU96VExlMDZXcERB?=
 =?utf-8?B?Q3BrSnBaMEkxWVM2SG1lRkdEWFI1SUVBdjdPMUV1S1RwS04wd3VvNW5TbFo5?=
 =?utf-8?B?aUkvOE40MHNBV1ROS0UxdGhxY2gySlZHakh5bVNSOWkxR08zenR1NFBvVkR3?=
 =?utf-8?B?MDNGTnlISjF6a0M3RWFwcGc2NlBaSDkwK0xWd1NtQndWVFZ2bG42NUZWQXo0?=
 =?utf-8?B?UGdvSTJxUlJrcWtMbWNtN3hwUk5EVW5MUmsxK2s5akovNlR4N2c3Si9LcC9i?=
 =?utf-8?B?ZGYrekdIYnNpZis1dkdBWkQ2M2krWkRYelA3U1BCd055MXRDcGlwRm5HNkpT?=
 =?utf-8?B?L3VKZWFWdWpsOEtCK3h2S1ZMaytjRUxiVzY4NlBZU01reG1RU21QY0g1OG1Y?=
 =?utf-8?B?K1krdEhtamYwWlRTRnU1K2c2Um9Ea1hFYk9CWmtVaFlnNFZNZmVEZFU3eG13?=
 =?utf-8?B?V1dIUW1TV3NrR2Q2Z2F6cDFjVk0yREJiOFk3aFpPUGh6d3BJekMwQzc0dVAw?=
 =?utf-8?B?ZEpaaE8wWmthcWozZ0ExalM1Z0Y4NGJtUFNHUHBIb2lyRVhORldEdy9nTmFM?=
 =?utf-8?B?V0wrTDJQa3cwZjZpR0ZZamU2TEkyMXZMb3cxNVpTRURsQ3hPWmNJSFpYaTJC?=
 =?utf-8?B?eDB1QnpMYVRVcURLanZtSm9mcGFvR0xvalJHbExWVUFDNDFPeFd2ZGY5RU5K?=
 =?utf-8?B?cjJuOWRRQ2l0MmswZXRnaG9WN1A5ZFI4bHlvS2FBeWpId0xnWDM1YThTVjkv?=
 =?utf-8?B?eW8xVzdtVE0xOTRoRDNaZXhJeks1S3p2STRDTGtidS9Jdi9yV1BjM3JFaEFN?=
 =?utf-8?B?UDV1a3ZUeTRzTEo1NkRZRWZVR3ExSUdsY0NzUDhQMHNvdXZPam1BM1BraFdM?=
 =?utf-8?B?aHpXV3lPeVZZTHJwbEs1Vk9zL2tWaDlraU1hZGhBQWJ0Y2FYdzZSTWlkcUtS?=
 =?utf-8?B?MW9rYnhxUjlJaWVVUkNJdGhpK3N1NHRyTmR5YXphRmRRV0hrbTdBbFR2UjNL?=
 =?utf-8?B?bUhyVktMYjliL0NPSjhpK2JGTmFDcmplNFMzTVZieHgxV0pXWWRqTko4V3Ny?=
 =?utf-8?B?OFpqUyszVUhYRXpJQ3QxWk9rdDBrZTlrUDZVcWg4YXdYRUVCQ1VqYXlwNzRN?=
 =?utf-8?B?Z0ltY1FpWHBZSktPSnhMS1ZJTXNJcmNpaTF3WFRieWxZZ2JzNlJlYysxWmc0?=
 =?utf-8?B?L3gyRHE0eVE0a0Jwd1Z6L0MwdUlXNkRhS3M0WGVnaHA0bVExemY3RVVzdzIz?=
 =?utf-8?B?MnBod2VyaGpWQjZsQWEySjRHNk5FMVFCMlVSZGJyMkhlV3UxNGRZTUhPTFpZ?=
 =?utf-8?B?QW9HWE1odGhHYWpxeDk0ZW8yMWhZVmd0dWgwMExtalZLUVZ0KzJLM0t2dG52?=
 =?utf-8?B?ZmJrY296VzZWMXFRNU1wWHFYTThHRDRmTHlhNGR5d3QxbHFWNWtFNFFRM0Zr?=
 =?utf-8?B?WU15RzFBOEtGZDdsYU1pdTFpMHliL1BReCtHZFFQdkxvY2tIOThzOFRIdklr?=
 =?utf-8?B?UkhKTG1BQjdHSi9oaFJLYmYvSE80Z1RKUWoxWVpTVmhHemhUQmNCYUZxUGd2?=
 =?utf-8?B?TVU5UEhCdE5JVFdLWFBCMWVMZldjeG1yeVhoQWNlaFdvdWFTb0VvdTlXNnR0?=
 =?utf-8?B?UEJHaHluQkk3ZG9WeTUzTmJ1K2hUQmZDQnNpODNlTW9yV3IvckV5YnVMU1k2?=
 =?utf-8?B?a2RTaEEvYW1CUDZYNldMWWJZenhlbkhpeU1sUWsvTHlQTTNxYXY0amhjbUNm?=
 =?utf-8?B?T2dHeWJhZHJDbTBEVXpaMVRSVWRBNXBVOXEybm5zaWxnMFFxeEVsSHJLcDc5?=
 =?utf-8?B?amhHYjlXd1JIaHhPdWMvNDZqcWNrdjhYMzNxMGNpS0E4Vzd6ejJENm5udmF1?=
 =?utf-8?B?ajExNUk3WWphbURBZ2JWV3d5c3QzWURtbXNPNDNXSENOZStNbFo2YVFWUnd3?=
 =?utf-8?B?NmxCcGlPVlF2NFQ4VWQ0czV0Y1ZTRGxsd09lSi9mdTk2Ly9GektkVnk4VEdN?=
 =?utf-8?B?b09MVnBSKzg0cEkrRER3bFZ0V1BxNmdLdFcyc0RmVUZvZlE4VGZGaHBNTmkv?=
 =?utf-8?B?b3hwb1VuanRmZElhSStqZmdhTlJHRG43SCswWW5PeUNFU2xFNDdtbWdPOHg3?=
 =?utf-8?B?ZzUzQW9qc09CZWZxdXZYOUIyVXRMY0VUZks3WXFyQU5VVGdLYmxBM09aMHhv?=
 =?utf-8?B?MHdPcTczb2tlYUdSV0lhZEhvV2xBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F5A7A79D5E24F4286B04841F4144DB5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f4eecc-774e-4f7f-a884-08d9fc353263
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 10:12:45.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ucXagEDUjHnz81FjuwX4PEGV3CqW7cX913e0LUeCy8SviAWl6Ox4mQ/Imib1zB7GP4D9i9YxEKrXuiqX+URu4je+YzjUSAuoxw2K7BTyPhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3813
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAwODoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjAzLjIwMjIg
MTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNS8wMi8yMDIyIDA4OjI0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMi4wMi4yMDIyIDEyOjQ3LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21t
dS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11
LmMNCj4+Pj4gQEAgLTYyOCw3ICs2MjgsNyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBhbWRfZHVt
cF9wYWdlX3RhYmxlcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaGQtPmFyY2guYW1kLnBhZ2luZ19tb2RlLCAwLCAwKTsNCj4+Pj4gIH0NCj4+
Pj4gIA0KPj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgX19pbml0Y29uc3RyZWwg
X2lvbW11X29wcyA9IHsNCj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5p
dGNvbnN0X2NmX2Nsb2JiZXIgX2lvbW11X29wcyA9IHsNCj4+PiBGb2xsb3dpbmcgbXkgaW5pdGNh
bGwgcmVsYXRlZCByZW1hcmsgb24geDg2J2VzIHRpbWUuYyBJJ20gYWZyYWlkIEkgZG9uJ3QNCj4+
PiBzZWUgaG93IHRoaXMgYW5kIC4uLg0KPj4+DQo+Pj4+IEBAIC0yNzk0LDcgKzI3OTMsNyBAQCBz
dGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBpbnRlbF9pb21tdV9xdWFyYW50aW5lX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCkNCj4+Pj4gICAgICByZXR1cm4gcmM7DQo+Pj4+ICB9DQo+Pj4+ICANCj4+
Pj4gLXN0YXRpYyBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGRhdGEgdnRkX29wcyA9IHsNCj4+Pj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgdnRk
X29wcyA9IHsNCj4+PiAuLi4gdGhpcyBhY3R1YWxseSB3b3Jrcy4gQnV0IEkgZ3Vlc3MgSSBtdXN0
IGJlIG92ZXJsb29raW5nIHNvbWV0aGluZywgYXMNCj4+PiBJJ20gc3VyZSB0aGF0IHlvdSBkaWQg
dGVzdCB0aGUgY2hhbmdlLg0KPj4+DQo+Pj4gQm90aCBvcHMgc3RydWN0dXJlcyByZWZlcmVuY2Ug
YSBmdW5jdGlvbiwgdGhyb3VnaCAuYWRqdXN0X2lycV9hZmZpbml0aWVzLA0KPj4+IHdoaWNoIGlz
bid0IF9faW5pdCBidXQgd2hpY2ggaXMgdXNlZCAoYmVzaWRlcyBoZXJlKSBmb3IgYW4gaW5pdGNh
bGwuIFdpdGgNCj4+PiB0aGUgRU5EQlIgcmVtb3ZlZCBieSB0aGUgdGltZSBpbml0Y2FsbHMgYXJl
IHJ1biwgdGhlc2Ugc2hvdWxkIGNhdXNlICNDUC4NCj4+IFRoaXMgZG9lc24ndCBleHBsb2RlIGJl
Y2F1c2UgdGhlIGluZGlyZWN0IGNhbGxzIGFyZSByZXNvbHZlZCB0byBkaXJlY3QNCj4+IGNhbGxz
IGJlZm9yZSB0aGUgRU5EQlIncyBhcmUgY2xvYmJlcmVkIHRvIE5PUDQuDQo+IEknbSBhZnJhaWQg
SSBkb24ndCB1bmRlcnN0YW5kOiBUaGUgcHJvYmxlbWF0aWMgY2FsbCBpcyBpbiBkb19pbml0Y2Fs
bHMoKToNCj4NCj4gICAgIGZvciAoIGNhbGwgPSBfX3ByZXNtcF9pbml0Y2FsbF9lbmQ7IGNhbGwg
PCBfX2luaXRjYWxsX2VuZDsgY2FsbCsrICkNCj4gICAgICAgICAoKmNhbGwpKCk7DQo+DQo+IEkg
ZG9uJ3Qgc2VlIGhvdyB0aGlzIGNvdWxkIGJlIGNvbnZlcnRlZCB0byBhIGRpcmVjdCBjYWxsLg0K
DQpPaC7CoCBpb3ZfYWRqdXN0X2lycV9hZmZpbml0aWVzKCkncyBkb3VibGUgdXNlIGlzIGhpZGlu
ZyBoZXJlLg0KDQpUaGUgc2FmZXR5IHJ1bGUgZm9yIGNmX2Nsb2JiZXIgaXMgdGhhdCB0aGVyZSBt
dXN0IG5vdCBiZSBhbnkNCm5vbi1hbHQtY2FsbGVkIGNhbGxlcnMuwqAgV2UgbmVlZCB0byBmaXgg
aXQ6DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jDQpiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMNCmluZGV4IDY1
N2M3ZjYxOWE1MS4uYjFhZjUwODVlZmRhIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2luaXQuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2luaXQuYw0KQEAgLTgzMSw3ICs4MzEsMTIgQEAgaW50IGNmX2NoZWNrIGlvdl9hZGp1
c3RfaXJxX2FmZmluaXRpZXModm9pZCkNCsKgDQrCoMKgwqDCoCByZXR1cm4gMDsNCsKgfQ0KLV9f
aW5pdGNhbGwoaW92X2FkanVzdF9pcnFfYWZmaW5pdGllcyk7DQorDQoraW50IGNmX2NoZWNrIF9f
aW5pdCBpbml0Y2FsbF9pb3ZfYWRqdXN0X2lycV9hZmZpbml0aWVzKHZvaWQpDQorew0KK8KgwqDC
oCByZXR1cm4gaW9tbXVfY2FsbCgmaW9tbXVfb3BzLCBhZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0K
K30NCitfX2luaXRjYWxsKGluaXRjYWxsX2lvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0KwqAN
CsKgLyoNCsKgICogRmFtaWx5MTVoIE1vZGVsIDEwaC0xZmggZXJyYXR1bSA3NDYgKElPTU1VIExv
Z2dpbmcgTWF5IFN0YWxsDQpUcmFuc2xhdGlvbnMpDQoNCg0KPiBBZmFpY3Mgb25seSBwcmUtU01Q
IGluaXRjYWxscyBhcmUgc2FmZSBpbiB0aGlzIHJlZ2FyZDogZG9fcHJlc21wX2luaXRjYWxscygp
DQo+IGlzIGNhbGxlZCBpbW1lZGlhdGVseSBhaGVhZCBvZiBhbHRlcm5hdGl2ZV9icmFuY2hlcygp
Lg0KPg0KPiBJc24ndCB0aGlzIChwcmV2aW91c2x5Pykgd29ya2luZyByZWxhdGVkIHRvIHlvdXIg
Ing4Ni9zcGVjLWN0cmw6IERpc2FibGUNCj4gcmV0cG9saW5lcyB3aXRoIENFVC1JQlQiPw0KDQpO
by7CoCBJdCdzIGJlY2F1c2UgQU1EIENQVXMgZG9uJ3QgaGF2ZSBDRVQtSUJUIGF0IHRoaXMganVu
Y3R1cmUsIGFuZCB3aWxsDQpuZXZlciBlbmNvdW50ZXIgYSBmYXVsdGluZyBzaXR1YXRpb24uDQoN
ClRoaXMgaXMgZXhhY3RseSB3aGF0IHRoZSBVRDEgYWRqdXN0bWVudCBpbiBMaW51eCBhcmUgaW50
ZW5kZWQgdG8gc3BvdCwNCmJlY2F1c2UgdGhhdCB3b3VsZCBjYXVzZSBhbGwgQU1EIGhhcmR3YXJl
IHRvIGV4cGxvZGUsIG5vdCBqdXN0IHRoZQ0KSUJULWVuYWJsZWQgb25lcy4NCg0KfkFuZHJldw0K

