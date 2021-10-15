Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3442EA7C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 09:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209842.366410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHtI-000500-Dn; Fri, 15 Oct 2021 07:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209842.366410; Fri, 15 Oct 2021 07:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHtI-0004xf-AV; Fri, 15 Oct 2021 07:44:32 +0000
Received: by outflank-mailman (input) for mailman id 209842;
 Fri, 15 Oct 2021 07:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbHtH-0004xW-6x
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 07:44:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87b2d8ce-807a-49ce-8233-cf187e761840;
 Fri, 15 Oct 2021 07:44:29 +0000 (UTC)
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
X-Inumbo-ID: 87b2d8ce-807a-49ce-8233-cf187e761840
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634283869;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EG8lU7/OqN3Qa7fW1GhfdyUiiRkq2bMNKgEK6RdjGbo=;
  b=GkOVIRqND1Gwcwa7DS8o6hcaAw+fgaSkIw8wTJlfZQLmT0XjSoYPHHqw
   IHjEC8z7LQpkQ4iTiZdouyKOZpBr0nF8++u+mBjWH4DcvN78uM2Qnq10N
   as8Xuh3TE1+g2lxe2vpW1qfzB0ScoyH+mAx3oVEOg2io1Ip7Zrv4v19o+
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IomCdoLKltLV3CGcFUfzTT8IlRrO2YEy+DLlB7H1OGQUVaisc02mQO5sTFIYGLjh9MauMIrGE/
 YHadXS6nSQ935tQQuCv9vfBRdT3Er/NNbzc1qFbaO9Cvcorg7Ty+l2JCRnEQvqDXSwNHvhnWL/
 Pe34haCn9nGk4t5MvulbTPETqPfCm3QGVDzS8754+A8Kxb2gLkFMP+cO2RMfjRUS7yWgi1ItAT
 gNeLsSSnB9S/nK1mDZlECY1DDcEeY6Z1LAOhQq8XBOuZ+78Iu1fWTDJu023augk2qZGCDHGPEr
 5Sr1/tF4zTs9WsyhQ8mS004y
X-SBRS: 5.1
X-MesageID: 54828236
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yKI2AK2n/EEclmLbWPbD5Ux2kn2cJEfYwER7XKvMYLTBsI5bpzwPm
 zBMDD+Abv6ONmLwe9x0a4Sxo0wGscWAmNdnGgM+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhhulA0
 tpskKyLQyhyEanos7oHcgtRDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIMIhmdq3Z4m8fD2S
 MklRjppbUn6XTZ2HUo3CJgajef0ryyqG9FfgA3M/vdmi4TJ9yRp2aXpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2AmlqzgsffkCW9X5gdfJWy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mly7XWyxaUAHAeSTxMY8Bgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAMFF4Yag4hfTAPzILMpKUY0AjuXN98RfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEVZrvlS/snaNq1ojPtb8NtPABU3ztK4YdO6kok+9U
 G/ociR0xNsFCo2Rj2SzSeEJEaDBCx2tYWCE3wAH83XM8V2QF5+fkWJ4vG4WyKRBaJ9sldrVj
 Kn74l45CHh7ZirCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj62zBJ3y/piY
 MfBL65A6Er274w8kVJaoM9GidcWKt0WnzuPFfgXMTz2uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3RNC09Muq0A8smxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxGBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:PK0FwaBKXP5F3PjlHeg/sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4iGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 b4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRkXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqpneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpv1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYHhDc5tABanhk3izy1SKITGZAV1Iv7GeDlChiWt6UkVoJgjpHFogvD2nR87hdoAotd/lr
 352gkBrsA4ciYsV9MJOA42e7r/NoX8e2O/DIusGyWSKEgmAQOGl3el2sR52AmVEKZ4uqfa3q
 6xCG9liQ==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="54828236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n72N+TlMaaqXkpQ12Hme72DlgejgFUxKBBTs7rnDGzA+DNz/yKXdU3R96GlSmLuLwDlSXJYPe1xd7W0bJmTKX7nozGs0rJiPprrePQEEPI+oKEi36aW1BGLfgHU4TSnGeMCsBp6ViwleVcL3Pu+AuP5Sh3HarmSX43D0v4gKcR/xRjLh54kyzEyerbLg5cE9pgNKPzonE8aIChlNht6UyBp8rckC9W/QhMnUQjSLcbV3n00+eMndRAnZU9n1D1am412vfPvRPHAzvNw92K2LkOqhkUywNE+Mu+aMO6t8kMKa7llSWAQFjKOCxD9FfqFEadXG4o4PzyQIV1gkro20Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oz72RjvQ9vrbnCPu8D3PXpkuwlk0cM7YjOj52B/hkg=;
 b=bKDTbhF1Z4X4CRCRxUhFrN2mx8LXDS74jRnyACdHhiDm0zWVcdfzohvCEk9Br3vbprmHKpMfC1PbueBbjvp7ekxzVtjqU2n0LaGsmeWI1rNfjcRRvwuCTSE3qNU51i5M2qP/fVfIQNx6vB5K133BFNZJFFoeXNUMFg21HVjzFwgJs143fyM8KKXNUX6U/56DnZzb+36DVlh6JwIc6gfxtr2FdTNJHCzOAkpdkI+KW00O9OUeaMK39s78Zy3j/1LZ4/G8VBO1UweNqO50VMcLqwRJuZOfrvIGhu0i1Vj4uyi1sfEFwkyK4hYG6yk6UuR12qhhiB/ZcPsF3p/PsBohZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oz72RjvQ9vrbnCPu8D3PXpkuwlk0cM7YjOj52B/hkg=;
 b=BlIxv9yn/qF62DVEUjzEi5M01Tg7rY6uk72Zl0r/s3GwSpwkz8jAWQXxbzfa/zdejizczwwwhGXhHsSLYrvLwR1xFZK0h8A4crpufRphlZodS5gvd0DMBoTYZkQR+34nbqDLCGKk0Tugl7MginhbsPyq9Z2IIPs88WDa9lMyKZk=
Date: Fri, 15 Oct 2021 09:44:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, Paul Durrant
	<paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Message-ID: <YWkxT1bVmBT7Av43@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f72e0116-a02c-4bd1-124b-08d98faf986e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969247ADCB004CE1F39B0C88FB99@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yo3c6kbEHvZji793o97aYzwUp+W5SaWG+bQjZsO5dK51vA2TX33SgS+ZFSwpn6mpyMFzJFazkOYS4FvzB1gAWeNbnuFj8LR4P1lkvA8KuKr+Lh0knA1KqPzHp2RUQJ4j/L+WQnGslDFxofxycthEzE8Fbi5xjs5yz/UPGOAkILGc8Tkwn4VMTAWc6zd92R1Abf8aYAREExjelxsRJtoTC6vmUyLVY7suqPIb5r5I3L4F6EiZWmgNhSZQOv2m7j+uOniorMKQ54F8+ZrwJJuRtwPWZysiklOISPmsX7GriC3mr++Einw6nJ3wUAPle8kuEW0UfnNkIHEw8IRuNMJ+48M8jdi6N7r/7U0r0gq+R5cFVT787MUOF0hESJB3sacHGS341lnN5aF60DuEq5HrL2747VcEZFfjSYmvde75S17wi1NqJ/YJLjS3g7c50oheSbyuJ1Y6OsPFPCMKD/neyPzgexuMLuZgVCeoPAzzf401A/DbFrJFkiuhU9vG9nN4hq4DtqZC5TAgUHNAzhLn59OM5W5m4U7sJ1Vpe/wHUuWiZTY3FLEqD0dlGliWRmXZnMdE/jlxQTp2Pg1Q1spN9a4C6Ox96A6ShmJbjSIaetGSht4oybeFuwlcYPMPWkyKLNN5z0TwPejmBWeY2sj4CHHZy1KBVtptws9vG6aiRsdgBbBX0Pa7N/K28h0y3nC1tpDaK8tLOc/9yjSECvyq0QTQF4JAl5CtXGNIRAMrrPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6486002)(82960400001)(83380400001)(316002)(5660300002)(966005)(8936002)(956004)(66556008)(6666004)(86362001)(85182001)(4326008)(66476007)(38100700002)(8676002)(26005)(2906002)(6496006)(508600001)(186003)(9686003)(6916009)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTZqSnYrK3JQbWZIYnpMMDB2L0d5M09kc3NLV251VUVvYkwvdnUvdEhsR2pS?=
 =?utf-8?B?djRVZWJiVzF3RG41RTBXNFUzbVVadDhaTGNPY0hKaWh0OVk2OXN3eWVvdnlz?=
 =?utf-8?B?VEdsMzFZdUMxTDdUZEJPQjU0THp4d3VoekprVG5mYU9QcndRQmdPTlZTamh0?=
 =?utf-8?B?dmo2UCtZbGtEeC9BYzFQZEMzZnhRekNVS1pQb2g0ckxKNkhoeTkvUDMyWkJ3?=
 =?utf-8?B?L3NXY0JWbUc3WWlEbnBIVWNqYlU0dy91anVwK0VKQ1RCbEVVSFRvTUt4dkd2?=
 =?utf-8?B?TmlDMFE5dHp5bmpsUWdoSTh1Q0ZTaFBmaWtzY211ZzdQdW1ERUY3djN2a3Zo?=
 =?utf-8?B?cVEwK2hQV2Q3NEo0NVRMMTJKdXJLZ0VXSmZqOEhteUk0Y1JOQ0xWdGp3Zktj?=
 =?utf-8?B?NzhnZGlXYXBRNGpna25kSENSSWloMEZwN2Y4dVo3eU1TR2JQRkJPUWFmNWNG?=
 =?utf-8?B?MUN0bXRWZ1dSYlFFQTN3eksxWldLM3JXUUJ3ckEwdEZmWDBDTlBRRHdPM2N5?=
 =?utf-8?B?TTRzMGFjV1J0T2plL1J4MHNUNTlsTGRHc1VyTklzNTRRa09XRjNVUzdZbFpr?=
 =?utf-8?B?enZRdm9rZHRiKzlMcFZock9IUDlaZmkxS3BvL0V4NTdPSFF0RTloNXBsOUpC?=
 =?utf-8?B?NElFS3U3WUJTN2QxT2lmMjdCbzRlcE5OV1BhcDBGQ3o2Vk9MT09GTXhlbzlt?=
 =?utf-8?B?MURaKzk0OHhDVzlsd0p3VEFNRUJpWTNUOXRhdTBqVHNMazNDOFNRNVRjZmpQ?=
 =?utf-8?B?TDJ1YktGSXFjc3h2ZTFROERKcEtqbTMrTXFvNkk3ZmhNWStWRjVQUVZtMmFW?=
 =?utf-8?B?Sml2Um50cSsvOHNnbEhnK0hvd2p2UGFSQ2NJbDNEQTFJRm9HelFhS1RFMXhI?=
 =?utf-8?B?U0c0SVRSVVU3VzMwb2R5S2lXV3FYUWVHalhnbjVRMjRYdWtxWkpYVm9QS2gy?=
 =?utf-8?B?eUQ4SFN4UGlXVStCc0NHKzUybEVKdHUwdStQK2F3bmRYcHZPblA4bW41R0Rn?=
 =?utf-8?B?THBYYnNtRlVSZkNweTZUSk05b0dNODdIMnRocnJ0R25idEpobGNrdzB0NkRN?=
 =?utf-8?B?dUo1dzB4U3dCVUhQZkordmhiVUFxOU9kVHNPR21wME9XUmRZQjdlNS9na3ZB?=
 =?utf-8?B?YzhZZmxxZUFoU2tUT0R2VW9DajhiMUYwR2wyME1ZaklkT3ltM21RN1hlSmY0?=
 =?utf-8?B?Y1VtWm9JWnhsemttbnZmS3N1RUNFMDhxUW8rZUloZFZzbGdScmZndG9mZFRw?=
 =?utf-8?B?QjJsVjRuckNEaFVNU0FFOE1mM3RJQkxMb1RDUTQvUXV3T2xEMmMxaFdJWGxM?=
 =?utf-8?B?U1MyZzU0ZWhaU2RpOStmdUFSK2lrMzRkVlRRQ1J0OWs2WUpwcVh6ellwZW1X?=
 =?utf-8?B?dFVEcnlQRWlWMFpjMDBXS29MOTBJV2JXR2FKbnhhWE91L3VBOWpTT1JHYVdR?=
 =?utf-8?B?alh6MGpGcXg0LzJ4aEdWMFZZNjZsVzFyY1doaE1tVUVuUDc4UmkvZ2lwVDNv?=
 =?utf-8?B?N2RtOVByUmQ5OUE4LzJhbWhtVWlGREFCUXFjQlR3T3B4Y1l5QmM3MFhXbFgz?=
 =?utf-8?B?L2pXVXJOeXAwSHNmNWtBcEJ1R3RqeS9VOUE4NVN0Rm5iMTBpZTN0bUNseGNX?=
 =?utf-8?B?cC9jdUt5b09IeElENnJHKzVuYU4xMHlSMXc0akJBbEZSNm1mTVFoa0YvM250?=
 =?utf-8?B?K1VIS0pnSkxKMzVVaFQ2TkNmOFAzSGdydUZRc3dzTWFYSytSVFZGY2VkUUQ0?=
 =?utf-8?Q?Q4EhSXWKXABgLBh19LhnxybpMLk9YPck92RtpU+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e0116-a02c-4bd1-124b-08d98faf986e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 07:44:19.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeC5gjwfXn4uCKFoN4uz79GgMKY1joneUfY1p6mC/cl00yjQwbflkwNiyFXch40MkYkazGIeBGdJxfnIuIyG8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Thu, Oct 14, 2021 at 03:49:49PM +0100, Bertrand Marquis wrote:
> PCI standard is using ECAM and not MCFG which is coming from ACPI[1].
> Use ECAM/ecam instead of MCFG in common code and in new functions added
> in common vpci code by this patch.
> 
> Rename vpci_access_allowed to vpci_ecam_access_allowed and move it
> from arch/x86/hvm/io.c to drivers/vpci/vpci.c.
> 
> Create vpci_ecam_mmio_{read,write} in drivers/vpci/vpci.c that
> contains the common code to perform these operations, changed
> vpci_mmcfg_{read,write} accordingly to make use of these functions.
> 
> The vpci_ecam_mmio_{read,write} functions are returning 0 on error and 1
> on success. As the x86 code was previously always returning X86EMUL_OKAY
> the return code is ignored. A comment has been added in the code to show
> that this is intentional.
> 
> Those functions will be used in a following patch inside by arm vpci
> implementation.
> 
> Rename MMCFG_SBDF to ECAM_SBDF.
> 
> Not functional change intended with this patch.
> 
> [1] https://wiki.osdev.org/PCI_Express
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v6: Patch added
> ---
>  xen/arch/x86/hvm/io.c     | 50 +++++---------------------------
>  xen/drivers/vpci/vpci.c   | 60 +++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/pci.h |  2 +-
>  xen/include/xen/vpci.h    | 10 +++++++
>  4 files changed, 78 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index 046a8eb4ed..340b8c8b0e 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -260,20 +260,6 @@ unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
>      return CF8_ADDR_LO(cf8) | (addr & 3);
>  }
>  
> -/* Do some sanity checks. */
> -static bool vpci_access_allowed(unsigned int reg, unsigned int len)
> -{
> -    /* Check access size. */
> -    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> -        return false;
> -
> -    /* Check that access is size aligned. */
> -    if ( (reg & (len - 1)) )
> -        return false;
> -
> -    return true;
> -}
> -
>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
>  static bool vpci_portio_accept(const struct hvm_io_handler *handler,
>                                 const ioreq_t *p)
> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      *data = vpci_read(sbdf, reg, size);
> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      vpci_write(sbdf, reg, size, data);
> @@ -394,7 +380,7 @@ static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
>                                             paddr_t addr, pci_sbdf_t *sbdf)
>  {
>      addr -= mmcfg->addr;
> -    sbdf->bdf = MMCFG_BDF(addr);
> +    sbdf->bdf = ECAM_BDF(addr);
>      sbdf->bus += mmcfg->start_bus;
>      sbdf->seg = mmcfg->segment;
>  
> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    /*
> -     * According to the PCIe 3.1A specification:
> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
> -     *    in size.
> -     *  - Because Root Complex implementations are not required to support
> -     *    accesses to a RCRB that cross DW boundaries [...] software
> -     *    should take care not to cause the generation of such accesses
> -     *    when accessing a RCRB unless the Root Complex will support the
> -     *    access.
> -     *  Xen however supports 8byte accesses by splitting them into two
> -     *  4byte accesses.
> -     */
> -    *data = vpci_read(sbdf, reg, min(4u, len));
> -    if ( len == 8 )
> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +    /* Ignore return code */
> +    vpci_ecam_mmio_read(sbdf, reg, len, data);

I think it would be better for vpci_ecam_mmio_read to just return the
read value, or ~0 in case of error, at least that interface would be
simpler and suitable for x86.

Also I would drop the mmio part from the function name.

>  
>      return X86EMUL_OKAY;
>  }
> @@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    vpci_write(sbdf, reg, min(4u, len), data);
> -    if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +    /* Ignore return code */
> +    vpci_ecam_mmio_write(sbdf, reg, len, data);

Kind of likely here, x86 would be fine with this function return type
being void.

If that's not good for Arm, I think the comment can be dropped as it's
clear the return code is ignored. It would better to maybe add:

/* Failed writes are not propagated to the caller */

>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc..c0853176d7 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -478,6 +478,66 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>      spin_unlock(&pdev->vpci->lock);
>  }
>  
> +/* Helper function to check an access size and alignment on vpci space. */
> +bool vpci_ecam_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /*
> +     * Check access size.
> +     *
> +     * On arm32 or for 32bit guests on arm, 64bit accesses should be forbidden
> +     * but as for those platform ISV register, which gives the access size,
> +     * cannot have a value 3, checking this would just harden the code.

It feels kind of weird to have an Arm specific comment in common code,
but I guess there's no better place for it to live?

Thanks, Roger.

