Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865BF51165E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 13:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314942.533240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njg1e-0005Qw-0b; Wed, 27 Apr 2022 11:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314942.533240; Wed, 27 Apr 2022 11:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njg1d-0005MW-SX; Wed, 27 Apr 2022 11:40:05 +0000
Received: by outflank-mailman (input) for mailman id 314942;
 Wed, 27 Apr 2022 11:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njg1c-00054I-9i
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 11:40:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5946bc8-c61e-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 13:40:02 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 07:39:59 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4056.namprd03.prod.outlook.com (2603:10b6:a03:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 11:39:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 11:39:58 +0000
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
X-Inumbo-ID: c5946bc8-c61e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651059602;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eNBRGcRxM+DQ2AXmxHr+lDpn1AbxrvkOAep6hdog9PA=;
  b=gPwHKp2Qkh/qsQilFOZobEviJhFMcjmSeniw9B2sbrre/wqkhBDmOL4n
   De64UsAU6Bj9fuwyUIV8JkJxzorAKjqS8jamZGj+7nA2om3fo2iIAsemS
   6NqopLs+7V/E+LbAnDbP/oI6+g167ErHVJeOnpkFhdT5eYP9D5yKsrbeG
   M=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 69914283
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ep2mhqgGLUTjz0IGOMnBAefSX161FREKZh0ujC45NGQN5FlHY01je
 htvUGrTOfvZZ2Wmfdh2aouwpx4AuZLXn9NjG1E//Hg9Hiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nT4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQMoBPOPquYbbxljCyI5EPBh447oOHfq5KR/z2WeG5ft69NHKRhseKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMu4EegGlYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUG+QPM+fBnuAA/yiRNz7PGaNSMJ+WVBtRkhmCm9
 lzW5GDAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwK8iG6JuFgbQdU4LgEhwASEy66R5hnDAGEBF2RFcIZ+6JFwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:68zpQ6EUQxIJa9jXpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69914283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVBy74tPO57BVaSDTptol90ItEvFbmjnoXBI8RXlTGFVu4O63S8+DS5DvoxHyDz1/izPCWakaQzhpfWbj4dHtYhaIYogHF1yJOLSudPCDjtStxXlJmDaomKoh0J3O291yoiFzYGYK4b/Y6Kd0uvs8ALamZ9AJ9rws99qybKlJJ+nw4YexMrS2a+LUmR/cJMUHUYz1REI+7tGz0MwRLE2QMEn05LZV6h0iONWYKxFNDdpzdkBn6Jb8D/zinp4tswc69S6eklXIND0sdnCFPm2Trw62dswsxy3nFetmBtbVPqCB/VkQVvb7zE8T7c7V/JFEmy2EcLrsikpjWvBuoLcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZrcf9kLv/d52n7gJCUeGAp31IHwN1zUO+wj439yMcc=;
 b=gW/TRey1PhnOYsmFuIRhf257vSWLyyegcD52RcCUJXj0ksEwFVtDT+oEwCyMxCtY2/W+mluiBhwKc4gtyAf8Qf5CoCHhN8fLwGbKXZnzYe8wKD9CyQ/LqVVpmSkqEbfBfiL/pzvFbl1oNZgIqSXpbXDXtaA9kp8tSvoomZVP+gCiI3RiKCK5quQqRF7fu8RiE+4NAgwXStu1oyD28z+Mtcq0YmL72XCgxV7o2IrB54iqTRxvbjesiT1kUZSkTrVCg+9wGckY9Kf5a8nyO/zXNuwss1td6lplLBMG0rvIdYyaHJPWLXKzag8v3rLnOX9ffMnN+Sl9SaM6GaWsBVJTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZrcf9kLv/d52n7gJCUeGAp31IHwN1zUO+wj439yMcc=;
 b=JDafCfE6MtyDRFi+nfzWNB02i+gcqBm5Yk7AhiIv+VlB2f9D0/LHlElyqGpuwpy4wyRaNzSRKN9l+c5eT7xKpWArMNyTwi2uJIaxB/ccjB/onDl0fhRAbsxDctgSCXsJH0G5MUzU3SWUR+p5y8CU3PvmV0L0uJNQLgN9alT5UZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 13:39:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/4] mwait-idle: add SPR support
Message-ID: <YmkriORufeJv6Pel@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <722833a9-e6bf-1a63-e866-aed0648c785e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <722833a9-e6bf-1a63-e866-aed0648c785e@suse.com>
X-ClientProxiedBy: LO4P123CA0142.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 770b7061-10d7-49fa-20b2-08da2842a7fb
X-MS-TrafficTypeDiagnostic: BYAPR03MB4056:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB40564A3E745896A4B8BA3FEB8FFA9@BYAPR03MB4056.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+kVZE9tPsWFnayCvq09b3WVidXLibI4O3mGEGfzupEq/9P+jtzeDfpZIeasBA/E0EMHaySZwIErm51mz7Dd9Hvkk/XLjdWMEyFn1Pxa+9+m36huPDFwmHE2Hha2Zc8vSBqrlC2vjp2lHwrCu9Tq1+xu1OeCvTbSdXIpCH12F32KbCrZRyPy1MJt8aK4+pPqUsuKMRynsq9GC5Ud8fhs4P4Vo0r1jg/DPE95WXaTuO1eb1wyzN9e1L+r/KuIgwSxSt7lNRzXRR4m+QjZXs0f0Yi/kS+zErJ/HG2mI62TdgNQgujo25xHDSEkA4UOR7xGKYj0SxrzATmxo/qv6NSG5WxaCvm/nLigE7fgHVqAtxxXp5JrSQW8YGV8NV5LwsWNe74dFpfU2KhA8PKbBuuXK8jERbKeqWng6apotShMewk+LYEdALDaToNNkrz29zGmZ1bhgBKiCmhJawPZUyWkgZqxjD8XWxFVUCn5Vkk5p9edic88Ef3qKMWyX+/xcDh8JvjGIZseZiUi7krzfvl2LsR1bd/4qoJgX/hBFZ1I4EsOhzORruRJksX4nc1wiCdJrx8IygqqkFV9aoaAkl9H3htwJEzmdeQ/fW/EXVfQEVaW8VGS7h0di5LY5WRoF5tN2pD/kUEwTgaBj+CdIjt6sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(6486002)(508600001)(6666004)(38100700002)(66556008)(66946007)(8676002)(4326008)(86362001)(66476007)(33716001)(82960400001)(6916009)(54906003)(8936002)(316002)(5660300002)(26005)(6512007)(83380400001)(85182001)(9686003)(186003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0YwcStOcE4zME5ieC9IMm52SnZtWHFvYlpGNVY2YWJwL29pbmdYV3M1THVv?=
 =?utf-8?B?KzVGS3RHeSs3b2ZrbDBSd3hvVHFVanpzTGdRYWhKMGo4emV5M3V0MVVxK25S?=
 =?utf-8?B?NUtVK1pSWVlhNy9JSVRhaGJ0OUF6ejNmYVowd3k4M3dJaFh5Y0loU3BBSW54?=
 =?utf-8?B?bHpFbmovR2tqTThEUW0rUWo4bVdSNEtHa29RczYvUnNSR0xta3ZOcnBCbk1F?=
 =?utf-8?B?aUhGbXZDbW1tcEJMYW5PeWFhelNFWGhrNE16aW4weGxsSlFjZFlpUUpWbFNl?=
 =?utf-8?B?YnpUU1JXV1VGNTFCSFpmMkxDQm1GWUlHb3hrV1ZaU3VYZytDTG12czVuVTlm?=
 =?utf-8?B?VUVVV2lYditaOVRGN1lyOGVjZzdEbmtkZUwvdVZ2R2FGTFFRa1NJSlNtSFAz?=
 =?utf-8?B?TXlqcExMa1lCYjJBcVczQXpKc2JjYlE4SmZnQzl6U2IxODR5ZXZpYWpKK1Qy?=
 =?utf-8?B?THhaYUdOcVNNWmNBM3Q1aVplZFZjay9FeGpMMXNNR3g5L2tWUkhId050WTkv?=
 =?utf-8?B?NEtNc21GZVNBREpxTEEwMXNRelFkUUh3RGVldHhjNmN2YkhhU0Nqd3BiNDhH?=
 =?utf-8?B?M2JOSjJNUW5vZUoxVVdmR2tnVjk3SFJRVDFDc25IZ1VSRy9yY01lK1V3Vmkv?=
 =?utf-8?B?bDJzeG8zek1NR3Vhb2pCVUQ3M25iSCtwblUwSG43V1pHU1N5YkFrUHJiZDRX?=
 =?utf-8?B?SnVsaTBaWGNUeHhKeUZjclJBUU1hdzJyVzBTdHJ6bTExcVU2Vk1aUzVSNGhM?=
 =?utf-8?B?cHFpeTlFL3ltRkJuSEZuZWZSaTdTcC9tbWJ6aXk2VGNCalU5dGhDN1RKbXUw?=
 =?utf-8?B?NGNIZUwvSkdGT05sS3RWNmlwb0VUQzdFQWdsdzlnTHpWQm9CbTYrM3JaWFl2?=
 =?utf-8?B?ellvS2t1NTcxWnVpUGRXeFNuanlLNysvUXBpREloaVhjc0pEbTZjYkhUeER4?=
 =?utf-8?B?RFJBWHZkUXd4SCtBa3lZK05uWURnYmJzdHNsSGg2TkpJWFIxQ092RHYraVNO?=
 =?utf-8?B?b0VPOVpTOFNJN3RUY2RTanpWQVhReHAxcHAwTklkZHZCRkdJN2xDRTh1L3o4?=
 =?utf-8?B?RHN5Ky9tdEZ4TlN0a2lPUkMyU01TeWNVNjNGa09NOWJlSU1DUjU3R0xoZDBT?=
 =?utf-8?B?Y3A1Y2NBRjJXOThaSExhQnJRbUNzSjBXa2taSUkrYno5Sm9nOWxHaS90WGRN?=
 =?utf-8?B?T25uS1RIWkNtS0haUlgxTGsrZ3lWWWFESlUxQ3VlTmVuM0p4ZUp2TjM1d28z?=
 =?utf-8?B?dzhsaE51NHRSc0IyeitUMWUzSGNGS05tYWRtVk5CZmF1TFIzcVR6L0cweTlD?=
 =?utf-8?B?dGNJdFg5NTIrSllQVzRsSGV4S21NVWp4QVR4VE9sVE9IRndFNHgyOU9tYjlV?=
 =?utf-8?B?dDVQbnRDbFNXaTI3Z3NYRHJmeUx3NTM3bmRmWlN4TXlVZFFhWkFuNWRXQUQ1?=
 =?utf-8?B?M0RoUzV5K2ltYWdiT0pPbVBLZG1sRWlHMStvQ0F6NmtTMXhTZG14UXBvOVdh?=
 =?utf-8?B?Yytqc1RtUEJTWW5NZ1pNWm5JVWcwT1ltbzBpa0g2ODR5RlgxWEdHbVpTM24r?=
 =?utf-8?B?ei9BNnZBUVF0ZjZ5c3RRK2FhdVhEME9jYlRPeDhadWNNWEJKbFptTjZ2UEFF?=
 =?utf-8?B?bXlCQlBEUUlzS0poZVcvK0JaOWRsRG5iS3lONmZqMFpKaVFuWk9OOXZGNXdw?=
 =?utf-8?B?K0NTR3lkS3FYcnk3enJOUW9DREdrZWlwSXA2M1JYbVN4eW9TRUZ0d0sxVzFU?=
 =?utf-8?B?a0tXeEJVbFY3QVpKSjF0aG5STlN3V2R1Wkg5UCszSTNTNkZMcE56S0d3aTV6?=
 =?utf-8?B?eWZ1dHV1NVI2R1lCNW1vSXY2VTA4WmZndWdTVC81aXhaZGFhcXpGSE9ob2g5?=
 =?utf-8?B?bURmbDN6Rk1nUDQ3UmVtb0lLbnRlQ3lYNGI5Uzg1eHFvSHhRT1hNUURnVStZ?=
 =?utf-8?B?YXhkQ1M4Zi8ydlBkRHVSUGtVSzFkanlXTW04aEhTZUR0Zld4cVVvaXJvcG5q?=
 =?utf-8?B?YitpaXVaRVdPaU16UU5XUXB5R1pnaisrMjFVT1hNU08rRkhtY3pPTjV2VjJD?=
 =?utf-8?B?dHV2R2wrWk4reEVaM0RzWnJKMkI3WTdwdUoyY011MVhrTnZuWkNWMHl0bVlk?=
 =?utf-8?B?TlkwbnY5UnVJbmt3UytlSDBoVEgvcW1tSzVNV2dnYVZrTE5YUnFETUx6Uldh?=
 =?utf-8?B?NjRSUmVlOHl5MWVMWEFvaWVCcEFUUGdBUFJqQ3BUZFhyQTJXRHNmZkRrT3Bj?=
 =?utf-8?B?ZXhZQzZ5dmxCRHJBM2RvZ2d0Qm1lRUk1Z1JBZGZiaWxtdFR4YmtqcUEySEFn?=
 =?utf-8?B?WmVMSHlUaWxNQkdMTSt2MC9pSDFHenE3Q3dVOXJYaEpiMklTWkVDVE5wdzF0?=
 =?utf-8?Q?T2wndjc1+IkdL55A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b7061-10d7-49fa-20b2-08da2842a7fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:39:57.9739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlLox8+Pwh4/BO2CABKgBRGHnZwlVFLGDbthUxMc1lPTH+gw6ZPvk6kqNPbE1YVxjo9bIen7OTgXnRylFv4F2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4056

On Tue, Apr 26, 2022 at 12:05:07PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add Sapphire Rapids Xeon support.
> 
> Up until very recently, the C1 and C1E C-states were independent, but this
> has changed in some new chips, including Sapphire Rapids Xeon (SPR). In these
> chips the C1 and C1E states cannot be enabled at the same time. The "C1E
> promotion" bit in 'MSR_IA32_POWER_CTL' also has its semantics changed a bit.
> 
> Here are the C1, C1E, and "C1E promotion" bit rules on Xeons before SPR.
> 
> 1. If C1E promotion bit is disabled.
>    a. C1  requests end up with C1  C-state.
>    b. C1E requests end up with C1E C-state.
> 2. If C1E promotion bit is enabled.
>    a. C1  requests end up with C1E C-state.
>    b. C1E requests end up with C1E C-state.
> 
> Here are the C1, C1E, and "C1E promotion" bit rules on Sapphire Rapids Xeon.
> 1. If C1E promotion bit is disabled.
>    a. C1  requests end up with C1 C-state.
>    b. C1E requests end up with C1 C-state.
> 2. If C1E promotion bit is enabled.
>    a. C1  requests end up with C1E C-state.
>    b. C1E requests end up with C1E C-state.
> 
> Before SPR Xeon, the 'intel_idle' driver was disabling C1E promotion and was
> exposing C1 and C1E as independent C-states. But on SPR, C1 and C1E cannot be
> enabled at the same time.
> 
> This patch adds both C1 and C1E states. However, C1E is marked as with the
> "CPUIDLE_FLAG_UNUSABLE" flag, which means that in won't be registered by
> default. The C1E promotion bit will be cleared, which means that by default
> only C1 and C6 will be registered on SPR.
> 
> The next patch will add an option for enabling C1E and disabling C1 on SPR.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9edf3c0ffef0
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

