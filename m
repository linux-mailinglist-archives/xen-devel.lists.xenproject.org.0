Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A169E11D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498892.769839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSUq-0002GF-4w; Tue, 21 Feb 2023 13:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498892.769839; Tue, 21 Feb 2023 13:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSUq-0002DA-0o; Tue, 21 Feb 2023 13:15:52 +0000
Received: by outflank-mailman (input) for mailman id 498892;
 Tue, 21 Feb 2023 13:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUSUo-0002D2-Hm
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:15:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db2747e3-b1e9-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:15:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8220.eurprd04.prod.outlook.com (2603:10a6:10:242::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:15:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:15:46 +0000
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
X-Inumbo-ID: db2747e3-b1e9-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX877QcoPNjZxbtWvvdLmYxNeqF+Bpa3s42/tRSx1I4AaOAcoqs3QmBcszBGk9YT4cuYuvyd2wCt2fVpHrG2inFJeH64/VZoaZMyML433vO9ZTun4ToY7CkqPKy/iyva074XT5+RxIbMHeJLdg8m6C3G55py1IqlSdlrf9J2JizTQmN3bmiCBdvPg8cnmyyJlxbAota4O9Yyu6FBT7/R+ZY41pR5eIdMBUpPkNeh38i0JTls/q4PC2b3ZG6btZwx3fW8jLHIV9CjIWVFjJTBNPZw8e6ka8mvcZhQmOz+S9hIEWzBbCWwPPdIqbPAQLt9wtVbAYisnOs71CfeuOcMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jmrmf4hy3NHgGSeKGiH6Xqn1/Nq/LP0hJLPg5IaRRKI=;
 b=CY2MVi+yXq7WCszgQWFp8qPJUDTXf/u0IvQUuje4Zi9yIg8SSGqChZaTWjcjxkEfCGrRIqcMDCUD5hSpoTawdRYRkIcXT1TFkSVNxTHKWmvvURLEIwgNULzGrq6OyBHmjTJmpj5a5b/0Z7RW8MeYv9gvvC14bsvMYaeSFsfQtiLoApsehfdlwzLQWixnV8xVzom2huAnoZx9oTHUyuGtFBgPsf+h44ZZJ7fw4AkcJB+96LW/ypt4zlwX/Z0tzfNTqv7iKtwL1O+qoavfzu62FnWfRLKCEOKGQfDDS/nAxIZhkN74vi180gR90dNZ3I/HCdd0bn/wP9mNg6KX+DN13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jmrmf4hy3NHgGSeKGiH6Xqn1/Nq/LP0hJLPg5IaRRKI=;
 b=d7OhVZ9Cjd5XAnxsXB4PLfn9WjdzfcgITzlXvlsXN2pQqyczWhVW1xg+kHadB1kCkcTTa+PZ4qyVT4BDXzUd0PUM1YZL5yYxsbStGVfLQyyPUAf/54PrHpBHzZF4+WKfATHGgfJ+Y8sLd8G9CVWxgrjtljPnkSQL0nfbbD16Qb0+MXFAnSZlVbtoyqtTsgGwYUSMSV+gsY7jcFiijWp5Z8xtxUIyQoC0hS/NS3U74v24a4x9iO62meh1Arp51obFn+61sOYXJ/gUKjkpF4WhxWgxXOvIPnvaEvJwlxDn43lDLJLAs2ljBvTzUMI5y3mET24ductJC/giiOikzgiYxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6fee299-094e-a5ca-176c-3dc8383e836d@suse.com>
Date: Tue, 21 Feb 2023 14:15:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] x86/vmx: cleanup vmx.c
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-4-burzalodowa@gmail.com>
 <3477e48c-e6bc-af9d-65a9-c6c0556318ad@suse.com>
 <dc7f5a3f-2a5a-e745-991b-13f12126677f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dc7f5a3f-2a5a-e745-991b-13f12126677f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d01a23-0d1d-4fd8-6615-08db140dbe75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RT3IAshtQ4H/mKMjUgbovVWZnFCjSWNUTeStFXKS2RVRDwQKJfyA2BLrlfe6xV3paM4lRIE+YZwsnKQFxayo5lgdyDGvToF8xe/yTn0mbunxP/uIHjKPo0aROk+vnab08p5GpUHOrbTDLSDiHo5xFdMWEv+WMcE3m8mExUQpHHzNw8Vfo09fkbG8G5zRr6jasi6YYU3h1LBkND9WyQLChsnQUzuVsQeD67fa6JqIbspkM65OT3Ykv9nzBQaCoa3QjmN8gLycCUFa6KI9BfJ/g6vK/CMGmKw0ILtsJKalQiphMAixLzzTeY950ilw+gtp/0Z4KSjE57co5/id3v9tmzm69umHlvT0iLl7/lydw9YDcIu09sek2wTnmTzcWU/lQY8OdbwDwUpYVZfwe7aIp67v6HYoZCJaSWf2Gb3+C2iyu5JB18dTwqUPPlMv5tMdtsI9DbALvBG5PTJ1e6ZTK7zhKmUM9T4ZUP24DXHFIsKbaxzPpuykNstSpWbWp4+g+s40AIW/Pr9zewTb/cYGhHKeWPulb+baWKLgBs08wodS8aIwglQg5To/oP60SIhdw09rqE1j7XgKYwh1XPrZvQX+4F0ym46nomD10b15QucZirnqAJwOuxW0uniuMQBNBhQmFLqrgCYUEhpY+B7ii0hZR7ERCx8asHNDuh3DJWZW+zmMIJXhF6YdryF89BQp+dcL56DFPBZfmGSkJXjvIBwLSjNvXt6Id3aloiO4GW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(83380400001)(41300700001)(54906003)(186003)(6512007)(26005)(316002)(53546011)(6486002)(86362001)(31696002)(6506007)(478600001)(36756003)(8676002)(2616005)(66556008)(66946007)(6916009)(66476007)(4326008)(2906002)(31686004)(38100700002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzlDbEpseUZsZ2RUaThQYlZtcXBUUTNvVEx1MEFtZTBuUTU2a0hoaGptZzY0?=
 =?utf-8?B?alJBdm5NVXJEOVBEdzRUcU44RUFKWkduZng4dStqdEQ2cUc2b2JsOUZzTnFT?=
 =?utf-8?B?aWx5TFhiTDdKTnU5ZktBS2d0TTAvY0hpK05hVmRITzhQdk8vKzBWd0piNEtV?=
 =?utf-8?B?eXd6dy9Jak5TcnpJWEt1NDF5WGpMQjFhSG04ZUVEbXhqRmxtdlpDRDFsMTBi?=
 =?utf-8?B?RVJibXRzYXhvQ21wWVViUHdxRW1rejlid05od0pKR09xbFQzcTFqci9jeWxC?=
 =?utf-8?B?Z2hOWWVNVjdWSTUvNE1yalQ2U0RVRStlYjRPZlRGcDR3bjFRc25nbjE4U2x1?=
 =?utf-8?B?cDJROXN3QlkzSENMdmltdnhralZJYzBxRmJzQkw0MG0rcStLak0wVnZrVExT?=
 =?utf-8?B?bmwyOVlxbFVsVUMyeGJFSEdvY1lwSWVDNWQ2d0Zaakx0TEtpUTZGd2Vrc3Y2?=
 =?utf-8?B?SFZpWHVNTm50amlsSFpEaWkwYklzWnk5cU5JVEtOOWNFZ0F3cnFZRnh3Nzd4?=
 =?utf-8?B?eXVLUFZMR2ZBOHVqK0szL1VVOWRPWUZBRlN1TzBpYUNYYzltcDAyMnZ5NTZo?=
 =?utf-8?B?bTNqaFczcy9ITDN0UzNYZUt0aWxiT3BPRFgyQ2tTMU5HRk9oSCtsaFdFMHBD?=
 =?utf-8?B?Z1ZwV0x0YVR6VDlqZFpCTVpLZThIWWZUTVlqZjhZL085VkM1cEZyZGNuZjZY?=
 =?utf-8?B?NVNkakU4WUQyVVNvV3VETTZhTEhITGpRMVY2bWc2bGJ2K3NyaFVyQTE3dno0?=
 =?utf-8?B?bGJDdHNMWDJPZW83N3gzWUFXeExxRUZQVEc1eEtTRGFHWXp5WmtuSU9kaGpm?=
 =?utf-8?B?cWxCK3laTVVLR0dBNVlPVW5CWkJSSGN2KzlsQ0M2OTVoU2JxQmUxMkd0T243?=
 =?utf-8?B?bWNIcEErYkNXUFZDODR3WEFUVnM3aVluQ0UyU2tKeWY0NEV6ZFdrK2J6eEZS?=
 =?utf-8?B?dFcwOU1tRVNmRm84RE1Ba3FjTVh1V0ZyczMzV3hnZmVFZmxKNTNMK0g0NkZN?=
 =?utf-8?B?U3NjS3dHQ05rWjNyVzFaYitPVStaTFM1WFlMeitScGZtUmFKYWJaTVk0MjBq?=
 =?utf-8?B?RHhrbGtmUXprTVhkQVcvMXVIWlVpVE5UcitqUHBSOStjc1U1aEw0V20yRkVx?=
 =?utf-8?B?bWZBODhKOHNIR0Rpa0dKM0R3ZVNnVmNUZHhmUFRVUDB4RVlkcElsSk1COXEx?=
 =?utf-8?B?UTh4Yk5mazMrYkgvUEtVYTBlRytMSDZIcENqUkdvMWlJaEZzOWhqQzFlQ3Az?=
 =?utf-8?B?OFpZd0lkVTJaT0Q2SmlrU25USWFoOHFxZWFGdUZDR3RDUTU2QkNvUndFYThq?=
 =?utf-8?B?N3krQVZ2blQ0dHUxcjFPUFV0RktrQzAyUDNsSkVsc0lJNitJUk1xazYwZXlK?=
 =?utf-8?B?VkUwQmVHbWhVVUpVRHpSU1hoNmF3a2svbktFUzArZnFaVmVUaTF0bEE0Ynl0?=
 =?utf-8?B?eW9JZVRxaDByZkdIRlFsaDloQmp6c2hnb3dPd29Tb09WY3I3VzFaaG1YaXpw?=
 =?utf-8?B?dmNlVUhjelI1TGhIbVNkY2Y1YVFldXVrTU1GVjg0bnJMTVBscUFoQ0NDUkFv?=
 =?utf-8?B?Y012bXRWb1luaEFkSTU3SWR3RHJQOXlIR09mdk1EMmx1TVdndlNtS2JUOFFF?=
 =?utf-8?B?R0NuYnl0U0JmTXZKOWxOZnVIcDZlOUYvNnlwdlBJeTZFU3Z1KzBjblIrbGc1?=
 =?utf-8?B?QzZSRXRlUHhuZUFWSmxDODhaTkFZQzZhaGZKempDWWVzWEMwM25MVzhHKy9H?=
 =?utf-8?B?ZFJtd1k5ZUhSZ2c3LzJmOEZtbU0yMWNLbjJ3S3JZcTV1WE5ISmU4TytUOFpF?=
 =?utf-8?B?TkJyNFd1dUF4Tko1T0hWWTBQNFdPdE9Sb0FBM2RQTHBsZmxvelUrTDZiMUt4?=
 =?utf-8?B?UzBoT2ZiUUNZN0ZJZitBTWVDMDVDeGFzM2ZEcVVaKzVaWVdlUUxsMUd0d1RD?=
 =?utf-8?B?SVlHb1I0ZmpwS1M2eEJiZDhKa0JFNDg2L2RBMTI4N1lZQUNxNWNWS0IxL0xs?=
 =?utf-8?B?WnIvSDFWVmpYSmxGcU5UaXEwcG9qM2VvWEt0YVlXUzVSZ1N3dEpwanR2elFN?=
 =?utf-8?B?OVRNYXVJdGwzbXBtQm9BZVVyM1dFRG5TZmFmb0RSNno0ZDZ6aGRlalN5ZkNx?=
 =?utf-8?Q?H0INeCui19p5iruDAOvBJ8rn0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d01a23-0d1d-4fd8-6615-08db140dbe75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:15:46.7583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gVEN6JZKxe8x9fPLJVQQOJ4pY9tmnLFWWVJbNUN9yrkuRSsxAy+fzUROx6i/SpJJNSRYOijd+ktXBwAY+l9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8220

On 21.02.2023 12:35, Xenia Ragiadakou wrote:
> On 2/21/23 13:26, Jan Beulich wrote:
>> On 17.02.2023 19:48, Xenia Ragiadakou wrote:
>>> Do not include the headers:
>>>    asm/hvm/vpic.h
>>>    asm/hvm/vpt.h
>>>    asm/io.h
>>>    asm/mce.h
>>>    asm/mem_sharing.h
>>>    asm/regs.h
>>>    public/arch-x86/cpuid.h
>>>    public/hvm/save.h
>>> because none of the declarations and macro definitions in them is used.
>>> Sort alphabetically the rest of the headers.
>>>
>>> Rearrange the code to replace all forward declarations with the function
>>> definitions.
>>>
>>> Replace double new lines with one.
>>>
>>> Reduce scope of nvmx_enqueue_n2_exceptions() to static because it is used
>>> only in this file.
>>>
>>> Move vmx_update_debug_state() in vmcs.c because it is used only in this file
>>> and limit its scope to this file by declaring it static and removing its
>>> declaration from vmx.h.
>>>
>>> Take the opportunity to remove all trailing spaces in vmx.c.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>   xen/arch/x86/hvm/vmx/vmcs.c            |   12 +
>>>   xen/arch/x86/hvm/vmx/vmx.c             | 5844 ++++++++++++------------
>>>   xen/arch/x86/include/asm/hvm/vmx/vmx.h |    1 -
>>>   3 files changed, 2913 insertions(+), 2944 deletions(-)
>>
>> I'm afraid this is close to unreviewable and hence absolutely needs splitting.
>> With this massive amount of re-arrangement (it's half of vmx.c, after all) I'm
>> also concerned of losing "git blame"-ability for fair parts of the code there.
> 
> I understand. Let me split the changes apart from the one that 
> rearranges the code. Do you agree in principle? or do you want me to 
> except and sth else?

Well, the large amount of code movement wants at least one other party
(e.g. Kevin, Andrew, or Roger) agreeing with your approach. As said, I
for one don't like this interruption in half-way easy history
determination (which can be particularly helpful e.g. when you want to
find a commit to put in a Fixes: tag).

Jan

