Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9249CEDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260990.451410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkXz-0004zY-Uk; Wed, 26 Jan 2022 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260990.451410; Wed, 26 Jan 2022 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkXz-0004wc-Q9; Wed, 26 Jan 2022 15:49:23 +0000
Received: by outflank-mailman (input) for mailman id 260990;
 Wed, 26 Jan 2022 15:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCkXz-0004wW-5d
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:49:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85b7fdaf-7ebf-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 16:49:21 +0100 (CET)
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
X-Inumbo-ID: 85b7fdaf-7ebf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643212161;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8oOjyUjHih/TiLMJEuk+zPXA5Rt+X20Q1VepQExxS0I=;
  b=bb2kbl+/XtXuSEexmVls+s/OYJcmjoPfxAL+/jfp1uIh84gpKwjacONF
   senNfubBEL4mFWwoFmxCy3LSwsrZQFNf+D9vYLYInrbLW6tpKH7oFOoqK
   fg1MTAcjcT6cIIWnfF7zYhY18yqX19EqVQVSuQ8dKqwPiSwloWqQ4kAlx
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h6GgggW/CznHHslxgFlUbMnx2/H0qHDFGvj/fxo/Tf+8bv+6kqtGqL3jk5x5CYofFuOHrqmcpY
 jpLMrr7QyxHkWyu26TuwAdctI3hjNJvbSVvKTDFSfOapYGlfyaKUj2OxVya4scwiaJbeADCtAp
 Cg0yM8RuqfHgMbjBhaNM8zmIh/IUKhMwrD4XrlqxNgkP2N76nJDdzQb9Rp8jzJjseLcT2S1+bn
 FLk3bUmbYbF0r1uNDCbXof0hn4CZqLgLGdMmENYFgB42nR/EMoiMtWogNsAgBJpVbLgo7cDpSa
 EwiRTKgldi9UneUylRyPcQFD
X-SBRS: 5.2
X-MesageID: 64980884
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xGwJZa4Si53ue/hi9cn5lAxRtGLBchMFZxGqfqrLsTDasY5as4F+v
 mJJWGiFO/mKYDb1fNgjOti/oUxVvpCBzdUwTQo4/ilhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 9pssaCUaCYTDIrznrleWR16FwpyIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmth1pgeTaq2i
 8wxZDxrYDrRQiJ0AEo6JIolodmYm2fhbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Sq
 3ja5W3/DlcfPcaG1Due2nu2g6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ84iMzqYAi+UrtScPyNzWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpYdkt5ZEeXiYh2
 BmPks+BLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1RZ4GEY7CMyHnh39F/KtvaRF2ju
 FMIhJ3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkV4JvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBwwMnT2
 r/BKK5A6Er274w9nVJaoM9GidcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YoEbpDXlUkDDb2hCsUyzWL1BQpbRZTcLcuuw/G7i8bZelY2cI3fI6K5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNjzhI9CKcpfVeR3pYRLkK8vJ
 9FYKproPxi6Ymmdk9jrRcOj/NUKmdXCrV/mAhdJlxBmL8c/HFSYo4G9FuYtnQFXZheKWQIFi
 +TI/ivQQIYZRhQkC8DTafm1yEi2s2Rbk+V3N3Yk6PEPEKk12IQ1eSH3kNEtJMQAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYg3zWLNtK3WLx+dVsahJyuMLsAe6Q
 BvXqNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfeCBdcJRiBjiBZPYBZCoJ9z
 LdzotMS5iy+lgEuboSMgBdL+jneNXcHSagm6M0XWde5lgoxx1heSpXAESuqsoqXYtBBP0R2c
 D+ZgK3O2+ZVykbYKidhEHHM2axWhIgUuQAMx1gHfgzblt3Aj/4x/RtQ7TVoEVgFkkQZi7p+a
 jpxKkl4BaSS5DM51sFMUlelFxxFGBDEqFf6zEEElTGBQkSlPoAXwLbR5QpZEJglzl9h
IronPort-HdrOrdr: A9a23:xggAQqCFeBN6zYnlHemQ55DYdb4zR+YMi2TDsHoBLSC9E/bo8v
 xG885rtiMc5AxxZJhCo7690cu7MBThHPdOiOF6UItKNDOW3ldAR7sSj7cKrQeBJ8TWzJ8l6U
 8+GJIUNDSLNzdHZGzBkXGF+q0brOW6zA==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="64980884"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXJe6VtIn4fgB3gx5qFYbPIPmZwsQqTMEds8gOiOajkzQhMcATdAtGHGYH/PFMXQdL2HXWsKyyqCj1KRCogb5sbgVWGKjiBXMGbmjU446NM6pXF/dMzLr5lksAXXFEhjbp8WYPiqbqqyC/Sjo991sE9ufME4wyUqCon5GKKUn+C4OgSyvjlVDhBg3pM87LfMqVg4t9JYiA9b14r3yknMCQzqtIt+NaNNEnIriF+r9AfDeCkdaGNIOURCncYA18yXH2ndzLKTiH0sX8+cHq+jFeo+z9OHrQKCUxtSLKs27Kf2frPnH4f7olj/FuYC0V9mlvbE+1rTtFjRH0V38GU69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4YAwF/w+unTE322F2AFQijYArLKdz6GymS+pMDTgWs=;
 b=l2AqrdC3Cj7NRYFA43pejdXsHCd5hnEzD8k0wDXhz/d+tGMJND2Mc+qExEvzajV+HTJUREkuu0EAE04hCwrWz4z4N+HngZukOo+Wueg7APuukcef1qts1D+ryghIZ9beM/IGMd0OYE6aQsNGzdPNiMpKz5B05g7B2YtloQ6rb/g3mtnCxEAeIvYUhjPImkcr+ABrkqhXQH4BLn05EG5nqOauBkivjLK5cee4xJxuaS+qFnBCpBJTOe2W66Ew8NhK0Baalj53zQBkPWVrUSA3ukISJGZgQcJVwU679LbHVpHWUrMfg6BpBC5DIUfR3FfW/UehwHy6vBnhlyqOupW5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4YAwF/w+unTE322F2AFQijYArLKdz6GymS+pMDTgWs=;
 b=X3P/D8Rjf7qNFMyVWr5hq7Y+z+IB1xdhHqTLRJafQBAaBLkCXaEVsw7JS7v2S4EynNdMBxfw+Dr7fQByUmHKBRdlLBku+0ncex+LXOZrqe2MlENDEI+b6i+5IKIMi3ejavXEHD5Cq9zY71LNKZCEb7voPc+MU6vKslAhumvEIsI=
Date: Wed, 26 Jan 2022 16:49:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <amc96@srcf.net>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Message-ID: <YfFtddUnO15BaJVS@Air-de-Roger>
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <a46cb04b-2e83-a4d3-039f-61bdbd381c38@srcf.net>
 <4ce94feb-4a0e-67ad-611a-e56ce43c1a61@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ce94feb-4a0e-67ad-611a-e56ce43c1a61@suse.com>
X-ClientProxiedBy: MR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc4df899-1265-414b-6d77-08d9e0e36747
X-MS-TrafficTypeDiagnostic: BYAPR03MB3944:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB394473D5FC11160151E32A1D8F209@BYAPR03MB3944.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3xfWp95WVONECsAeuyHNZvJeOPwZC9VCtFw016jG6jSrpQqkDh/rjG55SbK9CGsXvDDP+Dfm6oCusCY4O7CUdONl3ZSy+atU4O1LXjeTpL30UFresx1GW2gc2SxREhrCJNhO3vGLnRS3QP8mIgmMYXOLOg7xN6/fFPfPGZV5faxwY4UrqqVmbUFAzyRO5tXVy6B5xQ9yLrlo1qrKXo0xuZ8sq7a2vxaFKPx4zDLrAKQ9JrAdkZLgWJSu7+I6x7DcxwIZLzCwNkavQi4FDJTDZy9+tSzrS7QE/hdzuIKJR0ktz6dTkMR7d2RA1IzcKEXcplPWWmgIPoE9U0KZ6ajn4rdXgmuN6bn2SGLR6zwVjDA6azE4vTAkEAzy5epHN0PeuGvpETX1VEfdF9XPF8YY+i5epfhv30wCWhct2Sr9ImaOgr5nN/HBh+YZ2PUPiVjBzCy3OxhywrDqu/EcOyWiCpXXOlbJFo1r1y+1MYKtitaUO65V5ut40hX0QCtfDrTGSWYZp2NLeY2VxAXpRtbfiC9pokhedQARz1/PuN7tnWIlUYK3Qi2O3KDgKrfuT2er9mGNWim6s1b1OyG/YQktJdcGtWZvp3WEB0xSloSeQ1YecsU6IfqebOBgkVroktSz9GQ2mg1SJU5oHd+atfYkKVZ3zqhPMBHTU8Pt3ZhycFr5wu/QMYvPSXAkSVpvSEAPSsmU+Ve6O5qflczBTvK3Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(66476007)(66556008)(66946007)(86362001)(5660300002)(4326008)(2906002)(54906003)(508600001)(6486002)(6916009)(316002)(8936002)(38100700002)(82960400001)(26005)(85182001)(186003)(83380400001)(9686003)(53546011)(6506007)(6512007)(6666004)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWcxRDlHdzhGeThGUHk3d1V5bmxFQ3BseDZtQk1vK2hxKy85ZzB6ZDROZHFV?=
 =?utf-8?B?bEVMeS84WVFRcFd3cW5pRlE5ZVRZSyt3N0tiNlEzNzBuY1QzME4vUkdlM3R2?=
 =?utf-8?B?c2J1Y05JY08yVlJFbm8weExFazlWZUpYaS9MeG1uUklVSjFlYmFZRVEwaWlH?=
 =?utf-8?B?OFhISlpBV3BVMi9Oa2RBQTVRb3N3amVzRzNwWDBPVyttUU53bHR5MmNCcU5R?=
 =?utf-8?B?aFFzOGxmUDZOSnptQVo1ZjZjMXhpL0wyQ0hZV3NKZ2ZlL1V4dWxiL3hNdDho?=
 =?utf-8?B?eDM3V3Y0N0FTdExCMXNKOXpBeVdvamY5WFg1V3Z0M05ZWWRUNUNJZkowNGxC?=
 =?utf-8?B?ZXF2cVB6WEZMb0RwclpiZzdLRWxVR1I0b2h5RGhoWlcrZk1TUGdoYkVCUkl3?=
 =?utf-8?B?MkllZURtdGIrYk5nejZ1MURHUFk3VWZWSjRYYzI1Z002N2JvVkp4c3lQbWpN?=
 =?utf-8?B?Z1ZKdXhiZlBHQnNRNkk2Y3c4SGltamo5aUcrb1hDZ29yN1J0dWF5d1plQzNj?=
 =?utf-8?B?TnJGRTc4cGtjWlR6OTJXOFJEOWlXS0M4LzdpNzhwNFZTbXo4a0liVW96Ykhv?=
 =?utf-8?B?ZDFpam1lSU91Yy9xMDFIVzZNU2NNSjh1RGJiSlloTWRpMEwvZUdCQWlLa0Ur?=
 =?utf-8?B?V3dsOVk3bHRWa2xsRFNYNFEwbDRKOWVLWDJVZFBhUTU4WURUak96M0xqU0N1?=
 =?utf-8?B?NWV3N0pNTWcvaVV4bkMwbXorTUt5Y0t5bHp6SFZrMDFuNnBoNGNGQVpFNUZT?=
 =?utf-8?B?aFdrWmM2QnFISDN6SVNrTXBhODBzOC90cUJzeTVFZVFJWkFDaTRjSDBSNG0w?=
 =?utf-8?B?OUkva3FPclhLdThuSHZ6c3RJVWl5NmZDSDZuNEdkSEF5bUdwY29YQzc1S2Ez?=
 =?utf-8?B?U1g4VGR6aFhsVEVBZUtmMVNIeWtETXR1eXYrTWhnSmZMUjFPRDBvd1ZZMk41?=
 =?utf-8?B?cC9XOXF0S1FWMG5HREhlYTJ1eFAzZnlWcmZwSG4vZ3hxaEk0eTBmNkU2RlAz?=
 =?utf-8?B?bVVMaGFLc2V2QjY1cEx5TVZ3RUw2NWV1VHFXQmVKdUlTNmZaMnhqeUVrZzM2?=
 =?utf-8?B?cElKZ3YzRXAxVTMvMlJJdnhtMlhDOTJkUWlKd3BkNkFzcHdrZTJSUmpRYWYz?=
 =?utf-8?B?SEp6Y0Z5VTI1ZFFTZ2hxT3JoMGFQaVc3U0ZxMmgrN2hiNHNSbHlQRE9TNzM0?=
 =?utf-8?B?QnlwZENEWUZNZHFIQUhVeWJEZXVodWZoUEtuWTJNSnJjLzhEcVNSWkZUYklT?=
 =?utf-8?B?YjBFcWtFM3BhcWI4L3BsR0tkai9OeVl3ZEJZSE1FMGltOWx2bVBPaTI3cGJL?=
 =?utf-8?B?Q05NN3BmNGZsZFlXTXRURDlQRDZzdmdtdlpEbmwwaXdJM0hWUE45bTN2cEVh?=
 =?utf-8?B?ZU5zMlVZK1B3d1V5S1FROE9GQTR2OXFnU1FlMFJQc0MvUkp3QkUrWmtaVUp0?=
 =?utf-8?B?RlN3MlFSbmdlVGt4bUdrYVZoVHZQNjhmZnF1cEV4R2RWRy9pYXVuMFJ6Y2Ux?=
 =?utf-8?B?d0I1d3NXTzVTZm1WL0N6SUNCYmJ3WVQyUFRyV2JYUGd0K0RJZjRlZlZEbzZp?=
 =?utf-8?B?NThPZnZhLzNBSnJ6a09CeE9POGpvSm0ydW9PNWxhQk83WXlRRHhxMTd4Smlq?=
 =?utf-8?B?QmNzOVh1NFI1Y2VKQVRtdG1yaFFHV1hCRkE2ZnZnZXFmZkFSdVE0T0NDejRN?=
 =?utf-8?B?K2l2b0pDWWdtQW0xWUtqK2lrd1padGNzTmR1eEV6RjZxSExqNkg2ODJQZkZK?=
 =?utf-8?B?V3BZWk5Dcng5U3l0ZXpPb1VSOVRCUHI0TFh4Y3ErSjlhSGo3eFlCYXNnSHNK?=
 =?utf-8?B?T3VSRTkrdUlkcXhNUWsvSmZtOEF5dEFzWEdyK3RIR01EUEFMRDJZVlNFenV0?=
 =?utf-8?B?Q1paazViVDFVTkJITG5OOHNZWTR1V2s2RzRnOTA2NHBUS0I4S2pYV2dEdEc0?=
 =?utf-8?B?ZG1zT1dxOUMwS0JmcS9CMWQrNWFqdEtKTjVtN2xYRTR1RDVJczJqL0ZTc2Rx?=
 =?utf-8?B?UlJyZUVUVUF3cjY5eDVBWVRPZFl4ZHF1ZEN4RjZIcm1DUWVBeXk4Z2lSbUtj?=
 =?utf-8?B?SjAraWRXaFZTUWlWMW5UZ3lFQnNnOWdhcTdiVHA4Y3lwVDFiZTdXdjJqdXdm?=
 =?utf-8?B?RjlVaENlYUdVSDhmTUJCUC9RSXFkTkUvU3NBRnJKNG1SMXpLZGhPbDFyVzJH?=
 =?utf-8?Q?GSrVnlaZm/jjcX0/13o3GRk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4df899-1265-414b-6d77-08d9e0e36747
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 15:49:14.5661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdRG6VrzfxwD8HQ5LrUN34PgW6TSfc7W/f/KxFfQ+trWrbKrYhvKULhliETAuoKyCUHuMPjyCkxl7oA2zffImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3944
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 04:27:04PM +0100, Jan Beulich wrote:
> On 26.01.2022 15:45, Andrew Cooper wrote:
> > On 26/01/2022 12:26, Roger Pau Monne wrote:
> >> One of the boxes where I was attempting to boot Xen in PVH dom0 mode
> >> has quirky firmware, as it will handover with a device with memory
> >> decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
> >> with a RAM range on the e820.
> >>
> >> This interacts badly with the dom0 PVH build, as BARs will be setup on
> >> the p2m before RAM, so if there's a BAR positioned over a RAM region
> >> it will trigger a domain crash when the dom0 builder attempts to
> >> populate that region with a regular RAM page.
> >>
> >> It's in general a very bad idea to have a BAR overlapping with a RAM
> >> region, so add some sanity checks for devices that are added with
> >> memory decoding enabled in order to assure that BARs are not placed on
> >> top of memory regions. If overlaps are detected just disable the
> >> memory decoding bit for the device and expect the hardware domain to
> >> properly position the BAR.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > I'm not sure this is a sensible approach.
> > 
> > A bar at 0 is utterly unusable, because it is outside of the host bridge
> > window.
> > 
> > The absence of any coherent GPA map for guests (needs fixing for oh so
> > many reasons) is a primary contributor to the problem, because Xen
> > *should* know where the guest's low and high MMIO windows are before
> > attempting to map BARs into the guest.
> 
> But this is all about Dom0, ...
> 
> > The proper fix is to teach Xen about GPA maps, and reject BAR insertion
> > outside of the respective bridge windows.
> 
> ... and hence this isn't about "insertion", but about what we find
> upon booting.
> 
> > An fix in the short term would be to disable the problematic BAR when
> > scanning the PCI bus to being with.
> 
> You can't disable an individual BAR (except for the ROM one), you need
> to disable all memory ones collectively (by disabling memory decode).
> Which is what Roger does.

I've thought about just disabling the ROM BAR if that's the only
conflicting one, but it was easier given the context to just disable
memory decoding globally like it's done for plain BARs. Didn't seem
worth the extra code to special case the ROM BAR disabling.

Thanks, Roger.

