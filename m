Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89444B0711
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 08:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269613.463697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI3t8-0006n6-QC; Thu, 10 Feb 2022 07:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269613.463697; Thu, 10 Feb 2022 07:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI3t8-0006kC-N4; Thu, 10 Feb 2022 07:29:10 +0000
Received: by outflank-mailman (input) for mailman id 269613;
 Thu, 10 Feb 2022 07:29:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nI3t7-0006k6-Le
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 07:29:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 220715f4-8a43-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 08:29:08 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-mbAvmjiiPOOtNYV-VZgIXw-1; Thu, 10 Feb 2022 08:29:06 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM6PR04MB5157.eurprd04.prod.outlook.com (2603:10a6:20b:a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 07:29:04 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 07:29:04 +0000
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
X-Inumbo-ID: 220715f4-8a43-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644478147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=735dO+IVphNuxewaC5SXcwM89VI6D2wWgL4lGv3ogfU=;
	b=b9v8WnkvATB1v0T/mHDgxNGP8O2edSFU07ZDLM6ZXw/H4vnMW6cMu4UDyaF73dAmP0QGXs
	rZKXZwtKEbkV370tJRgCw1ZzW04NAzO5FB/gVHzYjYk8QRBujs4W9bBSzyO/UlFEk6s8mh
	drBVOL0LsOUyXHXWgVDazP2FSXX5kDE=
X-MC-Unique: mbAvmjiiPOOtNYV-VZgIXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/T53s0K2hNvcWhKM0toZ/e326V628HyIjA+ikpLnEa18KPkkZ4a15aI58OhUVlFM14oqJdif3YwDODDEl1nRhYjRrToyL2950lLdoRrTMH/A0r/4AVp/nb++jsEhjPvCBiQy+trQjuMjnQ5iDzPx242WyHi2YU5WdBJigk2HPm58WD+IYAy+KlLM/GeSrZZKHMhdpUjDTLT1PzVCPLc0OhBDx68HOl4xK6l3+Y72oKUuqSWKZ3Qq364lnOK35D7uBQhO5gy9E14ud3jts5jGqv5iJHzw3Q0eOEmZIIdIptBpQFhZNte3gCQhpdCAn2wc3LWUYDmEq5gpddtzxVRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=735dO+IVphNuxewaC5SXcwM89VI6D2wWgL4lGv3ogfU=;
 b=T4HJ4+C7cpKt8H44aToiOpzq7/yB1e7eeLfgRLFXfLfJw1zJaxf/51C18z1lYmGq3FLhQS0bZQwKD3u70q0NelqDtG4fY87swwzbMPmAhukmfLKu+Z7mxC+Cf/zVB3nY2w0tqdhIW/aQP2Pbx8s5Knd5nDX8smzWyTnMqTO5f2IEEPLy9vhr+5lmWD2AhQxTvmapROcB7Tb7FDomBBppQG6CuoXV1AOpHlT166joXGn1hvF/wBOf8YCGqRI+pu9m0pcTcATDj29NKHnfBPgSkRX86Mq48f7sffzXoExBpzteMg26PhIbqCTYZU4x0rehMqu5TBa3F8OLWv9y5NQCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97b2156c-d523-90d4-58b2-d18781490233@suse.com>
Date: Thu, 10 Feb 2022 08:29:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: PCI passthrough support for PVH mode
Content-Language: en-US
To: tosher 1 <akm2tosher@yahoo.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xadimgnik@gmail.com" <xadimgnik@gmail.com>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com>
 <709142925.628001.1644127197288@mail.yahoo.com>
 <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
 <303292590.682317.1644477758255@mail.yahoo.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <303292590.682317.1644477758255@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0108.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::49) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6571efbe-09c6-4b2f-a5fb-08d9ec6703bc
X-MS-TrafficTypeDiagnostic: AM6PR04MB5157:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB51572F040D8E6BF92EA1E070B32F9@AM6PR04MB5157.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3sm1e9ICldT7/2Mt65HFpBdGNdgAuHugtCU56EKIuPtJVAxXowssAo2B2roQI5Baoe4pSp/48NsbrugijMeNVkrXwM41XlAKqcoM5J2wJ3obku6BQqBkqlcpO5L9M3+17jtRMHjl+EWGvzYOjNQ1G2OWmBnlkaeYpJWiu56LDqv4gIf3rsA4Jd12mW96TogdLwBeeQTzDCz1aw/J8QN63pA0Tve9sEsJFI7rIB5ZkCMQsBzUkibEBbmqdlD92AL1Th6eMCuION4DEZIBm+zdbZnQYrjqLIqsj2JAp7GbnlrC99vjHh+MKutFUskK/y9wBLsCIY0ZKzqvD2AFi1+nOLbUAzTs7nq4Ck2ijY424qspkC00wDRR66jRJf9p2zAa+5CdHxOOvMzaqxGTLCk5mlKRZxmeyRLVFzM/f0c2A7eWQAdcFS8/IC1Kqb7XdadpdKoI+yQuO2k6TY5JivS4TuhjDHUD1Xp8HU+ltEd72qrPeWVfg9ubIVckcTxAUP/vV5XI6ctTbF+Ibhv6iRDQ1/31TeWmupaj058FL5IHgbW8lkpFfHebdytd9woYV47QzrKw7oYE6LS2OmGExJK5t1bV9RhJhI2k07E60MnZHddMCGJ4MxYRN/C4vjkOuGmpV40sq/Ud9NkN5qY6mh+ilYkvNSxn6WnZqUMXwciOgtg0nIu+pYGmaL2jcZjIUsHNiuW0bxaKyVhhesJyk4BQdWSn1VH09HPfM9AnYJ5VKxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(4744005)(2616005)(6506007)(53546011)(6512007)(5660300002)(316002)(508600001)(6916009)(54906003)(2906002)(36756003)(6486002)(66476007)(66556008)(38100700002)(4326008)(8676002)(8936002)(26005)(66946007)(186003)(31686004)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2lXYXR1aHVlMG1heVpuV1RsMVJFc0tEQWhDVXVvUHhPY1E2R01aU013SEpT?=
 =?utf-8?B?eWJ2dTRLcXlvOHR3RkZaL0wzaHV6TTM1RFViYjFta1YyZzUrZzREeWdwTGN1?=
 =?utf-8?B?VW1NZnFJdlVHb2d1Q3BORjVJWUg1eDRzeG5UaDlKY01hYk5ONGdLZVllT3dG?=
 =?utf-8?B?bXozRDUyU1prSEZTNGMxOGxHOTM5dlhCSVZLYzdIS0d6eWlBV0ZSTUlocFh2?=
 =?utf-8?B?Z244STBhQ1lPay9OaEJ5NExtV1F5eHRPa3IrRVVrUmVMcGZrSXFscmZXcC82?=
 =?utf-8?B?cERMa2hJMXJDbjBnMGlXY3Yzb3FEZkRPNndBMGk4UENuZDJRU1RKTkhFOEU5?=
 =?utf-8?B?bmZpYU5EZmZGWkw2VGF0SEIrdEQwcWtmTlEwakFwLzlXb0FzYTd0OXhjT3hr?=
 =?utf-8?B?d2MxUDlIK3hLY1NUOWJCRGNXazQ4ajU3WFg1Z1RtYmppSUdNTUtVbGIvMkxQ?=
 =?utf-8?B?d1liM3JXRlNjOThrOGh4c25zZFVWY3dWcTVCWVJWdjJHL1ZDZkNFTWswQkRC?=
 =?utf-8?B?T0ZpRFNnMmdNTXZjVWRSVWdpaEtFdDNIRWZoRWZVNHN1TWJGSDluRDBOTVBW?=
 =?utf-8?B?TUNKRDlFQ1hzaG51c1dUUzV3YVBuMWszNGMwUUR5L2ZuZXJkRGlrNGduWWNn?=
 =?utf-8?B?RGc3K3FENkFvVVQxb0crOVhmbGJSN3h0bnJNcVRCaGhiVytXNUljcDFhQThj?=
 =?utf-8?B?QWREV0hYa0tlWHM3ZkJFUlUzdWpCWWhFdXNBeE1YaUVNZUVNUlhSMTgvU3NS?=
 =?utf-8?B?RVNjYno4KzA1UStqRitYZXVDalpYMDVOS054bDZtaTlMd1dRME1YQ3hoMDVE?=
 =?utf-8?B?Y2RNL0lPS1VOcEJhYlJ0WTFPbjk0SVRqZ0Z2TVE4MGkyeGI5ZjU1TzdGaXV5?=
 =?utf-8?B?dmRFYnRzbzRKUHBPd2MxcUcvSWxmQWRIUE1lUGE1VjJYTFRxQ3ptSkFIRVFT?=
 =?utf-8?B?ZWoxVlVvNWxiQVdqRmlydHFRbXgzMVEzd2VOcE9JWEErT1hyU25GWklINHcv?=
 =?utf-8?B?UlVnMDZwWTJmZXJQRzA3b1FxRzVhY3o3RVZTUmhtNGNzN2oyRUV3Q1o2NEsy?=
 =?utf-8?B?RGVkVWJKLzJ0ZHRKL0NxMDBpMmI0RjdLcDJpNWkvNm1FTWRSOGtYTHZIQ3d3?=
 =?utf-8?B?TUJJR3VLV2sxbVhUQnRkQ3FDM1dQNk5aL0FBZUV5S2ZvbnJUcDNoUU1NS0VZ?=
 =?utf-8?B?TzJWVE5oWWN3T0JoVnE4aGRoSEZlSDYvK1pJZmhpVGYwL3ByeHh0UldHamlk?=
 =?utf-8?B?eDYwRkR2Z0RPNVpvTVZuR2FMK0djOUMwRkE3KzVBMGtaSDllcDVFRzZDNGtx?=
 =?utf-8?B?UGpic3lJRjZhbDN1b2pyR0FqVGhsa2xWMWlhTDdFeEJ1blQ5UjhFWGVRb1FK?=
 =?utf-8?B?endkNTJCR1ZuM1ZDa1E1M0lqNGROcXZQZmQyZ2laOXRVTW1DMzU3U1M5bkpk?=
 =?utf-8?B?S2lndklwNHprVk5zUlZBR0xhT2k0c2pObDRXRnFMeVIwcEVjVUJiMEpWMDZU?=
 =?utf-8?B?b2NJOTdoV3hwZzMvdUplM2I0eFZ4WXdzU1B2L2RnWXBKS1I3TDAvTVdZSm55?=
 =?utf-8?B?YUNEeW12UStyTEo5cW4wUGpaa3NmWXAxaDlac1lXL1NmaTZ0NTdmY3BYaDZ5?=
 =?utf-8?B?MWhBM1F4aEJFUFA4TlRWQ29YSXJFWTM5cHF2NTd6SmRka1Y4aFh5TDVmS3Z2?=
 =?utf-8?B?RE1aMmI1b0M3TnpHWTAxK1RxTWIxTk52N243bitaWTNxeS9SQlhEVnZMS3pO?=
 =?utf-8?B?Qm1ZYW10K05zb3dTdHk5c3VESEg1aDcyeEpsVFhIK1ZsZHc1M1pmUHFKQlNt?=
 =?utf-8?B?U1VQWURucHdCT1d3TjBLUmJLS1BjZXpBNXpUR3gzYkNTamNMRlZ2SjBHbXdJ?=
 =?utf-8?B?YStSZ0FyV0dzc3hUeXd4OTZaTEdoMmZpVmwvSWJlQXJubzBYZHRXam50UTRI?=
 =?utf-8?B?NmZkLzhTS2w3aDNpRTdibTg2Q2J6N0E0d1R2ZTRBYnJDbzdZTDFTOGxkR1Bp?=
 =?utf-8?B?c0RwMkZlZmNONUo3VW9yL1Vha2hyOGFnMFpkdjBKcTVvNU5yY1luWmhiV0lD?=
 =?utf-8?B?aktvS043aXBBVGU3cUtoY215MkFJanVCMXRjcnBWc2xwRWQybm5TeFJQdTR6?=
 =?utf-8?B?MUF3UGJWMldNVDdkNTl5TlFzd0J4NVI1K1hjbzdSZmxFYTgxTlp0MWNZaE5G?=
 =?utf-8?Q?4ZD+wO492pev5EPI9EzkJM8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6571efbe-09c6-4b2f-a5fb-08d9ec6703bc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 07:29:04.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOGbrIm7MiZMkTa4AZnTNfnoL1YQtizDIASHpvDb/W3B459RByXK+sNMjmFW6L+AzYVusqVQLDFPnzeQwtGnYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5157

On 10.02.2022 08:22, tosher 1 wrote:
> I am wondering if PCI passthrough is at least available in Arm for other virtualization modes like PV, HVM, or PVHVM. For example, is it possible for someone to attach a PCI device to a guest domain on an Arm machine and use that domain as a driver domain, like we can do with the Xen on x86?

Which "other virtualization modes" are you aware of on Arm? (PVHVM is not
really a "mode" anyway, but more like a badly named marketing thing.)

Jan


