Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50B7A2046
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 15:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603159.940065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9Ht-0007Yv-6s; Fri, 15 Sep 2023 13:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603159.940065; Fri, 15 Sep 2023 13:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9Ht-0007W0-3c; Fri, 15 Sep 2023 13:55:13 +0000
Received: by outflank-mailman (input) for mailman id 603159;
 Fri, 15 Sep 2023 13:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x70d=E7=citrix.com=prvs=6154552af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qh9Hr-0007Vu-C4
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 13:55:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c59850-53cf-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 15:55:08 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2023 09:55:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 13:55:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 13:55:01 +0000
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
X-Inumbo-ID: 79c59850-53cf-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694786108;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BnAfhvLLKrxZB5jnyrl+HqnzukFIsFf9t02QGbiUT6w=;
  b=hT6ifKrkhPgp/uaodQLyqRkHBDTjPVqg0v0S1QJEPHwmvq3FB0IuZThN
   WaBDXy/GTv7Xe2CK7mNPPOvtThagifuo82v1A67SjpV4cqwTnG8UFL+7T
   k/glyYdeCeBwsKi9Osbb0Uw48zLTmLl8cd7dXJa/oeC8Xo4JdlzQpDLXz
   U=;
X-CSE-ConnectionGUID: gjNf7QmjRI+VyS9sRZcxFg==
X-CSE-MsgGUID: YYq7BYImThSSgNPsu1X3gQ==
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 122788333
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:J7FcGK/Cg2SoBDnZR4R5DrUDW3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jAfCDrQa/zcZGH2e4xwaYqy8kMP65fTmtNrHAJsry48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklB9
 9oWdwkIbCqixNyn++OgcNtnluoseZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUujNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVx3yrCNlJT9VU8NZbsUTM7F0yDSEWbmC0h8GilxeOAN1mf
 hl8Fi0G6PJaGFaQZtvgWxy1plaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5gqrSRTVqU876GqjX0Mi8QRUcAbyIZSQoO4/H4vZo+yBnIS75LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T4lTvkz+q4J/TQWYICh7/W2uk6kZ1YdCjbonxsFzDt68fcMCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfS+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:SS2blqoczK+oW1xevZG6vjcaV5oueYIsimQD101hICG9E/bo8f
 xG+c5x6faaskd0ZJhNo7C90cq7MBThHPxOjLX5VI3KNGPbUQ2TXeJfBODZsljd8kPFh4xgPJ
 BbH5SW2eeQMbAq5fyV3OHne+xO/OW6
X-Talos-CUID: 9a23:O/99nG53EbgfJt4U9dss+0wyFJ8cd3/n7TTuMnTpElxbQ627RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A5YEDXg92nhj4UJbtDRwtWz6Qf/ZZ+vuEOWEIrZU?=
 =?us-ascii?q?9gMaiDTdtYgfGgw3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="122788333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4PSeN3GBLJsNJlAhZXweQWU8az7aTFczqzvKYsB58sERkEl9+x65n+ShgzW4MtO/whZC37ocHxStGsd/cEm5Ln1ibZR8oGpxXb69S1j1schk3hOMYdMNv9LZRZPC7JOtzRmXhWqcvaPjS9OeVDDabDYU+8BncT5AThDe3ykBxyfRdbzdfchkgZtn9YI5JcSB9KQoz76rSCr5ujalcKPj5YqS5uedXbJTLMk9i+8ag2UGZDr0XG+keUUDTqyF4162J6au9TTtU6E/Z93P3Cjqqz4ul8rXDFWVDp0JGIuhNeCfDij3JyluTX8E2U4JAkWrPLRyep8l44JYxmj4XDBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqzIqAoJse/aZK/elI2KQubZSp38vs0zYutkw2BpGNM=;
 b=dyAq6p7NTWt6wkhYjNAVWubnYmK3Z/LycxP9Fr7yVxKxgJrZmkBHnQrfQBQa3oti+x7djfv9DKIlsap5fE33s7XNuvv9l3UfPU7Erg+G11nCEtXRSHoikVHYnK8eSCXPZhl77xDb12bAvAbnozJObS8lZiRiqywuaJsjJSPHF2ChzlJ27JPIlthXNuyxsqFqoAIv9qklZm01TTb5+EiLxBVgg1MhHqoNBZhgKTCjpZn2HmgCvo/uwk/BtlC+CyXLwUGUa+Hq8oBEVVrbSfmYGuURtFwqJVo4ZdINS85wOwGzXMY86Zy6hzDhjU1JCc+locL37xEljY2ptfbZALFCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqzIqAoJse/aZK/elI2KQubZSp38vs0zYutkw2BpGNM=;
 b=fHU8SQSXD9CJ3mMih3kNp9dHDs7v8Y0TK+H08eg7KKbcTo2lJIqtlAgghLEFm6w2wuWuIrH+b2Mk7u1MCYiFScFsmsO2p6l9i0BR6Wfb6VjVjkGEyxh6Yk8Tg6tncjMH4W7FW5hf7joxYC7yVt7IMottK7yoi0VxSWQ174Oabu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 Sep 2023 15:54:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Message-ID: <ZQRiL0Mf5_5EC8oj@MacBook-MacBook-Pro-de-Roger.local>
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230818134441.45586-2-julien@xen.org>
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 6739f5b9-0f63-4a06-7dd2-08dbb5f35adc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJva94jLXvlliE4SVoszrNvd/VaHfJIFItUwMkq0L9+tPoP/ZnQk2a/McaItJPLCw6fVTawBKZPiO04ewN+s0LodhKenXkTgRsQb8zOAbvK5+tccqv0S54StlvmTyjUjwWI0skDZHN6I+GBkfTqG9rihy8BKZ4oyE39sAnPyZeLfoe21StaoryurD4HMWP5ih8dUEn8EcBHdb7GZkpXxIE7p0UkfxXt6EAjzLqfeUBwIqrpgU8Ms2sN5x1NY3+5ozNJif2NbBLhis9WDecHTZZXuzhd8z9FhUcNuJ/PEWz8a7EOk/grEMpypoabFqxnsSY3kccVJWduM+SP9wQFaXlTcHS+ARGTpHg+0VoT65CPEDqvTrHFVOsr08ETgVKVUdHPvwyszsZEFt6AvsqYV8oSPaUIttKRIm9eXRKbXjp5dmw+G4OMGOACQ9966FpHoWt5exPcb+FD1CBYz2+g+n6CZotKbY+OWrFcRi+PN13M3uiTHpRvLYdDqVR4bGpYT4XmfrhdORJ3zfVlwFcT73h6SUHA30XJcMQPSFcA+Od+9dq6ysqA3V1mc1QV7d74s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(1800799009)(186009)(451199024)(478600001)(38100700002)(2906002)(316002)(82960400001)(66946007)(66476007)(66556008)(54906003)(6916009)(41300700001)(6512007)(6486002)(6666004)(9686003)(6506007)(26005)(5660300002)(86362001)(8676002)(8936002)(4326008)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmUybGNlNWxHZzcyZjc3UkI5dXB0V0Y0dzBhUU1SU3NKTGNId2tkcW1UVE5Y?=
 =?utf-8?B?SzVCZ0JYTkFVR3lkSE9OSzlyUkQyTnVkcjR0L0FIQ0tLSTFSV3A1Q2tUNjg3?=
 =?utf-8?B?Ti9ud0Zod3c3OUx4OFBpTjRHVUFRTUJNNm1heGpXZlFQQTRXVkRCWVJmQlJ5?=
 =?utf-8?B?dG9CeWoxWTBpR2xuUnJUZktBaTdWU2pzaFVZbmVhMjFHcHV2WDlEazBmTmRF?=
 =?utf-8?B?OW5oM05Idm90U3YzSVU1TFpPQ29IUmhqTGNXNGRDZkhCeFJ0YkNPQi8wcW1X?=
 =?utf-8?B?cWlsUDhKRXVieUI0b01QblU5dFJEUWdtdHI0ZmJWUVdRKzQyVU1IRCtSSlZi?=
 =?utf-8?B?bUdZdDZXbDgwUStNZDhRLzZnQzIrbDdjYVN0TE5uc1RaWmwyVVhmcmJ3YzFW?=
 =?utf-8?B?WGpqdXcyUk15ZHVyUTZwWmQrY2syUHB5YnF6U1UvUVkxSk45Y1QxdkEwWmhC?=
 =?utf-8?B?V1FZV2ZOOWxEZXhoTVc1djZoTjM2akt0NFRUUmMrSWtsemFvdGVNMk8wcXcw?=
 =?utf-8?B?d1ZwbXRRcjBvaVFFTnpIYXRQRWRHb3hTam4xTEFOVVo3TTNEK1lEVHN0eXZV?=
 =?utf-8?B?NGlRZXNNNG1RbVUyZFFLRGxNWk1qdVVJUFpyWkYrWWZ0dXZmdjlnQmFMMFVr?=
 =?utf-8?B?cGFEWGIvWTF1RW5JNElmaWJITkNwbGF0UGlkNnF2ZmgxRWJiV2hJTy8zS1Ju?=
 =?utf-8?B?QXhZSjJHWGdIV2Q2emFndGNiazE1ZDR5WXo5VVJUcmdmaUVhTG9najJEQ2Iz?=
 =?utf-8?B?V0lBeUtQSWc2K0hJZzZlNG1ZeUROamtSYzFlSXN3QVhqaXh2S3hTc0VmZlBy?=
 =?utf-8?B?OGxGbGJVanJId2RuN1pnS3lTcnlJM1dPQ1VzQXJtZzdMQWptZEtQdGVBa0xD?=
 =?utf-8?B?N0QwS1AvdUwzTzVxaGxmSDJFaFg1WEZtOUsxSnZMTkUvdGZMS2FLemk4TDRE?=
 =?utf-8?B?R3JhdzZOdDNCL25lek5KR0oxMDZNU282QlNnZmRjTnlTa0k0OU00bkR1L0Mx?=
 =?utf-8?B?anFlNFB4UzF2dW1MbGk1TXFLMjhTU0loRnJrelB3VDFwSlBVayswQUc2RENt?=
 =?utf-8?B?S2dyZXJCRS8rVHFTODFtWW94bVpPRjRJOEs4VlowdW9OQW9GWkxObktuQkcr?=
 =?utf-8?B?SFdJZExoeXpJbm05SHcralFjL3V1R2NibnZwZm1Na1hZcWZxWldxVDg1QTBW?=
 =?utf-8?B?Snd1VXlrR2tqQ1B5VE00TkZudjY2bmNXeFZkbzA2Q1RneTBoQURYSzR2aFZG?=
 =?utf-8?B?anpZdDF5VVlSZXRBcTZOakRORVJoS2lSd0dYWVk2dFNadDg4Wm81QWNHRWpJ?=
 =?utf-8?B?dGZYYTJQVEVVRE5ESDJWODVtVlBqUHFUMzJ6dCsweHBFQ1VBQXVjVzV3TEU1?=
 =?utf-8?B?MlJSTVo5MCtraW5PUk5JeHJONmkvQUtLWFZLRjBhd2JQdUlaRG9mZWFWaklI?=
 =?utf-8?B?SHpjYzM5aXhHUkZiNS8rS0RJR0RYTzJGK1owQzVBMTJVNW5oUGJ3eXd2ZEhG?=
 =?utf-8?B?QXFtOUZqK0FqUmhRTGNQUkZ6MmZQdzRiNy9BbjBzTVFFZzhTRWQxby9sbyth?=
 =?utf-8?B?QVZ6LzdVaTFQWEpGSzFiRDBpTy9qUm51K0NvazUxeGFyVllpRlVBNVpUaXBZ?=
 =?utf-8?B?V1R4M3BwUlZoYThoaWlmZytpb1pnbkdlT1ZrejNhdS9kd1Nla1NDeW1aTXpp?=
 =?utf-8?B?QS9vaGtDeU5GL0hoVUl0M041QmJuZFVQNnJJbU15eXhSeGZrdjhHcGxmbDBq?=
 =?utf-8?B?K0xtY2FkMDkwNytFTjdZZ1lIelN4cWlSUzRMTGNVNGUzNFVkZjZZZEZKcHNF?=
 =?utf-8?B?MkpGUjc0L1I2UzdJZitGL0VYc1ZGa0NIUlFHNFNLY1pjcGJ3L2RETXRaQWlZ?=
 =?utf-8?B?ZHRDc0crVnBBQVRCYmFsbUh2M1F2OG5ZeC84bk5abEtJL3JQTEZuTUo3a3VT?=
 =?utf-8?B?Mk1WWFU2S1lkY0VFdGRuZ1NHUWpQdkhvVVFmK2E5VnVKcTNMOHl3bkZVSjVi?=
 =?utf-8?B?ZWlIVlhtYTdlYnFjeWVjMkVLUE92NEMySml2K0pTWGUzN2I5QUdCUVNQL1FU?=
 =?utf-8?B?eCtEYzFydHdGNFNTVmtmR0wvd0R6YW5EblBFUnp1SzUwcHhzb1dlTjdBY2FN?=
 =?utf-8?B?ODVQNUZ6RUQwelgxUDV6VWlVV3VVUFFKR0NHcnhYYUV1aVlUa0lsTWt4TlBP?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Du2Rcxz5wP2vD19djbqt1KJQjQBgL3a2DlKOIyxXfH7+w/qI1Cu5zLpV3QxGfwmu695AsgkaEnzdFjbRNviKCbBzPbKVTolvqSBTu6DipFXKUu/PHFSsdv+1dcFCorlfYMEkFngN6C8z7ihncovVI5yqDxtO1zHHovilZUBkCkR5B/w820i88kRnz/gjIr3wyn0qC0EDpxC8HvrpVwnwKm+i5NKyhHN52YFqg+ZhZF/6+9ZUCK1XorvXm3GC5EaALW2J8S0LNU7xqS6Zii9W0Iw1g7jaqLhHsmY+in+lbII2Oux4BoTzD0JZueeHNXO9Rj8ECkAHDvnW7pz1MBAkcHHuDjVM2ANsXvg17nZU9Pmmmcp6oiJx+ryuvONFfq+Vzoj4WH9jZb7lSQd7Sw757fZtG1SuGKfhqDX0iqXcHxvF1WzfhuTUkEoot3rgNgN6/hLCNcQLfhVbYmTdMSNWAwopTr8zaJ4xhgjP+CdO/RHdPfdPE+Vab4UtQOmItHj3vzmVAGcTKoS8ieHiRJDoP4nxIBMG4imIknzSEALRKYYh9UHvVQEOshu6Cq4b6aa83fwSVVF509SQEkPhoEige7o521k6kve5sbdCiI0n6Hj3/KuQ5HzDOX2GOa+QGTaoatOG8CVa7zNtdwNytTPrbQe7poCV8i6kUrvtUPCx9Ra8JJrpyNyKNAFfLum2ADQba5WkdP/zj2uX9V6ZJikx2vOg/Q0ozJ6G7TXdbRdzCyyLxzWa2RfeC5eBhTlvS+fRUrTLa0jwIe8WK8Jm0P20DoqnRtJSJcNmLk07d9PYVdCd8MHOt07zsEr7kRjWzXC2RxczfDuFKFpCQN+kcrmKJTatRO86lDsfFvmWG4OgU9ZuFFALQKwN4oivfu2KhCWr
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6739f5b9-0f63-4a06-7dd2-08dbb5f35adc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 13:55:01.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xDyhpLqt/G7N9QtJg14HP30A6Cuv/R1PWCdJg3YX180jeWHHbgvp3pG8YVj5gQya4A4Byo0fps6ijiu7fdxtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419

On Fri, Aug 18, 2023 at 02:44:40PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, Xen will spend ~100ms to check if the timer works. If the
> Admin knows their platform have a working timer, then it would be
> handy to be able to bypass the check.

I'm of the opinion that the current code is at least dubious.

Specifically attempts to test the PIT timer, even when the hypervisor
might be using a different timer.  At which point it mostly attempts
to test that the interrupt routing from the PIT (or it's replacement)
is correct, and that Xen can receive such interrupts.

We go to great lengths in order to attempt to please this piece of
code, even when no PIT is available, at which point we switch the HPET
to legacy replacement mode in order to satisfy the checks.

I think the current code is not useful, and I would be fine if it was
just removed.

> 
> Introduce a command line option 'no_timer_check' (the name is
> matching the Linux parameter) for this purpose.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  docs/misc/xen-command-line.pandoc |  7 +++++++
>  xen/arch/x86/io_apic.c            | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 4872b9098e83..1f9d3106383f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
>  ### nr_irqs (x86)
>  > `= <integer>`
>  
> +### no_timer_works (x86)

I find the naming confusing, and I would rather avoid negative named
booleans.

Maybe it should be `check_pit_intr` and default to enabled for the
time being?

> +> `=<boolean>`
> +
> +> Default: `true`

I think the default is wrong here?  AFAICT no_timer_check will default
to false.

> +
> +Disables the code which tests for broken timer IRQ sources.

Hm, yes, it does check for one specific source, which doesn't need to
be the currently selected timer.

"Disables the code which tests interrupt injection from the legacy
i8259 timer."

Even that is not fully true, as it would resort to testing the HPET
legacy mode if PIT doesn't work, but one could argue the HPET legacy
mode is just a replacement for the i8254.

> +
>  ### irq-max-guests (x86)
>  > `= <integer>`
>  
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index b3afef8933d7..4875bb97003f 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>  int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>  int __read_mostly nr_ioapics;
>  
> +/*
> + * The logic to check if the timer is working is expensive. So allow
> + * the admin to bypass it if they know their platform doesn't have
> + * a buggy timer.

I would mention i8254 here, as said this is quite likely not testing
the currently in use timer.

Note that if you don't want to run the test in timer_irq_works() you
can possibly avoid the code in preinit_pit(), as there no need to
setup channel 0 in periodic mode then.

Thanks, Roger.

