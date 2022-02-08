Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A64AD41B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 09:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267714.461459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMHE-0002zk-2w; Tue, 08 Feb 2022 08:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267714.461459; Tue, 08 Feb 2022 08:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMHD-0002xv-Vn; Tue, 08 Feb 2022 08:55:07 +0000
Received: by outflank-mailman (input) for mailman id 267714;
 Tue, 08 Feb 2022 08:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHMHC-0002xd-QX
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 08:55:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8b85d6-88bc-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 09:55:04 +0100 (CET)
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
X-Inumbo-ID: cd8b85d6-88bc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644310505;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ARQgLwdn/KlxqWU+cRg8JmGsc3Wr7wIRnIw2KurRzaw=;
  b=Ee7Q696WpPXL4o57oehWmWuVs5dyNvNaI+038CmLNDfXkHF1u89AL2FM
   /1ZxRiR+TBbDAfM+cC3z01x50Jwp6pvLKbEqtxk6DqAxHaWzQP8Oi9XGR
   BgwYIJFPa25FMbAhizCqKz2Lk/GD1q+79g/VCaFLQGsMZWyMRsql+G5cF
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pBnk+nGveZ+fYnxo+mOWkB19EVT5VAdKI09Yg2ZWLy97RzBvZSMVBUqSHWQhIuH8Ftrkdr8ah1
 KC0wlACv0uNg19hsZRVKau4eqSySgmNKMgBKPwn/RWGXuZl7V8NNVxjCuppEitqoQ0JBoJDdBM
 q4ZoOfnRNjnLOR+CcJMC/9dY6JsJZTZdLZu4QXx2cGIdgutqnYbIoT+clhTwHo7kXh84UO3TNL
 i8WlntfcApcTkn8edxjPF/lLyL0phPieDj/DhTuH9t1MzlEgLI8OWzGID1E53UpWV2UJIAmpaA
 hgSlTnFzoOS/YEuHTJUrOPbY
X-SBRS: 5.1
X-MesageID: 63713781
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1MkFYK9tqgescJbtxXMwDrUDUnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zYYWmyFOa2Ia2H3co8lb9iw8BhUu5KGn9ZnTVZpri08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhP5
 /p1mqfsFDwWFfP1g+QZCyJhHXBhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2hp3Z8eRJ4yY
 eIFcRNMTjneZScQHXY6V54shO6NiiPGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiECrkSYzYIYNKNIRtjiWyq6M2D+XV3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q238oif9LNoJu1mSwXuF1e5eKFfUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD7n5lnwv7G8ukpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZPVkk4CC72nOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVAye0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:qHEn964HqJAQrqbWpwPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63713781"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH80tHKyRAGIl4iF8m+L3QkMUuEqVi/T0HxzghvsgeU8eUE+E3HaOKk+jr2Xr83NY/6G3t9aP98WgpS40TtjElxNW7Li7J4ourpUAVSTDl8ZD3Q3PEd5MmAlv/CQpnjaqIJWpHTGl82zor94YX6om2nBlmlPg6ugXRgYykWjQvsOrFrqVrF9/Zuag9Fo/Zi8RU6Zhw9RgwT9VI95n7gtPa+BaUQUqlWhXYq/ynbapiU9CnNPRojwedyo25btxX6a23fGOLmLeWz/QVn1jczwGIMnSxuNWqhNMZPo5Wt/S5BvnK/Uq1egwnTyt8US3hhtyLKy3Utzlprzn1IDRXI58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBjmfAf+XbdFvDrsmvH8uWVTnWzbPdjLuuvvrFFZOEM=;
 b=c5Yl+Um1qJPQ81NstBMgILhOdnigqACOeFMOdvrAjOSVzDYdIEQHqvzapyD6/xftulwS5dQFHclpiosHl2a4L0jqqF0BoEi6qsUtTZDMIeZQYWkooJkrerfQ3lnYYuyW7/UahNwsSRcbsyH/eqwEXz1fn3HCBtSl4BSBgWFU857BPItR1ai1jZ0643MeD01o472iCKNQSK4gfQQtMAcKTz+bajos6ttK1WFcsAs/cjsC78tma0+CuYM4g+8+eJ2ZVIm5KClf5Fk/WEmxQ+6/EMZ4PI8SBcnBFb/H8q6BzAXzVbOCB4JTmvitQSxNEErloJ92HAC+95uwZPNAfgPIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBjmfAf+XbdFvDrsmvH8uWVTnWzbPdjLuuvvrFFZOEM=;
 b=QUBdRpA86xKIaNY3PFaUHc0WCPix659W7985lWdxWuw2AdIm+sVoAlF100WFx73BKcHZkNp6KJLk4o7p5u9HokqQk1y/e0giAvcreZfIe4BCYLD91d5IWZ8mRPAxVZ5AgQsc8mbZOH4wA3qURoHZneeP/QeHB7cup7OhYexvX3c=
Date: Tue, 8 Feb 2022 09:54:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Message-ID: <YgIv3O8ojoDK+wiR@Air-de-Roger>
References: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
X-ClientProxiedBy: MR2P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a5041d-310f-4f74-6596-08d9eae0af4b
X-MS-TrafficTypeDiagnostic: SN6PR03MB4544:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4544B721410728FDDFA5F05E8F2D9@SN6PR03MB4544.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kklfVXjs+OwJKebcC+/eqYm8uJzsOGWmF6vNl3sRo0BNbb3OCtqYxZvShHocIJwLLrb1eFrm3lrBpO+EmfwRgR/nSzmu5/2xx4a7yAzZEZzlNuvreUoMott+AV4flyNP+G91Vu1mHr1QJYNnRVSxU8/0QsUfxgCYrR0W9VQ3bigq+TqAkHahkuNMyHgDv3py7B7sAekfD83rxGnnxls7KW3170SBBVfg/+56+4E/TMuOpX03dKaB2GX6ynRbPb9SUq6Aoruj8hjFSMhiJDn2AWvc9tsJJTcjXaVCiLEP6DXcMszgFHEkzEmXE+XxUM9/rOo3yKf+m0ErRMpDU4/zsnVsTOlvqcSlXIxY3bw7JDEfFhBPrD1hl5oznyaltq25WAvOr72El96xhdjldLXV0eBFbk+TbabXxSUazOaC96sSowY3qlmLi73fN9M/JJ6EMD/P0olBteLfEEQOgoeurPb61bm9ecuOiM9HqLKO6CWOoSdWKCgGafIDXArK4lZPE5XxqK3KfqQiQ04/3Sth8MFdo09W4ipzVaWY+d7kJy7SkLWx7fP5+kAavOzqeWbbYsztlwD7ldrtaI5x3+22DrA63EY1WonxBdvPwAx9TYcUD5mDsqr72uJENAmwZ2shvaDUug+xIBGE5sAPHcz9G8Q6Vq9J9R1db8J09cBGTjrSj9saYodh6hLdPc3omT6J33d9jVrCTi4JovCl5PdSZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(6916009)(316002)(54906003)(26005)(33716001)(186003)(66946007)(86362001)(6506007)(9686003)(6512007)(85182001)(2906002)(6666004)(4326008)(6486002)(38100700002)(8676002)(82960400001)(8936002)(66556008)(66476007)(508600001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWhvdEZkR1BEWWVvZTZtUUZVRm9iR2FDZjBiT2lzMFlFYTJvTlJnWlcwTTJF?=
 =?utf-8?B?ajFseHFuNUl2ZFI4M2hxNWkxMlhrakg1QmQ0Z2ZnMU5saGlRdHNiamhtZXR2?=
 =?utf-8?B?Q1k5NTh2cFUxd3JXRG9YQXB1M2NzMVZzVXpwYjNVb2JuYzFIZXBVa0FzYTA5?=
 =?utf-8?B?ZEEzSnB5WlBrT1VycDVGYWlKVFRpZllrT0xBNmU2UXBVL2JIZ0t5b1hycWRV?=
 =?utf-8?B?Vkl0MzlnSWsvQXJXYloxd2Y4K1R3NzM3VWszN3dLbUF1ZThqaTBQVXZOYTVQ?=
 =?utf-8?B?Zkd3emQ1NDdybWFJVzA0N1pLd043WnVNR012QURTNVl2dFJvR0pSZGh1b2ND?=
 =?utf-8?B?WE42VU1YL3hUNVZuQkpQUG40NDZKOSs5dTVwOFN6ZWd2eGlPckFWQ2NMcWFV?=
 =?utf-8?B?TTkwMWRVWUo5dWlQcVZTMFJ1bU1kczFrbXhCL2crQk1VWVpyWG5LTmswUEdy?=
 =?utf-8?B?bUcwV2J3c1lJY01pTUlJWUEzMWJPckkrNkNodTRnUnBobEdwMlF4dXpSZkxj?=
 =?utf-8?B?cS92MjdqQkdHTWpoaTcxM2pubVpXeW04V1luQ2JZdGlodFlURzhvdEdnRVFu?=
 =?utf-8?B?ZmVHT0RaNVovR3dWRGs5YTZsbko3dnJUbFllUkFITXFKanNsdEM4cVpITW02?=
 =?utf-8?B?SCtVRzRPbHl1SWdNRkRMMXJqaXM5eEFaaGNVZVEyM1ZjenpjVmlHQTQxb3Iv?=
 =?utf-8?B?ZVFPbCtlZmFuNmhvZlBaRDdnT2JkQjNxVU9mQ3RjbzRjMkRNSUtUK3E4ZTZw?=
 =?utf-8?B?U3Zac1F1SmExMHpMSEJhU1lvcW5lOFhCZGt0bGhWZGlvTDVBVGtKdGZNaEpK?=
 =?utf-8?B?Nzk2OHNhUGp1WjdxK2szQXNGWjJqSUZRNHhTc1JEZmZKUVlCMUlSeDduU0VB?=
 =?utf-8?B?NGxFSVp5RTQ1bFdsdnkySGFMOUViTHBYb1BGaGZyb3lKb1hvOURsaG5lNFdp?=
 =?utf-8?B?a1hjdHU3ZDloK3pPdVBsVW56SXQrOHZDMTB1RHVJQWhQZUFHK1hLaE5RdE1t?=
 =?utf-8?B?ODIvbmRleUVYY05QYTFUam1ZaDRwWm9GenRKZklOZFNxMTJlb1Q2ZWh0S1Fo?=
 =?utf-8?B?Y2hKRWdrRGNuOGdBK01FKy9IVXora2poTlZVeUwvdkpYTkkzZGd0S0ljcENX?=
 =?utf-8?B?UWJnRlp4NkRveWFyMnVScDJzZUJCcjFjUENtYURZSEFpVXF5UmhLNEZ3bW8v?=
 =?utf-8?B?cG5hK1pPY2JWNzhEdFE5NmxXYUFKcHFwOWFMQ1BHWE1aWjNMQ1lDWm4ra2Zt?=
 =?utf-8?B?cW03eTBya2kzY1o2Sk5ldmx5Tlp1bFl2bWFnRllmSmFnWnpQRFdpbFZua2xt?=
 =?utf-8?B?TzBoaWgwaGpyWEVxRHRrd2prQlhiampVWnhTSkJRM3dZUlBveHpNZTl3QXdQ?=
 =?utf-8?B?bXZpcUp3eGozalYvV0Z3dHlqOGpCWko4L2g1KzlpRUZlOUR4Y3RlamNuKzRW?=
 =?utf-8?B?cTF6eWVCQkY4bzBuZXVabGp3djh3QlcwYUdTb0R3WEZCMGdZb01jZE5FeW1T?=
 =?utf-8?B?NkM1d3JVSUFGVG8xai96OTlOOStVUzVycTNNTDVRNmU4U1BvWVpoOGpHdFNV?=
 =?utf-8?B?bm8rbXZsaWNIQll1Sm16U1dMaTJrVXNkZjAreXJQQ3d5TXpHVVhveVEwZS83?=
 =?utf-8?B?SFJ0cTNBOTVVdkZwR2treDZML2pNK3MraFZHYnp2UWphTis2UVN0V3RKQWNH?=
 =?utf-8?B?TG1aaEYxNFNIc3NKcEw5QjdnK2xDd3hVbmZyaUl4cENON0JlbGNMV0REQU1q?=
 =?utf-8?B?c0FmVzZwakJMdlFITitoZ3BQTEtMYmNJTGoxWTgrTS85WXowano3V0pHRjRy?=
 =?utf-8?B?WnlaTldydVNRdTkzOThVS1RrTkluU1ZIeS9mbTFMYW5ENG04dE8vTG4vV2lx?=
 =?utf-8?B?cTR4ajN2T1pFZmpDT2x4UFZodTNRYTBSdC9CZVNqTUdwUTRvbFBrTlhqQThV?=
 =?utf-8?B?UkpxMXlzMkJPZmd2V01rRWFWOEJKc2RraFhFWDdoUGh4Rm4vRzZSaWRaZWVY?=
 =?utf-8?B?VjlWSkxEdm96eDdjWkluNFFKVE5DdXVuYm90emErZGQ1aUd0Z1hMV3piMlZl?=
 =?utf-8?B?L0c1Zk1USzdaZEkzQUpBcGZweFFZNVg0Q01jV3BNUTFoeHRGMEZzemEzUS9F?=
 =?utf-8?B?aVNod2F6VmUzV29oaTRkUmZwbnpHRm1rSGxMMmoxUFFGTEhSdnVtL0NmUE5O?=
 =?utf-8?Q?KVCHU5eQwCGpXgTjjjLl0+o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a5041d-310f-4f74-6596-08d9eae0af4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:54:58.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ikYjgXKNyszsVtrna3Lai7+fb69iuALAu3bpmPUdExXIP+tqqlObxHCcT2nBkK+9NiFAbDSidsBmNdB5P7ZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4544
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 02:56:43PM +0100, Jan Beulich wrote:
> Models 0F and 17 don't have PLATFORM_INFO documented. While it exists on
> at least model 0F, the information there doesn't match the scheme used
> on newer models (I'm observing a range of 700 ... 600 MHz reported on a
> Xeon E5345).

Maybe it would be best to limit ourselves to the models that have the
MSR documented in the SDM?

> 
> Sadly the Enhanced Intel Core instance of the table entry is not self-
> consistent: The numeric description of the low 3 bits doesn't match the
> subsequent more textual description in some of the cases; I'm using the
> former here.
> 
> Include the older Core model 0E as well as the two other Core2 models,
> none of which have respective MSR tables in the SDM.
> 
> Fixes: f6b6517cd5db ("x86: retrieve and log CPU frequency information")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While the SDM table for the two models lists FSB_FREQ, I'm afraid its
> information is of little use here: If anything it could serve as a
> reference for the frequency determined by calibrate_APIC_clock().
> ---
> RFC: I may want to rebase over Roger's addition of intel-family.h, but
>      first of all I wanted to see whether going this route is deemed
>      acceptable at all.
> 
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -435,6 +435,26 @@ static void intel_log_freq(const struct
>          if ( c->x86 == 6 )
>              switch ( c->x86_model )
>              {
> +                static const unsigned short core_factors[] =
> +                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
> +
> +            case 0x0e: /* Core */
> +            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
> +                /*
> +                 * PLATFORM_INFO, while not documented for these, appears to
> +                 * exist in at least some cases, but what it holds doesn't
> +                 * match the scheme used by newer CPUs.  At a guess, the min
> +                 * and max fields look to be reversed, while the scaling
> +                 * factor is encoded in FSB_FREQ.
> +                 */
> +                if ( min_ratio > max_ratio )
> +                    SWAP(min_ratio, max_ratio);
> +                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
> +                     (msrval &= 7) >= ARRAY_SIZE(core_factors) )
> +                    return;
> +                factor = core_factors[msrval];
> +                break;
> +
>              case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
>              case 0x25: case 0x2c: case 0x2f: /* Westmere */
>                  factor = 13333;

Seeing that the MSR is present on non documented models and has
unknown behavior we might want to further sanity check that min < max
before printing anything?

Thanks, Roger.

