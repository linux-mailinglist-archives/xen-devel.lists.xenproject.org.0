Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5398365ADA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113744.216784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr41-0000s8-O1; Tue, 20 Apr 2021 14:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113744.216784; Tue, 20 Apr 2021 14:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr41-0000ra-KZ; Tue, 20 Apr 2021 14:09:17 +0000
Received: by outflank-mailman (input) for mailman id 113744;
 Tue, 20 Apr 2021 14:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr40-0000qj-6S
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c5fcd7b-059d-449d-b6a1-1262e4332ba8;
 Tue, 20 Apr 2021 14:09:14 +0000 (UTC)
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
X-Inumbo-ID: 4c5fcd7b-059d-449d-b6a1-1262e4332ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XQQo+UyiEnKDykIOKcT5B7KoIgTn/5t8tBBIxiebRuA=;
  b=g6cqSlbFp3MVGslZwwKsJiEicR4L1hZwVrC/AV/8BfUcHRVfBzMyr4EQ
   MEl1cQOEmnNKPZKR6O+ShJXWUJLHqmA715q+PjLEJm3D917jsK3D/GuXx
   LUcEgTOhIp4R/QFUdVi5/k+w6P4LinbdOrOFcjD2GnigE040yHby6J+tK
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 359FTVPIxL1i6dugwP4LUhyMs5FK4JZoP1ym8oRSVvpWIFa4+ZnzTylfETKc9HY+uIlcDujUdQ
 KfXnWa7VdX8YW5sP8znDRMdfMC2CVw5RslVckglmuC2x+wv6U7yn1GNT/fpLlPohsZJ7+nEUfp
 4ScJiw50QlIywTohYy6rkEvqHoU/y4nfx6BRUqerQr/JJ6LRzAW9iaYfY62wmZQ2MhC7+kj/+X
 Euk53YKyOqu4jQw9pRc2CobWDe27Le3hmzEXEE/ObvxGPV5yBCws26J57Wop6unaxKDHxJPCZt
 lJs=
X-SBRS: 5.2
X-MesageID: 43472900
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mAnh/Ku2wZb3A3DO4NdOgOZi7skC84Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue76K7OSxgAGhIh9U2ynSqlgYSKbiSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkqs9QETn0jxbtWYIJYcz4gBkQgMWCrGkni8
 PNpRBIBbUC11r0cnuuqRXgnynMuQxekkPK8lOTjXv9rcGRfltTYKAg9OEpACfx0EYusMpx16
 hGxQuixuBqJCjNgTjn4JzwXwxq/3DE0EYKq/IZjHBUTOIlGdhshLEYlXkldasoLWbR7YAqF/
 RWF8fM5PpaWkPyVQGmgkBfhPOrRXg9BRGAXwwrvdGUySFfmDRDw1If39F3pAZNyLsND71/o8
 jUOKVhk79DCucQcKJGHe8EBe+6EHbETx7gOH+bSG6XW50vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uIdfm5uwKzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQkBNHBUf
 rbAuMWP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5u3RLInHsfHabebzKLLhHS1MYBK8Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVIjWltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eerWmy9mDY0nVxNnNmfwJoyYSld0kPiR4BMkvyf7pGkc6YY3pu0HyOIQI6aM/KDg
 hFpRBS9bisJ5KdgQAuYujXfF6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHsDBx6mQFjrU
 9Zcw8aTkrjFjfj4J/Vz6A8NaX6TZ1RkQ2rKclbpTb0rkOHv/wiQXMdQnqTS8KNuB0vQDBVn1
 V11KcajNO76HGSAFp6pN59HExHaWyRDr4DKAiefo1blormfxxKQX6QiSaXjAwyfWTW51wf71
 aRXhG8SLXuOB5wq3pY2qHl/BdPemKRc1lZR1p6vYd+fF628Upb4KuuXO6ewmGRYlwNzqUhKz
 nDeyIVOR4r7cuwzgSplDGLEmgGyp0iMvfGNqkqd6je1xqWWcu1vJBDO8UR0IduNdjovONObP
 mWfBWNKijkT8wuwA6Yqx8eSV9JgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxHMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHP1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMtwnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczq8jTq1HV
 Ge9iFHls21Jxer5Po/C6gqJ35RZ1V5wHN+/Pmaf4m4MnThS8hzuH67OGS6arlTVeysHqgRtA
 9z55Wtk/WMfyT1nCDWsj0TGNMCz0+XBeezChmLA+hG7piTPkmNmLKj5IqLtwjMIAHLIngwtM
 libkwfbsNKlzkkgskW60GJO9PKi3NgtUBf7zFhnkPqwa687g7gbBh7DTE=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="43472900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu0X2DVzl3E0kK4Np/h/hU8SvDl4Ca678/RO3FK1aG0q6bQ27S4f7ROA0pRh/UeAj5QcA75doN7BmBYoXyLXIOPDxTokzIA3F3jZBcbAAhaI7d1eN6KQ+maE8PrnInMjM7Po/yFQq/g8b5zgQ5ZGEqAVzRHPh0/4tDtloe0uwZbfqvH0ZthXi7ajmmk1li+Yob0Oh3GFIEJ/GQclFws12/XJR9Yp6hWSdM3TEXzuB0Kj/6sclLfWjTLL3ASd2aN979VowpH0Vn7mUbNF7/ImsMMKIrnsB/mkU0lguHA9NdOQu3tOsGa6/Vho4PlYVKgTxUZUG+h2W6zOAufvk30JUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAVYWt8cwqiJEsl3boupKExscC+f1qGYrfZepi9qBqk=;
 b=ffId/gFrMJM+wbLq/BZ/BtRueP6XgtizOpV3U1PwW+betf8xJ/LToNafZ72HQ6QXW0N/Gd4aSO25JjstDLfGy++z2l3DtCf5hSAgzB1SxZhOizBNX0uwLDS4MGATnZQphml9GJ8J/qdOIbOqqKaoZEnUo2bRiQyFTJ2Cq1ipI8yFn+MrINdA8cBehh8FQ/DmvQUWr/HcRQatYxX8bb1Z4cuMsqEiibuB8nR6JNMlTSI0TNLbEG8DIEVbOVw3V+Vh9mwL/nmX0Vty5NnecL9IER/4hVgmhPth/QYSSa3N9R/Z9tnWqS30VQu6seL52Y5cj6cvhACzLa6KH99ijp29LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAVYWt8cwqiJEsl3boupKExscC+f1qGYrfZepi9qBqk=;
 b=KKiHhQ8YRqkbwnqWhyBYCH2UlyzT89xayMIHPi7NVuJ+pAXWSRb4ryvXTryuvQM4n4QxYRDE8TVedKP12DfakkV63Uj+VqdUfDOF+2m5jg0EwTIlkuhWxHhPUSW5RQZF62SJ8ZB4ucnJ3L3ya78OHo7fFP0IXtQqmpJN5xCX3hA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 04/12] x86/vioapic: switch to use the EOI callback mechanism
Date: Tue, 20 Apr 2021 16:07:15 +0200
Message-ID: <20210420140723.65321-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7003a25-4ee1-4177-b819-08d90405dfa5
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB600020BEB89EF0340C968ED88F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uv6DIkU1dneT/gasCrXcs9KaHNMbUpMZ+Qiyu5Ec9EDFqAIzzGAA6XXL9Ga6LLfBEKHfdHrgHywFUOwtxQlA51a8eEzG+7+uc9hdQ2ylOpfYYkQH3sbjpK53VtXNFPC/2EAbq3yU5fUsF7McJ4NyYGNIGXhES+t6jNzIBEf7sIEeKTRMFx7yYXjN5M7czFa9JF8Vg5g+uwBrPm/9jDKbZbBOwaFz1B0T0W8cCxJ7MoCWRK7SQlKzyeixpm2PLJvMRkx1+912SDR51VNYDjmGotdvt/DubvDJ4DKrw4u4HzbHMP3E3mIU1IdmixfUxJlp/JP7MiHsQYUHinz8j91raDHM7GehQ5SncJIZzyMCMSf6ZosoTZ0tKNDgGFgPjtndx7QSg0yy/C+tPIfZxM76SXCC026mnHe9vt4Ytp8uThLGcvKBO4/j3+HqgXl3AMUqEgLrVhtzeEGIkq5F5KFSCi2KXe+wgOOBV+WmUwgIB1iqpfU7m9A0LD1HaUFi4FCEq3QVPwHYpvuFY2TjFlFjSS4BJ21ciliNeIJKEfqGbnd2k+Vd7X4AY99M9Ke5zzuKhsUE3qM9FXsCFeLG7yiRLy35UcBeDBq+C+xrBVZB0fI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OU0zOW8yR09nV1EyY2Joc0pyTW90TFBHYzJEZWZvU2ZHRTJhdjdZeWlqdmFJ?=
 =?utf-8?B?a1g2TFhvZHZzSDVkVi9IREgvalVKRGpaMU5DZ1NXbFZXbFBXS0ZrZFpzUHZK?=
 =?utf-8?B?TVF4YS9HM09EUDhGMStQeDh0a2lKc3hZLytzcDBVeHh0aXVsSmNXRHhJeDhl?=
 =?utf-8?B?c3hNUWtIYUNBL3NWNWRTc1JWek01MmVtWjBmNjl3UUhJckFFK3dDQ3NnaEh4?=
 =?utf-8?B?T1RlTnp6ZGw1d00yTTd6RkpGd0RiS0x0dlp1TEU0MXFCWjVtSzRDZnQ3Lzdu?=
 =?utf-8?B?V0hYRjdVMXR5RnRBTExVT1M5QjRDaTFHNWpuMkZFeEpwYWlQcnNkQ2VLMlRR?=
 =?utf-8?B?bHFuKzIvRjNGL2gyUUJPNVoyYXJndWNhaHBFTEp6Y0FkKzBhR3grbGhLWldQ?=
 =?utf-8?B?empoTis2U1F6b1FIbTBNalhNZFpWaDhGNW5WZGFxdk1oVzMxcUtSZUhKUmVL?=
 =?utf-8?B?aFJVNSt6N2t2M1h5dXIwM1BiWDJ2ak5aSzRwNkJ1WkJPMGdFRW5XVkx1K3gx?=
 =?utf-8?B?VXpjRDE1WTZzZi82ckh1eEtpcHlYcWJCeUdVYlRvNU0rWi9uZ1JjZmVZYWNq?=
 =?utf-8?B?OUovNzN5RFlKWi90VTN2R1UyeU1QNGFBUEo2a25UZ25BZlBPczVtVE1Wd0E4?=
 =?utf-8?B?bHhnNlA3QUY4NUFJTlhYd0dTRm83ejJ3Q1ZleHpTZzlSWXYzVlhnS3IwREFi?=
 =?utf-8?B?MDlBVGRsOVQwQko1T3lWRm1hVTNPV3QrSHJPWTFYNzBsYWxRMjVMdmhkNlVZ?=
 =?utf-8?B?NmtWb2xEQi84WENwaHYyQ2ljYWozdHlRYlhlMXFSYmU3V3VUUTJEb1Axc01z?=
 =?utf-8?B?UXNWT2UzelplTzU5ZFhMNUhhZkVGN3JhT3Jra3JUZkw4RVVBT254T1dZV2du?=
 =?utf-8?B?TDd2YVFxb0xJSWJQTG1aKzRKOFRDNmgzN2R1bkM1SE11UXZMSlZLU3BqNkpU?=
 =?utf-8?B?OW9OSWtySGtiZmxOL09YRHIwaTZSRmUzSWg4L2NiYWE4ZHFGcjlXK2xKRktX?=
 =?utf-8?B?RW50eFZTUTlaOSt3QWVwMEcrcFdONlcyTURBNWlKd1RBTTdMTGFwMlF4ODlp?=
 =?utf-8?B?b3BwM3pWVFJQSXkwYzJUbk4zQzBITzBHR2hLbDJBcHpnV3B5aVRtTFZoMVF0?=
 =?utf-8?B?aXQxd0RhT0FWSU9sR0lCT2lZWGdHbFJ2d0p1MUtKQk1pL0NxTVlLZmRlU0pi?=
 =?utf-8?B?NDJYWVdVdXoyVEdaOWxWckZkNHNKUUdIazYrM1dFblFFYWFkYnNRVlRCYVBI?=
 =?utf-8?B?SlZQWmJWSkpadmFGWmlUKzJSeXoydW14OUg0cHZTVnF0elBTWlFuT2ZsNkJ4?=
 =?utf-8?B?ZmNObkQ1Zm9wSzVDVW9WTnd3bHc1dnIyN3ROOGwxUnpPR2s3LzAra2piZTI2?=
 =?utf-8?B?RTZuc3k1L2N6T0xSWk5VbmJFdkdsWGVkN29YQkpJbHY4S2dtTS85eEt1b2Nx?=
 =?utf-8?B?YXJrMStYTHRUcTZNUzN3REh6K0NmOFNVNjl3WUMxVWZsMlBFQ3QrMHl0TUFx?=
 =?utf-8?B?cHlHei9lU3k0d3JEa1dsU1RpelBEYTdjU3JHTWNBOGRmVzlIc1VaTFkrR0d2?=
 =?utf-8?B?RWxDWDZKLzZnRzQrZko3dGIvbGNpMlNCdW9BUTN2dWNYRWovMlF2QmdWZE5X?=
 =?utf-8?B?WWhXdThnUUdzbll6VVZXT3RCaXJWemhyTkFEdWt1VTdnUzFLQmYxZklLWGhm?=
 =?utf-8?B?NS9TUmpSNkt5eE5oWFNRbHllRTh0bjZySWxrd3NwNkxuazhIdVIycEJNSnBi?=
 =?utf-8?Q?1dzTBJ+jeFw0YUUGX+GQn8aNFd/6oDdlysjbr/B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7003a25-4ee1-4177-b819-08d90405dfa5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:12.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV7CrDItzzwso2IBnLgM+8Is7ncmIpN6v4VLIe90XMifPGJ1Gk64hdNsGXvc257h39LcP8O+x8aIv4oGtig6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Switch the emulated IO-APIC code to use the local APIC EOI callback
mechanism. This allows to remove the last hardcoded callback from
vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
allows to getting rid of setting the EOI exit bitmap based on the
triggering mode, as now all users that require an EOI action use the
newly introduced callback mechanism.

Move and rename the vioapic_update_EOI now that it can be made static.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Remove assert in eoi_callback.
 - Cast callback to bool.
 - Simplify check in ioapic_load: GSIs < 16 and edge interrupts can
   also have callbacks.
 - Reword comment about casting to boolean.

Changes since v2:
 - Explicitly convert the last alternative_vcall parameter to a
   boolean in vlapic_set_irq_callback.

Changes since v1:
 - Remove the triggering check in the update_eoi_exit_bitmap call.
 - Register the vlapic callbacks when loading the vIO-APIC state.
 - Reduce scope of ent.
---
 xen/arch/x86/hvm/vioapic.c | 127 ++++++++++++++++++++++++-------------
 xen/arch/x86/hvm/vlapic.c  |  12 ++--
 2 files changed, 89 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 87370dd4172..1c2763fc2bf 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -394,6 +394,48 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
     .write = vioapic_write
 };
 
+static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
+{
+    struct domain *d = v->domain;
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    unsigned int i;
+
+    spin_lock(&d->arch.hvm.irq_lock);
+
+    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+    {
+        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
+        unsigned int pin;
+
+        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
+        {
+            union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+
+            if ( ent->fields.vector != vector )
+                continue;
+
+            ent->fields.remote_irr = 0;
+
+            if ( is_iommu_enabled(d) )
+            {
+                spin_unlock(&d->arch.hvm.irq_lock);
+                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
+                spin_lock(&d->arch.hvm.irq_lock);
+            }
+
+            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
+                 !ent->fields.mask && !ent->fields.remote_irr &&
+                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+            {
+                ent->fields.remote_irr = 1;
+                vioapic_deliver(vioapic, pin);
+            }
+        }
+    }
+
+    spin_unlock(&d->arch.hvm.irq_lock);
+}
+
 static void ioapic_inj_irq(
     struct hvm_vioapic *vioapic,
     struct vlapic *target,
@@ -407,7 +449,8 @@ static void ioapic_inj_irq(
     ASSERT((delivery_mode == dest_Fixed) ||
            (delivery_mode == dest_LowestPrio));
 
-    vlapic_set_irq(target, vector, trig_mode);
+    vlapic_set_irq_callback(target, vector, trig_mode,
+                            trig_mode ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -514,49 +557,6 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(struct domain *d, u8 vector)
-{
-    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    union vioapic_redir_entry *ent;
-    unsigned int i;
-
-    ASSERT(has_vioapic(d));
-
-    spin_lock(&d->arch.hvm.irq_lock);
-
-    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-    {
-        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
-        unsigned int pin;
-
-        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
-        {
-            ent = &vioapic->redirtbl[pin];
-            if ( ent->fields.vector != vector )
-                continue;
-
-            ent->fields.remote_irr = 0;
-
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
-            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
-                 !ent->fields.mask && !ent->fields.remote_irr &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
-            {
-                ent->fields.remote_irr = 1;
-                vioapic_deliver(vioapic, pin);
-            }
-        }
-    }
-
-    spin_unlock(&d->arch.hvm.irq_lock);
-}
-
 int vioapic_get_mask(const struct domain *d, unsigned int gsi)
 {
     unsigned int pin = 0; /* See gsi_vioapic */
@@ -610,6 +610,8 @@ static int ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_vioapic *s;
+    unsigned int i;
+    int rc;
 
     if ( !has_vioapic(d) )
         return -ENODEV;
@@ -620,7 +622,42 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
          d->arch.hvm.nr_vioapics != 1 )
         return -EOPNOTSUPP;
 
-    return hvm_load_entry(IOAPIC, h, &s->domU);
+    rc = hvm_load_entry(IOAPIC, h, &s->domU);
+    if ( rc )
+        return rc;
+
+    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
+    {
+        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
+        unsigned int vector = ent->fields.vector;
+        unsigned int delivery_mode = ent->fields.delivery_mode;
+        struct vcpu *v;
+
+        /*
+         * Add a callback for each possible vector injected by a redirection
+         * entry.
+         */
+        if ( delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed )
+            continue;
+
+        for_each_vcpu ( d, v )
+        {
+            struct vlapic *vlapic = vcpu_vlapic(v);
+
+            /*
+             * NB: if the vlapic registers were restored before the vio-apic
+             * ones we could test whether the vector is set in the vlapic IRR
+             * or ISR registers before unconditionally setting the callback.
+             * This is harmless as eoi_callback is capable of dealing with
+             * spurious callbacks.
+             */
+            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
+                                   ent->fields.dest_mode) )
+                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
+        }
+    }
+
+    return 0;
 }
 
 HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index cfcbd732b16..8f3a0a2e8f7 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -194,7 +194,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
 
     if ( hvm_funcs.update_eoi_exit_bitmap )
         alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
-                          trig || callback);
+                          /*
+                           * NB: need to explicitly convert to boolean to avoid
+                           * truncation wrongly resulting in false getting
+                           * passed, for example when the pointer sits on a
+                           * page boundary.
+                           */
+                          (bool)callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -494,15 +500,11 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
     struct vcpu *v = vlapic_vcpu(vlapic);
-    struct domain *d = v->domain;
     vlapic_eoi_callback_t *callback;
     void *data;
     unsigned long flags;
     unsigned int index = vector - 16;
 
-    if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(d, vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
-- 
2.30.1


