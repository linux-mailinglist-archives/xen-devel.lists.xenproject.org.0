Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB493A1007
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 12:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139159.257396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvEm-00029R-Qm; Wed, 09 Jun 2021 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139159.257396; Wed, 09 Jun 2021 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvEm-00027X-NB; Wed, 09 Jun 2021 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 139159;
 Wed, 09 Jun 2021 10:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqvEl-00027R-JU
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:15:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c8032c4-38e2-403e-bbf6-ea3eb08d0734;
 Wed, 09 Jun 2021 10:15:01 +0000 (UTC)
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
X-Inumbo-ID: 7c8032c4-38e2-403e-bbf6-ea3eb08d0734
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623233701;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lTAGjxPCj0KzK7t4TmR0qb8g1QfDeawSDUk5Z7yEDS0=;
  b=af0JbPjxN8n1T8IZdUAgDzKodfnefJ8iR3/YTqPtFHGiN0brQLvDmWcq
   DG3VV3XypdDD70usKfB3lIwP4WEM19QcAyRQu4ipzlKLtkLx22OrdDPkg
   +4M9lvM/kM7pLZ6PiYIaxQRG7cgmNuJvZbTZxSUF421OUc/vJN20S7UIV
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NI+phZomRkQnU8f1XHD0T2r6gkEykdQ6ynez8kyGW0+au8gTgzG/SXXMhbwoVd26INt/iB6U9c
 Cx70502k4aPCzlsRkaUBbnpbfhnkb5zl5Nxr3zH5kYf4WF6dYiXEbsGuIjFh1q9SV8G0sW+l+q
 l4bwjphhm0aMDcaYKgu5qi1ytX/ppkmPHqYr3OIA+9yWp9nt0mE7G9oOmG958ke016pt9a5fPk
 m3PMjmks41P8VtDPFHZNDD1BDFDScx7RNVo8VahltQnECWsK3BedBEiXJAi+bAwpnkBIVWu5Rr
 CMI=
X-SBRS: 5.1
X-MesageID: 45709801
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tlnig6lIvbddNGUxztrLIjh3zr7pDfO3imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICPoqTMmftW7dyRSVxeBZnPffKljbehEWmdQtrp
 uIH5IOceEYSGIK8PoSgzPIYerIouP3iJxA7N22pxwGIHAIGsMQmzuRSDzrdHGeLDM2dqbRf6
 Dsg/avyQDQHUj/Iv7LfEXsCIP41q32fd/dEF8771lN0njHsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq80+oqqj9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xih7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriaknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdI99RrBmcYa+d
 RVfZjhDK48SyLDU5mZhBgs/DWUZAV1Iv/cKXJy4fB8ulNt7QVEJ0hx/r1Sop5PzuNmd3Hoj9
 60eZiAr4s+OPP+W5gNSdvpcfHHfVAlfii8eV56AW6XW53vaEi95aIe3t0OlauXkcszveoPcd
 L6IQ5liVI=
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="45709801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyI9psgFfHFJBHpFaPZDNPUKJ9j5OBhOyEZWfwxIaRP7RP4vWaQsR0RwfDXt/nJfZqVbBPQvisPxKI0ymS2lr09Jpkov0B5vUZ2BG6QTg3t96E2UGXGr0GYUZoqvmN/wFZwMARlk3H2+RESeLhAGr2OkITXfRMJo0TflKFIoXvCLK7MX8pVpSqaOYTlbelzkV381FPjofUQAr93+/+Wzq0DVrA/vX1lMEvlqbOTUSqjCiE4dvflz0zfQKMHmVXI7l7cx3q4aqJIqTfHzVB7B4SDycefcd3jBmp4jYCyTa+racZSl5+9GuuI2bbE299Ez1zUx67qaiePYw2X+A2X1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRr5FKRYhqIeN9TKQ9MRapuck92JpOGmCbzbsLrxdRw=;
 b=SUy5Ci/hAdjXXMGVtexuBnT+iD6LK4+1ktxQ3YH63+ll31JJFUyP2BozkfewVrPPXVP67v8Fk7jVlAVFcdWZy+as8piPIfsDmm7vUF3wR54/1XeN6XKx/MU0Z9DQF6XXX5KTIfnBTYE9ojvVaTdTXCkMqYsEgSB8OotJzfB+5uTruk2CQEO/QlYkjX+Pj0axbI1WHaC5drjfma3X1YnHOdRph8LrbnJQCHnqbRgoA7Ndhz/5dinUSdQsNxo5LC7DeoEWt4gsrMcG/1ORisYMMGYyAsy2QCPvhVNaqL1pC9wMBvTeYpI9DI17mLAOUBshLZ+CYXQq2MDbid1IBJjKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRr5FKRYhqIeN9TKQ9MRapuck92JpOGmCbzbsLrxdRw=;
 b=qVe/77NO4ZUmVcB5P8Iw5r/3d028oCNxs0ZwloSEg+ko2Q8siyXsGReB4cBGsWa30MKQnmxg1oE77UjOO1dq3BqP9PlWXGaF2q/hviz2rrwRVSno8q501tzl89zFOL6JOvQwGkV/oz+gP0XBI81v8Aq/MegzqfXIUM6xDN5ElLg=
Subject: Re: [PATCH] MAINTAINERS: adjust x86/mm/shadow maintainers
To: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <YLjUM0Dzqn0lWA0l@deinos.phlegethon.org>
 <ce4b0cbc-2168-9320-d4df-ff9f27fb4559@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <476340d8-3814-7210-9eff-eb3aea94c880@citrix.com>
Date: Wed, 9 Jun 2021 11:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ce4b0cbc-2168-9320-d4df-ff9f27fb4559@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546e7868-1e3f-41f6-bdf8-08d92b2f62b6
X-MS-TrafficTypeDiagnostic: BN8PR03MB5124:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB5124E488770BF3A8BB9A0039BA369@BN8PR03MB5124.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZgcfOsUb1dacNcQUExqOWBFwDnmAEqyr5JkyBw+K/SPL9u+8uMzVvSrt2rl58CNIV+kqwL+tvjXk8V38hCxbG4pH3BPmFMuJz47cw4fexmnDzonvhfixMkPQ3CAQqng9YN1x7UCxp9TMZG77gB46NbMdnmqKiXN0cc2aA6a+Rq178zDwCkrrCThyKOVoFDvk/6q/s18isx1/BlvGPGrSfqKClnChJ8/PkHxF93zrJdSxt8lrnLCAbt4hDOYtpdCsegCfSTlXWV+CAqeJI0j5baFq+ra2DIs2cHqSg0i/P0yQojmYl6dqA2c3GeUv0r34eSKLUjMTNEicurCTCcgODu3X0WnziiFj81LkSR3NIxqTE6BQ8bUKn95awteojTcT3NvfNY90b7NYGhFlLZCXkNEYzX/IJI+odrkKNPn/hg0edt2QYE6F9GDywOm6tEt9P+oeh2ZXDvbYYFdgTS29gQr7v49qpjyGvkaAJmn7rgie9I6z99Ad6Zp+9xkgD0Ug9mxDN7+ESGa50eqS0XOfrJc95bxuCj/57AtcUvVNg4ppRTT6MFbFnnaE90n+QKWCt5YCLLQVmbi8sPwXKtcru8ZM1mrn4jXAIuX2ODQBghLseeyR8YVM6akgPgO0iKSWNB7ZcvTUw904UmiLFE901HUkpXiWmp3MOFubncTgKbwVpLgugOqskhtF+2sRTGr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(2906002)(4744005)(478600001)(6486002)(54906003)(110136005)(16526019)(8936002)(38100700002)(186003)(36756003)(8676002)(53546011)(86362001)(66476007)(66946007)(6666004)(5660300002)(956004)(316002)(31686004)(4326008)(66556008)(31696002)(16576012)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZlbEVOcXo0VzBoNXJoZkticDdvSWhDZ2pIL2RYQVZHYjZmQktFZ0J0RVdo?=
 =?utf-8?B?VDd2VmdtUjhVTXVMVGVhU0IyeVFWMERBUGl2WDVLbDFuV1I4bzdPYVZoaklw?=
 =?utf-8?B?MVFOek0xVlVvTENYd2ZCNmNaVU9leGxRV0xLNE03Qno4WUFjVy9WMm4zZDRa?=
 =?utf-8?B?cWxNWXNQMjJ4ckU0bmMrS2tuQkVZaGk1MHFQUm9DQnh0ZE5xcmN5UW1SRmRS?=
 =?utf-8?B?S0xMUDJRTHM5djFxQ25UVDAvRHkxd2RoTWVsQnBsUnNJeU93a0s5cmR4QndU?=
 =?utf-8?B?ZVBHL1BIL09WMHZQanI2WTIvbFFxbHpYODdmb3lYak9FblE5M0VQaHFwdmJt?=
 =?utf-8?B?U3RYU29KN0pIbGN6Q3llU25FK3B4R0c0WkNpSUl5cTlENXhXRHdMYkdpNFhY?=
 =?utf-8?B?bW5tMjQ0MHBZOXpTeGY2RWFzV1N5MUthOXF6dHJ2cllhVTNHVzBGb2lJY1c5?=
 =?utf-8?B?Q2VURmtTWE9xemZ5VHpjRkpJNFF0VCtHUVByNkJOVGovanN0Zno3aGFGL2x2?=
 =?utf-8?B?SEVHRituYytNTjhKaGV1a2t0SzZUejQ5aHlWekFlWlR3cUJjR2VCN0FENllr?=
 =?utf-8?B?S3RSR2hmUjMwY09TL0pQdG1jUXMrM0JrNUphdlFDemVZNW5jeC9vRTI1TkFI?=
 =?utf-8?B?MWM0K1JYWGdWSTJNakhiSnhtWVpid0txaHNIVncxY2hFSnFscmpOYlhDRW5o?=
 =?utf-8?B?T3lrdmR6U0RpTVRkUWtlOU9nUm9iRjREdmZwSGRxbEpsekVJL3hyY296VEZS?=
 =?utf-8?B?Ty9zRTF6MU92UEduRXMrWnF4ei9rU0liT2NyekttVys5TWsraktwSE1KaUJ6?=
 =?utf-8?B?cXp0M2dGdmg2UHlRMmZ1YnZyclJ2V2tweFFuZnBVcWE5S01Ld21iWkNRRERP?=
 =?utf-8?B?cGVNcDJpSTZvUGdoOXRnUjJuWnJpeC9jQjh1UXhKN2orcTVwL29HcGhMZGpn?=
 =?utf-8?B?MWJEaXM4MG1nZDhzYlMya1RHSVdXVmp1MzV5QzBSaE56WmR5aFBCMzIvYzZm?=
 =?utf-8?B?dFdmT2FISmdvY0pkcFBQVGxmM2thT3YrYTZlcm1IVkdNaUs2bHgxajNXbVI4?=
 =?utf-8?B?RVdjQy9UV2hla0p0dy9COVplbkl3ZC96MXBRbFhqZ2ozcnZ6TnRWUXFnQUZZ?=
 =?utf-8?B?UkVUUXRxRjNHRlFRL3YzQ08wN3JYcmVwTGJYbk5HUzEyMUZIRlFFNHV0aEFq?=
 =?utf-8?B?c3ZVOGpaVDhRMlV4eVhoTkwrYkV5QlVEcFQ2ZlhjT25KYkdSd2N4NVF0bUNm?=
 =?utf-8?B?T2RuUjFDcGZjWWk2QXl0aWFUZnRPTUVpZXVORWx5d1dpd1NkRDVQdG4vSFpJ?=
 =?utf-8?B?R0NLVE5rZGFxcGVVdTBWaXFwVXFLUi9GWVRCVVp2T3dNQWhpcDZYVjZOMGJJ?=
 =?utf-8?B?L3Z2T3JQVWhYbFBia2oxeFB6OXV1ZXU2SFNGM2JWNUJqeFcwVlk4eDRFd3Rp?=
 =?utf-8?B?ZUVnbGlZYTBZZXM0OTg1aXB5NmFKM2Ewc3drYXRlSVpTemZ0Z1F1WWIrZGVs?=
 =?utf-8?B?NVRaOFhIV0F1U0xlVEo4Q0VueUVmQlBBdGRXOGZtS2IxSnVCNjRQZ0QwQ2N3?=
 =?utf-8?B?c3lvdkxEQWg5ampHYndEeE04bUdqWG56bHF0STkzK0RraER5V0FxZUZibTB5?=
 =?utf-8?B?VnpZS1VCLysxYnNKTzZiaWJVb25QWndUUnFpSGMzZHlXejZ0MWJuSVhaMU02?=
 =?utf-8?B?NzdrRmVrZ0hjM05Jbnk2bnVHWHc3cVdib1kzR2lsaW16Ymx4ZnFaM1d5NGVz?=
 =?utf-8?Q?1eeRHPbXyzaLIQtblA+HKjJT1tb499/wUm2PBAs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 546e7868-1e3f-41f6-bdf8-08d92b2f62b6
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:14:37.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1ov5Q8XF7SSXQxf7jFSf5RVCdoizYpPFQEjwpXuO8rJosL91+lkH+bj37/ihtQws6PFdAtJBi5+LqPKK6FnIgOpf7MhBoXRiYKiiiL63EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5124
X-OriginatorOrg: citrix.com

On 07/06/2021 07:33, Jan Beulich wrote:
> On 03.06.2021 15:08, Tim Deegan wrote:
>> Better reflect reality: Andrew and Jan are active maintainers
>> and I review patches.  Keep myself as a reviewer so I can help
>> with historical context &c.
>>
>> Signed-off-by: Tim Deegan <tim@xen.org>
> Largely for formal reasons
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

