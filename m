Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B3374F4F
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 08:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123358.232663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXOD-0002nd-VN; Thu, 06 May 2021 06:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123358.232663; Thu, 06 May 2021 06:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXOD-0002lY-Rm; Thu, 06 May 2021 06:21:37 +0000
Received: by outflank-mailman (input) for mailman id 123358;
 Thu, 06 May 2021 06:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leXOC-0002lS-EG
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 06:21:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7a96cb2-6e69-41e4-b083-b18df531dc2c;
 Thu, 06 May 2021 06:21:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-g_n2gosZMdCIL_OhKNJivw-1; Thu, 06 May 2021 08:21:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Thu, 6 May
 2021 06:21:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 06:21:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 06:21:27 +0000
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
X-Inumbo-ID: d7a96cb2-6e69-41e4-b083-b18df531dc2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1620282092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2u+aTEFkhpm5mkgF4eOF0+Eb37M6Aq5WLNTwUg+GkY=;
	b=eUCDIj3Nw6M9IfVL4cwmuo6kCN8xjINozocXF48ZL04SvvcGdh12sXOghX6Duyew1hNwrG
	WW7hsnMVrktt8eXV4dFe/LyZ+9lKxGwg7yfkueLim1OZeIoZoJEdAKA26/eN/7RN8ffd43
	/PJu38ADtLQGxoJKoAgU6tesWx7MVOQ=
X-MC-Unique: g_n2gosZMdCIL_OhKNJivw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0OUI6siT1KJFpxRQ/meKFsFJWIyR01CyLOvq4RCsPH3aCyXeCrhjDMtiGrGeXlVj0+S6JOdyaAkHFOzaLSkpNMnk+gUzwx1QUaGRiz2QvfvhFwWH2Kuw9nkzziaGMiBUuRkH5HIJvgYvu7+I4VOGNkpkL/ht7dyw/lipoV8/MeCy1eqCB7/KlmeUD7sVjvKaFrijvDLaBMNDg7LpPhVRb43ag0mnhg88aI4AKeOqRbfVZttxkV4FpoV8JasApkIFGWBeqvBOg8aGqKOdqC8oSslnbdPdU/qugIlPhxP/23rIGthpozVws4cQE+XR+qd/r3iGccvHCxxhCMsZZFzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2u+aTEFkhpm5mkgF4eOF0+Eb37M6Aq5WLNTwUg+GkY=;
 b=Ib1I6boMGKBMUHulCP1q5HQIOib8fP/VBwurbCj9fzJ2M4A2uCykJoJ2w1Z2F6sNJyskT+3KxNi44UESX2B5rp21XIYVQGxvBOBkrCtB+oHK8K2fkhJaLl/zHoNoM4CiyiMG/LxzVWYT1rslANE8saFtaQS1PS+VavxY4ur83WzjiRMd78fsW94x9vKlB1HfYVv0AuPKqeofPEnzupiOMzIu5nG5jE/QblBYHdqndi4c93XNVT+Ek7uyjoyO4OV5TVkOJbQTJVPItSv79eQ/oC+WSvLIkOXBCnncpuBi9VwkQY8IWGJ/JrYR8bVAuN7GeG0tEGxAlp5MjlcQxuNEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 3/3] unzstd: make helper symbols static
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
 <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
 <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb4ee5ef-fba8-e70d-79ae-c640ed853d53@suse.com>
Date: Thu, 6 May 2021 08:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM8P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06901323-4f01-4ea4-a9df-08d910572ed2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6384D2BB3B97075B4BDFF123B3589@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4kd8C+hua7umrZKvCVwnhcoYEUZp5VmwRY85t3i6es3gR4rg1QfNk4WtaAfwJj1gqaTaiFvIA59ccxOdca6mG14PM46H3/NisV4hYNwE3UEHTvbrqxyblB5Ubmi/c7hV1+31dmj8bI7J+Sn4zfBK3zbWETW/PE5KS8N4t/nZ044JZZbiR76wt5mu/qnR3Ijws/HHlWCNaVI/VkRaOLsNPQbP1Og42xDzWIHHM9vaU1XCc1UY86jWD42IXo97DbTdRCOz7trxTE/B3A0qnm0oMB/Y9jjm10ejCBdq07VDYoh/fLrYrH4F6A4+1h5KcvBC+Xb8McrGEUoe0V6o8ergmbLW6ZAATADdQDVcBJmMxCm2fyfnILqIzMibHXM80cW2N/a6R2GSojc8l74bLcE3prqIVoIsq+mMTnCgjXVgBVyY9oUPMJUEBDHeatLUbYwzpACIOHks0URmCZcpOYXypbQhmuqNgyRaCYUBKRGDi1LuON51TPrpiMjyRSgAw6aZS/2Wc7Wg943kMYptYLlpI44/6HmLZPMzFdS5Tp16hkhergkMyGMnp38wI0kzRKePmJ1LlIVIN6Xzn8xX3W2ccfQhoMSEQRTUrRaa/FphAk4GPzt1N74vPYY/iFaAm7stHTGs71Vyayq4Qdp1Veah2C2PLIpXmUvImgeOITl+DTiKorBmdZuqJD2hsFackCHkOudJyYbFGQbMf4Xk4OcOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(366004)(376002)(346002)(31686004)(316002)(4326008)(5660300002)(6486002)(26005)(31696002)(36756003)(16526019)(52116002)(478600001)(2906002)(54906003)(2616005)(86362001)(53546011)(66946007)(6916009)(956004)(83380400001)(66476007)(8676002)(8936002)(38350700002)(66556008)(38100700002)(16576012)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?MFArSFNmaHR2SzV1SmJxMStuRGtQaGRFZXJNOUd0S2haS3VFSnM2NjJZSi8r?=
 =?utf-8?B?K3czZEV0c2dLZHBCb01QUm1sUCtlSUJrZFltK2tPbXFJakk4dHE3RnlGRHE2?=
 =?utf-8?B?TDhrVTBpTGZHWjNSK2lSeGdxMnFzdVJwTnRLcXVpYmtKR09ianFoc2N3V2N5?=
 =?utf-8?B?Zmc5K1ZYaFdVeEFoczJySXZxdUx1dkEvSUZ3dVloQ3AvQ3lIelIvYXF5c1I1?=
 =?utf-8?B?SHIxTVczdkhNMEZZcW1NQitJVC9pVGFtSXk5bVRFc3EzT1o0aXdCSkdOWVJC?=
 =?utf-8?B?RlYrV1BGVkMvQXNXVjZDK3V5MWYwZHhmSU1qOUU4b2VpU1NIb2FjQ0t2dTJm?=
 =?utf-8?B?ZGl1R2tBUmlxenBIM25teU9jUWdycitwV21oZ0c3Z3Bib2RIWFdQZ2I3ZU5o?=
 =?utf-8?B?eGV3RlptM3VWUS9qdVpPaERRSzZkT2lJVENRUDVHakRrVCt4dG9WZFg4WUd5?=
 =?utf-8?B?QnBtcDBuWEJlRnNTUWlOaXZCdG9PWEFnaG44TXZhNVR0ZktXL0xtY2pURU1T?=
 =?utf-8?B?dTkwNUFRQmVWTktuY1VPdzl1Nzc1bWgxUEVlUVhqdk5uajI0alFTT21OK2l6?=
 =?utf-8?B?eWRlSVFXYjJjRHAzUmlkbkVDWWVLZVl0OWtKL1lMV1hEYWpiR2I5azJPTndI?=
 =?utf-8?B?dzJjRlFtdUkzL1RVYmorMWZqaktEU09LSDRJTGtKMEY2WHhmbXd6Rk8yM2g0?=
 =?utf-8?B?ZUU5UWYwSVBTT0FYd3N5WEQ3REtWb3l3Tlc4RW9yT1JoNWZadFRMdXdtdlVB?=
 =?utf-8?B?TU1CVFBSSXpvRnprWnZvUDFEb3UydVpZeEVqc0ZGbHpsTjFscndLRkxTYTVo?=
 =?utf-8?B?amJMOSt1aThPTEMydmhYWnZoVU9DYWNqM2xxZys5M2FRQ1Budk5lcDY4dVRC?=
 =?utf-8?B?SjhGY3VqZnY4UzVkUENFdzM4TG1PZnVhdzR1SGMrOVZNVVNUR1pHeTBGckNF?=
 =?utf-8?B?bjJRY1RFNSt4TEE3ZEpEWlN2Vi96RnVHQmZsL1hOUFlrT0U4OFhoaFkzMFRZ?=
 =?utf-8?B?SzlCSkx4ek1PM2dGSStKZ01zNVg4cXlueExaTHp2bGVrRThHNUpxTHlvbmI4?=
 =?utf-8?B?cm4zTm56U1IrTjJFZ2I1YnhvTkd5eCt0M1F4WjY3dlBsakxiR3JkdXRMbitn?=
 =?utf-8?B?WStZSEhLSHVEcEFvMHpRWkJGU2xVbHlSWHpUbHYvTzVvU1oyeUtBQ3pRODRv?=
 =?utf-8?B?QzNwYy9OQnMyeGsyTXN3bXZpaWw4d2pObTUxKzFTaGEwSUtpNnp3MVVvcUxM?=
 =?utf-8?B?cnVUTHBBQlp6MFdnNWRucmpxMW9NcXdBcWJyZUFoSld5MW9tbjcrcWRKSlc5?=
 =?utf-8?B?OGc5VWtqT2hsNWJlbUxJd2VhYTNldHFQdmU5cFNFUllVcERtODhwWW9lVFgz?=
 =?utf-8?B?akdreHlKNzM0RXh6MktiSGViMjg2RUVxU0pLOGVwMmE5b2F5R29pdVA4RWpU?=
 =?utf-8?B?NkVCV09HcmJSd01QNVVRN2EwY2tPcDVzbzdudGF1UGZYOThLUklURDJPc1p1?=
 =?utf-8?B?c0lMSjhFYTlXSHg2TWxNbEtRckNjb0VLaDdrd3QrZTlxKzc4OGNERE1SdFRL?=
 =?utf-8?B?MkJJcmVFbjN5N1JqaEo5ZHpDZTh3cEp4K1hFT25DZjNFWmVtSkEvTERTY2E5?=
 =?utf-8?B?QUd3SHQ0ZkY3NStkallIWTk2Sy9vV1YyQ0NpSGVDT3ZnTkY3dXZGZUxqZU5C?=
 =?utf-8?B?S0JFSFF3c2NwZ0ZNOXE0UmNlTzZsVHpKMS9yNVUrcmp2bDNhUmpNa0lVRC9E?=
 =?utf-8?Q?g2QyYlsunjg6ud9+yGk75OiG/9LktwbyIfr3nHm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06901323-4f01-4ea4-a9df-08d910572ed2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 06:21:28.4402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2pKn9+xZ4uyVKiM+i2oIOMlTq0So5NB+X03k5AUEecNqL7+GXDoUJrIHh4//cQVCf+mVjSpuSodlFlozyzr/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 05.05.2021 19:35, Julien Grall wrote:
> 
> 
> On 29/04/2021 14:26, Jan Beulich wrote:
>> On 29.04.2021 13:27, Julien Grall wrote:
>>> On 21/04/2021 11:22, Jan Beulich wrote:
>>>> While for the original library's purposes these functions of course want
>>>> to be externally exposed, we don't need this, and we also don't want
>>>> this both to prevent unintended use and to keep the name space tidy.
>>>> (When functions have no callers at all, wrap them with a suitable
>>>> #ifdef.) This has the added benefit of reducing the resulting binary
>>>> size - while this is all .init code, it's still desirable to not carry
>>>> dead code.
>>>
>>> So I understand the desire to keep the code close to Linux and removing
>>> the dead code. However I am still not convinced that the approach taken
>>> is actually worth the amount of memory saved.
>>>
>>> How much memory are we talking about here?
>>
>> There are no (runtime) memory savings, as is being said by the
>> description. There are savings on the image and symbol table sizes
>> (see below - .*.0/ holding files as produced without the patch
>> applied, while .*.1/ holding output with it in place), the image
>> size reduction part of which is - as also expressed by the
>> description - a nice side effect, but not the main motivation for
>> the change.
> 
> Thanks for the providing the information. I have misunderstood your 
> original intention.
> 
> Reading them again, I have to admit this doesn't really change my view 
> here. You are trading a smaller name space or prevent unintended use 
> (not clear what would be wrong to call them) to code 
> maintenability/readability.

Well, I mean mainly the usual issue of us, short of having Linux-like
section reference checking, being at risk of calling __init functions
from non-__init code. This risk exists with every single such symbol,
and hence I view it as helpful to reduce overall risk by limiting the
number of such symbols to the actually useful ones.

> At the same time, this is not a code I usually work on (even if I am 
> meant to maintain it). I will leave another maintainer to make the 
> decision here.

Fair enough. Thanks anyway for looking here, and for all the other
acks on this (originally larger) series.

Jan


