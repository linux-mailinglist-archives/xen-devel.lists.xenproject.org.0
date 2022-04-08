Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5744F91FD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 11:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301271.514113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncks4-0003VG-By; Fri, 08 Apr 2022 09:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301271.514113; Fri, 08 Apr 2022 09:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncks4-0003TM-8K; Fri, 08 Apr 2022 09:25:36 +0000
Received: by outflank-mailman (input) for mailman id 301271;
 Fri, 08 Apr 2022 09:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncks2-0003TF-LE
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 09:25:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e9ae38-b71d-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 11:25:33 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-EgZ-pw4vNzy2SW4VYH46lA-1; Fri, 08 Apr 2022 11:25:31 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB6PR0402MB2917.eurprd04.prod.outlook.com (2603:10a6:4:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 09:25:30 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 09:25:30 +0000
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
X-Inumbo-ID: d6e9ae38-b71d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649409932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBiWPL9Yq4YswZyyVmA0xld+FXIWll+lUshzuKP6e28=;
	b=Sy9gTckA8alsV9I+lDFqAEQ7Z7S/OIfCfdtFT2ORmG5EUkWPbONlNQ56dODo/icBzVnScS
	81tK32wipxkBd00vndS4EpgG5rgFtO9IVHat4EqCa3JEXMWk9QLZILhJLy1SJEwYZ7JV9R
	jxpsrzLYn8rlpBTiO6TE2EK+vPsvrHc=
X-MC-Unique: EgZ-pw4vNzy2SW4VYH46lA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie/yLMkk/BItzzrDMxAZ3ZI4/cJTD2b3+pYAMXeolOfRIxdELfu4RMaotDcQt9PfctFEmqwHIQY9JvIcqi2kG0gxwuncCQE17z4nU0w/ctkV9+KjTwUpFHd7wL0XmcGVHt4Ma3CT5wboNoQcS7KgQIr+fHOAHQwpvWOdGsOlEqD8hkSWIttlaayLCoc+KwCG2C6Uvwq1tV3ZgtiQJB9BWbgtiwYOjEPLvC6by8AkN/WVfQwDhVlUay9VK9uiIlEYcOjgKGKNWXNrYTnRCd891qJRDlo2miU5Cd6UeKnBatybvDyQPRZV89ffx7Om5DqSJsidgQuQ2UfMWrofq39wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py4JQSQM5+JO8FvUWTXkGb8C07lU1m8ZN9z+bPH/dc4=;
 b=AUsjfGTmEnBGBucxr1zhqahQ9nvglprvFzVucRnfAPH26i0fT9k9+IotSTFeTpRloYQECx9M+mpCI20rVDjTOGH7lrcHunwJ/liyZETGF9RsUKIjhfHwnFyJFMB1oIrOvlcZp0jlHeKJnJTAxa3+hvHcHQ95x7vp7/fiyzSw97sZEdoIL+gKLVlyWC9BPtp7dvoqoZDFJR0ZKKbpMgrv/v4v9ShI1BFthMea/6xMlj2uVLA5zyEkMg/yNDkWBHkhmI1b8G3UZScZGhaAs1nzqX+AVUhyF1/NHnHHC+QAZFySsBh7K4eqii2Sc3OB+yXfcz13Npg8w73HphTbo6Xzow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
Date: Fri, 8 Apr 2022 11:25:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk/tzuKq4D3mFEQu@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::31) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ed11761-94a7-4a6e-cdb9-08da1941b971
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2917:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB291779D66A70C8FA44A7B07CB3E99@DB6PR0402MB2917.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LqsXDf649lN5p4u4qILlrDYDwdMW2yWmH09vtpEZ2Uo1BcKkxYDgwZtC0WFBWoJsQlfxzZHEJxTWHxDq9cHOLpnMffyga7lkRljoQOLBVsT8aJTcFe2n5EE6znvth7hddsmgb0LJi1YBcp1C1pjH76/JyNdQt2a67bDpxaiGrXqd4CFxnmbMQkTabMuSHRuHE8QuLv/+idc7PFzgJzB4mZbmQ5X10xWSEpI3DZzW4UURQ8JWkNN5qnmD3twwZqnCts7re4+KbMtRNGG/qJkNnuA6S8e39wlHltUgC11YMEzXFyEEn8D88luYU6rKUgXfsGQjlNI/dRC0NHWbSSdHiQPB4IJPTzLHlJk0kdNq4pjlr5BwM6NMpPZjk1nZFtPynOuRWIa7RfWcAM/Ei9I6wPI53ez2rRLLNLF6klvv8JaH3hpj1bsJtc0X9MQIhaET7q4tUgALj4GE+GpSQbX5ebJDC/djeXGkJPNRcd6rUUQ8SvB7zlb4rtTIE3ilnHeY7X5DXvAYhZH/+E2fA3pzKJTELihHUpdkND2gSKLsN8VU1p8UxlJmOA1fZsWcTCf2DKu+D/oi6Hb0I0LQZyDcRsOxDF/oC4DGIZfSoDeKrptdgLK4jCU1ndNrinO2dDYJbW7HHJBiG4OMYTbNtXK79sQwQvFJYDHsdhdvMWPtyzcCjvItVn6VYwsuh3c0tALCuX8rMgZ2hzfZdA0Y/eFCyw3bZGdWTk4jTdaGBmbYFtoazdX9PResdNTZAXd6RPlLcDQuZurEOXlJgctZU8YuDhudI6j6I+QWi0CFVbzjwgrOrtdfGlfJrIAU99G1//iiJWp1t42Hvi+S4gOBSkBC4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(54906003)(31696002)(6506007)(38100700002)(2906002)(6916009)(53546011)(107886003)(2616005)(508600001)(6486002)(316002)(8936002)(8676002)(31686004)(4326008)(6512007)(66946007)(66556008)(66476007)(5660300002)(36756003)(86362001)(26005)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/tvb6LeU5SFMLRhBhyPrtt6LtN9ZyloCK7x55N7yVQ8hWavmf2pYZ9sJIFf3?=
 =?us-ascii?Q?ueGJRXFLgnrtt4CnexPKMzoWSnwiDc2shAPtme0v0DPYq52LqAIIgERr2N2/?=
 =?us-ascii?Q?u7sP5toY5M4G2WTm+JTV9x7MG+BTuBn95SBg3qEiSTtf5jS2LVG/xXDirBnW?=
 =?us-ascii?Q?Va7vM6wjmn0Atf8k8tk/BakwuKgUl4wiFHMm9RXOiZVCrCovHOvOHEDJrm8m?=
 =?us-ascii?Q?rpABVAjAkCkqPi/01iZuqrr23d0T6zLaScUYaFxsNYtzfaGWBXZCsDXjMHPo?=
 =?us-ascii?Q?XGpZO9ZmZmYYKBZhtTMqGnFmEmSuWfOqilr3HIm//nAelTOEFcowQm+pgEEF?=
 =?us-ascii?Q?qALzkr4q8juPfu8uHsaTa0s5eMOoLefMFgt/jERlYIXu2YnI+lUmJwndRhqA?=
 =?us-ascii?Q?S2fC8j5X8Y1ek5hqOQpk8dFBOQ0pLB0R9xhFADfX5GZpliXu/jvtKCaFT4fk?=
 =?us-ascii?Q?cMauNDlQ8H/1GQ8YdCy6G5yNXCkq9q7KgaLb+QU4N17yWtTRHLauL5yPC67S?=
 =?us-ascii?Q?DbwiY1wsxhuRqtvjEhjzV8ejCPbSvHqneVWnAcfwze+01cDozkEPSPIwFZEF?=
 =?us-ascii?Q?t5XzJI4EfBz+bjwBAez0A6ifoiuye0JpZVOB3KlZfuJCG8+kCiwl97p+fYXT?=
 =?us-ascii?Q?byZind1PYLRLZ+BDfevy5PKJzbrl71WH0DMF/00GL1/X10xpTHaxinoC9DQJ?=
 =?us-ascii?Q?JJk+OgPtRhtzXCfX3RhwXqWhmV47FGh/MUKgP+q8XaEy2G6D3EQVgPKeK2Z9?=
 =?us-ascii?Q?Ak6X0RLyNrQdPfYeQaOqjIoGSMJ3BAofUYkB26dF2LFOHR0IP0M4mPMToJab?=
 =?us-ascii?Q?4XO97WV6whXknXp0tOdG3b++LunKN21BBmQHFH+WrMamyyYZSAJ+zA/WfBPh?=
 =?us-ascii?Q?H2Scsffk1bs8NMGweFQNcKSveQ+yOdjb7g5PNahNeppLlg4p6boe0skwdEam?=
 =?us-ascii?Q?59KPdAUCyi9xt3LYEWDXWygSHQJ4JBaWvhnwDfZXcXZ9I1PUL3Av2bULdzIW?=
 =?us-ascii?Q?+czTuwOvaPE4aTBW+CgFW/RzjYaYQU6KeW+tbxgsUVck/lCAEJeh3gScUal3?=
 =?us-ascii?Q?7MuovcDnfOCLnSm+B9hT8qmMvAiW1rPbuhO4TZ2ya63J6pVa1Id9EamDoS15?=
 =?us-ascii?Q?VmAcnYLQDwYPYe8aAOVoEPQ3kYG7URhklQll9o9VjhvhRv88oTKoBl6bnAw0?=
 =?us-ascii?Q?IMJ6QS0JAGKWwvkOHiemKV5F30YsnVkK+MlElzJuHgQbq+LCMg3l6ploCw/a?=
 =?us-ascii?Q?5h7qRM9goNPNVR+79EHlft+y83h1e6yVb+Pw/fjWi5f741gj+zbJILyfA6HW?=
 =?us-ascii?Q?ozweTF0G2B7d5TL7pDA6qQouRYHiOinY9yAZP+AaiJ1+6SOCcN0nTrMKbp8f?=
 =?us-ascii?Q?9PnLAH9QBVGtCLtE+eV6iOt4viToI/+q9TnKzpDVcr2VWl+t8y5BS9HXVM9o?=
 =?us-ascii?Q?YvQsEtQBF4pW0EV5bdZrvcc65wItuzLZT/CQfdAcpiqNzPcZlOsTsHS4nwg/?=
 =?us-ascii?Q?GiGexQUiDhWV8cyNt+bzOHK3I95o1TkuFKX8aITxFloBO6SVjQvCeOa7WbNb?=
 =?us-ascii?Q?HLQQzrcpX9bnY+ywuofXvuFUoByYsEe4j8CCmLIaAQydPvilgTduZbOr7XEs?=
 =?us-ascii?Q?MOrh7nC92nrQwsx40p+86qLuOSLgq1xDhff/+/c/CStj6lY0yBBz2mSAqhRt?=
 =?us-ascii?Q?0yb8IjZTkUo9l1TaiLyYCwYSSeeoaxupKNJDoqU0oxUPce9ui7YbEh9uS2CH?=
 =?us-ascii?Q?NdS+GvztRw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed11761-94a7-4a6e-cdb9-08da1941b971
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:25:30.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW7sJFF7jgPUJkz3Eaa7vhTA4LHUBXavxI5lkMtndAddD8puADFJOcEdEQ/QPe8tv9BnbcQrdgNoSGETM0OPnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2917

On 08.04.2022 10:09, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 08, 2022 at 09:01:11AM +0200, Jan Beulich wrote:
>> On 07.04.2022 10:45, osstest service owner wrote:
>>> flight 169199 xen-4.12-testing real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/169199/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fai=
l REGR. vs. 168480
>>
>> While the subsequent flight passed, I thought I'd still look into
>> the logs here since the earlier flight had failed too. The state of
>> the machine when the debug keys were issued is somewhat odd (and
>> similar to the earlier failure's): 11 of the 56 CPUs try to
>> acquire (apparently) Dom0's event lock, from evtchn_move_pirqs().
>> All other CPUs are idle. The test failed because the sole guest
>> didn't reboot in time. Whether the failure is actually connected to
>> this apparent lock contention is unclear, though.
>>
>> One can further see that really all about 70 ECS_PIRQ ports are
>> bound to vCPU 0 (which makes me wonder about lack of balancing
>> inside Dom0 itself, but that's unrelated). This means that all
>> other vCPU-s have nothing at all to do in evtchn_move_pirqs().
>> Since this moving of pIRQ-s is an optimization (the value of which
>> has been put under question in the past, iirc), I wonder whether we
>> shouldn't add a check to the function for the list being empty
>> prior to actually acquiring the lock. I guess I'll make a patch and
>> post it as RFC.
>=20
> Seems good to me.
>=20
> I think a better model would be to migrate the PIRQs when fired, or
> even better when EOI is performed?  So that Xen doesn't pointlessly
> migrate PIRQs for vCPUs that aren't running.

Well, what the function does is mark the IRQ for migration only
(IRQ_MOVE_PENDING on x86). IRQs will only ever be migrated in the
process of finishing the handling of an actual instance of the
IRQ, as otherwise it's not safe / race-free.

>> And of course in a mostly idle system the other aspect here (again)
>> is: Why are vCPU-s moved across pCPU-s in the first place? I've
>> observed (and reported) such seemingly over-aggressive vCPU
>> migration before, most recently in the context of putting together
>> 'x86: make "dom0_nodes=3D" work with credit2'. Is there anything that
>> can be done about this in credit2?
>>
>> A final, osstest-related question is: Does it make sense to run Dom0
>> on 56 vCPU-s, one each per pCPU? The bigger a system, the less
>> useful it looks to me to actually also have a Dom0 as big, when the
>> purpose of the system is to run guests, not meaningful other
>> workloads in Dom0. While this is Xen's default (i.e. in the absence
>> of command line options restricting Dom0), I don't think it's
>> representing typical use of Xen in the field.
>=20
> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
> uses 16 for example.

I'm afraid a fixed number won't do, the more that iirc there are
systems with just a few cores in the pool (and you don't want to
over-commit by default). While for extreme cases it may not suffice,
I would like to suggest to consider using ceil(sqrt(nr_cpus)). But
of course this requires that osstest has a priori knowledge of how
many (usable) CPUs each system (pair) has, to be able to form such
a system-dependent command line option.

> Albeit not having such parameter has likely led you into figuring out
> this issue, so it might not be so bad.  I agree however it's likely
> better to test scenarios closer to real world usage.

True. One might conclude that we need both then. But of course that
would make each flight yet more resource hungry.

Jan


