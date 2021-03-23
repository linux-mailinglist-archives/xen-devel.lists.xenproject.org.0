Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA10345B82
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100549.191630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpF-0006dC-5C; Tue, 23 Mar 2021 09:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100549.191630; Tue, 23 Mar 2021 09:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdpF-0006cc-1d; Tue, 23 Mar 2021 09:59:49 +0000
Received: by outflank-mailman (input) for mailman id 100549;
 Tue, 23 Mar 2021 09:59:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdpD-0006c2-2x
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 09:59:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ed01982-7002-44c2-a005-1d398e41eba3;
 Tue, 23 Mar 2021 09:59:45 +0000 (UTC)
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
X-Inumbo-ID: 2ed01982-7002-44c2-a005-1d398e41eba3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zcfmbEe4UCyttYXsnFBGL6aT4m16gCdnmGNRMv3yYUY=;
  b=QSR3AvSA+N+nfREPB4cgLKiYeGBIbRN/dMJU5jyPZfra4L9x/+aZgaPs
   zcdZ7fWaftWrKrwHjcIXa33pnr2kyzXZPgnnTVhJoZVXb+hRIUvD787gh
   ZsjyHQ8jXzLVU2R50WvymkGBzkbtZWgMjaWLY3YS/MMTnyvqdSNl2dNsi
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g1PO2tYsGB+bltiKrfzuycs9uxjztNWl4I4fPHHlZKtof4HRwmfoZEjUQRbFuzQ3v86PEz87J9
 pWWODA/SpKVTXgBCfPznSJ0npzyjDYV7uXKYAPIYQs5SsKud3PSpcGeK31nsufrvG+yNclEJ7R
 AyIbB+qtMOYfvfHR/NCgQNhhylGWNqr5KMpqXLS/XTseeWkPen7GO3gW6LDEHjNY96lYJ/L1D8
 zQHLLQOfR7a0a5he9ZZIXTKsZR/ATkdLB7R2HFkri1pnOKoz6pUMZBcVR846et9YgE3XDWP95V
 4cE=
X-SBRS: 5.2
X-MesageID: 40055392
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:i7m16Kt+oYjsieunWxZsjk2L7skCCYcji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjbU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qx6Y
 5JSII7MtH5CDFB5/rSyAOzH888hPyO9661jenTpk0dND1CQYsI1WZEIyycFVB7QxQDIJI/Go
 aV6MYvnUvZRV08aMOnCn4ZG9XSvtGjruOsXTcqJT4CrDOPgzSh9aLgH3GjtSs2fjtTzd4ZgA
 34uiPj4KHLiZ6G4z/ak1Te9pFH3Obmo+EzYvCkrugwBnHShh2zZIJnMofy9gwdhO208l4lnJ
 3tjn4bTqBOwkjcdG20vhfhsjOIuAoG0HPsxUSVhnHuu6XCNVUHIvBcjoFUeAax0Sodlex8y6
 5C0ia4sJdaHHr77UbAzuXITB1jmw6Ip2Mjm4co/h9ieLYZAYU+kaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzkONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4MrRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko+lIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104L2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6kiqX3T/kQXAQn+FQD29wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9qosfE
 V/J7vjmrihpXa/+HvJ62kBAGsSMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYgNkQ9jOCw
 5ZrVRv8aexJ5idrBpSSe6PAya/tT8+tXiKR5ATlum//s/jYIo/FYtjcrd2Dx/3Gxt8nhtKpG
 9PZBQffFLWEirjhMye/dkpLdCaU+M5oQ+wZeZItHrUtCyn1LoSb0peewTrbOm6rkIFQSFOil
 h47qkF6YDw4wqHGC8Ersp9HX9tTCCsALxADAOKDb8kw4zDSUVLY0nPoRPysWB0RkPas389qC
 jbARepXMyjOCsbhllolpzF3hdJUk24RWJcA0oK9bFVJCD6njJa66ukTIyV/AKqGwM/6+kALT
 DIZiYTKAtyx9axkAWYgiqGCG9O/ORTAsXYFrQ7RbTa0X+pMuSz5Nw7Nu4R85B/ON/0tOgXFe
 qZZg+ONTv9T/gkwgqPux8eSWBJgWhhlfPjwxv+6mekmHY5HPrJOVxjLotrVO20/izhR/yS1o
 9+gs9wteysMn/pYtrDza3MdTZMJlfSpmGxJttY36x8rOY3tLFpGYPcXiaN3HZb3A8mJMOxjV
 gAWs1AkcL8E54qe9ZXdzNS/1IvmtjKJEw3shbuCut7eV02lXfUM96A/rKgk8tmPmSR4A/rfV
 WP+SxU+PnIGzGO0rMXEKo8K2VbYkpU0gUXwMqSM4nLTAm6feBK+1S3dmKneLhGUa6fBPEeqA
 1579zgpZ7lSwPonATL+T11LaJF/zz5HYe8AAeQFfVJ9NL/M1KWmaeu6NOyijCySTbTUTVoua
 RVMUgLKsJEgX0+iYdy1C64QKn+uFgknFtT+isPrC+Z5qG2pGPAWVhbOgjYiIhMVTZdMnKUnd
 3ImNLoqkjV8XxAw93fD09ecdFFBsgIQoX2JyloL9IMvLTAxdtevg1TJBE0D2A9jzjh3+Rpmb
 ehsc+iJNHfNQ==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Egt3gICVYG9PWWnrHbDpz0D7bT5zGRqJPSXh0xKHax+f4Al0618ZZVqEySH8/R5MLgvEds1E8slTZczaSmghfeFBliL7F/ymqLY3dv40LTJyQHIZPraa6XYH3bss6uob0j7oAY3j/1weVlw00Bk3/C3ka5puwtQPNMEzp6K13Qy//upHtuKB4zb/qoKn3U0kvJ3k/3FFamEEZKa+q9RBvv96Cme80zKrhxwSbjc+jBVcO1VW7LzawMYUb6VWf/7MwqRfRpRpoTmSQMz58SJreYtq9z24a2qRpl4DsxRFwjwXpGa/+tk9awBny1Dn7eOgoJ83ewMP6CuFlazfj0I5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTCmGbFvBsxXZnJ6Z7hVKQ43JE3lWvZovCCAb8H7ohw=;
 b=HvnkHgbWMoHT5Og3I292wIFJ+Y+o51+ee8DxkDpkQzLmtMPfWxGbz7CZtBw8cP/+rfWukAqZXn/MbW6yFZmZCKvo8TtgMMz5G56YAWhaBxDOgi4OAwn+ywrxPmyJO949fSAg9lQTZDF/xvut1j9QI68PwK18jWBsVdd20TZMP9UqpjOOy0oW9kFm/vOIRuUgMr3qx39K/8pMC9VNGPLml0V+YMnxOPoA3L4Du6S2sHEHxAD+2MpJF3yR/nsCmBCnzNyXA8mBMMVDoldY8Wu03uCai5932QA4+TOWXkemxpA2uI3ACgmIiFgFOwIzwVxO5ZC/HOZbXx/C0zclomj4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTCmGbFvBsxXZnJ6Z7hVKQ43JE3lWvZovCCAb8H7ohw=;
 b=Bv+5c8nstfmbVERiV7hSs3ny3Gy0lTZq86i1I/DVyC7C/8gSYnRi88fElOH06x4xwnJF/TBNxQ3T7oLeP/8NShZ4+Of+Lgji+d/I1OBiwahjUo8gqX8yfTN+jQgK+ta63rDSqbglHY7xDm67irseTCuvdBpLW+TvnMEvVZX5xho=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 03/21] libs/guest: introduce xc_cpu_policy_t
Date: Tue, 23 Mar 2021 10:58:31 +0100
Message-ID: <20210323095849.37858-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 945ca441-a6b2-46e2-17aa-08d8ede26131
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB263375A45622B828CA191AB48F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPLwdr2Q/t4o7xvjoUVEXe8kBWVcW7phbeKhwr2p//nljg6VkdDumuRE9YqELGsyJ4YLCzNMCw8HSLZjdCGBtAMabFpnBfYjcJUSPNXdoPQ7hNf5BQyX3yaGwLT46lc8w4wCAz1zRx1OqYvSK3yeIIZvhBjhikadQUUxvgxbT6yBfvpj3rS6tpqFeCWm4G2EUzgIFg4bkkJSN6xgfz+7vC24wFJZbRv0Rw0tNO8m4MzYZ6tdcNg4pl9U1MPV/eWUgCAw2sdPa/5o4/HRirX7koK/mlNl8kRECMFzRooU243icgcJUDNWAQqfChYauKz2daIBzMeQn4Tqv1gZHBNszWr90o1bNEumXbBcO8o+cBOs9roa4Qf5XgV2x10dBbQrBQpsuJAKI70SDZr17aj+hzCSEvg3V2sXhY9BUpICZTSJ+78V/pmSF9h6UmKQUB3Ya+PUWjUV2DXFn/+7JopIbw/gC1E/eIwZImF6aqiCYSleYJH9Gz6p2N6AG2N0qHgtRQSExOv2Ajv9Kp1a6Zo8XDTF7+30EdXCvwJ2gt0zEHqUBxZhzrznNlxqPATAJAb6GH3Fv+/+XbEwbE3Ef7QYVhRCV6CaO7OMAWB8boMOCFsXaubtuonZR4AxVa1+a1e6DnpSUhfzh48I5PasDFEwdcTG7/IpV1uTzCRTgQqfBc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(6666004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajAzbnVqdzdDUlRLbGEyRk4xSlE3SStOenQ4bzAwK2gxUUl3T2huODNQREFs?=
 =?utf-8?B?Nis1MDRRWFduZ0ZJRVlVSVIrQnpFeFhYUWlCdGh0UDJkTkRJQmE5Z1J1RTdh?=
 =?utf-8?B?eHJNTEZQRjJzLzUwY2NReU56aGtVOU1xVTZQbEpUVHliZ0hyTTF3L05ERVBH?=
 =?utf-8?B?QUtScXR1YVIzWG5LVXI2N0dpSHFoMXBiOTBIK1YxWTFTa3FBeTV5T0gvZTJV?=
 =?utf-8?B?WDdadlRyMHVZcC9BLytLc24yTGxmM1pvdzg3L3Y3NFlGNU13Nk9KTzNJSmM3?=
 =?utf-8?B?cksvcjVrdkRnZE50NVVGNncyQmlVTnJiUnpGaGZsV1Bxb2NrVWxVbkNDMy9U?=
 =?utf-8?B?V3g5aTFqYWZETFB6blRHOGd2M0MxM1F2ZnhING5ESWlyaW5Ia2J6bWZqNTc0?=
 =?utf-8?B?blRWL2JlZmh0cGtubnU2Y0poNVEzdTJCbXVaR3JQMEY0M3VTelBrLzRidmxK?=
 =?utf-8?B?YnpYdWgzOEJDU0htSDdzdmdCWHU1TG82ZDBrSzFaOHdNL2xrdmUwWGVwUVls?=
 =?utf-8?B?c2hQNVl5eXhRUXpNODFlZW5CRjQ4eHVCUG1ucElGL1k4MEhsclNkUWpIZkY2?=
 =?utf-8?B?dUZ6YkgwS2JndTROL0pja3k3T1NJYUc5T3lGVjMyMWJmM2d2L1VUU3djaUJi?=
 =?utf-8?B?dGpKeXMvWDVmOTZtTURVMnVCN0Z5bHZwcExhTzIwc3grZnN1bzVBSVBiaEtx?=
 =?utf-8?B?Y2hiMUtBRUhiSkptMFdBczRVcWRnNUhJOGUrbVZCRytMRmpqNE4zUVdKNVha?=
 =?utf-8?B?cC8rcjBKbmRxUHFNOC9Pb0RhNDYxWWdXQWkwWEtIRlRtVUw0WU95RGJyU2tO?=
 =?utf-8?B?SDc0WmZPdGRSTzhXcnY5a0pzWU1RajF2dDUrNktEekVxa3l5ZnVVT09mQUhn?=
 =?utf-8?B?cVNSbGdCdEowaE84VGpmUjdZUHp0Qy9lSU5XOXQ0Nk9pR3hXbVIyTjVMWk5I?=
 =?utf-8?B?S2ZkTDFQVDdSWTdFaFBGdEJLM3Z5WStpbGVMYWlhUmthZWRCbFhuQk5qVmYr?=
 =?utf-8?B?ZHdYNkx6OUpqVXNZdUVqTGRwUFFrWmNIYjByRmtrUVVmMXYwem85anRBOXBa?=
 =?utf-8?B?YnBsclhGbmZoS1BnYXdvY3JkS1hiVjJYTEhPdVlDcjRTYXJpQzRXYStLdUcz?=
 =?utf-8?B?Mjlha3JtSXh1Ujhtd1Q1Uy84UGNKRHErR080czViclZZMmFYZDM1c25PQVV0?=
 =?utf-8?B?bnA3akJ1c1c0UXVxL3ZIOE5jUjVSOXBBMHkyUXlXSEJqUUxlMDVNengvb0Yx?=
 =?utf-8?B?M3hSVm1VckpzOWxUdDRxWWVKc2NNSkNFNUJVRmR3QjZMcU1XdGRYdEwvZ2JR?=
 =?utf-8?B?aEcwVUViSyt6NzgyN1Y2SG44L1duYzBtMVE3NUMxTllEQWFkOFdZdlVDeXBr?=
 =?utf-8?B?THNBeVpDZFF4QUpqRExZbHJoVWxrczIvMGlVcE5ZN0puZy8relJLeHVoc1JN?=
 =?utf-8?B?TmNaS08vaGl2SUJ1bk5IY3lPUlEwZHJtRXp6ZFpBZHhrWUlkUy9JRXNiV2s3?=
 =?utf-8?B?R1NOSTBvYzJkTlpqemlTWWF4SGc0SmlrZHRtS2VtaXA2ZGthQ1RML3BvTmd1?=
 =?utf-8?B?T3RhQWExV1F1L0pJYXNpQU9SYW0zMEVtN00wOWMrTjVIcmt6c0srbjRVMWZL?=
 =?utf-8?B?bzhxZHp3cSt1YXViOElvRmdtRjZPSTljMzhlRjQwa1NpYnEzUmFEODhDeWRW?=
 =?utf-8?B?aGNWN0VGVU5tZEFodlJ6aDcyc3AwYmJEMGxKNHJCNzh0NUdhWTdaV0tUaGpM?=
 =?utf-8?Q?7bpOO8ESpIsOP1twIUA46CD1j9ighW+rqCNgV/e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945ca441-a6b2-46e2-17aa-08d8ede26131
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:42.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AObCEWCVcAe0wKnJ1V30eRI7bt4rx9vgytfYHSzTIwNgZDp1cvtAewbyZQFPPhvbrLu83kv4yL7cquYowOmdPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Introduce an opaque type that is used to store the CPUID and MSRs
policies of a domain. Such type uses the existing cpu_policy structure
to store the data, but doesn't expose the type to the users of the
xenguest library.

Introduce an allocation (init) and freeing function (destroy) to
manage the type.

Note the type is not yet used anywhere.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  6 ++++++
 tools/libs/guest/xg_cpuid_x86.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index e91ff92b9b1..ffb3024bfeb 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2590,6 +2590,12 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
 
+typedef struct cpu_policy *xc_cpu_policy_t;
+
+/* Create and free a xc_cpu_policy object. */
+xc_cpu_policy_t xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 9846f81e1f1..ade5281c178 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -659,3 +659,31 @@ out:
 
     return rc;
 }
+
+xc_cpu_policy_t xc_cpu_policy_init(void)
+{
+    xc_cpu_policy_t policy = calloc(1, sizeof(*policy));
+
+    if ( !policy )
+        return NULL;
+
+    policy->cpuid = calloc(1, sizeof(*policy->cpuid));
+    policy->msr = calloc(1, sizeof(*policy->msr));
+    if ( !policy->cpuid || !policy->msr )
+    {
+        xc_cpu_policy_destroy(policy);
+        return NULL;
+    }
+
+    return policy;
+}
+
+void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
+{
+    if ( !policy )
+        return;
+
+    free(policy->cpuid);
+    free(policy->msr);
+    free(policy);
+}
-- 
2.30.1


