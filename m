Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B6699AA9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 17:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496689.767565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShYz-0007Vl-U0; Thu, 16 Feb 2023 16:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496689.767565; Thu, 16 Feb 2023 16:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShYz-0007Sg-Qi; Thu, 16 Feb 2023 16:56:53 +0000
Received: by outflank-mailman (input) for mailman id 496689;
 Thu, 16 Feb 2023 16:56:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pShYy-0007SW-LX
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 16:56:52 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bc843a-ae1a-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 17:56:49 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 11:56:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6498.namprd03.prod.outlook.com (2603:10b6:806:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 16:56:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 16:56:42 +0000
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
X-Inumbo-ID: e6bc843a-ae1a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676566609;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ScEPtJroA15XXAqG9cKWaidweZkIAsE8GbMwa1H4gXo=;
  b=CF260E5X5AvZbgY6hoU7FbP1OVK1aoRDKrujACiP5cDtjQIQkbGbqssc
   1T2pHG91V0WJRcL3Aa6ZuVqCudeDIqP9fIs4MVSrEQKh9Jb81XSZpxumK
   xJMD/HMwdbKdzvZ0L3k9Snzw0mkBR/xxVVM8AOF2WZSDAmIw5NaRTZGzh
   8=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 97343669
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IVaX4qOCrRUGCc7vrR2YlsFynXyQoLVcMsEvi/4bfWQNrUol1mYCx
 jQdWzrSPv2KM2v0ftpwPN+yp09SvsKHy9QyHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rgqUXFN6
 9sDEjQMdTeioeeIxeLkasA506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCPpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eewninA9xMRdVU8NZL2VeZ6WhNVyYYD1e3paS1q3+xA/dAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaESoaN2gZfgcfUBAIpdLkpekOYgnnS99iFOu/iILzEDSpm
 zSS9nFm2/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:pwxuFqy5NV+GFnEF8iInKrPwAb1zdoMgy1knxilNoH1uA7alfq
 WV954mPHDP5Ar5J0tQ/OxoVJPsfZqkz+8Q3WBJB8bEYOCEghrSEGgd1+XfKlTbckXDH4hmpN
 9dmsBFeaTN5DNB4voSjjPYLz42qOP3k5xA/d2/856bd3AJV0lXhT0JbDqmLg==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97343669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN9pEIulKzxWTMT1H7+WlI0Bv4zI/ZbXdNh0L9DIuj1DtJwIHasBA+bAH2QfWekF9Ora7s2YHqhqmoZbSRy0X/rWtlTg5PcXrlHmSAXmsu70sBNfvP6vmY07mPCH5nR0obedp5XEiQx9TqEeQOrlU16vyxgUUHk4/Jqv3IT0qPfY0Z0IHeI44QGpc/UcTdjPqwJp3qoyOoDcYOinrhiUf1+q20e/vgCC30RwJy57qKn7HBOG73Ltrlb5V3h3r087vvZmNWr/tuf5AgktGG7wDd5M0zapz1pbV0nx1G4YfhATdQ8Cq8D0N/fcW3ucwAFAaYOyKx+FpfPZseirsRNnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNQ/RajlO/Rq7MWST7tRnT05ATiIScW/sbRdvrcAsvU=;
 b=JCf98jyNQcSK1POvWYd5Gpp64WsX9XekIBV6V6+MrHj4Mue9bjohb8eP/sH7Grdtj1NuBbGxgKXL+gMBbpmBf35XCZwFKXtxywoQfn6J6XVkWeT2Y96SlV8H6VB/v3WnWKzFPv/0EZ4jOpLzFWBCKx9WeducmEz3r4DzEgyoW3DYnFVSROWpJZB5XSYuuz0aqXIu518jMyauMcrebmX7wiBMPyZJr+AHG322dhjsS0VNw+kRReG8rhOKtHsX9zJb2oCVbkB9qEVk5ZzolBuIU/cOvW8Ep3wQxNXa268eQRX5Q+C9BDpoRLTiQkx6ZeZuS/SGea2ZhPJYhOK+aV28Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNQ/RajlO/Rq7MWST7tRnT05ATiIScW/sbRdvrcAsvU=;
 b=OxB0l2nZJ8VLThglKMxhj0A/+mOEtlUVExWoJpMny/6AXtz1cf/eCovf+yqKsBX6Fqkm496Y2ciNOz9wG34zFepAgJgh62xmF3IyJsonWv7ao8XXLNs/q8XgfhaA4qRCSRtKxL2rNk00XYWhqi24zYxmORNo8cLk42+dpEbHTkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <45c3f466-7983-734d-b810-57852bb18b73@citrix.com>
Date: Thu, 16 Feb 2023 16:56:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230216141007.21827-1-anthony.perard@citrix.com>
 <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com> <Y+5gBpQiogKinuHf@l14>
In-Reply-To: <Y+5gBpQiogKinuHf@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0364.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: c90aed2d-47a1-4857-16a4-08db103ec781
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGAKnSvEToNF4alZBDhZpLD2sK7Md542npR/CI88SShV/hyKyMRluTeq/SmBISamH8iHpaOl9+g4qtAPBwT96ewjkUKBFbwz/iF0rL5mPXuezup5FJa5Q7xnnW6A7rLXA0MDUaaLmgCKGTt4LnQbIkEewuRnzjvdkiA1MZtWm0c2U1IpaucovyFMem/AhegExusgEW3gdQyOxJTJEh1kCYS4rNOUhtxiuVlO730udk0rBv3SYgjBFyx6WTuHrsnmWSzjuorTFHOvdl4xe/sQK+RZNw4V1f1uexPzEs4G9Fr9KXg9Bi2YPbxZ6cZFrr2L3xMPoyd/I/am/Rf4/OIKRUd0S/C7ymTtgQ85+73un2LhdJ6ErXJbyl29DN95ubDsPHQTS/uZWDgDl961QIcpKgvLm8VmCoRzyv4KLbyiCkPRolPu8gaj17W+9AmX1uE8u95fndqYymb3cCykhPPpYJJT5iHtdyXvLYR9rQfvoNOMbA8/QkAVQRlVVe+imGEaoDF0d4fFHD0gr1RgZ1cO5u3IOVCPJRY41m3Qq+Rx53jsuKy0jHEPOgZ+jUr/qe65DxMSK3eRN6aZ9MqFOiTCHhs+HJ+cLvPypnu6j1qUT4pb6qpn2ON8IXLm9F83shKy51wHUsK5pMicD6lHQvY1llBcAe/Zti2ozb9lbGGcM+gnMte1d4TOixau4YpLkle/SpW883rodfh+wS1KDyDNpvYp+rs7nIwu7E9P1c9lLRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199018)(86362001)(38100700002)(31696002)(82960400001)(6636002)(36756003)(4326008)(66556008)(66476007)(66946007)(41300700001)(54906003)(37006003)(316002)(8676002)(5660300002)(4744005)(6862004)(8936002)(2906002)(2616005)(478600001)(6486002)(6512007)(186003)(6506007)(6666004)(26005)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUpxMVZIby9aZ2QxTzhyak8rNy9sdEdVRGNiTHdHWTRDM0ZPNVFCRWgvRldG?=
 =?utf-8?B?UGJDV3oxN0ZJKy96OVJrZ3V0SitkZWtvTlFUdGgyQlZzS0FvUjhVWW9KMmNT?=
 =?utf-8?B?MHE1dXJoWjlWZmx4SWVmM3BXWEZBS1Y2OUx5UWRlOStJUlkwUEZUZS9XSWts?=
 =?utf-8?B?WklKcDF3N3JhQWxVUlhUR0I3VCtpZGlWYmpvWEtLM3E3TXNtSlREY3RiTTV2?=
 =?utf-8?B?N1JFTGRmVk4rOW5zZzdDRmtrdk5ZOTl3bnc3RnBLK04yL1VQSHBLc1pCSzl3?=
 =?utf-8?B?QlBRY0NBWXphcDQ1bm9EN0d2U2RpNEs5Z05DNTJNdHlWNmtVTER1M1QrcTJF?=
 =?utf-8?B?dFNuT0RGUjZDMzFVamFmaGZVODJGdE1aRnhwU0RJbkJHOVlkUVg0cGZSQ0tX?=
 =?utf-8?B?d2pGbVVKYU5BSFhTV0pXbjQ4czk3RFBTWnJxK2xPNlhNQVgxd0QxSlJiK2pt?=
 =?utf-8?B?UG9qSG1CVXRwQ0lzK2dEOWVnSEVoWXB4NjNVWjRScmV2VEV6aTJQekFsN3RF?=
 =?utf-8?B?VUNrbytDdWI5WEd5dEdOaWRaTERiTW9hb05yTklEaU9jN0RrSVNKNzJmV3hp?=
 =?utf-8?B?QjYxNUVaS0lmRGZwajFCc2VjaTNId2ExcTB3QkVSL1hKYTE0ZGtMVGRHNXdy?=
 =?utf-8?B?eG9oKzYrSXZSWE1yMDE5bEdzSi8xOFFOZmxWN1FORTJ1ZXFXVzN6Q2NpMW9M?=
 =?utf-8?B?Z3BycU1EcVRXU0cxRUFQbUVnenF3R21kSGlyVEFWalU4UmZLVFBEQXNseEpZ?=
 =?utf-8?B?SDA5dENURmY1QXNiVnlUSHBSMHRuNGdIK1Uwb1UyeUcrMWR1QVk5a3piaU5o?=
 =?utf-8?B?SVhHbGhhZ2dpOG52bCtOMzZ0OUFlK3FqV0V5T3cvYnFyTm1EbkJhZSt3Rys4?=
 =?utf-8?B?VWtISWtvU1R0WU9adE8yLzJTTkwvb1lLRXRtWHJtS2MzMlArMmkyTVNXL0Iw?=
 =?utf-8?B?Y2NndEljUzVUMkkyck5RV29wNFFyVW14MS9QTDNYSENUUVI5dzhlVFlnaUhL?=
 =?utf-8?B?Z3Zxa2NlVmFPYjI4dDI3aXdRMnNJeTUzNTcrM1FIOHk0QlFOTzFlWFllTTAw?=
 =?utf-8?B?VzZTdnhsYm9lVmF3SU92QXRvZHRJbG1aKzF5cmtGVzU4WXp1N1M4ZGhGamJU?=
 =?utf-8?B?SFVlQkhWYWZqeTE1c1pndjFSNVZJWnh0eUh6b2JobVNFZkw0RG9hdXZUK3lF?=
 =?utf-8?B?MC9xVU5EWGVpOS8rc0Mvd2tSOU54NmFuSlRKQnZBcDBUMXBjRGRMQ3ZndlBJ?=
 =?utf-8?B?YTdVYWtrQXlCaUJXMmtKb3VPZEI4cXhvRWJmS3RSbmNKdTFVTUdTcXBBOWo4?=
 =?utf-8?B?OHB2SUxtVGgvT0JLZmllV2dJTU5oVUJzakh5dDNOR0F1azBtOFRkcHdwQktC?=
 =?utf-8?B?OVF3QW9uSW16MWdzS3ZPV3RiaGxpbzNWQlpucFU1VlRRNTA3dXozeEVmU0N2?=
 =?utf-8?B?dkV5Tlk1MnEwTkg3M0RXTDJJN2p3QVpKSzB1UDBzWk9OcnZncXFjMnJuSzlq?=
 =?utf-8?B?Ti80K2YrM0tKNVM5TkZpWUNNU2EzbUVzQXV0OHM4dHErOTAreGV6SytIVU1G?=
 =?utf-8?B?Z2c4NUdvZmh3ZDB6SURqREc1d0lMMU9UR3E1cUNYU2d6RHhmTklteEExUnI2?=
 =?utf-8?B?NElGQnVSNlRreTQvUkdtQ0lLQm5TL2sxVEFlKzEwblB2bXJKSUt1c2V0NERD?=
 =?utf-8?B?Rks0TGEzUUJnSkkrbTU4ZEhtalpxcjROZ2VuTlZsdzlIamZZZHRiZm5IT0Rp?=
 =?utf-8?B?dE03dDdVNjJSUWpWWXk4M3hOOTZSVjlGOEh6UGEyc0JPZE9wdVJOVTFiSDl1?=
 =?utf-8?B?Y1QxaXpCdDZIWnZwRlY1SUNOVm9TVXpuV3dBL2NIazFDdlFHSEZwTjNzOWpv?=
 =?utf-8?B?TUJ3dG1IdGR2ZHpHeDFlTXIybEZxdHRXZlBuSGp3cGZQejRNcjY3cGVVQlZN?=
 =?utf-8?B?SXIzcG41T1U5Z3I2aUtZMWd3YUIzSXZmd05KR1lySUcybWtYSFhtN2tKY0Ji?=
 =?utf-8?B?eTlzRTlYNWNFa2hWQlcrKzM3TUdabzNoZlVmUnVTWW5Eemh2Y2ZwNVhBWmNR?=
 =?utf-8?B?RVZSZE91ak9ZbHV0c3QyR2l6eVJ2UXQ5a3dQb0hISkRobzFDNHUxaFgwa3I5?=
 =?utf-8?B?cVliMFlQU0V1VExIRGRHOFZmeGJEc3pGSGNwOS9lS0MxeGNXMkVBYUNBUFN3?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Af11IRT525OzRwlT6e2VPm/1wfmJLIe0gUCw1LlLcs4K8xPrwb3TMX95/8pPWnOaMSIrd1XGq8okvy+Cfmp/+qxe8IQD4EiRiO3/J5PoaEvA8QyCNola9GIha/2SyO50uhBwyumFI3Y2OBBsDEYhs2qx3fCTxLtSKprovOJxNw1pandT40uz+c7PYCVh8M5ao37o+0F0zLTKwnviAIblklIJXundjVNgVdwbVwmfimZXctRHswuzoJpRKLA51B9g/KUcXa/WL121KhVm7ALLSLKwdVZ9AcuYKEyNe+s3kFEneab4TjVFryguKrNJX/EVEF2JsY5HVp53f4dM9UuYI5rq07/GNjMEF8j2poSKvSyfe7AfME3ot14yRybtd5ogNbthUEb6NtH7ovJ2Zv7ykaCiFzjt6eXOy4xwFVs3gwt121KYb/1wk+1PpaYG80sL+AEOtF26UQQQ5ahYREJQp3h0MFj1f0GnX2TE38hD3tJHugjgoWwoFpT7HyoASBIjsR61g0UvbekVtGlrvRLIQcN/H3nfFaqw7cYeNqX0QpuLGCfDo63ZKmjYr9t9E/YAUD59MfHlh+Wg92B+ozOOdGJbK0TFO59vi2baykUoWHHesW0qcpzGdkWr0PcLl58+WSM2pL4Na2i1kDazIsf6LgDH7iT4az9232+E7Pmd5qgGClkbl1t5FqgIpKs9p2Co0MWy/Es2CjypttkofdrPzGSfV9pNm3NIhiQlaiHsaGp2HHv9iXqxYeZse6HXsQ5PgZ3s/zg3KjUwOBFIBKu6YjW21Evcobm5h/TSKDbvRaqB2fFxdiWL4ecb4cdIsdC2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90aed2d-47a1-4857-16a4-08db103ec781
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:56:42.6699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRZm/FvSOzsqJDFUCHfDCjhjFxqLXr7iXLgp8NddgivkwAqcq4GOAuxhNlC0QGYRUd148Gi0Es+NiUjJ0vTvV7O08Ka9uDFhQczVySSuBV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6498

On 16/02/2023 4:55 pm, Anthony PERARD wrote:
> On Thu, Feb 16, 2023 at 04:50:09PM +0000, Andrew Cooper wrote:
>> On 16/02/2023 2:10 pm, Anthony PERARD wrote:
>>> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
>>> index 0e4b5e0bd0..ffb6c9f064 100644
>>> --- a/tools/libs/libs.mk
>>> +++ b/tools/libs/libs.mk
>>> @@ -120,7 +127,7 @@ TAGS:
>>>  clean::
>>>  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
>>>  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
>>> -	rm -f headers.chk headers.lst
>>> +	rm -f headers.chk headers.lst lib*.map.tmp .*.tmp
>> Doesn't *.tmp cover lib*.map.tmp ?
> There is no "*.tmp" on this command line, but there is ".*.tmp".

Oh, of course.  I'm blind.  Sorry.

>
>> Also the subject still needs a FreeBSD->LLVM fix.
> Sounds good.
>
>> Both can be fixed on commit.
> If you only fix the subject, then that's fine by me.

Sure.  (Although I will throw this through CircleCI first...)

~Andrew

