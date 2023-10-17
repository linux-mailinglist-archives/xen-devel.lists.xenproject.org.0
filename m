Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F57CBD5D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 10:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618135.961421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfQy-0000vS-F9; Tue, 17 Oct 2023 08:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618135.961421; Tue, 17 Oct 2023 08:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfQy-0000si-C1; Tue, 17 Oct 2023 08:28:12 +0000
Received: by outflank-mailman (input) for mailman id 618135;
 Tue, 17 Oct 2023 08:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgJ9=F7=citrix.com=prvs=6472a2412=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsfQv-0000sa-RT
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 08:28:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17c6fe47-6cc7-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 10:28:06 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2023 04:28:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5541.namprd03.prod.outlook.com (2603:10b6:5:2ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 08:28:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:28:02 +0000
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
X-Inumbo-ID: 17c6fe47-6cc7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697531286;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0Vxu8WXQzWtaZqknwBgdUjKA0PXdKHJwAp/Kb1NMfF4=;
  b=dZWo4Kz44BY2zpS4YEMTFMkOtODn6pkeqlTlqI8rBxPeUo+k/HTMuqfU
   Xz5+k9Fp6vNXdUWjlIssD3QpukGs6zDEV3p1P07j4q3a2d4vLE4W2+CgG
   978H9c0AO/wEHLfH6UYcss9evTTHnComRBTZjcdhWOao0ONNDTo1KgHhf
   k=;
X-CSE-ConnectionGUID: tZDA4AEsQw+dO6ykbkA+WQ==
X-CSE-MsgGUID: bK6Z7kJVSQ6bmCArpwA0lQ==
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 125667593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LHW9A6BWy9p9VhVW/+niw5YqxClBgxIJ4kV8jS/XYbTApDl3gjUOm
 GYcWmqCPqrbZGP1KItxOo639kwAsJeDx9AyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtB4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5tRbKD1n2
 OchN3MBSU6ShOi16fGEc7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC/y2LCSzHiTtIQ6Hp7mxKFpomOo/zIZDTY/T0OkiKG9sxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4M+A88hDL9aPS7C6QHG1CRTlEAPQ5sOcmSDps0
 UWG9/vxDCFrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG0ygusVhMtSj6Gjpwmf2nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:UjwOgKOc9z4MXsBcT1X155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar4WBkb+exoS5PwOk80lKQFqLX5Uo3SODUO1FHHEGgm1/qa/9SCIVy3ygc+79
 YGT0EWMrSZYTdHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjjtRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayAqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD39vac7R6e031loqqu9jJxPr3MtiHTEESttu+cXvUvZ1RFhkF3nAjg0idprD
 CGmWZbAy060QKtQojym2qn5+Co6kdT11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M+44u1jeskMfr7plWJ2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 gZMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849Vcegy28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBQnBNWqDSG6XZ53v+0i926IfzI9Fld1CIqZ4s6fasK
 6xLm9liQ==
X-Talos-CUID: 9a23:IzzTz2D9t9VkCx/6EzVV2GdIM+0+S2KewFCOMkyyCk8qd4TAHA==
X-Talos-MUID: 9a23:a1kPZwSapacGzBTORXTmp29Qa8RK3Z+XVkoIurwco9atbShJbmI=
X-IronPort-AV: E=Sophos;i="6.03,231,1694750400"; 
   d="scan'208";a="125667593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jer61pZKCNcZMGN3gm0W3uS6p6/Sq3PQ5+yAoUTUbRq8+9AWm9YSmCtcv0hVhS5hqFegyeDYlPZMp+M3JQ7kCEvfejZ8mDswtG8aY1zVDfCWmoKe3D4iTubNowFihJPskI+hbqLyEjE/NAC1qfF0VqNFcJY1fPJFJHw2o2StciJMdqpcZ9E+GTyIdfB1cllXRzLYfDV6Fk1azpORpMfLKMO0pyi9+4+lDH2f0rRSIJ2d9ArsN4sizmnxLcJPpHwkAYzDmaW9Wjxp25S47WgFFZjeS8LiF2DQ2YMKbbGp+1hhsKF7WaIbP4pv1XrOV6NQifsWNtw+tRaXJw1+2p97xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f54w6Zr3KCTJo1wod39vZ3xfbmZtRo0OPjz69LMXohI=;
 b=fx9GD6aT04eJPMIhLknXsLNefKtKG6rW28cO4AMxnPb+XvrBpMJ7GOQD6squb8Md0kfW6lrmS8/kQhhgoszq7mj06r0p6BmWTpq1y6ZJ0CJ5Xt5Xvzz1w9RKj9MMvuV6boxixA51JwuAzUkGXswHePbMZG/z2FSLG3LRmIy7+eK6e9YruldzR/5Q/517hIQ87NcQNz8IA09AsUder7PzQoauS8OCIy8YbQ0WsBKqC4ml/yG9vhUBjOSYNbAUoXX2apAe+7u7z7iYyMEhg9uewFbQ3HY4y1HqqMiupcw8+0EK80XpLU+6rTADVK8v3LP6lMObnRTlCeRNwyIjBBlwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f54w6Zr3KCTJo1wod39vZ3xfbmZtRo0OPjz69LMXohI=;
 b=A2d2ZRiiI187TAx8FNYniUUvP7vfpTQgF/J0QdBgXobvBKPy//fywnWlFRzZ0ej0wMD5H+OEmY751aLdkg+SY+rJ152o0fIwaW0GTnuXFJJMWyTJ/iga7RBr/U4Ul9jJoHmR0pf/WkjKrapLW4lLIPYRlTlYPs6Z8ZrAVAmNQ2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 Oct 2023 10:27:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZS5FePRbBPG7wUIc@macbook>
References: <20231013085654.2789-1-roger.pau@citrix.com>
 <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com>
 <ZS0_zPxGLwfsuVvX@macbook>
 <879e6934-93b3-e260-770a-966cf8bcd2f8@suse.com>
 <ZS1N9wZ05ebun3WJ@macbook>
 <35528dc6-dbc0-3f3e-e774-c2fe4094bffa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35528dc6-dbc0-3f3e-e774-c2fe4094bffa@suse.com>
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5541:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a02c78-5243-4b67-53b8-08dbceeaeeae
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rOduWGisNjUYVYIDvpRsV0LLvkmU/hC9ek0ML3IlRSlSsS092oTyY8RJVSCkBLBR3CNJrbaKEnlmtCxGKFuBZ4G9lbO4O8qEPkBTdYf0TcW3iT05ZpKXX1k3+lyzfE0pG62ksCvCf6BI050oagIe0PMGCCH8+Lp0WMOs3fLRWONJSfLRJl8BZeLVGhvmrCTVnktSGIE7U45tcB2t9XaXBH0xKTM6En7ZDFU56cp0+kvdbtFnNaeUWlyPVznKZgJLwaSSO1YK7aUaUizISrdp82FiGsDQitj5FX3s8cqxkM7/QQLwthdM+c8SNLAw1SXo7W6bPW2hU2QUOxlf4TF4YnffXVit9gG2k6vt223YuyRgGBlkE3xnbGUiUR7SvaAop2KWRcA2zvc+K8NsroATPrNUKF0yGKfGtjvy0Vmz3lSDH5813Z/2JKYgP69gwsaj208bvTD6CQC4CHyNPZRYMboS1rR8rMuz9HNizMEoxultbIUa5T+m2740xwEhtd5E4zaEIe4WY/QxanKmP7VmjMESkF0i9xsjPrTGS3DEA+MGtgSzqFS57W617XrwGiVj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(33716001)(6506007)(6512007)(6666004)(2906002)(5660300002)(8676002)(4326008)(8936002)(41300700001)(66476007)(54906003)(66946007)(66556008)(6916009)(316002)(6486002)(478600001)(53546011)(9686003)(26005)(83380400001)(85182001)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWNWMlVEN3BxUGF5a2lzNkdjTktIN2NSRzlOd1dMa2R6cHJWYVJINHZYaVh4?=
 =?utf-8?B?VXVzTHRnemFYNGdBZnJsVXRpZEszMDh3U2FEeFN3VUhWS3dvY0p4UmlBMDVo?=
 =?utf-8?B?bmRJNkhEZ3BKM2lLbjlRQzhBS1RwVE0xLzBCelgzd0tNQlhxMk0zb0JhMFVS?=
 =?utf-8?B?T1NRbG5XNmlMd2trWFpmazU4YVdLM0FnRVNuOUF1elRjR2E3emtFTGZZVWZG?=
 =?utf-8?B?eWx6TVlmUG8yVjRTS2ppNU8vNDVmeS95YTBGcFhUeGpIRjltZDZkSXNWYWI0?=
 =?utf-8?B?emtqaFJ6ZjlaQzhkSU1XTlVHYWxZeFZvNTdTdG1KOWhtRVJNMEtzSnlBNUp0?=
 =?utf-8?B?OC9rSHczWVBNdlh2dVpNQWdQZUNUamlKRHZ0bkxqYWRaN2UrS3FQUlBMZEhq?=
 =?utf-8?B?THZheTZXMmJPZmJYUmJBdElPeXVMU1ptZ1ZLNkRPbmNxYXRKWWFFTTc2SHNT?=
 =?utf-8?B?alVFZ0l2RnNpbUZ6MEpWYUd6MFNKOURsOFFHNFZTQkZUQ0pGYnZhRzk3MHJw?=
 =?utf-8?B?c1B1dXBURTBHaE9PNUEzdm1IZVdxMVlZckJFb2RzbitrY2tJcjJYTUJTYmJ0?=
 =?utf-8?B?eGlaMUlqQVNFMXFZWVUrZGxxdC9wajUraHRjVy9PbitTNHVKYWU4eWxzd1FT?=
 =?utf-8?B?S1l5SGR1YlVScnBVSi9qUXNpd1JieGdqZjNlTXE2V3RpVVh3dmxjeVZzZVNn?=
 =?utf-8?B?azBCQldrWXU2WGg5TGpxR1VnVEhrYW4rL05keEtHNjRmRi9yVXBtS3F3cEpL?=
 =?utf-8?B?MkxDWE8xdnJ1S3BKT3htRTQyZEg5d1p1U2M0THhEQTBTUDNuUHl4aTBCWG1Q?=
 =?utf-8?B?RDlWMS9CSDJYdmo3bkdaQ2Q3RDhBeUR3OHUvRHN6M3RmZU5wck9zMXd6Zm9n?=
 =?utf-8?B?OFhETWI4aHBLcWlHOGRRTXFQNkx2TzlWeGJxVUM4Q1VaSkJZQ1RRWnc3RG55?=
 =?utf-8?B?RDRvdXZnUmlQSEloV2xtOG43QzZBQThXY0Jad3lNOU9waDBjbmg3ZkdWY1Ar?=
 =?utf-8?B?YXdPeEp4SEIvQXZHY1dBazlnMmlGMWdpQWlhMVlWeGwwbHc3RGxORXJUZ3BK?=
 =?utf-8?B?RWZ4MlRyOXB6V2hqUHU5THJzTC82MnRFdE9EV0hXWDR5OWNtWTVQWUR0UEJx?=
 =?utf-8?B?R25KRVY0YlVHWHZ3RFltUzU3eWorVG03SUhrYWtZbUR0N1pyd2Y4T1puQ0Fz?=
 =?utf-8?B?Q20wUm1KQWhucm10OHVQOElVUENwcXl2RnpIaDdzTmlRVnQ2eCtWL3Y3K0NN?=
 =?utf-8?B?R2FjK3NCWWRweUVoSnBGWUthVjJNNVV0S3hhNW85RUxacUJZN3dsRmxMQ3ZK?=
 =?utf-8?B?ekN1SHJHRGJtRGV4ZTlYc3JQTGhHNm83dHNrMDdEWE54bURMQXBoUjJJUTBN?=
 =?utf-8?B?NkFTeFByNXV2OHhsQkIrOHU1WVd6ODNFdWNNY3BRRHlNb2Vzek9oYWFKRHQx?=
 =?utf-8?B?b0g5ak1GOHZkSXVvbTErN0M5WmF0bWZhekZ2MVdzZ3VKWkljTUxrQ3NUZURI?=
 =?utf-8?B?NTlsYzBpRTR3QjgvMVdmT3RPQmxyd0hhdzFiZ1UwQ3F2VndMdnhwZUFXQVE2?=
 =?utf-8?B?aEpjMlF2QlVIWGZxNG50bDBkdW5uOTBjZWxKM0Z6Rmo1VkpvSm9jZFBXc3Fy?=
 =?utf-8?B?aTFMRGgrWmloK3ZoQ000YzE4YWowQXd4NXVrWjBtb3FlN2Z2WjFSL1oyWEox?=
 =?utf-8?B?K3VQSHkrMHZiRXFDTUZJMGh2eGd2aElWU0tlS3hYZ1JUdlJ1dmkvam5Nd3VC?=
 =?utf-8?B?ZXFna1MzaFBTTlJZVnVhRk5nZFZGU01xOUdXMXZUUE5vWDRpNDdvUUJScVhw?=
 =?utf-8?B?Wlo5MXVueG0zVU4vUnlOb0F0Y0ZrRUhQMEdDbEhkQTZCQjNiS210TWxQdW5w?=
 =?utf-8?B?VTVqOStDN09PcHlyYXFlMndocFBjblNjUmtETDJyTjZQVDY1YWd3V2ZJUysv?=
 =?utf-8?B?eWJMS2RnL1RWaHFxdTBCUUJEK0JPcllSeDlBd2YrM0Q0ZWtTbldzUU5FeGVR?=
 =?utf-8?B?Vmd0ZloxOFR0VStlQVVmMHpaMDBoamtHY2czL2hWc1NhcitJTU9sWGpVN0Nm?=
 =?utf-8?B?WVk2V1lyYlZJeks0bGQ0VjdlSGNOSmFuM01la0VKV0hEYTBHYjRtSzB3VjNn?=
 =?utf-8?B?SU5jemVmYnlxcys4anR3d3phekRMUUZoUWJ4MFlSZXhYazJLV3ZUN3hSN0hL?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FoPFcnFujZ+ceeXxBKwsUz9t2XtSwrUmiJBGUwCguUez3q+AYQiMBhvhLtKLaYjf8QAFcmxNPTe1Y0EGYi0ax7HhlCcD4kbHPCRnuffg78J2wj0DwJ++RI5x8Y69OdcRaL9TJj+JQDRIha+hxfTM+OKQTCzl3H4BUU+zwVHV5cKN+VB5kAgMgRW2YTPpJAe6fkuFln04L60aws46ZgFzU4q9eJmG0IeIt0WY3o8dIS6hOnrX6x97mt0dNhwpoMnBjm4tyIM324/v/LwJHyoYINVIw7MWiLVURqyD+usKjhhYustl/q2oPa5qs6NGdwlyhVsjp0sLS1HMtT2zYPSXPcFlKCQ6JobEyuxJ7mvZq/pAQSBBby/rf55bfa6p/X2EDowNzW4F95SAEEyo0L0XpatThC/OWyfdi/2dVY1rpLml4RWAUQQA0CvaDU5wYKXSs2xohWT3qliJLM+CFgoNQNCWDcEohrtAfaDNgVXtvXRVQ/JoMsNd6XgYNBtpsX7ORSIoatnlnA36qNdPbTsxA6sv1lSN1kvM01R5V88m6eFBi1OQ9BZcWxhkxfce5eHCt640vYQWbCeGfU9TQqiICb4w7RCcKKFmfLHhtk1ujpZUHpWYYmSoiadaCWkjXdBlJa5GErqktDo+mqj/SJ8M2aw4yrfAhLZwY81k0j6A00vEgfYdMw/TVHjI5vlJ7FvtdGKvFggJ8Le0nfokEewd/Wdj4Cr1qWXWjfuHDxKr/0hHXIphTdGTU1ZUxImVdCVqJV4SybZpxqKRUFXRK+pPdoYxCAnzfUs0+Dk9uHa9pAFqEH9IWZQXr4GSAWc2it6R4H/5MEm+V4FUt+G7PEg6nENRlQhVen1VNkw3amx7PzA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a02c78-5243-4b67-53b8-08dbceeaeeae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:28:02.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxzMTRgo/WOS5+Ws/urgv3cnX5COiO6dIdmQF964NcGCauj430j+hj+LxuVHOtyMICxXZX5K5wJ3S3qhi5LZvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5541

On Mon, Oct 16, 2023 at 04:55:30PM +0200, Jan Beulich wrote:
> On 16.10.2023 16:51, Roger Pau Monné wrote:
> > On Mon, Oct 16, 2023 at 04:07:22PM +0200, Jan Beulich wrote:
> >> On 16.10.2023 15:51, Roger Pau Monné wrote:
> >>> On Mon, Oct 16, 2023 at 03:32:54PM +0200, Jan Beulich wrote:
> >>>> On 13.10.2023 10:56, Roger Pau Monne wrote:
> >>>>> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> >>>>> builder code, causing the region to be avoided by the arch specific IOMMU
> >>>>> hardware domain initialization code.  That lead to the IOMMU being enabled
> >>>>> without reserved regions in the low 1MB identity mapped in the p2m for PVH
> >>>>> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> >>>>> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> >>>>> faults until the p2m is populated by the PVH dom0 builder:
> >>>>>
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> >>>>> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> >>>>>
> >>>>> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> >>>>> Opteron(tm) Processor 3350 HE).
> >>>>>
> >>>>> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> >>>>> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> >>>>> arch init code to create any identity mappings for reserved regions in that
> >>>>> range (like it already does for reserved regions elsewhere).
> >>>>>
> >>>>> Note there's a small difference in behavior, as holes in the low 1MB will no
> >>>>> longer be identity mapped to the p2m.
> >>>>
> >>>> I certainly like the simplification, but I'm concerned by this: The BDA
> >>>> is not normally reserved, yet may want accessing by Dom0 (to see the real
> >>>> machine contents). We do access that first page of memory ourselves, so
> >>>> I expect OSes may do so as well (even if the specific aspect I'm thinking
> >>>> of - the warm/cold reboot field - is under Xen's control).
> >>>
> >>> The BDA on the systems I've checked falls into a RAM area on the
> >>> memory map, but if you think it can be problematic I could arrange for
> >>> arch_iommu_hwdom_init() to also identity map holes in the low 1MB.
> >>
> >> Hmm, this again is a case where I'd wish CPU and IOMMU mappings could
> >> be different. I don't see reasons to try I/O to such holes, but I can
> >> see reasons for CPU accesses (of more or less probing kind).
> > 
> > Hm, while I agree devices have likely no reason to access holes (there
> > or elsewhere) I don't see much benefit of having this differentiation,
> > it's easier to just map everything for accesses from both device and
> > CPU rather than us having to decide (and maybe get wrong) whether
> > ranges should only be accessed by the CPU.
> 
> I understand that, and I also follow Andrew's arguments towards not
> making such a distinction. The consequence though is that we need
> to map more than possibly necessary, and never too little.
> 
> >>> Keep in mind this is only for PVH, it won't affect PV.
> >>
> >> Of course.
> > 
> > Would you be willing to Ack it?
> 
> If "it" is the present version, then me doing so would be stretch.
> How averse are you to re-adding the hole mappings?

Given the point we are regarding the release I guess it's safer to
leave the mapping of the holes in the low 1MB as-is, and consider
removing it for 4.19?  That would give us a full release cycle to
check whether it causes issues on systems.

I will send the updated patch.

Thanks, Roger.

