Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3024F94D5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301456.514466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnEM-0003ZY-5m; Fri, 08 Apr 2022 11:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301456.514466; Fri, 08 Apr 2022 11:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnEM-0003XN-2c; Fri, 08 Apr 2022 11:56:46 +0000
Received: by outflank-mailman (input) for mailman id 301456;
 Fri, 08 Apr 2022 11:56:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnEL-0003XH-5L
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:56:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f59b752f-b732-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 13:56:44 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-Z4ysZYpxPD6JRx_743zglw-1; Fri, 08 Apr 2022 13:56:39 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by HE1PR04MB3018.eurprd04.prod.outlook.com (2603:10a6:7:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Fri, 8 Apr
 2022 11:56:37 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 11:56:37 +0000
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
X-Inumbo-ID: f59b752f-b732-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649419003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N61m5+XXIocqQACsDxX3OV9XDtV7Ib8JAZJR8n29Ftk=;
	b=b1vqCX4T8OBG+ojdiHNTrH4JfUmLlWVNKJciVNZZIbOvpJ/dCEonb1i2mxFqhTKAEEHfo4
	I5pweOaMA+xVQ6LafWhkXmSE3/heqsniKM8KNixdJysPzoImC1tjdeUZdLoa4cPz3VFgYP
	ay0O3bkRCbIV7fLMQUJiWCq1KrH9HgE=
X-MC-Unique: Z4ysZYpxPD6JRx_743zglw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h56x1sWUgeyS/K+D0y4ZzGB/eR0V8iHS8sWEUKQaf3B4wGKH63Ni3BXuBHab7PJfEhovW0pGNPvepxZlKtB0x1GRF1SD37ZfFAJuMmVNHDVu++D96d4jOAmJQCWVS1tdlDyuJxONq+0lx2wxnsdkLKnKcZw+gZ3ybF3wVNB3bQSz50WRH6VnJYfkCMY0jhhf5GZIe7CJzct31OPltg15eXV6VQ3YXmm/mZZZRWJ28ccXvmRkde3EtDBM3Fvuwh5x6dI2rlIRlgOdpS2IiTFI+PoggYqZOGBng4E7f21S5TtI7Z8vqVGXy0IKn37LgkG6rR8XQdt0tIdsea+e8Ihvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBgQXbzxEM28/OTZDOhd8GH2S0kUGAVhy9BrHrE0V6M=;
 b=Ab5fi8WzQqRtoxVJBsnTe1Q3NHguNIb22V/zH7fP+jatd7+lBgr4be0F1kYiX5W5mH+rWZwdOJMzOiCPTgxQRS2Gb0dXywlqOGxErO4B3XYYkcQNJx1bwCE2oFs3gBkl+7DMfOPIYaSssXUnCwegozSjR0ZaejEbGdwSe3c65cUQ/WKrGEOtpn16s5Vi98KAuwaWaSZLzseZQgTJ6Y8KECIWCbL0aoCpmmmRVAksHKqI4v/1regrtW1XabGZldY6udBemCHIlIQqQy+WtDkS3JVeCPsZioW0iKvgRygaDHSJ7nj6SS9xh2c4sbOxc26PM/IqxHUdtJpKpNd/0VjyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbd9fcdf-645a-58ae-dd11-1f5c91e283c4@suse.com>
Date: Fri, 8 Apr 2022 13:56:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <22912e60-9cd8-2c68-ebb2-37392bce9436@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22912e60-9cd8-2c68-ebb2-37392bce9436@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ad3210-1927-4932-b717-08da1956d5e7
X-MS-TrafficTypeDiagnostic: HE1PR04MB3018:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB301865897C86EB852EC3BD25B3E99@HE1PR04MB3018.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJlKdoLXpuXik+SytuxC60+lTCD6pdYO3DQadSWCr6ftt4U/HzueILtf2ki46UadqtVsum2Ic1av8qIV6U7w5/i0HKALgk7sIPvKExcCOm2iKRyAiPAwqPAbh62xFC+Wl2aFlwQfe/MwNoXZgLl1saPWXWHiCvB73WXgAn+A5z6E4VsZ4GQkF64jdPXuStJKh/oSe+Mdg5BRp4OUqK8/mMAMaU7n0AAyy49CIMvqwLRQnvdw3mzTKdG+5GFsEExnHsdYS0VN8KpzeDm0fi4f29/O2Z5hRB2aiTyrXzKrN6OOD4BCrptgBUbbpxGO+4VvDyYWiPCcfo8hHYkOBFzEv12a1M8DmVZU2iXxnXL5CoI/H9gzUTynjWZrXTxELdgIoV4LNPGTi+BXnBbx1X6JTy4FxnWSD4AeZU8cgiWevZ05xLAGhVSJpyIqM7PFF16Jj59OAjf0m0Dfd5iZp7LtV2T0ZomNoigWQkHIamHOYAuKkCUZ14KcdyPUA6NyxMfY0aaEmKivubnqzPBAuCqbWzQ0xi8OHpWcL42qN6V4P5JwaB0LMYr40jfn8SWtDw/hVlhjdtP3D+2Wwofc5L0IPjT6drdMcjvEphijmfeDMsfMH0OJvCoxyvqGSxnIjsVpij34TvI8m9oINWmpRM6kvVEnIQb5Xg1W7BNUhmi+PK6Xr+fE0MzOO6WEDdIxsMISEvW5ksfUptVl566PPR7xIV46Q+4r7SCCw/hyf0/sZZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(2906002)(66556008)(316002)(66476007)(508600001)(86362001)(8676002)(66946007)(4326008)(2616005)(6512007)(31686004)(38100700002)(6486002)(5660300002)(186003)(26005)(6506007)(36756003)(53546011)(54906003)(110136005)(107886003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wtdUrbM8HM0s19e33CCMLOLW+t35K2pbFeOBOyLa/fk0MAtEY6thq/W44aU3?=
 =?us-ascii?Q?WW4yhMSUsEeDMVVJDaq6m5hTLMtdXZRhdgLVkcFhWPzWP38y8p4cwjZg6DP7?=
 =?us-ascii?Q?JmR9Forc/63T8lhTP7tiWBNJCGM3icqHrd3q06dbzpp21/wX7az5LLVkhATC?=
 =?us-ascii?Q?Rvc1CysyaYFCPc6/h7ihE9auvnMaXptAQj399Y9hXAQteK4zSiz4OzLDpbSN?=
 =?us-ascii?Q?lfS5G/sJxSDCgwsgUxMl0pgSsmVY9dY54dBEUrgG17K41MGCYaQkgRXxf2g3?=
 =?us-ascii?Q?hYCBf9fLy+osPBi/lbFBdoobEb33tSVDY393E2zdQUmWplACzAQfmdoksmux?=
 =?us-ascii?Q?5guS2z/uIxSrl3zgtO5ILFJujFfvlF1icsERKAg7DV02CgJTtNq6+hzB67Yi?=
 =?us-ascii?Q?PmIGje1xtNVRLrsB9SoW5x3xJwMwvjpYEkZR9kbxmZGkWV2/9hKt6emjPFyO?=
 =?us-ascii?Q?t1QSdaKoEAn6/RxKhDE2a9YU6hKTSFs5Fl2iFPArPQMs/MP4Tp1bTi8lfYlg?=
 =?us-ascii?Q?4pJLWjZaTZw7CV+7JE0Uv9XBxrasyPLEMx36isPa48MoWxvSHb4a6LJLlIql?=
 =?us-ascii?Q?iogum8ahnmJ7ps8IUWxT9Yu23s1wDs96Rj9PMSbVOaI9/XZKilsGmIn2KMF8?=
 =?us-ascii?Q?EP7Pd/K9VkQ+P/t91TMLhZxVZppMgG6APhOBMwyx6wlKUhAmo0clDqOSaAkm?=
 =?us-ascii?Q?1HB2azU+6KV+p1nULgYMVsaZTPusoq5TLgeOv0cj6RKSjgSjjneyJpHJOO3p?=
 =?us-ascii?Q?GPEuWU25icTPkTKyRZUlVG8CkGXqgc9oM0LmsdaGGye1vTsNYx3muMsYVNob?=
 =?us-ascii?Q?belHINsRmdJizqYPlys9cl1SnQyuhIa4mLEdXEXJveFX/STMUaJxmaPk8Xr3?=
 =?us-ascii?Q?oN6J+GTZSEvk0TzrvXgKNNIqO5fUewzC/YyXxuLGkrGfJfV3qniGSjHVYgmD?=
 =?us-ascii?Q?Y64GzNHY7g0P5eHC/idqBIef7rZ5TRKkCerh2Slo5bmHCYMcCXMYNdNNgbtE?=
 =?us-ascii?Q?JiE4XjTPNzZdmiDHPOJio27PoxaYG8+86Kcder8+UpKEQj3Aq/NbqzwLuevu?=
 =?us-ascii?Q?/qUrEfHCD/9DpSXIJCs4J/bUNPkA/v58PSPx75AaP04jHIJeqBjMb7uI8qnd?=
 =?us-ascii?Q?byHu96JrcE5KZh2+Hjb7rwbo59JpudGLxwk+TDfcR04rfmEzsDxLG+2VVwVx?=
 =?us-ascii?Q?TvQCD0sAoKfgCitDx95oKDHaeyqkHX6PpVhYY6HGE5eJtLuUbAm2HwgHK9eE?=
 =?us-ascii?Q?g/SDH5tsFRHKAbjDNll6Z/LUTVisHdFl0fPfyCFdQpGDHWspW8TKPuI8RAY4?=
 =?us-ascii?Q?PldN1Kw/v9RG4j5/TZHGVpbNclqXaTamMlgf4HqHi3c10xCj0t7anfWngiGo?=
 =?us-ascii?Q?aZ9vnRWFCez2Ir6t3PXQZ+qZD2VPAD6YAB11zo0y5OZGULm7lwhZ5hqWpAe2?=
 =?us-ascii?Q?i0VNHvL8wjVS/wnsyu54VWkcWust1+a6/BW9FKhu5tx8csE9HFxSOCrO+1i+?=
 =?us-ascii?Q?FR+3OLioQX9li3GO5/MjFt6UFOwUXTOx937LNu1s8sM318yRgiZglc2M/pse?=
 =?us-ascii?Q?seNuI91lJmSdeig67HSL18KYDjPafMiSrpjNYqPUZtlRBx2n1dnI33vY0LwY?=
 =?us-ascii?Q?RpI/ZFDe3bc8BAgfTSava7V6PGi25CH1+F5bRJDfTQB3zIHL4+Vt1x/sOp4Y?=
 =?us-ascii?Q?k7C8OdNUQS/B6qTwWcoqM3XeaGj9Ug4flPl9BIXGUTQeYe3Lw9lJzqzQEMIC?=
 =?us-ascii?Q?U3qTEaBGvw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ad3210-1927-4932-b717-08da1956d5e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:56:37.4367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBnUQIBs9/Y8XaCEJX06Umdz6Y/Kn7cd8HVW2q55cNcAOwOY/oQVHAKLWHx+pzplgewimB7C4lCQzNgDQFs99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3018

On 08.04.2022 13:26, Andrew Cooper wrote:
> On 08/04/2022 12:08, Julien Grall wrote:
>> Hi,
>>
>> On 08/04/2022 12:01, Roger Pau Monn=C3=A9 wrote:
>>>>> I could add a suitable dom0_max_vcpus parameter to osstest.=C2=A0 Xen=
Server
>>>>> uses 16 for example.
>>>>
>>>> I'm afraid a fixed number won't do, the more that iirc there are
>>>> systems with just a few cores in the pool (and you don't want to
>>>> over-commit by default).
>>>
>>> But this won't over commit, it would just assign dom0 16 vCPUs at
>>> most, if the system has less than 16 vCPUs that's what would be
>>> assigned to dom0.
>>
>> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you
>> will get that number even if there are 8 pCPUs.

Same on x86, afaict.

>> In fact, the documentation of dom0_max_vcpus suggests that the numbers
>> of vCPUs can be more than the number of pCPUs.
>=20
> XenServer uses dom0_max_vcpus=3D1-16 so we dont oversubscribe (even if
> CPUs get turned off in firmware), but top out at 16.
>=20
> It is possible to use this option to create more vcpus, but whether dom0
> decides to do anything with them is up to dom0.=C2=A0 Linux won't go any
> further than it can see CPUs listed in the ACPI tables (and yes, this is
> a host/guest laying violation for PV dom0 where dom0 sees the system
> ACPI tables.)

That has changed not so long ago, Linux will now use all vCPU-s
supplied by Xen. Since I was able to over-size Dom0 with XenoLinux,
I wanted to have the ability also with the upstream version.

Jan


