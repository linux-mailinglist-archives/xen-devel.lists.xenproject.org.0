Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEF75ED0A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568459.887775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqWt-00051j-9s; Mon, 24 Jul 2023 08:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568459.887775; Mon, 24 Jul 2023 08:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqWt-000506-6p; Mon, 24 Jul 2023 08:02:55 +0000
Received: by outflank-mailman (input) for mailman id 568459;
 Mon, 24 Jul 2023 08:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klik=DK=citrix.com=prvs=5629c81f5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qNqWr-0004zh-Uv
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:02:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4e1d55-29f8-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:02:50 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jul 2023 04:02:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 08:02:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:02:40 +0000
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
X-Inumbo-ID: 7b4e1d55-29f8-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690185770;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vAjKwyJ9qD9NHUQU6aAiwWCbiHo6RtO5cIo46n7Sszc=;
  b=WIVnPVoL0ab5NQ0h8sNM1Uf4hU3r5J2rqE4xpTiTJKTMm33ReK3IptEs
   D5dHlvgNnl8C7QOKaxwitLNG8kHxGbxhvBERSm4F/st52kIo2+LXmNVfo
   ijmzUWcxTc9zwEnDSRsWcCF5OH1uiOcM9Z2vlxA6PB1RKaNWJlheNwNSl
   w=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 117624510
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zJ2SyaIeQRq10KooFE+RFZQlxSXFcZb7ZxGr2PjKsXjdYENS0jBUm
 zEYUD+Pa6zZYTT1f4txbYng8RhQ65OBz4dkTQdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZlPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FAnhI2
 tEzLgwiY0rTtf2s6qLjes5z05FLwMnDZOvzu1lG5BSBUbMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VrpTSKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvz2LWTwHqjMG4UPLKT2sY0vVmy+k0aBCMJSGOGsMeGkEHrDrqzL
 GRRoELCt5MaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq10bOZrii7PyQPGkYEaTUZVgsO49Tlo4YbgwrGS5BoF6vdszHuMTT5w
 jTPpi5ugbwW1ZIPz//joQmBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:uQHg065r2Dc+MV3nmAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:EJNKCm4MSWp5j51SM9ssxk0NHO8IWXvh43qKc32nE0x5EI2yVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AddsWQgzYfR1MvejSkdYRnX/24L+aqKuFJHhTrJE?=
 =?us-ascii?q?nh+iNORJvJg+gnQqIWIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,228,1684814400"; 
   d="scan'208";a="117624510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYX9tnyPhyz74zzkqdxCBQpbRwaGEmP2itoAFpfHq3khWR8ik+nOJJD+sVZl1SYvz/GDrGHGMgKbRi/o9RInlJdAlTDj3wtJB+5YSmauNaEWui5VBkjot6BxS6cv2BF8Uz3mFLvKuuEaw9AgYLC+IdS9FWv+xNbeCTQEGnAILiVjG8y3OM/r+MYSYZ7IjnyXFZb89fBOTA5fd0LMOW32iYD84AzebdIKo1z9Bv3RojvmuD/975fzL7+t4gsorL/MjIjtXmeRhLh4l/qrH5mRgVrqiLrS09BJU7L+zblq2291BtfhDwfgWR67oVa6QJzLq0NIn9FPfTwOPZl6gtteOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAzeZy7H44ZHGi2Ny1uWhJ/0m3rdaz7mgNJDD7qMMr8=;
 b=gRU2Lt8RIhIJFRYSzKSDbEVPnlxHQ+kBPy37g320RZcDQxCRAJgTqCdWHoMo2FoZvhkQeU57gY3j9fGFMmd9+LXcY8Etn3HtT8zJk5jVzNapX/RTQ9aQ4R1cP6Mg0mfO1KLbzleaiiiaWGW/Z2C3oGyGax2MN7HeMyrU/XRkbEVFSAIZYV4EFGd2F21h3KrSKTzKbwCNAhYcEq2jsNU0yEcBl/IMR52U2Cb0JLMZdNKOI3T91fxe+OuyfNSYyEquqeLrzODkOSgGVV6v0jmkwgrLaSAyDH7IeE4Wgs0Rb7fdJ7wZPIZa9H8R7wT6vUZqimLCbQ462pr8eucZNg3x6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAzeZy7H44ZHGi2Ny1uWhJ/0m3rdaz7mgNJDD7qMMr8=;
 b=WlckhZf6NgmqNqsFlydYSwSgNvUvrAJKpPbQAPQxHZS8N8GH9gAMAm+QrWhnyuboUOeH3MH5CNzwMgvDO8modKCm7Yb0TQs7QJvnEmeANKjvG0a62dVSz/ijpXt5U22rWXaVHSfrpHv2owTQd0+JmV9dsc8TH46Dl4D/+R0aJpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Jul 2023 10:02:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <ZL4wG49kveKrKysq@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0239.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: f6847f08-4cfb-4829-d742-08db8c1c5a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V3WCgPKAX2B8c/7s22qK2i8Ewzvyio5i4emwU7Lcnbj1mN/2LPfLtuSkunHMBSlzYU6aaCFmMdi16gjaKKfEYcJIY20bSuCSw9EVeDy5WMUVUAi480KKoaqIKw2DGcb+Nj3Y+09MeJl3L403xO5IEXmPfenji2+pQyH7oWBUpecEWiO3Sa3Yhrs8U2HT6mIwyfrqAs1kXLqVVkMb/jwfqCSjWiWaEe5ahSsMTFhQtMOH/YIJx8aZvrXnJii5/PKXODIBvr100MXD1RDLYJ51O9dXte42dhMNx+5iiGVk/Iv2Vsv6WbKTDSAJ2BvrBdwXKfApQCHNK5mOi9JY4uNHakPbyxpb7u2qbOpA888dNW4da0ePxmK/mRqCDeIOhr7bY5HHYzKGbRffzNgPDq87lt8/bq1vJ/fYSEpy3TAwWDv1+nKfJ1KFPx8X5lGMqmiY2LlFC6E4tnvbb+KAIyl3pHSx9HpYIPuafyevN56rqxGLr1ZOGUL0s8uKpikOBNkMROnMaMCvJFc4Tz3iY6G1G3TcRPdxEx+aBvEnho9Q0FR83IB3qGshOuoWgBxGGPH1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(38100700002)(85182001)(83380400001)(8936002)(8676002)(5660300002)(478600001)(6916009)(54906003)(66556008)(66476007)(316002)(4326008)(66946007)(41300700001)(186003)(26005)(6506007)(6512007)(6486002)(9686003)(6666004)(2906002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdZQitiRHBDbDA4QUEwanc2VGFNZ1BDcEZSOFovbnNuRU1pM1VpbFhTR29E?=
 =?utf-8?B?ZkwveHlHTGxXOGsvZ1NwYXBOTlBqanQvaEFCVUt1MzJaaERqTXFOMTk1NEVS?=
 =?utf-8?B?Nmd4YlRZOXZ1bXBxQkhkR2RmSFptL1lTUWl1cDJ2YU5uN3N5NjFRcHFJSUtK?=
 =?utf-8?B?aitNcFBSMWJQMlNCR1FySDVKdmd1VGlkQUllZmJwdUdEaFQ5Z2NhM0JGVHJK?=
 =?utf-8?B?YzlncXlDbmlMcGUybzRJaVdKbkpvbVM2K0pmOU1qRTg0TWxLTzkzZXBWK2Uv?=
 =?utf-8?B?bjRTbkdRemdlcExRWjZuQ3V0R2llZEEwMWE1SU1JYWk3bDJFeHhkb2R6V25T?=
 =?utf-8?B?em9vbnhERXNJcTVEUFNqa3ZkNHBRcEp3cGdUc1hjelRBdVhtL2JtSGsvQ3FO?=
 =?utf-8?B?OWNvMkVNd2NyZEQ1czhXYkluekJIK29Ka2lOdTIwL25WR1VOSFlvMzl1Y0RD?=
 =?utf-8?B?a256MTViNTMwN1pzWkoyVmtlUmNFZlhOM21FUTJrVzJ6SHdFVEhRRWVzVC9v?=
 =?utf-8?B?QjYvRWpqelFzMWFMQWNFbU5FQXd5VUU4VmtESW5acytSNUkxOW1nQkZoRDB5?=
 =?utf-8?B?b1VGRUhKZkZ3YmU3WWcvRXlnN1RuYnFieW04SUxkckw3OFh1OHhwMkNqMFpW?=
 =?utf-8?B?VjJ2L09NQUtlMkJxL2NLdGZPQVp5MkFhTnJkR0JWdm54ZWlCVDNCU0FXUURh?=
 =?utf-8?B?bjhRY2oySmpxTlpwQlNRNUNzK3JsNnplS1RuMmYrQVNCQ2dUZkZTSmcrNGRi?=
 =?utf-8?B?bjNwMWhEY1pjQS9HNExKTUpzWkN2aWsvMy9YV24xUEJ2WjhFRGpibDQvamMw?=
 =?utf-8?B?UGR5WlBCK1VTeGRvUkkxcTdWQ0pKSU5QbktzQzNVTk1pWnkxY3ZzbklwbVdF?=
 =?utf-8?B?RFFoWURib2F3VFdSM2xaMUh4M1JBQnp0VjZQTFRJNG13blZ3dk15TFVMQjZI?=
 =?utf-8?B?dUZOalZ5b3dEQ2g1b1ljWFVhUlh3UzQzZFJuaVRvQTQ2clUzTDk2VlRSLzU5?=
 =?utf-8?B?SXJhd0RxME5SRWg1cmoxMVV2cHBsZFZJWTlzaTVrVHZKSXhLQ3RMZnpEWnIr?=
 =?utf-8?B?VGhvNVArQ3k1SEJ5bXlGNEp6V0JaNndWbjNnWFc3VlRpYlhpUVp5c1RxbDJZ?=
 =?utf-8?B?bFg1dC8zVUVFNjd4ZFVzWmxiQy9rVUNieTZra1lXRitsZldlQlVONGlaeGln?=
 =?utf-8?B?MEV0MHZVYVZKNURrZEgyZmlKQTZ1eUlKM3hKcHhqRUxmeDVYQk43MFdFTnpZ?=
 =?utf-8?B?SHlUeHV2Z2VUM0pEaHRQQzhGcjdCZTJSM0d5c1dGNVpITTNpWm9uWlhnRmpY?=
 =?utf-8?B?dkF4VndsQWxQYmx5cTRZMnFXUHBsRXhZeFd4WTQzYkVid0pidld0dVhPdTJX?=
 =?utf-8?B?SjZTQWttV1FQMktvY2xiUUNScm5nWjN1UXB1cWdZK0RrUS9sK0txQXZGdmt0?=
 =?utf-8?B?RGZwalQrVW9NY3BuMklndkdkREdUOEk1Zys1SzdqNmM0SEtBa2JFNHNqT2ky?=
 =?utf-8?B?Wk1raGFycGtUY09NdFlxV0FQTHpyWHhYN011eXJkdFVaYlk3MlhBNmd3OU52?=
 =?utf-8?B?OUV4RmtWejRLRks4Uk85U05HWXBIbTQ3SStDK2pZbWUwaXJKNXRJVXlQbkpZ?=
 =?utf-8?B?N2c0ZDI1eUZ0QmlvUTNKUWZEVnN2QzhmQ2t0WnNvVi9tTGd6RjdWUmVzTW1V?=
 =?utf-8?B?VVg3YlA1Q2N5bE1KRkFXcGdPTytuc25xSWRXWDI4VDByRUtPQlJpdVB6VXhv?=
 =?utf-8?B?MjZZbHlPazV2aWFXSjlDNW5oNkpBaERCVEI1SzNrZlNkZHhqSnBTR05BdlNZ?=
 =?utf-8?B?d0JKcVJ4RHk5WUl3emZFYzE0WmdmUkJuUVd0UHJIQTh0ZGlHNEhZUEpVb3U2?=
 =?utf-8?B?eFlzSTY3K1hLd1psM0JIRmYwVkdLNW42WmJ0OG92cTdrRFozVVBlQkR2WDgr?=
 =?utf-8?B?SmJ3THNTajBVaWJqQlM2Znh5N2gxL0l6VENqb0lGS1RqeFhoU3FvYnRxUHhh?=
 =?utf-8?B?V1gvZHkybTFzTHJSMnFSeDZjRWhRaE4vdW0rQkV1UWZ0RXkrdXE1VFhwNFJB?=
 =?utf-8?B?MzlvamlTRG9jSmd6K0drZEtMdmdxNFE4R0FjNjVrU292K3crbFp2bEJVSnFF?=
 =?utf-8?Q?BaTC9WWeXNcKIT48mrThtvctX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L2rTdXs+QLN/pPJYSWDaMsTOnAdWZJ95qLDyhQVGauFrQW9sSl0oQLmMoc8+i/Rl97mLPffdl6DavKi1RgEe5mB1M+Lc6h9x1rsMPsXgiNE3AjB0RzjCvviF188WzyMmsXmmMxoxJnwGrQfM9b0mWdzm8EqnD8RGzX2mDFASLdIfgH+jrU9BG1HG48Ex62xEeMTeJ9F02JcCxlum2noIvykdmolKe37xFd8VuRvemVMjbbTghA02FbBgQOjJeK3XibdeB0SdEFWQE1yNo+RjL+bUikBtZZImUzkCgfsKjuD0e5IYhVVkr5eMljBj9lgTXHurs0s/Tq7vwQUbuhsM3NGmX7ejUkBwrzykzoZBW+caVYtbY1kMnJXPFSB/8yC6UQ/tvLJAn1Ps7L6J+T92efZT0anXTDg91zSCNZSppEEAtL5ScwU7eP93f9ZjdLhAP7nNKfoUp7qRPqI+qeXz6Hy+5sQbowl2znVR09zJ+RUdekDBibyzrkSTGtlSDfY03ijTATMMMBifvJYLPKx7d7mjwwX50poZfj96lOZPD77MuRLtwLB6BjzbGoZ17ASS/ki8wKaJBK2bkzRrERs+ZF0ABOzPWi/xgOIRtsKBP2QcG5ZxC5n7bgxOvpR2uAceKnK4Ik+rZrduW1XUkRFntV2ZLlySxFj2+/x7unx6q/vFspOtDuSPTFFSDt7W1zV3jcntQXSX/mXzHy4njv7lxyiKf1dost9cKZ7rtFlVei1P3jnLBmhC5tVRgs0ZYUeLQ6m0nuDfFN+1bgKQOIoRwjpFQGoOvjenu6Zbc7SK4dE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6847f08-4cfb-4829-d742-08db8c1c5a3d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:02:40.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0Ibflz+NFHwuq7AsZKKMRv5RSHdXQnJOr1sNnn7culEKetiHfh6QVMcMU9GGnEEo42R69iDP4ywkK5g36NhtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475

On Thu, Jul 20, 2023 at 12:32:34AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v8:
> - locks moved out of vpci_translate_virtual_device()
> Since v6:
> - add pcidevs locking to vpci_translate_virtual_device
> - update wrt to the new locking scheme
> Since v5:
> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>   case to simplify ifdefery
> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
> - reset output register on failed virtual SBDF translation
> Since v4:
> - indentation fixes
> - constify struct domain
> - updated commit message
> - updates to the new locking scheme (pdev->vpci_lock)
> Since v3:
> - revisit locking
> - move code to vpci.c
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++++++++++--
>  xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
>  xen/include/xen/vpci.h  |  7 ++++++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb5508..66701465af 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -28,10 +28,33 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                            register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge )
> +    {
> +        bool translated;
> +
> +        read_lock(&v->domain->pci_lock);
> +        translated = vpci_translate_virtual_device(v->domain, &sbdf);
> +        read_unlock(&v->domain->pci_lock);
> +
> +        if ( !translated )
> +        {
> +            *r = ~0ul;
> +            return 1;
> +        }
> +    }

I've been thinking about this, is there any reason to not place this
logic inside of vpci_sbdf_from_gpa()?

I'm not sure you need to expose vpci_translate_virtual_device().

Thanks, Roger.

