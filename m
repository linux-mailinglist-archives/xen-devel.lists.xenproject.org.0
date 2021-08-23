Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964773F459C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 09:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170188.310855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI43Z-0006y3-Tv; Mon, 23 Aug 2021 07:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170188.310855; Mon, 23 Aug 2021 07:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI43Z-0006vm-QZ; Mon, 23 Aug 2021 07:07:41 +0000
Received: by outflank-mailman (input) for mailman id 170188;
 Mon, 23 Aug 2021 07:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mI43X-0006vg-Dw
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 07:07:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1952f2de-3adf-48d4-a02f-7d5f76eb19f1;
 Mon, 23 Aug 2021 07:07:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-O0FTAxZFPF-ItwC9JklhuQ-1; Mon, 23 Aug 2021 09:07:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 07:07:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 07:07:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 07:07:32 +0000
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
X-Inumbo-ID: 1952f2de-3adf-48d4-a02f-7d5f76eb19f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629702456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWcn8uZ8Zdep6qSbX+p9vR+nJm/6fhDokv9ZHP88qwI=;
	b=dvkCdfZCwXP7AdTNwUkjppQPZcjxbqYZ1bEp9JgB5vNHqXsAEY8uBRtTcvu5D2Tj3Vc7Ol
	Bmh6kybvhup5oi65d3wTG1Mee5l+DU0u6Pq+I+CvUVXJEiJoGmKL6xgj74w8H3Hw1soyfm
	ymvfFsSM5Mjy5AYCrk6t5WxdF76JQ18=
X-MC-Unique: O0FTAxZFPF-ItwC9JklhuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7d/Me0xmBf7W3AnfLorAoV/El6kWMno2rsVKcNJgygpvpbkD9tdSduqpNiXDCV9eWbZC/foVPoccAbBIPO3VUX5n6g7v4/KKYWCsskkOMFZODaFUVjhfTuOs2U1lmOkkZ9AtxZDaLOrfc78/TunR1klTBshMDSRhmvyZkY0Ij6zyAVWmlaUt7SQSvJNujadAmjjv91OJpKvaxyHbw9EqIolafWXGA3tCHtb7IGs3wlfke20a0ecDi2ZOnnzF98jPybJyIRTalYv8FmMiMklkCQ/78O4bI3AIL4JekT6LI550iBdjfzeZ4/wgrO5GofbgoZwwkV/mI+rNzfjolqolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWcn8uZ8Zdep6qSbX+p9vR+nJm/6fhDokv9ZHP88qwI=;
 b=ctYqXzQzAZCbYpCCgs2QwAPYFSKqHbYN+cg0uYleRyCIdry1ua7Wo6h1dDOL4lGe6LQ/pL7Ri2z24Ms+1Git+CNWDUhiM7wH9+ww+zRrn6/OKsqs6bjTK++f+brnPBBq9Oxenn7XBz9WFA7Dex5g+s6PLKUfG5vUt6hssGTRLagVbXtZ/N9fwOQkQRlUoNQ1PsHfFxbiMmMXAQbqToKIvBiklAjXD1ZPeF+iMz/PZ/bYik5JrLAKY7eQ8ItGWjHghiAfinI1VVPD76Hn0MLtZwIe6TQguB9sCfuromdiQ1AZHYxnnnEzT3Px+a5hN6jII6edxB2ddLeIJfO6zDwTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-4.12-testing bisection] complete
 test-amd64-i386-xl-qemuu-ovmf-amd64
To: Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com>
Date: Mon, 23 Aug 2021 09:07:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa7eaeff-77ba-4bb8-488f-08d96604ad63
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB702439EA8E983C6A93D5918EB3C49@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o0BrtnccNYbKiHzyYswbw1kpItPKIKI7BgAeQ9PduEJh0DcvTXlaCCnLHevRerTqJVlqHvDC5GAvJDgax2w0+9k+cT9rdC1Ls8Rj7DHLuFktU40JSX8AHWMDEqADLVVbSAgnyOfqhKICtvybAHjZH69ORrLvSYw9dEqW+hBWGQKffDvhKhvZEp1UeNyDKR+f3Yl+5d8HJcGOWd9nnKiAZvG9n3r5mXL8sVIpLs9aNLKZFFjVtHzkTHN5XxCvfk8tuSZPT/f5sIfDhFGe+wCyb/iSpUBVDdgwG4luQRO4y1DteQjsopY6hG/V6cHTgnv2kV+/CN/wxrYu0ZPROFrd9jsUpB7hOJ2TDWO3gjs+ZEdMRTzAOrtaJWDsfmAykMbkrX+NAKHBwT5WNaNtgm4hpEUCPz7yZPrGyX1zkcDBLDi7YKtnQggqKgURQp/eJqeQb+mheETupG22nbuoWhP/bo07bDK4v7J/s6uVMtW7H+knkYAQSj5D3lwNLNdb9xYoVrUhRwkBj3cGGNmkHf/M/yIj40xDflq9eHToC2PWpx4NmgfLDwhdjxl91ESraXIJp65d994Usd2cs4+VMwS98oNWEqbpkQiriGVQc/Jy39Q+VaXA92vMlRd4TKBqsp2tkzOCyuaFnpx2TvoKzaO2nbxUeEkieG0WEatpxNXfDn6cJ5zf6rBFKpEfk6NZFtpukNpaTTTX3MjYypJaEJ4x5zYg8iHeYWwI+Lhamu+470xiBhozh6vAPYFp25jpie92RP4v/t0K4OT4qdYXmfjWhz3JYaTuLaIG1Bcfdlu1LFmHaKoSowrbGgx6XYDsz0hz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(366004)(396003)(346002)(376002)(31696002)(36756003)(26005)(2616005)(6486002)(956004)(83380400001)(186003)(31686004)(38100700002)(16576012)(8676002)(5660300002)(4326008)(8936002)(86362001)(53546011)(66946007)(110136005)(66556008)(66476007)(316002)(478600001)(966005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBwSFVUaU1JTXEyRzIzVVh5QTI3czQ3Um5QSnNHbXg2dllIWXJzeDBIU2lO?=
 =?utf-8?B?OThDR3dqOHUrdi9iWC83M3BCRWhXK0RFRGpncUNxQmpBRzk1MHZGSHA4VDJz?=
 =?utf-8?B?OStROXpSRWdDTVdzS3JaNU9QT2Vwbm5PODNlcE12QlBESjdCdnBMQk9BcUx5?=
 =?utf-8?B?djc5L2M5YUlhTlZTcXo3MUt0UVJKVEFuS3FVT2pTZjBpOXgxV1dsVzBLUmFJ?=
 =?utf-8?B?empsWm9DVjZ6MUE0djVuZUJpakMwK21SMXhtcldidWgwRmk3SFByMk9zR3JL?=
 =?utf-8?B?bzRBYkxhODByMWhiRllRcFloS2pYQnNHVnVQN29DbVdieC9xdGpSN2wxM1pS?=
 =?utf-8?B?WHRoSmtWS2lDM1B2UVJ0MWR2SzJsUWpqeDdpRGpVaUFrT0QxaE5MLzBxMTk5?=
 =?utf-8?B?TGNyVE9PcXVsTjUvQ0VCeGh5cCtVOS8xZTBSc3M5aTlySGhwTW5Rb01YS2lH?=
 =?utf-8?B?VUpxU2VSYmpwZDlZdTMwMVhPYVpxZzNiZEZicnpBMmx0T2NDVmc2Q0Nock9n?=
 =?utf-8?B?bEZwWmMvY0JtR2ZLR24xbHRXQjJYVmJva2dhZUgrWWNlYkJubTAvSjVQb09v?=
 =?utf-8?B?QzB3LzdJOFdRbnh3R2MyNEJ6a0ZnOFhjQVhkS0l5ekJBeHE0aGZaQVVnS2Jw?=
 =?utf-8?B?clhYOTRqMEpPbjBPeXVUdHJwTElRcDdJVDBxOGpSeTEreHpLL1R6a1oxc2l3?=
 =?utf-8?B?OHUySE15SzczOStPSDNEZlpPMndiR0hlbG1iekxHZjlhYitpL2FuVndaV0x2?=
 =?utf-8?B?MEJ1L292K1FLZWlqTlp6K05QWTl3WVRpSmthMWZCZWhkcFNxVm5MbU8zemM2?=
 =?utf-8?B?N3NlVXJORFhxMWM1ZnhjaDV4djRudlJTZnhGR2kzdlVJMVJyd2dZdVl3Y3VQ?=
 =?utf-8?B?OUJubEdKbG95Y24rak5vaDFLb1FCQTVDK1lVWkpmZk5ucmhVTUtLb1czTVZX?=
 =?utf-8?B?K2ZVL3QvclRScXEvNm9zVjEwRlY0MDJtcks3TTdNRStmeXhxM3Q4aGdud3pa?=
 =?utf-8?B?RDFpbzZMbkhPUmwvRG9BTWFlVFdleGZBQ2s2MmJlVE1uVktvLzZ2S3BWWjhI?=
 =?utf-8?B?RSs4WUY2eTFKdUpBR3pMSGpSR1ZyVFc2UjY2YXJzNHY1b0dWOS9ydHE5Ymk5?=
 =?utf-8?B?Z2N3N2hRUjlSVFVwNFlPQ3NaZTBwS2YrN3dsVlozblhSZEVENWo2Yy9MWGFk?=
 =?utf-8?B?TC9tZGRicU00TjNqSStERkxxWTI2Y3hkYXNHTSsraC9xMTdmdFpDYW9VQ3Fm?=
 =?utf-8?B?Z2JnaHUzREZXeWtXSFNxemxoVmluMHE3Zkt4Ty9INFZtOE9DZE1XcGdjZ2pi?=
 =?utf-8?B?Rm93Sy9EN0JQNk12WFZHUEd6ckRaQXNhejQ2NkxZSW1UZmNGMW02UHE3MFFN?=
 =?utf-8?B?ajc3Y1pCZXRNZDFmSm82MEJja2U1V0sxVzVNelRuT0dITW9BNTJkMzRqQUJT?=
 =?utf-8?B?bld6clQyNkxhMkFEdCtUL3F3WThzWkJBTHhUQUJYUzhCRTVDQ1Y0UWhOZk1N?=
 =?utf-8?B?eUQ2SEFoNlAzUzVXZ0tTVnJjYUFQbkMwc2xsOTdQRFlQZWFtWG1adGFJWHFJ?=
 =?utf-8?B?WGY4ZHpxNTBFS0VHdFlBRHg2bGZhVUd3WEd3RVpXTGwzQzBSdHFWblFRWTJD?=
 =?utf-8?B?cDRxNk5JeUQzU0tVUFFZeW1GOU95V0dvRzN4N2FCd0dhdkxJYXN6TUwyTFVQ?=
 =?utf-8?B?Ym9tRVYxRUp0S1E2a2V6YXV0c0tiZHM3NmRveWR0Q1ZZM00xRGpQQ3hUUG5I?=
 =?utf-8?Q?5QGGQ3A4w+xS091njC09c/C+bdCn40xfLAkSKOp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7eaeff-77ba-4bb8-488f-08d96604ad63
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 07:07:32.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+WhpKG1+ANPZU0u66CgXx5T03VEBgoFGqFzm38fBoilZJTDUZDXO1NeXlCTnTZ4fBDGZbEA/Iz4I1eE9jiICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 23.08.2021 02:40, osstest service owner wrote:
> branch xen-4.12-testing
> xenbranch xen-4.12-testing
> job test-amd64-i386-xl-qemuu-ovmf-amd64
> testid debian-hvm-install
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
>   Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
>   Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164383/
> 
> 
>   commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
>   Author: Laszlo Ersek <lersek@redhat.com>
>   Date:   Wed May 26 22:14:24 2021 +0200
>   
>       OvmfPkg/PlatformPei: remove Xen support

Uniformly from 4.15 through to 4.12 (the latter of which shouldn't have
been affected by whatever has been pulled in in the first place, given
it's a security-only branch, but with the OVMF commit to use being
hardcoded in ./Config.mk I don't really understand how a possible
change to the OVMF tree could have affected this version) tests are
now failing, everywhere with the above bisection result. Given that we
want to get out releases from the 4.15 and 4.13 branches right after
the batch of XSAs going public on Wednesday, something needs to be
done about this pretty soon.

Does osstest override ./Config.mk's choice? Albeit I guess even if it
does that's not outright wrong, and instead it would be bad if the
older versions wouldn't work anymore with an updated OVMF.

Thank you for looking into this,
Jan


