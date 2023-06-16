Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A6733209
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550222.859191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Mw-00086H-8H; Fri, 16 Jun 2023 13:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550222.859191; Fri, 16 Jun 2023 13:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Mw-00081O-3g; Fri, 16 Jun 2023 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 550222;
 Fri, 16 Jun 2023 13:20:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9FH-0001xG-0d
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:12:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63cb7b89-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:12:05 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:12:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5736.namprd03.prod.outlook.com (2603:10b6:510:37::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:12:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:12:00 +0000
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
X-Inumbo-ID: 63cb7b89-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gVwZvkh6fQpNEwo+H17Wdk8WJM37Ao2vdvqxgWh3rWk=;
  b=IUZBPAIZEX1aBbKSgGnZdSRrKcwFpZ5DpCMXnKSGwATVme6zrNyKrik3
   61r9IFEtRpvcKWLoWt6mb2Ps0qeQgqBgkO3uSju/qlQ5PiCvxNySLctGL
   T4I8vmgkmcPirYJ7aqgnyCUpGMmTK+COqM3x2KZwDv9LHaQEkesoEPU/X
   U=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 111813151
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:orUHMawl11adrcS8xYd6t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkUBz
 mBMWj3TPf6OYWP8co1xbdm28EwFscKAy4JnGgNp+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTpA2
 uQzOj5UVQqKlfu/0oq9bs41m8t2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aWzXqgAd9LfFG+3s8wm3m5nmkINBpISUO0n+Ll1Uijes0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHbylbSwIAuoHnuNtq1k2JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:23Cj5q4iJLsdHkRWOQPXwVyBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhIE3Jmbi7WJVoMkmsjqKdgLNhdItKMzOW3FdAQLsN0WKm+UyYJ8SczJ8U6U
 4DSdkYNDSYNzET4anHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOtXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6Q64aT1eUbpDLS8KoMOCW+sLlVFtwqsHfpWG1VYczMgNnympDt1L9lqq
 iPn/5qBbUI15qYRBDJnfKq4Xiq7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPsi3N7N2KzoM3G3am8azh60k6v5XYym+8aiHJSFYMYdb9KtIQauEdYCo0JEi724J0uVL
 AGNrCr2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgMYfgnAD/pQgTIQs3Z
 WyDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdHmfJFz2fZt3SE4la6SHkIndyNvaCaDglqFC56
 gpeGkoy1IPRw==
X-Talos-CUID: 9a23:0WbyqmGH7gL+McWAqmI8+mEMMdIrK0bHxWXJKl2AD0JOEaCaHAo=
X-Talos-MUID: 9a23:fj4BbwkELgsnnFh1tZmRdnpTbtxMyfyrE3wKz4ketPefaXN2JhaC2WE=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111813151"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFCKKBl7hS7DL7MymfjABQ7xajgt0ekYIi3uGE7SIxRuCqgPdt7L3xi14SPIyE0SrEKdyAuI1ZKWDWyDa6iPT8XddDFP03urCA066WSPLyvIVRoC4vr8UY5kKWgdILbSvsS45h0KMdG/f8/EcorWNaeauwkmWNUDFhOHfoFf7yN8m95dkH/ib/vRwBbyVePvmE72L3IVVTBzyWlA01WQzYRb5Aga0XrnTVJ9fitHqcXthjwHGv3xuH3RY4rjW/hYuetZvz4L8IkAfiGtitwzoUhFyuwEtOJHMGdvITciJsu3p9LzXKDJSCpC21r810vzUu+48E/K5hL646ACqdkIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89oNHMjcOQaqY5FhZmJT10qj0SRQfG/Z1me2QYyTjBQ=;
 b=GW8MW/ZlXtuVF+UgQn9g0dEsCYlF/8RoZirBlZRBPumCyhbhb0zlpV7vJxuDAn+vul8AYVebdDhnVUACxzVpI5ygQAJN6SdH30sG7dgd1fpKmtZvA4qWsKPTTXzpI8L9cQvCwA2LqOpEqLT+C1edRotmPmiOGlArY0BgX6VB/8Py2t2bRVPSPfClj9WEh+izT9b2IwTaTYD0V0WUDLMiL/14vLumQ0YqZpVbcRhv1IRz+8bJfZ8wXrS10e5WhDvA8NYJEeNXH36eubCrL/Yxr8BElSqb1zosD8MXfQwjIGu8qQaDLlv9VFn7baMqyRtB4OWm0HsvAYmvtLZOlj8OMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89oNHMjcOQaqY5FhZmJT10qj0SRQfG/Z1me2QYyTjBQ=;
 b=rbNp8KRPhdxB7/HUqKQcSv6EWTJ+wUw+jElUqBx6rRoyDqwonffyg7bjeuVo5BgJTGXtyhhMbzXRjJFyewnVol18Xaf8KG/Mg7Jza704CnxcG9+eurGgQdExyBF72nek1AC2VRURNYlhLafBAr43Ty8WJNbTneHFZQXP3gR5S24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 11/13] libxl: split logic to parse user provided CPUID features
Date: Fri, 16 Jun 2023 15:10:17 +0200
Message-Id: <20230616131019.11476-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0329.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::29) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b4cf0d-b3be-4b0c-e5b3-08db6e6b4533
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xWFStiwylD/og+D1k+buFtbGq8HNplTDTv+s986cGjJqI1GPWEaxsirHM7HkBdz5Hzzi3PaUe25YnUws47k0Gpve0JsJCVFCgGQhf7s/2RD+as7Zmk0DHTisgBAJC0Ljn2YJjWBioYOh2XMl0jttc64u88+3ehpx9Co72Zw6N+FLfdPmjMN9JAERWIT4+p+1y+JkxyFC8a/tr1muHbn9Kb9RGjRwAD+LEFVpSTGnWa/5BAeAtjgcDqKKTcIJjRBQnECER+E6vVBcgJRdCH5KUhyRkPAVccwafoG2hiYldj5uRhnVTGfHaxS1VFj6PItBidQRZFWgj+TYZvOAxQ+xKG1BieLPqn+t5BqHU/S5K9j9sxK1CO/fpwEfo1LU/twzFOSe0OcojDIfHC3qscyTWZRSxe6/bAxRFgFzn97HnFwKyb+/RGxDy1zRL8C2H/yBbtz5z00whoPVtjRAaY1MnkU9XRmSkwQbe6tzhBsy6jXtp8fPlvlbLQ2d/G/HbLPw/Se5Q6JsCzL3hBuUGI4jP0A0RhnBNB2M2SxnHrmd6iiXg29zrqCnlEmsao2bmQ1T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(54906003)(41300700001)(8676002)(86362001)(66946007)(66476007)(66556008)(6486002)(6916009)(8936002)(316002)(6666004)(4326008)(36756003)(478600001)(6512007)(26005)(5660300002)(83380400001)(6506007)(1076003)(2906002)(186003)(82960400001)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpubTVMdnJWT1NmMHZnLzg0cmRPR0h3djdDSklSQWlzNDF4eVZoMHBxaDAv?=
 =?utf-8?B?NTlyTk9qUDlkV1Q4QkEzbWppWW4zSkl3VlNUdHdsQ29BODdocFZMOG4yRWVV?=
 =?utf-8?B?MmJsaUZaRWZhY2h2WXAwbCtMUWRrUkdBNm05dGRqczFwOVIwUDNiWmM1Qm1t?=
 =?utf-8?B?clRGeVd2RUpsaGc0c2JJdnJwQWZnN0FpVUtmdHRIWkJNQy9PQzFzc1hYMTls?=
 =?utf-8?B?RTFJQkpHM0VCdTJ0SGpSU0txcXFuRUdsTk1zTG9iVm1WdUJaanpEUjM3VFRr?=
 =?utf-8?B?Y0J6bmtRSnpmTmp6SG1ZNUNCTUtrbGNqWVVsVlFhLzgrcG0vNEFCRWt2QTVa?=
 =?utf-8?B?ZmszaTZnRnN4NlREbTEzUU9EaUxGRGgzS2ZrRUI3Nzg0Y0hESWYvVy9CWUtQ?=
 =?utf-8?B?TTZvcWdwcGJvUE1NSHYyWmdLTjduYU5lNldmWFRyeFlFUGFtdzdVeTg5Rytu?=
 =?utf-8?B?YVBUL1BpMnZpQ0lRejVNRkpuajY2QWxLR1pHUUlkdmxPdFp2V1pNdTF3bmcy?=
 =?utf-8?B?TW4ybmlnZTYybFgzMFFSaEJpWm1JZGRWNklCVk9acUcyV1JiUWRUZ1JuNVJQ?=
 =?utf-8?B?NzNKV0NFejJ3M2tOenZGNlBUQXAwYWh0MFFOQitWa01KbU02RWJ5RFpGS1o2?=
 =?utf-8?B?bG1KWGJmeXAybEo0bFZlU21PL2hwZHZLb2JVaEFjbXMrckhKN0ppSjd0am1q?=
 =?utf-8?B?SVBGQ1g2cDlHSG9rUFB1Qjdhd2dlUlZRaXBVSEpCcE5yLzhweEZDYzlJQk52?=
 =?utf-8?B?VU5HT1dXS0hNRG9ya0ViazFwYlJKSzY3VUwzTWludGtEc2czWmJlcGtzd0dG?=
 =?utf-8?B?cEk5Y0U0cHdsVm5KNlJPeWZlSUhCb1cxVXg5Y2RlM3BHNnl6YU9qYUxnWlM4?=
 =?utf-8?B?d3piTWJ1bXVrTjk3U044KzhuUnY4akpvSFd2dEFwbVZTQi9ha1h6VlZpeTZC?=
 =?utf-8?B?YjhjK2JzZWpLdHVMK2hZZnpMb3BMY041SHFiOThQU1JUY1owTVhheVl5Zks0?=
 =?utf-8?B?NkFLWmlmYk9ZNVJUTDFkNndyd3p3M0xCZjV4SjZwNGN0eGFvb0grc1IxQjd4?=
 =?utf-8?B?UzhDdGNhUmdlbENNVGtCVUJveG51OHFCanZ6SjVXeDVMWWRnSCtYR0pjdU5S?=
 =?utf-8?B?SWl3RkpLclFEQjR1RWVXaHlDb2dvYjBMYkE5RjVKV3hvMy9rTVhCajRkcmtQ?=
 =?utf-8?B?VTV5UW80eTdJMFgwdEFJb1dsRklpZ2srUFNmY2lEaGhUTjVaSlVtcEpzLzc2?=
 =?utf-8?B?WmxRMWlwRTB4S1IxVHpMMVNPRlVFTDdtYjhYQVhTdnlMa0x0S1IzeklNNWYr?=
 =?utf-8?B?emNLTWpmd0lGSlhOaTUxeUZTU0xjcnVnUmltYllQbU5xK0Jwa1hJRTRta1V3?=
 =?utf-8?B?SzIwRlFvbUlhckl1UG1obkpGeGxZYTNmaUxzR0JqVFR5alVWVVdGWGp5aFpS?=
 =?utf-8?B?VUxRTkVId01tR3dBclBqVXAvODZDNStSOXVtYkgrMnJmVkdMS01adnE0RVhH?=
 =?utf-8?B?K1RncFcwdEdtWHlad0NTRXZqa1BPSy9DaGs2OVRJb1FVN1hodlRXM3Qxb3FD?=
 =?utf-8?B?amMvd2lkMVBNbDlIcHFidTBaUUhKaWQ5bHAxRWgwcDRvSzFPUTNOV0ZoR1ZZ?=
 =?utf-8?B?eW0vMVk0T2tQZDUzNDVMYkRua3VaRU1xeUxrYXpBTXduMHdNWFpmcHpVMEJE?=
 =?utf-8?B?SDdzREhhTjIzU3lvYTEwTHVJeWZ0dDRQNSthd09zZzNmd0U5Vjc0dER0UzBW?=
 =?utf-8?B?VzJjMmRjeVlhNEZsaTV3bUxpemtGeGRESm9aU3J2WnBoZW1OcVliT1F3dTlu?=
 =?utf-8?B?NEVhSlBZTC9DMDZJTHA1b2ZXWHNGR3IraWpGRDh3ZElsYzVCWHFqbUQ0STkv?=
 =?utf-8?B?TUlJZU91TjdyTjZsZFpaSk1sbW1BRklGV2lnOFEvZ3h3cTRRS3Q0OEJxK1Jk?=
 =?utf-8?B?S01FRDVyaDJkR3pJaHNOTHJ0UHJBQmtvU1BYQ0dLeHl0U01hTms1ME94U3BX?=
 =?utf-8?B?OHB5WnNIQm5aMzhzZkR5SUVGVTd1TzJnVHZqSGhpT0xQNmF2UldLMjY4eUVX?=
 =?utf-8?B?b1dVeTBzYzRCR3NtMmY3akI1TXRvSkNaSXpQZmdSYkJwZ0IyUTJDSlg1TlEr?=
 =?utf-8?B?dWJsSjFYd0tsNFY2TGtYREpISEZjUVhPZjhtOVB2SHZnWkxFMW9kVnVJbWdN?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VZQX1sfNoN3tl+CORhyBHV3qTN0uPV+pm8qBTVTgUnITVyy4RoMY0FA3ll130X/X2jr+MLDrIOb8vcWjgKJoxbWXcIcxaSUZDNt0JcQwO/8RvzHJ0oQ7Q3xYP3nUZW5gfe+bznS/vmg8955+Sg0u5CSoabQZocg3ee4rPydFy1XtdQZQsqk9PflyIYWaqW/mLNeFdRgsVcHzmHXZv7WSxHjkI0DtWsQiYzops16zAP6I9rVJpbxwnA2pJLZOeEDoV08012TosRv4dccfyVUYMOKxlu57JE9lnxEctDQwl2zEfEE/3+Ac0RUVF5iKII/mDtzAn4595UL1Z1kgLNtzEZVjPa6M+9IaQnpH9aYPkh/sJh6h380U+vKyEAVHGFcX7ZpEgu92UAY/2icIkTtREUO7tUO6N4IlupgvCJ4eWL6W7rm6dOBaF4HFM8qQOOyXab84EVnOjYDOF4iP5LHANCEsmPsYerGQ2oRtUKbH3s5iZ5HbBMEr5zEEyb6oBaA0Lr7IF2wPSOzRMufkGZsKr9IQ5fpm6tFSmR26ERjrL0ptRmaWfgOJMMCdcgLhng0RynILebIaNDC+o6IymwlEf+qG2NUhd3C8hdqI9Xg10X09j3rXG5i/qynFsC6sxRUJeiwW1N93By32x1cEzgXGgRfj/jjTaDxu2RnROC9JovyZi3Ez/ALsC6l37m5oCO7VVpElIwQpbeJuPjT2enuREpPhlR/jm5apZ5co/kN7h/CGxSh2uJHp93Wwpg3sdmXSFRaWoqMK+jwep6RzMTF+hNs8b81HBi5DqJog/Lbt2RyJem3/yOnOLaJS/HRuP033
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b4cf0d-b3be-4b0c-e5b3-08db6e6b4533
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:12:00.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePISHWykQof+B87s1uj9PVz7KAykksl7X4a8J12+Lfidct9ooM9zqRDrcqLWkvBxwAEiGn8VV4DoCvEAOA/2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736

Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
newly created cpuid_add() local helper.  This is in preparation for
also adding MSR feature parsing support.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 120 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 7261c1f1fd82..d0ac5b2bc102 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -88,6 +88,66 @@ static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy *policy,
     return *list + i;
 }
 
+static int cpuid_add(libxl_cpuid_policy *policy, const struct cpuid_flags *flag,
+                     const char *val)
+{
+    struct xc_xend_cpuid *entry = cpuid_find_match(policy, flag->leaf,
+                                                   flag->subleaf);
+    unsigned long num;
+    char flags[33], *resstr, *endptr;
+    unsigned int i;
+
+    resstr = entry->policy[flag->reg - 1];
+    num = strtoull(val, &endptr, 0);
+    flags[flag->length] = 0;
+    if (endptr != val) {
+        /* if this was a valid number, write the binary form into the string */
+        for (i = 0; i < flag->length; i++) {
+            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
+        }
+    } else {
+        switch(val[0]) {
+        case 'x': case 'k': case 's':
+            memset(flags, val[0], flag->length);
+            break;
+        default:
+            return 3;
+        }
+    }
+
+    if (resstr == NULL) {
+        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+    }
+
+    /* the family and model entry is potentially split up across
+     * two fields in Fn0000_0001_EAX, so handle them here separately.
+     */
+    if (!strcmp(flag->name, "family")) {
+        if (num < 16) {
+            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
+        } else {
+            num -= 15;
+            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
+            for (i = 0; i < 7; i++) {
+                flags[7 - i] = "01"[num & 1];
+                num >>= 1;
+            }
+            memcpy(resstr + (32 - 8) - 20, flags, 8);
+        }
+    } else if (!strcmp(flag->name, "model")) {
+        memcpy(resstr + (32 - 4) - 16, flags, 4);
+        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
+    } else {
+        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
+               flag->length);
+    }
+    entry->policy[flag->reg - 1] = resstr;
+
+    return 0;
+
+}
+
 /* parse a single key=value pair and translate it into the libxc
  * used interface using 32-characters strings for each register.
  * Will overwrite earlier entries and thus can be called multiple
@@ -332,12 +392,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
     };
 #undef NA
-    char *sep, *val, *endptr;
-    int i;
+    const char *sep, *val;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
-    unsigned long num;
-    char flags[33], *resstr;
 
     sep = strchr(str, '=');
     if (sep == NULL) {
@@ -347,60 +403,10 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
     for (flag = cpuid_flags; flag->name != NULL; flag++) {
         if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
-            break;
-    }
-    if (flag->name == NULL) {
-        return 2;
-    }
-    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
-    resstr = entry->policy[flag->reg - 1];
-    num = strtoull(val, &endptr, 0);
-    flags[flag->length] = 0;
-    if (endptr != val) {
-        /* if this was a valid number, write the binary form into the string */
-        for (i = 0; i < flag->length; i++) {
-            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];
-        }
-    } else {
-        switch(val[0]) {
-        case 'x': case 'k': case 's':
-            memset(flags, val[0], flag->length);
-            break;
-        default:
-            return 3;
-        }
-    }
-
-    if (resstr == NULL) {
-        resstr = strdup("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
+            return cpuid_add(policy, flag, val);
     }
 
-    /* the family and model entry is potentially split up across
-     * two fields in Fn0000_0001_EAX, so handle them here separately.
-     */
-    if (!strncmp(str, "family", sep - str)) {
-        if (num < 16) {
-            memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-            memcpy(resstr + (32 - 8) - 20, "00000000", 8);
-        } else {
-            num -= 15;
-            memcpy(resstr + (32 - 4) - flag->bit, "1111", 4);
-            for (i = 0; i < 7; i++) {
-                flags[7 - i] = "01"[num & 1];
-                num >>= 1;
-            }
-            memcpy(resstr + (32 - 8) - 20, flags, 8);
-        }
-    } else if (!strncmp(str, "model", sep - str)) {
-        memcpy(resstr + (32 - 4) - 16, flags, 4);
-        memcpy(resstr + (32 - 4) - flag->bit, flags + 4, 4);
-    } else {
-        memcpy(resstr + (32 - flag->length) - flag->bit, flags,
-               flag->length);
-    }
-    entry->policy[flag->reg - 1] = resstr;
-
-    return 0;
+    return 2;
 }
 
 /* parse a single list item from the legacy Python xend syntax, where
-- 
2.40.0


