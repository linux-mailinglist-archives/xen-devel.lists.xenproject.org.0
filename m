Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200697B9D0B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612981.953196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNgI-0000mm-5p; Thu, 05 Oct 2023 12:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612981.953196; Thu, 05 Oct 2023 12:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNgI-0000jo-33; Thu, 05 Oct 2023 12:42:18 +0000
Received: by outflank-mailman (input) for mailman id 612981;
 Thu, 05 Oct 2023 12:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhCt=FT=citrix.com=prvs=635b598b3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoNgG-0000ji-4t
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:42:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a53f7e6-637c-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 14:42:14 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2023 08:42:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB5108.namprd03.prod.outlook.com (2603:10b6:408:db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Thu, 5 Oct
 2023 12:42:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 12:42:06 +0000
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
X-Inumbo-ID: 9a53f7e6-637c-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696509733;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8Sao735WI9AEEMZtU6qSQLo35yUiDPkGHwmXzAhLtAM=;
  b=T5e+rBhS5JUt+FEPCqHJ8L9yXIYjnN8r9m8CANT1K9LQCEPbOLmXEiGS
   bia42kAnpHB/kb5jknmDUinyRXQ39Woa6vfydIZ8rZxNqfaxV++hqAm/h
   IuIw8bp0VAq/9cdogeiPlII+ci+7Ir27MVBcZ+I+jcUmltup+0fN9Y9di
   g=;
X-CSE-ConnectionGUID: CKwmrl73Q7mX1EJtGu/j0A==
X-CSE-MsgGUID: 9hvNnXsPSdakCnlU8FbaEQ==
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 124579591
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:s5pbJalCJHRP+OwKLk/Sfyjo5gxYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDTrSb6uIN2Dxcop0O4jl9ExX7JWHxtZhGwI4/ChmQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dc7NzUXak/Yvr2z8OuWaPVDm4MhdOC+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3iee1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmnBd1DSezhnhJsqAyT2EoVOAYubleyotK/jnPuddhWB
 nVBr0LCqoB3riRHVOLVQxS9qWWsoh0YVtxfAuA+rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqd+7GOvHWtMC4aBWYYYGkPSg5ty9vprZw3jxnPZs1+C6PzhdrwcRnvx
 xiaoS54gK8c5eYJyqG68Fbvkz+q4J/TQWYICh7/W2uk6kZyY9ejbonxsFzDt68fdMCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfS+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:X+wjOKvxX1ztc9vDdTymFqD07skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-Talos-CUID: =?us-ascii?q?9a23=3A3qEHLmoVDvEh7fKNHRC3M37mUesGbXjHyCiLGhC?=
 =?us-ascii?q?9OT9EaqG6VBiSoIoxxg=3D=3D?=
X-Talos-MUID: 9a23:Si7LdgVIgI4g7+vq/G7smhdkBNxQ2KinC2sLlahWlcONGBUlbg==
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124579591"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7FmqnjDlyt9BvAlEKxyw7nsa91xgoDLkwPmybxJXfUlfrvyR8KbK6+Iu1GeefGMiyBd92KJaUL9tmbij6FRay6zIUPgDY4hNUE6BZtfWWNd4fZx/1iYtmPVnaPtMlJ7vbB+xLRFF1q6tVEPXOS990yoHBQJ/YbIuVrNjLRpQNu2OHKf98ADx8b/O/QFTIZeDGJmCrtarCX9m/7ukXt002fsOF/MaU4nfodXbyabSFRJBG20vdkdK0hkzvBBFcylEUTKxVB05TOJnriNphlE49HO6Vigne0VKAqBkFf3VucAHzJZDE1oniYOI3IKBQyW/ZRWrPzUn8HaZvzkWzA7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbvOFJRJCPcQf1LkXr1V45MH41cBLOLTPVyq5i9ZUac=;
 b=JHyVJyUCg6pUmVTADD2y2nveCszEP9hm0qRjrP3w8Rp2XDqxtiNVVkllH5NQeja08CsX0mz11ztOh/XLR7g7j0nuAVHIiy++K1i8ilWzMkrt9W4rYIguWTUz2vM5SUFnCK4P/szGTQHU4271ZEYnidBTUkrW9G0l7holOGDuQHLHiLs0Kev0c5SNeGC47TIPtVcvMlDMl1pTGGivPDHt13u3n9+1vNnP8iWC5oeuJsmDIvKWE1b52ts9EDq6thud69psyOBY8fDCE6rfGsKgC7/raWxHDvAfI8ln5uwWasm/vud/ewS4EAiUbKPbw7rCYjvwgPQyLxFK8QxxEr+mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbvOFJRJCPcQf1LkXr1V45MH41cBLOLTPVyq5i9ZUac=;
 b=gkblMBT5ZTr6+ERTMN+v6F957lxfNMaCWb8tVs9el6Gb8XtmHstUKDDOAqJUGnvpXV4lle7Nf8OX4gUJyV0/g2cSfBqVn+zA7QOmoWn4ZTLe16KW7f5Hu+8HpAAIVr3VjV40YX2TzOZzfhJuuLrBjfN3HD7bVRfU+HPe9gcEVc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Oct 2023 14:42:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 01/10] mem_sharing/fork: do not attempt to populate
 vcpu_info page
Message-ID: <ZR6vGAhC41Uixchq@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-2-roger.pau@citrix.com>
 <CABfawhmyP_y38002v=v1G2p66ZamhGKrj=0Jm1H_-c_j9VQG8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmyP_y38002v=v1G2p66ZamhGKrj=0Jm1H_-c_j9VQG8Q@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4505f6-7107-4f67-7cbf-08dbc5a07b90
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zvh1JvPPGFB034leEdRlHAaQYVoFgLUYxXZvjGONEBj5bCobeq96gmZhH9dhKEqBW5QwS/+t8Y8C7fZh2OkZ8cHgDuDpdBW0P26XP2UijIBhf7FE9g5lHh0aB/Q0qITGe1Cuegc+pI8hRL6iA701ShYNkAwqAlGyliAMFLzZ4cEMWlArvX3n6notcOrnwKqEZ6GX135pSutDsw9YB7w2zWNMsCM7mKCVWMPiEeS9Tt+aw6G3ciW6g995ig7l6FYh4m99JyOuqGdMgjMhWgQecLjbldK5LcjmlnMG/GlRWAcC2RgGuIHT7EBRrrOQNU17ZQIGQ9Hk5K5pegWQm1cA5uIODII2ijbVzhIYpISQ62DPcfybLIIfIJNu53nbifXpb00dGccTGZzrV592SgSMkogOLg1kWV3IOo9L7w/gK6cqYRfNqGLqn7MxFelovR02ixVDOV3k3i0OKJh8popl9OA/hfkWqS66Tiv7Q0lKOHJ8FQOy7FuhhY2pPkD0KSgJmgM4p8WQkr49zHWrjy0I498jGvYj+oLkZZMTnV9cLaYAgGE4vL8ULwLgNY3hJU+n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(478600001)(6512007)(6666004)(6486002)(53546011)(6506007)(9686003)(83380400001)(26005)(2906002)(4744005)(4326008)(33716001)(54906003)(6916009)(8936002)(66556008)(66946007)(5660300002)(8676002)(316002)(41300700001)(85182001)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3lEUEhHSTFBNVROc2c5UzhKWmJmc3VJc1d6RUJIdUR1c0ZtNldBUVZ2UzhI?=
 =?utf-8?B?dmhiVVEvdWhUNWlnUUt4NU9zUTVzUjc0L0ROcTRlRkNDTXdrL2xoRlFwbk55?=
 =?utf-8?B?Nm51OVhpcStTNUp4cjVGVGhwaFBSbFdMakZXTHpFd0JZaXNRNG5IbVhYVUJZ?=
 =?utf-8?B?OTgzNjQwb00wQzdyWFI4YzVPTGtTZzF0d1dmdmQzOUo0VXYzM3g5YVc1YzY4?=
 =?utf-8?B?QzIzbHBsdzBHLytJaG14RWdoVEpPUUcrQVRFTzNHaTBXQlloeklRK0tMR0VQ?=
 =?utf-8?B?MHN6bWJJMkZjNW02bU1vRUtqOVAzR3cyMllVYk0vQk1MS1BtbjJDS1F0Zi8x?=
 =?utf-8?B?bHlET3VyL1RRZFdSUEZqS2xrd0FKWk96K1N6SDh1WS9xdkNaNGNURjdhWlJE?=
 =?utf-8?B?THJKYTRHRzI2d1lSazhJemRVbHlvRVltM3QvRmJISUV2dWUrSGpEdGU3UTRJ?=
 =?utf-8?B?c01aY21vZy82SzVPcU9PNTJFT0ZDVE8yMHdYeUcyd1dIMEFTNWlVd0tZZnpo?=
 =?utf-8?B?NDBkckV4em5tU0xrUlNUNjJKb3VMQTVwV3VxL1VMbTN3YjBhUjdUOFZ2b00r?=
 =?utf-8?B?K1pCcUl6T0c4Q3RETkFOb0szblhTNll5bWROWGpyQUo3akttSmw5M1NrNVl1?=
 =?utf-8?B?dU1yYzRrcDU3Z3F6Zlo5U0p2VzJYOEtOcXdMNnFFcHAvaE01Z2dPcStINTA2?=
 =?utf-8?B?Z2VvVm1kZkV5MHJ0YWRNNWtEYlFBS2ZQZ1lFdHh6TWlHbm12YjhWdmkzdWp5?=
 =?utf-8?B?QmJ5NXVYS1pPNFQxUi81WFV5MFF4WGxQbXBEMWEyeUpRTE9xMVNVQTNuVVRG?=
 =?utf-8?B?cExEUVBFakRZb3VERE9yZTJKa3NGanFEdHI2YzYrME1oaGhxUnpFaEw3Nk5w?=
 =?utf-8?B?SThNRzBMN3hMNVh1WERUdk5SVDRhMDBLdVJVT0F6U043OUMwdlNKTFI1dkNL?=
 =?utf-8?B?Z084b1FSZDBlYm9vVmprMmkxc3g2cHRiak9PYzNncHd3M0JlZmR2c2Z4Zm9G?=
 =?utf-8?B?SXBBcVM0Um51MEhnU2x0SnpoL1ZhYURUQ1c3VEY5c0MvWEt0NlcvNUgwSUNy?=
 =?utf-8?B?Q1JaL1pxNGNteDd2WXNpVDlvR29XYStHOTRZYWgvQzFXOUhmVy92UEJWTmNN?=
 =?utf-8?B?dWRCbjFWSGJ5d1ZKTmxRb3VYeDFnb3NhWjJRUStKYkdhN3NRVzNrNHBENm1D?=
 =?utf-8?B?QldwNURtdmVqUnp4b3FEc2gxYjk2VGdiVUg1U2NuMFNyTnlVTkplbEpMcW1P?=
 =?utf-8?B?N0wxMzhMOWJJNXBrLzNQSC9KK0dFMmFBQkVDYnY4NTJOUUVXeFQvMmdrODlP?=
 =?utf-8?B?K01GeE8wQlNoa0F5S1BTTWUrWWxoN3I4NS9jUk1NcExkTldqbUJWQ0dSVlVm?=
 =?utf-8?B?cTNGRFQrWnFoS2tqcmZSRmFFTGJRbFNyT2VBS2pyZFJIV1ZOWmFNbGZIQWVB?=
 =?utf-8?B?NnZFVnNGRW5jbXZnUzhiL3NhK1hwc092MjJ6ZHd6Y3U5NEdlSnZaTVFVdm9N?=
 =?utf-8?B?ZmMwdk5JOFEwNXFMcjgzQVk2bmcxTzFuejNlYnFSb251MGlkOGRlRU8reGtE?=
 =?utf-8?B?elF2YnVjcnIyODF5dHA5ck1obHdqVC9SUGpUTUMrRUhpZTVqNXc4QVJ0T2xU?=
 =?utf-8?B?T1JscmpsNE9UNEN5eG4zdGM5QnB2QkV1N213b2k4L2ZZRVlRZERCclZBSkhl?=
 =?utf-8?B?dlQwVW43eVJGbGhTRU9xUGQyVk9YYjM5STZTZFBGdkdNdkhQRjBnTXRxc21I?=
 =?utf-8?B?MGszN003V3dFOFVLc01tZWY0TUg0RWRqaFZ1VkwwY0w1ZkhLcEhwL05JbTZP?=
 =?utf-8?B?blZRc3poRDNRWXoveWNySHVPWTdPVXhKZFNiQnJNRkVCWTRBOUsrYjZ1VTZK?=
 =?utf-8?B?OTlnK0M5K25MY20vKzRnVlNkSjBNODZ5TzQwM3U2Q1hDZnc0aUthdUl0NFFq?=
 =?utf-8?B?QkVNeVhUWUFiV3o4czRlaE9OTUlrdzc2ZnZiQ2Y1d3JQeTdGK2k1Ukh5SUlP?=
 =?utf-8?B?cnM5SWtzN0dOL3lGdlFIWVI0QTZDUThmRWhTU0twdGhab2tFV1BybUwzU0Vl?=
 =?utf-8?B?eEpUZ0hQejVPbkNaOUYrSTRsYjY1Z2VzUVJ0YXhnUzFUSXF1SVNmajlHMTlh?=
 =?utf-8?Q?KG9sSOlOyh1nS7kNf4gVRSFGh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J709PsAmsBguMbpVY4TpwufV9OUqIwdAPOLmIfRbSKUAGeYCPW0xVFwZAz9w+CE3O2WFZwXhMtNwKx5jvK7PCf2ePCStkUmjU5riXVa+ssKnssYGPsFb3Cd6vryLDqvFyV070HW4bjg1yiSpbEx9MDjohaRhIMfUKREJEfV+ADfMnjuf2Ge7vgnt9pgn5ahPEwNVfaIc/hZqXwUf9UQEvOOZNzD/HOnGrx9DD0CVW0ISV8pDLOiBBEsGnoYLtPKlD9itA7heAAqRs7qc8n2XlHYs0y++KjD1sqIaLFhZdUFnNFjFRpAYwCZne98sS1YQrB2iSDFFL8obgXMACpYBJh3U1QgvvcNRwg819XTfBl+kwhgEp7kBv0ctPCVDJxh0bPGgYt0oM5iJ1tmmy1nJJTrQ9MGMzrT5/JbP0TZENOJjPJiHAQsq1cXbirxYGBkPzxV60rrNzAWbNZpGli18USzWbGOj1NpTB+sIoWqrqAEouXzOy1EqGaHEUUdY/vj5dboTQPNgTsw2PMkLO95QCswWFHl7qiV9Cp1DM9BbPaEtzklBSYi2VFdfGOVqu/x32SomqKxZzUHyiWXSpkjh/ZeRk+KIYdBpTx8+4otdRatxglNsPy+rQA7CxoXMUdOGb1r/1UTrtRsGSi7d+wm5u+joUZV0+PQwifekUynJKD8AnCwGe+mFA+BYJiIJWJCoz8iJSyXJ314XOl/KD+nYjhc2n+/6eAUQS5p6QvcmNwo4id5C4Z6An5+pFAKbsEHMPp8vwysbmI3hkwIygDmIGc0NOgtg4McqirV0JsObT4Tqy3EWLaYs7s6Dmp2BV3JD6YDHku3FV9mplEq0ScDQ5JhHq1pIBPdvDyoxp9ArVHbGWQ4Yxi1GOdxYtMcCefTt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4505f6-7107-4f67-7cbf-08dbc5a07b90
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 12:42:06.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvyy91cQobb9ppWbPm39Qq+1GIutSrBq0BeVq/voFpaeXijuKu1pBpTX+poyCc/5CunjVI8lZkpwCKAsPd8IEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5108

On Tue, Oct 03, 2023 at 09:46:13AM -0400, Tamas K Lengyel wrote:
> On Mon, Oct 2, 2023 at 11:12 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > Instead let map_vcpu_info() and it's call to get_page_from_gfn()
> > populate the page in the child as needed.  Also remove the bogus
> > copy_domain_page(): should be placed before the call to map_vcpu_info(),
> > as the later can update the contents of the vcpu_info page.
> >
> > Note that this eliminates a bug in copy_vcpu_settings(): The function did
> > allocate a new page regardless of the GFN already having a mapping, thus in
> > particular breaking the case of two vCPU-s having their info areas on the same
> > page.
> >
> > Fixes: 41548c5472a3 ('mem_sharing: VM forking')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks, Roger.

