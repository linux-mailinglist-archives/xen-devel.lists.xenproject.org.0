Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B94397B5
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215869.375273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0Db-00017p-Q9; Mon, 25 Oct 2021 13:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215869.375273; Mon, 25 Oct 2021 13:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0Db-00014t-MF; Mon, 25 Oct 2021 13:40:51 +0000
Received: by outflank-mailman (input) for mailman id 215869;
 Mon, 25 Oct 2021 13:40:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mf0Da-00014n-R3
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:40:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29dfd69a-3599-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:40:49 +0000 (UTC)
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
X-Inumbo-ID: 29dfd69a-3599-11ec-840f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635169249;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YsI8oJjNzAWb5KKJeVdtnuUKPH6GksyczH9JASNUHIs=;
  b=ISyjeEwY0RfcXrzyzffSGD0hQniaa3WSP1VbBc/dPfTzzN2b++mF6L7v
   pI11kVD7kR5ADfiBngkPOe89+kxFHMavqpMtASZ9auu9wPObDjqRf6q6C
   fWeNPawZyoYZNkO/xoOoz1hCW2Cf2yh2E6Mq7inZBfYzDingNsdnVXJgh
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YvovpOaf3zz1cZhm4TXZIb5FYcA1mmiqNsNxa10/QuVX6wrIG1zWwojKYEHpbp6z7UGWXfOUj4
 Xp3isYRXrmj9wgFM1hmO7wARjP1MNZt1fQpa1jcaaFhkYrmPTtdnG8PPwU86D1Ckm+bWhkAgvr
 99JwdQwrGRoHxe9RcvbfCPMa1aGn2VwhrbIfOccb6eQp2rpPqo5ULIJ4dAXK11H7fTqVFI+3c9
 v47vTyQIpm2YC1K7Ls/BMzbTlIRjRfJ9yThAgMI/2mcZUoOd7Raf42beAFBal0JiQFut7DDDlx
 n1CmgSpacL+yZ7mUzGaCiF+n
X-SBRS: 5.1
X-MesageID: 55541012
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WcB8ma9pJXccK9c145EhDrUDoniTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mQWWz+BbP2Ca2D8fdEkadnnoRhV7JbXy9JmGgFpqCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhg9
 PtivpOXSzwDGerVnr0wWjlHFCdHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgWps35gXR54yY
 eIzdBZxNT7STSRREQgWA40UktqQvHrgJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0zQGA0XMeu62DWM83+yruLXlCa9U4UXfJWg/+NuqE2ewCoUEhJ+fUGyoeS9zFW/Xd1fA
 0UO/2wlqq1a3EamVMXnVhu05nuNpAcBWsF4Gvc/rgqKz8L83QGdAWQVSy9bX/YvvsQ2WD8C2
 0eAmpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprUSg844C3HU2Tj6Rl2DKaCY4Gr8lHd4ex3EJeCTlKBs
 X4HnOCT9OkLS5qKkUSlW/4RFbuk4/KENjz0glN1GZQlsTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7LUeEQqR4RICKIeNt1K65ON3FSffSV48bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvs/kmLnLwsJ+fpynHpmnDKMLXzu503/ieL2WZKDdVsS3LJihMgC56SYvB6dz
 d9bM8abo/m0eLyjOneJmWL/wFZjEJTaOXwUg5EPHgJgClA/cI3ENxM26eh5E7GJZ4wPyo/1E
 oiVAye0MmbXi3zdMhmtYXt+cr7pVpsXhStlZnF1ZQ7yiiB7O9bHAEIjm30fJ+lPGAtLlqYcc
 hX4U5/YXqQnpsrvomx1gWbBQHxKK03w2FPm09uNazkjZZ9wLzElCfe/FjYDABImV3Lt3eNn+
 uXI/lqCHfIrGlQzZO6LOanH5w7g4hAgdBdaAhKgzi97Ix63ruCH6kXZ05cKHi37AUySlmXBj
 13NX0ZwSCuki9ZdzeQlTJus9u+BO+B/AlBbDy/c67O3PjPd5W2t3clLV+PgQNwXfDqcFHyKa
 boHwvfiHucAmVoW4YNwH6wylfA15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e5QlQfExUoM7aY3vYOlziMsflseBfm5DV69aasWFlJO0XekzRUKbZ4adt3w
 eootMMMxRa4jx4mboSPgixOrjzeJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2bN1qTYhrlayk7TSFYJFCDAjbhHmJADmBFW11tedV6HrcXI260s1xpL/DVpEgkMlkdb0/h+M
 3RAPlFuIfnc5C9hgcVOUjz+GwxFAxHFqEX9x0FQyT/cRkisEGfMMHc8KaCG+0VAqzBQeT1S/
 be5zmf5UGm1IJGtj3VqAUM1+eb+SdFR9xHZnJH1FsuIKJA2fD75j/L8fmEPsRbmXZs8iUCvS
 TOGJwqshXkX7RItnpA=
IronPort-HdrOrdr: A9a23:afKOCqN2jRVUGcBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.87,180,1631592000"; 
   d="scan'208";a="55541012"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwOzM2AVH6BQVkRLbDkSAyPtmYE6ElYTYn80mVnO0F4cilxicuKUqPnTnyXf+lQ7tZkRCHjSxWwwjG3DA3JcrOJ28WpVbNbwUhTm6v4QVOtB2fr5ebkZK/dlXpZc2YsoqfdjMOyqpv3sytjAzzB8+ZkKOQBlpHmQMvMpolfVGCO8i2aoOS16XxMuJb47GFjna7cmHTbHr1VBcaN7yCGPpxbWAKtlzgW0Mmh/Le7W53Y0nbqLeqaVqiQsgklYpTHpJ5B64sjP8K2QTMDsRKck+6b2oWIgtxcUw0x+IFV2HiOaiAtcm2SyIXJK5dO9GNyxY4dV22lzla1RSTJDm4Dkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiIxI6WkK73yAaGqnLv3DJVEO2USAk8Ei936fAO1J94=;
 b=gLkcNHXrth72R5NZY9YuuJBVGbOmWPAp2QIHGKlIzgJse+Y/nJ3t90ex+PduiMSiJArZifu+8iVzBwCfULUcck5E2TN4XcuAMcTZojHF0U4ieBqj5weghSpwoEOH1j2iiqZNYHKBJfmooJXV56msagftOo7wxEP87q5yTadeqXqbfvOc8ELcDfFnxl9gJ292E2wlztXvWaCBKeSbvvPh5Xq+vRI8H69AgkGz5QOJq1orJYvV1qS5Y59eZPi+1s4LQ/BXmIQU43Z/EWq9B42ss/zElZsavLrPHFqpexoItcXIX4rdmdLivlqKT7vSozMc7mOiCqdBSfPUtqMISUA9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiIxI6WkK73yAaGqnLv3DJVEO2USAk8Ei936fAO1J94=;
 b=J1wwiKYM8pOR2RyCaBTwRydosANOk0+HDLAXoo9WrgfdphQRxYWgUn+ArtO6MbX21YPjhbrQDvglJEb8lMv1BqtHEDjiZvyoTuQ113Zs0Tvd237H0HScFkF9V9w+aAblBdU6Uc63uMcRJ19vpBEmvRXvyQFtcbdQbY/VBlmaa2M=
Date: Mon, 25 Oct 2021 15:40:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Message-ID: <YXaz1G1mvHzZHdxM@MacBook-Air-de-Roger.local>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-9-andr2000@gmail.com>
 <YWawvYGqIe3DwZfI@MacBook-Air-de-Roger.local>
 <7f2a5875-69c9-b40b-287b-1355698598e5@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f2a5875-69c9-b40b-287b-1355698598e5@epam.com>
X-ClientProxiedBy: PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f0e123c-4858-47d6-a270-08d997bd0976
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3915E9438745382E71C47C4E8F839@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zk3DNwD2OiHHiicGrvkS2CHML+dI+I+nbgvclc8Pc5JkEj4E0RD9GcJ+4HjkFx5Y7PmNNHoRmSoA9Hb8hsCZ1Vuqx46bG64dbwVOqk2LZZbMyoqEgrYSZoYn0T1GAURPZhbsgXffltUZMV++8X1hjm+LNeLNxZ24a926jEkk60fWyyGSmx19gKSECiQanwHIGblegHiwQw4B5ECFak/EWmT7SuZ9mQkGzhDicSME5pGrEyvpf6SXxFDJRJt05e8DvfgM7JFqHH6r1x2QmCDdUdH7MQRLZfqyg01NufXBmiv/Kc72WqhgjnabOBN2CPcqVVrhspbs8IwkO7Z8uTGCQBIYM/YMXXIF+wjRI2IJYX/WElNBJxcVqLcJ8bTtn1EJFvoclWc/zkCSOKt84f0Bu8Ty7NS9fx4LNWyQnoSUGfbh4+rzPp8JQ35jrE8/T+HI6m7Tx+tFIfECXnhY+HVOmSjOk/GS8ecJ0r3uwiq25LHSfQHEB2iOzhcthLhPQiqfdc5XWSDYO2pKvOvFrlj+ohw3XWFtW2NEeWWZndbvOb7N32HLiLMxrULpJuN4s/ECHgoUsh4jMfQsw41xg/UX+rmXtqE6Xifm+dePRJDivK7OvDWC0+zuuiXbW1X3aRtY5ZfGR0XLHEns8QHg/Md7hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(82960400001)(2906002)(956004)(85182001)(9686003)(54906003)(86362001)(26005)(6486002)(6666004)(66556008)(66476007)(6496006)(508600001)(186003)(83380400001)(53546011)(316002)(66946007)(6916009)(38100700002)(5660300002)(8676002)(8936002)(4326008)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBiSytUTmxhS0hickczOGFuTDJMU0U4RkV1SlQzSHJLRmVCMjBnQmZ3MWZh?=
 =?utf-8?B?SlpDUjM0YjlLSTRxeXVjZUtscjZYU1ZVVk43SHRwU3ZQQnZzQVdkOWwzRis0?=
 =?utf-8?B?dW9JTUt3dUhUektMREdzNGJMdUFVaStlUExuZkdXZmZaNUZJT1RIZUdyVVBO?=
 =?utf-8?B?cEtxd3JpdzQxbC90SERhSjcwKzV2SWFiWXluSStpS3drRU5VT3JYMW8vYmlI?=
 =?utf-8?B?V29Nc1JNb2FxNGxNZDJQQTZvYmxqcEo0TVY2a2V6bzVaaUxPVzJuZHNEM2Jh?=
 =?utf-8?B?Zy82Y2ZiWndKVWdhQndKNHdvQklxTkYzRVp2RWJoa0x4U0prQ0Y4ZDAwZkFy?=
 =?utf-8?B?ZjZFU3I3R3doQmZZYS9Mdmd4RHh0WTdEdFIwWEVXRG83cjBNbTdoVHBXNWk1?=
 =?utf-8?B?dG1HOUhnTFlTZnRlQlFlbnZwWStkK29hNGlaL0NzYmNrRUN6SEY0c2gwTkxn?=
 =?utf-8?B?R1hQMFh4MVpQUFlnb0k4R0pmMGtEazVOd284MlBDVENRQ0lOUEM3blorNnlF?=
 =?utf-8?B?Z0xWd1N4VXlUeEFUZ0dQRUxRM1NDQzZSWWJ4cEZPSklVKzdlMWxJOHYxdUFK?=
 =?utf-8?B?WFF1azVuZGRmV1hPTnlnV0QxUGMyelNYcG51a1B4bzBXdGsrSHpWUHBVcDV3?=
 =?utf-8?B?QXAyTmIxRE5vMDhvRGlpc2V1VFJlckVxd242V3QvclFzTnR2Yi9mZE05c0p0?=
 =?utf-8?B?c25Oc2tiNlExdURXZDkveVZQRGxrK1RoWmdqYS9qeHBPQWw0T3dQR1ZRa08y?=
 =?utf-8?B?UmZWYmNZdzZMcCtDLy9KSHZ6S3NobCtSb1FnT2FIV3FZOUM1RDVVeFhnc29K?=
 =?utf-8?B?azMxdHdOdExmRE00ODFHUzJYTnJSTlZ2cW9rK08rNm01YTVpOXF6NHUxd0Na?=
 =?utf-8?B?RURiWERqQ0hhVmlJY2VYSHh0NlV3MlVDMEI4ZXJYd0F6V2Mra0FyM0FCVnN3?=
 =?utf-8?B?Q0dRNVJtbkxpL1kwS0ZmanFBUXphQ1BnNmp1ZHVEdmdkcnUwQ0hpLzJrV2Va?=
 =?utf-8?B?anVueEZTMjJlV1g2WUVnN0dMRjdzUGVuRTh2Tmw4R1JJUXY5aVludlFFeUVh?=
 =?utf-8?B?aDJOV1V3bnJaWHVwamFBd3dqZnlJZEk3Vm5waUYxNmlIbENmTHFIUE13alh1?=
 =?utf-8?B?eTl4YjUxRk13N3VJeDRaMGdCdjNNV3FLQW83WCsvWHRKcnhFeUh5NjlFMkNJ?=
 =?utf-8?B?TmlsVEdHY0VQUXlmM0h3RzZjVkc1TUxERFFzRkhHYTIrYTQxcWtDWjZBaUQ2?=
 =?utf-8?B?OHdzanl4VFpxVG4zS2YyYm1lclR3b05hMWR4blBOWm1EOVRsOVFUeElTTlJZ?=
 =?utf-8?B?eDU3UVlKVitrMXdlNUllVHB2L2JOUkNXcFNORk1hMlY3QlVjSkVFeEovK0Zm?=
 =?utf-8?B?WGYrMy9hZGFFQndla1VJWWZSb2NYN0dZd3VSS3RHWTVmZ3dveStjakVzV0Uy?=
 =?utf-8?B?RHZaMUlJV1dSTlg2aTkyY2dhakZBV0dEQVBwYTBaaU42SzQ4dlY3MnR2K1Rm?=
 =?utf-8?B?N1piM2J2Umc2aGVXL211bjRnMW9GSURTL0UxZ3Irb0d2ZWU5NVJBU0JldnNm?=
 =?utf-8?B?bForNXM1MlE3WmVud3ZiaDZnTFFkcTROVDI3VUhjMG9BZGErMXhJWE5xbk1L?=
 =?utf-8?B?RmtMTzFQVlgrR2VRcFdxOFlRZEo5bkIvaEMrRDBwbDVTdmlPZm1md2x1dGls?=
 =?utf-8?B?TVhlb0xBWWdtZTdrOFl0RG5QNnUzMXd1Q0poVEw3QmlQaXlacHBiZmdqb29P?=
 =?utf-8?B?U2RSa1pNd1pOT2pIUHBPQ1NnNXpVTlBpQS84bGxHKzVDaWYwZDhLNnJHN2Zu?=
 =?utf-8?B?eGpVT2MwcWJzT0tDQ2dwZTJpMm5EalNjWXN0emIxVDNTZW1OY0V4OVNhN1pz?=
 =?utf-8?B?bTk2MEJ2NGRPRlRpSXk5RCsrZnlsUC8zRlVUMFpxMmE1S2ZRMGhsUy9KWkFT?=
 =?utf-8?B?V0FmRG1kcnpnVFBXYTZvS3pOT2VPUGM2TVkzUlJmT0dLZWZub3VtMWNCL3dv?=
 =?utf-8?B?UEpFQTh4RllvamE1YzQ0SUdoSTZES2VmR1Z1MUJsbTlmNnR5a0hVMERGbnZm?=
 =?utf-8?B?alEzR0lZWFRSYW5YcjJFa1RvTjF1TGRNY1AxQlgyV05zOEpMa1VEZmkzQTA2?=
 =?utf-8?B?d1Ziek14UTcvVVI0ZlZiR2M1R1djMkQ2YXFPM3U5dnY4ZThPVVltbzNmV25P?=
 =?utf-8?Q?rdxScJtdEuIyKcrmo6xAnQo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0e123c-4858-47d6-a270-08d997bd0976
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:40:41.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XylVrMqYygXzd7HhbDw9Ps602A0sGZP6baxJgGGvsv+xRiza9VDUlugauah0tWoH74G5wiDdoGws8t+5cdwXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

On Mon, Oct 25, 2021 at 09:38:00AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 13.10.21 13:11, Roger Pau Monné wrote:
> > On Fri, Oct 08, 2021 at 08:55:33AM +0300, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> In order for vPCI to work it needs to maintain guest and hardware
> >> domain's views of the configuration space. For example, BARs and
> >> COMMAND registers require emulation for guests and the guest view
> >> of the registers needs to be in sync with the real contents of the
> >> relevant registers. For that ECAM address space needs to also be
> >> trapped for the hardware domain, so we need to implement PCI host
> >> bridge specific callbacks to properly setup MMIO handlers for those
> >> ranges depending on particular host bridge implementation.
> >>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> >> Tested-by: Rahul Singh <rahul.singh@arm.com>
> >> ---
> >> Since v3:
> >> - fixed comment formatting
> >> Since v2:
> >> - removed unneeded assignment (count = 0)
> >> - removed unneeded header inclusion
> >> - update commit message
> >> Since v1:
> >>   - Dynamically calculate the number of MMIO handlers required for vPCI
> >>     and update the total number accordingly
> >>   - s/clb/cb
> >>   - Do not introduce a new callback for MMIO handler setup
> >> ---
> >>   xen/arch/arm/domain.c              |  2 ++
> >>   xen/arch/arm/pci/pci-host-common.c | 28 ++++++++++++++++++++++++
> >>   xen/arch/arm/vpci.c                | 34 ++++++++++++++++++++++++++++++
> >>   xen/arch/arm/vpci.h                |  6 ++++++
> >>   xen/include/asm-arm/pci.h          |  5 +++++
> >>   5 files changed, 75 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >> index 79012bf77757..fa6fcc5e467c 100644
> >> --- a/xen/arch/arm/domain.c
> >> +++ b/xen/arch/arm/domain.c
> >> @@ -733,6 +733,8 @@ int arch_domain_create(struct domain *d,
> >>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
> >>           goto fail;
> >>   
> >> +    count += domain_vpci_get_num_mmio_handlers(d);
> >> +
> >>       if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
> > IMO it might be better to convert the fixed array into a linked list,
> > I guess this made sense when Arm had a very limited number of mmio
> > trap handlers, but having to do all this accounting seems quite
> > tedious every time you want to add new handlers.
> Yes, I think we need to do so, but this improvement was not meant
> to be in this patch.

Ack, just wanted to raise that this model seems to be getting more
complex than just setting up a list.

> >> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> >> index 76c12b92814f..6e179cd3010b 100644
> >> --- a/xen/arch/arm/vpci.c
> >> +++ b/xen/arch/arm/vpci.c
> >> @@ -80,17 +80,51 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
> >>       .write = vpci_mmio_write,
> >>   };
> >>   
> >> +static int vpci_setup_mmio_handler(struct domain *d,
> >> +                                   struct pci_host_bridge *bridge)
> >> +{
> >> +    struct pci_config_window *cfg = bridge->cfg;
> >> +
> >> +    register_mmio_handler(d, &vpci_mmio_handler,
> >> +                          cfg->phys_addr, cfg->size, NULL);
> > I'm confused here, don't you need to use a slightly different handler
> > for dom0 so that you can differentiate between the segments of the
> > host bridges?
> >
> > AFAICT the translation done by vpci_mmio_handler using MMCFG_BDF
> > always assume segment 0.
> You are absolutely right here: I can set up hwdom specific
> handlers, so I can properly translate the segment.
> On the other hand, when virtual bus topology added, the SBDF
> translation from virtual to physical SBDF resides in the Arm's
> vpci_mmio_{read|write}, like the below:
>      if ( priv->is_virt_ecam &&
>           !vpci_translate_virtual_device(v->domain, &sbdf) )
>              return 1;
> (BTW Jan asked in some other comment why it is Arm specific:
> I tend to keep it Arm specific until the point when x86 wants that
> as well. Until that point the code, if moved to common, will be
> unneeded and as Jan calls that "dead")
> So, I think that I can extend vpci_mmio_{read|write} to account
> on the hwdom like (virtual bus code is the future code):
> 
> static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                            register_t *r, void *p)
> {
> ...
>      struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
> 
>      if ( priv->is_virt_ecam )
>          sbdf.sbdf = MMCFG_BDF(info->gpa); /* For virtual bus topology the segment is always 0. */
>      else
>      {
>          sbdf.sbdf = MMCFG_BDF(info->gpa);
>          sbdf.seg = priv->segment;
>      }
>      reg = REGISTER_OFFSET(info->gpa);
> 
> ...
>      /*
>       * For the passed through devices we need to map their virtual SBDF
>       * to the physical PCI device being passed through.
>       */
>      if ( priv->is_virt_ecam &&
>           !vpci_translate_virtual_device(v->domain, &sbdf) )
>              return 1;
> 
> Will it work for you?

Right, I guess it could work as long as the differences between the
hardware domain and the unprivileged ones are not too big.

The nice part about having different handlers is that you avoid a
bunch of conditionals (ie: no need to check for is_virt_ecam) which
makes the code easier to follow. OTOH it could introduce more code
duplication.

Thanks, Roger.

