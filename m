Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13E4AA7FB
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 10:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265947.459542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGHfL-0000M9-9A; Sat, 05 Feb 2022 09:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265947.459542; Sat, 05 Feb 2022 09:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGHfL-0000JJ-5m; Sat, 05 Feb 2022 09:47:35 +0000
Received: by outflank-mailman (input) for mailman id 265947;
 Sat, 05 Feb 2022 09:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acBu=SU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nGHfJ-0000JC-HJ
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 09:47:33 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b70d28-8668-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 10:47:31 +0100 (CET)
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
X-Inumbo-ID: a1b70d28-8668-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644054450;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=osbsXyjwKjznnBdprwpNhVW5NtFBisfsbqbChZrE9ac=;
  b=Y+BN+TXefmguzBZFq6zBJIt2Ifmvc/F+jEH0x6MmOKIbnc7mUGI0of3/
   9upzahJa/Q07sJQAnPeAe4W+F89IuPGVJy3MLWbqcen+liEmNWNUQLubI
   3DfZnnR7Wr2/QZAkBqeYhdP/PNb0kByUrOwbc9DO5Fobos+DeNT8YW8Uk
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rVg03h7mJbN6QyslJ+L5yjrufcTDfVFPflsaGWqCf5VxhTHRR3YochAhypqwMRFexDhzINSmWG
 2TykpVVegeJf42tM0KYrVdvStiB7gSQi/2rAUzxBq1wYrLcqTIEHX7KGhF+T3NMAXXpI5uGZ3j
 8TUnTDbqZCngpH2XL6h8hvYLrlPsTJFXU4JZwbmyYT10LWkvyYjC/XXEUGN5TeM6UIZoI/kFhz
 qGJeJGAPMmnyfMQC4ntbNvHBj7P3cZMv6zA4DOlJpYJELvwmBuMMGxapito6SjYbTJ6Gr4Afu/
 STVJj09IcLA9ORn+3pTiM7LG
X-SBRS: 5.1
X-MesageID: 63472751
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ky8Qga6sbIMvvP+rSi3z+QxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 jEeWGHVOq3YYWSmfNp3aNi3pBgP75OEnIRnTFA4pSE2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 /trpMC6WSYSB7TTntkPUBlbPCBYBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxs2ZoRQK+2i
 8wxNDpNNwTRckV2YkoHKosdvtaNh3P9fGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlajkDgNB9BAMtYD8R6L97jX4wW2B049G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzEJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdwIuGkhexkxbpZsldrVj
 Kn74145CHh7ZyPCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uZLAPyT9YelebzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRPdABRcylnWsyeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:SwjlzqOFxF3Bh8BcTv+jsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nApoV46faZslYssRIb+OxoWpPwJ080nKQdieN9UYtKNDOWwVdAR7sSiLcKrQeQeBEW39QtrZ
 uJLMNFY+EYd2IVsS9R2njCLz9a+ra6zJw=
X-IronPort-AV: E=Sophos;i="5.88,345,1635220800"; 
   d="scan'208";a="63472751"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDcv2xeNMntv10hFgxNp/TLCX8OthqM/HyXK0ukVaPlSzJenVcExj058dIODcQKMNRlZdTIHj7Pb/AA3omuON4oC0cUXYfFjAiR6epcYtipzJgHqQQHhfqvD49fc02YKUlqG9Yjyw1tWRwLetrfSmmcCLom7jFIRkKNoUvs2kicrk7csASIbpImg8/4y6Y17pONjAq7sUbxwd4q/bBJdSblXp3qj4RAiaOZInDZJqg34Loso8sK/TdsNK1kdsW+EIzWCmdzvqrzvqck6Lq5qntn9FrnOBVkJ9TYewxTKLzGOGvaUdnpPQwc5fG58GtYazwfZ5vdowwPctD8IjlNh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcG19WZEEaInoxE72n0JRMdTZ489sXc4DheM9r8Lovs=;
 b=FDLOJxd8w+eEttvIMYc+cQkcO5Fkl13n7a+q6haA1bWvQ/DfG9BKz5j/t75tk2HTx2SfwtI40kcbjCU7evyRynLGwwl08EkdyiVAuLXyp8S3nzp7S5nKaM7ckiReS8D+9kRNyBeeKAHlTkp0u6X9qm9Y5LfA7r/J3Ifw/oOLlYVca6m7+OfBAyOP9rud/nbNgkvog2MJNlrLYYBiVR6HzjVTsIfZBYCavCbbgYygW7m3gpZNp4UkJBymG12gMBGdyrvl5zx1QYtTGKuP0gGCRdBzJO1a4Ltgg3p7IVVbYAQpMJTl8EWcI/7aGMxV4AAaTleUmGlRA7j9vmBJYdMDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcG19WZEEaInoxE72n0JRMdTZ489sXc4DheM9r8Lovs=;
 b=BBJ2+gDx+lcsD9h0VjRrPT4wcdgalG0uV0GOcYaYXmRz84SVPm7M8FYnXF/XylM32aEwwyNeaahZvz6xSvwM1bAEvVgaAviU0OrpjPgHnl81wkg2gzMPDeP+hBLGo7PoshRHPGfpbria83hp6TOkVxWpH2ifYyRL+VWo0DoCKC0=
Date: Sat, 5 Feb 2022 10:47:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: Fix boot on systems where HVM isn't available
Message-ID: <Yf5HpzveBK+Ho3Nt@Air-de-Roger>
References: <20220204173405.22759-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220204173405.22759-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0511.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e60372-a497-4c2f-0ad9-08d9e88c835e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6454:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB64542CB1F3A3D723D8DF6BB38F2A9@SJ0PR03MB6454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJGjWME1tKsOtIGSnMnTa2BuMGDZ6+qdAaKK/M2Tkn17NfV3YIEsOUnENJ2faWpSlxsmJ3W9EMLER/EHgrnK9p/2lsgzSYEkvQ8KYFA1x7DR6od3Nb+/TCzT2YknFR1NbfdqPWO3bF+SWix9Oy0R/Psyt6s/EJzIW9Dzilo8n6orWv7saUEYJ00DkmqEI8tP9XMJ09AlRoQgWjoNdxK9E3KAMczQQROhhst0BSHN9A2oAPwlpNi2nWm5eZpBGEmjAI85P1+x/5Hu9YQeVFXQa1MFFOfEqQTdiBJrVU2/cWeLjmXVscPSOLibiTLGQeoYBsz0bOI2vL8ThH8xQr4TwCYNbrQAop1+hU3u9B3GQ3nUNOu4i7zSEOZ67Gz9iRVultkEFV8Pytu32ib99AbOHzYq0pguKd43dZOjXLZ2CtmIda92gOJJfO/6neEQcxzTLOxYbPwd64G8wsRprw+bpgh2bziY0atWFY4q88dfbfA8pSxe7+I0fsJg6oU75SBWA/PqWmtM3tJsoGibuDPL5dqgTOLDD5bmEwfUy8JbYLy5poOQ1XJIjKIHsfVEFtDDTisPHvWHgogBBaGGHh10fwrpscPzUXubtMRG2hveJeHBoeIUgRYov5rUWjgosawZQDhPCluXbc59MlkicqFQVDAaNYRrbAjxY3NfFwM7bEgoCQlTo9ZWDZz3j3SHuZ14za7Cays80baeRAAas/02hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(82960400001)(6666004)(2906002)(508600001)(6486002)(85182001)(5660300002)(4326008)(8936002)(186003)(8676002)(26005)(316002)(66476007)(66556008)(66946007)(6636002)(6862004)(54906003)(38100700002)(86362001)(6512007)(9686003)(6506007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWhZQm9CemQ5WkZXbldLazd2RnlBUnNZQmk2MHk0d2J3SzZ5MllQb1ZhSCs3?=
 =?utf-8?B?UzZTMWNZQTFMUVVVaWk2RzdlTmFKUUZmeWQ2YUQzQjdhMFd1dURLbnlZa0Nl?=
 =?utf-8?B?NERaUWNEVi9FSVhVdHh3SGtJWGY2TExLUWlFeGRBOWFBTXoxQVhaek53QVZT?=
 =?utf-8?B?b3FBTTUwdlpUeDhEQy9ONGs2azVBUUtPYVpBaHlpc3JaZDh4N0JTT0FjZlF3?=
 =?utf-8?B?NkNRWEVHTHo5aG44ZitNNEJZZ0FSUDJIVnYrUkswbGJxOXkrSzlEUS82S1RP?=
 =?utf-8?B?dUIxZGxNTWt0bkJjQ2krVXJhZzk0aWh5UDdDNUZaNXowOW9GL2hwSnVsamQv?=
 =?utf-8?B?MVAwU2UweUExbDV2WWp2ejU0bnBLcWxmSDROOFRCWk9zK055WTZWdmpydE9P?=
 =?utf-8?B?RnFDcjc5MStpSmhadklVVElsN0xUcTJDKzM5RG9CSXVnYTZiVHVaSkRLWUlG?=
 =?utf-8?B?VnV2S28zd2loQ2t1NjF1UnRLeVZNNEJkQmRHc0UwRHowSUd3V1o4c1J6bkc3?=
 =?utf-8?B?L1Y4T3BTNDMxMzFPTE1qdFFITHdjSmNXcmFZZXlXSFg4OXd3RFR0RXB2Z2d4?=
 =?utf-8?B?bnJmNDlQSmVOek9pbVBDM1pwSVhXTEJNZnVuVGllWGtsR044TC9KNFlzMXJC?=
 =?utf-8?B?RkQyTUY3ZVF2WWcxRmRpVFE5KzE0bjJNanVoclkxc2d1RG1EVmNPb3lvNmZ3?=
 =?utf-8?B?TjExRCt0V3VjRUtxOVhoT0plZWg5VnBPYXRWd0trQmdhNElaUlE5ZkJMc09P?=
 =?utf-8?B?eHIrb3hFZnlheG5sMmxxMmVoblllSkpRZUpHcG9iQk16UHd0UmNnQ3ZVWnNk?=
 =?utf-8?B?Z3ovUUFLNy9VOHA5Q0F0ZWJRUUN2dWpGNDVIYjRobG5UYndJMC9qVjgzMTdB?=
 =?utf-8?B?WHBjWU81QzFlUStxNVQybzRVRlFyTlBvcmQyMlQxOWxvSVpsUlZ4TjlIN0lp?=
 =?utf-8?B?S0UzdUtOWTdsa2VNR3ltOTRlVlFwNFh6ZnFUR09wWm5HUXhsTFFDZS9YM29L?=
 =?utf-8?B?SmcwUTBvN2o4UUg2dm8wVmFRYjg2L2JMeDFlY3Rjc3hZVlJkczVkbnNVVGJT?=
 =?utf-8?B?TitUblNrQXc3MkZWK1FmU1ZXa1B1MzJWVFFEMHMyaUFuNVJkQWx2ZzAzaE1V?=
 =?utf-8?B?SkdEMzF3WExlVW9sYU5RWGY5a0RmRFI4ZFpQZGN2WWxMTUx2Ri8wTjdlUm0x?=
 =?utf-8?B?YWtsWUlCbkRRWmpJSzFMV2xVR3BnOXhTekc4L2pScy9IbzREbVdKVzMrTU1o?=
 =?utf-8?B?RWN5UW1JR3k3YUQySGZzTTIwOVo0V0E2dnNBRDZ3Q21XYzlOOWZKdExycmQw?=
 =?utf-8?B?bEdkRFBqUDBsRDJCUDY1TTVZNmtZUmZldkxNMEVxWVdXa3hQT1U1QkJLbTVz?=
 =?utf-8?B?V1lGa1RGUm1hYmRaWXdDQk5KZWVDdmpYSGFFRS9IYndlREd6OTUxbUdUdlY5?=
 =?utf-8?B?dGF1dGNYM1pYOTJZNnJnZ0VyNjlEdTVDSkF3MWdoNXdNQ3A5ZUVmbCtjNmpJ?=
 =?utf-8?B?a2gyQWxyZ1ZrRCtvQWZVWGlFNG1OdHZlSXZPRGlXWm12eGlGQzQrMlZnN0pZ?=
 =?utf-8?B?MzJ1M0RsRk1US1RwdFVzeHFvbTFxWWxzQ3lHVmNEcGt2UWY4WFlqejFOUUl2?=
 =?utf-8?B?YkMzWS9MamdHdTNGMnBEUWlQSHJaZWxKVm9taFBld0k5bVFlbXhxL0h5R2Jo?=
 =?utf-8?B?bEFqWW1NWi9udjhKT2RIbmpiaUlaRmdQRnBCZWxwWUFXZmlHNXI5cU9aM2tj?=
 =?utf-8?B?ZmhpOXBFdEpSbUYxbHV0VGJyZU1xQVVDL1RUZjZpNDJPdGNsU1BlNG1LcVZw?=
 =?utf-8?B?T1YweDhNWmM2SkVwUFpKb1l5ZkMxWWRDdHJJSzJmb0I2MUNFNzh3by9PcFpS?=
 =?utf-8?B?U0tJSmo4RGw2dzEzZ25pZWY2b3pLWDNsN09mUXFrb2V0SGplM1pZTWxVTEh5?=
 =?utf-8?B?S0NvYnJQU1FSclo3V295ZzhYYWQxVzF0ZGQ4bDhnbG5VbTRBTVlVU0J6cys5?=
 =?utf-8?B?MVoxaUE4U3RtV3ozeUpJYlZXNVk4ZzhOWnBXUjVFVVlkcW1tMm8vRFB3U2pq?=
 =?utf-8?B?Y2ZMNXRKbEdxVVAraENHSUwweDZwTHBWMTYxUkpNOXJCVTNIYXZxNmhkeFVG?=
 =?utf-8?B?ajExZWgxUkZhQlpRWFN1Qm9PZWtnRlhVNWhkN0xsVzBLR0UyZ3pwSTh0SEJN?=
 =?utf-8?Q?UWBoL9PHwu8jFfgsQQjyr5U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e60372-a497-4c2f-0ad9-08d9e88c835e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 09:47:24.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XGToyr+mn2c++c25P/rWz80FA416ICaIijsJJqiTJq8O6aUKqI01+qMih+S+akiA9D+hphX8DvGEpf0zX6F3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6454
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 05:34:05PM +0000, Andrew Cooper wrote:
> c/s 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocations to
> alt-call") went too far with dropping NULL function pointer checks.
> 
> smp_callin() calls hvm_cpu_up() unconditionally.  When the platform doesn't
> support HVM, hvm_enable() exits without filling in hvm_funcs, after which the
> altcall pass nukes the (now unconditional) indirect call, causing:
> 
>   (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=y  Not tainted ]----
>   (XEN) CPU:    1
>   (XEN) RIP:    e008:[<ffff82d04034bef5>] start_secondary+0x393/0x3b7
>   (XEN) RFLAGS: 0000000000010086   CONTEXT: hypervisor
>   ...
>   (XEN) Xen code around <ffff82d04034bef5> (start_secondary+0x393/0x3b7):
>   (XEN)  ff ff 8b 05 1b 84 17 00 <0f> 0b 0f ff ff 90 89 c3 85 c0 0f 84 db fe ff ff
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04034bef5>] R start_secondary+0x393/0x3b7
>   (XEN)    [<ffff82d0402000e2>] F __high_start+0x42/0x60
> 
> To make matters worse, __stop_this_cpu() calls hvm_cpu_down() unconditionally
> too, so what happen next is:
> 
>   (XEN) ----[ Xen-4.17.0-10.18-d  x86_64  debug=y  Not tainted ]----
>   (XEN) CPU:    0
>   (XEN) RIP:    e008:[<ffff82d04034ab02>] __stop_this_cpu+0x12/0x3c
>   (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
>   ...
>   (XEN) Xen code around <ffff82d04034ab02> (__stop_this_cpu+0x12/0x3c):
>   (XEN)  48 89 e5 e8 8a 1d fd ff <0f> 0b 0f ff ff 90 0f 06 db e3 48 89 e0 48 0d ff
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04034ab02>] R __stop_this_cpu+0x12/0x3c
>   (XEN)    [<ffff82d04034ac15>] F smp_send_stop+0xdd/0xf8
>   (XEN)    [<ffff82d04034a229>] F machine_restart+0xa2/0x298
>   (XEN)    [<ffff82d04034a42a>] F arch/x86/shutdown.c#__machine_restart+0xb/0x11
>   (XEN)    [<ffff82d04022fd15>] F smp_call_function_interrupt+0xbf/0xea
>   (XEN)    [<ffff82d04034acc6>] F call_function_interrupt+0x35/0x37
>   (XEN)    [<ffff82d040331a70>] F do_IRQ+0xa3/0x6b5
>   (XEN)    [<ffff82d04039482a>] F common_interrupt+0x10a/0x120
>   (XEN)    [<ffff82d04031f649>] F __udelay+0x3a/0x51
>   (XEN)    [<ffff82d04034d5fb>] F __cpu_up+0x48f/0x734
>   (XEN)    [<ffff82d040203c2b>] F cpu_up+0x7d/0xde
>   (XEN)    [<ffff82d0404543d3>] F __start_xen+0x200b/0x2618
>   (XEN)    [<ffff82d0402000ef>] F __high_start+0x4f/0x60
> 
> which recurses until hitting a stack overflow.  The #DF handler, which resets
> its stack on each invocation, loops indefinitely.
> 
> Reinstate the NULL function pointer checks for hvm_cpu_{up,down}().
> 
> Fixes: 27a63cdac388 ("x86/HVM: convert remaining hvm_funcs hook invocations to alt-call")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> RFC.  Not tested yet on the imacted hardware.  It's a Xeon PHI with another
> werid thing in need of debugging.  First boot is fine, while second
> boot (loading microcode this time) has a problem with vmx.
> 
> I wonder if we want to modify the callers to check for HVM being enabled,
> rather than leaving the NULL pointer checks in a position where they're liable
> to be reaped again.

What about adding a couple of comments to hvm_cpu_{up,down} to note
they are called unconditionally regardless of whether HVM is present
or not?

Thanks, Roger.

