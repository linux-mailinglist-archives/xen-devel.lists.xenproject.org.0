Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F96BEB3F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511128.789993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdB5i-0006bU-1T; Fri, 17 Mar 2023 14:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511128.789993; Fri, 17 Mar 2023 14:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdB5h-0006YV-UU; Fri, 17 Mar 2023 14:29:57 +0000
Received: by outflank-mailman (input) for mailman id 511128;
 Fri, 17 Mar 2023 14:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pdB5f-0006YN-Sv
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:29:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ddcddd1-c4d0-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 15:29:53 +0100 (CET)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 10:29:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6624.namprd03.prod.outlook.com (2603:10b6:510:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 14:29:41 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%9]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:29:41 +0000
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
X-Inumbo-ID: 2ddcddd1-c4d0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679063393;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KKLTb0QC3vZI9uDoRqQ+YL36SupkDhL4rSVaVUmd0Gw=;
  b=Xy1P6BiyIGwvFzVtI9TwxMiDoZzHRuVV1j129FcL1GDjTX5074ixt5fa
   WAnc0gxakS4+3xbWhu15Bpybw0p7xDolZnzXuHYNzh+aJkdQMcPRYm1M5
   AOi470VTArlYOvl+AugZhFBQhOQZsw+lihkyqVLkewInOtu8BgvPgQHoq
   A=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 100647914
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eDVd8KCpqTImZhVW//3iw5YqxClBgxIJ4kV8jS/XYbTApD53gjUCy
 zZJXTyGa6mKMzSgf4tyOtu+9B9UsZXRnINjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo9t2LGNX2
 MYjNDUSRCzEou7nx+uJRbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiry2rCexH+TtIQ6Hp2TyKY02k+pwmlMLUQRZHi3/Nm2hRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnp+XoC2zP24JLGYETS4CUQYBpdLkpekbjA/JCNBqE6e3j9j8MTD23
 z2O6iM5gt0uYdUj0qy6+RXNhW2qr52QFgotvFyPBySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02jaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:kha1kq71wPkbud5ILAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="100647914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Li1STpA3tO9J1JF8VzoD1Kpb47Vw3njSad29OW/PLvWgaBv8Fewk1s3xDnLw/NCW7lSZFHoZJK8QDq4uU9/p41yhklKpjE32OA+qP6LkXn9sLbwk4smTWxC+ACeQBNq9z5fC0036mE3l5dbXT0WjZUmzJ787StEOLSdPCCnon2jDPNyX74cHkKFkTU53v1yMumFDq9dSZ4K0hUyvOWgbICwLrBUEpdboCo6teEQZUBtwz4iQtq0SS1N4MfPFe1WzsheK6Cq392cFzDN8ZYIvqbtzoZ1k+dnW+ne3Gd2rhdURHSyHBXGCPfcGZzZFZK0l5RXTk5lhW9NOrOplOVqNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCTEUrqtvhf1waD6XKMAcgP3n+PWlr298pp7qEL7aVM=;
 b=AWZDms1h6oCqxhBn+nC2pFOT/oD+FHeNCRwtGuUNAGZ0SZ5V8nDxBThuHpr6aON0wvq3rmFqOazW4Jh/FGrdFuQX6W7h03wITB5KBMQg5o8R/+bMy55N9RyvDMENmrZUdWh/jHngLV2uspjV43wWrbYnv5HD0BOe448nTMRjXEQb9ErVYuIVWshuiyzxjRNkpFt8WDG+McUGST04Y+bOEGYPOn9Vu2sIL0/JR7scIpFINmzVCwcRqcPU3nCG7QqlDZktvApxDpRbytOwbVovVuwYF2EfhPndlZkj6sADptgLKuvubJLV8C3fthvX9REUsR1WwCmYUlLYeB+ZGkbZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCTEUrqtvhf1waD6XKMAcgP3n+PWlr298pp7qEL7aVM=;
 b=j5CLWSF3FC6xN495+iRy9AYAhpS5AjdHHuR2Op9Bq/luSLu7tE56pJbQsHIwVex0RVPy1eoGwwb1mfy6W2t+NB8HncZDJbVGAtD9A2ZpMU4vdbryrz7aj7exNT617mhmUwVQGhDlUr6MpBUG8tw4p5+OwyITBrBdrDBTcfOeskw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 15:29:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Message-ID: <ZBR5T57tSqs2o/Sl@Air-de-Roger>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
X-ClientProxiedBy: BN9PR03CA0887.namprd03.prod.outlook.com
 (2603:10b6:408:13c::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5908a0-7a6a-450e-e118-08db26f40b51
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ulDpbOU2ky9z/zHAmouOdHoHxDt8GsDtD6ywvc3I5816mmTUezsS3XZFGug7KObwh5SvWx7Gfd+dLenlcPU6adWxbTVi0o3kpYMTtrz3Y2IaaTqarOKgBHlIoXbqQEz8mU8jeW4og002PRcJa7Gtp5tjvKaH1QFgY5+N2DVUQZ9qmm5h4R3hTcA1ZSzryyKzUa2TEbKhGjWIiAsqljh+78MYHwOl6wm3qVEIaPC+ORci2NvSRwaIhil1fexnFCKSlraBLtywxvwtLO8f6a1bsry+ikI7pPnszv2+GsPubQu/R6brbE6QdPx701vtClugxFnQl8N934Wbr+/4bjOUnUtxxXOOjYpFsWjT4dlv5YloFPC3v+vwtmN6Mq5tnL9vQwbIiS18P+RfFIR33oUNa4L8jQLNaLVRSk5Rh7CCiMGdze7gWS737FUD85CWZwReNikwzWEGTjgamsEoKSDP5GItgfYfjQAR/iOO9U7bh4IU5yzz/rd0AEoe+aLVYk7k8AsyJTZafqR2h22DyvbocIZBeWkRaaj9K+4uLWYjgwA60lbcFPofiRZ7PB4Cw/M/DvC7gNqN2C8d+xqHoa5lZiex64WICRY66SJE2hb/3/0xyAEI/fT1pNhGI7SgSiCkjgyHxYzQClDrQ0ktiC+UUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(8936002)(4744005)(2906002)(5660300002)(41300700001)(6916009)(66556008)(4326008)(8676002)(66476007)(66946007)(316002)(54906003)(478600001)(85182001)(6486002)(82960400001)(9686003)(6512007)(186003)(33716001)(26005)(6506007)(6666004)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnN6VjROd3pzOUwwaXNabUQ3SDQ4Y3plVzJiWUVjWUZkd0FtMGFxMHN6N1lG?=
 =?utf-8?B?RWhYV2IxNFV3L1AvZHZYWDl5aU00YkNCR2owTlBObVBRM0dUU2RSclhQbjNy?=
 =?utf-8?B?cEdMSmxYampZbzRhejhib3NVck5vcStZSG1zQS9ZNElNRnlUb2VBbWVTbndo?=
 =?utf-8?B?WWMvWklYSGU3N0xjSzZXNWhjVTh1aXZXUVNZeGxTRjN4YVMvbTZvSkRoVk9G?=
 =?utf-8?B?M0Qyd0JJSEhOZXJGaVg5TVFYZm5udXR2Z0RpT0Uxd3FyTkFxeUJRVDEwYUUx?=
 =?utf-8?B?Uis0Qk1wNU9xQVU2Y3pvS2tBYmh4R0NyOEZUazlpSWxrVnNSMXkyaGZoNnM4?=
 =?utf-8?B?Q3dmNUJBaXNGd29DMHFBNmR5a3FYQStlOFZESnozbTdJaGJzOHhLeTNwK09s?=
 =?utf-8?B?Z285eFJPTkROUVppaXNENGloTEROVXdXYi9zVzZLY2Z6VDIvM2M0d2ZCbnV3?=
 =?utf-8?B?YVFZTnZJSGRoOTduOG9iVUJxc0ZpdUhOVXI3bWFTVHFHanBLK0VYTDllOWNY?=
 =?utf-8?B?TUc1bWh5UzI0TDdtWnBVRFJyczN6bkNXdHlrWlphTEYwTlZqNWxoeitmSlBO?=
 =?utf-8?B?N0RiZlFLZ1ZLQzZYU0NTWXBDRXZwM2NjdFljbzUweFRWYmREOVlyODd0R3JQ?=
 =?utf-8?B?K09uZHlwTkJjaFhsSkdiTDJqaFh2c0tPUnA2SU5qa2srR09ZcjBldnVDcENQ?=
 =?utf-8?B?SWttZWZwYThWejFwRmQ3YjRCdEJtSGJyUGE1M0hQMkl4QzNHZmsxallIaCth?=
 =?utf-8?B?S1dKQWQwWGo1ZG53N3d1WWtIMVBpSCticDU2Y1B0OUo3R0FZZHhyK20zb3Ni?=
 =?utf-8?B?bmZuV3lnSDFGYnAwbHZNa0E5QUIvcFh3b2QyNjFIYXY4Z1lzNmpKNG9OdzVH?=
 =?utf-8?B?eDI1T0dLbzFwWjQ4T1VFZVUzM1ZuNEVzeWlkdU1BSE1jTk83WHBqVVV5RUh2?=
 =?utf-8?B?NXhkVE8zS3cvOWRJZ3Z3U0NEOWJvbjZMcmFYbXJTQytkQ3VTa0ZUT29OZlJ2?=
 =?utf-8?B?RGdpRHZXZnVERUd6RGVscU9iS1FSOGZadmRzWGVlRmhpc1RlNVozMDRLUmFm?=
 =?utf-8?B?N2lmVUVQU3o1WW1CbWsxcFBIN0FiclUrbGtYbGswWlFHYkJ5czl6NHpZNjRR?=
 =?utf-8?B?L1NSYTkwQTN3dDhrcHZ0QzJpNkFkUkdXemVtTEU2dGJHVW1hRGQ1cWczWDB0?=
 =?utf-8?B?QTVsYXlOUWd0c1dRTWU2UnAyNC81RlU5WmJvQ1hOZ1lVaUUwUWRGZWEvb2dN?=
 =?utf-8?B?OFIyNUxlSEttU3E4dHhwK21zWUtxbjlsZDIrQWltR21HTlpmMVJTUXdIZXZl?=
 =?utf-8?B?Rm5leEU4dWpEelFtVVhmTmsxa08zKzdET1hnNnZ3VkdJV28xTkwyR2xnZGhp?=
 =?utf-8?B?cGNKK1NiRmtGRGdHUU9maFUyN29PRWFqdkR4aHRFeVNUa241KzBtekJQL1F0?=
 =?utf-8?B?TnRHNXVqV1l0NlA2QTlSdnFHcGxhdkZDZG0zUHR3NEVWV2ErSWlVOEY0WjdU?=
 =?utf-8?B?bW91V1lJb1c2SWVDRitGRVlsL0RJeDRuMHlwVHAyUjFMaDdHdTBwSytaaklM?=
 =?utf-8?B?cHhiSHQvcVQ4WEw2cTlJanE5N1I5Vm5DYTVaS0Ztang2YXlKaFhQcjZPdWx3?=
 =?utf-8?B?T1Y5UVZhZ3ZMakxlOTFEUlFxcEdNUUVwaXY4UXhxazBuMlRUYnN1ZENoVlN1?=
 =?utf-8?B?NmpieFhHYlcvVHVyUUE5ZkxWUk9zUmZzblM3eHhDYlFGeW5DUFJtbGtybU9K?=
 =?utf-8?B?UmwycDNqUFNYVVJGWjk3VkEvb3RqWHJ1YjRueGl5RXp6THdpekQ1VCtscHlv?=
 =?utf-8?B?ZzlOcXR4TGdhdHVQS0g2REtrY0Q2N2hLWndIWVJyMnFudFM2b1hUblhCNEx5?=
 =?utf-8?B?YVZzOUM4WUtRTnpmMVBlMHdvb21EbUxSYk5idUpURWpHMXFIajZlUGszdGhG?=
 =?utf-8?B?OFNDY1d2WFhIcXhheEZ3cjV0cStpaytCdE1NMWVTNWFRc2NUVU0waW9FNkRD?=
 =?utf-8?B?M2RYZU1kbUZXc3NBdVdrYlExWmtCTmw4UVFLRFpXT213Yk8xNDlMZmVhYm1w?=
 =?utf-8?B?cUEzeUgvd29KK2JYcVZZZ0lMOVIyNWJ0K1FEMnhaR1FlQTg0ZVU1THBnRnhD?=
 =?utf-8?B?OCtaK1JlamJEUEdkREdKRm1wY3hLWHc3NnE4ZnBUYkd6TmNJVG9zSGZLenV0?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YJCocw7rOgV16jw8O+tFe7Hz8+73ZKBjZ1M5i7uLQWzXlWC4zE0lZDqxZzKLlwEhTDefZpTfgsS4Jdju6V6eHGSQLoaS6YUN6an+o15Eq99GgssePI9OKjlMDNqpQWV/QySisb1eh9L0jQz+nOUGpFxPz93t8wC/JqtCrZv2I2dkTcpPIWm5AJzv5Qpwfjt0/WvOaAXEx4X6y5YFEb/ar9zWpUiQhAk0mEBaKJ+7cGyn6xMkribv/ixcfwQKTyayOPb9+y2oVuLw6MbLUPJDNywAV5Te7DA8y1xbUokAVAvETM/MddtrO7JsLEAig8LVv0EMJZiHSNljsNZiZzuRNn/WadohnfqYNY+eA5qMMW60+jPC+WLAL6x6WxIK6YFO2+F+p7ZGAa/Olr3Ed0IpJAujHANpGw+WrwqQ86WoNwYe6XVmkOzQNBp+DNRdUAdygXw4lfoqivf69oUvoOV4dlZ7L9Fco/uSKF5XCAnTnqQ7+olXqBlCiAxjyzKJCAm+xYyw3LjMj4nNDCfSDActvL9CHpeUmJ/p+0rP3br14XeMwg7BpiCfIasIQMMnIMRSN/N2UAFD1KGMauTwhNzcSkLx5ZRQDJfa3eMt8KYb4stn2SKF/w9YkxuB/a/NYfZrPSwyBIuXdoE70rgTom3GchY4YTT2TPV2pN4jMkHearA32zw6eGPt+RUmJpU4EkdmK6ZrU+d3rl8N5fdHb3PDtgxMkhUWgZOgjPFiD0G8CwckbEu4NSv5hP6tgLbHCY/IRKuRoOxNcPfBMuY1ZfCadsR/9G6fwx+0rQI9M/4r/aJXns/rYN8KJZRgnk4tvo7gQZhTiopVLSuawyJ56Lyw79JHUnsFUrq3mga+EZOVP/Q=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5908a0-7a6a-450e-e118-08db26f40b51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:29:41.0285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRF6BCmSXb3wOH9XBl94OERtOG4K6m86MT8iR5jbhQr8OFB1iifdjwEs5XBqItytoI7fhJvRJMQQKPOWbyRW8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6624

On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
> There are three noteworthy drawbacks:
> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>    now have to emulate certain instructions for ring 0.
> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>    complete there.

Then I'm afraid we can't set the bit in the max CPUID policy.  What
about domains being migrated from a host that has UMIP to an Intel
host where UMIP is emulated?  They would see a change in behavior in
SMSW, and the behavior won't match the ISA anymore.

Thanks, Roger.

