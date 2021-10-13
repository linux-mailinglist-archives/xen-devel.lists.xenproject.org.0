Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C042BAC5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 10:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208097.364129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZth-0003lz-4Z; Wed, 13 Oct 2021 08:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208097.364129; Wed, 13 Oct 2021 08:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZth-0003kC-1G; Wed, 13 Oct 2021 08:46:01 +0000
Received: by outflank-mailman (input) for mailman id 208097;
 Wed, 13 Oct 2021 08:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1maZtf-0003k6-UD
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 08:45:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbf7c2e2-2c01-11ec-8166-12813bfff9fa;
 Wed, 13 Oct 2021 08:45:58 +0000 (UTC)
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
X-Inumbo-ID: fbf7c2e2-2c01-11ec-8166-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634114758;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dfM0d+SNGqxSr3+c7gcrj/6BZNYcfAzXzRyROroyBNg=;
  b=EBGcWrOvMrnLDWfaQEGF0KYfYXCS18pCbkh8ruUWc/4fSqeOkIA8C4vB
   U0IamnKEtbry/DxsojnIelyNQYHlWUk9dznHp0NLGW0b5vxIkxCXkSz4z
   1g25othT+7mwwCexfNe08mzsqE3+ZKaiu3TrZ2f1UUNS/3a2HFnkPEpNu
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ja8r+H3BacIvJs3drW2WRb75Q5DeosQ/HLLiH84WbzOFi954djHRD7aRjGTEKrGvYvkt2mhZMs
 E46ARktmcSrlkH+K+3RXgz0x0Oldt84PBWhtVsNgHAmG9/RJ/nfWhWX9deqqEHk62e/FOcfsCM
 fxViE9jmWi3168Ucq9n9LA1/WwyIk+snS2r+owPQHYW17h/vYEGJD6ROnq3cXOice4xiZVuT7X
 RqznJVxPN7cnvodHV1PmYS3IGQvIosu1nVKPgVIPrbiz7roDlSSpWq6U46fzkrURWYcGy+IfIs
 xTuYlWw5vO3Ne3Llov09eClN
X-SBRS: 5.1
X-MesageID: 55466789
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:adMU/a0vXw9UKXYeqfbD5d13kn2cJEfYwER7XKvMYLTBsI5bpzwEy
 mIbXjrQOveONzDwctl+bNuz9hgC7cXWmNY1TVFupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wrVh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhk4xwk
 IpBsaCKdCgEMoH+w8kwQ0kEOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIEgmlv1pEm8fD2a
 OtaRRxyayT7bjJSKG8JS80FgNm6iSyqG9FfgA3M/vdmi4TJ9yRwz7rFINfTYsaNR8heggCfv
 G2u11r+BhYWJdmO0w2v+3inhvLMtS7jUYdUH7q9ntZoilCOwm0YCDUNSEC25/K+jyaWQ9tCL
 2QE9yxoqrI9nGS0SvHtUhv+p2SL1jYeRt5RHusS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+OpDOvPW4OLGkNZQcNVw5D6N7myKk5gwjTVN9lHOiwh8fsBDDr6
 zmQqW41gLB7pdUQy6yx8FTDgjStjpvEVAg44kPQRG3Nxip/aJSoIbSy+0nE5OxJBI+DSx+Ku
 31spiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqVIzHsF++zCRwUOMUIx80mpTCVc5bu9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquLNoQWM/CdYCfCpXs0PRfBgAgBhWB1yflnU
 ap3Z/pAGprz5U5P9zGxW/sGmYEiwiQz1As/rriqkkz5j9JyiJOTIIrp0WdijMhlsstoQy2Pq
 r6z0vdmLT0ED4UShQGNoOYuwagidyRTOHwPg5U/mhS/CgRnAno9LPTa3KksfYdo94wMyLyUp
 i/hABcClAGj7ZEiFelsQis8AF8IdcwuxU/XwAR2ZQr4s5TdSdfHAFgjm2sfIuB8qb0LIQ9cR
 PgZYcSQasmjuRyckwnxmaLV9dQ4HDzy3FrmF3P8PFAXIs4xLySUq4SMVla+q0Ez4t+f6JJWT
 0uIjViAH/Luhm1KUa7rVR5Y5wrp5yZCw7guAxKgzxs6UByEzbWG4hfZ15cfC8oNNQ/C1n2d0
 QOXCg0fvu7Dv8k+99yhuExOh9zB/zJWEhUIEm/Fw6yxMCWGrGOvzZUZCLSDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mOjKlGmjTb4fkvDl/94St7oOiOXUlIZkHegy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvx+5J8AAYLthg468X14YMTRWn3s/ZWCS9RQKU12c
 DWas7XP2uZHzU3YfnttSXWUhbhBhY4DsQxhxUMZIwjbgcLMg/I60UED8TkzSQgJnBxL3/gqZ
 zpuPkxxY66P4y1plI5IWGX1Q1NNAxiQ+0rQzVoVlTKGExn0BzKVdGBta/yQ+E058n5HemkJ9
 b6V/2/pTDL2cZyjxSA1Q0Nk96TuQNEZGtcuQyx78xBpx6UHXAc=
IronPort-HdrOrdr: A9a23:1bfc+qEuxJ803n8spLqFe5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLX2OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mKryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idkrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amKazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCd2B9vSyLeU5nlhBgq/DT1NU5DWStuA3Jy+/B96gIm3kyQlCAjtYoidnRpzuN0d3AL3Z
 WcDkzE/Is+OfP+VpgNcdvpd/HHQ1AlcSi8Ql56Hm6XYJ3vG0i94aIfs49Fqd1DRvQzve0Pcd
 L6IQtliVI=
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55466789"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMxc7zXInWWlD0Vz0tTh8SYl8pQhqiE5girif0XsqUSR+33k2MM5xOCoVWCw83WYuTyPov5+dAvxPnfTYAlwJMuRPPpQqi0AusQqO2q1Z2uZsrt4NbsaFwgQO8G9tQH+SEpao3AACUECtFFfAW5KT8zJNzzWqfpdO6I05OBHBUnB/fJLWe3kXnycXMK6O56GSrNiz+7lyRROVeEwX1Xd0/IF5AHYLlL/BqwjDp1vhFdYLLJ7JfK7KXIJMJzzDlcTZ37p+SvRxL6S246tSFTMWrQMCtaK7sRnUIn6z+ywM9DZQk7j+zN9ID/nXTIbBwnpl1ZZUMWsZRSKu9JSqdi8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUMhzYqbOOMsmZJ3Q4tne0O0Ea6RvZswLzLM+SzuoBU=;
 b=hxFLXNXg612NRGSc7ufsQO8OStvETCmjJAuSgl70oNMchiNIrYErcHauLk6xoReNqG9PhaOqdDHMnRBOxBbryFxgxTUdmMbAn1ocD0tGS8XRgcxyIiekQoYzyk1t+vXTdZ43qo8IFVuw1DYG8j+tFHa2wf6YYLuxrONJ7hGi4QyfboUSPMLw9C3RekInAvj481mPZE/A5INC8WA8d7y79SUjLOmK4CtI8QvfXl7DBKgEQ2vF5R8RiNMgn3BC+uBdFfS+c1OS5J+9gJSihDqHyv1EAflFmg5vwzCXTY/CndxmcnF1uqCLgyysGVWpNv5EcqL76YKyIHgTy1Ad+zKFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUMhzYqbOOMsmZJ3Q4tne0O0Ea6RvZswLzLM+SzuoBU=;
 b=Hk2gm+RFypXDv6xgAVbV4NcpdGgkND+o/JX+jSg3FcqONYoJwWqdEqeCO3uACi2mg5QUo+fGzUXRTceqQqsXkR1qeWfuknaikamW7t4n3wi3cDS0Uigkp8KCWon7iSRn2Sl2TAKvi25hJpChlUJyq2hc5EnQvK1N0UjkTd6qBRQ=
Date: Wed, 13 Oct 2021 10:45:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f8c7d6a-d554-43be-fd68-08d98e25cf6b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5082292934AA678A2AF0F5A78FB79@DM6PR03MB5082.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRn9qbuW7xQW4Y8/I1qrogHqYOKu/h9Ox5ABQ7qte8znkspo/lMhv3lkcE+k8t6IYBEKNFOLHpv/CP+4IczroHnQVzzg4UNSrGefH/PoDinYfx7WsbWL8zXtErJx8nivWRsVeig/RD1aM1oMU7Nl9mnVTxh3+RH4sdCgl77bUK3+dfP09ouXIzqy1FmB5b0OzBbQAYWarfYuTxXVQkcHrXJwD6Ew7mTxqxmHOBoaDA77iqPJWR3StBSkKtp+JqV0/Onic5GTBHfjlfURlwvzfWcp9Nx/BZlBSKPH1FNu7D+auv7EzK+THxEjpO/MrRLCEQZ49vKd8MP8w1MdP4xRhmpVuGdC6L61Ji/1yg/I69ce56ykQX1Tj5fnUlJV+SB58ahi+HPGpKafKN647+IoNNM6bJ1CE1XCRgGExHCK8QUzqAsd0mufK0w7x7IHDSQzXTrpuvr9T93krpRi4hDtYFujAXYm1o04q1aQeEKtolIZpcMpRKzQaffLeEZ3NRymSwRArsQuyAV/jhDTmFJKk63PUVWJUCXU1Psv1Wm1E+cL0Q6hpd03kL5IKNzLuicxbt/iH+AVVyvBRzM7jmLRPv9mue5VIwZ0cf4cJXSrCotYJxPPYYYjI3CckCnWEbpMA0R/5+vgr5eNUJADJBUse/u1VpWZy/C9G1caZefoQ2rHFyDvG0GroZG8ZxevM+q9gW1OidZVqBB705c6MURIHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(956004)(6916009)(85182001)(8936002)(2906002)(6496006)(66946007)(8676002)(4326008)(82960400001)(66556008)(86362001)(66476007)(38100700002)(6486002)(7416002)(54906003)(83380400001)(316002)(186003)(6666004)(26005)(9686003)(508600001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJFbVRCY1FVSm1XSndodWF3aytzYjhaa1VJL3hPQmVZQVlBMHJLMjRON3M3?=
 =?utf-8?B?WkR5VlVTSHNZSU5jNEVwUno5RnY0TW1RbTZJczcxdnQvRlhsZjVDVWxVcHlD?=
 =?utf-8?B?TlBBK2RGNWZYZW9Ydyt3ZTJmaHdRbS9IUzhWOFNkbVR4RE9EdWF6QjVQamVD?=
 =?utf-8?B?dnVzcnpXQmhYU3ZjdENBek5oYkpyZUtuSTY5dUxKM1AvVHlQQnNrbHdoU2xi?=
 =?utf-8?B?aGZqcTUxc2IyY0JPVmx4Vzc4c0RxMkNQaklvRXkrd0tTT3lDREordGtkeUNN?=
 =?utf-8?B?OEdpc1ptbjVqZkNsTENOTi9KQkhHTC9ib2VpWVlDeURpVW9MdTArclRVYUFr?=
 =?utf-8?B?RGtacXZGT1JMQStsRGJ5cDBkMGlIVnB6ZXE4Z05UWkhuUjVtOUhEbmZmdUlF?=
 =?utf-8?B?MTNFVEI0VTgrZ3VadCtHcm9Xa0hMT2Q2V0l1RnhmSW8rNmNlbWsrMUNwZGRK?=
 =?utf-8?B?REhvMy94MG9RRDZLMjJWUmcrWHg3OGhJTEM2aFFrYk16ZUhmRFRYdFlXTzlB?=
 =?utf-8?B?SkJzcDBoblVYYUtrTXRJaXlsRUt0eHJIL2tjRmdUUDRWTTFIMmJZeXlsZXRB?=
 =?utf-8?B?OFNxbXc0R0hhYkVMV2hsVWpaMEI1eFhiT2c4VHU0ZlkvMDdKWDhyYWR5Slgw?=
 =?utf-8?B?NnE3VTkyUVdqby9qVVhNenJOa2s2VHdoS0xvS2xFSFI3QlBVSUpBZFBoeU5D?=
 =?utf-8?B?RkYyR0VFNHd5eGdSck14V1FHN3lzWEhjMkFvdElvbjA4QkhYMysrQUhUbElP?=
 =?utf-8?B?UVQxMzIrMndFdERQUEd4QzlwMEdTVEcyUlJ0c2dwZ1N1cmI0eldUL05HelV2?=
 =?utf-8?B?UUhIWEJBa2NkeG8rT0xjcUpBM2lVOEZXZDdDa28vamk1b3pCSzhDcy9qOHdB?=
 =?utf-8?B?V2d2VUxDTDZnaGs2UTJMTnlNQzZpS2d1QVBMQzJzT0NtZHdqS2kxWDAvMlZQ?=
 =?utf-8?B?RHBPYmJQMWppZ1B3b1ZtN3JpRUFhTGpNanhkR2EzSHo4WitkNlUvREMwREZ2?=
 =?utf-8?B?Y3VYRVlCNHhIL3o4L2tEU29XRDVzT012SUwxR2pJM0lpRVNyTTFTV3pVaHdm?=
 =?utf-8?B?U2c3SnhDK0ZhUzA3UUdZYzUzQjh1d3k3VXpwYUN4UEx0YWNsK3FDQldyU2p0?=
 =?utf-8?B?YUFMUnEyY1RPcEowYzRyYWZSNC9mUGhVdm9LUHhmQ0xOdm9TN0locFE5a2Rl?=
 =?utf-8?B?M05ibFZTSkFXYkJUcGErWm55aWVvWTZUb3AxeDNwRGpqZ2g1RWwvdS9OSHJJ?=
 =?utf-8?B?ODVXeGcrc0ZGTkczblZUN1JDTzYxN055bmVjUlBXekl1b1phMXNYY0YxZHFt?=
 =?utf-8?B?Nm9aRFBmcGNSVk9HRlFaV01idXppdWZHRXR6cnZrWlY4RGhDQ2dweEF2Tytu?=
 =?utf-8?B?eGxFTklVOGRjaEFJNnNRdVVCNVg1UFd0N3hwL0V3RlVEOVluT1VGVVNXc3c5?=
 =?utf-8?B?NW5FQnVFTEFxOWZNMkUwNS9ZNi9HQ21LZzVjL2RMUWc5OVZuMk9icHRFbDk4?=
 =?utf-8?B?d1hESUhSejRnckN2S1k1RTlDcnpNNkJQcEFhVUhXL1hoK1lWajg5REIzVENL?=
 =?utf-8?B?QTdkaEhITStLQXRKOHd2c1k0Z015V3NkZUY0dmRlM3MzaGxuTUF3M3JTNHQ0?=
 =?utf-8?B?YU5DdENnN1BnVWZXRGFlSFc3bjdvQUJnQzEvQ2dMWGdOdEU4RXgrSy9nNnJ0?=
 =?utf-8?B?bExNZkpQeVpOa2RRSmV6cFdxbWI2Um00ZW01NGp4NmpvUWo1d1F1Mk9JTkx2?=
 =?utf-8?Q?eqC2DiUAholvudhbpbdLjbRn3hrOcOOjSa3B9QA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8c7d6a-d554-43be-fd68-08d98e25cf6b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:45:29.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Joyt8gqTY/vDbsYeaxASA5BKWc7QO4iMY7WcCB8KA5y/Gm9q/aRBcrJLNS9skcPUmCJID3Na5KsOPp2J5l1Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5082
X-OriginatorOrg: citrix.com

On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the Xen to emulate the PCI devices config space.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Change in v5:
> - Add pci_cleanup_msi(pdev) in cleanup part.
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Change in v4:
> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> Change in v3:
> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> Change in v2:
> - Add new XEN_DOMCTL_CDF_vpci flag
> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> - enable vpci support when pci-passthough option is enabled.
> ---
> ---
>  xen/arch/arm/Makefile         |   1 +
>  xen/arch/arm/domain.c         |   4 ++
>  xen/arch/arm/domain_build.c   |   3 +
>  xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           |  36 ++++++++++++
>  xen/drivers/passthrough/pci.c |  18 ++++++
>  xen/include/asm-arm/domain.h  |   7 ++-
>  xen/include/asm-x86/pci.h     |   2 -
>  xen/include/public/arch-arm.h |   7 +++
>  xen/include/xen/pci.h         |   2 +
>  10 files changed, 179 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 44d7cc81fa..fb9c976ea2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 36138c1b2e..fbb52f78f1 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -39,6 +39,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vtimer.h>
>  
> +#include "vpci.h"
>  #include "vuart.h"
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    if ( (rc = domain_vpci_init(d)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c5afbe2e05..f4c89bde8c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> +    if ( is_pci_passthrough_enabled() )
> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
> +
>      dom0 = domain_create(0, &dom0_cfg, true);
>      if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>          panic("Error creating domain 0\n");
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> new file mode 100644
> index 0000000000..76c12b9281
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,102 @@
> +/*
> + * xen/arch/arm/vpci.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/sched.h>
> +
> +#include <asm/mmio.h>
> +
> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> +
> +/* Do some sanity checks. */
> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len > 8 )
> +        return false;
> +
> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )
> +        return false;
> +
> +    return true;
> +}
> +
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                          register_t *r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = ~0UL;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> +    reg = REGISTER_OFFSET(info->gpa);
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 0;
> +
> +    data = vpci_read(sbdf, reg, min(4u, size));
> +    if ( size == 8 )
> +        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +
> +    *r = data;
> +
> +    return 1;
> +}
> +
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                           register_t r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = r;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> +    reg = REGISTER_OFFSET(info->gpa);
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 0;
> +
> +    vpci_write(sbdf, reg, min(4u, size), data);
> +    if ( size == 8 )
> +        vpci_write(sbdf, reg + 4, 4, data >> 32);

I think those two helpers (and vpci_mmio_access_allowed) are very
similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
the point where I would consider moving the shared code to vpci.c as
vpci_ecam_{read,write} and call them from the arch specific trap
handlers.

Thanks, Roger.

