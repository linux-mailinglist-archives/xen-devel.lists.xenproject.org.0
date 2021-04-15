Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7036096F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 14:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111108.212421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX191-000391-VS; Thu, 15 Apr 2021 12:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111108.212421; Thu, 15 Apr 2021 12:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX191-00038c-SJ; Thu, 15 Apr 2021 12:30:51 +0000
Received: by outflank-mailman (input) for mailman id 111108;
 Thu, 15 Apr 2021 12:30:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX190-00038X-E8
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 12:30:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0dc4399-bb19-46eb-8b93-25a109f73b3e;
 Thu, 15 Apr 2021 12:30:49 +0000 (UTC)
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
X-Inumbo-ID: b0dc4399-bb19-46eb-8b93-25a109f73b3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618489848;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zog7RNOgZDmUjuW58MsfRScWxniaentKP/jFGyYtoh0=;
  b=cwDlVOL+oWVRVTnvud72orMxeaaVgFtG6X+ekv6UggpnjfKZyWR8+fDO
   sj1jNEHgxZqvvBH+EX+SbH8uG2/dvSudonb+8Tgyr/I3AvDYoNYGU4auN
   YjfdvH/oST7EKAi57hustsoPdyjurY897WF/RNzUoO1en8Ydc/NjP8v5J
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W02RO8fTsQUGweKhxN8QP6HuihXV3PmqmtzDQBQ6BjRBxRbAJi/2Xkuitj+p4iMSRd3qlWnIuP
 1X/bHx4PB7x+I+NcPCffGl8BhW9fb39BbJ3ZnB43d0MibNiHDi1gzYmjWMgLRvMqmqBK9oOMfK
 NBGHOtATZXw/hgiR0EUcXEOUNyXOoBDNn4ngNoHczzuA4DjmlqVn+fnXT2gQP9FBkCAPW6+fCF
 UtkWnN6ylc1rzqDmLkFctrmiZqPuAEUZUgmZGk3OhCrNFNOp2ExiB6XeR3/pwSgc/Tq4EOOv1Q
 ys8=
X-SBRS: 5.2
X-MesageID: 41501218
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fEGhy6ytmR86uncEvOh2KrPxnu4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf8LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7Le0Utde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwouG4zL/90uW1ZRZn9P91sBObfbstuE5Iijh4zzYAbhJdKaFuFkO0YWSwXYs1O
 LBuhIxe/l0gkmhAV2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2PkwnEttt19z6
 5Htljx3/E8YGKi7UaNkuTgbB1kmlG5pnAvi4co/gdieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlY9rWG6dBkqp2VVH8ZiHW3Q+GQq+WU4SusCZ+Cg+pgEJ82IogOMYhXsO75Q7Vt1t4P
 nFKL1hkPV0QtYRdr8VPpZPfeKHTkj2BT7cOmObJlrqUIkBJnL2spbypJE4/vujdpAkxIY78a
 6xHm9whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+txQpqD8bKCDC1zBdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmyXjRphpL2UEWsF9gKd6Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGBfpIsFt6V2qR2/YjBDdV2iFQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9ow6FX
 EOZI/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsvO0PwerAThsWHdQlprTy6Dy46a/mTPB
 9Uplxx967yBYeX3zoeB9WuNX/fqHcPunSQTdM5lreY7cnoPrM0Z6xWGZBZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdgzH+HQd951hS+xOs5KoXfjtUGRzPtfBEczbnqLa4q6kAwuTz1bih
 la6KkEmoeNnj6pNC8CmugiCUZNb26WGbpCKwyAaOxv6/bWUTA1aV3PqS2Rihk1dGav00kJnG
 TuIReZfuzxDkNHtmpV1bvr911IZnyQFngAGExSgMlYLyDrq3xz2eiEau6I32ydZkAr78sdPD
 vGCAFiaD9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW8GiqMpe0maYPGOJ08J5pOMv1iPICVf
 uSdmauXWrFItJs/zbQimcuOSFypnVhrOjh3wf96nOkmFE4GvjfLT1dNvgmCuDZy1KhYfmG0J
 90141o+cSxN3j8cd6Ax+X8aSVZJhbavG6xSKUJpPlvzNUPnYo2O6Oedz3CkExj9lEZCuzfkU
 sFWqR14LzbIOZUDocvUhMc2mBsrciFKUsgjxf/DeA/d2w8lnOzBaL835P47Z4URnCbrAT+OV
 Oj4zRQ0vfMUSyEz6MbAcsLUBJrQXl5zHRp5+WZcYLMTC2sauFY5VK/W0XNPYN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVmTdgOKpB/yKGRsy1aTj8VdJgwpifOV6WhLGt79P2pDDrSSGjY0BdvL
 Z7TyUrH4x+owhnqpY23Ci0QrH2pUxgs2I220AYqnfdnq684GnaGklaNxb+mZs+Z0gKDkS1
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41501218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2Nx6dVMiRAgyOVXjTAUenM9eoaLPvXQfyOIVwd9Q4TUgo1VcT3HrvTsNJh4oTssJ3MhM3eUbuPUIERVpTvQXV7pqJSLQlNU9F0UEw3jK3wnw8Ydv2qGhF2eEZYS8lwdqxIQ4HnA+Kzx2r4wHcd7wnUgrPud/FBmcK+yAGqO7GmhmPgd9hCDAnPka9++m0MoFxa4PbvBbd+Yxx0bwNf/ZTPTcIQZ35n/p93ZwUk01ZqzYOhEgd/RH979h49tRSBfz4Qj3eekqbmd7M+2p9e+6MVGsq1Z4eRcqloprjYMC269Ydx+YHoZN7GGI0cWSE0iEwr0WPi7diIfiLKHbcr1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpBiGRW58QxtP6gqTw0pLfZYB9sWumOIfXiyVFUVVRs=;
 b=dd+I61jXPIodFii8JaGPzJIh+SXtCRiq8yE11XqjH9D9s4AY3CmwesIScutInOuGGUbsni/LgT6YmuVdWiCysACZUTEDliNPEeoOlRGKJAu+DF4YlxK8eCXci2i8N5G2Q19rgob2895KnxfLMMUyNfHdjhyIY3gF3qtmdtzwL7a4bS9nq3h9lJRR3PNNjEjiWZTYc+kX7ivXJpEXRRxqJoD9vkB95AUG5bQkajY9JNqh6x+Q6DVm/5c4bClJhRf6HGE1nI2jH6iSDuxZEDYR3dQnPSE1HdQ7QwNYDcZxnVC7Bef0yFdjlkk2DKUxsJ47RExtnDSUUauOsjHwsXEDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpBiGRW58QxtP6gqTw0pLfZYB9sWumOIfXiyVFUVVRs=;
 b=ESTXBsT0eW4jpvqZMqkopRpicR85GJ/dY/6v6W9SZXaShT1DPP02fQC/AdyhRXo5dkb37R2L0V3FpaUWc0SYA6YOQxBvQz1aojk7gukbKn3P1wBvchHPRH6+TQYC2LhuwzCbVjilWUD0mH8KUenvmLxVQlHMzMAHQ4Ebe7OXDvM=
Date: Thu, 15 Apr 2021 14:30:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 12/17] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
Message-ID: <YHgx8M06ZC1+MpEK@Air-de-Roger>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
 <YHgM6eTT2OJY89aU@Air-de-Roger>
 <1862ca8d-c16c-8f47-1999-15809fcacdfe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1862ca8d-c16c-8f47-1999-15809fcacdfe@suse.com>
X-ClientProxiedBy: MR2P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b2c6f1-a5fd-4d8c-f1c6-08d9000a4aac
X-MS-TrafficTypeDiagnostic: DM8PR03MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR03MB6216ADBF71B520DA38B70A838F4D9@DM8PR03MB6216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZYTULpa8slIWHcc6H4K5VfKGERI7TlqIxkj7rojyhAMjPSodAKlW4h7D0fNClx9Cu1PyvYodE2R6HdTGYt49UfIdJeeRdjqjNkn+2w7OmTi6DMSRF9mANk2m50YPlFzuvXUK+mj9oYCaw1XOTZBXUqJtwLuGUjYK1ypSJEOdJstPwLe3r6rQVT/fUjScOhcz7TuPqA3IF/aunVrkc3m6tOgt90fcvTcTEFVNA8390Y24NXE60VkuVEw5zUCOOL0NBX31VJH0d1sK7XRRvVXWgfZOycAsSRhTpg0/zJM4tU09+T3fDc51MpnQPg/8F7cdCGlaISJW8ov2gIB14U1Ab8CxnjNzbs0inA9DCOzGtPEWbc+AWMfRowTgWUhhkLK3WBVfRv4wKNGSqT12up0g7qo7aGthh15LeOoLYFz/PdpAsmHLGFTnwHlctw9U1L/Kdg7vNsgx7MdT/vpnUUScz/Gh+ZBj+BLdSNF/3n1EGPiUke2ReaycAvB9Njts63Hb/+nrXGSlQ+2qoZWNMx8KCS9cRsaw5yQeWD1OlAfdaHgr8wJCblp2gogvy7P1ZdqmvaRR3GvskRxgJKUNONuZfgOzj2XV3ZoqV9DFEwpVdgY+7c6FY6EVrF3frMfux8X4L6MVWkCBMh3o/lbTPc5Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39860400002)(346002)(396003)(366004)(136003)(186003)(33716001)(316002)(6496006)(38100700002)(4326008)(86362001)(66476007)(66556008)(6666004)(6916009)(66946007)(6486002)(83380400001)(16526019)(9686003)(53546011)(8936002)(26005)(5660300002)(2906002)(54906003)(8676002)(478600001)(956004)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXNiczdrdUlhTnp3NEpva0tuOGtVeW9TczRTaWRVVlQ0MGNJMnJTSWJZZHRN?=
 =?utf-8?B?WVRkWWk0bUxUdWZRNVNBVkdVdk1wR2dzdTZxZ3plN2c5VzY3MFhiZHJPTFRs?=
 =?utf-8?B?V0g4RjBiTTZ6WUJOanh3NXh0YVZodzdJSXhmSFBoMVNKNWdPRk9jNFdqLzlJ?=
 =?utf-8?B?emxDOExIR3dSa0d4UldCUUEyRW50ZXczMHBqREx3cjFOK0FTdmtIZmlUOFZk?=
 =?utf-8?B?YlEyYXVjWFhJVWJkRlBGalRXUkxKK1YyOTdIRnZsRGw2RGdQTzVzL1VIVDgr?=
 =?utf-8?B?cUhHazQwTzJVNmZaY0N0WXZMQ1g5ZVVsOG8xS2NEaGNRZm5nd1NLZWMrb0xj?=
 =?utf-8?B?NUFGbUtQOUl1Mmt1SitWeTgydmNIemFnWmpBMjZqa2pqWjBrOGxzSnY3RjZp?=
 =?utf-8?B?VWdBMUJZVFdrU05NNjJmVHp4bkVyd3dpOGw4OUJFNWVJNEE1RkkrNU5EY0pE?=
 =?utf-8?B?ejJEejVrY2ZiZ3JhRjkxeU45eXgxQkw2YlFwM0pKZzkrWlppQzdSSlVicXV4?=
 =?utf-8?B?ZDFqQXh4ZmVvdXV4T1ZYcHVoVHFoS2ZnVGJPcHpSSUZwMzBQbHlPMlFRbzJa?=
 =?utf-8?B?SEoxMi9pTnRKbFFKV05sMFVlSW5UVy82WWdyZXg3Mi9HdHpURE0rZ2h0NVdR?=
 =?utf-8?B?UHErSFMzOU9CMXhTdkFDUFpLclJrSy90eGs4amsvQjBMMjFnc3IvUWl0djQx?=
 =?utf-8?B?Rkd6VXRJdkZKU2FHUWNzNStJZjFjMGdFdUFsRkYzZ1gwQjZqcFZMTzJTTmVW?=
 =?utf-8?B?OE91WnRTSnh6ZS81U0tMd0Y1SkRLQWllUmcreU9HT1c2dEphbG01SUU3M2oz?=
 =?utf-8?B?TFJOZlIyV2ZWRDdwSll4bG1SOFIvSG1YY3hkUzVucXdlNjEwelh6NEJLdm1C?=
 =?utf-8?B?TUE2cUZlOHFWejN4bW5sQTkzNSs3YWVUYTN6UGFJZlZNQng5eFZZM2VtUEVJ?=
 =?utf-8?B?aURrOEFuUTlmSlFid1g2SWNFV0s4bHZsbVZzbXpUY21nd1lSTnNlb0RCQVcx?=
 =?utf-8?B?RkYrdXpwb1UrSUlHV1RLVVU4TDNvNGRMUDc4b3dxRWFsWHM2TVBnbElPZ1BR?=
 =?utf-8?B?WndLQjRhdnJQMTNUMUdxOGNyRElOWnRjR2hldisxN0ZCUDIvRFZONkd5bFF1?=
 =?utf-8?B?bFUvZGl0K24wMTI1UkZRbld3blhkdWM2TXprM005SUErcm1vR0dMeERoVzFX?=
 =?utf-8?B?VFY3c1R2U0xEaUNjRDV6ZjdaQ2Y5R0lBN3o4enRLcVdtREVIN285L0lmL0xI?=
 =?utf-8?B?Mk1HbDVtVkZEZTdyelNXQTlQdnQ2ZDF3aW5wR1pUeHpFblp0TWF2a0xiNS9k?=
 =?utf-8?B?VXBadVpzdkRBWlhmU1FDR0MvZEU5aUZzOVlhMFc3Wll5aXozaHFseG84V015?=
 =?utf-8?B?V0hSakE0MG12S3ZHQW42NkdXU3g4WHZ5bi9wVlh4dUYwZTZLa2tzLzJBWVYz?=
 =?utf-8?B?REpRN1BFV0YvUzV1TEhPWE80eGg5V0dhWUJDUTFWUnNtNnNFaTdUZHA4bWdI?=
 =?utf-8?B?THdJcVUyc0tuTmZDOS9yanpZOERzRE1JQ3pRS0dDZ2tHOEhpZHpWTWxrV3Bz?=
 =?utf-8?B?UkVZQnlKZldWQ3I2R3BYSlBYS0ExYW43ZFY4NUZQZUU5SDZSMWtQbjkzcVhw?=
 =?utf-8?B?K1J4OVE2am5Nb1U3aFBmTU9kWmFLY2hWSGNnUEFUVUZFWmlKWnBRb0cyS1N1?=
 =?utf-8?B?ck1SSnM0bGtydHVhT2pTZ1lVbEhweGFDbTNjTERiRlJNV2FmdWhZUGdxYXA3?=
 =?utf-8?Q?QcMcYcxlA+dglVkwMflVmjl//rbiLbTgLzgpo6f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b2c6f1-a5fd-4d8c-f1c6-08d9000a4aac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 12:30:45.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bcla2XYIUBMTYet9sQHF2KBsRoZvjXj8g4tE8S40wCMUwZbS5xVnIIWHmlyTVV/tz7we/hrCqG6z3H5CWUUXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-OriginatorOrg: citrix.com

On Thu, Apr 15, 2021 at 12:37:20PM +0200, Jan Beulich wrote:
> On 15.04.2021 11:52, Roger Pau Monné wrote:
> > On Mon, Nov 23, 2020 at 03:33:03PM +0100, Jan Beulich wrote:
> >> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> >> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> >> @@ -8,10 +8,13 @@
> >>  #include <err.h>
> >>  
> >>  #include <xen-tools/libs.h>
> >> +#include <xen/asm/x86-defns.h>
> >>  #include <xen/asm/x86-vendors.h>
> >>  #include <xen/lib/x86/cpu-policy.h>
> >>  #include <xen/domctl.h>
> >>  
> >> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
> > 
> > This gets used only once...
> > 
> >> +
> >>  static unsigned int nr_failures;
> >>  #define fail(fmt, ...)                          \
> >>  ({                                              \
> >> @@ -564,6 +567,103 @@ static void test_cpuid_out_of_range_clea
> >>      }
> >>  }
> >>  
> >> +static void test_cpuid_maximum_leaf_shrinking(void)
> >> +{
> >> +    static const struct test {
> >> +        const char *name;
> >> +        struct cpuid_policy p;
> >> +    } tests[] = {
> >> +        {
> >> +            .name = "basic",
> >> +            .p = {
> >> +                /* Very basic information only. */
> >> +                .basic.max_leaf = 1,
> >> +                .basic.raw_fms = 0xc2,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "cache",
> >> +            .p = {
> >> +                /* Cache subleaves present. */
> >> +                .basic.max_leaf = 4,
> >> +                .cache.subleaf[0].type = 1,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "feat#0",
> >> +            .p = {
> >> +                /* Subleaf 0 only with some valid bit. */
> >> +                .basic.max_leaf = 7,
> >> +                .feat.max_subleaf = 0,
> >> +                .feat.fsgsbase = 1,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "feat#1",
> >> +            .p = {
> >> +                /* Subleaf 1 only with some valid bit. */
> >> +                .basic.max_leaf = 7,
> >> +                .feat.max_subleaf = 1,
> >> +                .feat.avx_vnni = 1,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "topo",
> >> +            .p = {
> >> +                /* Topology subleaves present. */
> >> +                .basic.max_leaf = 0xb,
> >> +                .topo.subleaf[0].type = 1,
> >> +            },
> >> +        },
> >> +        {
> >> +            .name = "xstate",
> >> +            .p = {
> >> +                /* First subleaf always valid (and then non-zero). */
> >> +                .basic.max_leaf = 0xd,
> >> +                .xstate.xcr0_low = XSTATE_FP_SSE,
> > 
> > ...here.
> 
> For now, yes. I'm introducing the constant because I think it wants
> using in other places too, to avoid using literal numbers. See e.g.
> 
>                 .xstate.xcr0_low = 7,
> 
> in test_cpuid_serialise_success().
> 
> > And then I also wonder whether this requires having any
> > specific values rather than just using ~0 or any random non-0 value.
> 
> I'm afraid I don't understand: There's no ~0 here and no random
> non-zero value - all other structure elements are left default-
> initialized.

Oh, I've worded that sentence wrongly I think. What I meant to say is
that for the purposes of the test here you could just fill the fields
with ~0 instead of using things like XSTATE_FP_SSE?

> >> --- a/xen/arch/x86/hvm/viridian/viridian.c
> >> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> >> @@ -121,7 +121,9 @@ void cpuid_viridian_leaves(const struct
> >>      switch ( leaf )
> >>      {
> >>      case 0:
> >> -        res->a = 0x40000006; /* Maximum leaf */
> >> +        /* Maximum leaf */
> >> +        cpuid_viridian_leaves(v, 0x40000006, 0, res);
> >> +        res->a = res->a | res->b | res->c | res->d ? 0x40000006 : 0x40000004;
> > 
> > I think you would need to adjust this chunk to also take into account
> > leaf 0x40000005 now.
> 
> Hmm, yes, looks like I failed to take note that I need to re-base
> over that addition.
> 
> > I also wonder whether we should actually limit HyperV leaves. I think
> > it's perfectly fine to report up to the maximum supported by Xen, even
> > if it turns out none of the advertised feat are present, as in: Xen
> > supports those leaves, but none of the features exposed are
> > available.
> 
> Well, if the Viridian maintainers (I realize I failed to Cc Paul on the
> original submission) think I should leave the Viridian leaves alone
> (rather than handling consistently with other leaves), I can drop this
> part of the change.

As I understand this is change is partially motivated to avoid leaking
the hardware max number of leaves when not required. With Viridian
it's all software based, so we are not leaking any hardware details
AFAICT, and hence I would be fine with just using a fixed value.

Thanks, Roger.

