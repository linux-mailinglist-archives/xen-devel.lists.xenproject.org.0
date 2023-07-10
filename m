Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82474D8B0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 16:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561221.877629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIrdQ-0007Sz-57; Mon, 10 Jul 2023 14:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561221.877629; Mon, 10 Jul 2023 14:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIrdQ-0007Pf-28; Mon, 10 Jul 2023 14:13:04 +0000
Received: by outflank-mailman (input) for mailman id 561221;
 Mon, 10 Jul 2023 14:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6vR=C4=citrix.com=prvs=54822c203=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qIrdP-0007PZ-Cv
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 14:13:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfe2185a-1f2b-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 16:13:00 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2023 10:12:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7114.namprd03.prod.outlook.com (2603:10b6:510:291::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 14:12:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 14:12:46 +0000
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
X-Inumbo-ID: dfe2185a-1f2b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688998380;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Y6oh3zp3Z/2dIERwBPNGl0nWCaJMPxQkTE54A1X6tLY=;
  b=HKE8hNI8xEbSz1lN3ahQhIzRikmb+69f6fAGaG0pEqQcsfhxPa+cNgLg
   NoktkeH+kksOzSXprY7tEtcUGTGU/A8R+rfMNj+JXfpGW/KwvfO+LmwiY
   y0aZbrUwSWcaqDUifnNSc+Tnq4jdLpwAdRPpdPqyGc7Ir5rmaHzo1Gp9R
   o=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 114419237
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TFAbs6Cv7GNM+RVW/w7iw5YqxClBgxIJ4kV8jS/XYbTApDN21mMDn
 GMbDDrVaa7bYzGgett0YYXk9U8CsJCAm4VrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyKVuP0hA9
 +0iDh9QPjq43+Kd+JunY7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcri7117WUwksXXqo5NKKxx6410GSo130NWQwpWnqHmv+Q3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU331y1uPhTa7OCxQKHBYYyYBFFEB+4O7/Nx1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:e0gTrKEa+1/TMLiepLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3ALjvXT2vb/04AVLsBlt2vVJxd6IsXMWTj5XnSMnW?=
 =?us-ascii?q?eJjs5YobNSXSo0b9Nxp8=3D?=
X-Talos-MUID: 9a23:JQH3WgkOWaoXUQ1OQBrudnpJFNhh0vTxWHk2gIQY6ti7Og1MADG02WE=
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="114419237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9VMYI3zTBK7T3vPn2Y+Bqg0OgCkuvx8ZI9UMH9HPykGvdtMihm4OZNpEFZKPI4PaSrA7d9ymGSaIq8k6q3XZn73IHMnht/xp9bSwy9s4yFj6PMp/bl/aMi1rx36g0UjADpsdcEwDclmmE9TZb619f4l6kHI8TjAcpc6Q6x3n+8TyQJBUMJL0X/pMa9LreohUwMAUIAl20flLRjpgIxugJ+MA2B9DmNE1bvIFcOTbfovaXVq80cST2ACZ1UCj70kt1Z5bnqWW73Pnkb94CqLJEmhNsLdjZH2y8XBHNQrtmv9L7r/82jQ2bIAjCbQNck/xnnaL8RGFHNLu5G1OaKK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlsLkyE9EbE83jCQDjjMDNyDHqXyyQDGqmf1ljap4rs=;
 b=VLaMlJrBh4Q6R67ga9cFDypNE1ef3IYv0VHD50PyCOFXgLjUJTsZr8q82SD88NDjbgaj24QqG4wNM5ui0IQ0GKwcbfA8eJZ5N0tDQ2LzUoLViLeN7Rfck14Hqgqa/V1afXKu2/tt3UjUMVd1IxCzI51N6P068DtY8iST9CTyBFAq+IzkgIeZnpyHmcvMdoGb5FcyGHf+26EoLHNw9yjFwummfCCN1vPgV5ufHB/ePrj32t+TdEF/pizGx7JuiU9kO195XUaE2M27Y5rrCfrkvQP/wDHFjg1H4Uqb16mUriGiH0tclpj6CkKT2B0u5TfEWnb8y04z1Jupq8hcVsHtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlsLkyE9EbE83jCQDjjMDNyDHqXyyQDGqmf1ljap4rs=;
 b=J1LKqlY2FBr9SUh+nJ54glr8p7OZqIsn2PDFez/9nZL/0WdsQyftp2jumZYtlgAc0w3cRSryozO0iMX+T6Ka0NZ615dxhh9hLZaqLEIBozk0zTjxrMMz2h3gdYhwamVZi0V3T7TLDrKyFntL/MWwm2/2Ifws7gBFf6jWd3Przu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] cmdline: only set ask mode if vga= is present
Date: Mon, 10 Jul 2023 16:12:38 +0200
Message-ID: <20230710141238.375-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd642fd-49fd-45a9-ae39-08db814fbc01
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Qvb6+L6KGcjTctk6RXWh0dKP6ZjTLBq9A72n+ts5RNEun4/IMfsQHgBHpQUxwp7hX7Edcd9FZKHygkhYixv96odZlzcUxlzE80rtVlYHgosLg2GFOduaH2vMu1ciWayIOXV5T5fSe4kNEaQhI4zObDJlbrmY7XlORsO0QE8WivcKljvSfl5X3FSO3OcfLb9jv9DxW6+dsm0gPoOZXSmlAKu6LvdN5OXzRpKszvp5xGD3rNFUZc2nxYG0Lnp9gPOCnKQEbcN8POUsa7ydCKUpP7YgvDoMh/AXI7YLIaeea5aBSq+qifBewnK1p5KNGW6b0LSTFYBu56YQ4w802sdN7u6W3bTr8EVBbCFpBWMZY4FaGtYJsXWdvp2OHmOeFuuWZ6Q/MdTAAA6MStVW5NP5CkroXhghaRIBZNGWdx3mFVHkz/tdZOa83IoNJqVkncXvZZE3KytB6Ds7lgX2DlOuVzhZE+6W1++qQ1KDSsIa4Pgrm+fJ6mXh/xnAw6O9xl/NamUEXYgAs/nIKA7AZ5zP32HcYRblguRcMHeC25cCRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(1076003)(26005)(2616005)(6506007)(186003)(36756003)(966005)(6512007)(316002)(2906002)(41300700001)(38100700002)(82960400001)(66476007)(66946007)(66556008)(6916009)(4326008)(86362001)(8676002)(8936002)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmR0aysyZ2FrNG5remd2dUsrN0JJM1c2RjVDcnNFTUJYSUJxN2F5bmdVdnRu?=
 =?utf-8?B?eHpsZVo4N3RlZlFON29uQlVVWGJYeFIyQzhvbmNNVDQ1KzBvMEpQamFGZUcx?=
 =?utf-8?B?Z3dRSEtmcndRRFhHWDZvVy9NUUVKUlF1aWZvWlNCVVMzdkJrOGhtVVNwR0gr?=
 =?utf-8?B?bVVYU1BiY3NXeTZZM3FMempLZ3FZNEtWdml3UjY3UGVlUlhLUXNwREhkaWl6?=
 =?utf-8?B?THdidXVlZ1dpRndON3g5VXpLK1pMNTNWRFNFdHpnVm9NWnh3T1NVa2hIcUNo?=
 =?utf-8?B?TU8yMUJkMUdNd3NtOTl5dHh0OFVhRHYxYW1xRm9tOEhTR0E3aHNucEhKQmxZ?=
 =?utf-8?B?Z2xhRktlMW5abU9PSVgrUFJHVjhpTTVVbTJUM0NjOHh5OGcxYk1qZVBjb29y?=
 =?utf-8?B?UStFZzE0aEs2R3F2TWdZYU9kU3NzRlhsckNpay91cnVDemdjMEdETStCQm5G?=
 =?utf-8?B?YmE2dTU4bkxlcHVlUDF5VWEzckJpenBIVFY3NXR3aURBVmNwRmVVTGYvdnRI?=
 =?utf-8?B?MVlpVEN0UFFmem1IVDBRREFzVDVIU2ZQWnd3LzkyWFFlWFZ4aE9ySE9weVU0?=
 =?utf-8?B?OFk3akdIMnRhSjBjZXFyZEJ4VmxvMHBDV3NQRHRsZDBCckQvUENKSGV1Wmw1?=
 =?utf-8?B?RDZyWUR1cWhKbS9nSURLbVVMUE9nblVnd0FpcWNCRmY1UXR3R3BVZ3Z1WSs2?=
 =?utf-8?B?MTV0ZVo1WjVaOVJQalB6S1JUWTZZRWV1TjEwdHJRbVFUd25IdmEyVmpyY3Zm?=
 =?utf-8?B?ZzVQcjJXeGhTZWx5NWV6WE9SV3M5b0J4Slh3WFR5ZXNQU0hNTXdjYXBMN0Vh?=
 =?utf-8?B?c1M3eDc5VklqVldxazlUelNyYS80VjdNSVhYbWJMWCtMc0VSV0xCZmNTQmV6?=
 =?utf-8?B?dXVhNG42N0xXSnlhNFdId3pVaEE4b21qSlVBL3FuVDUrYWtkb3B2aFAzcTdP?=
 =?utf-8?B?M3hLNkp1Z0lsZFFVaEtaUHJqTUFxTFh4MjlQVEZVcTNPOWhPK0pxbnlueWVm?=
 =?utf-8?B?YmZNSWJ0WklmYVN6d3c1ajRiY3NVSURJVG93NWt5Z3NYVzEwWlgvMU1kNTZ3?=
 =?utf-8?B?cGphMlVkMDdySlJ4aGRkZnNKeGhUM3pLZFRvMEJ1U1FkKzh5N2VLRWppNUtn?=
 =?utf-8?B?NkhGeGdDRDNDNUxBMTFyTUhUMmVnRnRRMTh2R2FKdWtZK2hKZWpXWUlTSDJk?=
 =?utf-8?B?UCtiWXRIczdtUzBLanVQeEdaYmRRczYrTUxyZ3dlaDdRWWl0UWovdDNlWHpN?=
 =?utf-8?B?d2YrYlAwUXphSGttSEdJRmFsNjZHakNHMVZsbCs2d1FrNm0wK2xTY0ZlMzA0?=
 =?utf-8?B?YWRaWW9oSWdHZFBhOE5waTlaM2g3d0t4eEw5eGRrbk9PVU9WdjNSbkxtWVI2?=
 =?utf-8?B?WkIydW12QjByenZtNlQzejR0aTdBRFg0WFlBRWpOa3pRc0psWHFsTzM1cVRl?=
 =?utf-8?B?REg3RmQ3b1IrNlh4Y1RacUZua0pwR2hEcDZ4cjdZTm55ZkhwVGh4bjNCQ1pS?=
 =?utf-8?B?SmVpRkhlTlQ5TjZLUW96WlAyb3pnU0tvVFZoSHpTQUpOTUhTVHE4K1hmQnFu?=
 =?utf-8?B?WjFVUkY2akJVSEViQk1WWVFlNEsrVFpqVVQrWklXRzZJWUZNb0R4NmtqeXRJ?=
 =?utf-8?B?WWRKQTdvVkFjTVVnc2FhRm1BMGUrYUV1eHRTbktLeHkyS1gvSTNhK2lBZHl3?=
 =?utf-8?B?Z3cvRHkxdzBicC9RN2d3OEpIV2dnZUlocWpIUklBcFdJd2VaQ1UvWk1SY2FD?=
 =?utf-8?B?MDR6NlN3Z0F6NGl5cTZJOXduTlNWVTN6NC81VTMyMzhpVTFBYUR1SmlsV2Fy?=
 =?utf-8?B?MTBBWmVMZ1hxaTBtYncvUmp2cGhmYVlIbUNPdll5ZmRIdFdYV2ozMnR0aVJX?=
 =?utf-8?B?SDIyRmg1dG8wYkYzNTNLcGRtZnNxanhhOWtYTTRHOXhyZGQ1a2Jkc2gyclN4?=
 =?utf-8?B?Vkx2d3hjUDEwRHVLNGRaeWxPZVVWeG5YUTJ5YTU5Z0tmVjgvRytDb2srelVr?=
 =?utf-8?B?ekFXMnYvSDZtZTRYbWxITDZUTnMyMUVyaEZvUm9wU29ubXJrU1BHQTNmZ0hF?=
 =?utf-8?B?S1o1eFRiZWhMRHRERUZDQW9yUGNjQ3A0c0Q0djR2MFZlQllRY2lWelVHSUx1?=
 =?utf-8?Q?iN72tVJEzb0viem+WdtF2pv6e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fZeLOy5BbpnPd8oKhCAmZqrpjeg0etY/JZJPtPtC3Tv2T3NJ8Apu63bNVBH7gTo9K/D0TjCmguklcC1+Q998UcdIi7056aeyf46m8zyfL+cK1/xEeoKCymqQGYcGsIPpjzr3rfPvYIIB7O4V7FWK29NvgmjFrSH+eeCiXwnMX9ANCEgtg+wCZdi0DZ6r94SPxXXFhHziMVDtraXy8BsOKVC9362fOkQNRLMVqMkCiKO9gH7ja7R+L3Jpa4472lCzxpUeML/4oIjHAIefJMYEpna6HcCO6Cq4ljGxIM2BWBxLfsZZ2geACnihv0PCt630Zd9FfCV2Lxc3gm8AMozTCA2kZ7t81vLpgqtxcufMJogBgcLXMrSSjJ+tDCrk2EFYfBP6T0P8Sy0s+844n/PPYhf3emd/HQpGT6i5LsdCWn+UU5Hj2F0NtlDSaDLuLHK3Kw5qK7dEMWqRQxpkx2kk753itQsCOAXUohpYsNIrpgxBI2+YuR6tXcf8zd6guMdeXLN0EghXGqfHfloY6b7ki0JDav53GFHPTs7DjzMUTKUjIZXD28T2EsUZHytm5wMjnEk2Yt2LnX1eDoaZ7RUWzrTHv4YI9Bqflt4JDf5cReaSUxUFRJxXVIxI22l7bcWIv/7XRFABD/xNEr04omAGgtfnGP9l1affYBZFtAE2EbwOELoGI2LmcEHjIkLRZ53I7uqSVJ80UrhT/pzXFKuVNrBnbgG+dLzXRwazKrdqoIVOBdH8aoaLIBom/x4xu4L3JapOVIXODHnUUO0X7yJCniuFDCsXcGlGvv5OsXKfB18iz/Si2Q/VSF/pzWHZx5H5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd642fd-49fd-45a9-ae39-08db814fbc01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 14:12:46.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2Cmq1bI6kSesaFh7xVGXqw8VU7FGSLjNaas1/Vs/rwLEwhpMJDBnJvDwpXBjsrtRb/Ca5qlACUmkZH6LDmoMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7114

Commit 9473d9a24182 set the ASK mode without checking if there was a
`vga` option provided in the command line.  This breaks existing
behavior, so exit early without changes if `vga` is not present in the
command line.

Fixes: 9473d9a24182 ('cmdline: parse multiple instances of the vga option')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Does seem to fix the broken gitlab tests:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/926397265
---
 xen/arch/x86/boot/cmdline.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index 10dcc6142c85..74997703b31e 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -279,9 +279,13 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 {
     const char *c = cmdline;
 
+    c = find_opt(c, "vga=", true);
+    if ( !c )
+        return;
+
     ebo->boot_vid_mode = ASK_VGA;
 
-    while ( (c = find_opt(c, "vga=", true)) != NULL )
+    do
     {
         unsigned int tmp, vesa_depth, vesa_height, vesa_width;
 
@@ -332,6 +336,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
         else if ( !strmaxcmp(c, "ask", delim_chars_comma) )
             ebo->boot_vid_mode = ASK_VGA;
     }
+    while ( (c = find_opt(c, "vga=", true)) != NULL );
 }
 #endif
 
-- 
2.41.0


