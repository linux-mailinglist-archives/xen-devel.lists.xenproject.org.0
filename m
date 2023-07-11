Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDC74F44D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561806.878356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFqr-0005i5-LQ; Tue, 11 Jul 2023 16:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561806.878356; Tue, 11 Jul 2023 16:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFqr-0005gK-IO; Tue, 11 Jul 2023 16:04:33 +0000
Received: by outflank-mailman (input) for mailman id 561806;
 Tue, 11 Jul 2023 16:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRYD=C5=citrix.com=prvs=54940d4e9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJFqq-0005fl-0B
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:04:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d63f95e-2004-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 18:04:30 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2023 12:04:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5233.namprd03.prod.outlook.com (2603:10b6:a03:22c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 16:04:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 16:04:19 +0000
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
X-Inumbo-ID: 9d63f95e-2004-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689091470;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EG3wrjbRsczjgbQBhj3L+m/pELl8SwVkEpHOpIHGi5g=;
  b=Svqms9wB8h1dpoYM6UXCF+2BjI3CkFxrHJi5RJjE5moDimtqv/77tcC5
   C5eJ2Rh8FrHEk0RJ9qakO+uS2f7FWkyQ765E34u8OCb+vIPZELYvy5Ie8
   Im5LyF4Pw1qFoAvgG+QXCqV5pyPKqHlfx/YNvIEg7r0jp92Kym614KQVs
   M=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 114567044
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qufqI6DUH9eSERVW/7/iw5YqxClBgxIJ4kV8jS/XYbTApD8j3jQAz
 TYcUDrVOf+NNDOmKotzOoTi90hSvZTVnNFqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpOxGL2VOz
 a0jGTUmP0qqpMG82KOec7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy7x2LCXwX+TtIQ6CLm7ytFRhn6q3Fc+IicKBHDkq/iTsxvrMz5YA
 wlOksY0loAp6EG0R8PhGR25pHKJtAQVXdZ4Gug2rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKkxkxbOQ9BLAKOzyNrvFlnYy
 T2QsDI3gblViMcRzri65njOmTfqrZ/MJiYL4QHQUnOg/xlOToevbIy16nDW9f9Fao2eSzGpp
 nEEhszY9+EIApGlnTaIBu4KGdmUC+2tNTTdhRtjGscn/jH0o3q7J9kIund5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpUmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:Tm6KAq05P/ksb14gbcVwowqjBZVxeYIsimQD101hICG9Lfb5qy
 n+ppUmPEHP5gr5AEtQ5OxoS5PwPU80lKQFq7X5WI3JLWrbUQSTXfpfBOfZslnd8k7Fh6NgPM
 VbAtJD4bTLZDAQ4KqUkWvIdurIq+P3lpxA8N2ut0uFOjsaEp2IgT0JbTqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCWF2QIRO/KovzMjdbDbQQdDxAqxQGShXfwgYSKXCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlvxxnLe9JNfnfrm059mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpGoCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYqWGLm725eBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXG4cTSXR0CrDv1nZNiq59Rs5Vsa/paVFZjl/1awKqTKuZGIMvO0vFkLA
 CpNrCb2B8ZSyLCU5mThBgR/DXlZAVMIv7BeDlNhuWllwFMmnZ31k0Zw9FasEsh2fsGOsN5zt
 WBC79vkr5WSM8QcOZaP8cuBeWKKkGle2OQDIq1SW6XT53v/0i986Ie7NgOlZCXUY1Nw50olJ
 vbVlRE8WY0ZkL1EMWLmIZG6xbXXQyGLH3QI+xllu9EU4fHNczWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXcBAlIYYok8d+X0jLrtPAK4XsuOCeePHPJKD1GTJhXm/kGH
 MMUDX6Oc0F5EG2XX3zhgTXRhrWCwTC1IM1FLKf8/kYyYALOIEJug8JiU6h7sXOMjFGurxeRj
 oLHFomqNLPmYCbxxe704wyAGssMq982sSSb093
X-Talos-CUID: 9a23:EC7+aGHvyo2tkRXyqmI5/n86HsAdI0bsyVyBeWabKmxxWZisHAo=
X-Talos-MUID: 9a23:rSO43wZaHXPb/+BTqzvvuB5ZMuRR+Z+DInoRwL5ZsciuDHkl
X-IronPort-AV: E=Sophos;i="6.01,196,1684814400"; 
   d="scan'208";a="114567044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J523z6dsO4o9ugZR/q8i9IfaecgDlnuXMocbUs+b59sykLInhyF6qsYtI6RiGAScY+ocOIsfRbSAdM03eMBYQc0MB8JTMHH4TZfOkSpR1R8bcWbJNMEnK7+rlgCXj1K/hna+PK3L5TG5o9IGIyb7F6/p4cjtEds1YQHRwkdH2G0NevPOQiKDGJrdULSfDmPSb5BF5tfzREiDYG6ee74Lurvj0zpbL2ypyDS+tQ7PqqY3B9N+881xxZROEUAR4XFz8GcsyB2SQ+Twf+oMlyvXvP3iHqg99DT4CBwbrq41I/VwrZKJa7KCOxzCQHT27y1N94CP5A7khLwu6r5e9/LCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48chY0xPaSgtH4igxXtcrcXiKgeKOLWf++UqDMpz7t0=;
 b=XMJjSyUuDFULHMJAtBJ5i3OdEQzmPPE6wSBG3SU4DdmvkDvifF3QifQ1ziIFxHIgrRFseRiNZzCC9fheYsqASuflRcCvDW5JrsDLjtBegLZ+jkKikdlChp1Xz0uB3T6PakoPXsv+JKUIX7m0/PX/OuevTxawGwo4yzuAbTOtjeE1aJY+hrGgDjqW9e6qc9CGIr1yvExO51BzlVuqn05MckKDXI74NsQfKXTGUtkYvWTc5R343BzukFpEsE8apzljG7imJDbQ4+xMcCr9zmerNCEagi73WOeWY6I+LHroP8wm2hd8e0qHIOxJWoRTqSiQgikxDIiwm9ig4HZtVfbnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48chY0xPaSgtH4igxXtcrcXiKgeKOLWf++UqDMpz7t0=;
 b=ihAWeKkq6KRrVDzhOGVQftn4fBj4qoylwFN6HjEZ+80DT65ER6NZuVC4OR3/B7gVA7jHIqtCGpBz8OG7HHuSbBgdmBl16wpJIuexNdATr6OKXwK93PraZoLJeBT0soj/EnZD4p3SuzCk1bcHT/e+hcmH22uZ4WBxbXRi2s0qma4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 11 Jul 2023 18:04:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: pci: fix check in pci_check_bar()
Message-ID: <ZK19fKfVCH4Od6B1@MacBook-Air-de-Roger.local>
References: <20230711154648.729567-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230711154648.729567-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc51131-9ac0-49d0-7d48-08db82287b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vWGZSkgp+FZGXJ2qWXrtNkBSsIuiLOPqBgyYyAUKzfEtg0bhD4siY9Z5CKSsm+HxahADj/t+Ub+0kb6ahdPWpYBa59jjVwfTm7CzAJZ/QNkpYV0vRmnGTg1E0QaOlkNo/cKMFDZ1i6gzt2qCfGSgtbe2cSBZHHOgqlrdqJsOC0EW9j0beYBH+fTHkKCZUAxs9GE7ZtkWPInW1CHGtohbwk697i+wdcK+jsaE03r1uaU3SY2uKt4y37C+Y99HgN7EPYOtoW9oLMcS2/x4SMnOQvCPBRR7uOm7GFvZwd/owh4cu9WLT8zplfuurxP9wK3i71dOjmc5ehgKbYwPJiFOOWP+TfevOAaoxPjYEpp4khRdTdDkloj33JXwjLg70AyJdJGr03EpW0/aX1RiFUo+UwBUKh/0IlHr66jtp1yF4K23ygSB9OBD5n5U1AX2OLmF9/VBFaxw47j1ylCFXMZnwX3vUaRyfH3oiKoTEFbUjHS4893YRPN+5M22PyiffVPBiocLZ+r3jLF5SVlXg7s4u0ZZhkujjjp8ssNBlN6WWWB/+msF4iXgqqhvmfqOhfku
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(86362001)(8676002)(8936002)(186003)(85182001)(2906002)(83380400001)(5660300002)(26005)(9686003)(6506007)(82960400001)(6666004)(54906003)(38100700002)(66946007)(66476007)(66556008)(6916009)(6486002)(4326008)(478600001)(316002)(41300700001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUw4UytsdzkyRWttd3lBekNSTk4vQ0VzZXlWcWJsTnNieDR3WEc5R09mSzhm?=
 =?utf-8?B?UjlFVjROSWN2MmV1UUNpK2RwYkNDVExML0cxc2lHbnJyNHVPNGV0RlpSamU3?=
 =?utf-8?B?THdnNjdRSGJGMVFlVkU5SEtrVlpTejQxaTdTb0VSZktubW1tMUJoek9yczJZ?=
 =?utf-8?B?bzQ2dlZnM3QwbzR0c1BhejQxR2ZOa0hrMUdlcUJMOGpjVVI3VG5BNC9FZU1y?=
 =?utf-8?B?VmFqc3JFNm1JL1RTZ1piVU14SDdHdnkybVBSQmdUVzdZaTdEdXFLbWZta3Ju?=
 =?utf-8?B?TlA1Rm9vNmNQS2Urc1AwdWI3SkE2TGliZUJ3V2R3MDdacHRZckJmMkdpQTF1?=
 =?utf-8?B?NkFSTzJVQ0dsakhadmFGMXpwVG1TWG1PMWpWMmkvNGw3R3lxaE11YnpWTXJ4?=
 =?utf-8?B?RlAzVjlrYlkyUUlWMVFNeFZENnk5Z2Y5d1NCQmxuQTV0b2tGOWE5MlkxM3lp?=
 =?utf-8?B?YW9YeXpWbHZzRVd6RkVKdmQyWlRBNzYxMjZidkZVaW5hTnlIZWJRZWlkL0pp?=
 =?utf-8?B?SHJyZVNuQW9MQTVVdzJLS2pMalh4Tk5KR1pZRWUwSzcrR0N6cWJDcmFSdjJ5?=
 =?utf-8?B?ZkJBK0xXMEduZWxZNHJNQmZWZjNqSCt6cy9lWkw0WFVLNlVUVjlvSGNsNHdj?=
 =?utf-8?B?RlRTV2YyODM0S2RzbEJBc3VtcTNHTzFyelR1czY4bUZJYk56MjRiT0E5SUtz?=
 =?utf-8?B?QUNhT1J5ZC93cGtkZXB0YlJwampnUm4vRGFGV0VkQ0JxSk5tTERoVFJjeG1w?=
 =?utf-8?B?OVh0TTY5bExFc3JDSHNoMFhEbkdyZmpvNmxTaTVmTXlWTC9Bc0I4WGFscDNL?=
 =?utf-8?B?NG1ySGl5NURlRnBlanlBZUZJTlRreFRJbm9CdDJQeFNoZHZZbUNoMnp2Mmo2?=
 =?utf-8?B?S1VnMDU3MzVlbVF5Y2ZtejVKYVA0ZjhyNm5ld1U3VHRMTUxpQXI5R1VwRDl2?=
 =?utf-8?B?Vzd0QjdxRE9EL2cxY0xQaXI5Y0FJL3RnRUVlRTMyTnMvTWs4UzEyTHVvM3Rj?=
 =?utf-8?B?bXJVZ1NxM0ljTmViRUFNalh0ZWJQM01YRkpJaHYwUWpnSjM1cnZKYzlsYWh5?=
 =?utf-8?B?ZVJrOFRTeGlWbERyVzEyb0o4MTFlZ2JTWlpRSmVpRzJvbW5oOUZMWDI0WUQ0?=
 =?utf-8?B?aFZWOXpncXpLT3JWVnA1SDFseXM2UEJQSUVMKzVBV2FKK1BwanF1MER2UGFB?=
 =?utf-8?B?YmkyUkpCaXB2bjh0VEJNTkgwRlozdVlob1ZIVlZqNUJYQ1Y3Mkc3OHNCSEdl?=
 =?utf-8?B?dklFTnZiM0o5REQrNk5mNXFmUnF5U0xSVU9sd1NBYUJEeTByZ0tCYlFkTkF0?=
 =?utf-8?B?cUlXY0RDYWJ3UVRER3phWktpenlqaTJnVERHcEk0L0pzdE5NZTdnTDJDUk0x?=
 =?utf-8?B?T0lBNG1YZ2l2U2ttcXpBNFVVNkNrNDJMS1JEbG5uWmMvam1GdVFGaW5nNXdH?=
 =?utf-8?B?RFVSajlqU1BxN0ZPOGpibmNzWS9oL1RjYTExaE1aQTd4czNPcmxoa21aQUpX?=
 =?utf-8?B?dzZERFRnbTNRQ01EK00xYUVQTFRLZ3dnT0ZaVktpOXpZYVhPaE9iVDgxeURS?=
 =?utf-8?B?L0RmZjVPUW9RWTBkVVhvRDRFRUUrT0ZuQSt1dFQ0bWV4NlpoME5aMTZPcDZ3?=
 =?utf-8?B?WUQ0MENXSHdSNDN2N2xaTmcwa3k2Z0s5SmlNWk9UV0VKM3k4TEFaYzNONmcz?=
 =?utf-8?B?WHhrZU9wS29BU0R0OUIyWEt6QitJaGxRV3VGaXlNalZhQ2o5R1A1dFJNaktV?=
 =?utf-8?B?WmNoUlRVRmh1QURnbW9ya1JBOEx3N0FLTEUvM0ZqUW84dUd0dGlRN3N2OVp3?=
 =?utf-8?B?RmEvM3B2dDUrRDZYSGNjSXBkbFZWNDZwdytHU1hyK3dGK2JjL1hSR2QzN0h2?=
 =?utf-8?B?UlZOdjRuUDhOQk5WWU5lSnVCeUpBWVE4QkFvQVQrc05NTUVOYktyNFJ3M3R0?=
 =?utf-8?B?d3lYN1d2M1BRcDlleVJXOXdMSjVTbGFvMUJjRm1FRHc1TUQvZ1BKWTBmSUZq?=
 =?utf-8?B?Y1ZjT2VSY0JRM0RHT25wKzNkbmh2VzRGWm85WUtoTHJVVkFqRTVCLzByakRQ?=
 =?utf-8?B?YXdzelVBRUdVVjlycXJ1WUw1MzRaR2pOdUFVNzJBaXArOHBvYjF1aUV2OEtD?=
 =?utf-8?B?SVdqSFVRNjE1dmxZVEpqdGhMM3A1VzZTd3JwbEp2VUY3cHV4WTVkNjBzc1hI?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7gl010KAd11/ayFUzy8hMbpopQB6yuMswZUAfxeLfgtduFIAYh0OAy+wftiLi9l01ZXq2GPkS0etMO20oagKiwF2JhOjgTUodP0bje0F7T0K8eMVVZp71hc1ZIiJQsTMBlcVJrr8pDoXNHssz8IQsUpWBICrDqZ6C0EWjtQAzduXZwQLDf37ZehNBDU5W2qg9dpH9ckKoCbNMJ6oTdaccZ6Ds+aXreCReRrVHc8qXsgyL9LyOz5hSgI8QoT4KCHXavRr1EBIKV10BxpSf6FnQWeBdunFjw4yRg88NkIaf5DILe1y7spUz0er25ltnM2m+92thCyKAotXEH9QEfei+8oa33l9IB3+oR8vX47Yl7O8q04MYbi1knsj6q/0V4GoHoOC2euaG4W8XHKvn3Nvgzn04GwWwraFU55BlcdJb9pMBLOkLEO7Zd2EoMP14hSAboSG5vS8LcsHtUAzD7b0NqBRk1DXzE9p6oVRnrgWkKRIF8AgSynbTGQifP0+hBn8H3hjFzeyFB7zaMWCjamkB06YOpB0VtghXAvA+o+UbB3yxO+m73h2MM3uPAQcMRIEOZW5yNR7U3uTYYpl6gI2Hx5NgKieO4FkkuCKuW26VKMp3xcz0frBwhHd280Y9IgEJAeb2nCeS2JZnmtyQTwwr32IAYbKtrU4yYRd3uc1WDM1nVdG201bGRqBqc6YfDNlRQIufF7ZqCkBho+N1E5nHUXaVrx2vmBOhU/JIPJf2jIAwAfNHiZwuq6CgbhgbhHWIlQcuYhLvAlQvGDzNjhjDV7q6ePpetNtP6nihrYc2U6sxh+3EP8GOx7lF9yklHUlOaLBJiShFuytNVKL5OTzzfzSXRxdq8AyTgFMZ1jOVPma4Rtc9P+T6GPAzOuKY3l0dnnHiSbXvM04gLjs4jFBHg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc51131-9ac0-49d0-7d48-08db82287b54
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:04:19.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNs1mJLuBEKCkkduerk3k/Xu9qLs94SQhjqdEqsuxx6trVhU/DnTI4HRZKDglLWUxVT41F1QKzecNgEJx3/1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5233

On Tue, Jul 11, 2023 at 11:46:47AM -0400, Stewart Hildebrand wrote:
> When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
> end address (i.e. s == e). However, pci_check_bar() currently returns false in
> this case, which results in Xen not mapping the BAR. In this example boot log,
> Linux has mapped the BARs, but since Xen did not map them, Linux encounters a
> data abort and panics:
> 
> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
> ...
> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
> [    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
> ...
> 
> Fix this by changing the condition in pci_check_bar().
> 
> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  xen/arch/arm/pci/pci-host-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 7cdfc89e5211..e0ec526f9776 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -406,7 +406,7 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>          .is_valid = false
>      };
>  
> -    if ( s >= e )
> +    if ( s > e )

I think you want to adjust e to include the full page, ie:

paddr_t e = mfn_to_maddr(end + 1) - 1;

As passing start == end should be assumed to cover a full page, and s
== e won't be possible anymore.  Adjusting the check to drop the equal
is still good IMO.

Thanks, Roger.

