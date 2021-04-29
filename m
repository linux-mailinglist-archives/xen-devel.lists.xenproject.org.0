Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3136ED2A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120136.227172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8Mr-0005RN-Ed; Thu, 29 Apr 2021 15:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120136.227172; Thu, 29 Apr 2021 15:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8Mr-0005Qy-BE; Thu, 29 Apr 2021 15:14:17 +0000
Received: by outflank-mailman (input) for mailman id 120136;
 Thu, 29 Apr 2021 15:14:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc8Mp-0005Qt-V9
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:14:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dee5d07a-eb56-4728-87da-0244666d802f;
 Thu, 29 Apr 2021 15:14:14 +0000 (UTC)
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
X-Inumbo-ID: dee5d07a-eb56-4728-87da-0244666d802f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619709254;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VF19BFw0+zJIX3rOxY8qXszM9kX8YGmGMLuQjlGFEEc=;
  b=QVVtWpERyJdyWEzl5u0jOiZ9yVYkbV451aKGxfc0xS1Kahos1B4HhoD8
   RfDH4c3JPnDlGKk+16MvOujdvRo+Rcafsxl49uW8Cmw+av4EEE7Ox3QSd
   K2LX4+DJLPlW8UXm/f7BxFkfbRLmsk1RwONbMjQI0Fnz5hJ6FuWkzijZZ
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +mMeZz95DOHkLV/bWuJ6pKTZnRPfVOYcXl5YBYoxiZeTIbUL/IKvZmwBN1VxAJeWlNhjxy2nPW
 nJ73s7uRjeOxM65ISs9kmm0VAUMNRYldZJHdLAO/S+Zmh7e5nkbYUXMYDXiRt86ePP28smazPK
 T+0Rs681ZLxMnDBBqJ+E0izNnjLNrQYQ4Xp0OTfAhxpQQGtgqi/nOdhSxgcz1k1RV69ebvguhA
 JwqiFYeHnI5mNnMBM3dVZ5eUqbmMdvJRw3O70oGEYaDBB5ws0IDbIPdCGnKd0pPYFp9xgoo7lY
 HRU=
X-SBRS: 5.1
X-MesageID: 43103969
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yvqVBKMlVRJHasBcT3Pw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiTtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCAkqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2C2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW1DRoymyYoAJYczngBkUp6WV5E8ugJ
 3wpX4bTrtOwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGb9tR/w6NTSWxZhmlDcmwtYrccpg2FCSoxbUbdNrOUkjTNoOa0dFyH34p1PKp
 gWMOjg4p9tADSnRkGclGxuzNuwZ280DxeLT2MT0/blogR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIp5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdUPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMB4bDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEPE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhHk/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+gLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTZRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC9IFJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAehjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXCWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxegVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 v4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PHRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4uaHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBelblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGLBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+0PzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789tN4sAZUBXYlM78nJs4aercJDREhyjc4h4jReHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI+PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wMSWUgKuJZijcji4Ur0i+9DozPy3hV7Wd20HVAjV7i2o+v/WHBO1pJWDep2qlrYQ==
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="43103969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRzm7bf0grBwkzaTr8zl0R40iid5h0ika5V8OOlD/zwX8faVNe4sDAFiRdsxrwciDCedC8SXPJ+00L2qQzQdWhqksbGSdQALpP3ez3qLtuaV7ZPee2U3Wteu1tIeVTo6JdZSr2obslxlct1ZQ11/wElhJW8giBD0AEYwVAt2AGI3sASjNM6i1DTdqWc06LCggIIa2Xp5BmcsKAJVcl+535Jh65Rk0rCU55l8pbfoFJrKYFe3bZWHj9TUNet2jvBzCsbFlorZKd7PHBej7nTJFwYu9ZltBb8qyRYaqhUWOdD6rI/mzwrgksjK89e8XTeiGPOe4coW9lyZ3eiOGloboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0Bbs3LphpW85oFXqn3E6en/H/xTRIyg7eLQBHAY4fA=;
 b=gsaKOAPj4nXtHZMSY/OX6x1NbY5S/bDjnKoOaqgQQN+inwf3zR7Fz451VGuV9O3rxLONB91jneOBg5Jdmzehqx/uJuvQ488N+XAoKcL4dliD2xi7nv15LogkO2j9oBl+AD9SEoCBZKB/olGOpEUqcSOs/9Vv/t/CRUpVbP0hzDotSbaJ7OoOprY6HN4E9OdlFVwVCSqWUWxF2SYvLBF9WmqLTKH78RRgeWa+BY99WWelEGnbFhGXwSzbbAbReV9PHe+kdUp8oX9+EdHBjMtnNOa2o3JnPMpAEXBwwcb6ktBY3iKiz6sgULCFnFmJPy5G/zcX8q0qwNWiyeKS6CvQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0Bbs3LphpW85oFXqn3E6en/H/xTRIyg7eLQBHAY4fA=;
 b=n2xFktvxxp0ulxMxXtq6IKa5c+VcEFgs7CeWgZz1Ow4iifVxMmQCy2VHALBdAXvn6Mj5u9ao+86c8ybifc/EVcCKTD6GzCMw6BCFB1snACzXTdyiLtvnzZK5jM4+2ly1LpB3CiwEQNuba6dKFvkp1nPTWIsDqJCW9FXczAu1A4E=
Date: Thu, 29 Apr 2021 17:14:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 04/12] AMD/IOMMU: guest IOMMU support is for HVM only
Message-ID: <YIrNPltSssVDYwGm@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <187fa031-c237-2298-6b39-2c4a63b06c0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187fa031-c237-2298-6b39-2c4a63b06c0f@suse.com>
X-ClientProxiedBy: MR2P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c22270-707c-4c18-5803-08d90b217175
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5605150D78BADB5AFD14EB818F5F9@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD6DS+YP3cLuvCsuTzL0lYW81ZEriI1Gz6800gePPeVJQdlDyx5mUwumKAEArbylB+mEZ1g0USvDIIqYaMg/nv6ngbr+vMPH6VISbJtmJoVCPeGbFZNJmkdyXxQONv74LqozAZaf/dc2S1sMA+BM4q1jus7k7L/cpAnDQzodFU59QTqu9DyTDbeFfKPLPLXYrYDFSVw4I626kPsCEVgnLfk5pG1NFAA+zx5vLNAD9+8j/xbMR+N+60FP015N66yDrJdJTtiMIZq+Cw4GkvIeWTE39+V2qDZPLi3hDm5cVTr57QcsYia9saNYsViWr9GvlqajzXy37pxHHLBHkCTmJGdzKVT0cv8B16pryF5ffYLdMjF2k4ovI8ei/MwBV1kA96t7FNYqoFybFD7pCKWUE//GOL7dJ6ozrCmGa6g5y7bF2TmYXlAdqWXCWG4PAtPpRBCxps9AFLnSHPGDoEGUyaLi7OC2E8Z2LPffAyqJiijUZguPboyxjERUkn+Twx6qOnMTNQFGnwhqgzqLzHZ4gEfHU1lNb12u4bhuo5xA5MPv7wVUmZItIlqrmUrnWOcyUfzullDhMv9UJwcAtWn4Jk1UwWGqYZ/aGn00eFbsg+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(5660300002)(33716001)(478600001)(38100700002)(26005)(9686003)(6666004)(186003)(107886003)(956004)(66476007)(54906003)(85182001)(6486002)(6916009)(8676002)(4744005)(16526019)(86362001)(66946007)(66556008)(8936002)(6496006)(4326008)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVYrSTRTbzhPdDlaaWhGd1JndVdHSXBINE5WbGQwZ3FiaUdHWTZ2V0pZNzBq?=
 =?utf-8?B?S0paRVF5dFRIRy9lMW44OGJrVVVUV3RCMU9SMkZrUjE2RXFmWktldDFPTTlz?=
 =?utf-8?B?MzBPdkJIMGdPWmlYM3lJcURsaEJGdW1pWENaZkx2eTg5Vm1oTFRhRTFCR1dj?=
 =?utf-8?B?WDJWdGlPS3dPZ24zZ2Q1TkhnVEcxVisrSEJ5eDlkZCtHL09iZkd0b1N5Njh6?=
 =?utf-8?B?RGJPa0MySGR2eU1DR093NmMxekRGVWVsNUIrZGtKSEFremJpd2dvR2tqQXU2?=
 =?utf-8?B?YUlzTldYRSsybFNTV2tFZWE1WWRqTmFuRzEvY21OL0NBREtaWHg1YWJ3eTM4?=
 =?utf-8?B?TU96ckQ3WFl6dU9UZ1U2RmRXWk1DS04zYlNGNmx3a0dEQm1oVlR5Sk1LQTU5?=
 =?utf-8?B?Rlp6ZzFZdXVCdlM0ZVd3MEs1LzAwbjR4WXFmbnQydEgvQ1QxUlhyZXN5SmRY?=
 =?utf-8?B?NkE5YnZ1ek5JQktUbUFVR2xuekdwT1R3R0dmdVI3TEw2blZySnRCNVVVZDVK?=
 =?utf-8?B?S2N5bVc1eDJLZTAxblZTZ1Bhc3VPK3FFVnI5bmVNRVFtZkt5TUVGdm82QVVl?=
 =?utf-8?B?M2k1Q21TVDl1eC9ycXFXdldjNDlseHlnU0NOeWZFSHBDNUxsMGtHSFFTMThM?=
 =?utf-8?B?Z0NVQ1NjV2tzTFRXWlZ5Sm1aTE8vS2dIb3pVN1ZKTG5IMnU0NXZDMW0wK2xG?=
 =?utf-8?B?V2Q4SUJSN1BaaUo1NGZndFhlbkYwV2MwRHJOVCswM0YvMEdnczJzR1RTK2M5?=
 =?utf-8?B?c2tMNWRwYUdzMU9HTnliNEdwbzBWNzV4Vm05Z054TkI2d2tMbmhrV2dNVHNt?=
 =?utf-8?B?aTcyOEVjNW5jWk9VVVoxdUdSMDZ3UFcwWDQ5Y2xTMlB3eGVocnFmWDM3TTMv?=
 =?utf-8?B?YTAvQ0szRUFOWGFaSytJS1JrTjNUcTBZcE4yZEZuc2hNYUxVYkdPMmxSNkVI?=
 =?utf-8?B?cW1uaGp4L0dzVndpcHFmU2s0S3NxN1owZ0ZtMUcyYW9qV0ZIcGJyYnlrNS9H?=
 =?utf-8?B?bGZyWEtVUldtdHNHSEpjT1RmL3Q4TVRBRWhMR2p0dGN2SUZucWNXQW1WaUQw?=
 =?utf-8?B?LzdMRUg2cmZvbDZwRkx5bHN1Snc4QkxKU0lUUElvNWFLRXd0VGMrK3VKTnZF?=
 =?utf-8?B?aXcrRkg1REVUVVMxUXJQV1AxOW9lLzE1ajR1anBLNGpkTWErdHY0Mm5zK3Rp?=
 =?utf-8?B?Qm5zbGNlbEhSV01NUlhDUExWSnpHSHFZa2ZlQzJYUERBcUxhZW1wWjlCdHg1?=
 =?utf-8?B?Vnp5cDBxbFRFcnRrSTFhdEd4WklxNTZ3VVRQVTZKWEthdmF3YXBFQUQvQUxK?=
 =?utf-8?B?MVFKeUhONDZBdDZyREN3UGtHTjA2WVpwWklKMG9OMDdNNWhJdExCQXZMRzJU?=
 =?utf-8?B?UXNyb3NFVTZ2RVdTZ1QvZU5rNWllR3RTZ1E3bDA0Wkc3SU80UG9CQXFFbWl6?=
 =?utf-8?B?WmJQWjNhREMrR3hlK1F6cEszL3lpK2t5OGF2WVRiV29iOXprQ1AxZ2JUa2xj?=
 =?utf-8?B?ZEIveGJXQkQwU1k5SnY1WFJFcG92UHVEQVIzNHJwQ2RWbzgyZHVrcmZZcW8w?=
 =?utf-8?B?b2FHN0xJdDdVbG1hVGxnNnlRY0plN0FENVZ2dEoyZ1g2dXB0d0l3NW51WWlK?=
 =?utf-8?B?WWNONlhDVjRrSHlkQXNNWVVySlkwWXRwWk5tOUpvU056RzNweVcxNmNnWEZH?=
 =?utf-8?B?VTNkRHdPMnkzdGlKaGxUb0hmcERGSXA4L0NVWkk0UVpmRjZFSDFaekV2WSs4?=
 =?utf-8?Q?ZAvNfiokw8ZEUP8+kLVisvMIzGYLZheYKgqHtnH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c22270-707c-4c18-5803-08d90b217175
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 15:14:11.5843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n12JfDnLC9yaoC+pbqSNcZDvX1HSuluAIFEePpb48eQKoRfE3bKfymGh+TBCYsXD7+oY9ra6YOFRGARfQW4H0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:07:50PM +0200, Jan Beulich wrote:
> Generally all of this is dead code anyway, but there's a caller of
> guest_iommu_add_ppr_log(), and the code itself calls
> p2m_change_type_one(), which is about to become HVM-only. Hence this
> code, short of deleting it altogether, needs to become properly HVM-
> only as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

