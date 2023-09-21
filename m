Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40E7A92EB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 11:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606238.944009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFYI-0007d6-Ls; Thu, 21 Sep 2023 09:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606238.944009; Thu, 21 Sep 2023 09:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFYI-0007a2-In; Thu, 21 Sep 2023 09:00:50 +0000
Received: by outflank-mailman (input) for mailman id 606238;
 Thu, 21 Sep 2023 09:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjFYG-0007Zw-ST
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 09:00:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5935fd77-585d-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 11:00:46 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 05:00:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6088.namprd03.prod.outlook.com (2603:10b6:208:311::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 09:00:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 09:00:40 +0000
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
X-Inumbo-ID: 5935fd77-585d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695286846;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JbyXrH1sw/2Kr1DeUlrirl0fJAeUXQA7yzw8/xnM8Og=;
  b=NQNJo+a6lxpwfZQ4+0046xm95ZX3G9pU5uWOo61ajY/M7D4e4h9f8P74
   IJXkbr6qvkys/1LUX0fOhQnFOUSGTY1NBWpzCpXCjPeBWONY0l6umoLDT
   i4GtT/arQrpz4LtOkTrG7WzXKLEFLFXbda32pSzib9QjbJC/oHa2mXI9x
   U=;
X-CSE-ConnectionGUID: xPWFch8FSOWZuHRbqIGWWw==
X-CSE-MsgGUID: yzDf7qXMSRusgC6nvcT24A==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 123217230
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HdwswqCgiFJ2zRVW/5Xiw5YqxClBgxIJ4kV8jS/XYbTApGwk0zMPn
 WIfDG2FOarbNjekKoh3OdvgpkhQvZHXydRgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6t5IL2pOp
 dIjDw8/czC5jfuX742EVbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCn237CVxnuTtIQ6Ba+U+KFzsHio/HEIBzZIU0WwnaPloxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4CPE39wiX1uzU4gKVC2IeRzhNQNUjuIk9QjlC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr5IXgM0Q3qO352fuhT62u4PJRQ444AbQdm+95wY/b4mgD6S37XDL4PAGK5yWJnGDo
 X5CncGd5eIPCJillSqRTeFLF7asj96GPSPdhxhzHpAn3zWr53OnO4tX5VlWPE50Nu4UdDmvZ
 1Xc0T69/7dWNXquKKVxM4S4Dp1zybC6TIq1EPfJctBJf559Mhed+z1jblKR2Garl1UwlaY4O
 tGQdsPE4WsmNJmLBQGeH481uYLHDAhlrY8PbfgXFyia7Ic=
IronPort-HdrOrdr: A9a23:JhFUVaCygbS7peblHel255DYdb4zR+YMi2TDsHoBLCC9E/bo9f
 xG+c5w6faaskdzZJhNo6H6BECgewK7yXcW2/hqAV+iNDOWwFdARbsKheCD/9SJIUzDH4VmpM
 BdmsZFebnN5JtB4foSIjPULz/t+ra6GduT9J7jJr5WIz1Cb6Fl40NnBh2AEktwLTM2eKYEKA
 ==
X-Talos-CUID: 9a23:rVxadmwT8jmSc0dQL0EEBgUEIv8LeX2N4kz3HH2lKVxjUZy6dmCPrfY=
X-Talos-MUID: 9a23:30yAXgQ/Y6ybv+VNRXT9lh1sa95Yxp+UFVsCussApcK4b3BZbmI=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="123217230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6WEwHoenIkYIFUSysaTeBhmCTxqoHzaLXKhUS3qx2wexsJWQ6V1rhVZE/XDexXDHGkRZeNylI4IZvuGRuG2b8xCei0d2zP70ZEUiIDfc/No+WtqJXqzBA0GgTWni0UDGQclwac4JCLlb94QVcXgVcuKtYJ89HxdhspQ8DS/qUhwYlTv+qKsoo6R+lttNDu8iOhgbOlwMzef/f9K69qjYmlmq3mApJfAMYF3Gj/rP2x926/iDB0OvppaoIyayY7K+CtQF4oJUdcZiZ3ph334U+85onl6hyIeczTaI1HBE5qMEOK0buR/R+IESej7d5fehWRrLBvz2/sL9kpvk145BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8VjF2VLMh6+vOqzB3Jn3ItVhF8Uw5bSo8wDav7Q69o=;
 b=P/MymKeqk7v3dF5/Cbf6HclJ2KPoGoXftjGjJI34t5qYrECxmA3yJMEkdmqyw0ocRdqNgsENT5fAQLo4Bi/fPce4SRaflPywp87bo2EmN2aJDkysjtJxwdDmrkzfsNX/7kH2/tHPid7bqaI5WYQnN/a+kXBMqshtqI+XvIJ1UmOKhrM380nn7RQ0YKCJBTkR+REtd+fzel1Ik+D0NPwe8Lo/2PFPviMQr1+loykaoxv4R7W2xAeyet5Pn++nZOEAsUMBHji4F0ppZWIWMBZBTQCLe8NjjAghGgTk7+2YGh+dnt3IlwfQx8qXLyJgYC1nT8v01rAGdcgbYIaqOqOGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8VjF2VLMh6+vOqzB3Jn3ItVhF8Uw5bSo8wDav7Q69o=;
 b=xFCstaxVAhsjE1Kd+QppR2NKEtQxBdDQ1tG/lsor1feshm448nKcoECsNhPzKFKL74SP7/mvtSuiSOtCBenAlDBL5R0oIz9yxIoIw717c/wOYEd2aTBldYx+nK1fBwMLy6l+hscEL09YiiPkNXo7nExy0ZxdCgsS8dZAwy9ptd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 11:00:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZQwGMmTG47fi1hwO@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
 <ZQqoqrmDr2jY_bMu@MacBookPdeRoger>
 <8f8e293c-80a9-03e0-0c19-e641dc42d42e@amd.com>
 <c1f0f3cf-a5de-5f90-e153-c523665eba0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1f0f3cf-a5de-5f90-e153-c523665eba0f@suse.com>
X-ClientProxiedBy: LO4P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d5d834-ed26-4210-4fd8-08dbba813ab2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYVcm4/lNK8PsAQ5Zo2rSw0VUvDwNwe2YINMLh0iCeMMf6CHhZK8I9PjvBzQQSrvqBwy+FnK9hvrVnYIFd51jM6k6+VYML0d0SSD9yGnG5CjBh1HiyMyQjHUtcoHWVi6xMwGYGjNeOOwY2XD7N0zvfdTHS2NlrpkJ05R7uEqImSDGX1zvN/CkNu4KFRud7V+iVIcFa2YXbQUhWlNbkWKDO+eQveYeUGwycEqp1XFU8vYKq1YRu+nnmeo5AhFWmo70rQtFZcBW4hqQj5DQzVlR/XBtBkyLBLQL9kVHSKbQoijl2YVtBiles/k4mI+TsoL80XNpCqfptBWCmH6nmAqyos8Ae2chhVOEBCDgBJlBEhfwaqm3w6XY+QGtl3K6uKzE0ycNMMB+vWPlvyRIfWh71YhHOY/uIagLzG9yqmpcYGxPtnGK7z5mvoufRpa+t40uSeTKZ+iY+mv/5Pm9SjxlqBB1MmDvB0sWUHD2IgfEg7xuebqq9xE3ZVToPxoUPIRqBcq8mSCX9vk0OgFe9Q5OjyJ9dApmbmPPDLZGsjl8RufSXIL68Y2Ko3b2AqqXXdA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(396003)(39860400002)(366004)(346002)(186009)(1800799009)(451199024)(83380400001)(508600001)(6486002)(6506007)(6666004)(53546011)(9686003)(6512007)(2906002)(26005)(54906003)(66946007)(66556008)(66476007)(41300700001)(4326008)(5660300002)(316002)(8676002)(33716001)(8936002)(7416002)(6916009)(82960400001)(86362001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lxWEdQRFdldGQwbGVEY2VXWkNWVHl3L09YdFh1NWRGUDhnOUFsVk9ZbEJY?=
 =?utf-8?B?SzZFbXVzdjFwblVVRFY2RitodWJVck9XbVM0NXpWanp3c3NWNkNmcmd6M1BQ?=
 =?utf-8?B?RnRzREhLdEdOLzF5ZW5rZHJwZC9RcXFnT1U0am1BV2xSUi83dW1QV1ZSVDU5?=
 =?utf-8?B?WUFxV0dHL3p6WHVWS28vbS9QMmtaMlYxMERLM3dDbXhTb1lDakg0SEQ5aFBs?=
 =?utf-8?B?MDJtQlBUYlcvWTRJWTNlcUdtUWMzZStUYVlmQjJxN2xSaWxsUnBza0w2TEs3?=
 =?utf-8?B?U29wTnNpdVZFNnpKVThsdUNIMldaZk1NNmpYL1RCUW9OL3FVeFpOSitRdlAx?=
 =?utf-8?B?dGhJd3lrWDM3K0Roek9NcW5IQWVhcjVyaWw0SXBxaXkrUThFU2dwdnVGdFJ1?=
 =?utf-8?B?T1FPRmlNNUZuZUhqMDh4RVBTUjF5Q3N2SVR2QVlwS1Qxd05RRy9IViszWGJ0?=
 =?utf-8?B?dkZibUwvRmdTaXlxZUt3eCtxQ2c4S2ZVRnRYUkVGWkJqalpsQ3ZDYnhISjNR?=
 =?utf-8?B?aThUaUhmM1Nyak1NMVpLUVlJWGpucEgvOHRmYXpEZWl4OWpOSUY0WDl6VkZ1?=
 =?utf-8?B?NFpPODFaZjc5SG9vQTd3SFFNZDRlQUNBVnNuUDBQbnNiUUFtR1ZKWTIvaVVo?=
 =?utf-8?B?RG4xallnVzRuVHFGUGlPNEtIcWtOZDVWbTRERnowWXNaTmhwV1hBL05rYWRa?=
 =?utf-8?B?Wmk1OVVKMm56dTZHU1JZSjJiNVJCZm1PN1laMVNmTU44dUhVNlpNdjB3U1Yr?=
 =?utf-8?B?c2Zjc0RyQ3VESmk2Znprb2V4U2czVlA4U05iZXpwYmNuOTljWDByUFFHeEY1?=
 =?utf-8?B?Tjcyb0ZaVGV1bWNmZGRFVm05dmRGK2FTQzFrcnR3Qi9JaDdPYVRpZ0kvcEZu?=
 =?utf-8?B?SHQxUXVHVm45ZjRvRVAydDhva3N3eGxUaTlXKzVTZENWbTFDY1dPRVExWWlo?=
 =?utf-8?B?RjVOVVptTWE3RU1GYjVJcE1SUjBTTUQ2WHJaOENsUW9JUXUvb2tMTys0Qmt0?=
 =?utf-8?B?ODRONHVxVldVM1pFUW1XUzN6dE9vU3BwdGNRZk5EREtCbTNNbEZJL0QyMGdt?=
 =?utf-8?B?eHdUdUtCaElNTmFoeFZXbW10WmQrSi93Z0plQ1lYd2xIL2tZQmtKRzNWMnda?=
 =?utf-8?B?RlRnNVRqcDlxc3NScHhkWGduTC83WVZoTnJGeVkwQi9zbzV4ZEJnK3V3MjRO?=
 =?utf-8?B?YSsrWlRvUXZVT2tXREYwVU5OOWw0bGR6cXpmZ3FUNGlqVHl6R2t4YUs1bE5v?=
 =?utf-8?B?VlhHSENXVEVka0E5Y3I1RUE4VEJ6YWoxZmlOL1FVM2tyZ2lPMFJTRnYvR0Ra?=
 =?utf-8?B?ZXhoUEpLN1hkWS9WaFFZZDNIdjAyY1ViWC8xcmdwaFZzem5wWUtUcnFSZGhI?=
 =?utf-8?B?RGs1MlRqZjBYd21oTUYxS1plVUxCZ2trWVZsREdjMDlBcGIxNEw0V2RURkxO?=
 =?utf-8?B?SlNwdjhxOFJCcW8vb2drbENLUlkxZGMzQWprL0R2aTBLZDQwWHpDWE43WXlF?=
 =?utf-8?B?c2RUS0dqWFk1T29YU1p4WEhyMCtVRmdvc3A5R3dkNDRRVFdieWc2UVUxc0ds?=
 =?utf-8?B?Vk5DYkJiNXdoekRLVlVnQmpaMHhZdndwUC9nYkRUOWQrL0I1UWdiOFl3WDJm?=
 =?utf-8?B?MHlsR1d0aytLOXY4K0VzampBNk1tS25DUlZhWTRWeE51UzFOR1lRTDl0WG5x?=
 =?utf-8?B?VDBqaWtlOHZHakQvL3daVzlvNWtKWVJWOHVKelNUdG01VUNsbStSakJBaUZn?=
 =?utf-8?B?Z0xHWDhEUGNIbG1FSE1JVlRZblA1TFVzUXRyY0k2Rm1YQTZGWTU2czE1VDR0?=
 =?utf-8?B?RXc0eHFQeDNrcWlFUDlDcDZyRHNkNmx0Z2RyOTBZRHE2Y1ZsRjF2d3pBRm9G?=
 =?utf-8?B?SVNKTy9hN2pTclRMeklEU3M3bUlzbXVhbGpsTkFwQ1R5RWxDTjVyZE9zRmFG?=
 =?utf-8?B?OGhJVlZ2L2N6ZnlMQzJPVnlNY2pMRWlWQm1sZVNuN2ZEQmYyMFJuZlV2ajV5?=
 =?utf-8?B?L2ZFNnMwMXNBYWhIMTdFQ2V0WmZESkJTRmxSSkRYSFlSTHV4WURzMlJTaDNn?=
 =?utf-8?B?VHdXRklzWVh4dzk4Q0FhNFFIalZHNjZ4YlkyNDRFM3hYL0h1VVJobGtlaVVp?=
 =?utf-8?Q?MNYL37kQ59Coyaw50AUOOW1LF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	itWAwxnuW9zIjxJN+KMzRiYiR1TTlSv5S5rWlL10bTsKi0SWmOxcrsWcPJRBDD9639AKf9QCILIrkfkpwy6Nwqr2QO3cWkD1hFQognW0wvxMbyP5SSlABozqWbH8juECnTFYwNMjshceq9hlIwT1dU7C9PscW4Fqx8sHmOFl/SeWVrfhqvRhCsZXDvLDbexOej2Ehq0qi6OPZnjSYwQPvhT2nSjcl2qn6uMWuDFV0JqBQG55KBBN6SSlJHvjTUEBMQCKUzMXcLMTK2Wbgm6gKC2QIJaHeDxAO3CSXjWXUVUNimb83Q02Fjhib4AzB3UL1BK7Guk/sg/v8g8xLS6197c+eG8LsTUD/IBjiPBTe339PpN4SfP8SboGgwHd+wSd+8WTjWAisjsOkqipunCbdwdyZ5k36g/dRq7hFlPVqOW/Y25lOIg2SOwAMF1uj/Bln5uaRh4iZT1gWhmFbaNk17GZullUqKtoFCczN9GWeJOWIJF5oCDPZNlnYxhtscGP6ARGSk9Lv+6vnXuWQAYc4j6YlRusukfbaWxQ1da6/mi9UdPqTi0iKaQ+NN+Dl1dZfWTMO82xVIzRwn17eCXJ54IbBCeXx9JN2uHKWmU/382tOEbxeip01kz102SADXcyHXGcQkRc4sHnqB09iVTlY4UumbrlpRVaYPWdOGufkboiyOQvmJ1c60r4xHeJfHZ6UieqMUh+VbLlsjBQU43RjDx5xZ6tJaP+S9K7EINECts6js0IpGdgbBisN55UNijovGWMPTk9qR+ICfjI16RgIfpJdqRNz/kmDI1FPW1xm61ZcSMF+FpAbOGg7Amt8nPJPkEuJ2j5C55Go4+68E/PYe0qt7Kno/ojwHE/QWjxSDegt0ZVECuRKcqcY0PkrWa17T+ZXpD5qal1IuHZrLU7Yg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d5d834-ed26-4210-4fd8-08dbba813ab2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:00:40.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsSSj/uXes46VmzCiJzZGt1oKMo1HVNOzIf7FYFDJrU1irMN30nD6bLNnEIPq8FnXfyaMJoHhds5VJGkLtKzGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6088

On Thu, Sep 21, 2023 at 09:42:08AM +0200, Jan Beulich wrote:
> On 20.09.2023 15:56, Stewart Hildebrand wrote:
> > On 9/20/23 04:09, Roger Pau Monné wrote:
> >> On Tue, Sep 19, 2023 at 12:20:39PM -0400, Stewart Hildebrand wrote:
> >>> On 9/19/23 11:39, Roger Pau Monné wrote:
> >>>> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> >>>>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >>>>> index 8f2b59e61a..a0733bb2cb 100644
> >>>>> --- a/xen/drivers/vpci/msi.c
> >>>>> +++ b/xen/drivers/vpci/msi.c
> >>>>> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
> >>>>>                       * holding the lock.
> >>>>>                       */
> >>>>>                      printk("unable to print all MSI-X entries: %d\n", rc);
> >>>>> -                    process_pending_softirqs();
> >>>>> -                    continue;
> >>>>> +                    goto pdev_done;
> >>>>>                  }
> >>>>>              }
> >>>>>
> >>>>>              spin_unlock(&pdev->vpci->lock);
> >>>>> + pdev_done:
> >>>>> +            /*
> >>>>> +             * Unlock lock to process pending softirqs. This is
> >>>>> +             * potentially unsafe, as d->pdev_list can be changed in
> >>>>> +             * meantime.
> >>>>> +             */
> >>>>> +            read_unlock(&d->pci_lock);
> >>>>>              process_pending_softirqs();
> >>>>> +            if ( !read_trylock(&d->pci_lock) )
> >>>>> +            {
> >>>>> +                printk("unable to access other devices for the domain\n");
> >>>>> +                goto domain_done;
> >>>>
> >>>> Shouldn't the domain_done label be after the read_unlock(), so that we
> >>>> can proceed to try to dump the devices for the next domain?  With the
> >>>> proposed code a failure to acquire one of the domains pci_lock
> >>>> terminates the dump.
> >>>>
> >>>>> +            }
> >>>>>          }
> >>>>> +        read_unlock(&d->pci_lock);
> >>>>>      }
> >>>>> + domain_done:
> >>>>>      rcu_read_unlock(&domlist_read_lock);
> >>>>>  }
> >>>>>
> >>>
> >>> With the label moved, a no-op expression after the label is needed to make the compiler happy:
> >>>
> >>>             }
> >>>         }
> >>>         read_unlock(&d->pci_lock);
> >>>  domain_done:
> >>>         (void)0;
> >>>     }
> >>>     rcu_read_unlock(&domlist_read_lock);
> >>> }
> >>>
> >>>
> >>> If the no-op is omitted, the compiler may complain (gcc 9.4.0):
> >>>
> >>> drivers/vpci/msi.c: In function ‘vpci_dump_msi’:
> >>> drivers/vpci/msi.c:351:2: error: label at end of compound statement
> >>>   351 |  domain_done:
> >>>       |  ^~~~~~~~~~~
> >>
> >>
> >> Might be better to place the label at the start of the loop, and
> >> likely rename to next_domain.
> > 
> > That would bypass the loop condition and increment statements.
> 
> Right, such a label would be bogus even without that; instead of "goto"
> the use site then simply should use "continue".

IIRC continue is not suitable because the code would reach the
read_unlock() without having the lock held.

Anyway, I would leave to the submitter to find a suitable way to
continue the domain iteration.

Thanks, Roger.

