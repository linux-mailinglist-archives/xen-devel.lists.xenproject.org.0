Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1F6C7FE5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 15:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514330.796454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfiQI-00031W-Sj; Fri, 24 Mar 2023 14:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514330.796454; Fri, 24 Mar 2023 14:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfiQI-0002ya-Ok; Fri, 24 Mar 2023 14:29:42 +0000
Received: by outflank-mailman (input) for mailman id 514330;
 Fri, 24 Mar 2023 14:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfiQG-0002yT-My
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 14:29:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c88b349-ca50-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 15:29:37 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 10:29:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5691.namprd03.prod.outlook.com (2603:10b6:806:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 14:29:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 14:29:29 +0000
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
X-Inumbo-ID: 4c88b349-ca50-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679668177;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RWWrS74WSOQUA1xT610YvJwS5RqChROnokLmJrPMQ1I=;
  b=icPFLWCgbNH5L7yGr6Fli3z8T3Pdzl7L0sc6BEaXhsLAeAaoquH+Bmi0
   gtvhuxeYWqaanxtIIkhWi6crZpF8s9T41oSE/tG8ZTM1GyUTXt4aiw67d
   6e8R9vQkSvLtwrR8kQWGoxq20FfKzw9Z1Qqv+xWubrM4nkbLZCIh9Ss2G
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 102208912
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RaCYlam//6uHycmJqRq1oxvo5gwSJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaUGvXaf+KMTP8fNB0aI6x8kwF7JTSnNBgTQQ9+SBgHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 flBcTkkKQGsvvir0pO6E7lKoZwfIta+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOWF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTufgpq8z2jV/wEQiCS0bWnK5psX+i3G0e8oAC
 RAm/i4h+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLoo4piQnUZs1+C6PzhdrwcRnOx
 DSNoDk7lq8kp8cB3KWm/njKmzup4JPOS2Yd7AjNQnis6A8/YYe/fpGp8nDS9/MGJ4GcJnGRs
 X5Bl8WA4eQmCZCWiDfLUOgLBKuu5fuOLHvbm1EHInU63zGk+nrmeJ8K5jh7fR1tKpxcJWKvZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBJEfX0XU
 XtDTfuRMA==
IronPort-HdrOrdr: A9a23:MK6VHqFc7Fdxv5FepLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="102208912"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WogrMn02h3T+8wdBe98HcUMa+lhcoSS+KGnEg+MycnfIJNtA4tTtAenH4pN0sF6PsZ/+7nttDEMUBu66ap1J84UKcMF+EI13g5zmaH/DTArGpHtiiiwPK5uIgj+44w2tqXwCiIvAyUXAe7c2g+9PxxAk5x+HOwAZQIF3LwzRUD3fsmOrIen6WzKxLEM3bSsLTfYV4Ke09sE/de9Tdj+dz7Pukeg5IhJJDbsxwrv0J1BGBTf6f/5nWqjU1zjZtc78NoXjk7I/4XecNOS1LG2ynkA+aInlDjQ5y0fD79qLoULxtAO4FiajlHWycaSSEjdMQ+XEi8kSY6uxCfujY27MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWWrS74WSOQUA1xT610YvJwS5RqChROnokLmJrPMQ1I=;
 b=m6loFVy4S8kS4WbGchMYgPPunZGwFrlEcdU5biOlUfNHThc8CdhxwaVF53PvlQy30loPjpAGfTQZt4DIS7x8GS7FmqSAnMU1v0HfDplM/nthod7pDWCFjBjsXC7hgeyKKd+xFmMRkyf3/aduUXAgceND4agT0oONbxfYGywBd6KFtcWy0v+snca03HOwqVediVX2/s3TiPdkZTXmwhCW35e/b5qcsIH3Uj1a/sT2HcsyG2OAbHaWdbbdUqe61p3839jksjiHBGEcw4864WjPKx/r0KfukTy4MQ5kH2p81UQtyYFGpnYMhvvQEH8gDcHCIkaaTpSIXDtYrcq+BKNFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWWrS74WSOQUA1xT610YvJwS5RqChROnokLmJrPMQ1I=;
 b=vMPtu1hY3F7ACCRF+u1//JfqdkKDeo45GKb5xSVeRu4LA2gxfW5hET1XfeQs1+BEuhELvcimeXRTKUXwt+plAQgNy3Zf4lFpCZt2VdPAD4Ig7/zt7fm0uj+iYvYth3o7+N5VynJmUxJ6lLomlVwHgCYI9fSRFmvBMvCIAFU11h4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed1cb46d-ae56-d610-81b1-fed87fe6d5d7@citrix.com>
Date: Fri, 24 Mar 2023 14:29:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425123717.18876-1-andrew.cooper3@citrix.com>
 <704c371f-ae25-e2eb-dd90-67493a16fe1b@suse.com>
In-Reply-To: <704c371f-ae25-e2eb-dd90-67493a16fe1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 91301cd6-da58-41b1-e89c-08db2c742cff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0QfIce39If2cTQVzU17gW4AFNJNNH6u2z1JUPDv0V5wgUiIf30C7+NeK8nMNoqLXsJitlpQW5INjwpQGfjaEOlFEzSPgjXRx78O920UJOkanBl6rnzoQwiKpQZ3MrJ8BCqCCFM58vcakfHISrsl3aQ6l9vLkam119pADynkbERXIXWAWI8oezhP36Nv/2ajIGGbFQcZVq4Tz68WOZOHrjt+2YCzUHto/bvPIfTmkkkQXBa4qzIIWLCrP2LeZkRZierTvLI/dYYGZrpdokYeFr1xrWuOpAyKjReZKY+BGQ3eEtriTs0D8Dy5yjsI/4epVw7CjCiZ58vqU2WipycZZKFCFxpfEn2Rymc1PMjqKYpfKKlYYv50vJRqy1T7cdgyZdeos/4M24KtkxoxCOI8Bp0O53sJNCgo7IUs2dRyczPUr0zkRvJRT8v6awdAjA9ZWEIjsUV21fBJBckDZuP30O89xO9Azi4sz8CTQaXJS/P3cItf390A4rLtF88SAM11Tq+CG6xfzmvwjxgh2MRl8Gltpc6LI/JpCDXykw6VXUCQJyowIIdUpv7Q/aT1QVcHuohxkGXX0wnbXW3yM2wypLKX/Xqnc2CsYigTo8lqrQKTfsA1abYNcsozU6R25RvnXdDolexR8sWGWje/pIyZgNPnJRjsIyA5IuQxElKmzM6LUgNUTdTHnT1wElKnyaY9ivzZXTEXpXm+8Gt0hNl7lIiavVrR+A009YBBjHhZNalw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199018)(31686004)(41300700001)(4326008)(8676002)(5660300002)(6916009)(7416002)(2906002)(66476007)(36756003)(82960400001)(31696002)(86362001)(38100700002)(6666004)(6486002)(316002)(478600001)(83380400001)(8936002)(66556008)(54906003)(26005)(66946007)(6512007)(6506007)(2616005)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L04xaURaWnNISnlSdGRLcFVXNXYzQm1aUUpIZUNnNFo4MTdmTmlyZW9BZVRP?=
 =?utf-8?B?aHlUMlgrN1hrS0dvR1pRN3A2M01aRjJrdFBLQVNieEhOc1Y1bVUvcHg4aGdt?=
 =?utf-8?B?RXBaMFF5ak1TUzVVOW5HUGtCTWJWcnkyejBOYTQ2MVFkTWo3a29PSWk3dG9I?=
 =?utf-8?B?ZDBZOUJWNXJBSGpOMFBsS2xlSkI2V3lWVlA0bnJpZGpMZmlIMjFoWmwwKytG?=
 =?utf-8?B?L3pNSmdPdTBuelBoZDZYY1poTWZzaGZZMGNmK1FBc3V0VS9QME1sY2YxWVZ5?=
 =?utf-8?B?Q0dyWjJsSktvL0JYdjFqa01DTUNsZzdHVXlSazJFa0U1V25WZGNYcEhtMFJj?=
 =?utf-8?B?QWIyM1prQnN6RUQzWUUwSDFrb0ZFdVZjRU1pbjNqNERZWGRDWFBFSUFSWlJQ?=
 =?utf-8?B?dncvMWcybXRybWVWK2V1SHZoUUI4aFBsNEp1RVVIRG90MkxLZWcydTJCK1k3?=
 =?utf-8?B?VmtjT09zNWc3ZmlqdE5qU2ZHVC9NcTh5M1EreWRjNDZ4SlZFTFZVRzNLelUw?=
 =?utf-8?B?eGFuditlTkkrMDVZc1dQdGN0aWk1NXB0SkV3bUtnbHJHN1B1bkcxVDRUb1pl?=
 =?utf-8?B?Wm5DL3ZES2pOL0RiVW5OM3U4cXdpektqKy9LS2FRQnYrZWxkU1h5RFdUQmFZ?=
 =?utf-8?B?bXFJS3lvTnd2ZjFJeWlWK2p6U0t3cWpGZHJZelVTM1hKSXFSa3U3RXhoV0FI?=
 =?utf-8?B?aDdrdmg0bmVmc01HOVdndWtkZXE5WUZvL0l6WUp5Tk9pZkRPT29VcEs0Y0Ux?=
 =?utf-8?B?S2IzeXZsWFRHN2p1OHhUcXJpME9oV3RVVkZLbnh1Q2R3dldITmVzVmJNYU44?=
 =?utf-8?B?UUxDUGxBcjJvUjZuekRRVG9oR0lzOUM2YlVJOUgyMnBXYkdrNW55bTRlbHJR?=
 =?utf-8?B?aXMrTTIzcjV1NlRFWWF2OEowb092ZXlTWjVGaEFOUEJtMHhpVUhueGhJdXEv?=
 =?utf-8?B?bllRWlUxdDl5UkcvTUZ2U3NETkFXRFltd0RTNHBpeWN4dVdFa1NjN0hxMVFJ?=
 =?utf-8?B?aldTRXU4R2tmYUlBNFNQR0k1UWd2OFFaWXVTM2tRdWcvZmh0NzlHTTdYTEYr?=
 =?utf-8?B?MFNRVkU2NFFLa0JTb0ZrRENPVzBrRkZaWkhNeWE2WHc1TmJTdmVNUytrMEVw?=
 =?utf-8?B?MUZrOE83UEk3WDJ1b0lpL3ZDZmRNMW5JNThnU0pGQndrelJOTlBHWkt4eFpJ?=
 =?utf-8?B?RTNOOWhFbXIyVFBWcDRjYlFkMVB0R0tlUGMwN3hsN1RPaktQbzdHci81ak9I?=
 =?utf-8?B?eDZOQXp6S25rdWk3YWZEM3Z2V3hoUFZTeVhZekI3dTlhSk51cXB3cHBxc21Z?=
 =?utf-8?B?b2RNdXY5ZEpUWEUvSVVkMDY5eENFclkreUwyQW8zWjhQVm85K0ZBTXdEQ0d6?=
 =?utf-8?B?WVN4aVV0c0ZWL3p0L1RZb1FjN3FhU1o1YmhaaHlYVVFOYjROblhKVTMyM3BG?=
 =?utf-8?B?UGVROFJMbS8wYnhOdW8rdENLNFkybFh1dUs5NitVdzJuNnBrdDZUc1g1S0kz?=
 =?utf-8?B?VFg4SUM3amJyN0t6QlF6UHorV2F1VUVMM2p3QmFyVXhHdFFoT0ZZK0V6cGdF?=
 =?utf-8?B?RUhsZnVKTEV1M3JqcVo1SWcrSzA5QnExRzI2eXROS09oeDEwck1Fb09FRXNP?=
 =?utf-8?B?YXl0WFFycXNlbVpUZjJRUEIzb3RmbTI3TnEvdHFmcUxyZlZHTmRDMVlYN3E1?=
 =?utf-8?B?dmZ3V3JWeGJLMEtwclFqclY4UE1iUzN2ZFZ5dnNOMVMrUHRjZVRtbmtES25F?=
 =?utf-8?B?N3d0OTZpL1FCblRHUDkzWnRCakNrQm1JL0NocjlHUmxjSVBHNzB2SGc3Z0Nr?=
 =?utf-8?B?OUUwb3dvZWlhN05kdkErWmwyMk0yZWtRWjcrb3pQNDJhZzN4a3N1THQvZS9k?=
 =?utf-8?B?RHBjSnpKL2xsSnJieHY5dUlVZTNlc2gvbHFzaC9oQ3JzbnRoVEhVRlpmMElV?=
 =?utf-8?B?RTQyTlJnYk1qSXZTTG1YUkhHeTkxNThtN3M5WlFMeXBzd0VsSTRlWEpCK3Zy?=
 =?utf-8?B?dEQzKzQ1UStwWTRReVB1dTFiMlp1Y2tKY3Z3QzJ5UnNvOEdINkhMbkpPS0dt?=
 =?utf-8?B?WUg5Nk5NbHZ2K2lVWlZvSXhVL1NOaGZzbytDWU0zYVJHSXpDdVI2bERCeDN4?=
 =?utf-8?B?Tm5WMjVVS1RHbVRnbzdUMGtQaDVhT3dHWmNYcndmcVJybUd1eUEzMkdNUml6?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6ymMGvDifcgIAhKYr1oh0Ae7BDvfosTlR3uJ9SPZ8rtlMcrtt4bU0opWi4zijijl1TMvDgK8yPBdA5xrDR5HakFzuftwlqdbhdp0vi8hnRjTmPn/YTdd9+N8y5oIDdXniSUigTJ169VBBVPFaNRFQjbQAqp9PTFYLLCxCPXp3NGr25fi4KS/Xcmy2+z8vD5uXvGFw17QZt3b8ycoZi+hPkchX3F84ukWBGBMZydgPMNxcV3zfJQuf7r3VAwedOpyPz32a0PP/bFzYSWyKjLSyKTpB9recRxr1uYdaGuSkTI5wvyG7Yp7esaxP5sTq3zqL2mRdyLOdQgem4TEpoZcnuHKe7iLz3pCRUH+cMkMZZRDnCrX8LhL/+epi8oNqUeEF5UYdmC/aj1iEn6yXcAEvidvlFqDSXl6DQPdg1trghpEc9a9XuckSddgwB2880dCA19aGWpdA1bdIdzdRWhunMQ9wqJ7t+259vfQFSTeABKFBPEpiTIlxLdQY1B/ikSI9Jca2bTsvDhDA/uWdvze1LdBGX7YIXh7kY2lanA9E2/WgGKpH9Xy7Aw8XyRIFsOrZZXOuUfCLQ4sdOGfIkiY0URsyMuHRXmDjQfOIJgiFjmPiPAps8WbByY+W81I80UCtYv9ynMPRdW1RD1recEQZzIS5mUmMegRSt29hHgIxB/JlmUVyVljSA3kNaHLOvs6EMxExHNDpVhqFirWNlvuhcwX5mMDX4/bh65UMRC8OVOv2alN6aE0R8SNYTUxsCExf+lCHZXykm+hC7FLonN+NeRvvxnXHUekm+5uyCl9FCwG2zlE7qgUuGwHwFSRGME4RSagG54shNOemkTmp0WZAEUqMHvj4D28/wC7FHBBsUT0ZUwEiKACffHDEVShcvS5ZnQpL81ckLSuKIRLuxjQSA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91301cd6-da58-41b1-e89c-08db2c742cff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 14:29:28.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGqqlNoikYNefj3ReUU99eDtBlU7aPJX/wNT4TwdMCxw+oDIPuiW6kIpSfLt0REPcE028wyXhH+rbLjrK3oyO08vyZn2EZiszpOTH0/Nip0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5691

On 25/04/2022 2:36 pm, Jan Beulich wrote:
> On 25.04.2022 14:37, Andrew Cooper wrote:
>> When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
>> pointer.  One of several bugs here is known-but-compiled-out subops
>> falling
>> into the default chain and hitting unrelated logic.
>>
>> Remove the CONFIG_GDBSX ifdefary in arch_do_domctl() by implementing
>> gdbsx_domctl() and moving the logic across.
>>
>> As minor cleanup,
>>  * gdbsx_guest_mem_io() can become static
>>  * Remove opencoding of domain_vcpu() and %pd
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Technically
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I'll tweak the commit message now that the IOMMU fix has gone in.

> Yet as mentioned before, ...
>
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -816,71 +816,12 @@ long arch_do_domctl(
>>      }
>>  #endif
>>  
>> -#ifdef CONFIG_GDBSX
>>      case XEN_DOMCTL_gdbsx_guestmemio:
>> -        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
>> -        if ( !ret )
>> -           copyback = true;
>> -        break;
>> -
>>      case XEN_DOMCTL_gdbsx_pausevcpu:
>> -    {
>> -        struct vcpu *v;
>> -
>> -        ret = -EBUSY;
>> -        if ( !d->controller_pause_count )
>> -            break;
>> -        ret = -EINVAL;
>> -        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
>> -             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) ==
>> NULL )
>> -            break;
>> -        ret = vcpu_pause_by_systemcontroller(v);
>> -        break;
>> -    }
>> -
>>      case XEN_DOMCTL_gdbsx_unpausevcpu:
>> -    {
>> -        struct vcpu *v;
>> -
>> -        ret = -EBUSY;
>> -        if ( !d->controller_pause_count )
>> -            break;
>> -        ret = -EINVAL;
>> -        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
>> -             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) ==
>> NULL )
>> -            break;
>> -        ret = vcpu_unpause_by_systemcontroller(v);
>> -        if ( ret == -EINVAL )
>> -            printk(XENLOG_G_WARNING
>> -                   "WARN: d%d attempting to unpause %pv which is not
>> paused\n",
>> -                   currd->domain_id, v);
>> -        break;
>> -    }
>> -
>>      case XEN_DOMCTL_gdbsx_domstatus:
>> -    {
>> -        struct vcpu *v;
>> -
>> -        domctl->u.gdbsx_domstatus.vcpu_id = -1;
>> -        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count
>> > 0;
>> -        if ( domctl->u.gdbsx_domstatus.paused )
>> -        {
>> -            for_each_vcpu ( d, v )
>> -            {
>> -                if ( v->arch.gdbsx_vcpu_event )
>> -                {
>> -                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
>> -                    domctl->u.gdbsx_domstatus.vcpu_ev =
>> -                        v->arch.gdbsx_vcpu_event;
>> -                    v->arch.gdbsx_vcpu_event = 0;
>> -                    break;
>> -                }
>> -            }
>> -        }
>> -        copyback = true;
>> +        ret = gdbsx_domctl(d, domctl, &copyback);
>>          break;
>> -    }
>> -#endif
>
> ... I'm not overly happy with the retaining of the case labels here
> (and the knock on effect it'll have for other subsystem domctl-s),

The crash in do_iommu_op() happened because things which weren't iommu
subops ended up in a function only expecting iommu subops, *because*
unrelated case labels got compiled out.

We've also had multiple XSAs elsewhere created by related "just chain
everything through default:" patterns.  The legacy MSR paths are still
especially guilty of doing this.


The case labels need to never ever get compiled out, even if their
subsystem has been.

So you have a choice between this patch, or a pattern of the form:

    case XEN_DOMCTL_gdbsx_domstatus:
        if ( !IS_ENABLED(CONFIG_GDBSX) )
        {
            ret = -Exxx;
            break;
        }
        ...

but the top level case labels need to stay one way or another.

For this patch, it moves a chunk of logic out of a fairly generic file
into its proper subsystem file, and a few extra case labels is a very
cheap price to pay.

~Andrew

