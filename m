Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E01365460
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113387.216045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYlx6-0000BV-DU; Tue, 20 Apr 2021 08:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113387.216045; Tue, 20 Apr 2021 08:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYlx6-0000B6-A5; Tue, 20 Apr 2021 08:41:48 +0000
Received: by outflank-mailman (input) for mailman id 113387;
 Tue, 20 Apr 2021 08:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYlx5-0000B1-5W
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 08:41:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5db8b742-74ba-4e74-b6c0-acfa526c4fc8;
 Tue, 20 Apr 2021 08:41:45 +0000 (UTC)
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
X-Inumbo-ID: 5db8b742-74ba-4e74-b6c0-acfa526c4fc8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618908105;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wMYZRUza6bY6ZY+bXaPdUEmR93fkDE+UWoKqPNWQj4w=;
  b=b4gNiwxTDDhzHhYlVsTtPmU/MpEYT1xF5hx45RtF4afDP5DbEdrHvSdI
   DqrpWq1jzZ8fQ7pipLfHggshmS8BZlVVDkBpV82KPLhfntFVDAwhO9UcE
   H4/mV2VoN6X3U9cHyqFdgWSCS0FoYF/cod9D+cH6yxgYxsfHeDC9r7qQh
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Y7X9lGTq0oY4u7gtZSUeGxDUEEXLmq1XtX/WkJYhOy2NtZrve5R8JL4HZMr0Sbo1gIBZpmWsoD
 gs7VnjhvPFoqtrsUCOM4HJKoDyZpzLbuP/7t87W+WJHgwNU3B1ooQ95NfChQy4Lk7L4u08+4LH
 Ni9GruKmriWYWLGZtLMNfNKlzhqXKsQr7QL6HaL/0UH4m1TOWMt3bPTMq/zNYJo+SA2yKkNhUe
 NDgKCgsMC5PN/KAr42tFEYugh5ENtJL/9IABqbBRtqqIHor8ll5EnGr9e5vpLL1CKRG0zOaDFN
 wYU=
X-SBRS: 5.2
X-MesageID: 42085134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uTpniK6ybjtNuGDW7wPXwXqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTYj9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+2OVTat7XbnqhkFQnMiO7xIQnM
 DIs1McOa1ImgzsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VHAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrCk2N9qdzqhHhfkl1gq6tmtUnMvJwyBU0gPt+eEugIm7UxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNS9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbchGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEU4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9cbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IMSb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQTppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjBNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHEvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7NEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiUue5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EigYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4lQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrS++h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNHHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzKAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU6xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1ZUu1zzh84jIM21SCuSqv45mId+mEunw1PpxrKwYip4GDSAEdcFxbW668mBQVuDg==
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; 
   d="scan'208";a="42085134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du+hIS8LrZAxFj+TzIib407gwfzfCllDkcMuMnAgomXgx149CgfHnhOGEhSMxCk3yrng9zWKNTvE7g1O8syes/zcLXHNYUJ/GqLxg7n9oXgn/Dh8dxNtgE7vzqYyA4zEvlQfuYUjpcckJY3WsFbY0U2s1aBu/HuNWK2n/vK/8CUQCiW8c6iX7ZEoClah+EZ/evUib70Mkj6N+pt7ba8WTD2uQuDJEWOzK+rCHS+C54Nwj9EbZqL9NiDXZUUTizyGhX5WGyVP0w9T6J3jTIZIycCKVzKeT2xhOPGrhji3oJRecQvFj5W7h7jcBklEA6X5kcJcFH4KrAppC/VLRd+2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FTGKve+mIVo6Wdh2PnAJXmIHEw1Ia0RVE5qAT5dKs8=;
 b=oH0MS8Gpj1q3xx2QFUXSAHGVVCH9qgTYEBtsYR5cY156RIcZ/JGmU+4hHotc2L7haToRcjJf3cyhmkBRPljX5v3CSpSFtLw6r+qSIhuTt0fdsnsGAIRUV7v8GhxpOUzAg4vkYjlEnq9lPuPJuqv8yl6LUS1rJNwwMn1uugbmzXoQADxVlvczWulwlepAZikGV9C7cc3joFlGftvtaaI5O1TivAXHhi+TQqLwJTnVFom/tZxVJpe7MIA54y1hnsLZzSyM8Td39TOqmJqXZrkeUk0orxPn6KG0j+o9HLhM50F3dDYwRWiSUZhCAfRcTDT++gdJRN8xiTbgnc5a5bGJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FTGKve+mIVo6Wdh2PnAJXmIHEw1Ia0RVE5qAT5dKs8=;
 b=mOa7gYMpwx7Dnia9FAuQK5S6JEYRvoAakFXRJIo7Qe2sQGxa5Fweqgat6WiqkZZ+f4FrMJA3Xu+7t3OlO8AUlFHefjaUuUt4yh9GMpP8E7JzY962ouqx/2nHGSYNYKcNzOm3Be56plPOsTU/x6HHraErxwCQD3676xZlLbl2Ujo=
Date: Tue, 20 Apr 2021 10:41:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
Message-ID: <YH6TvzSEbBEg0Nuf@Air-de-Roger>
References: <9ecd03b2-f8fa-2a8b-69ad-4b31920ea205@suse.com>
 <YH1KZhLrC6anI/Hm@Air-de-Roger>
 <1612e2ac-87ad-4f7f-aaed-05486365b9dc@suse.com>
 <YH1y7pFbtz/aWMJ2@Air-de-Roger>
 <8c3fb7b9-2ca6-ade8-70b7-482822cc1c22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3fb7b9-2ca6-ade8-70b7-482822cc1c22@suse.com>
X-ClientProxiedBy: AM6P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b67518-8a0a-4469-d50c-08d903d81eae
X-MS-TrafficTypeDiagnostic: DM4PR03MB6095:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6095D7547129053D74B41CEA8F489@DM4PR03MB6095.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxiaVBYF6WoKPJj79FgTa2KhiuInqn9ab1jHjaPeWNru8S4FWGKQ9evqqZuMQTzPIvbMrPJhDwyyxTaNrusrT8B7JUkchpQPoRJTqsvVv6yxsrZuQV1NMjTJzuPA34+12dGvC3wLMTpRwy4jCen+cg228HvatEDrSWUjeMiO9T3QVZYI8a/TDiwL+9NV/pNlDra5zcv/sker6EO+VS9OK4vtp5kkpKCKQ03LW380b5LrIX/Xmh6TK1rZF/QGIpn7BrqU5BfmDcFXYpOwgZZGgoTUdMcI5S5oiAfHH8Bv9Kt7kRcS+sg4DiiHxWx9+Mqu65QyIhTLrHo/0KLGmfwminOOKoNw6l1yZDdzbWYCK4wBFXPWBuVwfamN97WT9IpvSRmLiS8HsEDWEHHbxvlYVwvBT28ameZ7xgwm2cQ77AL5sC3D0A9qBAWksO7C/IT3hd5to7YKYHz299sRU0R4/Ku1YNY4NWJ1EZSwfcWnZLLv6l+86mUPuN6q6BurUa5tHjPYZUkuE0idjWLbfUHNq39NMcwXDO96XhKyBcTvrIMb/yZ7xBNZkFp26SITexnUbjRkJEXPpd5r2zwbkuZVllj5GR8BMrBBaJB/sv+BvQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(39860400002)(396003)(366004)(376002)(66476007)(66946007)(66556008)(2906002)(478600001)(4326008)(956004)(83380400001)(186003)(16526019)(26005)(8936002)(8676002)(6916009)(6496006)(85182001)(53546011)(316002)(54906003)(6666004)(9686003)(33716001)(86362001)(5660300002)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3RUL3JyV1F2MDhoWFBwYWRKclQ4Uk9NNElTWUVwRHU5aXRuYUpicFc2UlVl?=
 =?utf-8?B?eTk4UW9VQmp3NjE0cE5EaEI4QUgvYzZPY3QvOHRxUm1DL3BuQXg3a3lHQ2hi?=
 =?utf-8?B?aDNSaHk1TzNqdVRsbkd1U0x2NmFhUzhYUlcrbkpNdjg2YVlWa3I5RmZVejgx?=
 =?utf-8?B?WjhrYzFEbDZtVTZxUy9nVGJxZW96ZHN6MjYrYW5XQzV0MjZUdDlvWGUxUG14?=
 =?utf-8?B?WUh0dmx6VlZLdGYzL3lvSHRKOWZ6K3psRGpjL0U3NU0yKzFrTzVZTlRlZUp1?=
 =?utf-8?B?N0Z1WWRzTzREa1RXOVNDTVRzUUFQZjhuMWtMakh3UCtzT1hkRmhhaTR6N2dV?=
 =?utf-8?B?Tm12NUJRKzRvSWdqWGhmUGswR3hET0hSbFZCejZ5VlRWeWtmSmp0RGRtc243?=
 =?utf-8?B?WEhoUkljMmgrMVQxc3JVelVuSEFzRFVPRHVFdkMrTm5XYUZ6Y3ZzMkppOVpO?=
 =?utf-8?B?NjV4L25oalVzRUJRTTBqbGE2bzBIQ0ZjbFFXanM0ZmtydCthUTZMZkdlQ3BE?=
 =?utf-8?B?b0k3VnpKY1RDQ1d0Qkk3TU0wWGE5RGZ4N0pONzFia3c2NHpjeTFmbkNwQSt0?=
 =?utf-8?B?elBkVjZhMnhCK2RISWtaT01RcFdjYnVZZEpnbk1YU3pSdmNkb1g2TXNNSGxO?=
 =?utf-8?B?WHhNYmwzeFVSenJXL3FGOXFPSjJsaXgxbTR5RitBL1ZkUnJYSWJhWHZOa1Zi?=
 =?utf-8?B?S1FUbWJDT1ZJNFJ0VEZZbWs4bUFYc3RHMFhQdHp4SXJ0aGloUFNmNGlWSncv?=
 =?utf-8?B?SFM3NUk4dDFkOHpMYmFYaEhZWVd2TW9nd05BRC9xYnVzR3JHR0FCRS9zM1dq?=
 =?utf-8?B?dHBTZStzV2VNNWRCVlpxeksvcXNzQXcvcnIzL2xQOWM5SWhFbk00ZjhFckJq?=
 =?utf-8?B?Z083UTFITGlsa2RXZlloUktObHEvSnpFUm5LY2V0NzFvYTErWWY5YWRLTnJR?=
 =?utf-8?B?QmhxRFFUV2VwbDF3TWlPNXE5Vy9QMkh5OC8ycEhNMGZzT1UwdTM3bmE4ekJs?=
 =?utf-8?B?VHF2Q1M0cExXdXdodjRVTWU3Zkl1dnJDaVRDcjgwWkJFbFJpbFFEbGU1a1FU?=
 =?utf-8?B?c2lHSVlGWU9GV25OVk9iZmYzVjJudUdzR0YreHdTMjVnRTJHMkZ4K2hXNldG?=
 =?utf-8?B?QWJic2VWS3BYbndSQkVUMmtabFd0TGx0S2FuaW5wNW8vdWl6V3Vzb1lCVWNB?=
 =?utf-8?B?ZDh6eTdLYkhPdzhxT2p4Mm5pcUtDclg1RWFKTWViS3g1bWRsQzNUdzNHWklF?=
 =?utf-8?B?cmtRUHhUTWR2bWRYa0lodEVTSTJEVk1kSzdCNURPcTNrOTR6cWpzRnlFaFhB?=
 =?utf-8?B?YXpySEhvVlRjQjVEME5hWWVLWDRQUGdEUUozSWxldW1aVitUV21yVHNRQ2hP?=
 =?utf-8?B?NW1GTHhBeTNNWVRJTjd4cnhhQmJJbXY1UXQ3YnhtTzJwOVlob3I1alk4dysw?=
 =?utf-8?B?azhYazlGNTUvZmpsRzcrZXlNMzJpRzlDZjkxaWFERVdETXpCZVk1ZllsRUxl?=
 =?utf-8?B?UkFkZmxNVDJ0UFNoYU5RR2hZcDRFUmQveUpkbDVocnZUNDdPd3lLb0Yyb0Uw?=
 =?utf-8?B?VXp4L01QWXAxQzB1Z1k4dGg2MXZRNE4wY3MxbVNybHlINkFNaFdJaVBRWDlI?=
 =?utf-8?B?TU1wZ0Q3aC9Bb21DOE8vTVloTDlnek1UY2JNMDBidlhOTlBUbC9YbGtONnBh?=
 =?utf-8?B?OXFIOE9FK2RGcUtJUVpYeVVwYjZRUG5xU2hCSDNjM0VuYjh3RUNHeU1xeVVo?=
 =?utf-8?Q?XnJj1xr/gpA0RilXp1YMFkdAfM2TpBz3KUp4Ogh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b67518-8a0a-4469-d50c-08d903d81eae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 08:41:41.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPubETCjNnf/7XnZRd75Ch6P/kaDIMnwL7vJ0ov5LxCc888dCcyEtmEqjqMflKE/nESDn4Civ3V+iGQj1+WhKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6095
X-OriginatorOrg: citrix.com

On Mon, Apr 19, 2021 at 02:29:38PM +0200, Jan Beulich wrote:
> On 19.04.2021 14:09, Roger Pau Monné wrote:
> > On Mon, Apr 19, 2021 at 01:46:02PM +0200, Jan Beulich wrote:
> >> On 19.04.2021 11:16, Roger Pau Monné wrote:
> >>> Adding Paul also for the Viridian part.
> >>>
> >>> On Fri, Apr 16, 2021 at 03:16:41PM +0200, Jan Beulich wrote:
> >>>> Zapping leaf data for out of range leaves is just one half of it: To
> >>>> avoid guests (bogusly or worse) inferring information from mere leaf
> >>>> presence, also shrink maximum indicators such that the respective
> >>>> trailing entry is not all blank (unless of course it's the initial
> >>>> subleaf of a leaf that's not the final one).
> >>>>
> >>>> This is also in preparation of bumping the maximum basic leaf we
> >>>> support, to ensure guests not getting exposed related features won't
> >>>> observe a change in behavior.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
> >>>>     than subleaf 0. Re-base over Viridian leaf 40000005 addition.
> >>>> v2: New.
> >>>>
> >>>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> >>>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> >>>> @@ -8,10 +8,13 @@
> >>>>  #include <err.h>
> >>>>  
> >>>>  #include <xen-tools/libs.h>
> >>>> +#include <xen/asm/x86-defns.h>
> >>>>  #include <xen/asm/x86-vendors.h>
> >>>>  #include <xen/lib/x86/cpu-policy.h>
> >>>>  #include <xen/domctl.h>
> >>>>  
> >>>> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> >>>> +
> >>>>  static unsigned int nr_failures;
> >>>>  #define fail(fmt, ...)                          \
> >>>>  ({                                              \
> >>>> @@ -553,6 +556,103 @@ static void test_cpuid_out_of_range_clea
> >>>>      }
> >>>>  }
> >>>>  
> >>>> +static void test_cpuid_maximum_leaf_shrinking(void)
> >>>> +{
> >>>> +    static const struct test {
> >>>> +        const char *name;
> >>>> +        struct cpuid_policy p;
> >>>> +    } tests[] = {
> >>>> +        {
> >>>> +            .name = "basic",
> >>>> +            .p = {
> >>>> +                /* Very basic information only. */
> >>>> +                .basic.max_leaf = 1,
> >>>> +                .basic.raw_fms = 0xc2,
> >>>> +            },
> >>>> +        },
> >>>> +        {
> >>>> +            .name = "cache",
> >>>> +            .p = {
> >>>> +                /* Cache subleaves present. */
> >>>> +                .basic.max_leaf = 4,
> >>>> +                .cache.subleaf[0].type = 1,
> >>>
> >>> On a private conversation with Andrew he raised the issue that the
> >>> shrinking might be overly simplistic. For example if the x2APIC
> >>> feature bit in leaf 1 is set then the max leaf should be at least 0xb
> >>> in order to be able to fetch the x2APIC ID, even if it's 0.
> >>
> >> But in such a case the "type" field of leaf 0xb's first sub-leaf is
> >> going to be non-zero, isn't it?
> > 
> > Right, as type 0 is invalid according to Intel SDM, so you will never
> > be able to shrink below 0xb while having x2APIC set.
> > 
> > I still wonder however if there's any other such dependency, where
> > shrinking the max cpuid leaf could force us to drop features exposed
> > in inferior leaves.
> 
> My take is that, just like for the x2APIC case, such leaves won't be
> all blank if the qualifying bit is set. Or if one ends up being all
> blank, a bug likely sits elsewhere.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I'm not able to spot any more dependencies ATM, so worse case we
discover some of those along the way and add the missing logic if
required, in any case seems like a fine starting point.

Thanks, Roger.

