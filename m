Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4E3692DE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116332.222043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvh3-00043R-87; Fri, 23 Apr 2021 13:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116332.222043; Fri, 23 Apr 2021 13:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvh3-00042n-4k; Fri, 23 Apr 2021 13:18:01 +0000
Received: by outflank-mailman (input) for mailman id 116332;
 Fri, 23 Apr 2021 13:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZvh2-00041x-64
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:18:00 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a390c05e-6e58-471b-8442-8fb78069088c;
 Fri, 23 Apr 2021 13:17:58 +0000 (UTC)
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
X-Inumbo-ID: a390c05e-6e58-471b-8442-8fb78069088c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619183878;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=P4lmiEH14pV94/hbtSRprs0RNsOZbJwvdx7dOzkfknM=;
  b=WovmMjurOYFtEIsQ6OYJLtZcdxAC909E0B11nTNnVp2GJ+rxm6smRS6t
   faQiLgsf5z5jZpClTquI1eh1BpwY3dwu9QZgiIwQI4N523q/HzmdbUcpA
   EtheTZ+VEMywLO6A5eUGgWTuYjDF46yFhCnLOYNYRiIO/q+qUNIh0dY74
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s/Xg8xFcR4ey//XJHAsW9uyT1ynxSSAr4jyxNtgk0gvFZBl0+yb9b78IOZa0N57SJMRpXL8f0t
 /1dPFtbgjc1JQtUYd/0yyRBg84/Udm0BtzbH+u0zFwPRy8vymCI9JdY/3TgY+6hzJfZ5vcLTWi
 nTBgchq0xV89B0i7ZfcbL67b4cswJZtyTyTFNevTVng9CSt5zzmzsHEkJM8PUZEyRFaj+1r0me
 6mhJh615I4Bd+qWPZ+7A20BU2iKVR+N/Bq3I+3+zIA3nMEcUMkXWleuTB8MqWjSP1ZHez9zc5i
 vM8=
X-SBRS: 5.2
X-MesageID: 42269754
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gYsrcKN85J56LcBcT3/w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfX7B1RikILe6A63D94vzLC8gd2VrM31pk0dKD1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 ahz+BAoCetfmlSU9SjChA+LqT+jvDotLajWx4JABY79BKD5AnH1JfWGwWVty1uKg9n7qwl9Q
 H+4m/Ez4Wl98q20xrNk1LUhq4m4ufJ7vtmKIiyhtMOKjPq4zzYK7hJf7GZpjg6rKWOxT8R4a
 HxiiwtNchy9H/dF1vdyXCGumnd+Q0j5HP4xViTjWGLm72DeBsAB9dcnoUcSxPF6iMbzYhB+Z
 hW1GGUvYc/N2KloA3B5sPFXxwvtk24rWtKq590s1VjUJATYLIUkIoH/Ek9KuZmIAvG7ukcYY
 tTJfCZwMwTXUKRbnjfsGUq6serRG4PEhCPRVVHktCJ0hBN9UoJgXcw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBe82qEWbAKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DnXE5Hs3UxP2bjE9eH0pEO0h2lehT8YR3djuVlo7RpsLz1Q7TmdQeZTko1rsemq/IDRsLBXf
 K+P49XHu/jIWPiFZ0h5Xy9Z7BibV0lFOEFsNcyXFyD5ujRLJfxi+DdePHPYLrheAxUH1/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZ1GKje9O4D1ZgVOuR3w0wooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuN6X5oNBpbBkNc+67hTHtOuA8PPyrPAPU+kuTaXVoX8GqMJxd5Qc+TOh
 VYvU5L9aW+KIHV2TovEMu9MmWRj2IaoXWDS5t0oNzF2e7VPrcDSro2Uq14EgvGUyFvkQFxsW
 FZdUsvXUnEDA7jjq2jkb0ZDOzSbMNHnQ+uOMJYwEiv83m0lIUKfD87VyTredOLiQwuLgAk+W
 FZwus6uv68vhqBbUE4m/81NVVQbn//OsM5MC21IKNOmr7qfwlsS3ytnjLysWBqRkPj61gSim
 v9LSedZPHMBR5HtmpF17vxmWkEB1m1bgZ+bGt3vpZ6EnmDsnFv0fWTbq72yGeJbEAeq9tteg
 3tcH8XIgl0wcqw2wPQkDGeFW8+zpFGBJ2UMJ0zN7XS0GiqMouGiOUPGOJV5o9sMJTrvvUQWe
 ySPw+TIzWQMZJj5yWF4nIkMjJzsn8qjLfh3wDk9nGx2DonGuXJSW4WMI0zMpWZ9SzpVvyI2J
 J2gZY8uvaxKHz4bpqDxbvMZzBOJxvPqQeNPqwVgIERubh3uKp4HpHdXzeNzn1B0RkkJMr/lU
 8VQs1Akfn8E54qe9ZXdzNS/1IvmtjKMVAitRbuBPQiOV4qlH3WMrqyks71gKtqBlfEogT+OV
 OSqXIAu/jEWjaOzr4cBeY7J39MZE019XRl+6eDeuTreXeXXvAG+ED/NHm3NKJZQuyCH74bqx
 5h+dGGn+ONbUPDqXbtlCo+JrgL6nqtRMO5HRmFFuFJ+cGrIFjkuNrY3OejyDPsDSahY0sWhY
 dZZVUdY8RKhD4llpA22EGJO9nKi1NglUBf7zFhnkPs3Ybj4H6zJzA3DTHk
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42269754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwMqkiXYq6/t+6JJ7LIsx1rsAW09UZxTDWs8mT2oXuYayMPknmTyRqx5nGHKelFLbkq4cNd3hVOUTcXPX85DzmZkOPDDHdZ4wuH8qdO7zaGVvIxhFhI4ZBo8PzhP8W4kvZaZLgI7ln5jxYAbcGiduZ1yo3vRwAiDah+ff+uYlS4PcG4FbwF/Q41mAqHAXzbXJsVEFlS2Er+t6FHrRrmyzLXhC1L5MlOA7Hzb05ZsyOkOvsx1Sj+alR0qgKcMGfIhN9sRA3GJuRv9pSBhMqMK3hV9dIfgA961PdR0Rvso8kMsnb/1vkqI1MYbkLPYkbc0BNRuWkaIKIIUj4qh3n4CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p/Ut8DacIxUWFHt2eeL0cnHg88Tl8H2rMUHE2PjCrA=;
 b=DYD8YZtHCd+ThgQwF3xcbFTlXTyF/+NwgzNaOK9fZgVcoa8ZdMOtBSWQeZIRke9Z4Z0JjxdiTDhlhcIMceaOcacgPEzaQHmUVtEycUBcMtRyGgP+yZqL7jMJ9s6ZXvdIST2x92el3jfcV+IBRW3AjQg9N1C68PAyvXW4nAS/Y6Epm2siE0t5YsjcT6vWWm193pqoE5GlUwD/vhPE2G6T3fSbN4fDCpYDiJdvMMJrRyB24yOySapJEVkWZZhL4XaqlPo16mTXatwc+RlzKW2XxHvSk9Rx0/rAS2M9MeY03ONBrg2Y8pfeFugb6mw1VxgnqHKVl/wuetP8x4Iicwf1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p/Ut8DacIxUWFHt2eeL0cnHg88Tl8H2rMUHE2PjCrA=;
 b=XQypLrHN6boKpa4Yx6V5mHnBsP3kMG2+rAb3//XHe2iWmlV+He3hLCAkG8szd7aOYOrs+DabhVLfbI3F0gdWiWyLNGnRq3ibNZgCPx1PuMiEYZ7lxFM1gjmwCjsJHOTMSveRISgNEXrgxMyjZNnoe0uA1oN6zD39rM3aNu2O6us=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/cpuid: do not expand max leaves on restore
Date: Fri, 23 Apr 2021 15:17:47 +0200
Message-ID: <20210423131747.10308-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae8e7600-abfe-4e56-e841-08d9065a3546
X-MS-TrafficTypeDiagnostic: DM6PR03MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB46817D61B0D3EF99F832CB6E8F459@DM6PR03MB4681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xuXwLPxac0xlXUeOM7rjmJMaAp0XYDJ3GP8eNBkuLrkJlxPIEFQmh9bRrPzVzPfY8HLrGaU4xNy/x58SUoIyw6XQKDYgCaEpvJy3IKgyh+AX2P+sxIiFVjLSJ4/I2g5Z53iHfZn7uMoziN1587MhXteKcZ2uzEjh83dM9fVRZLxova7h5zXgw/uu1uP+qTexQypQqZHVH7xn4z+Sl+N9qMbFJd32oOorGUfohvPgauFZL4F6x2Y5ICG5KdXNwUuXuzuaRE9CLtV+Bt7IDo92Fae0KkYKXLYBox0V/4XSJ+z2AMCL2jwUEeFlwai1GoBO0atrcIGdL/AtFC3wOpa3oIjMf8XGg568dpaR1porGkSzwG9bganqHXaR+I0gdN4iaSF9k+Ej6XEJ7hJpw513o+MNAU3LiUT5APMxYCgNi9f6iFZe2Y1eoXYe8d2UGytOQAXf930ZXNIQoqOqnVN/zjGdpLwVQtLqJLEDr9YYR/nil8uV6YytH5px0U+Cvs6y2A8W/ZY1vRftiFdN/siRV74sQkWIBBbKyfvDxVdNeqB9+AlnTIyxoZE4A0MngVnFTCs/qbYclM3Fl0WzP7OQcEIVH5u/BgHZKl8UmAACt20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6496006)(8936002)(107886003)(4326008)(66556008)(66476007)(66946007)(316002)(6666004)(2906002)(478600001)(6916009)(8676002)(26005)(1076003)(2616005)(186003)(54906003)(956004)(5660300002)(38100700002)(16526019)(86362001)(36756003)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFNnY0RmajZ0TWdFbERIbDhseThKcGNCSW1yR2RGYklZUVFwbWlVbHJQT0lQ?=
 =?utf-8?B?akwvNlpxVTcwZTVVVUk3cjc0K3VoZVRPUHVCbDJjSjlwc0pyaEMwalNGb2VV?=
 =?utf-8?B?enZyOHhveWsxRjBiYVhWTityL25hYkE0eUtveHZzWGEyYldURzdEQ0VJaVQw?=
 =?utf-8?B?WDFOeGUwWHhZS1NpQlIvb0c2N1NYbzdrcTMyaWUvQ0NnZFh3eGdLZHhKTmVr?=
 =?utf-8?B?VmZNdURGbnFsQTAyU0w3amZYZU5HcGdpbzg5OTdTeTh6Q09jWFpyektaQmE2?=
 =?utf-8?B?RGV4ZVZ0Y3Z4M3R1RWh3TDA3aW15L1pyZENCcSs2QU91RXNwUjAzNTF6Y1NV?=
 =?utf-8?B?cFlLWVNiNE5zUXZtaFRrUDdTRWRoTmt6SXpjZFZZTUx3eXZBSFNvNklyU0NQ?=
 =?utf-8?B?Q3hNNkJpUE1jM0hzRjZiTVF4NDA3WUJxN1I3dlp4MFVJWXdoQXoyczJHYkQz?=
 =?utf-8?B?S0E0aVBDcGR4S3lldnVQN1ZpWS9maXhrbmIzVkNHNFpyeGY0ZTJNMXlmcDND?=
 =?utf-8?B?R3BrZmZrbktjSW1FeTV0eGNQQisyTUFZY1NZbGl0MjdnOUZscHdsREl5MEJl?=
 =?utf-8?B?Y2hsM255R2p3TGNvZzQ3OXFzR2haZ09VdmtHbmNvcHROY2J5QjJTRFFOelhr?=
 =?utf-8?B?SUQybW1pY2VQUUtSMVc2cWI5M2FPUFdlYlIwSjRUVm94N2ExaDRQZElRdUFT?=
 =?utf-8?B?WHM1dGlRTFBNcnBpYjFHeSt6MGFrZEQvanNhNjM4RXgzSDFNQUl0Z2phYjJk?=
 =?utf-8?B?QzVKZlIzRWUzcEYwWEtndHg3NFpZVmIybGdvQlN0Q0dIMCsySldMQmRIbHZ5?=
 =?utf-8?B?RFQ3VldFWjFiSEpWaU5COThWTUZWam5xcTZaTnA0S3ExS2c1dnB0Q0VGYjhn?=
 =?utf-8?B?U0JZWVprU1VkeTNZMEppaHRGWktPc1J4a1k1V05vMGtLWXd6dmRCeTEveUJX?=
 =?utf-8?B?NEgvZmRONTZjOHVlV2VQbDVobDBIWTRJQm5idlBGb3FtOERWeThOWDlxdXRu?=
 =?utf-8?B?RnVqUHRlMFJWV3JVQ2laNlJMN2tMOFFFbVI0ZXgzZ3A1NkRaeDlUU21tbXhK?=
 =?utf-8?B?K2JhenNRTHZTbWNBYzZTSzY0Z1prTklMV3lXTmV5VzJPWUtKeUhzRVhMM3g1?=
 =?utf-8?B?MzRrTGlhek1uWTJUSldFQUxGRzV1UkFMOWNleHE0KzVhazAxOGNKSDkvbG95?=
 =?utf-8?B?TkI4MVd4akw5cTV2NVFWeFQvd3AreittS0ZFOXBJQUwwUThRdisvQ0NlekZ2?=
 =?utf-8?B?UjhHa1RDYW55MDlmUjArWFU2N0JoakVXWjRPQkdHVDBNSzJCdThMTjV5L2E0?=
 =?utf-8?B?OVhQcExTc0N5MCthMjhsbldCVEZEWWpzNFVhMjZPdUM2ZmhZMit0UnMrRVlr?=
 =?utf-8?B?MmxZQUlVNG9YQWpLSzdkNUxXSmR2OUtuWW1WdWRyRjRqNXpMalNCT0Z1MW95?=
 =?utf-8?B?aGRkc2tGWXhmVmJtOFhjMDBpc09XdVplR1g4dFBiTWN4VjdvR1VmcHBXWldW?=
 =?utf-8?B?bHpwYXVCWHRicVd3ZU1XdTdoOGxjS2tpMnNHSDNLTmNzdjc1T1YyUkxlZ2FU?=
 =?utf-8?B?eHZ0MWZEbFpFZ2FUSE1WWmUxdHNkS0JzNjl4MHJFM0xudFFnbnVLNGRrMHZB?=
 =?utf-8?B?VUJiTGlZOU9tOWhTVEo1bHczTEFyL1VRMUE5NVR5TjRORlpMZEF6bU95c0xk?=
 =?utf-8?B?dDB2L2tIdDlJMzU2UW90ZmZDRWdFUDJJa0FkQXV6T3V2MVRYNHBoVXo0SmlU?=
 =?utf-8?Q?8t5YnegVj3v1pX7ieAWHLFs/HEvCqdKwIg9HUaO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8e7600-abfe-4e56-e841-08d9065a3546
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:17:56.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M33jcHuGVz04rejLuCAOHBUEld01C0ov6UL2E3ztuR0Ry3B4eDy13B3i2KPdydxesdMcHanNL44jGkRUrjJ8rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4681
X-OriginatorOrg: citrix.com

When restoring limit the maximum leaves to the ones supported by Xen
4.12 in order to not expand the maximum leaves a guests sees. Note
this is unlikely to cause real issues.

Guests restored from Xen versions 4.13 or greater will contain CPUID
data on the stream that will override the values set by
xc_cpuid_apply_policy.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 - Fix commit message.
 - Adjust max feature subleaf to 0.
 - Move and amend comments.
---
 tools/libs/guest/xg_cpuid_x86.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5ea69ad3d51..bf9a3750b58 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -498,18 +498,23 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    /*
-     * Account for feature which have been disabled by default since Xen 4.13,
-     * so migrated-in VM's don't risk seeing features disappearing.
-     */
     if ( restore )
     {
+        /*
+         * Account for feature which have been disabled by default since Xen 4.13,
+         * so migrated-in VM's don't risk seeing features disappearing.
+         */
         p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
 
         if ( di.hvm )
         {
             p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
+
+        /* Clamp maximum leaves to the ones supported on 4.12. */
+        p->basic.max_leaf = min(p->basic.max_leaf, 0xdu);
+        p->feat.max_subleaf = 0;
+        p->extd.max_leaf = min(p->extd.max_leaf, 0x1cu);
     }
 
     if ( featureset )
-- 
2.30.1


