Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284134F60D7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299909.511232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6Qq-00024E-Px; Wed, 06 Apr 2022 14:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299909.511232; Wed, 06 Apr 2022 14:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6Qq-00021h-Ls; Wed, 06 Apr 2022 14:14:48 +0000
Received: by outflank-mailman (input) for mailman id 299909;
 Wed, 06 Apr 2022 14:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc6Qo-00021b-KQ
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:14:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4a329b8-b5b3-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:14:42 +0200 (CEST)
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
X-Inumbo-ID: e4a329b8-b5b3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649254482;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=O6yqI2yNl30rZ60Ur/j5AarcBZs/LPEGhx/UfE9R7Tg=;
  b=fcCVoJ/GyFALW7+gKurXP7sjZS72/ho4VzyQ7HL6uxYy7CfpNhqs338x
   hMGwd+DClUsC3L7vdJHU+HwYf94I/lDeo/Qrv7TIQjK9zNCgKR6B4mXS/
   qBU/fYWSbEkewfg0zFZQatbQSlqK5DkCAgI3d33jF1CQlK2a+4H1g7rnA
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68176440
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fmsShaNUKJ+0xTLvrR1Ql8FynXyQoLVcMsEvi/4bfWQNrUon0TxSx
 2tLDT2Ba/eIYzHzLosjPdywpkxSvMLTmNBgHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zi
 /5V7KGIdCQVFLDpvLs6ThtlSD5FFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdp2Z4SQa62i
 8wxaRs2dhLwSCZ1InwTE8kZw82M1nuiSmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSBzj6C/mOpl/X4lyrxU4IPF5W17vdvxlaUwwQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSpU938UhuQsHOC+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9MmsqdSICCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWxJ4L1PMz6oaH103ip22Lu5r0FREOz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5lypUQDPY68PhwxUjaoSsIvHONg1HszDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmTKKFcyrn0T3juH2iJuppVEtagXmggcRtv3sneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfJuB9rrE8lKIqF
 JHouayoW5xyd9gOwBxEBbHVp41+bhW7wwWIOiuuej8keJB8AQfO/7fZksHHrkHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:/igIsqhHr2gj3lHreVeZ3ltJ4XBQXukji2hC6mlwRA09TyXPrb
 HWoB19726QtN9xYgBDpTjjUJPrfZqyz/NICOUqUYtKPzOW21dATrsC0WK4+UyHJ8SWzIc0vp
 uIFZIQNDSaNzhHZKjBjjVRvLwbsaG6GAzDv5a785/NJzsaDJ1d0w==
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68176440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhGMfPaDQnW1x6OZ1bszA/6/V61BVHXhOS9DLtUf2JK3OuJe79R15FaQ9n880/7ac9HbCcH9TtwH/LxTh8KppQ4ncFrrrRuhxeKjEEuU3SSCohu6grYBEKboAsFUQug55PQCia0gxJbbEpUUtdCqLXGEuWnpo4EJiiqHCJ+uulQKNbARnK3mVTb5v6WlRjqmRX1dGZzOrLN8ooTsUIutR9ExB+ZA2vTv7pNoS6GO16O3rbJvCZvClJzOAAFUmbb8MmWXzXSc9t/VxcBpfByBMWheC/MJzrF7nFVvowLij9lHqnKsD+gkEkj+dfCGu4n8A8wp2jSaFN2OszmDLjfWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9fw/IHbr+tKaykx1VXn/RWztIvkRlufgpoz8UMrnlE=;
 b=Ezb9j+tiq3bM7/Mhz/zVZO5EMQQKbzZmRiEm9fBoLqP68hipBZG9dSSW1Jgwf5q3w5qHJ2ZwcDFVsqxzCmH9QFKn+gZt5h5gi+PQbTFHlP+Fc6aJu7L1UdNEB68EFyHbyvXRawmGzWeubLlpckKTvvXYOm/4VbtPmLpqzwmmH3LnSMAd91nphU2lD46IfVUJMS3dPRYsAlxxAekW6Ng5BfSDEt/YSfK71umykvTiOKCo6cNz15fEGNhhDmELo5F6bzmZuaOVcAaKqs0YRAASuhT2eaocjV+0iXUgXHyg31jW+5RTXQD7uE4/7pRUU79hYVzYsbXJ0F84RKncNGpL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9fw/IHbr+tKaykx1VXn/RWztIvkRlufgpoz8UMrnlE=;
 b=TJSS4Mrb88vHFzoWHAVn3q1ueus8hAf4Ff97PP0f2f8soIYNSegMoWtVKY97leFe1CBH4R4hR8m10f9hiYg0g2g3P7iszrRBSnq9E+JOCG2vyCJYPp/hRvhEndHU8jVHTBJl5vZDiv4SxzJqW7t8AQCgcASdgziEkILVvMB4fUo=
Date: Wed, 6 Apr 2022 16:14:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Message-ID: <Yk2gRvXUCfKwRBEj@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
 <YkxkfbNpR7yfLP7W@Air-de-Roger>
 <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
 <Yk1erGso3rC68m/e@Air-de-Roger>
 <c9186f2c-25a1-6d97-cac6-126bb32bd22b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9186f2c-25a1-6d97-cac6-126bb32bd22b@suse.com>
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c531deb-499c-4e23-cd67-08da17d7c6e1
X-MS-TrafficTypeDiagnostic: CO3PR03MB6712:EE_
X-Microsoft-Antispam-PRVS: <CO3PR03MB671225451A780C0323557DBE8FE79@CO3PR03MB6712.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6+wmvpEB62FWrgnbjC26TYCGKEWs6AanXGfEauowCA+ZrY6jiT9X5GlfnVEJxEeRBA9LNv18w3jtTKWt0vsxGfVUsKbzOlEv+rhs9YLMJ8GSx/Eox+vSSviEx5YefCrq+R2JhijkzYNrxAozgANfUuCgwFwuHhBGm75aqgF9Zfod7R7tMcI9jHYkH/skp0oVKoTDuL4U8s+psT0b36b3IVZqSj2zXPPhkaNNPnuJN3WRDSZ6Nq5D7a5hJ9pa73NRwsYINfjsLipukBgKlheun3aetKtHJtD99fXYbw6gzUW61wOaGwLYbXGzL72f9gPdeLsWcU9wCQfqA0/XbKZxW4NwQC+MXu7vqUQWbrKE3xE43qZzBO4Qj/wsiov4gjn1P81Mg6XqxZXO9q7BbbBdtkfVrRU0qPus9Tst8HYgNrtvNtZpaOU8VXWyoVrxLv2kL7r31LvabdCwMQdOXlEQWBfcXYFbAcdVn3DdMPMB03KVvTo7n1GhAlNzjZGUFI7JXYJEVF5Bq07XRi7y110EIgkcEUDucYYv7LLaV5lYNZ4p9Bm3skVlFrTDe809JNQ8MMmGLoaJksXTwidenE3m7xRhpNk9lMebynWd6urTW1ntVZXzz4X1C4jZLf/7kntmrSJ7cDoHDZYteygxvF5xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(53546011)(9686003)(6666004)(6512007)(6506007)(316002)(54906003)(6916009)(508600001)(33716001)(38100700002)(6486002)(83380400001)(186003)(26005)(82960400001)(8936002)(4326008)(2906002)(66476007)(66556008)(5660300002)(66946007)(85182001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlOQUZINGFpamtCSm9rQ0QzcGJzcmVaVnowaGZQQkdvN2pMUkErN3g0N2p1?=
 =?utf-8?B?RnZ2K3ptcmpESVJYZm9qYmRPSk9LeTZLeVViQ240ZFJnbW8rbE45dWNDZUND?=
 =?utf-8?B?cmxWYzNYUU1rUXJKRVF6bGNNTURsQVJtNHNUZ2g5ZHN0bElZM3BSZkh1QmFQ?=
 =?utf-8?B?Y1ZSMGR2NURLT1JnaWJ5THVNcGtIbGtIYlZxWXU4ODFHdG9icGVqVjUyc2ZI?=
 =?utf-8?B?Z2FlNDJnWGgvdGd1TzRidTBqSkVRblgyY0JJa3ZPbVhGRWlFL1JOVEo0WXdD?=
 =?utf-8?B?NHk5Z0xOdjlEQnBlYlB6RVB4eFlFN0EvUGRNd0JRb1dIQjFONis0RDdDMy9F?=
 =?utf-8?B?aGx5VUMrcWtha2tSMVpIM0xZM09HU3BrbkVqK1orRFR6YzEvTWtPaktjYThn?=
 =?utf-8?B?bTBya3M4Z1FRcHgxQzFsVWozQW1hRlNDZ2xQeG5ORVRvVXBuOFBPaFRnTmpN?=
 =?utf-8?B?VWlQUmV0YmI0KzZOT3R0NlgwKzJ6aUJjcklvbjU0WWZORUFjMXB6NU90eUJJ?=
 =?utf-8?B?dFcwZlpPL0tnaDJWYTVINHJNRTFYZ2JTSVVYbmFYNyszU0VYYVFVM0xSbFpw?=
 =?utf-8?B?aE1nZ0RacEhockRhckkwRWdjTDg4Z2xxekd2b3Z3bmRRaEZUbnFHaTh4YXlV?=
 =?utf-8?B?c2hpazUrWEJxeUtiQzd1dUROWlVTdXVWOWNnS2ZzSXg1eXQvQnlEWTR1dzdD?=
 =?utf-8?B?QmMycTNhOXAxZm1reXRKbGx3a01qT1JROEZYcC9neS92d0RGMVpzc2dnU3cv?=
 =?utf-8?B?ZW14MWZjZTdwSHFncG9WRlR5ZG10MEJlcTdlS01iOG45Rzh4N2IrcnIxdmdV?=
 =?utf-8?B?cnNOR09nSWs2Y3E1VG5DdlY0ZmQ3MFdnZUhMUVoyOGRiVGg1T2pCL2VhQkwr?=
 =?utf-8?B?T05pWnZzNkNGdWVyN0ZUT1RNTWhvRWl2emtkZXcremlvQ1V4VzlyelhCY0Jt?=
 =?utf-8?B?T3A0Ry82V3RhWFRONS93Yjdodk1IM0tCZzVITVBDQVdUaG8xZHNaWkVaa2NN?=
 =?utf-8?B?UFZGOHNaVExDZjhCcHBhNW9FZ0hHZ01wWVJnTk1HRWhiSlprL0RLMkltZmNI?=
 =?utf-8?B?eVFDOEtOaytGajM2SHF3WnowS245dUZma3NJWWJLMXV3Qi9JOG5rK0I5NWcz?=
 =?utf-8?B?WkpDQWRYbDVvRVFvVTZSY0RyUlVFSzFmNEdJTkJTbG8zR2RQVDIrRU9GVFBo?=
 =?utf-8?B?V0p5RzBtQng0R3VmM2w4UjFqeE1PanovMzBlVytBNXJrV0FIbkc1MzdHQU9U?=
 =?utf-8?B?YVJ0dmdTQ2o2ZlkycTJwa1JpNDNkZm1DZDZJZnVtZ0Z6SUl5SnU0dG9VTHpw?=
 =?utf-8?B?Z2lJckdTSTBFUXBETFV3Y0N4R21SZU4xYWpDR3doeUJjczBWUkJpQWRtSDNT?=
 =?utf-8?B?RGFBN0llZzQ3aEZKR2FrRHBPS01CU2wyYUxNNDJZM0lRMnNjd3VMendQMUdO?=
 =?utf-8?B?NTRUcjM3U3Q0NVlVTzF2aFRTb2VSMUxmV1dFZnlXa3hBZFRvb21nRzRHSVQy?=
 =?utf-8?B?RXZETUlBUW93VjhlOUU0dUdvK2dHY0wzaWdLYkF1YVVUdXhuQ0tJV08xQitj?=
 =?utf-8?B?M2dMLzJiUmVVcTMzZlRUKzBneDZuRGpwYXRKRE9rOHRTczUrbHJFaFhNRXVX?=
 =?utf-8?B?d3JmVENISGkzbzFnTzA3ajlJeHUzUUtHeUhQckNBYVF3Y2lNVVB0MDF1WXBS?=
 =?utf-8?B?cFNTeUtBVWlsS1p2T2NHbnoyZGVkMUxScE8rZ3dWa0lIdjFxSVBmT3pZTTJj?=
 =?utf-8?B?NjVOV3dLZThjMDFoeC9PUjlWelZSczRueit1RUZFRXJxZTI5L3QxM2lsRGNX?=
 =?utf-8?B?OHBaaFdCcGxaRXpRdWJ4WXhndDFSdkdNSm4wQm5PejlCbnB4RHRnUERHSDdy?=
 =?utf-8?B?Rm1GVkg3aWtzekdBL09abm9CNUdxNWU1RVJOVnBtVWpNbGhLOWpqTlRaWjdF?=
 =?utf-8?B?VHJubE9DSmp5UWZGTEZ5ZXg5S212UHpGRERuS0Ezd0s1WUJEb050NDJjdmsr?=
 =?utf-8?B?a3haQ29Md1JOWVBrdXdFTzk3KzhyRW9zeWE2UUZ1R0luTDlndVBVRDl1STFC?=
 =?utf-8?B?QkNWbW1qZklVVy90OHdqbGxkSEZyUFdVN3BWVlJMU2M5NWk0aWpXNytqYlBs?=
 =?utf-8?B?Y2d2VkNoaHVSK0VBWm4rYWNZK29aVEo4WjdmRyt0eEwxUzdUaUxnK28zNU5C?=
 =?utf-8?B?Ry9EakdiQzhzU0Jvb0VHV29KNlFJaXhqcGFLbXEzYXpIc3lLNVR2dzQweE8z?=
 =?utf-8?B?bEZ3S3RJOW5pMWlBdUE1ZHgybGRsRTJoL2JndFhvc0ttQWVJYUh4RDk4LzZn?=
 =?utf-8?B?Nm9BMSswL0tKMG9yVjg4Uzl5bXdKa0NYVWtURnhKZlpaUmxwbTJmVmxJZUFu?=
 =?utf-8?Q?6yoEFX6v2j8LIqQk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c531deb-499c-4e23-cd67-08da17d7c6e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:14:34.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nh1UWbKeI3bZPulm73kvy5I4WDFLYN5NJtz1VdSNVKGWhWJw7xt5rKw3aV5sMTAFQ9N4L5PjNiclFI01NOmpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6712
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 02:40:50PM +0200, Jan Beulich wrote:
> On 06.04.2022 11:34, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 10:44:12AM +0200, Jan Beulich wrote:
> >> On 05.04.2022 17:47, Roger Pau Monné wrote:
> >>> On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
> >>>> On 05.04.2022 12:27, Roger Pau Monné wrote:
> >>>>> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
> >>>>>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
> >>>>>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
> >>>>>> +    EFI_STATUS status;
> >>>>>> +
> >>>>>> +    status = efi_bs->OpenProtocol(gop_handle, &active_guid,
> >>>>>> +                                  (void **)&active_edid, efi_ih, NULL,
> >>>>>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
> >>>>>> +    if ( status == EFI_SUCCESS &&
> >>>>>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
> >>>>>> +        return;
> >>>>>
> >>>>> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
> >>>>>
> >>>>> From my reading of the UEFI spec this will either return
> >>>>> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
> >>>>> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
> >>>>> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
> >>>>> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
> >>>>> ignoring EFI_EDID_OVERRIDE_PROTOCOL?
> >>>>
> >>>> That's the theory. As per one of the post-commit-message remarks I had
> >>>> looked at what GrUB does, and I decided to follow its behavior in this
> >>>> regard, assuming they do what they do to work around quirks. As said
> >>>> in the remark, I didn't want to go as far as also cloning their use of
> >>>> the undocumented (afaik) "agp-internal-edid" variable.
> >>
> >> Actually it's a little different, as I realized while re-checking in
> >> order to reply to your request below. While GrUB looks to use this
> >> only "just in case", our use is actually to also cope with failure
> >> in copy_edid(): In case the overridden EDID doesn't match the size
> >> constraint (which is more strict than GrUB's), we would retry with
> >> the "discovered" one in the hope that its size is okay.
> > 
> > Hm, the specification states in EFI_EDID_OVERRIDE_PROTOCOL.GetEdid that:
> > 
> > "Returns EDID values and attributes that the Video BIOS must use"
> 
> I'm tempted to say "We're not the Video BIOS." ;-)

I think UEFI expects this to be exclusively used by legacy Video BIOS
implementations but not OSes?

> > And since EFI_EDID_ACTIVE_PROTOCOL will return
> > EFI_EDID_OVERRIDE_PROTOCOL if present it makes me wonder whether it's
> > fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if the problem is not
> > the call itself failing, but Xen failing to parse the result (because
> > of the usage of must in the sentence).
> > 
> > I think it's fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if
> > EFI_EDID_ACTIVE_PROTOCOL fails, but it's likely not if the call
> > succeeds but it's Xen the one failing to parse the result.
> > 
> >>> Could you add this as a comment here? So it's not lost on commit as
> >>> being just a post-commit log remark.
> >>
> >> As a result I'm unsure of the value of a comment here going beyond
> >> what the comment in copy_edid() already says. For now I've added
> >>
> >>     /*
> >>      * In case an override is in place which doesn't fit copy_edid(), also try
> >>      * obtaining the discovered EDID in the hope that it's better than nothing.
> >>      */
> > 
> > I think the comment is fine, but as mentioned above I wonder whether
> > by failing to parse the EDID from EFI_EDID_ACTIVE_PROTOCOL and
> > resorting to EFI_EDID_DISCOVERED_PROTOCOL we could be screwing the
> > system more than by simply failing to get video output, hence I
> > think a more conservative approach might be to just use
> > EFI_EDID_DISCOVERED_PROTOCOL if EFI_EDID_ACTIVE_PROTOCOL fails.
> > 
> > As with firmware, this should mostly mimic what others do in order to
> > be on the safe side, so if GrUB does so we should likely follow suit.
> 
> But they're careless in other ways; I don't want to mimic that. I would
> assume (or at least hope) that a discovered EDID still fits the system,
> perhaps not as optimally as a subsequently installed override. But then
> I also lack sufficient knowledge on all aspects which EDID may be
> relevant for, so it's all guesswork anyway afaic.

Yes, I'm afraid I don't have any more insight. I'm slightly concerned
about this, but I guess not so much as in to block the change:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I would word the comment as:

/*
 * In case an override is in place which doesn't fit copy_edid(), also
 * try obtaining the discovered EDID in the hope that it's better than
 * nothing.
 *
 * Note that attempting to use the information in
 * EFI_EDID_DISCOVERED_PROTOCOL when there's an override provided by
 * EFI_EDID_ACTIVE_PROTOCOL could lead to issues.
 */

Thanks, Roger.

