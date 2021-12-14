Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAD474603
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246815.425653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9OU-00043G-8z; Tue, 14 Dec 2021 15:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246815.425653; Tue, 14 Dec 2021 15:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9OU-00040v-4k; Tue, 14 Dec 2021 15:07:06 +0000
Received: by outflank-mailman (input) for mailman id 246815;
 Tue, 14 Dec 2021 15:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx9OS-00040d-UR
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:07:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d920f7e-5cef-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 16:07:03 +0100 (CET)
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
X-Inumbo-ID: 7d920f7e-5cef-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639494423;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ibZGt/QLVSF0V8x3om5/gxxMTbcr9Wz8OcZ/SEqfFIo=;
  b=NTnoDYEUVPab1PDQ3doOOibjuK7t/QiGSYXC11GS61U1DFUiRYnWxG7w
   F2keqQnK+echgIM61Fw0k3e2BRm2uzv5Nctc1LfPdweJj7Pjte/TWIg/c
   qYupdZSsDPKunw4M9ePcC+WmvWtaWUxGvti53tjXsSmwFbHU6WFVdBk6n
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0bj0s8KdS9qKQ6pr/26AjE9pZXSNE1GZxOg4h5P2PlxZ3OTpUz7Mg9XLdT9QlayOQticaogUI6
 MwzZLCxA4dYZTvShkLsPJMvq8Q+MJCWoErmLj+XAvWM/P3E+ECE6e7on8oszqapyN5XETsqzMe
 y03CZp/0iJv3NuOwMkPv1bwl1F7CT+OQEfKovuHZa8tryXi6waCqp9FMwrijxzTIb8IZMl+QjZ
 RXwfRDjIS8f4Lz/RHhPN3qtDQwMsxXnoqdDJBzJsXJViDP/jWjjMlw6PxyLbFsjcjiFUXUehAt
 tyuOlb/pxiJNUby3MscJH8dv
X-SBRS: 5.1
X-MesageID: 60383985
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gIF/4KN5Eqc3RHTvrR1TkMFynXyQoLVcMsEvi/4bfWQNrUoggjQCy
 WNMDTuDb67eYWD8ctpyOo2xp04H7MWHnNNkGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy6rkM139
 tFLj4ShUwUnP6TnlfgkSDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uSvo8DjWdt7ixINcnaY
 /ULMj1mUDLRXTdOOXg4A60xmvj90xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1Wk1iZo
 CTa/m3/KhAcKNGbjzGC9xqEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixHUoLUzh/bNocrN4sRzIr3
 3SEg+ryLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 Chsdyu2trlm4XSxeMqlGrpl8FaBvantDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0KtcMJZSP3M/AmM+pd7vjGK4C6SrwJsdiOMbJzjmVZLlfbrEmCm2bOt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepUaDOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8riq8ZEKLbDafVI9cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1phYkTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:jklymKuTzu6I0KzsUF7bhnC07skC74Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD8qhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5nUUtKPpZ0fSKGMB29ffvyChPgHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="60383985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3TtIs1OW8hcVPWtVg/IW+JZeaRJVCcG1Z4aHCIkj8h1W6jSsFowGS0j/Gm90tT14ue1uVN28lQApkFR5bOBDgPJhYt4OMqFgUaXBXmUzeMD1rplvofHdo50XrSyodgMecPrAHRBOiIKJx5xMkXKmWHvR6QAFy4iStP516offGcfPLXYZgStw0kN4SFGb0eZSRA6nr5oXRaDAwXww2fBIkGD5lXpt18Mc+TQtjQf1Phi12dHWeefoboAfUf5PJfiULeD2RHIQxKrLyPu/98U10ezpETiM5+MzI3yAQpO8rl6x9bxn1FPNd8WAEs8T0uGHVite+JRG1pAaSNpHCNUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL5SZ5t1V2LttmnHb65odBicDHWtXodGq4MhIY5Si0g=;
 b=FLsbA3iKOBzz9PCaAFRAANTDI9coUXZbYZpVMlStHYshdr5iNFmnAXrZ8QtzTLKwEChnT7kism9M3BeFW0cg5Jot/oan/7piI+oOOfbeB2RToxwTZjQPYB6pQqSt2JFLJBs2wFpaZoZaxPLOQxHvtlJDnIaAJ7m5/+/iwPUZjNhHDhgn3o7SXSAJ/YfOiST9EngWty17KvuV/bavUhjoJ0GQSarAhxdUmPaouNeCNaa98bZkdKrkAbGNG2jlc1ECPEQOQyiHNJ5PQozHckcklyiUo0YodNE6iKMGKMBM8aTJ5LDwalj8+57p3tIatcsDdAFEgdinJEq/+tJra7CtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL5SZ5t1V2LttmnHb65odBicDHWtXodGq4MhIY5Si0g=;
 b=RgpFNISoKImtJZmVNq0LVRaVO9CwtSj1XvHouERMK2RhxFoLmwc1EojbXWRTtwBGE7WRca/bawzc3VLnuaWswhuNX60BeNxZsFQpPpOIKC8ojWGgsBOC1kX47yrmJckOxJTfm1XSJVHSro4WVkP2Sq7izsvPbLldEyKu/YJWoiE=
Date: Tue, 14 Dec 2021 16:06:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YbizA1adGRRIlcTv@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
X-ClientProxiedBy: MR2P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daa93b5b-0dfe-42b0-2889-08d9bf1359b4
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB3580DB562A5543B90B3DECD98F759@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/rs8AC3W/R3HXJzhxMpksyKUuvNk3gQr11RwQGjo88/7lrguHcDNJGml1QJ/9cwJYhFBzl3i+YAdJDV3U9e7rhc712xXNL/jeov/Y/LOFgQlpQPRXAUl3QOOf/8SQqXNewlQ/OQcktZc83OsmhIyvtsESB+351uPmsn9y9k4Q+GVuflyrscBl4NQvPZMu6rqn5hn0X5c+t9B8DK7SHXTYD+7yOJzBzkg3Gd+vBF76bSSKPKekY+cRRGndXfO9rIYgk0RTxeMDb6HFekW/dWlq7lSbJdm28JGi/PpKZ4A0oUs/Xzp+SJp0c9p0xHK0HLdGTzwDnqsztQ8ZEmsugtjdDadDr//JRNmvz5mB0FBqviJyv6itUx53J0xE9sD4BnD3QJtxHnYTla6xAzaaSiOTuHydbwgvjm2JTUyzpcYERESSzq0lLUZzkK9FRKvsGO3TiltFU5dtj4ybWrIpYXOhIRYrUYB7JBMNy7erUebPQ6M4My1rsZFHJcc1QIwOJIdXUK4edAavRORdihMAMrlPWPSwgXhsKtb2p9qkhQuFiKI2Fu+z7QPm05030cL0+/Bgmzvapo1wLnHw7ZDjZTAn6+sW5+dr/T4JWRRKrI4xBZkpu8G2xy4uV88IY4kEkp3wPgQb0H11E8bc5NfbLRMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(508600001)(66946007)(86362001)(85182001)(8936002)(66556008)(8676002)(54906003)(316002)(2906002)(38100700002)(9686003)(66476007)(26005)(5660300002)(186003)(6506007)(6916009)(6512007)(4744005)(6666004)(4326008)(6486002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDhuLzdNUGhIREY4cDJPeW1kWWkzT0doREgrb2krc0huNDhyNytvRi80MjZj?=
 =?utf-8?B?RStJS2xIbWlGRkgxQjZMN0NLWG5RTDZJOUh3OUF4Qy84WWNaa1phLys5bTFw?=
 =?utf-8?B?SnBxNG5mSWxTUFNYZHpyTzFMZFhBUnkvR0FLTVpQc1BXbkpCQUgydkphOUc3?=
 =?utf-8?B?WDA2bGlvVHRTemNISmpJcEhpWjVwQUh0VVlSZVpuZE91RmNUY1pLMjBtdFM5?=
 =?utf-8?B?VElnSk5SaDJHdW5ndVhZWkJNVS9oRjZpaUxEZjR0aWVmK3EzSHpNUTBiSWho?=
 =?utf-8?B?U3hla0NLdHhocHJsV3kwcUhQcFNpQTFxdCt4ZmRyZmR4ZVBKYUdhQVBqdHh1?=
 =?utf-8?B?bFYxWW9ObEdSWVFoSVYyZkxCRjh5RUhOdU1YRjJvbDJUbEtZdDZBbmxpY3dj?=
 =?utf-8?B?bVU5UWppc1NSMGpzeHRMNm9OcVNDb0RhUXJVVTd5dmRsdjAwZjdBVFJUWERw?=
 =?utf-8?B?Z1VoT0VYWDlOMmFNcGR1bittMHJnV1AxOXJ1cGhCRUhEd1ZJRzE5RDdTN0x2?=
 =?utf-8?B?QnVDeXQxTjhWQlAvRnc2cTA3V05CVlBIQXFXT010SERySDZaaC9FRndhdjZZ?=
 =?utf-8?B?T0dWMzAvSU5tcWN0YlhWcFRXUmF1aTY5eEY1TjJQN2p4UEFlT2R3cG1tVm9Q?=
 =?utf-8?B?cTkrN3AxeldkV0UzcUVOY2NBeXloWGRaZEJ5UDBjK2sraG01OVhId1lIZEpm?=
 =?utf-8?B?VVZMelFUaGtCcHdtMm1lczAya1MyZDhnNmQ1ZlkrMktkVWJTdVlEN0E0bllH?=
 =?utf-8?B?Y2RldXNmei8yQ3pST0JFcnZCdUpzK2t5VCtoU05saUl1UFVvcVIxeXlZdFhZ?=
 =?utf-8?B?Zmh4ZGtQeFltc2krcTFPVVFEWkpkcWxUSlM3ZUpXUithSHBwQ1ZsV0RpWW1S?=
 =?utf-8?B?M2VyelhsUVNpNUo5TUN2b1NEL25pcGVJK3ZtdVVnQnM5REJYaEt5TmpEeGEy?=
 =?utf-8?B?cmxmaml4ejV2TUNZQ214VmlLR0M4ZDdNVzBJV01RbjVmaGFTcm5rTDUrNWNi?=
 =?utf-8?B?MG8xQk8zVk5VbnJBdVd3L0pBeVArWlM3M1FETmoyTkdNc2t3MGNROXlnVHhz?=
 =?utf-8?B?SnFKdEhnVVp0MHlEcmR3Q2RxMDU5ZlhDUWlJQnhnUkJodjJpZ2JhMnQyT2E1?=
 =?utf-8?B?V0xNWmZ2alplSVY5VFNHLzlJODRQY0dRTFA2N29kSkdiM3BnWW5tN2tjbVlj?=
 =?utf-8?B?M0NGdm9pNTVvaGJSVFg5dmtxaU5oN2RxVi9VV3NydGw1SDZDUUc4RUJoMC9S?=
 =?utf-8?B?ODM0dUJHNm1qS3pNelBVeEdDREtsenhvaHg4Z0pValIrMktyL0oxUTRJRmYr?=
 =?utf-8?B?cDEzMnBBUEtTRlNSMGNINzVxZ1Vkc3p0UFZrZ2RSUHVoMVNFdnRFNnl0RUZh?=
 =?utf-8?B?YUNkbjhCQXAvNVRIRTN4S21UTjBBdjdHLzNTQVBlV3B3SkdOSFFWNXIxMGth?=
 =?utf-8?B?TjJsaXAxNXJSNEU0QlZnanZTMytrdS9VbTJtbEhWSTA4OFEwZjFWcDJkcjRH?=
 =?utf-8?B?MW5pNUtwMVhWa0M3VUdCVlJybnI1Y2dLZ1RZai9SNXVVSmxFUDJqWnd3eTMv?=
 =?utf-8?B?Yy9uVDBYRXNEaHAycXZwWTEvWmRpM2pPVFl5bVVQL3UrRy9uVHd1S2NUaWpE?=
 =?utf-8?B?d25wNm1vVXlyQU5xMVlDc0VLMG5DSTBiQVpIS1JURmRiOTBsZkdSNmMrMXBv?=
 =?utf-8?B?aE00RjdLN2QyL0JMaUpZeUFMR1ZQSCtMQ1ZuS21uaUljZSt4Vm90N29JTjdZ?=
 =?utf-8?B?TWhUMmx5bTFrUUtnTUpONTcvSXhpOVBCS09NblRvSklEQ3NtRlY4Y0xVUlFK?=
 =?utf-8?B?dy9wQmt1YWQweFNNZHJCUFZQNzU5U3FUclhPaVN3ZVRYemtZWndFMUhITFlH?=
 =?utf-8?B?QXppbXJJZWh4c3V2OUJ3c3hyNU9taUNrQU1mTG5BYTJNbG02RmsrWHd6SU5a?=
 =?utf-8?B?R2lrdVhMLzBHak52ZHdKYVdvK0tvc0E4SlBubjVlclU1dVIzUXFtQ2ViL01a?=
 =?utf-8?B?UC9oM1NoTFZ4V1RjekwzUGlRbWJwZVZ6SzhDbWJWcFpXOWdadHcwSjJ1Vmsw?=
 =?utf-8?B?eTRYQWtKZzVBOHh4QTV3UmhYWDhNYmxjUitwbEd5T3JTRGkzc2I5eEQ2aWVT?=
 =?utf-8?B?OWxKMjFiK1J3T0dwc21yV0JjbTFLL3pUeHhXVTRVZzVXY1lDMW5NZjN5V0xx?=
 =?utf-8?Q?OFKIFP05Dq91djfOemgKM1k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daa93b5b-0dfe-42b0-2889-08d9bf1359b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:06:48.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE1w5Mt9LpJEwWobizDuDvzrlg+m3/DMUglsmxc2t30YEOIPGSGjzHZnNujrT907JIZV5C2SKnYymSfdpF1vYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

Forgot to comment.

On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -238,7 +238,7 @@ int amd_iommu_alloc_root(struct domain *
>  
>      if ( unlikely(!hd->arch.amd.root_table) )
>      {
> -        hd->arch.amd.root_table = iommu_alloc_pgtable(d);
> +        hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);

So root tables don't get markers setup...


>          if ( !hd->arch.amd.root_table )
>              return -ENOMEM;
>      }
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -297,7 +297,7 @@ static uint64_t addr_to_dma_page_maddr(s
>              goto out;
>  
>          pte_maddr = level;
> -        if ( !(pg = iommu_alloc_pgtable(domain)) )
> +        if ( !(pg = iommu_alloc_pgtable(domain, 0)) )

...likewise here.

Thanks, Roger.

