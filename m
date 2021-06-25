Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D53B4922
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 21:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147391.271661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrDn-0000oC-AZ; Fri, 25 Jun 2021 19:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147391.271661; Fri, 25 Jun 2021 19:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrDn-0000mL-79; Fri, 25 Jun 2021 19:10:35 +0000
Received: by outflank-mailman (input) for mailman id 147391;
 Fri, 25 Jun 2021 19:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwrDl-0000m6-B7
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 19:10:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aab6e3f-7d74-4483-946b-cd42d3add6bf;
 Fri, 25 Jun 2021 19:10:32 +0000 (UTC)
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
X-Inumbo-ID: 1aab6e3f-7d74-4483-946b-cd42d3add6bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624648232;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DhQX5zvhBRSz03GMH2/UUMLt1lwkneaGawIFZsXKllU=;
  b=L2vk/U867mZdVzde/gNPrDa1riV094pDPNc6WT4uAr4lcidp98jHMry5
   CLz501qba3kuyT07f+Lns2ZX03Huus7i0dsqBu+RyygdjQuNjS5Dp1gtn
   wStSrXvenjcl/MQRvkNit8l9UEZsvlTXenfYumyVppu0R8bL2U/4AdXFD
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XYqZ/H+g0mBVj77i0nKYR7jVOWskPZ/qcBRhzFOLT9SUUIeySrZALBr5ck5xVaEMjR8BizulQU
 uT+iMBqE9TUOQPblB9Y7C/fR1qGfcDG6AFEMnoLBZEUyRwXkX8WHbrPqC5fltaSn8sAs3Yi2/L
 JGePKiHpuulYUnqXTbPYyMO/OvzDGmjPfMQFZKsU7/8aE8nWXyG/e1m4v/5y4EAyIdFZcgic+D
 o0/+GW24x0Wlg6EcFZFQnYJrWcjhrCup60NzekieQ/jPWMDaahs/OdpQhTeI1dVJJ62D7kFD7W
 Gms=
X-SBRS: 5.1
X-MesageID: 48610576
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dTCaWauO3zcfRZyY/pZfokLW7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAtFD4ZjLfCVHZKXBkXuF+rQbsaG6GcmT7I+0pRodLnAJGtVdBkVCe2Cm+yVNNXp77PECZf
 +hD6R81l6dkDgsH76G7i5vZZmymzSHruOpXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6d60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKRQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimg8dleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGf1sRLQkjQRo+ao7bWTHANhNKp
 g2MCic3ocUTbqiVQGcgoE1q+bcBkjad3y9Mz0/Us/86UkaoJk29TpC+CSz9k1wvK7VcKM0kd
 gsBJ4Y3o2mfvVmGp6VO91xCPdfKla9DS4kY1jibmgOKsk8SjnwQsnMkcQIDaeRCcY18Kc=
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="48610576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgD77oBfM66gmVwbv4uHRzPPzY/VpYYEdUAdBALC7vvNqeNwVQtyoVk04UOjytUmU1atl+poEW6tz4nOK/ULy18Ss+sNZb1VHKXSrR84qF4GSyKGL156LROeiZXzFDNHSvs8E8dTC764ZHwSu0x0djNBq5TH7tuBL1x0LT07c7CR0NXnq9/D2729K73A0Ytav9IbQ8kteMT3IUhQPaAIQAJsnQuu70Ms0suwXJZ54tOnoZ9TDuhTK2V1vA4J5nNHAKG5JpQw7kN88WUsTqUi2vSmPcrjEZxmutrO63ya84RWv0KKqgQGEfwpaPVx3ldLaL0RM19Cvy9Pn+S8K9eHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhQX5zvhBRSz03GMH2/UUMLt1lwkneaGawIFZsXKllU=;
 b=ZCzOIYK7ybbh3059mHNimwvNmtOrFIeiXVAzgPCnN+NWDnPay6vDW5UFcK6ZqJqUDFx54gJmg83E2dk/zp5seRqEvxEvK+CJ509SliVk6Zuh4mTEoqnL306KY9+mthaOl0hlynqZU1usD4E6i3jSKS7JZYcOSBaFXZJXK3rOK8Eyno5bwgbgPKw+bl3vXYbAZyIs6HTXVslbQrvMFLEe8J+0ZyGa8icbGQnteTviQ5P/LURtKchmE4FrMBGn3JC6MkDdCSEagvKMQ0q6et2UdC89SMjdqdAWjNdyMcQ23R/QgEHkFk6eGE4+1SxWOMpdSnNZ0H6R0nAsAE/gYKBjVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhQX5zvhBRSz03GMH2/UUMLt1lwkneaGawIFZsXKllU=;
 b=VuEO43evF2vqwQP2PJdjXC/Us07GJ3qavurQzdF8ekyIEDOiOdMjPSTzGK24ztr07QKf9/mQPQZOXC+Toe+Cqp7OInDqps9Obz8Qy4mhwOSwv3dQiZuq79Z1PMhz+1NS3b2qfcTRtpXCOtRPQ4DV9uheFzPZbVVJOLFV3xCdJP0=
Subject: Re: [PATCH 11/12] x86/mm: pull a sanity check earlier in
 xenmem_add_to_physmap_one()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <e0819038-98b0-2c4c-9176-70d68be39130@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <af5e1458-98df-9597-663b-4b0325613f92@citrix.com>
Date: Fri, 25 Jun 2021 20:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e0819038-98b0-2c4c-9176-70d68be39130@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7225f35d-5478-439d-1402-08d9380ce589
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54541137E10B4DD4E6726A8ABA069@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJQ85+SdFzHq3FrLXxc/8XtrBFCh7/H1rNSj9cSFu8Keq2IsHkteIBYc/OyZgRphumTrIXZMo2WHh8HGcaQK45qK4AuUU7sPvxMFmg37VhuDT29T1PlhFlrWyAXZUKRw6qkjkmXQhuhoUkyjCtN1355Wtmw/BB8c6bK7tzlZTROFbYQ9pm8VdOVqNFS1P20+p7VnUsuVcIJ7c5ptQxOoakq8R8eldNPLJr0RPn9F0JoL/y5pjvv1LogKyaotsrxSciljigB7ZBINmAqLfUb1pQYfMd6SGMKeL5u4TI0yh08Hx3/gJlMi3EKKKcOH3hG+4LQO6/4JM1k9LoLO6Bu59/CdetLYAQ9LWrmSN1eL27CqyalJYYUQqnK1aUHzW8aAgJtD0tX+HN15hhChVT0xI3YORMsQNtz0Swf2V5YwnBIIWqrLWMgwyB2PrcqD5k7acMJZyuMId4RhDYDwzgleLZfB0Ayt53nsjxLPzvpkmxqVBzhi7uTKkkISYnjprZRar46GN466COe9TPaANGTDK8lfHtOvD7Lu4wT4WmMRKsmg8ZKwBmzxYGYIJqljqDl2BNHtJq88vzTajJ3wZlfL7tqoIcXElm2DrGpLHjyJPDwnD2UJB9yCK9AXQ4serM6e4U+jH0+D+rQFjL3PkYaQ38iLZIfPAIpgrYS0NsJpLR2iSJdlNbcV2zbVX3K71S/P
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(66556008)(107886003)(66946007)(66476007)(86362001)(4326008)(110136005)(2906002)(31686004)(83380400001)(16576012)(5660300002)(316002)(6486002)(54906003)(26005)(2616005)(38100700002)(6666004)(558084003)(8936002)(478600001)(956004)(8676002)(16526019)(186003)(36756003)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDViRi9xWXBpOUx3ZHRDUy9OcStnRVNBby9FdjRrbE0yU0xkOGtMVVJBRVpJ?=
 =?utf-8?B?ZUhvTURSV1o2WTByZFVGdGk0Slk4a3Vpa2k4aUYxY3VzU0d1eUZVSlRobE5C?=
 =?utf-8?B?aldZcEFmSWN0bzkxTXppQUVtazlIdmIxTkhJVkNJb0tiVGszNUZMa0RNdS9U?=
 =?utf-8?B?QW8xS0RuaVhOd1ZSQStHVGF4VmNtWWFKM25ZSVNSZ0pCK2lqUm55d3M4bkp3?=
 =?utf-8?B?R3FXSTJzczdGb09DTVFIcEJuR2o2a1VRL0tBWm96RUdFN3djNU5hMmNnbWhz?=
 =?utf-8?B?RGV0WjNZdWM5WXc4OElpcFhVUkljVk1QaWdBb2lkbTNBZ0RQMURydVIrVnFR?=
 =?utf-8?B?VTBsSXEvQlM4bi8vakowOUtERkN5dnQ1azlNM3hIVFhEUlJCNERDTTA0RVpR?=
 =?utf-8?B?ZnZ3WkFSdUNxeHZIRllnWnVJR1N4WU1oTUZMY3RHYWdjUVNOQlUvMkM3MlE0?=
 =?utf-8?B?c0Fxd3BwNVVsMmR0M25TRXVUaDF6ZWVUNERhR0hzVmNxTnYxeWNpQWZaMzRs?=
 =?utf-8?B?Tkg1OEVENVNRZjRQYmxDazlrcGkvczUrQTBlb0pFVEJGNGt2OGdURVU2Z3FW?=
 =?utf-8?B?V3ZkZHZyM2dFbUFGNW4rNjBJRzJFa2c0S1pxa2pUNGpIdzZrRDRHZmRaTW9U?=
 =?utf-8?B?MUgwTHZrUUc5cVNTWGxmQytoMlEyWnk0UjBxZlBLYW15Nm4ybGVlaVIyVkE3?=
 =?utf-8?B?NER2RjRhSDI0Tkp1Z0N5anM5NlI1SkR6NXBPT2duVDZxb1pyWUEwSUw3eUdP?=
 =?utf-8?B?Y0JjNE5XZ1p4Z1loeUxQbndFaWhXM3plNFZSU3lMZGFEOGpNSFBpQ2NFWVFy?=
 =?utf-8?B?VEFZN1VGc2JydDBxeXovSktuakxSWFlYcllyOWc0RFZvK2NrdENGcjgrU1NE?=
 =?utf-8?B?bXEzOWgvdkpoVVROc3ZIZjRWK01PU2VaRVl4RDk0dWZ5cGgvOFJWbDAvT0FH?=
 =?utf-8?B?QkdmVWZxZGs1WFJ6ZC9EQy9qODJ1MjNBTW5nR0JNbWIwMFQ4S24rVFY4VEZI?=
 =?utf-8?B?YXJubm01MVJQdCt3Q0JWMG90UlBDVTY5OWJiRlpoNjU5cndvOFFkNUM2UFdw?=
 =?utf-8?B?dmlKa0wyK3RORTMvd1l6dHBxMW9FakVObFR5RnVzY0dPVUNhNlYyL0M2eGly?=
 =?utf-8?B?NzY0NmxqN3VudmdWY1R0NTBTT09zL205L3VNeURPOFlZQlFrN3lubWZlOXI1?=
 =?utf-8?B?aDdLV1BxMGQxWktiZVBlVlVTTW5jdkcvME5XakY5Q1ltSHNmdE5BK3N1MXpw?=
 =?utf-8?B?M01zWW9xL3QwMmZlM3lTL3NvQ2JlN2F6TThvTnRHWGFMVmp3Z3pGUHZqK1Nx?=
 =?utf-8?B?eG5OY0JsaTJLTzQ1anF0T1VIVzdiekEveDVXSTZHSFlVdlVqSUY1TDg0N0g2?=
 =?utf-8?B?MU40ckwxaFk5SFVmbnJnTEExbkV6QTVyZXUyR2FuSDVRUC8rTitBOXVKcnNR?=
 =?utf-8?B?S0RLM3lCc0xDWTljU1hzQnd1dGx6WTY4ejliZWZycExuazBMK1FDNGtlRWMx?=
 =?utf-8?B?MEdxMC9FcElqcUpLcC94T043T0tlNHBVR2JjajcrSmZIcmxmd2tpQ1duSVFa?=
 =?utf-8?B?STVHN1lWWVVIQTFJSlk3VCtDOFFxMHZXSUdwT2RFN1llLzFDQ2FKMWJWYnp1?=
 =?utf-8?B?WXdWV3FUcmpmcjF2dVQ0aXVDbFZkSHFEdUFYdWFpaDE2bWdJN1RLUldKeHU4?=
 =?utf-8?B?RzNhTkJTTTZmWHVuNEZXM3BMNStsTGtLODhzeFV4SDFtMFpMSDlCMi8wd0E0?=
 =?utf-8?Q?Cx99l6eYnudd+vi8+MeAM/T4Rry0paMR9xdM6jX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7225f35d-5478-439d-1402-08d9380ce589
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 19:10:29.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vg6Zd1UHdJFdYlHMKdl3vBUssisr2GKdWGB5xLbwrVf552sbqu9/WzhPGyAmMSsCrBAM3/BWnz0LsetRF+Y2bVRH2lgv8Syx7hVtQe2zjtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 25/06/2021 14:22, Jan Beulich wrote:
> We should try to limit the failure reasons after we've started making
> changes.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

