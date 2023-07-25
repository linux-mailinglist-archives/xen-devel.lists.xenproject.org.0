Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9FD761945
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569672.890605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkT-00056S-H5; Tue, 25 Jul 2023 13:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569672.890605; Tue, 25 Jul 2023 13:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkT-00052v-D2; Tue, 25 Jul 2023 13:06:45 +0000
Received: by outflank-mailman (input) for mailman id 569672;
 Tue, 25 Jul 2023 13:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkR-0004BN-Ry
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fabb7852-2aeb-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:05:52 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:36 +0000
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
X-Inumbo-ID: fabb7852-2aeb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3YW2uWrH0cDvz/qKgkm2RdMtfdnR+LKEqygNTbfvJjA=;
  b=dQBSZwaLQj5QMfayv8gWbneKNrWBspYvRwlWncrCsMjexZFTuHl/T+Dg
   nNsQJipwFM5rZkZ7ciHzUGjtgOz/U5SAafRdRnznzrdn4I5M98uykXgkC
   5/TTNcRiF7QNFOWQ+5gjAN+Rxw/JO4Huom+nrsCJYN8TRubEc4WDIWhMX
   A=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 117795529
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l7pT2anBQev/1El6WeMxiSro5gylJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWDGyEaf7Ya2KmKNB1Po7joEgH6JHXmoU3HQA5ri03QyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5gKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dU8FWAITQiSvaGv0bi8FrlwhcslcNa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieewWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqkB9NPSefpnhJsqFqQ51cQMhkaaRyE+OCgqxSYB+ptE
 VNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEYslF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:+GvE36FnwL6TdsTHpLqE7MeALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5IUtQ/uxoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-Talos-CUID: 9a23:U3I9Dm9HBBJ/JP5JgxiVv2cwJ5AgUWXM9jTJMkW/VTZ1S7KTFUDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A/e139g9kVmO+sRO2Skgx+DGQf8Brwp+tMkQBrdI?=
 =?us-ascii?q?54tCdFHZWZw+vtiviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117795529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCtSwQLq1Gls2hTnfurr/Xz9Nz3Ia09KzLde1qICbHmLAWQAsZFGdCl6vmCS+jiCwcyjNIfYF/rjoqKboBHU/bUKpGeu3kvRetgYsY2GQGY4+HK8gi07G7rU5+ZQjxBcK3nlCXrFI5lTeJ0EOuIu7QU/s9VcBlIGmp8WIcHj23gJ8QxeJX8ha4wIy7m7E6LSaMMfwM1rxAW8/3+4vYJSn4V7yt7mpd4YPyhsmqunW/C8iHobu/xMNiMohP2Z56ozdBXhqeeULvz6tb1J+8MA2Hg3sR3O809JNsTe7c7PEkoxSWONyEkH1WypVhl7l9pGx2RadCSMMvukN1zJUb67jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VuaruMFBkjm32zvsZJXEPKcdb4HJwG3XWzAhS0qQtk=;
 b=egSXSQeMHCwIeJN2dpvvH62kIUQ1tlFbUSBL8g48Sji+HJbUnlQfK6b668NfY6Uhfc8kol5fIzOBTKVxwBja6AXg/o6pqznI0I4y/LrHXJDyMXo3Hg1Nk3Oy3czFIsYIaOGCxPy0YQK/rPuP5zIKdP4oUvhrgZ7YwNUkTAWLD9joXnT99jcpk/3V/DTI4Uy+jHeGhp+Fv7xT3awil1lsiOOPOYdLvL3yqOpGoDR6uGdBczv1zOj0ke+AJO9vWU1/wA9oeIscJrSMzsbiGF++N3+M4YOE2FOKVKk1pxCPn2Nzg2iMeKnrQZ0wcgSqEQOcErIQv9gRaKa7Qbd3+DPyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VuaruMFBkjm32zvsZJXEPKcdb4HJwG3XWzAhS0qQtk=;
 b=D7JVqtUg2/4SIQauCDh2Bv90795Fq6HQJSezaVChS7maYb14ZxdPyN0/mSzfQ8hxsSpz+9FngzrD3NgSIqw3Dw1AS3+crFzMh2HNkvHVOi3/pUkkWUtPCcgvcd1KRm5WSpsUW2RDWnxL9/vlEugG3mh8UIF47WxrReNB24CjQt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 4/6] libxl: split logic to parse user provided CPUID features
Date: Tue, 25 Jul 2023 15:05:56 +0200
Message-ID: <20230725130558.58094-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b60524-1da8-45ff-2fab-08db8d0ffa3e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNw0DSUyAqQaAVVCQd2pMffUYw5wdLUDH7Uj0y4oQo9G7THSjfsJzdsf49TFEKDqh9QHTfiidU36G8krmeEXEYi/7J2h8Wo/xiS4rd2av+PNp+rzvGc1+H4C1XK2F4j8bxRZWLx+cKpd1qiqPVrwU4oB4dqkkJRL4TgCGA5/Ojof0PXQuyF/tFwOJpocT1Ux5zByccbvLaxYSDoTS4yUiG8Sla54TNB3/iTS+xR9sbVOmkW4thMtFBcS00ZDVSIHPOYgB64l5KRuQsHVIOvur/lfZJMgr5rCkqpUEyiMgKPXsTIRAQ2BBP6gPMBTBCyzMsIT/mGzhi8LxvJpVSuqgSwXWn28e6bSLVRV3grUZbGRScYCIweE1k3WdpjceeUGBATxAP+V2YtFFCY+kE12Ja1SN0D2AIBxxhg01f5ff0yT7jNwpTXzt7MHoR+4Gl1HTDCJHxcFRxq2lW2RBWuSHwrIMtxHqYjvdP+5TZWoOo+AbFnQ+rMV8dcX0Aj23SjT1b+uuIjAYU8Brw/x/3DpQZrEhNBbn11Fte19iQyATB2vumH23vAnjwAi1G77OPCd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YldKZ0hneWNCZWl3TkZOUUVOV01TTklBTXJISTJqZW0wOU41V0ovV29IaktR?=
 =?utf-8?B?d0RlRWZkOU5GRm0zK0JGNDlJK3VzN2N6aWpwZCtrdU9vMUs3c0h3eWZlTE5a?=
 =?utf-8?B?MVhhU251ZUZHU3lPSUp6Znhlb0JzWVAwY3g4TWJoYVpjRU9EM1NUS251ZExz?=
 =?utf-8?B?eHRHbE00NFJxdTkrbHJyTG45amVrcHFaQ0Z6TjJmMEs3bmZ3UmRHbGU4NXBM?=
 =?utf-8?B?LzBENkQ0TkE2a3l6MTE0Nk9ROFNVNVpnQmhaSy9WWVhkcklTTFJ0NG11cnJC?=
 =?utf-8?B?Z3RKeHI1bldvQW0xL0FjVjMwaHVzSm5iaXZQOWE2NVRGMGRaWTZaMjlhVE5i?=
 =?utf-8?B?NklWNENhUUxXVFpRSEVSWTdRYm9SSW10OHkvVjZBY1RrbU55NmNIemVyN2li?=
 =?utf-8?B?RG9HMUkySGY1czlMWFpQdHE1UjQvcTQwa21DZlhWNnQvUXpzTkZYdU5TRUhq?=
 =?utf-8?B?SEVRYlUxUkRpZGIrZG1jeXhZaVpGL3FFZGlRTlU5UUp2Q2ZaVDhBRXROZE94?=
 =?utf-8?B?dlhoS0JYWlBELy9Ld081bWI5cmR6UkpJeUFZbG9iQzJUdVlpTUdOWnlMZ3BW?=
 =?utf-8?B?UldldG5ZMDl0Y2pjREd4ZGpIQVE2L09DYS8vRUdKSENkeXZKdkw4bmlwSTBm?=
 =?utf-8?B?cHc3Q1pUTGVEdDd5djFsTG93a1F0RUJROWFULzZZSEF0ZkpTdlF4c3A1cWIx?=
 =?utf-8?B?c2hVcnpPeHdqYkZPWldGTk1NNUpPclhYQWhyUmRsaUFPaW1GNUFOTStnQm5O?=
 =?utf-8?B?YlVJSUFsSG53NVo0QXdzTWFkOHFKSzZBejJEdlBhM1QrTHNZdXZGYnB4SytC?=
 =?utf-8?B?RVk5R3p5SEVNVFM3UFdlZkhWdlBsTmJHbnc1TzFoSkM2dW10ZDBNbnBDbUgz?=
 =?utf-8?B?MHc1SjV3dHFIeDZ4a2d3a0pLdmVMM1R6R1F1UittUzVKdExoWVk1SWF6Tnhz?=
 =?utf-8?B?Zm96RzIrQVhiYXZOSlB4bVY4SW5nK2tDa1JXaVcyVkVKcjBxVmpaYjhCWkJ1?=
 =?utf-8?B?czYxdGpKNEg3UmFabUdjem1GT2lBT1QySnJOL04rbzJENHNiUytjTlZORnla?=
 =?utf-8?B?QjM2UlRkL3ppTGZZaGFPendhMUVjR21VenVUWnhuSHlmdFhYSVFoTkN5UDB1?=
 =?utf-8?B?QStTV09mZWplaDhXTDhXYTVIZm90VWd1ODFBUS9RaU02M0V2b0ZFQkxiSnM4?=
 =?utf-8?B?UjJkdzVjTEs4dktVMGRkbFoyU1RzYWdmdWNCT1MwOWhmQm5qZzFWSG9vRkRQ?=
 =?utf-8?B?a0hRUXAySkthWEF0UUFMUnpVY3BZUitOL1BKLzRGUjFZK1J1ZmZZM2ZzY0cr?=
 =?utf-8?B?ZXpUVXkzTFJWNGJZRExrUWJBc0tnNFNmaVR4SFNmRmxjNng1VTE2K1NrTG1x?=
 =?utf-8?B?d2lDRmVaMm9BZDV3RmZiNitUR0E4OWc1Z3RHc2Zza0xiQWNQQTB5T3RrZ2F2?=
 =?utf-8?B?clQ4ampMRDVOVXVCMEhqenpQYXlBaWo4UVp6Vk1CMUd4MDRHd2Jxd2ZHWExJ?=
 =?utf-8?B?QkZrRDM2VzRyQnJPSkllK3JXc3VQT2NxR2lDQk1xTDZSdzBvRHlhNHpaMmd4?=
 =?utf-8?B?KzY0dTVFOGpra3F5QUI2OE16K1paMlFHY2kwcVNJeW1kcTNEcWdvRDJOTisy?=
 =?utf-8?B?UnA2Sk9yQjdJVHNXdnhQSksyd0VzNUQydFE4T3U5U3VJVXNkNnFZTXhsVVpi?=
 =?utf-8?B?SHBtSHF1Z1pMRngydktXNHBZaDVQUUgyTkVDT3pzZ1FXbTVMNlJaTUxwNEIy?=
 =?utf-8?B?TGEwYnpVQ3NPeVQvTW9VWFpPcVgrOGx6dExzR0cyamUrR0ZybE9ZWTVqQVhm?=
 =?utf-8?B?QmJtbWJNL1dTL2E5SE1nYU9hajJHaXFMakcrWE9kdXZhbUx0UllUeVFZRWxB?=
 =?utf-8?B?cWZjLzhDaGsvajkyR2dFZFcxSUlBOWYxSVFNNE9rYTVpZ3N4amtzQ2Mybjho?=
 =?utf-8?B?Tm1NS1BCTVBnSWZhS0tZeVl1MGs4bFZiTUZaTzF1MS9ibEllbzhLVkpYdWRN?=
 =?utf-8?B?RUNVYm9GSWNqa2ZJOVlIcjdjaWVhWWpDL3lGQ28xUEIrUndjQU9tdTJ0NUVW?=
 =?utf-8?B?dmdQRVdCbHBQckRHWFhMWHFlUnROVW1iOGxMcUgzL0J1cmFPU2YwaVNJVVFV?=
 =?utf-8?B?YVpnbm1GbkVXM1FNaXhvVjZHL2t3bThLZWRoUytjV0EvWDVtUWxXNUJwbDQ5?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sV1F5z5smsqDnqQ38HRij+UF7jxC/aXQOTTzJBROlpSO21S65of7N51Ouc7/OpefhgjckT1ka3sAWd+EYhCj78FX00hzw1r39ByM/qznFHUH3kcelRXnE/9uXg2Bve5qHjgfaZOnX5KahiPj7u8LHJyVju8Qkcp/yNwB9RjJTOu+YGXD5UGgwzfHXdPhUw4CxTadGwWrMDMq4QIY0rqYNBXAuEctGxyaLduteaZ7pAN3/83XQgPa0DxGTtT3aWvKcJEdxoGF8GlHPsVo3zicmL+6lOcqyXZew/tGVuQAodQKwHj5H6RZbfMSfKcJoBaQitXS3E2wGTc1FhdVSnnrX+C8ukt1ykz/AoebNZ8AatZPlvP2iIJCSTFTOjld736BoDyNWQto0NrZ0o41p6KFSvT0oTuFyz60s5oFMwGR8E5Rr2+1E45Znt8GK8lumCUBVptjjRWOPbX9qs1/Fc+ilzz1gptKhcBj1afsPyLpq/T9Lc+byEY/6OFltb8IuGTyvosZlc1MdnBRe64Y4c9EsaKL29OPw9oa95ZfFN2d/YZqqQLhoeVn/6N+f0lsZOtyjirxaUZeuIqmVd0QmyQO/Mouia2eZi0iyo9GpJ2EoFh+RmRLx0fznwbXugtdpp26hOd8tjSNipGtLi9djQecX275p92IRQ/zLgET1Iexkj4PziD9cfa9WoSINw7A++QCEmH1EE3bOXUHAM6EMDZkeJf/jd/B+KAlE3fWv6m6IxUgqr2QrpeIKW8Oa56Q1E1k0IEMT2Nruty+mDwx4Abkgo321u1VmjvVA/o6Izg1ziQIpa+AapzCb25OwZye+LcC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b60524-1da8-45ff-2fab-08db8d0ffa3e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:36.6710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XYaVcH2aXV3HgNi1QraV9fTnZT6qnMFZP3HuUMVrL9brfqM84iy5NybVjjcKfzo9gmkGsrrAi5zpmY5iLUUqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
newly created cpuid_add() local helper.  This is in preparation for
also adding MSR feature parsing support.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v3:
 - Fix UB and use strtoul.
---
 tools/libs/light/libxl_cpuid.c | 120 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index dd97699bbde7..f04b192c0e44 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -96,6 +96,66 @@ static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
     return *list + i;
 }
 
+static int cpuid_add(libxl_cpuid_policy_list *policy,
+                     const struct cpuid_flags *flag, const char *val)
+{
+    struct xc_xend_cpuid *entry = cpuid_find_match(policy, flag->leaf,
+                                                   flag->subleaf);
+    unsigned long num;
+    char flags[33], *resstr, *endptr;
+    unsigned int i;
+
+    resstr = entry->policy[flag->reg - 1];
+    num = strtoul(val, &endptr, 0);
+    flags[flag->length] = 0;
+    if (endptr != val) {
+        /* if this was a valid number, write the binary form into the string */
+        for (i = 0; i < flag->length; i++) {
+            flags[flag->length - 1 - i] = "01"[(num >> i) & 1];
+        }
+    } else {
+        switch(val[0]) {
+        case 'x': case 'k': case 's':
+            memset(flags, val[0], flag->length);
+            break;
+        default:
+            return 3;
+        }
+    }
+
+    if (resstr == NULL) {
+        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+    }
+
+    /* the family and model entry is potentially split up across
+     * two fields in Fn0000_0001_EAX, so handle them here separately.
+     */
+    if (!strcmp(flag->name, "family")) {
+        if (num < 16) {
+            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
+        } else {
+            num -= 15;
+            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
+            for (i = 0; i < 7; i++) {
+                flags[7 - i] = "01"[num & 1];
+                num >>= 1;
+            }
+            memcpy(resstr + (32 - 8) - 20, flags, 8);
+        }
+    } else if (!strcmp(flag->name, "model")) {
+        memcpy(resstr + (32 - 4) - 16, flags, 4);
+        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+    } else {
+        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
+               flag->length);
+    }
+    entry->policy[flag->reg - 1] = resstr;
+
+    return 0;
+
+}
+
 /* parse a single key=value pair and translate it into the libxc
  * used interface using 32-characters strings for each register.
  * Will overwrite earlier entries and thus can be called multiple
@@ -340,12 +400,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
 #undef NA
-    char *sep, *val, *endptr;
-    int i;
+    const char *sep, *val;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
-    unsigned long num;
-    char flags[33], *resstr;
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -355,60 +411,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
     for (flag = cpuid_flags; flag->name != NULL; flag++) {
         if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
-            break;
-    }
-    if (flag->name == NULL) {
-        return 2;
-    }
-    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
-    resstr = entry->policy[flag->reg - 1];
-    num = strtoull(val, &endptr, 0);
-    flags[flag->length] = 0;
-    if (endptr != val) {
-        /* if this was a valid number, write the binary form into the string */
-        for (i = 0; i < flag->length; i++) {
-            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
-        }
-    } else {
-        switch(val[0]) {
-        case 'x': case 'k': case 's':
-            memset(flags, val[0], flag->length);
-            break;
-        default:
-            return 3;
-        }
-    }
-
-    if (resstr == NULL) {
-        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+            return cpuid_add(policy, flag, val);
     }
 
-    /* the family and model entry is potentially split up across
-     * two fields in Fn0000_0001_EAX, so handle them here separately.
-     */
-    if (!strncmp(str, "family", sep - str)) {
-        if (num < 16) {
-            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
-        } else {
-            num -= 15;
-            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
-            for (i = 0; i < 7; i++) {
-                flags[7 - i] = "01"[num & 1];
-                num >>= 1;
-            }
-            memcpy(resstr + (32 - 8) - 20, flags, 8);
-        }
-    } else if (!strncmp(str, "model", sep - str)) {
-        memcpy(resstr + (32 - 4) - 16, flags, 4);
-        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-    } else {
-        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
-               flag->length);
-    }
-    entry->policy[flag->reg - 1] = resstr;
-
-    return 0;
+    return 2;
 }
 
 /* parse a single list item from the legacy Python xend syntax, where
-- 
2.41.0


