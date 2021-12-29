Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B74810F9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 09:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252315.433315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2UOF-00029D-RR; Wed, 29 Dec 2021 08:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252315.433315; Wed, 29 Dec 2021 08:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2UOF-000269-O4; Wed, 29 Dec 2021 08:32:55 +0000
Received: by outflank-mailman (input) for mailman id 252315;
 Wed, 29 Dec 2021 08:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukf9=RO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n2UOD-000263-9z
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 08:32:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d20cf4-6881-11ec-9e60-abaf8a552007;
 Wed, 29 Dec 2021 09:32:51 +0100 (CET)
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
X-Inumbo-ID: e7d20cf4-6881-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640766770;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YfTowUBWkCA5ialIxM+kJQRAaU5cb5qmHjYSuTlaBGM=;
  b=Efoe8fjFWk4AtR6tXiKXEKfVm7yFeu+eXPyMXVkgtAoMmrTng4ARADgQ
   yBbBmKWVsE0Fl1n9cZpVYE3MOymTu23SiNHo3KPIHwSCuCvD0ZyjHHCS5
   TzhHQqFY+CicWpbtOEidGpPDncccX9Bvwpr9Q/jLe2meibTwXM96+3JgW
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o6Dso3i3l9d8e+WZvWtdCZKrakUO8ldAFqlGi7U+euHuADnVUo4t638gOBLRDA2chrOF4AUO9X
 QgbiladUZP+W1W/04I8BreyxSijyCEAggultACDQpJqnAUUhtgJdJHQ51MKmHiDUYvJOfzjlHb
 HffQVUtEd9cMq8s20ANTGDai+RIudNxYSluwgGaZAkKrGNBcg8merfeQJVruYYfiRq7HS0N/d5
 rmPdQm/Rt6x1MmJlSqjB/5ICDA2fH/6n82c4dKZyOX7gK/Uir2NoLkgQm9ATFFPUdmhJfNDZnH
 8JMQOS4ctS7i2s3dUhCpd2H6
X-SBRS: 5.1
X-MesageID: 60943860
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Tnxj36NVe+F1hv/vrR17kMFynXyQoLVcMsEvi/4bfWQNrUoh1TNUn
 DcdDWCBPvfYamD2e411b47j9k0CvsPRx4A3SAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400gyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozmmkukg+
 opdjq6TV1sYBp/3mPUXCBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uStIMDjGlo7ixINansX
 NsgTyRzVxrvTwJWCGZPI41kxOj90xETdBUH8QnI9MLb+VP73AF3lbTgLtfRUtiLXtlO2FaVo
 Hrc+Gb0CQ1cM8aQoRKL82ihg+LTkCThcJ8JGaejsOVtnUeYy2IUEhIbE122vZGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrFGJh08uBMprIc4ktDC1+JHU8gzCCT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj70hu+aTNT8D2BN1bQ9xawfRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyb8JN4Bu24lfBsB3iM4ldnBO
 hC7VeR5vsE7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVAye0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:FvNmEa3dvW2tWnjeOJXpdgqjBSpyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,244,1635220800"; 
   d="scan'208";a="60943860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV8MxdsCWvdBlVHI8KghG518RdJAwoKo/i0GJTThbKQW0lm991NuC4/Vws07ks89B5mTBmW8ahjagpwUUR3A5NNDOtdQIQdcoB9ptYcZwLusTzTkZlbiVZyg8AAM+fmsDjkbIzB2Ft1X4Xz7V2z9l4mTUJcJjupi+EYd3gLj0AXXUcG7kNedBPStb/4i8J5ojpNg63vz7CJWFUK9gouRi1W/0Pwepfho4aYEiopRoC7Dzlf6dbqEaHQtKu3uEAuP/WOymzymCd/e+XlDldrZyij101ZiWKIXff8vwI8AB9SfYBPZwj146v2yZ/+5CuWevflDMABqJZXsFqmtw/6/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe8tWSAxsYXH3EC6+zhM3nXnUZ3ZtbBnfaEIj5tNTgw=;
 b=WwGyHSeMjZSzhda/gUBW4XMK52ATbx38w/2r2gUdWKkK7jkzfAHRhEguymzLt3gIMAPX6XLe3K2tM1Mp4pFm6qxLj85V5Rb24nEFQE91PpTdhRPiifA3X561Smjc0rWD3rKHVnzAK6Qm4MSn0aed42ehDfxAH6xvCF7Z9uQ6vcbfqzEAKIRYfGJ808xtCLh7KROEZW3+CsX4HhbDV9cT3OznMCgrC7sezzq0mE5kS6wJrdkZBIvHLZdmHYn5Bvk0pcxJa8Y6VhdikeekXHMjH/CqPX/G93nkryVI7B7UR4NWNL3PfgFDQ993qcmBR/WCBAH0HqfCyLB4vwgTKiLeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe8tWSAxsYXH3EC6+zhM3nXnUZ3ZtbBnfaEIj5tNTgw=;
 b=wv/NeNShWTWyilw1AUkEVhIkR9CLqOLojwMQR11hxtRhIpqODMUAasa765csvJOVRcnh2CMVdmjE9eDDySRLztv1j1r7kFiw0N2P0XMx6Aqj0MvGtNXzW8+GIGazmS/ox5hxomyUGc+Yka+Tqn7axwOSdnuKNnHp4SMCecK10Ic=
Date: Wed, 29 Dec 2021 09:32:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcwdJn/Y0yncuJ/e@Air-de-Roger>
References: <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger>
 <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger>
 <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger>
 <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger>
 <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b41e90-b5f6-43de-3912-08d9caa5c943
X-MS-TrafficTypeDiagnostic: DM5PR03MB3145:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB31453569524518A8098043448F449@DM5PR03MB3145.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NFjfpPk9lqU5rZLRDYB+OrE3aPNMMP9N82YtID725goI7wPft/xN6houFLbzYPkuO+7PXzmwORR642pwxNWxGhOju46GehLPA+MXZheMO4MypKPSV9cvsltlXW/bIYg8H9HoI3qpTaw7qovEMNHkdCuyieQk56DmYoDim2BODRenZQjsdRhuZUyESxnqc/0EZmlCZiUy4pwX8CQXAq8DTOjy9IuuPCe3GYzsXmGS6+/tRgUDwDtcz2x1Es9wjPsUnpXP9/uC1L2nZJF0GGWmefsJBg33SaFWDLs4oO4KkSu3TdvzdAwsOog5JVfw/FWcL9xVrtDVCB8m6rXnvb8O4X1GLTatpwfoTudppcQqOJP48N8yQR9T0VDwhXDGr2y4BVOvAZiPcz3YVO8BN3rO1O6jiYShLoTYGxHeaklA1kbuVwR/lIMDyKYzVbX3f7gyMl6N2BL0v84oLvqYme5o/Yy5taFLndv4d0TtRnmjV7Pm0eQdv57SHfgO/NiCpyz8+5U2lKSrxgh5mz7JCKjQ/RQreAsoLHJTPNbPqH0GPv1j42TNmsgKTT7aTaGwaSJjlOJDmPEUie0BDRB4a4jnoyxocNPcgsXQ1vfVMidDwGggi2gxZ9sTSrFPrhCBP9qeRonW6ehq/yzyh0w9cN5Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(38100700002)(82960400001)(6916009)(316002)(86362001)(66476007)(8936002)(66946007)(6506007)(6666004)(2906002)(186003)(26005)(4326008)(8676002)(33716001)(53546011)(85182001)(5660300002)(83380400001)(6512007)(66556008)(6486002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUw3eEdkVW5OeUo4aC8xS3QxQ1R4UWMxTjA5aFhjUzYvOUNQazFWeEtnbkVn?=
 =?utf-8?B?bzVqOG9SYWV5M21rbkJ1SDBCUWR2c3JrY0NlZVlJbkQ4ZmJkK1FGS2hEYmJU?=
 =?utf-8?B?cjY1S3RZV3p4SmV6NmxNWnM5ZnF4ckpIN0U1TURvcnB3d0E3OHNCNEQwZGtE?=
 =?utf-8?B?K0VScllKYWV4MmJHN1hucDRyODhuUmZVWCt6QVc1NzNDUzMyNTZyUVJmNW0r?=
 =?utf-8?B?QndPVDk4UThyalh1MVoyVi9qZ1N5TDVNK25ncUFwL2N4TlBQNVpQeEVvTm84?=
 =?utf-8?B?dG9EcGJlY3dvdnp5aTg1Mkx5bUF5Y0hid2YycHQwaksrdHdyakFtUnMzMUJ3?=
 =?utf-8?B?RytVWWR5MXd6V2lOdlA3dVgydHNOM0lQdnFpMk16TlljMGt0Q1JzZnVmOVhl?=
 =?utf-8?B?cE9MUjdGd2tiamIxK2NZSmFBUFNoZ0RvZm1UNktlT0dGUVRWdFpXQmFnbHdE?=
 =?utf-8?B?WWVmRUhLcmcyRkVQS1F0TWpKdEVEbXZmY2prNVFRN0lmWldEd21WR0ZPZ1pr?=
 =?utf-8?B?aEoxT2NQUjBBYUZ5VFl2WEluMFFmVXliRjBvTTRxQWxYWk1SY1oyRHl4Skh0?=
 =?utf-8?B?Q2RzVm5xWUY2blJCWUt1Tzh2TVNMSk00TlcvYWorclJVTkREU09MWlpjMWxx?=
 =?utf-8?B?TUFPMjU1WXo2VEk3M0lwRklkWG5yelh1U0Ztc2NhZHF4MlMxKzJTT2ZvU0tz?=
 =?utf-8?B?TGtRaCt5RlpVKzVJcTBZYnI3aXBCTWo3cUZlUXNLbHprNHNqZ0o5YzV2VXp0?=
 =?utf-8?B?NnNTeEpGWHh0SkQrcVB3ZGRjaUNXS1lKZWZkUTJWdnZXejVGT2h5ak9ER3lM?=
 =?utf-8?B?NG9OOEtiVVhuYXBnZzRWOWZERTVDNXJGRGgxTWZJU0I1WDdBdzdtTWR1Q3dR?=
 =?utf-8?B?Y0dUZDhGNDVKSjNxbGN3SDNnLzlPWHR0K1BQMThieWk4ODhWcXZKN1FDckNE?=
 =?utf-8?B?WEllMDUzTmlUOElIYXVEVEtWYWRKN0s3MTZJcVJuWGJodzMxVkVVdmVOeFNQ?=
 =?utf-8?B?dWJ5RW5CQ2hIT3Y2RWZuM0l0TUhlWGNtcjNiR24yN294SWt3VGo2R091bDFC?=
 =?utf-8?B?c2NUZFFTNWNqVUZOa2htNkZNY0p3TEZBeFZjN2VranloLzRCa0ZoaTRZRWJa?=
 =?utf-8?B?TDVLUExUZzNxaXdmZElDd0VWWlN2T0x1Y3pROE5ZaFJSaUFMT3JGRk1Hc2VC?=
 =?utf-8?B?VTdKYmxud3YvTUEwNWJuSGpUNEl6K05mU1cwYmx1RlAvOE95YkFnODdiS0dC?=
 =?utf-8?B?cmhHUVByVldNUmxrck9RZW5mUHpEVURxNlVoM3Y3TzNyWlNybVZVZzFHRm55?=
 =?utf-8?B?OVNJOVNTWFZPbEhkVVFpU3pGUEFuMktDd3RIWUtVbFR0Mm1IMXptQTIrVml1?=
 =?utf-8?B?V2tJRjZBL0cveFhjSkRLZk5NbzFneVkxS01Fc0x4Y2k4U2FCZzZ6dDZmakx5?=
 =?utf-8?B?eHZ4MVhsMDk0VVJ4S3kyNUxXUzNaNDN0NUlRT0VHY3ZmZXUwcFQ4b245NytP?=
 =?utf-8?B?RGhCYVVpMXExOGRIUFdIMFVvNG42dXU3MURZRFJvRDZkbTgxdTFXL3Rud21p?=
 =?utf-8?B?M1I2dVAzMjJUM0pYcTduVWp1aXo4aDV5TEtxazNXanNvSFQ1WUNjdVM0d0ZZ?=
 =?utf-8?B?cFFpcU4wVWRoNTIrU3lQUy9lN2Y0Qkd0Tlh5Y0JjY3BycDZpN1VOU0Vrdzl2?=
 =?utf-8?B?TVJ1NmU5TkFLeEdsRWtEMGFiTmVOekVDcE83L1RXbEFqVEVGVlNYV3JKOGsx?=
 =?utf-8?B?c0lGM3IrUCtQd01YTUdsbHVQb0V3dkt6U0pwbFY0UEY5ZUdUU0t1ZTloMEZt?=
 =?utf-8?B?eTZMOG11dDRkMHkzeGd5OEp4T25ITWpSdHZja21kSVhzcDd6U1p5YXV4S3U2?=
 =?utf-8?B?dVU3YUg0VFo3NjVabUE0SkFYblJ3bmhITUFldGpVaWJYRUlJMWVna3pWTkpZ?=
 =?utf-8?B?dGZvREJrbFZ2ZkYwa3IreE5yTXJGNm5BWFBKbEFQRncraHhtS2VrNVQ2Z0NR?=
 =?utf-8?B?ZC9ZaHZPcjJpN1ZSU25teWV1UnNzd2FyaVBiTm1DVmY1UGZqa2FMY1NZSVcy?=
 =?utf-8?B?RjdwcitPRXk1R2hsZWNFUzFITTRuOUpBYnMwQnBydnJvL29oSjNYMS9WcmlS?=
 =?utf-8?B?ZS9Yd3BpVkJLbDRSNG5MNHBNd1FYdENlMHprVEFBV2M1RzlKY1l3Uk9VMnFx?=
 =?utf-8?Q?7WzkAblD2JlDnO7PzfoW8ZQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b41e90-b5f6-43de-3912-08d9caa5c943
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 08:32:44.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWl4C6cXsZKuaxnecMgZuE5KB8a9+OFmDnRTyx0W/YUDBctGw+6UzA4M+wTcimnbDPljV8l1UPvG5qwsY8l4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3145
X-OriginatorOrg: citrix.com

Adding xen-devel back.

On Wed, Dec 29, 2021 at 01:44:18AM +0800, G.R. wrote:
> On Tue, Dec 28, 2021 at 3:05 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Sun, Dec 26, 2021 at 02:06:55AM +0800, G.R. wrote:
> > > > > Thanks. I've raised this on freensd-net for advice [0]. IMO netfront
> > > > > shouldn't receive an mbuf that crosses a page boundary, but if that's
> > > > > indeed a legit mbuf I will figure out the best way to handle it.
> > > > >
> > > > > I have a clumsy patch (below) that might solve this, if you want to
> > > > > give it a try.
> > > >
> > > > Applied the patch and it worked like a charm!
> > > > Thank you so much for your quick help!
> > > > Wish you a wonderful holiday!
> > >
> > > I may have said too quickly...
> > > With the patch I can attach the iscsi disk and neither the dom0 nor
> > > the NAS domU complains this time.
> > > But when I attempt to mount the attached disk it reports I/O errors randomly.
> > > By randomly I mean different disks behave differently...
> > > I don't see any error logs from kernels this time.
> > > (most of the iscsi disks are NTFS FS and mounted through the user mode
> > > fuse library)
> > > But since I have a local backup copy of the image, I can confirm that
> > > mounting that backup image does not result in any I/O error.
> > > Looks like something is still broken here...
> >
> > Indeed. That patch was likely too simple, and didn't properly handle
> > the split of mbuf data buffers.
> >
> > I have another version based on using sglist, which I think it's also
> > a worthwhile change for netfront. Can you please give it a try? I've
> > done a very simple test and seems fine, but you certainly have more
> > interesting cases.
> >
> > You will have to apply it on top of a clean tree, without any of the
> > other patches applied.
> 
> Unfortunately this new version is even worse.
> It not only does not fix the known issue on iSCSI, but also creating
> regression on NFS.
> The regression on NFS is kind of random that it takes a
> non-deterministic time to show up.
> Here is a stack trace for reference:
> db:0:kdb.enter.default>  bt
> Tracing pid 1696 tid 100622 td 0xfffff800883d5740
> kdb_enter() at kdb_enter+0x37/frame 0xfffffe009f80d900
> vpanic() at vpanic+0x197/frame 0xfffffe009f80d950
> panic() at panic+0x43/frame 0xfffffe009f80d9b0
> xn_txq_mq_start_locked() at xn_txq_mq_start_locked+0x5bc/frame
> 0xfffffe009f80da50

I think this is hitting a KASSERT, could you paste the text printed as
part of the panic (not just he backtrace)?

Sorry this is taking a bit of time to solve.

Thanks!

