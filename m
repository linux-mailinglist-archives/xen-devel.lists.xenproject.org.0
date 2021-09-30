Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCD41DFBE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200133.354541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzVg-0000Mi-8a; Thu, 30 Sep 2021 17:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200133.354541; Thu, 30 Sep 2021 17:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzVg-0000L4-3f; Thu, 30 Sep 2021 17:06:16 +0000
Received: by outflank-mailman (input) for mailman id 200133;
 Thu, 30 Sep 2021 17:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Bos=OU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVzVf-0000Kx-HF
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 17:06:15 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7c17668-2210-11ec-bd5e-12813bfff9fa;
 Thu, 30 Sep 2021 17:06:14 +0000 (UTC)
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
X-Inumbo-ID: b7c17668-2210-11ec-bd5e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633021574;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+yBG1dYgnROXjWD7I/OH3lcY6t51yc1yWq26CtjcYTI=;
  b=hsn1zZd3vgaNfNou6eGTr5VZNPDYchYOQqpOHmKuEVraHNa6mhga5sBO
   CCgI1Jxsohy7l5eHwFMa7h/XT3xpH0rfxxE7+AFmPrkV0QAI3LEIazkUK
   pl7l7TcuTtCRaRGUb/xWHWX4lgChB20QLkiFuqQIIyT+ziRZvxPRa4JSy
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mpr9c8JZGpMpJkG2E2hV5Zv1IcML4QW7Qjy2IXalcjoCaWyneFQpcZTx/Qvzv70UIcieTE6IzQ
 +nu5PFm3jcqSlhxldqEgDUpxKe5DFkzFa+RU3SYICzY5N5IhypUZPOAgTJtEtDdyF2iWd44ohe
 zPzYSBXa+LN5T1P97ONnVQDTz+iP4YjTdKxxMSsq2mNJVBWSOzN/jCKmna7D8bZbH+9wso2URy
 s2an3sWgtafNLjbe7DjNqjxhzC/tkM9lOd1vfZ4p75UwT0tfeanVdKeZIyRh7yllDXRmDFLpOx
 zxK3PzJzjG5RjKQinJwjOkNd
X-SBRS: 5.1
X-MesageID: 54041134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5Wsy36xSWmkHPsQRVA96t+fCwSrEfRIJ4+MujC+fZmUNrF6WrkUCx
 jAcUGDXa/veYGf3L41zPNzk8UgO7JHdydI1T1ZsrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrVh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8B/7
 o1Pq52dcgYWOvz3vs4sbEMfPwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25wWQa+HP
 JZxhTxHNgiYfyNePw8rT6lhuuCj1l7kb2VDpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntSr9RIIVEqz+7vNwiUef7mMWARwSE1C8pJGRgUekV9VSA
 0cd4CYpoO4580nDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyxaXIDAGUD9sU90ZsJ4NYxYb6
 QXOs/q8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNtt102eF76PBIbw3oWsRm2gq
 9yfhHJm74j/m/LnwElSEbrvrTW2utDtRxM56x/bV2aohu+STNX+PNT5gbQ3AOwpEWp4crVjl
 CRZ8yR9xLpXZX1oqMBraL5WdF1Oz6zYWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPv8UCYCP7PfMpMt3Z5yEWIU7ITo+Nuhf8NIcmX3SMXFXfoHEGibC4hQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8ZcKKbLTflQ8SAnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTbETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:1tj8Dqwdu8rnOEfixq8UKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54041134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5kDTGUJDrWhdruXxm7PH8q5TKKwZSEqautSwi+axyRiTK5K75NhqUuQ++QeVa3xKNPrqL76Qh+WtPP4hCdy+236XFpZqGv5TiOfc+7UG0VMe29KB2GTXShPvVFHMZ1k8rfgDHedtpJvxzinv3wiNcPqYTYF8hJ3cBm7wWuEBBmRGb1pAaXI5lODvob4lW7+/9IDt7NqM1B3Bxg6Que+L/DQ5uXOHYzP4o/iCZdB+7AIZQv9/DIUuZWAfMoQAjOpm0jwXgj0O65S/BFK+PbA4bleXkBOnOQsIUOZJEdDAlJ9OOVeUm54+dM0NdCm3PZjn46Z7RgKwhcJKKNS2mUvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dc5vJBu+ChwdTu9pieDDIJmA6hfIZVGwJLJVkIwSfP8=;
 b=ltJXTZSyPXT2r/32vSA6XJ805I83BylQnBzL32KWhRYrJeU0qhNfcLb8YAvVSoF5Vcv14A9c+nQy0QVYpLrteZAqnCZCIOx9K2Q8qBXCAVjGEN8JxAOzmvZYZHWUxabqCoTrCyMGeWdhBbhB+VUpu3BHdqPIrLfx/IlePIqTir6N6dR1mYN3ZUSyJe4p8UgeTahB3VTSusfCYJEry9e0tgo3N8C9KtmSZ01EMaeB5LCl7ohdQmFGsuZrKW6v4sTUxkqKFpWHn3rYjWJCqEbpPn/UDL35kKgnEPDF+g02QKkraMZxXWHjvh/ucGHXgJASgoTseiTQxji+rOrtcfd4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc5vJBu+ChwdTu9pieDDIJmA6hfIZVGwJLJVkIwSfP8=;
 b=FOcjfFBCiPW8ooKrgwAQ5HfGp1aCfrKhSFaU0j4+/53OLNt7dEu5mWlsOU0mWPjNGcHytThVNJvDlbJ2Fot+hkHwK+ErRa+Z1Ul4X83/44Xhq8yM6HfhvnkcS8/UKoFOVETHowCCcJntItr6uW5RJtmNlHXZnQ3a+6MN2EH4I3o=
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Doug Goldstein
	<cardoe@cardoe.com>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
 <20210930161720.825098-3-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 2/2] automation: Add qemu to debian:stretch container
 for smoke test
Message-ID: <c242d263-25e1-1540-419b-11c74b2719d5@citrix.com>
Date: Thu, 30 Sep 2021 18:05:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930161720.825098-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0363.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ed3ee7c-8fbb-434e-7d6a-08d984348db5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5887EED3EBA846D123CE40B5BAAA9@SJ0PR03MB5887.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MpRYu1ucL51becZvbQYVgIPsZd6QoURDmt1Fbx3l1OvvOoJy8eXOqimDLvCv6ZaiPuwQWBDyQeBgdxqM+JkmOEnGm86c10yNzKa53I+3569Lw4911MkvU5dfyxDYsuNZQebOJ6keYtbsB3zXG5ML4o1nPoYQW1x5c2x8yipMlPWGtgz7I5fs82g8NTlPshEJRIqn0NbAwzJ2hGjWS/sr2S75QRoPlBgNGnT9nlGAan/96cObRaHhxu49xxFfxkDWVFowvm5/Wc+s4VIuqxm1aw/Xnk+gXDzQWqlExIXKzkM1L7MAT5aF0N+w8Ys5K8UywqUGYpdlzXU7JbxKacleGgIW/H4nE6lDKgLGx8cIa7LLU4wzQQ6to6q9jyZuZ7vB8csLZ7TTNaqdSvqkY/DC+p9j/ZMaJnWglthq+HLnPIXVR6FHEevWLUOx1m7YTUCHbS7ZNUBE5k0nv/rOzgXGVlMsCf714cKdKyu0Di325YM1yya1FPH7S8TV6MjmsMGoXfuiPZ828eF80xIYxtTWOyONNaBFhY76l5BuYuL1ixBKLU09bDlTwquDhCPXsxUF/ZU5B3F5Z72XxJ91XOwveRRnTtuQwNr6/iUFrj9r66YdybRN5MW+Bke72QpFRhbg8yBraH+mGQ9odTv8mbgE4VwLvGOwU1QA/AQXYmi4GTaeydrRIPEgO1E19IDe5oz9AJbfSqYpiQG7bqs0f242K0iC8OfQD65kv30UIgQL2eePf6iGvJshTGlpqpMVyUWS3twUV0x3X4w+9FrsECGhreoSGjRATJ+qG9GubqXvEysSVK4bwbiB6YewM7oYJ3n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4326008)(8936002)(66946007)(2616005)(31696002)(83380400001)(36756003)(38100700002)(5660300002)(16576012)(31686004)(53546011)(54906003)(186003)(55236004)(956004)(26005)(508600001)(86362001)(966005)(6486002)(66556008)(66476007)(2906002)(8676002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGRENkQ1YVVGZk51dUlISkNYTDZYNm9ycmNvY3NQeDIwWVErUVJNekszY2Ru?=
 =?utf-8?B?Nk1LUHk1SEx2WUZzQWpOTklReFRockVKaHBDVHF1VE5IQWhGT0lZeUo5L25L?=
 =?utf-8?B?aGZsQUFPU0h3Ymw3Sis1SjRlRUdoNkZhYmp3NGlsZ1pHMzA0eFJxYWdJVDlX?=
 =?utf-8?B?dWJrMmpvVVVYMUxhcGptL3lSV3pRM29ha2hBQm5oOUVqZngxVHZoZVNtcDdB?=
 =?utf-8?B?Y2Z2emY0aldmMDVzeHZMd2pSUTJkRmtRZkpJd21uTDZzckIvVElSSnhEUTN1?=
 =?utf-8?B?RjNuSFZiUVNxb1pUL2pUQWQ0ZHJvK2s3QklJZEd0R0hxRkRBRGllSmExcloz?=
 =?utf-8?B?NzkrenpYS1JpdGJjTDhPZTRGYXlnUXcraFVsZmQ3M05aSllUTHY3ZGJvdHJV?=
 =?utf-8?B?Q2E0bk51a0d3NFdXQTFOTXNxSGZYTVNpQnNESFU3bHJJRUtpMmIrMHlGWS9W?=
 =?utf-8?B?czJzYkY4WXNZVTlweFFnUVVZNlBvNTdSWXNFQWtBOU9leTNxWUdLeGREdWU2?=
 =?utf-8?B?NEZuTFpMeDB0TVA5empSK3E2K1BxanQ1VmgwOXRrZFpMQXYwTEVOZElBVTA3?=
 =?utf-8?B?SjhmSmo3bmRKQ3JGaSsxSTY5WDZQNk1zWnppUDVPMGo1eEFJREhWMjlZM0pR?=
 =?utf-8?B?dkxFRk53a1lyTWtVWEx3aWhMdlhESjB2T1VadUs2Um81a3QwYXhmTytaR2hV?=
 =?utf-8?B?ZTR6MCtWcUZpQzVtN3ZiU0w0SDVOOGQ4OWlsM3FTdEV0TUxMNnROVjE2MXhw?=
 =?utf-8?B?WGhIK2ViM0pMSlA3czdiUnIwV1hKeGZwdDdua2ZmL2tXSUJXb2h1UmlUUnc3?=
 =?utf-8?B?QVRyUWprZGdJNmxKWmw5UTVGSzJaY0Erd3dWTU9KZ1IrUHpuc3B3Z2laV1dJ?=
 =?utf-8?B?dVA0cXZWOXdjZzhXVzc3TXVkYkF3NVIyYjRNZ0M1T2VOVHhJeHI1Y04wYlJh?=
 =?utf-8?B?VVIrZ3Z5RVY4NjEwd1hxdjRoczl5Y21SQlNoenFWVHJpakR1NXhjazloZ3V1?=
 =?utf-8?B?VDZUdzRPcG5yY1ArMG5DeXlXdkFWVEtlK1NaL2NlZVVDb0hXSHpxMkovdC9p?=
 =?utf-8?B?dXBjUEY2QVkvVzVqVjlGRHFaL3J1OHI5VVlWRHBlV1hYdTI3V0NEekRzVnhG?=
 =?utf-8?B?bi95bUN2S3I5MzFLdFlPQjFySmNjNE5hTnhvSm1pbGxiajBSakNOMEVmVmt5?=
 =?utf-8?B?YVFST2d3YW5Vbkd5RnRoQzhaOW1iUnpXUExKcGpVN296MThRVTVvMzNJWDRY?=
 =?utf-8?B?R25UNmh1UWRXdTJ0dllqRldJMDllQUYyRWVuL2w4a0lLVUFuM21DMWp6SmMz?=
 =?utf-8?B?bm5OWXRCaHFCSnJUby92K2NrRUJkdHlMd2sxTGZxU29Uc09QKzdZdXBXTS9m?=
 =?utf-8?B?aXNkczJ3NEtVSDJsM2c2djFwck5GS201TTA4eFlxSnVKdG5qM1lXa3hsQWFJ?=
 =?utf-8?B?dXpmSWRBQjBjVlI3T0U4RVZUZ0pDdjlNN2FiNU9PMk9vb1lrd2F5VkROZE5X?=
 =?utf-8?B?c3A4cWJ0ZDkyWm1oZHJVQTk3VitPUjhuMW1NUlBrZ3d3ZnFjQTJ6dGQvR1VQ?=
 =?utf-8?B?Q3BORk92OUorRzVPK1hqbWpNUGdRUEhMK0ZIcE9icG52V3B6NnZCMkN0Rncz?=
 =?utf-8?B?bmNDbXdxV0ZJSnJnZkxLRERPb0U4a2xaekJaR3FWTU83aHpwb2VreWx4WDJr?=
 =?utf-8?B?cmcyb3JLYWZOcG9INzUvQmc5aSs2MWFkY09CVmUvdFhZdzFrRkxSS0FwTXJ0?=
 =?utf-8?Q?37xkEY8H28WqboXbWK7ny2+zAXInrrkLvNLzbAL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed3ee7c-8fbb-434e-7d6a-08d984348db5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 17:05:50.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGWVwPVnw2wQxYyOWyBkNaIJy+lBYfIWgRF446VoJfeXfVMJEZM+kvNvmdeeqNUm1KEPNR6tBk9pj1d8yUCbezU2ektx3VWjzY9v4JT3DLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5887
X-OriginatorOrg: citrix.com

On 30/09/2021 17:17, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@gmail.com>
>
> We can add qemu into the container so that there's no need to install
> it everytime we run a test.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Also, smoke tests stopped working as of today due to outdated
> root certificate, so container needs to be updated anyway.
>     fatal: unable to access 'https://xenbits.xen.org/git-http/xtf.git/': =
server certificate verification failed.
>
> I haven't push the container yet, I've only pushed it as
> debian:tmp-stretch for testing it.
> ---
>  automation/build/debian/stretch.dockerfile | 2 ++
>  automation/scripts/qemu-smoke-x86-64.sh    | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/buil=
d/debian/stretch.dockerfile
> index e2ee14e2017c..da6aa874dd70 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -47,6 +47,8 @@ RUN apt-get update && \
>          nasm \
>          gnupg \
>          apt-transport-https \
> +        # for test phase, qemu-smoke-* jobs
> +        qemu-system-x86 \
>          && \
>          apt-get autoremove -y && \
>          apt-get clean && \
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts=
/qemu-smoke-x86-64.sh
> index 4b176c508dec..8ac065491c75 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -6,9 +6,11 @@ set -ex
>  variant=3D$1
> =20
>  # Install QEMU
> -export DEBIAN_FRONTENT=3Dnoninteractive
> -apt-get -qy update
> -apt-get -qy install qemu-system-x86
> +if ! type qemu-system-x86_64; then
> +    export DEBIAN_FRONTENT=3Dnoninteractive
> +    apt-get -qy update
> +    apt-get -qy install qemu-system-x86
> +fi

I'd just delete this all.=C2=A0 It's wrong for running smoke tests in other
containers anyway.

Can fix commit too.

~Andrew

> =20
>  # Clone and build XTF
>  git clone https://xenbits.xen.org/git-http/xtf.git



