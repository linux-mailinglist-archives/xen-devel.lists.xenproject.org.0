Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19A221595
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 21:54:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvnTu-0005LA-N6; Wed, 15 Jul 2020 19:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vvos=A2=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jvnTt-0005L5-46
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 19:54:17 +0000
X-Inumbo-ID: f625c1a4-c6d4-11ea-9448-12813bfff9fa
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f625c1a4-c6d4-11ea-9448-12813bfff9fa;
 Wed, 15 Jul 2020 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1594842855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SS4qKv3xtpptNMOJJuE/l8WzUkx3uT8CN/b8Ziu1s0=;
 b=XB+niildCyrEoZbSuYK+aTZ/F0gJhD673eRTv6SqBZmHMf6ohbqW2Yib46gV5XcY9CG0Cv
 rJUaB97DwaBFHppk7x5aS1yZhYDtPDtucqrrySh5G9QJHJNu6GGV0SMXMndhlLWfP913W7
 WXZRwwONPiskE19Recg5y9To7agzhHQ=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-Vp181LPJOi-QXHZg94-o0A-1; Wed, 15 Jul 2020 21:54:13 +0200
X-MC-Unique: Vp181LPJOi-QXHZg94-o0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXKDuLcMHXFxYtQewIld7TUFICnoGbutWdjSc5I6NOYQW+ubIviubS8uxD2/9w0BqHedVMS40tx/OfCy9uh6O6Vof8ZKUpBwYLRRC4He1RPrdrY1UJu+Oc09cPbn8Oq71TlPqd4mNPx15dPcRG2KijPpUHbtYdFpm3xy+seg+RMaoVanQH5yNyKvy6WI85fhGLOvLralEzzo2BidksE2a7PnlEyA6NDK9yehY0Br+nISrKCi2sIegzlhS8xJjnR7YCN6dXmuHoi6kHEbGyWud/ZSp+pbf5jcGyWNaaZ0kwnPMmb9e6Jff1A803ZkbXX/6BLnCSPbbmE8E4RgbLZHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SS4qKv3xtpptNMOJJuE/l8WzUkx3uT8CN/b8Ziu1s0=;
 b=NHStHwat2ZTO6Wos2m7BRbJrWP9ItkmqyTX3Zt1Mr3pPNF3dcJTMfq/QJ3js0eRJVuHa7SYp8O/1jJTVnw7LS8116xl2rcDkdifbcB5LdMoudJ3n424JoE7U6R8zom2Xf6JFyZlkofB1tXILXpHwJbxOvc7mmDnUdJHXjzuf0MZb+OEm0t89qDA0OTUhgTYn9+stAziIeyby8BAzJZ9nhuXIBZEjeWuUJrjLDjMOfEktNb0lEN1NGOBxS86UYsXsaiXri4Wsk6Tk4jCBmAKDgcmMNgEYiEoy8DPsa4OqXVTCTX4U4U747MeMU9c4NT5LjAApzCVLaqIYguYid4io7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: eu.citrix.com; dkim=none (message not signed)
 header.d=none;eu.citrix.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13) by VI1PR04MB5534.eurprd04.prod.outlook.com
 (2603:10a6:803:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 19:54:05 +0000
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2]) by VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2%11]) with mapi id 15.20.3195.018; Wed, 15 Jul
 2020 19:54:05 +0000
Subject: Re: [libvirt test] 151910: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-151910-mainreport@xen.org>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <5b44b5dc-bc37-bdaa-47a4-5f5b72392f45@suse.com>
Date: Wed, 15 Jul 2020 13:53:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <osstest-151910-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0105.eurprd05.prod.outlook.com
 (2603:10a6:207:1::31) To VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.55] (192.225.185.214) by
 AM3PR05CA0105.eurprd05.prod.outlook.com (2603:10a6:207:1::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Wed, 15 Jul 2020 19:54:03 +0000
X-Originating-IP: [192.225.185.214]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9932b12-eb32-4076-9af6-08d828f8d41c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5534:
X-Microsoft-Antispam-PRVS: <VI1PR04MB553442FD5D8500DAE6561233C67E0@VI1PR04MB5534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDUsdl9kcUYrV/cSgHdj3qOe5MypBXtvWKwPP59eMJ+NO5i0dBdJ1T23PsRBOVc7I/OhB0WLSn2pSpOOX0nX1A3DUCHHuvOWULKHFNdRAmIjlWEPsXxDOEsfnNEhztFFtjfK8shJyCzGzgNzyEOigyjwKQNgnMRrC3+A1e4YNXUOq33k8XsnI7xnA4G3/IoQYKiBWptXZAXNCc6z31rpqcBIU83TpZ9866jkU1FNAs0yS68nMAzSY6X0KitMj/qAJjUJPu+MbRX//gU08a9436ibVB3xyNCAguskUOoSGWPTwLfLojPsfrLMA3jldQ9VY4H7cVFALTWDtxry4kQRKY0FkCi9DrmdW9L/AW/EbZULO+VtIWpKDGPjqKn808KEcJ7c+DfKeO+iVNAbCSFnridwwHGtvpy1tW6gTE/OaVFXDtCg0+59b4DFrEIEpCAkbFom51jkGxnydaFnEVtH5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2429.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(376002)(136003)(39860400002)(346002)(8676002)(26005)(83380400001)(36756003)(8936002)(66476007)(31686004)(4744005)(16576012)(86362001)(966005)(66556008)(66946007)(186003)(31696002)(5660300002)(16526019)(316002)(2906002)(478600001)(6486002)(956004)(2616005)(53546011)(52116002)(4326008)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kbVPRUB2Dq5+wYlEKmreZZXefrD+c0Bd1Jf8Q6A1W6M+0Z+RyLplKgZA62Opm4vHGALiIWu2aLmr6Anyn0MA57U2C3gKlNrexS/jUjb+bAYwQNhZud9yWnvXoa0nR5HiLPPqqvU0Io5lGMnXpkHcNdCyUTw06XvEhCOISlTQfOziFomErBt6jKoppFdwnoS2nNWvIcQZ1hXawKSRkgYVGEeQ642iAABJjOs11Yfo9NxEQpLhEvMW1XnpbwO/Hqn5Dg+aEn67HxQ2XUyIvG2ymaRrS0NU9BlCkJmlDXl9unTFkxsAs4Ixej/6MD8mKiXQVurKWSN/p+Lo7WtLWkfKsHTN9/XUfcl/LO/MwS1yTDT+n/NO1xa+an1SWRnbdqAL9iGeQieyJ8RN+WIZc4SlFYhN+O9aNfiFWBEBBGiAuAGJRYHlFig3UIXvTuJ6R96uA/l+Q7nCEJt5hq7RaRx/j4XObuLWFg5APC4tMdXcwQ4=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9932b12-eb32-4076-9af6-08d828f8d41c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 19:54:05.0259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqKpf+IJoBzglg6EgfJQYCFeVylAfA0C1PEhV14OfhUEusEcaq51Lm6iG7yNphlF5FdePDZEkGbcZaVFsTtuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5534
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/15/20 9:07 AM, osstest service owner wrote:
> flight 151910 libvirt real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/151910/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 151777
>   build-i386-libvirt            6 libvirt-build            fail REGR. vs. 151777
>   build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 151777
>   build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 151777

I see the same configure failure has been encountered since July 11

checking for XDR... no
configure: error: You must install the libtirpc >= 0.1.10 pkg-config module to 
compile libvirt

AFAICT there have been no related changes in libvirt (which has required 
libtirpc for over two years). Has this package changed in debian, or no longer 
part of a base build config?

Regards,
Jim


