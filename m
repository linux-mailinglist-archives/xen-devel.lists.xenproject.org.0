Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AE76194C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569670.890584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkM-0004Td-QU; Tue, 25 Jul 2023 13:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569670.890584; Tue, 25 Jul 2023 13:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkM-0004RZ-L0; Tue, 25 Jul 2023 13:06:38 +0000
Received: by outflank-mailman (input) for mailman id 569670;
 Tue, 25 Jul 2023 13:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkL-0003uq-DN
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14d87be6-2aec-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:06:36 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:31 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:31 +0000
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
X-Inumbo-ID: 14d87be6-2aec-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JIumuHTKjeGUw+xjOuW7QgTbX2kySrmgaixI+f/zzfA=;
  b=DFgX/0HgS/T2QiaHb4SMOlJtyxJH8L2GgV540GOq+eYW3QtfvVhzS8Xh
   yKwaJuZGta+F7fq0dLloiL2P9qHRKBAGFX4HTiiRnCKSeYBwoTaxWFHys
   KkcbZf2C5i+3PTt8hLrnKhGWb0gMMlwTe5ky3ISRq+Dilac8o5G9KUnNI
   A=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 117238716
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6sNhbKl5rLf/Z6X8afdDSbno5gylJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDW2HM/rbMWb0fotzOY/l8h5QvpDQnIVnTwRl/n08QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5gKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aURDzFdRSKsvO+VzJSlbLBjm/4/Ksa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieezWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqkAtlCS+TmnhJsqHCoxWMOJRMrb1jluuukrxeRV/dYG
 kNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEYglF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:vxqEjKyhbConwiZOzTEzKrPwCb1zdoMgy1knxilNoH1uEvBw8v
 rEoB1173HJYVoqKRQdcLO7V5VoI0m8yXcd2+B4V9rPYOCBghrQEGgL1/qE/9TOIVydygc379
 YFT0ERMqyLMXFKyer8/QmkA5IB7bC8gd2Vbay39QYKcegQUdAC0+6hMHfiLqShfng8OaYE
X-Talos-CUID: 9a23:0UXR+Gyo/PqNrxMfYWJNBgVNE+ckIlbv40zdAEOeF0AwR6CvVVmfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AZ78N0Q0b79uFS/nXitHFG4zMrjUjzp+tB10gn6g?=
 =?us-ascii?q?8uJefJzFVYhiRqTOGTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117238716"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW/KYh8RNZ2GYvwGTTj0rcIpXQ4L+zCC2+QY90QTeIPAiOvzul1OOOy/zjDLaVTK4PUXuxwMNd/S73dvddsqF5P43+TJ5HolNJ9JpPrsPwXVXObWiu+ZhEXa2nzM2LR56pNzR3YzMsXeoHC01GrhrnG64Dm9c0C1C/4HkoPm6Ga+xXyZgxWduoXN9zkQh1vQNk4+zsJKvNi5XFZ+zScJ0FUVRP/fFqITPkjK6nEm+3dOO552BWAkg5OAA51rDwizfU94lxEyi2L359OBhjjJ/B7BPMU++vR4wtP2a70aAFMqkgBlRYCHY5e4xodwOHuMVQni1ZZ1+8+IinhbNhtvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7eRUdhf8n5WuI46Z6Zzvuxd+0+61lrZHp1tvM3LQ/4=;
 b=NoLe/QZvRWqstynHzS3Cp1HiTrEaeQ+wopI/xJzYgBGErrvWhG+9N9XRwRR1Ot8IH5HZv+Y1NVkEeYpgOGSRoJiFHvTx4tHt1ipGtgjBjaY3U3xVJDroyJ7X6bD4sEmJGYb4p7M5slcE6O3/Eo/Qim+5PKTA7z22RMZmiX0342ZQH95OjdBT+jFP/LLzoZ/hwoTS4Ez1nhng1cUd9sda3iyI0h+Gliswttz9pshuT391egFSwkH7ZHjdVLTYv4N3E8otNCEr+UE3kGmQWNZMS5y47Wj0lfhJx6oe+ZZW77/TghOQ6DNgOUSf3Yc8aNfLHOjUNkhgmHmTJfSjxGFknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7eRUdhf8n5WuI46Z6Zzvuxd+0+61lrZHp1tvM3LQ/4=;
 b=ElRG6uALVEPV0/HYMSz9jT7/G3ZfjqeUOJXNfgWkb4FSncpsdmyUXPLbJAvzaIVsTj2Rdl9mzZ5dijphObnFFpyc6AoVaqyCbh1BD32sXfM/ft+ZWdvoKhmiN2ziALZkWtF/1QdSyjO8b2dJvjr8R8roHE6MvhinmaXbqy3ZsrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Date: Tue, 25 Jul 2023 15:05:55 +0200
Message-ID: <20230725130558.58094-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: c8afc498-b61d-4d10-1afe-08db8d0ff6f7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	paeRlOQLrWbUX1W/YAGz+3GS5bvWjnMCSX5SS6B6ZkJ84LKJWT1AQz+0N34yxenXKNMFgbrXOjY+2Z9dE/G3JYPxIqsvjbWTITClOui2Yw61hi6plnGSyK0o30Dr1oEAoSAoMZFOkmddteaAKB3OScUP5Dpr+RJRW4LACGCgDm515g3ZiyqxGOX3ZuJ0OSYJKmXVJoSXlxm6eUsonUdoCD7qbjeY5J1TnSuExCTYfzK+ZDn5KLNcECvo4Jm0C798l92tV2nO7UN241O8ZmomrEyDffbwO97pgjrMtf4MCcf74gDl/4m6heKlOoStWTQZ3id4ReUzlXOIEHIBfJwNoPuvtXn6dmMrIRSDEdDJrDO9Og1Dly0g4Gadp85wrMM5deGtt98sVKaS/H3rn6QdkJt4BrNvJGzaVKOzq24V5vwxBDfGIeGS1aXK2sJc7uA/Ba5ekP3Hsc9isdbgwUnC/v4zSfexdAzzYkXzvlVO2Ew4fDKug3FcbvBU7keQrracopGmSvLADzwkHUKlrEpYg+cxD29o+ik39bIsSiAAtSvnpuZReAxwzIWiBFnClIYW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW4xMDg1ZHJvaFJZRWloKzBFU3E2d0lUa3BDQVRrdUJsSGw2bTMweUNUNGxN?=
 =?utf-8?B?V25UcWV4ZjMyTmk0Zzl6dHVxMk9adk9rTFN6ZmNIZEYvN003WjY1bXF3c3Yx?=
 =?utf-8?B?WkVSMWdLYis5QjRITlRDRHo1U3FVcjR1eHVzTVcrZmJBSVBzTGs0OXlGa3dT?=
 =?utf-8?B?WlhqQTFGUjVIcjRqYXp5TUgrc3BKY0Z0Tzl5RTRXM2dEdVdrcGszbHJ3ZXht?=
 =?utf-8?B?R1FEenplU1Y3L3FRajhXQTlvOFNQcWtQejJ5eGZDSnpKYnpPZGlrYlFiOUY0?=
 =?utf-8?B?elozb3JKS09PTlJXcXpNMzVZeHNmaDhCZjFFOFFIL0gya1lUbnZ6VGh6OENu?=
 =?utf-8?B?bno3a1R6S2pSLzE2N1lxYVdob1ZoWnNVdkpZSC9SdzZZV1QvWERqQ2RHWHpR?=
 =?utf-8?B?dWErdElxTXRzbHJobUptNGRjZGFTN1hWU095RGg3V0NaZnppbDRYK1ZnYU1Q?=
 =?utf-8?B?bFE5ZkNQcDdWakRIYWJpN253VGVsL1dxZ0lobERyYmhCV2dTMFdJVkFzVUNi?=
 =?utf-8?B?N3NsL1VVK0Q1dHZ2YlMvUXM5bXdMNWhQVC9PcmQyYVpqQnFNZzlvWFZFYWhB?=
 =?utf-8?B?WUx6enhVc05tSzBXT2NPSUNpSFRYL1ZpZkdiaW9qVC80WlJ1Slk1aGFuWEFw?=
 =?utf-8?B?Smg4TU9SN0Y2dFZ1Vm9wdTIxdTVqV2tiM2hGaDJrLzQyWURMZ0NQa2VrQmZw?=
 =?utf-8?B?UGVXRW9RNU9mS1huZEM4cEEzTHd4RVlxZkVMdlZFb2NiUVBtdElnK1BFZHVa?=
 =?utf-8?B?WmdhYXNiZ2lEdDV4UU9OL3R3YnlNTGFyMTdrQWsyN2w1aTNjU3hLVE8yZjdU?=
 =?utf-8?B?enQ0ZmxzU2FOMS9nK1N2Y0F0V1pZb0Z5Qm54WUo5emxCelZoR2hwWVVJMGpt?=
 =?utf-8?B?ZFV1Q1phTG1qajU0N1BwenFtNlZsTEdyOGpUYmtrSEhWKzladnpTWWYrYyt4?=
 =?utf-8?B?NjJlMmZRc1FucytRTlpYeGZGQ1FIdndtVU5FNk8yb2R4NGNpcXBES3ErMFE5?=
 =?utf-8?B?Y0haeVc0UWpyZEszTUZIR1pNdStsRFR0QTlTTlNWL0tpbVNHK3YyTE5pbnd1?=
 =?utf-8?B?SXpNSmlJbE5jVUxJdkZkeThwQkhSSkZMSmM1enc5by93SjZLbm8yeUJYdDZ4?=
 =?utf-8?B?dEppSVdsOXJJNGg1V2FzNElxOGxLM3NIS3VKd0dlNW9XME5OMzM1WjBObWdO?=
 =?utf-8?B?bkpKN3ZKY1Myc0pUV1FFYTI1cVhBVXVRczlNT091bEgybDFUM1VvNlo3ak4r?=
 =?utf-8?B?SlBGeWI3OVIxcW1FSVpqOE9TMHZBS2hyMVVyNlNyallRczh1RmZ1dWZIL3Bq?=
 =?utf-8?B?UmY5K2pJS1ZVKzdrTUJyYVViSDFQV0QvY1VYTWx5WkhpNUlkUDdSeEVGcVBh?=
 =?utf-8?B?V3p2ZGdtQ3A2alRyZzB0SXE2dnF4UTVISUIvdmdsdW40WVAzemNkT2NRb3dE?=
 =?utf-8?B?bENtTS93NlBqZFpCdXJ6N0EzVm5XUnkvc1hZZlozbjhGZG5TcG1UeFhBVUhN?=
 =?utf-8?B?ZktoWW41a1pEbWZKUitiblhYVmpuMFdGQmZCV1d4bnZGanh6NXhuVzVBaDR6?=
 =?utf-8?B?TFNoY2ZyRGJDeS9UeGRla3VWejlBN0JiU0x0TUF1OC9EakJUMkZGQURSLzBT?=
 =?utf-8?B?TDlJSTJwZ3RSWmQ3S3VqRUxOZnoxeFJ0ODVHUTIzSkFHajhPV3lYSHNIZ1dQ?=
 =?utf-8?B?QmhZTVlpdDNtMnZocVhlQnYxUmQrYlJLZFdNVWUxY1hhZmE1NmZPWmxoUHl2?=
 =?utf-8?B?UFdIbUhsNTN0NG13UGZGZ1VQNkRwVkE4MjZmZE9CUFFVdkdKSHMxRCtQMnRH?=
 =?utf-8?B?V0dGa1c5Mkc0aU1uZE5UTFZGNjFvcDVWam1jeVFNQTRCNmxzTWtnZkY3Rzd1?=
 =?utf-8?B?QWRsbU9zVjg4SWZQcnU2d0M1eFZyNkhuWmZicCtQdzZQelZPUkVsdGtpcDRu?=
 =?utf-8?B?Ry9tMVUrZ2pZd2l5N053dzhtcWRHQ3lTMEVPbldtK2Mxb21FZGFFOEptdW9K?=
 =?utf-8?B?SFAxemYxNmswSXpQRFU2ek5Yem8rT0NvWWg4ZkhwRXdTNG9mREM4QnV6MEZB?=
 =?utf-8?B?TXl1ZzZIQldpSEYrbENacE1vSnBvSWV3RXcySFg5RWJrcWpXdlV2ZjExRDFQ?=
 =?utf-8?B?WmhPRUtpKzFhamVQWE51TDNDTUF0Zk5zUUhOSlh4R2hINUh2ei9XQVFpbEtE?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kVT6kp/LAH4Ff3JaLnJ3vrtp8UuATpIuPOHIV5nT6u6iKg9tJwJ/3tbQ6OBZZaKIBtwNdtSRxslf806uURPlUPUGhYP3QdJgUYbtSIM6tGD9yecTCTzxClQJqem9MZnZJm2sH21QBzbb59UDdtCBHknHtVXGgD5+MlytBjoY5c5VZeetf4XB8Os17lAOUkprsINu8tPK/ekzMY3AZlAw7WEVwDT7U8JA8LhAG+ivqnpV1B1Bm9g2waiRt4GA1CgFKZ9T3QWQ2FeDIhBR44jAm1PVawpkRDr6n0cGv99HE5Q6tYg53ARjqADXsnX+ux2iEY3GYMiFTk4M43JiFnxpNsrW+iLtBzZL5DZx6wkd8vAs4yijY1ESXrgq+psC5kfRxvB//0xIu4puRPsiDCtJwT5mlz/tI9fHYkNXcRChaiFBwen2Dszq2+XtnYE8t4f+JVbx/y527nbRh59uhXQb4dt97J5M3AqiYj0s4Yd8wUnmC6LXiO29Mtoi3oOzT8SOJ4h4DJID6HL8IDP8gBPncR+N6lVQPHgOggdmJWTR1h2JLBKVK97Q5ddhtewAeolRF3rznceU0l/zGfRptuxsHk/u0ujeMtAPfKyhi63j3zS9s2zbH9VXc6YLnP3/BM++fEpamSSWlC837IEVwVNcrgZqxGHZYgKcN84TBzB3EW8koJhmgV1Iz7FOt/9gE/xc2JZSDheY6BtZq/rTa/yNfyY9WUe7B+tj2GWc9jX9tFEbwizfFjJTsqCaL/iSHjnpvSVa71JPNbS+6eJN9ASU0p4+UQK4L25kSps1PENlfLvJEZirI6sHqaGBkiF7Ai6e
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8afc498-b61d-4d10-1afe-08db8d0ff6f7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:31.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko7ipICwXvrHNhoLkkoNeKrSzrW2j6juq9m5ztZcRUM8b/SK+rLpbFtXRd/3Sh992EX0GsKQqxIwWVjxSZ/PYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Add a new array field to libxl_cpuid_policy in order to store the MSR
policies.

Adding the MSR data in the libxl_cpuid_policy_list type is done so
that existing users can seamlessly pass MSR features as part of the
CPUID data, without requiring the introduction of a separate
domain_build_info field, and a new set of handlers functions.

Note that support for parsing the old JSON format is kept, as that's
required in order to restore domains or received migrations from
previous tool versions.  Differentiation between the old and the new
formats is done based on whether the contents of the 'cpuid' field is
an array or a map JSON object.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Keep support for the old json format in the parse function.

Changes since v2:
 - Unconditionally call free().
 - Implement the JSON marshaling functions.
---
 tools/libs/light/libxl_cpuid.c    | 152 ++++++++++++++++++++++++++----
 tools/libs/light/libxl_internal.h |   1 +
 tools/libs/light/libxl_types.idl  |   2 +-
 3 files changed, 138 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 3c8b2a72c0b8..dd97699bbde7 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -16,7 +16,7 @@
 
 int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
 {
-    return !libxl_cpuid_policy_list_length(pl);
+    return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
 }
 
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
@@ -40,6 +40,8 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
         free(policy->cpuid);
     }
 
+    free(policy->msr);
+
     free(policy);
     *pl = NULL;
     return;
@@ -516,7 +518,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
                               pae, itsc, nested_virt,
-                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
+                              info->cpuid ? info->cpuid->cpuid : NULL,
+                              info->cpuid ? info->cpuid->msr : NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -528,16 +531,22 @@ static const char *input_names[2] = { "leaf", "subleaf" };
 static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
 /*
  * Aiming for:
- * [
- *     { 'leaf':    'val-eax',
- *       'subleaf': 'val-ecx',
- *       'eax':     'filter',
- *       'ebx':     'filter',
- *       'ecx':     'filter',
- *       'edx':     'filter' },
- *     { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
- *     ... etc ...
- * ]
+ * {   'cpuid': [
+ *              { 'leaf':    'val-eax',
+ *                'subleaf': 'val-ecx',
+ *                'eax':     'filter',
+ *                'ebx':     'filter',
+ *                'ecx':     'filter',
+ *                'edx':     'filter' },
+ *              { 'leaf':    'val-eax', ..., 'eax': 'filter', ... },
+ *              ... etc ...
+ *     ],
+ *     'msr': [
+ *            { 'index': 'val-index',
+ *              'policy': 'filter', },
+ *              ... etc ...
+ *     ],
+ * }
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
@@ -545,9 +554,16 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 {
     libxl_cpuid_policy_list policy = *pl;
     struct xc_xend_cpuid *cpuid;
+    const struct xc_msr *msr;
     yajl_gen_status s;
     int i, j;
 
+    s = yajl_gen_map_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "cpuid");
+    if (s != yajl_gen_status_ok) goto out;
+
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
@@ -582,6 +598,39 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 
 empty:
     s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = libxl__yajl_gen_asciiz(hand, "msr");
+    if (s != yajl_gen_status_ok) goto out;
+
+    s = yajl_gen_array_open(hand);
+    if (s != yajl_gen_status_ok) goto out;
+
+    if (!policy || !policy->msr) goto done;
+    msr = policy->msr;
+
+    for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+        s = yajl_gen_map_open(hand);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = libxl__yajl_gen_asciiz(hand, "index");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_integer(hand, msr[i].index);
+        if (s != yajl_gen_status_ok) goto out;
+        s = libxl__yajl_gen_asciiz(hand, "policy");
+        if (s != yajl_gen_status_ok) goto out;
+        s = yajl_gen_string(hand,
+                            (const unsigned char *)msr[i].policy, 64);
+        if (s != yajl_gen_status_ok) goto out;
+
+        s = yajl_gen_map_close(hand);
+        if (s != yajl_gen_status_ok) goto out;
+    }
+
+done:
+    s = yajl_gen_array_close(hand);
+    if (s != yajl_gen_status_ok) goto out;
+    s = yajl_gen_map_close(hand);
 out:
     return s;
 }
@@ -592,17 +641,32 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 {
     int i, size;
     struct xc_xend_cpuid *l;
+    struct xc_msr *msr;
+    const libxl__json_object *co;
     flexarray_t *array;
+    bool cpuid_only = false;
+
+    if (libxl__json_object_is_array(o)) {
+        co = o;
+        cpuid_only = true;
+        goto parse_cpuid;
+    }
+
+    if (!libxl__json_object_is_map(o))
+        return ERROR_FAIL;
 
-    if (!libxl__json_object_is_array(o))
+    co = libxl__json_map_get("cpuid", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
         return ERROR_FAIL;
 
-    array = libxl__json_object_get_array(o);
+parse_cpuid:
+    *p = libxl__calloc(NOGC, 1, sizeof(**p));
+
+    array = libxl__json_object_get_array(co);
     if (!array->count)
-        return 0;
+        goto cpuid_empty;
 
     size = array->count;
-    *p = libxl__calloc(NOGC, 1, sizeof(**p));
     /* need one extra slot as sentinel */
     l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
                                     sizeof(struct xc_xend_cpuid));
@@ -641,6 +705,42 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                     libxl__strdup(NOGC, libxl__json_object_get_string(r));
         }
     }
+    if (cpuid_only)
+        return 0;
+
+cpuid_empty:
+    co = libxl__json_map_get("msr", o, JSON_ARRAY);
+    if (!libxl__json_object_is_array(co))
+        return ERROR_FAIL;
+
+    array = libxl__json_object_get_array(co);
+    if (!array->count)
+        return 0;
+    size = array->count;
+    /* need one extra slot as sentinel */
+    msr = (*p)->msr = libxl__calloc(NOGC, size + 1, sizeof(struct xc_msr));
+
+    msr[size].index = XC_MSR_INPUT_UNUSED;
+
+    for (i = 0; i < size; i++) {
+        const libxl__json_object *t, *r;
+
+        if (flexarray_get(array, i, (void**)&t) != 0)
+            return ERROR_FAIL;
+
+        if (!libxl__json_object_is_map(t))
+            return ERROR_FAIL;
+
+        r = libxl__json_map_get("index", t, JSON_INTEGER);
+        if (!r) return ERROR_FAIL;
+        msr[i].index = libxl__json_object_get_integer(r);
+        r = libxl__json_map_get("policy", t, JSON_STRING);
+        if (!r) return ERROR_FAIL;
+        if (strlen(libxl__json_object_get_string(r)) !=
+            ARRAY_SIZE(msr[i].policy) - 1)
+            return ERROR_FAIL;
+        strcpy(msr[i].policy, libxl__json_object_get_string(r));
+    }
 
     return 0;
 }
@@ -677,6 +777,10 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
     }
 
     *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+
+    if (!(*psrc)->cpuid)
+        goto copy_msr;
+
     dst = &(*pdst)->cpuid;
     src = &(*psrc)->cpuid;
     len = libxl_cpuid_policy_list_length(psrc);
@@ -696,6 +800,22 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
                 (*dst)[i].policy[j] = NULL;
     }
 
+copy_msr:
+    if ((*psrc)->msr) {
+        const struct xc_msr *msr = (*psrc)->msr;
+
+        for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++)
+            ;
+        len = i;
+        (*pdst)->msr = libxl__calloc(NOGC, len + 1, sizeof(struct xc_msr));
+        (*pdst)->msr[len].index = XC_MSR_INPUT_UNUSED;
+
+        for (i = 0; i < len; i++) {
+            (*pdst)->msr[i].index = msr[i].index;
+            strcpy((*pdst)->msr[i].policy, msr[i].policy);
+        }
+    }
+
 out:
     GC_FREE;
 }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ef882cff3912..b1a7cd9f615b 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4871,6 +4871,7 @@ _hidden int libxl__domain_set_paging_mempool_size(
 
 struct libxl__cpu_policy {
     struct xc_xend_cpuid *cpuid;
+    struct xc_msr *msr;
 };
 
 #endif
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e48bb772646..fd2f3f6e485f 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -19,7 +19,7 @@ libxl_mac = Builtin("mac", json_parse_type="JSON_STRING", passby=PASS_BY_REFEREN
 libxl_bitmap = Builtin("bitmap", json_parse_type="JSON_ARRAY", dispose_fn="libxl_bitmap_dispose", passby=PASS_BY_REFERENCE,
                        check_default_fn="libxl_bitmap_is_empty", copy_fn="libxl_bitmap_copy_alloc")
 libxl_cpuid_policy_list = Builtin("cpuid_policy_list", dispose_fn="libxl_cpuid_dispose", passby=PASS_BY_REFERENCE,
-                                  json_parse_type="JSON_ARRAY", check_default_fn="libxl__cpuid_policy_is_empty",
+                                  json_parse_type="JSON_ANY", check_default_fn="libxl__cpuid_policy_is_empty",
                                   copy_fn="libxl_cpuid_policy_list_copy")
 
 libxl_string_list = Builtin("string_list", dispose_fn="libxl_string_list_dispose", passby=PASS_BY_REFERENCE,
-- 
2.41.0


