Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED37D5473
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622084.969251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvInB-0002hG-8W; Tue, 24 Oct 2023 14:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622084.969251; Tue, 24 Oct 2023 14:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvInB-0002fa-4n; Tue, 24 Oct 2023 14:54:01 +0000
Received: by outflank-mailman (input) for mailman id 622084;
 Tue, 24 Oct 2023 14:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvIn8-0002fO-Tl
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:53:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 271a1db0-727d-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:53:56 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 10:53:53 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5554.namprd03.prod.outlook.com (2603:10b6:208:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 14:53:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:53:51 +0000
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
X-Inumbo-ID: 271a1db0-727d-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698159236;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ydfUgI7OL2QhFNk+VZp7KnOdMneSICIy2rXDdd+Pz4U=;
  b=Bz5k+/N63Qub/SPTz55CSOjcb3mns2obA0PZFjzKh4AzC56Pu79iwMxd
   OS/etb7W+tw+Ti5MJ/hdDcCkfIS77hR6LVOqX8dpLuSMHWY6d3VSIaWQp
   FftaV7PkrowgK0gweFzGWsusgj8j1V36ezzFJZ7Hsk0ixiYilOLadNXNt
   U=;
X-CSE-ConnectionGUID: 0UYFrCghSXKYj0Y2MMYeQg==
X-CSE-MsgGUID: AXtfemz+RGORZBdyY9J6KA==
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 126493008
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:fo/9WakRB8zU/iY3kiW62BPo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWGvTa6zfamb9f9B0b4618EtQucfRndNlSwU6pHxnQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aQlGR4XRR+DvNKV8bDje7NJo/UuFca+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmlBNNJTOXonhJsqHSj2mIeDQ9Vb3Scm8uThl+PCvABC
 GVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:uN7rCqm+EMaMklbT9GXXe99kxDfpDfIV3DAbv31ZSRFFG/Fw9v
 re5cjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AK14pMmtemAJvtjNhWozh9bpw6It9T0zz1lzfI3S?=
 =?us-ascii?q?IKldrEIzPbHqh9Zprxp8=3D?=
X-Talos-MUID: 9a23:iuSy3QjHlmCVRMJ8RgM+YMMpHfd07amrGgM3vrI8ieOIJB0hGWm+pWHi
X-IronPort-AV: E=Sophos;i="6.03,248,1694750400"; 
   d="scan'208";a="126493008"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfNVPry+U0fiJJJTQyuu0UoIiU9QvOXtKjlaSmtd4JsX30wPobH+jrvy37dpnKyhFfL5Bxt/guwoc/w7Ikn8E4qvGstG1t5gnvXUz8cBP6FcBJrRVyexvKwIDTRw9lapH4OEMrXbAmC8Bb//BNeOUkmc+eKyLKC+JGmvFYX75XNC22sjpXOxccFsyR+ldJlp7+1YIU5C5NeJu38t4s9UffRrOGsoc7ChpQBTsHOqYcnNFz7cvtTTxtMuCyuijBEOHr+O2ZEEz2XyVwzNmNIYAzcypP+QAlHN3KXdKsu5ikaxIlK8EEAleoaJwE7bikbKwhXYvxkG1kySHI4BC7hbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HSyzWlTE/SNTqD/am7gdAgKLTJRO0Or0pCFadzKOp4=;
 b=Ypc1rfNGqyI/FvpNuBsxstU82QNyv1TW/1Vz96ow/+ME9UQI5vV/GPQQkyGNfFZUUARrkpWcwjzoSnw2/3gz96PHsZqZqKZkqxKitNymykQ1FzD9RC6qLGPDqIlEE7KTOcpzJLFrF1lFe3c/y7RqndlZnjpJ57+WDTrqfVRkE4CowehBwGlB+lOP9IKl3NWgG0ziaLRMwZ6eybba258Fmvo9sYutcNsrzkKVW8VN/7j8AXLAqxAfR6gAmKBMkvVp18tavUxBrzQYSQFbaCw0aEd5VHkoalkLVJL305K2+s+VD/qlWKy7/9c+YuKgUqZeNZnsqJRaHD64xxHG843/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HSyzWlTE/SNTqD/am7gdAgKLTJRO0Or0pCFadzKOp4=;
 b=Vj+llzf+eSxBi/bPPbhgeYkMGfiq0Za3ZlYVI/Y+h2/iFXBAm58rNJd1zczD3ZvI2QmrN2HAbr0HaCus/Z6JmBvHKszxGPmYVbX3eRCnk+bO4b5DhLxpybDdOIUGGVeaHnIDYg2Z20keQq+AtR1AgHF6Yqy/dBSd/GK5abCb6ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86/i8259: do not assume interrupts always target CPU0
Date: Tue, 24 Oct 2023 16:53:40 +0200
Message-ID: <20231024145340.49829-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0512.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: f14e526a-8521-4765-c1ee-08dbd4a108da
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Na2X4/XCue8CHVac4ml/BWdzu6oilBDjSxLrvIxBWNa49ElEfstxgl7dywZsTx0SeLW0S3n4ZHRYsP+ezBsMf3SSJKl1MDlxnxsAOxhre3LYDmJ5vedPlPz5NKBpA4XFCUl2yrEPyLUCTHCVG1SauR2N8caohDacBxZbDtpMSTDnb1WWDXXxw9nZ9/X5UM4L4vXgKH2bPH8L1OAdtQ0JpXz2pSF7eI1+KwXleg5gloI2+mKiGk4vIP3DHqX1OOI93IS4A6woXnHHkJu1SzdyK0ks/Y3lPE14Z+YPIxkryO41DeoymDQe6KLRWw6OetPWymNUjfF844IBh5vG3TTFmDDYcObYVzj/Zki2vP7LcqxWsOeauLSf9JWLHV+X87cpVN5Y5XrYkRwpRZbiZ1MF4GdhzbpDOC+smm+xz70u9jn4tt/1j8Wc2wZb9Kcm/XUb6LwmpsRdZzW8MGd02Pxx5oW6RtSMsqoQE2HNKSR9fsLzx42TkGhWkZJDPcgfusLPxnSMF1tfMcOJYW3cJU10ICC1qehEEgfd0FazVPjoSMrc26BpefG1kswiHvsAgeWX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(6512007)(316002)(54906003)(66476007)(66946007)(6916009)(66556008)(2906002)(478600001)(36756003)(86362001)(6486002)(6666004)(82960400001)(6506007)(1076003)(83380400001)(4326008)(8936002)(5660300002)(26005)(41300700001)(2616005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHgxSkQrN0VQVHJHSjNrR0ducC9OQVZOWkdWL1F3UThsM0tCVW4vRHc3Z2Yy?=
 =?utf-8?B?L1E3NktWdWpJMDRPRGdFeEhEdEZGTkIxT2QveG1TQ2F1RDBSM3RPU0V5V1g0?=
 =?utf-8?B?UlRlSFg3bjNCU0Q3L2plRmpMelpnSkg2by85bkxsa3B5bHR3Q0dQeEJ2eVdU?=
 =?utf-8?B?TjcvdkpLZlEvaEwyVHdwWVUrb3I3YnpGV0xONFh1enRVRE8vRS9YTjNJaWtu?=
 =?utf-8?B?L0tqNmRMSGpxTWw1dUtOa2p5NWhJYUZOT2dXaExSbUtWQUNPUXM3dnFiUUdm?=
 =?utf-8?B?U0s4VzdhcTduaTFpcDVMMTJmNXBtZ3lvZ0FVNUYwMnh4a2ZKcERsS2RTU244?=
 =?utf-8?B?bnJVMnhxeTFhVTk1Wm9NcUxsQlJpc05hdXd5cDJ4b0Rjd3I4ZFpGSldvdXpU?=
 =?utf-8?B?L0xJZ1c2c2RuejBoa0diZ1ZNbXM1aWRuS3dabTV0WktnT1B5d2pjQ1lxM2ZG?=
 =?utf-8?B?Nyt4aERta3RTcDVDUjM5cnZKeDJuUkhTYXhxVkdzOXZZa0t3di9JeHJkQ01N?=
 =?utf-8?B?SUpibjM1c0lyUHpaYUJ2dVU4ZlJ1eEg4dVNXRUdQRFVYMTdRcmVJVzVNb3Iy?=
 =?utf-8?B?cjNqc1hGS0xmdWI0clVDNmZ4RmVKSVRLd3BOVGxta2RmU0lnenRkQmZvMGQ1?=
 =?utf-8?B?QzV0UG5PdkEyM0RGWDVoWDNneEdHT1N3eXhqMHk3a3BKZTRjdFlTbmp6cmNW?=
 =?utf-8?B?YjNPd1E3QkJuTURscnVaWjhDWUQ4cG9DeHVweElGQmJjM1NDVW8xblhOclc0?=
 =?utf-8?B?dHFxQWVDVGNSMDNMSTJsY0FpZVBOcTVmc3ZnckFocklrK0JwUVZkbFlrNS9O?=
 =?utf-8?B?S2h0SE04RVhrS2krdHF3cFpzUndKV0dYYTdqVlFtZWs5RXJ0YVVnVU52L3V3?=
 =?utf-8?B?WE1lNEUrWFVPUXFUMVlIRExMY0R4Yzk2STRBdnVXWEYvYnFDOXJJTVZMd3RB?=
 =?utf-8?B?SnpVbEpOUjhCY05PY3FmeUhpWlJEdFZyc3hMWkxGczhwK0Z1NmwrUVR6UnJG?=
 =?utf-8?B?dmNVSVBLSUovUklRUlM1dXprNmI4MmE1ZjdOdFlLUU5IR1BWT3JoN3Vpc0Zr?=
 =?utf-8?B?UGluTGpzQnlvOVJMYVRLNzJodUg4bWplWW1TNjBiZzV1cFE0K0Q2Z09MZklO?=
 =?utf-8?B?OE13WW9ST3ExdDVOYUR2eE16Z1hmSHNSUmdBcDEybGxkT2xjZFhjNm11TjZD?=
 =?utf-8?B?b2QrT3FqL1U3UCtjSXRuMWp6Nm04ZWZLVW85OE9Qb2FyUmFSRUhZYVFMYlQy?=
 =?utf-8?B?OGRjejBRTnE0aHRWNTJuTXdFK2lRTkoxRk9YY3FPVldCdENmT29TbStuNWU1?=
 =?utf-8?B?R2lUTTlxTHk0TS82RTErM1RwQ1ZjYjZ1V3R6ekRZVU5DMjhJdTVTZVE2Z2xm?=
 =?utf-8?B?Z2ZOc1M5bjRJVjBVSkgyc0lLZDRJYmF1UldvaStEQUNLclROSzNkTEJmeUJQ?=
 =?utf-8?B?YkNrNklybVRGR3l6MmcyS1JLS3FMVWFQdFN5N2N2bVZYTmcvelpObkQwWWJm?=
 =?utf-8?B?UkRTWHg4blh4NWh5V0hVM01WZ2ZKbnhYOWMwVi8vMFdTV0FXK3dCU21MMDR3?=
 =?utf-8?B?dVhUMlZDTXpGWW5VSER6VFJtWHZFSVUrTHVidXFtYm9lV2tNYWtFbHpEbEIr?=
 =?utf-8?B?Ui9aaW4rM3V3RXlrV1lCNTNhSUtnUWJuNEs0K1NWSVFBelFLOFlOWk5HU1V5?=
 =?utf-8?B?UWpMd05mWTh0MDRmVnZhQ29DeVZhMy8rZkN1YS9mdG5hbUgrTDF2TlZ6eTVK?=
 =?utf-8?B?akpNb3plZmZXQU45aS9VWDJ6dm53cExpRGZxejBRWmQ2bVRvUWFKN1doWlVz?=
 =?utf-8?B?bkFwT2Vzd3VncURsTkRmeUsxclVVRGt1TmFDWExia0REWGVNV2UwbkhwSGZY?=
 =?utf-8?B?c0Z0UVBjOVh1dDRpZVRLR3NWVzBoeERsTFFCb0NiL2w2eEd2dnA4TG0xanBO?=
 =?utf-8?B?bERSdjBlY2ZIbk9wYUdNR0VqaGZYbkIxZndvV0Y1UVlFWEpxbFJreHYycFl4?=
 =?utf-8?B?Ti9meGlsYjd2MFhhRFROUnVxOGsvVC9YWVlpM1ZXMFl3QVlXbUhsZ1NzQXkx?=
 =?utf-8?B?UHBveDNNNE5zSmdaVEw3Z2lmb2xFOTVYOVZWUGdFUkRGM0VUdzg0dmNHb05p?=
 =?utf-8?B?Z1I0NE5yQjVaa0lwcVBvL0pzdUJ4WTdTaGpKVDdUSGdlUG01ZGNPTHQxY0xX?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6iwRBriVZtrHfvEeKHIxjZ5jNu/2AGFMvK9NNYz1OkGQC6YsqZll0Sz0fWGTScHIibynKwXPPC/cmGStMsi37XAdRaTBis0w/hRmh6R2R3Gcj0AeRXHLShSluq1x2C2Pgg1N5YLP5d02dZTO2qclSpl99jlRcRvILpm7H1Cve8CK73E77OAMM0icX2bCz8JNtcySSpu9SGDRNS4pKEsEJaanoYfG7ROyiDnlITG401Av6aGWJaNZMPEHphKWZB+s3PhI9rSV/oAgV39/MeojresrxcZdqOIlmZC6NhBQPypkMtFa9Ba1+rX46wGdTedbj3N4pK/smo+1UdwH9EeQsqsZA30zoVwOmSdh1Ft44PMOetIkmmbKf3sRfZ0rPxJc+PAIoT+mANf0debqIPj8iuYwaz9ON94N97UXT49Ec0OhnQUyaYhYAVg4QJmoDls0GJfGCsOYk4SpwzLoaHMPPCxm8AjvjvVYGKR5T+Id1ndt8iukaxoHMRg48zVuP5fwu/MVuMVogWNP+fFfvrUVqDLDzTlNW0e4+J1ogEJfNhQW6CrdFNnVQ0gdexFL/CDUNier4+JZ0fqZQd5uU6+FECU8jgfCWNF0U4U0UtKCGkbHXyg1S46ofBx8b5PboDBvD33iMbiWIlAxBFaOdRHrWVYvY9DD1tva9NYPS0CrZWwNnHmbUjYoMwB8mtcPv3fGbhk68jRFbwEeW4OzPrU4gzu64eAA2wsUOH9bQkM8oxhago698kOa+vZDpAPpwE2pp7R8qAUWs0P/KnYiBY2WicmeWc57Q0kXXOnWem3QJ+tVZN+WPEXQ6qvhQXzzy+/KCnnMUtDFb0qKFbtUyo8OVA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14e526a-8521-4765-c1ee-08dbd4a108da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:53:51.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPj6pOJtb5wFTsZR1LolaYklbAi0EOB4Z718ypD24QG5hTva9QSZyCQmEph+pAFbElyiro2f8CZpFC1j43W1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5554

Sporadically we have seen the following during AP bringup on AMD platforms
only:

microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
CPU60: No irq handler for vector 27 (IRQ -2147483648)
microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17

This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
observed i8259 (active) vectors getting delivered to CPUs different than 0.

On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
descriptors to contain all possible CPUs, so that APs will reserve the vector
at startup if any legacy IRQ is still delivered through the i8259.  Note that
if the IO-APIC takes over those interrupt descriptors the CPU mask will be
reset.

Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
when all i8259 pins are masked, and hence would need to be handled on all CPUs.

Continue to reserve PIC vectors on CPU0 only, but do check for such spurious
interrupts on all CPUs if the vendor is AMD or Hygon.  Note that once the
vectors get used by devices detecting PIC spurious interrupts will no longer be
possible, however the device driver should be able to cope with spurious
interrupts.  Such PIC spurious interrupts occurring when the vector is in use
by a local APIC routed source will lead to an extra EOI, which might
unintentionally clear a different vector from ISR.  Note this is already the
current behavior, so assume it's infrequent enough to not cause real issues.

Finally, adjust the printed message to display the CPU where the spurious
interrupt has been received, so it looks like:

microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
cpu1: spurious 8259A interrupt: IRQ7
microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17

Amends: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Put the AMD vendor checks in do_IRQ() instead of bogus_8259A_irq().
 - Re-indent cpumask_copy() call in init_IRQ().
 - Reword one sentence in the commit message.

Changes since v1:
 - Do not reserved spurious PIC vectors on APs, but still check for spurious
   PIC interrupts.
 - Reword commit message.
---
 xen/arch/x86/i8259.c | 21 +++++++++++++++++++--
 xen/arch/x86/irq.c   | 11 ++++++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index ed9f55abe51e..e0fa1f96b4f2 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -222,7 +222,8 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq)
         is_real_irq = false;
         /* Report spurious IRQ, once per IRQ line. */
         if (!(spurious_irq_mask & irqmask)) {
-            printk("spurious 8259A interrupt: IRQ%d.\n", irq);
+            printk("cpu%u: spurious 8259A interrupt: IRQ%u\n",
+                   smp_processor_id(), irq);
             spurious_irq_mask |= irqmask;
         }
         /*
@@ -349,7 +350,23 @@ void __init init_IRQ(void)
             continue;
         desc->handler = &i8259A_irq_type;
         per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
-        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+
+        /*
+         * The interrupt affinity logic never targets interrupts to offline
+         * CPUs, hence it's safe to use cpumask_all here.
+         *
+         * Legacy PIC interrupts are only targeted to CPU0, but depending on
+         * the platform they can be distributed to any online CPU in hardware.
+         * Note this behavior has only been observed on AMD hardware. In order
+         * to cope install all active legacy vectors on all CPUs.
+         *
+         * IO-APIC will change the destination mask if/when taking ownership of
+         * the interrupt.
+         */
+        cpumask_copy(desc->arch.cpu_mask,
+                     (boot_cpu_data.x86_vendor &
+                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
+                                                          : cpumask_of(cpu)));
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f42ad539dcd5..c31e9b42a567 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1920,7 +1920,16 @@ void do_IRQ(struct cpu_user_regs *regs)
                 kind = "";
             if ( !(vector >= FIRST_LEGACY_VECTOR &&
                    vector <= LAST_LEGACY_VECTOR &&
-                   !smp_processor_id() &&
+                   (!smp_processor_id() ||
+                    /*
+                     * For AMD/Hygon do spurious PIC interrupt
+                     * detection on all CPUs, as it has been observed
+                     * that during unknown circumstances spurious PIC
+                     * interrupts have been delivered to CPUs
+                     * different than the BSP.
+                     */
+                   (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
+                                                X86_VENDOR_HYGON))) &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
-- 
2.42.0


