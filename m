Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF413F8787
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172995.315663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEWr-0000p6-KW; Thu, 26 Aug 2021 12:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172995.315663; Thu, 26 Aug 2021 12:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEWr-0000mU-HM; Thu, 26 Aug 2021 12:30:45 +0000
Received: by outflank-mailman (input) for mailman id 172995;
 Thu, 26 Aug 2021 12:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJEWq-0000mO-5D
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:30:44 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38d3da56-a9b8-4eaa-9f7d-133c4c0258d4;
 Thu, 26 Aug 2021 12:30:43 +0000 (UTC)
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
X-Inumbo-ID: 38d3da56-a9b8-4eaa-9f7d-133c4c0258d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629981041;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x3I6GZ9RvctxN6HIHyV6evgAaApIwNAsVJ3oAp5MWvA=;
  b=SF4ew6x/MTddIqfUjZpmMyR5SOfftWkcrJkPm43RBDqdRbCS2LCl/wAU
   hgPtNAqC7ivsw98T6T7mK20guS6HS5FKMpG/tC4UF97lWxl4QiSf2Ca3e
   TNzLInjkPDbSflBq7oQjpfDohM8QuJzrTVzP9w65aSjY6WSsF4pFoWyiY
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ISB3iveNyVExZSYpqgzQsFparhe/OGme9PNPfyX90zphmMkpk22moBg+2UIPap5uO3OKzY9pB4
 tGoiFx+YmgMNyNpd87IMVnwnB5Tuz7LUg1v+dM1XqDDMvPfjgh7DskcacMxGnmnER//tJrtZC7
 /XHzVLfLV61cLa2aBRkzRwbYp18eGy+6JQXzv35b6RVCPYkcs0mPk+poBeI81Fm6i08L5XU/V6
 iOA655+LGR9CWi2mCRA11/wqUUKwe9jt04dy99tAycWcMjmoHCnPpVTJy6S8rbcJuCU8SBuXOQ
 KL2i8lLC60+4OMQEh/3KHheD
X-SBRS: 5.1
X-MesageID: 51368838
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WdkN9a5iBytRcS0syAPXwaaEI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJU3I6urwRJVoIEmsuqKdhLN7XItKMzOWwVdAQLsSj7cKhgeQYREWldQtm5
 uIEZIOcOEYZGIS5aubkWqF+pQbsaK6GcuT9IPjJgJWPGdXgtZbnmBE42igYyhLrQ99b6YRJd
 653I5qtjCgcXMYYoCQHX8eRdHZq9nKjp79JTYbGh8O8mC1/GiVwY+/NyLd8gYVUjtJz7tn23
 PCiRbB/amms+u20Fv1y3LTy5hdmdPnysFGbfb80PQ9G3HJsEKFdY5hU7qNsHQeu+e08m8wnN
 3NuRs7e+xu9nLqeH2vqxeF4Xi87B8er1vZjXOIi3rqpsL0ABggDdBavJlUdhvC51Bll/tXuZ
 g7jl6xht5yN1ftjS7979/HW1VBjUyvu0M4neoSlXBEFbE1TdZq3NMi1XIQNK1FMDPx6YghHu
 UrJtrb/uxual+fb2rUpC1T29SqRG00BQq6WUAMtcye7ihOkBlCvhcl7f1auk1F2IM2SpFC6e
 iBGL9vjqt2VcMTbbhwHqMIRta2EHXERVbXOmqUK1LhCa0XJhv22szKyYRwwNvvVI0DzZM0lp
 iEekhfr3QKYE7rCdeDxtlJ9AzXR225UTmo18cb/JRyuqT9SL33K0S4OQUTuvrlh89aLtzQWv
 61Np4TKeTkN3HWAopM3xfzQd1XJWMFWMMYoNAmQFiDy/i7dLHCh6j+SrL+NbDtGTErVifUGX
 0YRgHpKMFB9EywHnnigBbQXHvpcEn+8ZVsELHT8uUJxJIWX7c84jQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJqhqW2352rTq3xzPBBQFFxY7fHqQzdIoxMQNEvwcbEM0u/vLVx67T+iHFtSXsnWGA
 lQqxBc4qSsNaWKySQjEd68dn+Ah3wIvXSQUooGkqKN5c35aoo1Z6xWC5BZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdg9GPzfX8MUunbqHedk7Vbk8WmMr8AmQXUWGxS0V9SMvAooTz1Iwn
 Vs7q4khqaakzrHExp9vA14CiwPVI2kOsMDMO23XvQSplktQnA3cY6+v03et/j0QBuyy6xdvB
 24EcTeQ4C1PrMUgAEn7k9ByiIiSozaRTMwVpkyi/wNKU3W/nl0yuOFfay1zi+YbUYD2PgUNH
 XfbSIVOR4G/aH96Pe5okfKKZwd/ORnAgUdNsVXT5jDnne2bIGYn6APGPFZuJ5jKdD1q+cOFe
 aSYRWcIj/0A/4gn1X9nAdpBABk7H0/1f/40hzs62a1mHY5HPrJOVxjA7UWOcuV4WToT+uBlJ
 95kdU2t+2tNXiZUK/N9YjHKzpYbh/Dq2+/SO8l7ZhSoKIprbN2W4LWVDPZvUs3qinW7P2E43
 /2ZZ4LrIwpFrUfDPD6ShgpimbBzu7/XHfDmjaGcNMDQQ==
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51368838"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgKjnqwl9WrZbIy/Icx7Mis5laP/2yx/bxhUmzCwkYcbQBEEFITkDpHOJ4s2Uw/ASNfZdiglAAlDtKM1QbJupKhqmmW7eqLPN0yw4Ae2uItC1qTqHFbIVeKTD6g3QoLDvB+yUJg960YtAAGEdLgQCEha/eQfxAV05zfWnpqHjFH3VAGXTOI7/jusnU9yxXMLiLjgeAuG/s3/7iITqh/3ra2IgnD3Bsm/X9aa2UTwjoAQo+V3WlgjPIZEdOH0+9AGdZZk+U+sxLw3tmfFAk+syqt52y8IngBM63U/XcwmfQorHRqEqsA2/tWroV7c/yVZzKHRLpBEyUc2HWpCJpX66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnqIGO1od2TJLf2Vm2JprfDfPfoJAOarWZHkjJuVeE8=;
 b=HCr/bKAjo+vbJw4oKQT5FthiG08cCp9Ayiuo7ry9EppzefSo5KJpk6V5mmLav9mULqs41tXeqtWAG/rjg8C4C/G5EL48hhkBofoq80X/4RbBq+fHMqcnUwfDFLMIeCogVK80XBYSdU/oVRLtr1jqqp7O/CJwo+Q+FjhSoN0cKktzktu8y9uBkfQkqYA3jDbqjvEjNPWL4nOfqsq7D94011Ngde8q6dwMKpIvS3PXNT+cgnJW5WR/J2AJH7lmycmQVyn08TMgIQe0otdpuwWSMg6TaTaVyuoPhfn/cgGuw7QiIBjQtbtEWdGuhZUWFc5NN3yaPG8PrRPiqE+OnAhk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnqIGO1od2TJLf2Vm2JprfDfPfoJAOarWZHkjJuVeE8=;
 b=FSx7JyWsFEeQi49ncxdGwzDbk1AJOWGdeF2ZH44P1slZlrBrEPBgmeLe4BB9CLBn7SiQxLZE+jYSh3aeJ9aOwzznmPHTLxWeUWsoLwTTF4hpmfT+HGOl3SWtO2m283Ku99RmaB7kP4u/e4fE33vk4+ouJnfUo8OcQENRlr/5NGY=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <e4124802-d671-0e19-a062-f71b251cdfad@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/8] AMD/IOMMU: obtain IVHD type to use earlier
Message-ID: <d9647381-1acf-621e-b150-ca00b62c9efa@citrix.com>
Date: Thu, 26 Aug 2021 13:30:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e4124802-d671-0e19-a062-f71b251cdfad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366b7644-7237-4ae1-e22f-08d9688d4f3b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-Microsoft-Antispam-PRVS: <BYAPR03MB38627BF7A68B584E270E7144BAC79@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTqLZb1F9D5HcjEYTXiuLSJ9u6yLisOuaH9CuCWVo8gNAYJGuh8juA1gAXSK6LFF9kYcYQIdq3ERHg/xyNSKpEpENAhq5kqlsftI2wGPAbZ08oA7RdU23p0cAO6sLkiHJc57YCWRTPOWBfJ1MD4VQ5Ky2fkU6IfwfwG7lcpNipBifsTADnKl2OpI6+QI306PtLwkq+kF27/OMY29YsYgA9Xdy80nzXU5qUGcsfHEI8HXt+fPLjv0SJ+cSGlO9qfphxID3WO4vlK7J6r9eH5IgDp/DpC4j3IhwcdgFeiXQijpYyrpL3VNZBIXJa3ArWdGOHBR2V5IVRV++gzsrHAmUXqx4Yv+jzId39oGDIxqmbgQ77dLwou+9y2wzB/vPwwxq/c20RP8FQsTTG9pHOHjEtrLox90v8VnJE07ftviw6D9rfFcJurDR9wa/g8/EqE2vPpAMVDcxK7YqU/gwKobXo/zoyFJ7hyE8B8n4MzhQKxtsSItsi780B0mLYMTeguDxhZSw7Q077q6ABRnASXfueJORlHoam9CQIERgUUABE/ck1keBAG+BfpiBZZIFdq5ca6H6fUuO6fr+aJS7abrMxeqGbs5JePC3rG3gacjotYxWjtpta+4IH/5BfX2hiMXSpp0hske3gyX5QuO2con6tYEuD+u614IsRdhCZdfvngTWxPy8yUJzG22lFOyTr9+0VtlEHv/UkUAs0HA9sDz6yDG8G9Sc62hrudk0Rk9xUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(6486002)(31696002)(186003)(956004)(2616005)(5660300002)(2906002)(6666004)(316002)(26005)(16576012)(110136005)(86362001)(53546011)(4326008)(55236004)(8936002)(31686004)(478600001)(38100700002)(66946007)(36756003)(83380400001)(8676002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldyN2JxdVRMZk9BSW1WdC9hcVByQlVjTXZCRWtSTUVvOFVnR2xHYlNXem5I?=
 =?utf-8?B?WFFLUW1YQ0RsLzJBejUwMmJDbHpjcUd5L015YXh4UTJDV2V1a0dDQlVDcFV4?=
 =?utf-8?B?N1B5aTZUN3FUWWkzWks3c21iajBRU3E2ZlVNckhmRXl2OHc2OWxjN3hEU0RS?=
 =?utf-8?B?cFlRM1FZS1RSOWdmNFFoa2EzZWdiU3Erc3M1UmJ1NkdKMkdqWHZoNFd2T2RU?=
 =?utf-8?B?LzZ4U1FaZlFHVjJUODQrREtYaTlmZVdrYU5GZnhaSFNVY05ERVVOVk5jdUI3?=
 =?utf-8?B?Y3pvOGwxdXRhcFJNSEhPRmRhL3ZyU3dRK1lyVmd1Qjg5aUFUYjJpT1dIdHFI?=
 =?utf-8?B?b3ZPSDU3SEgwMG1seHFyTStMNXBLZ1hycXMyenQ2M2plMUxlQTdkZGhDL242?=
 =?utf-8?B?bWgxUGZIdGQ4UDVYMnFzM01XYU53UnNJME1DSlFBaHdTTFRob0dvV2x1V2kx?=
 =?utf-8?B?RVJValUxWmg4OGlSVVBmaWNlbU8xUHJNVGp6SjFYWlRmb2dxL3NhQ1VjN0ww?=
 =?utf-8?B?S0tpWkg4dmxnZ05EZHprdzZ5RWNKWWF2K21ZM3NHVHlNUWJwU0NJWUtTZHFt?=
 =?utf-8?B?SEFva1ExOHc0UWxNYmFhMjJYSDc0L0tOcVVuWXd1K2ZtTDJkdkFydzgzZFVE?=
 =?utf-8?B?dk9UMk1LZlk4UUJHVXBsbjVJaWNNVUgvVWVSek5VRTUxVTlqQy9EVU1Bano1?=
 =?utf-8?B?SlN4S2NaOXA5dnVZc3VTbUFFbkFVcHIvRllmZVRRd00rK1NDcHJ5UGtTbCtM?=
 =?utf-8?B?SzlPd0hLUWtoaTlWbVdaMkhEZEJUSXlqcTNXRFhqYTN6Q3VuNGpodWxVcTBY?=
 =?utf-8?B?TERrZk9TcVNYQ2c2OVNRSjBUZTVXWG5uMDJibXlqekJYNSs5elQ0blM4cThO?=
 =?utf-8?B?dzdoSGYzdXNxekdEc0J4K24zWmtlWThkdHlQTS9TbklnYzBleHRnSU5SeE55?=
 =?utf-8?B?S0QwZDcxNHQ3UFNXdGVrZmNteFNyRHhMRFFwaXBqOFltNzQ2ZHZWVzRuVDh0?=
 =?utf-8?B?UHg0NXh4OFB0Um1ZRWJXWTJXRHJTRGxMVTdqN1RCQnBPQlpQSFcwTUp4Nmsw?=
 =?utf-8?B?OWlpLzg4YnYrQzNnVFZPcGZLTjRRc3pkbHZ1cFRia1hNUkI4dXRWU1pSSUl1?=
 =?utf-8?B?cUtOcjlzTGFHRTErTG9ZbCt2N0RuOXpNdWFZZmJyekRHTzlNT0pUKzVJWkkv?=
 =?utf-8?B?VjhNdVdWTytrQ05qdFcxVjJYbGxhb0xmR3paLzVMbFdRaDJlSHRZMEZ4Q0M1?=
 =?utf-8?B?aHNyeDUzZnpDcDFmSnhxN0xBOCtNUFpablFrNGVuL2Q0NDdpNzVudnNOT0p1?=
 =?utf-8?B?OXB1M1YwS2p6Z0dnUTF5QzRFUkVlTTRmMHpjT2grVFVtSnZlWCtkYTY1Wk1l?=
 =?utf-8?B?dmdFbXRyend2UWVvb055RzVjTFVDM1RSeldpMzZzei9JRkZRbC9QRWFQakFJ?=
 =?utf-8?B?YTV3cElaNnRGajZtaUJJeUFxZ2ROOEU2V3Z2SHJBRmxaUmNwNGtUZ0lNT3B3?=
 =?utf-8?B?d0thRHlDanZiYzU5cC9yRFRqUmhmbWRwQm5jek9QTXpCV3Z5VWNLWTNkemZu?=
 =?utf-8?B?VzF5dDNrV0FWYTN1cW9PdkNDMnJtUnlBWThPc2l5c1lmcFU1aHd5ak12VmUw?=
 =?utf-8?B?M3FzbnhVa3U2bWhPQkR1UXpVeUNmK0VnN0p6Q0NDamNRc2QrbmpTbjhjZi80?=
 =?utf-8?B?eGxvUkprNVZ5cEZIa1pHbWxacTJ5UUJyZHowcWMwVFd6dFNRd3NMY3ljdW5B?=
 =?utf-8?Q?9q1a+yDRNSoiBJ50Ec7VzjMUOpzdWH3hUSD1Eui?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 366b7644-7237-4ae1-e22f-08d9688d4f3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:30:38.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC7wWPxm7BocRO//7DKCKJcgwvus3oxRNTnn6XaLLb1SGvve86Fn836nOKlDvKeUAT0vJRoOFGNN663/g9et6bd1TUNvwkyhfT/WHiX+4ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 26/08/2021 08:23, Jan Beulich wrote:
> Doing this in amd_iommu_prepare() is too late for it, in particular, to
> be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
> to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
> (luckily) pretty simple, (pretty importantly) without breaking
> amd_iommu_prepare()'s logic to prevent multiple processing.
>
> This involves moving table checksumming, as
> amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
> now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). In
> the course of dojng so stop open-coding acpi_tb_checksum(), seeing that

doing.

> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -1150,20 +1152,7 @@ static int __init parse_ivrs_table(struc
>  static int __init detect_iommu_acpi(struct acpi_table_header *table)
>  {
>      const struct acpi_ivrs_header *ivrs_block;
> -    unsigned long i;
>      unsigned long length =3D sizeof(struct acpi_table_ivrs);
> -    u8 checksum, *raw_table;
> -
> -    /* validate checksum: sum of entire table =3D=3D 0 */
> -    checksum =3D 0;
> -    raw_table =3D (u8 *)table;
> -    for ( i =3D 0; i < table->length; i++ )
> -        checksum +=3D raw_table[i];
> -    if ( checksum )
> -    {
> -        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);
> -        return -ENODEV;
> -    }
> =20
>      while ( table->length > (length + sizeof(*ivrs_block)) )
>      {
> @@ -1300,6 +1289,15 @@ get_supported_ivhd_type(struct acpi_tabl
>  {
>      size_t length =3D sizeof(struct acpi_table_ivrs);
>      const struct acpi_ivrs_header *ivrs_block, *blk =3D NULL;
> +    uint8_t checksum;
> +
> +    /* Validate checksum: Sum of entire table =3D=3D 0. */
> +    checksum =3D acpi_tb_checksum(ACPI_CAST_PTR(uint8_t, table), table->=
length);
> +    if ( checksum )
> +    {
> +        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum);

I know you're just moving code, but this really needs to be a visible
error.=C2=A0 It's "I'm turning off the IOMMU because the ACPI table is bad"=
,
which is about as serious as errors come.

~Andrew


