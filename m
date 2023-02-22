Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4969F8E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 17:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499716.770985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrrm-0005RZ-DR; Wed, 22 Feb 2023 16:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499716.770985; Wed, 22 Feb 2023 16:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrrm-0005Oq-AU; Wed, 22 Feb 2023 16:21:14 +0000
Received: by outflank-mailman (input) for mailman id 499716;
 Wed, 22 Feb 2023 16:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUrrl-0005Ok-HC
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 16:21:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8c9d3d1-b2cc-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 17:21:09 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Feb 2023 11:21:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6179.namprd03.prod.outlook.com (2603:10b6:610:d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 16:20:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 16:20:56 +0000
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
X-Inumbo-ID: e8c9d3d1-b2cc-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677082869;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ry1zgO45iuqBc571aeuGCh+3uDngkmuUFg84b/u2b2s=;
  b=dskAnNSdbn43Bl6gwTWDwAuaIIdEmKRByKqV6FVzQSVFRYJNi+htwYPr
   kcaF+MuOPkWH6+GJW7lCRHyq1fUbOuosY9wODyYkwMaMKsGM61bUyZUvt
   /gR6sNzTADzS473NQgF8DHWqx/JTii6wl5FqWeyyrJpjIn0ta60YCQ3z3
   8=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 98503601
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8qWVDawMMinp3KZRPo16t+fkxyrEfRIJ4+MujC+fZmUNrF6WrkVVn
 DdMDTzVPPiCY2Lwfd10PIqwoUwCv8OHyIdlHAVoqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6oT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWNW9
 adCKHM3VTaoh/uY3q6qE8l1iMt2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFIZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKrBdpJSuXhnhJsqGyunG1LByQkaWuAut6wiHS9ecNtd
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313r2JtyG7PS8ZKnALTSABRAoBpdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lW0rmBqpr5nNCwsqvAPeWzv/6hsjPNL7IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz3oBZPoag4DOlCGXpU
IronPort-HdrOrdr: A9a23:XPLLIqCww3fl1crlHemo55DYdb4zR+YMi2TDgXoBLSC9E/b5qy
 nApp8mPHPP4gr5O0tApTnjAsa9qCjnhPtICOAqVN+ftW/d1VdAR7sN0WKN+VHd84KVzJ876U
 /NGZIOa+EZrDJB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.97,319,1669093200"; 
   d="scan'208";a="98503601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPMnepnX+Cx+ZQlH8ukoQBdY2I1fNyTjhwavu2J6Sw1qyO+K7F2wVAmhCFEMUr2pdfUXXqoKJ0BaucXUcWXFhaDy47z5BmNXoksoUBCc172WA38lJjWxNjHgFNL2RAAxw5/HCCgftMiBY7VDHf/ZU2z1FB/Yuqqnn4VBr2T7oZdP6E+vTl2sXp8xbqHLNsBxR8T36gtJm1bKaHMGS7yQUGbOjrtbZVSFrwjjeWlNI16OVfW7rY6jvmrftIFk/sLnMB30WUSSI/deEqLSx2bAQdOgwV0ltLzxFleJ7HNvCugaDVU81mF3/g31f1QgarlioPg5NukMhTMiLeiwaIWVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry1zgO45iuqBc571aeuGCh+3uDngkmuUFg84b/u2b2s=;
 b=ZiuiDMiJ93OsSNvehNXEEjsLouDDFftu8mwwo0eJHV5jhRc1/DobVpdKgUsTDKddIUVN8FkXl7lU4haCUDvoA1T+GptdRKzstJNnKtHoRYytN7dR4c6W0btOd3VNOJzGDxHkS8j8D5ZmRm6/QFOody1BtOorRcW0ev07i/KFVNjc5cHygi19dQkcscwt6WKQPE2i/8KVe6hOl5vtTMIdY093HJNOzsoFFXkHSyVnFU8SoS1e1VEN0Xi16LT1vdfdLZ234bas/AWXiV1JIc+H/xFL80OlZkaSapHrU9ISSb2Dpo7sN8w49PiiJw1c2IIa0IGF8W8+SVTdfGtRAEOGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry1zgO45iuqBc571aeuGCh+3uDngkmuUFg84b/u2b2s=;
 b=CuUFB413vleBvMnZV+TjCDrj3JqYDOk3HzGmtvKs5x4p2W7uE9EafSXkmgbURX5FRDrSUZxrPA1aAZZqGeIw7BLKOzbzaa66qe+9627/AMFN5C3qO6j0WQnbwNjyE8A6+svNh91v6lstVIrdrcWw5TTfSiE82hCv5CJ/hGXX+OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <99baebe6-7552-bd46-6f84-724bb300443b@citrix.com>
Date: Wed, 22 Feb 2023 16:20:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Core parking broken with NR_CPUS=1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <75b06911-9ff0-e75f-b611-810277524171@citrix.com>
 <0ab8641a-684a-3a13-50c2-d9912286f313@suse.com>
In-Reply-To: <0ab8641a-684a-3a13-50c2-d9912286f313@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0375.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 736380b2-cda7-498f-8a8a-08db14f0c691
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5W4hAX/Bx8s5QwTFYC7PqQjf3kqQYEv1dJ07X1C3rDufKlnmwQPRdsBI2H1GGUmd4tmfgDBOtgFQwieKfqK9b9dGqT3B9mFfDPBqSqJYdxmdMJbwzai2tqh3mrRnrui5iqUK99JUMyYLSVgb2fN67xsvOlD6+cYrh28oMFHT1if2Y47m8wSXHvtsHWCuiGS3ZQb5el+vIe8tYVEhSUvHWiIrMSEwtkzA8ieWsuDEPL0NvUjMgXEkyai0vwfhJ/h0ftEgOweCZdNJ/p1yvRuHgJ+u/AqGaAjsIskysYBx5lLGuDvkikVpGSzavwCe4Rdm7l7H1/hQZ0N7l/VO0q74QeeprATFFeQmKDfgldbIvHZPKDz0C35WiiTl2MjBgzmFwCOdQ6YHgoadfKuPnhRgD7ieKHRVtYSfBxZLPNBD0UU5ZMxylGmj+AGiK/rNnRo9vpY29cqV/s2X8B0caFgDdCDFj2NQhfFc1zMwhcxRW4HiqYfxmuGdKyvthaYOKQfOWY153oA8h4FEhCcc3q10xNIgCEGeQPDp7RgsnRr6pgDIuJBh8AsWAJIgAjn80hHh+xO1QHBeAPhZUVWYQM28ziWqPNHBa7CrWbjG2MG4LS1tTni0SfUtFwtsG445bXXmWryHv1cSQX29g0Az/y76JmfEcoFmdac6s64/UUdLyWv3dY3g30WmWZ/9sjzcJzA9R1qQrIRQlVb6MMPlQsmzEsuUCQk39iWIEWjFdDto9LY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199018)(31696002)(86362001)(36756003)(6512007)(66476007)(66946007)(53546011)(6916009)(4326008)(8936002)(66556008)(186003)(26005)(41300700001)(2616005)(316002)(38100700002)(6666004)(82960400001)(6506007)(54906003)(6486002)(478600001)(2906002)(8676002)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2lxaVVRblVpQ25vMW9FNE9Db3ZGR0U3aFNkdXRoVUJSTXluYWI2UmM2S0lD?=
 =?utf-8?B?RDVWVm44QVlpbCsxRzhqZmo0UzlPa1BVUjl4TXBiNWc5b25yUDNabjM4NGxQ?=
 =?utf-8?B?K05ld3J2S0hRWnpRS29rRzEvMWpiYWFJQkg4cy9jdG0xcmNiQ1lNUXpueno3?=
 =?utf-8?B?ZUpjL0MrUVdPK3R2ZERvNXFTWm54cGlsT05EVC9XNEpaVVlBSy9YRUJoc00x?=
 =?utf-8?B?WlpDazNiWkpqMDlqMGlyRkk5T2NiUTR3Z2FjSmp3cE1ZaWRGWDY4NXJsTnFH?=
 =?utf-8?B?UG90MDFxc3JVbStmaUIwNnV5Y0JIRTBjV3JDTVIycnFINHlwZmJOVFFmV2Z6?=
 =?utf-8?B?dnUreFRSRUdOYzdHMUlJMjFDZE5ueFBZT0YreGFhdVNUM2pCRXhRTlNEY3Bm?=
 =?utf-8?B?QTA2d2EvZ1FVRTluWGx2SjdqWldqNFJLZGc4eFRWYnFtNmxYM2FOVjBnUEEw?=
 =?utf-8?B?Y3BmUHIzeU55MXljcThWQjd2MVUveS9KcyticzltTzIxQnNyN0g0WlJYS2Jn?=
 =?utf-8?B?bnhRV2ljanJyYW80MklERHZGcFUzZFBIUHNWN2UyUjg4MXc1TWo4bUFPeWRt?=
 =?utf-8?B?ZnIvaFcyZGJzd0s0SVVDSkU1M1FoMFNSNUJ2aFN2WkpDSmszcFIwN3NIZUxV?=
 =?utf-8?B?Um9CNFRYY3hYcWVQVlFETW0zYVZvL2VNakg4OEZKRWk0ZFluNS9sb0NXL3Rk?=
 =?utf-8?B?QXpWcGhwZ2ZxSU0vUVFCK3RIamw1ZnZVRHNhMGtzUFFWc2tPYmk2bDFETkVz?=
 =?utf-8?B?Wi9JRFUxNEZ4OEtxZ1lJajZ2djJOdzFpY1VTVmMwMTlhamNSN1FjeWpUd0gv?=
 =?utf-8?B?NE44NDFVYjkyWmxWbkgrUFltbDIrMXBmMGE4Um5Jejd3ajFBZldoaGtkN2I5?=
 =?utf-8?B?bDhEKzBZZCtmUXc2RnpZcG5ZS0p0UkFRNDA0UXpad2tpRTl0TzJmZnZqekt1?=
 =?utf-8?B?UndBYlBvcE9pZ3p1UmV6dzVSbnU3MEIwakRFNWE0M3lYd1lZSHhpSE5ycURR?=
 =?utf-8?B?SjJSeEpQeTV4S2RMUlJ2eTJobGhyVkhpMjZvRk5GbXM2eVpncmpDQlVHcERO?=
 =?utf-8?B?QU9yN3pVUVB1cU1KRitXejFoQW9PMzk3ZVJTMTg4d1JpVjRBTlpwK05lQ0RR?=
 =?utf-8?B?dy8rWTFDQjFncUd0TDVTamxTcjhheE9vUUhxb1hMYUhEUHY0VEpjOWM0dkhI?=
 =?utf-8?B?NHgrcXI5dmQwNVJIQnIwSkI2QXArdlFnTkJGRXpRalZhK3BCdlBRbVBYSC81?=
 =?utf-8?B?QnpGQlR2MFpOTytOQm5YWTc0QmVaRitqZnlWYkZDNFJGaE51RXRtMEhWNXRE?=
 =?utf-8?B?ekVYUFAxQ1FnYmlKcFBJUEt0enoxT3A1RXA1RnJrTUhCNnExNEFwTHNjekZn?=
 =?utf-8?B?QXdKeEY3WlM1RXdKM1BUc0E0aGVBTElUc0N4eWxVeUs0K0t2V0RBTXB5WWhm?=
 =?utf-8?B?M0Q0cnJSaGdmQ3lKRFBRK3VEZWFYMDRYdDRLa29LYzVzR1VRZTBFcFV1bnNK?=
 =?utf-8?B?N1RKckZ1ZC9lbkpLQTNsVC9YSVVHV2Z4YnJEVk82R2loMFE0SThDZk90RXJ1?=
 =?utf-8?B?aWlkYUNzUmhWY0Jyb3NScWdON1pSQjhPbHBuRXI2OHhBMmZpVVlTQkRaSnVt?=
 =?utf-8?B?U0NveWxsRlFzdXlHMHhmMHdiR3gva0QxS0RUWUg0dEZob3NodXBaV0NqL2Ft?=
 =?utf-8?B?WS9EMEhsNkVXd2ZlTG9qOUQ2VFZlaldtN1N5VzdXc1BuTkFCb0EvZlRmck80?=
 =?utf-8?B?akw3WFZ2d0lqdHArUVM5R0VwQ2g3WWdGcUZOa1cxVStYc3k4K2w1eVFlaUQw?=
 =?utf-8?B?TW84WXFzVFpkQkhpajhaWHhDRjVSS3pjOHZydHBMRXltTmh5WTdQMURDVVFa?=
 =?utf-8?B?cC81cDVEV0E5YXR6Y2czcXJkL1FhajF2SytaOVNWYnFySHJHbGpxWTNUL1Ra?=
 =?utf-8?B?RWJMNGNMdVZwM01kSlFhWGJkK1dudUxDblg3YmFCRXVXaW1xSGo4OEFZMlp5?=
 =?utf-8?B?R1ROd0tpSnNaQmovZy9nYnRpc3pXS2pvWjRQcmw1TzVSYTUwb1pwaDVtMXZR?=
 =?utf-8?B?S1d5emRhYjdpZENsYWVIQ3JpejgvMFpxN0VGVTJxZ0VoSFpwVm0ydnB3Q2NL?=
 =?utf-8?B?cFIxZFc5RlB0RnhVbGZ0WWJqVFZ2dFpPMGoreTVIQjF2c05EVjFrUjRCdnE3?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wU+auJYotSzbM47SxDqIdkFRg9DYyGLl9k93g8JRvPpNv3z5sG+q4qT1V6RwM+TX6Mj0B+PxNh9xzkGNV1vRaKAeb5JZtlvgKhz+iNWv/0ZzU2IIen7L1ASRQrCsrpWe3e1o52/bzCIhLGtaBWBN7GFqTy+T5bgwlwiTUHPt6Ayr4i6JSUyUAsBnbMc+d9x7+mSKqBTra2FfDYVRyjKnix89DZTFmhPLhI//wsAolww9NNeas1O2itBCS10u1C5JHb+OmK0Zj2irAqjOYynX4OK0LCKmIUEa7yCLIcnp3SvFpZI5LOUk9J4/Oh89ZoR6MjxUMSe1ABedxFlphj3tAsLAyM9oFENtdU7B7JWfXbUMV52eIghnuqmAptM59iY2z5H4saLevVQEUhvCUA0/6NXHWFT/2Tplbfpb+UvRctz6DJ8bG5MDkA0TlKrApUclDCaq0oPxu1fFP0eICraSt4pAPZs/XcidT6MzACZwOSTXY+t59r22lGdQ8cMTqD2xOEJZ+HcdzW9U4bqmMxMa0Y2S5yPU1Qm65GhFmWX2FUBP8gFHXtdNRE41Th7UWIrB+T49yvQYBEVTBFxArIV0oA6dawbexCXjpLm6yVUoC7svbD0KpIAPpQZJAXOtmDF+tEFHxB5RBc10gq/vz79bftbI0R/cIm6woDdFKqUOhygXTD2MPm7iSMukRcfo8REqt8aIfl4H2HL+9o8LZbbErHHAhuW52nZIEpzpTQRU+cPOCCMpyw392IkQXKCjnpOFZkVXxr+6S/9RJCh43M2FL+q7mSKVBrPOybp72ieJk+EEzPMLiv89LgEflzaZnkgDScF/3kcIu3HQgFjqECx53qEusdM+bda7RiiYDDK559HsZMOYei+k3mlon0EHyNcR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736380b2-cda7-498f-8a8a-08db14f0c691
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 16:20:56.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N60JA1mpMqNdwLnjpSftbdKO/qdPSh9lz45kWCLztT/UXoWu6xt635OVP+6jpezCmxzbfTq86S1MGFb8cJHe+Pq15fAnR/IvGrK3lJoyZvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6179

On 22/02/2023 4:17 pm, Jan Beulich wrote:
> On 22.02.2023 17:04, Andrew Cooper wrote:
>> While testing the rebuilt debian unstable container, I found:
>>
>> common/core_parking.c: In function 'core_parking_remove':
>> common/core_parking.c:230:53: error: array subscript 1 is above array
>> bounds of 'unsigned int[1]' [-Werror=array-bounds]
>>   230 |         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>       |                                  ~~~~~~~~~~~~~~~~~~~^~~~~~~
>> common/core_parking.c:31:21: note: while referencing 'core_parking_cpunum'
>>    31 | static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ...
>> NR_CPUS-1] = -1};
>>       |                     ^~~~~~~~~~~~~~~~~~~
>>
>>
>> which is an legitimate complaint - this logic is simply broken with
>> NR_CPUS=1.
>>
>> In principle, I think the best fix is probably to have CORE_PARKING
>> depend on NR_CPUS > 1, except none of the interacting x86 code has been
>> written in a way that would be compatible.
>>
>> But it also occurs to me that this is the kind of thing an embedded x86
>> usecase would want to compile.  Frankly, its niche even on regular x86
>> use-cases.
>>
>> Except having looked at the code, it's a different to the other thing we
>> call core parking which is the smt=0 logic to keep the stacks valid for
>> cores/threads we don't want to use, because of #MC broadcast problems -
>> and this logic does need to stay.
>>
>> Thoughts?
> See "core-parking: fix build with gcc12 and NR_CPUS=1" sent back in September
> last year.

I'd clearly missed that thread, but the final part seems to have agreed
on a NR_CPUS check, with you saying that you'd send a v2 "in a minute".

~Andrew

