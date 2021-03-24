Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8534786C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100964.192709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Z5-000654-Sn; Wed, 24 Mar 2021 12:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100964.192709; Wed, 24 Mar 2021 12:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Z5-00064h-Ob; Wed, 24 Mar 2021 12:24:47 +0000
Received: by outflank-mailman (input) for mailman id 100964;
 Wed, 24 Mar 2021 12:24:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5GA=IW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lP2Z4-00064c-6I
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:24:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d822855a-790e-41ee-b390-dcb4685776df;
 Wed, 24 Mar 2021 12:24:45 +0000 (UTC)
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
X-Inumbo-ID: d822855a-790e-41ee-b390-dcb4685776df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616588684;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=b57PkLxKVOpjTtob9DfsP00uPudmCsGUbxEqlO49iQU=;
  b=Fu0qGkjraQJccQEiwoalGGpAz+m3FdiQ+pPJnrgScvIGOCi877LR4PSl
   Vh3Dzbyfq1S+2FhX41H3lTFpVqL/8b/U0KZrFJGe1ttreaUq+NcCckU9s
   sX2SznwhCscpOKIVyFqmy6Ks577hDEgvDQFu0axMzYSD1F8MjyZJbfZaq
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MzSfs2m/4tf2O3g0SroNgQPrHzgt7tt4GMB8NmFqOWy1i6xUhTobNa7tFYT7wx4WJDNQYl9hUl
 bSJqXOIrnlsHAWUk9XReXOWgO/R47kMt7TH7V6E3Iz2fE4krYnsv8mZ/Rb0dguipURXYK62i/Y
 7IF/Bpe9a/wsvYd3BWcmY5WPPadnzgY1VgQjIh2YKN/nHaAUfPzTi1UldFKemdJ7+hCTTLMaU1
 0WaaK1mW3OvQqdX3YgTJnqHKniNmjhl+nXYfbth12JoPTQsdpwMz9ah6dV8vZPK3VgURmkJ6hG
 +RY=
X-SBRS: 5.2
X-MesageID: 40164068
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JBBtFaNY5Xw1p8BcTyXw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiztRIACdD0FwWU16HpI/Dp
 WR/Y5qoDCndHQRYK2AdwM4dsLEoMDGk4+jXA4eC3ccmXKzpB6LyJq/KRiX2R8CTyhCqI1NzU
 HpmxH0j5/T1c2T5QTb0wbonvZrsf/A7vcGO8CWkMgSLVzX+3iVTaBsQaeLsjxwgMzH0idSrP
 D2rx0tP9t+5hrqFwnfy3uduHiR7B8U52L/0ljduHP/oKXCNU0HIvBcjoFUeAax0TtGgPhA1s
 twrgeknqsSJxbBkCPh3sPPRhFnm2GlyEBS7dI7vjhxV5ATZ6RWqpFa1ERJEI0YFCa/04w/Fv
 JyZfusrsp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiw3yJNlH504kMEzKUk7zo93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjib2jPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7vSzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+OuPMaLsrHW+
 uiGZ5fDvP5RFGeWbph7knbYd1/OHMeWMoatpIQQFSVuP/GLYXsq6j6fZ/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oXkT++Jl3AZXL5uR78vlOCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4U674HjP9GcsHhZGFE5a7PHBXhpx1EM3GnKxVYxGl8SUeGhU0nfCDAR4VdnqHA
 lWoEky37m2IZyWzSULEMmmLWqesnsWqBuxPtYhs5zGwf2gVoIzD54gVqA0Px7MDQZJlQFjr3
 oGVBUJXXbFFjTlibysibsdAO23Tag4vC6bZepv7V7Pv0SVos8iAl8WRSSnX8KsjQEyfDZMnV
 Fq/6gDgL2PpCa3JQIE8ZUFGWwJTF7SLKNNDQyDaokRoLztdQ1qZUqhhDCRiXgICyPX3nRXol
 akATyfePnNDFYYh2tR1bzy9khoMk+HeVhrV3x8uYphNGjPt3ppy9WXbq6r32b5UCpH/sgtdB
 X+JRcCKAJnwN66kCOPkDGZDHM829EAOPfeALlLScCm5lqdbKmz0YcIEP9f8Mw7aJTAsuoXXf
 mefAHQBjXiEO8t0xGUoHFgGCQckghXrdrYnDneqE6/1zoDJNCXBnJMbbQSOcud4GjpXOzg6u
 QOsfsF+c+LdlzsYduHw5zNZzFNKhnvsXe7JttY2qx8jOYXjv9PBJHVXjvD6WFf0Dg/JMnykl
 kCQK4T2sG1BqZfO+gbeydU5TMS5ayyBXpulgz9Gekle14xy1fdItOS+rLNwIBfSnGplU/VOV
 OF9Tda8OqAdyyf1aQCA6Z1BWhNckAz5DBD++yFHregQzmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 I/2uq2pYasBl3F8TGVmyB6LKJI+3umRs33IDvkI580z/WKfXKWgqWr58aviizQUjXTUTVeub
 F4
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40164068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/aEh7ZQUFm3Sxn/iafliyzsSfelSJhIkGCnC0Ykq7rxvm9lBB6c2PhtYBv6cUPLMpMArmScNSnMGVka1CShoK8i1vBI9bdO5Zhf7OC7tl1uwq++N17PAjsrMY5QTk0cdJyIa6hrlQQIDwx7iV9knfTcvlG4ExNiQj844OlhgPahYAbGLLWuP+Dzpg3qh9CrCgWCs9DbVlbpEZdz+0CIVLjkZbm5i+2QoSEDAJAa26ucmL+r9dfUKIt+Z2olGKaxbZBDxyg2h/M3MeIsdmR9uSITF/zO1E6r+vQKNI3c5nF+Jrhih3Nw4y98s9BewyITVsMDG/oOHohHMeLNX0En4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3dYednsfe+JWK3g9vkdloy+BrfrO73P+Mzf/FA4yCA=;
 b=g5OgIQBC+8sJqBpfDpYcjs7iKkN6f9bgw8YnQH1jc7W0tFxJcufFcELaHnTAdLzn6dxWQ5khOuYgpE5toNYZoJQhPCv4i9Pu60wa/HkxtlMzCsZ2G4SOVineDlpWPW7SNHuH9z7v/ZOmERrsoZPgjBE05VfqTvYGxUJ0r7zmu0ThE7KWliofs6wfklU6L6NBmqlOmdO+cDvo9tZbbi1ESYMTnZMTpdf8dGDIyhKQeJm7ZzgnqJMeAq89A+zNDsBPUXhQVHmtscOR2cnvLLoRYyC8+niR6NNUNwbejOyZdtAXDALUOM6YFAGQFW5PTl/b5DidVy7A1MWdsd+dd8+sPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3dYednsfe+JWK3g9vkdloy+BrfrO73P+Mzf/FA4yCA=;
 b=m6uyPxfk0qOkhEnL2uNOeP02PMy3Rn3+2RQlPr7sDRFUUkBZOxwOZIPyqS6Ydt5ejUnufbsTnCnyvgF78HdxSmB+yaeKUhycJ+pJZpm2UQgqW2U1ixRiVTvm3j5fzxv+ptHyDaalDl2+lmz+s2vSFMbjmvzeiQ48SsXeWNaqGPQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/2] xen/x86: alternative fix for XSA-369
Date: Wed, 24 Mar 2021 13:24:22 +0100
Message-ID: <20210324122424.58685-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b36437e5-6ac5-4afc-c179-08d8eebfc895
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59659017FBAD76F46CECDE388F639@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L89DnOE8394Z4w/7eFkHtqBT/AWJ9qjRKB43Q7R9GkelJr+Aqcf3mEW2yVDfobxHPB8/K3YWHRvBmC8q2yB2Sq88LbCaiUg5NOs978IqrdnRGZn6GUOI4gEfHB+Y1i1q9i2HQ9DYS89vTjgr+lWsZXb0fam/ZTG71bYVqigsYAMFHcpTCAmGYGyq6oJnWnhg5dzkYdzsAxMpD9Hl+0+NuF/xJQUWTVzl89S0nw0cBp0j/90Fg9uvIpc8L/6Qp2dqU4GDFbeB9xfwumgaSgFOhymotPt7kaSBrkjlHYoxigu3DGq+GJFBIWNAwX07bETfnfZbUWEQ/uG0YNSC0OzVtpxVpqaMVhkys61CYesl0t4329oqnB7yZnXKCGzsHpp8Wie9xVbwZHyQk7QkGt9I+AMdJl7Yuw50/mZZ/rQWlWhi/jc0ZwYQMd+zWwgEl0oCnk9rRTY16zQNvrpz1q4JGc+fjz1naNtP+IdrJFNmSqdhG98+A5HEW4Wb4yguMV36zySOdNQKgXq3lM4BU/9XF23hJ+1+wj8A48O32x3s+9luLxfuTIhINA6QbL9291kYwUivmxzWaDnJ48zVcrUPPiikZbAHTgCyqpU0BoFV//Cwa4tacJTkSZiORLwJaryvycLilw9la1fM0GjVGwn2gIMEXHUW6WjDEB+1krWvclA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(956004)(66946007)(2616005)(83380400001)(16526019)(1076003)(6486002)(8676002)(5660300002)(8936002)(478600001)(6496006)(36756003)(66556008)(2906002)(66476007)(6666004)(86362001)(38100700001)(316002)(54906003)(26005)(6916009)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S1YxWUliWEcvS0xKRVFqNzl2N2pjY2hiVjgxSTFwbFUrY0Qwc05CemdTY3ZX?=
 =?utf-8?B?RHZXekVJSHNYQ3JDTVJtSzFrQUdDWVpVNStRNWJHbnpDZnFDbzFudUVIZTRD?=
 =?utf-8?B?eEpGcXVXWSt1dHEyQ1dielluRXlYNUJ3K00zV2RyZVN0N2FBeEVYK0paQzlm?=
 =?utf-8?B?ZTRYSjhHNW9iT1k4MndXdG9NdG83RVRVa3R3U2lqdUtvK3hYRFVIMVRjYUdy?=
 =?utf-8?B?cXZacklQeW41TlFKeTZCSkhpNSthV1RibjNnUy9UbWlDYXlETysra2VET2JR?=
 =?utf-8?B?d3UwQkgwM3VUU2I0YlQ0Ymd2dFB4RWtoc3l2V2lvclVhSUNPZko5V3ZoTTJa?=
 =?utf-8?B?VXhUUVRzUzEzUGhaaFVjc3pvajNJZWJVaGlia2FyOWloSnFtcjJYSjF2b1ZU?=
 =?utf-8?B?WTNrUmJBSlhqQllkME1sZEo3VEZTUC9hN0VmSkhVSlR4dTBobVA1OGdpd24y?=
 =?utf-8?B?dGlQczhsVVVaUkRHajVWaGNGVTRkTlZXRHdNVHVuZjl3LythY3dxMU1WKzYv?=
 =?utf-8?B?YlFsdTl4TUFJSjFua2tVMnlOa2oxeUJoRjZjOUY3SGt1ZHJBQjlSemRlcWto?=
 =?utf-8?B?UGJTWjQ1NGMxdWRYSGtYR0tPdUk2aVA0dGF3dk9RRFlyRG15TGlOTE5BeDdR?=
 =?utf-8?B?Y1l4b3diM0pYNi9QZVVNTU9KU0VCaHlpOU5qU0YvRkIxUjM5NytmR1cxcjJP?=
 =?utf-8?B?VVZMcHp3WEdjZW9KOFJqSlU3RXlmRnlLVjRxNDJkWEJmSFhqR3lZWEg3Ry9Q?=
 =?utf-8?B?b0pDRE9OSmZxQlpiblczVlBBZy96alV4cUFzMkN6ZitlMG54c1hMWGdlWjR2?=
 =?utf-8?B?QWJMZ3h4VU1xUU43UjNNT09oUTFudEJzY2MxMmpvYk55alluNVpVa2NzUnZJ?=
 =?utf-8?B?Q3hIMnFwVWNTSEZhRzBSNmhpcEJUZTFOSDQ5RHRDZDduWUxHaTBaQ0hoZ2lh?=
 =?utf-8?B?ZGFwaytTTVpsMjVGMUxNYnRUWDc4UEtoOEF6dWJsVmJGT0xST2ZFUWpyQ2gv?=
 =?utf-8?B?ZS81RllzY1VURmtzZGxTakNCajZScnJUNjhqRmJyRzVhVkJyQzVwcXlpeHlx?=
 =?utf-8?B?dnNpdU5jSlJEVWcwUXV2aTc1bS9INWZLbnJPRjUreDRBZ0hIbG1VQ1NKZXBa?=
 =?utf-8?B?bHkyZjlqTmNtWGxvVUVEc0V1NkJYQUlaUmozb2hXSzJGUktITDZsTTdnY0lj?=
 =?utf-8?B?N1dCeGpmdDRqcUZRQTF6dDZKKy9lcHVnQVBUK0dPUEFQZUQwd3FLd1ZkTDUy?=
 =?utf-8?B?c2gzZ2laZkdjZk5RbGxyK0dwQm5lU25TcFVya2VRWHFRNFdmYVBVRVdwaUk1?=
 =?utf-8?B?MDhFbnNFL1pYWTNpNEdhdm1LSGhOTzhRWmlPUmRoQ09DaENOWjBic1FpU0tS?=
 =?utf-8?B?RFhMdTFPV1RvMmhJNDJINEJLRzE1Y1lMc0NqQ2xkVytST0R2dWVCKzRZNTdw?=
 =?utf-8?B?OGxzbk0vOE9SZ3YvV2d2NU9USlIveWFtWVBCK0JXMmZxYmNqK25nSEMwN1pU?=
 =?utf-8?B?NDZHcnYxNU9GMVowbzZja2JPcWtpcjNSTzhZQlA5VGFoTlZEOWQ5NWtkQ2Nr?=
 =?utf-8?B?cVBKeDNPMFJUZGp3NUUxZ245cGRSVGRFbUJSdzJDdUFCY0xYV0NWV1ZVWGIw?=
 =?utf-8?B?SXQ5M3BaekVWRVE0NFB2VTJ3WHdzcGdqaEYzSFNHWXJ2V2tYbDY5aWFuR0VH?=
 =?utf-8?B?UUVmSzJ2SUhFU2dtUVk4NXBITkUrVk1CVGEwVHpBdXF2TUVUUUU4OFF6aWVG?=
 =?utf-8?Q?8L0TqlBikVZBEStW+4d1QNsgOFygM9Vhf02W+A9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b36437e5-6ac5-4afc-c179-08d8eebfc895
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:24:34.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOcB5v5JcqYMEb4XDXiI8U8RRRJ5hv3FQQcbIJXimoTpcxotylcOPgTHkdZA3f22eApDY7Fi3jPmddmjZReRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

Hello,

This is a proposal for an alternative fix for XSA-369 that instead of
special casing XEN_UNPOPULATED_ALLOC to size the p2m relies on making
XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on the generic MEMORY_HOTPLUG
option rather than XEN_BALLOON_MEMORY_HOTPLUG.

I think this is safer, as we don't want to be special casing any option
that pulls in generic MEMORY_HOTPLUG without XEN_BALLOON_MEMORY_HOTPLUG.
Without this we would also need to at least special case ZONE_DEVICE
which also relies on MEMORY_HOTPLUG, and is what pulls the generic
MEMORY_HOTPLUG option even when XEN_BALLOON_MEMORY_HOTPLUG is disabled
with XEN_UNPOPULATED_ALLOC.

Thanks, Roger.

Roger Pau Monne (2):
  xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on
    MEMORY_HOTPLUG
  Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"

 arch/x86/include/asm/xen/page.h | 12 ------------
 arch/x86/xen/p2m.c              |  7 ++-----
 arch/x86/xen/setup.c            | 16 ++++++++++++++--
 drivers/xen/Kconfig             |  4 ++--
 4 files changed, 18 insertions(+), 21 deletions(-)

-- 
2.30.1


