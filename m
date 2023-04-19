Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155FA6E7A90
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523453.813510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7lU-0000Q8-SY; Wed, 19 Apr 2023 13:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523453.813510; Wed, 19 Apr 2023 13:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7lU-0000OQ-Pt; Wed, 19 Apr 2023 13:22:28 +0000
Received: by outflank-mailman (input) for mailman id 523453;
 Wed, 19 Apr 2023 13:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp7lT-0000OI-0H
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:22:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3879940d-deb5-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 15:22:25 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 09:22:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7172.namprd03.prod.outlook.com (2603:10b6:510:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 13:22:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 13:22:14 +0000
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
X-Inumbo-ID: 3879940d-deb5-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681910545;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yxdc90/Fg3WfNMF+Vz38DV1IBRDKNTD9fpx5PL2iw9I=;
  b=fjdIJ2nLeUG+0X8rs/vTjdP7teSXkvoeQqzKbTs35hYW4rDvbTu8qN4l
   OIbgFdPURELp4yfMRgsZUPC5W8xWCgp+X2HwvrcYPE+21DhA4i4MXnwQB
   3a8b73tGTYfTd7RxrnjwIjJoQcMPos4OfNhYu5cbkAOG0N9aW/meMOhLH
   w=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 105444978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ls/fc6x48xKake/Kc+R6t+ezxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 WIYUGDTPKqIYWSkeopwaYS+9x9S68DcmIRlSQI6/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVhsq
 dAfDQ4iVxash8CW/YPld/Fy2P12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eSwX+nCd1CfFG+3sIxjXGv4TAvMkw9el+fp96poHDicPsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwCGAzLDFpTmQAGcsRyRELtchsaceTjsv0
 0KPns/4QzlmtrSaRGi15rqStSm1OyUeMSkFfyBsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjYhxq8q56PSRQ6ji3HU2Tg4g5naYqNY42z9UOd/ftGNJyeTFSKo
 D4Dgcf20QwVJZSElSjISuNSGrisvq6BKGeF2QApGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY6Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:92FipKtRlJ0eLaIsy8bvG2o17skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-Talos-CUID: =?us-ascii?q?9a23=3ALK6EIWgXXDEjJ/JO2rmtvSDeXDJuS1+B4HD1HWC?=
 =?us-ascii?q?BD0lpap2oeAGt4L06qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ag5LywA6TR2BFwEEpRfB1sTmGxoxUuKmCNGdRra9?=
 =?us-ascii?q?XkOaAESpXKx2j0B+eF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105444978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXyfTx4Au/z9FUgZcbipaKHvzr3dVolHb6jL9L+9SKoEAiVzmBZvsNOv+pzpkM0eRP4+jHo3spB/ZVORyQ+4kDIv+UkcIBNPMcyZf7F4Pu11FsY9x2DmEo/8KkdmmDcwm/Rn+t/BKsHD6SKaBPnCW672jS82U+6U9P1u0t3JKgzLdeOobxnqf3WCc01Ezds6YBWpgU+bTZVRrlTFpBGKdZS1DWHLalByd476BHNG8bzLsE7ZlRY4rVuYAwXeSVWHvqKtHVBLjrrauwr+/qHabxVV3XI8dhJ/yiojCKt8IoNCiwiwvHbPduI67ZeUgvw0iiqwjfTyNOCawv/IqoxP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkzvTkT6qCBo0nLBvino6SeRdGrgn2Mu2/5R9W2P/tw=;
 b=CmkU2Df/3KqSWZ28TbC93C7GPrmjZvgODKGKrEbb5zGa1SvOUPMywTsJK8oR2U9hIEz75XGO6Mnv+IEHcQQ0deDsPcbd7NR+nGlMd0kF8TPPfYkOjeioKRsS6zDuOVZ3XL4RFgSh3AHj3P1uMzXd+uu/+p/0XGI3+66jXkjWgGihHYHFXyqTJiPGl2lhdrvab1S/RDJPwiIhLyDWhB4cGh/Nk9gPXnRQgVOyo2Lhwry/tP3jCLQ5WWRfRIEht75/EFli8UirV15+WbJemUodS+M1J8ZLBQ4cQlc+b3RJ/l7sB9C5Zp0sr+6M3UHzuEqSrqLkuW9r8Ks8TP1+0Bl1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkzvTkT6qCBo0nLBvino6SeRdGrgn2Mu2/5R9W2P/tw=;
 b=mxa1UwgMo4CpKwWyulrg/miOhC9jGT+uRAEb32AhufjkeGfVSLBHio6mwd20u7Vs6HH8lpN6hJlSMERhyXgIReuhmFgsvqGZ9L6zxJW7MvqMRZn9a3rGa4WD1dxMfv/1vUH/LTQFiohucJK858yMhEA6R38rcvWDbrudDwqxk68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 15:22:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Message-ID: <ZD/q/3yI0+8gfJ0g@Air-de-Roger>
References: <20230419114556.34856-1-roger.pau@citrix.com>
 <e27c6431-053f-924e-27c4-763b3c45fdc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e27c6431-053f-924e-27c4-763b3c45fdc2@suse.com>
X-ClientProxiedBy: LO4P123CA0653.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: d6518eb3-644e-4224-54d3-08db40d916b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1NalanmITjDQ0J9Rzqd9DyX4bc85oMM9Z4fNdkbqrrOOcdKYWDM/H3DSPBWjjAhYgwp29BVapfYzYTBm44KtRG8xTzc8Qm/p54KyALcQHfLlKTfBBl0AY72/Og8pyITpj8k865h7cwsXqKAkaOmIVtPoWyp9uQwPm5Aj561nUtlyZrvQXQ8GgtA+4VlKiIHqGMuzVXe7mhdG9fdAbnwrBfaKBwESJuuK5ff0F6xy2izSSqf+BV21xb55RnPcwLxpbQV4WJNHcJli4Bbnqtlakh1abYfk8Q0aoQFjx9ivAokmGOhlbeT45K6qvacrzR4NWk3qc0Op/LH4BVOk34vsbwzXyY1VKNnMmnYfjlvRapy9+DNkpFTW1WRs2q3Svhu+8h9oBEx40AtVFENtSK8J+6OywnWgNITsFzA6yW53RYIfioYV3GD5RDXnnWZHiiNWSNzrFspAibBZLOzx6tDLrALUNf8TDVDw2vZFgvedT4o1JP0wcmXlkgAQ5s6BtbkeoejEQW8qVfXN7R8o9LW1bxCXQ0Yyy/HmPrpeFR6NVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(82960400001)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(85182001)(2906002)(53546011)(6512007)(26005)(83380400001)(9686003)(6506007)(86362001)(33716001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVozM0MwbnNpMFZneHV4bmhVejNYR0pSdmw5dW9XOFNqZStIS05WMDhFYllT?=
 =?utf-8?B?Vjk5TkFvbXJxNExmcGFkK2hSSEZkT3FPY1p4Uk12MW9jRFR1WTFzcG44WWlW?=
 =?utf-8?B?eXUzTkwzT3k3emkxeHh2VGdlQkQvTzl2bnRTVzVkTktHWGQ0R0p0b2U0YnZI?=
 =?utf-8?B?M1Zid0Q4dVhKbU9HV2ZCUW9ENjhjaUg1ZTdSMU04ZENOaVUvWjNYb09Uck5o?=
 =?utf-8?B?cUlTamhtVHNrNjBweGNkYTk2UFVnVFZxYTJkRkpvTGkzRm5VaTNTZkhkR2pR?=
 =?utf-8?B?ZllFd1BzZStwSTl6UGhqUGxoN2w4VUNYYld4bWNzeTI2VXVPR1lTS2Ztd2Vw?=
 =?utf-8?B?dDhjdzBpYTFHaUo2SmoxZVlzNlZmamMzeTNmVk1QWXQzTWRWWXRvN0h5NWE3?=
 =?utf-8?B?YzNxaXhNUnpyUVJDUVpMUWJjS214a0Vqcm4zNllPeWdEbXFXUWJTY2x5MzlE?=
 =?utf-8?B?c3c1Y0VsQVdYenRMRmQ2TkVUbTBEVlNZVk9wTlBlWG1KcUpvazJiVVAvOVRD?=
 =?utf-8?B?WnZQRmRsSlJrQnF6ZlFCNWJVRnNUa3ljM2pwNlA3RlVSODlUREVMdXROOWtS?=
 =?utf-8?B?UzdmSUw1ZFpoZ0pVa0ltb0hqM0Nya0o4ZWJCWEhoaGlkS1VWSTdYSmdMdEtV?=
 =?utf-8?B?ZC9ac3pxOXhzb05XTlFRNEtwZjdKREVUb3diR1VOeU9SSFpZZktnV0lGY0c2?=
 =?utf-8?B?bkNqK01HZmhnQlVweDZPMjM2czBWOUg2YmM1dGw4LzUyRVA0SGw5SStkQUF2?=
 =?utf-8?B?RTdtbHdlU1JYZVpXVFF3RmZ0WkFUd0M1b05ucWNMaTF0dVRuVVB1cGxpZ0py?=
 =?utf-8?B?YUlXVlQ3bGRvVzNtVUkxQ0hqdS9zRHJmaG9KdnFGbHBtZVo1clNKK0F6ai9q?=
 =?utf-8?B?N1VnazlZSXg2ckMwa0NKaXpMWEVtZTkzcEZyUGtScHRlUzhSRFNVd1lwZEtX?=
 =?utf-8?B?aFIxSFBYOFhVQ3M5TStnOVZwRHVSVG1EZk5LNzMzNlIxVXJPRFl1bzdHcHM5?=
 =?utf-8?B?ekt0ZSs3K2xLV29sTkZCSy9MV1JmV1pXZHRlOWx3ZlV5UHB0VndKNGVucmg5?=
 =?utf-8?B?ZTg0SXdwTE8wdWswWUxmK1Z0dG9HS2tuZUhKNktwbHozdDhZKzZKVTF3akVL?=
 =?utf-8?B?dGkwenUyUUVRTHBhN1l0UXNBUEdEMzVIak5hVmZvOFV2UWZtZ0llNVZTNXBL?=
 =?utf-8?B?dVBJWlo3azBzNTcvNU9ySlZGRGtSOWZXUUlablk5cUFQTno5OUxxMUJQRm5X?=
 =?utf-8?B?bFJaTnZRNVdQcXRuTlBqYjladmo0RzNLWUorQUgvamVsNEtER3lTalhTN1B3?=
 =?utf-8?B?dUFFeCtUTEtwZHJBUG91NjZkZUt2S0lCaW9VL2d3VnhrbU5PTW1qTFN4Y2NF?=
 =?utf-8?B?dGwwQzA3OEVDL3JMV29md0paZmVUUTdpaW10MG9rZGZ2ZURIK0tubzcwNXhn?=
 =?utf-8?B?UllyNW1rTGlDdi9VYU85OXh1OXY3OHBTWXh5My81aWxMK0hDSHJOeHNNTFB0?=
 =?utf-8?B?UWRXN21FUHpXMGFMYUdpaG1VWHZrS0xjUWhGbWVzU0hFUnZmQTdXNWdPTysz?=
 =?utf-8?B?dHliWGtNWC8yWWV2NW9TUXZVcXFUdlc2SnFETTF3NjRRRkJKVHJ6Zk9sS1ZE?=
 =?utf-8?B?MS9ucEcreTh5SzZ3dFFxNmFkaW9BTW1mMklOMjAzanAyb1luUm1OU0VWa0Vh?=
 =?utf-8?B?dWRrSThsd3BnVjRzeFRZQklXYXE3R3B1Nmg5V0RUNnVOQkljenc5UjM2NmRz?=
 =?utf-8?B?aGdLUUM0K1RkYytpSVpBT2xGY3VBK1RrbHN6OFM1NmNGa09BaEVJc1NRWGRN?=
 =?utf-8?B?empBakNDcVVIMWFFNjlTSW5SUEh1Y3R5cGNneThpTXZHbE1iUE1HdWJENnps?=
 =?utf-8?B?UGxLb1Vra0dGZld5SnhvTlIxbktqTVdaSWFpaFlGOVJsSm13UEpQckl2ZFhs?=
 =?utf-8?B?eVQ4RkZ0NklJdlJLOEhIU016SzB1bXpsWDd5SHhZdzdzeWREcTJkcGRld1Y1?=
 =?utf-8?B?T0Q0K25DSU51NU92ZytwWGFYTnlvaE5rTUVtYi91QjBwMlFwV05YL3FxckU1?=
 =?utf-8?B?OVlud29xay9CQ0FqQ2hGTmhOOUdMUktCdlEzNlQyOE5BbERZck93WGo3dlBB?=
 =?utf-8?B?a2t2ZXJJOCs2NEd3bFl4aEhOQzdCUFFEMWlWaEdKemRWRlVUYmpxTVZDRGUy?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vNskSt/Vg4B22Ugyvp025wEHtd1zefpG2A/+bxev8Yh+mA6jpI05j86CjIuDB7wW8Xny9Hb3u1q1CbeDUhW6MuDtKTCSLQ70zamhy5S/+0yuMfndenCtjWDcFOztC5zuQXqDX3hLPTHgtasH/f9uMYdleHKPMzv/Re98Ji10AS+cLGYmvzoge7a8MkyvRMw0wy11yLsRBRADH0+5qFS3Qfgq7eqXDHzpGWX1HzCQnKQX+Y+UWV0Mip6cJX6xoGDPD+eVyAkD4aAdgLOyL+4Chs5cDWRFaQGWDEKz7kxrI7YgTufhJ1EqJSKlzk8i/KhmpHM9hI04UWvcEYcgf/RbBdjtMdVPxsMq8zQdFLEFbRa7yfogxQ1vDXRrb5VaVsfdHH0d+nuFlRkUeteGBMPaGANRTpzasDqmaGsg95dEdnm6ztBTlnTNSdtH0CbMYkN/ARJ5UrpOBvidL7nR2C+phfWVkN/sa2r6C2dso8wEPPcQ9+rMVXLfUywds35CsVULNO5gQeLeQdSswhXJEYBN+Vrc33ILe1F3SqwSqaD8DZyuENksLi6OJJsjhCeziaKJiyVPGeb79h5j0whmIP7hV5gRuiYzsXGm+CSCt5e1Fh8hZL2Bk2OTOMaCu22aP3vvWvQx1OjD4vuZYea48VB5o4QMsSvxGBde0E8k0rKe4y5gZqR9bvc0MstnWJp61nJOZLqVgPhzkUbT1IhUiIB+4JiX7RITlZ7LYYmBCyissaJEgRv9IAu+b1Qumam3JRPoyHXmWaArwcEgz34J/N0JIF+34o7/Cs49ZSD4i3kEmXojmNQvHHZb5RD/sGY+uGBfZoqwUh+fCvjl95SZOL0Fx2J5+hNtuEaGBDCe8UAwnaEDNl9vxPY1Yp1oiRoMtOnxvz+LsjuKamagvQ6Av7cNsSdKzWuRe+cHbfdKwL4zMgg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6518eb3-644e-4224-54d3-08db40d916b8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:22:14.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icwgUQ5XDcaRweCf2d7IvGwcu8IUjWlIx2OZV+KgH5iVPlUTMFIhxmZolbD/dgPqH8ykl0ktAdYwo3PlUH2Jrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7172

On Wed, Apr 19, 2023 at 02:14:44PM +0200, Jan Beulich wrote:
> On 19.04.2023 13:45, Roger Pau Monne wrote:
> > The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
> > When the hypervisor returns -ENOTIME (timeout in the past) Linux keeps
> 
> Nit: -ETIME

Oh, thanks.

> 
> > retrying to setup the timer with a higher timeout instead of
> > self-injecting a timer interrupt.
> >[...]
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >  ### Changed
> >   - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
> >     cap toolstack provided values.
> > + - Ignore VCPU_SSHOTTMR_future VCPUOP_set_singleshot_timer flag. The only
> > +   known user doesn't use it properly, leading to in-guest breakage.
> 
> Might this read a little better as
> 
>  - Ignore VCPUOP_set_singleshot_timer's VCPU_SSHOTTMR_future flag. The only
>    known user doesn't use it properly, leading to in-guest breakage.

Sure.

> > --- a/xen/include/public/vcpu.h
> > +++ b/xen/include/public/vcpu.h
> > @@ -150,7 +150,7 @@ typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
> >  DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
> >  
> >  /* Flags to VCPUOP_set_singleshot_timer. */
> > - /* Require the timeout to be in the future (return -ETIME if it's passed). */
> > + /* Ignored. */
> 
> I think this could do with something like "as of Xen 4.18", as the public
> header shouldn't be tied to a specific version (and then perhaps also
> retaining the original text). Arguably mentioning a specific version may be
> a little odd in case we'd consider backporting this, but something would
> imo better be said.

Hm, at least for XenServer we will backport this to 4.13, other
vendors might backport to different versions, at which point I'm not
sure the comment is very helpful.  It can be misleading because it
might seem to infer that checking the Xen version will tell you
whether the flag is ignored or not.

What about:

/*
 * Request the timeout to be in the future (return -ETIME if it's passed)
 * but can be ignored by the hypervisor.
 */

> All this said - while I'm likely to ack the final patch, I would still feel
> a little uneasy doing so.

Thanks, Roger.

