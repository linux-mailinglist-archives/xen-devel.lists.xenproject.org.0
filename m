Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0B6E7EFC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523602.813819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAC6-00065w-EK; Wed, 19 Apr 2023 15:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523602.813819; Wed, 19 Apr 2023 15:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAC6-000636-AO; Wed, 19 Apr 2023 15:58:06 +0000
Received: by outflank-mailman (input) for mailman id 523602;
 Wed, 19 Apr 2023 15:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppAC4-000630-Aw
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:58:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f62d25ec-deca-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 17:58:02 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 11:58:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5612.namprd03.prod.outlook.com (2603:10b6:806:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 15:57:57 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 15:57:57 +0000
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
X-Inumbo-ID: f62d25ec-deca-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681919882;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GFYifgGDZpvOJBMjSWQWQ6bFHATjgDEHKSezjHxZ/6g=;
  b=YdpFlycWs1HgTaTtwb+AoQGu0svuf5PQyOKUqgn3ZgDXYM0NXF1Y5WnN
   9nLJ78dbs1OgOVxCdpcjc4f5qB2DblOmP0GT+JppA/wgR+wfQctBMwpvr
   cuVC4j7SZyd+8I0qgw5Vy6qnQ/eIcGRID0TSt1EgqOcLKh0pMrV7GlUde
   Q=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 108566003
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1BECjqABlr+nzxVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApG923mYGn
 DQWXm7Vb6yDamr1fNAnbYSxpx8C6MfTnNUyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw//pXWHt8x
 dUjLWpdbSKsiNuqyY24Rbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiLx2LGXxXiTtIQ6BaKyqtpYp3io12USBEUIW2qbu/mpsxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUEOikNSFJd58G5+dljyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:mPJQeqA6HsdG9mjlHemh55DYdb4zR+YMi2TDtnoBLiC9F/bzqy
 nApoV56faZslYssRIb+OxoWpPwI080nKQdieIs1NyZLWzbUQWTXeVfBEjZrwEI2ReSygeQ78
 hdmmFFZuHNMQ==
X-Talos-CUID: 9a23:xhmng28xE0gwazLMbOGVv0sIOpk/QE3093KKc0yKJmlQVLSqSlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AwukSWA8k+zIFpX42q4Z85iyQf9Z36fiKOmcoqoQ?=
 =?us-ascii?q?PusXcKyJBGy2dnA3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="108566003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr0t/WXEsYegYWAmAzcoVVsGNNm2gifWFlNPAatc1sC4B6SHHiMOkNRRPQa/VbPEaxVvC7PmQYh2O9W9mKl6YGOHYmiOaVr5PfZ6w+bYgid2FOUtOKbrSJv82G87JmGuVKkp/sSYas86tyGRW62sgAlPvRafOFhSvLzNQS1AoktcSfgTnqVE2dJKdhmifK4M5hdGjscplPUj1q/NrYx/OGUmisPoCjtrjptB9BL/O9Hy++kb2FF7VISY5DFW7F4hL2jsgerq8j9XdjWKTmxHlIVLwDszR602RbjS3mhWKG97kHL1BT6h90WVa3wdCEUVB5Ck8Kp/8xNDjCwtVhvH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+ZJXdJRAw4xA0MVtYBgRDgmGrbVUrXuptUuzWPSoyg=;
 b=GBeoNLwkGG35iT4dr24Bfc0SxdOA6AhAaV7TDkEGPw6tQbyh3Cbi9ykzAOmOaxw6607wnRHuIxxMcjZpJ+n/6lFA0ceFdZxIsnvvgeK6y6iY8Tfj39RvpU+n22DsJ2eb2SvZAosaGfepbP/p9sndJCjKW5cIHukmJnAcDOCBd2Y/A/V2ain9Bc/hgND5kJw1XagTFki6we3M9UNgDr7ExsZ7sHqke4UxYY2sdO20n3PEmqGhK8NItTLa5zEPC33xS+HDi2U22nG2xNam44BQnD50+SA18bPBn5aqQcuUnpGHwnO6GwutBxQtH/qMV2CzqRos7RnSlJ5D+uHRntjmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+ZJXdJRAw4xA0MVtYBgRDgmGrbVUrXuptUuzWPSoyg=;
 b=svXmD57+FXpG8+t+Q12s2+aA/MASqpZD//4N3ec31Fbaph4lstj3b5J/VHHME1X1tiMLUT+9jnIIe08uBWbiBHgY9ggZvqJD3akZmyph4t+ZqHcDvokeHhdj79XiHc5ej5a9BZrd8Yq/XCVz9sFT71bghYwtG7GUm/bwdDeW7xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 17:57:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZEAPgFiYZoeJMLqc@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
 <ZD/UMyeckvCq0ivf@Air-de-Roger>
 <86823b76-6be1-da65-7608-af391ff48978@suse.com>
 <ZD/uX1VqYchQ4GgT@Air-de-Roger>
 <4cfcaed2-21e9-a794-86b4-97f9b350c0d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cfcaed2-21e9-a794-86b4-97f9b350c0d4@suse.com>
X-ClientProxiedBy: LO2P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 3050daa4-7097-4da1-af66-08db40eed819
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eqfios2rXp6qDsAO4Gc/r+O9bHPT+7KIaT504OM+SAMvRmSZ2gzUeI+f9Uj8bZQD6ZduCFPLI6hOzNtCyK8iQzBJDGsuO/XQ5kAs25kC/tRmZK9ApryqKuZRbGb7x7BWbVyFLiAzRuZOMRun529veApuaP77t9DErEN7vWRycj237YvFcT3/4zUcgYlshx1Ni92DWaG9crSEYbhDFGjtfKVw2Ie2lFesIeoIlT764ftQI4RFz2rjAbM3h77onPnBOBDA5jMZgHYmHAD3fj7kWET7ZTutRMmLXy5ii9CkqEkWwLDyh8NdZDXoYHZJd9f9ABywJZscfAcqEJ4PPpwyo19VFPixqrOtQqebUZX0KtofbQwM4HHqyz4XX4mq29obcNldFvJGSp9o5/CYkXm7pVkZ+O8jP8BEseyG+y/i/N4l6DoYHOgfq1HYo0127JrnoE1/i/4cnad4FmENyv8FcVUEiNfU1dY99zKtuIPlPmiQ83ljVtMmssApopL6E4jEzeuf6IOGTS2XqAPhP0yZ1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(85182001)(4326008)(54906003)(316002)(6916009)(66946007)(66556008)(66476007)(966005)(53546011)(6486002)(41300700001)(478600001)(6666004)(33716001)(5660300002)(8936002)(8676002)(2906002)(86362001)(38100700002)(6506007)(9686003)(26005)(83380400001)(82960400001)(186003)(6512007)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1JGNTJoeDN5TzNpMnJtWFBWQ0p0RkF4dTFrMFk0bTdkR3kyVjZabUlIdGRw?=
 =?utf-8?B?QkhvbHdvdUR0SU1qblY2UFFTNHZiQjU0YWZRZVpDenAxVHVueHg1bElKMThN?=
 =?utf-8?B?YTlacWV4V2Fwc0FKYy9wMzM0b25xd2xISStRQTBsdnZ2WjliVzA1aEVXdytt?=
 =?utf-8?B?aVBKTjQxaGp3YkpWakJDTnplMWN6T0JiZW9ZbTVIOWc0dmZsZXhaWHF2V2cw?=
 =?utf-8?B?Wm11K2NPdVlQdGhtVmw0UXcxQ1NEYzdCdVpSNlNXblVCQW9iWSs1Vnc1cjRq?=
 =?utf-8?B?bWFwRmJpamhaLzk5aTZQMS9ESkxDVVlVZEJvbWx0UlhPUlNkUE9ZWlZGVXF0?=
 =?utf-8?B?MDZwbXNPS0ZibHB4L2FXL3dpSW1yaU5UWm9DeXR2QVdLbjBaa25zZUZCYkxM?=
 =?utf-8?B?S0R1NnRZMXVlL2RvNkp5MHk0d0l4a055cFppUmtKM1h6ZFlqSUk2YVlTa2lL?=
 =?utf-8?B?eWtJWTZQdTdJQkkrN1VzQjRxZXFkbXF3d1ByQi9QMkplUDhZT2FGeDhXNzFr?=
 =?utf-8?B?ZVBnUEl5eUh0c3dLYzQ1RFpZU0JwMjZpeGtKU2pQOHRVbUVaTVJDeHFWeFh4?=
 =?utf-8?B?djlHKzhTSDRQMGJkNWxXMmVFeVVSOWhabmVMSEltSXRvRmw1TVVVVzA1WU5j?=
 =?utf-8?B?T3RNMVlxNHVWakRJUCtEelVham5LMng1c0FvU0JaSmhIcjZPdEdMeUY4QTFZ?=
 =?utf-8?B?cjVoM3B5WUFBUG44R0wyNHVsYnhNVnE2a1liTjlhOEtpYmlYTUZCUVJpanlm?=
 =?utf-8?B?TVdWd1RYeW01Wjd6RTlwSTdsczQxV1dsWVpQSUtnbDlxYm9UakVqU3hZSmtE?=
 =?utf-8?B?QzdRdzYrZXdlMWNycm5EQzZUcWR5MFk1SXl3aVJEYU5XcEtUTFFEK1pHenZh?=
 =?utf-8?B?M1J6TVVydk1lRG9oS3pwQmQ4K3duNkFKTkVXTG5rbmVYSE53WDBMdFMyRUs1?=
 =?utf-8?B?UXZnQVp5cURHOHRTb256T3l0cWpYYlZEcm01UEF3b1NyRjZ4V01ZU3Z4MWZp?=
 =?utf-8?B?eW03OW9Mdm1ncDlZOUtMQ1lNc0Z6SjZXZkUxNm5meXgrZUpqNHFta2xwTGNw?=
 =?utf-8?B?NFlXVjBXMWVkdUIzL2RSY3U5cWJSQ2xtRTJiVHpBczY4ME94cFdxeHlzY255?=
 =?utf-8?B?empkSys0M1l1aXY2WGJWSWpqVzJjVUNvd1VnTnhJekg5OHJ2cXJkOHA4QUZG?=
 =?utf-8?B?WC9MRFBnNFRjYW51OXVpemovdmd5ME1SV25TN3FWYytWV3hPMms4ZVY2UG1X?=
 =?utf-8?B?aFV5Yzcwc2s3MzZPWkIxbVgwRVdjank1VmJjT1FsMnMrYWlhdDU2OEtZOHJa?=
 =?utf-8?B?ZWEraXVYZnY5T2NWVyt5aWZ3dk1jdVV1bi9Sbk9KNndwbnd4TEhibHpzVzFN?=
 =?utf-8?B?Ujg1RTlWaUhlQmFkaGF0REtDbVIzOHdTZEV6YlE3QlFKRTNBd0JwdzltbzVU?=
 =?utf-8?B?Z28xcmJzYjgzcGhMbU5MdmF5TnlaUFdXd1lUdVVRcmhzYWM4OFRRbThWWUsr?=
 =?utf-8?B?V3llWlhreHE4WVRSZHpBNjF3akNUUjVORHpvZzg2aHpRZGExNFZTWlZ4WFFh?=
 =?utf-8?B?M3VpUnFkVkNDMUxrRnBHMXRwSC8zbm9UNHBsaldqeDV6K2Y2TE9MRC9zRklr?=
 =?utf-8?B?OFl4bjRpZTFoalZERGQrTEYwVkhia1MwU0NYU2RsRnBaZzRyV0x5OGh3QTln?=
 =?utf-8?B?bnhpcUFYQ1ZEeTNwZENtOFhhdUJFMUVIMjBtZTRXTWFsNkQ3UGlOMStlUVJk?=
 =?utf-8?B?d3RFanJzT0NXTnE0bWJEaGFuRjNkQjNYamYvVGlQdXh4SkovVFN6Y0xlOFBI?=
 =?utf-8?B?aVBBbG9vVlcvR1BVQWVBQ1lmdzQvQnZldFVqZmdPWks2N2RiMW5hdThkR3hQ?=
 =?utf-8?B?aUtaYW9IQkx0blk1WHVVcWxKK0VhQTNta2YzZXhQcHZBc01SNXJrNHlkYWt0?=
 =?utf-8?B?dnFpZk5YZFFHVVMvZkt4enlON21DNzY1d3pyY2JGWGJYVGtZUzdhRzFDKzVD?=
 =?utf-8?B?c2U1ZjVCV1pyL2tnNkE4MEZRd05pODV1T2xNRnhtS29GelpJa3k2VzRualkv?=
 =?utf-8?B?NTRkQVFtaXdydTFidGFrVDhIVGl6R0ticjVuNUFyWWxtYkxBbEtGTGtHQ3NS?=
 =?utf-8?B?R0lCeXVlWEtjdEM1YUtpQVRobXVscU84Nys0dS82RE1YeGZMcUhnU2ZGUkFw?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+hoT0ZstuaTqoY+B0bowVfPdzAlcQOo7nMGyNJajx2mQeyyOZdcoOJmb/cYH36T15pzFbdt2wG1XlesEZ7zSjl7Q059jsSKewcxrNvW7gSAECbHEPn3IgZtWkJZqX6fhdmQmWll2mAuBN4qRWPAlGbN255Gb4EtHEHOuICgK2gST6b6L5aiEGlINohv8vm5McV/POo1tx+3ZNdwP0g3UyOGAfZ+vATWyMuOp68j5trRxpKSekg2YgGHM60qO2pjo9lk+FuIgpN5K1I88hJftadNMJTglyeRrfvSmNyBvh58bpAxNiG1FK/+hcuyjAJ0q60G8LtX6Ad9oK1re5vus5K9Cvkxb3mw8VihC9uPFmO2spidkfXhbWzA08RoQV6x9nvKJm/pNnSlIgFe8hp4V8HUKXYO95kUcXqK56quKejwhTr20SG4ae7DCpdefKpUrPgxSy/7VJTQED4sOEzo3+yfa64uaZAkJjGaNUAGTyV7WDDT5cAiXcsC2ViN7+SY/2m6+lLK+9AIxRhReMFr5WEivzsqhJnQifs+R/auQm5Y8sioE82M7UF+4kjPL7+B/TaNvqdghe9U0We2xs2s4voGqpQuzh+tDgA15Fv6wgPo2Va32LmH21AkTpfQKNz0St5OffAxVyep5ihJZXf0uOFSiOh+n0HU3WwqtScwL8DDOzT7l1g8gGyRVfi2rr+2NWkD1VM0nvdEP3+G075Ow9jnHtLrBHmHAbYBnqayH/7FcL6/LIQ23YPrFAeD7/Rh9MLT2LGWPs2fWVe79J+GHK6TOjj+RvHN/Uc9WUzVJBhbU6eNmfcwI5UIR9JXnNUXP
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3050daa4-7097-4da1-af66-08db40eed819
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 15:57:57.6791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPaLiFO1IgdQjObjAdgY3KLDaUChk55Av94l2zIyT4QBujeQk2fJBW1683VqGGD9ARjRf7xp6N6mIEhtIxTxOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5612

On Wed, Apr 19, 2023 at 04:39:01PM +0200, Jan Beulich wrote:
> On 19.04.2023 15:36, Roger Pau Monné wrote:
> > On Wed, Apr 19, 2023 at 02:00:38PM +0200, Jan Beulich wrote:
> >> On 19.04.2023 13:44, Roger Pau Monné wrote:
> >>> On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
> >>>> On 19.04.2023 10:25, Roger Pau Monné wrote:
> >>>>> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
> >>>>>> On 18.04.2023 15:06, Roger Pau Monné wrote:
> >>>>>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
> >>>>>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
> >>>>>>>>> --- a/xen/arch/x86/include/asm/config.h
> >>>>>>>>> +++ b/xen/arch/x86/include/asm/config.h
> >>>>>>>>> @@ -44,6 +44,20 @@
> >>>>>>>>>  /* Linkage for x86 */
> >>>>>>>>>  #ifdef __ASSEMBLY__
> >>>>>>>>>  #define ALIGN .align 16,0x90
> >>>>>>>>> +#ifdef CONFIG_LIVEPATCH
> >>>>>>>>> +#define START_LP(name)                          \
> >>>>>>>>> +  jmp name;                                     \
> >>>>>>>>> +  .pushsection .text.name, "ax", @progbits;     \
> >>>>>>>>> +  name:
> >>>>>>>>> +#define END_LP(name)                            \
> >>>>>>>>> +  .size name, . - name;                         \
> >>>>>>>>> +  .type name, @function;                        \
> >>>>>>>>> +  .popsection
> >>>>>>>>> +#else
> >>>>>>>>> +#define START_LP(name)                          \
> >>>>>>>>> +  name:
> >>>>>>>>> +#define END_LP(name)
> >>>>>>>>> +#endif
> >>>>>>>>>  #define ENTRY(name)                             \
> >>>>>>>>>    .globl name;                                  \
> >>>>>>>>>    ALIGN;                                        \
> >>>>>>>>
> >>>>>>>> Couldn't END_LP() set type and size unconditionally? (But see also
> >>>>>>>> below.)
> >>>>>>>
> >>>>>>> I see, so that we could also use it for debug purposes.  I guess at
> >>>>>>> that point it might be better to use {START,END}_FUNC() to note that
> >>>>>>> the macros also have an effect beyond that of livepatching.
> >>>>>>>
> >>>>>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
> >>>>>>> find START_ENTRY a weird name.
> >>>>>>
> >>>>>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
> >>>>>> I take it that you're aware that we meanwhile have two or even three
> >>>>>> concurring proposals on a general scheme of such annotations, and we
> >>>>>> don't seem to be able to agree on one. (I guess I'll make a design
> >>>>>> session proposal on this topic for Prague.)
> >>>>>
> >>>>> Oh, I wasn't aware we had other proposals, I've been away on an off
> >>>>> quite a lot recently, and haven't been able to keep up with all
> >>>>> xen-devel email.  Do you have any references at hand?
> >>>>
> >>>> Andrew said he had posted something long ago, but I didn't recall and
> >>>> hence have no reference. My posting from about a year ago is
> >>>> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
> >>>> Subsequently Jane went kind of the Linux route:
> >>>> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
> >>>>
> >>>>>> One thing needs to be clear though: Macros doing things solely needed
> >>>>>> for LP need to not have extra effects with it disabled, and such
> >>>>>> macros also better wouldn't e.g. insert stray JMP when not really
> >>>>>> needed. Hence I expect we still want (some) LP-specific macros besides
> >>>>>> whatever we settle on as the generic ones.
> >>>>>
> >>>>> The stray jmp can be inserted only in the livepatch case, if we end up
> >>>>> having to add it.
> >>>>>
> >>>>> Maybe we should just go with Linux names, so initially I would like to
> >>>>> use:
> >>>>>
> >>>>> SYM_FUNC_START{_NOALIGN}(name)
> >>>>> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
> >>>>> SYM_FUNC_END(name)
> >>>>
> >>>> As said in replies on the earlier threads, I think these are overly
> >>>> verbose and come in overly many variations.
> >>>
> >>> Right, I would only introduce the ones above and as lonog as I have at
> >>> least one user for them. I don't think there's much value in importing
> >>> the file wholesale if we have no use case for a lot of the imported
> >>> macros.
> >>>
> >>> The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
> >>> need a tag for local function-like entry point labels, would you then
> >>> use PROC() for those? ENTRY_LOCAL()?
> >>>
> >>> I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
> >>> think it's clearer.  I would agree on dropping the SYM_ prefix from
> >>> the Linux ones if there's consensus.
> >>
> >> Okay, I'm glad we can agree on no SYM_. But what value does START have?
> >> And why would the type be (re)specified via ..._END()? FUNC(), DATA(),
> >> and END() ought to be all we need.
> > 
> > Does it imply that we would then drop ENTRY()? (seems so, would just
> > like to confirm).
> 
> Yes. ENTRY() may not go away immediately, but I'd expect it to be
> phased out.
> 
> >> The type would be set by the entry
> >> point macros, and the size by END(). To cover local vs global I could
> >> live with _LOCAL suffixes, but personally would prefer e.g. LFUNC()
> >> and GFUNC(). We could also limit ourselves to FUNC() plus DATA(), and
> >> have (non-)global expressed by END() and e.g. LEND() or END_LOCAL().
> >> One less macro, but maybe slightly odd to have the .global directives
> >> then at the end rather than at the beginning.
> > 
> > Hm, yes, I do find it odd to have the .global at the end.  FUNC and
> > FUNC_LOCAL would be my preference, I do find {L,G}FUNC a bit
> > confusing.
> 
> Well, yes, I was expecting this to be the case. Hence why I said I could
> live with _LOCAL suffixes, even if they aren't my preference. What we
> may want to keep in mind is that sooner or later we may want to have
> non-aligning variants of these. That'll again make for larger names,
> unless we went with e.g. an optional 2nd parameter which, if absent,
> means default alignment, while if present it would specify the alignment
> (which then can be used to effectively specify no alignment). E.g.
> 
> #define ALIGN(algn...) .balign algn
> 
> #define GLOBAL(name)                \
>     .globl name;                    \
>     .hidden name;                   \
>     name:
> 
> #define FUNC(name, algn...)         \
>     ALIGN(LAST(16, ## algn), 0x90); \
>     GLOBAL(name);                   \
>     .type name, @function
> 
> with these helpers (and count_args() as we already have it), or ideally
> something yet more simple (which right now I can't seem to be able to
> think of):
> 
> #define ARG1_(x, y...) (x)
> #define ARG2_(x, y...) (y)
> 
> #define LAST__(nr) ARG ## nr ## _
> #define LAST_(nr)  LAST__(nr)
> #define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)

Would seem acceptable to me.  Would you like to make a proposal
(likely updating your previous patch) along this lines?

Thanks, Roger.

