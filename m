Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDC73711C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 18:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551965.861761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdlt-00047k-0V; Tue, 20 Jun 2023 15:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551965.861761; Tue, 20 Jun 2023 15:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdls-000450-SQ; Tue, 20 Jun 2023 15:59:56 +0000
Received: by outflank-mailman (input) for mailman id 551965;
 Tue, 20 Jun 2023 15:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBdlr-00044s-3K
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:59:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cef9af7-0f83-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 17:59:52 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 11:59:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6538.namprd03.prod.outlook.com (2603:10b6:303:125::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 15:59:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 15:59:39 +0000
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
X-Inumbo-ID: 7cef9af7-0f83-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687276792;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ssWV2g1UtckrOS1dluVqDASrECfTTl6+39O4Y8+cmfY=;
  b=UIAl24IvhqWnOoWmc+TRYzcQyTKQ9FcWsUzwe/iG7hkmnwaWmUoO9RRA
   IQWyGkACm8ViMwqRN77NNAI6V9GD3omGSrhhiw4Kygg2VrP8d5eyWmzD5
   xrOH13Yx9pFKs+RIolKht3/4BQJdcA/KGaR8YJgI/g/XqWPdpfSwXzjc1
   4=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 116042651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JEdYo6AZAZbN7hVW/xXiw5YqxClBgxIJ4kV8jS/XYbTApG5z0TwFz
 zQbWj/UP/+KZTf1LtknboS0oUhXv5GDm9BiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1C5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwor1uE31Oy
 OMjcC0EVC3awN3smb+9Rbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWw3unAtxPTdVU8NZ62FTD1FU6NSFLal++q9i+gw2/fct2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpd9gOpMIwAzsw2
 TehndzzAid0mKaIUn/b/bCRxRuwMyUIKW4JZQcfUBAIpdLkpekOYgnnS99iFOu/iILzEDSpm
 zSS9nFm2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:0SpOo6qu71PzpBTkzYvAGncaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:sfgnnGyQMC2IGgTwK9RGBgVMQdk3bn3g00yIPkaCND8ud+fMRFmfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AK7mzTQ9kYa3nnMLQlk9Hb/eQf9cw6vS8MWkwrcg?=
 =?us-ascii?q?5v8yOFCt5eDa7lR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="116042651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpcuEoFEO6XVYw3irgb+inmJa8a8aRNKwoj/WW3uJBh04EeQUkdRN+gvF4LiynFuGDYAhQcb37JHFceuo4+xG+ICE6UDhz7UrkKX5R+mXIiOsYQ1cpGv+BLxCdgD8+eVmrnxhenr+5qJ7Hxvg/yXqhrstyiMJCfeOAjRc3l9zX7HvutIwJcMhZN2QktAHdLNYdeBND38iyzc3ir4bB/ziu/lDxR5IFHhtxt/y+gmGRChjDWJ0wG5Djw4tvkVO0MmN5R05/CjgAsTvQSwk3VrHG232zWf5STptKxiAmLNy+XC3Ejv9Z9lbV9/Wn7MMPLAFrRtmc6MBSOKVVXDWao9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CtP1u3G07vwMYdW7dZwpdgYgQLlrGQbIBAy2xA8514=;
 b=O4aHQcWyu2/85kVGC3MUUEyy/gULa7Um9SAnuKSqPeZzpZZvNEwTYB5rUWTBUHDknz4eUjiQFw68ITNIIISxSoQzRyGnDZzlWqnp4JRrfQkh7qOSK1aJ68z5qIZGBYMQnDIqT2Xn4q4iAlA3Y6K3L6HK1Wg3BgMlVXkUXMxiED6iL4tRvdOVS8vWZ2Z8YWyXcpc9ASxGA2EeggC8Kwn9uqTC4BHC+tqj6Bt1PvOXuS8guDamO5WVGu+SkMKnbb6r/bxWEbe9ApzPwoYieME2HWeG1XWTsevKnoViExVsL0evUFbFz+BwXIZoufL4ChnH+H32iFNis3CMX5kZCUZwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CtP1u3G07vwMYdW7dZwpdgYgQLlrGQbIBAy2xA8514=;
 b=EG4bDhx1R7vTm1Vv5Sk2eb5dL4EJosX6hMxS3BLzl3f+pIyedzxM3Doi8h9eAamoBfk3+SlAyZRB5P6iul7z1z+37+FafShXIExPLmYe0/Q7nrQEkEXgFRFClXqCmM2cVAS0IEcTqwhNIIC/+6qQADdolgX4QSfWtevThMV7KO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <18453ac3-b225-b73f-116a-18622ed178a1@citrix.com>
Date: Tue, 20 Jun 2023 16:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/13] lib{xc,xl}: support for guest MSR features
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e83b83-c25a-45e7-ccf3-08db71a759e9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uWS3PC6RmKGzmNsAnyJSqlvgcv+LjtXdYyiVlv0SINALkFjt3/OX1viZAdLN/Wef9lTxat/ZzzAsNw2EjHOMlU63RFsLjW0B9/0M8qf+HYWxSMVGbBsEtvY+HYtoVltuadGnNH+WIyU6xgWETSobILuVeWNGgjjUX6qErMXFFucREU6ME4zxd8bOgIaCA26egwOwRtdnO1NZm2sHKLQpXuA1xOFO9mNakplglMtCNKN3FBDMPf5sZRVgi7bov2LUCGG05bacXN4L7BZpiAUpq6De+SW/JbEs68TJcp/WYEb+hqH81AN/wTOAC6+WDWzpbVa+A3X5k/x0ocYcvv7OWIytWDjZTAiO7MPkUWxVgm826ioLdF3MQOxczT4ZiWd6UNsUG2m4CVCWAGp52FkVcxqnKxxXJSvCb8kF5m/025Ic9QdKkJU1fNUfWfg34QXsDQykknegW6RAc8V1UkhL+zlGNJRoMhlGqyHYU+Bmsh5CksF/eK4Vc4OlRnevswb9KY8KD5KAUXAQEPBn4VCtCJV/gOCy9U7KjM0HjAef/vgmyXGBTr7RM14aueUJYAluJaccTtbxiFqcshXK8PQSaNq5HEqCFf3njoaZ2D6md40/k1EiaOT3CYCcXhb4P5DrcF7A76h9z9jVBT5QvLVfcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(6486002)(478600001)(2616005)(6666004)(83380400001)(54906003)(6512007)(53546011)(26005)(6506007)(186003)(2906002)(5660300002)(36756003)(38100700002)(4326008)(66946007)(31696002)(316002)(86362001)(82960400001)(8936002)(8676002)(41300700001)(66476007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURPMWRPSkNaYlRuVFFQK0NDWjNXeTRlb2ZMdGJSMjRHdnFuMmtWTHAwRTFS?=
 =?utf-8?B?OWgvK0tCKzdoWnY0MFpKYXdqRjNYUFo4Ui9KeU5WUW5CTk1INUhNb1M2cGJT?=
 =?utf-8?B?bWZPb2p4aUNNaldJNGNHazFDTGUrc0NqWjVqcGhVVXNpM0xBQVUrNEdXYmRJ?=
 =?utf-8?B?Ni94UGdaK2hwQUZXMitqdzBtNkpRNC9PZ0lzSjQxdHpqQzRRcGVzaDNaRDFO?=
 =?utf-8?B?MDBlQ0l0L1NVK3hNZmxVZ0IzTVJvSWNReDBacTNQT090cVFqQkUwbWRKanE1?=
 =?utf-8?B?MWVPQm1FcHZ2TnNxYXhxdkFDYU9lUVFPSXBVRXBUTC9IWE4zSWxpd09CWHJp?=
 =?utf-8?B?Uno0UENLOGZ5ZmQzSUZnNHlhVjNZeFAyTGZ3VlRyZEt5Y1RnNnJGcW1UcnN0?=
 =?utf-8?B?TWJYQlgzMGRDMmpmQXFFVHhwSjQrc2VSQ0doSFZFYTd4WTdvOHhKQUdJOTQv?=
 =?utf-8?B?VCt2d0pEbHIxUzRGN2N3bzNNdHVWRmcvZGI3VE9BOVF0OHczdzFrUkhtQkRl?=
 =?utf-8?B?cDBuVXIvcVhGM2Qwa1BxemVvVHVBVXlLeEZsZUEyK0dCbGE2MFN4cFJyalNF?=
 =?utf-8?B?bW9GYXFsOS9nbmxxNlZiNDNET0ZRLzROQkJjeUJLd1VYNUhvWGZqbXVKYldv?=
 =?utf-8?B?bm1peE1xcGNscFZsVnBpbEMvWTlhcHFYMk9walBvMllUcnlqQXBRQzZ5VDZM?=
 =?utf-8?B?bm5ZTXpUcko3M1M3ZEsxVEw0ai9QYUJLUlZkR3FLWnZvOFNwYjdYSUtHSndG?=
 =?utf-8?B?a1dScGdwcUpTR3RIeFRFWGhPVHljeCtuVUtNM2hjVU9tQjRkVmgyejlXampM?=
 =?utf-8?B?NDJYUml4NldCc3R2UzltWHZzaXlVZ3VoWGR4U0NWQURjZUxRWWRsVXh3c0F0?=
 =?utf-8?B?UWxyaUMzWnVqbG04blRMdXpyNlJ5OUlmQkJOSXlYQ2kwelptYjVuZmhzbFZy?=
 =?utf-8?B?MWo4dm5wcFc5ZXhEaFVoZzNWRFltdTZsa05PelQwMFFYSWR1UTRhN2pobGZJ?=
 =?utf-8?B?bEtad1ZtZXdzSndhcmFuTTQwK3J3aWx6M2dTMmtTWDJEbWVoMXZVZ05PNmxy?=
 =?utf-8?B?ckdMZlRkeXdLOWlPclFibFBaSktJcG5sb0VRNHdrM2ovMGhZOGp3NUdBTWN2?=
 =?utf-8?B?cWFnSzV2amFSU1hIc1p0V3VjM01vVFNHa3JFOVlmbHRWa0hWOFNtZk5LdWt3?=
 =?utf-8?B?N1VHd01iM2EyVEJteFp6RE0wemZSYTVEMWxiL1NFUjErR1VuOWE2YjhjYVFO?=
 =?utf-8?B?K253b3ZEUkRZbzlZL0NuTE0vVTNoVDJJcDhndnJpQVNkdzlnakJLRzFmR0s2?=
 =?utf-8?B?VUp6U1hPMk1yTlNBSE9kRmg3amVUclFRZVdQS25OcDlWbUhPU0JTMTRBRzFx?=
 =?utf-8?B?MENrdC9KWmFVUnozRkVKNlhDOUlYZnhlZlVqbWtFYzcyMXZYWDM2VmlDUThQ?=
 =?utf-8?B?WTAzNWxjVWRBL3daQldYU2dBQ0RnTE43ZEw4MUtHMkhVdUhnT1ZTbktreGNT?=
 =?utf-8?B?WHpTOXdMOHVpVmx1VzltYnJiYVE0SytQVkxQZzRBTW43dTBMWS9FUnplNkVx?=
 =?utf-8?B?YWR4ZlVuTS85bUF6ZGtvNVZnM0NrUTV5MU4xMER4Ri92ZUFIQWRsbmVIWmZZ?=
 =?utf-8?B?clJyNVdCaWk2K0IvVkc3alFvWVgvYytvaVpGL3N0TzdPM1VQV1Y1MkloRTdv?=
 =?utf-8?B?N2hZbkdlRk16SXhOOTF5UEs3a0IwMU5BbXpGN1lFbE80bzJVNUZuSlpTTTAx?=
 =?utf-8?B?MGRTZHRBNTV0dXY4dDljazEwbjM2eFVTcDBrOFpIaEpBZlFoY2Q4QStMb1ZW?=
 =?utf-8?B?T1NURmtadUphdGg2YjBoTlk1MmthOG40MWNNRndZS3NURG5xUjBZTEhDemNZ?=
 =?utf-8?B?akh2dGF1REE4OTdaKzlFbHBHbVpQV1IxRnMvbGxGQVBvWTN2WmdzVmlZN2JO?=
 =?utf-8?B?T0t1WWVHREJZUy9wVHFLU2FJMnp5eUhUYm5VTC9WN3gzMkdrUlhMUDdqZEpo?=
 =?utf-8?B?VUw4SUJLT0FCZ2w5Tk9ianZJYXRyUE9YMDB0YzBFNFhVK2w1TjFMNWVTQ2x5?=
 =?utf-8?B?R24rZE83SGR6Wmt2TGpHWDZwQU4yb3RKNktOZEtDd0h6QmY5RDB0djJIY0xo?=
 =?utf-8?B?RWNvYi9rblgzWS9aZmRJRU9mblNEeHhGUkd2NnE2YmtxL09oRzZXZnRuVURT?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iwJiS+gM6/fSNTGiWe5y9Negpk6Y/OrTRXuMhvv7lzroNj7k+IscD/F5Jh3OHJ+TG+9tDx9jvEpXYKXfI6QvAvWd7aCaoj9dKkaX0nSxHCzh3Y5TAlcNXiTe5X/yzZrgEsajWgZMIAsg271w436Hp7TTS5jb8ngLvXvErPmgJyK0Lb8hSIqNyyarViByvyYZk/Ha95IFLCaFwcocdLpPqO/eSWxiSzhrWcqEmfJ1Hy9T7++FVaozsJB8mEdKFQz8qlbEd/k0YVP9KdxwTw+S/oIJETeTWYHp3cWphv1S5MSaWexvkcIj0r3/r+tclT9ZzDR0yi9biX2+QMSk9GhrxJRZ3vlMsEUpwPgsFmP3mqm8G92vrG0755mNUWxPfUfFQSZKqiHYEeLqCOJw22m74YGh9zL10dmBZ0wVgOFV/Z48+n5HRuONIegKeo/KStW+zWv/rVo8K8fv02No5V+oLKq/WochIfwYJQC2fkg1np+56zQA6gDkCCLSkKACaDbUR1zO+aTHr2jz9DFiJGhDPK4FsWrTa+1aV0K+6cFr5HhjmvFbQblK8PyqLlYioTJccP/bQTLqW0qaffaKjpEdFG4EyeXd0Pu0d0alS2gyI7WyQE83AUyXe8dihNa9zQQvK2m/19C2SWaaFqhPxG0DriBhsBEuARZmBnaegEhemUMMXjMsHbqu+6qn5/8dYDmHaEA5nzNTh7Eq1mC2ejTxYFBDSzqdn5yV2zZsIZIt+rsSJs9IWl46GehAIiDG0dZ1hw6yiEPQA5TrREjNPKwUkSrTXV8dCohmAJwd38US+aka5oIeOoxe0PdPdNTxcp+F
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e83b83-c25a-45e7-ccf3-08db71a759e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:59:38.8880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw7DjCJi7zd57AxrUEEjONVRhYV2CiCnvheB/5yWowdgcntTZZ2MqNilv3Zfz91Z9e+AFuwmUomto4KFJ3hHAunPNYJJdSUAvlh8K6CaVRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6538

On 16/06/2023 2:10 pm, Roger Pau Monne wrote:
> Hello,
>
> The following series adds support for handling guest MSR features as
> defined in arch-x86/cpufeatureset.h.
>
> The end result is the user being able to use such features with the
> xl.cfg(5) cpuid option.  This also involves adding support to all the
> underlying layers, so both libxl and libxc also get new functionality in
> order to properly parse those.
>
> In order for such support to be as transparent as possible for existing
> users of libxl, both libxl_cpuid_policy_list and libxl_cpuid_policy are
> modified, so that the libxl_cpuid_policy_list type is no longer an array
> anymore, and libxl_cpuid_policy is converted into a structure with
> two fields to hold both a CPUID and MSR arrays.  It's my thinking that
> current users of libxl had no business in poking at
> libxl_cpuid_policy_list, since the underlying type (struct
> xc_xend_cpuid) is opaque in that context.  Also the format of the array
> (with a terminating empty element) is not documented in the public
> headers.
>
> Some of the patches had been salvaged from a previous series of mine to
> introduce better cpu_policy management support in libxc and libxl, and
> hence contain some version notes about changes, or are already reviewed.
>
> Thanks, Roger.
>
> Roger Pau Monne (13):
>   libs/guest: simplify xc_cpuid_apply_policy()
>   libx86: introduce helper to fetch cpuid leaf
>   libs/guest: allow fetching a specific CPUID leaf from a cpu policy
>   libx86: introduce helper to fetch msr entry
>   libs/guest: allow fetching a specific MSR entry from a cpu policy

I'm somewhat loath to introduce wrappers like this to structures which
intentionally have O(1) lookup by index.

These only exist (AFAICT) to let libxl poke inside an opaque object, but
I don't see them used.  Furthermore, I'm not sure that extending
test-cpu-policy is much use - the existing {,de}serialise tests already
exercise the logic, as you factored it out of said logic.

>   libs/guest: replace usage of host featureset in xc_cpuid_apply_policy()

This looks fine, but it's fairly dependent on patch 1 which needs a
rearrangement.

>   libs/guest: rework xc_cpuid_xend_policy

Here, the xend is about the format of the argument, so is important to
stay as part of the name.

Furthermore, this helper is deliberately not exported from
xg_cpuid_x86.c such that xc_cpuid_apply_policy() is the single interface
to use, and AFAICT that's still the case after the series too.

>   libs/guest: introduce support for setting guest MSRs
>   libxl: change the type of libxl_cpuid_policy_list
>   libxl: introduce MSR data in libxl_cpuid_policy
>   libxl: split logic to parse user provided CPUID features
>   libxl: use the cpuid feature names from cpufeatureset.h
>   libxl: add support for parsing MSR features

So by the end here, we're still using the cpuid="host:..." format, using
enumerations from cpufeatureset.h, with a brand new MSR type, and a
hand-coded mapping between a featureset number and a register?

I think this would be far more simple it it just used the featureset
bitmap which already exists in xc_cpuid_apply_policy(), rather than
borrowing the featureset names and coding around an interface that
already exists.

I'm wary about the names themselves.  I already dislike that
cpufeatureset is in public/ but this is exposing it more than
previously.  We have previously elected to tweak naming in
cpufeatureset, and there's currently a mess with feature naming where
Intel and AMD have the same named bit in different positions.  IMO we
need to retain this flexibility - perhaps we can do that by just
extending libxl's alias lists if we decide we need to change the names
in Xen.

~Andrew

