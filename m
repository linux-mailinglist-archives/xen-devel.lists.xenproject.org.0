Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205E3B0CC8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146038.268662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl2h-0005uf-6N; Tue, 22 Jun 2021 18:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146038.268662; Tue, 22 Jun 2021 18:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl2h-0005sq-2g; Tue, 22 Jun 2021 18:22:35 +0000
Received: by outflank-mailman (input) for mailman id 146038;
 Tue, 22 Jun 2021 18:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl2g-0005sW-1n
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:22:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db067075-8aa5-4bdc-9374-29722aa2e6e0;
 Tue, 22 Jun 2021 18:22:33 +0000 (UTC)
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
X-Inumbo-ID: db067075-8aa5-4bdc-9374-29722aa2e6e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386153;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mH8URGvQhNiKjp8UINoe2iWsXQVOEuwefjeCIRcJy/w=;
  b=PbdPwhjWvikgOdDoNwlAyPG9SjqQLGtjwxbagCRBBmZxOcd7Z0JW8faD
   vhD4CDgJpIpQ1OAtAdt2GmEDrwH6HIWzQq2CMEiik1zXXOAtkPF68g8RY
   47Od2YSB8MaxT1gEsyVeJl5Kyq21bzTD9wiQ4EgbyXcZue9fMr860iXe+
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H9npQaHT54pAZxL+bdjfBUARIFgFFgFS35SWKq3RTW10dx2SZAA7n4LamzCN2FP0UEAahuMDTz
 EIBMAKBZUz0r5CJPfInzBNNVt+DhC7rmtzQjjLBcLoR8qd8q4wPQusaJoGSZMP3SxxDEPA0Vya
 zDo6Zm4YVtzgl5OvszIC/HURaV+/Ktckt+yVD3EKhybr8h/A+Kalma8njMQh9QkNoTws4uMmjb
 RNnN3HxuA/JVBE7uwxvAR/FK9pIHZ5xeYRob2g3+T1HWEF5bG5XbPtbmnVIFt13nqvQbBa+ILQ
 +xg=
X-SBRS: 5.1
X-MesageID: 48311456
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Zf8bdqtcJD5gzDsWB+pkqZsF7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs5D4ZjLfCJHZKXBkXqF+rQbsaC6GcmT7I+0pRcdLnAeV0gj1XYfNu/yKDwHeOAsP+taKH
 Pz3Lsjm9PtQwVtUiztbUN1LtQr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqa12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pcVFZol/1awKppKuZGIMqjg7pXVt
 WGTfuspMq+SGnqKkww5QJUsYWRth1ZJGb1fqAA0vblmQS+0koJl3fxaaQk7z49HakGOu55Dt
 L/Q+9VfYF1P7srhJ1GdZE8qOuMeyHwqEH3QS6vyWqOLtBOB5ubke+I3Fxy3pDwRKA1
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="48311456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA08M32GlLsVbITuqp3as1c8JFWkgpCANwNGNaMuG8UoO7O4c9IiAgCs3itpoGk67TDhe7W7wdWDkelNQ+PHCpWBiSPmdjcJkSNRNjV3QoBD+t0OzsLvJhdRB6U3uLYQbJVFtMNF8/BAk1wPAIVZdDYMJiUgwYVRwwokeAajf6nX+CdQxKVt1UfF2hxznzch0ewY4EnT0atLovXnQBO96nsvf5qSp3jsH/6wh/xTbn5z7AHzA1MtfHtRvnJv+d+avzRGJpPDYByMFTFvDrzSrpwk5rZbCuEiUoG17VDOepAeufI/Mch2u2wB7GgMaeQCwBZVALUKPBj/0oSbGOBt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH8URGvQhNiKjp8UINoe2iWsXQVOEuwefjeCIRcJy/w=;
 b=FwapX+Wpd08fPw/M8p7zqHpLc7sTD2cYClojHVkxKLu0nbjjNxgLG541QUjZc5fli+rhn/9XNq4AlT2vjkDBB3Kx/hrObJ8ysfKocJ3fboCo7hWzGZygtnqmCQTCW5v+zp+4bruGeeHbynNGcyn6bK0DnIYwYbLGBkHpSwTcgR1IfXpb77U6j7t3OKdGlQeZMZyLXl3Sl5dTCkMexiIOPXm+Cd8Pcn1eMS3kIUJqKzDhkJ9D2ECkgJr7ztCEf1yzZDSCUmf6+q7tqBOa2OklekkUTt3glR18W45Sd0uoFfk84NLwmk8dqTatTbsXiQIxLX8iVq17rZnKwhqqYeD23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH8URGvQhNiKjp8UINoe2iWsXQVOEuwefjeCIRcJy/w=;
 b=IBEoK9ibRqD2xFznY3KbGb1QhwLR31azEE+H0gN9fUE5MvjWKKiyWBa+aSVbYP8sGyl2+xRNmZvmz8KbaDDnVRaOEanjNTFRxhmZjwWYr7d2KmNxEEow3b3zXggZ0to8b5CpaM8fJr+bvw85gg6AoKkHFcJ3bBrvltkMS1c/80w=
Subject: Re: [PATCH v2 3/6] libxencall: introduce variant of xencall2()
 returning long
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
 <beca6bb7-a991-8a94-ebbe-af973e1f3958@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3a1f9e09-dc01-1107-6a76-5e24d34e0292@citrix.com>
Date: Tue, 22 Jun 2021 19:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <beca6bb7-a991-8a94-ebbe-af973e1f3958@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cec6b8d-a40a-4b65-86a8-08d935aab05b
X-MS-TrafficTypeDiagnostic: BY5PR03MB4968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4968A558903B1C794C704288BA099@BY5PR03MB4968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8n8CWYGfON4vkL0eAZc/uaJQ8Ap5PD7phOUTK89CdRVffqkAOjhqB6qyJLDI5o8eAZanKOAa1UpcYoyyDI9ALiNbt/zun70vE0IW7YDgPj3AlM4qNoCs/tshE67B3v/XFAMqqX5kUrmpAGSUaXp6p4dWLvrllBS6P/lWo2yUI1kncl2R9Kvj99IVXQd3GvhBzJtxi4wXcg9OTWGJWRxYIW/gjaHm7Pl24UPcyxk0h9/BEkzqDZ3WBvOuKfOwtmaHtcX0UuhXLtWEUP2K77lGrGGfIiQEGldEkZsibmdJYhCco1Fe2Tja5vFS1zgyBXhD5Plm6UgJSoZGmhPJWM4QO59n5Y7YHWspk0cM1Huwas6HcqhyQS5hbh6D1hFN1UEGbXV2fq9j2UktR9a1F3TEbxUOZORJSSNHwjCCdpPeAOQX8id0N3YypxJG3RmRxM7XsUQIBpLsNnngLYiTni4Sr9bOE/2cjHYk+pFsa5RqiTIMjEEUKGKd3T2civjPZRAIEFvLdns4plUKmKmTmvqWWKskTaFo/SQqMCfPSbpIq1FkIf+TFIPL6AAobbq4kRoVU6lyFJPzxAPMXoX3DWHnQKYdXpqk8bhYhrZkDNEy+m7iXbKbZ/E+2dYrEl4IiYurkn9eFHFjNDgMgMNbQcrT8XUdq+gW9QYi1iqMwXQerKnBkQsqJ7bGK/G7QPHtNylN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6666004)(31686004)(36756003)(8936002)(86362001)(31696002)(498600001)(6486002)(38100700002)(2616005)(956004)(16576012)(5660300002)(66556008)(66476007)(66946007)(4744005)(54906003)(110136005)(2906002)(53546011)(16526019)(186003)(26005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFJWmEySHUvRDhiclRTdGdwaVkrRnlMdVkrRHlPRnU3UnpIYUFpRStsbSt1?=
 =?utf-8?B?aEwwVzV5NUQwVEhEVjlkM3dnczNxcTZBWncxWXlsalV3Q1R6MGRjK3hkMHlO?=
 =?utf-8?B?UWJHRmNyYTdGN29pTHhmRWNhKzhEQi9NaHREQjRUdmppd1NWRDdvQ0sxMEt3?=
 =?utf-8?B?OGVaUFRJOW1YUW4vWTlBZnVMbmRzSmV6UjloUEF1blVuVmo3czM1RFNSa2Jx?=
 =?utf-8?B?clFZWXVMVTg1aUVtTmJyNnJUZDBobmM3YjZrZmEyRElBUnlUa1NJK09SOWlP?=
 =?utf-8?B?S25rMnMzZnMvcnAyQVVGanluSUI1aUp6Wkk1VzZ5ckFPQ0dManVVaFJpTVNo?=
 =?utf-8?B?MWpvT24zbUJJRmJSbkErbTgzWThRNjV2NlUxTjBxRlhNSGtRN1hWQUQwMVJ0?=
 =?utf-8?B?ZTdpeDEzUm1wblAxbHJjV1VuL3dvekMzcXoxVytiVHNZZm1mYXFtLzlOZ01H?=
 =?utf-8?B?cnB0UU5aQUZCODJ5UzRDaDdDdG5SaHo5a3hvQXp2QWNKVllFS204OTViRGxk?=
 =?utf-8?B?cXNIcmtjbWxCajFubHduR2twUU9obnd2NGNXdlBCVTZwZm9LK3FoemZkSXQ5?=
 =?utf-8?B?SDZuRGNaM016NGI4ZWFrVmZ1b2x2Q1BhVk5VaEhYRWZ0OThlYWljTFJGa0g1?=
 =?utf-8?B?L0dvN2dzOHhwT1lqbExYb1kwVkJ4RHRWZnJ4VlJiWjVrUWcxdWtsWHlCTnFu?=
 =?utf-8?B?Y0w3NllHZU5zV2g5OUluM3lIUC9GMm1PdkNnY1hTV1hncms2aGZhclQ0RGZw?=
 =?utf-8?B?Z3c1Q1ZvbmVWZHFFTVJGdldsVG5RcGJCeVdmMndKeGRZbTFKM1BRdy9aMkk0?=
 =?utf-8?B?RWYyY1ZtTVBUOFJMTWdxR1A0TFdJMDhyNjJHa05URHpQdEdBTnpKMWlXTnIr?=
 =?utf-8?B?eUYvek96YWNlMTRxaXdMVHM0Z1MxaWR2R21IRWlPa3FRQkl5a3hCTU5Vcmxo?=
 =?utf-8?B?dVZaM0ZTR29nR2ozY1BqOHVydk43RWlNWWZsK0Fpcmd0RStSL09TMUt3YmpW?=
 =?utf-8?B?OUNpN1ZrZ3dJNmR4R2FLVWp2WFp3RVM1YXRQcTl6Vys5RGlkeDFXYWQxUnRS?=
 =?utf-8?B?TDVFb1BPOEpDMjFaeHNxWFNwc3prNkpKM2JDSk9waGdCN3dxanUzbUxvNkxD?=
 =?utf-8?B?bFpOQjRLN0pDM1lVOUxJNnVtODdZN01NOE9kd1Z2WUZFMGpmcytaZm1ndWhH?=
 =?utf-8?B?a1lHMnZ3akZxUG9uQURJeE0zSk4rYkRnYm1rN2k3eEJvY3Jia3lsZUJldHBa?=
 =?utf-8?B?bGEyQVlwQU9sUFlsdzJ1Z1Jia1FzZlpZbXZmY1MwSG9kU280WlV0Q05ON1Jz?=
 =?utf-8?B?MG9VMGp5OEU1M0xnVlBkVzUrYjZwYWdKbTNxdEdZRlppZlhHOHpyZnhuMXli?=
 =?utf-8?B?Ymhjc1JEcVd4SWxkTzhqMEZPVTc5MmU1VTlPZTJ4ZFQyOXlUaVhEN3V5bUd2?=
 =?utf-8?B?cnVzdGdoOEM1WkRCR28ycXQyU0VQaytxQnltc2xERldmbGZ5bENCOU4wQmxa?=
 =?utf-8?B?V2ZqYndPQks3eUZHZGxmaXFKdTUvamVOclh6RWQ4cWF2WVlpbGRoL2xOYTI5?=
 =?utf-8?B?Y1JhOXE5TCtDZkJDMmRGcWI0NVphTTBUTVMyaWZqMXROQUVnbkFVV292djVp?=
 =?utf-8?B?K2VHRjlMc1NncXIwNTFiaXZGWDNsWFhhdEtYdkZFeEVYYzZrR0psMEpvb08y?=
 =?utf-8?B?bW9PemVBWnFYeVh4RWpMNnJTOThxNGNHUU1kM0tHVHM4UDNjcWxJWVpkeVBP?=
 =?utf-8?Q?B+enMeRWj57AUpqKt/4Q19bHiGtZ7tq2W0En71y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cec6b8d-a40a-4b65-86a8-08d935aab05b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:22:27.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slXbmrRwhtmDwG2a4mnSXMTzClS0PmcDiK/Gtr/njyxxBu9iTkGcqTVrwdjnsEFWgWSlcSdePwcrR2pez8F84b626ByndR/mWUni+HpGQTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4968
X-OriginatorOrg: citrix.com

On 22/06/2021 16:18, Jan Beulich wrote:
> Some hypercalls, memory-op in particular, can return values requiring
> more than 31 bits to represent. Hence the underlying layers need to make
> sure they won't truncate such values.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Ian Jackson <iwj@xenproject.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

