Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63293BF34F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152786.282246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IX6-0003ZO-9b; Thu, 08 Jul 2021 01:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152786.282246; Thu, 08 Jul 2021 01:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1IX6-0003XI-5z; Thu, 08 Jul 2021 01:08:52 +0000
Received: by outflank-mailman (input) for mailman id 152786;
 Thu, 08 Jul 2021 01:08:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFbg=MA=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m1IX4-0003XC-TN
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:08:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560eb9c5-8282-4e5e-8831-f011cc223a6b;
 Thu, 08 Jul 2021 01:08:49 +0000 (UTC)
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
X-Inumbo-ID: 560eb9c5-8282-4e5e-8831-f011cc223a6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625706529;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hpRq19QBaiklmThKbfGz9MR8NTp9J9/KfdbQ0rV8Zks=;
  b=YjJrJaDYmWAp9o4sNhu+kDb9grbpQOPzQIURAfLNAmFvd0UizpxWyGIg
   /ElCHbcGtnnXyNEZGbJZh1hMJua4xrrjK8X0Wn/yZ9wLGzVUzswmTV1AX
   V0PCbJBE1z5rce2eVOjZFz/x8oDyEGR8uwsR0lh+CYjzbsHTTfHrIDNb6
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gRLGubRZMug6oBsh+HeLZHZAD2xSCFuRfFqlGpjkMcHZFza6sGOLPKebk+IyuCzYLP03zwjBox
 VZzqMeCNX8Pk//yN3I/9IS8dHN2hav2GMUM55lgZVpy8p9RR1BgyW3xgxPoorLrq6WgYZSUYfY
 bZsQ3nuK2otW7+KIK6Tz0cguX03jAvhHFGscf7tDa5LpIfyshdz3Yl5LxRElOpEcYjwNm0mVWZ
 U2ekvbKF/HdfUrXkS2rFJHVnvp3LZIbEl8Nvb/HmKDXD91GuQW/LsnKRyFKOvj84Ir2uvdKTTF
 6xk=
X-SBRS: 5.1
X-MesageID: 48169990
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6ksd1Kzt/GV12EiN+zeNKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="48169990"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQA6k4ZAkPXuwQVMUuBSxWiMl1rbRUYhMhf7+twQ+xrKUIq+z9bleJOUhyx/DBR4rzCHBNejjyNzH2Nf6K3hB4sKqFbXQHu7doqvhIwRrjde9a59X8s47C8kC8naTrJ5y/tYy0cZrW98zThkpbNdkd8cb/smYiaMfKE/FcSUwGP7K9ktf66168HEMjidNAKOD8B/2D+T9X6ED1qIplMs/aIenH1qP+h3M5vOxhE300Ypl62UiU0sBsFiUIcle4AaCHNXE6Z39E5FNBXVDKHAozWw0fpDMVoRJNPZ+f65hMC9pFxX2F5MND2EzxUEMv3D/xfAfFfLo0JWi3a7uAEP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yefzc+M5i2H0lPr8iW9RedBY/KC1AATX6LXYLMhRrQ8=;
 b=IH/InWHQC+FBTxtTQj7GfsIfRyxQcYImRUMJXBSqVJmR2P45X8cWC5mO6avEP888l3aQpwDocIzNJFgyGyG98jMkc/v+iWBwi1wzNJ2fnoANwJ3o7Z6Xi+mE/QScZOxld2svbP8eAmANORzinvFrcYXiHe5GlcHO1xy98/m8GBpZ5f8pTDOjAJlKI1sdFbUGtv2J2d8Z2ycc7eKARmuTZBER469ewhcP/Qfg/gU1zIZP07TgXVZyEboZti3BPMERxOWNT2IKwMk8oBPcOF5WqlSKY0M32h0moyffw3BpRCHkF4xC2xx//3MLDAlfXp+7EfSMZW0UqQ70lOKzgwEpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yefzc+M5i2H0lPr8iW9RedBY/KC1AATX6LXYLMhRrQ8=;
 b=uY3ecL6vopeZbzBJ7YHD5gwRvweNhW2K1sEO36KT3Azei92K9IKNzEqsoApaKlgeHNaCI7ILkfV5hYeaHgvCnO0QmycBfiMa5VZRraJ+QAWMLVZXcNwYPrh8T+PwDQg7GBOGaybPTTSYv/ufmvVhdtI4Ujoaw9YGJQF5c7IiWjM=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
 <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
Date: Thu, 8 Jul 2021 02:08:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f11e8cb2-c5f8-4e66-5e1d-08d941acec6c
X-MS-TrafficTypeDiagnostic: BN6PR03MB2626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB262659F511220D5F4F9DC3BDE4199@BN6PR03MB2626.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Us7ufhowxZPwchX2TYy/tvQr0QZT8y6VB48wIfv9hQvtRhUkXSdlscgS0MNybdFvPb6V9dMCCkhzHHsTZhYTZxbqKNizNPYaEkrjDR5dwKAeFcjZ4aK1CgKK+giuwQlaDGgUghE7P/hHtNObWYCDc1/Tb2Xh8aFZ8/WfrfCqF4skjtR6UySYrxU5s1BG46XJFvD4aqk2zKt8O1KCi/YwviPfXAdhU5PT9ETD3K1DTC6XkLY7G3CRinDgR9Yt4o95KBL7rVq9CjYrxBB8KzoTQ1t3Qfx1R+vgrbT+fpBeYGTjqPYdZHrWpX/Yw7ZqPvD1DDlHR0KqyXeLr3h5G8jVId1/JQSuYAdlvLQRN/LHreE+GzL8B8iC4CHgTd1hHjOSykMTPNwPWta982SN03zvz2iHnrYh6Uk4cGdzSOyUon766V53S47KI2LMYlgblUI0n6rnoBtxde2uifxuZlinfEga+doHXUQIi51qKe3vnFAIVhAvEIE98RhVx44mibwob2bKw70WtiKaPMDwXwZ5Y6U/wccZVnoK7P/VCgYUyQsfUosIkDQTFjzXvRxAWs5QcvgzwR67SOR5gQvpRZ3FqOWMCVJ2H2RXy0orJO9Kql9o7ttJlkbPqY7xZn2QqEpam3anBFBegWWRySpXRTVv215Y9C58BnBZuDay8wiM1KBLnIyeKjWdMFmEogbdHMKf3asWU5+SaYSrlwXbcz8YlwYzqStE1BvZIkqxxGMHHS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(66556008)(66476007)(4744005)(478600001)(16576012)(83380400001)(6666004)(8936002)(8676002)(110136005)(44832011)(66946007)(5660300002)(2616005)(186003)(31696002)(86362001)(36756003)(956004)(38100700002)(53546011)(26005)(6486002)(2906002)(31686004)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2czQUlIRlRtcWdWWi9uQnBqclZwNm04eXIvNXJHdmhkbFpWT0lMTmsrTUQr?=
 =?utf-8?B?T3RMSXF4ZytHQzBLaXMxUjFRSFIwRFdPRWtsalJkNVhYSjR3NSsvRGx2cWox?=
 =?utf-8?B?MlZjYm1PUHJkT2JhK0ZZNzRkR1h1dEllbUVXNjNqb2lOcWVnemtEeEpXeENl?=
 =?utf-8?B?bk5jYTlwQVpKY2pYME9VeGRGVE5kUXlYZzFMZmw4d015ZUhjUWUwOFArQ3Vu?=
 =?utf-8?B?d1oxSUltS0ZwRWIwYUdKYWt6Qm5nTnNJd3M1NERYbzB4Q29MZjJjVFY4K0pJ?=
 =?utf-8?B?RGorcUFzWS9BTDdaWG9BcHJTb1J3aytXU1A5Q3NyZ2xNcHo4QlpCWUtweUs0?=
 =?utf-8?B?SEt0SkpjTlZUZVV1aThvM01IR0h0VWtmOGlqTTN1TlNOTkFVMTRDaTRyeXU3?=
 =?utf-8?B?dzdwTUNCMFZsd0NTS3NpbXhBMzhaZURmcDNFb1ZMSjV0bDNUR3k3SmNEdHk2?=
 =?utf-8?B?RWV0SVdyUSt6UTNKdVVIdVpKSFd0ZWZIaHMzUGpqWlhXL3owZWlGaW5jNDFj?=
 =?utf-8?B?OWI1ZW1iRExzQ3lIRkdwYXdhTFhteUJ6WkhCenlLa0JBakFNaHluWWxVSFds?=
 =?utf-8?B?SUQ0UitsMlBYZllVaG1tNmhvY2hEUFN4VVFIQUFxLzlwTDRVeDhZQjVsS2hQ?=
 =?utf-8?B?OVlGeFRQZ0lRajdwWE02aUlxWEJMMVN1ekhFaFpodVZkS1RCUjZyYTl0UHUz?=
 =?utf-8?B?MC9lYTZ2Mmd3cWk2TkhxTjBUQ05hMnM1a1I1WExJZWVjUGsya0luVVhmTTVz?=
 =?utf-8?B?OEgxcXY0Q0wyeDkraHBUU3NySmdCZEwwdWdRT3lKcEQxalhrK3JQZWJYZUZ3?=
 =?utf-8?B?UC9vS1dweGFMUmV3TTZMMG9NdSsyQjJvNGNEcUNibDdMUVZoVGhqQmNZbW1p?=
 =?utf-8?B?bldpY3ZoTEFsTDZtL3FteTUwMFBqS2JPS2JrZUlCcWtnc3VDcENGandzQ3Iw?=
 =?utf-8?B?MGZXY1RWVFpxTUZ6am41TlY0M1RDR1BQS1FUZG9hV2k2azFVSTZtWkR4ay84?=
 =?utf-8?B?Z3dxTGxJWEE5U0hTQm5Xb05NTC9BcmtpWjF6RVdjTlczUXkwOU8zZjZFR1Vt?=
 =?utf-8?B?K3BMak41ajc5UUQ3K0JTd3ZUMTVqMjJPL1Jwd3k5Si9veWlwWEc0NnE3K2hE?=
 =?utf-8?B?cjN6c0hEcENraUxOMEk4RXVQY3dlcjgxdDBNWHB3MXRRVUxzTDBVOHdRbnpO?=
 =?utf-8?B?cnp6M2xFNG1Tc1dXdG5ab2kwa1E4L2RBTUJIS0FOZFlIRjNKc2xFMlJ5QkJa?=
 =?utf-8?B?ZnhQVjB1N1plSUlGOWxKT2ErSEVuMUlweGk1UHFFZTkvOHZ4dmlUajNhVnlK?=
 =?utf-8?B?TTZ6YzYwcTVrUjhSLzlnbkdWWHRqTWMvWTRYL1dNZzduZmxhNWcwcUY0NHhG?=
 =?utf-8?B?cjNyclExd0hiMVdBZDBIRTFJeEhTdUVUVDN1U2E1WU5yMjZmM3QvUVlic3lO?=
 =?utf-8?B?QUZBaDZ6SWwreDJHSm9jUGs4cWpBQ0hRV3FJNjZXbU9oc2lOd0F1UDh3R291?=
 =?utf-8?B?ajFVRkdCVGQvVXVrZE9qT2NNWkduUnNzeDR1TWI0MVFnYTYxa2JwZCtxcDB2?=
 =?utf-8?B?emFnTHZEZ2hhUjZaU3ZzYWJTemxKQU1GR3Q4elVSMm9FSXhodm9KSElFZEhi?=
 =?utf-8?B?N0RkRGhWc3NveHRzQmRIVFY5KzRZR0ExVUtDbXpqdTNhOUFHWXo4VnVLZVlE?=
 =?utf-8?B?R0NUeU1FOXgwYkp3YWRvenJlc0ExcGRkZmd0YmtFeHVtbjREZVU4ZzBWdWJZ?=
 =?utf-8?Q?bZ3nbSNy7eVlOZSA4N8/1wNs9WtzWTa3zpW3Xmz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11e8cb2-c5f8-4e66-5e1d-08d941acec6c
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:08:40.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqgJkMlZH2IOpo7WbNwqgFQ2fnQJt42SvmDhAx9AD45OAe1kPjDugZX72Npyyq/hjJ5QeITuN95dz7ri1xTlDcQEMY0d18rjq2TSNXJb4rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2626
X-OriginatorOrg: citrix.com

On 07/07/2021 10:19, Andrew Cooper wrote:
> On 07/07/2021 08:46, Jan Beulich wrote:
>>> --- a/tools/include/xenctrl.h
>>> +++ b/tools/include/xenctrl.h
>>> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
>>>   
>>>   int xc_domain_irq_permission(xc_interface *xch,
>>>                                uint32_t domid,
>>> -                             uint8_t pirq,
>>> +                             uint32_t pirq,
>>>                                uint8_t allow_access);
>> Take the opportunity and also change "allow_access" to bool? Or is
>> use of bool prohibited in external interfaces?
> 
> We've got bool's in the interface already.

Where exactly? I couldn't find a single "bool".

Igor

