Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959E709A0C
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 16:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537120.835939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01Fl-0001nK-LX; Fri, 19 May 2023 14:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537120.835939; Fri, 19 May 2023 14:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01Fl-0001l6-Ik; Fri, 19 May 2023 14:38:45 +0000
Received: by outflank-mailman (input) for mailman id 537120;
 Fri, 19 May 2023 14:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pCJ=BI=citrix.com=prvs=496ec590c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q01Fj-0001ky-D1
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 14:38:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87db198-f652-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 16:38:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 10:38:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5252.namprd03.prod.outlook.com (2603:10b6:a03:224::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 14:38:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 14:38:23 +0000
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
X-Inumbo-ID: d87db198-f652-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684507121;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=icbZ0cjNnRXi3LbMV1qMyxvUULyZX4i2HqMEOYRnj/k=;
  b=YFpd9zssBJEVthuUkQYjZsZ4xjoJp5q2zujyiVAu47uEVX6SFV2bTfZW
   234RjSlAQt9/0gvlP6Zu0HiKAe8lUv1ZmCvN4QMjaN5r2gQiRTVIhkmZa
   7fHpGjBGl1JrZ6VykgnV+kOTP63cDp6lGdqnBcWanWVy0iLN1IaRjzWIN
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 112133596
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EE/OeawNh2f1waMa+0d6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUHz
 WJNDGCBbPvfZmqme4xxOozi8UkH75fWnN5hGVZl/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjPKET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT9hq
 fM4DwlUUjOS1tCX7IDgDcRomct2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdhLT+blp6ACbFu7+lEyCh86RGqCmtqJyWKcftlBN
 UE19X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptPl8Ic6i0uWSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:VBQmJ6OMJ158R8BcT9z255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBYpTnyAtjmfZq6z+8J3WBxB8bZYOCCggeVxe5ZnOjfKlHbakjDH6tmpN
 xdmstFeaPN5DpB7foSiTPQe7hA/DDEytHRuQ639QYTcegAUdAF0+4WMHf8LqQ7fnglOXJvf6
 Dsmvav6gDQMUj+Ka+Adws4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiPuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjLf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W7AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABinRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1pol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSKvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdx2Gyj2MSeAtAnWu4RjD8ATgMy5eFOrC1zMdLkWqbrinx1FaferHM
 paO/ptcovexCXVaMB0NjbFKupvwEklIbwoU+kAKiKzS+LwW/vXX7/gAb/uDYuoNwoYcUXCJV
 ZGdATPBax7nzWWsznD8VfsZ08=
X-Talos-CUID: 9a23:F2p1621akpSsMurbZd3tgLxfRO95fV369S7sAF7pO0dFeubSZFuP9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AW/EK4A2+2rvXjjWMSx8My+KxNjUj35mPCkIhgKQ?=
 =?us-ascii?q?/gOq0dgBSHjyDkjmWTdpy?=
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="112133596"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ+pgxyJI4CpYQdRcbPDEGedwy0PysKyJmXZ7ETNq115GH6cqU6QslCnalXye99Lx+phOqM7XSZS1wQK4zrsl+SQad43cvkNtEvBMVVW58GllabAB62/eYa2gSmM8UPw65hC6TcQGQnXiQiTrhZA2WZcAgpNnhurVkYso4jY9BT1LcztpUp93W1LErOegqM+TMplcRLwafoakvczGXoD9jPolwipspOruF07caJKgidrTBzTe5dkHct/G+Viex87bTyODKFP/fRIyAoJUAhigfurf2FQLxmO62FiFcRBKO7L7tUM8v8b3igh/m7N0WuVkwTpgPPewaLFSvipD5vgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uim8DUTwIE8e6XEtU6M/QwUCTv6D5g0/K7GLMCIRjxU=;
 b=MLqsx+FhvePkaRAEqSfAYbGtW0Vqf4RLb96eLAN6EhkKP+uY3csGRpsKpXSEQHpqolu8VftPtwYNNROgtzpwK05ZdEmr6a/jIBITC4Ml54YEn/+0wCBRBqQboEpsN/yF41kPB18FtGQeMed2pefZVV/7w67oIVgvuU+ZDYM5eLmTejoCKzFIZXycgpjJcqXVMwxHs9/CbDLDe6HTXPPseeUcGwCWN+7MaGllU7iaN7h5cBoD5UG64lZenv4/z54XXOidrbd6/qBt9REqpiX+eBy+/fIVJEXt6YE+rSziVjisbtz12/YFW2Sv/lmF4cjRhJPtLXpl/AuRBPC0oKhmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uim8DUTwIE8e6XEtU6M/QwUCTv6D5g0/K7GLMCIRjxU=;
 b=qSDrKEvDvsO38Pj6jhDa47PbeESvLuOr6TKFz4oAgjovQLaEtci9Tm4cOLupbdrrUpMzhVv/O9ZCUrKBQ3IhEgK5oXuWAsS1EoS5na8U9E9OYYc0xbYO7qma+LZTP/WRY1SC+d7Qzk4OZbIsOnv1ywIHOFH3lInRlP6eL/8MabI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a8013bb5-b0bb-6e42-85de-2e12d7b6f83c@citrix.com>
Date: Fri, 19 May 2023 15:38:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
 <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
 <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
In-Reply-To: <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 912b3681-48d9-438c-f2ce-08db5876b2b3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pt8k5P5pTdfOb4pgfZLcVBPmQUetB6VvY6YfZufGwjzR/zBhaJb/paZtcjnotLmfBOnhSn4ASKPtqvO1td6YCPxB7ROhzslvNooZgzHJc+n53rs1o7HN45nC2i0c3Rat4SD4oSSe1bwQmWyL6mq8XAPLhuhVgvKhoqFD/oD3zFo4mak/lD/MMfXpJcuZR1gQKLmnNkpqhWSFMAEMHWDhBXa/Q63NSIE+NLb4PvtfVpGkR+P0s0I3fefLppjgWGkNdrfAoXdeNCY9zLHdPT/eetuyGl5a6HKh1Id1/Zgh6N6WoEaeyf4oMavZ/mcx3peqdxUTTWZcbm2Et9oyAnMwtcEyNc9VRIFIfzLSO5YIqvZ/ANgHorHHSCRQR7/XwgV9CGwkOgvsO7X4xs8kWp42+F1j9U5KIuh6Z6j7casHT/h3oRsIVtkSPqXbRJBBqb9M7cblfZ8NQ1998C6P+Rg2uxeVc8arvqA2bXF1qgSN/4aD85+rmmNdpGkgTQK5kDttiPLtYn9K3Um8/qonHkpKdHnmJXR7RbD/Pu8hiKvEDWFYTccLG9OqiFTCnfYfU7q+MXQtj71X/eZIwtHSta+weEpq78HYDIHzuqEHooVduDWB1OTf03YHTxf1Sve7hFz6fE6KXQ7Lf4T/beDFlgtHHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(31686004)(6916009)(66556008)(66946007)(66476007)(478600001)(4326008)(54906003)(316002)(86362001)(31696002)(36756003)(83380400001)(26005)(2616005)(6506007)(186003)(53546011)(5660300002)(8936002)(6512007)(8676002)(2906002)(6666004)(6486002)(38100700002)(41300700001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNORlNpUHE4YzJmeTk3VnFXQlQ4azVhL3FpdUhRbzVsanVTMmlZcUpuZzda?=
 =?utf-8?B?MXpZbUx4UlJ6TXMyRlJ4NGtESFo4THFWa05RYVVtd012Z0lSRkVja3cyUDlD?=
 =?utf-8?B?akx3WmdaQVNnVGY0WFVxQzA0QlBYNkhzaWdCL2xnUFkxUzRGa3d3L2FZclJE?=
 =?utf-8?B?eUJkanpqbDJXcG5nMmZyUlNhYUFOU1N5M0xkay9PNEFwZE02dU1vMklPYTRq?=
 =?utf-8?B?ZlZIMVlKeWI4aWVxdUxMM0JqNWc3WFhaTEtQcExTM29oYkZyMThPWHZnbm5j?=
 =?utf-8?B?KzhxVjJJT2xVa09rdmd5UVZheWRlemRsN2xxUjRUVjVJZ2Uxc0F4OXlhbXEx?=
 =?utf-8?B?a2EwYTF4bnYyZWFLZkwxRGF5YlJjRnV4YkxJTElOMnJBQ05naTdOY1hJeXlq?=
 =?utf-8?B?eVRiUTdmWEsvdWs4eUdJakg1bHVkcjZoMk1qbEVxRllQdkcxMDVkb2I4dkU1?=
 =?utf-8?B?Y1pjT1Vwd3pVVEV6bUlqREdBWjExb0piY1VWZGNjOGREYXFEY09ubTcrbG1x?=
 =?utf-8?B?Q2FGOXZnUDJCZFZlanFBdzRUUmdVRksyZk1kRkgwRFRsOHlwdjZIOFQ5OUsz?=
 =?utf-8?B?cXI2enNqNTRuanFpY3JWaTFWNmFYc3MxRlVQeklDbXlxTzREaXIwSit4R0ZD?=
 =?utf-8?B?R29Iblhoc0k1dlJVTUZXeVRMR2o5bTZuNVNMKzA5eXJTKys2dE5vNFJWTE1t?=
 =?utf-8?B?UlpVa1ZSc1Jod1haNjNZR21JMmczdnRKb2lOYUxhbHR4NUhjNmRLdHVGUGl3?=
 =?utf-8?B?bW5sYXYra2dxUFhQWUxtK3BYRXZTeURrQzBma0tHaFRhVUJ5aU1pZGVZaGEv?=
 =?utf-8?B?UnN5a3JzWDBiQkNWcEZqK0N5OE9wS3JQTjA3anMzTS91R1FZcnZYYTJrTng0?=
 =?utf-8?B?NmorRGhnd043T2xHUk03TkJIa0VRMFBTbnFUSHBmRnNsNkJxaWNwajFvY0Ny?=
 =?utf-8?B?cU9LeE43Y3BNdTQ5ZnVDdzVPWDU3ZUE1WUZvZXgzdVdJMG9UVUxpeHFBUmdh?=
 =?utf-8?B?UVZlbm9YWjI0RFFGT1ZUZWRxR3JwRjFiK2RFUmxQTkJTQkhvejR3SVdPeWFt?=
 =?utf-8?B?MElYQU1DVmhpdUpDUGY4K0prMHlRQ3VQQ3F6WlZYb2p3TDRkWkVoZ1RuZHhH?=
 =?utf-8?B?UEY2MTd3cmJieU10TnJxb25QYUVTUEwyUy9uWXhuVCtGWmlua1BJdTVpRmVi?=
 =?utf-8?B?WUZsZWYxQlRUYnRCd0lYNGpjKzU5MS9wMTlVQ2l1cHFUbGhHa0tpWkt2RGRm?=
 =?utf-8?B?MHRtMSt6QlpITHNmV1M2WmJOU2E0Uk5oRUsyYmREQitLQ2FnMHNreWc3V2Vr?=
 =?utf-8?B?Ujc1S1VHNGU3MURkSlppQ2xaMlFJaXM4N043Ykc3YVJGWjhFc2ZWZ3VlaC9l?=
 =?utf-8?B?SzY2WjNaU1c0V3A5d1JXT3NXSWN4cFBBUTJFdmNDdEUwdnRYM0JnVncrUmdp?=
 =?utf-8?B?MU5QM2phS0drNktOaFhFTTlucTVoZWVyMklST1JBTjBmR25wckNaQUM2VllH?=
 =?utf-8?B?dy82QkEva0FDMmVpeklvN3VvaXAwSnl6L0J3M0h3SFRRYVd6bDM1cXdKblZV?=
 =?utf-8?B?N2lKTEVxYWRlakVCTmZoTGNkb2JpRitGUkVobXBaQk1YR3JvQlJWKzd1NGlC?=
 =?utf-8?B?OVBYYU9QU1dubEF2SFNDRlh6RlVUTGZQT0FXSDZDY0YySzNmLzBSZmFQdUFE?=
 =?utf-8?B?alRxbllnVnBNQTR5d3VyV3FUVVI1Z0NtdWE2aE96UFRJdnpKWXFNc2hDd2Zw?=
 =?utf-8?B?WmZKVzNxWGhqa2ZzOW05Wjk1NjVuS2lyMFVNUHdHYW5sNmdzVWZyQnFwNU8w?=
 =?utf-8?B?SlNDNDlEK3hZWFhZRGFpcnpXR2xzdE0vWDBZdVA2bmI4T0ljSlhxWWtjY1E0?=
 =?utf-8?B?QVRxZHQrWDI1TnJlTWJZeGc1azZyemRkTDNBWm5mT2lKUUN1MFl3VnRZbTdL?=
 =?utf-8?B?ZkN0bzNRQm1TNHFwU0xES0Noa0pncURTVytZa3ovcm40MEZuRkFYUndsOHl4?=
 =?utf-8?B?eCs0S3JGdTdiUkhSRG9Ld2sreG94ODRPajYwSVJRU1VHMENENTlOTG1kb0ZZ?=
 =?utf-8?B?UDY4d1dnM2p6NDc2ZnRTak5QQjFWeFlCOE8vMXZWUlplOHRxeW1XMnJMc2p3?=
 =?utf-8?B?R2pQUTlmMXdhT0pxR0pPLzQ0Qm15Kzg0L0VqRVY3a0hrRWVOQWpXN3VkQ1Q0?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l9YTlJtkAp6MOqFnEbldhhDmdb5vN769CshPlqFqnsAJpILVhbf+VZyZvT36MJrq1sBYHibbKCTMBjtkZHbcIZEWvQES/9mHbkHcXb1xJq75h3QXS7IMWK+zKjQ9OZZS/c7uc4aWnpgxJgNEu2NVfS+GN9OZywCDfpP4aKN/crCHwP+kpWhzmDyyDMu68o5p9JTV40n0yCFoEV1JHdB0l8K9idlDqS5tEpGybBfZl+X4+MYBRFIyZYH/CjbNHXuAyfcaB9QUkQIF7HDLZ6UyMlI0cMS0Xj4AD0X6LvwSItohadFtIDimUrHiuDQksmbhIXXGVlay3SGgvv7IobOpV1ArIcTL5jhm/5cPv3i9tOIRZ8EGLP6Rans+P0bdwts7vK8Xq3XJa/v9suZvZlkmMwgLdcLc9MToG3WoB2EL/KRmWWQnYfJi2rKfPErNehvWJdm8aXk5tbEmXtRZUFiy8it3/+hxXDxx2bAOwrobTZsAk4WOoYGDTKPDwbxESDZsvaQQs+AthjXbbd1PRo+wb2mLddq6C5PDLq3Feur8J06APxI9DdAXf7By3LWTgn2IB06FZg5cjdryWobLj4gjL/BLXEEtfgB5Si/EN/JpP1XUOA3RZVz+WLPd/9NEf9Rq9vNS2ha7iS3rCwgMf1g/L6OgIjZurFX86HTlzdC1m0tq/dSpj3a85z6aLfbFVcIhl2/6XeCt1ehRIWooO3slVp6vnAYz5yDJXtD5LpLlejcxjfKyuqOsBlnQ5cP0o9mzwHFMQd8Cki0qbv2KzAwUsjjlK9TrIWjLewuNlHWW/2XYrRnJsLGUSF7ghMuRtn1l
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912b3681-48d9-438c-f2ce-08db5876b2b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 14:38:23.6841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjPnz6tMZ+gf4cdEC3xmN7vZTfD949YeSsdR6V+HmMJnWx9MF5fJfCQkSZQ71V4GvvIyP0rY5HYTkIA0QWXydNK9LZxHvuroEGR3NXNJATk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5252

On 19/05/2023 7:00 am, Jan Beulich wrote:
> On 17.05.2023 18:35, Andrew Cooper wrote:
>> On 17/05/2023 3:47 pm, Jan Beulich wrote:
>>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>>>> +    if ( cpu_has_arch_caps )
>>>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
>>> Why do you read the MSR again? I would have expected this to come out
>>> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
>>> later on).
>> Consistency with the surrounding logic.
> I view this as relevant only when the code invoking CPUID directly is
> intended to stay.

Quite the contrary.  It stays because this patch, and changing the
semantics of the print block are unrelated things and should not be
mixed together.

>> Also because the raw and host policies don't get sorted until much later
>> in boot.
> identify_cpu(), which invokes init_host_cpu_policies(), is called
> ahead of init_speculation_mitigations(), isn't it?

What is init_host_cpu_policies() ?

I have a plan for what it's going to be if prior MSR work hadn't ground
to a halt, but it's a bit too late for that now.

(To answer the question properly, no the policies aren't set up until
just before building dom0, and that's not something that is trivial to
change.)

~Andrew

