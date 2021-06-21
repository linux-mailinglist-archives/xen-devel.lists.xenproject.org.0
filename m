Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8ED3AE3D9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 09:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145360.267450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvE2E-00038S-Nk; Mon, 21 Jun 2021 07:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145360.267450; Mon, 21 Jun 2021 07:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvE2E-00035I-KI; Mon, 21 Jun 2021 07:07:54 +0000
Received: by outflank-mailman (input) for mailman id 145360;
 Mon, 21 Jun 2021 07:07:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvE2C-00035C-Fl
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 07:07:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86c598b7-584e-40a3-9ebc-554d495a378b;
 Mon, 21 Jun 2021 07:07:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-_Roxd3jGMt6-UlfmEg6Jzw-1; Mon, 21 Jun 2021 09:07:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 07:07:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 07:07:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0135.eurprd06.prod.outlook.com (2603:10a6:208:ab::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 07:07:47 +0000
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
X-Inumbo-ID: 86c598b7-584e-40a3-9ebc-554d495a378b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624259270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlYQYlX+s20UqRifCIPhrdNowloNdm5RZNoGOufdMa0=;
	b=XPTnG2qY848wWCByAcbEq33/iyA+T1p71j6boMqzcVPCzvFlyrS0PPCtMpdfoc/8caCC/H
	c4L2mysYq40YLiLA99RQR9njmj2qJ/3X8CO1nX20Q21VAapNxsMsxglEbbj0nfbQelqVMm
	VxbhLVTKB0tpcNZ2YEOy/w3k6seqVJg=
X-MC-Unique: _Roxd3jGMt6-UlfmEg6Jzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5Moh5651TNd4AzdUKRQobJPv/xVlxN/Kxr+TaFEoxVwSwbDQIVlFFX+coAftn+J0njJ37uqikOJwuO/dG7C8Eoke5T5JIJcB54/jjnjxgeOeuhRsJBpp5c7dNZNU7c3sU8rEnNT/oDznQtImPMnVLMMzLZxjV2AYkTfX/+SB4xNmjPFqmmz8ocZyvB7Epb5pDRFzc7/gzdp2R/qbvqhIcFobpJbw8nlhb9DBg46y8BTQ3OHjcqT2i0wwZowLBTp4MQpjTxmodsTlETzQGa+611Pp0JkTtvj8DwexbWxjmz33qGBpzZTDWCAliIuGDRgwO1tv2rj7ifBQibgurOIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlYQYlX+s20UqRifCIPhrdNowloNdm5RZNoGOufdMa0=;
 b=ZNEC/sDThMC8tB0UO9wP7iD1PAr6EuxZdBZv0R+XbZxOSlEFsvp+62Rlud8W7i1YZ/eW0Y6WV0ChkgSkbkrDeqcpd+3kFk23XGEnCb4bcaTohoMaLJpQbZDuUb+iFsT0hl6gCf9itHDHWEB3eVPZtL7xM1WDuLmUc0i/NSLB8ZELJt0PVngw4iVDHP6WvVwlYPNEDrW0k3ENWH5SDM67HKN2plRx22IXs37iJFmxzf40D8q3SdfoS5NmBCoeQ0u+4WX+jEnwbFcJpiK713SHH1C9VaDNRHpBNKt/fp6oIDmumlS1KhDBgjZIstSRoGDO6IdHAS5EfIArjtGwKx7+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1] compiler.h: define CONFIG_GCC_VERSION
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210618164207.5111-1-olaf@aepfle.de>
 <1a3b3a14-61e6-c805-78e4-4b1dbff322f3@citrix.com>
 <20210618185539.491fc904.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbf5883c-2fce-71eb-7496-70a31c150f1d@suse.com>
Date: Mon, 21 Jun 2021 09:07:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618185539.491fc904.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR06CA0135.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfee0244-bbaa-44ba-2e72-08d93483468c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70871858C19EA61460E2AC96B30A9@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsJo7AmZdfMsU1E6buZgE5bMFl5BcBSi1LCMkNwlCcZ/1qc6gQFAiV2QyNhV80H7Vnifc+VtoHN3iCkV5f6Cu8RtjwIJG/Rdzxw1kt2SkPb84h/iW6wgPn2RDzXHNCGw2YquvDam1eYLs+79Xab/WjwkjlagDx2SE4WlIOS15UaLU0yEDe9bUsa363mccii3OVMX0GIdRlxztC/1VULzbUq6mgZa8enF80UE2wuuzib4lU3jK4M/6FpsXilefEZ1IAjdoEDL2o7txtZ9eWV6OqMd3vptBv26SKSJGMqsGUv68tbYUDPH8JflUYWO+bMEWs3BZ+qAD3WXE2CM66ZzYEauEpk9t6FKhmE7D3b0T3+H1N1VQ3J4y9TYO8CNIrPg8kQpM0eHVrnHkZ4AYnmmvCa4aTZYZaHwVjefR3cw0ZjWMK8mn0yplagzNit4luFHtVeJ4IZD+n1Qi+fr6Zfbspn0oFLh+N2Ic7e3A92AsN+pMUCOGYmyNFC3aGeoAQzwVsn0kZNK+ST12b/IaR3XxpMUt6PsZ7/UQX3Bq59SI+GrIX3SHftqxsMQTDfA/cuFmjseWZGEhfjExcQi0iNxkGudYfiG82boAXV2/3NYaO3cN0UaPI94osYG/lBtWv/YmUiatbcS3sftB6O7vUZUbvaCnO0hkHi2IgvGgCgZCi4wGl8z3thQ1d9ASMPVvzxZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(346002)(136003)(396003)(66476007)(66946007)(66556008)(53546011)(4326008)(5660300002)(956004)(31686004)(4744005)(2906002)(2616005)(8676002)(8936002)(16526019)(86362001)(186003)(478600001)(26005)(6486002)(31696002)(16576012)(54906003)(38100700002)(316002)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?/FNNLi7dpRHKVBVLEL4k6c/+A2mLfsdravwQa4M+hhlR8BJi15glUse/?=
 =?Windows-1252?Q?okksqQhPos/9S87BWOsRxx+wuI5N3m8KCtBv/eJkaduGLktEc6wqMH0r?=
 =?Windows-1252?Q?hg1ZAdbFU1PfyG2R8soqq6P4O5WzV3YjGsr17ZBuk7XYZWe10F5LZjBR?=
 =?Windows-1252?Q?cOijR6EsoMeg7bI3TMcxZrreYkTipdf5xpKhjJvP7PnCayn/47jdAljV?=
 =?Windows-1252?Q?+nVf66YeuLCJ/MjaZNmsndSdKGSs5SRezuvL1zNOJMPDFKLBr8A5cwD8?=
 =?Windows-1252?Q?n9TjuThiQmnWOiIWwsVYtWoEbTzMoTpzCWPraTCDYBa/MJQohjGEVF2l?=
 =?Windows-1252?Q?bUlFcaTJVyxG9X5a1UuQ6a8w5Dw361rOp+7g9EbQKDTitPEgrnIZlrP6?=
 =?Windows-1252?Q?C4fnM/wL22N5V4uRXUBK4zI8v4wWlTsVkrUSMDh2pM6RWikuwP0eEPiP?=
 =?Windows-1252?Q?7a7Y+SpBWNoFP/+QmxqGYQ/Gw31Vuyod/yJ/P7jt/jqrAF5XbRnkxz1S?=
 =?Windows-1252?Q?i8nU6XhYufxjE6qlTtDLpSly6Q2LA/LQPLfzj3iBAOCijJfYBFD41qX9?=
 =?Windows-1252?Q?UCpJDWXWH16noOoO3ot9VMY2dlZy10lmF+VrxuMQbor7jr0ho5ao2sMx?=
 =?Windows-1252?Q?5L80a8uqwVfLeftxroZUck1+nBAKrZwkBe9yOnTDc7y79qwYzG9mOPr9?=
 =?Windows-1252?Q?J9h+U1bUpQ97V5ZNfa+kFmYJJXr6BO6JCkdjMHaXQVeWGVURL7IpwuCl?=
 =?Windows-1252?Q?BHNgnbDJZTWo2csskAcl9GkNnktd/WvK+5yUVWDQ3P7FNFeascbsYVz2?=
 =?Windows-1252?Q?jO9RU6HZ6ftAt9j1KsY3yXXa/dY44zxNkN0scofPtmX9O9FGbWZP4M9u?=
 =?Windows-1252?Q?7y/F1jKmzRz0a1++TaXQaQ6c+Rq2JoMU9J55fu5b6295iPWC1wmN9m0s?=
 =?Windows-1252?Q?ic/vugKplwN18TBdKZTSDuh9QSnkTdNcnznGPdON7pH8SMt6CJB2RCFf?=
 =?Windows-1252?Q?mLf+OCAWZHycKSSBS5PC0VorxSIET9A/2nFChqtBN6gK4Yvw1GU9O6wZ?=
 =?Windows-1252?Q?SQRbhZ0tttrh3HIgJqoHWBYZrbPISsPY2UOH1MTXpIIT0vAZIAMeOH7b?=
 =?Windows-1252?Q?VB3l8GJZbvK0uONMTvoUUmXZlEBnXhEzdA2Vkz0nI5pygyxViYPpfb3u?=
 =?Windows-1252?Q?l0b+orLOOoJVvfEsJgh80l83oyftVUa+4ogwzM4Zr5Tv+G7tz/qt3oen?=
 =?Windows-1252?Q?X1D0h1kQMyoZ+5yg/Ax+LDNmjTLC8nYoxDA1yadAHsa27DpFXHYq/12M?=
 =?Windows-1252?Q?25R/uWyPquVzoZqQ2nrDxv9YXFgiS9SuvvHmy6nEgRjMUCRY8sE9a4ak?=
 =?Windows-1252?Q?5TD7Imj7qClJPAzHA2xB5rpTAXNU+UmFRIeEVPhuAW8z7rS5LqdAQkAV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfee0244-bbaa-44ba-2e72-08d93483468c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 07:07:47.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw993Ebe62BIUvGD7kjVtxrgUrE+7D1vPO5ND/vaXovzzkNA20ccII7rY/S/GcfD8jwusmuLZhjypVuiruv4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 18.06.2021 18:55, Olaf Hering wrote:
> Am Fri, 18 Jun 2021 17:46:47 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> 
>> On 18/06/2021 17:42, Olaf Hering wrote:
>>> Fixes commit fa5afbbc20ef3577c5338f9d0b24dad45cef59cd,
>>> due to lack of commit 534519f0514f52007d504e0f2eeb714de7b2468d.
> 
>> Presumably you're intending this for Xen 4.13 and older?
> 
> 722f59d38c710a940ab05e542a83020eb5546dea without the required changes exists only in staging-4.13 at this point.

But please could you help readers by making this obvious without
needing to check what branch(es) said commit is part of, e.g. by
tagging the subject with [PATCH for-4.13] or some such?

Jan


