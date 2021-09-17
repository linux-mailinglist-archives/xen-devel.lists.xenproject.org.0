Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FA40FD1A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189504.339288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG55-00087K-RU; Fri, 17 Sep 2021 15:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189504.339288; Fri, 17 Sep 2021 15:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG55-00082R-KE; Fri, 17 Sep 2021 15:47:15 +0000
Received: by outflank-mailman (input) for mailman id 189504;
 Fri, 17 Sep 2021 15:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG53-00068c-V6
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:47:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a040cada-593e-4371-9c63-1d06627651ef;
 Fri, 17 Sep 2021 15:47:07 +0000 (UTC)
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
X-Inumbo-ID: a040cada-593e-4371-9c63-1d06627651ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8yaSBJfS4uBB9CmxQZt73y0W3kku5w3/WtdaE+LvS9c=;
  b=gv+pTvZeWfWw29hMFNISOvI6h8ZTuZHGF2cn2g7SQBcYJ90MRrqavERQ
   nlliqexqskgULnKIlvDrzQ2v9CV0N8rkPXpyq7Hf4ZbKboqSYzUeNvLBv
   xtr9eU8S4E1F4RUFZY/Irl/VZThPyLMw/SoTJE9SRUXitMHeItB6cb9tT
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EmJ3mxN3nx6zzStBk3fTRuwk7pnO7KwmLP0B2u8QxQXnQ51V592DGCTH2sRhkYhlmxJhZR1KBn
 omw1YMRBKrFaM3R8PUeLPqCM8uJNZOV6a02ZOffodFAisS1GHCq8ns6Jo6HGvKMUX3HHgTPr9d
 PZHuDzcsl7MvIH3qOIgiIQhdT4ie2FTKOtMHEO1XHn7cyFQhpARIL90EI6mEOCG05XTLvqNZ7z
 ve8bumARwld8WapcgTsCzhmeLinps8Uo9F4BoXdzUpHEsKQMHwm91Mpot3vaWJzaKnlYENLTce
 W8QWfSe0NT14qHLrw1j34oLc
X-SBRS: 5.1
X-MesageID: 53410957
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3Pnbz65wYTCpQmsHDM4yFAxRtOzAchMFZxGqfqrLsTDasY5as4F+v
 jFMX22PP//fNjOkc4tyaovi8khT7JPTzN43HldvrHs9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 /Ngn5CcRzcQGKzpibRMaUJZAi1YIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWxs35gfQKm2i
 8wxTwNUXRTiPj12ABQ4EckVxcqToUKkSmgNwL6SjfVuuDWCpOBr65DvP8DSYceiXthOkwCTo
 Weu12bkBhAXMvSPxDzD9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3E20TPHtUhugunmGsxUAHd1KHIUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC9
 Xmktd/FCwxWlrywWCLMzOyVvD+UJn1ARYMdXhPoXTfp8vG6/tpq3kmeH445eEKmpoaqQmCrm
 lhmuAB73u9K3JBRj81X6Hia22rEm3TfcuIiCuw7tEqe5wVlbcaOY4Wy4DA3Bt4Rcd7EEjFtU
 JUC8vVyDdzi77nWz0Rho81XRdlFAspp1xWG2jZS82EJrWjFxpJaVdk4DMtCyKJV3iEsImSBX
 aMukVkJuM870IWCNPcqC25ONyja5fe5Tom0PhwlRvFPfoJwZGe6ENJGPBXLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF+Eq
 4oAb5TalUo3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvr6gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:GHULGqq7icN6S65es1HxuPEaV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSpQEIdxeOlNK1kJ
 0QCJSWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHtXgslbnnlE422gYypLrWd9dP8E/M
 323Ls5m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 xoWp4Y4I2mdfVmH56VMt1xN/dfOla9Mi4kD1jiVGgPbJt3Q04li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="53410957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJP/gv9BZcBvmv3vrYTwxXY4zUImWbh5MbXJz1n0j9jdXM2hcCbVHCdl+0laV8EieWioyw0RCSKuA+Q0H5e32NLVqN0TlRnt8VYj7p+zaoCaK9OUexC2kGa62aMXtQ2miPnBk2fpRdEUCI6qThc/kfjfyjuwadzQMwYpm5yMmSqOZe4vrRY3ghvL5fcm/L4hr2QHnWNo3uCxigj18eP9nTFuDMwMoYLqk938avRkNPO5ki17EbGmSpyH1XzcS9o2g8AJzVqqvRO52X5AD0agSy15IC3gFCLwYODAabOomk+odtXDj3FpQGaygxHTwKgr6EIHiHsuQYWkrmbdzLgM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ODViCmJYnKpIZT6ta/bzfRMYz5jZaA8JqNXfGiUOkig=;
 b=jPzNrGxDY1wy9FTQdtSiC1MqrQMqWyrrvdYuY3/xsQOvXuQU/b07v8I3RTq92Is6m4am0eAPl3br7JVrpCisBvJ5U7ycqmChW6CdQAFDC0l8FKY528N5il3T1wyaJ/3vR2UF2h7cpIDvjrEBOKyaXXI4lcp5OU9ufEIsp6TT1uUlSGNGrGQz22Bvn2S11DVpeoaNgoig6zFx9N3Ebmu3wwE9v//jadcGrjmZDowzuwI5F6qdzKngOCKFhrEdndV1I9ZP7oIw6nG5QzkBD/R6aIf98BF2Mg9Dexjf8slLvnXiXkIYAHHEPBRS8Yf1D68ShRFqOw0zVkNlgZXKRFnCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODViCmJYnKpIZT6ta/bzfRMYz5jZaA8JqNXfGiUOkig=;
 b=gFHgp9xe/umT5196u6fsHKnMDL0VZEayKmXoRPEEfD5tKTV0yVuU1pRjL8RmDQ0jiDNuNzZBV9xmlLHZgVDkyOS6G6EjbOWWGEuU+UKzZyz9AvqFk8H2My3oI31G/UNHxI7SywmnYmxYfXK+vGq1l3/8POBYAl+SCZ/Rt1W/sVc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>
Subject: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring as foreign memory
Date: Fri, 17 Sep 2021 17:46:24 +0200
Message-ID: <20210917154625.89315-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f94f4209-069c-46ed-38ae-08d979f26567
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057C187EA79259F7A27939F8FDD9@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9NR5mG7bGcEpi2nyflGUVC9ZRtjpY5LvZbSOvBHOeOlj2eGwZmQSqf/G+48ZRrWvuRkAJl4YBFpuCPsPxRdkMgqco3JaC4M4kGzwJw8saTgpmH3PfEge6zk9BdxEXtm/OVLhj0yUeZ4ttl0XIi4+1dwtnFOhh22Kljhdw3LZnCZVFXkgq+5S2goGFDpTCVkQB27Pzt+CsSNYzPPSm+k6Ttg6NFeTkS2h3tiW70oFeKZM2JEwHmVzqgCBveKARwxObfSerb+cVbz+dfOiJAiXEi9E9MO9uzajdELiGSpkV0UACk2ZvFc2zEiKUPuPmbiILvZ/YXgl5oVVhltD/hSofgA1OiXaVBcM06t8GcpZc6Ar8wWrF1blqIZVXrmW5TxJO8LPITahTCNZeWOB59yLZiLlHWeWFGakdUS8jq4lh85GLPUwh7pryDs+jaxyko+8PpVXNZ15b681eEkOJ0eR5IIph7R77vMZM5/A3K23Izq69JspH5M9z5PpYTfUPxvMJXcHjGWxXoUco/4HO0X5Aoj+khJht7eRWf6gKZ7TN4kmZV8dY6woFWLUObRnnVZ31uZ/EdnGxj+K40lBUG3nIoCBv2RVOvPP80E0Ddg/tFw7Gr41Z2CZqciQNP7velw7QeBwTrUy3oMPeXWXGGD5NBeLG22bUHISH4dhm87NbsBUrXlTdu3A9jTGY9RUbJop4QB3ftwQ3EC9pWfcvJI7Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(2616005)(956004)(66946007)(66556008)(66476007)(316002)(6666004)(8936002)(8676002)(2906002)(4326008)(186003)(26005)(6916009)(54906003)(6496006)(508600001)(6486002)(38100700002)(36756003)(83380400001)(86362001)(5660300002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNGN2VOd0FncGRYdUhxZ1ExWUR0VDBYMWRJSVBMUGJXSi9XcC94VWhaczRv?=
 =?utf-8?B?RWNkNHF2TkZTb0x4U243OHpNZ08wdnVBbXZPMFJxN08yK1RVbnVOWkN5SzJT?=
 =?utf-8?B?L3l0WGUvdUZid0hVMW5XZ0Jtb2lDL2kxMHBsSE5Cb05KdWFxM2lGN3V1ZmZh?=
 =?utf-8?B?enF6dWJsbGNkcVppaUFUeDNRQVU2VWIrNlhOMzFYYlVha2s5STF4aksrZnEx?=
 =?utf-8?B?YjRlakcweVNUMVZtL0VxSTM3UFcwelMzUWd3YTN0cGxNZWJQL1ZSaHREYWhG?=
 =?utf-8?B?bFY3YlJwaW94RmRFcnhMY1BPd25tZm1mTUZ0SzdrVFFaT0dIUEhVaU13TG1T?=
 =?utf-8?B?d1F5WWFMbTQvS1Bsa3hxcHhXSWVzcTlXaGIxT2ZGcitleS9UZEo3LzFtTEhZ?=
 =?utf-8?B?S0lQTGp5UGxVYXYzaDJ6dkRRdzBEMFZwYkZxL0t3ZjFzNjhhaXU1cnY0ZUxq?=
 =?utf-8?B?OHNqTzZpKzB6T0hEankvbmllWHpYVFZackI5WldjVnhOOCtBT3JObU5qVXhI?=
 =?utf-8?B?c2dXWSsxZjFxUDdnL3pjbnNlNDU1TnczQm9wOFAzUkxxQ3BpS205cmhkUFpp?=
 =?utf-8?B?Y3JSL1ZqZjUwcWxLTXlSK1VlcksxK3hJZlJkWk1ZUHptZzhta3NzaE5vMVU3?=
 =?utf-8?B?TnE2SDhpRW10MEdNaU90MVdITVh0U2lMZmhLTWlpNW1QTWZCMllVVi9ra3Z3?=
 =?utf-8?B?TEJabDlRUUJyT05QSVQwb2tVSHdpN3FBRHdJd080YloycHVCOUJWY3VqTHhS?=
 =?utf-8?B?Y0czUGk2NS9hcWpWRU03QVNSZVkrUmlESTRIWEhhcmRaSU5rNGVCaWRlelZO?=
 =?utf-8?B?RXpGMTFwRXNDcFNxZHQ5Tzd4U3lqRVR5YU50ZGQwVWpHaXBUQ2RXZTN6dUhK?=
 =?utf-8?B?QzFmejdMSHNjaWRtRDcxbGoxZXhFWjIxWlJDbzZsRGFLSlNOaWhTRFd1VEJW?=
 =?utf-8?B?eHZJVTRSdHJ0bWFibFZKYUpYOUpFVUJvbjZLYXhUWVRPbnhmNUl4TUhvNmtr?=
 =?utf-8?B?RkxsR0xDSWJCYmg3NDJxTU0xSXNlbXA0V1VGemlkZEJObktQQ3JZQUlDV2JK?=
 =?utf-8?B?MWZPNEhTL1R0WUlNczBGK0hlUncvUWUyYkMyTGt5WWNWbVZtd3Nab1hjaFEr?=
 =?utf-8?B?VFExdDdPS1daNExPbFhTMVFIcXRKcG0yTWdpdy9rNWU4SVJ4dzNXVlhtRUx1?=
 =?utf-8?B?em5KcXphazVMMTNGWFNLQlpONkdwN29QdWVsaHlFRW81ZEtwamUxZ2p0RHJt?=
 =?utf-8?B?UnFRZENRclpIUmVMQ3JvNjAyTmd6RitRV1dSQ29OUllvWHdmZzgyU0dybG1h?=
 =?utf-8?B?ek1Pc05YNzU0L3MvS05VNWFxL2VqS3JZQmRrbmxiL3pkOFRsVjFTOUpSZEl1?=
 =?utf-8?B?VDkvVFlyOEwrRmU1UUpqbG9mOExGUmo3bjgvSmVuaVBVb1JMN051dnZsUE1O?=
 =?utf-8?B?UGkxZWdmY2F5Q3hDak90ZVRvTnJ6eEhCa1ZFSmJLU29qb1J0TVFkTnp4WXQv?=
 =?utf-8?B?bHpLV09kSGs5d0hFa3F4OGJ3YmJYM0hrUituNGtwYmNDaWp6aklxMm9za0h3?=
 =?utf-8?B?SnpPL2NYLzU2cEJ2cEV4MGtCNEMxTmNZN21DYlRqdjNUN3BhK2MyMzRaS0l4?=
 =?utf-8?B?WnNhNE1TMk1YOG5SY1hWRUJDcndiMTZHSVcvMzdmLzM4dGtHVWhvWktxN0h0?=
 =?utf-8?B?dHhUNXZrOU9acGRnbHgvVWJzQ1dsaFhZaG9nTDdSVU1tQmlLSUQ1L25iRlRF?=
 =?utf-8?Q?XPT9cdnrStLfuGIE5EowHg03ZMRk9pCXGQIhsAQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f94f4209-069c-46ed-38ae-08d979f26567
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:47:04.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MZKf3+IwtwmBdpfSJTqDvL035q0mNj6+6N34pm0VNYMawg0AZZdZJenSB5SigB/Fmh/1K7B6RLnSSJpdniqfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

Restore the previous way of mapping the xenstore ring using foreign
memory. Use xenforeignmemory instead of libxc in order to avoid adding
another dependency on a unstable interface.

This in turn requires storing the gfn into xs_state_connection for
resume purposes, which breaks the current format.

Note this is a preparatory patch in order to support the usage of
xenstore on domains without grant table. This not only allows xenstore
usage, but also makes things like "@introduceDomain" events work when
using such guests, otherwise the mapping done in introduce_domain
fails and the "@introduceDomain" event won't be signaled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/xenstore/Makefile                 |  4 +-
 tools/xenstore/include/xenstore_state.h |  1 +
 tools/xenstore/xenstored_domain.c       | 69 +++++++++++++++++++------
 3 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 292b478fa1..9a9f7be5cb 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -67,10 +67,10 @@ $(XENSTORED_OBJS): CFLAGS += $(SYSTEMD_CFLAGS)
 xenstored: LDFLAGS += $(SYSTEMD_LIBS)
 endif
 
-$(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
+$(XENSTORED_OBJS): CFLAGS += $(CFLAGS_libxengnttab) $(CFLAGS_libxenforeignmemory)
 
 xenstored: $(XENSTORED_OBJS)
-	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
+	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenforeignmemory) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xenstored.a: $(XENSTORED_OBJS)
 	$(AR) cr $@ $^
diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index ae0d053c8f..8dcc8d9d8b 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -80,6 +80,7 @@ struct xs_state_connection {
             uint16_t domid;  /* Domain-Id. */
             uint16_t tdomid; /* Id of target domain or DOMID_INVALID. */
             uint32_t evtchn; /* Event channel port. */
+            uint64_t gfn;    /* Store GFN. */
         } ring;
         int32_t socket_fd;   /* File descriptor for socket connections. */
     } spec;
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 8930303773..f3563e47aa 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -33,10 +33,12 @@
 
 #include <xenevtchn.h>
 #include <xenctrl.h>
+#include <xenforeignmemory.h>
 #include <xen/grant_table.h>
 
 static xc_interface *xc_handle;
 xengnttab_handle *xgt_handle;
+static xenforeignmemory_handle *xfm_handle;
 static evtchn_port_t virq_port;
 
 xenevtchn_handle *xce_handle = NULL;
@@ -66,12 +68,18 @@ struct domain
 	/* Generation count at domain introduction time. */
 	uint64_t generation;
 
+	/* Store GFN (if using a ring connection). */
+	xen_pfn_t gfn;
+
 	/* Have we noticed that this domain is shutdown? */
 	bool shutdown;
 
 	/* Has domain been officially introduced? */
 	bool introduced;
 
+	/* Is the ring memory foreign mapped? */
+	bool foreign_mapped;
+
 	/* number of entry from this domain in the store */
 	int nbentry;
 
@@ -196,16 +204,29 @@ static const struct interface_funcs domain_funcs = {
 	.can_read = domain_can_read,
 };
 
-static void *map_interface(domid_t domid)
+static void *map_interface(domid_t domid, xen_pfn_t gfn, bool *foreign_mapped)
 {
-	return xengnttab_map_grant_ref(xgt_handle, domid,
-				       GNTTAB_RESERVED_XENSTORE,
-				       PROT_READ|PROT_WRITE);
+	void *map = xengnttab_map_grant_ref(xgt_handle, domid,
+					    GNTTAB_RESERVED_XENSTORE,
+					    PROT_READ|PROT_WRITE);
+
+	if (!map)
+	{
+		map = xenforeignmemory_map(xfm_handle, domid,
+					   PROT_READ|PROT_WRITE, 1,
+					   &gfn, NULL);
+		*foreign_mapped = !!map;
+	}
+
+	return map;
 }
 
-static void unmap_interface(void *interface)
+static void unmap_interface(void *interface, bool foreign_mapped)
 {
-	xengnttab_unmap(xgt_handle, interface, 1);
+	if (foreign_mapped)
+		xenforeignmemory_unmap(xfm_handle, interface, 1);
+	else
+		xengnttab_unmap(xgt_handle, interface, 1);
 }
 
 static int destroy_domain(void *_domain)
@@ -228,7 +249,8 @@ static int destroy_domain(void *_domain)
 		if (domain->domid == 0)
 			unmap_xenbus(domain->interface);
 		else
-			unmap_interface(domain->interface);
+			unmap_interface(domain->interface,
+					domain->foreign_mapped);
 	}
 
 	fire_watches(NULL, domain, "@releaseDomain", NULL, false, NULL);
@@ -363,12 +385,15 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
 	return domain ? : alloc_domain(ctx, domid);
 }
 
-static int new_domain(struct domain *domain, int port, bool restore)
+static int new_domain(struct domain *domain, int port, xen_pfn_t gfn,
+		      bool foreign_mapped, bool restore)
 {
 	int rc;
 
 	domain->port = 0;
 	domain->shutdown = false;
+	domain->gfn = gfn;
+	domain->foreign_mapped = foreign_mapped;
 	domain->path = talloc_domain_path(domain, domain->domid);
 	if (!domain->path) {
 		errno = ENOMEM;
@@ -436,7 +461,8 @@ static void domain_conn_reset(struct domain *domain)
 
 static struct domain *introduce_domain(const void *ctx,
 				       unsigned int domid,
-				       evtchn_port_t port, bool restore)
+				       evtchn_port_t port, xen_pfn_t gfn,
+				       bool restore)
 {
 	struct domain *domain;
 	int rc;
@@ -448,17 +474,21 @@ static struct domain *introduce_domain(const void *ctx,
 		return NULL;
 
 	if (!domain->introduced) {
+		bool foreign_mapped = false;
+
 		interface = is_master_domain ? xenbus_map()
-					     : map_interface(domid);
+					     : map_interface(domid, gfn,
+							     &foreign_mapped);
 		if (!interface && !restore)
 			return NULL;
-		if (new_domain(domain, port, restore)) {
+		if (new_domain(domain, port, gfn, foreign_mapped, restore)) {
 			rc = errno;
 			if (interface) {
 				if (is_master_domain)
 					unmap_xenbus(interface);
 				else
-					unmap_interface(interface);
+					unmap_interface(interface,
+							foreign_mapped);
 			}
 			errno = rc;
 			return NULL;
@@ -489,19 +519,20 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	char *vec[3];
 	unsigned int domid;
 	evtchn_port_t port;
+	xen_pfn_t gfn;
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
 
 	domid = atoi(vec[0]);
-	/* Ignore the gfn, we don't need it. */
+	gfn = atol(vec[1]);
 	port = atoi(vec[2]);
 
 	/* Sanity check args. */
 	if (port <= 0)
 		return EINVAL;
 
-	domain = introduce_domain(in, domid, port, false);
+	domain = introduce_domain(in, domid, port, gfn, false);
 	if (!domain)
 		return errno;
 
@@ -718,7 +749,7 @@ void dom0_init(void)
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
+	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, 0, false);
 	if (!dom0)
 		barf_perror("Failed to initialize dom0");
 
@@ -758,6 +789,10 @@ void domain_init(int evtfd)
 	 */
 	xengnttab_set_max_grants(xgt_handle, DOMID_FIRST_RESERVED);
 
+	xfm_handle = xenforeignmemory_open(NULL, 0);
+	if (!xfm_handle)
+		barf_perror("Failed to create handle for foreign memory");
+
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
 	else
@@ -1189,6 +1224,7 @@ const char *dump_state_connections(FILE *fp)
 			sc.spec.ring.tdomid = c->target ? c->target->id
 						: DOMID_INVALID;
 			sc.spec.ring.evtchn = c->domain->port;
+			sc.spec.ring.gfn = c->domain->gfn;
 		} else {
 			sc.conn_type = XS_STATE_CONN_TYPE_SOCKET;
 			sc.spec.socket_fd = c->fd;
@@ -1290,7 +1326,8 @@ void read_state_connection(const void *ctx, const void *state)
 #endif
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
-					  sc->spec.ring.evtchn, true);
+					  sc->spec.ring.evtchn,
+					  sc->spec.ring.gfn, true);
 		if (!domain)
 			barf("domain allocation error");
 
-- 
2.33.0


