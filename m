Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70623240795
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 16:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k58lI-0007NT-8k; Mon, 10 Aug 2020 14:26:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FbbU=BU=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1k58lH-0007NO-6f
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 14:26:51 +0000
X-Inumbo-ID: 894d7c5b-5cb4-435c-9564-82f6262768ae
Received: from de-smtp-delivery-102.mimecast.com (unknown [62.140.7.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 894d7c5b-5cb4-435c-9564-82f6262768ae;
 Mon, 10 Aug 2020 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1597069608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fJ4rP5Ppql3dWjpVe3p5qyhArwp/LiyABy+nrrg6m0=;
 b=jTYkfiHUgSEPh1L67GGJv9/Jm7N2MyPm689VFPPQNQJkehKT50yG7Yuw9uXsS4eWJKB2tA
 exJdamRW6ytmxDTWn5ngqUK5ZUK7c/MIK9lV6gwrlFJmYKQHKD8JaR13JYSg//gwAGdjXH
 OtQpurbmJ97B/3oYDS6OvDYf/qowm8Y=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-iaAFU8WEOiqgw3RyfeveNQ-1; Mon, 10 Aug 2020 16:26:47 +0200
X-MC-Unique: iaAFU8WEOiqgw3RyfeveNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NymGibz4QCVCwGipvfXXECpbJE7LekMTovUqT8YCt31pX/ve+69LfTMKM/Yq2fmxvHUUicVsCmMMlTWbFZVOLzVkjNQTQjsPh9cgPBcNZ6Lc6LFcvJI0D7h/w0xKtXEpRyXtPziTkPB+jgcg53kHivHNaKxfOZ1cPppUB6gDflA6VC0xGXzy2asTOglVdGsesuOnvVTaqRl4ygV/ad7enzQiNbx00QJ79ziWeGj0CJM/yIYGRsh0fDRRn5A9s1zMBnuy+JWuuC8VEBRymtENrxH2WTwYfDzvISVdeqalsw5fwK0Gnrv+DqD5S85xnUjaaQRUc32HO0tUdSA6NYvAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fJ4rP5Ppql3dWjpVe3p5qyhArwp/LiyABy+nrrg6m0=;
 b=oTswLGIBblQCxp8zYdz3JqQpqaUnBorJyJU5KNzGq5PwAnaTwveb8Ycewp6Z/p6fZSCHQKZp/BHKzpoG1aQqiDGgo924GIqsQH0F1yo7FxT7JK6ilzZYkquGUoXo0M5shpGxUgKDqczIOr+/ETx0We2RpH+DQDKdgcfl4JYfxwolx+AZ1igx9QSJIU0sQXWLJu2iWAybZGJn275kvcUYkFsgVUtCA+iwgnahx1RDZiwl7q34rOzSflFkrOY8WtoilFeKHsas0D6YxSKNNX11saaqV1ZNDeJk0OjKn0nn17k/hGYK6HE0WluLBbAlIvn+/xalsefE/I70KG1G4yxXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13) by VI1PR0402MB3824.eurprd04.prod.outlook.com
 (2603:10a6:803:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 14:26:44 +0000
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2]) by VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2%11]) with mapi id 15.20.3261.024; Mon, 10 Aug
 2020 14:26:44 +0000
Subject: Re: [PATCH] OSSTEST: Install libtirpc-dev for libvirt builds
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200723213134.11044-1-jfehlig@suse.com>
 <24369.7617.103361.244607@mariner.uk.xensource.com>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <91fa6814-858d-be20-4a33-849e37d9bbca@suse.com>
Date: Mon, 10 Aug 2020 08:26:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <24369.7617.103361.244607@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0143.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::48) To VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.55] (192.150.153.236) by
 AM0PR06CA0143.eurprd06.prod.outlook.com (2603:10a6:208:ab::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.17 via Frontend Transport; Mon, 10 Aug 2020 14:26:43 +0000
X-Originating-IP: [192.150.153.236]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46413480-e80a-4b09-b9e0-08d83d39681e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3824832510FC9BDF34CB7880C6440@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSpCbJGXVAn0UyYCM4JrvbxO94EEDSSEUqGGLfQtCBQqEQ+Xmms6P+WcmCU7Hu+rIg3CVrp2v+bz5YKjnPuDYylC6DGEQhHUZIOSvlP0goac5INtoBmIq7HUgUIggWnQPSC4G5OOuBuDSpQ8pfqZ05zBr8+BPTMllAcVPUcv1EpzpDjrZu1uXNxBPBUOBEI76r1M2I0SIyNtHjmtQPxWS8XjD0n5gDIOHqRKKKjE1wdVFfUXl9eeSE/w/ZkG03AOsMihVBiU3Tt+50CcUW/CyqFTyK6xz57Y1LATFeEqhg+mAjxijmuqABPHd0UhbPpCjuVlncMGtB3rs+TdJmO8trKBa5wfxrndEbcuJDSyCloT3RPXicdkCnI9/m+Ueb7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2429.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(956004)(36756003)(83380400001)(66556008)(66476007)(186003)(16526019)(26005)(6486002)(66946007)(4326008)(6666004)(53546011)(31696002)(31686004)(316002)(52116002)(2616005)(2906002)(8676002)(6916009)(16576012)(478600001)(5660300002)(86362001)(4744005)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +u3dThyVm5HAzCwZsJKzMnCja4KgiPkaS2i/Lmpt/BBvWShVBPaT8JWK2/lme9PixReB7ZaQ689u+Ayl/YZZT/el/i3nVp8ojEoeetJjKGArh4YKt/ZfFMPZJVusIJGg9ih2g9zy0mEhKzGazq0Z11Bn2U2zMSTnf2qPW7F15Dhq9MGznijES7sB0VWfJ73z4Y5dkETf3ntKLurMBsz43vCWN2Dc7WY2UG7xIMevMSY/wE99xX5nMIa/467WHLfyahB0xNp4wSCaFQ6heeAJZjD+0S9xg0FD6GoSG4T6ZDLNG7QYGf+3vnBGGUCQpOSJhlFhQukoPkg5m/k+ES2x4Gn9J6LrZxKFtqtOZerp1zSRVIx/b8hBE+lzdWY+/u8vBXMPvclMcyAQrIAULNGgoknlLV1nuY1+ygXYfpESOr7DTQmH1LldEqjrJe0ezp3sgTBP/qBZt5eNGNW+f3fBIfx2t9zF0ghB+oX4wI27Ba0b+6Accb1wQ147srE6cZkhxO/gg5G8AwHZan3mtFexWuSgR8/mtbgTGZdTgPrtzNf9TuTaGItoq95RZPhlbw3LkV5OHqMNcNNf9XASCBTXAsO1HqbNeYk3eRW2crt8J0EesaWgASNccydxEjLAfqietU62Rd3ZjT0DgQtVWToGug==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46413480-e80a-4b09-b9e0-08d83d39681e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 14:26:44.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYA8UEDmPuzJS/F01wwIZSJxmGyjubLBa0Ce3Tskk4EyAX/ZUFFy3fN+wBFN3oXzN78/May/k+Hmk7Fq7m1HPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 8/10/20 4:13 AM, Ian Jackson wrote:
> Jim Fehlig writes ("[PATCH] OSSTEST: Install libtirpc-dev for libvirt builds"):
>> The check for XDR support was changed in libvirt commit d7147b3797
>> to use libtirpc pkg-config instead of complicated AC_CHECK_LIB,
>> AC_COMPILE_IFELSE, et. al. logic. The libvirt OSSTEST has been
>> failing since this change hit libvirt.git master. Fix it by adding
>> libtirpc-dev to the list of 'extra_packages' installed for libvirt
>> builds.
>>
>> Signed-off-by: Jim Fehlig <jfehlig@suse.com>
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Thanks!  I will push this to osstest pretest shortly.

Thanks Ian! Perhaps you've noticed libvirt has now moved to the meson build 
system. My weak perl skills have discouraged me from investigating ways to 
accommodate that.

Regards,
Jim


