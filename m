Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB3364792
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 17:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113081.215494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWH2-0000n3-ID; Mon, 19 Apr 2021 15:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113081.215494; Mon, 19 Apr 2021 15:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYWH2-0000me-ER; Mon, 19 Apr 2021 15:57:20 +0000
Received: by outflank-mailman (input) for mailman id 113081;
 Mon, 19 Apr 2021 15:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYWH1-0000mY-OZ
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 15:57:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 308c7ec9-da4e-427a-84b4-fe381d34b98e;
 Mon, 19 Apr 2021 15:57:18 +0000 (UTC)
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
X-Inumbo-ID: 308c7ec9-da4e-427a-84b4-fe381d34b98e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618847838;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lKlsn+loLttTWD4lESSRfE5KPdGp6q1jrppI+ykWaNs=;
  b=Ve8mqpSi3229H0xkrDrsCwaYJ6++o4tu/o+ZI76OUQVmzTFVF7zpxNBN
   N5pQkjw3uph10h3GQ2z3qFFveHUVftcM9R4lO5QKjlSY2nfPabmQd58QD
   6J9AQiXlW/wTjL+xH4H3NAyToZCWsHwOlk50w1BxDFytKtXiP5q+rS22v
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hF7jpr3M0ey9WNlxIzaqyQ01qpxz6xMYYB9PzRvHTMcQxnTKjFTQYMYqRZKPrPEyZ6DOu8oBnM
 FtphFju0RffFUY16BBL9OXYWX1ajsM89JsZ7vGDtYCvhM08Rb/WYoGzsWohYo75OO4avsIk4NL
 RE9h1XZQck35q9seuhz6+AxOaI5buxod+3/CozBxQ+lWb+lQCqkShh2EjXU5Jbw9NCMBFvQEFU
 sApkHUSQ/WGYxQlFLhXqXBWfEJfrP2+4pbpY3E1HD7sem2wp4t5WHMOMtT2RX9epa9nY39Nctf
 1Z8=
X-SBRS: 5.2
X-MesageID: 43386812
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:scyPe6gZyoW77sqYr20EaOYDuHBQX3dw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIDVuL5w/CZ
 aa+45jrz2vZXwYYq2AdwY4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZjbxpkx7A+/W
 /Z1zHo/6nLiYDH9jbw9U/2q65Xltzo18dZCKW35PQ9Bz3whm+TFfxccpKYujRdmpDI1H8Ll5
 32rw4kL4BP7RrqDxuIiD/M/yWl7zo08X/lzjaj8AjeiOj0XigzBcYEpa8xSGqh12MasNtx0L
 1G0gui3vI9Z3Ow/1WJ2/HyWx5njUayq3Y5+NRj6EB3aocCdKRX6bUW4UI9KuZxIAvB9IslHO
 NyZfushsp+TFXyVQG9gkBS2tC2Glw8EhCaK3JywfC94nx9mXB0yFYg38oPnnsM34JVceg028
 30dotvj71AVckQcOZUA/oAW9K+Dij3TQvLK3/6GyWpKIg3f1b277Ln6rQ84++nPLQO0ZsJgZ
 zEFHdVr3Q7dU7CAdCHtac7vCzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfKtezYY
 fxBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH3qTv8PwLJHwvOCzSoeSGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1z3fEjS+o9xDbj68+AfxJNlDPwIjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quUbEhl8ZfiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+iLh97RMXGLR
 5Hqz1MiOWKBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXZ8kEJA8WuhUGR/QHxJ43SZmwV
 0zKTMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDb4rkWTpcYmQ1MBRD6wWcurgQIjLgAkxG
 FZwus6uv6tiDyvIWwwjKATK1tXclmaB7pAEUC4folOo6vqfwtxVG+OojSfh3gICyzX3nRXol
 akATyfePnNDFYYnnxDyK7l/Gl5cXinc1tqZmp3tpB8Emr6qm9+uNX7FJab4i+0UB8v0+sdOD
 bKbX8pLgRiy8ue+TSVlDyBfE9WjKkGD6j4NvAOYrvT0nSiJMm0jqkABeZT54sgHsvpqPU3Xe
 WWfBK1IDv0B/gy4RGcom8oNUBP2SAZuMKt/CegwHmz3XY5D/aXHU9vQKsDJcqAq0fjXPSF3f
 xC/JsIlNr1Fl+0TNGIyavaNWEebjzSpHO7VOEup9R/u7kouL56ApncVn/p2Rh8rWIDBfaxsH
 lbZqJxpI3lEMtIWec5fipC5FonlNiVNiIQw0fLK957WWtotmPROtOC3qHBprUuCHCQvQeYAy
 jqzwRtu9P+GxaZ3bEUC6gMMX1bRUg15nNl5v6DfeTreXOXXtAG2FqxKXmmdrBBDICDBLULtx
 5/iuv40tO/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJPeJT6dS1NRCthaStifTDwAvfeH+ea04Cg5
 dCelFVRsNfiiM6hIly6xOMcMXM0woYumobxypmmF7r0pWn52mePXguC3ymvrxmGR9JMnaJis
 zZ9/O/z3qV2kkc5aX+
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="43386812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCMQpoAr7n/6inFin/OxBPxUOTdsIGeBVa3QR+XrwLQ97rUbHgr0YIp7kzJpxF16GRuk1Yiumyfa/WgDgTkBoBNNPY1qqkE1zeRf2fD74/Zs9DanU+aLAtKsN52aK6ngeAZRBgiksbEsBBJZgQadiLJa/XzHI7m0nb4XNBlmSHYkz1cs3WTETLgnfMVaL5uIwI7PlExyyt5ljYIfUv4uxIfLPI6GKyszH6xND1KQTJch1JTjX+6kIJOXa8y+g3lpR5lgyJWgviwl+NRz9hKo0PbahPdcdqkayJetC1gX9S0NHy7H8ELBry7DF7c2PdE/y64Vf0cwnOIV5sSeu8FZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKlsn+loLttTWD4lESSRfE5KPdGp6q1jrppI+ykWaNs=;
 b=fTXTHS5kWBtVxalUcEqYYuTa2JStaoVG3tYLkWVanwh5w0FdQA+u7XuMder9FY7BbA9FCvV318j8oQAFSABY7IiWgmWHNclPRKxhNu7i5e6cAFNzHcCfAIGEP/3SphDQstgM1Amw49W7kOmcqZNRQ9Outy7SWMgN4aVtnRIIHfCCUO+qqp9mM97b3Icg9Z+2Fl1pNyOxBTMJrehWGs+zMdCasiyD1T2HGsBeIitkvNj93ccLN5yRbXOrJqESbA/pwNW6Mncoo4/ycyOgftsDM1HqCQ4TcI64SzcsB1a65U8PMrJ3s1SwwfK7I+UDx4UFhgkFK80HiHOnS1DKxpK5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKlsn+loLttTWD4lESSRfE5KPdGp6q1jrppI+ykWaNs=;
 b=QTvh9VGuYPo2bFdC2OtuVT4L5PDWZn06uisRTi4qCpLngmOmnyy7ZmssZqCmWXF3jxH+0jn6GbuG7pAgOGIPAd57opvOP0ReoyV+8RBxkdteQjE33TXZG/t05nrGfF7XSNRDSa/rdYLz+pQ/Sx3EBswb2Z5aUvsLD3LGpILc0r8=
Subject: Re: [PATCH] x86/shim: Simplify compat handling in write_start_info()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419144524.32608-1-andrew.cooper3@citrix.com>
 <a048d155-085d-b942-40cc-00624b5bbd11@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <faff3047-66e3-0d6f-1878-e1dac47b7c06@citrix.com>
Date: Mon, 19 Apr 2021 16:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a048d155-085d-b942-40cc-00624b5bbd11@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66497a3e-8591-417f-c1f8-08d9034bca2a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5759D268B3748B8D4B84401CBA499@SJ0PR03MB5759.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgJ8JRWdC4dg8fEIhAIT0WUDY6c8SG+TWnTRybyaVnyMYlCLNKfNqCC3rvtWlaCFxDCOJTbO8RrfQZ+exjb7ffuwIg6ilGxXIOORdVbZeoJqm4/B1fmSXwmt/OaXL/C8+dJpJZPb83vkrC+JcTbfIav0xBrns0tsXar2+z9n6lhvAu6UV7qyKQIbrBqdQEczyK6cbP9VxMFOG5z1aM+Gem1zW7OSSPni+XeE54peYWNUcR9P3S6MaLzNFQCG6SWQq3UfocPppr3qUj61XTCzyvotT1uPV3xLNvLKRmVQVOxJti/RvVtn5J08QlWWXerWQxo7o847mxPV7smYtk+HQWx0zey/teDGDKrHDop29ORV2r+sDArCFaT91LEGxhwjR1JYDsmnvF85AP73QORfO8VJZG3FHImEybMIk6YiIEPUTJPm5n6LPplO2kbNwxff0krJazCMZpYCCtDokWVe9haW2dBfPhOLRclHU6xg06KAdmpSAzbY+sOdFFqAhWbVodKfllaQdCUBDteDgKVmiCdK+ckIM/it7HlyvlouxEk5sycb+bud0P3n7PeBjkDWg71vknyoq++BprI8qARdCis+PL5e3dHtJ3tPwRDEJXihLRtk/eE8wP3AAQbtV9Luz9hDmOnBYXu3v0BC/5HoOFrN2iecH87uBzPnQ/fUY71xwUOfywz/4nAa7A/TwQoz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(8936002)(316002)(8676002)(16576012)(4744005)(4326008)(956004)(2616005)(5660300002)(6916009)(16526019)(66476007)(2906002)(6486002)(186003)(38100700002)(54906003)(6666004)(31686004)(66556008)(36756003)(478600001)(26005)(53546011)(31696002)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVRYSjVjdjdqMG4zbzRmVjZ2QW5LaTNmOVBwOUlFcTErRzlybVk4WFAzVHpN?=
 =?utf-8?B?YmVsanI4UXhiT3N0WndFdDlKVjczQVhBQzBLTkhTYkNpQ3FhVjVWUzMwdFZq?=
 =?utf-8?B?RjY2S2hNaXQzVEora3YxN0l5Z216bldFRzcyenZpc0J2THl1bys0MlBHUUZo?=
 =?utf-8?B?VkduZUVnTWlYVUxxMW5KRmlBT0xuZ0xMR0lxZ0R2RGNESGRXendzcUQzSzZO?=
 =?utf-8?B?eVZnQ3NxRTBkb1FRdjY3cWlEdjNMMzFXMjU5WVpYaEhuK1BmYUVyZE1VQ2lC?=
 =?utf-8?B?Rk9JTzNlVnZjeEFCQzNLTHNJQ0RrdVJhWXEwdlg0aHBxeEh2ZU5ZZmYweVJO?=
 =?utf-8?B?M2FVbE1MTTcxSVd3SU95SG9Jd1pSajN4SzBXcFJrNWtZTTZsbVdIMk4wbVp6?=
 =?utf-8?B?K3N0Yk16aHBPYytCbUhLN1ArQmJxNkVRa0ZYb1pKNDQ4TlVPcjVIYUkzNUNl?=
 =?utf-8?B?OU0xQ0dIYW5aaHNkbnZha2tJYXBrUlhKWk10aGdtcmk5Vk5yRjRNUUVKZG1w?=
 =?utf-8?B?cXhER25lOUVpeUg4MFhuS0VDZzJwTlhPbEdNT0NmWHBBTkI5S2JUb3hCVjRU?=
 =?utf-8?B?WXJjVGtkT245Z1AxVzh1MlBWOUlabUhrN1RYOC9pNFREZWdTYmFoUjJoUU1K?=
 =?utf-8?B?WTV0VUU2YXZueG9uRjB0Z3kvdzJXc3ZpWjdTUWdaWGZTS2JHZmZVV29mUlJs?=
 =?utf-8?B?SFUvNTZQR2loRk85S2ZPaXNZL2dQRkQwMDFUV0E1cDY2ZG5TMU9mOXlwd3RX?=
 =?utf-8?B?OUYvR0NGdmRXQlJyTWhvSEZpWjF5RVMvOVJiRC9NYmh2K0lGeGhQTTZ0aUQw?=
 =?utf-8?B?MG81U0N2ZHJ5MFd5cXE3OGVvcVBLMFNzT1FUREZ2ZStRZlpFajIxT3ovWkw0?=
 =?utf-8?B?ZVhJbi8rODJpbzNVQThLOC81RzczUzRtczF5UjFCaDRwb29GeU1nNmR2MGtu?=
 =?utf-8?B?ZzRMTFRsd05aaFkra2o1cTNTVFNFcEdTc1IvK011cCsrd2JXUUUvbC9VVnJ2?=
 =?utf-8?B?SFRqRVlPRzJZYThGNWg4ZzV4TnV1NEROVXp1aWhXVmUxVE9uUTNqK0RJdWhB?=
 =?utf-8?B?OW9ibDNiMFhQTytVc1MwS2FVOVE4WnpRSXZqRjU0U3lOMXhvdEZ3YmNzSlZh?=
 =?utf-8?B?YlZKN21IZjNtOG9JWWpGMDFMMVZRWlJzZFBreEQzV0JIN0g0eWZ6ajFGZ0Js?=
 =?utf-8?B?bmhWZlhoeWt5L2p3QksvWDFMSEF1dE9kN1BieERHSjhZbzlEVTdIcWtZVUhT?=
 =?utf-8?B?em53K1dacHJXWWp5aDJNc0R5RGI2RERGNnpyeVpmSWhTeEU4RnlKTHdLSFpV?=
 =?utf-8?B?VVp5ckI4ZlR1K3FpWGFJNVNMdUtoWnk1Smt4dTlCQUR6NTdaeHp4Rnk5Sm16?=
 =?utf-8?B?U05vYkFYZFRlajJDNmFSUTNubEhDU3dRWHlYbXBVdXpHVkJ5VG5wZjlLVThU?=
 =?utf-8?B?bTFnbXJuYlRpOHRUMjlhV1dFbTVsWTl4Z2ZpcG1UaWdaaXNVcURvQTJJSklG?=
 =?utf-8?B?NU1RRDlmRmU4c09kV2FuVmJidzRMVGlsNmEwOGJMT0pWT2JJUkRxbG1DenB3?=
 =?utf-8?B?RFFMNllnMnVxR3lEcVlmTWZuSGRDbk55VG1lMGNhcm1EcEIzaEc2L01oT3Jn?=
 =?utf-8?B?Q3IxclV5VVZqOFp2WFl5dFpsMWRpYnVUZDE0eXQyQkVTVnZmeFdPbDNHODN1?=
 =?utf-8?B?Sm1pOXgxamM4NHBQSDZWUzlzR1QwRVowcWN3TU1tMDk3T0NoWkF6NldGQy9I?=
 =?utf-8?Q?WcKb+Wl0vRnJbeFsw/brOcJM3vi5B6R3oJ05FG3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66497a3e-8591-417f-c1f8-08d9034bca2a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 15:57:10.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpH93IdWNok03vrW/1XdycwTCGat09vniXh5iYFFgCRt14GnglrvtWJ9IJ+sgjyrTZTzQN0N+J2Qo+2GSxAET6udsjiVt+wdAPoB8jK+7ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5759
X-OriginatorOrg: citrix.com

On 19/04/2021 16:55, Jan Beulich wrote:
> On 19.04.2021 16:45, Andrew Cooper wrote:
>> Factor out a compat boolean to remove the lfence overhead from multiple
>> is_pv_32bit_domain() calls.
>>
>> For a compat guest, the upper 32 bits of rdx are zero, so there is no need to
>> have any conditional logic at all when mapping the start info page.
> Iirc the contents of the upper halves hold unspecified contents after
> a switch from compat to 64-bit mode. Therefore only with this part of
> the change dropped ...

But we're shim, so will never ever mix compat and non-compat guests.

~Andrew

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Jan


