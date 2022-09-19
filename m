Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1C5BC537
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408638.651437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCyI-0005ka-Pc; Mon, 19 Sep 2022 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408638.651437; Mon, 19 Sep 2022 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCyI-0005iT-Mp; Mon, 19 Sep 2022 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 408638;
 Mon, 19 Sep 2022 09:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yfq8=ZW=citrix.com=prvs=254ab8f26=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oaCyH-0005iN-70
 for xen-devel@lists.xen.org; Mon, 19 Sep 2022 09:21:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1e1a5a-37fc-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:21:21 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2022 05:21:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5026.namprd03.prod.outlook.com (2603:10b6:408:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 09:21:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5632.019; Mon, 19 Sep 2022
 09:21:36 +0000
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
X-Inumbo-ID: 6b1e1a5a-37fc-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663579302;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nOfZ0mqT6i7TQfX6dS2wrKgyBQ8HnRVJZc3Xq4Y0RSw=;
  b=GPsFDRobtOUDHo7YiUSMAmBnajfnj8O7vVVCjJccG6hn3lkbLGTRBKPH
   L6AsArDRrZyQSUhWOTpkWYhVhja9qgFaKVjiubCXXvuCFVMIlCwnaP7u0
   tgb/Kwlt69OD6w8kLnOYbSiunmXqDXIV6sw1leDP6dE0+Rgo67esZ8OM0
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 81237308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H5edo6s9Drh6z//DscLuVCLjVefnVFZfMUV32f8akzHdYApBsoF/q
 tZmKWzQOPjbajGmfox1aonnpE1VvJ/Tn9ZgHQZpqCEwHnsU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4WJA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZME+cNxEGRAz
 vkVNQ03QkDEory6zL3uH4GAhux7RCXqFKU2nyg5iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PRni4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWPfqS333r+ncSXTZ5wyD5+R/6dR22bN7UsMAzFLUVKAiKzs4qK5c5cFQ
 6AOwQI1v6Ut/1esSPHyWhS5pDiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzgHb8Yp3PLaXhQv3
 16N2tnvVTpmteTMTWrHr+nE6zSvJSISMGkOIzceShcI6MXip4d1iQ/TStFkE+i+idid9SzM/
 g1mZRMW39075fPnHY3ilbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:J/8hgqv+SlZ2ukkgyRSxklTB7skCk4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsxmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZWbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYcz1gBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxemUPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesbMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlOx1GkeKp
 ggMCjg3ocZTbvDBEqp/1WHgebcFUjbJy32DnTr4aeuonhrdHMQ9Tpq+CVQpAZCyHsHceg02w
 31CNUWqFhwdL5pUUtcPpZ1fSLlMB24fTv8dESvHH/AKIYrf1rwlr+f2sRE2AjtQu1B8KcP
X-IronPort-AV: E=Sophos;i="5.93,327,1654574400"; 
   d="scan'208";a="81237308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMRNa9hSY54MJl6GGF3rRmoImZQEz/teoHzO9K+WyLDmsfKXWEopO+V72gpFuSxiAFSnSYQnif79Qp0yQtFAJGgglPIDQEA4dhYJTrL8UveCsfEGkVT5gTTkKGjZ2UG6DKfl2oDs0BOv+9ZyJOc2Fb5Sa6t3XpShkkHiw+9ER9W9JTBWvSGSyuOV0hbA1nVrY4nq2xef/PEcI8Qv1yJGgfoevFhgbbuP9+QCGlbDac9yve9oRM7y3DsmPnECvWDybPAmtpp+EraLV+eRcURUz6OqZZNsxx+XA0kWzPc9BYwnYzVZ+KZnZSIMtKHrdqH5swKMYY2Ndsoom+D410Gz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBk+G0ZMMyPoNS41TcAh9VbeoonGdwsm0J/JBubJNKU=;
 b=WKUmtty69ycVz0pJgUAYnXMz6odM5eufDwYfGZXm9h9aHucqwKe78XqUK9aZ+gQ2/joFjw9fTk2ZsdmzAXtijgR8E4YGEb1QjKgynGngRA/QtE37HzaK2bWQfpALQ+evLfQcJ8CKfVTkM8oMUyA4Xm2J3pV7c1+mbdQ6u9c8Ee7vj6Czpl4n6P76p+Jdxlj521v8JVeNknOyoLfJRSy2FNTnEhfWNOJ3tVt3RHl/Ncv80YX9oVD2UBIDRAdmZSPW/HGyUXmE7SLOE650XELIO0lAamHDeZW8TUwT9GXPoUsbEc1f+WU7p4N/k5EElW7JSrCt2N0oy7tkv7zqKYAlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBk+G0ZMMyPoNS41TcAh9VbeoonGdwsm0J/JBubJNKU=;
 b=UPnZhWsBQOvjmb0UGSnhINEtwatqcotkQmH1YIOw38tSLtYfUxlq4fD6yZ+VDnPOYL7PN5K84EyOGkuLeCqEjygKYOWjZJJiOLRhjbyktI0RMAAhR3QVodckmtAQUekNI7yHR4WeTsGDXRjJ7mqkLbMnBuuGYTj5N6LY1jk2IGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 19 Sep 2022 11:21:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Adam Szewczyk <szewcson@gmail.com>
Cc: xen-devel@lists.xen.org
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
Message-ID: <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local>
References: <YyR1eUfbq9aVSVXV@Air-de-Roger>
 <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com>
X-ClientProxiedBy: LO2P123CA0033.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::21)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a81f57-e7be-4277-ef30-08da9a20593e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X5TrOMseFOm8ZAEtyeGe9PlEIlVMTkK5j7NKSRBx5HWqQgH300uT95oO6+tGZkoFHCcuA6qBx3B5vdEa2AMnsMO7fAqMFcyWcwGp/AbvPoAET+yuDW4abdGEqL4EGuJ1Ym5TMjLmXF68hpPI5EbfD4etAy7lj3jo7C1y61Psn6chXJrCv9RB+lV54pHkKoQjmiw4Nj1gkqwd6de9pbfxBc8hLblOzyb8X/0u+p/IQDmej/LXItcoR5/8OCd4ZEF9gsoYiz42XSjbOCuT6zxU282FbRT7//9nldlIM4Aam/yUFHhxUCNuOkaes1f+omGhEU7sW/rWeFv7PYCti6/R8XOpEwAEzKqEgNt/ARmnxLOL+ay3IrvCB1t7UCJQPnNLYkcs05cXOFEsvDcL1hs1IgO5JG0ArLPrsE2ZDrsPlSs3Nxx6gkqjfXVPJTjY+mjknlY6hw7R809SbmYEfHepN9xIGwToWUkGjKyxoyFrPDBwmqIcHavlbAaJ1V53kqiXg5f9rhRwyTl+CQ3dr2n3UzTEy2+Bq4oF1z8Skpu3Qf8HWeru0aRU+SUYcpRcgyDPdgjuUS7VRuinnsLko/9jdu73d0bzhKbmOSqU0CywewYLCz417pSHnuTvRkTv2PQWjOjr9K71QxPB/xB2lAALuCMz7fVLvZFcAsjCt5yqCSV9VsEL7BpJ2xciI8m83denEKSxd0FQHKG2d9zeVy3EFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(451199015)(85182001)(2906002)(316002)(82960400001)(38100700002)(66556008)(8676002)(5660300002)(4326008)(66476007)(66946007)(8936002)(6916009)(86362001)(186003)(478600001)(9686003)(6512007)(26005)(83380400001)(6506007)(6486002)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlNuYU9FWnhlQ2wzRVhTL2RZNDRkSkhuZTVJY28yWGxPNnZ4VjNDalFiSTdH?=
 =?utf-8?B?Ni9CYzdzWDB6UTlBOUNCcUFuSWJXU3JGTDRsOCtQam9yWnZHcVNVTDZwZGEy?=
 =?utf-8?B?WEYxWTFRaHhKUkt1amx6eTIvU1d6NGlMdXFENzlJSm5QN2NyNzh2emsvb3cx?=
 =?utf-8?B?QjIvWXFGVVRBc2Z4czArVncwZHMwaFNPQ0FZcVdIK3krUUFDVXRvd1RrYUtK?=
 =?utf-8?B?U0VxSklmTVJSS3htYU00a1B2a3pQOUlaN2JaMHRFN09HMVdlSk12QkNsSkpB?=
 =?utf-8?B?MW5FNUNML2tUckpUMkcrYzBDVFFrQjQ0V2gzcWE5cDM3Yk9VM0lxWk95cDhJ?=
 =?utf-8?B?MDVqMm5zbmVCalkwSmlpaGp4OVZOdjVERG80TW9qMUxBNjRFTkVHb0VpS2VI?=
 =?utf-8?B?K1JvVjBOaG12OURJaTIwekkzUjE2TThVN1NWdmY5UDVUTXlnb0ljNzhhNWZ5?=
 =?utf-8?B?QW9SamtLVDY0UFlTSHdjTnlPai9NSWVsU1djZ3hlNDc1MHdSdThUc1R2Nmxj?=
 =?utf-8?B?VkVCMUtnbFZPZHp5QTJQN3hiVXdwVGo4THRtTGw3SFMvTDJlYkYrY1BwenJN?=
 =?utf-8?B?WHpWdm4rRU1UVExKNU9ycGlFUFZscEduREQxbW1iMTRHK2lKSUkyTU8wQjI3?=
 =?utf-8?B?QWlrS2ZISmhXSTNWY1VrK3VzTnlPL1kxL2U5TkxPbG82cGZIQXcrbHY0emhQ?=
 =?utf-8?B?K0tyN3BCWng5S0djd1F4RjlpbzAyeUFVekRTbDI3S2VIL0RSd3VEUWtWdXBn?=
 =?utf-8?B?bVdLQ3BmTEdsTlJDQm8zNG5Pb3liN050ZDR6SEdNdWZENG4zOVZrODMyQVRO?=
 =?utf-8?B?Wm5EczBKK0tMcG8xVGxadklLOWlYWUpkeVBMaVFUSHMxL3JBWEVWbVBTY2Zy?=
 =?utf-8?B?YlpZSml3YjlxbFJRVkRNUDZWR21SMFkxVU9BOE45bVNFV0RKZDN2UmRid1B3?=
 =?utf-8?B?U0haR0NvNDNpN282MEVXeFBUUUo1NEUyWVdpclNXRFpxRGZJSDRnUFp1T0Y5?=
 =?utf-8?B?TmdhOCtqVTYrOXM1bUc3R25WeXNMbWQzKzRpQnZpdkZXZEVJdmlmQ2kxMkdD?=
 =?utf-8?B?OUtpOXhRdmU2elJjMFRHTkJxZ0owNEJ1YnAxNjNHeDBjT0Irak5oVFVXaEJ6?=
 =?utf-8?B?dW1NNlVDSUdEUmxFWDNEUDFGQVk4UHJOM241c2dNTTdjS1FpWWNHdVo0OFZT?=
 =?utf-8?B?MElNMGFLWStSTloxQW9VTkl5eEFnTGJtTFViNEU0V1Vzc1VxdFRaMzFsYzNH?=
 =?utf-8?B?ZXY0ZXBvZk92Ky9NQW13cWFKSTY5N3N1RHdvOEZSb1B2MFBGVUlXUUZjZWdk?=
 =?utf-8?B?bmd4UUhtdjNKZ3lzdGVpc3FjZ0hLWWFSV2xEL3k1Y3BsR1NlVzBrcHJXaFJt?=
 =?utf-8?B?WXYzY2hHM0dJN2tDblN0cXZwMXllRFg4UEhWSmRLQXJKVVdCMUlXVGZpVkJK?=
 =?utf-8?B?ZENzNXRrRFU0TFdNQkZGZWxvcUdNZ0ozK0FPQ25DMVdESmtsMFd5cTIvSXN6?=
 =?utf-8?B?bGZyRFJWTVJRbzA5VmN0NGtEUkkyMTh6UTJ5WHBTV1ZnZVBDdW5QVEFmRk9X?=
 =?utf-8?B?SGlCdVVWYVZKWElwVTZwcGZLUFg2bDJzUGc2bXBwOVZqN2kzclV1Q1M3b2pq?=
 =?utf-8?B?c1ZidmR5emhiaExmcVVKWk13OTdzT1h5OERvYmtDWHJURnFQK2E1NXUvcFcy?=
 =?utf-8?B?cC9lTGhhVzZpcFhpZnY5NDdFVjhPd1BkYUFlTms0ZmhvQmErdkZUeTBVZklW?=
 =?utf-8?B?TmdjTDNqc0gwQTF4d1NBVkJYS1owWkcvSjZIR3lhMTlxQ1VlVmdwakNPc3hK?=
 =?utf-8?B?QWh5ejlGbUd4Z1hoVUZwZmgzaEpSRXZ5SGNpanFNam9oTWEzYS8vU0FESFpl?=
 =?utf-8?B?SWJFL2gwVU5QU3kzRGpCTklKekZtMzQxbWpMMGZjUzZYd1FUUjBhSStOZitG?=
 =?utf-8?B?QkNyUlpqaWgydEpRS3BYTGphaFNvS3dsaExFQVdkc1hkdjd4b1JXUG5aZFFU?=
 =?utf-8?B?T0NVWU83c3NQTHJ5bEdrSkYzdlUyZU9id0VXazhiREhzcm1YMmRRMXVUanlk?=
 =?utf-8?B?TFhuZDZnNGV1S3Q4TjlJUytscXNTN2dEOEhKM2FRUG5ZVXRaN016dW1GYktX?=
 =?utf-8?Q?NuHyu7eh9JbxiMRI/1rFgM9JU?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a81f57-e7be-4277-ef30-08da9a20593e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 09:21:36.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD9/kO3RIcusTJfpjDKgYoymnqtK3tq6qUPbqNQNVZ2cbar71AYQfnSh5TqbjOt0OdQgGuOeRcu+rv90/sCiuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5026

On Fri, Sep 16, 2022 at 05:08:59PM +0200, Adam Szewczyk wrote:
> Sorry, I always forgot that default answer is "answer" to not "answer to
> all".
> 
> My xl dmesg after calling those debug-keys is:

Trimming the trace:

> (XEN) MSI information:

> (XEN)  MSI    125 vec=72 lowest  edge   assert  log lowest dest=00000100
> mask=0/  /?

> (XEN)  MSI    138 vec=62 lowest  edge   assert  log lowest dest=00000001
> mask=0/  /?
> (XEN)  MSI    139 vec=6a lowest  edge   assert  log lowest dest=00000010
> mask=0/  /?

> (XEN) IRQ information:

> (XEN)    IRQ: 125 vec:72 PCI-MSI         status=030 aff:{8}/{0-11}
> in-flight=0 d94:151(-M-)

> (XEN)    IRQ: 138 vec:62 PCI-MSI         status=030 aff:{0}/{0-11}
> in-flight=0 d92:151(---)
> (XEN)    IRQ: 139 vec:6a PCI-MSI         status=010 aff:{4}/{0-11}
> in-flight=0 d92:150(---)

Was domain with ID 94 your OpenBSD box? There's another domain with
passthrough devices (ID 92).

If your OpenBSD domain is the one with ID 94 it seems like the
interrupt source is masked, so no interrupts will be injected to the
guest.  That however might be just the response from the guest after
seeing that the interrupt source is not behaving correctly.

Are yuo using a debug hypervisor? If not it would be helpful to do so,
in order to maybe get more information on `xl dmesg`.

Can you also paste the QEMU log for the OpeNSD domain?  Those logs are
in /var/log/xen/qemu-dm-<domain name>.log, on most distros, not sure
if QubesOS puts them at the same place.

Regards, Roger.

