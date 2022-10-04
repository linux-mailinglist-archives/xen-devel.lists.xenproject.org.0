Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928DD5F3FC5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415318.659863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeIw-0003kb-9t; Tue, 04 Oct 2022 09:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415318.659863; Tue, 04 Oct 2022 09:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeIw-0003hk-6E; Tue, 04 Oct 2022 09:33:34 +0000
Received: by outflank-mailman (input) for mailman id 415318;
 Tue, 04 Oct 2022 09:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofeIu-0003he-H7
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:33:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9acfa221-43c7-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 11:33:30 +0200 (CEST)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 05:33:23 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB5997.namprd03.prod.outlook.com (2603:10b6:5:388::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 09:33:20 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:33:20 +0000
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
X-Inumbo-ID: 9acfa221-43c7-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664876010;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uXxAR4d5RGgsAetfaqQl8UkyuYpSZkSffydkuv8LCvY=;
  b=aHvbi8KlHHsAzpIcHr3tJk90ZP//IHXApDZUYDGtLUTLZoaFEA2Y4khW
   QnIvUlZgHFBEo0N1sD3WYxOPtjFpShaqWcCavTQH4OKG1QEnfp2cXEQkW
   4GaFje1/sv07HLXloMluCVQztHgNSxR91cULMR+Ce//yJIG2yRKR4eOt+
   Q=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 84441364
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K8eQR6zJe5kubkMXy3F6t+e9xyrEfRIJ4+MujC+fZmUNrF6WrkVVz
 TdLDz2AOPaCa2CnfIgladi+/U9TuZHTmtM2T1ZuryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFsMpvlDs15K6o4WtA4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp91oLkwQ5
 6UicRNKQR6np8Htn63mRbw57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exruAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WrZri713bGT9c/9cKsrLPqf1O9OuX209GdNDjs6TEa9ptDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehgNfBFTFp9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y6NqC8ylrACl/kB3q+w/U3Eqz+0r52PRQkwji3dU3i59Ap/aMigbpax9FnAxf9aKcCSSVzpl
 FgJndKPqt8HC56lnTaIBu4KGdmUC+2tNTTdhRtlGckn/jH1p3q7J9gMu3d5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpkmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:W3mhjq6GHDfDA7eAyQPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,367,1654574400"; 
   d="scan'208";a="84441364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gs2yAQaJP4lS4eNGaOLYxaCXEkOo0TaYExwSLFEWFoYbbXnakppwgn9RdMigIsZ4bD+WAw1J0raYxCaYnRz1AyxJlZ5yf1u+/3f2g9uIFpwIoV5fWifKA7eMpNPaYpYIKrYt+WVYSXugi9rLNMxIq5d+/qvORQNLCTmokL/CCQRF/M6aCTdbO7RfV1/PXWb8/M5Y2533gH+lqIrZq29kOJd9I95t+6e/0GY6CSya3Y7NBHaX6NPb+4JQXQBvW6z/7jDue7uzwQadqqZ/jLGuSfd6QvrHk8htj+8wLkd32kLMLKUUuDDhyKIJaztfZzn7PhGgfc7sU+koUmI2quzA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPMVPlzMhqoLpJn5DKgly0KDoFNYA1yWPczeSKxEU8w=;
 b=IfEw+ztksjumj30O5HUCNJWgECxvnKtHCs2sHcdLmt7tgzgx1BriZ1TFo/SySyAqfGOgO2TZdWzDZQJE9NV+HOVhKujWDQ/LPF0EpcWb67f4LX8m4QbalMAgjWBMdhCAKuLX9eG09mWsu7E/P5I8rWxIQR8iHuBSJqIzCIj9jgrLsu8o1Ke1wsgjfEnYy/+idOgh4X/0QF9vOMk7VufOabaa27DOdNHfCsABQiPcoqLjlo2B59/jSy4+edsRdHlgIPOLF5Bg91BOrWnZt0JhgxAsTssuhHHqjALqyFmGA3eopYrnU9tpO5+nml9vGorRc7c93LYeveehQgc837OuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPMVPlzMhqoLpJn5DKgly0KDoFNYA1yWPczeSKxEU8w=;
 b=Pw5FqpDpU9jt5qDUpvJZsyS5mC4aKST3mzm77Fw/i4/bU3IkAhI+p9hC6JqzigSP18ZfBDWKqhi/tLtvoo9fvlkIRQBgEeGp+Gg3GGMIQJXw4871PgFc7mE7v8Xj/v5OmnPm1Yewtq10Kt3oVbZgWx6xHyu/qWeQqxJLwashQVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 11:33:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2f625a-daf9-464a-1476-08daa5eb79a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TORiEpmgYK6iekZaJXeugr8SGhLRIJUPYuqGS1ey5GwZEdN7kN3tKTfbentiL/GoyLMp/XtrwmkUlgCXU7ffYt5dHRKoZar1m4hkELoF1rdFCS3Zb/0lKh18E1Lv2KTpuEaBkRXRnIOB+hBhqzrunhcWdtlUHbMSVitrPfUnysWKzVCHu3ECqonrUEOyg2/dZVLFz1wh3yofa8T4rmBGpvWTPd6pjHY9sisbSaUB9WMDHhGv0DXoxuKoWR3i3h65UO/e+fAAnq55fgBJHuxHvX7PI62z0ocUAYMw5fppAItvJq4xccB1+QjK+DwwPJEVXR3v6Rm+6mov6jAuOYr2LX9gL/ucknOr69cR1V6RKRqvWe+z7wZargREUNV+dJMg5MDd4ft406V7u69lR9iYUnGI6D6lA15DY8lhAB5CYRbNlFu2OtkryyKw9Jpa9TOUOaOb3Ud8Ao8lXSbCwLpqVrq7XnUNP2zvjuenoL+ecwukcWokZ9skB4EM/dO/gcK0Cg7nRuyWwZQShWAlB5UzJBskGiXtISK7x26ow1pMJbcVyJfvIX8nQMgJvXPftVTqnLgSLoe0pkfSsMPZ3XrTFFEUj6oCms0lN9sEB/yVaqyvDzJMAms9p8NyUrupWZe01vTlK6+6sLfY1e/IjeZ9vH2sOje10uNRHkyaHymOZ5VhornTLTEFxd4ATz/fw3slHedwERCV3MXTL+/C+EhjYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(186003)(2906002)(85182001)(316002)(6666004)(6916009)(54906003)(6486002)(478600001)(66946007)(41300700001)(8676002)(66556008)(66476007)(4326008)(53546011)(6512007)(9686003)(86362001)(6506007)(8936002)(26005)(5660300002)(82960400001)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlxSHZXbEZFazdmcUlybVcyYXlWbSt0VHpLenUrNjdNUEZJdlNMMFdmZDd4?=
 =?utf-8?B?M1I3VDk0emJEai9zLzZqUHhrN0MxWW9ac0djbndicFpETFBUeXhMbnAyNXN3?=
 =?utf-8?B?bHJTOXEyUnZoTWlDRFNKc3lpUS81RmRsNEJZVWRmSlNod1NrZlVGL240enM5?=
 =?utf-8?B?RHE4YU9qT0txNGhEckdyMzZXZ0xDcXpOOHNPVWtKRDZ1cWJoWm1yRml3Qjcw?=
 =?utf-8?B?T0JnNkxCM1BnelNGd1RaQ1N3ZFJIZDY5SUd2KzZXaVA3YmpQc2puT0dhUGky?=
 =?utf-8?B?bVhsOWpPcmhRWGFxaUR6KzJua1Bqd243VEhOMEQ4L3duNlZ0dUNnSmZreWls?=
 =?utf-8?B?Wm94QzRWZE81ajkzNFFYTEtGaFRsWTdGeG5TSWRzc0Qra0FRWnZUM0hPckt4?=
 =?utf-8?B?aElsamsxWnduZjBGTjZweFA2MXFjM1lmdXVtOENpQlNCZlY4cVN0Q1Axa0Fo?=
 =?utf-8?B?aUphZW55aHJQR1kvbERZRDB1bG12YnBlNHpuU1dTME9ySGFqSTllZmhSdkYw?=
 =?utf-8?B?N1VMQXZrZENRRE11MTV0TmZtMFlCUys2ZWQ2dHhzVDFVUWxzbTR0cHZxeVJK?=
 =?utf-8?B?YnlSb1paSlFseXp5eHBJOHkzZUltQzNuaURDdjVSTFl1RjBURGRjbEpack9v?=
 =?utf-8?B?cmFPQ0sydm1vR1FEU2ZLUXRwMmFXNmZDOTI4NVhzQXpJWG9KRmJEa2YzQTc0?=
 =?utf-8?B?MDVldlMraDJQSSttb04xYkppcWYyQzdpNk5XOU5WU2htbFRyNUhKUHRTbzRw?=
 =?utf-8?B?d1BkbFlkUGUyVWNmbGNGNmFYM3F2NlVyVTJsZEdleEMvS0o0UVVneGM2Vy9O?=
 =?utf-8?B?YWROQWlCd2N3Q1oyRkJBN1dRa3JVbktmR3NmdzJKWUc4T1h3N1pVZkJUVzhH?=
 =?utf-8?B?UmpMSTRNeUhMdjVDR3BSSEh3ZElRVjFIY3hIOVpySW9tOExsTjJmSFdCOXQv?=
 =?utf-8?B?b1dBTU40MGxyNnREM2YvdDEzeUdkVGlRVG9henV2cHZVaEpMRmI2UG5uRDUw?=
 =?utf-8?B?S3ltRGorbVpnVWMxSUJCaXArTFkrT1poVU1DL2I1NWt1VVlCOUsxRy9pUFJL?=
 =?utf-8?B?SENZRXVOQm1jeUpzV3BBYnI0ZFdCZWJLZXlHSTZWZkJ5ZzBnQWZWdTAxRWgz?=
 =?utf-8?B?aWcvd1lsSWgzblpLTkF1R0ZaKzl0R2Fqb0pvc3hsTEsrdWtGTDV6dnlBT0JO?=
 =?utf-8?B?T2pMMzVteWlCNXJabHY5UU5uRGpEejl1YU9mUUVBR0hzV01LaDRrU3hmZVVl?=
 =?utf-8?B?ajdXTFdrS1hOQVZNdlV2dkhXTzJPZFlZQ2F4TTBVOXJFbGpsMG8xWlFQUjdB?=
 =?utf-8?B?QVBibHpGTmZEUGdVNlIzTlRyckJtZHp3VGFDQU5rUjRib1hGOEkyOVFFcW5x?=
 =?utf-8?B?U2xYUWNwTE9Gdjd1TW8wL09yVEUwRk1NWjJ4L05na244Yk5mM1JyMTBOcWJl?=
 =?utf-8?B?bmNCVnFGRnN6cXNIV0xoYzhCUVpZVjVOSHFCMGFtK011MWtZN0JzVm1QY1FL?=
 =?utf-8?B?Qk1wY09MbEZ3Tjk3S2FZQTJkRWQ5WGVoMDlobnh6SzJBZ0g1U1ZhZk9PRjVw?=
 =?utf-8?B?KzREOThIbTdNZEZDbXRoNWc5WFpJQUNTTitIVEtOYU1xZ3ZBY1MrVlR4UXRU?=
 =?utf-8?B?TUdrOGxMOHBGN1BOTHRKdTNucUVzcitPMEpWQnVwS0NDekpjSzBIcGp2cWhT?=
 =?utf-8?B?b29oQVNqZjhFcklFODlPUWxzTmZiZm9TU3hoR295VC8xWlNvUTVkN2poZG1H?=
 =?utf-8?B?KzZwaDNiTUdpekovbis5V3ovSkdTdHlGOS9VWlJUeVdiZDlMV1c3OUtCUGF4?=
 =?utf-8?B?NDlLS2wwcUZYTzVqdUtsT2pCWHNwc01NYXpFamVKTTVWdWRaSWEyUis0K0hZ?=
 =?utf-8?B?K0lSUU1DVkV5RHNVaFppcmE3S0F5amNoUnhkU29uYWFnMFhLL0ZJc2ZUTHFR?=
 =?utf-8?B?aVlQRmV1MnViQ201Qmk4SjlBRkZmTjByR3BTREdqd1lFRGQ2VktRcUp4SUty?=
 =?utf-8?B?d1E4N3ZiY3piRlVSa0pRZktuRWJjb0IxTXZtaFlHZ1cyTEdlR1dGVlpmZmJi?=
 =?utf-8?B?VjFUTFJWaHBQNDcxOVk2OFlQaVRMZlVBNHlFck9DeW53aTNMOExQZnQvOGdX?=
 =?utf-8?B?UUZWajFxSmo0Uk1jeFM2YVZ5MWR2WnBHZTBaVkNGMExGMWtra1hJL3lGd1l3?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2f625a-daf9-464a-1476-08daa5eb79a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:33:20.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVv7bHnylQDOJNGvgthHLAkaWjJHgNIY68UHrmKzZ6EfMC7gRv6h85WT77NZ+C4sLeRX4OcqFXeRlrm/6QobQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997

On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> On 30.09.2022 16:28, Roger Pau Monné wrote:
> > On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >> higher priority than the type of the range. To avoid accessing memory at
> >> runtime which was re-used for other purposes, make
> >> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >> E820_ACPI memory there and hence that type's handling can be left alone.
> > 
> > What about dom0?  Should it be translated to E820_RESERVED so that
> > dom0 doesn't try to use it either?
> 
> I'm afraid I don't understand the questions. Not the least because I
> think "it" can't really mean "dom0" from the earlier sentence.

Sorry, let me try again:

The memory map provided to dom0 will contain E820_ACPI entries for
memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
overwriting the data needed for runtime services?

Thanks, Roger.

