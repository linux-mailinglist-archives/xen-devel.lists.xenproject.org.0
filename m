Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414622B8D0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 23:43:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyizf-0006eS-6w; Thu, 23 Jul 2020 21:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yR9g=BC=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jyizd-0006eN-7X
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 21:43:09 +0000
X-Inumbo-ID: 7ee901e6-cd2d-11ea-8793-bc764e2007e4
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ee901e6-cd2d-11ea-8793-bc764e2007e4;
 Thu, 23 Jul 2020 21:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1595540587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfIlbif7i41UIQMoFHM7eyg4IilGkqBzIA0815+7Rz0=;
 b=a8g83vEf//z7nDCI8t/EC6Eo5iafvnOnX2TCWA4sxBTehWC2krY4koxeWVcweKPsIVkyLn
 p7jUC+N6YdSr6Dr4nVx7wKyPtK60wsu6yFdd8pRSrTkLtJmV+mRUmmpIg2qGSTZK3hVOs/
 H+OUXfb98bVyHbxX0SopnJsJ8XCel1o=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-xSrivt5CPZmpFJBk9TgLgQ-1; Thu, 23 Jul 2020 23:43:05 +0200
X-MC-Unique: xSrivt5CPZmpFJBk9TgLgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG7ZyJMyc3BKeT2CyNtrX4ewkZ07DGN9RHwaZmKaafGqyVYuR9cL1BJ4z340POaDmiGkrPcILW021dsm1bdjGFeN92xUAfeqiJezQc4d56PM/1jGbdU6azTsiaDfy3V2BapIHRH9z0t2YvQxc8EHw3x9tG5mFPPzn5DgMnHPJPcrJqWOkGTi0M+0TQQ9KyUPmYjhCvhubfDDHNmgbNPaXDnmp1c8WBri8+LjfYCxH0xz1oALKWjluEW+onHEpUEKmn8e9EmEayZcL4vG0pKHsDuuMNx0eUQE5NfxnZiTRocLjxlsQchFSFKWp7rkzow9T+uwsgzsjBcu829Z8y/Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J6tclNH+dh5YvBLbMWPlRydz1HKC8tJpeU5/eni8PI=;
 b=i5G6Otl64BnOD+PdVkUQtJ2zH/+uvPn6nPM/O6Rr+evoSwDts4v6NiarE+Akt+nUEI51HkpPZRgjEahsd6Zhyz8g198bXPl5b6xMFd5ohWMF8t4pxhnacvrrb4Qv1RseEibxvVzK5vrzUWFGXEYE5Cr70JTeizxPla5tspQjVmo43aKCPsaCrLtcC1E7UiR53oYVltmLIBPbpBG6fhsQUpaFX6UaSM2RdstO1yqyr4FHiMBLuuDxyQz9Al5h2GKPxFdoQpbJwclT4pbjgSGyUxZMFshRmj3kBWP3XOwlSv+Vkh9PtFegXtkVcDeeA/dmQIqEG41lxEHrHVJJAreOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: eu.citrix.com; dkim=none (message not signed)
 header.d=none;eu.citrix.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13) by VE1PR04MB6624.eurprd04.prod.outlook.com
 (2603:10a6:803:123::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 21:43:04 +0000
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2]) by VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2%11]) with mapi id 15.20.3216.023; Thu, 23 Jul
 2020 21:43:04 +0000
Subject: Re: [libvirt test] 151910: regressions - FAIL
From: Jim Fehlig <jfehlig@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-151910-mainreport@xen.org>
 <5b44b5dc-bc37-bdaa-47a4-5f5b72392f45@suse.com>
Message-ID: <8aa2f4c4-752c-8339-f34c-18025e3377dc@suse.com>
Date: Thu, 23 Jul 2020 15:42:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <5b44b5dc-bc37-bdaa-47a4-5f5b72392f45@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0101CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::13) To VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.55] (192.225.185.20) by
 AM4PR0101CA0045.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Thu, 23 Jul 2020 21:43:02 +0000
X-Originating-IP: [192.225.185.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad254e1f-6341-4e8f-ab8a-08d82f5160df
X-MS-TrafficTypeDiagnostic: VE1PR04MB6624:
X-Microsoft-Antispam-PRVS: <VE1PR04MB662487DD4FF78AB72DD584A5C6760@VE1PR04MB6624.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGHMTcUOzCPZSA+ZWSqhXzCkxPSum5DyX8vRIZ4hvVlVK3rezQ5UNIEL79Q3yMNRIh1s/lkLEkod6YINvmymB7XQNW0YfM9jtwepaQtJvcs8HGVJH7X5v8C8XF7481a0qaC6OCNd49RTd5GusOcdftuu6wEcv/A0N3VrwSKuyvM1augvSdbF6SI3qygLi5jUZazrZLzRmBB5vvfMXflZgHLe2yUa5HlJpqj17Qat+OB4BI4/M3hyLeKPp85YGJayULAjFJXRzphg96zgqRlhiBGbYDLlTEMo2FtpMZqOjVaj16cj2ssQEhu+2nDQ+A/8g537jz4gfTeK4SIKCW8suzPNY02pwfyUXkG24/gv15Up/1Hv+JSyR55oBsGrAcFPqLJoglYD/BdI+v8L53uvo64gDEA2GbxXrgZVKSTohFgxhvzgobcZKDVKZ18ILa5u1rdZPrMiJfO2VILWrEoOWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2429.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(136003)(366004)(376002)(346002)(6666004)(8936002)(86362001)(6486002)(16526019)(186003)(26005)(31696002)(4326008)(83380400001)(36756003)(52116002)(966005)(2906002)(316002)(8676002)(2616005)(53546011)(31686004)(478600001)(66946007)(66476007)(66556008)(5660300002)(16576012)(956004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: i31gVNzkA5mJ5eWnP7tdsE10a9i9CXC3rskYDArc5qWOF5XcW49nY3BsvK1fStDPDIdsEDDQllCzsA7vMmKe0xYCRraIt5aeYyDUFltuDFDHo2K0+LTBZkB6s/fa+9PS5fHh/zIya7amoTJ3LifQxg0n8pguSUJ6irbgbJ47DzY1dd94jVPbTqIz0elAi7+D0lM7HMa8DeeBwtWe1OkjlQxOTT+mVesc0PRpRuEzIljt5dR0UDEz96ZRv0hgEP121M3FJn8B4wGXzh9EJZ5E4RpJBU7bVVox/c8y6B4H3p3d3T7VQwqUaroBoRSLjAu3rMt8sdubJEx2mUmwCLkmTvd/Ofg1PZ9J/Z4ahkoIsUtQVIBtfgaIxqh4x4QcmV9gXDi30uYsrmXo9bsYg7rCFie2PwHOjquAkBvbVbNX7cc7WkE9Co7g+f4mGPI6/oiw0jnrqb00iJizpvDJ9WQeKNm+npYRFvYEHcHkT8BPssu1oILvda39ThC42eFdO/pl
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad254e1f-6341-4e8f-ab8a-08d82f5160df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 21:43:03.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYdBAAP9B29EbRZko2gF/rJmGMvxLCSTtYLi3JOoFk89UlkdgapSnwlauZNaMFWyLdg+Xz0CqEKbQZTauPnmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6624
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

On 7/15/20 1:53 PM, Jim Fehlig wrote:
> On 7/15/20 9:07 AM, osstest service owner wrote:
>> flight 151910 libvirt real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/151910/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>> =C2=A0 build-amd64-libvirt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6 libvirt-build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 fail REGR. vs. 151777
>> =C2=A0 build-i386-libvirt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 6 libvirt-build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail REGR. vs. 151777
>> =C2=A0 build-arm64-libvirt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6 libvirt-build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 fail REGR. vs. 151777
>> =C2=A0 build-armhf-libvirt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6 libvirt-build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 fail REGR. vs. 151777
>=20
> I see the same configure failure has been encountered since July 11
>=20
> checking for XDR... no
> configure: error: You must install the libtirpc >=3D 0.1.10 pkg-config mo=
dule to=20
> compile libvirt
>=20
> AFAICT there have been no related changes in libvirt (which has required=
=20
> libtirpc for over two years).

Sorry for the mistake. There has been a change in libvirt

https://gitlab.com/libvirt/libvirt/-/commit/d7147b3797380de2d159ce6324536f3=
e1f2d97e3

My reputation for OSSTEST patches is not the greatest, but I took a stab at=
 it=20
regardless :-)

https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01208.html

Regards,
Jim


