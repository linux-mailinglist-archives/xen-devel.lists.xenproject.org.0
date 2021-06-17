Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9853ABF16
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144182.265442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu0oS-0004jP-2O; Thu, 17 Jun 2021 22:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144182.265442; Thu, 17 Jun 2021 22:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu0oR-0004gY-UE; Thu, 17 Jun 2021 22:48:39 +0000
Received: by outflank-mailman (input) for mailman id 144182;
 Thu, 17 Jun 2021 22:48:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zva=LL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lu0oQ-0004gS-2h
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 22:48:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 016e062f-ea28-4a0f-b704-083bc53c9862;
 Thu, 17 Jun 2021 22:48:35 +0000 (UTC)
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
X-Inumbo-ID: 016e062f-ea28-4a0f-b704-083bc53c9862
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623970115;
  h=subject:from:to:references:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HM/n+svpzCMCAw7P5nyu2u5TMosY8jl+AuHp9cgJusU=;
  b=CKgELV7S91o+F04qKmgVmeTtiHVqifMME0EujD7lH1QgMCm//deRx68v
   lzUJpYctZTw1BSTbhzIHTN7whGX2OZodQVlJfh7tV8OtQe3RF9slbYlmX
   2IsvBlIbXDUMtXKHEJ/6SDp+FmihULYKIguNMuip6kGjxUS5vD1M9G0TS
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +AK4SJE94AZL6187BtVL0/47GP0hBxQQFf7lHpGn46zu63t2nfHCK2O1cYToOgRwctfTTzGriN
 ZYoHOp2FbHK63etGbl7y33CJ8Xsh+fihiYw56xib+nixUCC7u82nQYccJplXWDJUEYshB572dH
 +4FpiGCRLN5jt5fXw5+5FCmWsXsaS0ZBMObWu+QY+UBpwp8P2N/+gQwHkp6AftKrKSIfgLc7io
 5sPnLdAgxMadGM1vpFUsYeLsrYFvSGwVWb8CsYXA5PBv4QZjRcxonTzRqMQYavFxCDqkCJEXv+
 VBM=
X-SBRS: 5.1
X-MesageID: 46418269
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lWzhFaNq96AeXsBcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ulfq
 WV9sjzuiWatN98Yh8dcJW7Scq9qBDnhPpICOsqXYtKNTOO0AeVxcNZnOnfKlXbcBEWndQtsJ
 uIHZIeNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-IronPort-AV: E=Sophos;i="5.83,281,1616472000"; 
   d="scan'208";a="46418269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6+Uypa9N1PJHe9bHHUk6kXGAl+DbPAuK+khcmyGTcI+pwYjHV8XRDAJWBah1S4cqZOUBBQUAEpLFmYl0yBHhjxZsgeM9h2aqZbzpG2G1lKab7j+MpE9Ox6tSPFsZyMtAM5DOU7beoWMtGLiJrVsAgSSdCEG1xkYUv5kLtabmniXCvRDfL0WwkU0MM3hN8UsDvmjATVKESEQAMItAeNR0AdXakucweihBtGZ7hLLu8TX1p4Y6PCfhx2Yi7f4i/ATRPDBsVPTs0RCy3G7p3U/DFZoVKixl1Yt13d/KdgQqYTUIDr899KY02KCoDQfGezM5eC4Rv0TjELUkwkltuLB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM/n+svpzCMCAw7P5nyu2u5TMosY8jl+AuHp9cgJusU=;
 b=kDRl+PVMVCI9IZLObp0s3Nk6U4Sm8UtesNvbI05Z/y5B8EoTg+swgQQ0OfG8ag+bHIm7v5te6t0NowHvFDFQp2wp6gF7ueh39N2TzXVOwtI8VTEphE9JvuOfu+8uOWLVJb/g9349jA0SVW4u2+vLP1wc7ZLjJwFm6450qaiXQ7LNouh+AUGLgpwnxYEF9ul1QmM2k3NS4EOmU8Jn5M2MdE4Qghup3YCbAqFuWCVM7zYHslLu0UhLypUOtt6sjD6ynD6Sn/3z9t8xK1TLK4ywzHKHrEjMLR7X1P/wqaMVj2sXA8rWDORmndYTf0xxpZN32riVkokJBpk9oRK6bxPAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM/n+svpzCMCAw7P5nyu2u5TMosY8jl+AuHp9cgJusU=;
 b=qE3x2k+hr3XM5wOvlKdMvsvJFlPX2sHg9qYjrFQrIH0J1+OUXW9xOo9J2A8qlVnIDYNrVbArSANk74T/X/24CX3USg18lsU+UkN9/9Uu2RKLrgdTGVKlgpFDfaF6NzPllQcqrDtlqoUbNmrFAb2uSChKX+z10D7LtkqUgPVk3fA=
Subject: Re: Backport 6d49fbdeab3e to 4.14
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
References: <c8af8c5e-46cc-ab85-0364-0840d2309759@citrix.com>
Message-ID: <bc25e94b-a9a8-405e-4cd1-299d60f44fcd@citrix.com>
Date: Thu, 17 Jun 2021 23:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c8af8c5e-46cc-ab85-0364-0840d2309759@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae62f8f-c4bc-42a5-7b2e-08d931e207a8
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:
X-Microsoft-Antispam-PRVS: <BY5PR03MB4967F89B0383DE7B61873FDFBA0E9@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCDoFn8bLcPg2PZDyZfJvPDOqcY7quiMrfcPVR2X36xnsUfbB4gsyTikcyBpDvsSPti85+X0po1aGzDvULM822EddVwG/cAvUA52S7+n7IToxeeTWwj68IVHsGJJ2lfEvvoxuHAQTHqpe29tZSiOHpzrQxNIkcBcn8CWtbKVtDEugqZrFcTsg+BPTNtbmLSD94S5yX8bOrUhDx+vhtDFRbiQ0CkyC4Y/0kHnxpT3Zj+SZB+1b5NVy8lh0YlIlhDy6p3XObH6b9IdAMa9jlzYqjY2OqAJHutuGqLPCG0wWvL0cDz/+HAO6adcJiBOWG3rAbfzRhnA8DiLvJ+YpevsB8KOYNaCLQy++qUZuZfUorqBvoC+jYNsBshoPrFyHhgym+rWtj6nMqEeSfovKIKPTTBmS7eqRuCOuxGePQ/rQjjL/F2ytla78K6HLSZG09twdabiVQpFiUOdIIIsKv3xvEU5IJ76xb6U4RrnWqYLEFpoj1nxMFgM5TBSsWpi5HS71UzvtbDQNwFycZvkWmlyzXe2Y3IpKEE86LNm1dB/QtK1XiWvGzI46jyUa5M7urPEx5SB3wF1mmcd1hHig4QOSA10ppORJT/nfpj+9yLM7Ed0vP2gDDQFPbQ/oHklG0hMoLulAWeV/z5kqun3JgV9xmgYj/6wSF7EUbZaLvspVEcKmP/ndniF1w63XFNd7igZJh2WFQ7krCPB4IQd/rYs38qlUmE8inhtaOB1vigIY3PhYIwW8YDgcHXrvl/jNDloOiwaQ5eMk+w33xlqc/5IrhMhUJgUkRvDgprJzFef6jQnU15HKr/0zpObHDUIzY4GA78xcmLv2vUOkNasYVdgBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(6666004)(66556008)(66476007)(16526019)(16576012)(66946007)(6486002)(31686004)(186003)(31696002)(53546011)(2906002)(26005)(5660300002)(110136005)(316002)(8936002)(966005)(38100700002)(478600001)(2616005)(8676002)(86362001)(36756003)(4744005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkUwc2hmcTFKWitsNEVHM3ovVTJHMWZWU2R5a0RQNWYyYlI5Q1dWNjY4dUxF?=
 =?utf-8?B?Mmp6QkY3UHhydTRJcTM5M2NIVlR2QUlaUVh1S1hWc2NhRFdGcFoxTzk0SFNK?=
 =?utf-8?B?MUZwRy9Cd1l0T05xZUVOeWhldXlVYTFUUWk2Ym9BZGdxSmlGQmlCT203SGpF?=
 =?utf-8?B?MGNhdjhDOVhQZHdwbUk1VGFMNWV1TlorUG40TFFkY3lxKzBuUTFseDFPZDBR?=
 =?utf-8?B?Vk1SQWtuMFh3NUR3VlB1WTBNQ3kweVNteXJndWRDVjd0S2x4NkxMY3JIdHBX?=
 =?utf-8?B?STR4UFF4YWN0d3hBVEdXMW1pRGlRd1pVL2VERTJFUkpOa0V2Um95U3RuOEVF?=
 =?utf-8?B?TityTGR2QWVnOEpxZ3pnV0Vid2NaK0dSY0l3ajZicGNHbGZIKzhXK1JzenJC?=
 =?utf-8?B?YVl4ZFpLcUhaSFdpbTg4TkxkZDNCWFp2eVYvMGpDdGM1ZmJ1MHdvbmVGc0tM?=
 =?utf-8?B?cFlXVGJYZ2pKdElEbkJLalpFVnY4VFRsbjZpekkydWJBeWtVSzl0dnhFby8z?=
 =?utf-8?B?ZTZZcHY1V3JsV0xaN1BjaTRma2JyS0hFZjlHUmFrdElXR3creDVSSnBmejRB?=
 =?utf-8?B?c0ZBY3hhSnJ5OXR3Q2I2QzRZM2NPWEIrVHgzZTR1R2l1azVyTUdwS3JMbEdP?=
 =?utf-8?B?UEJzeXV3RTRzaWF4S2RlOHZzNkplenVzVDRHUUhVVVZlMkQ2Z3JOcFhyKy94?=
 =?utf-8?B?NW5qZVRFZkpsNmtCb1VXSGIxdkxlM3FxSFNVc2hvb2tFZktXUUE3WWNtbjNx?=
 =?utf-8?B?SVN4RWlHWDc5Yjc3cytiekhkZE1udTljb1lFcDFtSUh3RHlhRHBJWW9HUHN1?=
 =?utf-8?B?aFcvZXo1YkhtMElBK3RJcm5wK0tzQUpHUjJOY2FFcUJ5YWU5cVUxYStzQk8r?=
 =?utf-8?B?RU9nZ1Z5cEFZZTg5Ti91eUlVYW5UQmlnNUVIdTF5ajBWdUltVUszOEwzVWt2?=
 =?utf-8?B?Q1JyckVNRTB5ZWU2bFJEdTg5TXZ0NytGek45RmZydkNDU1dCWVhjeG10cUxM?=
 =?utf-8?B?N0oyb2hUc0c2R0tuVk95N2tFTldZNXdkYUVaNEIxdWpQOVBMNTlRN0s5WFpN?=
 =?utf-8?B?Y1dYblpKRG1ORkFBUm00bHROR1luOEd0VGJvOGNUMjIvOHdNQm1lMzV2WWZk?=
 =?utf-8?B?OC9nM1ZGc2FCSmUvSTFMaWhVdk9kTmtDdS9jQUtWcnllejA5S3Y0K3VERURP?=
 =?utf-8?B?eFRKNXV2WGYyM2R1OUE5Y2JtZnRpd1Job2crZjY4amJDeGFTSHNEWE9oV2tu?=
 =?utf-8?B?c2wzSHpBbkpDM3hTOXRnVUVBZHV3OEtITmIyenE4MnNoWk9MeXkzUDBVeHdS?=
 =?utf-8?B?UXU1WllvOTI5K3ZiWlY4Nmd4UldZamdlZ2Jad1BILzF3MklnYUFEQnQxL25Q?=
 =?utf-8?B?VmYyWkZpOHl5d25oUmhMa01FYzdOTCthbk5iVTFhZWNpbWd3NVNsM3dUaGxp?=
 =?utf-8?B?bGdueHJyTmlQMnE2cXNFMm85MUVpVVFzQk1NNlFLNFRvSEdwWE1UVDdHSkRW?=
 =?utf-8?B?Mk4rSk9kYythQUx3ajN0VlpLUkVCSWsyRERXYzBjNnNNK2xmMnp5bUZhckl6?=
 =?utf-8?B?OVdJUG5hY1kzdkNIaE40WUh0bkpNQjJZRzZpSksxNGsxSHkrOWdTcktDTDA3?=
 =?utf-8?B?ekg4RlpBUUcxQms1VlU4YUtHUzBNZ0IzaG9zM0tRUSs0cFJ2MzdiYlZReDUv?=
 =?utf-8?B?eGhXTVdaY3RmcUE1M1J4NEFZNVdoOTV0YzEyWEErc2t0ZzFhTGpwUGcyZTlH?=
 =?utf-8?Q?aQXPVc0u5/fFimYht9G0VMFSMbuJfuwlF/LOdrx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bae62f8f-c4bc-42a5-7b2e-08d931e207a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 22:48:31.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWinva7gnj3CpDD66M6AeysHZM7zMIQPRSem/03oZC5dmOcTqOX2grCnhJp2KzYkTQCiN3xzXrzV+1lu1SJBBwi43eJRqgCghrY6eNNqWTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On 17/06/2021 19:24, Andrew Cooper wrote:
> Hello,
>
> Gitlab CI on 4.14 currently fails, e.g.
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/322762306
>
> The problem is that CentOS 6 (still supported back then) has Python 2.6
> in it, and trips over the bug fixed by c/s 6d49fbdeab3e (4.15).
>
> From IRC,
>
> 20:18 < Diziet> andyhhp: golang is experimental and the impact should be
> mild so yes, but please can you c&p what I write now into an email so we
> have some record when I have forgotten again :-)

And for completely,
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/322943251
is a CI run with the patch included, green across the board.

~Andrew

