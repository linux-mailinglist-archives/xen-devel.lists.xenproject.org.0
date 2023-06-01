Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C4719CEB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542475.846400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i01-000847-4u; Thu, 01 Jun 2023 13:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542475.846400; Thu, 01 Jun 2023 13:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i00-00081p-W7; Thu, 01 Jun 2023 13:05:52 +0000
Received: by outflank-mailman (input) for mailman id 542475;
 Thu, 01 Jun 2023 13:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4hzz-000791-Bo
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:05:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07495e7c-007d-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 15:05:49 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 09:05:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 13:05:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 13:05:46 +0000
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
X-Inumbo-ID: 07495e7c-007d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685624747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YiFXxxhSMY7woCbFVIdA3BMiFbtD4MR4evhag1LgFWQ=;
  b=DB4C2g/FifApaF7tJ6IR9ESLp0mfd9woBng//OqNkG5renA/zNXIwOYK
   jr3bN6FzwanXBWRQJijb1LhKW/ETY3ajcINMa2SwhPqHwar38vHL7U9rf
   7W2T2hNCpAEiAyPRR7llFKf6HbHuB5h3zpPPHo9p7nYKwIKmemg4uQw2N
   E=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 111630327
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rxmOO6q/FUQE9DJJWRLGShzK2YVeBmLWZBIvgKrLsJaIsI4StFCzt
 garIBmPPKyLNjPyed9wbtuy/U4H75GDnNJrQAZs/isxES8T9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzyBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA0sUiyzwNqq/L/lTuNMv58pHuX3ZqpK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtLSubgraQ16LGV7kI1LDc7bASgm9agoB6RRsBzL
 lAK5RN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbprZ+QSAcwv1zTRjj8sV8/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:v0QoKay4GwV3QCbkybN3KrPwF71zdoMgy1knxilNoH1uA7Wlfq
 WV98jzuiWE7wr5NEtQ+uxoQZPhfZq+z+8S3WByB9qftWDd0QPDEGgF1/qB/9SKIVybygcy79
 YET0FIMrHN5IlB7PoTsWGDferJnrG8n5yVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AUl4b3Wp/Ug+6TovZbMbDWv7mUf0ETkHti0/MH0L?=
 =?us-ascii?q?mDWxJceafe3OMoooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Az7PmVQ0t1SubcmvlCmGdKpz/pDUjzYKKIm00zo4?=
 =?us-ascii?q?8lNCuZQNtKRuYkCqoe9py?=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111630327"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOkryvORN9wobYipfIS4SvcvfWwj9TL8CNxxGA73WWPmOiWPXs4d9/kHfdy8PxVlEp9eCLs2RajjkRQmTG4DI9X+13GFrwF32q+ky+QlmmPzpIzr8yjmme4qCSNNhSMSpMQS3sYNx6EUyDmKcaB9Bbk6R/0Xz7V8f3i6tXcP70SidwiWOMwdjlho9xRFOUgsj/E195HFCauuULE1ts+DB5Tdj/6FnW+AasSJ7QRHwr5XajTSPhB+XRmU0Ijcir2gR2SPoiRo1IGY+r4lkANUk6vRYxRfR37CJYTYGhs1yEgx3z1aShX2mN/cQ0hb9jzS2qwfNZ0uVmDTo9LChYjsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KbyhxApTsmQyQClBvfFt4PODwfZzCgM7GeO38igh0w=;
 b=No8rhiwd4u1IGjd1q+0/SltKscKPmzpXtj6A3WbZmAIPD6mCgOXQlEBZtcgDMFqHm9p+VKya9DtXLzSJYClsegr++OXagd/10dgB81i3ql52uQ3Ha8NX9F9S2rSenArRZo3jKyzpOlwS9R/MbfdF5jY6wZwH9j2bX2KzpDqijG4/m14PgKbwqZaGWTGcUqvuV/UpcFBbkK95fXMVK5dBfwXgcrCMpAwFbzhnnVGzOaMPFKMpdIhWlNjvPEOBTcA6asEdCUwOw43eyqpbinuSLIYPBXHCxK1q97U/Gky8Qk9WFgiG/0btbfpuTv/KDhmpmzUuiHvX+FY+16n8RxVadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KbyhxApTsmQyQClBvfFt4PODwfZzCgM7GeO38igh0w=;
 b=wj/FNlRx1A+fBuoPRYNVQpluh/xiUX5cgvlvhIM9SrXDd/+tHefP92BQSGSMrsN+hQkfAeo6xlZ/gfdb9Hhbab1xd0eCBc8GcN4mB2JVadjX+hIb1FmMXu85dmo3g4Ubo0bqxLXVvHZ9hdApb6g7FtzDk37c48Qit+CQRajtUhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] cmdline: parse multiple instances of the vga option
Date: Thu,  1 Jun 2023 15:05:18 +0200
Message-Id: <20230601130518.48874-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230601130518.48874-1-roger.pau@citrix.com>
References: <20230601130518.48874-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0661.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b4fb5a-f66b-4a20-25f8-08db62a0e99e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4X5ZvqegZ1e2DbKCGC32QUEkjXQo4XEUJ38p/Z3DhzTnY2SbZXXm6v1qB0AC1xW0ViqghtsjGWI04C4RQsA427DFBHoh/CRj3KsIJGJJhSp6Yo6xBx8wq8tsO5lVFDLZXU/SQKPFaq9cBTqRHhv4B96wIF5jWepO5QgXykiFbojGCECh2Aui9h+Mj7RaZNppQqWOxPNB+acmi3UHQE8eqp6m23f9ETmuHhzSFQD3JCvaUvUt6vIGxiq/ViItsoEPn7lY7TzqN65Fs0Brfh/JjQpWEHny7HwAFzR/GdKNqcekKYKcSTR0/gamsa/aNWPEqGcMdpMoq5Ga8wec+HVMyBFtdm/89PemqfCgL/7MVv/p9dAGTujvOBGPIIkj6fhxCmOTeXXFBAshuoebeIkLpWJ4FH1LsnaODAeQR+N6jBav/T5Wzzven5UDvV3OT+DWPxGAme4+I6ZL3eGeMHHjTER7DGpowN2WUQpClbQ+aORsk5hSUQlHKe9+DP1UArJhDzItuxdW0gCqvoZgweAJvH8y+PAqiefAmJBrfEMmeK1O0jzXi2XeVYzVX2qy39bi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(83380400001)(66556008)(6506007)(66946007)(66476007)(6916009)(6512007)(26005)(6666004)(1076003)(54906003)(2616005)(186003)(86362001)(6486002)(2906002)(8936002)(5660300002)(478600001)(8676002)(36756003)(82960400001)(4326008)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3dtUXNKSjlJRlg0cCtsbnova3pQTE4rQWZsV1QxUngwVS9pSWowU1ZyUUtX?=
 =?utf-8?B?SEp4UDFoSkJLK3h0WmMvNFZMY0hkSm5na1M2bHV0ZmRDWDhXME1ZTzBRaStj?=
 =?utf-8?B?bjV1bGN0WlRlNWplN0piM2JVVnljTm9WOGNmWk1VbUZDQytjVFhyYi9ONXNY?=
 =?utf-8?B?cDg3blNkK01mQ3lQcXQ3UDd4bnF2UWFubHVGQ3pPWnBwd0ZZS0VzQmZIbkhM?=
 =?utf-8?B?RE83TnJST0NCVnNxWW9tY29ZWlk1bXU1U1p1VTdRVVZ2eSs1RjZFMVZTeHhw?=
 =?utf-8?B?U0svUjA1TG54TlFiNWtkQWRURGFoSEpyakxKYWlBY3AvZmtsdkpDRzFWdS9Z?=
 =?utf-8?B?UzJ3UHRkNjFRd1ZVR0l0ZjY5NGR0TjBzWDNkNXhBc0IzVGpPVG1nQWxsYllP?=
 =?utf-8?B?VXBONlYxTTRCK1FQOTM5aWMrMmxTdERTQUZldXlac1NkZm9TRU44ZzY1WnRS?=
 =?utf-8?B?VXVONW5qM2UxV2NUOVdwOWQvRzVxU3NMT2NTcmQ2Nm8vY2dnbVpVTFR0QnBI?=
 =?utf-8?B?eWxqNkVzREwzbk5FVEpRbjQ2aDBkcVRyWjVEb0NQWXZXcWZkODU5VXhqVlFj?=
 =?utf-8?B?a21TVnVEZVQ4eW5EaGR1TFVWVExObFkxRTN4aGF0ZEVSS2NaQ0toOXQvYlgy?=
 =?utf-8?B?N01RK1JQM3hkN3hIMS94U0NCQkl6U1RDOWVKOWJyK0VvNFRLSzRTdlcwSmpn?=
 =?utf-8?B?YmljUEJGWmdqaFFYSFRHR1Z1Uk5yMjlmT3gvOHUyb1ZHK1VHL0JMZlo1M0xM?=
 =?utf-8?B?QjNYbmtpek1XMWZZWS9PZkpzdXBDeFZMM0gzb0ZMV0dwZ2VXUUxqTnVBa3lI?=
 =?utf-8?B?Q2htR05wM2FBZnQ3MHJ0aGFhNXBxSXkwNlkyZ2syQ0JqdWh6QlljckI4MGhD?=
 =?utf-8?B?U1M2bXpnbXh1aVpzZ256dlcwVUVTKzNCUzgrOWt1TytnZ1l4d3hMbHRxdzRs?=
 =?utf-8?B?RzlCNFFKVUxvRFlxTk90STBwbS92NkJmeDJtZnpteVlCdDdocVBiRmVUUDBw?=
 =?utf-8?B?R0tpVTJScVVFcUdDRE83QWE4UVVkVDJhbzhPWllhaGxPZGsvclZDTXBjWFBk?=
 =?utf-8?B?NFRIOEIxOFMxYUZzZzlwdS9xSUs1NDF0RDBkQkloTHNzZmwyZGhocXdYbWRv?=
 =?utf-8?B?c3E3d0E2VS9QUHBPeUV4eFl2ZFBab0o5dE1MWEpidGU1cjdCcUVuZjFHR051?=
 =?utf-8?B?cGRtOWNGeEo3WUdSZ2pVNUdzVXlTZlU0aU91dkJPN0xGOEVXbmRvamtiNlph?=
 =?utf-8?B?ZEFoK2dPRU94Q0tiQWRQMUFXNnJFNXhRLzA4ME5pK0IzR2Irc1Z6ZWZDVG5v?=
 =?utf-8?B?V000Y2s2NVd6dGRBVEc4OGdGeEdVanpzNjRiTWpaTDg0c1dRbFBtcUN0L0o0?=
 =?utf-8?B?a1d1OGhnSU1nWFRoSVR4R05yU2QzMG03SGtCZmpURU5FdUtkWlZ0b3c4TVhZ?=
 =?utf-8?B?cXJGWnZ2M1hRTlh0NlczMjdKQXJkbXhQOThZbUlLQy92U0p0dm1VeWliN0pN?=
 =?utf-8?B?T09YdGJnR1ZFRmJQc2Z4UW9jVysyR2VTUXZyd1hpOHRLRktEYXdkYSs1MDI3?=
 =?utf-8?B?WVNDUmpkanZKcmRrei9KZnNzR29waUJjY2dwU3JwNGZxMHFOM2tJMk1oWEox?=
 =?utf-8?B?aml2RzVROHlQdEpZMmlCcGE1RjNuVTFGT0piOXdTb3VXd2VCbkFxVmxsVWZt?=
 =?utf-8?B?Rzg5U3UyMzMzdnl5eXlDU1VxejZzWEZEcWIyZlBWVFptZHZFamYrWDhNQ0tK?=
 =?utf-8?B?Y1pqRVNsRnRKSXk3T01jVHVVa3BqQTV1VzlvYjZSM0QvYmlKQjJ3ZnFVeDBa?=
 =?utf-8?B?YjVxbjZ3c2w0K2ZKby9JSkZDRkt2ejlMWlVMNzVVaEhVaWtVVXBPMzhFN1Ew?=
 =?utf-8?B?dUFjMkZYM3VwWnpjeGQxUCthYVR2dWltS0o3VW44NE1GZGd3dHJJM09VbTVk?=
 =?utf-8?B?RjY4dnloVSszNEFyYlk2M2ZrQTZyS3VPSzVYM090TlJkeE5KT2c4OE4xMjRI?=
 =?utf-8?B?VDllbEhrNDZKazJUYWt5MExoMWhHNlhzU0JLR2NPWnpiYUJKaERzdTU0aldi?=
 =?utf-8?B?ZFlzZlFmdXJ6dGZYTnRqd3Y4dktrVnJ2YllKOUNrNi9LZ0MzRFk5ZkdDWUlM?=
 =?utf-8?B?NXp4SngzaGpLSnZMUG9lVVVVSUFRTndyZTIrRVZlZjhnaElqay8wUzV6dUNk?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JeQy0UGDCwCxdab9G6dugZZj44vWGV/8WNhVkIgrSGy/JAD9QwdP6oF4ZDZ7ZsbvHYj8/6uquKrk2mhLWae7weuLbxKARu7CUEMY1hWB5RAofCWvkmXPPS3bCislU1mYfWxd1R/kO9gVUYIFO3/jtpxwvJKb22OsOgQkIsuGvb8X03pFWtdFy2g68gfjiF9fXInvZMAn6H995UwnnVxq5lLVdp+bTXpDZdqgtY9ww2sN70vDz5b2b+GZ5hoSxTUOZLvO1oFNNieGmntFiC52nlsBFCHkVzW7lhx7p52T1/f1Y1wJY9qxJk5YXX2c3/xv64D3dt3BIXjBGZykvDJeFI1cRRyx4b0EIM1zsn9B4MZl9E9XWyJisCS0rz+tPBzr2WDiq02a9QXYvcMTgXZGtJWgek8x1Jt5jMED1SfV4QqOO/IQXnoEfyKcOy16VI7g8qos+MmBxSCT0lajmHFVwY1p6Q7b8CKUOvjh2FnUUOfmfEvJCWcRWXWljCDwY1ZhxpvvCSTDNrHIJZwHMQUONA9G6Ox+1B061R4/1wxT8cPckhXZBbCOs4Ow/MVJswfUYc3eNKpnoh64shEZg/tMCgXCK+f/bgF3ZJAxeGblHnToAcfbKEQSFmbBcbYGsV6AGnyQ7lE22q13510h14FM8r8j5xgTT8NXWv8pJCLqCP3mgpHLqbyDkBz/FjP4CSnIMCbGOAbzC+4dDFrawUqPbc32rsIeFTYNtuQc87sSE7K7FErzybZSBvxyXXN8oLxS31tRYIjsm9DWWW2NrhyQKykYTsQtgsEIBvfmUlQIQlb9DP3maOBS0DXkiMzu0QxfnOjbDpMUomRHxihW44r9TLUljw2FncyNJiUWtp5bnzY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b4fb5a-f66b-4a20-25f8-08db62a0e99e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 13:05:45.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbYvD5B90rU1cWYOzJL5StUmp7WoDnXYgHwD0lkY4XuEo3Gt2r8Ph089zwI6DI7HtcKVah80IVwAuagabx/GmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

Parse all instances of the vga= option on the command line, in order
to always enforce the last selection on the command line.

Note that it's not safe to parse just the last occurrence of the vga=
option, as then a command line with `vga=current vga=keep` would
result in current being ignored.

Adjust the command line documentation to describe the new behavior.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
Build tested only, as I don't have a system that does legacy boot and
has VGA output I can check.

It's mostly encapsulating the current code inside of a while loop and
adding an extra else if for the "ask" option, there's a lot of
indentation changes.
---
 docs/misc/xen-command-line.pandoc |  3 ++
 xen/arch/x86/boot/cmdline.c       | 85 +++++++++++++++----------------
 2 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d3319..8cf2f3423d47 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2628,6 +2628,9 @@ with the specified width, height and depth.
 `ask` option.  (N.B menu modes are displayed in hex, so `<mode>`
 should be a hexadecimal number)
 
+Note that all the occurrences of the vga option in the command line are parsed,
+and hence later occurrences can overwrite selections done by prior ones.
+
 The optional `keep` parameter causes Xen to continue using the vga
 console even after dom0 has been started.  The default behaviour is to
 relinquish control to dom0.
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index fc11c6d3c5c4..511e77e0c2b5 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -277,59 +277,58 @@ static u16 rows2vmode(unsigned int rows)
 
 static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 {
-    const char *c;
-    unsigned int tmp, vesa_depth, vesa_height, vesa_width;
-
-    c = find_opt(cmdline, "vga=", true);
-
-    if ( !c )
-        return;
+    const char *c = cmdline;
 
-    ebo->boot_vid_mode = ASK_VGA;
-
-    if ( !strmaxcmp(c, "current", delim_chars_comma) )
-        ebo->boot_vid_mode = VIDEO_CURRENT_MODE;
-    else if ( !strsubcmp(c, "text-80x") )
-    {
-        c += strlen("text-80x");
-        ebo->boot_vid_mode = rows2vmode(strtoui(c, delim_chars_comma, NULL));
-    }
-    else if ( !strsubcmp(c, "gfx-") )
+    while ( (c = find_opt(c, "vga=", true)) != NULL )
     {
-        vesa_width = strtoui(c + strlen("gfx-"), "x", &c);
+        unsigned int tmp, vesa_depth, vesa_height, vesa_width;
 
-        if ( vesa_width > U16_MAX )
-            return;
+        if ( !strmaxcmp(c, "current", delim_chars_comma) )
+            ebo->boot_vid_mode = VIDEO_CURRENT_MODE;
+        else if ( !strsubcmp(c, "text-80x") )
+        {
+            c += strlen("text-80x");
+            ebo->boot_vid_mode = rows2vmode(strtoui(c, delim_chars_comma, NULL));
+        }
+        else if ( !strsubcmp(c, "gfx-") )
+        {
+            vesa_width = strtoui(c + strlen("gfx-"), "x", &c);
 
-        /*
-         * Increment c outside of strtoui() because otherwise some
-         * compiler may complain with following message:
-         * warning: operation on 'c' may be undefined.
-         */
-        ++c;
-        vesa_height = strtoui(c, "x", &c);
+            if ( vesa_width > U16_MAX )
+                return;
 
-        if ( vesa_height > U16_MAX )
-            return;
+            /*
+             * Increment c outside of strtoui() because otherwise some
+             * compiler may complain with following message:
+             * warning: operation on 'c' may be undefined.
+             */
+            ++c;
+            vesa_height = strtoui(c, "x", &c);
 
-        vesa_depth = strtoui(++c, delim_chars_comma, NULL);
+            if ( vesa_height > U16_MAX )
+                return;
 
-        if ( vesa_depth > U16_MAX )
-            return;
+            vesa_depth = strtoui(++c, delim_chars_comma, NULL);
 
-        ebo->vesa_width = vesa_width;
-        ebo->vesa_height = vesa_height;
-        ebo->vesa_depth = vesa_depth;
-        ebo->boot_vid_mode = VIDEO_VESA_BY_SIZE;
-    }
-    else if ( !strsubcmp(c, "mode-") )
-    {
-        tmp = strtoui(c + strlen("mode-"), delim_chars_comma, NULL);
+            if ( vesa_depth > U16_MAX )
+                return;
 
-        if ( tmp > U16_MAX )
-            return;
+            ebo->vesa_width = vesa_width;
+            ebo->vesa_height = vesa_height;
+            ebo->vesa_depth = vesa_depth;
+            ebo->boot_vid_mode = VIDEO_VESA_BY_SIZE;
+        }
+        else if ( !strsubcmp(c, "mode-") )
+        {
+            tmp = strtoui(c + strlen("mode-"), delim_chars_comma, NULL);
 
-        ebo->boot_vid_mode = tmp;
+            if ( tmp > U16_MAX )
+                return;
+
+            ebo->boot_vid_mode = tmp;
+        }
+        else if ( !strsubcmp(c, "ask") )
+            ebo->boot_vid_mode = ASK_VGA;
     }
 }
 #endif
-- 
2.40.0


