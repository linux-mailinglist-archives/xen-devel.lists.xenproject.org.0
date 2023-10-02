Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0607B561F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611628.951185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKbA-0003ov-VM; Mon, 02 Oct 2023 15:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611628.951185; Mon, 02 Oct 2023 15:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKbA-0003ms-Rw; Mon, 02 Oct 2023 15:12:40 +0000
Received: by outflank-mailman (input) for mailman id 611628;
 Mon, 02 Oct 2023 15:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKb8-0001wY-D6
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dab5290-6136-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 17:12:36 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:33 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 15:12:31 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:31 +0000
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
X-Inumbo-ID: 1dab5290-6136-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ZgXXFCB7psZZri2vLWarAPangJxppmH8MByerzI/jRg=;
  b=KtuQgsWn9iHvqjX/lMpqXsmZM0uP+17ejOBQQPKfLnGCMg7x1SGaVnEN
   6L7GD0g/CSAGABaYZsKxaMEOWxIOw0Q7/6cIQRE7LI/S0cEMMpjn/3EVQ
   RPL3jp2fl1pNLUR1LRefbwV6MiZWLLCB2nKG6jljNWA8pT34vSHAgXViG
   s=;
X-CSE-ConnectionGUID: a8J0aa4FTUKj0XubbixRIA==
X-CSE-MsgGUID: 5q6wzXboTH+Nsoogo/sw7g==
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 123016639
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:0enMZqlINA9Y16EucsT1F4zo5gxbJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDGiEOKqDamvwc9x0bYm+o0NSvJbSndBjSgZr/ChgRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fVICmgEZ0ytu9+VwuqLV+Nmh9QZDeC+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmgANtMSubpnhJsqACKmHMBOBcRaXv4h+K+jUG5HMlAd
 ENBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQmucksVHo13
 1mGt9rzAHpkt7j9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3qsnmN6wp4YMupYtKu4F2CtfJYdt/BFB+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1Ba67opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:LvPRMa3pPYxpmLkihSbTuAqjBLYkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO/f6gylNyri9vNMkY
 dMGpIOb+EY1GIK7/oSNjPIduod/A==
X-Talos-CUID: 9a23:raNOjGGiU96LzCCsqmJupGxME8l5XEHg73WIE1KyA2d5cpy8HAo=
X-Talos-MUID: 9a23:H1Z4fgn9exzaXXCp/55xdno/LZl38ZSkD3wt0rMdvM6LMmtrJGiS2WE=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123016639"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1xRJ8i44ofkn5G7qgh1cGhlpZtXOeU+/sbOfV88+8ijPH5BAurnaTsknn5+8TCF99+kHUny7Xya7EIvQBhMAg8Zw14ItfE6u4mUcNbuRiP8q06O0ihlqXxrSwtJ5OAfqZ2Qd1g8RPoE7pwrNW1zcxEOYEho3LcHbOdXrZLXTc0wBNoJEXf1GpDXbsTAtaUDiaDNWwUwNptzX9XXHvV2VYcr1ckfz0e5BWm+6pVpyWU5+s18vveFVdFrDb1qqzlxV+1tDf/KGNOuRqBTLMfTcwredA9yNh5Kh1NXsBbUoja3LGZ92A35jjf84mLnCSdBXLWI5CatNoqeSnCJVMn0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMIb0nDm1DJBXyK5aOdXBIAXiKy1K5Km1lNy2ZHywr4=;
 b=e1bIKrmqQAGTtWWFhURo/wZeI0hM7ridFXM4oPkA3sATa0H2oaQRrC/DaoLskQe/mwxLXgH9ozW+4hBHPKvBrpZyKfWFO0mPiB+B21ShL3qGFm8Pleb/HYbJgr8vSsgU8z7ctxlP+cC4UnAPnuPLy7xxmH6LNYvJbu7onZUw7BSl2VqVXa8sIreNT59ieDhPPGKmCR6iiI4dE8hiSTNfp18UUnNY/bTcqQWByZnNYV9ni+17ozhTFWe2+3eU6tAETuGDetZOL1SHb38hqTPlnChSGe6UIM0B2K5U4dpqzdcRJ55EQHTk3ir3ArMwDyMzW+ddh18fXm+n3qC5Durs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMIb0nDm1DJBXyK5aOdXBIAXiKy1K5Km1lNy2ZHywr4=;
 b=DIgXexvpaKrGlzBg98nXULTLoUA8eeeDfzY81Csv6ragxrM6v9mb60+AxSy9gEcVQC1PnX/k6DZRkuH8IeQjFOwfbq5g9BpLix39hS7zArHsWv1N3yOjjBGTAddhPLJUXBmwknCnEjGjjMQsCWVAZ1GJ9ap8mblD/kPXDqgTa48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 08/10] domain: introduce GADDR based runstate area registration alternative
Date: Mon,  2 Oct 2023 17:11:25 +0200
Message-ID: <20231002151127.71020-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN9PR03MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: cabc543f-6554-49b9-086b-08dbc359ff6d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Rt2KNvj7FD1E5Sz3sCGoTJZfpOO1QW8lnOqYHGQV3RYBCbiVoVlpwd5QS/ZG8TH3oxNw26j298KSVzYTZYbm2w42EweQ4AOOKKHJ6rbNBEF/PYDtCqJqRWeGDV2Hjw7b6H7KoWcSp7kNt7Xy84ayVPHEkqUxmgMUX7u4qdZ94j8h7aQaw0FH06qvnVXHs/2CBU4BMKS2F3U3OMcSV4P2Unae5VwvfgEZiV6BPcxb2BUUd4PNPsKSprhZRtbz9JAK2UWhfb5WVKezVZ2MVJkYmbcHunjg9oW1edIdfG4MGU9I6Me+NXd9VPsgvLkCnSMVRC8S9G46X5vlsOmWuO1720zx/412GaYfLvgoqECxGpPMZTGeZ97+EFPpSuLZ0XtBb2Qk785yqHquwMrThgNffI/Y6DTWBvrA6GU8jcMMRl77G0EOF73xrmDEzrgxTiY8Mx3C0WslIPTq9pPY3WozS2ZiOhGtJXBV2mqvsaswGet/n1f2m+3XM51eP9KC+FxxJNcLAywj8u89Zdj5AV0PBfxC1+OLlM38eaGqdOZ/4sRdo3LKEzojNH7W7UZYt5h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(1076003)(26005)(83380400001)(82960400001)(38100700002)(86362001)(36756003)(316002)(54906003)(8936002)(8676002)(4326008)(5660300002)(41300700001)(66476007)(66556008)(66946007)(2906002)(6506007)(6666004)(6512007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEJMRlRmbEZCNkpyY01vWVRGcXN0akJodEdpTnFick1YRGVNbUk0WTlLaHR4?=
 =?utf-8?B?eU16RXJkQklCQ0lsU2JMUjBKRzBhdzY0ZXduTS9uZTFrN0xDMjlJcGd2Uklh?=
 =?utf-8?B?RjhXbC95a1p5cnVCZWJmSTl0K2NWeThkaWJoZTIyM3M5QkFMSE9XaHBpUGUw?=
 =?utf-8?B?aURKa0lRWHNUc05SUVJ1Q29WY0xBVlkxRWJvSFFpYmxyREhDRndjVzRSbFZE?=
 =?utf-8?B?bFNQWUt6S241QjU1M29GRFZJTkdWM1Y0bU4rVUtENzVieUdJS3FOWE1MUWxX?=
 =?utf-8?B?ZE8zdk9xcHlYSWFDSDhya1BXQitsVmpkbUEyUi9QTVI2aC9BQmxPT3E1VWEw?=
 =?utf-8?B?bGgzOUdUQVByZEhiOTA1SXlFRGk2ZTRBaURZR3hydlVQS3pZSDlUK283VGpF?=
 =?utf-8?B?TkY0OEJJcjAxRVRHOEpvK2N0S0hXRG9lSis5c2ZaY2xLa2UrUThITytmMEZs?=
 =?utf-8?B?Z1lFQjVKN2FiRWt4azFvSTQyeGptL1VZMnd0N0tidkIwMmlGYmFaeVZPVUlD?=
 =?utf-8?B?UXNRMmVWQ0hLZE9obG40Yy9CcERINmZmbkh2TnEyTTVZcm9CQnhoWDdXUXZp?=
 =?utf-8?B?WkZSeVh4eVMvSXJRQnZXT0pJQkI0TTFjcGxGRys4V0RpNjRUM1h6K0NhZGFu?=
 =?utf-8?B?QXRYRkdWM1UvdEpMTDVhQ1EwYWViQjM3alVScW9LOWlrWE5zVmJGSm8vTDdK?=
 =?utf-8?B?L0pHWnVnZS9xNmI2VU1lMEZLa1pMelM1aDV2b0dQNHdpOVQzQzRnMkY4NHpX?=
 =?utf-8?B?azMzMUZYejMyN3Q5WGtpWURjdGpuQ3dyMS9ENEpVeVNaM3FINGtobGZoSUhX?=
 =?utf-8?B?L2F0c2VUd3ZZY1cwVEI5eFVhVG5pRTRPZUthcDQ1bkMycU13WnZiU3JtcVY2?=
 =?utf-8?B?RWxEYmNUOWh3RGRJK3lWdmh6Z2lrL1l6Z0IzcDVnS2d0U1l2NnNnbHVZVDFo?=
 =?utf-8?B?OWVHVjBaKzhkbGk5VGZsTXBkOW5iZjQwaisvaWtGa3lzVmhQRjFCdVpqelF0?=
 =?utf-8?B?M3lua3lQM2grSnltNXJiaXhweC9FdFFwYVE1WnRCVDdWbVhqNmN0dW80M3R1?=
 =?utf-8?B?SHBPZzRmRlI5YndPK2xmbDVYOUJQNmljMnpxZGFzaFFKeXYybVZSUU00RzE3?=
 =?utf-8?B?OEFzUUhBM29yak5Sd2R4RmVQRk10QUIxYk9NdHdUd3hMVGE0VStUeno3RmNv?=
 =?utf-8?B?dEFyNEhTbEtTMXRGUTlkZGpFSDNvTG8wNGxGWnFSSXZQeFVRVUl2bkpzaGZC?=
 =?utf-8?B?YXFzL0tFZXZRSDl0b3JRWlgzMGZDNVRzd3JITnpjYk5XMkxSdTlsYys2SkRX?=
 =?utf-8?B?MWdPZ0lvSEJiWmE4WURrdGZta0xPSE9mQXhpdmN5YmJqNE1wZG5yTWhLSDQ3?=
 =?utf-8?B?MDQ3NGtvalhESG1FOHo5R1oyVW5tWGkvMXVHSGJWaWxqc2doQXZKcW9pZkpU?=
 =?utf-8?B?SnBOL25lTnFjMDRmRGljYzFUWjl3Z05KQlJaVHIwZXpnSEFnV1o0TFNUaFhv?=
 =?utf-8?B?QVBBa3Ercnh0L0JGNDl3TVdEQ202TTdhQWNBSU5Ha251M3BWWG5vbGpJS1pZ?=
 =?utf-8?B?MkIwNWlYUVBpVzlPTzkvNkRONDZobytPL1pjUnpObUdvTHkvV1YrRGt1R2h0?=
 =?utf-8?B?L1JsZGtlZ3YzTm5HSlFwdEwwV3FpdFVVV3JRRHRhU2Qyc3BnMGs5ZVpVVklh?=
 =?utf-8?B?TEZzMWVJdE5uQnJrVFJvRzUrSGJTWGJjbml4TzFraGUxUEpuSDhnS041bi9Q?=
 =?utf-8?B?WW9xdzVUMXNwcmVSMnhyVlkwUmgrM0Q3QjNVVStQbUVleElCSi91bTFmVm8r?=
 =?utf-8?B?MWJhY1huL21iVmpNTWI1dzhnSlJDc2p0SENqZThHcWVHd3czZ3dBRlJOZXg2?=
 =?utf-8?B?cU5OVzdsaUhYb2pwU1J3bDZNMk85WlltRUtxYjNDVWNHeWROTUhySzdxVXlW?=
 =?utf-8?B?N3JMeTUxclV4MFhKSzEzV3FuSFJaS0VXbVNsWEI1ZmZwT0d5TkhBOC9WSVRG?=
 =?utf-8?B?SGd0dlNTRDYrRGwzamFZK1QxaVUyQUdQUWcrMFZ4VlF1b2s5L0t4MnFMTWZt?=
 =?utf-8?B?bjQ1YXZ3THdyUzZkenNEcUpLVW5pT3hnK0ZRNy9aSlBkcGF1ek9ZM255VGpq?=
 =?utf-8?B?eDVhYWE1RzEwNm8yT1c0NHdwcndaZUF5WEdkQnVueXpNaTVCc0hoaG41NDJ5?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H1euBT4c99p9ay2kHMIzQ6h+09Fu/mx5lEH77kqivGbqoh+GGctlWxC5UngnkXIXeGuopuAnHkZeHunyUGO237jthAdwIpJAJV31Uz1RggYHDvbcLMo9Gc+PsYfVcjz5q9BiymK36UEXOmWhIIT8viRaOl2jByrsZILliBU/CbJTcdo2IQINIZq4/Emb4U6Wp6//WetpQum2mG66YP46YlLWDt2PL3WlCe0JxdnE5LAJQwARUAWyWEb8ZDbq7T0v9Hiqxou9nwpsfbvbzcerAVmrPIPxJM7r6+F392sfn6TXbWsxFNNip5oVPLcP7ZQds7z7AFVT5P27R05W/ITkmZbCPgOXyQMYR77XLWZ7xfUN8yYcLjb84FM3oLjn12tS9PPDrMf/4gHRSVXPw02RpFi37vvKvDNmLNw8AjFCq68/uW1IM+AUqfZzcXDNZDMaF3IbdKPTNwfUMdhVKzJoOtrmSztLukzYcbGmMvHLoiLj5ocfYOVhZkWEuSiZxPU3QLVJPf9GO6d+8IcPyC8zQjhi2cjgZqSIXzHcP80aHgn/bkU6AHbQ0Qot5KOT/xGGuN3tKOo3Kjuozxgp7psQl4Wr+YhRJNpPl0NxIVwXHqE6Swf1AQCPYtgaMVlt1jQG7CwN2rrAJhlUjRQpEIwFsF5CfEtyOrQa3LKBtHcFnoAGw6KpdZJtq597qqCJ8HvEaPXuNH3VUJvTMeWEWbtjm+XbzuLmeX7d1gdyWV+YyJh61qb/mAV+MidA2yta4UJ0CrX4cPuOSRyK+LIJo0u2vLaAyAuRhqj3Z2ahpzycFG0AteyHYAylHfVPXZqTRaS1sGNWPP3BwP5qACViYbvw0cqu1uo2W0sYkf1AEyeysAv6GnNZm7xk8nv2I10+hjtW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabc543f-6554-49b9-086b-08dbc359ff6d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:31.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkzwDUZkHyJ1XUGDogiMvfKgprQhUNqO6fpeLF+QVGVQmWtaCWGQJUDlnwY1lYtIqQneUvNFN3qFjX2jdwreWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6188

From: Jan Beulich <jbeulich@suse.com>

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the area is inaccessible (and hence cannot be updated by Xen)
when in guest-user mode.

Introduce a new vCPU operation allowing to register the runstate area by
guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/domain.c | 35 ++++++++++++++++++++++++++++++++
 xen/common/domain.c          | 39 ++++++++++++++++++++++++++++++++++++
 xen/include/public/vcpu.h    | 15 ++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index bfaea17fe718..494b0b54e64e 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -12,6 +12,22 @@
 CHECK_vcpu_get_physid;
 #undef xen_vcpu_get_physid
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+
+    v->runstate_guest_area_compat = true;
+
+    if ( v == current )
+    {
+        struct compat_vcpu_runstate_info *info = map;
+
+        XLAT_vcpu_runstate_info(info, &v->runstate);
+    }
+}
+
 int
 compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
@@ -58,6 +74,25 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct compat_vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct compat_vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
+
     case VCPUOP_register_vcpu_time_memory_area:
     {
         struct compat_vcpu_register_time_memory_area area = { .addr.p = 0 };
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 747bf5c87a8d..486c1ae3f7f3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1830,6 +1830,26 @@ bool update_runstate_area(struct vcpu *v)
     return rc;
 }
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+#ifdef CONFIG_PV
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+#endif
+
+#ifdef CONFIG_COMPAT
+    v->runstate_guest_area_compat = false;
+#endif
+
+    if ( v == current )
+    {
+        struct vcpu_runstate_info *info = map;
+
+        *info = v->runstate;
+    }
+}
+
 long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -2012,6 +2032,25 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
+
     default:
         rc = -ENOSYS;
         break;
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index a836b264a911..9dac0f9748ca 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -110,6 +110,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);
  *     runstate.state will always be RUNSTATE_running and
  *     runstate.state_entry_time will indicate the system time at which the
  *     VCPU was last scheduled to run.
+ *  3. New code wants to prefer VCPUOP_register_runstate_phys_area, and only
+ *     fall back to the operation here for backwards compatibility.
  * @extra_arg == pointer to vcpu_register_runstate_memory_area structure.
  */
 #define VCPUOP_register_runstate_memory_area 5
@@ -221,6 +223,19 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+/*
+ * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
+ * field of the supplied struct as a guest physical address (i.e. in GFN space).
+ * The respective area may not cross a page boundary.  Pass ~0 to unregister an
+ * area.  Note that as long as an area is registered by physical address, the
+ * linear address based area will not be serviced (updated) by the hypervisor.
+ *
+ * Note that the area registered via VCPUOP_register_runstate_memory_area will
+ * be updated in the same manner as the one registered via virtual address PLUS
+ * VMASST_TYPE_runstate_update_flag engaged by the domain.
+ */
+#define VCPUOP_register_runstate_phys_area      14
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*
-- 
2.42.0


