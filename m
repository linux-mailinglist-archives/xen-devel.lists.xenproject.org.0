Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5D3B4021
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 11:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147082.270857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwhxu-0002ZF-1u; Fri, 25 Jun 2021 09:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147082.270857; Fri, 25 Jun 2021 09:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwhxt-0002Vx-U1; Fri, 25 Jun 2021 09:17:33 +0000
Received: by outflank-mailman (input) for mailman id 147082;
 Fri, 25 Jun 2021 09:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwhxr-0002Vr-Q2
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 09:17:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50d6b6d2-5ce3-47bb-8fc8-6232fb555e9e;
 Fri, 25 Jun 2021 09:17:30 +0000 (UTC)
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
X-Inumbo-ID: 50d6b6d2-5ce3-47bb-8fc8-6232fb555e9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624612650;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mJ8eqNyNs7/dCmR6PTTBtcxOGRd9HDC6bMxJaQ+V+NY=;
  b=UZjf7a0YLDycx2+mZwmYwfmJ+qNM8UgRX/FpnQ3GHTiT3BRux0WnunXH
   lJ/DpD/vKJNduZD1iLLo1in8BTm1L0mfwxCXhKC1ES4AgxPZUaMS1t9O1
   cn59CE1Wg1isPeqhrGVoR7i0MhiGUJ9/wvbWyXq21yNuVyGYL4AOFJsyk
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HcR1qPUHpQdg3GnC92ivq3D95T5jgt/+zUAs2U31INP96c1m0DW7tHiPWiCP9J+kVcVRS4DFdH
 aC140Xrfvjf9JjLpXOlR6qMiu6Z/ZkZa1ecG3WBK2HPhIg288J/TuoWhdp7vM/xU0R+mckSESe
 H5jC1c3gv+S4nKhyATwO6os3eeU3g6siz3SQdr0jrcKhoC9CCfHoMxv/PA9gINuRlLv+LhX454
 rqpupb8BAF7XdcCEF6s53M0ss7lVE8A1MV0C4tYdBvYZjLU+Me0QmnI2d8NkbsOtP//C3BAbHH
 5a4=
X-SBRS: 5.1
X-MesageID: 48567710
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aH9nWqGBiMbYMGSIpLqFA5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfCtHZKTBkXCF+r8bqbHtmsDY5paq854ud3APV0gJ1XYINu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nH/hTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsDuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Ss5Vma/paVFZtl/1awKsMe61wWx4SqbpXUd
 WGNfuspsq/KjihHjbkVgAF+q3fYpwxdi32CXTq9PbligS+p0oJuHfw8vZv1kvoxKhNP6Ws2N
 60RJiAtIs+BPP+PpgNSdvof6OMeyXwqEX3QRyvyBLcZfk6B04=
X-IronPort-AV: E=Sophos;i="5.83,298,1616472000"; 
   d="scan'208";a="48567710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5ir3iIPv9nJONYzxw2ApDJlyLYx3bu9H83xnMru1cF3sIwi/W/h9ONjdkpr+G+/3xNN+8SRY7BFaeToPqC1HX5+rI4lXDEeBd42fvDwuJQR1hK/sbM4p8ZpJnaHmdpIQrKRRHXMx5akassg37u4li6jNykRii50Fw+Ic7kOrL6D0C0LjDq2i0HYIxAxzZh4nMlblW4piT6kNrQPjb0hi3S89V9LAJS3QVZQ639tIVBg7Hauh1oikTiXJiWkSMP7FHKZodEjRpusFtcAN1Q+34Y54/KGDZhDgucfIkYIAy4wVy0ja4ynfcjYY3YMxQLquG+W6Ig+oUZb5YkfXEa9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ8eqNyNs7/dCmR6PTTBtcxOGRd9HDC6bMxJaQ+V+NY=;
 b=KOqGk/x+SBRd0xsIzUbwvK6bGuWJGPhykns26sswXTlyOeABl6OFNU1TLXVJICWBXYz3LfWyWX0NmxeVSjeR+u0rPmZUZE7VbSJB3X6ac8lDuTuJsGtvbyoXtWGdDOuJB3qb56cz+RxlZbHfiDPCTuam4hxP32dnRA55VCZUE1MTN2oWxRjGD7DAdwuR9o5hrTdJh87DL9Dq9z2Bo0a/engLlRB9Xhz9JU8zCLdXU2PO+3CUyhrbsvVc4rqjuBJq3SouGIorncttRY6pTnIylfhUMr56uXSIP//2rWDXX6XvseK1oXLPnoRiFsPZEHeEJM6F+EbjH1ufiQff1TSHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ8eqNyNs7/dCmR6PTTBtcxOGRd9HDC6bMxJaQ+V+NY=;
 b=YLRBvqLUuLlXt9DQrBsMrjxSgwbS3EaGDcF5ndc5wfwHu9ysFkeqVkI72Hwj0T2KzmDiIbOz/jDcwSAYf3ooVkBiZPA61/3iiGagper4TcFsxsHZ3zqxqhVC57mjdgNu8Uj6G1KXJpvzMLYg/n74Ych/9lwNwuCS20weeKKRxVw=
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
 <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
Message-ID: <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
Date: Fri, 25 Jun 2021 10:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9b134b-4c9b-4782-47fd-08d937ba0c5f
X-MS-TrafficTypeDiagnostic: BY5PR03MB5282:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5282A2B31B393E87E9256733BA069@BY5PR03MB5282.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byloKamuNwWimdmo7IwCMYlrOPX+xUkbjsj6eL+s2QSNkly+wj6N+vkdlUIU1O0la2oKGwSmAr8P93XDkUf+JMzHbKQ7dfuC7HAXMxOiHtg6e3FQp2b6FhEs3VWpRU79pZipEL2pTeF2esC6hx1vvN5wcfL0btimfwrkn0ysKFgSoCaCCLbizkWEcgXB5QfqPsOWYRk1dp1jOKt6XpSk8SuCWFbKs3tErbOrzAGdibMjnWQKZX4Cq7c0tgU4pRIKd/ayzcY/xZjasSW/lJTSTINq6Sbtx9R3uOVcFPHWEgz7xgAFewveG3DlkYv63LgiLK+jP7r4QdOMbDafF424U0Isd8dJyBQ8xPAb4k3gPTTu7Z4dQvRP4THjpoABbW+x49oDkibhp5irOBGLFGYRGDQyQ/wl68dlp3BQAuOoAv2iLjAthLhZYTbV6Fk9taImyF3ZrGnO06wNex6/A5AuD2pJutznPPo3BfO36mxnTV3dESOwGBAxnZGrpMtVXr2iTj03zSWj4TvlhVzQZ7F4JzMIYQzTmu3xv1RZWdwFF6QEMIixG3tcFoU3MeWcF20kmPw0C19e6iEmMvkyU/9Hbi/cAjGCMsu5GSGbbTI1HRIDOaeegFUdi5m0h+7iZCkkTQaiLCzeDhp6K2lZJXZMs2UDl+ZC5QpTGabU4EhXNAP4gVfjB90dn9xWoyTafIT2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(53546011)(956004)(478600001)(6486002)(16576012)(316002)(31686004)(54906003)(110136005)(16526019)(38100700002)(186003)(86362001)(8936002)(26005)(8676002)(2616005)(31696002)(4744005)(66946007)(4326008)(6666004)(36756003)(5660300002)(2906002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhmTkNWa2duSWFWOVlDZFhibDVFU0J1SVhvYS82S2dGSkU2b0piK3dWRlRE?=
 =?utf-8?B?djFnTm52UUlhYWM2RU95clg2SDd3cnNVczBWT1VTTytyQU5iNVUvRXo3S2I2?=
 =?utf-8?B?bUtpSjZuVmRZc3RFZ25Sc0hQOGtVZjV6eXZkMC91aVVUQmtSbHl3bzNiK0dP?=
 =?utf-8?B?OHBYdUpiUTFybEQxZ01CMFNVY0EwazVpbEptaXdBYlR6dmVRVU15ZWVGWVEx?=
 =?utf-8?B?THlsTE4rMVVpYXZTcC9XZUoxbnE3UzFMTkQ3S2NTZ2F1NnkrSlNHSkdpUm94?=
 =?utf-8?B?eHVjNVhrenhDTlVlZlFPek5QZkRvdVFPK2RycFRNQUZDeVZ6R1IwaFpHdmtN?=
 =?utf-8?B?NncxMFVFNVZvS28rZ1JiU04zZ2hWMDExejFOZUVQWUgrZWZueGhxcmVLcFA0?=
 =?utf-8?B?a1V2LzBjRUh0bmhBcnpsZFVBYnJ0TVhheWY1ZU5JUnNGekVXM1FhS0hVZ0xC?=
 =?utf-8?B?MnpIVE1lRW5RUWx0R2JJb21mRk1CZnphbzVqYzltOUNpWEp1MU9jZURNd3o4?=
 =?utf-8?B?K2duQm9QRFZ6NGE5d1N3U3BreDdZVkthLzBQZG9pbTZBWkpvN0VHYlhvK2Jz?=
 =?utf-8?B?TWlNUmowS2dMUkFYS3V4SkZKRkE4K3pIcEhpby93bFpCWUxtb0tTajBpc3J5?=
 =?utf-8?B?aUorWjJFZjFtTnV3Rk5zOHFSYmNSOFZLVm13OUhFTlVtWlVrdFM0cnUvNXFv?=
 =?utf-8?B?c0dNRWE3YnozeWRRVVJRWlZpZ0xwY2FjQi93bkt1NVVhVjh1WEl2dUdkcSta?=
 =?utf-8?B?emNReXNhMlJDdHFXcjhkYjhodFlBTmtueUwvbE1ZN1hjU0xVdkpRUnRjWnZX?=
 =?utf-8?B?cWNwZnh2VTR4Nk5xRUJ6amcwMnhUUXlGTmVuTEdLZDVmeEZlelhzWUhpZm5o?=
 =?utf-8?B?RDNuT1dSQldwQVFUcW1tTVhyNUM5cU9YWmVJZHpzS0JmcXZObkhJYzdaelhk?=
 =?utf-8?B?SzN5WDQ0VFFHdXBacFhTaTRiYVhETXI1Mkd3MHFCdGI3d2xLVmxTYnB5UXZZ?=
 =?utf-8?B?T2ZQMGdHWUFyLzRmTnRNMlFxWnpZZC9BcnNRYlpjdWt3ak1pSkZQQTAxanVt?=
 =?utf-8?B?c002cG14WXdtcUQ2QTY3Z2ZrOUhmbldVNS9wY2cvYklQYzVmdzBXc3ZINml5?=
 =?utf-8?B?K2h2S3RGUjhRbzdDdkptK2VxSWJHa0ZEbkpaa3d3SU9xTEsra3cxNmdVN1pS?=
 =?utf-8?B?ZGRSL0oyQ1RITldNY2xSaHI3MUs3bVRpN3h5Z3BjcDNRTmx3cDd3QnkwRmtB?=
 =?utf-8?B?OVJ0dHl6ZlV1MlExS0dXd05DWTMxWkRZTCs1YldhdSs0NjVON2xid1pqdVJV?=
 =?utf-8?B?SDEzZlNLMjFxUURCVVFON2Q5UmJ6bWNoeWNySzZqK0psaGhYcjZxNGRYQVlX?=
 =?utf-8?B?c2NRM3oxMlpwbktud2hnVXlOcENFUk9jRkRlaUdGYmlwdjdTWlBqMlhyUkZW?=
 =?utf-8?B?VEloYzQzenprekhSQUJKVFFPZllTcWVwSC9WR2hvdEZUZ3NEamlXdk5CRVhR?=
 =?utf-8?B?bUczNnFCTzlCQzMyOVdZbFNBYllGUjB0aFJMZ0dSbENNNGtWbkltRXhqMlZ1?=
 =?utf-8?B?WjBQRWFPVnV2R3ErbHNyVU8yTzVaK01aakpxbzFROHduc3MyTnVnM1Q2eHpQ?=
 =?utf-8?B?cVl0QnpCVUFWWHVqRDZ3VTN1LzIrWjRtemdJM000OEhlaHpzUVJuTWJPRlB0?=
 =?utf-8?B?dlo5YkRTMjJIb0F1VlM3VHRVazJ1ak1uY1JmMFRCelIxbkVPNmRNUUJwL012?=
 =?utf-8?Q?iEWxAC/OCaCM8f9de918zWP6hNgJ/Z+NxbfhiOQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9b134b-4c9b-4782-47fd-08d937ba0c5f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 09:17:26.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9grUn4vSC0vYmShdnJkW+ykALjEQ5+uQSefRWggL0+RHcVIa82l1twJI6fLFJm4rMRRIMTlJNma7d5LuC/FhTDsTqJYqG1Xx20TG3+ah7UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5282
X-OriginatorOrg: citrix.com

T24gMjUvMDYvMjAyMSAwNzozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjQuMDYuMjAyMSAx
OTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRml4ZXM6IGJlZjY0ZjJjMDAgKCJsaWJ4ZW5j
YWxsOiBpbnRyb2R1Y2UgdmFyaWFudCBvZiB4ZW5jYWxsMigpIHJldHVybmluZyBsb25nIikKPiBJ
cyB0aGlzIHN0cmljdGx5IG5lY2Vzc2FyeSwgaS5lLiBpcyBhIEZpeGVzOiB0YWcgaGVyZSB3YXJy
YW50ZWQ/CgpZZXMgLSB2ZXJ5IG11Y2ggc28uCgphbmRyZXdjb29wQGFuZHJld2Nvb3A6L2xvY2Fs
L3hlbi5naXQveGVuJCByZWFkZWxmIC1XYQouLi90b29scy9saWJzL2NhbGwvbGlieGVuY2FsbC5z
by4xLjIgfCBncmVwIDFcXC4zCsKgwqDCoCAzMzogMDAwMDAwMDAwMDAwMTQ5NsKgwqDCoCA1OSBG
VU5DwqDCoMKgIEdMT0JBTCBERUZBVUxUwqDCoCAxMwp4ZW5jYWxsMkxAQFZFUlNfMS4zCsKgwqDC
oCAzOTogMDAwMDAwMDAwMDAwMDAwMMKgwqDCoMKgIDAgT0JKRUNUwqAgR0xPQkFMIERFRkFVTFTC
oCBBQlMgVkVSU18xLjMKwqDCoMKgIDc2OiAwMDAwMDAwMDAwMDAwMDAwwqDCoMKgwqAgMCBPQkpF
Q1TCoCBHTE9CQUwgREVGQVVMVMKgIEFCUyBWRVJTXzEuMwrCoCAwMjA6wqDCoCA0IChWRVJTXzEu
MinCoMKgwqDCoMKgIDUgKFZFUlNfMS4zKcKgwqDCoMKgwqAgMiAoVkVSU18xLjApwqDCoMKgwqDC
oCAzCihWRVJTXzEuMSnCoMKgCsKgIDAyNDrCoMKgIDMgKFZFUlNfMS4xKcKgwqDCoMKgwqAgMiAo
VkVSU18xLjApwqDCoMKgwqDCoCA0IChWRVJTXzEuMinCoMKgwqDCoMKgIDUKKFZFUlNfMS4zKcKg
wqAKwqAgMHgwMDgwOiBSZXY6IDHCoCBGbGFnczogbm9uZcKgIEluZGV4OiA1wqAgQ250OiAywqAg
TmFtZTogVkVSU18xLjMKCldpdGhvdXQgdGhpcywgeW91IGNyZWF0ZSBhIGxpYnJhcnkgY2FsbGVk
IC5zby4xLjIgd2l0aCAxLjMncyBBQkkgaW4uCgp+QW5kcmV3Cg==

