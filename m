Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04AE7630BB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570210.891792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaQ7-0004Qq-H2; Wed, 26 Jul 2023 09:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570210.891792; Wed, 26 Jul 2023 09:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaQ7-0004O4-E2; Wed, 26 Jul 2023 09:02:59 +0000
Received: by outflank-mailman (input) for mailman id 570210;
 Wed, 26 Jul 2023 09:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOaQ5-0004Ns-8s
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:02:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d05405-2b93-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 11:02:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 09:02:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:02:53 +0000
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
X-Inumbo-ID: 35d05405-2b93-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bexB1pbBE3rJPmhOoXoH+sL4taVqVrsZ+NKGPXWrPf1k1ZxUh90qhWHHLlFiAg6f2QEz5AWCqTrYvAOk+Fs9aFpIANjvcCa+w4tNEoYEiKPUhM4uqmz7zfL9qFfuuk5zthr/7fejkvl+96y6pozq2k04SA31QSGyxZqBmSbhaguQqdCSAMaa4wCbs/7jfBHtZs0aMySa8bO2cPVp4MwWzhD9JAV4j8J8RCO/srZyr3bUwKiD6J/WiV94TNzyI3Gz+J7SRwwzFO7lx7xPSAC6IhpdknOyPBqZp3NWHroxIVt80DtVxoIpJc3ONJVNcjwaBosqXzByMDzv9r6V974Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEgJCvBymPbM8CXAwgiZMX6SziJJAZib21PsajGtb6Y=;
 b=gdD4kJoqnUSoT5MYca9paLYIH+DvuD2cWZwvLtT58eqDQVG69PYZL8fekQ7WSzBYPwSCwqhnwYrS9ISohIUrgO2RLsfOOzUeYYMgpeBonvs2YNCEWw10ndBv2NvE+Xdn94fBXRQP1XV70UU8epZQk03IKVyOD1JBoWvZ2eYsZGxhigDFaBbzhPI3ApE1psDiwCPwBxD5RBAUVqnQT0NTImA8EkRcfBgmhpK1s7heEoEwin4h7zywP+Vz+/tg16eXI/hF1h0z93Csx8I5Fk6ni4dNharqNtmst0QXh4e9kJLZ0doISmQLO1Bex4AA1OoWmlka2F5GooO9pnLT4ANPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEgJCvBymPbM8CXAwgiZMX6SziJJAZib21PsajGtb6Y=;
 b=tdAuzPmGzFXTKHjIrbOjUtzn5TM6mDnZrFVqcyxTt3iFc5Tm/E0nJeUyl+N8/WAz80L8RPe3c6JU4nDmyRpntomW6V0BpBZzcQstVOvtZJVhsoq3CuYxo/DZgbIzGZsiFEmbYugRZiLaPe8oCEEmUIcT/KevGycMotVuYYJW1PjOSC6JhnQpgvDSaHXdQpXSv0XtrudFjjJi2WpMbBJ18CrzY4mbZl4+Y/NncnSYbnkASj/lC4MziSIHcObrvE/KiuNDiva1LsTKP3LMPtaegcJ8ija8cfLcNx8RpkRo9l/nszfka7DvBUTmDAsBPHdbOfMkcK+79KmAkCoNE9GF1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <664d53b1-1616-3acc-4b08-7ac482e443ab@suse.com>
Date: Wed, 26 Jul 2023 11:02:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/event: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <367ab3b09deaab82dfea0e833eeceaf8de49f5c1.1690359344.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <367ab3b09deaab82dfea0e833eeceaf8de49f5c1.1690359344.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e30e9c2-e1a0-4dba-ec7c-08db8db7188d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4wOBN+7DqNPxfr4cNtZSO14VrMnenZ9amZZWBN1NNZ26QZ4U8W/sYeAqQdR6ai1Tz/q6OXg2LmkPY20uFyRBX1y+yLqKmBMQyzJLMG4PphFNDVUiqmn77JTx6gP0uKcF3GtsXAPiW0EUsZx0Pl4WsJSanM2GKZmQdKqLRs5KmHaKsE2GwjAYLW55vbJ7/j0kN21qB4cxUfF65dZPwJ591sOZQhedEU3vAmWbtvntSnNBN+vGSmuMEnPmORcmWLf3qHK9hQH0M1uq2dvs+we1agyHheiImUbARchLv0wUWXDLd6lJ2tdDVu51pRfeuRxbmAMpS/bixbEWezHc6xOrrkYabK74PhD8//PuFbjlU/cC7TAOnPpnUBGbDooBvOTVT+CMfI/1gjCZcfGFhdVKSfFxBc3qYSrrN8dDthqMGl4M2GV9m6w6qgFXPpQYrAMQaBNmE5IUEnW+81Y1GxaMtokMTSQEWcYs87yq0Uys7T0Bq9529/UPFD0i/k6zt3SfhPj657jluUSGmHu5XVtKwgEyTDA08aLpM4ztUNkRikdvCruWtWQCzKrz5rHM23tW1yUeuaZxjrwkywXUMangwXdNWR4qulDAMwud2QXWsJCrSFLrjJnEXZGy1plvqLe1cGI5qtEMHECYCdHSVivpKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(186003)(2616005)(6506007)(26005)(53546011)(54906003)(478600001)(86362001)(31696002)(36756003)(6486002)(66556008)(41300700001)(316002)(66476007)(66946007)(6916009)(38100700002)(8936002)(2906002)(8676002)(4744005)(4326008)(5660300002)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU54MnRqdmtXdVlnZGhhZDhKWERtbWNKaDFMVUo3YTczbXNIdXZTUDhISk4z?=
 =?utf-8?B?MWJ3eFQwaFpkMzRHWXF0dE9xME1JUjg3dEdLaVNtWnRPbVRrYWVVM0FqWER0?=
 =?utf-8?B?NzMvZHZFZTUzVldmT2k0S281QThZbFRVelhBV3FqeU9UVGk4YWg1YVJ3ZS9X?=
 =?utf-8?B?eld2eFJtK3YxemVmYTh5NkIvNUc0SWJDNFFmSmgyK251R0tjSVBweGlETEF1?=
 =?utf-8?B?amVSVWlWeDZFOE5JcVQ0Z1dlc1JQVEhlZW96NURtU1NkclZIMGZjVFdacEhN?=
 =?utf-8?B?cDgrckZLMzZ4Rm5GQVFzNXJDamxhaDBQd3BZaEdqOTdLZERxNWxMcjVIdHI5?=
 =?utf-8?B?ejlIdGdWNEFXdU5vSm5zUmh1empyZmRjT3VwdFhYTVA2Z3N5QTJVZGVobUgw?=
 =?utf-8?B?eGNPZEZ5QjNMeEhDTVBPb2lHVDNNMFJwYnB6Y20zamtZVGt3WWVsV296Rlpo?=
 =?utf-8?B?OVJGNDIrMGIxSlpDYVdjNys0MEtHUGcxSEZ5amVSMHhzWXkxUmFOTHZ3blVj?=
 =?utf-8?B?STRKWlladnBSWkUvaFZLMERkYXZpaHE0Q2FUQ3RMRzIwNVYrVWlscGZ1S1R4?=
 =?utf-8?B?TTU3bTVGRjEzRVJ1V25kUlVhQTZveXlEYTRNc3NJMzdiUDVab0ZHTzJSR0Nu?=
 =?utf-8?B?Rkp2VjZ1M0NpUW95RmFWMUU3czZBUGhLejlwdWRERUJIekNCWmF0QlVkVDlG?=
 =?utf-8?B?Y1BycGtIM0E5QVhLNGt5RVh0bzZtZmFIcFpZOEhOTHUxU01rSHhBZUhITk5s?=
 =?utf-8?B?T0RMOFZwMGxLd20xQ3hpelc4TFA0b3ZLZkREN0NCOVdvcG9USWpXM3gxN0pN?=
 =?utf-8?B?TVJNdjR3cWpwQXAzbEhjWU84NDhnL1V6K1owMmViTjFGZldCNENBS1Nwb05u?=
 =?utf-8?B?Rlpad1ZhcmZtRURsL0pHWWw2RTVwYkxJa3dUekdwcXBRU2MvZmJpTmhucHlj?=
 =?utf-8?B?NGdpaVJRbFRodE95QW5vWVZYb1FzdXkrZjViNTJueGhGbGdBMGdHNEd5WkNu?=
 =?utf-8?B?TEZzTzhWR3Z0aG5UTjJ0bm9YVVl1NDd6NEp4aG9XZ1JWczZHOEQ0ODk3bzVE?=
 =?utf-8?B?VHo4c1Z4Z3hTbDFiQUV1dG5hQUhtWGl6SDNpdzlCbWxtcWg1bHo5YkhpUXRu?=
 =?utf-8?B?alRPZXRHRGRuK1AwVHI3Y0hWRXBmRVZSbkFZUTd4SXdqUXhFdXNBK1poUmhL?=
 =?utf-8?B?UFJETjVrVnpNMTc1U0ovTldESlNqaDJVSGlPVS81c0tpVnhma2Z1enNCTTRl?=
 =?utf-8?B?cUV3cm9xU3JlUStPbk9nKzFEUjBCOEJlb2IvTER6TTZzUHpyelI4M1dXR0ox?=
 =?utf-8?B?NjhDU0Q2eWYwaHZjT2M0K21icEk1eWh1UHlaWDV6Vlp0Ym5KOEo2R2FaOG90?=
 =?utf-8?B?OWs3OHNkb0loa2ROMTF2ZDUwS3V5bFNSVERRSnQxOVRkbDhLbUN4QUtJdXU3?=
 =?utf-8?B?VnM5NS9PSmx6OXpKcnVFaE1lWDkvelpyRng5Z080TG1Nd0pVd0ZmdFFrcWVQ?=
 =?utf-8?B?RlcvMElRdFVHYUV6YjRHdno0dmhPTUMxamswd1BLL084M2FhRkh4SFMvZ2Jk?=
 =?utf-8?B?WW83Y1FtOGdFR3FtUmE4NFhnK1RlanNUWEppanNQcXlIcjlOTWtoUlZzR0pX?=
 =?utf-8?B?N1ZnVlNoQ0ZrNUFUdVVDTHRlZitGb1VkMnFkZXFyOUMxNldqT3h4cHFOZDRr?=
 =?utf-8?B?b0JGNzVrUTV3QTZYa1A5VWs2TUROajBUVzRZSlVMekNGRTdPbmkxMFN1eUpE?=
 =?utf-8?B?b1Bua01xV0hNU1hSUFJkbi9kWmsvOGNVSVpQZXFnbVlyYk9VSDZiSnR5L1cy?=
 =?utf-8?B?VW9IVjdac2JyTmU3S3dReUNUTS9TMWVWVzU4SWppc29NV3Q0SFZhZXVzN0xp?=
 =?utf-8?B?dTlzYllaVWJZMW1FZnlBRWxLUnlNV285RWZCaERkbDBab1BzVXFZYWtLWmdX?=
 =?utf-8?B?ZWY4ZnRqNytJZk1sbTQ5em9xRVJ1TVFOOEQyeEM3dytQcTNQZEEvS2ZZV1dC?=
 =?utf-8?B?ajVZN3QwYUE3Tm0yWWx6NEJKbUc3WTg4R3dUcStmQ2N6Y0oyQitqSGVKL2Jt?=
 =?utf-8?B?bHZjSS9LTldvNC9tdUw3VS9pYzRncTRISUtZNUdyaGFvZkRtK1FpOTdKYlRp?=
 =?utf-8?Q?Su3EJVXgH8FkShIM4HtKnqZEU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e30e9c2-e1a0-4dba-ec7c-08db8db7188d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:02:53.4714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV6GjmH4eswd9nN+w+tUpSiWHXwwe3bt1c0/ZMUaH/sDzKVlvxrJC882NOBb+pnxoZN8Y+h/rAWhuMg5hH60VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444

On 26.07.2023 10:27, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



