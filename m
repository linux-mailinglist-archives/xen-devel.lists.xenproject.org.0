Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3A4F3C6D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 17:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299205.509722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nblOw-0006k3-7O; Tue, 05 Apr 2022 15:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299205.509722; Tue, 05 Apr 2022 15:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nblOw-0006hA-3T; Tue, 05 Apr 2022 15:47:26 +0000
Received: by outflank-mailman (input) for mailman id 299205;
 Tue, 05 Apr 2022 15:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nblOu-0006h4-9v
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 15:47:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd9eff6-b4f7-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 17:47:21 +0200 (CEST)
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
X-Inumbo-ID: acd9eff6-b4f7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649173641;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6dYe4LGFao6hQkBaHwhd4Pw8zZgzFFK9PCR9WLyouig=;
  b=FrbttgBkAi+HJZD1UEKYLh4OsU6qvSPlDARLdi9mQSfUruHJ322fAwoW
   YPyS94Z1NKf0ity+YigAlQGBg3zu28mdzKRBYZrciV7m6zOc9BkJHo9PX
   lCyBe+3v2eQbErqacltoB18Zv+E2hsC9rcVwC0xgmoGjfqjlc3f3IUJNZ
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68062711
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UGGsf62YaAwupiv5gPbD5SZxkn2cJEfYwER7XKvMYLTBsI5bp2dWm
 zAYCjvSM/uNM2ugftknadjn90sE657Syt4yQAdqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ksMSbSlwCb5b9o88CXgljLQ50bb1ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1pgQR6mHP
 qL1bxIzSgjESQZABmxMN8Mbo7yTnXXEYgNx/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SSC9nWgl+rehxTxUYgZFKC73vNyiVjVzWsWYDUcWEGnu/C/hgi7UshGN
 k0P0iM0qO4580nDZtvgWxy1plaUsxhaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcdYQcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ06iJYg1P6QrGv2uBmzq4jycCE/thXICzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkPOI+TfNDKm8gj9yjn5ZLlLvEMZGPxP44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PFMihl0j6jeHCOBZ5rIvp1nPUM4jVC4ve/m3oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF8rbY5kKEtE
 6deEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFXZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:pgfQNK61dqkxZz/IVQPXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cNzp/8tHNFA7dg6ML6K40z2MFvx2TGpUBza/J9uAQO4l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68062711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEy66GG0HwI+CtsMCHYj4leiYq9Lna02bdgxV6UlVMnq9TfGol0dYkrFPCxmwggOlO/Kv/o+Objo+knLidXnYKUHpjL9wSeUX3gJRGoNXXj7NFgfmQbT2cAIT2cJMluOQ/k8lp5oY6ln8UZFkvVTu5Rkn7nNNc+A9umbl6ibpcGuY67zyqgYTj8B0mrcPxUrEW1Nu42qN2BUAfsIHsFbGNJ2i+LaGjEwSzMCur7FZxk28n/n71Bb/LFgEDAYT5/hkjPNBACdHVfbfP0D+YVhhSwrKUMdDIj1PbESLII92sisgA12OUxkuiO8SOPXAAOYmCXS/LBvjKpOw5SQqfpgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv2ptfdss89fam2VXR3H+NHqs3Y+kN17iHb2puE2X1g=;
 b=KzkwZt2UT01zcOfuxB6QWwjFMiv/oPM6G8+ewJfyWg7l0Re3b1Co+MR5OiVOhUx/5a84XVygL46Op22IdnrlM3N/T5n1Mh0zpm4ILwpUVuP2SJNSOJ0WFWKOKCC9x0kUAfT5rJIW/152mF4J7JicPQdHIhNU5gvAXACpiKqLNM3GAZeYprXLh1gH4BR7H0cfJLLxPFe0Ka6nV7BO+EdwSd0nUwIz5gFkQtzp/zwBVajM3j+k68ZYZ1ChMldlaYpuAGQJbNIdW4Ie1wYSKq+hoLW7UG3h3ExqAGl2q6hlW/goiOWlZBIJznSHma+Rb1/1ZEUXQCUOBqzqHoXxSetCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv2ptfdss89fam2VXR3H+NHqs3Y+kN17iHb2puE2X1g=;
 b=f4YZPYPX6OBQprmEIzKmpouqjRSftWt0CW4p8JpcGn3F261rSEJZtQHBTmwEU5SuNnzkTLlkwjxw60sp4SVOENc9EkDPSH6YoP/Lr8DD/XbAtk9t/KErXEINRFHbV+RJx8FDWUzgUg1Jv02f9p8b4uCs0w9QS0pDRDSr5zgJQcE=
Date: Tue, 5 Apr 2022 17:47:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Message-ID: <YkxkfbNpR7yfLP7W@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a132c1e-9f1c-4960-d216-08da171b8d78
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6582:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6582183BCF7DB770648441488FE49@SJ0PR03MB6582.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+QzjLeZPESUWUy6OMw6FxwOnxw4uLXMqFtv7+U6fd+eGtM+wstKuvz9aU6sX7LXpYjuOGPQZ5/WDEtc5OF9gqP0e2oeOXr/cQ/LYfxllpV5pED8zGCv+lOHMQLPmkcgIXNIR1t91UaENQ/XB2b7Fj93VyMSiySDhiIzTDA/2A8gTokrm+ZgYMOPjQMmeSotTKw+QDlvyzT4O0ThbCq+jj6TcA3FK0KF/RfyltS4tBfCWhj6P1cRjPdkRAxPsf2QvilS+Br6Yxtj57D83HrLRhZ1TVwjAqOEx+GaF18J5yYk8hsD3b1rIyP5kWCtnL0kWT9x2qP5xr8TYLIwxVBaMq9ApikBsPmEn9KOo4qsAHdaJA5t/KSIiWhD5Lq48mYeuWoujMPwA8M8HDoReYpR8UXtDr3zDnxirje3yVNBUmV3yPhAwNdCNmAiweFonNm7aV9ADUzJ9uwiNPrIK5FWoXY16MHQQnccycxl7O34tgb4GlMe9Lr26Rt1vMlQOU3mMn3F/to29TGEUIo2w2F0/MlIpA4wZs7HzPZge1VO3fMYnf/UjdGERsW303uUbkhX0t2WH4cum5hE2cP6EdJJfA7VriiAM/pYM0IJDTSBcEeO0Ir70lu2lQ3lsjws6uGyZwVyVFLrXnGwWXr+DR+O7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(6512007)(85182001)(6666004)(9686003)(38100700002)(82960400001)(6486002)(53546011)(8936002)(6506007)(4326008)(5660300002)(54906003)(186003)(26005)(2906002)(6916009)(83380400001)(316002)(86362001)(66556008)(66946007)(8676002)(66476007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlBjeDlkTVVCSE03YnUyMmEyeFFUUGV3NUxFWUY5L091djgreVBvZEtZOURZ?=
 =?utf-8?B?Mk9NNUlyQTZnRlY1YnN0aGVoR0RwYXVzbG51VWF3citmN1c2SWxhcVVrd1A0?=
 =?utf-8?B?ZHBCeEwreGpHaE5VSWpBcXV2U0gyYjdiTkdmc2JFVTZNUlpyYjBxM1lxUkhJ?=
 =?utf-8?B?WXNsZ2FVK092NVFkenczVzRpazNHUnIzVWp1Wkx6QW5VSXdTK09nbDlMemNl?=
 =?utf-8?B?all6eE5LaWRiYk94NDdmRTJnSWZZeUxJU3NTeUxqdVc3YjB4bWVON3dtWS82?=
 =?utf-8?B?TmY4YzBqcUYrWWY0RGFDaGFiQWtEZy9GOU92UG5DT0ZRNml4OTlUd3NzSEZ2?=
 =?utf-8?B?eW00dGJuaHhKNXBaS1FDaTkzdHlwWkhIOEViaFBrR281MUhHaVNMOWNDTW5w?=
 =?utf-8?B?cmptMXpYSnpRTjRvcm1TcFdBc2k0QU1zZ1Rrd1I1bndTQk5GT0tleEhBYXJv?=
 =?utf-8?B?c1IxTFVyemJLWU8zdVlQaUx4SnlTcjEvR1NHeEF3Z0t1V1hyYzUyaU5JbjNP?=
 =?utf-8?B?eFp3cTFQSkJ5YUxZd094VlNoczI0MUt2U1F3dXVXR210RkszWWlVNWJJZ3hM?=
 =?utf-8?B?U2ZFaGI0TldLb0NYamMwSGpncmFZWWkyeVF0MWpOWWVHeEQxV1RSS1A3MXBi?=
 =?utf-8?B?TWFZa2VZWDNnbUFwTUF2b2Z2c3MzR0UxR3E5WGRUR2p4QkZKU1VmeGNGa3hL?=
 =?utf-8?B?VWJpNlRmUng5cS9MZ1FaeU56dHJhS0R1RkIyMFUvVjNMYkxXL1VxakZBZmta?=
 =?utf-8?B?RDZibzFrZmN1MXRpQUpMUCthc3p0VnlTeVErK2ZRdnF3bGcxajJnQ3JWbTZH?=
 =?utf-8?B?UEgrSnIyeVp0SUZmdGtwNWppNTB5VVJmQlE3TVZtZGZEQUdJVjEvYzE3dnFD?=
 =?utf-8?B?QXFJeUJvMnNFbUNkcE5kMG1WZ2MweDkxdllBT1J3YVFrR1orRUtPWEwxa1ph?=
 =?utf-8?B?bHF4N3BGdmYrQkVzRDhFY01TaFZyTVVIaThmUDB4Q0xaa2YvdFJ0Y0FpdWxy?=
 =?utf-8?B?bXZWMGt3TExib0crK3NmRHRuSy8yakVmYURCMThjUGFzM3l4MjhlbGJKdlND?=
 =?utf-8?B?SjkvWHJOTWdER3pRTU9xY3NkOWpaNDN1OUdFUWZ4K0VLZDFub3FTdjBCUWhz?=
 =?utf-8?B?QmNjNy94WVJSSnIweVBmOTBmamJMamVXUGYzNy8zOUxGd08wNHgxNGJGbUky?=
 =?utf-8?B?eGorc3NGRGtPMVdER0kyRlJOVm8rQ0VLVUdJeUhiODFJaWhoWFQrTWx2cGcw?=
 =?utf-8?B?bkNtZCtJQ0VQVng2NmxzVFRLd2ZtS2IzZGpSdXNkVVdRR09ueG5Wck5lZ0h2?=
 =?utf-8?B?WEg4aFJoQVBUUW93M1RMMmxZaEhqeWpFWWRNS0NvbElXdFUrLzBnOTNwR3lQ?=
 =?utf-8?B?a0cxcFBLaTdNTGljSnRTSzUzc2E3NkVPVjVqTDFucStWN3UxbisvNGJpQ0o3?=
 =?utf-8?B?aGswVkNqWGdWdHl1R2ZnRmtYZ3hrMlEvTTNaK2hLSlh0SFVMZmRGRi9kZG9m?=
 =?utf-8?B?MmlFamVjS21oQXhGUVJQa3JjSnpab05tNllXVHNCK050TEFyOVhBeHJ5RnZr?=
 =?utf-8?B?d0ZudGZ3cUhDcGNoRDI0eHRCVGN5a3FSajZJeHl0bk56eXcvVE1IeVRLZmZm?=
 =?utf-8?B?amw2WHZsNC8rczI4bkY0WklWa2FVSXFNV0NuNDdVL1VKWVE1RUwvd2FjdE1K?=
 =?utf-8?B?ajZmd0YyZjRoM2t0bHBkMlJnT29QL3NzeXRkNzlEc0c3UC9LcGFFaUtVcUZK?=
 =?utf-8?B?L3RDeDVhdnMyOUFOaVlmNE4zUmVPUnk4aEdSeks2MmhKdXBNbzZIeTlsRm52?=
 =?utf-8?B?QTVHSDdUdlJpSGlqdHc1K2FXbVRKdkV2eWJidU1pV0tyWEQzZWpmbUpBc2lD?=
 =?utf-8?B?SDFZS1FUSFYyZWJsR1BCa3JtaTN3a1Q1dlhXY0p2U3Y4R0p3L3M1MmRxcDVW?=
 =?utf-8?B?SmE1K01PblVEV3R3K0hzM2haZ2NOYTBYS1A2b0tmbXBqVUtuaDVTZlN4cmIx?=
 =?utf-8?B?N0Zabml2SlZ6Y3hwUUVPRmlTaVpIbTBkT2ptbHNITHZvTEpoWnVHKzNvVmQx?=
 =?utf-8?B?QnRIUmtvUVR2S1grbjU0S3MvQ2FhaDZOTE5FaFlJd3J1ZEY0cERKa3NtR3Nm?=
 =?utf-8?B?WEt3cFZCWHJabXpDTlpZZ0tsT04yb3owckdRVTlmbENJNzdCNVViVFR6S2VM?=
 =?utf-8?B?TEN1OG53OTZnUDdTRXlBVjFTVmhGam5oUm5aRkZOS3FWbGNxbjg2MjF2Nndo?=
 =?utf-8?B?UFlQajR1RjZtMlhtYmFraTUwdDlkc21LSWg0M0pVVWRaaC80cnRNVk5wT3I1?=
 =?utf-8?B?Mjh4WG44V0NIK0toRTZMNVlIYXZVZ01NWGFXWEZmSm1VSisvTlg2UGtIZlA5?=
 =?utf-8?Q?86hHbxxmbrrccBzA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a132c1e-9f1c-4960-d216-08da171b8d78
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 15:47:13.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI5uzYNZsCc0hfoY0mYyzoIOlzAkBxcIdOFRnDcT8TMYQEM2qKOK5pUIxJZN9WPG+rP0rjShcHw/K3WKvt/Wrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6582
X-OriginatorOrg: citrix.com

On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
> On 05.04.2022 12:27, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/efi/efi-boot.h
> >> +++ b/xen/arch/x86/efi/efi-boot.h
> >> @@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
> >>  #endif
> >>  }
> >>  
> >> +#ifdef CONFIG_VIDEO
> >> +static bool __init copy_edid(const void *buf, unsigned int size)
> >> +{
> >> +    /*
> >> +     * Be conservative - for both undersized and oversized blobs it is unclear
> >> +     * what to actually do with them. The more that unlike the VESA BIOS
> >> +     * interface we also have no associated "capabilities" value (which might
> >> +     * carry a hint as to possible interpretation).
> >> +     */
> >> +    if ( size != ARRAY_SIZE(boot_edid_info) )
> >> +        return false;
> >> +
> >> +    memcpy(boot_edid_info, buf, size);
> >> +    boot_edid_caps = 0;
> >> +
> >> +    return true;
> >> +}
> >> +#endif
> >> +
> >> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
> >> +{
> >> +#ifdef CONFIG_VIDEO
> >> +    static EFI_GUID __initdata active_guid = EFI_EDID_ACTIVE_PROTOCOL_GUID;
> >> +    static EFI_GUID __initdata discovered_guid = EFI_EDID_DISCOVERED_PROTOCOL_GUID;
> > 
> > Is there a need to make those static?
> > 
> > I think this function is either called from efi_start or
> > efi_multiboot, but there aren't multiple calls to it? (also both
> > parameters are IN only, so not to be changed by the EFI method?
> > 
> > I have the feeling setting them to static is done because they can't
> > be set to const?
> 
> Even if they could be const, they ought to also be static. They don't
> strictly need to be, but without "static" code will be generated to
> populate the on-stack variables; quite possibly the compiler would
> even allocate an unnamed static variable and memcpy() from there onto
> the stack.

I thought that making those const (and then annotate with __initconst)
would already have the same effect as having it static, as there will
be no memcpy in that case either.

> >> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
> >> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
> >> +    EFI_STATUS status;
> >> +
> >> +    status = efi_bs->OpenProtocol(gop_handle, &active_guid,
> >> +                                  (void **)&active_edid, efi_ih, NULL,
> >> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
> >> +    if ( status == EFI_SUCCESS &&
> >> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
> >> +        return;
> > 
> > Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
> > 
> > From my reading of the UEFI spec this will either return
> > EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
> > If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
> > falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
> > EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
> > ignoring EFI_EDID_OVERRIDE_PROTOCOL?
> 
> That's the theory. As per one of the post-commit-message remarks I had
> looked at what GrUB does, and I decided to follow its behavior in this
> regard, assuming they do what they do to work around quirks. As said
> in the remark, I didn't want to go as far as also cloning their use of
> the undocumented (afaik) "agp-internal-edid" variable.

Could you add this as a comment here? So it's not lost on commit as
being just a post-commit log remark. With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

