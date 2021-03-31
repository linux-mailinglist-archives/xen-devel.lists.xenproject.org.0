Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E034FE26
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103854.198106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDC-0005DQ-Qe; Wed, 31 Mar 2021 10:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103854.198106; Wed, 31 Mar 2021 10:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDC-0005Cd-L4; Wed, 31 Mar 2021 10:36:34 +0000
Received: by outflank-mailman (input) for mailman id 103854;
 Wed, 31 Mar 2021 10:36:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYDA-0004so-K1
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1731d54-c7bd-4d29-811e-326e91ca0113;
 Wed, 31 Mar 2021 10:36:26 +0000 (UTC)
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
X-Inumbo-ID: d1731d54-c7bd-4d29-811e-326e91ca0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BsyDEsX9ceA4dUbZnZwjzJfmI6TlX31Agx0NKPinq9I=;
  b=QvR6CbVjD8uXFav6RYBFhxbe1NFNIpE+bg8cxdWnczJzo8Ul9OT8K6Us
   CI6ftpEIfBihzPhbU6znlpJwe0XKywmHCJ2EivLo0krRfNCiA1fMzy6TC
   VQNSGKJ61B/yZBuK9gtpzEvdjR7FX8oZyrt8FtPbygy8bfkQ8a+H2/Qs6
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zYVZcCUJVGd9kP/ghbTciBOjDI/YoeMo6o9URj9xFSwvMX/sS+pty5haJzKoCz/M1NHwNxdItz
 12jr8X0QScwvb6grJwJKxSB0f/dmiQqlXp0H+JHpxbOP6IF3I1C7+gvhQVxDQ7UEAlodLW69hL
 oE2eMlmtwPkh8ySbnf5OqBH9C1tptA/MLg918FUHkGQE7zRiaZ+hS8Gp1mnSJuFYPuJXRRupa0
 2C+X8MLxlVGJcO1UcYBlz9QLl0mOL74P8VYauwNYAGFY6HfL+B3qJVOzS9L3qX1aV3JhSGXUbJ
 2KQ=
X-SBRS: 5.2
X-MesageID: 40415685
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CbFAdaCwg2Ph7NblHegptMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmNEIyycFVB7QxQDOIEwE4
 CS6tECiz2rf3kWacrTPAh4Y8HoodrXmJX6JSMXHhJP0njysRqEyp7fVyKZ0BAXTi9Vzd4Zn1
 TtvgTl6syYwpeG4zDG0Wu71eU1pPLAzZ95CNWImowpLFzX+32VTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qV5yDa3Dwj62DvxDaj6BOJy6yJJ0NJN+N7iY1UaRff4UY71esMqp
 5j5G6Fq4FRSSrJgSWV3am4azhRikG2rXA++NRj6EB3bI12Us41kaUvuGlREJsGARvg7pEmHO
 REHKjnlYhrWGLfQHbDsmZ1xtuwGlw1AxedW0AH/veYyj5MgRlCvgcl7f1auk1F2IM2SpFC6e
 iBGqN0lItWRstTSa5mHu8OTea+F2Sle2OCDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJxrwcJCgLTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSWopj9Crr5wkc4zmcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQlc08X36Iv8LXOqznvuHWa5/oVfjQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oWkGXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 93ILbtlLKHtXC7lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR00GaYIAR8C+fbCh
 RWqVgy2a/fFe3f+QkST/acdk6KhXoao3yHC70GnLeY2MvjcpQkSrA8WKJwEg3PPwdvmRljrV
 pCbANsfD6dKhrezYGeyLAEDuDWcNdxxC2xJ9RPlH7ZvUKA4f00SmAjRD6oW86PiQMITz5Z72
 cBtJM3sf6lo3KCOGE/iOM3PBlpZH6MCLxLNgiDeb5Zg6vmYg12UGeMiwGLkh1bQBuYy2wiwk
 jaaQGEc/DCBVRQ/kpV1avn63tYXGSQdUAYUAEwjaRNUUD9/lpj2+6CYaS+l1aLYlwZ2+cHLX
 Xuej0JOD5jwNixyT+YkDuPDm8d250rJ+DRZY5TNY376zeIEsmlhKsGF/hb8NJZL9joqPYMSv
 /aVAmPLj/0YtlZrTC9lzIAAm1Tp3Ylm/+zh0Ggw2i8wXIlAf3dZH5hXKoWJtmA727iA9aEua
 8J+e4djK+VCCHWbNXD9IT8KxhkATnXqXStT+4ppYtP1JhC/IdbLt3+a3/wyHpD3B8CN8/6m0
 MVfbRj7Nn6S/pSVv1XXxgcw0Egm9uOJnY6qwDaAucxelc2kn/QVun5lIbgmP4KCk2FqBCYAy
 jmzwRtu9PEVTCEz7gUFuYZJnlXclE17B1Zjam/XryVLAWhbOdY+lWmdle7bb9GUaCAXZEdtA
 xz7d3Nv+iZcUPDqU3tlAo+BqJF6GC8R8yuRCqKBO5T6tS/fW22vZHC2r/7sB7HDR2ha0oZgo
 VZdUsfKuR74wNS87Ef42yVUaz4okUsjl1Exypo/2Sdg7Sb3A==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40415685"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahpTBpugP3SX26HdOQ1ebgu/ly89uC4EMv9yf3/4CT0fXDk+gHAs9HR0cAO+CDAopmpjN7re47r/RXo2xdfTH/aRI/d3651sTB5616oI+VQvEuMAU+Tj+W8G/RZTer6Tky/e6vqj5/lpfspZdQ2DsF4R61b04ibTNqPSBQ70c/8SZ0MP66wcTV2qgmjSqNp+z0xGi4rClN68s6x1139oTEz6ej3U0ZytQHTJ2A/vatOTcla7ozfMnghqRJ4fpMcZEfC2h/Dk5uWjbuLIxMclcQC4OJ5BzU/PNKBlJws3R56QFymvtebWiIfaSCNLtESkGqIjIalHBhM0/J//yWWOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPR5XbW/RU459tEveSX6lE/a/vHm/2wN5mOhp/77/C4=;
 b=CN6hkp/xR+FUr6gc+OP6wghJhOuvjw0I2RZjl2ih4BfY+96hOuGCHWcAtyt64UYf3oNKqdn5v4H+keTho0tvCt1qJmfHbOdAQ9LHo98yywvzCzO9pVujh7pgfz2AxdcIunGnuOWafR9JcHqmcStAWvP+G/Q/eXemcgeWah5UyjM7op58D8iiTjuFrsH89G/qYZRy4J3X9tqLlYs77Y3k9aak9X2M9NDSGvP7RZ4/L36IKUnAMTbgYhbDZXCNwAYNhQ4ZhSdtWiYdqQfqRAuDndc4T7lqfdAr2Nsy0Azu7oStABiQXQesjQUT5sYir2lJUn55cbaKxz+ooXTBSukBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPR5XbW/RU459tEveSX6lE/a/vHm/2wN5mOhp/77/C4=;
 b=tlj5hnsks5ipoidLFez6oQE8929rdsL/ilWx2X+Rj4oLtnZK5Q33/KnhsUNpkmWra9PImJd0gHn10PARADxdfP6JsFNbBlAQjpn7xZIV3aOCWFAfMAqYdh4lexhFq8hQKWtYilOb43Ds9qc6vd1+0bMdnCiAIHsbeoE6FSRRPqo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v3 08/11] x86/dpci: switch to use a GSI EOI callback
Date: Wed, 31 Mar 2021 12:33:00 +0200
Message-ID: <20210331103303.79705-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea4d173-e4e5-4353-afb9-08d8f430d3d5
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596854BCBCAD3143285247628F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dn26CJMBmePfHhfGdfwX4yw9HuWpvYropm8lJ82PrzSm+Cit7ZidCqq4Rd2vjOHf/oXknEe4wlH0CRyu5g6WoCwfVa6tVuEZt5SH0gp68nEUKWZAVa+JAtcoDaDfqvw11xsyXM6nj09poNORdYB15JHcTMkLRNvt/WkubbcDtw/WZ3zkFlHKfYWF/D8FxD2QjlIVU14Q1exUIAcmfvEAlWEr3n+AxQc6TkCdZHv5I6wMvY2rB/W5cjL9B4rd2J/WMwHWVC+IIm/7zBqCJGY12B03LjEPaaWiVxxxJo/APi9zcE9gg8Caiklqk5OdkwkciM/utrmb3700yTmovuslRs3wCsuvI2xgkE9cB/Qx+1j6eAcb+pBxvlRWYp2ylVNIoXb37DRLetGRD69pZZyaqxI/a5ocYRhjTm7vgABPvznPKoVsGNtvVm4tSBmhEsGfNbFSkmLyr/B8YQr4+np6O+FkorkITguzlUMI6LUxtGOqvRmmAjIIUYRg7OaF/1Cr8bcYHv2kYsOw0ky1DRt4Onf5e3I6pCSd//G6NgyMjM7p8vUtcfudjniVwTE9qMjHPaCbtzi6Mfr+wtaQ4Ulmy3nTKCqNrD1wn0l2Lvk5UtZHuZ7NF3zXVx7hJ/xY4PdkMn7nibRrx2g7lp5fgERTFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?akltOVRiNTlnQk1rYUdtS0hzUERueFBrendkZTBEVFMxa3RzcnN0R0JjZDY5?=
 =?utf-8?B?bWZVV0dtUFBvSmVHOHdKUUp4eVpNTFVMVGZCOFdJN1JSMW14SWRwSmtJanlP?=
 =?utf-8?B?OC9jaEtiQ2k1N1Y5OXh6WFp3dEF2N3RPbnhtVFd2Vi93NXJRYzhQRGQva09J?=
 =?utf-8?B?bGxXa1lNQXlObFMxT3lkS0N3Z0swTDZ3aEhoOFlLV00wRUFDS1RWWlVQR0R5?=
 =?utf-8?B?MmxsRk0xMTZEM28zb0dFaGQ1cXk4VTRheGlvdUNEaHhNakJnK3djTlNpQVV5?=
 =?utf-8?B?V2hnU1loOEZFajRSMFNEWElQTEZoVFVLTGlTM3dJS1BWdHYyYytncXJXUmhE?=
 =?utf-8?B?c3NXaDlsanQ1VEthK0hBenNxeFgzdG4yT2ZPWTFvRllTNUp0SkV4U2VCd0E5?=
 =?utf-8?B?amVkYitnMTNnaFIxTHpxTzZyb1pjSnphaG01Q202dG00TGhERjRueHVYOU9y?=
 =?utf-8?B?dmRTRmFkTmNYSTRCaWxlcUdpT0VyVVJwc1A1aUh0bHM2dW1KOUhlWmZTVkx3?=
 =?utf-8?B?R2hWaFVXL0ZuaExZVXQ5TmZjR3c5VXN1S0tacmNUUEY4eGR0Y0JNMkE1VzVl?=
 =?utf-8?B?YkhUVXFaQ1ZwK0FVMUptK1F0L1FSWGVrUXBJNm56aTFFZjNsdlJJSGVWdW1t?=
 =?utf-8?B?aUlKb2ZjQWYwS2RrU2FXUHM1TFo3Ykt5V1J0NUlNUlA0NUZMTWxqTXhiVU0x?=
 =?utf-8?B?ekw2c2N3em1aOXFtaGMxdDB3OHM4ZDV1Wk5ERDM1bWttc2REZFpzM0lzTVRY?=
 =?utf-8?B?UE0yQTQrcy9nUnhyMGo0UEdJSUYxMFVQZ1pzMURZU2xSM0EzVHNSZ0p5Zk50?=
 =?utf-8?B?dzVSRzhMcHZGMVgxbldLRisyL3Z3dXEwY3lOdzBPKzdCSjNUWDV0a0JEME4w?=
 =?utf-8?B?R3VrZkh0MXV3Z21UeHVlSlF0SUVWbGVaL0dobS84Q21kYVowcm11OVpOL0o1?=
 =?utf-8?B?MmxCZTZIckVWWGRVZzFLOStFaCtBYkttdjdVQ0tSbUJPcTlsZ21waTZIRFM2?=
 =?utf-8?B?SmlycU15SDVSdlFzeTFkeWhVSXRDTURVS09ZOGM1RktjZlJHOWtoOUNZTGhW?=
 =?utf-8?B?elpRSE1CY1FTaDUwY1R4bTFEQXVjSC9Memh0OGJDUU5Yc21HL0xTZVJ0dmov?=
 =?utf-8?B?eWpFb3M5TEZYbFJxdnErOWFSM0VOMGp4c3paRWRUcFJLMXc4M3YvZ2QzN3lx?=
 =?utf-8?B?WnE1YTNJRkRyQ0xzTUhheGdwVFAvc2k4M0xqR0hxbW1tNGFSaHBDbjVEckdJ?=
 =?utf-8?B?WEYrd1FUd3lOR2FMVGVjTTk5M2tBQXkrZDJPbWFycEVQNGpQMXhLMFo2dUQw?=
 =?utf-8?B?OFI1dkx1Yi9NaXN5WmJ2Q3RBcVd4YUo1SDI1L2MxaEN1dmZWVXNJcitJMFFt?=
 =?utf-8?B?YUx2dVhqQk1aNGw1ZDNRRmYxc3N4UXhDUllIRU8zb2xYNDhkNk51RU9JaHlu?=
 =?utf-8?B?djFSM1Y0WVQ5WTMxTGd6c0pwTW1aaHNvRStlY1VCbmNIVlYvaW05WTZtTThC?=
 =?utf-8?B?VlhxdXRmVjJrK3FCMmFqaEUzNEY3KzNjUjZZNFhvdzFMcGlyVDk0VDJSUk5M?=
 =?utf-8?B?c2R0MnZzSUZOeUlSNFNqa3BmSThNR3hBSVhITktwMFFvYzF3SjU1OXZGTlhS?=
 =?utf-8?B?blgyeEJXemltVS9OUFlWcEVNMmhCVHozMmVNRVhqZmloOUNiRStiU01wM3cz?=
 =?utf-8?B?cnJFOTFXdnlpTVZIWnRrNExqRXhnUTEyM3AxdTZOTk5CZEJDcVdQVmMwb3dk?=
 =?utf-8?Q?P2f+aibLSH2prLDhvtStAmIRCuLTHbe5dDPW9hH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea4d173-e4e5-4353-afb9-08d8f430d3d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:22.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ixtz/qpvq4IYbVyS+F5NiN1kFk3eP4FcyjA4yz3616xs1KscfL8Si9KmXZ+bTwwAzM3sKmkla8O4KvwGdKB1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Switch the dpci GSI EOI callback hooks to use the newly introduced
generic callback functionality, and remove the custom dpci calls found
on the vPIC and vIO-APIC implementations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Avoid leaking the allocated callback on error paths of
   pt_irq_create_bind.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        |  8 -----
 xen/arch/x86/hvm/vpic.c           |  2 --
 xen/drivers/passthrough/x86/hvm.c | 54 ++++++++++++++++++++++++++++---
 xen/include/asm-x86/hvm/io.h      |  1 -
 xen/include/asm-x86/hvm/irq.h     |  1 +
 5 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 099c29466ba..4cdb95ce835 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -284,7 +284,6 @@ static void vioapic_write_redirent(
              */
             ASSERT(prev_level);
             ASSERT(!top_word);
-            hvm_dpci_eoi(gsi);
             hvm_gsi_execute_callbacks(gsi);
     }
 
@@ -420,13 +419,6 @@ static void eoi_callback(unsigned int vector, void *data)
 
             ent->fields.remote_irr = 0;
 
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(gsi);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
             /*
              * Callbacks don't expect to be executed with any lock held, so
              * drop the lock that protects the vIO-APIC fields from changing.
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index ca484c31b6a..e0f3f6276dc 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -237,7 +237,6 @@ static void vpic_ioport_write(
                 ASSERT(pin < 8);
                 hvm_gsi_execute_callbacks(
                         hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
-                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 __clear_bit(pin, &pending);
             }
             return;
@@ -288,7 +287,6 @@ static void vpic_ioport_write(
                 vpic_unlock(vpic);
                 hvm_gsi_execute_callbacks(
                         hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
-                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
 
             case 6: /* Set Priority                */
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index ecc7d66e600..4ae678d69b4 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -252,9 +252,9 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     hvm_pirq_eoi(pirq);
 }
 
-void hvm_dpci_eoi(unsigned int guest_gsi)
+static void dpci_eoi(unsigned int guest_gsi, void *data)
 {
-    struct domain *d = current->domain;
+    struct domain *d = data;
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
 
@@ -477,6 +477,7 @@ int pt_irq_create_bind(
     {
         struct dev_intx_gsi_link *digl = NULL;
         struct hvm_girq_dpci_mapping *girq = NULL;
+        struct hvm_gsi_eoi_callback *cb = NULL;
         unsigned int guest_gsi;
 
         /*
@@ -503,11 +504,23 @@ int pt_irq_create_bind(
             girq->bus = digl->bus = pt_irq_bind->u.pci.bus;
             girq->device = digl->device = pt_irq_bind->u.pci.device;
             girq->intx = digl->intx = pt_irq_bind->u.pci.intx;
-            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+            girq->cb.callback = dpci_eoi;
+            girq->cb.data = d;
 
             guest_gsi = hvm_pci_intx_gsi(digl->device, digl->intx);
             link = hvm_pci_intx_link(digl->device, digl->intx);
 
+            rc = hvm_gsi_register_callback(d, guest_gsi, &girq->cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(girq);
+                xfree(digl);
+                return rc;
+            }
+
+            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+
             hvm_irq_dpci->link_cnt[link]++;
 
             girq->machine_gsi = pirq;
@@ -515,17 +528,44 @@ int pt_irq_create_bind(
         }
         else
         {
+            /*
+             * NB: the callback structure allocated below will never be freed
+             * once setup because it's used by the hardware domain and will
+             * never be unregistered.
+             */
+            cb = xmalloc(struct hvm_gsi_eoi_callback);
+
             ASSERT(is_hardware_domain(d));
 
+            if ( !cb )
+            {
+                spin_unlock(&d->event_lock);
+                return -ENOMEM;
+            }
+
             /* MSI_TRANSLATE is not supported for the hardware domain. */
             if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
                  pirq >= hvm_domain_irq(d)->nr_gsis )
             {
                 spin_unlock(&d->event_lock);
-
+                xfree(cb);
                 return -EINVAL;
             }
             guest_gsi = pirq;
+
+            cb->callback = dpci_eoi;
+            cb->data = d;
+            /*
+             * IRQ binds created for the hardware domain are never destroyed,
+             * so it's fine to not keep a reference to cb here.
+             */
+            rc = hvm_gsi_register_callback(d, guest_gsi, cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(cb);
+                return rc;
+            }
         }
 
         /* Bind the same mirq once in the same domain */
@@ -597,12 +637,17 @@ int pt_irq_create_bind(
                     list_del(&digl->list);
                     link = hvm_pci_intx_link(digl->device, digl->intx);
                     hvm_irq_dpci->link_cnt[link]--;
+                    hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
                 }
+                else
+                    hvm_gsi_unregister_callback(d, guest_gsi, cb);
+
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
                 spin_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
+                xfree(cb);
                 return rc;
             }
         }
@@ -709,6 +754,7 @@ int pt_irq_destroy_bind(
                  girq->machine_gsi == machine_gsi )
             {
                 list_del(&girq->list);
+                hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
                 xfree(girq);
                 girq = NULL;
                 break;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 9ac3e4f48f6..a05bdbe5555 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -101,7 +101,6 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(unsigned int guest_irq);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 0828c01dd18..f49c4c3b6e5 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -156,6 +156,7 @@ struct hvm_girq_dpci_mapping {
     uint8_t device;
     uint8_t intx;
     uint8_t machine_gsi;
+    struct hvm_gsi_eoi_callback cb;
 };
 
 #define NR_ISAIRQS  16
-- 
2.30.1


