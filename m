Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D00B373DF0
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 16:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123154.232317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIrJ-0004kP-VP; Wed, 05 May 2021 14:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123154.232317; Wed, 05 May 2021 14:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIrJ-0004i8-Rg; Wed, 05 May 2021 14:50:41 +0000
Received: by outflank-mailman (input) for mailman id 123154;
 Wed, 05 May 2021 14:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leIrI-0004hz-KO
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 14:50:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17976c9d-5390-4184-b2b4-5939c94f929d;
 Wed, 05 May 2021 14:50:38 +0000 (UTC)
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
X-Inumbo-ID: 17976c9d-5390-4184-b2b4-5939c94f929d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620226238;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qOv3lO6oyab0Ylfk09R7N9VExSynhyxDJZBR0IAyefE=;
  b=F6yDUdNjZSaCHY1JW9ndJO876w58zMUDbMWiFjpF27zJZELhjQqM4Fyk
   0+Bmq2Olk+29u5RWZomrtB8NcQ+GgGWZw1Vxo6eAF8JVo1R9eXj9pcqaG
   Gy9mo3dcNzd1BWP3SXwfj6veYjUxhUoM/MF5EJJxKQZtlL3aXSZkSIJZK
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aA5VaLHndqoaWp5xMZke5aN3edlejAXqzL2jTWE56KSmPqekoX6zWjG2m463KFqKGmYiit0D1C
 Kxp5dmcolOh9O7QwOlASVFaAops88qcgxjM/BWi+eUyf3UiIe06POjGCSDl4s1IC0ElGjmK11k
 SHfwekG4G1tGLoBCbbnKRj3nXAJgN2aoM17Fh36eGpJpl9+s6nmYQpP5Kw1M0oOPPaGuMYbvSF
 QF+RKhVa/KjiBUwgEe8OpqD6SvRaKwal4d1oOIYZpA4T7PK9tvVU6Nx6aBn92vtNkFaF2Ga5ZN
 4oE=
X-SBRS: 5.1
X-MesageID: 43136826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:R/ZyIao5nN5l70BIUUVSohEaV5uEKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYypLbSNBAoc0E4
 fZw8JBqSapd3h/VLXEOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLooSs2eTVJ3Lsk7C
 z5gxX0j5/Tz82T5z398yvo75pQkMb80dcrPq2xo+UcNzmEsHfSWK1PQLuH1QpF2d2HyFFvq9
 XUpgdlAsIb0QKtQkiQgT/Anzbtyywv7XiK8y7rvVLGrdbiTDw3T+pt7LgpCifx0EYrsNFi3K
 8j5Qvw3PA7fHCw/lWI2/HyWx5njUayq3Y5+NRj6UB3aocCdKRX6bUW4UI9KuZyIAvB9IslHO
 NyZfusgcp+TFXyVQG8gkBS2tC2Glw8EhCaK3JywPC94nx9mXB0yFYg38oPnnsM34JVceg128
 30dotvj71AVckQcOZUA/oAW9K+Dij3TQvLK3/6GyWoKIg3f1b277Ln6rQ84++nPLQO0ZsJgZ
 zEFHdVr3Q7dU7CAdCHtac7syzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfKtezYY
 fwBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH3qTv8PwLJHwvOCzSoeRGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1z3fEjS+o9xDbj68+AfxJNlDPwJjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quUbEhl8ZfSZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+iLh97RMXGLR
 5Hqz1MiOSKBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXZ8kEJA8WuhUGR/QHxJ43SZmwV
 0zKDMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDb4rkWTpcYmQ1MBRD6wWcurgQIjLgAkw2
 FZwus6uv6tiDyvIWwwjKATK1tXclmaB7pAEUC4folOo6vqfwtxVG+OojSfh3gICzPX3nRXol
 akATyfePnNDFYYnnxDyK7l/Gl5cXinc1tqZmp3tpB8Emr6qm9+uNX7E5ab4i+0UB8v0+sdOD
 bKbX8pLgRiy8ue+TSVlDyBfE9Wi6kGD6j4NvAOYrvT0nSiJMm0jqkABeZT54sgHsvpqPU3Xe
 WWfBK1IDv0B/gy4RGcom8oNUBP2SEZuMKt/CegwHmz3XY5D/aXHU9vQKsDJcqAq0fjXPSF3f
 xC/JoIlNr1Fl+0TNGIyavaNWEebjzSpHO7VOEup9R/u7kouL56ApncVn/p2Rh8rWMDBfaxsH
 lbZqJxpI3lEMtIWec5fipC5FonlNiVNiIQw0bLK957WWtotmPROtOC3qHBprUuCHCQvQeYAy
 jpzwRtu9P+GxaZ3bEUC6gMMX1bRUg15nNl5v6DfeTreUyXXtAG2FqxKXmmdrBBDICDBLULtx
 5/iuv409O/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJPeJT6dS1NRCthaStifTDwwvfeH+ea04Cg5
 dCelFVRsNfiiM6hIly6xOMcMXM0wkYumobxypmmF7r0pWn52mePXguC3ypvrxmGR9JMnaJis
 zZ9/O/z3qV2kkf5aX+
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="43136826"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcYI9CNVaA33R3kJAOrFn7/6e6FHLe2PIER+tgbEWK5EcnQr6jluRLPSep1R+G2A963vEfd18SKe5Qi37rBjv2uvujE/D/5jdDa27bSzQDKJAdGlyjS0wlhGR3yCRXlbpzqSSbPS9AhPGw8cHOASxitILSTurU8+ZL9UKKHuqDiCiOEt8TCk9ubROu97tWfhFLFWftthpzmL1EqbUwE0hJCFSIKBw8WexulZtNIbyJpeNuD1qPtMqYpx1eu9TKtGiXTq3KCaCC4GKQUf1VpqxtfqFvzQAsy2fB4U20wCfKm4Wra5eWgtP7rHRDdK1xWfFrX7qxVDfJMdeLh7M0fDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOv3lO6oyab0Ylfk09R7N9VExSynhyxDJZBR0IAyefE=;
 b=m+A2jm479sWQZXLT5Rn8h+dNn+O1NtOQHP/Q9dhd14xMcuFtV0mIh5OTk/GhV4rti++le0NXTwNO9J2aeAzKBopgwfqnd1c5t1kaPreKyWEAobqpDoyeMfBzlcJePtQF8fvFvCcJKPbcryNZKR8jJIz7uGPyqSIwKbTagzDtq8GXOVrq0z5YhpFluIga9sofge0ANodZ95nvmxFWvsFamowy4/vmQXVmxC8437+EV7FmewpbcdJr43QanaKfT3lkr9D6TYXENW87XQpmdQ6jYP5dkZI8jw2xUkKNXnmeVysGn9uYQBDDChlVOIsx7nLNmdFb+UpWqbeFGuavK4n1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOv3lO6oyab0Ylfk09R7N9VExSynhyxDJZBR0IAyefE=;
 b=SRWkba/PKdCsESbZBxLcOvk31tQEmeqUpP7G9h3pm1xRINZQW1t2KYNoC/BRTMA1GDCzsJbF61Y0bCBYaWMi9SI3XH4rKLLUm6t4YitPvNOlajOpRaINWOP0Dy2xq/sC4gaQUaM0soeNGz7g+uk/wB21XaZ08G/3FMqXQHa0Ysk=
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
 <YJKXZyCHpRg32tyc@Air-de-Roger>
 <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
 <bb2089cf-74f3-a7f2-7001-21a0d009440f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8d786331-0d9a-2ec7-0fe5-ba86d4a2547c@citrix.com>
Date: Wed, 5 May 2021 15:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bb2089cf-74f3-a7f2-7001-21a0d009440f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0feeebd5-5422-4f7a-db69-08d90fd52304
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5503A82BFEFD87C90A038F65BA599@SJ0PR03MB5503.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: er8zHNPWLPO19XFzJxLrOlbtmm/ur7cud6fB+Rg1MTS01C6JATixahQSb15wYWwvOkC95TbBjMA1QWOalAfJWbiUCNvrC/ORwI5292afQu003no6Pgm43q0qHBM0r3zEIajH+8O6pgxrsSPGNUUC2sjx/d7LqEYfIOdWcy1Yvg4ONXNTaiCA68yJfr01+mB4iZz+gmuhhIb/0oUBSUhfFMmosSb8uWgpD5sotJOEgdgQeO8uj6Fp5mOKrDEHKKQE3rxffcLfaAsdogAuwV1UWL5Fi+VIfCA8+hesoa8YFfMbC+mfvlwBRkyXnLKODhi9TW5wdu1eDubc5CHbtpZONTGGWFA7RFVRvCY7C/yGovBgWDrQCPSCc4rKi1l2aEH4yNhcp00dhizRpuE1AB0vhgi9HoStsAaAIHKn/Ya6Zw7giidW+G9h+vNAEQ28qaV2YrbTWqgN8Hw/EDdX7QP3PuBnXEa2nbiToKahWyqzYtgXIStzBJapPc7FQ0DvWB0d9klGvt8XLBPPp6aMoaxOblL/UzxscoQFn/ArcfLq5Ca3WVmtIdIB6mlMeOPsUSH6pf45LfKKa0ket9F4XFRF0U5tXNbgi/PULqxC114vKX0QUS8IXOSAhAOfnJ5WjuvxwXUID0fuDxTfePRhpMfjFenbOCl4RGNVX6iqrPwFgEN/u8sU5F7Sa5rODg/6fnBl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(956004)(83380400001)(5660300002)(2616005)(86362001)(6916009)(16526019)(186003)(8936002)(8676002)(16576012)(36756003)(53546011)(54906003)(316002)(31686004)(478600001)(4744005)(31696002)(6666004)(4326008)(38100700002)(66476007)(66556008)(6486002)(107886003)(26005)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d042TmZvQStQRm9uSEUwTitYdVMydzZZZ1I1a3ZyemxXeFNXaEFhZ05odDgr?=
 =?utf-8?B?WUFQMGdLbnBCdDh1MmFMcjFoVm5PRktuSTNVT3lOZk53R1BjbEJhY1R6R1o3?=
 =?utf-8?B?bHl3aXB2eXN0aEQwSFRweXdNYUNudmxjTWZpUHV4MHd1WDRZWUI3TWRFZktP?=
 =?utf-8?B?UC93TmxUU0trN3VCREJKUDBBTkFHRGlCVHk1V2pwRy9TcnpYL3pyRWpGQVNV?=
 =?utf-8?B?dlowNGR6cExCYk05SGJRZURyZ0I1cXptakZrMkNpRXJMaXVvUjZpc0hid2c5?=
 =?utf-8?B?NmswR1A0VktrYnhzTzIzeWl2SEc4bWhRbTZUNVYybkRrWGxaRUl2NUhCQUVv?=
 =?utf-8?B?cG5FWEhVaTBUQUx2MnlicjdQYWdUcEtvMnliTTZ3bUFORGRLbEgxcUlPVlZn?=
 =?utf-8?B?aGsyL1VYaEpxU1ZraW5aS0hjK1JZTnZ0STBQRmszT1RRUTU5WkZoTU0yM3Rp?=
 =?utf-8?B?bTgwcVk5ai9meXh3V0Z3U0NtclpkRzVOa0E5K1dvNkY0OHhUZ1lCRE9Ia0xW?=
 =?utf-8?B?SWVweWFTYWZYNXNndVRySXZSa3NNL2hvLzQ5czV5THZYY0Ntd1ZnZkpTQlBa?=
 =?utf-8?B?NFErRlZSVzdGdk1ZTUJVa25ncnNxemxhVWFvY3RQZ1Rhb1ZxRElUSG1RM3lw?=
 =?utf-8?B?d0hFczlOUng0UUxzdjd5MmpvVnVIZmZLb0lBdE5yWC9ZMVRCNmpGdHFLWEpN?=
 =?utf-8?B?cThROEVQVFRla1M5dWtNc0hBd0Q3c0FodGp5VUNSRjF6Y1ZlUHFJNTZMUk5L?=
 =?utf-8?B?bUNOSTdUdzJIQWs3Q1pnL2lTZ3dRQTgvUkpKSXcrZDBZQWFPaTQ5UW0vcXdB?=
 =?utf-8?B?VlhwWTFuM3pjS0QzZmxuYUE1aU9WSHNzQi9MejhYNE9RRkhMZjNHWnJoQzVv?=
 =?utf-8?B?WFNQTEZ4Mm9HVjZ6enE1QmY2VUY2cmJEdTVYOFdXamR0NmlMWDNmRFJzNS84?=
 =?utf-8?B?N29KdVh2ZmpRNnMwTzVJVTJIVFpwSXB4Y1lpVTA0RTZkTWp3YVRMdldWSndE?=
 =?utf-8?B?TTJudFovYkJNZ2ZZZldBcmJlT0luQ3BYTHVkZVQyNDlaZUNMTW4ydVBuTDdr?=
 =?utf-8?B?SmFRekVYZlI3UXV5TFdqN2M0ZzI1UC80N00vNmFtd1djeFNmclk3bGV6amNr?=
 =?utf-8?B?TzlZUU9rc1JtRHIvSWlFUEw2Q0lpOCs2Qno4UDJUT3lONGx6aXRCNWJzczl5?=
 =?utf-8?B?NEtWQ0NGK3V1SmpaVVlnSlhDNVlmamk4Z2JzWmZnQzdwWkR4blZxV3RiZUFv?=
 =?utf-8?B?emFsbXQ0VEMvdVRhaEo4a1ZNMFhTTVM5LzdWb1lGaDZNRGUvQkcyQnJkS3Ns?=
 =?utf-8?B?WGl0dkkxTVY5TWkyL3k3bFkzWHZmQVJUVmhzcWkyQlBEcjNkY0pUVXI5S1d4?=
 =?utf-8?B?Wmx4a3hvTU5teWVrU1A2Ty9pWVFHYlB6VmlkQ1lDMkNQY1VqS3o0L3Q5azkz?=
 =?utf-8?B?ejVZaTdlMzFtRHk5MHlZMlp0M2J1dXdtdkZ1MExiUlNVR1hyUGRiOCtLTmtw?=
 =?utf-8?B?K3lqKysvSTVCb3RTcC9zZTZJSi9vdk5qOGUyWmgyeTl0UWhZcW1Od0JRZGsv?=
 =?utf-8?B?Y3lIMWlTZDg1S1BQbDR5ci9SOFVWamwzRUFNcFNEVTZZYm9jaGZaVkcrbU85?=
 =?utf-8?B?blJncldGZXg2d01OenFIVjF0V24xakRKME9OQkhHM05rWGdySzhEMVNsQnpG?=
 =?utf-8?B?SlJpa21qZWhuSmwwREErdlJxWHYxQUpvQU9rbzB2ZjN3ZmpQQ2dnZ3dtUk9H?=
 =?utf-8?Q?8lBrok11CEPjAvZJQaGuwad2yWf6vU7RdeiNcax?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0feeebd5-5422-4f7a-db69-08d90fd52304
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 14:50:34.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeFZ+taopqK9ZcaFG34OJ961/L6USVCCroIcafVRvH1y+y4u2anGtGU8F7whBhob7phIkk3u35yYTUwzkpUqMBMzEBnbk+oCwx+DEZNKDlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-OriginatorOrg: citrix.com

On 05/05/2021 15:48, Jan Beulich wrote:
> On 05.05.2021 16:29, Andrew Cooper wrote:
>> Technically, MCXSR_MASK is also a hard blocker to migration, but we
>> don't even have that data in a consumable form, and we just might be
>> extremely lucky and discover that it is restricted to non-64-bit CPUs.
> "it" being what here? The value's presence / absence in an {F,}XSAVE
> image? Or the precise value of it?

The precise value of it.  Migrating across the boundary where the
default changed will cause {F,}RSTOR instructions to #GP.

~Andrew

