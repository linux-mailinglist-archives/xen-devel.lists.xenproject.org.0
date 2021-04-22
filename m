Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BE36800E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115345.219984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZY7E-0003A9-UL; Thu, 22 Apr 2021 12:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115345.219984; Thu, 22 Apr 2021 12:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZY7E-00039k-R3; Thu, 22 Apr 2021 12:07:28 +0000
Received: by outflank-mailman (input) for mailman id 115345;
 Thu, 22 Apr 2021 12:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZY7D-00039c-7f
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:07:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3974cd88-8b14-4c86-a065-ae78166c08be;
 Thu, 22 Apr 2021 12:07:26 +0000 (UTC)
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
X-Inumbo-ID: 3974cd88-8b14-4c86-a065-ae78166c08be
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619093245;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=P9YORVNQrthxx0ZeB5Ly37D57AWXQcctB9yFbjDUv50=;
  b=C+7X9AXTzlV9qoEHaRRhfEpf+yINVTXECx+EJa67NQVYD9/mfQAwQf6J
   oCImIKVXnlBJ8VFfzeTPNm/rpz4BOuT5+87r3/9vB1/Hl7vDPoy2Np1Sx
   bFOxAfAWcW4rW/CVuM8NqU+WJNrzoCZN1M41E32vJ8RuKO0mC17kxywfd
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: drYxEWN5Th6UBK2drMST3sAxYhuWaui/N4yKGv47Fs1remTQoEqgPK8PmHoHwb11Tww09aE3w8
 RJWhV0bsO/EIqmzCpTlWHpVjMp5HrRWCqXAI25uyFOZQrbhMgW6r6z6sobycJDUdGM+iKAz2kd
 XiluVV53Nl+dsAKJKb8f4iAX2Wu6baZzwOFm1ZGJS3ppBGcaKs6dMcvfagGHrVAEAtjb7y4IIz
 ijtWeG0LMBZc7ROvnjFIePZKAA+glFE7omVWvWJM4uxYohtQCC8dVtAJw8DvdrpW+PKN7kFh4B
 aqE=
X-SBRS: 5.2
X-MesageID: 43661946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NQNdJa7VIy9ick6+1QPXwXiEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO5ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up8pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfrWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIYwok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1yQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ3Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTemegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71I7l8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTvQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 CPXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvPTO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiVmhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3ax8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcrNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/grmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfJ4YECBzaEIm7m5l8/7HX4rMCB+yf+UrxivxDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L+PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PHA4X4BkkTktjIo+zyi0ROjWmyse4iRjyAAisEXs1Iig6HrcBmdcP2Ti88xrYQU=
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="43661946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb44G21mRuhIP1eibXrVBaaR8OmZrwUyIPIZcewmtYS3EELaDyS7rjT1I7I4a8CmrOgb1eQUpaSWmRog/7TOdRVsvE6GEcYVyCvXETWpqKDyMNnxzNKkcr06sTro3A5jhKUy4XXB7gZCCuA1iYMP6Tf/V9H+oqJ/LLfS2s4iObuV/3CilSMOx5wYqRKYguTOGdB/8Eho1z6M0J4d9DASLRm2c/v/q2nQScFkHsgtEcoy0A+cwVmwUemT7JjXulInF1yy0rOfeK9R4WKQ7TSabCg7HCzd4g2xtNE6HfPe1O/ObyBmcCkN+XJwblOF+bUrFgF+ZbBzfMMk07jqGlxpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcxh3nJGwLfdM2OQFTxea2MPgv/IpA1AzKeJIVmPoSI=;
 b=Vgo7Kl0QFIYePfYTCzLi+3nWKqceBDzOBjyc/5apUTBDGh9jMH1wbjBMvmRCwKMfZlMM4wTztL78q/wx63/KZZHhoSQKSQ3OkfmAOuGpzkVoLyiEx2agewINHLDFCFFYgFqdOPPGMjByL4piC/S+owjvTRdPLb6l8hL/A6gKdOkqSBJLEgeNLCKaG8tdL25HjX3vjp08pkwJT3DVfVTlVdXhLYDD0R3pO36CrzZ7ZsQbcYr0mex4XtFtcRA0lZYUMOmwdSBCWd5EXq/k5nPblSW94Spk21nXNqOrXRnAQY4NLydYgnhQURwdUS753eL4b70Vg2GYd44ciMbSS+j2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcxh3nJGwLfdM2OQFTxea2MPgv/IpA1AzKeJIVmPoSI=;
 b=k8jAhE0ltJqNhnvER+maIpe21483h2TqdavSpi1skzj+6E3YfwwYoxeX7IvtY2a7ji7lmuYLWcxZyABdI9LPcJAgfTvIMwKsL5vCYEo5ELw9hlKCRUGPQwiDUz0MYmlPtojCFxsIpX7wfv95H1PD7g9Qnd+H3GcJvC2er7i96hU=
Date: Thu, 22 Apr 2021 14:07:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIFm8tabpaLVsbfG@Air-de-Roger>
References: <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
 <YIFFBEhPYSYQhycf@Air-de-Roger>
 <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
 <YIFRQu/CLEId2uMi@Air-de-Roger>
 <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
 <YIFWUnQ6d4Pk7nf4@Air-de-Roger>
 <320d9aca-1f72-f357-d303-487a67f39655@suse.com>
 <YIFgCoyQaZefKZvi@Air-de-Roger>
 <8a25c636-d20c-f45f-0901-314b22b70bfe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a25c636-d20c-f45f-0901-314b22b70bfe@suse.com>
X-ClientProxiedBy: MR2P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de3638c5-16e8-4c56-931c-08d905872ea4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB528942451EB5DA9F6EA3133A8F469@DM6PR03MB5289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It1LAn2tllKUmyTz1Cgr5FkmMTczfjqQNR1Ormz4AVgV/c0wxq/IgH56vNnqmSrc6/rV26IWhtlr8AjNFkTWBP/JQ/UHXd0cDaONMECmCCMSTCDPauPtlOkTbRh4R+Dgg73+viVRZT0RFA5CPPWRn+Wcf7J/9aMcKcN5JqfKYZD3SWCTYg6F8jy7y2vxZ1WHrnFRj9LsRsD2Q8shuH2W0nSvB0KgBm3C7SWnqnT0aGPaTmUDoCAuaTBoHEEX5irlag2rq9fAIPGwfJetRuhENi+IRjCXDp45iQilWK+VdT2YzJ8QUwr6+yt8D0p6c2KcknSTCNbE9XBM/CSivjt2lyeyvbwHYpCgosSJXNIhhk/RxuVBMusU4mdKWObhXjXJf7zSsKwKjg1FLyYHs56cS0Uuuo6G0VfJrgZF/+Erxrt4EXhHAYg3oDdqPeR8OvOcQJIYTvNAx568haTs1O+qG7FEg1Ku3Pr1/isLfB+fwgNrL5IFbe77pjIh9SNQPzfHz/xTNX8HkjYvULDdMnX522n0NS1i829Stx0rycIl0hWF+oC6dRAjN3BS3AUaD0PDoIo8gg7g/sMVnFkLJ+ptd5IBE5FYWZGgTAiWtzlA6HU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(66476007)(54906003)(6486002)(66556008)(86362001)(8676002)(85182001)(4326008)(5660300002)(53546011)(6496006)(9686003)(2906002)(956004)(6916009)(316002)(66946007)(186003)(16526019)(478600001)(33716001)(26005)(6666004)(38100700002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3ZDZVBaY1VhdWxacnBOcStvK2dtSEtwNDlBYjF3Zm1kMTljSllrcEJ2NUxV?=
 =?utf-8?B?Sjd5dkdaWk1PZXdVTUlzdXZISVNENCtPWkNZcnMwZVRlVE11M2tQd09ORlFB?=
 =?utf-8?B?UXRMb3VzQVNrR1ZEcXdhek9pdkQ2bnJBd2xjZnFBcVM0YXFrQkNFSGpqTzVJ?=
 =?utf-8?B?ejRuYWxxM1pEVllEUm9nOVJmWkpYM0FSVyt3VmRodmh2Njg4OGhiVG1JaE5I?=
 =?utf-8?B?MExUVmcyUitxTDlmWXlERUtIRTdlVm13VTJ4RGRJTzJLbXVJckF6L3ZwK1M2?=
 =?utf-8?B?eHgrcEFFS1RISmpaRjJyeXM0biszWlVaZXhERU1yb09DWkhsQjRMbVU1Qmx4?=
 =?utf-8?B?c0lmSm9pcDYxV2QrUXFzR29YOVBQdXJjU3JFcVJsTExDb09Rb0YxZjNxdUpU?=
 =?utf-8?B?ZXNSaXQzR1FOdU9WNHpsQjVBQW13QXAvMGRiQjVSOEY1TEhkNTEwT1A0VWxC?=
 =?utf-8?B?emdBdVlwTldXSHZQVkdINDh6SVpMY3g0ZU4zb0RhSmhoK1RoRUFCK29zY3Rk?=
 =?utf-8?B?QzRkMC80NjJxV29aemNzNXlySUphN1BwbHJqdHBsNnFTTUFYdTRIem9uSVJC?=
 =?utf-8?B?TGkxV1BkZHJwVE9EZmhaK2lXMHR1ajVlbmxiVnJPRzRzUnd1UVhGOWozeThZ?=
 =?utf-8?B?Q0w2WkJzL2xiRUZXdXdCbWhLQkU3d1pVUnFSTE0xTkxSV2I3TExMQ2JRS0Iy?=
 =?utf-8?B?OTg4WDdIaXk1R3FQQ0R5UFJqeGtxMTdnNDhlMzF4R2ZBQzNrV0c0ajA0UnVJ?=
 =?utf-8?B?RG94LzZPS0pBUlNqSDZESFdmUDRCZzBLalVWVmNucVdTSEd5ZzRRdldldDV5?=
 =?utf-8?B?MGtoK1NZcXZBWW1pN1pPRGtNSkhDQXhsL05SL0pjRC9mTURUNzZudGJGQVRk?=
 =?utf-8?B?WHBYSnFKTi8vNDJUUnpKb0wzUmlFdlhqTldMNFY4TThMd3Ryb1g1Um0wdStU?=
 =?utf-8?B?b2lHZDh5Z1JFckNiNkVhM0RmU09pWlRROHhjWm4xSEdMb1VNNGdOd3ltNUFx?=
 =?utf-8?B?UkdzQnVyUDBveE1QS2N4cTJTa3RXWTQ0eDRhd2ZwelpPSUxJMExQcmZvVkM3?=
 =?utf-8?B?d2d4Ym12UllwcGROWGZnUitTWXM5NDJVSUFqZjJFeG9SSDhMSzRSQllIRlc3?=
 =?utf-8?B?V3hVTDVVMEdPSzQ2SEZSajY4SXNmb0hDYWFhRTNsTnJtTS9MNnZtVVpJUGNY?=
 =?utf-8?B?dG9BR3hvVnVqQUNGLyt3c3p2eDkwQXF6RnpaQTNaUC9pNE9sSkpDOWdnWUJP?=
 =?utf-8?B?MEtXN2VHR0xxUDZxSERyeTZFR2crcXQ1a29DN3RVYTFkd0wzV2RwRzFRWnJP?=
 =?utf-8?B?N214cXZCekhhaDM5d2Z3cmJqeFR1SGltMG50TFhuNUNqQ2kyMnBLSjcyazc0?=
 =?utf-8?B?ZVNkaGszWjcyMXZYUWgvUXg2a0tEeVEyWEQybjQzby9PRFdnQ2htREROdWo3?=
 =?utf-8?B?MDlpR2NQZzluZjByRG9rR2ExUG5qMHg3Z3JlNWhDYnhIS3FjZUVBSmhBMS9q?=
 =?utf-8?B?TEVGcTMyQjIzV21SZ0paTkczWTVraVFWMThVaDJzbFBKQk54TUxtN0FGZm82?=
 =?utf-8?B?MFh5M0pmaHlIZTJPZE5CRDhwc045Q1UrTkhkdmpwZG1uamJIQ3c2Wk1LTWJq?=
 =?utf-8?B?R2FOSzJ2OXQxR2lpUVFKbFVYM0NMSTVUNE1pMy93K3haR0lzaTUzNmdURE9y?=
 =?utf-8?B?Nmt1Rk5CeGJjdlZCRlpqT1lRMHNwVW9LZWIzL0NSTGdPd1ZTdTdhS1B5V3Jv?=
 =?utf-8?Q?cbIOTV7tanUcm0iUc7oTTjfH/MEmh94/h5Wh0SZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de3638c5-16e8-4c56-931c-08d905872ea4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 12:07:21.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXQ1lfmzoXXhfGQmNDkqfJ6Mq5EGBfHY/3o7dSr6VleXUdKkq8ez0jghwnaJaeejFYcTlkptK70OX2ItywhPVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 01:42:45PM +0200, Jan Beulich wrote:
> On 22.04.2021 13:37, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 01:05:23PM +0200, Jan Beulich wrote:
> >> On 22.04.2021 12:56, Roger Pau Monné wrote:
> >>> On Thu, Apr 22, 2021 at 12:48:36PM +0200, Jan Beulich wrote:
> >>>> On 22.04.2021 12:34, Roger Pau Monné wrote:
> >>>>> On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
> >>>>>> On 22.04.2021 11:42, Roger Pau Monné wrote:
> >>>>>>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
> >>>>>>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
> >>>>>>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >>>>>>>>>  
> >>>>>>>>>      return false;
> >>>>>>>>>  }
> >>>>>>>>> +
> >>>>>>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> >>>>>>>>> +{
> >>>>>>>>> +    uint64_t val = val1 & val2;;
> >>>>>>>>
> >>>>>>>> For arbitrary MSRs this isn't going to do any good. If only very
> >>>>>>>> specific MSRs are assumed to make it here, I think this wants
> >>>>>>>> commenting on.
> >>>>>>>
> >>>>>>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
> >>>>>>> features"
> >>>>>>
> >>>>>> How does such a comment help? I.e. how does the caller tell which MSRs
> >>>>>> to pass here and which to deal with anyother way?
> >>>>>
> >>>>> All MSRs should be passed to level_msr, but it's handling logic would
> >>>>> need to be expanded to support MSRs that are not feature bitmaps.
> >>>>>
> >>>>> It might be best to restore the previous switch and handle each MSR
> >>>>> specifically?
> >>>>
> >>>> I think so, yes. We need to be very careful with what a possible
> >>>> default case does there, though.
> >>>
> >>> Maybe it would be better to handle level_msr in a way similar to
> >>> level_leaf: return true/false to notice whether the MSR should be
> >>> added to the resulting compatible policy?
> >>>
> >>> And then make the default case in level_msr just return false in order
> >>> to prevent adding MSRs not properly leveled to the policy?
> >>
> >> I'm afraid I'm not clear about the implications. What again is the
> >> (planned?) final effect of an MSR not getting added there?
> > 
> > Adding the MSR with a 0 value will zero out any previous value on the
> > 'out' policy, while not adding it would leave the previous value
> > there given the current code in xc_cpu_policy_calc_compatible added by
> > this patch.
> > 
> > I would expect callers of xc_cpu_policy_calc_compatible to pass a
> > zeroed 'out' policy, so I think the end result should be the same.
> 
> But we're not talking about actual MSR values here, as this is all
> about policy. So in the end we'll have to see how things need to
> be once we have the first non-feature-flag-like entries there. It
> feels as if simply zeroing can't be generally the right thing in
> such a case. It may e.g. be that min() is wanted instead.

Maybe level_msr should return an error for MSRs not explicitly
handled, that's propagated to the caller of
xc_cpu_policy_calc_compatible.

That way addition of new MSRs are not likely to miss adding the
required handling in level_msr?

Thanks, Roger.

