Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ADE4D642A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289110.490489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSggp-0007Oc-9L; Fri, 11 Mar 2022 14:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289110.490489; Fri, 11 Mar 2022 14:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSggp-0007M4-6K; Fri, 11 Mar 2022 14:56:23 +0000
Received: by outflank-mailman (input) for mailman id 289110;
 Fri, 11 Mar 2022 14:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSggo-0007La-Cf
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:56:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67bb94d0-a14b-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 15:56:19 +0100 (CET)
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
X-Inumbo-ID: 67bb94d0-a14b-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647010579;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wM8jj/+LYSoUgwT1plT1dQ8fBe6VUbqiPHKL8ELPfJM=;
  b=AG5+D1eHxJ7fkED6uA1IHkIn0IYHPLrPz62NoTK7DqNk9Hed1Iv9gv5P
   61fAofUg4z50zQfboBCDN0XSN74/SuGvyPbsEuQUzc0XTWpC0v/9Fa43J
   h8qwhxNKqM0IK4yNbxuCEi1eXUiM6CheXnvsfGTaKCc5ImO5Vx3CGTyES
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65491796
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bzXjsqNL6hVkq6DvrR28l8FynXyQoLVcMsEvi/4bfWQNrUpzgTwAm
 msaCG6FbKncY2f0L4ogYYu+8UJTv5PVzt9jGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29cw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 tdDnIO2WyAVA7ycoqcdCgh1AR56MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmps15kRTKi2i
 8wxOANXPTjfaUx2F3wwKL0GxP+WwXb1SmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlauvBA1RNxCNNEH+VG3iaqN8iuLOWwLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8oDGJGT9bxgbQ+0RqmBN/IJrVml
 CJY8/VyFMhUUfmweNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjzqiX8ItAIuGggTKuMDiriUWa4C
 KM0kVkMjKK/wVPwNfMnC25PI5hCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2TGSLUo0MLFbmRrl/tMtoVi2Oq
 I0BXyZLoj0CONDDjt7/qtdCcwpVcSBlWfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:PhKdZq9HkutpgvoGJB9uk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA9ciYnV9MPOA4/e7rDNoXse2OEDIvAGyWuKEk4U0i936Ifpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="65491796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTD2alvl7sUbLXWfhoCPQw4GSZrLqLEc02negl9yyegmL7cickBOTnlJ8fNBSH9toasOzCAYTBXsNwYg+NmRaFThpWKXsPgoyjPh6ruS/QnO6jwNJrnLJgBGJiXl+jd8sm8PiEMC84r7kkUvyhs2OLdjdgBYPlf+Uu/qnJ+FOB0GMdHLSGrGFwbrRFis4/didOOn9+TVLOEE5qJ6ekq26kpbb5GvSiLqmYh69dXgfRji0OMwtVygK56+0VDURsa/9S20A4yz7jaYNdwR7BcupZf4L/qcJ5qAowop5vUJdoJAvddZlYERUY6sATgOCuTr0cCT9pAL1cxUkBsAYofCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka8qzxPq7vFRcORU838LOci75elHMb5JrhnGsEEjjCw=;
 b=O5RQ2xCWa89tZtqfWEFNtZYJZfq7BriquxLD5N5JnBgKtup4/Zwyl+9B9RmgeUWfhDOOnMGK0K5JUsdBaEXL4nKapVZg3PPrDQ6O9hwNWOzywlZVIm9pQ52BrtS3Axs7VmLfmRtMyV/tw/oC7c6G71epiF/qpIaMAVKRxh82bCzajE7iE6uuekT8ArePdroq1Lomttp6hd9wyD1RYaC2tfEdxDO7R0nPebnTF2IVOtJVY2pMluMBD/kSmvBTt0oGeX8K5eE+2edH/ekqWx1dwNG8XeEiMBU8PHzmU0rMaRvNlHihsU3xoPvmJprY601V6tT1ks2YnXKRanQlTJ4A/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka8qzxPq7vFRcORU838LOci75elHMb5JrhnGsEEjjCw=;
 b=I4Ur7aYjc28hplR2jRqLoxOc8hU6QZNeZpIAgruIN3aKWuJRY//i/3d6jq3mzCDvg6S1lK1wLG4+/wySJiWvwulkhCieD9bwhmG/HKJpAHYn6arSg9WrAv5kKWuNI6fT/r/4VxH22+2ELfUDt7dson8zfKenYbcVcztIGM/fBQw=
Date: Fri, 11 Mar 2022 15:56:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YitjB+8Mtw71Ge8k@Air-de-Roger>
References: <44a6db86-e49c-b820-b397-09769c198959@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44a6db86-e49c-b820-b397-09769c198959@suse.com>
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524de6d5-8145-4f3e-0bd2-08da036f4911
X-MS-TrafficTypeDiagnostic: BYAPR03MB4760:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4760F23E7BBA77F48AF87CB28F0C9@BYAPR03MB4760.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCBakJu94ljZbyxyZn+wNf8y4fZXb4Ul+RlWzxsGDmTPMuNabzjFBy/ll0Yzbox74Xeg0g1Cp8VtUYW/lBIeGNJo+HKFvrBs2+c1cte59yW/wvSQDlkQthPM+cEJLWtd+PWZyafBqwGHZV/+qLITMcUg6E6X50Yd6xFM3drhVWeSBhgPrIXfIuaPvlDjpzKWEeb1BE4ckwj/qDAWzzhi+sNoJFuETR9cpLb/LJDM0ntzT4zx4YmRRBE2aQZwaODyXAznaPR2wJf3cUEmUcNnP1Bsk+EzftlWxZULyBaz1BUJKAPPf9YtHOTbbjm2Vvw7rm96iMHD/7F8+C6S+hqPU7EKUYpZ1x5qwb5nkjCW+FqP3ctYQ5UPOsvZ+KjjN2gP2+Krluz+PA+VyIJiZ5047tlGo/Bk3pUWqGWm0jfZTS7sKWTwRAslrQDZbVfOtWvlN58dPsPoIrm6w+LCBTtgDie0/AiEVsUQ3qe1wHYRQjyf2VAPmkkbD+31fdsEd+clop5mHAzOW3RzbVnAVnmh4sAtMqTb1CI7OM777/OijlDi/5f8n6NBdDqUoOs1pFqwj4PAQgibDE9Np18wxpGKh3HEnyA3gfokjt1cYAvQoCNWQXiNqEMFo9lMS0P0CogtEb6wnasnAqjA0OVfKQjroztz7HzbkSHt6TEoode9qf7DKKeD7rvTPqq0YgwJrxwaoWijpoIhLuYMUX+So7bJfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(186003)(26005)(8936002)(5660300002)(6486002)(2906002)(83380400001)(9686003)(33716001)(6512007)(54906003)(38100700002)(82960400001)(6916009)(66946007)(66476007)(4326008)(66556008)(8676002)(85182001)(508600001)(86362001)(316002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJ6U21RWDBQMlFMMGRCTHlRU3lrN2F0ZVhwL3VkYzFOSEk0Vjh2cU5TcnM4?=
 =?utf-8?B?L251SGU4U2QwcDVIWW94VDl4Wi9oVXdKUlRTbmwvQlhESUJTZnB4WTF5aFM0?=
 =?utf-8?B?OGRUd3VxaENyanZuQ0R5dUdibFQwS0FkR0wzSlVHMFhRa3VJQUZ4aXFyeFAy?=
 =?utf-8?B?UGt1R1BnYmdvSW9ZNjhxS0ZyQmpjRm5rNWdVNlhhTmI5TU9VcnFlQ0wweEpN?=
 =?utf-8?B?bGcrT0hiZHFpVXBlRFhQQ282RG8xWmhPTWZ5cTVPWmxmbXhhNDZPWXRMSWFR?=
 =?utf-8?B?N1VMQjNSVWM1SGUwcGFObWhXOHZwVmhsdTYzeDdaUDZ0QjhSVVpjUHVNOGNk?=
 =?utf-8?B?eHJabEtKa3AxeUhyQkZNZm5mMEI3dzFqeEt1K1kxZWgwMk1TS2QzVXJ6WSs5?=
 =?utf-8?B?RVY3QnVQcXU0MzZ6ZmhrT3kwN0g2RmpMV3luZENTRmFCaGJYM2NWVHQ1VldV?=
 =?utf-8?B?NllZdlo4Y2FkSjk2WGNwK05BdHk2WXRzQTNQUG01MDFaSmszem5JaWY3blpj?=
 =?utf-8?B?WUwrN3JNNEYrS3I0U053Z1lVQTRTMWhCMkFrbTZicXRVVmlMS2tlb3BicWhR?=
 =?utf-8?B?K1hrdkJSK3hTRHdFV0V4WWJvSk9oalY3TDFnaFpOczQreWVMMFlMTUx3RE5n?=
 =?utf-8?B?bTVRcVFxTjRhL0tFZDB0STF1RS9nRG1GWTFScWFXMGN2NTAyOEpaU0dtWXNr?=
 =?utf-8?B?SUl3Vlp5ckQ3OU43UUpSN0toUkI0cWFWREduazM4VkdzbUlRVVA2V2VSWFNP?=
 =?utf-8?B?a2JOTVowd1h2K3ErL1I0RUh2akk4WmVFcXI1VDVNWjUyNzVwTXBtMmxFUktX?=
 =?utf-8?B?R1VmdkxOcnY3U2Q5NURhRXVBZ1RMdEhQYUp0WGh6b2YyZXQydmFiZUFaWThY?=
 =?utf-8?B?bHNBK0lSVGNEQzBFZVlzcXppSGg2ZjlLZkZTTXplRm9HazloLzZoYno1aVk0?=
 =?utf-8?B?cHN1L0RabDVwRWYwd3gyOFh1TkJTSVlYcDhITjFBbkZhUE4rODNzZ3ArbHND?=
 =?utf-8?B?RE1KeHN4TU95YXhnY3Y2Sjc0LzRUeXpWWW5DQytpWDNRcW9RODNqdGF5OE1u?=
 =?utf-8?B?Wk1CY1E1RTJOcFNMVUdmTDliUlBjSWpuWE1UOVNiWis3TnFUNmhoREZ4M1Mr?=
 =?utf-8?B?QS9KUHZkSjVWbXN6V0hyR2lnSHU3Ri9LSUl1RFJvTGt2bEhpeUlTd1ZubnBq?=
 =?utf-8?B?Z1ZCKzJVSlZ4MXhEdjNDUGxqZmNyQ2hIZ1YvUm16TzJJTVkwczF0ZS9mWFk0?=
 =?utf-8?B?WGhmUVAvS0ZHZGNRcWFsWjBXN1ZzRHZSbWVCeE5LaXR5aTZPMkRvckFpa0dw?=
 =?utf-8?B?NklsWWhZaENSQzA2NHpFeGdadVhoTTJPTFpla2FjbnJxbXduWmRmTUoxb3dt?=
 =?utf-8?B?eTRPd2IzTEdXb210YUgwNHA2THg0UHg5VmFJVDUyQ1RpRXB0ZTdmRWU0L1B5?=
 =?utf-8?B?V2kzQjI1VGw0enJRM2FNOEdFdzdhZHpJN1M1bmg1TjZrZVFXVkJqcVdTYUFR?=
 =?utf-8?B?NzBPckptWDlsWDUrVTM4bFF1bVFsUkFuQldDVDRIWEJCN01Lc3huY1YrdXE0?=
 =?utf-8?B?eFkrc09waTF4cnE4U290clo4cVg3d3hzeXU3Z1kwWUE0MExNTlhmMTJacHht?=
 =?utf-8?B?UjQwNW9ackNzVHVaYlgwcTBvMlYvYm91TTVCcm9tLzJGSjdNajJ5UmZKRFNs?=
 =?utf-8?B?emhsbWNCdVZBZEQ5Q3M0WGpkcnd4bXRQUHN6SndEV3hJRm9WMlNvY09WNHFD?=
 =?utf-8?B?RGhpWGo3Q05wRnMzWmdVRmpIb2xseUtQcWhaNTdmZGhLSzI2UTRVaENSb0gx?=
 =?utf-8?B?TCtFTkFHcEdGNkpIeVBIdUJEcU9UN01iQ3prcWQ1WFVFVnV6Y1NwWGdTRllv?=
 =?utf-8?B?K0FyY0VkQ1pVSjlmYWJFUTgwU0tuMjNyRW1UTUNsd1FncTYwWGdBaUZUWG9z?=
 =?utf-8?B?MmtKU1lkU2dXbk5UTW85V3pEa3JyVkI4MTg3TmprTHY1clFSRGlCRFdyYm5T?=
 =?utf-8?B?bHQrWTVPMWxnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524de6d5-8145-4f3e-0bd2-08da036f4911
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:56:13.0640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w4l5PMn3OP9EGiRKbHI2vEQdjo57YNEHhbtOAz82IDVQQy3zBMK+nw4B+57ida4U6G9R8svlgeEeGVqKppXcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4760
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 01:37:54PM +0100, Jan Beulich wrote:
> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> binaries"), arbitrary sections appearing without our linker script
> placing them explicitly can be a problem. Have the linker make us aware
> of such sections, so we would know that the script needs adjusting.
> 
> To deal with the resulting warnings:
> - Retain .note.* explicitly for ELF, and discard all of them (except the
>   earlier consumed .note.gnu.build-id) for PE/COFF.
> - Have explicit statements for .got, .plt, and alike and add assertions
>   that they're empty. No output sections will be created for these as
>   long as they remain empty (or else the assertions would cause early
>   failure anyway).
> - Collect all .rela.* into a single section, with again an assertion
>   added for the resulting section to be empty.
> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
>   .debug_macro, then as well (albeit more may need adding for full
>   coverage).

You might also want to add that LLVM ld requires explicit handling of
.symtab, .strtab and .shstrtab.

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

