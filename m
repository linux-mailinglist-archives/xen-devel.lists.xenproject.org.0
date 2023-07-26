Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A37636DB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570453.892241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3K-0001nw-UA; Wed, 26 Jul 2023 12:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570453.892241; Wed, 26 Jul 2023 12:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOe3K-0001lP-Pd; Wed, 26 Jul 2023 12:55:42 +0000
Received: by outflank-mailman (input) for mailman id 570453;
 Wed, 26 Jul 2023 12:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD/9=DM=citrix.com=prvs=564dce665=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOe3I-0001jo-CN
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:55:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b7f66c-2bb3-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 14:55:39 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2023 08:55:32 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB4964.namprd03.prod.outlook.com (2603:10b6:408:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:55:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 12:55:29 +0000
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
X-Inumbo-ID: b7b7f66c-2bb3-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690376139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zxay+fjWD7Q5pjhPAAOErwHFFjDdYjv3cBVue6zMQvQ=;
  b=UzUMAE7xkJYZZhhgSIa1MvfzyaN2xR4WecxT7nenBvUXnu2EmPRczdwr
   UVShtfjtGvmx75lNLCWmIHFF3h+FrP1mirGUrpUnq86wwcnlY0qxdGgqj
   PYV7vAg00yBBiJbvoOgN3u2dGDerbPxYNXfCONSYvLg9BDbUImLSRNilr
   U=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 116199184
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l2IvhapeVVd8piE7VNWL7hA+nrFeBmI/ZBIvgKrLsJaIsI4StFCzt
 garIBnQbq2MamH1L9kgaNzloBgF7Z7SydUyTAZlrnthE3tEpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSdNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAATdTKg3PiN+ur4bfZXmPoNJpbgJ4xK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdxLRezhpqICbFu743c6AzlISliBkN7llEqeS9RGK
 nQpw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0uVSs45SPLqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:Wd4/haHnE9zLq9wSpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A9uWIsmjfE1J5HPD234sebBf8VDJuQmPG7lSLOXS?=
 =?us-ascii?q?CUSVOV4aLd3Gap6h/nJ87?=
X-Talos-MUID: 9a23:fJbMDAo48WfW1mYYoXsezxR5HcxMvbutMnEqzYsCm9mCLC1IBg7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,232,1684814400"; 
   d="scan'208";a="116199184"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9B4AOSp9zIPZFpqoJuyyk7aP8v9boiWOmt0kQIHHxfsK/RFQb4eeUACCs1qR3rdvlcWlSv8y2dPhqMmHjmaMZZ00lI49GUZbLSJ6E6fij25W8mrqNDO5RW5JOLnG1afE0i2scaWyF51ZsQp6DkM5RzHt44rkgcNNFFfsHKHT2ViFssKRauhkPrn22LXBQFaqqG+S23W2fmEvUsclczJ7M6ZFOhuCTXZViBEQGsCegc4+S93Ba3C4SswDQ6vEBUTj87YRyk4s3F1b9FhrGnLVKCAteksT9m7IIhePo8Vnlj48/B2Z5amzgY9FMFq1+U1fyZrpyp5BLtnx6hHzMLmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMLLJuQaKwbKD73WGXmC1pk5x2poKlwnGry2jF/xGuI=;
 b=LSnir7jDBSvxRELJ8Wosain9sc9uvY3E2/LEPzFCazrHjBYaU7ypo6Ztj8uqNVv+jic0h8DLVa9+9Ww6jyDmSl2svtX//sYnle0UalyoHGxp654SixHwGBumdu/V3h1h0b3ovun1A4Khb0hdrQLa07yzUDamJTZ+MlEw6yQ8Qi/gk6DOdcVoEMDj6MLrwDjsMMwjpTox/vxouesZfKgaTIDkjGcKPqUb/qh8m5xJPqz/1V79MLaiYb6bbjwstCGrJmEbVkkNkjy4CXU2Pxs+ECXphAt1/VzhojW2zhtcfkGw7M0XT7B1udlcDm+IIzJKDnjWC037GLJaeg2r9qp8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMLLJuQaKwbKD73WGXmC1pk5x2poKlwnGry2jF/xGuI=;
 b=cbncixaf/saD6QfzODfJKu20cdwGAUH5A4zYypOIzmZTLiUZ345N1w3Rz6SjkmniM/rI0qTi9CsSJTyGBY8GE1gWfsZ2ZNlAjfitlPudLzphGLjfDGy6pvw2nuI6i7R1PdfB9pctECX0Fft+S0fY/HPNiVS1i9RDLzKSOZ3K1sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/4] x86/ioapic: RTE modifications must use ioapic_write_entry
Date: Wed, 26 Jul 2023 14:55:06 +0200
Message-ID: <20230726125508.78704-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726125508.78704-1-roger.pau@citrix.com>
References: <20230726125508.78704-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: fa60e983-b585-4408-73a1-08db8dd796eb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AqD/nR5ahdisSEphxqk3A54xMqVKYV1RzR/1caJSCW/a3vMCVgRoTeQ4vcfVr9qwKdhnlYxwfDycO0vbl/TOQXBEUZ+c0Sk3fhQw0yGv+rfUSdLzhdWvOts22L7UsAW1Hvmdc38qScISLQNbHl+/TvJJfwURiQsyFWLLzr0R2CwAG3l3LH1l38WMmPZ3hIXUC3Eq4oZp2UX8YtoNbld0sCI/cyA0C3c+dJUIgJoiS/GlbtiqPu1Teqc/QSG5SKRJ74c0pqN7B0wu5X/MZhHDJYY3z/o+L/HtpY3Xn4vgcFEKy9whkn2yKmS+4NvlH9aDG/HuNTmjxWEOlCic/dGk1PjQbMpFEW8mio/I8HSz4J4PTJ2whkQePrP6n2xPlInfpaFSjfFjygWUOK9LwnNWUOY3NtqYpJ5XqPCZaEa0hLJ/a1S2H3yorKvH0EuW10qTXrHv8eJDSTmj4x6nwuKWvhiOJuOI/U1sANMYmGFBOE8O8A6vDP+0WEl9+tWWWKvMxj7hVqLMUpHLXf+LDeKrBB7cXZizxXWTRF/C+qQ19DtjbBmvxZ0h1pRwfTaOWWY3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(26005)(6506007)(478600001)(38100700002)(6512007)(86362001)(36756003)(6916009)(4326008)(8676002)(8936002)(186003)(316002)(66946007)(66476007)(66556008)(5660300002)(2906002)(2616005)(83380400001)(54906003)(82960400001)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDhvUi9aS3RMcVhtOGUwUmxkSlpSRjlJbHIvL056YytpTnU2ajRlTzZmMmFD?=
 =?utf-8?B?NFF0SjEzSWN3ZG1GdHltdk80VnJFaXgwak03SktacmhtNVdoL2hYZjVleFFu?=
 =?utf-8?B?dWhsYUhQYUlHdHUrMm5OZlZDbW5aQjFyOVgyTklJQTNzM3AreVFQcEthT0wy?=
 =?utf-8?B?SXpHYVFyZmM5TUVydkVHN0l6dmZTbXpwdlE5bG1ZdGl1VmFCV1BjZk9FWEVJ?=
 =?utf-8?B?SWQrWkJrdDRnMjlZcjBnQkZ2K2hTMEphc254VlpldDlyZGVCNEROS09kMHVa?=
 =?utf-8?B?Vzl6cUpXOUFTZVg5NnY4bUMzcURpTGx6OHRyaEYzNUNGWGlkNWdjSGlGcjMx?=
 =?utf-8?B?aXc3dVpmdU9OSUpEa2grRVhYM2g4d3NHOC8yOUl2TUtpSmhtd3FDemg5TU5X?=
 =?utf-8?B?czhWNVVXVnRUUDY2U1JBRmJiQklkVE9pZnNpcXBDZzVTOVRNY1VXTmhyMmJs?=
 =?utf-8?B?UnpXcUY4Qm4zL3Y0SnVLR3hlUG9Fd0xncExhdkhZbk9JV1JmUTJnWGdROVJT?=
 =?utf-8?B?d0pNcDRxSERTcU13OERwV2tzRmN4NjNVYng3UWpBK2wrYzRLN01YeVlXVzRE?=
 =?utf-8?B?Z3V5ckEvaDEwVTlXRWU2eEVVNE1ER2tIdTVTMlhNa3RTb2tMdnBjdUFHckM5?=
 =?utf-8?B?ZEt5QWZCMmtZelVpWjlNdDdKMjBzTVRDWXVaVkI5aU55UDhMRlF5ZWFmc21o?=
 =?utf-8?B?aDVkTXFBMEdMNDNDbzI4UkwrL3NLaVZkLzl5VTBZdUIzeVlKcVJmMWw1bmJX?=
 =?utf-8?B?aW1oR25BNUt4NXNPVGFLVHZqSVh4Wkd4UCtIbHR3VkdBNklMSXdzZDdGVzUx?=
 =?utf-8?B?SGJiTFVRVGFsMDFxZzhkWkJFdUxsaE1RRWh6bUxXZnFnNEVlNkJQV3NpN1M0?=
 =?utf-8?B?KzVZcVRFQkJNY25LZTk2aENleDQrSk9GMlBkY0l6c2VnZXFaeHY5NVRQM0R2?=
 =?utf-8?B?WjBMcFAvb1FpK2NhR01tR1BQclNiR1gwTllteTVGeTlQNXArMUt0MzV1V0dt?=
 =?utf-8?B?TzF5VzBYWlFma0dLNURFVm93cTRCWTFuRWw3NWV5enQrbmxJR3ZiN3NIa1Nz?=
 =?utf-8?B?NmFnN3RBMldPYjZZN2Z5MzVlVC9NekcreFFjb1gxbFdkUXdXSVR0MmxOekNq?=
 =?utf-8?B?ZWpHT241UDFVTE9HZXBxT1RRNElDaUhNMzBUdGNodjYvaUNnTk1BSDIzMDhR?=
 =?utf-8?B?M09oTWZWdEFsbDJsS3pqYUpKQlViNGdPSkV0YzY3Z2grdHVsVmViVGxzNFgz?=
 =?utf-8?B?WXVjUG1XS0dkYjhNdWhldmVOL3JTcEtwam9lUE1ORktBZFFYNVpVNE9Ra3Br?=
 =?utf-8?B?QVV2WDY0dUJ2Y1BiSTJFNS93aVkrdktwOVErRytKekZwYmVSMXdXeFhuNVU2?=
 =?utf-8?B?c0VxbnFHYWhJRFlQQStRQnpmUThxZk5iWjgvSFJRS3FCRjVKTlNLM1pqM25h?=
 =?utf-8?B?SnFjOVNadnJ4ZkY5TnZuMVp1bG9yaDNGSlgveVdKamZWc1pHdnhqdkpKQlJq?=
 =?utf-8?B?Z3BDWjVSb2g2Sk56SU1KdTRHdnBjWGVWOUkveVRZZ1NPU1NldnJCR2dmSGc1?=
 =?utf-8?B?YzdjaTd1QWRpd29tM0hONkdVY0NPN0ZFMW12UWlPdVhyMWhhTkdJcVhNK0xX?=
 =?utf-8?B?cmcyY1grZEZvSDN4SzI4Y0R1Vk55L3VtYXJYTkpLb25yZUE4Qnh5Ty9BQkl2?=
 =?utf-8?B?RGtHc0J1dkt0V3ZQcVVnRlQvcytWa2ptcFdid3dZOVhnalUwM3BEc0NwWmZ6?=
 =?utf-8?B?bEIrL3IrU2VKaWRJMDZ0NmNVcFJEejFXM2xTUFoxemRORU9UMVllSXgxWVNx?=
 =?utf-8?B?eEQ0dmo4MXptRE9XUUx4MVRVWGZIT0ltcW11SVVQN0F4L1ZsZmpFT3l6WHBy?=
 =?utf-8?B?VXdJaUlTTXFpN3FZRDhFZ1pWTWlPQ0lIVWg5THZmUzlDWk8yeXpuMGU3SHpp?=
 =?utf-8?B?TmRiRHRlT0N3ejU4MVF1dW5nSFFQa3NDRE02b0o4MFVtdXNCZXJNYWE2aUFW?=
 =?utf-8?B?UnNjRFFDV2cweDZzbEZ2UDFYclBBOFZvcGhYYXJXQ2wvdythUy9SbThXSGZT?=
 =?utf-8?B?SGxEeXFuN0dnV3daa1E5Nmh6eDhudENTN3FXTmk3eXBBbFdrUmJ5RmRFb3pX?=
 =?utf-8?B?dHdtTHJlRGRBeUFnaGFrTWs2YlVnOWRQTUpGMHkxTk5admVJaXRVdXBmRGRu?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d3Vw4+bsf0gSQuyWoScprpIAlpJj6iBEHavN6qWlMDqWASNKZq3UVjr8ysGL0z9QVIlXFXeIhxA+4wnH7viU0rvA8qWo/8EtoqMmAttD9k1TnXwFtw3GnxJ47lpfekfpPbE6gjpiZ57miqkI/J9Ytkk4gjDeMeUXJhHJL5O+PFkOi+n4IklM4l2WAOLXGicJhdHqlqm1HqQiUT2zuezyF4eFXncMJ5H2sZG6GgS1cicTjRw29RrZl/6Yhr7OBprgf6hWGMPLg38TvigE3A3FtZecwg0MYJgJyjCLhB0B2EGbOEviacQYm+xgL1HWY1x5moQ+MMsCHFG5Wpge/hVJzV9YptDZLoGp/dmqoOfwdJ0ZgEfZCZq6uGYcyyxSU65CkAWhLjxj3nNzl92Ha04iOnHwPst+hmgjTVqMtz1DobMEAH4zwZngnPGx17b1FanIwx414e97UZ9gVnP/SJv1p18UdoLdY1spxv4vG7M6GfEcZ/s2qRsne41HhMysW3P2AoJfvs3DzKcQJ2EEHZhD2RmCrziXc0S4Dhu7EDlbPgSiskD62134n8N9MR/8RM9S5DmxRzKbq7rxgwXgikfbSc+F/Otk6rY8gkwzc57RkxEOkkjBx4B9cLf/Cwc7d9PzgSQdZ1Ch9Mqyhuws47yPh4YerbuK3wQb1oM8bK1+rAZdhxBHrAMa8pyfbK+7C3LcKe7tfVDYDpGI1mkryf0BjqqWjShwmD861DB+W7pwENsPb3kxnTlnJEw8LmoxulUaMkKFkBC+XbXWX5VDdpJ8xFA4Nsjg3QB1WhzLNNbv1+OfECtzsJ07jDMI3QppC1CWR2PwEQg3qWfU+B8nNp2BTA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa60e983-b585-4408-73a1-08db8dd796eb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:55:29.3953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OdzZk6HnEBfL5HbK+6yWylqyxbxD83YJZh/HYx7bwBBQa4w7B+qagLRvAhsNqBxa+LQN2CNw0wNInSKsqsXAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4964

Do not allow to write to RTE registers using io_apic_write and instead
require changes to RTE to be performed using ioapic_write_entry.

This is in preparation for passing the full contents of the RTE to the
IOMMU interrupt remapping handlers, so remapping entries for IO-APIC
RTEs can be updated atomically when possible.

While immediately this commit might expand the number of MMIO accesses
in order to update an IO-APIC RTE, further changes will benefit from
getting the full RTE value passed to the IOMMU handlers, as the logic
is greatly simplified when the IOMMU handlers can get the complete RTE
value in one go.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Also adjust __ioapic_read_entry().

Changes since v1:
 - Reinstate io_apic_modify().
 - Expand commit message.
---
 xen/arch/x86/include/asm/io_apic.h       |  8 ++---
 xen/arch/x86/io_apic.c                   | 43 ++++++++++++------------
 xen/drivers/passthrough/amd/iommu_intr.c |  6 ----
 3 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 4c4777b68a51..9165da2281ae 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -162,8 +162,8 @@ static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned
 
 static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
+    /* RTE writes must use ioapic_write_entry. */
+    BUG_ON(reg >= 0x10);
     __io_apic_write(apic, reg, value);
 }
 
@@ -173,8 +173,8 @@ static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned i
  */
 static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
+    /* RTE writes must use ioapic_write_entry. */
+    BUG_ON(reg >= 0x10);
     *(IO_APIC_BASE(apic) + 4) = value;
 }
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index aada2ef96c62..041233b9b706 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -237,15 +237,15 @@ struct IO_APIC_route_entry __ioapic_read_entry(
 {
     union entry_union eu;
 
-    if ( raw )
+    if ( raw || !iommu_intremap )
     {
         eu.w1 = __io_apic_read(apic, 0x10 + 2 * pin);
         eu.w2 = __io_apic_read(apic, 0x11 + 2 * pin);
     }
     else
     {
-        eu.w1 = io_apic_read(apic, 0x10 + 2 * pin);
-        eu.w2 = io_apic_read(apic, 0x11 + 2 * pin);
+        eu.w1 = iommu_read_apic_from_ire(apic, 0x10 + 2 * pin);
+        eu.w2 = iommu_read_apic_from_ire(apic, 0x11 + 2 * pin);
     }
 
     return eu.entry;
@@ -269,15 +269,15 @@ void __ioapic_write_entry(
 {
     union entry_union eu = { .entry = e };
 
-    if ( raw )
+    if ( raw || !iommu_intremap )
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
     {
-        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
-        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
+        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
     }
 }
 
@@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
                                unsigned int disable)
 {
     struct irq_pin_list *entry = irq_2_pin + irq;
-    unsigned int pin, reg;
 
     for (;;) {
-        pin = entry->pin;
+        unsigned int pin = entry->pin;
+        struct IO_APIC_route_entry rte;
+
         if (pin == -1)
             break;
-        reg = io_apic_read(entry->apic, 0x10 + pin*2);
-        reg &= ~disable;
-        reg |= enable;
-        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
+        rte = __ioapic_read_entry(entry->apic, pin, false);
+        rte.raw &= ~(uint64_t)disable;
+        rte.raw |= enable;
+        __ioapic_write_entry(entry->apic, pin, false, rte);
         if (!entry->next)
             break;
         entry = irq_2_pin + entry->next;
@@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
             dest = SET_APIC_LOGICAL_ID(dest);
         entry = irq_2_pin + irq;
         for (;;) {
-            unsigned int data;
+            struct IO_APIC_route_entry rte;
+
             pin = entry->pin;
             if (pin == -1)
                 break;
 
-            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
-            data = io_apic_read(entry->apic, 0x10 + pin*2);
-            data &= ~IO_APIC_REDIR_VECTOR_MASK;
-            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
-            io_apic_modify(entry->apic, 0x10 + pin*2, data);
+            rte = __ioapic_read_entry(entry->apic, pin, false);
+            rte.dest.dest32 = dest;
+            rte.vector = desc->arch.vector;
+            __ioapic_write_entry(entry->apic, pin, false, rte);
 
             if (!entry->next)
                 break;
@@ -2127,10 +2128,8 @@ void ioapic_resume(void)
             reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
             __io_apic_write(apic, 0, reg_00.raw);
         }
-        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++) {
-            __io_apic_write(apic, 0x11+2*i, *(((int *)entry)+1));
-            __io_apic_write(apic, 0x10+2*i, *(((int *)entry)+0));
-        }
+        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++)
+            __ioapic_write_entry(apic, i, true, *entry);
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9e6be3be3515..f32c418a7e49 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -361,12 +361,6 @@ void cf_check amd_iommu_ioapic_update_ire(
     struct amd_iommu *iommu;
     unsigned int idx;
 
-    if ( !iommu_intremap )
-    {
-        __io_apic_write(apic, reg, value);
-        return;
-    }
-
     idx = ioapic_id_to_index(IO_APIC_ID(apic));
     if ( idx == MAX_IO_APICS )
         return;
-- 
2.41.0


