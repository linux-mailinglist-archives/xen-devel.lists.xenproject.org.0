Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34224ABEA6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266845.460558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Rg-0002h5-Cg; Mon, 07 Feb 2022 12:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266845.460558; Mon, 07 Feb 2022 12:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Rg-0002ec-9a; Mon, 07 Feb 2022 12:48:40 +0000
Received: by outflank-mailman (input) for mailman id 266845;
 Mon, 07 Feb 2022 12:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH3Re-0002eU-R7
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:48:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c18c5b-8814-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:48:37 +0100 (CET)
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
X-Inumbo-ID: 43c18c5b-8814-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644238117;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fzA7pERzn3oX+a6qUMCOOOx7IB5bl2eywGcGy+CJuPU=;
  b=VyHRN9npkPBsBhHlcCffg+Ea0SXx+t4M7U+Ct9pVuGCHwlHTs9U4dWA2
   /JEZTgHL9EhpS87Qg938OnaMuxKqZKXuBjJOWKjbBYHLMFFxT4JdnXJGB
   84SQoXIkh3l11T8gz/o1vLHKiRQ9m+KD4hVXaYjEc98PRXxrVb9FB9lkt
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hAcr5ycEG9K7NYtsP33Jd+uio//h5vNzVPe5nJMshX1QOnKo/4Mi3sZBsISlO73sQTGp8BaW+K
 ryUWwZV8gFkSl0bbirMCb3pFVn+mbm8GGinh7ETT2BZWk18U8hVL34hK58P1mbTn1SpLWpZgEg
 C0Tf4mJM3W+LvKNip1ET5mPAQAClAH3arAyQSvq1XDDP4Qcc+4nHp8bG8+3b1FSmb1McYsZ2oc
 3l6Sact8Ko1n4Y0Jpll8D4N56/7hmaYniW55YsmjH01eqeW0rrM1tgeZ6T7hjorMvq781+xTTj
 2YAOrWfnhAZPaSzHvGMUJysr
X-SBRS: 5.1
X-MesageID: 63550260
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hNMxvK86cfJjY6LE2E6KDrUDUnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 DYWDzqGbquDa2qjetp0Ydu/oU0A7cPVmN43HlE+qig8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPg25
 vQRkqXsTzskJ4DRw9RECghgOgFhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2pt3poQRZ4yY
 eI2RCVIVwTgZiQfJ0xQApVkt8y3rSLWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiDmqn0I7YoZWL+AjxRzW+vON8j6wJndRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q238oif9LNoJu1mSwXuF1e5eKFfUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD7n5lnwv7G8ukpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZfTm04BAbGhPkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVASe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:e7uGEaMmYM2pa8BcT1n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,349,1635220800"; 
   d="scan'208";a="63550260"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn+PlzccHCN8y+ZsNGGUB1RShozU4sqjsz0cZjqScWGbf3bHGJEOfTS4XnbO03fS29OktKJLWAfpAqZA9PShq+lH9G8FfNJBC88VOFqIBnfWawFz2eNALP/65xWFAgzzXw/0WyP9Wqq7DH7QMAk2zA6Rg2vlNI++7+rDJGYPdwB8IJHd86At1SfJn/UrcfXspktfapcmPXG2Sd2QX3v+4CufyiCZjeKVG1VjaIkNWJ7FuDtGxtuK4wBe61+kBJ54RxVJnMUIpep0ktoJx5vD5ZznGe3wNFZNCqvlCSbRULQ4nBz9cUnFpZfxt5mrdodElA2lI7pExnZz8DUt0hhAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zmQxJViorRrssZzWRe1BalHYhj3cXuzLAVaMQND/0s=;
 b=Vdno5hXIo0lqMrp7V56KluTV7hY/+0lsI/BkB3pjGTqXGX9hhioG1rYw7Nr+BfLOTlIaz4A3rQuW4Z0G/mmZk4sg3W81iq2YVL1hgbJ3nTALw/a5nk2CcoCD4+uMACOVQnpr6dyvVTeobLu56+W55TYH+58HDo8CsY+Jq5lBEuvZMTmijGWkSG5ojWScNSgXoM0JA3kODsD2WRuEft82ce8K37PDmunvxIszg6hYoqVQ94uNZr/G5TR2XYp1Gi38K7XTRuXL36gBkb0DrcCCA+bDKv3O7284vfoat49PztdYXv6jpZT+uQzYrU1c22GW7fz/h0MB+3x4P23KYdJCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zmQxJViorRrssZzWRe1BalHYhj3cXuzLAVaMQND/0s=;
 b=E+Khbm7GdWU64QPDINxKS7QTsua+cexx1TwgO48hUbqwfBG8c37kZMs7gIri4GvHk2nEpwycf9ubSpZDjc6ZR7P69k9uZMBUoG/4roDD4yybSmgPyjypjvOAUDnGBqdPD7LLmGnAVc+ZMzQrtcyf4C0w/c1YcEpWYF8NKy9/PpA=
Date: Mon, 7 Feb 2022 13:48:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] dom0/pvh: fix processing softirqs during memory map
 population
Message-ID: <YgEVFeW5SDtvavyK@Air-de-Roger>
References: <20220207112008.51085-1-roger.pau@citrix.com>
 <66b9fd95-bac4-55f7-2f3e-701f8444f37f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66b9fd95-bac4-55f7-2f3e-701f8444f37f@suse.com>
X-ClientProxiedBy: LO4P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec999278-cbde-4f83-8ece-08d9ea3821f4
X-MS-TrafficTypeDiagnostic: BYAPR03MB4037:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB40374E83D3A687F551A0A4C48F2C9@BYAPR03MB4037.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8CHPMIPo3TbbZLm0u33jRzgnRX9viYjIeEUtOjo7O5es9QmDgi5BScisQrppS+O6iEHGAWxdzC4Et2iXbplKgiJTVgTUQlVL9eB84bun1gDlWoh3l9HBbarz7cDls+VngScP8Sy9wEoC0oO2HSGmAhUGG8Z2XN5w82Ha26qFKG8uT6By8nNw8QmJ5NAw9MLhlk5lU5AW8e+pac5e4pszAOIffjePeiH9XF1zSUw5ITsJuPsBoA7rcnLFlSM5Rpkh6zed8lOlFlBHJrfoduGy/+FrnWLvWdj+W5CYGwhSj9LADojgomBH+ZrLQYAclAMfYFqa07Ltbgo597txLkniMid/pmU1pJz9rASkrbqPrKgm8bhLlyLAiX6zGbVlN9dEyVy2agvXBWFoEu7WDqKnvqypSmEnUawugmKw0upS71C7+Qz8D+UPOOMOWXoTvsLfonhXx6jlYZa6XSh+JBuYl/0NiMB38qPXuK0EdeAwQCFCVWqFMKoAF7x7rloyVvWv0FK4nzd72Vph+crz0OrGbpdhbP5HCOThUQopCyWBwdEbacafWoaHq/6vKolwZPGjPAJ3M4TWq2gOdaAQ3g1RwVAB3S5s67upeoFAn9yxkd65z7s6fB7Llotq3/hHjg/Vma2gTkMwjuCwJhTZZtPaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(9686003)(508600001)(186003)(26005)(85182001)(6512007)(6916009)(316002)(6486002)(2906002)(5660300002)(4744005)(33716001)(38100700002)(53546011)(54906003)(8936002)(66946007)(8676002)(66476007)(86362001)(66556008)(6666004)(82960400001)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FqRE1YdENoaFNMZGhoTUhwNEw1d1o3MlFUeGV2cHIwdTM2cWFheUdMeEg2?=
 =?utf-8?B?SnBpK1JxajVRdUltR1U0a0tQa0F2MDlWclFIK1BuN3dnbDdiVmF1TmVBK2ww?=
 =?utf-8?B?U3VOd1J4cFU5Y0x6YmtkckxsNE9oLy9YK0dFTWg1L0ZFOWcxUk5SZU02VnMv?=
 =?utf-8?B?R1E1WStuQkVieUI0M0RXUHpUS3k1MTVUT2h2MzJZcS91eGg5OXJCWU5IWWRn?=
 =?utf-8?B?QzNHTWVnaUJraDFMZHM4d2QyeFA1REtmN21yS1c0cVdvN3E4WUM0akZkMFhZ?=
 =?utf-8?B?UnljRW84WVh1RkJBcHp0dGRTTzNJU2tKOVpvSXRvazFJaHQ3djlaU2xzcnJG?=
 =?utf-8?B?UVMyeEJJaDMyeGJUNjVOZDVYdEcwbzRHU3l3NTNqbXRIeXdvTXpjdUFPb01T?=
 =?utf-8?B?b2xXWUFSNHlQdmdNWU5CMG5QZ1FZdW93WEJVS2MxQnMzeUh4SWR1OGFwY3NL?=
 =?utf-8?B?NndIQmI3emNIaDY0T0hEZmVvRnRyRUJESWM5VmtENElEWlVSKzFTSEhKeDRY?=
 =?utf-8?B?bTJva05Ka3Q1RVZzWWhnMnpYQWlTcHRsd3lHdkdoSFhNK1ByMGErYzZ3bys1?=
 =?utf-8?B?RE5PVndnNmx2TjQxekw4aWgvcnlFMEZDTnVrcHgwMGhJZGJNRWc4bkN0Ri9K?=
 =?utf-8?B?MmVBbXNNYUs2TTRqeEt3c0tpWC9NTnI0S1d1MkVKNWRaeWh1Q2FwRnhZTGZP?=
 =?utf-8?B?R0dhTVI2cDNmZkJNNmp3V2k4T3p2ejlNQjZGTmlBWkVxUUZnbWNqTnZUc0NC?=
 =?utf-8?B?eVJnWHV2TGxxTDhubW9TNTBkUldNMFJ4TEU4QmFjTVZQZkdMci9wL0NLRFF0?=
 =?utf-8?B?eURZcXFwOWNkamxXcnFlbEdieXQ1THRqMkhISGhGMFJiTDlveDFPYVFRaG53?=
 =?utf-8?B?WEdua1JHcFN0azVqZ3ZteU1JSTl0Z2xVd1k5Ykdqcnh5SEhOa2VpaUtTRkFx?=
 =?utf-8?B?S1hIdVVBYmFnMzFUU3B2UEJIQUh2MlV2ZFNkcmJ4dUVoSDZhUmNTY1NGZWZ1?=
 =?utf-8?B?NnpJZmR0R01oWkpLbTdIUnYyR1dQTXd1M1ZVQW1uUEUxUmlINFNiQStLdVo5?=
 =?utf-8?B?eERaTkZ1ZFAyOTBkS1FSaUtEZGN4UHZnM2l0Rm9JUHpGbVRMcTRpdUNmSTA4?=
 =?utf-8?B?U1pRcHJ0T05TLy9VMVVOK1ZpaTAxQW01bGViQUcva2pSbDN0L0JSWUVuRktJ?=
 =?utf-8?B?cWVrb0FCdTA1OHEvbzV5b3lJdHBvc3dINjUwTTNSdThLbmZNU0UvQStWZ3M5?=
 =?utf-8?B?OS9Id1VIY3hxSGQrZnNMa3h6dDk1MVhIVWVrM0dhRW5JOCtzRVpNd21sSWc2?=
 =?utf-8?B?VWp0MVcrU2U2YWlVeVhFcUdmMWg0TmJVWG5Oc3lrUnUvdVo4bzZHYXhDWEVC?=
 =?utf-8?B?VjEzTXhTWnlHeHJnUklBYkxmdGljWVFwaTNkamJJQ0c0M3NyWSt2M3FiV1VS?=
 =?utf-8?B?dlhoSXhkZmxESXMyNzZ2R1VtcnhkUWFLZVhGcWFyaFBkQU1nVHNnbERBbmRw?=
 =?utf-8?B?SDlZbnFZenZXOVpSc1Q2S2xHOE1KblpKZVF3c2lMekE2M01TSi9HS01HTFlW?=
 =?utf-8?B?L1dRRENsa1BweXJTdjlBcmlTemNzL3N1RzMyNGlYU1h5ODdTeFV3NEF1RERR?=
 =?utf-8?B?d0hSdDB4bDYvWUZ3UWlLVnNtdk9VSER6OGVsTHRXOXZJVU93ZUdnZm13Yktl?=
 =?utf-8?B?Vm9mZENNSURtanZQc2FUWldZS2xUTFVVMjBwQWo1L3RDTGMwdVN5Vzc2R20x?=
 =?utf-8?B?RlB3b25DYnI4WFUvaTF3dGtsRTRRblVtaHp2aFhITUlPTWJpcy9rdExYT0kv?=
 =?utf-8?B?bFJhY25MckJ2TUhRV1BVMFYxQUVnbnE5cHJOVUp3c2JvSFkyTHRqZnRhemZ2?=
 =?utf-8?B?dTNHQlFzekpkOVdSRnYyenE3cDdwNndzcXpvQnRaci9Ia2x6b2Fub09ocjUz?=
 =?utf-8?B?N0pVd29HRklrcXFFQjN0cDhiaXFOVVZCUTB0NllEOGc1WVNxdG80YngxbGdo?=
 =?utf-8?B?UXdvQWZDWjBrbWE3ZHRJdkZmbHhsMWZ5Uk02T3hkQmlMWUYzWVVEL1NwMGNT?=
 =?utf-8?B?ODNidzlidDArc2R5ZkRiSitYbE85Sm9EdU95RUZnczlTVDY1M1Q1U3hKUUdp?=
 =?utf-8?B?NEFxb1IwRU1RLzBlZVF4VzhmcWltcDZZaTd1c014S1lBMkk1bEFxUnMrTGYy?=
 =?utf-8?Q?qK3Hzj/pEpQRrqryd1wcMOQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec999278-cbde-4f83-8ece-08d9ea3821f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:48:25.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrbJkzAN3I0v7LSPfMHkCGgWN2aVOvOxP6JJoquHqAd0FoiXGyg+v/pSvAnmOS2VsPH57eDgpfURCUpKpbUSNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4037
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 01:41:38PM +0100, Jan Beulich wrote:
> On 07.02.2022 12:20, Roger Pau Monne wrote:
> > Make sure softirqs are processed after every successful call to
> > guest_physmap_add_page. Even if only a single page is to be added,
> > it's unknown whether the p2m or the IOMMU will require splitting the
> > provided page into smaller ones, and thus in case of having to break
> > a 1G page into 4K entries the amount of time taken by a single of
> > those additions will be non-trivial. Stay on the safe side an check
> > for pending softirqs on ever successful loop iteration.
> > 
> > Fixes: 5427134eae ('x86: populate PVHv2 Dom0 physical memory map')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Nit: I guess it's "and" and "every" in the last sentence. I'd be
> happy to adjust while committing.

Yes please, if you are happy to adjust on commit.

Thanks, Roger.

