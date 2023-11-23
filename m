Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67C7F5D6A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639609.997133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67YI-0001mH-UR; Thu, 23 Nov 2023 11:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639609.997133; Thu, 23 Nov 2023 11:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67YI-0001jI-RC; Thu, 23 Nov 2023 11:07:22 +0000
Received: by outflank-mailman (input) for mailman id 639609;
 Thu, 23 Nov 2023 11:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r67YG-0001jC-QI
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:07:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f995b3-89f0-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:07:19 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 11:07:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 11:07:16 +0000
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
X-Inumbo-ID: 77f995b3-89f0-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDCm/uHXX3hYpabhxbYzEemJnP5fi5mZR2REocAj0gakTyzYsdFMX1NKS1XXLi2wuqXWxrm5R8vuCq7BHMQ/T2N82cidKwz/pW6qr8x1Uvs8XeFO93Yj2RjFQOzBjEUxKDd76LCBDzCghk7lzSeBGjTGbUkZb0mht3Omst8vKWGUl9fHLC9aJ+YhmvkFLrC5HjNjWf1duYC3GajSULMfdaRmDBqKDwQ9BoR2fXCJXxxw9tA3Bw7JFrvYx0ai9JN/Np+cWT46Yt6aNQW0NVl8yffkFO34YP1t6CK7l6IoX/q7K/jITC08u09EqCEF/y8JXloB9d0AofZ1G/ZHAxDiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8iwCxK3LR8WRLW+mPdjDx9M57PjxGvGxR/mIVXrM/0=;
 b=dQVyidAaiI6vfqIQnkCjM7X5yL0SiXVZHprGBosbzy46+83vFBA+/8QOA0sSzudTPGxbnhGP/vVDH73pSba8Wm4EWMuJ+Ie5viPfiksf7SHt6NajvYA1kDGjCZxspqmxVHWhyeqoPz7f4wMS/U5PDuGTxv+ARGK4K9eHXNv/gSQUu3grvJ5UtlJ5vKtIC6s5zVNs6HVsjqQPktb7/WbCANEQUygGsrZaqtiBKSvW6vvKrqWdI96OpVqfdKLZqcgPE+7zWegCK39uL0fWMZtzHxNxgkqsbntxgu0mo+TRmIWF4hyVOEoDFl3XhivDkJClOz2IZd3A7m/xHakjmMCtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8iwCxK3LR8WRLW+mPdjDx9M57PjxGvGxR/mIVXrM/0=;
 b=z1kxnxNgoB62Ww69qcTenw8aTrVfDGCocNHmiYajg7LAyEYM6fADjRcDwqBqRIOguSurpshGE0B5SMXvS3k02aAIUSZTvUAjNmWDGGEb6lmp39fY0f2FF2HTxabZP+rilzt4+JSrp34oGke0w9L8nPqFlOWmnPqrrG3v1j1xk2LZq4tYxyBlR4sIfnoyD5ZVEZ1EhV6jJmusn2dNmCsAupz93DOyYsrQ6LjOve0Bd6GKkfJiZnIBwmMQE8Q6nhlbZXIHZGlDbWlx1MjyOUWPv5pFZgbViDUXfrft743u7KEXcIVUQkBQ/a+Z9PN+5hCaXS8D/4pNqvPcvj98qu57NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3eb783c-5471-4857-83e8-499f65af8c53@suse.com>
Date: Thu, 23 Nov 2023 12:07:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: limit upcall vector related verbosity
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
 <ZV8tueH53FROk86e@macbook> <f52395ef-5995-46fa-8dc2-6b49b3d79ccc@suse.com>
 <ZV8xAJjVH5hxz9VV@macbook>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZV8xAJjVH5hxz9VV@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: a48441d1-51b4-4e92-391a-08dbec145a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+OOSVIVUK3Zy9Bn2/kKUW2KrpTTtwDU0OxQoILNZJfe1whvrg1wyAsNVVNiiFieUntrUvi1rTwCZ+kCzmDk+9X/OjpmT05M1ekrXNfJ0g5rVfH5tLXDOppdm0MZhWqpGV7ONLCYjdgeB1cW6kdn0TPlJ/NJBtHTBr0M2g7VoGvFmGI6iX6oiHf1UnIbUUT6UHBrpphAEDhgdDvMFxaR8Ex43q/UbNQH3B7aY4GHCziX96/Xf8nRW+KIKNGmz8b2P7npiL/DVFgdOO/0YQYzh+9zcNppFyl8T3fFvAWHWs2iPjds40gqnGTEJy5EncM6mfejN5LI6iknK5QhMpDwBsz4bSU+SpXsjCMb3+LZ7g3mMOYldEIP0awiWQNa60FM5CCEsBr3DzWoqBwAFB0QdwxrVA/9K18dbSIE49ylLea+0vSkBReg8Ot4kcqmB0aeMetAif8sEaN2txVIVSVm6Kzf9C6PNgNuaiZd2kGulgnBmoQlhf320yUR9OlnCPI5Ui/gsQ2DupJrjasKBXxduS7r16Hd8ijaxuVcD1O0jj2CZy9tphUpJiNOiUgc9fn4Mdbk36H5qa7+N3ciJ3KReYc+b4I5D37MmKYgyeT9Kc/bg0Dl0P1QXf8uX1EjuP63eA+/Lr4XwykJBqdVz49Hrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(2616005)(6512007)(53546011)(478600001)(83380400001)(6506007)(2906002)(5660300002)(41300700001)(6486002)(66946007)(66556008)(8936002)(316002)(6916009)(4326008)(66476007)(8676002)(54906003)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clFJcmpMa2NwRjJYRldnZnhnQk5ZRXY4bkxZVWNlTEh6dXVjbjNJdmxYYzVH?=
 =?utf-8?B?NEVlMDRYU25nTzRpS2VJZy92MDRLWUVRNTl2S0ZjNlRZODZrLzQrVzlXcDBQ?=
 =?utf-8?B?bDJwTUtialV6SGd6YThjN3ZRSmhVRTUzOHdqT3FUSXB3Qk1HVzMySzY2Wnhv?=
 =?utf-8?B?ZG9YT2t6L2syZTlBVlg2MEYxdDlnRVhuR1ozSkhIRFl1d2pYUU9kT0M2RkRD?=
 =?utf-8?B?d1lhQ3B4ZDMwRlNLdGVsTm1wOTdYc09nMHJCT0FLS2gwUk0yNi9xVys5UEFp?=
 =?utf-8?B?TUY5bDQwTmFLUmhWaExGbzRHM2UrOVBLem9PZExLZ0pNMEp5Zmh5K0ttVFlG?=
 =?utf-8?B?TklVdW1xYm9nM243a1RuS3kxdThZQmh3N04zSlRtb3Nlc0RYNHJiZkdDd2hD?=
 =?utf-8?B?dkRieHp1UUo3ZEVEQ1JIdXlvQTlYSFdYbUduZDBwNXNTOXR3dklPNEFaK2FJ?=
 =?utf-8?B?KzFRQ2dJb0VseGdEK0pmTmNVRlFFbldPdTM2dHIzZWJJbWs5UUV5cUd6a20x?=
 =?utf-8?B?UUgwUEdNOVJGMWlLMVdyNUdMOFVKaENraWY2M2dDbkN5dW9QZnh0M2dsbWNM?=
 =?utf-8?B?Ym1GVFdrWEN2OHVqQldyY3EyZndUUlNBR3JWQkxSUEd0bEpoWENRZEtMTTZE?=
 =?utf-8?B?bmpOeEE4S3gzaytSd2UwalhxbUwrWWkrc2gxNm1WcEtyVjFiNmlyZ1diNlFR?=
 =?utf-8?B?RUxnS1FtNTlFaXFzdndDREhjaXRqVWJUOXJ1NGNHYXRuWFB0MlIzOE9rTlEv?=
 =?utf-8?B?Rmt5Y2V2QXVCSWpWMEpRQ2xBWTFRaWFwVjJXSFZ5QjNjYmh5Szd2YWptYmVI?=
 =?utf-8?B?M0JwejZjOU5hN1dzWG5IMU5PYjZFc1FzV3ZCOGJKVEw4YlA5L0JOYWllcVhq?=
 =?utf-8?B?U05mQll1MGp1VDNZQ2trWUIybThMeTE5SGVQVm9Idmw0NGlYSXlDL0VXY3Zp?=
 =?utf-8?B?QjhpVVFiNHA4Y3ZWQVpweFNkNC9ZcjZuUTIrVU1VTTN0WUx6eVJYeEJBQ3VC?=
 =?utf-8?B?eUxiM2YyRVFTUWtpdHBlY2x0US83a1pDZFVRYWdwMEl2V1hWa1Z6RFdOLzl2?=
 =?utf-8?B?RTM0azBxdnJJRW8vVGthN2lDa2JUcFFFaHkxRnJDWDQzck5kZUQ1cVg4Wit4?=
 =?utf-8?B?YzZPYmkrc2hFc3hhRy96MVRWTzZVSmZORjNnUnVnc29nZEhCNlpELzZpVUF0?=
 =?utf-8?B?VmFDekxkMk1YbWp6azQ1MnhuMTVNaUY0OVZHNnVpS3FMZUJNYzN4Rks5Wnox?=
 =?utf-8?B?bVJPWFB3OG5IcXVPbCtiYStPbFdGQzhOWUZDMnBQQ283WFZlcGs0b0VIV1NV?=
 =?utf-8?B?eUY0anpXSjdxaW1iYlY4dVJMbjgzY3lkeWVOcHpYanFUc3p2YzgwQmpjUWZZ?=
 =?utf-8?B?VGlBSy9sUzJCVUptQXcvelhkMWVvTncvWEVtUjBMZG1nTTRZN0FaSENvcEZL?=
 =?utf-8?B?V1N2UzdJK2V2NnUwMWRtcUN2eVpIdU94bVpGUHFXNGszd25nMDRQMFRqaWg0?=
 =?utf-8?B?WWgvaUhUazE0dHdKY3NUZFJhL3hrUG5VN1pZWm50RWFPRFNkbmV2YVlmY2U1?=
 =?utf-8?B?SlE0eFFTYXZDcm80dHFVcUhodVBvSDFNRmJsUmUrWC9zc1pWYUI5VFRsaE5X?=
 =?utf-8?B?dEZrUjVXb0grRzdCTUF2YTBEdjJQM3IzcXJVR3VXNkgwQXpiMTdmc01nZGJJ?=
 =?utf-8?B?cXFKSElrQWwrNWxtaDhmUFNWZlpicUVNK0FWaEhOU3lPSHpBQi9PbGs3dHZS?=
 =?utf-8?B?Vlp6QlZyb0lhRFVvTTVyQmFoRk41V3AzaEh6WG1lVklqSGJtVk1kUkRTVFdE?=
 =?utf-8?B?akxjL1pOVTMrTlR4ZVoyYkl3U2tOMnYySnNHQnJXOENkbzM4SCthNTJHYml5?=
 =?utf-8?B?dlV6MlpGbnhjOVBHZTE3alkxTGNpTXkzcWZTV3ZqOEV6NlNLcCs1SUFFUjM4?=
 =?utf-8?B?a3dub1BlRFZPRDhPTmZOeTlrSGNUMFdHTHpRR0J6b0NuYUdLVkc5THRMZ0xQ?=
 =?utf-8?B?RjBMMFVhaUhmQXdFcXZJMW0xeHBBUnp4a29QTmdScm9LMUcrL0orUnp2TXpO?=
 =?utf-8?B?MUlGZ0pNOEpGcDlzTzFqWjFOYTZRQlV5UnArU2lYTkpYWHo2cUlydlNSenp3?=
 =?utf-8?Q?K26dCvUKfFHDzRZdYZO8DfdKS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48441d1-51b4-4e92-391a-08dbec145a6f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 11:07:16.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KCecaeSIzNf8Gfiz6qzPgP4QNguQMSK8IvqCvImWh/o7YHAiYHQxs2kHipF85/jp48PxTX3of1nD326eHyJ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610

On 23.11.2023 12:01, Roger Pau Monné wrote:
> On Thu, Nov 23, 2023 at 11:50:41AM +0100, Jan Beulich wrote:
>> On 23.11.2023 11:47, Roger Pau Monné wrote:
>>> On Thu, Nov 23, 2023 at 11:25:34AM +0100, Jan Beulich wrote:
>>>> Avoid logging all-identical messages for every vCPU, but make sure to
>>>> log unusual events like the vector differing from vCPU 0's (note that
>>>> the respective condition also makes sure vCPU 0 itself will have the
>>>> vector setting logged), or it changing after it was once set. (Arguably
>>>> a downside is that some vCPU not having its vector set would no longer
>>>> be recognizable from the logs. But I think that's tolerable as
>>>> sufficiently unlikely outside of people actively fiddling with related
>>>> code.)
>>>
>>> Maybe we could consider printing unconditionally for debug builds?
>>
>> Indeed I was considering that, but it's primarily debug builds where the
>> unnecessary redundancy is annoying me. (After all I work with debug builds
>> much more than with release ones.)
> 
> I did find the message useful when doing guest bringup in the past, in
> order to know the guest was correctly setting up the vector callbacks.
> 
> I guess there are other ways to figure that out, or the message could
> be added when people is doing bringup themselves.
> 
> I find the save/restore messages during domain create much more
> unhelpful and annoying that this.

Yeah, these too are ugly. But going through this save/restore cycle when
starting a guest is supposed to go away anyway, according to Andrew. Plus
the primary annoyance here is for PVH Dom0 with vCPU count not restricted,
and there's no save/restore involved there. The typical HVM guest, otoh,
wouldn't have as many vCPU-s ...

Jan

