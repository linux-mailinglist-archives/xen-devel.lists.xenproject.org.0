Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC1635C54
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 13:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447536.703865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoTN-0007v3-5l; Wed, 23 Nov 2022 12:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447536.703865; Wed, 23 Nov 2022 12:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoTN-0007rk-2a; Wed, 23 Nov 2022 12:03:25 +0000
Received: by outflank-mailman (input) for mailman id 447536;
 Wed, 23 Nov 2022 12:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxoTL-0007re-AC
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 12:03:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19ed45d-6b26-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 13:03:20 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 07:03:17 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO1PR03MB5811.namprd03.prod.outlook.com (2603:10b6:303:91::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 12:03:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 12:03:15 +0000
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
X-Inumbo-ID: d19ed45d-6b26-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669205000;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BQQrbNel6RTWED+VCV4GUlkox+SV94ejzqtilabQk6w=;
  b=c4rOrlkuFglTLAG4SA8tR41QIfuAu2rI7DF4HfdJX6aLxA343VKk/NF6
   4RHvXlHWDpoXn9HBMsz0EO7VZY5JYs45Hnv0CxWpKP4fj/CvaWhHo1PPl
   qXzCCBDxplX9Z1co/TDEtcE5hhfTbAJU52KZl+16L4s+Wq6umgZw6UECR
   M=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 85832736
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m+6RtaBteIgivxVW/xziw5YqxClBgxIJ4kV8jS/XYbTApD0hhjcCy
 2FMXm7UP/mPMTfxeN92b4Xi9koP6p7Vnd82QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvfZmJ0px2
 +cjLHNXXjqsvb6/346Dc7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVryL33LCUw0sXXqoMG+yE2d5qm2efmGwrIiA5XmaYiPSm3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6BD3UAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ/i0zJR9M6Saqt1ISrSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:9rpCgqE+jipImL7+pLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6SEYLfI/c24+TAYegiFZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="85832736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/QaZg/AtVPTGfRp3QGx1Ju8A+ivhN/EKJps8BcR/4LnYuYGqe+h984/vOJSLzx/L/3aAMBVP9Gd28r8dvb/wYEYA8Z0yBc1ZPCevdVXyaHwQ8//6QrHQu3Z5zCCBIDi5kc3OWoPy2gpMSRv2k+xV0aRvBSXdUL6Jt/GCfibIvhNMQMHyPnBzrgn3V9+53ic9r5vpfViiplzqfOzfmEdBhbvFyaPZ7TbtiBO9ROxwCrEYDMTNth5VA+4d4imMeZouwSYI5nnd36b2p+y8hE40mPFdDbdYh84+95ydT3Cp60WUnkJu/n/eHdQrnoTeGdGERz31rYPo2MXszKhw7tStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaBc5YUtrTp/b8VA8qm2klkf++dz7OUz+9ZVGyK1Oms=;
 b=f7P7CSRWfoLuyhISsU+GoeBWcdENz8R8rur28po+YXV42/yrjEweV9+utmWCGsq8T69pJoK/F1pH6p2fcQptsSRo1VjJjSz7o9SSQDNd9+PW9hhBT03dEPWLwKQgsOgKl5QSI0wMBf8e0xW3a7qHd9OIMLA0mvvVrXRuiHCaq8VSC1WVKC253WGGbZE9dA9OUlKaSfu8Es1yeJo8F0V0iIayLu07s5znbSxXGhNLprVJz27hRU+4C+C4+6og/+1Cv116WdbOqqYZNguOHRtYJnjqxozFNUG6KSO8XvB0WZsbcAP0U3xZlW24BFJ7wsck19Mrj5i1ifNH6sT7HdyeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaBc5YUtrTp/b8VA8qm2klkf++dz7OUz+9ZVGyK1Oms=;
 b=Kp70WBUUasjngatfLCin4goyI9l9RBJ2lYlxUNcC0Zj5bqmhLTkt9nsoXhEBjhmyZVs0nVSD0p3hnBnnDsjC6ACIjQZXAKVYLkI/0Ma/YQX3FtNhOlrE/sM8HKr033OFxbPlX0ijssa1yXg+L6IZqm/2qmg+iUFMbErnhHFlAUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Nov 2022 13:03:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y34L/MwSFGUsSe2I@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO1PR03MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aae419-cd1e-443b-3012-08dacd4ab2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y1kvZDv78QXRQNsdgeh19Uh/VFNAte84OTm5MjiVUjXpIaUq/DglUOw960P527CsAGlxY2phM5WHZU6NxIac+UhtEN8YA7otiMOcUzj2VU14I5l59bsVty0yEwQuPQm0aVmFoPNvXULTtlUQ68IxV5aPUPQD6HNXsIYHxVm6AiHHwzOFLy6QZ0GBLnFMbpFWmRJz2er+Oz4E5+2MTRepFD8g5ipBvSnoihVhIp+peZj7vtYguq/9nnCfW1HbWsE00dqoBajDdZBkx1fw1bxKLxCIlI8+vt/drYCqELeTsjh/nBP8LGsUIDRF31Puq0i5J2DARHgYYRLYWbJcPqaoVkEgHYDQ6ZwCW4snGrzCc5wZhuEdnLa56p1TszYhwof0ZRRJ0DMb3eLItaZkxGkJj7clzRi1gJkp/aAXCKDThje1BepyTuYUxOnH5G6jUXt6qnUTtNP9vaWT7u/cpWzdDeQBuj6x6viasQeISHQoIfnamXzT+qyqloRS5pdbI4S1EgRB1hkKjcFSjt/JdkEJlhuc/LUgGw4KmMLplvQw186FhtgQBrPqT0yU2YCVYiopP11peL66aDkY91L2gFHkoPDfGvmGHPx8aKI+YvjJmnOsSlmnL6IWLyT7xzym0Fx33whiYR0qUwOxKjZ/3kywbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199015)(83380400001)(6486002)(86362001)(478600001)(85182001)(5660300002)(2906002)(8936002)(38100700002)(6512007)(9686003)(41300700001)(26005)(33716001)(82960400001)(66476007)(66556008)(186003)(6506007)(54906003)(8676002)(6916009)(6666004)(316002)(53546011)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Smo2emhZb0VnR1NrbUI0QzBwQXIyUFhza2poUEJKRzZHdzIrdG9jYjlLaGJu?=
 =?utf-8?B?UGVqZE9kajkyTlpBTUc2RTF3ei96ejF1V2V6NTAyeWJ4V0FrLzVhT1pwWktN?=
 =?utf-8?B?VVE2dVYwdGNLNnpTNzBBdFF6L3MxSmkyNkp5bzVTWVNsdUVTbXA5a3U5Q0pB?=
 =?utf-8?B?cWlvOTNrY3RUc09tQmMxSFpEbmN1OGhkYkxEaDlOUzRLMnBzTTMxM0lURHE1?=
 =?utf-8?B?NUdTUmhsVnR6VC9LQXBMK2lXb0dLTmhoWWJTYkVWclBJZUhDcEpQOU1saU81?=
 =?utf-8?B?aTU4cG93c0pwWC9MZUdEZzNQOWE4Um1FZjV5dHBLbEhMc3hBVVU0ZktMbXFO?=
 =?utf-8?B?QmwwWStnaGhRanRCN2Q4YTV3UHRRRFZaWDIwLzRuZURBa0dBcklqVEJtbmg1?=
 =?utf-8?B?dGNobnFHMm1zbGp6VTNmM0NLK0l6L1Rhb1MwYmIxbGg1ZWRBMVJlTURCazND?=
 =?utf-8?B?dkUvRUE0dTBZYzhsQ0E3UFJDRkRNRFRSN1J2ZUhsSnBxQUJxSVIwc3pJOWNl?=
 =?utf-8?B?SzZkdHU0MUJ3aU1WUGpsREo0QkV6MG9uSjRWRmI0blNDOHlJb0FEc3NDMmQz?=
 =?utf-8?B?UWcvWTJrSlZEMS9oSndkdTRWTmxzRmg4d1pjSjJCR0NQZ2VKeFdjSDArSEJt?=
 =?utf-8?B?NnZOdHVETTFtRG12eE5INWd6ZGROUUN6R1NUcmx4NXNKVEJZbmlTWEsvaXc4?=
 =?utf-8?B?aUNydGxLbTZUeTRFNldzZE9WeUMrM1ByZEgrKzU4UHA4ZnVmc3lZckRTakdF?=
 =?utf-8?B?VkVaOGZzNElBSDBHUC9wc3NQY3poOTNlckc3Tlp5Yi9OTHZFRjFZZ240ZXI1?=
 =?utf-8?B?TDE2ZTRQYURuRzNzU2UzbU1PNVpqUGx2M0FLZEgxU0Z4MFJ5MlVHREtZUUNP?=
 =?utf-8?B?N1pmNkpqMGphQmo4aGRyTmN3ZzNCWlNjVnJGMWgvMDRUU2RoMEwxY2lXN0hN?=
 =?utf-8?B?S0pNQVczM0pXRlBON0c3bEpsaDRNTVNpaytXS2wvK0RxQjdTSjNrL2lCOUZr?=
 =?utf-8?B?ZTVaRFRPa3BycnVlVHZmNHdvQUxlTGZwTmtiWEREQTFJR3ZQT0dydSszd0lG?=
 =?utf-8?B?aUczRERQQTg5ZDV0RHFScDE0Q2dGSHVRSnV0eXJyWHdyUnQzY01Bc2UwNThP?=
 =?utf-8?B?OFBSVFNSN08rWHNYeE1YNG5sdTg5eHA5Q2p4OWxXcmJlOUd3cy9CaHJjUlFv?=
 =?utf-8?B?Y0xkZnVuNGRkektNUXVuVlVoaHZFMHNCemw4UXlWRWI3QTFRaEphcktwZnpP?=
 =?utf-8?B?bGdBTE9HdVR0R3VmZllhTnNqUmJRMTJuUFFTUmJwSmM3Mmx2a2U1ZU5Ea0ZC?=
 =?utf-8?B?cmtuTWJmU3RkN014bVpXb2d3MDlka3p3L2k0RU5jMU1qRFF6SC9jVk5LcG5T?=
 =?utf-8?B?bVZRczh4cFozSW5BVk9zVi9yODVYb3BMRlZVM2Q0WGJHVTYrMFVPVlIxcklC?=
 =?utf-8?B?anhadjNpLzFFckZNSlNaL0hDVWZGUFdncE5yalg2M1FXa29lWjNvckJJNVdS?=
 =?utf-8?B?TWZ4WU8vNThlTUVSRmNhYXRzUklXcDRXekV3QWp6SzZLc3JuNW5WYW5ac1pP?=
 =?utf-8?B?ZkFyUnllZHd3MktvdFZkek4rWmdKeXN2bjdmc0hyaUkzVnN6MHdRd25rTWNv?=
 =?utf-8?B?M0dsdkk0a2oxY1QzbTZJVmVtc0pYSEl1K0NET1RVK2dsVThFcFZrNFNZSXMw?=
 =?utf-8?B?MDg4Tm8xWDJacnhCY2E5TVNnaWVTMmZNcnI0SmE5S3lrcFhFRGExNFY0MWdK?=
 =?utf-8?B?dEQ4NVk2SDFsV2lrTEFkNkZFKys4ZTAwbXBqL21EaDVaVE1MQ2lVc1I0ZWNW?=
 =?utf-8?B?MDJQbEZWbEdnZ1REQ3h3V2cwemt2ZmhDdXBHYTIvWFRmSVlaNXBtdGQ2TUJw?=
 =?utf-8?B?akoxTXdGVDEvRjhBbU44RGRWNUMzNVhuNWhHTWVvMkRZWjQwTElwZElrTTI1?=
 =?utf-8?B?emNqcmtlQytBYmgrS24rS0dPaTFQRytmaFNZV09uUUxzdjdlTkJmRkxxUThk?=
 =?utf-8?B?eUhwSW4yZTdybnFaR3dHSjhUVEd4Y1BpR3cyQ2VmbGxvSHpveHVMdDNIbWh3?=
 =?utf-8?B?UDA4aysvQUFMRExrMnh1OWQxc21iT3FESEFrS3NqSldrdHpOcGd1aUxEWlZw?=
 =?utf-8?Q?hMjAJldWdHHhitepo5tFIVFQg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	np1kKjZM+61cNllZzge0cBZ8NTwDPgnHg77+vSyTXvI8svJY4f7fLeQxUxRD5MSsygukk7SiMuWPJQcashTxty8GdUHgl++9LWVprO9P07oMDOv7uLEdbIMWDFLigrW5tilLSucrQ1to4fvAL8ZwcE1Njv7y66JUXmW1LMl9WeKcMOwAOfKj3ywnXj4/jei0jPwSPay3r8KSVPmqSIonLsxfN68UebpBxrn76lIl0v+mu+kb9CfS6uBCtlWSYJJFY992P7rxI2SWCMG3DLd3E53KNUedLN1OSjhzMvUkxHOX7kv2QuukzPSLcFin/Cmt0ZSAwRy8d1jEJy5wCTudOUQt0L8FAds80U9F9nDQuWSC7/IgLB5lYlBnKy9+1ZFOJ2+ORiNVf7jBrKPv0zewb2zR+cxYgGvKaJyhcNzOF/+rge0NSLi0gduvCoYG79enyOhVFQQ69HwaXVYek21j/76iAE502zRKpB+biwln3fgfL4kgPR6PElutzQYY4VqITPW+Q8Ei2yffQGcSdyGIaA0fMZd3dcly3TxEmVa8Pn+6Dmn6jadd7VfmnJ8HK24bUPC3I9kPX7/g2ORrO69KvG9RDgSfyh+4v8R5DBaRiTogiQJbZWWY4wOmk8Zgswg3l89NN3COGVdTIqm21bxrseMf3EgIY7LX9hk10/Nh2r0XF8UUoIyFE/bfJL7Auh7qjXEaqtjOlPpUl+m7XNqAgswEWZxGhKA9FA/vJ8JNg45Y3yW4FwyFdGNTRBzn9KT1WxgsjRBincJJVMXCy9BvtP80elbqxKdIIX6pxPJERggQ/5nn3QqPf4Ovjgon6euhxAhswe7RswaffKpvESszmKkbfXWV5elMI5pWq8gRbe0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aae419-cd1e-443b-3012-08dacd4ab2f4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 12:03:15.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKYD5imbSMr8nNrs/6+h6DsgZtAMyc/rY/3aJJe1uy7d+Ywxy8AGWvTA33GVRJpPYncU2vx3Sd5Q+TprDm1OTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5811

On Mon, Nov 21, 2022 at 01:34:38PM +0100, Jan Beulich wrote:
> On 21.11.2022 13:23, Andrew Cooper wrote:
> > On 21/11/2022 08:56, Jan Beulich wrote:
> >> On 18.11.2022 15:27, Andrew Cooper wrote:
> >>> On 18/11/2022 12:54, Jan Beulich wrote:
> >>>> On 18.11.2022 13:33, Andrew Cooper wrote:
> >>>>> On 18/11/2022 10:31, Jan Beulich wrote:
> >>>>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> >>>>>> exposed a problem with the marking of the respective vector as
> >>>>>> pending: For quite some time Linux has been checking whether any stale
> >>>>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
> >>>>>> This check is now triggering on the upcall vector, as the registration,
> >>>>>> at least for APs, happens before the LAPIC is actually enabled.
> >>>>>>
> >>>>>> In software-disabled state an LAPIC would not accept any interrupt
> >>>>>> requests and hence no IRR bit would newly become set while in this
> >>>>>> state. As a result it is also wrong for us to mark the upcall vector as
> >>>>>> having a pending request when the vLAPIC is in this state.
> >>>>> I agree with this.
> >>>>>
> >>>>>> To compensate for the "enabled" check added to the assertion logic, add
> >>>>>> logic to (conditionally) mark the upcall vector as having a request
> >>>>>> pending at the time the LAPIC is being software-enabled by the guest.
> >>>>> But this, I don't think is appropriate.
> >>>>>
> >>>>> The point of raising on enable is allegedly to work around setup race
> >>>>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
> >>>>> and the stated behaviour is to raise there and then.
> >>>>>
> >>>>> If a guest enables evtchn while the LAPIC is disabled, then the
> >>>>> interrupt is lost.  Like every other interrupt in an x86 system.
> >>>> Edge triggered ones you mean, I suppose, but yes.
> >>> For IO-APIC systems, you mostly lose line interrupts too, don't you?
> >>>
> >>> The line will remain pending at the IO-APIC, but nothing in the system
> >>> will unwedge until someone polls the IO-APIC.
> >>>
> >>> Either way...
> >>>
> >>>>> I don't think there is any credible way a guest kernel author can expect
> >>>>> the weird evtchn edgecase to wait for an arbitrary point in the future,
> >>>>> and it's a corner case that I think is worth not keeping.
> >>>> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
> >>>> after setting upcall vector"), referenced by the Fixes: tag? The issue is
> >>>> that with evtchn_upcall_pending once set, there would never again be a
> >>>> notification.
> >>> Ok, so we do need to do something.
> >>>
> >>>>  So if what you say is to be the model we follow, then that
> >>>> earlier change was perhaps wrong as well. Instead it should then have
> >>>> been a guest change (as also implicit from your reply) to clear
> >>>> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
> >>>> enabling (here), perhaps by way of "manually" invoking the handling of
> >>>> that pending event, or by issuing a self-IPI with that vector.
> >>>> Especially the LAPIC enabling case would then be yet another Xen-specific
> >>>> on a guest code path which better wouldn't have to be aware of Xen. 
> >>> Without trying to prescribe how to fix this specific issue, wherever
> >>> possible we should be trying to limit the Xen-isms from non-Xen areas. 
> >>> There's a whole lot of poorly described and surprising behaviours which
> >>> have not stood the test of time.
> >>>
> >>> In this case, it seems that we have yet another x86 PV-ism which hasn't
> >>> translated well x86 HVM.  Specifically, we're trying to overlay an
> >>> entirely shared-memory (and delayed return-to-guest) interrupt
> >>> controller onto one which is properly constructed to handle events in
> >>> realtime.
> >>>
> >>>
> >>> I even got as far as writing that maybe leaving it as-is was the best
> >>> option (principle of least surprise for Xen developers), but our
> >>> "friend" apic acceleration strikes again.
> >>>
> >>> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
> >>> because microcode may have accelerated it.
> >> But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
> >> VM exit.
> > 
> > Intel isn't the only accelerated implementation, and there future
> > details not in the public docs.
> > 
> > There will be an implementation we will want to support where Xen
> > doesn't get a vmexit for a write to SPIV.
> 
> I see.
> 
> >> If we didn't, how would our internal accounting of APIC enabled
> >> state (VLAPIC_SW_DISABLED) work?
> > 
> > It doesn't.
> > 
> > One of many problems on the "known errors" list from an incomplete
> > original attempt to get acceleration working.
> > 
> > There's no good reason to cache those disables in the first place (both
> > are both trivially available from other positions in memory), and
> > correctness reasons not to.
> > 
> >>  And the neighboring (to where I'm adding
> >> the new code) pt_may_unmask_irq() call then also wouldn't occur.
> >>
> >> I'm actually pretty sure we do too much in this case - in particular none
> >> of the vlapic_set_reg() should be necessary. But we certainly can't get
> >> away with doing nothing, and hence we depend on that VM exit to actually
> >> occur.
> > 
> > We must do exactly and only what real hardware does, so that the state
> > changes emulated by Xen are identical to those accelerated by microcode.
> > 
> > Other than that, I really wouldn't make any presumptions about the
> > existing vLAPIC logic being correct.
> > 
> > It is, at best, enough of an approximation to the spec for major OSes to
> > function, with multiple known bugs and no coherent testing.
> 
> But can we leave resolving of the wider issue then separate, and leave
> the change here as it presently is? Yes, mimic-ing the same behavior
> later may be "interesting", but if we can't achieve consistent behavior
> with yet more advanced acceleration, maybe we simply can't use that
> (perhaps until a complete overhaul of everything involved in LAPIC
> handling, possibly including a guest side indicator that they're happy
> without the extra signaling, at which point that yet-more-advanced
> acceleration could then be enabled for that guest).
> 
> Otherwise - do you have any suggestion as to alternative logic which I
> might use in this patch?

Maybe the underlying issue is that we allow executing
HVMOP_set_evtchn_upcall_vector against remote vCPU.  This could be
solved by only allowing HVMOP_set_evtchn_upcall_vector against the
current vCPU and with the LAPIC enabled, but I guess we are too late
for that.

Actually, what about only injecting the spurious event if the vCPU is
online, ie:

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae4368ec4b..4b84706579 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4105,7 +4105,8 @@ static int hvmop_set_evtchn_upcall_vector(
     printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
 
     v->arch.hvm.evtchn_upcall_vector = op.vector;
-    hvm_assert_evtchn_irq(v);
+    if ( is_vcpu_online(v) )
+        hvm_assert_evtchn_irq(v);
     return 0;
 }
 

I think that should fix the issue seen on Linux.  We would
additionally need to fix hvm_assert_evtchn_irq() to only set the
vector if the vLAPIC is enabled.

Thanks, Roger.

