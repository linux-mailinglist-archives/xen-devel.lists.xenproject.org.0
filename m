Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC973320D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550226.859207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N1-0000qX-KL; Fri, 16 Jun 2023 13:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550226.859207; Fri, 16 Jun 2023 13:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9N1-0000o8-Fr; Fri, 16 Jun 2023 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 550226;
 Fri, 16 Jun 2023 13:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9FF-0001xG-CC
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:12:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 625e0382-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:12:04 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:12:01 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5736.namprd03.prod.outlook.com (2603:10b6:510:37::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:54 +0000
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
X-Inumbo-ID: 625e0382-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jjb2XN3FlzP7GiqggDJ+sTgjB6pTu8yM2HN3iWebSd0=;
  b=QHsaGcxfDmK2g9BUOHwxDL1rkqdpBALEPG7dszmCzPCLYXohDNSWgDdH
   OtlqJeRUo6A6YtWCiyEYi6ad3/PTkZRVT6BW3yIEBLt1NrZL7620hOtYu
   E2fYu5zksfZuc9Tb4fsqQ/0SpCTsIjJIE8vX2YsaoP3G29sVt/Mf3R6Eq
   4=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 111813143
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5IY/4a27Ou1eVU7/NvbD5fdwkn2cJEfYwER7XKvMYLTBsI5bpzdRn
 DQeUWiBafaPZWSnc952YIy08x4DsZXRzYVrGlNppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIUBj9
 KUJORY3X06mlsev2qDnctdvv5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFMZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137afxHiiBNl6+LuQ+Kd00Aai1G8oNSIYf1CSvem/iW2jVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaPCEUKSoIY3ACRA5cu937+thr0VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:I6m4saAme8S7pJjlHeg4sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssHFJo7C90dq7MAjhHP9OkMAs1NiZLW3bUQeTQr2KqLGSugEIeBeOvtK1t5
 0QFJSWYeeYZTQUsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue73q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhyM0llWjo6i+quGRhOerN/b8y/T97Q+cyjpAUb4RFIFqegpF491Hpmxa0u
 Uk6C1QRfibo0mhA11d5yGdkDUImQxel0PK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7q15xmqAnfy8oph6NkuTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 Meev309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdI60rL22u7KCZkOlZCXkcYzveQPcb
 z6IS1liVI=
X-Talos-CUID: 9a23:4UQj2W4Ai940jGX7adss1G85G5k0Y1vn/Sn1MmqhE3Q1cIOWcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AHCQjBwxjAQpLSKsRNkZJxFHd5DaaqKr3FhBWoIc?=
 =?us-ascii?q?FgPS7OwZ7EiuNijeUX4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111813143"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L39OD1CPGuXNeI5nj4RcqImH9pRJRtXky9MIsyAMNfwK298pMOBlHN6Kb9U76Dk/x2/GcorS+qN0ixy3fj+/ckR2Q9sedcypynYvnDQgGyGM3rrYUE6MMm2/obcsPzO5lZ4JEkMUOABXgGV8f37F2tNugq3j7OEDghGoA7Mvk5WpdL08Sq8d8eEmwKz2/Bp1oXfgPfbXDhvqGe34ufFsQrgA0Q/llI+zx+50m12TdD20QhlhSY8i6FoK7Q6Iou5i1kSZ6GxJOqFvW00s/0MNLxYK6iDQpv0lOZtSxY68f0PNA+IPRnAauVpnShtxETJUs3Q98Ndg9/5eD/TbyR3fhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B45CPjJS2wNothOhTq7SFJvAgWc7InS6Fke8gTqrsao=;
 b=dlIBDVNjwhPGu+qxHkRCWNQllsfmIblm8Wq9piROwWkmrhp4lvUaTSiYxnOJ6r2ExkzcWkMdU5FgheCRjlCj0OiGZHKuefut95ESwnfwQYwA+sS+mCULeREej2/cwQ8dAtSnfpyrjxieYQ5+ItdMMCbzu38UEtYFqo3pxjOtplnQBV7GkyCEMfJ9+zsCNa+FUEAgmSMvMpEUSwwfA7EdC02z5jtv7ECisF30O9YVNL9wZjHu8yZU3/4ZG37gPisU4mkuTnBgPwHKjrcXYD3/TkEQT+32FLyNf7c/oPFPmKocrE0bsGQdP3vuPQ9XzpRcwMTE2WT42MH80/4vmkUaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B45CPjJS2wNothOhTq7SFJvAgWc7InS6Fke8gTqrsao=;
 b=Yi1y4vscRanWwa23Owoxs13vmv87bjr+v1cg7j3/BUlmvNg28486jFFRDxo34zLjs5xm+hrjqUA9A95dU1RStA7Sj6NX/LjrVlTuBKD7K6J6hnzl2n30y2etMMtJWVZ2yX0RO78zt0oqkOoqAw02X86PI8HrZSKhINYjvQ2g+cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 10/13] libxl: introduce MSR data in libxl_cpuid_policy
Date: Fri, 16 Jun 2023 15:10:16 +0200
Message-Id: <20230616131019.11476-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 0302a3f6-12bf-4eab-cbff-08db6e6b41ae
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kzDQcHNV49mBBTM1/RF/K5wHDrJs3xzhPThNsdgJXU0h7oCoSI2uEw9mR8zsqwNiXq16yLAWpiLXwZ/kA7fjLTDsR4E7Wo407S3tFE3BViEj/RKwZ0oi3/lfnhXxWCn0lUgPHc5T0KI4lgMMzGusPc45Hlf9AIpWBEtzMQqIjV5aH2sS0m6Gc/+uV2UyVBPkH7B3ix/j/7RwbFHKb/ETWrUlI//LozeDFo2n1VwFu5NgI35n6msmua8F4KcoHh3sGTMQruLTTbL1L6139w36xkgayVcIJlfmHWOv0rvT1ibnKnf6SONEBGkufb7ou8mY+Ly0sJ4ezQU2GrxiY3wrsLn4Ql+2i4WNPcO7CDE6v6/9zHLFFpLo9zmKO9w6t2Ty8xI6CPv1KNtmSzBm8vCTnn+V0HMYpiPGZmbuz0U/agmXGqiT9ifm22jrbFFMaxQ5QhwYX7RfD6roZfqvCAM5ZArs3FO+Mz+YC0J6hZG5IyajN0MA7pJR/inwY8mKviMGBlhCVHsC+OWtXn03vwu08p1I7Sxl+049V66HVm9muyyS5Wv6rlhn8VRXfesjZUux
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(54906003)(41300700001)(8676002)(86362001)(66946007)(66476007)(66556008)(6486002)(6916009)(8936002)(316002)(6666004)(4326008)(36756003)(66899021)(478600001)(6512007)(26005)(5660300002)(83380400001)(6506007)(1076003)(2906002)(186003)(82960400001)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YURaRzVkeDdMQ3g4SkRjbzhLR1I0SFdXWENwbnpJV3l4OWpwY0FTcDVmMXRn?=
 =?utf-8?B?Y0xNUTdoWVZhVTBITkVyTWdzc1hWMXhTaGZXVTFrWG1QekxCSEdsaFVFaURh?=
 =?utf-8?B?bXpXYXdSSFdRNWswdWU3RXZJOGpMN2tUNnBkcFdvbUlUamlaVWQvYnk3YWJF?=
 =?utf-8?B?VS9mWWg3dkVCcEtBUGhmekJ3ZnJGTGlhNjlUMmJmVTV6K2U5dGtTekRHV243?=
 =?utf-8?B?c2VKQUk4emFOTmVnZm5KREswOFFEbU1XZjd2cVE2WEpSR0x2U2hTemFlQjVv?=
 =?utf-8?B?c21iV216VURRZlJoMDFCYVlRU3k0YmFyUEdzSFhCYVlGM3RwenZxUUM4UWZJ?=
 =?utf-8?B?eWVEUkxFVTZRYm1nMnFEYWwxOHhSTFBVWlV6RmdRVDFGaXJVMTJ6cmJJUGsw?=
 =?utf-8?B?YlNMZGhnMHVEN0g0MW0rRTNtaVYreXIwZzlWa1lrdkpUc0FxRGlINlFYS2xF?=
 =?utf-8?B?Myt0RnduZkhjNlZiUm1yTU11bHNISlMwTTFCV3R1bXZ0bGEvZnIzYm03cWNC?=
 =?utf-8?B?UmdpcTFWcGdQdjZkQUV2ZHhtbWxCc0NzNWRYYkM4dWpGcXZkSUR1Z3hnRDVn?=
 =?utf-8?B?ZWRtc1prTFZLUnMyc3BidjdYU1I3UnJpRmJaK1RWZnB6emQ4UVlocHhZVXhn?=
 =?utf-8?B?VlJZd2tFUERscXhkR2ttS09BNVNza2dtUHprQ2t2UkNCa3VRcnUvcjRNV09M?=
 =?utf-8?B?VUNTamlPVXBRdFI0amdkZ3dkMW9PT2F3QSt4VGdndTFrdVhoeWJDMFo5R2lj?=
 =?utf-8?B?UHpQckdzN3FIaUZSRkxydm5DdHJIT01YcE90VFl4S25sUGd0b3Bid3Q1YVE0?=
 =?utf-8?B?b0JZc3UybGhGK0d2SW5ZdGFvTGZqSjJ0WDNKZitEQUZzRXhlWEJRc3ZGRHpM?=
 =?utf-8?B?T3orREtwbFNaN3F1aG83SnVXOFhsT3NybWhpR3htZ2cyZlZBRFFUeWtxRCt6?=
 =?utf-8?B?S0dRYTdrWUIwcW1EcURCNFdsKytWVC9PRzRPeURRN2QzTmtwNERuaThJT0dZ?=
 =?utf-8?B?ZEZ5M1JhR0dnOVlEdjhuclh0UEw1TlZiUUNsOUxOd2FRV05aTTVtMm1STUVp?=
 =?utf-8?B?Q3lpb3BZZG9lOUJTY1hiSUpvL2R1aW1xVHZEVzlRclU0c0JJNTJvOUJ3MzNF?=
 =?utf-8?B?U0JxY21qVlI2UmxsY3Fab09ZekFQUGNPOFZWMmxyMXFBZk9YL2RKSmdzZzU0?=
 =?utf-8?B?eEI0VUsyWVBvMWNWWG5MWkdtRjdRTm8vNFBHeGRKU1RLU1I4NXZiZFBTNFAr?=
 =?utf-8?B?bDZzbEZzZ0VBRlluRmF0SFBLbXZ0Mzh3R2ZsZnR4T29qK0pmY2VoQ29SUEdI?=
 =?utf-8?B?NTRDQTBDSkxMRXNsTmtUelJpNE53bE5UTVNPTzVMdCt2eUNOaS9RUWtjb0E4?=
 =?utf-8?B?T1VORStBRUkzRFJoNkVKVXRkQkJMME90aWNWdEFySzk0dWdxZUU4MHVncGtr?=
 =?utf-8?B?TWRMc3FQVUVDNFNFWm1HMUM4UGVicEZNRCt2UmJRK2JKMnk4RmNxRnZMdlBq?=
 =?utf-8?B?bmhPUjd5VmpyN0tML1E3dlRBTTkwODVVOEp0STFMekVLUXkxZm95T3Nka0xO?=
 =?utf-8?B?aHlZTzYxWG10cm5ZV1lqSms0VzdMbFg3MVdDWTZsY0syekdPSXgwbzAydTMx?=
 =?utf-8?B?aVpycnl6ZzBNZUxreE8wazkwVEV1S29kRW1ZbG1jclZQZGV6eTFSbkR2Ym1y?=
 =?utf-8?B?d3ByY2FvSGdYcmRYQlRneWlIbjN5OTZEOEYzVFJiMXRQcUxBUEwybVV1LzJy?=
 =?utf-8?B?bjFadXZWOVlLM3NZZDRXVWw2QTk0Q3NOYmp0Q0RzNFBaUC94dFpwbk9CYWJC?=
 =?utf-8?B?dTRnb0JKdGtEeW5xWG5JUUdKM0tUNFJaWnZVV3R6QndPN3BxOG92QnAzS2t2?=
 =?utf-8?B?MXhaMHFUbnBtaDQzVDhsR3l5d25ZaVRvUDF1NXFlZy9VZ0MybDg3VFM3UWE3?=
 =?utf-8?B?MFB0eWsybzFRaDlESGRTMjNyMThTUDI0RkhyeXQ0NktqcFl5RXJCV2JNMWVJ?=
 =?utf-8?B?anNiM0dQOWY0ZmVHVWJNYXBPdTRDYnFJZjBSdDQyLzRUWVVvT0l5QW5wQlZn?=
 =?utf-8?B?RWNTVDUrbC9WcWxlb0FvZ2R1NjNJRXA5cm9nRjIwMUVaTmtKd3dvZ3o4bmNx?=
 =?utf-8?B?YXpxT0RhOHFRTGFHbUM4LzlYdXdxTmQ5aXVkWEYzZDcrbkloazNzVmFrRTRL?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vRyHWjTy1+FVfaec7cefF9egrkB7NczVdeUnSrRCMf9TSnL0GxUJB39tAGaJ4UOivmELb47arMCI0iehuZUg+tG/7eAdhZooiWNzfioSEWEy2eWSlbNn30Y/tyxdPBvDYNbq4feQhhLIoFkaluke1il762qWyFHkgnNqhEfes5hLqy3zO8tKgRFNMjvqwszEITMWIGrlIHm6t7IgkBnkL+GgUu1XnmUqMr8ygohVYf/4BZRn6SiH747zZeZu5Hjjcq1Y8UB3qQjsddVu4a52dWLIAmk5wC2eVJfZzviYkADhwHw0KMhZkqVQ/pALeT1egxzeP+A+mn0YLTohZJkbNZ2idCWhJrVy/BIGec2qLL9nPFxlpSH01gV2Nil1nR3oxLSHPPJw33dvuP2EqlRaVlKBkXj0xcEftsT1D5B/XgN455iIyzxVY7L5Vs2fWdRJr2zsQZUgmNY569/CAP5An6EyexBdjDisW+SnDgYaoahSWd/xK7yLx7a3cajcVw3fvTfZl2kQBOXtRowrqATh69j0swlPXjlZSO7z6+SIHSWqzokuj62z4GBgu7yWFcyUjZ0/Ez48RoPg56uP6PuRFYSpRvGd9Ce0VlppriexlsGfQvtnlDOiAMiWu+Lky4zMH/QPOFzgNoHyY1Slmz4dX7SP3Bruv9dcSxPB3YJ/gakNH31i9shvqmiTRDk9JYgfhHDGElP/utkvtCzNoCtOqyJ2j0+z0T6iENQoYwHOv+LXc/ALZxxs4I/m5+//SnmTM+ftD2S4hrRhxV28wanFJVOuJECSKYOwKhfF119KFyVYGjq7Y88cL0VME+NAZcjE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0302a3f6-12bf-4eab-cbff-08db6e6b41ae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:54.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJLNTEiyLDVB4xBzQBtC6toth8H17u52AQA9oMIIgZy8Nnj2fejzP8GLfrIa5RH4uuQfqBfRaMGT9fYlUJmXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736

Add a new array field to libxl_cpuid_policy in order to store the MSR
policies.

Note that libxl_cpuid_policy_list_{copy,length,parse_json,gen_json}
are not adjusted to deal with the new MSR array now part of
libxl_cpuid_policy_list.

Adding the MSR data in the libxl_cpuid_policy_list type is done so
that existing users can seamlessly pass MSR features as part of the
CPUID data, without requiring the introduction of a separate
domain_build_info field, and a new set of handlers functions.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/libxl.h          |  1 +
 tools/libs/light/libxl_cpuid.c | 31 +++++++++++++++++++------------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 41e19f2af7f5..4e7b08ab5027 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1461,6 +1461,7 @@ void libxl_bitmap_dispose(libxl_bitmap *map);
  */
 typedef struct libxl_cpu_policy {
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
 } libxl_cpuid_policy;
 typedef libxl_cpuid_policy libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index ded0d0b8bc15..7261c1f1fd82 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -21,20 +21,26 @@ int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *policy)
 {
-    int i, j;
     struct xc_xend_cpuid *cpuid_list = policy->cpuid;
 
-    if (cpuid_list == NULL)
-        return;
-    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
-        for (j = 0; j < 4; j++)
-            if (cpuid_list[i].policy[j] != NULL) {
-                free(cpuid_list[i].policy[j]);
-                cpuid_list[i].policy[j] = NULL;
-            }
+    if (cpuid_list) {
+        unsigned int i, j;
+
+        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
+            for (j = 0; j < 4; j++)
+                if (cpuid_list[i].policy[j] != NULL) {
+                    free(cpuid_list[i].policy[j]);
+                    cpuid_list[i].policy[j] = NULL;
+                }
+        }
+        free(policy->cpuid);
+        policy->cpuid = NULL;
+    }
+
+    if (policy->msr) {
+        free(policy->msr);
+        policy->msr = NULL;
     }
-    free(policy->cpuid);
-    policy->cpuid = NULL;
     return;
 }
 
@@ -503,7 +509,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid.cpuid, NULL);
+                              pae, itsc, nested_virt, info->cpuid.cpuid,
+                              info->cpuid.msr);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
-- 
2.40.0


