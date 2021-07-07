Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AF3BE8B0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152222.281240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17U9-00072t-5s; Wed, 07 Jul 2021 13:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152222.281240; Wed, 07 Jul 2021 13:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17U9-000705-2G; Wed, 07 Jul 2021 13:21:05 +0000
Received: by outflank-mailman (input) for mailman id 152222;
 Wed, 07 Jul 2021 13:21:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m17U7-0006zz-Go
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:21:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cb2e84a-df26-11eb-84f9-12813bfff9fa;
 Wed, 07 Jul 2021 13:21:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-UtMYB5owMvi47TJKQsbj-A-1; Wed, 07 Jul 2021 15:21:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 13:20:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 13:20:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0124.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 13:20:58 +0000
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
X-Inumbo-ID: 2cb2e84a-df26-11eb-84f9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625664061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NDe5x1HcQiz+IGxk4+avoPQjjVmWJ8XokHKV21BPs/E=;
	b=kTtpXsEE50spCpJFvbh+Y2/0CfYzrkEPOeFTLvOyOIp2++ijBUU9vP2Ow+CerAGFF44rEq
	klEllfev6jO9jP9cxr5yz67wG7FjTCI0q7weevVQpn+hMZoXMDHeENs14ZAwIKInr84L4R
	X2Rhw/zsPpPnBOZn16twGzwfTSlBd2w=
X-MC-Unique: UtMYB5owMvi47TJKQsbj-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6SnQLYKQY2GhCGgikpMGuptmpJN1+b0oSIcRH4ge7wKyiqCtESpwu5FZSlKIvGCs4ul51U09flPhFnK0XGUuaA0yh6krUR1wwgzHxAzxauSfwC8WX14AcQ1OtFnezsGkwhJw7Twi1xQVbXzagm22vBCPQH9OdRSQnzciN8bH4kEqQZSIopkwcl7ka/jJ6/xcPq9Mt5YrXUb2FnL4zT/hw4OyaBtj64pABySJByLpmlLUfu68m9Lk+anpdzkiauSwdPE8G3cyda6IYf1BecrCmffn+rluRCpU3/7DuC1o3mDZDSYqfhY2dsqGVnhcX1SgfJ9gRwc+x0HPnrbycnIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDe5x1HcQiz+IGxk4+avoPQjjVmWJ8XokHKV21BPs/E=;
 b=DY38SMgEHYDO+OeIfmo+CxTGSx8TEw87SSlGSUSN8H415CKyXVjOc7sMloJU5RWwLDJCtGWzwmWTDGhJAyzl08LbTgrbFu+up5UPmt6MMYt7yExyUv+Hz9abGAlqKhXS1nw4L0ME9nBRWLfve/JN2mdmllboXzmxF8Z1hJPDHjCFMpBQvQE+qY22zZ0EpSSpgrODyaiogjRH5jQumnVN029gRQDk2gH+e144vHhY26S/xyLBL+kidWbUml7giShTyyTggITS3skPo2q8GSeW7ZVLgPhmDj+WPIv0+/VOBIJIMFsjvugqtViMvBnoljX4BBWu08/0MgDRHxxyWC2vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] IOMMU: adjustments after ""IOMMU: make DMA containment of
 quarantined devices optional""
Message-ID: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
Date: Wed, 7 Jul 2021 15:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0124.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3544201c-5a67-4a46-9af2-08d9414a0f69
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71521EA0D076118DE6519224B31A9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oam9SHvAplajrDawyLHR7XqqtUNfGS3vlCBOFb0HGOwzStYxwGNMLJoYQnLxdQzsu2ouxg25/W0MLP9knUgjVUqMWfjDetZjgMT1o2YCXePtbYdSnTT94h5nMMM03dRyQ91KltLrhPKn+O2Z60mYyR2ycaA77Jy+I/2nHCnUoSiv0w2H4NopRfgTkYm62mpzGXVs2dlwQISaE7q+9W7cFtua69ZOnswJR2FT/OSxucJcLUrTDvCBVyzV8rLhhGZF7wDFsDtpIUsTDiqmrvDdfMNvCc7OXb/0hhKDxL8e5znjRpNdfqeKFGgpYjkameAUllAlOzjh3zmwZKH1Op+iIFYcOp7j/UShN98zovIIkzYY3wOtH44CGEJl7zPQfxjXRna/YLcdqIG0qaAjsOaGFhyjyYPq8bFGMr1SPkqGeJuZ1sadOqVUAutNaHD/TUGv0QqXFzXRgJ90Aw64Pj49Uclr9pww21PwGL4saXgQ0UtV58meBqedWhkrTmKzvzNxKAQHwjXCaXUREP9oU5dUUNJeUNBVwUaGHrR34ByQhR31FHpAgd5d1+9Tc5DKuEJHDUm2QFyOlLZWRmOWnBF2AkV861l2V5eL4Yl70CPdaxyXnXqzUkpVnIF+9ZfE4QWeengbvRQgpmWBjkAuGOHZc0eZzeabHzgSeztmVzZOgUx3gw64CqEyCsklFUtd37fJ5nRPsXwDaP3YWTMrWQGSyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(376002)(136003)(346002)(54906003)(83380400001)(4326008)(6486002)(2906002)(8676002)(5660300002)(558084003)(8936002)(2616005)(31696002)(86362001)(478600001)(956004)(31686004)(6916009)(38100700002)(66946007)(66476007)(36756003)(66556008)(26005)(16576012)(316002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2xpSUJoRGVlTGt1TVZldDllRnVMWC8wWitBeXg4cUVaNU1ka1JFZjBpL2gx?=
 =?utf-8?B?YVZZUlZHTUR2UWNsU1FlSDEyalcyeFlXdForN3JhV3NWVEFzMG9lWHp2d1RB?=
 =?utf-8?B?QzJ4QWlCL1BMaCt5YkF2Q3hzZnBWNGR3Z2VWUG1UczRKRzVXMmdYVWExdGR1?=
 =?utf-8?B?K2V5WGg1bk9LdlByeE9aWWtCVTh6QkcyMFQvM0N2dVBMLzQwL2VnaVhpUFpZ?=
 =?utf-8?B?SDkrQmtkSUh4MGxjUXJwOFQxRjhDZTNNclNzbXJnT3JqTnE0aWFiMkt1WjFs?=
 =?utf-8?B?RnVxRkoxSnpJRlJ4cHZERUpqU3FuQksrQUVlbURnU0U3R2wvaWo3T2FySG5l?=
 =?utf-8?B?ODF1dkVlbnVrbmp2SEh6cTVKVlNWdW5ENVZOTy9JRk5RdW5QMEZ4ajVjNWZl?=
 =?utf-8?B?UENlK2tRZncwVHRMVnRPaklwYTRUdTgxYVkyMGtwZjZKUjJiQllWcmJnNWM4?=
 =?utf-8?B?cEhlQW5TY3ZJWFIzanJZVWQ4VWorMGM1RHkwazV2QjdmT0hvUHo5U3RmSEtl?=
 =?utf-8?B?Qllkalg0T2JwYjRtTlBWaFdJMUpVR3VvMFp5TTloZjFFbmRFWlV3MFpwanJ4?=
 =?utf-8?B?M2FRS2dlU1g1cC85WHdmN3hPbHZVOWxDZjF2RTBZUDgzTzhqUFBFd2pJRHFD?=
 =?utf-8?B?MFZENERLV1JlZG5IWkVtWCtNTTZvVzg0em5sdXpUOTdGekdlYVFVY25wc3Jq?=
 =?utf-8?B?TkNEQUVJdTMwWStkUTk3Ulhmd2hMVXppczRuTUp1YWZBbnNEUjdkTUZvZ0dW?=
 =?utf-8?B?dmlRN3FONDEvc0FEQjBEa3dQdk93TDVGVHVobkdOWW1obTF6UTMxMUkwN3dI?=
 =?utf-8?B?V3I1VXEzZzJleDRjZTBUWTNzaFAyb2c4RzJ2N2JMeE9ZM3JKSFE4QkpaLzNV?=
 =?utf-8?B?Vkp0SGgvaWdyaWc5SG9UaDVObzBmOHB3UndETTdaS2xmVWZCcGhFY0h0N1Jv?=
 =?utf-8?B?UlJXQXMzVkdITDJBNTlNazBrNjE4am1qRzRSeWZSYVFJZHRlYUVUd0pQeDYz?=
 =?utf-8?B?SWJ0L0NCV29vVFR2d0ZnMlp6VFpLL3hGZUNRblFhRTByRlBBMVp1WGlLL1Zi?=
 =?utf-8?B?ZVJ2dEk1Z0I0emZlWklzQ2hnSHphZDlkZ0gvakJSYUFjZUozMDc3U3BVMGdB?=
 =?utf-8?B?UzJOdnFweVVNTVBNUHRxeVczNDhubXQwbGd3YWlDckJJZktEemlmNEc2V3hv?=
 =?utf-8?B?aDhSdDY1TzYyYWRiVGJvRXVCVllYTjRXOFNtRmFacDk2WWVtWmdYMkxWSEdE?=
 =?utf-8?B?SjdnbnVmVm50SWNDQkJwZmpDci9WQVp0VjhLTUVOSEhmdG5FNXhMZlk4K2Rz?=
 =?utf-8?B?bFV1ZlZZaVE5OEJqZlE1V2E4bFJzMTRyTHVOb0U3V1lURkdlcTZmNGJ3YzZ4?=
 =?utf-8?B?a01CeVJIdzVIQkhVL1VjM1ZHVTB6ZzFWQUhuZDhTZXJNOStXVElUTGoyZmMv?=
 =?utf-8?B?N3BTWWFSK2dqSUtYTzJSdVJaZ0hQRmV5Nmx1STF1OUtWM09va2dOektsZVRJ?=
 =?utf-8?B?M2IvRkdIM2s4NUVrWkhORmZPVUxybUlyZzFNOURWUm5CakhJb3E0K29XUTky?=
 =?utf-8?B?SGhmZU95K3lOT0QwK013anFRRUtHR0JMTUtLK0hLeFBSY2pVai9NMThUV0RC?=
 =?utf-8?B?SUtFcXRvNHM4eXBxaDZZeU1UWmV1Z3UxaS8zc0lVbGhLcHBPeS90UVBraHI2?=
 =?utf-8?B?WW90RUN6bkFuK2k5Mk44alozYURTd20zcCtPMUtzN1hmaThQK2ZqU2lzK3dx?=
 =?utf-8?Q?lOzFfCXLZi29GcET4GZ9CiXPePHcDrCtD9EDw/D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3544201c-5a67-4a46-9af2-08d9414a0f69
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:20:59.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ncm09Dzzt/Y8+5GN0M2Gk+THjhwJ5hpmiM9ZdBEFlHGSXg8uEMzgwwqxqPoRuryKaKDIbUVprucU2AAyOYhVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

Andrew has spotted a bug, and I've noticed that a changelog entry
might be a good idea.

1: IOMMU: correct parsing of "quarantine=scratch-page"
2: CHANGELOG: record changed PCI device quarantining default

Jan


