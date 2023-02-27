Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E946A4739
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502817.774815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgZy-0002VY-SJ; Mon, 27 Feb 2023 16:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502817.774815; Mon, 27 Feb 2023 16:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgZy-0002Sr-PB; Mon, 27 Feb 2023 16:42:22 +0000
Received: by outflank-mailman (input) for mailman id 502817;
 Mon, 27 Feb 2023 16:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWgZx-0002Sk-0V
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:42:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2161cf3-b6bd-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 17:42:19 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 11:41:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB5982.namprd03.prod.outlook.com (2603:10b6:5:389::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 16:41:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:41:46 +0000
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
X-Inumbo-ID: b2161cf3-b6bd-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677516139;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wb/H+wRXn5fAOMPkpALEF5sGp4DfgYIxSPs3wNeJDrw=;
  b=FOzlzbOPHy66oaJ92OERlLvV6fXkxBfbYOdHlSR0HDNdRcZxSco3agpO
   QjCw9ZGQbOKFAZ6dD2plOI/BUjC8ERohZEp+vyrqa1zr2wRTyDl9l4RJy
   m8QLXlOEhqwmPJN1ONOMPDXm/8eKwDJlAMfF8ytK4JzbKlx+VUqkodCRs
   U=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 98097041
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o+NV1KkzZbrDeweZLfNtmEfo5gxpJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDTiDM/2MZGP3Lo93b4yx9kwHuZPVxtBlGwdupH89HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgR5gCGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aQ+Om8mSxSDvf6/nI2JGsxLjZ8DLta+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDROXpqaY22TV/wERCLzAPfny/r8Khg2G/W45jK
 EwR2jox+P1aGEuDC4OVsweDiHSZpAwVX91cFPIzwA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwJC5TK2YBbC0FSAIt4t//rYV1hRXKJv5gHbC0iJvpGDj26
 zGMsCU6wb4UiKYj1a+24FTGiDKEvYXSQ0g+4QC/dn2hxhN0YsiifYPA1LTAxfNJLYLcRF/Ru
 nEBwpKa9LpXU8HLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMYIVJd2Rcebu76MNvk=
IronPort-HdrOrdr: A9a23:HSHjOKrvhoW2J7aDZ6x+P6caV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwOE80hqQFhbX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YGT0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dNT2CA5sQkDuRYTzrd3GeKjM2Y6bRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="98097041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2jbLP/FxK3p+7DutisZq3ynZqrR1C0dM1wWQL5FckLf6kXaSP7a4ihjhXGVCN/bJtqq2DV/teAGzqBjfNX0JrNysYA+OHBYYTu9rqnP0UNJW1x58THN5PuBTfnHiSIWH8Cx+OtDXSICjod1522EnCiM8T9S5xbjEYUuKxbC8lY4HeiHEqDeXBzUle7ZuGq1dnW3i5ZJsL1Bi4HcMmfKTsa+IJyVvdgbRlCS9hCSctJ+DYX5msHL3Gim6ufcTcl4wTF/O4iW4wvGqwiYQNskO7LR9bny1Cl3USMEnhY2/XnGKb4x89fqA/qOBjMhOwagOY/2gZPZ8VHmaTxn/7vLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb/H+wRXn5fAOMPkpALEF5sGp4DfgYIxSPs3wNeJDrw=;
 b=KC1tzldYJc+sGFHEt2Wen+n640UR2ZqBBvf6qx1rm605nJwGXb03foJpdXk99HC/hd0+uAZ5MkvdqkYGu071M14xoV/PhTARqWu2NdNyMyRV/j658el49TJU1WvbUzDthA3kqDJ053yDiewRp4UKgjKhIF71irMxtD/DH9UkJyo3nUpTrbDN0heqIuZEddN0nbuUdWDfrBF9byG9vj659loNqYg+4OH+J6RL3v10WS+jLpO3a/GHPjCaiHqSthCj1YjLn0BQXnyla9E4t/v/nxcQZ7TYtAjHq8Z/I+fLA5vorrQmYPiouclQ4rdE55E7Hl8WwQm8Tjucfo6aAQYA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb/H+wRXn5fAOMPkpALEF5sGp4DfgYIxSPs3wNeJDrw=;
 b=kZBWSUAYPveaE9U+4Hdz1JASkIilhHLbzs7AkZ+XUqRr1JEzsAioUYSikih5PB+AK/o3kQ3ml0Qkoo0WzCUwizzcPfSgpCUy9OZFq433eu2GDMx4MEfCAK+CBMWvDmGYczdh6/XL7/dmXgJ4y9Y3SRlWNPwvVBsS2QFjFoLrhoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a76615be-99db-90ba-292f-1d96c6844e1b@citrix.com>
Date: Mon, 27 Feb 2023 16:41:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
 <12849cea-58af-e13f-89ab-a7e9d4200df8@citrix.com>
In-Reply-To: <12849cea-58af-e13f-89ab-a7e9d4200df8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b03c3a-0ed6-4ff4-1189-08db18e1839d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMtccGgabSmWC4U1IKyiv3qJFDXHjHdft7zc9uw26+zeADQY5zHSUtkWFAGTJK8wikjVx0AOIdXxQD1asHr8a/aN381+Q59IdVomfWn/1hY78DhdW2PrU+4Cq3oKZJeSq01uKsiB6hfTUPTu+XCsSvI90SLfEQGzvonw+UIDzohHeDLEJaWfTXjwOzrpeGh+oKZB400OnzzFMD89xP6gAQwmMB/eCP+zQZkQCz1G3aF+gI+drpsX18Ir+GAasdbD5zqaxUDzy01JhPIZKewoyN7Ny9vz2fpr3E4Mk+LBza5D9Q2WsXjvUkVPFYVK0Qbu1ucTbir0dZdFiap1rucD3NMAyS4Q0zbbnpYGowk1ZtoMiyXx5/4vYoDXg3jie7rIDSj7Wf28DCItxtEbbXs6EzEadkYJ3C3GGA5ycLHnmzULOoBkEXDW1KKD/XCXHSeG5Gtz6ivkQJk7PAkBmDY3E+Tzi82azYLFH/+NvvmbuoUe8j43nGOW2jKO8A60UhBd8eb56NyJJ6CY6q4hsa6TpArkwOPx6WvwyB0Ix/neZAX6iGUFmbVu4tZEMSIR9s5LlIx3sjZuEA5kDNgnddXtZryEs43N0F5kw/h4zyxJt6c4+2LJR9kzqjmADp/dcab+MihgI/oLh5ZWgAcRf5Rnu0G8RiOA2JL75RSs6VGUehfrtyV1hCJpPPO2VwA2pdoV3NF/MFSWeSHUZVuGqlD1N3zksuZ6K4y4BVLwu/e1KgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(2616005)(478600001)(6486002)(316002)(31686004)(186003)(6506007)(6512007)(54906003)(6666004)(26005)(53546011)(83380400001)(8676002)(66946007)(4326008)(66556008)(66476007)(41300700001)(5660300002)(8936002)(38100700002)(36756003)(82960400001)(86362001)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJVZGRETHB1Z1I1S2RFVXBXU1Fnd2NEdjJ1R3dZTDhEdWZWTXlSNmRtTEMx?=
 =?utf-8?B?RGNIcWlZVG5QSkowdkxiY251bDIxa3Q5ODJ2eUo0MU9YeEVVMHF3QnV2MGp4?=
 =?utf-8?B?Q3BHSWZ2dFR5SkxJR2hZV3FPYkZ2bUlzTWdaNk5PVVlrUmtDWExGKytJUi9V?=
 =?utf-8?B?UUwxaUt3TXRFYkQ0VFVMTWp3NUlpNllqa1R5aWx4bHUzSkxoQXhyNlcreE1x?=
 =?utf-8?B?Zzh6NVRNR2RFNnN6VDNNQXYrbHR5RnlhQXdXdlJYbExMN1VqQVgydmhueDJO?=
 =?utf-8?B?VDdaRUVJL0gyTFlYc1VhSkxoZ0FoWU41NWFzTE5XVGs4ZERENWc3STdYbnNP?=
 =?utf-8?B?UGVnbUVISUVmV2krcUNHMHBWVDU5Z051UnJTdDRHN0NmNVZPK2Eyd2NzSmVJ?=
 =?utf-8?B?RlpudGxIakE4OEdrSkhlRGdZZVZlSEk5elhFeHlSOEJmc0x5a1IySGQ2eUQ5?=
 =?utf-8?B?aDR2SnIwUFAwT3o0c1FrTHlQWTNDY1ZaZ2ZLNm5yVlVyQjc0bmVNTjlhbTEy?=
 =?utf-8?B?c2dQcnA0dElBS3N4emhFanJxQW5PRjZubXBoQjlKTkYvbEdCWGczZTNoandr?=
 =?utf-8?B?RHh2TVVXNkdxVHpIUGVEK2VheU1ta0F3c0p5R2IzWHJoTDVobkl2OWdwZnVT?=
 =?utf-8?B?ZFZ5RGlZWDdrRzQzU2JQcnZqZEpIQ3Fid08wZWxSSEhsdk85bUxhSW5GT0pD?=
 =?utf-8?B?dDlocnJydzNPbXdhUWtRbmpiTHZkZ1Q4UURYME5MZzhkWEwxQ2xBUTU3MWN1?=
 =?utf-8?B?djBVQ00vWVk0dkxUakpVTkhXZXZZZFdMdk12MGFkcFZjL05Ya3RDNk1Qdnk3?=
 =?utf-8?B?eFNUcXBva0RJektHYWhuQi9HM3dNQW1KaWlxNXJNS0RlWXNxOWg4ay9uM0RN?=
 =?utf-8?B?NDRYUUFjNXVEa0lvUEZqNENXcGJKd3hnajNYMTRzMHBLaTlidXVGRWFxc0FT?=
 =?utf-8?B?UkwzYk1NbGpFSU1rMFROK1NEbjloRlVSRVBJeU03TEVvYWN1ZzNCaG1odnlR?=
 =?utf-8?B?NFNwdFRydmtjeW4zV3RkUjA2U1RnMERMbHIvZVFtTFVMMzdWZ3hpeHU1SmdB?=
 =?utf-8?B?aG1zR01HZ3dDM1EvazBrODhzdlFIWHhIOU9aQUhwamhoRlVpWmNITTh1MWdk?=
 =?utf-8?B?bm5XYnp1aUJxTXNMNHBOU0tGZHREeDZ6aFNjRXpSYlBiNm5DVE9sQVB5TUlE?=
 =?utf-8?B?VXRLMjJuSjh4VVJ3UEU3MFRiRVVrQlFyMDlqdWh3bEpHdzJ1SVg2OE5LVnNU?=
 =?utf-8?B?QnR0U0dHSDlQT25lQmRibExNUm9ZVG40TnVxd1ZhdUdvOXorYmdaMDVDT0Nr?=
 =?utf-8?B?UlNaRUZ0dDloL2tQNjQ3eGF5R1FmTzRHL1RKNWRJSGdCS253RjdXVmtlamdp?=
 =?utf-8?B?UjdMNU4zMW1ZOFczbHlURHdHWHIzYUtBeEtuSzFiYWNXNytFNUlPUjRSMTZp?=
 =?utf-8?B?anhJY0d6ckNmeVp1TkhPN0svR3JpYXMyZ25PQUIxMU9ab3ptbmttc1hJejZY?=
 =?utf-8?B?aFMyNzd2a2tBaE0xbmZmMCtpVEF1aDdTYjQyWkxOV1ZTTVZMYlVpZDNMTlFw?=
 =?utf-8?B?RCtOOUlWcnVWVFlJL0RNVGtTR1dTMTJRanZySWZpaDIvdTFKUSs0S0VBMkdN?=
 =?utf-8?B?V2ZyQU05WWtUaW9KVmlJbllPYzNwbTBrR1MwcjY0MVJKbEhONjJpa0xwU3E2?=
 =?utf-8?B?U0FzbWdOekI3MTFaSzZzdUc5L1puQ0hOUHV4VXFrcDBQdFZnWlZwcnk0US9U?=
 =?utf-8?B?UmM0UnIvb1IwS1hKTllGckFBT29RMUdtY25ocWhpbXVacUZWcytwcFhsQStO?=
 =?utf-8?B?UmhiVWJXYnZ0RmkybkVxNXNoT3NDV1c2ZStSZFhpeUtOdjJrcGYxb0d2WG1q?=
 =?utf-8?B?T3Y4VWNLOFladENtZGYvUnNWZHRGVTN3MDZiZzU5c2MxdHFvbHBRZzFqbG5o?=
 =?utf-8?B?VTV3WmxJZnR2NFJpMGNrU0dRYlpSN0wrVWtLRmdDb1E1WVBFY0k0VHFrVHBP?=
 =?utf-8?B?S3phWklLQ0NUdER1bkI2VDlEQzZGa2RiaUhsYjlXYWgwci9GM0JXMll6aEg3?=
 =?utf-8?B?dnRiVk5nTFU0WG5DWkZpV1l3ZjdMTlZpdmh5dmpMUFcvVVY0UDM4RDFiaFZU?=
 =?utf-8?B?YlM1aWZrcDRaYWVMTFpPKzBXR3luYmcybUsza3kwZVVJL1NWY2FrNlZNRity?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0GkQuqdIylunUBjdu8cwtGcuyB2zS1CI4MIHAWQiG7SghtRH0b2XHJQ1mjhnvLVRhPdMc4vU0pND0TzawpAg3izbAQ63BHwwYYGu3ynGNCKoNfRI0WhTaxGoPPlb4j1wLb5Wb7JhCztQuotFXuGbeaZkSLzia7ncEwbF3najG2phtjpqqYJOqC+V0cAoL3gpgNEWmURhsD/m+cMwiIDCXRSLH/eWS6AFDzbj6ivoQhgppsMhnpnCRngUDYiXTHkWfM0vEzHLej5Bqc2SBM2rAEyqozS3p5Q12HP7iqJKaLCBG3CkZ8cyiGt6auVMOUEq810SLUvOQLRn0BNpUOjbOtzoSLW/OUfck051WZXB0YIKL28sWkXIu+szsIyyuOjl75jgwHwce5hdDFHclNG1md3fI4kWJkN6Ik8Y6Vu4g2FDObrKx6vEaOEOkt1Y/2I7qkgXJQrIGPUc3403P+LY8FLmEO0xTJEpQw/QMGWJZ18qsB9gqdz7Ofo3VcpRMkKZftXsYf4O+h+GGeG1+UjTU/baxD9vClVTBX8CLgG1i0XrblWhaWiK1Md1cpw//1kDwz982bXCOaf6G/gaYV+ASlEJEo79h5FRC7YNR2eEgAzsOOGzd5euG28Hq0lOeIXmpKd9Qmjh5L2K6ynzsirzD3K+BWoBh/GmPLqduNx575fvur3wfpYg/BEeM5NEG7VTG9rlGzKitPSVmnHC1xOe9jXGRKieQM7OO+sLPazhTkIJmlTgsxv13xlC95CirKRVuVAGduiY82ERPs/p2qfNZCq9lpBh2k+lcf63uTRsGNO7+tVCMZMMA28YUq6AIygPsfxAnnIbKvZzHd+aVq72UHkqlOYqsqStYJHyfK1SgZE7fMHP2tjk+VD4D6kCVlNE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b03c3a-0ed6-4ff4-1189-08db18e1839d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:41:46.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GYq+k3a4VUkYCEVhcpoaeIZh/pqQwhlC1F8JCVjzYE0gVN9m2NCjfld61IsriirXkVW+V0hEXQgJRoOai0qEEp596hy3Uw6j7jJ4bHRd40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5982

On 27/02/2023 4:26 pm, Andrew Cooper wrote:
> On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
>> Create two new private headers in arch/x86/hvm/vmx called vmx.h and pi.h.
>> Move all the definitions and declarations that are used solely by vmx code
>> into the private vmx.h, apart from the ones related to posted interrupts that
>> are moved into pi.h.
>>
>> EPT related declarations and definitions stay in asm/hvm/vmx/vmx.h because
>> they are used in arch/x86/mm and drivers/passthrough/vtd.
>>
>> Also, __vmread(), used in arch/x86/cpu, and consequently the opcodes stay in
>> asm/hvm/vmx/vmx.h.
> Every time I read the vpmu code, I get increasingly sad.
>
> That is dangerously unsafe, and comes with a chance of exploding completely.
>
> That __vmread() is in NMI context, which means `current` isn't safe to
> deference (we might hit in the middle of a context switch), and more
> generally there's no guarantee that the loaded VMCS is the one
> associated with `current` (we might hit in the middle of a remote VMCS
> access).
>
> vpmu is generally not supported, and BTS needs further custom enablement
> because it is only useable with a custom bus analyser.
>
>
> The __vmread() needs deleting - its absolutely not safe to say.

to stay*

>
> I'm tempted to hardwire the return 0, and punt the problem to whomever
> next uses BTS.
>
> Alternatively, MSR_DBGCTL needs wiring into the hvm_get_reg()
> infrastructure, but I'm not convinced this will actually work in either
> of the two problem cases above, hence preferring the previous option.
>
> Thoughts?
>
> ~Andrew


