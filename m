Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B003514DB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 14:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104433.199720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRwhD-0000m0-2i; Thu, 01 Apr 2021 12:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104433.199720; Thu, 01 Apr 2021 12:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRwhC-0000lf-Ur; Thu, 01 Apr 2021 12:45:10 +0000
Received: by outflank-mailman (input) for mailman id 104433;
 Thu, 01 Apr 2021 12:45:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRwhB-0000la-5g
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 12:45:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a93e7ecb-6451-41a4-a496-3a6fdeecb0fa;
 Thu, 01 Apr 2021 12:45:08 +0000 (UTC)
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
X-Inumbo-ID: a93e7ecb-6451-41a4-a496-3a6fdeecb0fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617281108;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q5SvqruWEh86fsHbQhTT1l2XUOs2dVrfGE4EFDi2lHo=;
  b=LzA0y8AuqThiyI2943WupIeeeWn6IM9qjERCF8GqzfM6bdp0JxGcIezO
   unutXpKHPItRrAi5h0lAPdyXfCGuMYYZOv4VGFkLZ92tAjwjEQrNwIYR3
   K3aLnDZUliaQSOqSnRDPJH2Ig0amdqW/NvznXOMqwQjq6tn5iswIqXWUj
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6OLotxVhkGUcDYlTwbbbwcs0wWb1nZNCXZrpc8tJjev88GUED73isIiTb9aNVQeZSZxgN9mxmS
 AY2EbKXDybnr3/OP6+Trf1q1x4o7oKsk1DrAiUZE8iqFYJnjdtnx2sYNjZO2ipKjoeB3XmITdB
 jKwfHvH/V0X2nHNH3S3pMtLiTYJWvtvNrBe6c9MBrrpDPsGJXFLTjYzbslVF4W2tQC5ON+rT4A
 vJQGEVTPdfRpVxgEVffQGJq4+7Yub0zrwpuszPS4s3msb1PR1YFOoq5zSe/h1mM8CuNgrpcRcJ
 ZSU=
X-SBRS: 5.2
X-MesageID: 41066815
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:A2XP86jwXyJdBhGzcQ+oA2MjxXBQX3Vw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIDVuL5w/CZ
 aa+45jrz2vZXwYYq2Adwc4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZgbxpkx7A+/W
 /Z1zHo/6nLiYDG9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFf9ccpKYujRdmpDI1H8Ll5
 32rw4kL4BP7RrqDxyIiD/M/yWl7zo08X/lzjaj8AneiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welqz1fipnmUaurX0pnfR7tQ05baIkZKJMtotaxUtJEf47bVHHwbo6G+
 pjBty03ocuTXqmaRnizwxS6eC3Um92NhmLRVVqgL3u7xFm2Fp9z0ce2fUFmGYB+J8XW/B/lp
 T5G5Utu7dUQsAMa6VhQM8HXMusE2TIBSnBKWSIPD3cZe86EkOIj6SyzKQ+5emsdpBN5JwumK
 7ZWFcdkWIpYUrhBeCHwZUjyGGNfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zyQZ
 +ISdBrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Lit7XK7ftqvfQfJ/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oVVf4+b52DajG78kewIUALeR3w0wooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNz2gBAGsbMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjt2T8bcFh
 9jt016kJjHaaC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9ceAos5XrdyUSHGDQZ8lwoviG
 orUn5FembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8WOGpc8uQXMfdyW0UdGehDsvQzY8vC
 w1z4YvxJ673Rq/I2o2h+o1dHdWbn6MPb5ABAOZILlPlqvTYwF2R2eSjTm8gxU+E1Carnk6ty
 jEF2m5aPvLCl1StjR93rzx+F15TGmbYnl9c2t3q4F7CGTAtEtiyOPjXNvH70KhLn85hs0NOj
 DMZjUfZjljwN26zza5sjePH3dO/ORiAsXtSJAYN53D0HKkL4OF0ZwcF/hP5ZB/KZTFqekQS9
 +SfAeTMRL1A+4kwBauu34gISV4wUNUyc/A6VnA1iyVzXQ/Cf3dLBBaXLkdOcib9HWhaPCS0p
 l15OhF9deYAyHUUJqhxq7WZTIYdU+Wjm6yUu0yqZdb+Yg1r6B+GpHHUT3OkFFLtS9OWvvcpQ
 c7euBc5ruEB6pEO+o1UAhd9kAylNuOIFAw2zaGSNMWTBUItTvjI9iN47D0srIhDU2KmRvoNT
 Ckglpg1saAexHG6KUTBK0xK1lHcUQQ6Hxt++WZao3bYT/aPt1rzR6fMnWndqVaR7XAMbIMrg
 xi69XgpZ7aSwPInCTRtyB8OKRA7iKORt6zGhuFHapt/8ahMVqBxous78jbtka5dRKLL2AZj5
 ZCb0oec4BqjSQjlpQ+1myKcZPMy3hV2Gd20HVAjV7i2o+v/WfdEwVnCGTi8+RrdAgWFGOJg8
 TD+fWfz1Ln7lF+qML+KHs=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41066815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFNBtywWSXAM+eXbihiPCOYpRZDUvU1ttuFzCge3N0swjvYFQ4+kj128VGamAFwfCm9MRkfynSyqCUhuO5gDma/4gIBjgGptJ2F3EuQswui+QOW7hbI4EwVkwZOqOSkjgeJLs5kk+KmPH4sw+pzYUmjsnSsFsYomg652bF0G2YATDZYfOr5DhKMz6ZZstVV62awZmlM0iyc3w9auANt029Cf4EMzf9agBbLut99ln8Z3B5FTnEm/85ULT5Exc4Pwkj/HvMMq3jOkN/lWSWayjhJDMUMKmV2iSCVzmT7W0h1XQxXMbXII9XJX2gmgboShfXR3u54SaLjlntYoJFnk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q94WzQ6SuSuvqMAlhYZcl9EGVF426lyxhYZHeF9slu8=;
 b=ES4t/n7FS3L1eIKZRG6VS3qluRtcL5+RRyRWb5vUxcONKTtyCcwWnw3DsEkX842a/oIG+N0Nl3oRuBhMOEli0laWkQSnq0pgKTNf9d+2wdXYKJO/wFZwlE/3Ys98QI2mATsdvwbJA82qAG7QqPeqV6eCaY32BkSa4YMaigSWMlYuEhUzvUkERJEJgAHsg7O8JtyWnMFJHbsrDZzhg4RzEC7zX9EwKU5RbOS8cnZFyIP45MCm5OduXyOuBo1mJMLcjVjKBcAgNS0lgMlJoAR6vC7qy69MKiNCSAPGqJBNDggH2t6Kc9HfPgdoyiKvJGrwz0rT7HRXC1zWl4g9R10UVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q94WzQ6SuSuvqMAlhYZcl9EGVF426lyxhYZHeF9slu8=;
 b=wPn4yO4ryIR/6L6wzZ/TjCRAChKm2zIKq5/iudQ05SBRdS2qLjWCgJf3tIf83GzxgdD/ANXW6XT8waRpk7byN8r5hvRd8kX7eqvKZYEs3oBnYVRjpYDDBMFRAVAU0x3rRU1G5nvmxemXOwiLwFDy6AdyTjU13C26npuxVS2REXs=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
References: <20210401102252.95196-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/viridian: EOI MSR should always happen in affected
 vCPU context
Message-ID: <b8fcbe35-2c9d-fd8a-0200-90d9c1039a27@citrix.com>
Date: Thu, 1 Apr 2021 13:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210401102252.95196-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f146cac8-73c5-47e7-aae6-08d8f50bf937
X-MS-TrafficTypeDiagnostic: BN8PR03MB5138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB51384249EA9518F87E6461D6BA7B9@BN8PR03MB5138.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/00PG380JJ7dXQokDD0BdVaCjQcM6t9QUvMTz0xg9tCZ4WizDUNLeOTtxvxlR6+n042hkueSXjq1zf/2VOK0e7VICBlrXRBJ4KDQO/2bAdF6a9/RscJXp76nCzZAyc16yWxQYgu4EZXJdd6nYf5D6lSELi8K3oR/29YQ/ZOauQ2sgVDras9X/LQ/HE8FPShIYbKpfyytmIZde1xAQUHc0KJGyf2n7qhOnQzMH30TE0e4i59n33plIZMGffLjvPfv5JdlNNSXektv1KTFZFtKiQxMNZNvGyWrOx4cGnPSvvijK/l4nOfOoNZNivMyvkxrUJwq6kSaJ0M311gTTZO+snNSn+yf3VepLHX1sGVuK3K1u8DxmZKAqnEijdbVf1o0dLzWt+GI0v9OoDBdsEzIWCS0YfuPfMU1ch/cerRMGbINR85S9RJZfKlqe8pf7J+m5uvk3Hf2GHWuJL0Onjo9JZ4G0ka8ZSPaPewcZQan2DmpDQvozeGxOLg6DnKQVM0rh8PzYTug+wVIR2t2BEEjB9u2q3nYVjLloXhwOa/AP3n57Hg2HrT/d+0o7A2t6m+aYmjsr/EjUoxIvBeWQZmM0HvcQY6jvknUdseVIqslWcDexGmBDg6fFR1gJbH05+iX0RL788ucqTGPqZvVkFpGFBwhAtEQbTGxgfHAIqC/73gQSq8OLwos0Oqx+RHNkyh2PHz+p5dKQM6Ayv44mHfdBvqz7npMwWRzcZhMsFkHlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(478600001)(86362001)(6486002)(54906003)(16576012)(316002)(8936002)(31696002)(38100700001)(4326008)(8676002)(31686004)(5660300002)(16526019)(2906002)(36756003)(6666004)(66476007)(26005)(83380400001)(956004)(186003)(53546011)(66556008)(2616005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUZtNVR3cS92R0cvUVlHaTFHNmhNZWxKaEVlOXo4S1NBUnNXRHBhTzFnbWdB?=
 =?utf-8?B?c21uZzkzdmlVL1FSelRzRDVpSmdrNnA0UVlOSHJKUGVyaW03ZXNGY1orUzVt?=
 =?utf-8?B?UWFLOFBKc05zNmhUUXVvaWRVWlNJRjRIeWo5bHNUMGlPaVM5cnpBOWdEbzBr?=
 =?utf-8?B?YnZ0VEpPeXczZzUveC9zSTdYODNoUG9oZ2VpdytFMkd6M2lyamN5TnY2dEJk?=
 =?utf-8?B?RDUycFcvQm5kNTAra2hocnhpakN3dS9KOGVVTThWdVEwc01qUXYraG43Vk9L?=
 =?utf-8?B?aUE2Smw0THF2bHcxZUYxMU5kd1ZyMm1JcmltVWpaZlFQR2NGQjA4MXFzZW1J?=
 =?utf-8?B?WkQrbFdVWFZWa2JQMFpKcWtZb2w5VEFhNnMrNXk0SHNDeHlXMnp2dFEwckJQ?=
 =?utf-8?B?SVdZcHI4R2pxV1laQWFnWHd0VGpJQTVNNWtzMkY3TUJtZGdUWjJqUFdUS0ZD?=
 =?utf-8?B?K0Rkb3kzL3hkbFMzZTV3MVlCcVYrVVNwZ1o1U0ttdWtSc0doYlFpREVtVnY0?=
 =?utf-8?B?QURkeGtsSjM3dUZhc3lpcUZkR3BXWDdzWXREYjlPQ1BHbUdxa3JwellxWXM4?=
 =?utf-8?B?SGEwM3MzTGd4Y3ZxWUIwYzNoTkZSVjIyZUxqV2pQYXIyUitmb092UnZTV0FN?=
 =?utf-8?B?NEE5SFZvcHRmODA0ZU1VM3FUUzhXSVM0OTJGenU1R1c0R0ZDUUhoaTZXREpX?=
 =?utf-8?B?dUJnRmlTN05KVGREenJqWFU5Y3lDRmNCOXVZV2o5cnFrRFU1V1NzWE5RbDhi?=
 =?utf-8?B?TXlNbzZBNjV2a0wyMDg0cUkrRWR5T1ZMNlF0S0lWbVJDQ0hmMnRZakVVd3FZ?=
 =?utf-8?B?Ry9Ub0lodXVqaTd3b0wrZnd3V1FVem9leEdielJSOCtQRVIyMitCaG5RUVRN?=
 =?utf-8?B?aGJVSUJNaStqWlhXdU9vQnpiUE9DeGhxTWJQejQ5TXJINXRENFhBaGs3dVZL?=
 =?utf-8?B?NXBaY1JqY05GOWtNSERwS3dIUkpOY3pYbjNCc3pVSGhsRlJqMW5hdndTbG93?=
 =?utf-8?B?dFlwVEdxVGQvRHNyaE5Cc01NdndwVjgxb0ZybWRLeTVNS21MSndDUlVZd2VK?=
 =?utf-8?B?WXBGa01aZDlwNjI2eWJoTEVqcnBPalZBSnVaN2ZPbndDcHpsZytTYTZqbFR3?=
 =?utf-8?B?eFJkdVRRS3R2T2t3aWhYY2tyUmNmVmJUdHQvL0JDOGlCeTlBaUpubVpUZGVN?=
 =?utf-8?B?UU1WbmlKeWlVODRpSkRHb3QzeDl2cWs5UFF4YTlEVGc0TC90WWJweWFqRWNV?=
 =?utf-8?B?MUZtQjBCWWlzYVVqUEFEbCtiTVR2UlIrN1JOSzlCc2RKZHBLcHMzdDhuWmMr?=
 =?utf-8?B?RFlsRjZibU9zaGkxZ0pjaGVQR0VZU0R5STRiak9hdW94KzNtU1VGV2ViWjli?=
 =?utf-8?B?QkdFYVpwZHgwTjFGeWwvWHZHK3NJVENyRDJSMmV4Qy91R3d5RmNhYzBEOEs4?=
 =?utf-8?B?cStaTzJPRnJPVzNOUUhRakZVZVdpajlBVmhzN1U1cW9VYXd4NnMxRWlqRnpF?=
 =?utf-8?B?Zm9MbkNTTzlNQWs1REkyRnY2U1RWaUJ2czZSZEV0TGxqZmdOV1dQT0w2ZjJM?=
 =?utf-8?B?UWNQNnEyWkN5dWdRQVNXMlhEWmpBTkpVVXNVZTVxemxtTEFYd2JzV3pTbFF5?=
 =?utf-8?B?QXo5RFZLbVRNL2lkUFRGcnFSc1IzamZVQ21RYVZsckczRmp2ZW1vckNjQmxT?=
 =?utf-8?B?VWZkZURPcXlVTWFMZ3pzZWRPT1poVnpSelYvSUZhblVtRExkRnNjWkUzTVgy?=
 =?utf-8?Q?WKn853SokbIXpFUN8W5s3NLdXiDcaejfSMmP4Uo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f146cac8-73c5-47e7-aae6-08d8f50bf937
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 12:45:04.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7YfYevSUkkX20NeuDE2W5gabYv0rxySK220iyniflL3iPMnV49TJ7lPnOYXSqlwatnaCvJWotdgMnFksP6md6RucpMh+t5TT1WYHdk5Zto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5138
X-OriginatorOrg: citrix.com

On 01/04/2021 11:22, Roger Pau Monne wrote:
> The HV_X64_MSR_EOI wrmsr should always happen with the target vCPU
> as current, as there's no support for EOI'ing interrupts on a remote
> vCPU.
>
> While there also turn the unconditional assert at the top of the
> function into an error on non-debug builds.
>
> No functional change intended.
>
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/viridian/synic.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridia=
n/synic.c
> index 22e2df27e5d..e18538c60a6 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -79,11 +79,20 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx=
, uint64_t val)
>      struct viridian_vcpu *vv =3D v->arch.hvm.viridian;
>      struct domain *d =3D v->domain;
> =20
> -    ASSERT(v =3D=3D current || !v->is_running);
> +    if ( v !=3D current && v->is_running )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return X86EMUL_EXCEPTION;
> +    }

The original ASSERT() was correct - both of these are easily reachable
in control domain context.

If you want EOI to not be used, you need to raise #GP from it, but that
in principle breaks introspection which really does write MSRs on the
guests behalf.

It's perhaps fine in principle to leave that problem to whomever first
wants to poke this MSR from introspection context, but the
ASSERT_UNREACHABLE()s need dropping whatever the introspection angle.

~Andrew


