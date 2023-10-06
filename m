Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767217BB416
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613403.953891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogx4-000656-P6; Fri, 06 Oct 2023 09:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613403.953891; Fri, 06 Oct 2023 09:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogx4-00062N-KF; Fri, 06 Oct 2023 09:16:54 +0000
Received: by outflank-mailman (input) for mailman id 613403;
 Fri, 06 Oct 2023 09:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qogx3-0005Di-1b
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:16:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153f46da-6429-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 11:16:52 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 05:16:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5401.namprd03.prod.outlook.com (2603:10b6:806:b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Fri, 6 Oct
 2023 09:16:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 09:16:45 +0000
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
X-Inumbo-ID: 153f46da-6429-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696583812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Wu/ZdnSYxegPtPcc4d57NlKogRpCDfPyNBeOoxXdSEw=;
  b=L4hc54uZDk+IqnG4arTIhtBK35R56NfA7bvZIBXcROTAjR63RqEAcD9w
   ICF4V+rRRzfsqpAaDh/QfNeatof7w03Fhi6QLRlCVSGkSY6FHzDAzoJqq
   pn9drUowuUc9RDf8tvAffwvQl9UKZWGDEqGIgqrF1UV/3SgmIvf01COr4
   U=;
X-CSE-ConnectionGUID: d8yi2wWLQ2a9evLoFthYdg==
X-CSE-MsgGUID: ZOSQh5d0Qka9fC9WNYRzuw==
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 124813179
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+a95b6/i60d5YxzSHQzmDrUDBX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mEZWTzUaanba2Tyft12OdvlpkNX6JbWytFiTFZsr388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklCp
 e0Zci8ySinZjrO73pa8ZPVst8gseZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WTzXqgAd1DfFG+3sxNu2STm2BLMR4fBFWQ8Mafu3SsRs0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZhZdo8pYkJTDol/
 laTmpXiAjkHmLaSTHeA8LaIvHW3MC4cImIYTT8JSxMf5Nvuq511iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt07j9MP1qi91UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBJmdZkmMu
 j4Dgcf20QwVJZSElSjIRfpXGrisvqyBKGeE3QIpGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:s6s6IqqhOkAfC2rmX8GpiWgaV5oveYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qH/xTQXwH46+5Bxe
 NBXsFFebrN5IFB/KTHCd+DYrMd/OU=
X-Talos-CUID: 9a23:F1yfLG+JI3btes4gS1eVv0JEC8F/bUL59S3ZckKmLWFHVL2kRVDFrQ==
X-Talos-MUID: 9a23:95xrTAjAnSAp4csv4D4fi8MpBuBT2qTzBBg0kpxXteLVCgpBASWAk2Hi
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124813179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxsELX/mbbY06IdYhaWxO6GkT6Rjyg/MjhQjX9Mj2pxO5DGOCBC/SeoGzO70xXFthLvGWzSdzeMI3K3FoGTuxE++0yxvzV79AP3Mn5L7WNHLj7y2rVxKYJ+54bTfCzO/cBc1HsB/Y+dZmU0Y6X7yo4QZAvfiGfTbC03nkHgfsUpi54wT58q0WobU6nhDmZvQt0lEi5E9TDMzTfyysujort5yhs31rK9lr3ub7TEQBo7KATTCvE7KumTGj5qjrFW0P9oJumXXDA/f8gRs735qU2m8GZZEl/PP1ZfIBqbkAuC4JjUqryPD2rsJmsmE4aDF6ZVflf86HtSI3KKppyNscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wBw3P531UdIworjl4KUQAryt4UZ2mV/Y4S37gkcCvs=;
 b=C2FNMmKFvxwHI73WkeQ5j7Rr11hwRJCPoNin3QheyUzyBbpCXM4r7x9JoCDWPDL+K6II8BK8HQ2mQrzvXUkI4SrsKx0coY23HvdHbHl85tY8Rmw4Bz73KNBcgqxtJbsVVcGCdG21RF9VGRchTpCAg1RRnC7I2g5jbdb/uwh1BMPWo39JTBMETulx8hFgcwxwagiooKxP/ayZjy+FWk0Gf17wLB4mDh/Ch5PnOoeXEmSLSnAY3ebUDKoHhgFThdy9OkBwNxP7tp+ZlrjjJwtUrNuZfUYaCTVwITZTr9ZEicd1QcNMlNrDnu3gyrdWswcp//HDbXhHCN3NNoq4XEKZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wBw3P531UdIworjl4KUQAryt4UZ2mV/Y4S37gkcCvs=;
 b=UOeoCHbqdIIu4xHPtKJDyGB0FvWMaTVXi2YSv/+yUFuoyvYmGSrJQstUPm6OkZWBZ2nh3Vl7Lt6Obh6uDEMO4pIYNI7TP5LzedcukevEJWVHWby+eKVnwRMj65q7c5jNHCabiSWkZpeTDNE/CNvaoN75jepeVuvErQghYzdCZrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Date: Fri,  6 Oct 2023 11:13:53 +0200
Message-ID: <20231006091353.96367-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006091353.96367-1-roger.pau@citrix.com>
References: <20231006091353.96367-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0613.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c66f95-fe43-4f23-e3ec-08dbc64cf646
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mtok19tBtj5UJDOm4wdyBNX94NwXz3jki3vp50dygpQhvoYa59UdNFJkPfACz61SacEpD7wrwSale9eoFedrseiOZ6KoCGknExIx0xjVliyWlkJZrfH5Dr+f1t48xICCocpNTmwM/HDgdZT6FjjupPja05uUzTwyxnbjG1spybMXVcgqAbD1JXfyqiBs/U/ZJlH2tl/ZTmJi2hYTObZGKYBxNbwAup5GGkKfPoVj3XYCUv0qq3OdUyaJNXYdM3D+fADQ4A8jWczIkBewQ9bmufcyGkiBVL+uFGNS7TiIOKLel5LiMArZeKgqMDtbLTi04wn7u+EUgkwwksaevS4SqU+9vluF0EQ9wx1Zay0AqwuAx/MzVN/2ZulzwqBYrtME0iJUa3dF9CUejAHSBTrsUVBwWRpJtpQGxYkr35S47kQ69cFU6U+YEbKvVWf9aVai1MC47lijQlvnvDcEV0eD3/HMOlkk438MOaVu3oG8FaMuBmj2GnWqZ9wC6j/niHf9XTiI67AOHOYxIVydu6G9CQtYWpeUV4JllnmH7PXixAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(6486002)(478600001)(6666004)(6506007)(2906002)(36756003)(41300700001)(66946007)(316002)(83380400001)(2616005)(1076003)(26005)(86362001)(6916009)(54906003)(8936002)(4326008)(8676002)(66556008)(5660300002)(66476007)(82960400001)(7416002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck0zcUV4eWpCL08rY1ZkZGR0emEzbWlmSzA5OElYUk8zSi85RUhhNW1tUHFs?=
 =?utf-8?B?MEwrSjJqSXBTd3F0VzB6b01raEUybXJSUnkwWEdCbzdZaFV6bXhqS1ZUaGxX?=
 =?utf-8?B?dHJwc1g0NVJwRjhNZ3EyMy9xbXVSU2JvLzZkdnFZbHhjVk5aR2g1SEhuL253?=
 =?utf-8?B?VmZaL3ppeUFVMlRQejFrTTE0MHlJYzFsc3dBVVc4d2o2eXFqSHZ6anlLZnRT?=
 =?utf-8?B?Ry9zUTJwMUxSb2pFVnVkU1lGbmhySHNJZGlEU1YzQ0hrNnZBOERQdDExakFq?=
 =?utf-8?B?VmNEZVBsYXlkcFhuVWF1SHBJYzNSOWpPcFBTTldSdWZIUkNDa2x1UnEvcDlD?=
 =?utf-8?B?OE1kdWJPWVZ2MHJFZXFERGI2RUZKV1k4aVMrU0d6NXZtMzJVdllwN3NjU21X?=
 =?utf-8?B?MFdMbVpNbllTbEM4OUJ4ZXdIV2tMVVR4MFNsZTVJRVFkZ2ZJT25CeFZXdytZ?=
 =?utf-8?B?dkZFK3hmYjd2UjY0VlVLUDUrM3R3WVIxeXF2OGFSRCtmbEJGWEVTVU9ESVJV?=
 =?utf-8?B?TkpXQ2Z4YXo4bzF2SytzaUZlMDg1UzRvdlNUV2hKeVBLYnU3cnRRdVZRRE9G?=
 =?utf-8?B?TzhtQW4wanByMGpxSmZkRENLU2dJSUZ0dSs0TFRxYmd2OElZTUxnRU8wSGx4?=
 =?utf-8?B?ME4wOVZjQllZZmJyRE1IWFdvR0k2dlJGMSszclpzYUN6dEpBbGhtV3NWaEJK?=
 =?utf-8?B?RzhhVG9nVEcwWUZhSVVlSkZDTnNuaWVsYkZTK1VET1N4VFk0MnJya3ZwYkg0?=
 =?utf-8?B?SEE4VDh3QWlWUjMzWmdyN1lFR3c2QVRjZ0V5ZHpSUlZTdDMyaDMyTUhpM2dN?=
 =?utf-8?B?QkVGOUpqbS9BR0dhSkV3dmQ0Y0lsWldWYlpPOVF6WUdTamlFRm0wazkwSTNE?=
 =?utf-8?B?ZCs3NWo5WXJEdFVlYS9rR2tvdG5vbDJuZEdNUkZHRnNrSEFYT2hzd05ZaEIr?=
 =?utf-8?B?YUZJSE5oVlBwVmpQaFExYzltVC9lT29CSFhZWnVzZjViTXM4enR1cFJBMjV5?=
 =?utf-8?B?QlNib0l6c3lNZitlU21aQmpZNjl3QUNMSlZkMkZyUGhSTi8vUXhjZG5sY2Rp?=
 =?utf-8?B?SjFNdmQ0VndQRjBhbFZSRWlRY3A2LzZTNmsvUDdCUDJZWU9FeVBWRFBXWkpO?=
 =?utf-8?B?a0loRWlMWFZzOUV3M0hmZGhkK3NvMGtzaFdld2Q5RzZhNWdleVNydnBtRmpH?=
 =?utf-8?B?SC9sVHRhb2owQjBWM0Rkek9qUUI0Y0h2Y3ltelN1allPV0lGRTc4MG5rbFpW?=
 =?utf-8?B?aG16Yzd3L0cyRXY1M0R4bHJnQ3JRZjJpRkxlaU9OOWNPUDQ5RURXS09wMWdV?=
 =?utf-8?B?bWQwZGVralFqYWNkM3lESC83Z055c2IwZmkzN0lyZ3VKZlNnZzcySXZ5M1BD?=
 =?utf-8?B?aHBtR2QySnNMZlZ1aERZMW1scFBxSWxJejZJMHhJOFVHUlc0bnRRenh2OXNR?=
 =?utf-8?B?cDFFWVdrbWMwdFp0bEhFTGlCU1Vma1pXeDlzekhLS1NmQkMrbDJKbFlpV29p?=
 =?utf-8?B?akhSZlEwbFRYV3hGOFROaVFucFE1WHhnNThQUGlCc2NlZUFiYzhUM0NaM1hy?=
 =?utf-8?B?cElpNFF1ZUFmTS8rVjhXb05tVDJER252YkRTQjhGWGhmbHVLdDRua0RIQWh1?=
 =?utf-8?B?UEtSMlV0eEdkNzhRaG9SYVpuY05XWEc0R2Q0aUJRU0g4azFqWFVISnFOMDBa?=
 =?utf-8?B?T21ES3RRVjdvT3JON3luMkxGUTZaZU50bzIxWHFuZFZyY1orV3k3NHVRT1VZ?=
 =?utf-8?B?WVpKVUpTTWlrWmNIRFE1WnQ5YW1PTnBRM0ZxSU94b2JxRG9ZbHUweUNLdkNK?=
 =?utf-8?B?RnZTZjZLUXdDNGRaaU9SeGRPdWdoaEVCUmNNYzF2MWdiZGhLdC83RThLRWZX?=
 =?utf-8?B?Y2ZaRi91Y3RjTjZyN3BnM3doSmpSTUJ5TzF4dDI3VlVXWjdJWXM5T3MzUDI4?=
 =?utf-8?B?aEt0UHBBd1IrSHpKdzgrb2NUSUJhc1lTNlZvWVNwT2RpR3hDbVBLWXk5Q0Z1?=
 =?utf-8?B?ZU81VjhmejBoWkZxN2FsWUQ3Z0R1MDhvLzBZQW56eHFHNm9VNkVxSjEyTkp5?=
 =?utf-8?B?Y0thamRmWnB1WU5La2NnZlFxY2tmd3BFdlJhK3NneDRDbUN3QnllWHJBYXpZ?=
 =?utf-8?Q?B8GI3czye0go4k9t0L2OEHO2k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vV4zUFDjOTx15IXYiktHCJQK5J8ggbbYkw+jUW5QhGaKJfotdqMJdSgSndAKBUcHL3DRB+7i3Y12f1dQp1T1mNhiMB9Fwa40LqUROI1UV1IpXeTvoxhQBWi8s6L6RaVRRwUpeC3qKgWduJQ1KntBrmfgMnbVhNoNB6prR1GqbFfniFzvJgHlIP4NY1LQxvdaNOt1FoY9BHit+8nOn5GYsnKhPMhMZA98Gz+MSVGppzjGv65S8iFVTDb45C6XaGdyxfMcmwnCtyHfzTxARq0Pic++nPkWMgWIYkGF5VujSvwIePhd6Jr5zuc1WDQNAu5m9w2Z0/XfqQDif8RwpP3jggEpzqlKG9rayRkht9stwtL1wZ8i2PY1Q6tJGdGIzsFhcqSWLQMjOpbVtdy5ndLcj8itwqeC6o5gyidHP1uZ4f3hHy8XPh0Fm7a1Bj5aWKTOOMbDKKNgiT/eCBLzDjfPRU0FKds20ZlQBt+EYLNiDzI4DbJqziYiiS4yh/NgLE2M30oT+Z6m7zPF/TAMcBL4+oXdlKiy9Zr4B+lr39Dk1MjETlxYI91O81d3wt9g8RQdJHphhgYOXhmg2RCBVa2SgR6VD2FgGrvubUOOi4roXuEsxp20cZTgW7cmSfZh/KYSaoHJ5FFHVGYAkDodcKXeaUoR9E/sWZg8RgyOEmCrPIFweR0pILmrtq6ZqkWZ85CjcO2NuvVfX6RwTHjwmeRWJSbUT5bTIRA9UNVApv8zGC1wqn17EP0jxV6yw0jzJ51j8iX4Oa4ksSyVpbqI2rR+PvaRawhA6Gx2XAcZTPU+VAXbIIQGtdyn6sE2R4g5mtdfUt6NbEKtv4nD0lFbR2rIkqststf0ulQLTQ0WlFvMZtF8EH7MCVThxZTXMIFuuAQi758wHhJ5ovwHy/5tSVD8Frt2xXDieLUp9ZMXtu0+qok=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c66f95-fe43-4f23-e3ec-08dbc64cf646
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:16:45.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9to65XCyDm/ZIyr0VRuWrGB2FOFw/HF2/janGL55MBnZxnWmQnfKwUuDEIeQs36exyHBJ0sjyaXJX3aDsYBDww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5401

XENFEAT_runstate_phys_area is exposed to all architectures, while
XENFEAT_vcpu_time_phys_area is currnelty only implemented for x86, and hence
the feature flag is also only exposed on x86.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md                  | 2 ++
 xen/common/kernel.c           | 6 +++++-
 xen/include/public/features.h | 9 +++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index e33cf4e1b113..41da710426f6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -31,6 +31,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Add Intel Hardware P-States (HWP) cpufreq driver.
  - On Arm, experimental support for dynamic addition/removal of Xen device tree
    nodes using a device tree overlay binary (.dtbo).
+ - Introduce two new hypercalls to map the vCPU runstate and time areas by
+   physical rather than linear addresses.
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 52aa28762782..b6302e44b34e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -607,7 +607,11 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         switch ( fi.submap_idx )
         {
         case 0:
-            fi.submap = (1U << XENFEAT_memory_op_vnode_supported);
+            fi.submap = (1U << XENFEAT_memory_op_vnode_supported) |
+#ifdef CONFIG_X86
+                        (1U << XENFEAT_vcpu_time_phys_area) |
+#endif
+                        (1U << XENFEAT_runstate_phys_area);
             if ( VM_ASSIST(d, pae_extended_cr3) )
                 fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index d2a9175aae67..cffb2f14a562 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -111,6 +111,15 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * Signal whether the hypervisor implements the following hypercalls:
+ *
+ * VCPUOP_register_runstate_phys_area
+ * VCPUOP_register_vcpu_time_phys_area
+ */
+#define XENFEAT_runstate_phys_area	  18
+#define XENFEAT_vcpu_time_phys_area	  19
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.42.0


