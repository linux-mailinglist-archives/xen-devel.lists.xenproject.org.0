Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3E35F3CD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 14:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110569.211037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeiI-0005c3-43; Wed, 14 Apr 2021 12:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110569.211037; Wed, 14 Apr 2021 12:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWeiI-0005be-0Q; Wed, 14 Apr 2021 12:33:46 +0000
Received: by outflank-mailman (input) for mailman id 110569;
 Wed, 14 Apr 2021 12:33:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWeiG-0005bZ-84
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 12:33:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc95bdf4-7117-4269-87d6-1544c5267d6c;
 Wed, 14 Apr 2021 12:33:43 +0000 (UTC)
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
X-Inumbo-ID: dc95bdf4-7117-4269-87d6-1544c5267d6c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618403623;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x/4uq8sCs71gnMpNhFE5GxSJeMIPrFbtZonWsS3o9IA=;
  b=CPn2JZGiKS96+vBYPpK6zSQtU1JVl7E4zFSLKUIIyKVOmQu3hZEPh5hu
   87KAbhuenHbC1PTp10v5HUxEVxK56gPYHgg+IXw9sf3hhd/nJX+m1J4fM
   MnMIqkFqtztDvEPlUqtdv+tSpnNUneNKYhB27jdlIp3EozMxNtmZabGzZ
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Xf/smOsSuhyCyP71FZpm4HUpVU73+cGbDIZNaJ7Ol9XakCMREYUSMzy5o57V7DaKuWkWvkdmOO
 c96CaFfwoxgHmKgPra/GmROvV5Bb5U4aNYGKF8qCsZIdWWqrLxW5RTTRVkGbfVJdO6KDwfjVFq
 jDFNm+A4R40Wpc+ZP5CURNi0sRHApMQAiRfTL+tnXBmYRHooTOIEXz2hG5HSPY+uA2p9rN9oEr
 dN67lGREJI4nRYSTcaG1r2aEwYVDjFSNnIglg3UyflfqNuJiwhcUGZsAcyMwIT9wB2smBIb6RJ
 r1I=
X-SBRS: 5.2
X-MesageID: 41406973
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FZqxr6OaWiLD08BcT2zw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQijtRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUHZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8nacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKjrwPLe
 8GNrC/2N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2DfTv8dEapZXj3HqAOPHzA77bx/bUO/emvPLgF1oE7lp
 jtWE5R3FRCNX7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDYEpGqbrin9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVEDTcwuvMohUV7mmLOKFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqm+xXHvVhwXQRmPNdkTz8YkYKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJPr+5nL4VWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIms9WbcmZC4WufKnZEPoTrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PaJsAhKuZ54PAdokjBpgrHIx9fD+7ViBdqEJPki
 NueQUETkjQGnfFkqO+lqEZA+nZap1bmwekIcldrFrFrkWCrcQTRn8WNgTeE/K/sEILfX55l1
 dx+6gQjP6rgjC0M1Yyh+w+LRlxcmiNOalHCw6EfY1QvbjudGhLPCG3rA3fryt2Vnvh9k0UiG
 CkCSGPY/nEDmBQvW1i3r/w/El5cXiceExMeml32LcNZ1juizJW66umd6Cz22yeZh85zuYRPC
 rsTBESLgltrurHniK9qXKnLzEL158uNuvSAPAfaLnVwGqqM5DNv7oBBeVo8JFsM83OvucHXf
 mEQRKcKCr1BooSqlWoj0dgHBMxhGgvkPvu1hGg0XOx22QnB+HOZHthXLMWLrinniHZbsfN9K
 88q907veG9aDqsLvGHzLzadD5FJFf4p3WsQ+QhtJBTuuYTudJIbu7meAqN8EsC+hM0aPrQvg
 c5Zo9Q5bjaII9hf8AIYUtijxEUveXKCHFuixD8B+81QEokgHDaNe6Y+ragk8taPmSx4C/LfW
 SF+yJT//35TzKO+L4TBaU3O3lXYiEHmQJf1dLHU43bEwOxce5fuHK8L3+mabdYIZL1VIk4n1
 Jf49uSmfWQeDe98AfMvSFjKqYL12q8W8u9DEatHuFPmubKdWiks++P4MSpii3wRib+Q0MEhZ
 ddfUhVV/99sFAZ/cUK+xn3bLf2rEIjm0Zf5j8itmeF4PnZ3E7rWWdcMQPYhZ1KWyJ0KXbgt7
 WczdSl
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41406973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnJaHhP4LY9uTrkpPFya166EsEVgJ0RbRtfC51rfUQTe4KcwrUlF5XnnjKUdblRaM4UqqvCzscwc3h0EgePEuZvrpyr0IL5U9H2/ipmXvbuq1BGTAO6FtbO94bY79QQ7tlXHVIIxDL5LLGW4R4QzTTNT6nE7b/Rb+B56WcQ/MLtPRpL8SxxDqAGzzKcJgEL8PfWh2bEEAnHwKtsR3zoKpwDefil6zGOU08pNcJl4q6ldGz503/EMBSBIohUgBQBsK8+C6KHondlpcq40A5fa2zKiIStwRzTmXOIzia50FmzB3AVjPwCOUMUS9VyxKvyQaiANPM8XNYuAIJL6vCZtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdrWTVRDpWGQ+ZmkwKViYjmCXaX2VRGaKGVPHDmvVBM=;
 b=jf62b4aKKYTPItqSHgbAaRiuBPe1d0OVB37mrFSIeu/4pFjwBQQggfxcrnHeJ3Ht9yOmtmyrXosDezSnSCJ92oRI2m6eduVEYbUafnfy4nGwKG9rPPwKjerXq0FeYuI4CohTeeAknDIFSrOVYoXxqqaeOtXXI+3nqgXxeLsObOaTajR/bqcxwNN8VHhRtE/cm9owpmrqLu1G4TYqodRwJ2A0lSAN50I0rNAPHtH9EDZaTLQCo1KwBgyLT5MSjgOUrAHb0nJdKJc+QZJsaUKeCZabkwXeROdh35idjvebmD+wDsnBkfmSgjM0vgSRb6O0qV9COljqB397EjeS8DzxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdrWTVRDpWGQ+ZmkwKViYjmCXaX2VRGaKGVPHDmvVBM=;
 b=dPlUHV/iLMqhWPVRomocrnnMYA67SULKdnDorVnclfdnVvFUrxktkI4L4pbLRA4UYQoW7MbazD0lFlTWERGNWUeX9Gowcb8PmVgNvV0adH5dVVCT/ragr1rIKg3l2Tv7W7ZRiemWBltEqYa6mHliFt0TtKKFSGoaMSGrDxWuY+s=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
Message-ID: <97d443b0-f5c2-0183-74c1-ab16d3cf1e7d@citrix.com>
Date: Wed, 14 Apr 2021 13:33:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210414110433.83084-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0402.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7df8db4-fe1b-4b6f-c1ed-08d8ff418863
X-MS-TrafficTypeDiagnostic: BYAPR03MB3496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3496DA202D2641B69815E1B6BA4E9@BYAPR03MB3496.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVvTxO5HmoHdO2IC4ukwitHgE64OaBN59pieuY7h62/cTq4hKAfVpYzmj+9O8u1Bei4WXUIMwOLj/iZCTqHCMNR4EdAGFfti9jK7nefMOzL1v/T86C9poIWaNZ5Bbh2BphUJ1fHS/jiJyOgPgpPmRvZrbL6eOt6kRD2syMPZEElgXiL/29XtmZxMwInXvRRd+UT1E4TkkD/33+u0GiLa8JYpXmULHtdPX9TnVnLcUMiFWQdnNIb14dv6wHCbTSo/AdajnQhIEFdgnfKHKtFmDnHvpIZeSau5Rjs7jt31O0RI7qk3mBm3Ze7v0ODboiRLDmprerexzkHhvVUPKRWe+oa+mlQkc0XO9nDvL49Co8Od74yjSOw8pxXh9M9AW5oAKonTuAnvSXGuY1eS3VcHYzgbR6LUsmfA3C70PJt2V2dJsqSJNi0bxrJlscLLvHX8Vr6M8B5PyBYoyp84xzCnZyzEmqgqTcbmH5owLzMMYVnGnVN2NEbGI4DG0S9Z07+qGJhSHqZkejFrd+YeNL7wsTg5jKsJR1ODV5E5HiwM4bPultnjK5LKVUg6bkUqp+bLS7AUCXIb2wACAkMnls+yMAlhREdG7jo4jpE5i/syiF4EJQoOo82/GSwi0NgvjWOskOYSsoiyX8lK6NZZQaqmOuhf/zgYDfx2okArHSv0vu4fK+4vT23SfOYkuOk+DUmm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(366004)(83380400001)(86362001)(31686004)(66946007)(956004)(36756003)(66476007)(38100700002)(31696002)(8936002)(2616005)(53546011)(16526019)(186003)(66556008)(316002)(6486002)(4326008)(16576012)(5660300002)(6666004)(26005)(54906003)(2906002)(478600001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEZ6Wis4dE8ybHpDRDNYcW9tRGxFMzdnU0h6ZHU5TUFVTVhoQzV1N2U1MXFT?=
 =?utf-8?B?UHlOK2RtQUJlSHdkRkVsblZqdWhDWXBOQThTN3UwajRkRGV5c0ZRQ1dNb21q?=
 =?utf-8?B?K2tPT3A4OENXSVQvNlFYQWN0LzNGQ1VUN0pscEpyV1JnZEN6SzdHTExGT1kx?=
 =?utf-8?B?UTBEeHVsYzhOdHVGSHIzVnhHdm1Tc2tQTncxSTFXbk5pdDkzeE9uQUpJbU5S?=
 =?utf-8?B?T2NmdkZ4UEN2N2JQdTluZzNCZWZXeHBPQzdTc3VoZS9QK0JHaTV3Z3Q5Wk1l?=
 =?utf-8?B?U1FiaWdVbWUrL3E5WVJaQk04NTlPRTlpNHllNGk2RUkvMzB6eTdxaGEvaFBK?=
 =?utf-8?B?M2h2bGVOcS95cVF6VG43THZNd1NIZWJoMFFoR3p0Y21oSGVaamNaQkhpbWxs?=
 =?utf-8?B?cDhreGc1MGVSV1Q1dDZrRzBjdWFuampYck82OG5DRmZQWGR6Qlh3RndOdk1D?=
 =?utf-8?B?RUZRUDFHbXBVNWRJdEkrMHpLUDRSeU0zbW5iRjArOWhFaGkzTSs5SHZXbGpZ?=
 =?utf-8?B?ekYvS2FHc0dTN044UzF3VDZUZWZ6TEF6K0hJQkJpUTJNNWdocGVLR2UzZDJp?=
 =?utf-8?B?YmVwbzVOcGJQQkdQUXI2cStiVDVwMFpVTURWV01adCtmWm8xcVVWVllGcnNT?=
 =?utf-8?B?VlpzODdTZDZxVWQvYmFpRFJJVEtJOG5ueXA2cmlDeHdUN1VldUtRTTBZU2Yx?=
 =?utf-8?B?cnJBbEY3NmFKSnFhYisxNnpoSmRsWUphbkkrMlpxaHEyeWJsRzVDRHRNUDRV?=
 =?utf-8?B?VU9rNXpKUnZIOFdEWm94ajdoNlQxVnBJUmpiNkpHbmJPT3RSRlhSVjZYcnNY?=
 =?utf-8?B?cUt2QVRlaDRWbVJpWVFVTVJpd2w4QzkwZUVYQUpzdDU3TkZDWDZNclBwV3gv?=
 =?utf-8?B?WmlOSjV1KzNrSkxTOHA4MmVlREh3TEJYZmU3STMvNmpwZGNRUEpSNkxVUDlo?=
 =?utf-8?B?NnVnaWcrL20wMGR4WDZkS1J1LzYyS1ppdHZkbmdxQldmdzlLclVkNnFxSG9z?=
 =?utf-8?B?Q2d5RytxYzZpK3JWRDN5MVNjVENoMStWQ0dsV3B5RGp6Wm1CSlhjQzN4Vk8x?=
 =?utf-8?B?aEpteVdGMHdNRnM2SEpVaUJ3VDRXajRYTE8rZDBlb1Uyb25LUDM4OVluWk1u?=
 =?utf-8?B?ZFRwT0JHb2FReDQ2a2dHS2NGTTBDS1ZYbWx6SUZPSnNXdmtQWVQzSXFWWWph?=
 =?utf-8?B?eFNlbTJSUlNVdmk5Nk9BVSt0aTVSVDZhNlRwd1lOL2lFQTB4cURHcEJUS0lh?=
 =?utf-8?B?bTJOczYwT1ltVENEVytQSXFhYUZSOVNITjh4bUVwN1FYYmZ5b2ErUU9JT2FC?=
 =?utf-8?B?aFBVYWRXSDZxQldqVlI0bFJGNjFWK0J6bk91MDBZTUlJUVVDRWsrZ09WQ2lq?=
 =?utf-8?B?UnkycVJzS1lmRSt1QTRmdnhnaWhPRnJFYWdBL2g5L1k2TmVJWTY2TEtoSTUz?=
 =?utf-8?B?bzhJSGw3ZS82eDYyRkJSNll5cVRWQVVrOTBoQm9JV0U5aWtubTBHOEdka2xZ?=
 =?utf-8?B?UE9VdEZXY2RSSDVwRDJWTUJORSszTExwZFVPbEtMd1ZTT3dMc0daV3VvdUtC?=
 =?utf-8?B?bUNkUkhmL0dURjdxMVBGdUh5c3pacUlsVitZUG85SUovRlo2N1RRdm81SGdw?=
 =?utf-8?B?YUovNTI4OGtLWE91dnpuUEdRMkV2Y0h2MWVXNkg3eXpLV1VvL2lCOGpmQ24v?=
 =?utf-8?B?MDVJYktYb0hGZUNYV1RTakUyWFBwaG5abkpPTnZDZEhYUXhPMEoraTk0cDJj?=
 =?utf-8?Q?mB/URKzAUUPN7e0kmc4ncXxthebshtToaWOrDtw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7df8db4-fe1b-4b6f-c1ed-08d8ff418863
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 12:33:40.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hGvfskBFsozqGiZeLKQ6WNkF/Cw4V7ETocr1o4EF1crVRorvyUJsTA0NNBTYdlbyGDX1aT8r+7WwtO9Ui6y+Wd136d86UYU6XNyuJxeWyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3496
X-OriginatorOrg: citrix.com

On 14/04/2021 12:04, Roger Pau Monne wrote:
> Milan AMD CPUs

I'd suggest "AMD Milan (Zen3) CPUs" for people who don't know the AMD
codenames inside/out.

>  have an LFENCE Always Serializing CPUID bit in leaf
> 80000021.eax.

Its probably worth noting that this is because of SEV-SNP, which is a
headline feature in Milan.

There must not be anything the VMM can do to impact the confidentiality
of an SEV-SNP VM, and breaking Spectre protections is definitely a
problem.=C2=A0 In a post-Spectre world, no system should be running without
LFENCE set to dispatch serialising.

>  Previous AMD versions used to have a user settable bit
> in DE_CFG MSR to select whether LFENCE was dispatch serializing, which
> Xen always attempts to set.
>
> In order to support this new CPUID bit move the LFENCE_DISPATCH
> synthetic CPUID bit to map the hardware bit (leaving a hole in the
> synthetic range) and either rely on the bit already being set by the
> native CPUID output, or attempt to fake it in Xen by modifying the
> DE_CFG MSR. This requires adding one more entry to the featureset to
> support leaf 80000021.eax.
>
> The bit is exposed to guests by default, as a way to signal that
> LFENCE is always serializing, either because it's mandated by
> hardware, or because Xen has performed the necessary arrangements.
> Note that Xen doesn't allow guests to change the DE_CFG value, so once
> set by Xen LFENCE will always be serializing.
>
> Note that the access to DE_CFG by guests is left as-is: reads will
> unconditionally return LFENCE_SERIALISE bit set, while writes are
> silently dropped. The MSR is not present on AMD Milan hardware

Not all MSRs are listed in the PPR.

This MSR does exist, and is my understanding that the bit still exists,
and is read-as-1/write-discard, so the past 3 years of software will
still conclude "lfence safe" when inspecting the MSR.

One of the speculation whitepapers says that this bit is going to remain
fixed in the future to simplify software needing to interact with it.

> , but
> I'm not sure there's any value in adding logic in Xen to also hide it
> from guests when running on such hardware.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/misc/xen-cpuid.c                      |  6 ++++

Need to patch the translation table in libxl_cpuid.c too.=C2=A0 See c/s
23ccf530431561 for a reference.

>  xen/arch/x86/cpu/amd.c                      |  7 ++++
>  xen/arch/x86/cpu/common.c                   |  3 ++
>  xen/include/asm-x86/cpufeatures.h           |  2 +-
>  xen/include/public/arch-x86/cpufeatureset.h |  3 ++
>  xen/include/xen/lib/x86/cpuid.h             | 37 ++++++++++++++++++++-
>  6 files changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 2d04162d8d8..38406baadad 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -178,6 +178,11 @@ static const char *const str_7a1[32] =3D
>      [ 4] =3D "avx-vnni",      [ 5] =3D "avx512-bf16",
>  };
> =20
> +static const char *const str_e21a[32] =3D
> +{
> +    [ 2] =3D "lfence-always-serializing",

This is a bit of a mouthful.=C2=A0 One problem is the fact that "serialisin=
g"
is an ambiguous term, because neither Intel nor AMD formally specify
what it means in the architecture.

There is a description of what "architecturally serialising" does, which
does occasionally move over time, and the name of this CPUID bit in the
PPR confusing at best, because it very much isn't "architecturally
serialising", and the term "dispatch serialising" isn't actually defined
anywhere.

Intel have now started referring to LFENCE as a "speculative execution
barrier", but this still doesn't have a precise definition.

I'm afraid I don't have a useful suggestion for something short and
concise, which also conveys the precise meaning.

~Andrew


