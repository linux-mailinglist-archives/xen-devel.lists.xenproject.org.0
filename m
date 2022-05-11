Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62120523001
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 11:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326665.549245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noj4w-0000FV-97; Wed, 11 May 2022 09:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326665.549245; Wed, 11 May 2022 09:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noj4w-0000Bt-5u; Wed, 11 May 2022 09:56:22 +0000
Received: by outflank-mailman (input) for mailman id 326665;
 Wed, 11 May 2022 09:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxTu=VT=citrix.com=prvs=123190e77=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1noj4u-0000Bm-1h
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 09:56:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 995c2ebd-d110-11ec-a406-831a346695d4;
 Wed, 11 May 2022 11:56:18 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 05:56:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4268.namprd03.prod.outlook.com (2603:10b6:5:9::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.23; Wed, 11 May 2022 09:56:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 09:56:12 +0000
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
X-Inumbo-ID: 995c2ebd-d110-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652262978;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i0NjmKknu847jEBZ5WoR2pyMVM8i3R0MuYh7Er4DYlU=;
  b=bVJEiGESbtO8caES5AoebJdXmTHTDZRr5+YfwoptjE7qWFZ4uPwMfj6R
   DfIxCQck6cIzafQu76/AXXlnvLunXipmiC9S1nz+wPQUlPGCCEht6p5Bg
   6AdrJuAtumsZefaLRwtjnLQ9Bo3VJjy91Sn8x6rX6ozB4Ek/gi/PzfBjp
   A=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 71457960
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FeDHTqxRWzaDPVPuGGp6t+cKxyrEfRIJ4+MujC+fZmUNrF6WrkUPx
 mFNXGCOOq7cY2ugLt1yao+z/RsBucXUmNI2SgBrqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplhZ+gYws3Oq72ocMGdz1TGgxfHO5n0eqSSZS/mZT7I0zuVVLJmq0rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTvY4wMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3M+fdosjaLpOB3+IfLKtH7YeaxfMlukUaEl
 zqY8nXTLR5PYbRzzhLAqBpAnNTnnz7/WY8UPK218LhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU3313p2Zty+oMC4Za0oLfzYZTBAt6sPm5oo0i3ryos1LFae0ipj5HG/2y
 jXT9Cwm3exL3IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:FfFfXKDYjWJf/2jlHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.91,216,1647316800"; 
   d="scan'208";a="71457960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK4AEoYApWZw1vt+IPtD0dURVEK+mVucUKH1OOzKkXL8M61l8Niilh7S3aeL+yrcgVdA3LP2kkg0TWVHZLG2mgJgbRPkO49ngPZzV1uhqp5yVqjQUFA3goqO55TLOed+vzzwFcMTcWjMNJbB+DHDFeohGIEkoPNk84H6tp8ujtFk8PX4lQzO0kSyURIw1edKkLw3bYDsrK8PaM+NE2C56FuAc0Gf5gTCkSk4z7HDvz8o9vcqjmXb95rTvgEArHwl2ZrwbJ3cN6x1+rGY47wefQxvo/IySkkGjyESW/8U2kzNyBTGM2a0D63AeV01cI1YbuBp1DU5uXGYrPK26F9GTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0NjmKknu847jEBZ5WoR2pyMVM8i3R0MuYh7Er4DYlU=;
 b=aPNub8s0rTXggKQO7tarUiXyHrTHnKIc0q6OhxICTF1V7ASJ2GjZHyskSguPHnvMYChAuCxTP5NaYOKkm8wbP6AZOeRyPQW2Yz4ApAGZSNFQFwVm/bugXL2TVMXQZmYJb2L4Nw8OG67o9LQju9cBybh4dnWDDQ5Vkh95IrWxx3rQPG/9jiUfqWzWVctZbrwwM2wc3f62HasauFOy/KegMvcPKnX10byIJQlMVYovTdVS81mrmothilWSqLiNh0zPH/OxudjFNJjuQ86W/TmafHGG7x4FUDN9Ge0S4eKb0tH5Uj8LeCsyAViAVL/trWPmnQcbtsyMSs4nHGNhLRM4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0NjmKknu847jEBZ5WoR2pyMVM8i3R0MuYh7Er4DYlU=;
 b=HhiUYMaUGurxjKHCurDZ4XbTSHO/uCwbrzVo458mPZuVRJ7DSqrHcKS7OusVEDMSOh9g7bk42lExaQLDr9mlk1HgWLwO2w8RxHnBDNVBA5ONkTgSTLPH3qNxGzlRW8qrDgy4j/REtQlZB6vJfI9QbC3ErUqR0xSp/SWU9rQANWo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?=
	<lin.liu@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Index:
 AQHYZFbw3mG1/klQJUepEAoxYdrkNK0X7v0AgAAFDwCAAAI1AIAABM2AgAADuQCAAXM6gA==
Date: Wed, 11 May 2022 09:56:11 +0000
Message-ID: <a33f8fba-fa7a-91fa-9179-22973d680b08@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
 <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
In-Reply-To: <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 365fd7bf-8e36-401d-de3a-08da33347aee
x-ms-traffictypediagnostic: DM6PR03MB4268:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB42682653C04BDF17274C5108BAC89@DM6PR03MB4268.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FC5fsonPyBA7TIWqU7wEETTRcwK4ibJzXXwMH6CpMKzvHSynj4ZACuVfB+tltfnKEhqoSlyUl7Olq7mezn1uqB7/wxRTslg7AKROeVE/LPvNDRIyJgwh+ERozsI9lijk5u+tfa0dryZBAobbEDLfL8hvTIb60k1NKg4zLGTT4gOrOSJ2w94w+Oev4GE+OxAjU5X8xq3grGPk8HBLUuajBTsR8hv39tKLqs1pA4LlsySy38H3rjW6kXeZq2m0VbBscvsbPg/6CutG4i2Sm6FhTI9qC1c0bGPsNf4Qt6mfba9N7QfWPMXpz4kfAi6ggB0piqMZrfWYhYZPJr8NyULOYiPzJpJnlbo3qVBmsZLLcbgYA75QGSDHxwSNzohPSZPvjBu3O10nTqAabtYj75/M2vGSqguOErkVBay638dZLU5eT2d6YuVwL0HOh12Vf6PdsEW+l+boQNEaLhUmta3pOuy8NrF2FfjIf9kyki9gjdRhwalbR/Un880wNY8lK2oLepWdabqbvrPeQ5SRHMl81lrv9ldmg9wuYSdRCzaB16WMWGshR3X8yk8QQjSHYv39OSlDK7UCVxVbcwjr5nUaAEk7Py5q/bqHuu8639Tge4QmYvAe9dqO1LkvzVzcZ9DA11wok1hh9ZxAeQ05LTA1LGsOBzKT4CU1EYVlGfpbkJ00oyvyksd702UO35N39qTh7OIsk6phMFoN44cEbQ2uoTx3xkKnFwD4jsT4OxISe92sqqZrafacEaCVCMrCgh+N3oNPsBFMtFuoxwIzRzOnBw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(508600001)(76116006)(66946007)(38070700005)(4326008)(38100700002)(66556008)(6512007)(91956017)(122000001)(8676002)(66476007)(66446008)(64756008)(6486002)(82960400001)(71200400001)(83380400001)(26005)(2906002)(110136005)(31686004)(53546011)(186003)(316002)(54906003)(36756003)(6506007)(31696002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFR4OGc1M2lHUDN6ZU5QS0NDOE0rTkRBYU5sby9wdjd1cURtSXM2TlYvKzgz?=
 =?utf-8?B?QWoxVC9GL2luL1YxNnJGQURuMjcwQXZFa0VEM0dKTTFnL05TMTB5UGhqZUV1?=
 =?utf-8?B?VEtkbG1HWklkT215Wk1tYkhMemR1ejhoUXdSQWs2cG9sSWNnQlk1SnRyNzZq?=
 =?utf-8?B?dU1sbVJuN2doZ0RYTVdwTjJXRGxLRjZ2WldkcDBiZDZEeERwZXpsQzFGdjE1?=
 =?utf-8?B?RUlBNUx6ekpGbnpna2Yxc05yNG8rVk5RUnZ6QjdZT0s4RUFQSjFWSk44b3I5?=
 =?utf-8?B?VWpDeGViYndoOVZ2TUVXSWhjc0J0eC9qejZVZjJ6REo3c2ZCV0MvemV6NWE1?=
 =?utf-8?B?eXdMQkF0d3dxL1F2cVl0dm5QdXRSRFVZRkEwbkwwNTRqSnRudytIc3ZJL0pU?=
 =?utf-8?B?YzFOQzAvWC9ucE1PTTBZTVJKSDFVZythVFZoV1dZbEJyN1NrRllpTnd4cloy?=
 =?utf-8?B?b25WNE9RRFZMVlAxRWVWRGMrUUU1SGJuUU1sYWI4VlBwaG1uMDM5QlBQYnFI?=
 =?utf-8?B?Y056Y09QbzlXWXBLRnFqNlRSQXRMeEJpQnpLOWlGMmJOc3I0SDY5Y1I5UjR6?=
 =?utf-8?B?YUtpODlxTWVFMEs5WG1YdEE0QkRyRCtERFFKU1BqVEI2UU9vZVFDaHRQeE9B?=
 =?utf-8?B?MXZlZjNuMk41WXlKSFFMZmRrMWFleisxNTFLM2RLMUt1cEdqeHRxaWRQeGtV?=
 =?utf-8?B?Z1ZXZnZXSERjM0EvTkp4RHZxc3hzNmZTNEcweHpFSEJVVVgrejBDKy84SWZ0?=
 =?utf-8?B?U1BTSCtoNkZsOStJMTB0eHhvcklwZFdVbVV0TGNBMW16cy9HYUhCRXVWTER5?=
 =?utf-8?B?ZnZibWVUTUU2NVc3eG9WdUlqMmt3U3laWnl3YUZ1L2g5NTF6QWVFTVdJQUxP?=
 =?utf-8?B?blBrV1g0SVEvNnVqMEJhRklKWGo5ZGlDbnVUMjVnQlZnMmVGVndxaG1hcTlu?=
 =?utf-8?B?amhTcWJ0TzRIZER6b05SZHo3ZlpkR0JXOEZyRmd1WTlabWd0OTArMXFEWDIr?=
 =?utf-8?B?WWtBcTRuSkZLRkNnVWovelRDOUg1aEE0L1ZjMXY5MnpnbFN1WFlRM3VrR29Y?=
 =?utf-8?B?UTRVTTlsY3lPRU9DV2FZanJrcWtwM1NDOWpQWGRvYndZQjN4RUJ1dVBFUzhk?=
 =?utf-8?B?REtQZXI5VnNnMWFRR3gzeVZsRVg2WXVBY2U2S2pJTllJQktDTDhNZUdxL2Fn?=
 =?utf-8?B?VGxQYzRVVmYybW9HR20wUElSeHlhK093NWErQ0YzUTVNdUYyWG96a2NhMXJD?=
 =?utf-8?B?WHRaSlUyaTRVMEZ5VVhiak5KRDFOQmJwQm53WGdkQUg4bnY2Z3pvVTNIMURJ?=
 =?utf-8?B?bVF1d3hEcnpjejc3UFlUREUwSXBObjJUNWg5WmRkbU05RndscHBlVXVrb0xY?=
 =?utf-8?B?a2M2VkxrWE1XbG9jdWJhK21HbzMwNWhPcHh5SUtvN2JtRXFLUk95QUdNTEkv?=
 =?utf-8?B?clhteDVDczdsMnU0d3l3cys5YzdYeUFwUE1EZml1b2t4anAxbUR2L0llMUZi?=
 =?utf-8?B?cTZmd0F3WWp6Y0VxeFRkZkdrRjZZNVIyNENJdEJUUVNYTlZQcnBOcW45RHBy?=
 =?utf-8?B?YVlOSXp5SXdtNmJwbWlyZmlINkVPNkFpellKYVpvVVg2SDFTbmFvckd2cTlD?=
 =?utf-8?B?RmU5SGpGR1RmVzVTRFBGTUZPaGpoOThock1mUVhIN2R2UWs1cDdKTHB1SElN?=
 =?utf-8?B?OFpiV3F1Qkx4eklhUVFueC9wQjFqOXprb3hTRmVUZS9nNnpaT1YrNkZwdE1P?=
 =?utf-8?B?OU9PYWgremxrVCsxS2l3UlFKcGJTMy94dmR1aUp5RTIyOERISTkwTm9xRGZT?=
 =?utf-8?B?eUd6V2dLTkRUK0pDWGd5UHljS2F1djBhYXlDYjI4aHlWKzlZRTdOZzdhY0Q3?=
 =?utf-8?B?ZWNWZ1pkMWxBZy9xYTFERFVaUGNSVFBlUVJ6aks3SzRYOXZnREdhSmNEWHNI?=
 =?utf-8?B?N1JvWEN2cjFtOEdXb2dkVzgzRXNFVFprWUxnRDIxTklBN0ZURmZwWXFPUm1K?=
 =?utf-8?B?dk54cSt4dUJaYnpiRzFxR2lIbWRUL1V4M3VqWlpvYTcrSkpmSlJBVlo4QThW?=
 =?utf-8?B?OSs3dVNtVEV2YWJidnROQ3lnY2JWdHM4SWswNklDQWNPbEtIMWVlZ0xIakk0?=
 =?utf-8?B?QXhobTRrNW1TOE1SbEJGUkIyN0NhOWxjUmFNR3Y1OFRwQ3NCRVRnVGlsK3Vt?=
 =?utf-8?B?RTlrWUxxWEkvcnhwWlBTdlJYVzl3V1Uxc0xuYVlBbGRtWjJTYWVRMUdsQnFl?=
 =?utf-8?B?UHpkVVo5L2ZVZGx5RFJkcHhEdGxXK0ZocHlMaktMMkJBRjRvVXhzYnBWcUEw?=
 =?utf-8?B?ZFlTYWhpMGVUeDNHVE82c0N1bzVJbFlkVGZValJCM20xU2hkMHdHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CA202BAC8DD57469B8D1FFEAB98E109@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365fd7bf-8e36-401d-de3a-08da33347aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 09:56:11.9981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fDOZvfmgLV8OZqltxZM7g4z6m7XKn9sHtVytb1QUVvgzEd6mjERcKkmKEy5HfA/FHhFqST7CWCFm6a3LzVYOaywbw1xKz1zGwOqKdAQPHbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4268

T24gMTAvMDUvMjAyMiAxMjo0NywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MTAvMDUvMjAyMiAxMjozNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDEwLzA1LzIwMjIg
MTI6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4NCj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi91bmFsaWduZWQuaA0KPj4+Pj4+IGIveGVuL2luY2x1ZGUveGVu
L3VuYWxpZ25lZC5oDQo+Pj4+Pj4gaW5kZXggMGEyYjE2ZDA1ZC4uMTZiMmU2ZjVmMCAxMDA2NDQN
Cj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdW5hbGlnbmVkLmgNCj4+Pj4+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vdW5hbGlnbmVkLmgNCj4+Pj4+PiBAQCAtMjAsNjIgKzIwLDYyIEBADQo+
Pj4+Pj4gwqDCoMKgIMKgIHN0YXRpYyBpbmxpbmUgdWludDE2X3QgZ2V0X3VuYWxpZ25lZF9iZTE2
KGNvbnN0IHZvaWQgKnApDQo+Pj4+Pj4gwqDCoMKgIHsNCj4+Pj4+PiAtwqDCoMKgIHJldHVybiBi
ZTE2X3RvX2NwdXAocCk7DQo+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gYmUxNl90b19jcHUoKihjb25z
dCB1aW50MTZfdCAqKXApDQo+Pj4+Pg0KPj4+Pj4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIGV4aXN0
aW5nIGltcGxlbWVudGF0aW9uIG9mIGJlMTZfdG9fY3B1cCgpLg0KPj4+Pg0KPj4+PiBJdCdzIGEg
cGxhaW4gZGVyZWZlcmVuY2UsIGp1c3QgbGlrZSB0aGlzLsKgIEFGQUlDVCwgaXQgd2Fzbid0IHVu
YWxpZ25lZA0KPj4+PiBzYWZlIGJlZm9yZSwgZWl0aGVyLg0KPj4+DQo+Pj4gV2VsbCwgdGVjaG5p
Y2FsbHkgYW4gYXJjaGl0ZWN0dXJlIGNvdWxkIHByb3ZpZGUgYW4gb3ZlcnJpZGUgZm9yIHRoZQ0K
Pj4+IGNvcHkuIEkgYWdyZWUgdGhhdCBhcm0zMiBpcyBhbHJlYWR5IGJvZ3VzIGJ1dC4uLg0KPj4+
DQo+Pj4+DQo+Pj4+IEl0IHNob3VsZCBiZSByZWFzb25hYmx5IGVhc3kgdG8gZml4IGluIGEgZm9s
bG93dXAgcGF0Y2guwqAgSnVzdA0KPj4+PiBtZW1jcHkoKQ0KPj4+PiB0by9mcm9tIHRoZSB2b2lk
IHBvaW50ZXIgdG8gYSBzdGFjayB2YXJpYWJsZSBvZiB0aGUgYXBwcm9wcmlhdGUgdHlwZS4NCj4+
PiAuLi4gSSBkaXNhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSBmaXhlZCBpbiBhIGZvbGxvdy11cCBw
YXRjaC4gSXQgc2hvdWxkDQo+Pj4gYmUgZml4ZWQgbm93IGFzIHRoaXMgaXMgd2hlcmUgdGhlIGJh
ZG5lc3MgaXMgc3ByZWFkIHRvIGFueQ0KPj4+IGFyY2hpdGVjdHVyZS4NCj4+DQo+PiBOby7CoCBU
aGF0IGlzIGFuIGluYXBwcm9wcmlhdGUgcmVxdWVzdCB0byBtYWtlLg0KPj4NCj4+IExpbidzIHBh
dGNoIGRvZXMgbm90IGFsdGVyIHRoZSBicm9rZW4tbmVzcyBvZiB1bmFsaWduZWQgb24gYXJtMzIs
IGFuZA0KPj4gZG9lcyBpbXByb3ZlIHRoZSBhc3BlY3Qgb2YgdGhlIGh5cGVydmlzb3IgdGhhdCBp
dCBwZXJ0YWlucyB0by7CoCBJdA0KPj4gdGhlcmVmb3JlIHN0YW5kcyBvbiBpdHMgb3duIG1lcml0
Lg0KPiBJIGFtIG5vdCBzdXJlIHN1cmUgd2h5IHN3aXRjaGluZyBmcm9tICpjcHVwKiBpbXByb3Zl
cyB0aGluZ3MuLi4gYW5kIGFzDQo+IHVzdWFsIHlvdSBoYXZlbid0IGFuc3dlcmVkIHRvIHRoZSBj
bGFyaWZpY2F0aW9uIHF1ZXN0aW9ucy4NCg0KQWRqdXN0IHlvdXIgdG9uZSBiYWNrIHRvIHNvbWV0
aGluZyBhcHByb3ByaWF0ZSB0byB0aGUgY29udmVyc2F0aW9uLg0KDQpUaGUgcCBoZWxwZXJzIGhp
ZGUgYSB1bnNhZmUgdHlwZWNhc3QmZGVyZWZlcmVuY2Ugd2hpY2ggd2lsbCBlcnJvbmVvdXNseQ0K
Y29tcGlsZSBib3RoIG9mIHRoZXNlOg0KDQp2b2lkIGZvbyh2b2lkICpwdHIpDQp7DQrCoMKgwqAg
YmxhaF9wKHB0cik7DQp9DQoNCnZvaWQgYmFyKGJheiAqcHRyKQ0Kew0KwqDCoMKgIGJsYWhfcChw
dHIpOw0KfQ0KDQphbmQgcG90ZW50aWFsbHkgbWFsZnVuY3Rpb24gYXMgYSBjb25zZXF1ZW5jZSwg
bm90IHRvIG1lbnRpb24gdGhhdCBpdCdzDQpzdWZmaWNpZW50IG9iZnVzY2F0aW9uIHRvIHRyaWNr
IGEgbWFpbnRhaW5lciBpbnRvIGJlbGlldmUgYW4gdW5yZWxhdGVkDQphcmVhIG9mIGNvZGUgd2Fz
IHNhZmUgd2hlbiBpdCB3YXNuJ3QuDQoNCkRlbGV0aW5nIHRoZSBwIGhlbHBlcnMgaXMgYSBzcGVj
aWZpYyBvYmplY3RpdmUgb2YgdGhlIHdvcmssIGJlY2F1c2UgaXQNCmZvcmNlcyB0aGUgYXV0aG9y
IHRvIHJlc29sdmUgdG8gYW4gaW50ZWdyYWwgdHlwZSwgYW5kIGhhdmUgdGhlIGRlZmVyZW5jZQ0K
Y2hhaW4gdmlzaWJsZSBpbiBhIHNpbmdsZSBsb2NhdGlvbiB3aGljaCBpbXByb3ZlcyBjb2RlIGNs
YXJpdHkuDQoNCk9uIGEgaHVuY2gsIEkgY2hlY2tlZCB0aGUgTUlTUkEgc3BlYywgYW5kIGl0IHR1
cm5zIG91dCB0aGVyZSBpcyBhIHJ1bGUNCmFnYWluc3QgdGhlIHAgaGVscGVycyAoc3BlY2lmaWNh
bGx5IHRoZSB0eXBlIHNhZmV0eSBhc3BlY3QpLCBzbyB0aGlzDQpzZXJpZXMgaXMgcmVtb3Zpbmcg
YSB3aG9sZSBsb2FkIG9mIERJUiA0LjkgdmlvbGF0aW9ucyBmcm9tIHRoZSBjb2RlYmFzZS4NCg0K
fkFuZHJldw0K

