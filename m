Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2D52EDA2
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334232.558233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns37g-0003MC-89; Fri, 20 May 2022 13:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334232.558233; Fri, 20 May 2022 13:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns37g-0003KM-5C; Fri, 20 May 2022 13:56:56 +0000
Received: by outflank-mailman (input) for mailman id 334232;
 Fri, 20 May 2022 13:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns37e-0003KG-Pq
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:56:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abbd5e03-d844-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 15:56:39 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-13y8Cn5iO1iEYxdMK1SJew-1; Fri, 20 May 2022 15:56:49 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 13:56:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 13:56:48 +0000
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
X-Inumbo-ID: abbd5e03-d844-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653055013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dFU6grAchxmaSPoDPT0/TN4xdOlUQyN+/Ob9XXj/Z9s=;
	b=c5vr5l460Qnv9SWeSki5J6MkcQbfG/Pae0iUVGVEQNN+OAvOrQIrN+XVwft0XGJA56Yx4K
	VyQ8yUa/0aQxUxKcTqaC6V+A4J2GxU5M8z1N93XdVUPqUeafQzi69Fo2790dzddNzRFo0j
	du69AAxHpB5qpd1N5jFr2YhyOzCPUww=
X-MC-Unique: 13y8Cn5iO1iEYxdMK1SJew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWlzHHqmrvVo/4Y+AnJqf4ZKXyLWGYLe32HkIEV+UbWsUhQzBBTkkHefHmsFD0mtcSdyJ5BZfB3kR5F9DcL2qrvEookr5Ajky1xDMRNCTOXyr/AP72VoHEYQwW4vxY1c9/KrZGpIC262sJG1gzW17ZnIpGsZ05C05d8Jp5Kb0dEnEV8U16p07nY8s9jw78ZvRe7GJzrBIOo9Gtx5SRneIEbMCOm09EHrx5rYhD1Er6Oxihdojiv5moSfGb8CQ+bxn0uIVArAcaMBeU5HoQMJO/rkHBJPcgA08kr2I67GjrqwG8wKiVv9EnLbk8DVlLW1KI3bsh3M5zY7+6LOeEVn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ynqs+BSk2t9/Jj2XX7dHUyBhK73T24oGcZM40uf9Hfs=;
 b=VPK/XOnBeD2C5028OrXBMwd3Pp5Mab/9oWfkH+V8OiP7/tbAfuQDzNI3VJFpTjsXURnyPJMOcZo9YncAcig9FKvYwPd1TWX7ADn5aVLgz+OUzLp/EfbSyJrJrrf+xSrjyoUme947lxuMvxOaMQItW7H/PR/JtF9NWqiXswZgXxvS72bETPkjxJx8PQSXMwVAcuQNcs+yF5W/mQXCz9lm2qS6D+eg33WP3DLPWHyD4aoHq0+CNTzYSvoFvNzZui46JmnVRrKv1ZS/CJ1EjASfGTtLnB56a3JkXGJ5RXNDJm4cQn6nZwc1Gp5m/B6whvO7M59BWQU29CjMrHc0RwIKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f9343a2-7ac1-11ea-276e-32b7207db072@suse.com>
Date: Fri, 20 May 2022 15:56:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] build: Fix make warning if there is no cppcheck
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20277da971c1050d0464410e24ecff9d5d659990.1653048581.git.bertrand.marquis@arm.com>
 <c630ae8c-ee37-a678-4c6c-f0f9c34f98c2@suse.com>
 <3C17CA95-8415-4A05-BD3B-95FE57465C82@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3C17CA95-8415-4A05-BD3B-95FE57465C82@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR07CA0060.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bd3731b-e681-4dbf-a414-08da3a689554
X-MS-TrafficTypeDiagnostic: PR3PR04MB7420:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB7420255A158AC124E44E9C5FB3D39@PR3PR04MB7420.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lIp/HeKyQGXSK1Omu6TRVYKG8qjVqOCiQgfMD/XDcE/ZDg5zY/Z6NbqNCVazs6Z9aa6x5pafvFFC+sYWSOmCW4cI6M9hs70GbyuGWAJaTUKLE5tfRv2spBTBrUKLGCgm8dWsz9ElAkFi3szaJZcHf4OPz56DGy+wQTbmDFIOLbtSZPz8G11Fs39jmrBthw+UuK/pQONYdvMivjXmkAJ9J23Tkq2+QvFVpECEvIUdizef9JCvAslkpQTShGkL2b8pYnbBqCFlOGKwKxzmEN8YLzWvoH1L9iG0nLodY0WOjfmMRvBtR20wxaLsxRD8kLgR5Ozev2L0I6mlH5QWECpH2R6E/Y+AyYhWV4R3X1uj2JA4O0GHcCjCEW5w9juE/qY8gRKITPyLZVT72YDen1/uqxs2KefCMPMWnpK+P78o5W7womnBRMaxqGkSwmpPRehNAJIh7w9MytaHrONSyx7sRHIgYsNZ7OlQrqcQrWo5Oj4GpiH7HuVLRjAFd/HC9/WfvLJbEGX4QqtmuaMFSY9IdKzoa2ZjfgyRJmnznIuTK6OwwF8SeNS8Li8vzua4wnXBQTpVUoj6x8hrCZW1X4M8j3uQp7/i2wceLNIUICGZjS15QWZhM0CYczK5OMfjwVHuX495+Tg4UJ2yIuCPyPUl94T3rx3kTmyTpDh/i7G3y+mwM8IZsH/VdC+0UHOtKn0pPWfIs6Nrogx/aX3SSuOCLcCbGdsXkQvLJ9fKXgaxzSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(66556008)(66476007)(83380400001)(38100700002)(26005)(6512007)(31696002)(4326008)(5660300002)(2906002)(86362001)(6486002)(2616005)(31686004)(508600001)(8936002)(316002)(186003)(6506007)(6916009)(54906003)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KwcUL8+ORhouqTi96Sf8ib48QPKb2W/Inq7K8ljYAV0K38o2jgV2piDyx0d?=
 =?us-ascii?Q?cjPKBwa/b124K8NFEaoj2yZBuHlqmdYfKB9LGA84eze+LhQzboMhdjdyhhR0?=
 =?us-ascii?Q?jd5dSLHr+A1kn9LMvFhQe7yaoCbvrrr/z1Ojd44hDpwAIJeJ6nVM1OpdKJVk?=
 =?us-ascii?Q?yLngSAdbPAtka71KBeOEOHLoxlOyv/YaAMbIyhniYwFExp60hnsloCCy93e9?=
 =?us-ascii?Q?7atbcpzLEIt9MvRWNgy8OwpjGUOQyaPJN40xEo9s78z6FwCh/EUsVl2VxgF4?=
 =?us-ascii?Q?EaaIWfQEa7DhiSonRLhAucHiKNG6m8/+8dad/bmnU/gt5E7JOatXe3FVDqje?=
 =?us-ascii?Q?LH8hzzR2nygf6ffRQFsy8/mOUgktCIs2lII0tCkO6kb2l4Iu8wLQm1G5r3OP?=
 =?us-ascii?Q?YW4y90Fpr11rjRvAvjDutjOwqmynO2CkFVbwF18wPxhQ2x8xEj5Vjb+7KI0T?=
 =?us-ascii?Q?BSHCDB38ZgUHX2EyEGNMnCutXfu8rlIaAhoCtumuTj/IZzVHkK3cGZGWRcXu?=
 =?us-ascii?Q?+Qc7zAFiGmAB23p4lkKPTRH+YWtK0Hg35XrfVCTkzGigJYZshHFIqlIBSkKF?=
 =?us-ascii?Q?bTKWAQQUz24D+nN3Kqbgr7FkYXSexvP0eIzcN+YWWG2jZpDi4N+AMAZ6MdUA?=
 =?us-ascii?Q?FM0UzVUD0/4v5TndBGsTYsOobJVAamEbLWLWhH3HdlQ84riQvL5Rl7D5v2wo?=
 =?us-ascii?Q?0RENKKSeBJPTAX2nCB38Rf0KZGrhK67en9PtaUcTQNLUYV+d5dMjzfjLUcLu?=
 =?us-ascii?Q?LpeNzLdFkHO8/LJzbMU4f3Z0wUKW/YE0KM5XHdaEgTd+XLXMXPCdjiQae0KS?=
 =?us-ascii?Q?AHI++nXNz2vY2yYFPqDLeyIECslAe8Pnx7++LGz4020pX75Z7JsrrPIl23ef?=
 =?us-ascii?Q?td5riMYkANADEN6GW/7VfU5q9yU4WItedZm+69b08gDSf0fbs+eKm0nOcX6A?=
 =?us-ascii?Q?5Kh/PJZDkF5JDZewXomHJWSV3KJnucDZ41C9QcwgrpDMAFmAHxiZgTl2fJPO?=
 =?us-ascii?Q?4U118lCxxMuJLZs5PI0xtu2kmXhfsTA4HvQ1x6u1lNuPRmQE9gdmse81jtCy?=
 =?us-ascii?Q?PgD7+OKVOv2DNOi04fxzO+fJZgjTGvkbGXPsegKe3Ag3BkcBSVJ0w97yXg3E?=
 =?us-ascii?Q?C7mu3q3ds7GxYwE2RspXGOJTj+OxtyzUyqGOxbOt0U05twzgouxmqkbwcZhz?=
 =?us-ascii?Q?NIhxEDutzRrr6AlXrmfLka+cd+RWrGNsavnaQYKBAnqhJXFMrATnMWJvQf0u?=
 =?us-ascii?Q?TaIohuQFsZGtGCPeEuXQ3Hh+ABX+36pdp4KMuurgPKx8Z51AUieFkOuqU2V7?=
 =?us-ascii?Q?Q1yWyOASSKVe8gZ2ysSQmqFA4Ya/fCqbR+ASjen2kJULoMUUdwrL7n2U3j1w?=
 =?us-ascii?Q?6aWHMd+y5bfJbyeBG6ebkl7XpkEWsky2j56sMsYWSl4SEXjemwqvlXurwNiZ?=
 =?us-ascii?Q?rRvmI4fhw9bxIFqTAe4tI37QPXklPpLgjpfZ5KhtyBauVOVE67GOsXxbJ53m?=
 =?us-ascii?Q?9A8/DHkhuNmjw4rnEMZ6sdl3SA3Juofs1NHKgfGKSNETrD0fu4QY+cp0IjkQ?=
 =?us-ascii?Q?rUVEput9vbl/6GzjtekuZvuDYiCcIA2MBl1dr9sNbaD2J05bplNLUmIw88Mc?=
 =?us-ascii?Q?l6oUpJ3mGIGQvZ2zSolcUUe56bnwOX2XRMkkO9NcpuOU+bkMlD1kmWBGhmVA?=
 =?us-ascii?Q?9klkrnKd2HORld6UdHeXf8CvTaIOqlAGqtd1czs3wLr9zbFDFvjjvvhNU+2W?=
 =?us-ascii?Q?0XSFoYL41g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd3731b-e681-4dbf-a414-08da3a689554
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:56:48.4583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P04Kjrd+XXU1DxbvhSRqsbMBbO/zy5c0XJvJ4Rz+prjbMRMwF3PNMYpaQVUJT+4XnJtUtsIV2fonUI/sda5fCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420

On 20.05.2022 15:23, Bertrand Marquis wrote:
>> On 20 May 2022, at 13:51, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.05.2022 14:14, Bertrand Marquis wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -694,12 +694,14 @@ $(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree=
)/include/generated/autoconf.h
>>> 	$(call if_changed,cppcheck_xml)
>>>
>>> cppcheck-version:
>>> -ifeq ($(shell which $(CPPCHECK)),)
>>> -	$(error Cannot find cppcheck executable: $(CPPCHECK))
>>> -endif
>>> -ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
>>> -	$(error Please upgrade your cppcheck to version 2.7 or greater)
>>> -endif
>>> +	@if ! which $(CPPCHECK) > /dev/null 2>&1; then \
>>> +		echo "Cannot find cppcheck executable: $(CPPCHECK)"; \
>>> +		exit 1; \
>>> +	fi
>>> +	@if [ "$$($(CPPCHECK) --version | awk '{print ($$2 < 2.7)}')" -eq 1 ]=
; then \
>>> +		echo "Please upgrade your cppcheck to version 2.7 or greater"; \
>>> +		exit 1; \
>>> +	fi
>>>
>>> # Put this in generated headers this way it is cleaned by include/Makef=
ile
>>> $(objtree)/include/generated/compiler-def.h:
>>
>> Fine with me, even if - as said on v1 - I would have preferred $(if ...)=
.
>=20
> Could you explain why and what you mean exactly ?

I generally think that make scripts should resort to shell language
only if things cannot reasonably be expressed in make language.

> I thought the code would be more complex and less clear using if and I
> do not see how it would solve the issue with which being called.

The problem to deal with was to move the shell invocation from
makefile parsing time to rule execution time. Hence I don't see
why

cppcheck-version:
	$(if $(shell which ...),,$(error ...))

wouldn't deal with the problem equally well. But I guess I may
not be understanding your question / concern.

>> One question though: Wouldn't it better be $(Q) instead of the two plain
>> @? Preferably with that adjustment (which I guess can be made while
>> committing):
>=20
> I thought of it but who would be interested in actually seeing those
> commands which are not =E2=80=9Cbuilding=E2=80=9D anything.

You never know what's relevant to see when hunting down some
obscure build system issue.

Jan


