Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1052761946
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569671.890593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkO-0004kg-6J; Tue, 25 Jul 2023 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569671.890593; Tue, 25 Jul 2023 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkO-0004i1-2p; Tue, 25 Jul 2023 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 569671;
 Tue, 25 Jul 2023 13:06:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkM-0004BN-9V
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f852f70f-2aeb-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 15:05:46 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:25 +0000
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
X-Inumbo-ID: f852f70f-2aeb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/DjRmCpyR41ndqdeo2ztSdCTQNy5XAVA3JYpNnatIeo=;
  b=NS3wq0BIDjGu6pXsjcrYtHbpSH3HbFmmLSvtLn3QFuDbZm0CtwdvhzZv
   0eFkZn9UJstnwPhSM2hsGUKOo+REOZJWt7Xd3n7ndmmHt3IaugS/SEHfG
   sRuieQfkWwfg786XlPrYbUjYuI0AxTR/YnpOiqYmdj+TVAlYSES4SuoLn
   E=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 119981299
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vuFeb6MxV0vrVlDvrR2BlsFynXyQoLVcMsEvi/4bfWQNrUog0zxUy
 GFNCGqDaPjeajH3etwlYNmwpxkE7cfXmtJiQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5AFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vcrL1hr9
 7tCFD4cVSu8lcW76pCQZvY506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv917+Wx3KqMG4UPIeI+uNl2gS3/GkCJzYQFma0u9C2qkHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf1y1uPhTa7OCxQJmhbYyYBFFIB+4O6/tB1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:oNak46GK+Z9bE1jipLqEzceALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppomPHPP+VMssRIb9uxoWpPgfZq0z/cci+R8AV7FZniehILBFvAE0WLM+UyDJ8SUzJ846U
 4PSdkFNPTASXR8kMbm8E2ZPr8bsaS6GOvBv5a5854Xd3AIV0i41XYANu9MKDwMeDV7
X-Talos-CUID: 9a23:XflY6WC8e0YtksX6Ezg72ncxGId/TnPM90zvMWi1I0RCZKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A0+U6YQ35CaWZ0zLgcyEgUrP9tDUj2ZSiFU9XyLE?=
 =?us-ascii?q?8vtirHiozBjiHpTuXTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="119981299"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZXMP0bomo0LK1ts5N3E3/F2ffI6CDEPtUe7CmQNJKg7hTng1w6nlnZtyeQrChqa5g/9i5Jaf0f8YqVHcOpi5q+eqeqzsYvtc26Xb4nVaAc3THpQoUiO7G6CCrANIZJHvxGKEaXgUMMQ5QneuuZZ9xc70MhRK8T6ZhFj/CvZhs5Cxs03wrV5gFzRxv342F5GNXXW5YeONpeXeOKE+VV+QXG5C8hXpyHYBMsYn1wF41C3SM4SJ/vOtZnQbjbUmt8NjH+nI/1AXn4cy35L9zs5kgDNkEAxbrzI8DzLIbgEBMAiTEUfD0Wp0rJd7oSGzLLnTog7l4SrnLzqrc7cuXn3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvAgEnMZzKsiO5gFVAUArv65sWJ/koiL8PS5eQmSiJs=;
 b=YrfJ5Ht7lWa/RmjXNc/nYgWNDwVQR5G1/YJNndcJ6qmq4enZU/5sFYH/B1RG5wn5D27M6YiZBizO5d9+2b/78ymNwJVpO9AK7wEDDaxASX4wnfDkSziY0scskGJ55BP05OFKXvAHBRgvvJRsZ9Wb50J2i/nV6HLQ9gxVZuohFMXhIsUAnO9Sc5MlUDJbwAkRXXPjWvSY7oQqmA+a+LKpS1BL7wR4EGetylFmrvO7pq2c5/7Xjo7na21za5FQJj7FuBAUYRJjcX9nQnxicWy0zsadx+ieiM2lSLSE0tD6/kOGpkIyMqgAjuXMxONHhfteZIhsUd0f0zERhBRTJzLefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvAgEnMZzKsiO5gFVAUArv65sWJ/koiL8PS5eQmSiJs=;
 b=TXemCq/e5A9HSugl/SdInMqG3e/h/2x854TDUcigBR82MeDdSYdN9RI2Ek5tek9o9P4pa4SfQ2ezq9kzqETltTvmZoF9/w7+sIw4JSlPLmwmENECGF57sXQjLo+HiM7i/+EK/6iT/pVpJhJ5EWD3a/4lYtNVUhiUO0J5vOAla+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/6] libxl: change the type of libxl_cpuid_policy_list
Date: Tue, 25 Jul 2023 15:05:54 +0200
Message-ID: <20230725130558.58094-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0552.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: c810b45d-b3b5-4240-5c76-08db8d0ff361
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CNEA1qaeQ11vMnyI0IzvN0e12CeU8T8koj5/bq5+wFMmD9mlZrPmrq7juTKmP3n+XQZw7o9Y7vD+eNh/udBogv8n22qbKE9E3OKViZTmMY3CyETkatMYTeru/crWTNIq8xEOFYBsa0cUOAS7swGzlPS/h8MCmjbmrOe6X0RZoLVaHQ0HJ73DM1l+8GD8R7c/U2jyXfGdb2Ix2VC+Wj/fUBVq4bwSi2z24kYEah+B4uoGxaZv9giW842SUZksumd/8BeRZubcD3vxZy8ofNB0S5XBq2keG5C1V0cGKCFFvXuxJUr2OPRScksG4ec134tYWB33YMuvEPl1/bz1Y49B0BIT2yP3lYfjsXQbiRrxfJTm+pUnTvhiUk/xh3/8XdZwjrd+tz9DqUoSHBtyaEjfY1G66j9wLzfk+cG9MfbWIL/a9z883pXqlJKyO75oCmD9B2owwIoGHOzVVtOYP5OkYfW1jnnbwBjMvRjAiRXZ6FA9VQY3gHur8lZwRzhyIKa3N4R6cNd2iTvH4ms9SA1vKv7gvFICfVIzOyAEJL0+DkCB1UjJtJ5JgNNgwZHl+I0b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnNqcjdqc1pIazd1ZEI2R2xwamlxRDRVSWYzdW5BV0IrR1NnUHJqZzRWaUkz?=
 =?utf-8?B?TjdxcGZrWFZuUTVlWGF0aHRRa1pncXZSQ013SDBRR1o0SjFGQ1psamVRQ2ho?=
 =?utf-8?B?b0FEVlExbkl1Z0duYm4wVXg4WnFaRFFxYlFtU2dNNUVoVnFuOEdrdXFsMXhC?=
 =?utf-8?B?TWFhcGo5ekw0RWZnZzkzRGdIbWtiZGJsakVDRk5VOGh4WG0vYnR1K3d5VHk2?=
 =?utf-8?B?WXRkK3Z2WHlSMUVxWUNpSVBEZ0NudFkzbG5aTWtFM1BWaEU4cWQ1Y3pHaVNT?=
 =?utf-8?B?WmV6Y3JpYXNCZFIrK3R2SzVLRG5GcUNJN1d5K2lVMWZQNnY4UFEyMThvdlgy?=
 =?utf-8?B?N1I3M1p0RFVlQUFnbWFqU3FEQ2JLSEt3bENaNTBUNTBoY3BQV2NRK3JqL0Rj?=
 =?utf-8?B?bWN1RjVlMjR3WCs5TmJONnFrL3R4aFN5dnY2RkhQOTNGZ2NXY1lqWm94VUNQ?=
 =?utf-8?B?RHptNkozZXhHNFNscTd4eXlLZngveTFHNDAzb3poejFQRjJzVjdjdzFRZ01q?=
 =?utf-8?B?ZDAzTDRyYTYrL2hDb05NR3FzdC9rR1g4b000S29Nd09BZTdFWnNKTjQ5Y1FJ?=
 =?utf-8?B?bURaV1JQYWRoZEpUMElaWmEyVHY1NUJsQWU5eWRFVFhkUDZRMFFXTUdrRUhM?=
 =?utf-8?B?MUc1ZnpCb096aDMwcHA0UjZWYVU0ZlpvSndtNmFVU2praTdNSmg1NnA1Ukoy?=
 =?utf-8?B?RTBSbDZPV1o4R0Zqa2hRSUFjVkFvTnJMVzhwQXdvL0p5dmhhb0xzUkhqcmNo?=
 =?utf-8?B?czhRRGN2UE1sUWNFZit2ZVBsbkpUYmNxQXF3SWxTQ2tjaEZxeDZoNnlqR3Jy?=
 =?utf-8?B?Smw0Rm9qOHRUdHpWelJISTAyUGorVlFCNVZ5K3BJdXlEeGo3WVJCZkNOZU1P?=
 =?utf-8?B?aC9KenQ5c0UzMExEeTlJRkFNeXQ2bEdzVWtVbU5YS2pPQlVuNlRKM091ZWJT?=
 =?utf-8?B?RzNSZXBYS0c5dzhsczFJOHBqM0htcERxT3U0anFzNlhKK3IvNDhpRUIvTGxy?=
 =?utf-8?B?ZEUxMFVzd084bDZSQjZkRGpmYzJxdzhQcWcrZWxrZzBVbVdPWHl1cGltTE0z?=
 =?utf-8?B?K2F0RXpXR1RTWUtYbHF0WU1Lb0E3bGpUQlRUZmxSRjgxL2h5VG1tcXhxNWs4?=
 =?utf-8?B?SGczeGE5WndWcDhFRE9nSTRLc290b1Y2RkU2M0t4ZE5qM3hOTUF0eCtsOUJv?=
 =?utf-8?B?dlE3MmZHZ01RbTdNTWpORFowUXZTSVpVdFdtRlFSVCttNDNFK21nQVVkVHQ1?=
 =?utf-8?B?eUhneFQxcVYrNDlycnpXck9vVHZzVGEzNjJaNmkrUWQxMm9hdUtaWENIb1pP?=
 =?utf-8?B?Rk4yNk15MVlKNmNBTVduYkdLOGJXNlBFbGR6WHdqR2tyMzQxSXRicDJzVGp5?=
 =?utf-8?B?K3NRaEpoU2I3bnMzUVZFdm1PRmJRZ2JUNUx4Tk9qL1ozWDAvcEtSZlFkR0Jh?=
 =?utf-8?B?dWUxTVgvYllBeWRISWU0L25IRzg5YUZpNlNHVnM1VHJYdVlGQllrZ1FqYWo1?=
 =?utf-8?B?T3E0VWh4RHhucUNyc2hWUnZQZi9jUmRiSXpyUjJUbm12UTN0ZUVNOTltL3V6?=
 =?utf-8?B?djJidHh3UVpzeHpOUDZGVjZaVGVBQXFDdHdRblgxWjBvWW5oTm1TbCszbWRq?=
 =?utf-8?B?K0lmMVhRQS8yWkpvMmc4WXJGY2JVZUNORHo4YkVUa2w3eG1RY3BEa2ViWDhM?=
 =?utf-8?B?WlNuSE1tQ1JHVmEvcnhBWG9tZzBSSE1TWGtiOFAzVzJQU1plRnV3NFFyU2c4?=
 =?utf-8?B?UXc4dVRVQ3RxY0VEQXpyR3RKOWxkdStYZWJwRlRPNGRUaVJmK1FlS0ZYRk94?=
 =?utf-8?B?SzJ3b2lsL1hQOW11L1FySTlCSDY0TW5ka25RU256cVJETnoxQ1U3a1NZcTJZ?=
 =?utf-8?B?ZVJJQXYzNzMrVUJzZmY2U1oxMXRkOW4vSndUNmh3TkZSaUpIN2lsSDBYRE8x?=
 =?utf-8?B?TGRTVUdYSWlJZ1dsQUdzYUtVUEFMUWUyRW50eHp6dlhuNHhzYTIvRXdvak1k?=
 =?utf-8?B?RFkzbk51c3p2SkNGeXZYb0dpSmZHZTJnd2UwNTk0TVV5YXdwSGs2SUZPcGlt?=
 =?utf-8?B?aHBRTmRCYk5KNFZsOENtUHZ1Unl3RkNFbDU2QVpEVUgvb1c4ZkFzcEtmZTd1?=
 =?utf-8?B?Z0E2Q2pxT05JdFVadmh2b3oyZ3BBRVQ1SlhSUnB1cVpYQWFkYkQ0c3FJRHFy?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X36FbVQOpkY7YpI0m7SBuQvr7Q6sU/hFNg8kynDslfe4Q6PjwEYFocaO2yIgkMnQCQiNsB/PaC6D7Dpw+JL0ORghcVJSTHRsyu6YK+4ACBWOYwBpJdcHDUsUSN66NT74W4K+S7GhImUU6OfEGFSPHge4RsJBjeLJ+jTgvDCTRnnyY1XGo3OGEOYV/6jOglZ9XSGrUEv8cX2MpcrmmwQS7fuDDeNfpOBMrurfZZyygDmo/GlI3fB6jBChy6wf03vTbxS67MzC2YOsdQTaJl6DyQkYpXcf7XEdVUapawn9jzgqmdxtw3YSH/2SHEDfXdLUISqpB9cq9L4sxJSf7jwDTAuQwGn1fUukvMGXk+sfNofTVYVXVP7BFrmKGc5lFNMUaLz6zrqwJv6SDSIM0OAnAVTHXiNO8EQeBDOg4fysJooEgyFOc3ov4N8zp1wCzz/HVLT4JUskNxtOnJThokOQMICqLTlFnzmcD2QC+ErEP6TSIE45sqerJqeLCM5d4YwsJ7sc5cURKS+8G3UDCN1gMmCuDuBGcqwm/X+hE+hWXNL0hZ5eIFIV1KbUnsc6eHDeFQCJ8Sc60iAHwN4sBsi4jIBOcJiFurLvD1GsHRw969ST8l69gNs0LSa0tttkyFMvstun0LF4m62yJE10imOXoh/lFbcU3T1s6skR5QxbGk3wAf9VWUPlo5tmc4VPHqAOLJ0ih3GAM2oPLTq6b3+cqUZPrVBrRWnmoaLvZmC7u95chmAidCZyUN2ryx4wmRz3kXckjdhAO93FFl0doMMr3uXvAn0XRMpDUGadMVS6iW1pOhelOVih8QtPTd7Cq8Rm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c810b45d-b3b5-4240-5c76-08db8d0ff361
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:25.2836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gklcuy1WpFY+prOgUOoBkRJmEiza7S6Tl4/gNhM1ckOVjmihXETUp5RqHnbZdeXkQ/HnKjb+qbvh/zSdnJUzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Currently libxl_cpuid_policy_list is an opaque type to the users of
libxl, and internally it's an array of xc_xend_cpuid objects.

Change the type to instead be a structure that contains one array for
CPUID policies, in preparation for it also holding another array for
MSR policies.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Add braces in the inner loop.
 - Do not set the policy to NULL.
---
 tools/include/libxl.h             |  8 +--
 tools/libs/light/libxl_cpuid.c    | 87 ++++++++++++++++++++-----------
 tools/libs/light/libxl_internal.h |  4 ++
 3 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eba2..f3975ecc021f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1455,12 +1455,8 @@ typedef struct {
 void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
-/*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
- */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
-typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
+struct libxl__cpu_policy;
+typedef struct libxl__cpu_policy *libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index c96aeb3bce46..3c8b2a72c0b8 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -19,22 +19,29 @@ int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
     return !libxl_cpuid_policy_list_length(pl);
 }
 
-void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
+void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
 {
-    int i, j;
-    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
+    libxl_cpuid_policy_list policy = *pl;
 
-    if (cpuid_list == NULL)
+    if (policy == NULL)
         return;
-    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
-        for (j = 0; j < 4; j++)
-            if (cpuid_list[i].policy[j] != NULL) {
-                free(cpuid_list[i].policy[j]);
-                cpuid_list[i].policy[j] = NULL;
+
+    if (policy->cpuid) {
+        unsigned int i, j;
+        struct xc_xend_cpuid *cpuid_list = policy->cpuid;
+
+        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
+            for (j = 0; j < 4; j++) {
+                if (cpuid_list[i].policy[j] != NULL) {
+                    free(cpuid_list[i].policy[j]);
+                }
             }
+        }
+        free(policy->cpuid);
     }
-    free(cpuid_list);
-    *p_cpuid_list = NULL;
+
+    free(policy);
+    *pl = NULL;
     return;
 }
 
@@ -62,11 +69,17 @@ struct cpuid_flags {
 /* go through the dynamic array finding the entry for a specified leaf.
  * if no entry exists, allocate one and return that.
  */
-static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
-                                          uint32_t leaf, uint32_t subleaf)
+static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy_list *pl,
+                                              uint32_t leaf, uint32_t subleaf)
 {
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid **list;
     int i = 0;
 
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
+
+    list = &policy->cpuid;
     if (*list != NULL) {
         for (i = 0; (*list)[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
             if ((*list)[i].input[0] == leaf && (*list)[i].input[1] == subleaf)
@@ -86,7 +99,7 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
  * Will overwrite earlier entries and thus can be called multiple
  * times.
  */
-int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
+int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
 {
 #define NA XEN_CPUID_INPUT_UNUSED
     static const struct cpuid_flags cpuid_flags[] = {
@@ -345,7 +358,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     if (flag->name == NULL) {
         return 2;
     }
-    entry = cpuid_find_match(cpuid, flag->leaf, flag->subleaf);
+    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
     resstr = entry->policy[flag->reg - 1];
     num = strtoull(val, &endptr, 0);
     flags[flag->length] = 0;
@@ -400,7 +413,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
  * the strings for each register were directly exposed to the user.
  * Used for maintaining compatibility with older config files
  */
-int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
+int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
                                   const char* str)
 {
     char *endptr;
@@ -427,7 +440,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
         return 3;
     }
     str = endptr + 1;
-    entry = cpuid_find_match(cpuid, leaf, subleaf);
+    entry = cpuid_find_match(policy, leaf, subleaf);
     for (str = endptr + 1; *str != 0;) {
         if (str[0] != 'e' || str[2] != 'x') {
             return 4;
@@ -502,7 +515,8 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid, NULL);
+                              pae, itsc, nested_virt,
+                              info->cpuid ? info->cpuid->cpuid : NULL, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -527,16 +541,18 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                libxl_cpuid_policy_list *pl)
 {
-    libxl_cpuid_policy_list cpuid = *pcpuid;
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid *cpuid;
     yajl_gen_status s;
     int i, j;
 
     s = yajl_gen_array_open(hand);
     if (s != yajl_gen_status_ok) goto out;
 
-    if (cpuid == NULL) goto empty;
+    if (policy == NULL || policy->cpuid == NULL) goto empty;
+    cpuid = policy->cpuid;
 
     for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
         s = yajl_gen_map_open(hand);
@@ -575,7 +591,7 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         libxl_cpuid_policy_list *p)
 {
     int i, size;
-    libxl_cpuid_policy_list l;
+    struct xc_xend_cpuid *l;
     flexarray_t *array;
 
     if (!libxl__json_object_is_array(o))
@@ -586,8 +602,10 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
         return 0;
 
     size = array->count;
+    *p = libxl__calloc(NOGC, 1, sizeof(**p));
     /* need one extra slot as sentinel */
-    l = *p = libxl__calloc(NOGC, size + 1, sizeof(libxl_cpuid_policy));
+    l = (*p)->cpuid = libxl__calloc(NOGC, size + 1,
+                                    sizeof(struct xc_xend_cpuid));
 
     l[size].input[0] = XEN_CPUID_INPUT_UNUSED;
     l[size].input[1] = XEN_CPUID_INPUT_UNUSED;
@@ -630,8 +648,12 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 {
     int i = 0;
-    libxl_cpuid_policy_list l = *pl;
+    const struct xc_xend_cpuid *l;
+
+    if (*pl == NULL)
+        return 0;
 
+    l = (*pl)->cpuid;
     if (l) {
         while (l[i].input[0] != XEN_CPUID_INPUT_UNUSED)
             i++;
@@ -641,20 +663,25 @@ int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 }
 
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
-                                  libxl_cpuid_policy_list *dst,
-                                  const libxl_cpuid_policy_list *src)
+                                  libxl_cpuid_policy_list *pdst,
+                                  const libxl_cpuid_policy_list *psrc)
 {
+    struct xc_xend_cpuid **dst;
+    struct xc_xend_cpuid *const *src;
     GC_INIT(ctx);
     int i, j, len;
 
-    if (*src == NULL) {
-        *dst = NULL;
+    if (*psrc == NULL) {
+        *pdst = NULL;
         goto out;
     }
 
-    len = libxl_cpuid_policy_list_length(src);
+    *pdst = libxl__calloc(NOGC, 1, sizeof(**pdst));
+    dst = &(*pdst)->cpuid;
+    src = &(*psrc)->cpuid;
+    len = libxl_cpuid_policy_list_length(psrc);
     /* one extra slot for sentinel */
-    *dst = libxl__calloc(NOGC, len + 1, sizeof(libxl_cpuid_policy));
+    *dst = libxl__calloc(NOGC, len + 1, sizeof(struct xc_xend_cpuid));
     (*dst)[len].input[0] = XEN_CPUID_INPUT_UNUSED;
     (*dst)[len].input[1] = XEN_CPUID_INPUT_UNUSED;
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 1cf3d400bfce..ef882cff3912 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4869,6 +4869,10 @@ int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
 _hidden int libxl__domain_set_paging_mempool_size(
     libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid);
 
+struct libxl__cpu_policy {
+    struct xc_xend_cpuid *cpuid;
+};
+
 #endif
 
 /*
-- 
2.41.0


