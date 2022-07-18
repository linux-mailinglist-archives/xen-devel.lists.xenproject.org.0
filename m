Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB157801B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369564.601008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOIW-0007YT-CE; Mon, 18 Jul 2022 10:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369564.601008; Mon, 18 Jul 2022 10:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOIW-0007We-99; Mon, 18 Jul 2022 10:48:20 +0000
Received: by outflank-mailman (input) for mailman id 369564;
 Mon, 18 Jul 2022 10:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOIV-0007WD-0m
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:48:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c8c391-0687-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:48:17 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS1PR04MB9653.eurprd04.prod.outlook.com (2603:10a6:20b:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:48:15 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:48:15 +0000
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
X-Inumbo-ID: 21c8c391-0687-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amgXt8zuA8Kbkikgd9nQq57HKgkuwY6ezXeyo+XpXbyGhl5W6pZSPUacsQxY+Bab45hZMV+cF8qO7kie3ExLz84Jt50oB66I7VQZQ+bjP9t9/CfEMtV5bXMTZ2lm1LaeV7r5afwOAXLDlhRuMq3STvaSabt7IlXP8Z/whyByZqgTKK/U13GX5B7NCwq5BXTVHbL64JnIpKYuWOFmp7QBoY77URrLJ2yZ5YMUAxE3v4HKIKim6a+27yQDTkLwbkilftVc3OOVR/UL5meS7MujcnHwVgsDHajm059j9Pd4Xw2lQIkyu6NwOUrfl1ZuUoKfPga+jsAN1XUvqXPLs4ewdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWYiKj1v9skZopvMgCoh4nulmfHARZA6J/VFo/hpWhk=;
 b=hgK2eKnKBY9zZTYAR1kgY/aLZbk0WgRonErjFoAgkgotEaxqeriAv2necyhY7tEEmb03/AXFWp+95uKszIvxU+AdMKwcW8fdbk3NwxtXTzWuI9d0+IX7DdMgvHYRqbvS3x65feeCOjdGlgjV6Hy6tgpVYX7tZ5fq0xqWIYSpZoxjXMOmmlITWNQ41s/KqvH1MfkhoHTn1fDZ++tlWm0yrf9dCj9xpF6mAXqTArRql7U377uF23m0wDUOeJab32VIICGWezoQYxjKryOl0o/JmIFiqMtqyNkjvqFWMcfYvl7jd31/qd0W/QvMkucrRJxcz6iKDoVsGtbMxuFIo4M8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWYiKj1v9skZopvMgCoh4nulmfHARZA6J/VFo/hpWhk=;
 b=lKwjz2rFTAufM7VOFXnk09PEV2BWOkJFwME4XUgoZaV3Nvb7K566HzMyh4u6oAj6C8AAKN9QPxYswUdIRc6cWSHsTW2KpG+ygc7NDEkAH+fvFOd0iHD78UD4ugxPkwZJX+WU7cmKEFAiPNM5V+CFyOsKVFjXsB2DdZ43t92geT+L+TYpYxs08I0u7ihm2HJygO1OpaTJFsRSf1+kUwRXU/ucctM6G9i8g+l5QQg1A2NBsY0aGJFzChRU/H7cc+mwFFK1P61pz7AGGaed7uaLAApoZHDCVdnqtfkCrNN4L9w0uU4kVWS4n5Jvrb/0jr7nqE1QuZOSdQR0x5lXCRIVIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44a6e983-59e1-b60d-c86f-db2a1747ddf7@suse.com>
Date: Mon, 18 Jul 2022 12:48:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] xen/wait: Remove VCPU_AFFINITY_WAIT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac8d889d-8b3a-4590-0519-08da68ab04b8
X-MS-TrafficTypeDiagnostic: AS1PR04MB9653:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNO7W8lnnxlgI3f6RO7WSsnP/ld55lypUQBlQmUzIuS/EJXSWI4Y9k8v3cQW69Jh6KcGRFRPKsYjG0KK9/NLDMQZBwOzhfDmIv3ciR14Kxna8MOwLzepmiwiVBWcXxsMAORzrtw4eMDBHPgKq4dHDdPJRVLUtUfc6BQGiLcCQp1L8fCSbLrPKAEHOtH4qkIDeGqYYxnnhKt8kplsN23NBD1bTmj8s0veAMa6c//Dn55XkdwG4/nwNd5QwZe5/0gersZ1CMo77KgIkk8uectstFE9Lw+LsrNT7BXkQWwF0k90EZyRyx8NP6yqqFc5atCWyIGuDNHNdbUknz5V1qKqYufa4Yddd3+KkDm7XwoH6RCqjFOQD5pLhqL2RjSBq78vGrn17zyDaB8NPvq1UzYfJ4RQXyI0Ivkwm4tAnEQPY4H7l4sHE0UP3flt3CSMJenetI2RBGY1bIYOszCDoa8Pn+sG2Drlq6TnfVNsiuHIDiIoR7JtQ/BKQYl71zyVIefvFSCQFQV4O8T1fTo+hI9KbLVK6HNMAVi9IlUQyf9v6stVj+ghxpfUPvN/cVhl9Jm8WyLXqQQwgsqyw6OTA/FaDC0HVOXIt7OfJMvammd8tpCY+DJSdgaD1Y+RypsN0LgXaoU6WOBtR5jMOvnvI5siu6pwzxbAAPuJ5dE+ww17cw6HTzGqy7GaowDQpHGU6Lyw14G+1GttpmtpVbsxZ5nPyW154pCth+F55x3wa+sPEszcavPX+osSOg7Ov5PtSeQSJcjOMw56qo0VDFOOa9CXle98ApBwXB8QJlMflL+uIGTLWsMDRw74CpOk5fK+ZvH0sW8+WDnetZUYfDp4uuUFjqJXgjZoK8rVbnm5vTbrZ1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(39860400002)(366004)(346002)(8936002)(5660300002)(31686004)(4744005)(2906002)(86362001)(6916009)(31696002)(54906003)(8676002)(4326008)(66556008)(316002)(36756003)(6512007)(53546011)(6506007)(26005)(6486002)(41300700001)(2616005)(186003)(478600001)(83380400001)(38100700002)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdzbFlLWXdDSW9vM2haa1pwbldUbDJvMkhqZWJPcTlZQzBzc3FiMXMzNjkw?=
 =?utf-8?B?U0NCRGNBQ2YzdC90dWhhWjN2STVLWUZIZThLR2FNbjJuV0ZubDlYWTNndlJG?=
 =?utf-8?B?YlJ5ZFhHY2JKQVN2M0VtMnRFMTRCMTBQekxJVEFyMDZVeGNPd1M4RjRmdlJs?=
 =?utf-8?B?alJtSGNST2ZUTkRWODhGUStlZmdLdWhSTWJTRlBlNENQK1hrVnNTdjUxKzc5?=
 =?utf-8?B?UGU0L2JMYk9xQllnTnBXMlFUNSs5eXdwL2JuMm1OVnZwWjFjZWFNd1dIVmtH?=
 =?utf-8?B?V3MxVUY4cVNwSUdxWTZGZnRwallCME5ROWx1d3ZOcDV4TE8rV3IzTHV1ZzZT?=
 =?utf-8?B?T1hzM2JER3RUaHNQMmxKWUZvcTIvYVNYcDkwVlVPdHlvR3d1cDlRRzduVjFK?=
 =?utf-8?B?czZpaWhjdGFyb1h6UW1wOC8zVWZTR1pJZEJ4OGRTQ3Nia3RaTklGNjJaaDhl?=
 =?utf-8?B?bkNmbWJjN2pvVkVUeGJVUklmeG9WTWd3ZEltTEd2VWZzWlp0STZvSDhucUZy?=
 =?utf-8?B?eHJCUklmaWlMNng1aUljVW4yZjIzOVVPcnRmR2hQcXpvczE5OFlEb0hYZ2JI?=
 =?utf-8?B?cEZ5ZVBqaWZYWTZXUFduRFVlMUtkaVFhSWs5c3d1Z1FtcTBBd0ZqU1RrR2hH?=
 =?utf-8?B?SXBxNkVadGF2dTdLT3B2STUxNms3RWU0UE5GWkhCY0JZcVNESjJIdGFvZTl5?=
 =?utf-8?B?YmJXazVrVTc2Z0wzS1lHUTIwWXl1V1E3Zk9uTndOeEpvTWNXeWRkWUpRR0M1?=
 =?utf-8?B?NDY5QkFkb2ZUMnFJTGFSaGdOeVFMVjlyU0N1bkFCNWFSN1BoY2xYUmVOQ1BQ?=
 =?utf-8?B?eHRTd0hMOFpBcnB1dm1FeXZHZ1o5aUZwdWJpYnRLUnFoWThSM0tNRFRleFR3?=
 =?utf-8?B?emdYNGJRUE5PT1M5VGFieHFYM0ZqVXFBQlc1a1NQSDEyS2pMSnB0aEE5Q0o5?=
 =?utf-8?B?K0hnT2tSdU1RM0hheFdteDV1MmtCc3o0cC83a3V5TWNWeVBiZnd2eS8xWnl2?=
 =?utf-8?B?NDR3TWsvaHRhNU0xd3QvUHk3OFRvOGZOOFhxYlRUM2xWc0E4TTVNb2xSMDBH?=
 =?utf-8?B?TDVkZGdnb3VWZWhCWENVY29JU0ptSXNHK3NXdk8yZHM2M0h3VG1YRURFdUxI?=
 =?utf-8?B?L2pSZXhNUTMvci9rTk9lT2R3cnNzSU1WcWRoNEdqU2kyTXZTRkYwNm5Ic0t3?=
 =?utf-8?B?YkZWTVk5Z0dqODMxVzhUcDkraXBLNVgvQno4dUFkYWIyS2xCSHYvMlFpMjZN?=
 =?utf-8?B?YkE0RnhNTEVQQzIzcFlQTVBKVjZxNEp5bnZzUThTYmk3ZVhaVmtqaEZZQ2JT?=
 =?utf-8?B?MU5uK1BDZWpzaEVPYWFSUGJNYm1aT3g4d3kydDYvdy9XRDZ2MkJLekM4Z2hT?=
 =?utf-8?B?ZGFtdjh1ZHNsc0hiMUF4RU1nVWRqZG5SR29WQjVnU3dYUzNJUWVUWElQL1pK?=
 =?utf-8?B?ZHhWZnVDOENWMGdqTEYydm12V2lETDY4MGw5ZXVDRnlCWFB0RnEwMm5ETW1j?=
 =?utf-8?B?a0t5TXVMSWpPZlVyRXJGTzJsZXg5Ui9rWC9FUnhEaWJJWDkyVmFzYVZNS1Y2?=
 =?utf-8?B?M0VScUpCL0ZLekd6ekhQYUd5REhrb3dmeDFaa281UlJBbWI1aEc2MWlSMExD?=
 =?utf-8?B?UjBYcmNlYkpaSytWeFBxYnAvRFJQbWpmVEQ1K0VaU08rZG1tcU9DM1p5RVAr?=
 =?utf-8?B?a3V0UjJXTXp3WFBIc25HYkNrcm5VWWZuQ0E5d1ppandPSDVLVTIzZTBSNGtu?=
 =?utf-8?B?MVVOcUN0QWF0N1YrUWFjb3lDSDM3OXY2Mmk4by9URUwrQjVlaHUwNkQzbGg1?=
 =?utf-8?B?MzcrbzNRbnVWSzEyQmlxakdWejIybzU2b3o0TklsNVdlT3RHNDFjbW1oQzhn?=
 =?utf-8?B?ZGlrb2k1dmxjZGFWb0ovWXVGMHNTWWV4d01SSHRTKzJHbnVkYTYxbjBjSVRS?=
 =?utf-8?B?L1ZyM0M2N0g2UmlXQ1Bnb1dOQlB6aHJRRXNLNUhYUkRabDV2cm5oQVpVSWtB?=
 =?utf-8?B?WGZycytxTmZseEYvcG9KZEdPRGJtaGZZbVhlS2RDTWYwV1RJMVUwV1BTSjNE?=
 =?utf-8?B?SytKRzZuc3ZZb2VqSWFqdTdVQ1d2ZlgzNHEybkJZUWNFekNhZGVLbTZDSWVo?=
 =?utf-8?Q?zE94Weem+zqIG8Fm9OSwwER42?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8d889d-8b3a-4590-0519-08da68ab04b8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:48:15.5617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXMqTVQy6TlwLh1HN6iQF+w1w+kG+LlV7aA9oeySUYB19zzY7X87cdvVkywQ27WHh6p5xUNyyiFqj4g5aB1RSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9653

On 18.07.2022 09:18, Andrew Cooper wrote:
> With the waitqueue logic updated to not use an absolute stack pointer
> reference, the vCPU can safely be resumed anywhere.
> 
> Remove VCPU_AFFINITY_WAIT completely, getting rid of two domain crashes,

I understand you mean two domain_crash() invocations here, but ...

> and a
> logical corner case where resetting the vcpu with an oustanding waitqueue
> would crash the domain.

... some other domain crash here?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I assume you've checked thoroughly that calling code hasn't
grown dependencies on execution coming back on the same CPU?

Jan

