Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3964D9E3F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290864.493450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8cY-0002t1-Uc; Tue, 15 Mar 2022 14:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290864.493450; Tue, 15 Mar 2022 14:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8cY-0002qB-Qb; Tue, 15 Mar 2022 14:57:58 +0000
Received: by outflank-mailman (input) for mailman id 290864;
 Tue, 15 Mar 2022 14:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU8cX-0002q5-8L
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:57:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aea0d29-a470-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 15:57:55 +0100 (CET)
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
X-Inumbo-ID: 4aea0d29-a470-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647356275;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qIlSUsFjHCq0QIbHY9K1bZ/RzTm0z0GJXOrnw2tOaCM=;
  b=e2WWBlK2RC2JOJF4loFkylINXfcubtVvaZLwHEp6EsnQ305ya6qo+FL4
   6Wjdek/FakF/dJ13XsfpfF5/YRt/9jevFb+HOY1o6q6uyCJggzDHetoyY
   OZGAUS5VYVjoe0PAJK/TuaLcgZ1uOCYjz/r5MFtpGT22ozPsaQeUTwbqV
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66690182
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ongI8aMkTBvLOHLvrR2yl8FynXyQoLVcMsEvi/4bfWQNrUok3zwGz
 mUdDD2FPq6OYWShf9FzatnnpEpQvJ7WmtNrGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Mw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 +dKhIS6VgMVP7zdycMPXzkIKQ1hIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlu15gXTay2i
 8wxdCJ1NQb5WRpzYA0eNrtitd7xqkvBSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlarjBktQ9BPF9E7+RDc7bjYw1ajKncbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnFI4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBod97xor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/ItoBumgkdB4zaK7onAMFh
 meI4Gu9A7cJYBOXgVJfOdrtW6zGM4C9fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRkkQBCrKiOneLmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcCoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:vfXOdKqe4ITAPo0z4xIGtc8aV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5lUUtMPpZzfSKJMB25ffvtChPaHb21LtBOB5ryw6SHlIndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="66690182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VotHjPFkgWSphSgvdFetkIQj7fpSpAU3DP+abwmiYl8MRi1ZbnKJo9UvS+xt6seWjbqGcZ9sBxV91iDHFD14zJG764FKmn7YrdF9g3QF4HMTmJF8GnMqmEH39WcjUxir8AIL2tMUKpzABNAmEB2xketWlViNR7IRg9cTQnnDfMW2dI6uCmIgn1NtT7f3seWTLu7piSvtxF3KMZEZc4IObCnil91hv1mwWdKqWW+keWwVm6boJM3I+PKC0ypnPUZ0U03stYhxSIPiOVVt6Z21LMc/z4vgs6DjKaM2nNqHxBm/dsCCyxwpVY36MOqw1BcvAnFQEfNBqBNRFj7TIB9Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNSnrKjl/m+Pog4sW9a2Tkjw856be0UitwDrlge7P00=;
 b=c22FixoDa3U8/LMLemFxQsYEp4ubXk/iDnTzolG/xIKQq9gf35S1ijMsfJD0cQMcRmT1/4pq/sATM5YBM54et2acOTfJGujVTIlJq7auONNsgg1gqTHhIlt/l6VTttZpgSVIYwognftbMtqJcmXFoPHYciBA4Lo8qFWBl++5HRszutQ+to2XGk/QwMN4JMQWi6Afo9sm9Ldq8VuMbBBQ4Tx447ls+YxJWqOXYnzcTYynKijGigrxn83gIJ01S/SIr6tQZOSwopdMmWfI0QQM0RRjDlCvkjB2rhS0+5df1J7GaX401JSgCPAQGvA+CS+2LGjczH8+577vBtjPLY0wpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNSnrKjl/m+Pog4sW9a2Tkjw856be0UitwDrlge7P00=;
 b=CNKhlE3j9NRBVqUnPM8v1FcyA/R22ERp0PVDZAFVS1qWLh4CLob8zKLmT+ooPI4chhh46SvHuYkBS9K3kGdissoKweY+Q8ClDvq8BKkk1dnbl1X7dg99ojaf2IsAcaCsrKb4dgXxWUzrukv+pHxMXlUZbS8pck2doA46lPEKAAI=
Date: Tue, 15 Mar 2022 15:57:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Message-ID: <YjCpaGhm7OjXFraY@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
 <YitSc/Ky6PJb5ndV@Air-de-Roger>
 <d6bcee5b-abbd-5cef-f174-8609df94603e@suse.com>
 <YjBYk+xJMh1I6nrM@Air-de-Roger>
 <cd5c9fe4-6065-9c22-1a39-c9a5a77ea01d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd5c9fe4-6065-9c22-1a39-c9a5a77ea01d@suse.com>
X-ClientProxiedBy: LO2P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84cace53-46e6-4c64-15a0-08da06942c81
X-MS-TrafficTypeDiagnostic: CO2PR03MB2341:EE_
X-Microsoft-Antispam-PRVS: <CO2PR03MB234103E2D3959004AEA15D078F109@CO2PR03MB2341.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vDSrhd1jTcltjyhYRCF6iIAO1uVeuDnBAQKEECvYBDXp9vBhAnp5Nt4YhK9C3vMs9ZaiIm9/Z9+OVapxapFGT3vUY0yLrb3ANPmctsP46uhEPFkaF1Yb7UBqZW4letHv6dk2pkXatbcuD8W8QLCmzvdWoKop8/XZDY/ijbPBTe3Wf46D3cnpw7g6PRJZ2nHJzuZOTWhpcS4Lo4gwS/iXMUw84snFClAUtscHlN/Gwg+abWfIPcZ0IobNrkIf+JlhHyjynQyhelT/LIzgoaDoOFmd8Dbw1iX0u7tUU2B6iPtHhCqjl/mKSjIC4LpOubH6FQJZ43sE/KN3Ddwh5wdgR76EyuS46W5tB48bRENtC+rdZzG3zsNkScAQJ2rtwFeV/MXYj7p6Ft6+wlrRdTxxmDAH6ajXnh9zxmZn37l0gmXwY/ZkORErq+w9RpPLyjFXn8cVWaTqw9/fuA++eJJfdyBY49+nGXbSGupHCCQPEJigWRb2j2/63SymovMTKArxhLs02KS1llhtgCGRioCHqDvF8SdwgtDHfZgwjPPuHmtHzftEhuFFPqnygs74MFOjEZKlXGc5BXNfeBNwpEptoNZrcWBorW6b3MCV6Ty+Ho0PCp2IhlMhSgmO2z32+QLHWC7z14LiVrl0wx4dzQGWKZqczleZ2g15So/BvVrtRE1/Q2TWo0hZWNn1HKjYVzDpeDNifXXnZ7OsZPdjFNPOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(9686003)(5660300002)(2906002)(83380400001)(85182001)(33716001)(6666004)(66556008)(82960400001)(26005)(186003)(8676002)(8936002)(66476007)(4326008)(38100700002)(66946007)(53546011)(86362001)(6506007)(316002)(54906003)(6486002)(6916009)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z25iUTFlU3Q0MDUyNmNrcUtsYWN4cnBsNU5Ub1VqMmpOK2Y2TFl3VHlINHZ0?=
 =?utf-8?B?R2JobVFDcHo1QW5HK2dNR0NFOC84aCtlYkgvNEZSb3R1WEJJVXhiN3NHUnF5?=
 =?utf-8?B?NGZJUFdEbFRVVEZxcmppLzh5TEtDamYyZGdEazVwODhKQk45NlRSVXp0c1Vj?=
 =?utf-8?B?RkM0dWtoc0k0cm1GazZvZ2ZnTlRkNzVhbm9nZ0VEM3pWK0UvM1JGeTlLWmJ2?=
 =?utf-8?B?ZE9jMkNUTGlQbVFIb25lUnJ3dFlRL25DZGwvN1dQaW9TRlB4cWUzaFd6ZE1N?=
 =?utf-8?B?ZEtsWlNkcDAwa3NESXN1UnlsRmluVWM3ODJ5eXdQT2F4NWhkVWJpWnc3SE9C?=
 =?utf-8?B?R0R2TGxGbWwvTTZhcWFNMlIvUk02dUJVaFY3T1B5a1g4Z0p3cVRoUW9lYWhy?=
 =?utf-8?B?ZDQ0cG5CUEhBaVY5UGNCTys2TjFaZnhXRHVrcGhZbG84WVJTUDZqTGxEdlZR?=
 =?utf-8?B?N2x5V3ZhOG00cWZKbHRDd1pqdkpjdkhWSmljQTdwVkNBNU1OZVJDbUZGM1N0?=
 =?utf-8?B?U0d6QithZjJFMHcvUXVxTlg5YzQzZDlzanY3T04vN1hjTlVCZWR2UE5VUEZp?=
 =?utf-8?B?eXYvR2tzdFhVZVRwNG84QWNoS2dEaHFSUmVDbWxQbTFuc21QbGNEYU53MURz?=
 =?utf-8?B?K1B1QTByV21hUmtkRng3S050SGxqWXRFNmVXUGJFV3Z1d0RVZDEvczVFTXlo?=
 =?utf-8?B?U1FDcGxmMmNwNzJ2R1JCYUZVcGM4YnNoMy84MGo3VEFjS2Jva1U1UG0yUUU1?=
 =?utf-8?B?TkZYZ29jYUZWU2dqYlFzeHdJVmNWS1JjbWtKY09JRU1IRFg1cXMyeGVPRlho?=
 =?utf-8?B?M3lINHZpU1I3USt4dXFYb3BqSEE2ZFA0Y21uWGdsOTdCMit0RFYrV0o0cGlh?=
 =?utf-8?B?YUNwT1R2NVVxZFZXRDdEb2VOUENjMVBRRWtZYnltTXlYSVV5Nkl2ZDdidlY2?=
 =?utf-8?B?THl1NE9hQ0NZT3cwT3pkbUNNcHBOcllieWF4aWFSb2xtb0k2NTFYV1JiSWt4?=
 =?utf-8?B?OFZTNTVLSDZPWVZ4V0JOSmlyUmE3Wi8xSTB1VUtrZ3dkVEsvdXJjbzEyY2pr?=
 =?utf-8?B?ZTRhMVBRYWxBS2VQODc2ci83bmtRTTVpL09HTGQ4SnMyOFIzdmI5WGxuVXpI?=
 =?utf-8?B?VU44RVBaSjR4VkVObFJ0dVBlejhJYWF0Sis1TzIvVTNmeHFlbXJpM1EwZ3dN?=
 =?utf-8?B?SVFSY0lHZENhWVZYdlpTSlNKaUpOTEVraXNkcFpBNnV1bXFnVk53MUFpNG5P?=
 =?utf-8?B?bkpIeWNBVG1PblZmR1UveUkvZmZnRTl1RzhmcnhSaFFhajl5TzIvV01zMC92?=
 =?utf-8?B?R0p3NXpOdEJIb0FjdDBsemFyZ1pBck5lVm9ocmNvVnNkRkNUTDNZZStDUDhu?=
 =?utf-8?B?ZklXRmtTMWQvdFlqYnppMVBzUmtXSDA4elh5Q2hQZXZCL1hxaHJpVHErWDJ5?=
 =?utf-8?B?K1U4aDdadXlSMnB5a3VQVmltaDcvOWZqZ01QMVovT2RIZlNGa2JaaTdTOTFP?=
 =?utf-8?B?SldVRlEyV0xwc2tBb0ltL1gzcnpkbTZBcDRkNnVnbnFZT2oxYlcvUWFBbE5l?=
 =?utf-8?B?Zk9qbHZBelBtUEVuSkNuK2pEclJEUHFpMUluWHlQWnhROVArQjJrbGVyS3Zm?=
 =?utf-8?B?N2ZyYlBkTVJvL1I2VVhQK1JBcHR6bFVvNXFzaDVMbTY0bkY0aGs3aHFYMlMr?=
 =?utf-8?B?YkxEU3FhZ3JBMTg1b0FWWGJ3dU15RmNKWDl0REVxYUsxR1EyZERCYTJzd0ky?=
 =?utf-8?B?QTFiRFN4eS9yU3lnQUpCb2lIQVYzZDN2QkYyck9hT2xWT3RkT05hb0N1b0Rj?=
 =?utf-8?B?SC9HK1U0Zmp5NkV0a0d4amhMa01zL1dzcGZncWdob0kyckY2RE9XbmZOU1hq?=
 =?utf-8?B?eGZqRzFWcDg0OWxNVmVTeHphSXlrZ0lkc1FwZmlHeXFianVnZG40eHh5QXJq?=
 =?utf-8?B?OHhnYmJJeWxxQVJqTGxnaHVNcjFiUjY1dWZkTzBxaFFiS0RTT2NuT010dzY1?=
 =?utf-8?B?QnhHWk5KaDVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cace53-46e6-4c64-15a0-08da06942c81
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:57:49.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaKc0QPBqHBgKdE4nP0mFALf30gbMnbrexPgF7A0xLY9cF/vPu8Cw7TD13+dZyqZLzhJMxNFOWrIJsDEQenWCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2341
X-OriginatorOrg: citrix.com

On Tue, Mar 15, 2022 at 11:39:29AM +0100, Jan Beulich wrote:
> On 15.03.2022 10:12, Roger Pau Monné wrote:
> > On Mon, Mar 14, 2022 at 05:19:37PM +0100, Jan Beulich wrote:
> >> One thing seems quite clear though: Doing any of this with interrupts
> >> enabled increases the chances for the read pairs to not properly
> >> correlate, due to an interrupt happening in the middle. This alone is
> >> a reason for me to want to keep IRQs off here.
> > 
> > Right, TSC calibration is also done with interrupts disabled, so it
> > does seem correct to do the same here for APIC.
> > 
> > Maybe it would be cleaner to hide the specific PIT logic in
> > calibrate_apic_timer() so that we could remove get_8254_timer_count()
> > and wait_8254_wraparound() from apic.c and apic.c doesn't have any PIT
> > specific code anymore?
> 
> Yes, that's certainly a further cleanup step to take (saying this
> without actually having tried, so there may be obstacles).

OK, I think you are planning to post a new version of this to avoid
open-coding apic_read() in read_tmcct()?

TBH the PIT calibration done in calibrate_APIC_clock seems fairly
bogus, as it's possible the counter wraps around more than once
between calls when running virtualized. Maybe reprogramming channel 2
would be better, as then at least wrap around would be detected
(albeit it's unclear how much delta we would have between the counter
reaching 0 and Xen realizing).

Thanks, Roger.

