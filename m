Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122DF5339F1
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 11:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337092.561594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnNg-0004o7-V7; Wed, 25 May 2022 09:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337092.561594; Wed, 25 May 2022 09:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntnNg-0004lU-Rs; Wed, 25 May 2022 09:32:40 +0000
Received: by outflank-mailman (input) for mailman id 337092;
 Wed, 25 May 2022 09:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntnNf-0004lK-5u
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 09:32:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c20d1cf-dc0d-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 11:32:37 +0200 (CEST)
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:32:33 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5684.namprd03.prod.outlook.com (2603:10b6:303:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 25 May
 2022 09:32:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 09:32:28 +0000
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
X-Inumbo-ID: 9c20d1cf-dc0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653471156;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WnxaBOSI52SZYg4bEBjuuPTOoY5SytdFDfqFF76kiVE=;
  b=Z9hev3uvdRt+7MFPT273SaPqEBtq3rDBWoXUGn8BILpv8OQulKqucCC+
   gWrbTXAf2+3GGz131nUrWtIS+3dLziqCUCxsaFLO64Bb2VuAiV0TSAedv
   XFHw8zOcszow8rL9+b0nMSPv+7Whql/N8WjINtEj1ttyt3Gn/LMwH4iQ3
   o=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 72529723
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tkyuia7ZQZkCwv2cIVy00wxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mMfWm2Ga/ncYWSgKtt+b961/E9QsMfczIIxSVRpqC9mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjXlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSiSEQMM4yVwt1DTh5GAh1PDY9dxaH+dC3XXcy7lyUqclPK6tA2VgQNG9Rd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiVo4MItNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcF8gPK//FfD277/gta4anKPYTpPfuxXsAPwE23p
 VPW4DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMU/4QCJj7HSug+fD21cFDpZMoR65IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:2ItyOqkQcfJDgcION0JY6C/8Et/pDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72529723"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmG3NzyBnOuxEx2uAFk7ulP3ozQA7PEYFe1lvkMy/G2gPJr89h7qaE5rbsQ27bUSTLjQhyP5vSYMXtH2QJnIhJNfC2d9Qf37NAMlSrdWzRz5koNi/xTbUqG5W6sutmfFJOcwsOyg4JVjB9ehMPypF8l6TeAkxQLoWVsWLy5r/i0vZDr5jT1h9Eq4YFiX+8JJjsDtq1uaQVO60f6A744SrCoHO7qIMKvpbvEXrYHMUynp7SH0q6aK5DWEBe96OkiWEx2msoQR1sD/trju9+KLYWWWvE/w8Yf6o0Y2HgIwNYeTnpwORRtPSgFiokkup/YTkEt0fHf8UW30EenkwtnYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kch/SKVWSwIN4uB0vHx2zrSytidkUMUy1vMrs1Nj9y0=;
 b=CW7bthVtRDA4tXSIOcnRNAxdLSLpCOAK4eVyWf/qk6/1JldCMIAWMfb0rtKman8E2jInwd3geXtYAPKQCxjiDTGWMr0rqe3O7m0owY1G/yzIkWyfYhg4Jr10tT2u0zBHnAqvl42IQsyiWFj0OODt5jSLX4Zsnukv75Co9CHgY4gCR1kkYi+1PDM9Wiq54ITw0Efw1RdMBVe9+w4SPqOUNXCyhZF1QMY4LNKe5OQHt3TJk91N/CkozcIuhRAWdv4feW53/HTmxDKHfz4/YPIuUXU4lj/YwSGf9BcuW1ecp3zqnJbkea+F1XeIC/oPK+Sm7BJzBAjzTBnwdDiRk8HF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kch/SKVWSwIN4uB0vHx2zrSytidkUMUy1vMrs1Nj9y0=;
 b=ORMoD7sic1IzoE1virsdFUarWWKDfk6KSMOXP2QyyJzEC84037/L7084weLzWuThWI9BEue4XdP1VqtrI3Hjaru0qLjUjU3mtYgjcH1Thfr/1puqbqSeov2T0tvkzcyGu/1BdYy8zpCTMqYLSobijIPqx1y79f6Z9Sl2J5J1r7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 May 2022 11:32:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] x86/flushtlb: remove flush_area check on system
 state
Message-ID: <Yo33qItedgaG5pvA@Air-de-Roger>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-3-roger.pau@citrix.com>
 <2f030cf7-fbba-6ae9-b797-f695221ee081@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f030cf7-fbba-6ae9-b797-f695221ee081@suse.com>
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb12cb91-7fc1-4d5e-e9a6-08da3e317c53
X-MS-TrafficTypeDiagnostic: CO1PR03MB5684:EE_
X-Microsoft-Antispam-PRVS:
	<CO1PR03MB56840936357CFE59846B2EF78FD69@CO1PR03MB5684.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p2SbgwI4qn5afl0Zu4psnZbuMv2xc+H+oa4b3CmZUiSOs5M5r/yr6+n7NkdbEjiB05ojTg3EJpOpGOJW2NhkXq97iWAepkX1Hvjo8Ql39oMXM/U1mlWsFG08VmpnI4QSrhIg3L+50aoN3u2sx1ArZ6v0zlJQkWJSkdDgolwHQlgPRRKJ/3YHhavms8JnHV0LiMzMtUPAegRuYSsCKF0CGucUHxp/pVdvKzeQtqgQrEsrj4o++fWojV7Cr4KHDBiCOboGoWv9oqVTHUsg2HDurYHj75QCVD6uWD3Fd+XFHpTO1XRO/CDZzgB5yXvEsDNPfOoHBGO3+uJ4ggE5yE7FhM9gkzvnOc/BS//Ub0m5PMQjSQrzvA6XyGazEvwt3yzFAtgrciIjFFqUNgh3z80BvdG0w6GaAbWfDE92XP2fzpFrisNyMvTbd+kXaYskjzLA+rXPb7S0bQy9o/LiSCQep55iajBHEFc1CTiX3ZP8nngCoHlnel4KrWj4zbmoMARRbpJg5YM1M/rZ+CXE5hsCBvfhd846iCVaw4GACcjmlYhTpNzv1V227C3FtL5tt5FKwDJDEsfUpXaXzatc15CszECeHxQxvCE13eoLV3pdlI1buNRemcCP0qLDiTKPbfGBz3rsf+MQcBovYsuYXulmAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(9686003)(6512007)(26005)(2906002)(33716001)(186003)(6916009)(82960400001)(85182001)(316002)(54906003)(38100700002)(8936002)(4326008)(5660300002)(53546011)(6506007)(508600001)(86362001)(83380400001)(8676002)(66946007)(6666004)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amhjQVRBdkQxTUk5T0VnbG95bHVMa1M2elg5NXVSejVmeE1tdGNDRGZCTGFo?=
 =?utf-8?B?MXBsREhxcFZQYTlUTW83dmJxT2ZRNS9kVEc1WUlQckZ6MThwbG94dFZsdlJP?=
 =?utf-8?B?aUcvaTUwL0tVdndGSnlvRSsrQUQzZ1FoUHI2KytWeHRWa25VcVR0V2dDbGpN?=
 =?utf-8?B?Skd1azZRSUFjK2xNdVVaOTdXZFdkcGp1TnRUT3ZJRjQ2UTF0aTJIcHVVQkxR?=
 =?utf-8?B?Q3Z1dkV2NDJ1ME5xT0QwbXNsRU1TZnF1cmJkSVhSNW5QMG9sUlh6WFVqNFZt?=
 =?utf-8?B?UXZZOWxPWUczUldGOWdzSXVaeDFaNnMwQTUyM0xmZUFxWmVhUnB6WFVJVGI0?=
 =?utf-8?B?KzhXL055WFFtTFZDNnQxZ3BVS000RDJXaHkwV3JTRnpWc1JuK2lROWZuTjJB?=
 =?utf-8?B?eTVsZ0xNN0xneEN2TEJtOXhUZWliV00vaXovZVJiOW0veVR5S0tzV0JtU0NY?=
 =?utf-8?B?QVRYTWJCMFBuUHhlbGdqS1RtY0hLZDJlb3FkVnlRaFkvZXl4QXZlVFIxQldH?=
 =?utf-8?B?OVFWK2l3YjhKcDRZb2dUY2RUdGNZNU9YVVFnT1dCK0hmbTFGMEZrOEdnallW?=
 =?utf-8?B?T2hSMEsyOWN1anRMK2N4d3N5Rit4NTd1VlR5WEN3Mk8zS2xXRlowem1KQzF1?=
 =?utf-8?B?RHVNV0ZodllPQlNDOGtrdUpkc3ZNeTRvSFNGR2c1Sm5Dc3k1Y2pqb21LYlUw?=
 =?utf-8?B?K1BHRy9rQmlkMVBnOUl0YVlLRm5EWXJrU0RreDE2QXEvUVhDLzE1K0hIWEg1?=
 =?utf-8?B?dlJ0dlJyYmVpdUtnQnl3RnNnT29RSnB1cTBITm5oa3loN2VzWnNvWGc2QXhQ?=
 =?utf-8?B?ZUwwRkZka01YZmxkMjV5TUYrcUxPV3J2RDh1RWdIRTdVUWJDaExPVXdnRHBT?=
 =?utf-8?B?ek90RXZ0L1o1ajVvdDJpTWNSS2Z4YXZtWlFiVUpvUE1RaWNyVExaajhxOW5h?=
 =?utf-8?B?MHBYcXNoK2Eva0ZvQ0hXSlgwTFBpMmFnRm42VGR3OXlmdTJEVTZTbHdhZlg3?=
 =?utf-8?B?cDNnbngxMkI1U1BXSCt4aG1PRFU1VTBFbmdUZDQrK2VTeVhqSGY2TUJNUXI3?=
 =?utf-8?B?dmJkZkpwR1hrSUNGYTl4L24vcWIxdE5KUElRN2RMaWEwT0l3eDlSRTQ1aFlM?=
 =?utf-8?B?MXROdVdlSzZDRDQ5UVExVGhsYi9PaUxRZ1hTUE05RlByR1V4eHFUdDAyZHFD?=
 =?utf-8?B?WUR4OGFaSWQ1UmNlMUluWnZONFZHVGJNWVhnRGhsMDBTaEtJM0NISm1lWDBn?=
 =?utf-8?B?cTkxamdzZm40VXFWNUlBM1JIOGtCVUtwaTBmYXpwWjhlVC8wcHIwZHJaVjE4?=
 =?utf-8?B?d3FyZk5yZEJwZ0F4RlhyaC9LQ1dhWnBqY1BLUXNDMTJLRkltSEFodFYxc0Z1?=
 =?utf-8?B?OVJsTnRvQmRoSWNNZVlGQUg4aWY5b3YwMG1VVFNyOSthN2FrVEk1SmpGQVAx?=
 =?utf-8?B?Sm4vNlM2WnlJWjFNbDZ6NGtuZTRTY0h6QjdWeEUzc09Ienh1MHFxSndUV0xW?=
 =?utf-8?B?SlBEUmtmeTdDcTg1NUozSG13QUhiUFVYeXF3MHBjWklUTWZMTnRvYXhBS0ZB?=
 =?utf-8?B?OW16ZnFQMGZCbHhCRWk4Y1FqVEZVcXloOWFBNHBST2NHUVhKdllqVXVRdzQx?=
 =?utf-8?B?eGhDYytVa25GaXc2VnhkR2lCV0RpYjNROFBkaHE4aC94YURvOXZiR1k5VWxk?=
 =?utf-8?B?WnZrSVlrSmtrMFpyOUdWd21jRTFRZkZVL2ZERzBMSDVna3NWRWd1SFNpYVVI?=
 =?utf-8?B?Wk0yQXdVcFhzbThlYnlCOE1MRmlvRTZUMzYya1RFZytTVTdVNktrNHFldjZ0?=
 =?utf-8?B?OTVnblRaQmhVeDRzRFVaVmFOOFFYcjVzR2liNmlzRG9iOGNyaHovbUhNZ001?=
 =?utf-8?B?YUFoU0ZqUXhOTzRKOWtCNzYxT1l3dEpwMDBZWFY1dzNjeWc1d3ZKbVhGK2E0?=
 =?utf-8?B?aFQyNGdvVCtrZk1qd3I0c2RwdjRhR0pQVzF4eTJMUDNUS2I2THByRFdubElw?=
 =?utf-8?B?TjVNSy96TTJ3TmljY0gyUi9RK2NpQTM4MThYbkhLUHd0Q2NvRDN5ajVOOU56?=
 =?utf-8?B?bGJvSU00djQvYzN2UFNrSjJqVDhWdkduSUhWM2xIcU4wQzY4aVRvTmdnT0pB?=
 =?utf-8?B?eTBld2pDUG05SlkxMnBEdUpxcnkvdVRZYnRnekRoNzdkdUZ3SUpnYnZMOFR3?=
 =?utf-8?B?SlVaSlVLVXNsRFRYTHFncGRnSVBmRXBoS3ZrVHR5TDZpY3ZLazBzbzZKUCs3?=
 =?utf-8?B?RHdTYWJBZ1E2MjhIM1pDVnZIQUNzeFR4clRUTWpHWDJoNWpWODltZVVpOUhL?=
 =?utf-8?B?ZnoySlk0VUVOVjJCOUhkZ0JFQ1BnMHV0ejc3cFFxeHEzM2YrOFhMS3o4dHdK?=
 =?utf-8?Q?APiuianuMu9VESC8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb12cb91-7fc1-4d5e-e9a6-08da3e317c53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 09:32:28.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkd4ETuivNUopiSygGg2bMlRkqVSFLdT6PpMQ1EpfKH1HeKGrHqkrYR0MZpJY7Cvq+R9/HBEln4jXeup9Qj0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5684

On Wed, May 25, 2022 at 10:41:51AM +0200, Jan Beulich wrote:
> On 25.05.2022 10:13, Roger Pau Monne wrote:
> > Booting with Shadow Stacks leads to the following assert on a debug
> > hypervisor:
> > 
> > Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> > ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> > CPU:    0
> > RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> > [...]
> > Xen call trace:
> >    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
> >    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
> >    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
> >    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
> >    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
> >    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > 
> > This is due to SYS_STATE_smp_boot being set before calling
> > alternative_branches(), and the flush in modify_xen_mappings() then
> > using flush_area_all() with interrupts disabled.  Note that
> > alternative_branches() is called before APs are started, so the flush
> > must be a local one (and indeed the cpumask passed to
> > flush_area_mask() just contains one CPU).
> > 
> > Take the opportunity to simplify a bit the logic and make flush_area()
> > an alias of flush_area_all() in mm.c, taking into account that
> > cpu_online_map just contains the BSP before APs are started.  This
> > requires widening the assert in flush_area_mask() to allow being
> > called with interrupts disabled as long as it's strictly a local only
> > flush.
> > 
> > The overall result is that a conditional can be removed from
> > flush_area().
> > 
> > While there also introduce an ASSERT to check that a vCPU state flush
> > is not issued for the local CPU only.
> > 
> > Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to local only')
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5070,13 +5070,8 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
> >  #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
> >  #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
> >  
> > -/*
> > - * map_pages_to_xen() can be called early in boot before any other
> > - * CPUs are online. Use flush_area_local() in this case.
> > - */
> > -#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
> > -                         flush_area_local((const void *)v, f) : \
> > -                         flush_area_all((const void *)v, f))
> > +/* flush_area_all() can be used prior to any other CPU being online.  */
> > +#define flush_area(v, f) flush_area_all((const void *)v, f)
> 
> ... v properly parenthesized here as the code is being touched anyway:
> One less Misra-C violation. This surely can be done while committing.

Indeed.  I had my addition properly parenthesized, but forgot to do it
here when moving the line.

Thanks, Roger.

