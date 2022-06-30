Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFB561583
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358349.587562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyg-00012y-Em; Thu, 30 Jun 2022 08:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358349.587562; Thu, 30 Jun 2022 08:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyg-0000zK-9m; Thu, 30 Jun 2022 08:56:46 +0000
Received: by outflank-mailman (input) for mailman id 358349;
 Thu, 30 Jun 2022 08:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pye-0007Q3-IW
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8daf9869-f852-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:56:40 +0200 (CEST)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6699.namprd03.prod.outlook.com (2603:10b6:a03:402::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:56:39 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:39 +0000
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
X-Inumbo-ID: 8daf9869-f852-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=M9sDkqyoWe8u+1pJDvGlTJ+8UF/5g6xliqOyamJnVWI=;
  b=AIznX0cxbymzrphChpHVajbD5zPYTBNjfo/fsXMBX0JFetxlDxDjze2F
   CDdIpZygV5q/SjWKJo/xrB7wrw/xm+xObK1panzBQk2F/zccflueRruJs
   yzZmFTJZJeVfDcnamkkXx70q6d3+yOcIeplUFtbdTUYhH1QXlR1RvRPbV
   I=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 74098140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FRdqHasHUmZMSD5f/173jcrJs+fnVCJfMUV32f8akzHdYApBsoF/q
 tZmKW6AbquNYTD0f9l0aNvgoUlTvZCBxtJiTApk/iwxFSwV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13W4
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8TPIblqtQCdCB6PABAZrca9pz6IXGw5Jn7I03uKxMAwt1IJWRuZ8gj3L8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmmtr7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w7N9PpuvzC7IApZ16bKFfDMKvawV8xejHq1m
 kzG9W39DURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQph2fX2ECRzsZMtg+7pdqHnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:33wGB6AjpdJyNKrlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74098140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbG8SbLt/zTeVZhfR3rNJP6yMc7lq6nzCcHws5sKZgxynrbjTTNWbKjIgA1M4OPN74cTHgzO86vyCO2lEGS4bF+iv+WMBBOasylBKz/Q0cjG4eOX1Pc4QFySaPCWReuhSBUPk595qqpNiYnT7bBwAJ02FoDL6crdmPcDdZ5X0OKf+6HR5LT5Tqtg5SspyNvihxrF83LGaZiNudezt7/Q0ese2He4TE9QDtGZdXs15XMAwUwZS3ylPOdykDmzRiO1abv6N3+23udK2BOkbNP05pSFBZDay1oOlR9LxmxNHncCPODxzdwZtukL1rK7qYD0eHK0HSxeMxUxVUgR4pMZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+VcW6quQIs1mH4she5NONTPj4PREd8r33VA4ThvE2Y=;
 b=F1Qr4bEYhzaA69MHXDNH1/yRaqqqwxtHv6c1cyk5xsSpMH0QZxPDyI7fJjFAweHYjkQEv+gShzPe/PXFTGLOVk8tbGsYEjJdbGNRUYxOewhKvQWL5if/ZPQnxph1xi5qd+2t87XuRZvmO3WhB7Kr3dafIKXF/VkEdMNap+r9jTkj85wVJ5qL1ELMLHwLuONlT18OimOwf11yyXf0JHGkWX//25wBEA0xu7xecbTX+VDUFixFV07LQY5FEwgJNA80/BJYg8AFVS4seZH0cEsMb1d6EWzJ1N4yD3fRTebdXRAEw3PjeIg9xTjWcDlkGdw3vRpS2q+Zm6T0i45u6wD1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+VcW6quQIs1mH4she5NONTPj4PREd8r33VA4ThvE2Y=;
 b=J+1gMRfNFxCZ/fldV2/RIUkcQIOnx6sWedQ8bSN2rz0Llz5z5xrc/qG1qyfQiL+tJkzUZ5VlLRN7pldo4u7ZhmywnCOSNbnK4D2hvi3BIiyfXl+dZkW4tCnVdj14WKZUPrwsl4Ut1btttfv+V29QLDUC5pyLU4y2wvYBwdHuv38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/6] x86/irq: do not set nr_irqs based on nr_irqs_gsi in APIC mode
Date: Thu, 30 Jun 2022 10:54:39 +0200
Message-Id: <20220630085439.83193-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0609.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 895b7875-2d61-4f85-5a55-08da5a7671e8
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6699:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTzb38rTcOX68Xk4ctm8mkJYqsVAjffjmVPggNes2IlFsnovPzmbPEV7cOzu3yhZaijCHMG9APi5OGDG5+sSfMJPrHClxfkJIHIlfQ/SUJp4lKr3nVVyxQDoTDDh066J67nuhyiz1Rp8ThsMAPfGALtbccXPEOXkEJewGpBqUlDriVqBg/nEnA7Tg8Vuz5NUAFGJYmATR/vixkGQhMa21JlcRsdmiN5hjTFO23+aXL6HshvJpjvdtIDY7lwq61hj5oktXYWrSaR7+H5YXo5RqtvPj+0Zs3akWCvmT5puJ68d+9gqfR9i7LHgFEnApN6vCL0tQXgo4ZR4dI36x7SfHCG/rMquxeBooeNTyXP66Wgqto0FcJG4C2wzeZulRIGbETq72vUeTiqoK+T5t5jqu9QHFBomNsiDp9XB0Ao20/kC+O3WnDgaCd0xBkKthfnbtBKWAZLNf7zdtIo/TxM4yDIUwurpHpXjfw+qIAPg6OBgXGRwQR1ajwYHEi6VfemnzyLYc2EE413ZAfgmwHlK6jPHqijVvX/fvQQ9CQAB9/PHzA4rLLc1h9/ZCFZg1G3DO8bLayszdhKnGbWboaknJuSjGGyjbFzRZJc8o/MePeR7M3G8tXrDFowbUrl/Brau9CO2K0udIB2PAtuoeDMb/lbhwE1T2torbd9JlNF1biE2qCEH8+EOjDPB+3pxm/f/Q9BhLiQbmfIpKsxgIv11WXNGd53gOQF5ba5IdTIpJMaXIgTFb8Mcg2qi928UbKL45AiUdooVr5Jhe631J2wXlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(186003)(36756003)(316002)(2906002)(6506007)(86362001)(54906003)(41300700001)(2616005)(4744005)(38100700002)(6916009)(66556008)(66476007)(26005)(66946007)(4326008)(5660300002)(8936002)(8676002)(6512007)(1076003)(478600001)(6486002)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmFZN2QxUkVuNkQ3eWJhTXFpejZSb0tCM0c2dUFKY2VwZWZybTFPZHdBNndl?=
 =?utf-8?B?ajc4UTA0K3BIL1lxaldMdE5WdkxEdTd5UWNnb2xoNzZOcFVNMDhzMjdhUUR3?=
 =?utf-8?B?UUNIOG14TUo3aW00Sit3TmMxMzQ5SjhiQzVCSmFEdndtc0l0Z3pybWtod1JP?=
 =?utf-8?B?UWRVLzNIMGhBM2QzNGlrSy9zeEt1dVhsSCtVU3JsVmwxQTU4ZldwWWpMaWEw?=
 =?utf-8?B?QmJyQjJ4ZWlrbXRNUUdCYSt1dXlhN3lyQWNORCtTT0xJOHIwdGhqZzZnVkFI?=
 =?utf-8?B?TElpYlFMRFdoaVYzTkduZGhqRGM0b2lTVCs5S0JtWGk4Q3kxR0x4VnlzT3dE?=
 =?utf-8?B?V2grQklZTldubWtadkJvSTB3YjRYTklsL0UxMTVjVUUxaGdoS09sendGcmhh?=
 =?utf-8?B?WFpvd3F5S3Q2THA5MnlOSWVWeU1ic1BURnZ3ZDQxSzVJdUJYeUFwcEhYbHFL?=
 =?utf-8?B?NmJkV0RhSkFMOWZHTlh4Y1MzUVY1R21DNkNNazFGSjZEZS9UUTl6NllMc1dN?=
 =?utf-8?B?cUxjWWo3UzhYS0hmanZiQURweXpEM2VmOTlNSEY1TEVscXkyem85cXJicjQz?=
 =?utf-8?B?ZzlBVzlGWUZNQWFjMnBrQ1JDdXN5U2p6a05JazN2YU5ITXduUDJSZEpONXBq?=
 =?utf-8?B?L05pc1JVcDcrOEZxZ3I5c1lsRUZXQ0lxekVoWHJLa2ZtZW5IT2c3aTdrNHZQ?=
 =?utf-8?B?RHhOWWp1Tm1ZNkNjTGtKOUl6cnJnNDA1d2FDbkRqNCtTaXJFUDVUSU1xQmZs?=
 =?utf-8?B?L2lLRGhGOTlkVkF1bzRTeDZFSm5VRkppN2FBZzZtSEs2UGUyWFJOQ3ZBUDRF?=
 =?utf-8?B?dy94RXQwNFNMZDd4bmpDcEtzbnpXUnhSNFRmZ3ZxbWY4b00xMnZSUnIwcVk4?=
 =?utf-8?B?VXNsUXpwblVOTjZ4MWplVENmRk82RmtXQkdXcWJtYy9id3pOWlltN0RiWE9W?=
 =?utf-8?B?WGJleXJ6amhENUVnRDllM2FYRVUxeldMWUpHSU1UbzZRVno5T2Q3MVgzRHEz?=
 =?utf-8?B?VTJVTThWcFg0SitXdXRGSDE0M0N3TVNrT0Jkem9qbGtrNXd4ZDZyQU9rOHlx?=
 =?utf-8?B?b1ZvclJDMEJOeGljeFFweFFNWUdSQ1JpK1A0S3o1SEk3Z1h6Zk1iNTNmaEZT?=
 =?utf-8?B?U0pKR0hYM0F5UVNKUjQwUE90ZGNYd2NmN0xWOFNIalY2YVhqc1ZQcXpQbU0v?=
 =?utf-8?B?cHBEWFJZazZMZTdncnU0WmQ5TVYwQnJ1L21BNlpyeWg5d2tPc2lVS2JwL3Fs?=
 =?utf-8?B?ZTEwdGNJSCs0bHdxbmxUdDBwRnpIS01nTGNxSXAvUEVKWjNpalJnU2draTM0?=
 =?utf-8?B?c0xZcTErbEFYYUxqcnh0eGNkYTEzQlhycDZjRlFIejhnbHR0cEp1MlFFdXRF?=
 =?utf-8?B?YUJZV1RNUTZEck56N1Q5OU5GNnhHVlhrZ3c2TmJMVVpQSCs4UUJKemd6VHht?=
 =?utf-8?B?SGhYTU12U28xQWtodTJISzdnRCtTOWYreGVwdzI2UFRVbzJJeVFFaDJ3bWc4?=
 =?utf-8?B?UkoyaExSR2hENmVpT2lEZkN4Uk5YOHFTajM5VjdlZkNTN0tNQ2hYN3dCWHQz?=
 =?utf-8?B?TmFFd09Nci8zSWVlekF5eXdCNkdOQWU4VTE1V3BmbVZkeFBVbm85YUt1OXhF?=
 =?utf-8?B?dW9FNnFJUGRORTNyZGVIejBEWHFHSS9lT1lJTEJoRm5HQmIxSjdpT3lqSVhh?=
 =?utf-8?B?bzhLdWw3WkdWRndodi9FcDV0ZjYxekh0NU4vTjAyb0x1MVJFc09KY1JaU2NJ?=
 =?utf-8?B?K0JNWms5c3lOSjh5TGlhK096R2NwRzJMSFBOWUR4WDM4U2JtK1NtN3VKUWJZ?=
 =?utf-8?B?VWF4b3lIRkpoVFdidWZpSURGQzVDbkw3akkzZXhKZWsrRzN0TmhoVlFTbUdl?=
 =?utf-8?B?T3hHdlZlMlI4NmpHT041QlhBN29FaEhhOEdkWjBXLzlxbHNqdXFhQStWbkNQ?=
 =?utf-8?B?b3ZuODFvRG1EZVN1eVFLOGdtbVI5R05RTzFMSDZXOUtvTzFBQUlqanFmMHNN?=
 =?utf-8?B?U2VsRGRaQVNRNWVQTTZXQzFUR1BxeFZSOWxHMjduSGs0QzUxaU5DdFZ5ZEVT?=
 =?utf-8?B?LzVON0c5UDdpYmdKbVlSNnVUd3F5WDNleTdSaWVWZnI5VEJwWUY3UFIxak9a?=
 =?utf-8?B?b3NrNzJJODZFN0tEbTFhQUt2YWFBa2pLN1UyMXBaSDlpc0tpbnpWNVExS2Vj?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895b7875-2d61-4f85-5a55-08da5a7671e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:39.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGEhCFpryh4CfPmJ8Kiiii/VdSf6JS0dnhrhwdQUMUuV5lTluoLh62viBUNY+WVwk0ta306MdAMgytpgBhMuPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6699

When using an APIC do not set nr_irqs based on a factor of nr_irqs_gsi
(currently x8), and instead do so exclusively based on the amount of
available vectors on the system.

There's no point in setting nr_irqs to a value higher than the
available set of vectors, as vector allocation will fail anyway.

Fixes: e99d45da8a ('x86/x2apic: properly implement cluster mode')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 7f75ec8bcc..e3b0bee527 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -426,8 +426,7 @@ int __init init_irq_data(void)
             (x2apic_enabled && !x2apic_phys) ? x2apic_max_cluster_id + 1
                                              : num_present_cpus();
 
-        nr_irqs = cpu_has_apic ? max(vec_spaces * NR_DYNAMIC_VECTORS,
-                                     8 * nr_irqs_gsi)
+        nr_irqs = cpu_has_apic ? vec_spaces * NR_DYNAMIC_VECTORS
                                : nr_irqs_gsi;
     }
     else if ( nr_irqs < 16 )
-- 
2.36.1


