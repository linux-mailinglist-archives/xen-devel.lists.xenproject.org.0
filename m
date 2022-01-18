Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4443492803
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258538.445337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pAA-0008QB-TD; Tue, 18 Jan 2022 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258538.445337; Tue, 18 Jan 2022 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pAA-0008OK-Q0; Tue, 18 Jan 2022 14:08:42 +0000
Received: by outflank-mailman (input) for mailman id 258538;
 Tue, 18 Jan 2022 14:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9pA9-0008OC-Et
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:08:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231f6607-7868-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:08:40 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-8p7R7Bx4N-uEpqs2g30hrQ-1; Tue, 18 Jan 2022 15:08:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4173.eurprd04.prod.outlook.com (2603:10a6:803:47::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 14:08:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:08:30 +0000
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
X-Inumbo-ID: 231f6607-7868-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642514920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48Ri3L3TRZ1rPxR1j3QqBLtMcgZcG3PY360F+0mOFIg=;
	b=gBVvjlSk7XaXCCbfwiYItkM5Q9tgs6fr+F2m6TItzJ+0QE//XnjhOUo4clYkpoNjhx9w+C
	fj6GRsm8TlVUh+fZqXxyCkpbqr39h3lRZOfEK91UHLclaY/96UD4uoHThmG3Nsdf0548uk
	aep9aZCclGKwYBUOmOT1OZoRTzQ8Mg4=
X-MC-Unique: 8p7R7Bx4N-uEpqs2g30hrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1gIoHZBwgI0fee1aQ48pLqNuboI3JR7AG1IPGlVA6ye+oOmM1ivMb6ZzfoDaOCorIKDc4CzvSIcgudY0/ZdK6MfWwLICEPAyqC2TTlaEuIN4AAidU8db3oNF0j+lN9jMlIfnCzStKCQ9XsvM4m6hWfQUqFVN3LP12IG1KzCsErg9kNLTvz++QAJ135xbi0mK7GwJLFG/nBGgkzEWUeXXgo7tvINz4itnZK66TiMtl5PaHPLG+Wungy7ZRiy1Z9hM1i3z/kkqaVHR3Zwh6wOOZG7wPVDdr/yUJNEf7D8pbL3drH634rBypjf+TQp5CVH8KlkuQXW2NKuLwzOZ1jv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSwYRH9xFRaYOZorirwZXSm6rDeA43745477ocxH9Jk=;
 b=bt+QjyWOmGa2q73iQ8PO4UnfTfqPUK3mdpG58jZ5EedDVlh/DkWKzgIt/cwwHCmHfEZjE79taUSOQvpBkqeJYEYJOQnhioInEcoqHlsPrzorTCkHEOWp9mAjvsZp/Znr5QPDlMsnvriuPbUE+mqG+6rleXj3e4cV34JXDZrbPt+InVO1nbrv6qGa7LzIYR3YthoQsNtRXZNCY1OSehJYo+L/Zk83QXW7FbYq4nVtB2mpSk4agtBj+W0Ev96Geb+oTzvoDcTGcgr/2s0MmuHISfpLNzT3kIsuY3T/iNzcXyy+SToHCrcmW7DLoq/sLJKeqWWg+Nd1lrWuXiwd60lgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65dafbcc-d627-623b-ed78-83c3bfa25e00@suse.com>
Date: Tue, 18 Jan 2022 15:08:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] x86/mwait-idle: update ICX C6 data
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <fbe74c84-c9f9-dc00-a614-151634747f33@suse.com>
 <YeaUdIHubGgtVpV2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeaUdIHubGgtVpV2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0218.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb66f19-6594-4fdb-e65c-08d9da8c0115
X-MS-TrafficTypeDiagnostic: VI1PR04MB4173:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41735EACB787F3F36815B6FEB3589@VI1PR04MB4173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3f9wzflvjIzlCf7HdZESzXXJwWixis+OM9Bs2n0uljaqbQ3mTnRFKne7iTBQIlrgpjV4rGuFp98ZzQGeUDxeeKpupX3K+WMP7slVxuIeCDm3KF6cxv9/fdzZpaQO/SasMEb/JzByMUU9OZCjYpC7gQLn+clMv9HfSGC1N97M16aVjUMlJVWAnzBfZOm1wBKRvFOvsSXyBUjlm2oHovILs1cNgu8sEa1soF1XtZjwMuFwEMwjkrtbhH+bDC+jE+7yGtwSw+EioDPGR3tN+ZIoAi3lt4A3Zyq6ZB+ueFix5osS09kB1EUQN7RQfewR6pZ3ddg/awlB5byS6uq3tR3oiKuK8BzzWG2ykQ2IX8leqVJ6bu7idtN9/OHQvU8+G8lddRu/H9aRC3o/VqKUVcF3+amL8VzoUnSCqg5NfYV8rVhVKjSBynMwUapo5+grlmIIJbq/6w20GhA4VSDh5fw/q7CYsIGJ88Q3vEh4OBzBIbwPVg598J97ieVjBhfsDbQYCS8VTlcngOWZAzECBew6FkLyMMpYJ+5BlIPmxb2do9gDSuneeWDMDVfHIRQ2nZh1WrLULnC7TbYLj3C4KrXNY8uJ6yRrOwUMwx6O0RR4oLxchPBb1NoltSN7pj3NV+P95RMpiobW9P25wDjThKe3KsTY3d1bR9qJFGefd8bH34WEw2pbKa1Yhj1aHnTMo0MlmaHi8cmvPElmtBA9c+6cGITOvIL+sBFExuYVUD2G9OiX2CDrBOkQ+sfhb9cErZb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6486002)(316002)(54906003)(26005)(53546011)(2616005)(66946007)(66556008)(508600001)(36756003)(66476007)(6916009)(6506007)(86362001)(5660300002)(6512007)(4326008)(8676002)(38100700002)(8936002)(2906002)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rgJs0rMZzTsRHET2xstx0An5jrYwaDBKhsEmMooeo5CSGz6+gTCbSBEb96f/?=
 =?us-ascii?Q?C7fqnVU2C4M4q9+OHnt1lklPwepLpicjT6IZ26EdNq2zY4TPr1lKb8yugJn9?=
 =?us-ascii?Q?x4WGtsp+/5M1MR+/ZRWJ6RXR0u2kVqOBa3YVVRhMm81t+Ojx+aFN7bdkWfVG?=
 =?us-ascii?Q?UaZJuFjvZmqA1DYvurlV8om/L+SW6wxpjaCMH+VrgVTlWTWVmDcOm2XSkWY+?=
 =?us-ascii?Q?lx1ReqbGeYs3rrqx1zAZDUSzy72kxWwcFjkjIpgR+bdjH4eazPE5rWRG/PAC?=
 =?us-ascii?Q?ez4s/YhcJLSqU6/JLicoo07kIsUovzNhYC90wv+m01vSAUQHZkW1Ucw0O+sb?=
 =?us-ascii?Q?/qrgjntMKHQvpbBavLpwYTTi+p6j/DukVulihkWhN8PaAWUKmrRUW98w3VkX?=
 =?us-ascii?Q?2xc+TCuLUUOQmQTSDCJGtMQD9IKVhYh1wKwXYpsH1H/diOWRU6IWBbm+BzSS?=
 =?us-ascii?Q?3+3XURSaeN9MdpnP2uHbUc6vnugRXzCdmeK1RASKJEP6XS42NFzK3HhbdCcM?=
 =?us-ascii?Q?Pqq2pJyi3TeyvDgsFdjBoehRFnXXUBBf2KHcDpTJku1MIQ/8ayAfwAgUkuv/?=
 =?us-ascii?Q?IhuBRE0PJ7dZKdYlkUlMXOI2NI7quFvLQfc401ytYy3Dhmo0ZJSjJLjT4ysC?=
 =?us-ascii?Q?ujhodkpe01ahcuhTELExgBFhqBOiOD0HfrFVo2zG1cQ6oUR0wKvqAH8oHRpg?=
 =?us-ascii?Q?7VgLiX/fSppq96zYI9iMcKo/9WX5/KR1FGetO4VpMRKzQ+FLE+/AsqIINWdY?=
 =?us-ascii?Q?8ZeH66d9LC5hxjNwKV6v20NjNk4kR7oM/YL7/N2IPigid4BQ23kyAgE8xT8R?=
 =?us-ascii?Q?hQqB3cLe/THE9rLpnbMiHVNs8VXMMteGyY6PG2cxz06groc0bDDYyRggr/rj?=
 =?us-ascii?Q?rP43wv5MOw0k0iHsMwAHmnvG5/S4VtDJAcIEZiKFt+1c+Qid7GpvMqQYqPqO?=
 =?us-ascii?Q?D5tBCu//NIE57E530s/38Zb1UvFehJgyyWWDsLd5yH0Lr+bUu79sygBITENS?=
 =?us-ascii?Q?XmcunKALRpmBVCUrSwkb/akD1SAdnfvM8Y+DiCYwt5c2kW53zzoGRLInqRKW?=
 =?us-ascii?Q?bCgZ5bTE2BVgKZOGS9talgN5Ajwn97xugJhfA0YHPFxQjEW/ASAt2AnMkbQe?=
 =?us-ascii?Q?U6vLWSMNycMTVzijRCo1o5B2HWyrTwitfWixbCnma3lUSxj/gjjBhtf8uwMA?=
 =?us-ascii?Q?PgcyW8YNkQtoh7wSjzPCvxD2ANMFRY0yIifmo3Q82mZzzESqEMn6LbmrkYvi?=
 =?us-ascii?Q?Ng6ZAveZgQtjmf+ZwRvWbIeiuPwx1yjK/xoV+7eQxMDd6ABKGgp31R0O9C0x?=
 =?us-ascii?Q?nuu5WHDUf+4wLQjR0X6joQxNx+ANk1MsKtnjzTKmbHzxI/BWSKUBbPnxaTD5?=
 =?us-ascii?Q?E2RHPzQIUniTcPE/5ZBn8yadhwZFjyDucz41ai3HSu0I/wH60Q1/W7rbtX72?=
 =?us-ascii?Q?I4cg715WG1g2nUaW12IKtulk1HycIL+g2GndiT8hAda6KYioajvVcVAMHfrW?=
 =?us-ascii?Q?cp35iBA9Xs2ODsOeDNYJiO1pcO7FBcJKCpDcu82S/++S1NVdfhBjvi0K2b3f?=
 =?us-ascii?Q?CpcGf4fMeOAoTRQVrWOwTDOOB+adlG7+2aUbBfWoenZmy9rw663n/NDropsn?=
 =?us-ascii?Q?d0jmcGrP4oOTNuP67HJOwgU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb66f19-6594-4fdb-e65c-08d9da8c0115
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:08:29.9484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suWjtdit1s5HG7fXdmeFyAWOFCKdS+gwDNGlDsLNz9gBpltXCJL6HRE/CHQKZ6mG/zuJo+TFmsSUdJE4pbsuGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4173

On 18.01.2022 11:20, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 06, 2021 at 03:01:12PM +0200, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Change IceLake Xeon C6 latency from 128 us to 170 us. The latency
>> was measured with the "wult" tool and corresponds to the 99.99th
>> percentile when measuring with the "nic" method. Note, the 128 us
>> figure correspond to the median latency, but in intel_idle we use
>> the "worst case" latency figure instead.
>>
>> C6 target residency was increased from 384 us to 600 us, which may
>> result in less C6 residency in some workloads. This value was tested
>> and compared to values 384, and 1000. Value 600 is a reasonable
>> tradeoff between power and performance.
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Acked-by: Zhang Rui <rui.zhang@intel.com>
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> [Linux commit: d484b8bfc6fa71a088e4ac85d9ce11aa0385867e]
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> AFAICT those values are all from measurements, and not in any manual
> or specification?

That's my understanding of the description, yes.

Jan


