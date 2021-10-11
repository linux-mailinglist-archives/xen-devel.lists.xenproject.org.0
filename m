Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17030428DAE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205983.361431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvBL-0005op-71; Mon, 11 Oct 2021 13:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205983.361431; Mon, 11 Oct 2021 13:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvBL-0005m7-37; Mon, 11 Oct 2021 13:17:31 +0000
Received: by outflank-mailman (input) for mailman id 205983;
 Mon, 11 Oct 2021 13:17:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZvBJ-0005m1-SN
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:17:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9463722f-2a95-11ec-80d9-12813bfff9fa;
 Mon, 11 Oct 2021 13:17:28 +0000 (UTC)
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
X-Inumbo-ID: 9463722f-2a95-11ec-80d9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633958248;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h1PNIs28iq9z8+ycWKobWGlysNYsD7wmvQ07mwMGWik=;
  b=atN327X41eOG+3dK5OTxdg7o9BW/g5A1yGbzCKzoYGQClXnXE96DlWyJ
   mdZZoj+4eHv/il8raK95I8SoQQO3bOxZYiBOcD7HYN4IIOHONDUz1JWL8
   RfeuSiYpuLhzzN17XQO1HkNE6qJlxub6T490vbCJOtoEK/4uW2/1M5fvu
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QZViAazBXSKjy4f+DxiY6ZamcCNS4RiPB3sq5/3NejHpS6bQhDwxzQ7SuZJv6zF+RaXx/UC9ZG
 cLuvS/E/iCZPUX4jiAvpVpidTbwkx4GQjyL+U0Rn7rSsyjrhHInb14HvRK+D8l2ojPUqp5Wvni
 tvki9X5dgsfNd4I8rLO1cuksLzqY2Vt1y+yxgmwWPy3HWUJEcm4ZKBXbx4PuQuETu9gVz3bKNd
 OfrqcL9xPqFmCy777NYvHwPmS+WTYPk5wxmqL3ChDiQOEUMFj0ViYnTCFlcahgvo7bTzWrdSAj
 mlEVdgJKAp5QPdFRTGt/1ngl
X-SBRS: 5.1
X-MesageID: 56747344
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BqK/Va9yVhiXEGoRmbXvDrUDtXiTJUtcMsCJ2f8bNWPcYEJGY0x3m
 GRLDz3TOv+JZzH9f9EgO9yyoUNS68fdzoUwHQRlrC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhx5
 4hSlN+rFj0nHf3UiuEFYwUAOAZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgmhs2ZsSQZ4yY
 eIzNgpIXB/MZCZwI34FF5MivuvzlljGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkeHp
 ErW8mLhGBYYOdeDjz2f/RqEiubRkAvhVYkVFbn+8eRl6HWI3XAaAhASUVq9oNG6h1S4VtYZL
 FYbkgIssKwz+UrtQcP0Wxn+p2WflhEZUttUVeY97Wml9K3Q5AqIA3keeRRIYtcmqcweSCQj0
 xmCmNaBLSZmsKCRD2mc8LiUhTqoPG4eKmpqTSoFRgsM55/kupM+ijrGVNMlG6mw5vX3Ezztx
 zGBrAAlmq4ey8UM0s2T1FbLmT/qnoLbXxE8/Az/V3igqAh+YeaNbYGy9ULS6/oGKY+DV0SAp
 1ANgc3Y5+cLZbmdmSrITOgTEbWB4/eeLCaakVNpB4Mm9Tmm5zikZ4843d1lDB43aIBeI2avO
 RKN/1MKjHNOAJe0Ra9YPp2QSN9196bDRcz3U+jkcoJlRYckIWdr4xpSTUKX2mnslm0lnqc+J
 YqXfK6QMJoKNUh05GHpH7lFgNfH0gh7nDmJHcmqkHxLxJLHPCbNIYrpJmdieQzQAEmsmw7S7
 8pEf/WDzxFSQYUSiQGGrNZNczjmwZU9bK0aSvC7lMbfcmKK+0l7Upc9JI/NnaQ/wsy5cc+Sr
 xmAtrdwkgaXuJE+AVzihopfQL3uR41jinkwIDYhO12ls1B6P930vPZHKMJuIed8nACG8RKSZ
 6JfEylnKq4eIgkrBhxHNcWtxGCcXEXDaf2y09qNP2FkIs8Iq/3h8d74ZAr/nBTi/QLs3fbSV
 4aIj1uBKbJaHlwKJJ+PNJqHkgPg1VBAybkadxaZfbFulLDErdECx9rZ1aRsfanh6Hzrm1On6
 uphKU5A/7eS+NVprIChaGLth97BLtaS13FyRgHzxb23KTPb7iykx4pBW/yPZjfTSCX//6DKW
 Amf562U3CQvkAkYvoxiPaxsyK5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMbslTtihcjPtucoDpT8mCAci4JX6k978lIC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxObIXQpFHXL0e5Mvrg0uUhHnA0YOlCEutvZnftrjhdfxis6E1ZOxRJd3uMtZ
 mUybx9pJb+D9itDjdRYWzz+ABlIARCU9xCjy1YNk2GFHUCkWnaUcT84MOeJuksY73hdbn5Q+
 7TBkDTpVjPjfcfQ2CouWBE696y/HIIprgCSytq6G8mlHoUhZWu3i6CjUmMEth/7DJ5jn0bAv
 +RroL59ZKCT2fT8eEHn5112DYgtdS0=
IronPort-HdrOrdr: A9a23:XodFUKpc1GrR5gPp7kD2rzoaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="56747344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn6G1J8AJEi3ixvxxfzbXjlh6nS7O6OAvjeymku4YXS8celTJu+0i2CZkfnDHOuOUjLhfj/rPEC04g4BxcNzhX2xj1DVodsMsrYNMNNzDK+JDLxsF6Wyi+vl4TuWDg7r9DfJL++VbKsazMHaT/U0JMEO2o63r8kpSYosYlYM46QgbDRY53TL3RQ4taixqn2Iis27DZv+0uY5U6NvPzvbYPzNbOX+Soccrqit4fpEcxrOUgdve4w2sCpjgPlcqDu49PAdSASJw4JcFeGsb3CDOAuM37GgOnJmkXDQoP8hkSJYJybWETb9pSMn8U87TiXAHXjrDRxk3w0YglgyYSD+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4IVm4e8aLEZT8pfyEP1KCLbduIfA272QU6Jxh4+OZk=;
 b=Z6IKhor3lG3RWtZ6lwsXIoJjm0VxOQ6o7KnjAhxQEZZDQTFi4E5jJncjNeONCBXIHoHGemfIJLMcbMEWMuk3MEjy39SgZmRgY8Tk5PHCLiOQ2HoNNPE1lj7aqtEiRLXOyp45MnpYc6wXJIeic2XDwrTclwY3bPwEnN2mXZPxEODd+BwvWtYTuKY04an+mNxk/AZwe5syw43Xgj5WFdO8uN58wmZRqtL+8l9WzraGq9/ODrYlEfjhlwLKIcD1UEfxbfErOlNJ9lb1guFVOBTwEA4J52XahU0O4ep77PGB4/ZZZiI2QJvmQmJijXt5tDIcmp2Tps0eVAiY7SZjKOdPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4IVm4e8aLEZT8pfyEP1KCLbduIfA272QU6Jxh4+OZk=;
 b=qc8Wvklgk5la7K7+HZifQ/H3D65D0ujJ+y3J392A2c5PbVEg7WFjMzO3jImyUcKmpp8J17G9CNxQRYr++A0y8fnlu6OhBfFtPxluCRUd0zqcFa7hH+04IFYIImsTE+kGG45QVjQa7pw4AB9PC2V9cnGwrtaTQ/sSWYInY0F9i/0=
Date: Mon, 11 Oct 2021 15:17:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Michal Orzel <michal.orzel@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Rahul Singh <rahul.singh@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien.grall.oss@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <YWQ5Valvu374f0fn@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
 <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
 <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
 <8a58a981-f474-cf6d-f16a-46805384a776@arm.com>
 <b084240e-cba5-4b20-5eef-f21915cfce2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b084240e-cba5-4b20-5eef-f21915cfce2a@suse.com>
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1fbabfa-bf7f-4f7d-ea88-08d98cb9715c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5081:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508105CAF1D21EFE039FF9E28FB59@DM6PR03MB5081.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPa1QjUnZY/Vg2VYACFhm2yQMh4uQub1OwjDghtN9BlMSCnYlPrnfLHy4kMpTWfGkfqn3orhzzJWWztzEAGNxHnEHafowjHNFW4chS0k1ZxiW46ahP/gvaS6Isch0p3CW+Ic6snj25MXZ0+7tN4v77FTTdn2Qv+zB2fVeX3IK6JcZIoeSiDsZ1UMc17LBbSgHUxxvu+O33smv97d+eFEJY87dZF49NuEdU27MbWOnlOJF0vK0qGFhV+nzSMrhlGWFz9l34jrYgPcCbxNZ60RKgLthZyTRzKGttOiLv+G6M4k+tLKd3EXtoefo9MWLYJqNNMb5FuUled1q0QxWu9GJv3biBih7e0rqojEAU/5AwFbMZHj0nqB7AMWQRG1vUmqowyQTKWdLNJioYKEAIweAxY/oOnwjAYUQGQ87v2WmKJNgeeGtEfF/zArNIDHtU8dZP3/dWEKRfnhg5lRsFUUymSzqal7wYylyzd+DFOk/C41LK0x5WIU5/uB559XLYkVA6EXWV/60LuP8VxFDtqLVS4HiuRAI1CiunTvkl0a6eeD9RWCV1h1vC2ZQje7uq0aD4Hr2ygetSXBnTXKnCFYcovkirZnk1RAnpTEV8oYQhdskDJfLJoVdkejulDz8FeDiyv96MRco20jusqNq5ZT/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(508600001)(54906003)(2906002)(6916009)(6666004)(6496006)(66556008)(66476007)(6486002)(26005)(8936002)(66946007)(53546011)(8676002)(186003)(9686003)(83380400001)(86362001)(4326008)(316002)(7416002)(956004)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWFIY0pvWmxpQjY2blhVWlJMMzF6MHU1cGk3MlJFLzVsU2lNdjFuM282d044?=
 =?utf-8?B?b1JxUG4wYlB2d0FrVjFKSGRBWmNRdSsvZXRsenlQeHZGSzNBRlN5Z2lWbGtR?=
 =?utf-8?B?Vm13RktFMjlLdUQ2WHlCRFpYb28vbkJOWVljVk1oT3g2bmQ5ei9vM2JNOUVx?=
 =?utf-8?B?ZmxEeFBCWHMvVUtKczBaZTl5VldLNENadTY1djIzVThsYkZBVXZZMmZvYkNw?=
 =?utf-8?B?VjVSbmh6cUVhV2Q2dENueUY2WnJHcGhBUVVTVm1yOVp2a2xNM2d5bVFuODh5?=
 =?utf-8?B?RmE3L3YreHVjb2tQVWpkb0pCUEVmeXorZ0JZdHFyYS9xdHdIdE1tT203ZnJ4?=
 =?utf-8?B?KzhSRkNkUDZZSEp1djZvNnVZMW5IcmdtMTE3dHBNTHpDZDU3RE9MR0o2bEhN?=
 =?utf-8?B?TDNMK1BtWFRzNytxcVpYalA0TWd6eEFrU3lKbUtPdWRBeVJGSWtybU9KbDdD?=
 =?utf-8?B?VGV5ZndtbnhNT3NwSHJwZDZSWU5YVHd1Tm5WaGdON3ZpSEFYR1ZIVnZ6WDQr?=
 =?utf-8?B?MFlIcmE4NDdPZjI0TktHa0xybjh6SFE2WlNDMm9YaGxvcm1qOUp6TENXMW9L?=
 =?utf-8?B?N1ozRUgrbWlQenErQ3FGZzVuMXRNc2lxU1FnL1k1ejRQMzBLQ2V0clN6NVA1?=
 =?utf-8?B?am9SbU51bFVrWmVLbWRoRHBVQW9qSE9TNWR0L1NWOWNLd3Bjc3FVRjB6UDFn?=
 =?utf-8?B?cVRmUVpQU0xQVG1seGZXR1ppRzRXR1p0U3h6WFA0eG84U3JFWklKdllCS1ls?=
 =?utf-8?B?M3R0clVHTExFMlBqTEhBOURSSnExbk1qbmlhSXU0K1BHbU52aE5MWGVCL1ZO?=
 =?utf-8?B?UjBzZlMwUHFWM3ExQmlFcFBFY2dMT2FEZWZDSnNLRHBhZFVrMk03M1o3T3Y3?=
 =?utf-8?B?SXRTSHUxU3FRZEZlMTdaMXdqcThvMFBFRnYrQUJtQjhrSmREbDBZQ09ybkZR?=
 =?utf-8?B?TEErbVFLaWtJVGExUCs2VjNBTEdsbDBmYURYTXZsa01rOGEwcmpOSHVWNDhL?=
 =?utf-8?B?MVFVRmdFTVpETDRkSkN2dUZLcFdPV3FNYmtVMHpuT2dTY1VLTnJnVm9TNjgw?=
 =?utf-8?B?RmVnQkZhK3BTSlN0dUhhNi95cnBmZzYzZnNQNWp4dU1hOEtBekJ0cmUyM2Jh?=
 =?utf-8?B?T3ZzRDlHUjc2K1ZFbU03R2JRdWtibW1Ra1krcTViTWE5bmJJSjlNYUNyNE1W?=
 =?utf-8?B?R1llajA3K1RKT2JWSURCeDRiem1iK1Q5bi82OXNiODVuTm5ncERQdG9NZjc2?=
 =?utf-8?B?RytyTlZSSDFtdVhqSTZxYmxrbUFrakx1TnhkYXk2QkhoQ0VoM0l5dU5uQWVk?=
 =?utf-8?B?NFNOcGxLTU55aVBuVUhiekFYMDZrQ0hQc0UxRllYQWVSQUpuV09WV043TEhU?=
 =?utf-8?B?MVVCSkVqVTJxZVpEekJlczlFNGIyK0NpTEJNOStQM0M5RWxaa3gxWEI2d3RO?=
 =?utf-8?B?WkJ0UlJSRmkzbVlYMHNWbEpMK1M3YVlPZ2VIWmJPd09MZGFpRFJyRjJHTDcv?=
 =?utf-8?B?ZnJXdU9GSDU1UE01ajZJWW9pTGpJZGlZNDlEb2IzMnlZN2p0dHNEN0xLTFRD?=
 =?utf-8?B?UExhZm5QdldpZzc0V0NKYVp3WnF2cE5kNm9LdkVlK3owMWdqT2t5cVp0NUk1?=
 =?utf-8?B?TGxod3l3N1ZNRHBhSnQyQUFTaHFEcE1IUnQ1ejkvczNvZXRUMlpzM0ZObzBG?=
 =?utf-8?B?SWdEVkxKcnVQY2dQUzRGQUpSMXArK1hidlk1UHduZ0tKK1FzNXlraWF0S1Ew?=
 =?utf-8?Q?1NNMp4qsnaKkVi/ww7R3MGIueUbHKxiNQthooEv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fbabfa-bf7f-4f7d-ea88-08d98cb9715c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:17:15.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyhbBVho25h/wzaXhi14Wf1tay6QJjUABqD00UXzWr2HVavUJ+QQntmG6RsunR5VUCaQ6KyK1WkDv91eEb/Dtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5081
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 01:35:18PM +0200, Jan Beulich wrote:
> On 11.10.2021 13:29, Michal Orzel wrote:
> > On 08.10.2021 23:46, Stefano Stabellini wrote:
> >> On Fri, 8 Oct 2021, Julien Grall wrote:
> >>> On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:
> >>>       On 06/10/2021 18:40, Rahul Singh wrote:
> >>>       > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> >>>       > Reject the use of this new flag for x86 as VPCI is not supported for
> >>>       > DOMU guests for x86.
> >>>       >
> >>>       > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >>>       > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>       > Acked-by: Christian Lindig <christian.lindig@citrix.com>
> >>>
> >>>       I'm afraid this logic is broken.
> >>>
> >>>       There's no matching feature to indicate to the toolstack whether
> >>>       XEN_DOMCTL_CDF_vpci will be accepted or not.  The usual way of doing
> >>>       this is with a physinfo_cap field.
> >>>
> >>>
> >>> I am slightly puzzled by this. I am assuming you are referring to XENVER_get_features which AFAICT is a stable interface. So why should we
> >>> use it to describe the presence of an unstable interface?
> >>>
> >>>
> >>>       This flag needs using in Patch 10 to reject attempts to create a VM with
> >>>       devices when passthrough support is unavailable.
> >>>
> >>>
> >>> May I ask why we can't rely on the hypervisor to reject the flag when suitable?
> >>>
> >>>
> >>>       Ian, for the 4.16 release, this series either needs completing with the
> >>>       additional flag implemented, or this patch needs reverting to avoid us
> >>>       shipping a broken interface.
> >>>
> >>>
> >>> I fail to see how the interface would be broken... Would you mind to describe a bit more what could go wrong with this interface?
> >>
> >>
> >> After chatting with Andrew on IRC, this is my understanding.
> >>
> >> Today if pci=[] is specified in the VM config file then
> >> XEN_DOMCTL_CDF_vpci is added. If Xen doesn't support it, Xen returns
> >> an error but libxl/xl won't be able to tell exactly why it fails. So xl
> >> will end up printing a generic VM creation failure. Andrew would like to
> >> see something like the following in libxl:
> >>
> >> if ( PCI_devices && !cap.vcpi )
> >>     error("Sorry - PCI not supported")
> >>
> >> So that the user gets a clear informative error back rather than a
> >> generic VM creation failure. Also, this is a requirement for the stable
> >> hypercall interface.
> >>
> >>
> >> I think that's fine and we can implement this request easily by adding
> >> XEN_SYSCTL_PHYSCAP_vpci. Rahul or Bertrand, are you guys happy with
> >> doing that? Otherwise I could take it on.
> >>
> >>
> >> As a side note, given that PCI passthrough support is actually not yet
> >> complete on ARM, we could even just do the following in xl/libxl:
> >>
> >> if ( PCI_devices )
> >>     error("Sorry - PCI not supported")
> >>
> >> or temporarily remove XEN_DOMCTL_CDF_vpci until PCI passthrough gets
> >> finalized.
> >>
> > As Rahul is on leave:
> > I'm ok to introduce XEN_SYSCTL_PHYSCAP_vpci. I did the same for vpmu so it's ok.
> > However the problem I have is about setting this cap.
> > On arm it is easy as we are not supporting vpci at the moment so the cap can be set to false.
> > But how to deal with this cap in x86 code? I'm not familiar with x86 so I'm asking for advice.
> 
> As the sysctl is mainly from tool stacks to drive guests (DomU-s), I'd
> set it to false for x86 as well. Roger - do you see any reason this
> could be needed to express anything Dom0-related?

I agree, I don't think we should set it to true unless we also support
vPCI for domUs on x86, or else it's just going to confuse the
toolstack.

Thanks, Roger.

